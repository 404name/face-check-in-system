package name404.study.face.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * @program: face
 * @description: 更详细的登录记录
 * @author: CTGU_LLZ(404name)
 * @create: 2021-08-17 18:50
 **/
@Table(name = "signlog_detail")
@Entity
@Data
public class SignLogDetail {

    @Id
    private Long id;
    private String userName;

    @JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date date;

    private String unitGroup;

    private String classGroup;

    private String userGroup;

    private String signTime;

    private String inTime;

    private String outTime;

    private String toDo;

    private String msg;
}
