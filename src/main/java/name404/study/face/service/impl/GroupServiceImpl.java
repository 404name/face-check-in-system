package name404.study.face.service.impl;

import name404.study.face.dao.GroupDao;
import name404.study.face.entity.Group;
import name404.study.face.service.GroupService;
import name404.study.face.service.SystemVariablesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GroupServiceImpl implements GroupService {
    @Autowired
    private GroupDao groupDao;

    @Override
    public Group addAndUpdate(Group group){
        return groupDao.save(group);
    }
    @Override
    public void delete(Group group){
        groupDao.delete(group);
    }
    @Override
    public Group find(Long id){
        return groupDao.getOne(id);
    }
    @Override
    public List<Group> findByGroupClass(String str){
        if(SystemVariablesService.getUnitGroup.equals(str)){
            return groupDao.findAllByGroupClass(Integer.toUnsignedLong(0));
        }else if(SystemVariablesService.getClassGroup.equals(str)){
            return groupDao.findAllByGroupClass(Integer.toUnsignedLong(1));
        }else if(SystemVariablesService.getUserGroup.equals(str)){
            return groupDao.findAllByGroupClass(Integer.toUnsignedLong(2));
        }else if(SystemVariablesService.getReasonsGroup.equals(str)){
            return groupDao.findAllByGroupClass(Integer.toUnsignedLong(3));
        }
        return null;
    }
    @Override
    public List<Group> list(){
        return groupDao.findAll();
    }
    @Override
    public String findNameByKeyAndIndex(String str,Long index){
        List<Group> group = findByGroupClass(str);
        if(index == null){
            return "暂未设置";
        }else{
            for (int i1 = 0; i1 < group.size(); i1++) {
                if(group.get(i1).getId().equals(index)){
                    return group.get(i1).getName();
                }
            }
        }
        return null;
    }
}
