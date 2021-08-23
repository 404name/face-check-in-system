package name404.study.face.controllers;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import name404.study.face.service.SignLogService;
import name404.study.face.service.VisitorService;
import name404.study.face.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
@Api(tags = {"访客相关"})
@RestController
@CrossOrigin
@RequestMapping("/api/visitor")
public class VisitorContorller {

    @Autowired
    private VisitorService visitorService;
    @Autowired
    private SignLogService signLogService;

    /**
     * 获取当日可以签到的访客
     * @return
     */
    @GetMapping("/notSign")
    @ApiOperation(value = "获取可签到访客列表")
    public Result getSignInVisitorList(){
        return Result.success(visitorService.findAllIfSign(false));
    }
    /**
     * 获取当日可以签退的访客
     * @return
     */
    @GetMapping("/alreadySign")
    @ApiOperation(value = "获取可签退访客列表")
    public Result getSignOutVisitorList(){
        return Result.success(visitorService.findAllIfSign(true));
    }
    /**
     * 直接根据id签到
     * @param id
     * @return
     */
    @PostMapping("/in/{id}")
    @ApiOperation(value = "直接访客id签到")
    public Result signIn(@PathVariable Long id, String msg, Long to_do) throws ParseException {
        return signLogService.signIn(null,msg,to_do,true,id);
    }
    /**
     * 直接根据id签退
     * @param id
     * @return
     */
    @PostMapping("/out/{id}")
    @ApiOperation(value = "直接访客id签退")
    public Result signOut(@PathVariable Long id) throws ParseException {
        return signLogService.signOut(null,true,id);
    }

}
