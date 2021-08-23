package name404.study.face.controllers;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import name404.study.face.entity.SignLog;
import name404.study.face.service.SignLogService;
import name404.study.face.service.UserService;
import name404.study.face.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.util.List;

@Api(tags = {"用户相关"})
@RestController
@CrossOrigin
@RequestMapping("/api/user")
public class UserContorller {
    @Autowired
    private UserService userService;
    @Autowired
    private SignLogService signLogService;

    @ApiOperation(value = "查询还没有录入人脸的列表")
    @GetMapping("/notRegister")
    public Result notRegister(){
        return Result.success(userService.ifLoadFaceList(false));
    }

    @ApiOperation(value = "查询已经录入人脸的列表")
    @GetMapping("/alreadyRegister")
    public Result alreadyRegister(){
        return Result.success(userService.ifLoadFaceList(true));
    }

    /**
     * 签到
     * @param msg
     * @param to_do
     * @return
     */
    @PostMapping("/in")
    @ApiOperation(value = "签到")
    public Result in(String faceId, String msg, Long to_do) throws ParseException {
        return signLogService.signIn(faceId,msg,to_do,false,null);
    }

    @PostMapping("/out")
    @ApiOperation(value = "签退")
    public Result out(String faceId) throws ParseException {
        return signLogService.signOut(faceId,false,null);
    }

    @GetMapping("/{id}")
    @ApiOperation(value = "查看个人签到日志")
    public Result find(@PathVariable Long id){
        List<SignLog> oneList = signLogService.getOneList(id);
        return Result.success(oneList);
    }
}
