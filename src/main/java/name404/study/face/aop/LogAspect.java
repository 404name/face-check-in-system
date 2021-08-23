package name404.study.face.aop;

import name404.study.face.service.SignLogService;
import name404.study.face.service.SystemVariablesService;
import name404.study.face.utils.OkHttpClientUtil;
import name404.study.face.utils.Result;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Map;

@Aspect
@Component
public class LogAspect {

    @Autowired
    private SystemVariablesService systemVariablesService;
    @Autowired
    private SignLogService signLogService;
    @Autowired
    private OkHttpClientUtil okHttpClientUtil;
    /**
     * 注解切入点
     */
    @Pointcut("@annotation(name404.study.face.aop.WxPush)")
    public void pointCut(){

    }

    @AfterReturning(value = "pointCut()",returning = "result")
    public void wxPush(Object result){
        Result res = (Result)result;
        //是成功的返回类型
        if(res.getStatus() == 200){
            //获取用户微信token + 是否推送
            String token = systemVariablesService.getKey(
                    SystemVariablesService.getWxToken);
            String groupId = systemVariablesService.getKey(
                    SystemVariablesService.getWxPushGroupId);
            int ifPushIn = Integer.parseInt(systemVariablesService.getKey(
                    SystemVariablesService.getIfPushIn));
            int ifPushOut = Integer.parseInt(systemVariablesService.getKey(
                    SystemVariablesService.getIfPushOut));
            if(ifPushIn == 0 && ifPushOut == 0){
                return;
            }
            //http://pushplus.hxtrip.com/send?token=dd7d6bfce36340c7af8c9704596067c4&title=XXX&content=XXX&template=html&topic=XXX
            Map<String, String> toDayMsg = signLogService.getToDayMsg();
            //"[2021-08-16日打卡消息]  当前：11人"
            String title ="【每日打卡消息】  当前：" +toDayMsg.get("nowUser") + "人";
            String content = (String)res.getData();
            content += "<br/><br/>";
            String startTime =systemVariablesService.getKey(SystemVariablesService.getStartTime);
            String endTime = systemVariablesService.getKey(SystemVariablesService.getEndTime);
            content += "[今日打卡时间段] " + startTime + "-" + endTime + "<br/><br/>";
            content += "[今日总打卡数] " +  toDayMsg.get("allUser") + "<br/>";
            content += "[今日当前人数] " + toDayMsg.get("nowUser") + "<br/>";
            content += "[今日签退人数] " + toDayMsg.get("leaveUser") + "<br/>";
            String url = "http://pushplus.hxtrip.com/send?token="+token+"&title="+title+"&content="+content+"&template=html&topic="+groupId;
            okHttpClientUtil.getData(url);
        }
    }
}
