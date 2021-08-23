package name404.study.face.dao;

import name404.study.face.entity.SignLogDetail;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Date;
import java.util.List;

public interface SignLogDetailDao extends JpaRepository<SignLogDetail,Long> {
    List<SignLogDetail> findAllByDate(Date date);
}
