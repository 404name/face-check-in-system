package name404.study.face.hander;

import name404.study.face.utils.Result;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@ControllerAdvice
public class GlobalExceptionHandler {

	@ExceptionHandler(Exception.class)
	@ResponseBody
    //Result是返回数据工具类
	public Result error(Exception e){
		e.printStackTrace();
		return Result.errorMsg("服务器错误");
	}
}