package name404.study.face.service.impl;


import com.baidu.aip.face.AipFace;
import lombok.Data;
import name404.study.face.entity.User;
import name404.study.face.entity.UserDetail;
import name404.study.face.service.BaiduFaceService;
import name404.study.face.service.UserService;
import name404.study.face.utils.Result;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.HashMap;

/**
 * 百度人脸识别接口相关
 * @date: 2020/1/2
 * @description:
 */
@Service
@Data
@ConfigurationProperties(prefix = "baidu")
public class BaiduFaceServiceImpl implements BaiduFaceService {
    private String app_id;
    private String api_key;
    private String secret_key;
    private  AipFace client = null;
    @Autowired
    private UserService userService;
    /**
     * 由于注入的依赖不能直接构造
     * ，所以等类构造后，
     * 只能每次请求都判断一下
     */
    void initClient(){
        if(client == null){
            System.out.println("初始化百度sdk");
            client = new AipFace(app_id, api_key, secret_key);
        }
    }

    //增
    @Override
    public JSONObject registerFace(String img, User user) throws IOException {
        // 传入可选参数调用接口
        initClient();
        HashMap<String, String> options = new HashMap<String, String>();
        options.put("user_info", userService.getUserMsg(user));
        options.put("quality_control", "LOW");
        options.put("liveness_control", "NONE");
        options.put("action_type", "REPLACE");
        img = img.replace("data:image/png;base64,", "");
        img = img.replace("data:image/jpeg;base64,", "");
        JSONObject jsonObject = client.addUser(
                img,
                "BASE64",
                "student", String.valueOf(user.getId()), options);
        return jsonObject;
    }
    //删
    @Override
    public JSONObject delete(User user) throws IOException {
        // 传入可选参数调用接口
        initClient();
        HashMap<String, String> options = new HashMap<String, String>();

        String userId = String.valueOf(user.getId());
        String groupId = "student";
        String faceToken =user.getFaceId();
        // 人脸删除
        JSONObject res = client.faceDelete(userId, groupId, faceToken, options);
        return res;
    }

    //改
    @Override
    public JSONObject update(String img, User user, boolean ifToken) throws IOException {
        // 传入可选参数调用接口
        initClient();
        HashMap<String, String> options = new HashMap<String, String>();
        options.put("user_info",userService.getUserMsg(user));
        options.put("quality_control", "LOW");
        options.put("liveness_control", "NONE");
        options.put("action_type", "REPLACE");
        String imageType = "BASE64";
        if(ifToken) {
            imageType = "FACE_TOKEN";
        }else{
            img = img.replace("data:image/png;base64,", "");
            img = img.replace("data:image/jpeg;base64,", "");
        }
        JSONObject jsonObject = client.updateUser(img,
                imageType,
                "student", String.valueOf(user.getId()), options);
        System.out.println(jsonObject);
        return jsonObject;
    }
    //查多
    //查单
    @Override
    public JSONObject search(String img) throws IOException {
        initClient();
        HashMap<String, String> options = new HashMap<String, String>();
        options.put("match_threshold", "70");
        options.put("quality_control", "LOW");
        options.put("liveness_control", "NONE");
        img = img.replace("data:image/png;base64,", "");
        img = img.replace("data:image/jpeg;base64,", "");
        System.out.println(img);
        JSONObject search = client.search(img, "BASE64", "student", options);
        System.out.println(search);
        return search;
    }
    //查单并且打包返回
    @Override
    public Result searchRes(String img) throws IOException {
        initClient();
        HashMap<String, String> options = new HashMap<String, String>();
        options.put("match_threshold", "70");
        options.put("quality_control", "LOW");
        options.put("liveness_control", "NONE");
        img = img.replace("data:image/png;base64,", "");
        img = img.replace("data:image/jpeg;base64,", "");
        System.out.println(img);
        JSONObject search = client.search(img, "BASE64", "student", options);
        System.out.println(search);

        boolean result = search.isNull("result");
        if(!result){
            JSONObject jsonObject = search.getJSONObject("result").getJSONArray("user_list").getJSONObject(0);
            //找到数据库对应信息
            long user_id = jsonObject.getLong("user_id");
            UserDetail user = userService.findDetail(user_id);
            String msg = "人脸匹配率"+jsonObject.getDouble("score");
            System.out.println(user + msg);
            return Result.build(200,msg,user);
        }else{
            return Result.errorMsg(search.getString("error_msg"));
        }
    }

}
