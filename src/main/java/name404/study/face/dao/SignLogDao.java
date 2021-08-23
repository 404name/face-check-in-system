package name404.study.face.dao;

import name404.study.face.entity.SignLog;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Date;
import java.util.List;

public interface SignLogDao extends JpaRepository<SignLog,Long> {
    List<SignLog> findAllByDate(Date date);
    SignLog findByFromUserIdAndOutTimeNull(Long id);
    List<SignLog> findAllByOutTimeNull();
    List<SignLog> findAllByFromUserId(Long userId);
}
