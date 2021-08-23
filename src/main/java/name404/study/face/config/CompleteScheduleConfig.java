package name404.study.face.config;

import name404.study.face.service.SignLogService;
import name404.study.face.service.SystemVariablesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.SchedulingConfigurer;
import org.springframework.scheduling.config.ScheduledTaskRegistrar;
import org.springframework.scheduling.support.CronTrigger;

import java.text.ParseException;

@Configuration
@EnableScheduling
public class CompleteScheduleConfig implements SchedulingConfigurer {

    @Autowired
    private SystemVariablesService systemVariablesService;
    @Autowired
    private SignLogService signLogService;
    /**
     * 执行定时任务.
     */
    @Override
    public void configureTasks(ScheduledTaskRegistrar taskRegistrar) {
        taskRegistrar.addTriggerTask(
                //1.添加任务内容(Runnable)
                () -> {
                    try {
                        signLogService.scheduleTask();
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                },
                //2.设置执行周期(Trigger)
                triggerContext -> {
                    //2.1 从数据库获取执行周期
                    String time = systemVariablesService.getKey(SystemVariablesService.getEndTime);
                    String[] HMS = time.split(":");
                    String cron = HMS[2] + " " + HMS[1] +" " + HMS[0] +" * * ?";
                    System.out.println("【下一次执行时间】" + cron);
                    //2.2 合法性校验.
                    //2.3 返回执行周期(Date)
                    return new CronTrigger(cron).nextExecutionTime(triggerContext);
                }
        );
    }

}