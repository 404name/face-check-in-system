> 启动方式：等待依赖加载完、直接跑就行
>
> 【新版本已经更新，下面仅供参考】
> 1. 数据库云部署了不需要配置
>
>  [也提供本地数据库，face_sign_in.mysql]
>
> 2. 需要插件lombok

1. API接口地址： http://localhost:8888/swagger-ui.html
2. 后台管理平台： http://localhost:8888【账号密码均为erupt】

# 一、项目结构
```basic
【name404.study.face】文件结构
│  FaceApplication.java
│
├─common             公共包、存放公共文件          
├─config             配置包
│      Swagger2.java
│
├─controllers        控制层
│      IndexController.java
│      RouteController.java
│      SignInController.java
│ 
├─dao                Dao层
│      SignLogDao.java
│      SystemVariablesDao.java
│      UserDao.java
│
├─impl               impl层
│      FetchHandlerImpl.java
│      GlobalExceptionHandler.java
│
├─model              数据层
│      SignLog.java
│      SystemVariables.java
│      User.java
│
├─service            服务层
│      BaiduFaceService.java
│      SignLogService.java
│      SystemVariablesService.java
│      UserService.java
│
└─utils              根据包
        Base64Utils.java
        OkHttpClientUtil.java
        Result.java
```
# 二、 待开发任务 
> 已完成基础框架，后台框架，swagger集成api
> 待开发如下。

## 访客的接入

- [ ] 访客基础服务[增删改查]
- [ ] 访客对接进基础签到服务
- [ ] 访客的导入
## 人脸识别模块

- [x] 人脸识别基础服务[增删改查]
- [ ] 人脸识别的批量导入[难实现，需要格外写算法处理]
## 业务需求处理

- [x] 动态增添单位、课题组、事由
- [ ] 事由的固定处理[实验默认3小时，其他超过30分钟处理为xxx，未达0.5小时按0.5记录]
      //处理停留时间[应该写个函数处理]
      //处理解决没退出的签到
- [ ] 常见权限失效时间[直接在用户字段设置freeTime]
- [ ] 可修改默认失效时间[在系统变量里面添加默认实现时间]
## 细节处理

- [ ] 用户登录后提醒权限录入
- [ ] 其他
## 指纹识别接入

- [ ] 未开发
# 三 、文档说明
## 用户模块
[UserService][UserDao]
> 用户基础服务
> [Dao层接口定义]

## 系统变量模块
[SystemVariablesService][SystemVariablesDao]
> 系统变量服务
> [map存储复杂的系统变量]
> [通过key获取value的json]
> [通过对json修改实现变量增删改查]
> [简化数据库，方便统一处理常量]

## 签到日志模块
[SignLogService][SignLogDao]
> 签到日志服务
> [基本增删改查]
> [签到逻辑处理]
> [Dao层接口]

## 人脸识别模块
[BaiduFaceService]
> 人脸识别服务
> [人脸库的增删改查]
> [人脸库对接本地数据库]

## 待开发模块
指纹识别 + 游客模块

# 数据库说明
> 数据库表和模块对应，erupt开头的为erupt框架权限控制用的
