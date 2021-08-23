package name404.study.face.dao;

import name404.study.face.entity.UserDetail;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserDetailDao extends JpaRepository<UserDetail,Long> {
    List<UserDetail> findAllByStatusAndUserGroupIsNot(Boolean ifLoadFace, String userGroup);
    List<UserDetail> findAllBySignStateAndUserGroup(Boolean signState,String userGroup);
}
