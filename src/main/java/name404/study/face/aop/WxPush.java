package name404.study.face.aop;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
//运行时开启
@Retention(RetentionPolicy.RUNTIME)
//定义在方法上
@Target(ElementType.METHOD)
public @interface WxPush {
}
