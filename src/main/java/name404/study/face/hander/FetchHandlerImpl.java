package name404.study.face.hander;

import com.alibaba.fastjson.JSONArray;
import name404.study.face.entity.Group;
import name404.study.face.service.GroupService;
import name404.study.face.service.SystemVariablesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import xyz.erupt.annotation.fun.ChoiceFetchHandler;
import xyz.erupt.annotation.fun.VLModel;

import java.util.ArrayList;
import java.util.List;

@Component  //如果你想使用依赖注入相关功能，直接加入 @Service, @Component 等相关注解即可
public class FetchHandlerImpl implements ChoiceFetchHandler {

    @Autowired
    private SystemVariablesService systemVariablesService;
    @Autowired
    private GroupService groupService;

    @Override
    public List<VLModel> fetch(String[] params) {

        for (String param : params) {
            return addList(param);
        }
        return addList(null);
    }

    public  List<VLModel>  addList(String key){
        List<VLModel> list = new ArrayList<>();
        try {
            // 格外类处理
            if(SystemVariablesService.getUnitGroup.equals(key)
                    || SystemVariablesService.getClassGroup.equals(key)
                    || SystemVariablesService.getUserGroup.equals(key)
                    ||  SystemVariablesService.getReasonsGroup.equals(key)){
                List<Group> groups = groupService.findByGroupClass(key);
                for (int index = 0; index < groups.size(); index++) {
                    list.add(new VLModel(String.valueOf(groups.get(index).getId()),
                            groups.get(index).getName()));
                }
                //给单位和组别虚拟值，让访客显示出来
                if(SystemVariablesService.getUnitGroup.equals(key)
                        || SystemVariablesService.getClassGroup.equals(key)){
                    list.add(new VLModel(String.valueOf(0),"暂未设置"));
                }
            }
            else{
                // 系统变量取值
                String jsonString = systemVariablesService.getKey(key);
                JSONArray jsonArray = JSONArray.parseArray(jsonString);
                for (int index = 0; index < jsonArray.size(); index++) {
                    list.add(new VLModel(String.valueOf(index),
                            (String) jsonArray.get(index)));
                }
            }
        } catch (Exception e) {
            list.clear();
            list.add(new VLModel("a", "后台获取值错误"));
            return list;
        }
        return list;
    }
}