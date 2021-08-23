package name404.study.face.dao;

import name404.study.face.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserDao extends JpaRepository<User,Long> {
    User findByFaceId(String str);
    List<User> findAllByStatusAndUserGroupNot(boolean ifLoadFace,Long userGroup);
    List<User> findAllBySignStateAndUserGroup(boolean signState,Long userGroup);
}
