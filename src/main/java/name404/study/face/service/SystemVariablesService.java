package name404.study.face.service;

import name404.study.face.entity.SystemVariables;

import java.util.List;


/**
 * 系统变量
 */

public interface SystemVariablesService {
    // 直接查询当前表key value
   String getFeedback = "feedbackList";
   String getStartTime = "startTime";
   String getEndTime = "leaveTime";
   String getWxToken = "wxPushToken";
   String getIfPushIn = "signInPost";
   String getIfPushOut = "signOutPost";
   String getWxPushGroupId = "wxPushGroupId";
    //查询其他表获取内容
   String getUnitGroup = "unitGroup";
   String getClassGroup = "classGroup";
   String getUserGroup = "userGroup";
   String getReasonsGroup = "reasonsGroup";

    /**
     * 获取string类型的键值对
     * @param key
     * @return
     */
    public String getKey(String key);

    /**
     * 根据key去修改value
     * @param key
     * @param value
     * @return
     */
    public SystemVariables updateKeyValue(String key,String value);

    /**
     * 添加或者修改
     * @param systemVariables
     * @return
     */
    public SystemVariables addAndUpdate(SystemVariables systemVariables);

    /**
     * 删除内容
     * @param systemVariables
     */
    public void delete(SystemVariables systemVariables);

    /**
     * 根据id查询键值对
     * @param id
     * @return
     */
    public SystemVariables find(Long id);

    /**
     * 获取所有键值对
     * @return
     */
    public List<SystemVariables> list();

    /**
     * 删除key对应json下标为index 的内容
     * @param key
     * @param index
     * @return
     */
    public SystemVariables mapDelete(String key, int index);

    /**
     * 增添一条
     * @param key
     * @param lable
     * @return
     */
    public SystemVariables mapAdd(String key, String lable);


}

