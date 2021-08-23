package name404.study.face.controllers;

import io.swagger.annotations.Api;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
/**
 * @program: face
 * @description: 测试类
 * @author: CTGU_LLZ(404name)
 * @create: 2021-08-17 14:45
 **/
@Controller
@Api(tags = {"路径跳转"})
public class RouteController {
    @GetMapping("/register")
    public String register(){
        return "register";
    }
    @GetMapping("/search")
    public String getSearch(){
        return "search";
    }
    @GetMapping("/face")
    public String getFace(){
        return "face";
    }
    @GetMapping("/updateface")
    public String getUpdate(){
        return "updateface";
    }
}
