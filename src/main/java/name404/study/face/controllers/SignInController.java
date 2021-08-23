package name404.study.face.controllers;


import com.alibaba.fastjson.JSONArray;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import name404.study.face.entity.Group;
import name404.study.face.entity.SignLog;
import name404.study.face.entity.SignLogDetail;
import name404.study.face.entity.SystemVariables;
import name404.study.face.service.GroupService;
import name404.study.face.service.SignLogService;
import name404.study.face.service.SystemVariablesService;
import name404.study.face.utils.RedisUtil;
import name404.study.face.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.WebRequest;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Api(tags = {"签到首页相关及相关工具"})
@RestController
@CrossOrigin
@RequestMapping("/api/sign")
@Slf4j
public class SignInController {
    @Autowired
    private SignLogService signLogService;

    @Autowired
    private SystemVariablesService systemVariablesService;

    @Autowired
    private GroupService groupService;

    @Autowired
    RedisUtil redisUtil;

    /**
     * 获取当日的签到表
     * @return
     */
    @GetMapping
    @ApiOperation(value = "获取某日签到表[置空就是当日]")
    public Result list(Date date,int ifAmis){


        System.out.println(date);
        if(date == null){
            date = signLogService.getNowDay();
        }
        //查询redis缓存
        if(ifAmis == 0){
            HashMap<Object, Object> temp;
            temp = (HashMap<Object, Object>) redisUtil.get("SignLog" + date.toString());
            if(temp != null){
                log.info("通过缓存查询");
                return Result.success(temp);
            }
        }

        List<SignLogDetail> toDayDetailList = signLogService.getDayListDetail(date);

        int notSignOut = 0;
        int allUser = toDayDetailList.size();
        for(int i = 0; i < allUser; i++){
            SignLogDetail signLog = toDayDetailList.get(i);
            if(signLog.getOutTime() == null){
                notSignOut++;
            }
        }
        HashMap<Object, Object> todayData = new HashMap<>();
        todayData.put("allUser",allUser);
        todayData.put("nowUser",notSignOut);
        todayData.put("leaveUser",allUser - notSignOut);
        todayData.put("startTime",systemVariablesService.getKey(SystemVariablesService.getStartTime));
        todayData.put("endTime",systemVariablesService.getKey(SystemVariablesService.getEndTime));
        HashMap<Object, Object> res = new HashMap<>();
        res.put("toDayData",todayData);
        res.put("toDayTable",toDayDetailList);
        if(ifAmis == 1){
            return Result.build(0,"ok",res);
        }
        log.info("查询数据库查询");
        redisUtil.set("SignLog" + date.toString(),res,24*60*60*1000);
        return Result.success(res);
    }

    @PostMapping("/feedback")
    @ApiOperation(value = "反馈")
    public Result tip(String msg){
        SystemVariables feedbackList = systemVariablesService.mapAdd(SystemVariablesService.getFeedback,msg);
        return  Result.success(feedbackList);
    }

    @GetMapping("/feedback")
    @ApiOperation(value = "反馈")
    public Result getTips(){
        String key = systemVariablesService.getKey(SystemVariablesService.getFeedback);
        JSONArray jsonArray = JSONArray.parseArray(key);
        return  Result.success(jsonArray.toJSONString());
    }

    @GetMapping("/toDoList")
    @ApiOperation(value = "事由列表")
    public Result getToDoList(){
        List<Group> toDoList = groupService.findByGroupClass(SystemVariablesService.getReasonsGroup);
        return  Result.success(toDoList);
    }

    @GetMapping("/unitList")
    @ApiOperation(value = "获取单位组")
    public Result getUnitGroup(){
        List<Group> toDoList = groupService.findByGroupClass(SystemVariablesService.getUnitGroup);
        return  Result.success(toDoList);
    }

    @GetMapping("/userList")
    @ApiOperation(value = "获取课题组")
    public Result getClassGroup(){
        List<Group> toDoList = groupService.findByGroupClass(SystemVariablesService.getClassGroup);
        return  Result.success(toDoList);
    }
    @GetMapping("/sevenDay")
    @ApiOperation(value = "获取近七天签到信息")
    public Result getSevenDayList(){
        List<String> category = new ArrayList<>();
        List<Integer> line = new ArrayList<>();
        SimpleDateFormat formatter = new SimpleDateFormat("MM-dd");
        for(int i = 6; i >= 0; i--){
            Date thisDay = signLogService.getSomeDayBefore(i);
            List<SignLog> dayList = signLogService.getDayList(thisDay);
            if(i == 0){
                category.add("今日");
            }else{
                category.add(formatter.format(thisDay));
            }
            line.add(dayList.size());
        }
        HashMap<String,Object> map = new HashMap<>();
        map.put("category",category);
        map.put("line",line);
        return  Result.build(0,"succese",map);
    }
    /**
     * 处理时间格式
     * @param binder
     * @param request
     */
    @InitBinder
    public void initBinder(WebDataBinder binder, WebRequest request) {
        //转换日期
        DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));// CustomDateEditor为自定义日期编辑器
    }
}
