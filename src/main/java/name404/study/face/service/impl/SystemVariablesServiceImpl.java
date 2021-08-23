package name404.study.face.service.impl;

import com.alibaba.fastjson.JSONArray;
import name404.study.face.dao.SystemVariablesDao;
import name404.study.face.entity.SystemVariables;
import name404.study.face.service.SystemVariablesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * 系统变量
 */
@Service
public class SystemVariablesServiceImpl implements SystemVariablesService {
    @Autowired
    private SystemVariablesDao systemVariablesDao;

    @Override
    public String getKey(String key){
        SystemVariables jsonValue = null;
        try {
            jsonValue = systemVariablesDao.findByMyKey(key);
        } catch (Exception e) {
            e.printStackTrace();
            return "未找到key";
        }
        return jsonValue.getMyValue();
    }
    @Override
    public SystemVariables updateKeyValue(String key,String value){
        SystemVariables byMyKey = systemVariablesDao.findByMyKey(key);
        byMyKey.setMyValue(value);
        return systemVariablesDao.save(byMyKey);
    }
    @Override
    public SystemVariables addAndUpdate(SystemVariables systemVariables){
        return systemVariablesDao.save(systemVariables);
    }
    @Override
    public void delete(SystemVariables systemVariables){
        systemVariablesDao.delete(systemVariables);
    }
    @Override
    public SystemVariables find(Long id){
        return systemVariablesDao.getOne(id);
    }
    @Override
    public List<SystemVariables> list(){
        return systemVariablesDao.findAll();
    }
    @Override
    public SystemVariables mapDelete(String key, int index){
        String content = getKey(key);
        JSONArray jsonArray = JSONArray.parseArray(content);
        jsonArray.remove(index);
        String newString = JSONArray.toJSONString(jsonArray);
        return updateKeyValue(key,newString);
    }
    @Override
    public SystemVariables mapAdd(String key, String lable){
        String content = getKey(key);
        JSONArray jsonArray = JSONArray.parseArray(content);
        jsonArray.add(lable);
        String newString = JSONArray.toJSONString(jsonArray);
        return updateKeyValue(key,newString);
    }


}

