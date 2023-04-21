package name404.study.face.service.impl;

import lombok.extern.slf4j.Slf4j;
import name404.study.face.aop.WxPush;
import name404.study.face.dao.SignLogDao;
import name404.study.face.dao.SignLogDetailDao;
import name404.study.face.dao.SystemVariablesDao;
import name404.study.face.dao.UserDao;
import name404.study.face.entity.SignLog;
import name404.study.face.entity.User;
import name404.study.face.entity.SignLogDetail;
import name404.study.face.service.SignLogService;
import name404.study.face.service.SystemVariablesService;
import name404.study.face.utils.RedisUtil;
import name404.study.face.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 签到相关
 */
@Service
@Slf4j
public class SignLogServiceImpl implements SignLogService {

    @Autowired
    private SignLogDao signLogdao;
    @Autowired
    private SignLogDetailDao signLogDetailDao;
    @Autowired
    private UserDao userDao;

    @Autowired
    private SystemVariablesDao systemVariablesDao;

    @Autowired
    private RedisUtil redisUtil;

    @Override
    public SignLog addAndUpdate(SignLog signLog){
        return signLogdao.save(signLog);
    }
    @Override
    public void delete(SignLog signLog){
        signLogdao.delete(signLog);
    }
    @Override
    public SignLog find(Long id){
        return signLogdao.getOne(id);
    }
    @Override
    public SignLog findNowTask(Long id){
        return signLogdao.findByFromUserIdAndOutTimeNullOrderByInTimeDesc(id);
    }
    @Override
    public List<SignLog> list(){
        return signLogdao.findAll();
    }
    @Override
    public List<SignLog> getDayList(Date date){
        return signLogdao.findAllByDate(date);
    }

    @Override
    public List<SignLogDetail> getDayListDetail(Date date) {

        return signLogDetailDao.findAllByDate(date);
    }

    @Override
    public List<SignLog> getOneList(Long id){
        return signLogdao.findAllByFromUserId(id);
    }
    @Override
    public Long diffTime(String in,String out) throws ParseException {
        SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");
        long inTime =df.parse(in).getTime();
        //从对象中拿到时间
        long outTime = df.parse(out).getTime();
        return outTime - inTime;
    }
    @Override
    public String checkTime(String in,String out) throws ParseException {
        long mili = diffTime(in,out);
        long halfhour= ( mili/ 1000 /60 / 30);
        if(mili % (1000 * 30 * 60) != 0){
            halfhour++;
        }
        double v = halfhour * 0.5;
        return String.valueOf(v);
    }
    @Override
    public Date getNowDay(){
        long current=System.currentTimeMillis();//当前时间毫秒数
        long zero=current/(1000*3600*24)*(1000*3600*24)- TimeZone.getDefault().getRawOffset();
        return new Date(zero);
    }
    @Override
    public Date getSomeDayBefore(int day){
        long current=System.currentTimeMillis();//当前时间毫秒数
        long zero=current/(1000*3600*24)*(1000*3600*24)- TimeZone.getDefault().getRawOffset();
        long someDayBefore = zero - (24 * 60 *60 *1000)*day;
        return new Date(someDayBefore);
    }
    @Override
    public String getToDay(){
        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        return formatter.format(date);
    }
    @Override
    public String getNowTime(){
        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("HH:mm:ss");
        return formatter.format(date);
    }

    /**
     * 定时清空结束签到
     */
    @Transactional
    @Override
    public void scheduleTask() throws ParseException {
        System.out.println("【定时任务开始】");
        List<SignLog> autoFinishTask = signLogdao.findAllByOutTimeNull();
        for (SignLog signLog:autoFinishTask) {
            // 处理默认退出时间
            String endTime = systemVariablesDao.findByMyKey(SystemVariablesService.getEndTime).getMyValue();
            signLog.setOutTime(endTime);
            System.out.println("【强制退出】" + signLog.getUserName());
            signLog.setMsg("【系统强制退出】" + signLog.getMsg());
            signLog.setSignTime(checkTime(signLog.getInTime(),signLog.getOutTime()));
            addAndUpdate(signLog);
            // 更新用户
            User user = userDao.getOne(signLog.getFromUserId());
            user.setSignState(false);
            userDao.save(user);
        }
        log.info("定时清空缓存");
        redisUtil.del("SignLog" + getNowDay().toString());
        System.out.println("【定时任务结束】");
    }


