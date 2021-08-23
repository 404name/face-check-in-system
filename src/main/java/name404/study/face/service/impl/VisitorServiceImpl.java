package name404.study.face.service.impl;

import name404.study.face.dao.GroupDao;
import name404.study.face.dao.UserDao;
import name404.study.face.dao.UserDetailDao;
import name404.study.face.entity.Group;
import name404.study.face.entity.User;
import name404.study.face.entity.UserDetail;
import name404.study.face.service.VisitorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 404name
 */
@Service
public class VisitorServiceImpl implements VisitorService {
    @Autowired
    private UserDao userDao;
    @Autowired
    private UserDetailDao userDetailDao;
    @Autowired
    private GroupDao groupDao;
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
    public List<User> list(){
        return userDao.findAll();
    }
    @Override
    public List<UserDetail> findAllIfSign(boolean ifSign){
        Group one = groupDao.getOne(Integer.toUnsignedLong(5));
        List<UserDetail> list = userDetailDao.findAllBySignStateAndUserGroup(ifSign,one.getName());
        return list;
    }
}
