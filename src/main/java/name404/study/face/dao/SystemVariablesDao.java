package name404.study.face.dao;

import name404.study.face.entity.SystemVariables;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SystemVariablesDao extends JpaRepository<SystemVariables,Long> {
    SystemVariables findByMyKey(String key);
}