    @WxPush()
    @Override
    public Result signOut(String faceId,Boolean isVisitor,Long id) throws ParseException {
        //人脸匹配数据库
        User user = null;
        if(isVisitor == false){
            user = userDao.findByFaceId(faceId);
        }else{
            user = userDao.getOne(id);
        }
        if(user == null){
            return Result.errorMsg("人脸库未匹配数据库请联系管理员");
        }
        //判断当前是否还有任务在进行
        if(user.getSignState() == false){
            return  Result.errorMsg("当前没有签退任务");
        }

        //判断当前时间是否可以开始签退
        String endTime = systemVariablesDao.findByMyKey(SystemVariablesService.getEndTime).getMyValue();
        Long time = diffTime(getNowTime(),endTime);
        if(time <0){
            return Result.errorMsg("当日签到已于"+endTime+ "结束,补签请联系管理员");
        }
        String startTime = systemVariablesDao.findByMyKey(SystemVariablesService.getStartTime).getMyValue();
        time = diffTime(startTime,getNowTime());
        if(time <0){
            return Result.errorMsg("当日签到于"+startTime+ "开始，请稍后");
        }
        //获取当前签到任务
        Long fromUserId = user.getId();
        SignLog signLog = findNowTask(fromUserId);
        signLog.setOutTime(getNowTime());
        //处理停留时间[应该写个函数处理]

        signLog.setSignTime(checkTime(signLog.getInTime(),signLog.getOutTime()));
        //更新签退，并且更新用户当前任务
        addAndUpdate(signLog);

        user.setSignState(false);
        userDao.save(user);

        log.info("更新缓存");
        redisUtil.del("SignLog" + getNowDay().toString());
        return Result.success("[签退成功]"+ getNowTime() + " | " + signLog.getUserName()+"今日打卡：" + signLog.getSignTime() + "h");
    }

    @WxPush() //自定义推送AOP
    @Override
    public Result signIn(String faceId, String msg, Long to_do,boolean isVisitor,Long id) throws ParseException {
        //查找人脸库是否匹配用户
        User user = null;
        if(isVisitor == false){
            user = userDao.findByFaceId(faceId);
        }else{
            user = userDao.getOne(id);
        }
        // 判断用户是否过时
        Date date = new Date();
        if( user.getExpiredTime().getTime() < date.getTime()){
            return Result.errorMsg("用户信息已失效，请联系管理员");
        }

        if(user == null){
            return Result.errorMsg("用户匹配失败，请联系管理员");
        }
        //判断当前是否还有任务在进行
        if(user.getSignState() == true){
            return  Result.errorMsg("还有签退任务未完成");
        }

        //判断当前时间是否可以开始签到
        String startTime = systemVariablesDao.findByMyKey(SystemVariablesService.getStartTime).getMyValue();
        Long time = diffTime(startTime,getNowTime());
        if(time < 0){
            return Result.errorMsg("签到还未开始==>" + startTime);
        }
        String endTime = systemVariablesDao.findByMyKey(SystemVariablesService.getEndTime).getMyValue();
        time = diffTime(getNowTime(),endTime);
        if(time < 0){
            return Result.errorMsg("今日签到时间已经截至==>" + endTime);
        }
        //注册基本信息
        SignLog signLog = new SignLog(user);
        signLog.setToDo(to_do);
        signLog.setMsg(msg);
        signLog.setInTime(getNowTime());
        Date date1 = getNowDay();
        signLog.setDate(date1);
        // 创建新签到任务
        SignLog signLog1 = addAndUpdate(signLog);

        //  提交进用户当前执行中
        user.setSignState(true);
        userDao.save(user);

        List<SignLog> dayList = getDayList(getNowDay());
        log.info("更新缓存");
        redisUtil.del("SignLog" + getNowDay().toString());
        return Result.success("[签到成功]"+ getNowTime() + " | " + signLog.getUserName()+"是今日打卡的第" +dayList.size() +"个人");//查找人脸库是否匹配用户
    }
    @Override
    public Map<String,String> getToDayMsg(){
        List<SignLog> dayList = getDayList(getNowDay());
        int notSignOut = 0;
        int allUser = dayList.size();
        for(int i = 0; i < allUser; i++){
            if(dayList.get(i).getOutTime() == null){
                notSignOut++;
            }
        }
        Map<String, String> res = new HashMap<>();
        res.put("date",getToDay());
        res.put("allUser",String.valueOf(allUser));
        res.put("nowUser",String.valueOf(notSignOut));
        res.put("leaveUser",String.valueOf(allUser - notSignOut));
        return res;
    }
}
