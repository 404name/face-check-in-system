package name404.study.face.service;

import name404.study.face.entity.SignLog;
import name404.study.face.entity.SignLogDetail;
import name404.study.face.utils.Result;

import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 签到相关
 */

public interface SignLogService {

    /**
     * 添加或者更新
     * @param signLog
     * @return
     */
    SignLog addAndUpdate(SignLog signLog);

    /**
     * 删除
     * @param signLog
     */
    void delete(SignLog signLog);

    /**
     * 查找
     * @param id
     * @return
     */
    SignLog find(Long id);

    /**
     * 根据用户id查询最近任务
     * @param id
     * @return
     */
    SignLog findNowTask(Long id);

    /**
     * 返回所有
     * @return
     */
    List<SignLog> list();

    /**
     * 获取某一天的所有
     * @param date
     * @return
     */
    List<SignLog> getDayList(Date date);

    /**
     * 获取某一天的详细列表
     * @param date
     * @return
     */
    List<SignLogDetail> getDayListDetail(Date date);

    /**
     * 获取指定用户id的签到记录
     * @param id
     * @return
     */
    List<SignLog> getOneList(Long id);

    /**
     * 计算时间差
     * @param in
     * @param out
     * @return
     * @throws ParseException
     */
    Long diffTime(String in,String out) throws ParseException;

    /**
     * 统计签到打卡时间 0.5h为单位
     * @param in
     * @param out
     * @return
     * @throws ParseException
     */
    String checkTime(String in,String out) throws ParseException;

    /**
     * 获取今天
     * @return
     */
    Date getNowDay();

    /**
     * 获取day天前的日期
     * @param day
     * @return
     */
    Date getSomeDayBefore(int day);

    /**
     * 获取今天的日期的字符串形式
     * @return
     */
    String getToDay();
    /**
     * 获取今天的日期时间的字符串形式
     * @return
     */
    String getNowTime();
    /**
    * 定时清空结束签到
    */
    void scheduleTask() throws ParseException;

    /**
     * 签退 并且通知
     * @param faceId
     * @param isVisitor
     * @param id
     * @return
     * @throws ParseException
     */
    Result signOut(String faceId,Boolean isVisitor,Long id) throws ParseException;

    /**
     * 签到并且通知
     * @param faceId
     * @param msg
     * @param to_do
     * @param isVisitor
     * @param id
     * @return
     * @throws ParseException
     */
    Result signIn(String faceId, String msg, Long to_do,boolean isVisitor,Long id) throws ParseException;

    /**
     * 获取当日信息
     * @return
     */
    Map<String,String> getToDayMsg();
}
