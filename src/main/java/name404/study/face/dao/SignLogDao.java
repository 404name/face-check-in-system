package name404.study.face.dao;

import name404.study.face.entity.SignLog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Date;
import java.util.List;

public interface SignLogDao extends JpaRepository<SignLog,Long> {
    List<SignLog> findAllByDate(Date date);
    @Query(value = "SELECT * FROM sign_log WHERE from_user_id = ?1 AND out_time IS NULL ORDER BY in_time DESC LIMIT 1", nativeQuery = true)
    SignLog findByFromUserIdAndOutTimeNullOrderByInTimeDesc(Long id);
    List<SignLog> findAllByOutTimeNull();
    List<SignLog> findAllByFromUserId(Long userId);
}
