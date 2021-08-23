package name404.study.face.service;

import name404.study.face.entity.User;
import name404.study.face.entity.UserDetail;

import java.util.List;


public interface UserService {
    /**
     * 添加或者更新
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
     * 查找用户详细
     * @param id
     * @return
     */
    UserDetail findDetail(Long id);

    /**
     * 根据faceid查找用户
     * @param str
     * @return
     */
      User findByFaceId(String str);

    /**
     * 返回所有用户
     * @return
     */
      List<User> list();
    /**
     * 返回所有用户详细信息
     * @return
     */
    List<UserDetail> listDetail();
    /**
     * 返回[未载入|已录入]的人脸库的所有用户
     * @param ifLoadFace
     * @return
     */
     List<UserDetail> ifLoadFaceList(boolean ifLoadFace);

    /**
     * 获取用户信息
     * @param user
     * @return
     */
      String getUserMsg(User user);
}
