package name404.study.face.service;


import name404.study.face.entity.User;
import name404.study.face.utils.Result;
import org.json.JSONObject;

import java.io.IOException;

/**
 * 百度人脸识别接口相关
 * @date: 2020/1/2
 * @description:
 */

public interface BaiduFaceService {


    /**
     * 注册人脸
     * @param img
     * @param user
     * @return
     */
    JSONObject registerFace(String img, User user) throws IOException;

    /**
     * 根据用户存储的人脸faceid删除人脸库人脸
     * @param user
     * @return
     */
    JSONObject delete(User user) throws IOException;

    /**
     * 更新用户
     * @param img
     * @param user
     * @param ifToken
     * @return
     */
   JSONObject update(String img,User user,boolean ifToken) throws IOException;

    /**
     * 根据base64的图片去人脸库匹配人脸
     * @param img
     * @return
     */
    JSONObject search(String img) throws IOException;

    /**
     * 同上，只是返回封装好的内容
     * @param img
     * @return
     */
    Result searchRes(String img) throws IOException;
}
