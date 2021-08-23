package name404.study.face;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import xyz.erupt.core.annotation.EruptScan;
/**
 * @program: face
 * @description: 测试类
 * @author: CTGU_LLZ(404name)
 * @create: 2021-08-17 14:45
 **/
@SpringBootApplication
@EntityScan
@EruptScan
public class FaceApplication {

    public static void main(String[] args) {
        SpringApplication.run(FaceApplication.class, args);
    }

}
