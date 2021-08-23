package name404.study.face.controllers;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import name404.study.face.entity.User;
import name404.study.face.service.BaiduFaceService;
import name404.study.face.service.UserService;
import name404.study.face.utils.Base64Utils;
import name404.study.face.utils.Result;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

/**
 * @program: face
 * @description: 测试类
 * @author: CTGU_LLZ(404name)
 * @create: 2021-08-17 14:45
 **/

@Api(tags = {"人脸相关"})
@RestController
@RequestMapping("/api/face")
@CrossOrigin
public class FaceController {

    @Autowired
    private BaiduFaceService baiduUtil;
    @Autowired
    private UserService userService;

    /**
     * 注册
     * @param userId
     * @return
     * @throws IOException
     */
    @PostMapping
    @ApiOperation(value = "注册")
    public Result save(MultipartFile multipartFile,
                       String userId) throws IOException {
        String img = Base64Utils.encodeDateUri(multipartFile);
        User user = null;
        user = userService.find(Long.parseLong(userId));
        if(user == null){
            return Result.errorMsg("userId找不到用户");
        }else if(user.getFaceId() != null){
            return Result.errorMsg("用户已有人脸库，请前往更新");
        }
        JSONObject search = baiduUtil.search(img);

        //库里面没有此人头像
        if(search.isNull("result")){
            JSONObject jsonObject = baiduUtil.registerFace(img, user);
            JSONObject result = jsonObject.getJSONObject("result");
            user.setFaceId(result.getString("face_token"));
            user.setStatus(true);
            User user1 = userService.addAndUpdate(user);
            return  Result.success("注册成功");
        }else {
            JSONObject result = search.getJSONObject("result");
            return Result.build(200, "头像库已有此人，请重新刷脸，或者联系管理员", result.toMap());
        }
    }


    /**
     * 查找人脸信息返回
     * @param
     * @return
     * @throws IOException
     */
    @ApiOperation(value = "查询[查询的用户有信息渲染前台，此时人脸id才是唯一标识]")
    @PostMapping("/findByImg")
    public Result find(MultipartFile multipartFile) throws IOException {
        String img = Base64Utils.encodeDateUri(multipartFile);
        return baiduUtil.searchRes(img);
    }

    /**
     * 根据id删除用户的人脸信息
     * @param id
     * @return
     * @throws IOException
     */
    @ApiOperation(value = "删除")
    @DeleteMapping
    public Result delete(Long id) throws IOException {
        User user = userService.find(id);
        if(user.getFaceId() == null){
            return Result.errorMsg("用户不存在人脸库");
        }
        try {
            JSONObject delete = baiduUtil.delete(user);
            user.setFaceId(null);
            user.setStatus(false);
            userService.addAndUpdate(user);

            return Result.success("人脸删除成功");
        } catch (IOException e) {
            e.printStackTrace();
            return Result.errorMsg("人脸删除失败");
        }
    }

    @ApiOperation(value = "更新人脸信息",notes = "不上传图片就是更新个人信息")
    @PutMapping
    public Result update(MultipartFile multipartFile,Long id) throws IOException {
        User user = userService.find(id);
        String img = Base64Utils.encodeDateUri(multipartFile);
        boolean ifToken = false;
        if (img == null || img.length() == 0) {
            ifToken = true;
        }
        if (!ifToken) {
            JSONObject search = baiduUtil.search(img);
            //确保库里面没有此人头像 或者 此人头像是自己
            if (!search.isNull("result")) {
                JSONObject result = search.getJSONObject("result");
                long user_id = result.getJSONArray("user_list").getJSONObject(0).getLong("user_id");
                if(user_id != user.getId()){ //确保改的是自己
                    return Result.build(200, "头像库已有此人，请重新刷脸，或者联系管理员", result.toMap());
                }
            }
        }
        JSONObject update = baiduUtil.update(img, user, ifToken);
        System.out.println(update);
        if (ifToken == false) {
            JSONObject result = update.getJSONObject("result");
            user.setFaceId(result.getString("face_token"));
            userService.addAndUpdate(user);
        }
        return Result.success(update.toMap());
    }



    @ApiOperation(value = "旧版查询[测试用待删]")
    @PostMapping("/search")
    public Result oldFind(String img) throws IOException {
        return baiduUtil.searchRes(img);
    }
    @PostMapping("/register")
    @ApiOperation(value = "旧版注册[测试用待删]")
    public Result oldSave(String img,
                       Long userId) throws IOException {

        JSONObject search = baiduUtil.search(img);
        User user  = userService.find(userId);
        //库里面没有此人头像
        if(search.isNull("result")){
            JSONObject jsonObject = baiduUtil.registerFace(img, user);
            JSONObject result = jsonObject.getJSONObject("result");
            if(result.isNull("result")){
                return Result.errorMsg(jsonObject.getString("error_msg"));
            }
            user.setFaceId(result.getString("face_token"));
            user.setStatus(true);
            User user1 = userService.addAndUpdate(user);
            return  Result.success("注册成功");
        }else {
            JSONObject result = search.getJSONObject("result");
            return Result.build(200, "头像库已有此人，请重新刷脸，或者联系管理员", result.toMap());
        }
    }

    @ApiOperation(value = "旧版更新人脸信息",notes = "不上传图片就是更新个人信息")
    @PostMapping("/update")
    public Result oldUpdate(String img,Long userId) throws IOException {
        User user = null;
        JSONObject search = null;
        try {
            user = userService.find(userId);
            search = baiduUtil.search(img);
        } catch (IOException e) {
            e.printStackTrace();
            return Result.errorMsg("获取不到用户");
        }

        //库里面没有此人头像
        if(!search.isNull("result")) {
            JSONObject result = search.getJSONObject("result");
            long user_id = result.getJSONArray("user_list").getJSONObject(0).getLong("user_id");
            System.out.println(user_id + " " + user.getId());
            if(user_id != user.getId()){ //确保改的是自己
                return Result.build(200, "头像库已有此人，请重新刷脸，或者联系管理员", result.toMap());
            }
        }
        //更新人脸
        JSONObject update = baiduUtil.update(img, user, false);
        JSONObject result = update.getJSONObject("result");
        if(!search.isNull("result")){
            String face_token = result.getString("face_token");
            user.setFaceId(face_token);
            userService.addAndUpdate(user);
        }
        return Result.success(update.toMap());
    }
}
