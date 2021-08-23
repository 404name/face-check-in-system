package name404.study.face.service.impl;

import name404.study.face.dao.UserDao;
import name404.study.face.dao.UserDetailDao;
import name404.study.face.entity.Group;
import name404.study.face.entity.User;
import name404.study.face.entity.UserDetail;
import name404.study.face.service.GroupService;
import name404.study.face.service.SystemVariablesService;
import name404.study.face.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Autowired
    private UserDetailDao userDetailDao;
    @Autowired
    private GroupService groupService;


    @Override
    public User addAndUpdate(User user){
        return userDao.save(user);
    }
    @Override
    public void delete(User user){
        userDao.delete(user);
    }
    @Override
    public User find(Long id){
        return userDao.getOne(id);
    }

    @Override
    public UserDetail findDetail(Long id) {
        return userDetailDao.getOne(id);
    }

    @Override
    public User findByFaceId(String str){
        return userDao.findByFaceId(str);
    }
    @Override
    public List<User> list(){
        return userDao.findAll();
    }

    @Override
    public List<UserDetail> listDetail() {
        return userDetailDao.findAll();
    }

    @Override
    public List<UserDetail> ifLoadFaceList(boolean ifLoadFace){
        Group group = groupService.find(Integer.toUnsignedLong(5));
        List<UserDetail> list = userDetailDao.findAllByStatusAndUserGroupIsNot(ifLoadFace,group.getName());
        return list;
    }

    @Override
    public String getUserMsg(User user){
        List<String> msg = new ArrayList<>();
        msg.add(user.getRealName());
        msg.add(groupService.findNameByKeyAndIndex(
                SystemVariablesService.getUnitGroup,Long.parseLong(String.valueOf(user.getUnitGroup()))));
        msg.add(groupService.findNameByKeyAndIndex(
                SystemVariablesService.getClassGroup,Long.parseLong(String.valueOf(user.getClassGroup()))));
        return msg.toString();
    }
}
