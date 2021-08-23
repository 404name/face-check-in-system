package name404.study.face.utils;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Data;

/**
 * 
 * @Title: JSONResult.java
 * @Package com.weiz.utils
 * @Description: 自定义响应数据结构
 *                 这个类是提供给门户，ios，安卓，微信商城用的
 *                 门户接受此类数据后需要使用本类的方法转换成对于的数据类型格式（类，或者list）
 *                 其他自行处理
 *                 200：表示成功
 *                 500：表示错误，错误信息在msg字段中
 *                 501：bean验证错误，不管多少个错误都以map形式返回
 *                 502：拦截器拦截到用户token出错
 *                 555：异常抛出信息
 * Copyright: Copyright (c) 2016
 * 
 * @author weiz
 * @date 2016年4月22日 下午8:33:36
 * @version V1.0
 */
@Data
public class Result {

    // 定义jackson对象
    private static final ObjectMapper MAPPER = new ObjectMapper();

    // 响应业务状态
    private Integer status;

    // 响应消息
    private String msg;

    // 响应中的数据
    private Object data;


    public static Result build(Integer status, String msg, Object data) {
        return new Result(status, msg, data);
    }
    
    public static Result errorMsg(String msg) {
        return new Result(500, msg, null);
    }
    public static Result success(Object data) {
        return new Result(200, "success", data);
    }

    public Result() {
    }

    public Result(Integer status, String msg, Object data) {
        this.status = status;
        this.msg = msg;
        this.data = data;
    }

    public Result(Object data) {
        this.status = 200;
        this.msg = "success";
        this.data = data;
    }
}