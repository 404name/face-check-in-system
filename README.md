> **2023年4月21日21:06:13** 修复部分bug & 重构补全前端源码
![12345 (1)](https://user-images.githubusercontent.com/56631419/233643370-873b3fec-122c-4077-a50f-9a25115c8736.gif)


# 快速开始
> 默认账号
- 管理员 admin admin
- 默认人脸(手机找个照片然后对着电脑就行)[王思聪、蔡徐坤、马云]

> 项目页面
1. 管理员界面 http://localhost:8080
2. 客户端界面 http://localhost:8080/front
3. swagger接口界面 http://localhost:8080/swagger-ui.html#/

> 项目启动
1. 创建数据库face_sign_in并导入/src/face_sign_in.sql
2. 修改/src/main/resources/application-dev.yml里面的配置
3. 对于idea需要配置lombok插件&jdk1.8 | project structure里面level设置成8及以上
4. 使用idea maven 刷新后右上角启动即可

> 功能使用
1. 注册人脸：先创建新用户再前往录入界面录入(不能太模糊，也可以使用明星的照片)
2. 更新人脸：选择已经录入的人脸然后覆盖
3. 录入访客：后端管理界面手动录入或者excel导入
4. 推送手机：前往http://pushplus.hxtrip.com/send配置对应的key，去后端管理配置出覆盖
5. 百度人脸识别：本项目已经接入了我的百度人脸库，如需要自己创建，前往百度控制中心申请覆盖application的配置

> 项目开发
1. 后端基于erupt框架
2. 后端管理页面也基于erupt框架自动生成，开发请前往erupt官网阅读文档
3. 客户端基于uniapp开发，源码打包发布在项目的release里面，将项目导入hbuilder即可直接点击运行，打包后将产物覆盖front文件夹即可


# 一 、项目背景及需求分析

> [docker-compose一键部署](https://github.com/404name/face-check-in-system/releases/tag/1.0.0)（仅需下载docker-compose文件夹运行即可）

> 用户在可靠验证下实现简化身份确认

在已有用户数据库基础上<br />**传统校验方式：**

1. 直接选择                            ==》 用户 【不安全/不可靠】
1. 用户名 + 密码 查询数据库 ==》 用户 【麻烦/】

**新型校验方式**

3. 第三方工具、qq/微信扫码 ==》 用户 【没手机时麻烦/不稳定】
3. 生物特征人脸/指纹识别     ==》 用户 【方便/可靠】

因此基于各家人脸识别框架，选用百度作为接口，围绕其开发此系统；<br />![动画.gif](https://cdn.nlark.com/yuque/0/2021/gif/21375831/1629635877393-efa7b1b0-5747-48c8-9539-d9586e479687.gif#clientId=u07d94e27-5409-4&from=drop&id=u41487a33&margin=%5Bobject%20Object%5D&name=%E5%8A%A8%E7%94%BB.gif&originHeight=999&originWidth=1909&originalType=binary&ratio=1&size=1955400&status=done&style=none&taskId=ue5f526a0-8b47-4590-a7c4-60f98f434d8)<br />![image.png](https://cdn.nlark.com/yuque/0/2021/png/21375831/1629634914296-d0aeb593-56d8-4770-b208-75f52a4690b1.png#clientId=u07d94e27-5409-4&from=paste&id=uf7d21185&margin=%5Bobject%20Object%5D&name=image.png&originHeight=796&originWidth=1107&originalType=binary&ratio=1&size=671170&status=done&style=none&taskId=ua5c45493-eeb7-45cd-b6b5-f0f8040375e)
<a name="Bm8He"></a>

## ![image.png](https://cdn.nlark.com/yuque/0/2021/png/21375831/1629635090716-e2835bc5-395d-4310-bf52-2e36e524c201.png#clientId=u07d94e27-5409-4&from=paste&id=uba50dfaf&margin=%5Bobject%20Object%5D&name=image.png&originHeight=902&originWidth=1393&originalType=binary&ratio=1&size=302828&status=done&style=none&taskId=u5f4b8529-c6a4-41ee-8d47-acd553fae16)

<a name="aw48V"></a>

## ![image.png](https://cdn.nlark.com/yuque/0/2021/png/21375831/1629634588232-83fcbedc-78d5-40e6-8578-ad4520b71283.png#clientId=u07d94e27-5409-4&from=paste&id=u52a93c42&margin=%5Bobject%20Object%5D&name=image.png&originHeight=1024&originWidth=1915&originalType=binary&ratio=1&size=134691&status=done&style=none&taskId=uc99e688e-123b-41b9-a28b-b77367269c0)

![image.png](https://cdn.nlark.com/yuque/0/2021/png/21375831/1629634660648-0443dc4b-19d0-432b-91e0-8dcc42f2e45a.png#clientId=u07d94e27-5409-4&from=paste&id=u01a7811e&margin=%5Bobject%20Object%5D&name=image.png&originHeight=891&originWidth=1656&originalType=binary&ratio=1&size=183209&status=done&style=none&taskId=u344903c1-9d96-4d87-8c0b-059872f030c)
<a name="yn8xY"></a>

# ![image.png](https://cdn.nlark.com/yuque/0/2021/png/21375831/1629634701825-6cc32e27-e915-42ba-98e1-5d548ef9fded.png#clientId=u07d94e27-5409-4&from=paste&id=u42f45da9&margin=%5Bobject%20Object%5D&name=image.png&originHeight=950&originWidth=1923&originalType=binary&ratio=1&size=167276&status=done&style=none&taskId=u6b0c2935-54b0-4628-834a-680a85317f9)

<a name="T1Gdr"></a>

# 二、技术栈

> 这是一个前后端兼备的前后台分离全栈项目

- 前台上，PC端选择用主流Vue框架[另一位同学完成]、后台管理采用Erupt框架搭建、web显示采用百度Amis框架及bootstrap完成

<br />

- 后端选用主流的Java SpringBoot搭建，使用Schedule完成动态定时任务，使用AOP拦截消息通过pushPlus进行微信推送。

<br />

- 其他技术，后台管理依靠框架Erupt进行的快速构建，使用swagger集成api文档。采用百度云人脸识别接口基于百度人脸识别SDK完成本地数据库与云人脸库的对接。

<br />

- 此外，为了保障访问的稳定及速率，采用redis对首页常用信息进行缓存，减少了对数据库的查询；采用视图构建表间关系，减少后台对数据库的连表查询，加速响应时间。
  <a name="XS8OG"></a>

# 三、模块介绍

```basic
【name404.study.face】文件结构
│  FaceApplication.java
│
├─aop                自定义注解实现标记切割
│      LogAspect.java
│      WxPush.java
│
├─common             公共包、存放公共文件 
├─config             配置包
│      CompleteScheduleConfig.java
│      RedisConfig.java
│      Swagger2.java
│
├─controllers        控制层
│      FaceController.java
│      RouteController.java
│      SignInController.java
│      UserContorller.java
│      VisitorContorller.java
│
├─dao                Dao层
│      GroupDao.java
│      SignLogDao.java
│      SignLogDetailDao.java
│      SystemVariablesDao.java
│      UserDao.java
│      UserDetailDao.java
│
├─entity              数据层
│      Group.java
│      SignLog.java
│      SignLogDetail.java
│      SystemVariables.java
│      User.java
│      UserDetail.java
│
├─handler              handler层
│      FetchHandlerImpl.java
│      GlobalExceptionHandler.java
│
├─service              接口层  
│  │  BaiduFaceService.java
│  │  GroupService.java
│  │  SignLogService.java
│  │  SystemVariablesService.java
│  │  UserService.java
│  │  VisitorService.java
│  │
│  └─impl              接口实现层  
│          BaiduFaceServiceImpl.java
│          GroupServiceImpl.java
│          SignLogServiceImpl.java
│          SystemVariablesServiceImpl.java
│          UserServiceImpl.java
│          VisitorServiceImpl.java
│
└─utils              工具包
        Base64Utils.java
        OkHttpClientUtil.java
        RedisUtil.java
        Result.java
```

<a name="y2k5U"></a>

## ![image.png](https://cdn.nlark.com/yuque/0/2021/png/21375831/1629633641537-dc066a52-e241-42e8-ad77-a6a893525400.png#clientId=u07d94e27-5409-4&from=paste&id=u1a04b213&margin=%5Bobject%20Object%5D&name=image.png&originHeight=739&originWidth=936&originalType=binary&ratio=1&size=242572&status=done&style=none&taskId=u5d64a851-0243-48b9-86a1-8b4598a5c74)

<a name="qIyQE"></a>

## 数据库模块

> 基础四个表：用户表、用户组别二级表、签到日志、系统变量(用户反馈可有可无)

![image.png](https://cdn.nlark.com/yuque/0/2021/png/21375831/1629639599030-a8bffa58-5271-40d3-9765-450f64d28ee3.png#clientId=u07d94e27-5409-4&from=paste&id=u31cd19c0&margin=%5Bobject%20Object%5D&name=image.png&originHeight=694&originWidth=917&originalType=binary&ratio=1&size=85075&status=done&style=none&taskId=u1c35e0e1-a367-4316-b905-65e86eb46f2)

> 视图部分：使用userDetail + signLogDetail减少后台对数据库的连表查询

数据库字段中存在大量引用[存在user_group二级分类菜单中]，直接返回的内容不方便使用，使用时连表查询，多次太费空间，因此基于视图一次性创建好引用，方便后台直接调用，加速后台响应

```sql
SELECT
	`sign_log`.`id` AS `id`,
	`sign_log`.`user_name` AS `user_name`,
	`sign_log`.`in_time` AS `in_time`,
	`sign_log`.`out_time` AS `out_time`,
	`sign_log`.`msg` AS `msg`,
	`sign_log`.`date` AS `date`,
	`a`.`name` AS `user_group`,
	`d`.`name` AS `to_do`,
	`b`.`name` AS `class_group`,
	`c`.`name` AS `unit_group`,
	`sign_log`.`sign_time` AS `sign_time` 
FROM
	((((
					`sign_log`
					LEFT JOIN `user_group` `a` ON ((
							`sign_log`.`user_group` = `a`.`id` 
						)))
				LEFT JOIN `user_group` `b` ON ((
						`sign_log`.`class_group` = `b`.`id` 
					)))
			LEFT JOIN `user_group` `c` ON ((
					`sign_log`.`unit_group` = `c`.`id` 
				)))
		LEFT JOIN `user_group` `d` ON ((
			`sign_log`.`to_do` = `d`.`id` 
	)))
```

![image.png](https://cdn.nlark.com/yuque/0/2021/png/21375831/1629639808296-bd6cd8c0-10c3-4c6e-999a-028fb27e8445.png#clientId=u07d94e27-5409-4&from=paste&height=222&id=u1fcf09d2&margin=%5Bobject%20Object%5D&name=image.png&originHeight=444&originWidth=662&originalType=binary&ratio=1&size=39590&status=done&style=none&taskId=u70319419-8429-40dd-b80b-d2b80a92c94&width=331)![image.png](https://cdn.nlark.com/yuque/0/2021/png/21375831/1629639848571-ef812b92-4f6e-4047-a98d-b2e04cd9896b.png#clientId=u07d94e27-5409-4&from=paste&height=292&id=ue1e624e9&margin=%5Bobject%20Object%5D&name=image.png&originHeight=584&originWidth=460&originalType=binary&ratio=1&size=31039&status=done&style=none&taskId=u129869c2-e005-4c5a-a6d7-c0ab5e9f564&width=230)
<a name="jvyFa"></a>

## 1. 用户模块

[UserService][UserDao]

> 用户基础服务
> [Dao层接口定义]

**数据库设计**

```sql
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `face_id` int(11) NULL DEFAULT NULL,
  `user_group` int(11) NULL DEFAULT 5,
  `now_sign_id` int(11) NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telphone` int(11) NULL DEFAULT NULL,
  `expired_time` datetime NULL DEFAULT NULL,
  `sign_state` bit(1) NULL DEFAULT b'0',
  `class_group` bigint(20) NULL DEFAULT 0,
  `unit_group` bigint(20) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK5ixd8ou7x5sln7b00u8qpf7il`(`group_id`) USING BTREE,
  CONSTRAINT `FK5ixd8ou7x5sln7b00u8qpf7il` FOREIGN KEY (`group_id`) REFERENCES `user_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;
```

**模块效果**<br />![image.png](https://cdn.nlark.com/yuque/0/2021/png/21375831/1629640214805-810bc71f-0ef2-4073-9b16-fb6709465fcd.png#clientId=u07d94e27-5409-4&from=paste&id=u03b63f9f&margin=%5Bobject%20Object%5D&name=image.png&originHeight=533&originWidth=1676&originalType=binary&ratio=1&size=84446&status=done&style=none&taskId=uf1f94efe-660c-4136-a38c-96d4b7b1b55)<br />**模块流程**<br />![image.png](https://cdn.nlark.com/yuque/0/2021/png/21375831/1629641271069-f578d389-c010-484f-9192-dc5bcfdf0994.png#clientId=u07d94e27-5409-4&from=paste&height=607&id=u5e1e5029&margin=%5Bobject%20Object%5D&name=image.png&originHeight=656&originWidth=592&originalType=binary&ratio=1&size=62184&status=done&style=none&taskId=u451dbe8d-c5d0-48fb-867f-43c9f5cd106&width=548)<br />

<a name="lGnCt"></a>

## 2. 系统变量模块

[SystemVariablesService][SystemVariablesDao]

> 系统变量服务
> [map存储复杂的系统变量]
> [通过key获取value的json]
> [通过对json修改实现变量增删改查]
> [简化数据库，方便统一处理常量]

**数据库设计**

```sql
-- ----------------------------
-- Table structure for system_variables
-- ----------------------------
DROP TABLE IF EXISTS `system_variables`;
CREATE TABLE `system_variables`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `my_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `my_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;
```

**模块流程**<br />![image.png](https://cdn.nlark.com/yuque/0/2021/png/21375831/1629643271681-4add6a37-2fdd-4065-a01a-5e61d2c83956.png#clientId=u07d94e27-5409-4&from=paste&height=227&id=uc2405ea9&margin=%5Bobject%20Object%5D&name=image.png&originHeight=453&originWidth=1219&originalType=binary&ratio=1&size=74162&status=done&style=none&taskId=u2bc30a8d-d5ab-4978-9c40-6cd1e1b016f&width=609.5)<br />**模块效果**<br />![image.png](https://cdn.nlark.com/yuque/0/2021/png/21375831/1629640263030-3188ef6a-d590-4fc5-9abe-166f5ef70e2d.png#clientId=u07d94e27-5409-4&from=paste&id=u1e93d4d0&margin=%5Bobject%20Object%5D&name=image.png&originHeight=681&originWidth=1680&originalType=binary&ratio=1&size=79098&status=done&style=none&taskId=ufc13fa67-23f2-4cf3-904d-f87b168f2c0)
<a name="zwD8x"></a>

## 3. 签到日志模块

[SignLogService][SignLogDao]

> 签到日志服务
> [基本增删改查]
> [签到逻辑处理]
> [Dao层接口]

**数据库设计**

```sql
-- ----------------------------
-- Table structure for sign_log
-- ----------------------------
DROP TABLE IF EXISTS `sign_log`;
CREATE TABLE `sign_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `in_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `out_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sign_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `to_do` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` datetime NULL DEFAULT NULL,
  `from_user_id` bigint(20) NULL DEFAULT NULL,
  `user_class` bit(1) NULL DEFAULT NULL,
  `class_group` bigint(20) NULL DEFAULT NULL,
  `unit_group` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 90 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;
```

**模块流程**<br />![image.png](https://cdn.nlark.com/yuque/0/2021/png/21375831/1629643031872-46947cd1-26f5-4c59-8938-bdba02db95ee.png#clientId=u07d94e27-5409-4&from=paste&height=615&id=ud3793115&margin=%5Bobject%20Object%5D&name=image.png&originHeight=680&originWidth=747&originalType=binary&ratio=1&size=86228&status=done&style=none&taskId=ufd548cf3-dd9b-4f4f-9f66-984c0848698&width=676)<br />**​**

**模块效果**<br />![image.png](https://cdn.nlark.com/yuque/0/2021/png/21375831/1629640234717-5bc56a23-c1d7-4b98-9d24-f1dc0d3e0668.png#clientId=u07d94e27-5409-4&from=paste&id=ud2cb6d0a&margin=%5Bobject%20Object%5D&name=image.png&originHeight=786&originWidth=1656&originalType=binary&ratio=1&size=126445&status=done&style=none&taskId=ucf0aee61-3326-4efc-9595-087ca3d8235)
<a name="qbQ0U"></a>

## 4. 人脸识别模块+反馈模块

[BaiduFaceService]<br />**模块流程**<br />![image.png](https://cdn.nlark.com/yuque/0/2021/png/21375831/1629642857386-be951b78-1cee-4e96-aacd-9c321194b926.png#clientId=u07d94e27-5409-4&from=paste&height=230&id=u31e24dd3&margin=%5Bobject%20Object%5D&name=image.png&originHeight=459&originWidth=1086&originalType=binary&ratio=1&size=68291&status=done&style=none&taskId=u119260e2-f304-4aef-b5be-c88fd4c76bb&width=543)<br />**​**

**模块效果**

> 人脸识别服务
> [人脸库的增删改查]
> [人脸库对接本地数据库]

<a name="FrINs"></a>

## 5. 二级菜单模块

[GroupService]

> 对于一些杂乱的内容设置二级分类方便统一管理

**数据库设计**

```sql
-- ----------------------------
-- Table structure for user_group
-- ----------------------------
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;
```

**模块流程**<br />![image.png](https://cdn.nlark.com/yuque/0/2021/png/21375831/1629642738184-1889e736-cb4d-41bc-b741-ae63e418d4aa.png#clientId=u07d94e27-5409-4&from=paste&height=289&id=u78b3a377&margin=%5Bobject%20Object%5D&name=image.png&originHeight=577&originWidth=690&originalType=binary&ratio=1&size=58399&status=done&style=none&taskId=uac804e26-38b9-4ead-9a4e-4fcb7860667&width=345)<br />**​**

**模块效果**<br />![image.png](https://cdn.nlark.com/yuque/0/2021/png/21375831/1629640307165-3ce9b3a0-f267-41d2-825b-bb5957bfc5ea.png#clientId=u07d94e27-5409-4&from=paste&id=uc27be1db&margin=%5Bobject%20Object%5D&name=image.png&originHeight=633&originWidth=1679&originalType=binary&ratio=1&size=71492&status=done&style=none&taskId=u6abbf1e4-5146-418a-9331-e608211c932)
<a name="flIXa"></a>

## 待开发模块

指纹识别 + 游客模块
<a name="NNPDM"></a>

# 四、技术点介绍


<a name="TnNbh"></a>

## 1. 百度云人脸识别接入当前系统

> 注册百度云获取AppId ，API KEY Secret key作为密钥

![image.png](https://cdn.nlark.com/yuque/0/2021/png/21375831/1629679422656-84f01daa-dc0c-4a1a-849a-f9bb4eb43cb7.png#clientId=ub95780d4-61f9-4&from=paste&height=329&id=ue69b4ccd&margin=%5Bobject%20Object%5D&name=image.png&originHeight=657&originWidth=1652&originalType=binary&ratio=1&size=58854&status=done&style=none&taskId=u2f13cd4f-0da8-4bfe-8c54-70a8a1d1ef2&width=826)

> 下载SDK对接用户数据库
> SDK和API区别
> API：直接面向接口提交http请求
> SDK：基于JAVA/PYTHON等语言集成一门API的通用函数库，方便直接调用对接

![image.png](https://cdn.nlark.com/yuque/0/2021/png/21375831/1629679632473-a401aba7-fed1-47cf-aa3d-e0618053f284.png#clientId=ub95780d4-61f9-4&from=paste&height=473&id=u4ad7af0b&margin=%5Bobject%20Object%5D&name=image.png&originHeight=946&originWidth=1211&originalType=binary&ratio=1&size=140382&status=done&style=none&taskId=u2b4f4bf1-bb92-42b3-bb90-b4e0aa5d790&width=605.5)

> 引入jar包，初始化client，开始使用

```java
ConfigurationProperties(prefix = "baidu")
public class BaiduFaceServiceImpl implements BaiduFaceService {
    private String app_id;
    private String api_key;
    private String secret_key;
    private  AipFace client = null;

    void initClient(){
        if(client == null){
            System.out.println("初始化百度sdk");
            client = new AipFace(app_id, api_key, secret_key);
        }
    }
    
    ...
}
```

<a name="cq8HW"></a>

## 2. 可动态修改的定时任务

> 怎么启动

创建配置类

> @Configuration
> @EnableScheduling 
> public class CompleteScheduleConfig implements SchedulingConfigurer

> 怎么动态：在执行定时任务下一次获取时间不是通过本地查询，而是通过数据库查询后后台拼接形成新的下一次时间

```java
@Configuration
@EnableScheduling
public class CompleteScheduleConfig implements SchedulingConfigurer {

    @Autowired
    private SystemVariablesService systemVariablesService;
    @Autowired
    private SignLogService signLogService;
    /**
     * 执行定时任务.
     */
    @Override
    public void configureTasks(ScheduledTaskRegistrar taskRegistrar) {
        taskRegistrar.addTriggerTask(
                //1.添加任务内容(Runnable)
                () -> {
                    try {
                        //调用签到模块的定时执行任务
                        signLogService.scheduleTask();
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                },
                //2.设置执行周期(Trigger)
                triggerContext -> {
                    //2.1 从数据库获取执行周期
                    String time = systemVariablesService.getKey(SystemVariablesService.getEndTime);
                    String[] HMS = time.split(":");
                    String cron = HMS[2] + " " + HMS[1] +" " + HMS[0] +" * * ?";
                    System.out.println("【下一次执行时间】" + cron);
                    //2.2 合法性校验.
                    //2.3 返回执行周期(Date)
                    return new CronTrigger(cron).nextExecutionTime(triggerContext);
                }
        );
    }

}
```

<a name="NVIfO"></a>

## 3. AOP切自定义注解实现微信推送 

> 导入AOP相关的包

> 创建注解作为标记点

```java
import java.lang.annotation.ElementType;import java.lang.annotation.Retention;import java.lang.annotation.RetentionPolicy;import java.lang.annotation.Target;//表示运行时开启@Retention(RetentionPolicy.RUNTIME)//表示定义在方法上@Target(ElementType.METHOD)public @interface WxPush {}
```

> 创建APO层去切割WxPush方法
> 微信推送：使用pushplus提供的接口直接通过http请求发送
>
> 1. 获取自己微信token
> 1. 使用pushplus提供的接口
> 1. 通过http工具请求推送

```java
@Aspect@Componentpublic class LogAspect {    @Autowired    private SystemVariablesService systemVariablesService;    @Autowired    private SignLogService signLogService;    @Autowired    private OkHttpClientUtil okHttpClientUtil;    /**     * 注解切入点     */    @Pointcut("@annotation(name404.study.face.aop.WxPush)")    public void pointCut(){    }	    @AfterReturning(value = "pointCut()",returning = "result")    public void wxPush(Object result){        Result res = (Result)result;        //是成功的返回类型        if(res.getStatus() == 200){            // 根据返回结果进行微信推送            String title ="【每日打卡消息】  当前：" +toDayMsg.get("nowUser") + "人";            String content = (String)res.getData();            content += "<br/><br/>";            String startTime =systemVariablesService.getKey(SystemVariablesService.getStartTime);            String endTime = systemVariablesService.getKey(SystemVariablesService.getEndTime);            content += "[今日打卡时间段] " + startTime + "-" + endTime + "<br/><br/>";            content += "[今日总打卡数] " +  toDayMsg.get("allUser") + "<br/>";            content += "[今日当前人数] " + toDayMsg.get("nowUser") + "<br/>";            content += "[今日签退人数] " + toDayMsg.get("leaveUser") + "<br/>";            String url = "http://pushplus.hxtrip.com/send?token="+token+"&title="+title+"&content="+content+"&template=html&topic="+groupId;            okHttpClientUtil.getData(url);        }    }}
```

> 使用：直接在方法前加上@WxPush即可切割拦截进行结果集的推送了

<a name="mka9C"></a>

## 4. 采用redis缓存首页信息优化访问速度

> 导入包导入工具类，创建bean引入配置

```java
<!-- redis --><dependency>    <groupId>org.springframework.boot</groupId>    <artifactId>spring-boot-starter-data-redis</artifactId></dependency>
```

> 当作map直接使用提供好的工具包

![image.png](https://cdn.nlark.com/yuque/0/2021/png/21375831/1629689070244-cf6dca47-1366-4525-8917-6deb32f8cc71.png#clientId=ub95780d4-61f9-4&from=paste&height=203&id=uc9bcff90&margin=%5Bobject%20Object%5D&name=image.png&originHeight=405&originWidth=1136&originalType=binary&ratio=1&size=273684&status=done&style=none&taskId=u894bd356-c435-4600-b8d5-b191d82dd0a&width=568)

> 类比mysql数据库
> 100 访问同一个页面获取100跳信息，要查询100次 100数据的数据库库，数据库承受1w次查询
> 用redis 第一次查数据库 后面只要信息不变全部查缓存 ，数据库只承受100次查询

原理：<br />查：在查询数据库之前判断redisUtil里面存了首页信息没，有就直接返回<br />增：没有数据就查询数据库得到的信息存redis<br />改：每次数据库修改就清空redis缓存，下次查询就继续执行上面操作
<a name="WGa0g"></a>

## 5. 采用swagger集成api统一访问管理

> 前后台分离
> 多人合作：jsp不可行，要采用前后台分离
> SSM：前台的数据一定要有后台先提供，导致开发工期延长
> 前后端分离：通过简单的数据包装，确保了视图和控制器的分离。只负责分发数据，谁拿不管。可以前后台同时进行，最后对接

统一的数据管理平台 ==》 swagger ==》 方便前台用户阅读 使用

> 引入jar包

```java
<!-- swagger --><dependency>    <groupId>io.springfox</groupId>    <artifactId>springfox-swagger-ui</artifactId>    <version>2.9.2</version></dependency><dependency>    <groupId>io.springfox</groupId>    <artifactId>springfox-swagger2</artifactId>    <version>2.9.2</version></dependency>
```

> 配置config 
> 配置扫描包指定扫描那些controller

```java
@Configuration@EnableSwagger2//是否开启swagger，正式环境一般是需要关闭的（避免不必要的漏洞暴露！），可根据springboot的多环境配置进行设置@ConditionalOnProperty(name = "swagger.enable",  havingValue = "true")public class Swagger2 {     // swagger2的配置文件，这里可以配置swagger2的一些基本的内容，比如扫描的包等等     @Bean     public Docket createRestApi() {          return new Docket(DocumentationType.SWAGGER_2)                   .apiInfo(apiInfo())                   .select()                   // 为当前包路径                   .apis(RequestHandlerSelectors.basePackage("name404.study.face.controllers")).paths(PathSelectors.any())                   .build();     }     // 构建 api文档的详细信息函数,注意这里的注解引用的是哪个     private ApiInfo apiInfo() {          return new ApiInfoBuilder()                   // 页面标题                   .title("Spring Boot 测试使用 Swagger2 构建RESTful API")                   // 创建人信息                   .contact(new Contact("404name",  "yuque.com/404name",  "1308964967@qq.com"))                   // 版本号                   .version("1.0")                   // 描述                   .description("API 描述")                   .build();     }
```

> <br />

![image.png](https://cdn.nlark.com/yuque/0/2021/png/21375831/1629689199976-7c791bb9-3aea-418c-8f05-3a8d78217e19.png#clientId=ub95780d4-61f9-4&from=paste&height=438&id=u5f57a202&margin=%5Bobject%20Object%5D&name=image.png&originHeight=876&originWidth=1908&originalType=binary&ratio=1&size=103990&status=done&style=none&taskId=u1cf5958b-8916-4e63-a8a7-1347ab490aa&width=954)
<a name="J0P7O"></a>

# 五、 不足及后续开发计划

> 已完成基础框架，后台框架，swagger集成api
> 待开发如下。

<a name="YQ52t"></a>

## 访客的接入

- [x] 访客基础服务[增删改查]
- [x] 访客对接进基础签到服务
- [x] 访客的导入
  <a name="Svwli"></a>

## 人脸识别模块

- [x] 人脸识别基础服务[增删改查]
- [ ] 人脸识别的批量导入[难实现，需要格外写算法处理]
  <a name="B2el1"></a>

## 业务需求处理

- [x] 动态增添单位、课题组、事由
- [ ] 事由的固定处理[实验默认3小时，其他超过30分钟处理为xxx，未达0.5小时按0.5记录]
- [x] 常见权限失效时间[直接在用户字段设置freeTime]
- [ ] 可修改默认失效时间[在系统变量里面添加默认实现时间]
  <a name="CUJoa"></a>

## 细节处理

- [ ] 用户登录后提醒权限录入
- [ ] 其他
  <a name="Bvjmb"></a>

## 指纹识别接入

- [ ] 未开发



