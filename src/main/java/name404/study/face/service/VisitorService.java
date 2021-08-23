package name404.study.face.service;

import name404.study.face.entity.User;
import name404.study.face.entity.UserDetail;

import java.util.List;

/**
 * @author 404name
 */

public interface VisitorService {
    /**
     * 增加用户
     * @param user
     * @return
     */
    User addAndUpdate(User user);

    /**
     * 删除用户
     * @param user
     */
    void delete(User user);

    /**
     * 查找用户
     * @param id
     * @return
     */
    User find(Long id);

    /**
     * 返回所有用户
     * @return
     */
    List<User> list();
    /**
     * 获取[没有进行签到|正在签到]的用户
     * @return
     */
    List<UserDetail> findAllIfSign(boolean ifSign);

}
