package name404.study.face.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * @program: face
 * @description: 更详细的用户记录
 * @author: CTGU_LLZ(404name)
 * @create: 2021-08-17 18:49
 **/
@Table(name = "user_detail")
@Entity
@Data
@JsonIgnoreProperties(value = {"hibernateLazyInitializer"})
public class UserDetail {
    @Id
    private Long id;
    private String realName;
    private Boolean signState;
    private Boolean status;
    private String unitGroup;
    private String classGroup;
    private String userGroup;
    private String faceId;
    private Date expiredTime;
}
