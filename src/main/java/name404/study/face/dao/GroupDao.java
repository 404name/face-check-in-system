package name404.study.face.dao;

import name404.study.face.entity.Group;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface GroupDao extends JpaRepository<Group,Long> {
    List<Group> findAllByGroupClass(Long groupClass);
}
