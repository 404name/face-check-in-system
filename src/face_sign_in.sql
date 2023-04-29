/*
 Navicat Premium Data Transfer

 Source Server         : 华为服务器
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : hw.xxxxx.top:3306
 Source Schema         : face

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 29/04/2023 16:49:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for e_dict
-- ----------------------------
DROP TABLE IF EXISTS `e_dict`;
CREATE TABLE `e_dict`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `create_user_id` bigint(0) NULL DEFAULT NULL,
  `update_user_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKf5wwh5osfukkeebw7h2yb4kmp`(`code`) USING BTREE,
  INDEX `FKi8lurtplfsktg01y6uevop5yp`(`create_user_id`) USING BTREE,
  INDEX `FKhxpr89ae0g4rd9xpfgcdjf0sa`(`update_user_id`) USING BTREE,
  CONSTRAINT `FKhxpr89ae0g4rd9xpfgcdjf0sa` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKi8lurtplfsktg01y6uevop5yp` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of e_dict
-- ----------------------------

-- ----------------------------
-- Table structure for e_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `e_dict_item`;
CREATE TABLE `e_dict_item`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `sort` int(0) NULL DEFAULT NULL,
  `create_user_id` bigint(0) NULL DEFAULT NULL,
  `update_user_id` bigint(0) NULL DEFAULT NULL,
  `erupt_dict_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKl0kiq8otpn3fvtlvarebt8xkh`(`code`, `erupt_dict_id`) USING BTREE,
  INDEX `FKij9x8hwy16dra7d49h483lu2u`(`create_user_id`) USING BTREE,
  INDEX `FKmlg0pjfxwih4i6r0g0iilh1lu`(`update_user_id`) USING BTREE,
  INDEX `FKrrbi2dt94rjd8sjt830m3w0a`(`erupt_dict_id`) USING BTREE,
  CONSTRAINT `FKij9x8hwy16dra7d49h483lu2u` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKmlg0pjfxwih4i6r0g0iilh1lu` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKrrbi2dt94rjd8sjt830m3w0a` FOREIGN KEY (`erupt_dict_id`) REFERENCES `e_dict` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of e_dict_item
-- ----------------------------

-- ----------------------------
-- Table structure for e_generator_class
-- ----------------------------
DROP TABLE IF EXISTS `e_generator_class`;
CREATE TABLE `e_generator_class`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `class_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `remark` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `create_user_id` bigint(0) NULL DEFAULT NULL,
  `update_user_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKbnmtsmoprxey1uh6hwa7kl15b`(`create_user_id`) USING BTREE,
  INDEX `FKl47n6nt0w2ulphuhmwht6jdlw`(`update_user_id`) USING BTREE,
  CONSTRAINT `FKbnmtsmoprxey1uh6hwa7kl15b` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKl47n6nt0w2ulphuhmwht6jdlw` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of e_generator_class
-- ----------------------------
INSERT INTO `e_generator_class` VALUES (1, '2021-08-09 11:17:34', '2021-08-14 11:49:50', 'User', '用户信息', NULL, 'user', 1, 1);
INSERT INTO `e_generator_class` VALUES (2, '2021-08-09 11:29:02', NULL, 'SignLog', '签到统计', NULL, 'sign_log', 1, NULL);
INSERT INTO `e_generator_class` VALUES (3, '2021-08-09 11:51:51', NULL, 'SystemVariables', '系统变量', NULL, 'system_variables', 1, NULL);
INSERT INTO `e_generator_class` VALUES (4, '2021-08-11 15:44:38', NULL, 'test', 'test', NULL, 'test', 1, NULL);
INSERT INTO `e_generator_class` VALUES (5, '2021-08-14 10:26:42', NULL, 'Group', '单位及课题组管理', NULL, 'group', 1, NULL);

-- ----------------------------
-- Table structure for e_generator_field
-- ----------------------------
DROP TABLE IF EXISTS `e_generator_field`;
CREATE TABLE `e_generator_field`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `is_show` bit(1) NULL DEFAULT NULL,
  `link_class` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `not_null` bit(1) NULL DEFAULT NULL,
  `query` bit(1) NULL DEFAULT NULL,
  `show_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `sort` int(0) NULL DEFAULT NULL,
  `sortable` bit(1) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `class_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKslwo9qwwfbgif9mbbhg072s4i`(`class_id`) USING BTREE,
  CONSTRAINT `FKslwo9qwwfbgif9mbbhg072s4i` FOREIGN KEY (`class_id`) REFERENCES `e_generator_class` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of e_generator_field
-- ----------------------------
INSERT INTO `e_generator_field` VALUES (1, 'realName', b'1', NULL, b'1', b'1', '用户姓名', 1, b'0', 'INPUT', 1);
INSERT INTO `e_generator_field` VALUES (2, 'userGroup', b'1', NULL, b'1', b'1', '用户组', 1, b'0', 'NUMBER', 1);
INSERT INTO `e_generator_field` VALUES (3, 'stuId', b'0', NULL, b'1', b'1', '学号', 1, b'0', 'NUMBER', 1);
INSERT INTO `e_generator_field` VALUES (4, 'status', b'1', NULL, b'1', b'1', '状态[0游客，1激活，2禁用]', 2, b'0', 'CHOICE', 1);
INSERT INTO `e_generator_field` VALUES (5, 'faceImg', b'1', NULL, b'0', b'0', '人脸上传', 1, b'0', 'BOOLEAN', 1);
INSERT INTO `e_generator_field` VALUES (6, 'touchId', b'1', NULL, b'0', b'0', '指纹Id', 1, b'0', 'NUMBER', 1);
INSERT INTO `e_generator_field` VALUES (7, 'UserName', b'1', NULL, b'1', b'1', '姓名', 1, b'0', 'INPUT', 2);
INSERT INTO `e_generator_field` VALUES (8, 'userGroup', b'1', NULL, b'1', b'1', '课题组', 1, b'0', 'INPUT', 2);
INSERT INTO `e_generator_field` VALUES (9, 'data', b'1', NULL, b'1', b'1', '日期', 1, b'1', 'DATE', 2);
INSERT INTO `e_generator_field` VALUES (10, 'inTime', b'1', NULL, b'1', b'0', '进入时间', 2, b'1', 'TIME', 2);
INSERT INTO `e_generator_field` VALUES (11, 'outTime', b'1', NULL, b'0', b'0', '离开时间', 2, b'1', 'TIME', 2);
INSERT INTO `e_generator_field` VALUES (12, 'toDo', b'1', NULL, b'0', b'1', '事由', 3, b'0', 'CHOICE', 2);
INSERT INTO `e_generator_field` VALUES (13, 'msg', b'1', NULL, b'0', b'0', '备注', 3, b'0', 'INPUT', 2);
INSERT INTO `e_generator_field` VALUES (14, 'signTime', b'1', NULL, b'0', b'0', '停留时间(h)', 4, b'0', 'SLIDER', 2);
INSERT INTO `e_generator_field` VALUES (15, 'key', b'1', NULL, b'1', b'1', '键', 1, b'0', 'INPUT', 3);
INSERT INTO `e_generator_field` VALUES (16, 'value', b'1', NULL, b'1', b'1', '值', 2, b'0', 'INPUT', 3);
INSERT INTO `e_generator_field` VALUES (17, 'test', b'1', NULL, b'1', b'1', 'test', 1, b'0', 'TAGS', 4);
INSERT INTO `e_generator_field` VALUES (18, 'groupClass', b'1', NULL, b'1', b'1', '类别', 1, b'0', 'CHOICE', 5);
INSERT INTO `e_generator_field` VALUES (19, 'name', b'1', NULL, b'1', b'0', '组别名', 1, b'0', 'INPUT', 5);
INSERT INTO `e_generator_field` VALUES (20, 'message', b'1', NULL, b'1', b'0', '组别信息', 3, b'0', 'INPUT', 5);
INSERT INTO `e_generator_field` VALUES (21, 'expiredTime', b'1', NULL, b'1', b'0', '失效时间', 3, b'0', 'DATE_TIME', 1);

-- ----------------------------
-- Table structure for e_upms_login_log
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_login_log`;
CREATE TABLE `e_upms_login_log`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `browser` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `device_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `login_time` datetime(0) NULL DEFAULT NULL,
  `region` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `system_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `erupt_user_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKjqnr9oel32kajm6bpvqwomv6m`(`erupt_user_id`) USING BTREE,
  CONSTRAINT `FKjqnr9oel32kajm6bpvqwomv6m` FOREIGN KEY (`erupt_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 126 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of e_upms_login_log
-- ----------------------------
INSERT INTO `e_upms_login_log` VALUES (1, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-09 11:11:24', '0|0|0|内网IP|内网IP', 'Windows 10', 'uvacbLpR2agPXjpr', 1);
INSERT INTO `e_upms_login_log` VALUES (2, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-09 12:12:43', '0|0|0|内网IP|内网IP', 'Windows 10', 'Oq457GxxeUxQPTQ6', 1);
INSERT INTO `e_upms_login_log` VALUES (3, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-09 13:24:35', '0|0|0|内网IP|内网IP', 'Windows 10', 'Ub54YtDOn1y9rRKI', 1);
INSERT INTO `e_upms_login_log` VALUES (4, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-09 13:41:49', '0|0|0|内网IP|内网IP', 'Windows 10', 'i06Val1HSufZuZxA', 1);
INSERT INTO `e_upms_login_log` VALUES (5, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-09 13:47:45', '0|0|0|内网IP|内网IP', 'Windows 10', 'ZuAE456a09nWt0ih', 1);
INSERT INTO `e_upms_login_log` VALUES (6, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-09 13:50:32', '0|0|0|内网IP|内网IP', 'Windows 10', 'MSSuzMNhplFIuWtH', 1);
INSERT INTO `e_upms_login_log` VALUES (7, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-09 14:22:09', '0|0|0|内网IP|内网IP', 'Windows 10', 'eDhZnKa9I6qPfyY2', 1);
INSERT INTO `e_upms_login_log` VALUES (8, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-09 15:13:17', '0|0|0|内网IP|内网IP', 'Windows 10', 'CyB2FMUAXw5wPl5o', 1);
INSERT INTO `e_upms_login_log` VALUES (9, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-09 15:36:18', '0|0|0|内网IP|内网IP', 'Windows 10', '4yYHR1datOveLRWe', 1);
INSERT INTO `e_upms_login_log` VALUES (10, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-09 15:47:08', '0|0|0|内网IP|内网IP', 'Windows 10', 'PB63eB5eKewXXgw7', 1);
INSERT INTO `e_upms_login_log` VALUES (11, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-09 15:57:35', '0|0|0|内网IP|内网IP', 'Windows 10', 'U32qlAppkMt5028j', 1);
INSERT INTO `e_upms_login_log` VALUES (12, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-09 16:00:41', '0|0|0|内网IP|内网IP', 'Windows 10', 'xaLu70ZBniu1R4n9', 1);
INSERT INTO `e_upms_login_log` VALUES (13, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-09 16:04:59', '0|0|0|内网IP|内网IP', 'Windows 10', 'indSt0JRZV3NQTmS', 1);
INSERT INTO `e_upms_login_log` VALUES (14, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-09 16:14:41', '0|0|0|内网IP|内网IP', 'Windows 10', '6renCG9qOgAJ2tEt', 1);
INSERT INTO `e_upms_login_log` VALUES (15, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-09 16:19:05', '0|0|0|内网IP|内网IP', 'Windows 10', 'QZUioMYg5Wg7cbOW', 1);
INSERT INTO `e_upms_login_log` VALUES (16, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-09 17:19:05', '0|0|0|内网IP|内网IP', 'Windows 10', '64tOoXzeLQEXnNJo', 1);
INSERT INTO `e_upms_login_log` VALUES (17, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-09 17:22:25', '0|0|0|内网IP|内网IP', 'Windows 10', 'D3gtHbgBamLTMnhW', 1);
INSERT INTO `e_upms_login_log` VALUES (18, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-09 17:54:46', '0|0|0|内网IP|内网IP', 'Windows 10', '670P2gubYavlhVBo', 1);
INSERT INTO `e_upms_login_log` VALUES (19, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-09 18:26:42', '0|0|0|内网IP|内网IP', 'Windows 10', 'RS9Ot7aoia5FR7Ss', 1);
INSERT INTO `e_upms_login_log` VALUES (20, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-09 19:39:57', '0|0|0|内网IP|内网IP', 'Windows 10', 'GUsQtoWBaWJ7nrDO', 1);
INSERT INTO `e_upms_login_log` VALUES (21, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-09 19:48:27', '0|0|0|内网IP|内网IP', 'Windows 10', 'ESHv78CXHzI7pRQ4', 1);
INSERT INTO `e_upms_login_log` VALUES (22, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-09 19:50:21', '0|0|0|内网IP|内网IP', 'Windows 10', 'aqFzLuIpFY6FCKkz', 1);
INSERT INTO `e_upms_login_log` VALUES (23, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-09 19:57:34', '0|0|0|内网IP|内网IP', 'Windows 10', 'bPC2m13o3ogJyK5J', 1);
INSERT INTO `e_upms_login_log` VALUES (24, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-09 20:45:20', '0|0|0|内网IP|内网IP', 'Windows 10', 'Lt36kLFulbcTsLLi', 1);
INSERT INTO `e_upms_login_log` VALUES (25, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-09 20:57:35', '0|0|0|内网IP|内网IP', 'Windows 10', 'vywgn0FHQHfx1TPv', 1);
INSERT INTO `e_upms_login_log` VALUES (26, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-09 21:06:37', '0|0|0|内网IP|内网IP', 'Windows 10', '1RoSEsMoBJw2PnKm', 2);
INSERT INTO `e_upms_login_log` VALUES (27, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-09 21:06:49', '0|0|0|内网IP|内网IP', 'Windows 10', 'R8vYpTMfpDt5i2b5', 1);
INSERT INTO `e_upms_login_log` VALUES (28, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-09 21:08:01', '0|0|0|内网IP|内网IP', 'Windows 10', 'icmxWn01I7hrwVJa', 2);
INSERT INTO `e_upms_login_log` VALUES (29, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-09 21:12:52', '0|0|0|内网IP|内网IP', 'Windows 10', 'REzPYH2E17RjtXkm', 2);
INSERT INTO `e_upms_login_log` VALUES (30, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-10 13:37:01', '0|0|0|内网IP|内网IP', 'Windows 10', 'JW2ydlUNroxoC4ur', 1);
INSERT INTO `e_upms_login_log` VALUES (31, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-10 14:22:56', '0|0|0|内网IP|内网IP', 'Windows 10', 'knMHi4RRiUrwZ5xt', 1);
INSERT INTO `e_upms_login_log` VALUES (32, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-10 14:55:03', '0|0|0|内网IP|内网IP', 'Windows 10', 'PpR4f0Z0P5tMR2sD', 1);
INSERT INTO `e_upms_login_log` VALUES (33, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-10 15:36:10', '0|0|0|内网IP|内网IP', 'Windows 10', 'M9L9tUU5PJECAJ8v', 1);
INSERT INTO `e_upms_login_log` VALUES (34, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-11 11:19:52', '0|0|0|内网IP|内网IP', 'Windows 10', '5RRrbIffhBGdJzkt', 1);
INSERT INTO `e_upms_login_log` VALUES (35, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-11 15:43:31', '0|0|0|内网IP|内网IP', 'Windows 10', 'GvFWDFjLwN2sKVnq', 1);
INSERT INTO `e_upms_login_log` VALUES (36, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-13 20:00:40', '0|0|0|内网IP|内网IP', 'Windows 10', '4hTrMbAszrqeYtXk', 1);
INSERT INTO `e_upms_login_log` VALUES (37, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-13 20:16:21', '0|0|0|内网IP|内网IP', 'Windows 10', 'iBqmycvsnKezdFcX', 1);
INSERT INTO `e_upms_login_log` VALUES (38, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-14 10:04:16', '0|0|0|内网IP|内网IP', 'Windows 10', 'TQLOJclstPPGr7NB', 1);
INSERT INTO `e_upms_login_log` VALUES (39, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-14 10:57:18', '0|0|0|内网IP|内网IP', 'Windows 10', 'uyKw0XPe0MhEGEnP', 1);
INSERT INTO `e_upms_login_log` VALUES (40, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-14 11:39:11', '0|0|0|内网IP|内网IP', 'Windows 10', 'vOlbm1bJszzX6Usx', 1);
INSERT INTO `e_upms_login_log` VALUES (41, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-14 12:15:11', '0|0|0|内网IP|内网IP', 'Windows 10', 'HdtQIbeVXeXkpnDA', 1);
INSERT INTO `e_upms_login_log` VALUES (42, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-14 12:43:01', '0|0|0|内网IP|内网IP', 'Windows 10', '5nXqsZPcJg9KKxVk', 1);
INSERT INTO `e_upms_login_log` VALUES (43, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-14 12:46:31', '0|0|0|内网IP|内网IP', 'Windows 10', '1pM2MgDDrDHUUQEq', 1);
INSERT INTO `e_upms_login_log` VALUES (44, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-14 12:48:57', '0|0|0|内网IP|内网IP', 'Windows 10', 'adFWddxfVxtxB7Lm', 1);
INSERT INTO `e_upms_login_log` VALUES (45, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-14 12:53:35', '0|0|0|内网IP|内网IP', 'Windows 10', 'RlFPgREDriZ8WvZC', 1);
INSERT INTO `e_upms_login_log` VALUES (46, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-14 12:54:55', '0|0|0|内网IP|内网IP', 'Windows 10', '9VZrOdf2zDYvFU6S', 1);
INSERT INTO `e_upms_login_log` VALUES (47, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-14 12:57:56', '0|0|0|内网IP|内网IP', 'Windows 10', 'FQRs21TctRiz7iCl', 1);
INSERT INTO `e_upms_login_log` VALUES (48, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-14 13:02:58', '0|0|0|内网IP|内网IP', 'Windows 10', 'HdFF8OSVjzeYaAvR', 1);
INSERT INTO `e_upms_login_log` VALUES (49, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-14 14:47:54', '0|0|0|内网IP|内网IP', 'Windows 10', 'yhW2hda4o4OO2p0y', 1);
INSERT INTO `e_upms_login_log` VALUES (50, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-14 14:52:55', '0|0|0|内网IP|内网IP', 'Windows 10', 'MyD0HU7xtBUTu2cW', 1);
INSERT INTO `e_upms_login_log` VALUES (51, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-14 17:12:37', '0|0|0|内网IP|内网IP', 'Windows 10', 'e7YLjiwyoFtAfC9G', 1);
INSERT INTO `e_upms_login_log` VALUES (52, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-14 17:40:31', '0|0|0|内网IP|内网IP', 'Windows 10', 'GUoOc6ZtbrFc9Ydn', 1);
INSERT INTO `e_upms_login_log` VALUES (53, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-14 18:55:53', '0|0|0|内网IP|内网IP', 'Windows 10', 'MiMnsYuVj7Kjryiw', 1);
INSERT INTO `e_upms_login_log` VALUES (54, 'Chrome 9 92', 'Computer', '182.87.145.67', '2021-08-16 08:59:03', '中国|0|江西省|萍乡市|电信', 'Windows 10', '15ZLLmMZj7ESC3rB', 1);
INSERT INTO `e_upms_login_log` VALUES (55, 'Chrome 9 92', 'Computer', '182.87.145.67', '2021-08-16 09:59:21', '中国|0|江西省|萍乡市|电信', 'Windows 10', 'hjEeX59tDLnuDqia', 1);
INSERT INTO `e_upms_login_log` VALUES (56, 'Chrome 9 92', 'Computer', '182.87.145.67', '2021-08-16 16:23:51', '中国|0|江西省|萍乡市|电信', 'Windows 10', 'GT2aQSGVtbYtqWbZ', 1);
INSERT INTO `e_upms_login_log` VALUES (57, 'Chrome 9 91', 'Computer', '45.76.6.85', '2021-08-16 16:29:54', '美国|0|新泽西|0|0', 'Windows 10', 'KFLwZsvDKg5ciIDf', 1);
INSERT INTO `e_upms_login_log` VALUES (58, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-16 17:14:52', '0|0|0|内网IP|内网IP', 'Windows 10', 'AdhlbeYar14VbjpP', 1);
INSERT INTO `e_upms_login_log` VALUES (59, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-17 10:41:08', '0|0|0|内网IP|内网IP', 'Windows 10', 'ruIH3iOKsk5bTvSm', 1);
INSERT INTO `e_upms_login_log` VALUES (60, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-17 11:30:38', '0|0|0|内网IP|内网IP', 'Windows 10', 'f3Rt47eam9uiEZIC', 1);
INSERT INTO `e_upms_login_log` VALUES (61, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-17 12:14:28', '0|0|0|内网IP|内网IP', 'Windows 10', 'DIvLPJMAAdCiUiCU', 1);
INSERT INTO `e_upms_login_log` VALUES (62, 'Chrome 9 92', 'Computer', '45.76.6.85', '2021-08-17 15:46:26', '美国|0|新泽西|0|0', 'Windows 10', 'b8FpWwHbrC3VIYa3', 1);
INSERT INTO `e_upms_login_log` VALUES (63, 'Chrome 9 92', 'Computer', '45.76.6.85', '2021-08-17 17:07:33', '美国|0|新泽西|0|0', 'Windows 10', 'OH6HPM1zvw9k9kJt', 1);
INSERT INTO `e_upms_login_log` VALUES (64, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-17 20:33:43', '0|0|0|内网IP|内网IP', 'Windows 10', '9qavzhOkB4ZCuBL0', 1);
INSERT INTO `e_upms_login_log` VALUES (65, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-17 20:53:40', '0|0|0|内网IP|内网IP', 'Windows 10', 'ZSVICvQc60uezT4q', 1);
INSERT INTO `e_upms_login_log` VALUES (66, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-17 21:14:33', '0|0|0|内网IP|内网IP', 'Windows 10', 'LC7Dun86nWArrlI0', 1);
INSERT INTO `e_upms_login_log` VALUES (67, 'Chrome 8 88', 'Computer', '115.151.224.198', '2021-08-17 21:45:20', '中国|0|江西省|萍乡市|电信', 'Windows 10', 'lamP0UFJojE0OUU1', 1);
INSERT INTO `e_upms_login_log` VALUES (68, 'Chrome 9 91', 'Computer', '45.76.6.85', '2021-08-18 16:07:57', '美国|0|新泽西|0|0', 'Windows 10', 'eO8fMcKiTYuEenNv', 1);
INSERT INTO `e_upms_login_log` VALUES (69, 'Chrome 9 91', 'Computer', '45.76.6.85', '2021-08-19 11:36:18', '美国|0|新泽西|0|0', 'Windows 10', 'taC3sD46lCmD2zhi', 1);
INSERT INTO `e_upms_login_log` VALUES (70, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-19 12:47:47', '0|0|0|内网IP|内网IP', 'Windows 10', 'RldtYGng1XeA2BbZ', 1);
INSERT INTO `e_upms_login_log` VALUES (71, 'Chrome 9 92', 'Computer', '115.151.224.198', '2021-08-19 12:51:30', '中国|0|江西省|萍乡市|电信', 'Windows 10', 'yJ6ApAitswQV6xTc', 1);
INSERT INTO `e_upms_login_log` VALUES (72, 'Chrome 9 91', 'Computer', '45.76.6.85', '2021-08-19 13:42:26', '美国|0|新泽西|0|0', 'Windows 10', 'ZSpPyql4yQJj5vgs', 1);
INSERT INTO `e_upms_login_log` VALUES (73, 'Chrome 9 92', 'Computer', '115.151.224.198', '2021-08-19 15:42:36', '中国|0|江西省|萍乡市|电信', 'Windows 10', 'mOcFo8nZkagzAknc', 1);
INSERT INTO `e_upms_login_log` VALUES (74, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-19 19:32:29', '0|0|0|内网IP|内网IP', 'Windows 10', '5B3FpeJhAoJ5T6Kq', 1);
INSERT INTO `e_upms_login_log` VALUES (75, 'Chrome Mobile 92', 'Mobile', '192.168.1.112', '2021-08-19 20:22:52', '0|0|0|内网IP|内网IP', 'Android 6.x', 'byhPQIlphGTIhCdC', 1);
INSERT INTO `e_upms_login_log` VALUES (76, 'Chrome Mobile 92', 'Mobile', '192.168.1.112', '2021-08-19 20:35:09', '0|0|0|内网IP|内网IP', 'Android 6.x', 'Xuzc6XittmgG7nzC', 1);
INSERT INTO `e_upms_login_log` VALUES (77, 'Chrome 9 92', 'Computer', '182.87.170.134', '2021-08-19 21:20:50', '中国|0|江西省|萍乡市|电信', 'Windows 10', 'wDbJbg25qxKIOn7i', 1);
INSERT INTO `e_upms_login_log` VALUES (78, 'Chrome Mobile 92', 'Mobile', '192.168.1.112', '2021-08-19 21:21:24', '0|0|0|内网IP|内网IP', 'Android 6.x', '1JnQk2vwe0PE5fAz', 1);
INSERT INTO `e_upms_login_log` VALUES (79, 'Chrome 9 92', 'Computer', '182.87.170.134', '2021-08-20 14:13:09', '中国|0|江西省|萍乡市|电信', 'Windows 10', 'CjPgUEkAkUKA17Hi', 1);
INSERT INTO `e_upms_login_log` VALUES (80, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-20 15:39:28', '0|0|0|内网IP|内网IP', 'Windows 10', 'CT4X0jQsHNtVHlIZ', 1);
INSERT INTO `e_upms_login_log` VALUES (81, 'Chrome Mobile 92', 'Mobile', '192.168.1.112', '2021-08-20 15:48:08', '0|0|0|内网IP|内网IP', 'Android 6.x', '6KipaZkzm5ZCoWYM', 1);
INSERT INTO `e_upms_login_log` VALUES (82, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-20 16:05:24', '0|0|0|内网IP|内网IP', 'Windows 10', 'HZ41qDDBIXrEYr5L', 1);
INSERT INTO `e_upms_login_log` VALUES (83, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-20 16:17:14', '0|0|0|内网IP|内网IP', 'Windows 10', '8ml10aO8igz5TYtv', 3);
INSERT INTO `e_upms_login_log` VALUES (84, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-20 16:18:01', '0|0|0|内网IP|内网IP', 'Windows 10', '1uuwhuJfTpU3aYlz', 1);
INSERT INTO `e_upms_login_log` VALUES (85, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-20 16:27:30', '0|0|0|内网IP|内网IP', 'Windows 10', 'HOTGW3TVoGdjE6ZN', 3);
INSERT INTO `e_upms_login_log` VALUES (86, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-20 16:33:57', '0|0|0|内网IP|内网IP', 'Windows 10', 'sSdrg3zvoiMolEbv', 1);
INSERT INTO `e_upms_login_log` VALUES (87, 'Chrome Mobile 92', 'Mobile', '192.168.1.112', '2021-08-20 17:03:22', '0|0|0|内网IP|内网IP', 'Android 6.x', 'TWOB8o8amDugDyJw', 3);
INSERT INTO `e_upms_login_log` VALUES (88, 'Chrome Mobile 92', 'Mobile', '192.168.1.112', '2021-08-20 17:11:29', '0|0|0|内网IP|内网IP', 'Android 6.x', 'E9VTVX7bT4G5f2kz', 3);
INSERT INTO `e_upms_login_log` VALUES (89, 'Chrome Mobile 92', 'Mobile', '192.168.1.112', '2021-08-20 17:17:23', '0|0|0|内网IP|内网IP', 'Android 6.x', '7gQAYPCHsf1GM9Dy', 3);
INSERT INTO `e_upms_login_log` VALUES (90, 'Chrome Mobile 92', 'Mobile', '192.168.1.112', '2021-08-20 17:23:36', '0|0|0|内网IP|内网IP', 'Android 6.x', 'ghiWqG1BU26s2xS2', 3);
INSERT INTO `e_upms_login_log` VALUES (91, 'Chrome Mobile 92', 'Mobile', '192.168.1.112', '2021-08-20 17:26:05', '0|0|0|内网IP|内网IP', 'Android 6.x', '6S7FgHVUOqQgQNgh', 3);
INSERT INTO `e_upms_login_log` VALUES (92, 'Chrome Mobile 92', 'Mobile', '192.168.1.112', '2021-08-20 17:34:39', '0|0|0|内网IP|内网IP', 'Android 6.x', 'BEacfzozQ6Eh55gF', 3);
INSERT INTO `e_upms_login_log` VALUES (93, 'Chrome 9 92', 'Computer', '182.87.170.134', '2021-08-20 17:41:46', '中国|0|江西省|萍乡市|电信', 'Windows 10', 'hqYJnRdYPVLWKNyI', 3);
INSERT INTO `e_upms_login_log` VALUES (94, 'Chrome 9 91', 'Computer', '45.76.6.85', '2021-08-21 13:03:13', '美国|0|新泽西|0|0', 'Windows 10', 'DdbcjknUVtlag2TA', 1);
INSERT INTO `e_upms_login_log` VALUES (95, 'Chrome 9 92', 'Computer', '45.76.6.85', '2021-08-21 14:48:50', '美国|0|新泽西|0|0', 'Windows 10', 'RYYctU5RSvmN2RZQ', 1);
INSERT INTO `e_upms_login_log` VALUES (96, 'Chrome 9 91', 'Computer', '45.76.6.85', '2021-08-21 14:49:42', '美国|0|新泽西|0|0', 'Windows 10', 'WUaGbiRDEjbhEuhF', 1);
INSERT INTO `e_upms_login_log` VALUES (97, 'Chrome 9 92', 'Computer', '192.168.1.112', '2021-08-21 15:11:11', '0|0|0|内网IP|内网IP', 'Windows 10', 'k7yX68qZrAfHw34A', 1);
INSERT INTO `e_upms_login_log` VALUES (98, 'Chrome 9 92', 'Computer', '182.87.170.134', '2021-08-22 14:31:59', '中国|0|江西省|萍乡市|电信', 'Windows 10', 'rQDvnhaB37sEASEJ', 1);
INSERT INTO `e_upms_login_log` VALUES (99, 'Chrome 9 92', 'Computer', '182.87.170.134', '2021-08-22 14:32:46', '中国|0|江西省|萍乡市|电信', 'Windows 10', 'UncxIJ15k0B1L2yK', 1);
INSERT INTO `e_upms_login_log` VALUES (100, 'Chrome 9 92', 'Computer', '45.76.6.85', '2021-08-22 17:03:39', '美国|0|新泽西|0|0', 'Windows 10', 'cIROdQyxsQUo92Aj', 3);
INSERT INTO `e_upms_login_log` VALUES (101, 'Chrome 9 92', 'Computer', '45.76.6.85', '2021-08-22 20:17:17', '美国|0|新泽西|0|0', 'Windows 10', 'ndCdb32gt1NAQ9lu', 1);
INSERT INTO `e_upms_login_log` VALUES (102, 'Chrome 9 92', 'Computer', '45.76.6.85', '2021-08-22 21:49:12', '美国|0|新泽西|0|0', 'Windows 10', 'UnI5LBQIaEbm3AyN', 3);
INSERT INTO `e_upms_login_log` VALUES (103, 'Chrome 9 92', 'Computer', '45.76.6.85', '2021-08-23 14:09:30', '美国|0|新泽西|0|0', 'Windows 10', '82BdXF1AMs8oiGYK', 3);
INSERT INTO `e_upms_login_log` VALUES (104, 'Chrome 9 92', 'Computer', '45.76.6.85', '2021-08-23 14:09:56', '美国|0|新泽西|0|0', 'Windows 10', 'KrhUOhratnhey86I', 1);
INSERT INTO `e_upms_login_log` VALUES (105, 'Chrome 9 92', 'Computer', '117.136.81.21', '2021-08-23 14:19:27', '中国|0|湖北省|武汉市|移动', 'Windows 10', 'vfNrbTlY1FLyVKLU', 3);
INSERT INTO `e_upms_login_log` VALUES (106, 'Chrome 9 92', 'Computer', '124.152.182.76', '2021-08-23 14:20:30', '中国|0|甘肃省|庆阳市|联通', 'Windows 10', 'WUKDIfQSKkeCajYj', 3);
INSERT INTO `e_upms_login_log` VALUES (107, 'Chrome 9 92', 'Computer', '45.76.6.85', '2021-08-23 14:59:59', '美国|0|新泽西|0|0', 'Windows 10', '2K36InnRyfqfg287', 3);
INSERT INTO `e_upms_login_log` VALUES (108, 'Chrome 9 92', 'Computer', '124.152.182.76', '2021-08-23 15:07:13', '中国|0|甘肃省|庆阳市|联通', 'Windows 10', 'MmscQuqpUwXvkaor', 3);
INSERT INTO `e_upms_login_log` VALUES (109, 'Chrome 9 92', 'Computer', '45.76.6.85', '2021-08-23 19:09:05', '美国|0|新泽西|0|0', 'Windows 10', 'McmMtzTjtzDes9Kw', 1);
INSERT INTO `e_upms_login_log` VALUES (110, 'Chrome 9 92', 'Computer', '45.76.6.85', '2021-08-23 19:09:29', '美国|0|新泽西|0|0', 'Windows 10', 'EkZ6NOm6q8Ps7Uy1', 1);
INSERT INTO `e_upms_login_log` VALUES (111, 'Chrome 9 91', 'Computer', '45.76.6.85', '2021-08-24 11:06:22', '美国|0|新泽西|0|0', 'Windows 10', '6vGkGuBAKyFNL4TM', 1);
INSERT INTO `e_upms_login_log` VALUES (112, 'Chrome 9 91', 'Computer', '45.76.6.85', '2021-08-25 09:06:09', '美国|0|新泽西|0|0', 'Windows 10', 'Qd3gUYXZIlbRhCHs', 1);
INSERT INTO `e_upms_login_log` VALUES (113, 'Chrome 9 91', 'Computer', '45.76.6.85', '2021-08-31 19:49:32', '美国|0|新泽西|0|0', 'Windows 10', '4CRdQO6clgfs3VcM', 1);
INSERT INTO `e_upms_login_log` VALUES (114, 'Chrome 8 88', 'Computer', '117.150.7.24', '2021-09-07 18:25:30', '中国|0|湖北省|宜昌市|移动', 'Windows 10', 'AudQ4oCOKqzk31tt', 1);
INSERT INTO `e_upms_login_log` VALUES (115, 'Chrome 8 88', 'Computer', '117.150.7.24', '2021-09-07 18:31:02', '中国|0|湖北省|宜昌市|移动', 'Windows 10', 'VY5wfWbSAw4XX4wH', 1);
INSERT INTO `e_upms_login_log` VALUES (116, 'Chrome 8 88', 'Computer', '61.136.151.253', '2021-09-29 10:14:38', '中国|0|湖北省|宜昌市|电信', 'Windows 10', 'mIX0A6iinaX1GvVS', 1);
INSERT INTO `e_upms_login_log` VALUES (117, 'Chrome 9 92', 'Computer', '61.136.151.251', '2021-10-13 11:13:01', '中国|0|湖北省|宜昌市|电信', 'Windows 10', '2iYoKGhSJN9piB5J', 1);
INSERT INTO `e_upms_login_log` VALUES (118, 'Chrome 9 92', 'Computer', '117.150.6.209', '2021-10-26 21:06:21', '中国|0|湖北省|宜昌市|移动', 'Windows 10', 'Vfphc2HhUZB8nYDQ', 1);
INSERT INTO `e_upms_login_log` VALUES (119, 'Chrome 10 105', 'Computer', '10.98.184.1', '2023-04-20 18:47:03', '0|0|0|内网IP|内网IP', 'Windows 10', 'EeMiWu0ELZbHpY0k', 3);
INSERT INTO `e_upms_login_log` VALUES (120, 'Chrome 10 105', 'Computer', '10.98.184.1', '2023-04-20 19:16:25', '0|0|0|内网IP|内网IP', 'Windows 10', 'X1rAaKGBb6cmroZZ', 3);
INSERT INTO `e_upms_login_log` VALUES (121, 'Chrome 10 105', 'Computer', '10.98.184.1', '2023-04-21 13:08:48', '0|0|0|内网IP|内网IP', 'Windows 10', 'jf33uultHw6lbVqu', 3);
INSERT INTO `e_upms_login_log` VALUES (122, 'Chrome 10 105', 'Computer', '10.98.184.1', '2023-04-21 19:29:08', '0|0|0|内网IP|内网IP', 'Windows 10', 'hbaVP0CircTBGdVi', 3);
INSERT INTO `e_upms_login_log` VALUES (123, 'Chrome 10 105', 'Computer', '10.98.184.1', '2023-04-21 19:37:46', '0|0|0|内网IP|内网IP', 'Windows 10', 'sBGwjK4zyMtAtlkS', 3);
INSERT INTO `e_upms_login_log` VALUES (124, 'Chrome 10 105', 'Computer', '10.98.184.1', '2023-04-21 20:53:55', '0|0|0|内网IP|内网IP', 'Windows 10', 'cL0W4oVlCh9kCc4s', 3);
INSERT INTO `e_upms_login_log` VALUES (125, 'Chrome 9 96', 'Computer', '172.24.92.94', '2023-04-28 17:19:44', '0|0|0|内网IP|内网IP', 'Windows 10', 'ZTD3HDKJCxSzSfdB', 2);
INSERT INTO `e_upms_login_log` VALUES (126, 'Chrome 10 105', 'Computer', '2.0.0.1', '2023-04-29 16:44:32', '法国|0|Loire|0|橘子电信', 'Windows 10', 'MijtOC1F30YJ1eAO', 3);

-- ----------------------------
-- Table structure for e_upms_menu
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_menu`;
CREATE TABLE `e_upms_menu`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `param` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `power_off` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `sort` int(0) NULL DEFAULT NULL,
  `status` int(0) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `create_user_id` bigint(0) NULL DEFAULT NULL,
  `update_user_id` bigint(0) NULL DEFAULT NULL,
  `parent_menu_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK95xpkppt33d2bka0g2d7rgwqt`(`code`) USING BTREE,
  INDEX `FK4p5siq6l1rf9y47bosayghcsv`(`create_user_id`) USING BTREE,
  INDEX `FKtm66wffkyyluinneyva8kd2bc`(`update_user_id`) USING BTREE,
  INDEX `FK5mkgea183mm02v7ic1pdwxy5s`(`parent_menu_id`) USING BTREE,
  CONSTRAINT `FK4p5siq6l1rf9y47bosayghcsv` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK5mkgea183mm02v7ic1pdwxy5s` FOREIGN KEY (`parent_menu_id`) REFERENCES `e_upms_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKtm66wffkyyluinneyva8kd2bc` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of e_upms_menu
-- ----------------------------
INSERT INTO `e_upms_menu` VALUES (3, '2021-08-09 11:01:39', '2021-08-20 16:24:10', '$manager', 'fa fa-cogs', '系统管理', NULL, NULL, 30, 1, NULL, NULL, NULL, 1, NULL);
INSERT INTO `e_upms_menu` VALUES (4, '2021-08-09 11:01:39', NULL, 'EruptMenu', 'fa fa-list-ul', '菜单维护', NULL, NULL, 10, 1, 'tree', 'EruptMenu', NULL, NULL, 3);
INSERT INTO `e_upms_menu` VALUES (5, '2021-08-09 11:01:39', NULL, 'EruptRole', NULL, '角色维护', NULL, NULL, 20, 1, 'table', 'EruptRole', NULL, NULL, 3);
INSERT INTO `e_upms_menu` VALUES (6, '2021-08-09 11:01:39', NULL, 'EruptOrg', 'fa fa-users', '组织维护', NULL, NULL, 30, 1, 'tree', 'EruptOrg', NULL, NULL, 3);
INSERT INTO `e_upms_menu` VALUES (7, '2021-08-09 11:01:39', NULL, 'EruptPost', 'fa fa-id-card', '岗位维护', NULL, NULL, 35, 1, 'table', 'EruptPost', NULL, NULL, 3);
INSERT INTO `e_upms_menu` VALUES (8, '2021-08-09 11:01:39', NULL, 'EruptUser', 'fa fa-user', '用户维护', NULL, NULL, 40, 1, 'table', 'EruptUser', NULL, NULL, 3);
INSERT INTO `e_upms_menu` VALUES (9, '2021-08-09 11:01:39', NULL, 'EruptDict', NULL, '字典维护', NULL, NULL, 50, 1, 'table', 'EruptDict', NULL, NULL, 3);
INSERT INTO `e_upms_menu` VALUES (10, '2021-08-09 11:01:39', NULL, 'EruptDictItem', NULL, '字典项', NULL, NULL, 10, 2, 'table', 'EruptDictItem', NULL, NULL, 9);
INSERT INTO `e_upms_menu` VALUES (11, '2021-08-09 11:01:39', NULL, 'EruptLoginLog', NULL, '登录日志', NULL, NULL, 60, 1, 'table', 'EruptLoginLog', NULL, NULL, 3);
INSERT INTO `e_upms_menu` VALUES (12, '2021-08-09 11:01:39', NULL, 'EruptOperateLog', NULL, '操作日志', NULL, NULL, 70, 1, 'table', 'EruptOperateLog', NULL, NULL, 3);
INSERT INTO `e_upms_menu` VALUES (13, '2021-08-09 12:07:21', '2021-08-20 16:24:06', 'menu1', NULL, '通用签到考勤系统', NULL, NULL, 80, 2, 'tpl', 'menu1', 1, 1, NULL);
INSERT INTO `e_upms_menu` VALUES (14, '2021-08-09 12:08:28', '2021-08-20 16:22:43', 'User', 'fa fa-user-circle ', '用户管理', NULL, NULL, 90, 1, 'table', 'User', 1, 1, NULL);
INSERT INTO `e_upms_menu` VALUES (15, '2021-08-09 12:08:54', '2021-08-20 16:22:40', 'SignLog', 'fa fa-history', '签到日志', NULL, NULL, 100, 1, 'table', 'SignLog', 1, 1, NULL);
INSERT INTO `e_upms_menu` VALUES (16, '2021-08-09 12:09:27', '2021-08-20 16:22:36', 'SystemVariables', 'fa fa-wrench', '系统变量', NULL, NULL, 110, 1, 'table', 'SystemVariables', 1, 1, NULL);
INSERT INTO `e_upms_menu` VALUES (17, '2021-08-14 10:46:17', '2021-08-20 16:22:47', 'Group', 'fa fa-database', '基础数据管理', NULL, NULL, 85, 1, 'table', 'Group', 1, 1, NULL);
INSERT INTO `e_upms_menu` VALUES (20, '2021-08-20 16:23:42', '2021-08-20 16:23:48', 'home', 'fa fa-home', '首页', NULL, NULL, 20, 1, 'router', '/', 1, 1, NULL);

-- ----------------------------
-- Table structure for e_upms_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_operate_log`;
CREATE TABLE `e_upms_operate_log`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `api_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `error_info` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `ip` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `region` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `req_addr` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `req_method` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `req_param` varchar(5000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT NULL,
  `total_time` bigint(0) NULL DEFAULT NULL,
  `erupt_user_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK27xepkxthq9snq3yk6k7iad33`(`erupt_user_id`) USING BTREE,
  CONSTRAINT `FK27xepkxthq9snq3yk6k7iad33` FOREIGN KEY (`erupt_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 256 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of e_upms_operate_log
-- ----------------------------
INSERT INTO `e_upms_operate_log` VALUES (1, '新增 | 生成Erupt代码', '2021-08-09 11:17:34', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/GeneratorClass', 'POST', '{\"name\":\"用户信息\",\"className\":\"User\",\"tableName\":\"user\",\"fields\":[{\"fieldName\":\"realName\",\"showName\":\"用户姓名\",\"sort\":1,\"type\":\"INPUT\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-240},{\"fieldName\":\"userGroup\",\"showName\":\"用户组\",\"sort\":1,\"type\":\"NUMBER\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-449}]}', b'1', 5363, 1);
INSERT INTO `e_upms_operate_log` VALUES (2, '修改 | 生成Erupt代码', '2021-08-09 11:21:23', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"用户信息\",\"className\":\"User\",\"tableName\":\"user\",\"fields\":[{\"fieldName\":\"realName\",\"showName\":\"用户姓名\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":1,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"userGroup\",\"showName\":\"用户组\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":2,\"type\":\"NUMBER\",\"isShow\":true},{\"fieldName\":\"stuId\",\"showName\":\"学号\",\"sort\":1,\"type\":\"NUMBER\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-462},{\"fieldName\":\"status\",\"showName\":\"状态[0游客，1激活，2禁用]\",\"sort\":2,\"type\":\"CHOICE\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-718},{\"fieldName\":\"faceImg\",\"showName\":\"人脸上传\",\"sort\":1,\"type\":\"INPUT\",\"query\":false,\"sortable\":false,\"notNull\":false,\"isShow\":true,\"id\":-96},{\"fieldName\":\"touchId\",\"showName\":\"指纹Id\",\"sort\":1,\"type\":\"NUMBER\",\"query\":false,\"sortable\":false,\"notNull\":false,\"isShow\":true,\"id\":-705}],\"id\":1}', b'1', 610, 1);
INSERT INTO `e_upms_operate_log` VALUES (3, '新增 | 生成Erupt代码', '2021-08-09 11:29:03', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/GeneratorClass', 'POST', '{\"name\":\"签到统计\",\"className\":\"SignLog\",\"tableName\":\"sign_log\",\"fields\":[{\"fieldName\":\"UserName\",\"showName\":\"姓名\",\"sort\":1,\"type\":\"INPUT\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-849},{\"fieldName\":\"userGroup\",\"showName\":\"课题组\",\"sort\":1,\"type\":\"INPUT\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-727},{\"fieldName\":\"data\",\"showName\":\"日期\",\"sort\":1,\"type\":\"DATE\",\"query\":true,\"sortable\":true,\"notNull\":true,\"isShow\":true,\"id\":-331},{\"fieldName\":\"inTime\",\"showName\":\"进入时间\",\"sort\":2,\"type\":\"TIME\",\"query\":false,\"sortable\":true,\"notNull\":true,\"isShow\":true,\"id\":-513},{\"fieldName\":\"outTime\",\"showName\":\"离开时间\",\"sort\":2,\"type\":\"TIME\",\"query\":false,\"sortable\":true,\"notNull\":false,\"isShow\":true,\"id\":-614},{\"fieldName\":\"toDo\",\"showName\":\"事由\",\"sort\":3,\"type\":\"CHOICE\",\"query\":true,\"sortable\":false,\"notNull\":false,\"isShow\":true,\"id\":-886},{\"fieldName\":\"msg\",\"showName\":\"备注\",\"sort\":3,\"type\":\"INPUT\",\"query\":false,\"sortable\":false,\"notNull\":false,\"isShow\":true,\"id\":-938},{\"fieldName\":\"signTime\",\"showName\":\"停留时间(h)\",\"sort\":4,\"type\":\"SLIDER\",\"query\":false,\"sortable\":false,\"notNull\":false,\"isShow\":true,\"id\":-208}]}', b'1', 622, 1);
INSERT INTO `e_upms_operate_log` VALUES (4, '新增 | 生成Erupt代码', '2021-08-09 11:51:52', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/GeneratorClass', 'POST', '{\"name\":\"系统变量\",\"className\":\"SystemVariables\",\"tableName\":\"system_variables\",\"fields\":[{\"fieldName\":\"key\",\"showName\":\"键\",\"sort\":1,\"type\":\"INPUT\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-617},{\"fieldName\":\"value\",\"showName\":\"值\",\"sort\":2,\"type\":\"INPUT\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-102}]}', b'1', 253, 1);
INSERT INTO `e_upms_operate_log` VALUES (5, '新增 | 菜单配置', '2021-08-09 12:07:21', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptMenu', 'POST', '{\"code\":\"menu1\",\"name\":\"通用签到考勤系统\",\"status\":\"1\",\"type\":\"tpl\",\"value\":\"menu1\",\"sort\":80}', b'1', 211, 1);
INSERT INTO `e_upms_operate_log` VALUES (6, '新增 | 菜单配置', '2021-08-09 12:08:28', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptMenu', 'POST', '{\"code\":\"User\",\"name\":\"用户管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"User\",\"sort\":90,\"parentMenu\":{\"id\":13,\"name\":\"通用签到考勤系统\"}}', b'1', 241, 1);
INSERT INTO `e_upms_operate_log` VALUES (7, '新增 | 菜单配置', '2021-08-09 12:08:55', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptMenu', 'POST', '{\"code\":\"SignLog\",\"name\":\"签到日志\",\"status\":\"1\",\"type\":\"table\",\"value\":\"SignLog\",\"sort\":100,\"parentMenu\":{\"id\":13,\"name\":\"通用签到考勤系统\"}}', b'1', 203, 1);
INSERT INTO `e_upms_operate_log` VALUES (8, '新增 | 菜单配置', '2021-08-09 12:09:27', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptMenu', 'POST', '{\"code\":\"SystemVariables\",\"name\":\"系统变量\",\"status\":\"1\",\"type\":\"table\",\"value\":\"SystemVariables\",\"sort\":110,\"parentMenu\":{\"id\":13,\"name\":\"通用签到考勤系统\"}}', b'1', 230, 1);
INSERT INTO `e_upms_operate_log` VALUES (9, '新增 | 用户信息', '2021-08-09 12:14:32', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/User', 'POST', '{\"realName\":\"测试用户\",\"userGroup\":1,\"stuId\":2019112404,\"faceImg\":\"/2021-08-09/ezapGoCcpSka.txt\",\"touchId\":1,\"status\":\"1\"}', b'1', 196, 1);
INSERT INTO `e_upms_operate_log` VALUES (10, '导出Excel | 用户信息', '2021-08-09 12:15:06', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/excel/export/User', 'POST', '_erupt=[User]\n_token=[Oq457GxxeUxQPTQ6]\ncondition=[%5B%5D]\n', b'1', 1644, 1);
INSERT INTO `e_upms_operate_log` VALUES (11, '导出Excel | 用户信息', '2021-08-09 12:15:25', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/excel/export/User', 'POST', '_erupt=[User]\n_token=[Oq457GxxeUxQPTQ6]\ncondition=[%5B%5D]\n', b'1', 215, 1);
INSERT INTO `e_upms_operate_log` VALUES (12, '导入Excel | 用户信息', '2021-08-09 12:16:47', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/excel/import/User', 'POST', NULL, b'1', 413, 1);
INSERT INTO `e_upms_operate_log` VALUES (13, '新增 | 签到统计', '2021-08-09 12:19:40', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SignLog', 'POST', '{\"UserName\":\"李灵智\",\"userGroup\":\"1\",\"data\":\"2021-08-09\",\"inTime\":\"12:17:22\",\"outTime\":\"12:17:59\",\"toDo\":\"xxx\",\"signTime\":1}', b'1', 146, 1);
INSERT INTO `e_upms_operate_log` VALUES (14, '新增 | 系统变量', '2021-08-09 12:23:55', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'POST', '{\"myKey\":\"toDO\",\"myValue\":\"[\\r\\n    \\\"学习\\\",\\r\\n    \\\"实验\\\",\\r\\n    \\\"请教问题\\\",\\r\\n    \\\"杂物打理\\\"\\r\\n]\"}', b'1', 146, 1);
INSERT INTO `e_upms_operate_log` VALUES (15, '新增 | 系统变量', '2021-08-09 12:24:50', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'POST', '{\"myKey\":\"userStatus\",\"myValue\":\"[\\r\\n    \\\"游客\\\",\\r\\n    \\\"激活\\\",\\r\\n    \\\"禁用\\\"\\r\\n]\"}', b'1', 149, 1);
INSERT INTO `e_upms_operate_log` VALUES (16, '新增 | 系统变量', '2021-08-09 13:37:40', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'POST', '{\"myKey\":\"userGroup\",\"myValue\":\"[\\r\\n    0: \\\"开发课题组\\\",\\r\\n    1: \\\"硬件课题组\\\",\\r\\n    2: \\\"算法课题组\\\"\\r\\n]\"}', b'1', 202, 1);
INSERT INTO `e_upms_operate_log` VALUES (17, '修改 | 生成Erupt代码', '2021-08-09 17:35:43', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"用户信息\",\"className\":\"User\",\"tableName\":\"user\",\"fields\":[{\"fieldName\":\"realName\",\"showName\":\"用户姓名\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":1,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"userGroup\",\"showName\":\"用户组\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":2,\"type\":\"NUMBER\",\"isShow\":true},{\"fieldName\":\"stuId\",\"showName\":\"学号\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":3,\"type\":\"NUMBER\",\"isShow\":true},{\"fieldName\":\"faceImg\",\"showName\":\"人脸上传\",\"sort\":1,\"type\":\"BOOLEAN\",\"query\":false,\"sortable\":false,\"notNull\":false,\"isShow\":true,\"id\":5},{\"fieldName\":\"touchId\",\"showName\":\"指纹Id\",\"notNull\":false,\"query\":false,\"sort\":1,\"sortable\":false,\"id\":6,\"type\":\"NUMBER\",\"isShow\":true},{\"fieldName\":\"status\",\"showName\":\"状态[0游客，1激活，2禁用]\",\"notNull\":true,\"query\":true,\"sort\":2,\"sortable\":false,\"id\":4,\"type\":\"CHOICE\",\"isShow\":true}],\"id\":1}', b'1', 330, 1);
INSERT INTO `e_upms_operate_log` VALUES (18, '修改 | 用户信息', '2021-08-09 18:27:03', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"高质量男性\",\"userGroup\":\"1\",\"stuId\":2012404,\"status\":\"0\",\"id\":2}', b'1', 150, 1);
INSERT INTO `e_upms_operate_log` VALUES (19, '修改 | 用户信息', '2021-08-09 20:57:51', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"测试用户\",\"userGroup\":\"1\",\"stuId\":2019112404,\"touchId\":1,\"status\":\"1\",\"id\":1}', b'1', 266, 1);
INSERT INTO `e_upms_operate_log` VALUES (20, '修改 | 用户信息', '2021-08-09 20:58:11', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"李灵\",\"userGroup\":\"1\",\"stuId\":20112404,\"status\":\"0\",\"id\":3}', b'1', 211, 1);
INSERT INTO `e_upms_operate_log` VALUES (21, '修改 | 用户信息', '2021-08-09 20:58:15', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"灵智\",\"userGroup\":\"1\",\"stuId\":201911204,\"status\":\"0\",\"id\":5}', b'1', 247, 1);
INSERT INTO `e_upms_operate_log` VALUES (22, '修改 | 用户信息', '2021-08-09 20:58:18', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"测试用户\",\"userGroup\":\"1\",\"stuId\":2019112404,\"faceId\":\"50139fadc89518d86324c0c24356201a\",\"touchId\":1,\"status\":\"1\",\"id\":1}', b'1', 216, 1);
INSERT INTO `e_upms_operate_log` VALUES (23, '修改 | 用户信息', '2021-08-09 20:58:35', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"李灵智\",\"userGroup\":\"1\",\"stuId\":2019112404,\"faceId\":\"50139fadc89518d86324c0c24356201a\",\"touchId\":1,\"status\":\"1\",\"id\":1}', b'1', 206, 1);
INSERT INTO `e_upms_operate_log` VALUES (24, '修改 | 用户信息', '2021-08-09 20:58:40', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"高质量男性\",\"userGroup\":\"1\",\"stuId\":2012404,\"status\":\"0\",\"id\":2}', b'1', 221, 1);
INSERT INTO `e_upms_operate_log` VALUES (25, '修改 | 用户信息', '2021-08-09 20:58:49', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"随便找的boy\",\"userGroup\":\"1\",\"stuId\":20112404,\"status\":\"0\",\"id\":3}', b'1', 207, 1);
INSERT INTO `e_upms_operate_log` VALUES (26, '导出Excel | 用户信息', '2021-08-09 21:00:18', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/excel/export/User', 'POST', '_erupt=[User]\n_token=[vywgn0FHQHfx1TPv]\ncondition=[%5B%5D]\n', b'1', 1237, 1);
INSERT INTO `e_upms_operate_log` VALUES (27, '新增 | 用户', '2021-08-09 21:06:26', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptUser', 'POST', '{\"account\":\"404name\",\"name\":\"李灵智\",\"status\":true,\"eruptMenu\":{\"id\":\"14\",\"name\":\"用户管理\"},\"passwordA\":\"123456\",\"passwordB\":\"123456\",\"isMd5\":true}', b'1', 242, 1);
INSERT INTO `e_upms_operate_log` VALUES (28, '新增 | 用户角色', '2021-08-09 21:07:49', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptRole', 'POST', '{\"code\":\"admin\",\"name\":\"普通管理员\",\"status\":true,\"menus\":[{\"id\":\"13\"},{\"id\":\"14\"},{\"id\":\"15\"},{\"id\":\"16\"}],\"users\":[{\"id\":\"2\"}]}', b'1', 307, 1);
INSERT INTO `e_upms_operate_log` VALUES (29, '修改 | 用户信息', '2021-08-09 21:08:19', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"测试用户\",\"userGroup\":\"1\",\"stuId\":201911404,\"status\":\"0\",\"id\":4}', b'1', 226, 2);
INSERT INTO `e_upms_operate_log` VALUES (30, '修改 | 用户信息', '2021-08-09 21:08:24', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"李灵智\",\"userGroup\":\"0\",\"stuId\":2019112404,\"faceId\":\"0056acac40284a1ee703d2c5d9bab03b\",\"touchId\":1,\"status\":\"1\",\"id\":1}', b'1', 210, 2);
INSERT INTO `e_upms_operate_log` VALUES (31, '修改 | 用户信息', '2021-08-09 21:08:31', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"随便找的boy\",\"userGroup\":\"2\",\"stuId\":20112404,\"status\":\"0\",\"id\":3}', b'1', 216, 2);
INSERT INTO `e_upms_operate_log` VALUES (32, '修改 | 签到统计', '2021-08-09 21:09:58', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SignLog', 'PUT', '{\"UserName\":\"李灵智\",\"userGroup\":\"1\",\"date\":\"2021-08-09\",\"inTime\":\"12:17:22\",\"outTime\":\"12:17:59\",\"toDo\":\"xxx\",\"signTime\":\"1\",\"id\":1}', b'1', 222, 2);
INSERT INTO `e_upms_operate_log` VALUES (33, '修改 | 签到统计', '2021-08-09 21:11:11', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SignLog', 'PUT', '{\"UserName\":\"李灵智\",\"userGroup\":\"1\",\"date\":\"2021-08-09\",\"inTime\":\"12:17:22\",\"outTime\":\"12:17:59\",\"toDo\":\"xxx\",\"signTime\":\"1.0\",\"id\":1}', b'1', 221, 2);
INSERT INTO `e_upms_operate_log` VALUES (34, '修改 | 签到统计', '2021-08-09 21:13:05', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SignLog', 'PUT', '{\"UserName\":\"李灵智\",\"userGroup\":\"1\",\"date\":\"2021-08-09\",\"inTime\":\"12:17:22\",\"outTime\":\"12:17:59\",\"toDo\":\"0\",\"signTime\":\"1.0\",\"id\":1}', b'1', 288, 2);
INSERT INTO `e_upms_operate_log` VALUES (35, '修改 | 系统变量', '2021-08-09 21:13:18', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"toDO\",\"myValue\":\"[学习,实验,请教问题,杂物打理,其他]\",\"id\":1}', b'1', 232, 2);
INSERT INTO `e_upms_operate_log` VALUES (36, '修改 | 签到统计', '2021-08-09 21:13:38', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SignLog', 'PUT', '{\"UserName\":\"李灵智\",\"userGroup\":\"1\",\"date\":\"2021-08-09\",\"inTime\":\"12:17:22\",\"outTime\":\"12:17:59\",\"toDo\":\"0\",\"signTime\":\"1.0\",\"id\":1}', b'1', 235, 2);
INSERT INTO `e_upms_operate_log` VALUES (37, '修改 | 签到统计', '2021-08-09 21:13:45', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SignLog', 'PUT', '{\"UserName\":\"李灵智\",\"userGroup\":\"1\",\"date\":\"2021-08-09\",\"inTime\":\"12:17:22\",\"outTime\":\"12:17:59\",\"toDo\":\"0\",\"signTime\":\"1.5\",\"id\":1}', b'1', 221, 2);
INSERT INTO `e_upms_operate_log` VALUES (38, '新增 | 签到统计', '2021-08-09 21:16:24', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SignLog', 'POST', '{\"UserName\":\"李灵智\",\"userGroup\":\"0\",\"date\":\"2021-08-10\",\"inTime\":\"21:15:50\",\"outTime\":\"21:59:50\",\"toDo\":\"0\",\"msg\":\"无\",\"signTime\":\"2.0\"}', b'1', 172, 2);
INSERT INTO `e_upms_operate_log` VALUES (39, '修改 | 签到统计', '2021-08-09 21:16:30', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SignLog', 'PUT', '{\"UserName\":\"李灵智\",\"userGroup\":\"1\",\"date\":\"2021-08-09\",\"inTime\":\"12:17:22\",\"outTime\":\"12:17:59\",\"toDo\":\"0\",\"signTime\":\"1.5\",\"id\":1}', b'1', 226, 2);
INSERT INTO `e_upms_operate_log` VALUES (40, '导入Excel | 签到统计', '2021-08-09 21:19:40', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/excel/import/SignLog', 'POST', NULL, b'1', 434, 2);
INSERT INTO `e_upms_operate_log` VALUES (41, '批量删除 | 签到统计', '2021-08-09 21:20:30', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SignLog', 'DELETE', 'ids=[3, 4, 5, 6]\n', b'1', 573, 2);
INSERT INTO `e_upms_operate_log` VALUES (42, '导入Excel | 签到统计', '2021-08-09 21:20:48', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/excel/import/SignLog', 'POST', NULL, b'1', 5322, 2);
INSERT INTO `e_upms_operate_log` VALUES (43, '修改 | 签到统计', '2021-08-09 21:24:16', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SignLog', 'PUT', '{\"UserName\":\"李灵智\",\"userGroup\":\"0\",\"date\":\"2021-08-10\",\"inTime\":\"07:00:00\",\"outTime\":\"08:00:00\",\"toDo\":\"1\",\"msg\":\"无\",\"signTime\":\"3\",\"id\":8}', b'1', 224, 2);
INSERT INTO `e_upms_operate_log` VALUES (44, '导出Excel | 签到统计', '2021-08-09 21:24:32', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/excel/export/SignLog', 'POST', '_erupt=[SignLog]\n_token=[REzPYH2E17RjtXkm]\ncondition=[%5B%5D]\n', b'1', 1109, 2);
INSERT INTO `e_upms_operate_log` VALUES (45, '修改 | 系统变量', '2021-08-10 15:07:50', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"userGroup\",\"myValue\":\"[{\\\"lable\\\":\\\"开发课题组\\\",\\\"value\\\":1},{\\\"lable\\\":\\\"硬件课题组\\\",\\\"value\\\":2},{\\\"lable\\\":\\\"算法课题组\\\",\\\"value\\\":3}]\",\"id\":3}', b'1', 50189, 1);
INSERT INTO `e_upms_operate_log` VALUES (46, '修改 | 系统变量', '2021-08-10 15:08:08', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"userGroup\",\"myValue\":\"[{\\\"lable\\\":\\\"开发课题组\\\",\\\"value\\\":1},{\\\"lable\\\":\\\"硬件课题组\\\",\\\"value\\\":2},{\\\"lable\\\":\\\"算法课题组\\\",\\\"value\\\":3}]\",\"id\":3}', b'1', 298, 1);
INSERT INTO `e_upms_operate_log` VALUES (47, '修改 | 系统变量', '2021-08-10 15:09:14', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"userStatus\",\"myValue\":\"\\r\\n[{\\\"lable\\\":\\\"游客\\\",\\\"value\\\":1},{\\\"lable\\\":\\\"激活\\\",\\\"value\\\":2},{\\\"lable\\\":\\\"禁用\\\",\\\"value\\\":3}]\",\"id\":2}', b'1', 222, 1);
INSERT INTO `e_upms_operate_log` VALUES (48, '修改 | 系统变量', '2021-08-10 15:10:16', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"toDO\",\"myValue\":\"[{\\\"lable\\\":\\\"学习\\\",\\\"value\\\":1},\\r\\n{\\\"lable\\\":\\\"实验\\\",\\\"value\\\":2},\\r\\n{\\\"lable\\\":\\\"请教问题\\\",\\\"value\\\":3},\\r\\n{\\\"lable\\\":\\\"杂物打理\\\",\\\"value\\\":4},\\r\\n{\\\"lable\\\":\\\"其他\\\",\\\"value\\\":5}]\",\"id\":1}', b'1', 218, 1);
INSERT INTO `e_upms_operate_log` VALUES (49, '修改 | 系统变量', '2021-08-10 15:30:07', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"toDO\",\"myValue\":\"[\\\"学习\\\",\\\"实验\\\",\\\"请教问题\\\",\\\"杂物打理\\\"，\\\"其他\\\"]\",\"id\":1}', b'1', 221, 1);
INSERT INTO `e_upms_operate_log` VALUES (50, '修改 | 系统变量', '2021-08-10 15:30:26', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"userStatus\",\"myValue\":\"[\\\"游客\\\",\\\"激活\\\",\\\"禁用\\\"]\",\"id\":2}', b'1', 215, 1);
INSERT INTO `e_upms_operate_log` VALUES (51, '修改 | 系统变量', '2021-08-10 15:30:55', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"userGroup\",\"myValue\":\"[\\\"开发课题组\\\",\\\"硬件课题组\\\",\\\"算法课题组\\\"]\",\"id\":3}', b'1', 224, 1);
INSERT INTO `e_upms_operate_log` VALUES (52, '修改 | 系统变量', '2021-08-10 15:31:51', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"feedbackList\",\"myValue\":\"[\\\"测试\\\",\\\"哈哈\\\",\\\"哈哈\\\",\\\"芜湖\\\"]\",\"id\":6}', b'1', 242, 1);
INSERT INTO `e_upms_operate_log` VALUES (53, '修改 | 系统变量', '2021-08-10 15:32:16', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"unit\",\"myValue\":\"[\\\"研发部\\\",\\\"市场部\\\",\\\"后勤部\\\"]\",\"id\":7}', b'1', 211, 1);
INSERT INTO `e_upms_operate_log` VALUES (54, '修改 | 系统变量', '2021-08-10 15:36:54', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"toDO\",\"name\":\"事由表\",\"myValue\":\"[\\\"学习\\\",\\\"实验\\\",\\\"请教问题\\\",\\\"杂物打理\\\"，\\\"其他\\\"]\",\"id\":1}', b'1', 324, 1);
INSERT INTO `e_upms_operate_log` VALUES (55, '修改 | 系统变量', '2021-08-10 15:37:16', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"userStatus\",\"name\":\"用户状态表\",\"myValue\":\"[\\\"游客\\\",\\\"激活\\\",\\\"禁用\\\"]\",\"id\":2}', b'1', 241, 1);
INSERT INTO `e_upms_operate_log` VALUES (56, '修改 | 系统变量', '2021-08-10 15:37:30', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"userGroup\",\"name\":\"用户课题组\",\"myValue\":\"[\\\"开发课题组\\\",\\\"硬件课题组\\\",\\\"算法课题组\\\"]\",\"id\":3}', b'1', 241, 1);
INSERT INTO `e_upms_operate_log` VALUES (57, '修改 | 系统变量', '2021-08-10 15:37:45', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"startTime\",\"name\":\"打卡起止时间\",\"myValue\":\"08:00:00\",\"id\":4}', b'1', 244, 1);
INSERT INTO `e_upms_operate_log` VALUES (58, '修改 | 系统变量', '2021-08-10 15:37:57', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"leaveTime\",\"name\":\"默认结束时间\",\"myValue\":\"22:00:00\",\"id\":5}', b'1', 231, 1);
INSERT INTO `e_upms_operate_log` VALUES (59, '修改 | 系统变量', '2021-08-10 15:38:06', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"feedbackList\",\"name\":\"用户反馈表\",\"myValue\":\"[\\\"测试\\\",\\\"哈哈\\\",\\\"哈哈\\\",\\\"芜湖\\\"]\",\"id\":6}', b'1', 234, 1);
INSERT INTO `e_upms_operate_log` VALUES (60, '修改 | 系统变量', '2021-08-10 15:38:15', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"unit\",\"name\":\"单位表\",\"myValue\":\"[\\\"研发部\\\",\\\"市场部\\\",\\\"后勤部\\\"]\",\"id\":7}', b'1', 257, 1);
INSERT INTO `e_upms_operate_log` VALUES (61, '修改 | 系统变量', '2021-08-10 15:46:59', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"unit\",\"name\":\"单位表\",\"myValue\":\"[\\\"研发部\\\",\\\"市场部\\\",\\\"后勤部\\\",\\\"办公部\\\"]\",\"id\":7}', b'1', 215, 1);
INSERT INTO `e_upms_operate_log` VALUES (62, '修改 | 系统变量', '2021-08-10 15:47:53', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"toDO\",\"name\":\"事由表\",\"myValue\":\"[\\\"学习\\\",\\\"实验\\\",\\\"请教问题\\\",\\\"杂物打理\\\",\\\"其他\\\"]\",\"id\":1}', b'1', 213, 1);
INSERT INTO `e_upms_operate_log` VALUES (63, '导出Excel | 签到统计', '2021-08-11 11:21:44', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/excel/export/SignLog', 'POST', '_erupt=[SignLog]\n_token=[5RRrbIffhBGdJzkt]\ncondition=[%5B%5D]\n', b'1', 1389, 1);
INSERT INTO `e_upms_operate_log` VALUES (64, '新增 | 生成Erupt代码', '2021-08-11 15:44:38', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/GeneratorClass', 'POST', '{\"name\":\"test\",\"className\":\"test\",\"tableName\":\"test\",\"fields\":[{\"fieldName\":\"test\",\"showName\":\"test\",\"sort\":1,\"type\":\"TAGS\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-734}]}', b'1', 394, 1);
INSERT INTO `e_upms_operate_log` VALUES (65, '修改 | 系统变量', '2021-08-13 20:02:33', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"unit\",\"name\":\"单位表\",\"myValue\":\"[\\\"研发部\\\",\\\"市场部\\\",\\\"后勤部\\\",\\\"办公部\\\",\\\"测试\\\"]\",\"id\":7}', b'1', 269, 1);
INSERT INTO `e_upms_operate_log` VALUES (66, '修改 | 生成Erupt代码', '2021-08-14 10:13:26', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"用户信息\",\"className\":\"User\",\"tableName\":\"user\",\"fields\":[{\"fieldName\":\"realName\",\"showName\":\"用户姓名\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":1,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"userGroup\",\"showName\":\"用户组\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":2,\"type\":\"NUMBER\",\"isShow\":true},{\"fieldName\":\"stuId\",\"showName\":\"学号\",\"sort\":1,\"type\":\"NUMBER\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":false,\"id\":3},{\"fieldName\":\"faceImg\",\"showName\":\"人脸上传\",\"notNull\":false,\"query\":false,\"sort\":1,\"sortable\":false,\"id\":5,\"type\":\"BOOLEAN\",\"isShow\":true},{\"fieldName\":\"touchId\",\"showName\":\"指纹Id\",\"notNull\":false,\"query\":false,\"sort\":1,\"sortable\":false,\"id\":6,\"type\":\"NUMBER\",\"isShow\":true},{\"fieldName\":\"status\",\"showName\":\"状态[0游客，1激活，2禁用]\",\"notNull\":true,\"query\":true,\"sort\":2,\"sortable\":false,\"id\":4,\"type\":\"CHOICE\",\"isShow\":true}],\"id\":1}', b'1', 310, 1);
INSERT INTO `e_upms_operate_log` VALUES (67, '修改 | 系统变量', '2021-08-14 10:14:39', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"userStatus\",\"name\":\"用户状态表\",\"myValue\":\"[\\\"访客\\\",\\\"未授权用户\\\",\\\"已录入人脸信息\\\"]\",\"id\":2}', b'1', 205, 1);
INSERT INTO `e_upms_operate_log` VALUES (68, '新增 | 生成Erupt代码', '2021-08-14 10:26:42', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/GeneratorClass', 'POST', '{\"name\":\"单位及课题组管理\",\"className\":\"Group\",\"tableName\":\"group\",\"fields\":[{\"fieldName\":\"groupClass\",\"showName\":\"类别\",\"sort\":1,\"type\":\"CHOICE\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-595},{\"fieldName\":\"name\",\"showName\":\"组别名\",\"sort\":1,\"type\":\"INPUT\",\"query\":false,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-936},{\"fieldName\":\"message\",\"showName\":\"组别信息\",\"sort\":3,\"type\":\"INPUT\",\"query\":false,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-885}]}', b'1', 327, 1);
INSERT INTO `e_upms_operate_log` VALUES (69, '新增 | 菜单配置', '2021-08-14 10:46:17', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptMenu', 'POST', '{\"code\":\"Group\",\"name\":\"组别管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"Group\",\"sort\":120,\"parentMenu\":{\"id\":\"13\",\"name\":\"通用签到考勤系统\"}}', b'1', 209, 1);
INSERT INTO `e_upms_operate_log` VALUES (70, '新增 | 菜单配置', '2021-08-14 10:46:46', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptMenu', 'POST', '{\"code\":\"Visitor\",\"name\":\"访客管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"Visitor\",\"sort\":130,\"parentMenu\":{\"id\":\"13\",\"name\":\"通用签到考勤系统\"}}', b'1', 208, 1);
INSERT INTO `e_upms_operate_log` VALUES (71, '新增 | 菜单配置', '2021-08-14 10:50:04', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptMenu', 'POST', '{\"status\":\"1\",\"sort\":140}', b'1', 123, 1);
INSERT INTO `e_upms_operate_log` VALUES (72, '删除 | 菜单配置', '2021-08-14 10:50:37', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptMenu/18', 'DELETE', NULL, b'1', 322, 1);
INSERT INTO `e_upms_operate_log` VALUES (73, '修改 | 系统变量', '2021-08-14 10:53:14', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"userStatus\",\"name\":\"用户状态表[请勿改动]\",\"myValue\":\"[\\\"访客\\\",\\\"未授权用户\\\",\\\"已录入人脸信息\\\",\\\"禁用\\\"]\",\"id\":2}', b'1', 215, 1);
INSERT INTO `e_upms_operate_log` VALUES (74, '新增 | 单位及课题组管理', '2021-08-14 10:57:54', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/Group', 'POST', '{\"groupClass\":\"1\",\"name\":\"后勤部\",\"message\":\"后勤集团\"}', b'1', 195, 1);
INSERT INTO `e_upms_operate_log` VALUES (75, '新增 | 单位及课题组管理', '2021-08-14 10:58:14', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/Group', 'POST', '{\"groupClass\":\"1\",\"name\":\"开发部\",\"message\":\"开发网站\"}', b'1', 147, 1);
INSERT INTO `e_upms_operate_log` VALUES (76, '新增 | 单位及课题组管理', '2021-08-14 10:58:51', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/Group', 'POST', '{\"groupClass\":\"2\",\"name\":\"李碧涛老师课题组\",\"message\":\"Java课程设计\"}', b'1', 162, 1);
INSERT INTO `e_upms_operate_log` VALUES (77, '新增 | 单位及课题组管理', '2021-08-14 10:59:18', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/Group', 'POST', '{\"groupClass\":\"2\",\"name\":\"李翔老师课题组\",\"message\":\"暑期实践答辩设计\"}', b'1', 141, 1);
INSERT INTO `e_upms_operate_log` VALUES (78, '新增 | 单位及课题组管理', '2021-08-14 10:59:37', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/Group', 'POST', '{\"groupClass\":\"3\",\"name\":\"临时访客\",\"message\":\"临时访客\"}', b'1', 148, 1);
INSERT INTO `e_upms_operate_log` VALUES (79, '新增 | 单位及课题组管理', '2021-08-14 11:00:30', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/Group', 'POST', '{\"groupClass\":\"3\",\"name\":\"短期访客\",\"message\":\"短期访问\"}', b'1', 147, 1);
INSERT INTO `e_upms_operate_log` VALUES (80, '修改 | 用户信息', '2021-08-14 11:01:00', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"李灵智\",\"unit\":\"1\",\"userGroup\":\"3\",\"faceId\":\"0056acac40284a1ee703d2c5d9bab03b\",\"status\":\"2\",\"id\":1}', b'1', 237, 1);
INSERT INTO `e_upms_operate_log` VALUES (81, '修改 | 用户信息', '2021-08-14 11:01:32', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"杨澳宇\",\"unit\":\"2\",\"userGroup\":\"4\",\"faceId\":\"e69aa8e122a69e6dd4da5804a7bdefec\",\"status\":\"2\",\"id\":2}', b'1', 245, 1);
INSERT INTO `e_upms_operate_log` VALUES (82, '修改 | 系统变量', '2021-08-14 11:02:26', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"userStatus\",\"name\":\"用户状态表[请勿改动]\",\"myValue\":\"[\\\"访客\\\",\\\"未授权用户\\\",\\\"已录入人脸信息\\\"]\",\"id\":2}', b'1', 245, 1);
INSERT INTO `e_upms_operate_log` VALUES (83, '修改 | 用户信息', '2021-08-14 11:39:26', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"李灵智\",\"unit\":\"1\",\"group\":{\"id\":\"2\",\"name\":\"开发部\"},\"faceId\":\"0056acac40284a1ee703d2c5d9bab03b\",\"status\":true,\"id\":1}', b'1', 264, 1);
INSERT INTO `e_upms_operate_log` VALUES (84, '修改 | 菜单配置', '2021-08-14 11:41:13', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptMenu', 'PUT', '{\"code\":\"Group\",\"name\":\"组别管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"Group\",\"sort\":105,\"parentMenu\":{\"id\":13,\"name\":\"通用签到考勤系统\"},\"id\":17}', b'1', 297, 1);
INSERT INTO `e_upms_operate_log` VALUES (85, '修改 | 生成Erupt代码', '2021-08-14 11:49:50', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"用户信息\",\"className\":\"User\",\"tableName\":\"user\",\"fields\":[{\"fieldName\":\"realName\",\"showName\":\"用户姓名\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":1,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"userGroup\",\"showName\":\"用户组\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":2,\"type\":\"NUMBER\",\"isShow\":true},{\"fieldName\":\"stuId\",\"showName\":\"学号\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":3,\"type\":\"NUMBER\",\"isShow\":false},{\"fieldName\":\"faceImg\",\"showName\":\"人脸上传\",\"notNull\":false,\"query\":false,\"sort\":1,\"sortable\":false,\"id\":5,\"type\":\"BOOLEAN\",\"isShow\":true},{\"fieldName\":\"touchId\",\"showName\":\"指纹Id\",\"notNull\":false,\"query\":false,\"sort\":1,\"sortable\":false,\"id\":6,\"type\":\"NUMBER\",\"isShow\":true},{\"fieldName\":\"status\",\"showName\":\"状态[0游客，1激活，2禁用]\",\"notNull\":true,\"query\":true,\"sort\":2,\"sortable\":false,\"id\":4,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"expiredTime\",\"showName\":\"失效时间\",\"sort\":3,\"type\":\"DATE_TIME\",\"query\":false,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-265}],\"id\":1}', b'1', 328, 1);
INSERT INTO `e_upms_operate_log` VALUES (86, '修改 | 系统变量', '2021-08-14 11:57:20', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"groupClass\",\"name\":\"组别管理类别\",\"myValue\":\"[\\\"单位管理\\\"\\\",\\\"课题组管理\\\",\\\"游客类别管理\\\",\\\"事由管理\\\"]\",\"id\":3}', b'1', 220, 1);
INSERT INTO `e_upms_operate_log` VALUES (87, '修改 | 系统变量', '2021-08-14 11:57:30', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"groupClass\",\"name\":\"组别管理类别[请勿修改]\",\"myValue\":\"[\\\"单位管理\\\"\\\",\\\"课题组管理\\\",\\\"游客类别管理\\\",\\\"事由管理\\\"]\",\"id\":3}', b'1', 226, 1);
INSERT INTO `e_upms_operate_log` VALUES (88, '新增 | 菜单配置', '2021-08-14 12:14:29', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptMenu', 'POST', '{\"code\":\"Visitor\",\"name\":\"访客管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"Visitor\",\"sort\":105,\"parentMenu\":{\"id\":\"13\",\"name\":\"通用签到考勤系统\"}}', b'1', 242, 1);
INSERT INTO `e_upms_operate_log` VALUES (89, '修改 | 用户信息', '2021-08-14 12:58:17', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"灵智\",\"status\":false,\"unit\":\"1\",\"userGroup\":\"3\",\"expiredTime\":\"2021-08-22 12:58:14\",\"id\":5}', b'1', 256, 1);
INSERT INTO `e_upms_operate_log` VALUES (90, '修改 | 系统变量', '2021-08-14 12:59:07', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"groupClass\",\"name\":\"组别管理类别[请勿修改]\",\"myValue\":\"[\\\"单位管理\\\",\\\"课题组管理\\\",\\\"游客类别管理\\\",\\\"事由管理\\\"]\",\"id\":3}', b'1', 202, 1);
INSERT INTO `e_upms_operate_log` VALUES (91, '新增 | 访客信息', '2021-08-14 13:01:29', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/Visitor', 'POST', '{\"realName\":\"测试\",\"visitorGroup\":\"5\",\"telphone\":3,\"expiredTime\":\"2021-08-14 13:01:25\"}', b'1', 156, 1);
INSERT INTO `e_upms_operate_log` VALUES (92, '修改 | 签到统计', '2021-08-14 13:02:05', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SignLog', 'PUT', '{\"userName\":\"李灵智\",\"unit\":\"1\",\"userGroup\":\"3\",\"date\":\"2021-08-09\",\"inTime\":\"12:17:22\",\"outTime\":\"12:17:59\",\"toDo\":\"0\",\"signTime\":\"1.5\",\"fromUserId\":1,\"id\":1}', b'1', 216, 1);
INSERT INTO `e_upms_operate_log` VALUES (93, '修改 | 签到统计', '2021-08-14 13:02:12', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SignLog', 'PUT', '{\"userName\":\"李灵智\",\"unit\":\"1\",\"userGroup\":\"4\",\"date\":\"2021-08-10\",\"inTime\":\"21:15:50\",\"outTime\":\"21:59:50\",\"toDo\":\"0\",\"msg\":\"无\",\"signTime\":\"2.0\",\"fromUserId\":1,\"id\":2}', b'1', 232, 1);
INSERT INTO `e_upms_operate_log` VALUES (94, '删除 | 系统变量', '2021-08-14 13:03:24', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables/1', 'DELETE', NULL, b'1', 254, 1);
INSERT INTO `e_upms_operate_log` VALUES (95, '新增 | 单位及课题组管理', '2021-08-14 13:03:46', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/Group', 'POST', '{\"groupClass\":\"3\",\"name\":\"实验\",\"message\":\"进行实验内容\"}', b'1', 156, 1);
INSERT INTO `e_upms_operate_log` VALUES (96, '新增 | 单位及课题组管理', '2021-08-14 13:04:17', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/Group', 'POST', '{\"groupClass\":\"3\",\"name\":\"其他\",\"message\":\"其他\"}', b'1', 141, 1);
INSERT INTO `e_upms_operate_log` VALUES (97, '修改 | 签到统计', '2021-08-14 13:06:43', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SignLog', 'PUT', '{\"userName\":\"李灵智\",\"unit\":\"1\",\"userGroup\":\"3\",\"date\":\"2021-08-09\",\"inTime\":\"12:17:22\",\"outTime\":\"12:17:59\",\"toDo\":\"7\",\"signTime\":\"1.5\",\"fromUserId\":1,\"id\":1}', b'1', 239, 1);
INSERT INTO `e_upms_operate_log` VALUES (98, '修改 | 签到统计', '2021-08-14 13:06:50', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SignLog', 'PUT', '{\"userName\":\"李灵智\",\"unit\":\"1\",\"userGroup\":\"4\",\"date\":\"2021-08-10\",\"inTime\":\"21:15:50\",\"outTime\":\"21:59:50\",\"toDo\":\"8\",\"msg\":\"无\",\"signTime\":\"2.0\",\"fromUserId\":1,\"id\":2}', b'1', 213, 1);
INSERT INTO `e_upms_operate_log` VALUES (99, '修改 | 签到统计', '2021-08-14 13:07:00', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SignLog', 'PUT', '{\"userName\":\"李灵智\",\"unit\":\"1\",\"userGroup\":\"0\",\"date\":\"2021-08-10\",\"inTime\":\"12:00:00\",\"outTime\":\"15:00:00\",\"toDo\":\"8\",\"msg\":\"无\",\"signTime\":\"3\",\"fromUserId\":1,\"id\":7}', b'1', 206, 1);
INSERT INTO `e_upms_operate_log` VALUES (100, '修改 | 签到统计', '2021-08-14 13:07:10', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SignLog', 'PUT', '{\"userName\":\"李灵智\",\"unit\":\"2\",\"userGroup\":\"3\",\"date\":\"2021-08-12\",\"inTime\":\"07:00:00\",\"outTime\":\"08:00:00\",\"toDo\":\"7\",\"msg\":\"无\",\"signTime\":\"3\",\"fromUserId\":1,\"id\":9}', b'1', 211, 1);
INSERT INTO `e_upms_operate_log` VALUES (101, '修改 | 签到统计', '2021-08-14 13:07:15', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SignLog', 'PUT', '{\"userName\":\"李灵智\",\"unit\":\"1\",\"userGroup\":\"0\",\"date\":\"2021-08-13\",\"inTime\":\"07:00:00\",\"outTime\":\"08:00:00\",\"toDo\":\"7\",\"msg\":\"无\",\"signTime\":\"3\",\"fromUserId\":1,\"id\":10}', b'1', 211, 1);
INSERT INTO `e_upms_operate_log` VALUES (102, '修改 | 签到统计', '2021-08-14 13:07:20', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SignLog', 'PUT', '{\"userName\":\"李灵智\",\"unit\":\"1\",\"userGroup\":\"0\",\"date\":\"2021-08-10\",\"inTime\":\"16:14:30\",\"outTime\":\"16:21:23\",\"toDo\":\"8\",\"msg\":\"签到\",\"signTime\":\"0.5\",\"fromUserId\":1,\"id\":11}', b'1', 204, 1);
INSERT INTO `e_upms_operate_log` VALUES (103, '修改 | 用户信息', '2021-08-14 14:55:07', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"李灵智\",\"status\":true,\"unit\":\"1\",\"userGroup\":\"3\",\"telphone\":2147483647,\"email\":\"1308964967@qq.com\",\"faceId\":\"0056acac40284a1ee703d2c5d9bab03b\",\"expiredTime\":\"2021-08-28 14:58:59\",\"id\":1}', b'1', 246, 1);
INSERT INTO `e_upms_operate_log` VALUES (104, '修改 | 菜单配置', '2021-08-14 15:07:30', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptMenu', 'PUT', '{\"code\":\"Visitor\",\"name\":\"访客管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"Visitor\",\"sort\":95,\"parentMenu\":{\"id\":13,\"name\":\"通用签到考勤系统\"},\"id\":19}', b'1', 279, 1);
INSERT INTO `e_upms_operate_log` VALUES (105, '修改 | 用户信息', '2021-08-14 17:12:52', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"李灵智\",\"signState\":false,\"status\":true,\"unit\":\"1\",\"userGroup\":\"3\",\"telphone\":2147483647,\"email\":\"1308964967@qq.com\",\"faceId\":\"0056acac40284a1ee703d2c5d9bab03b\",\"expiredTime\":\"2021-08-28 14:58:59\",\"id\":1}', b'1', 258, 1);
INSERT INTO `e_upms_operate_log` VALUES (106, '修改 | 用户信息', '2021-08-14 17:13:07', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"李灵智\",\"signState\":true,\"status\":true,\"unit\":\"1\",\"userGroup\":\"3\",\"telphone\":2147483647,\"email\":\"1308964967@qq.com\",\"faceId\":\"0056acac40284a1ee703d2c5d9bab03b\",\"expiredTime\":\"2021-08-28 14:58:59\",\"id\":1}', b'1', 237, 1);
INSERT INTO `e_upms_operate_log` VALUES (107, '修改 | 用户信息', '2021-08-14 17:13:11', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"杨澳宇\",\"signState\":true,\"status\":true,\"unit\":\"2\",\"userGroup\":\"4\",\"faceId\":\"e69aa8e122a69e6dd4da5804a7bdefec\",\"id\":2}', b'1', 135, 1);
INSERT INTO `e_upms_operate_log` VALUES (108, '修改 | 用户信息', '2021-08-14 17:13:19', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"杨澳宇\",\"signState\":false,\"status\":true,\"unit\":\"2\",\"userGroup\":\"4\",\"faceId\":\"e69aa8e122a69e6dd4da5804a7bdefec\",\"expiredTime\":\"2021-08-29 17:13:13\",\"id\":2}', b'1', 221, 1);
INSERT INTO `e_upms_operate_log` VALUES (109, '修改 | 签到统计', '2021-08-14 17:13:50', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SignLog', 'PUT', '{\"userName\":\"李灵智\",\"userClass\":true,\"unit\":\"1\",\"userGroup\":\"3\",\"date\":\"2021-08-09\",\"inTime\":\"12:17:22\",\"outTime\":\"12:17:59\",\"toDo\":\"7\",\"signTime\":\"1.5\",\"fromUserId\":1,\"id\":1}', b'1', 231, 1);
INSERT INTO `e_upms_operate_log` VALUES (110, '修改 | 签到统计', '2021-08-14 17:21:02', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SignLog', 'PUT', '{\"userName\":\"李灵智\",\"userClass\":true,\"unit\":\"1\",\"userGroup\":\"4\",\"date\":\"2021-08-10\",\"inTime\":\"12:00:00\",\"outTime\":\"15:00:00\",\"toDo\":\"8\",\"msg\":\"无\",\"signTime\":\"3\",\"fromUserId\":1,\"id\":7}', b'1', 203, 1);
INSERT INTO `e_upms_operate_log` VALUES (111, '修改 | 系统变量', '2021-08-14 17:45:41', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"leaveTime\",\"name\":\"默认结束时间\",\"myValue\":\"17:48:00\",\"id\":5}', b'1', 248, 1);
INSERT INTO `e_upms_operate_log` VALUES (112, '修改 | 访客信息', '2021-08-14 18:56:10', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/Visitor', 'PUT', '{\"realName\":\"测试\",\"visitorGroup\":\"5\",\"telphone\":3,\"signState\":true,\"expiredTime\":\"2021-08-14 13:01:25\",\"id\":1}', b'1', 237, 1);
INSERT INTO `e_upms_operate_log` VALUES (113, '修改 | 访客信息', '2021-08-14 18:56:13', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/Visitor', 'PUT', '{\"realName\":\"测试\",\"visitorGroup\":\"5\",\"telphone\":3,\"signState\":false,\"expiredTime\":\"2021-08-14 13:01:25\",\"id\":1}', b'1', 222, 1);
INSERT INTO `e_upms_operate_log` VALUES (114, '修改 | 系统变量', '2021-08-16 09:49:08', NULL, '182.87.145.67', '中国|0|江西省|萍乡市|电信', 'http://sign.404name.top/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"leaveTime\",\"name\":\"默认结束时间\",\"myValue\":\"09:50:00\",\"id\":5}', b'1', 78, 1);
INSERT INTO `e_upms_operate_log` VALUES (115, '修改 | 系统变量', '2021-08-16 09:51:06', NULL, '182.87.145.67', '中国|0|江西省|萍乡市|电信', 'http://sign.404name.top/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"leaveTime\",\"name\":\"默认结束时间【第二天生效】\",\"myValue\":\"22:00:00\",\"id\":5}', b'1', 37, 1);
INSERT INTO `e_upms_operate_log` VALUES (116, '删除 | 签到统计', '2021-08-16 09:59:52', NULL, '182.87.145.67', '中国|0|江西省|萍乡市|电信', 'http://sign.404name.top/erupt-api/data/modify/SignLog/22', 'DELETE', NULL, b'1', 104, 1);
INSERT INTO `e_upms_operate_log` VALUES (117, '批量删除 | 签到统计', '2021-08-16 10:00:05', NULL, '182.87.145.67', '中国|0|江西省|萍乡市|电信', 'http://sign.404name.top/erupt-api/data/modify/SignLog', 'DELETE', 'ids=[21, 24]\n', b'1', 67, 1);
INSERT INTO `e_upms_operate_log` VALUES (118, '新增 | 系统变量', '2021-08-17 10:41:46', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'POST', '{\"myKey\":\"signInPost\",\"name\":\"登录推送[0|1]\",\"myValue\":\"1\"}', b'1', 177, 1);
INSERT INTO `e_upms_operate_log` VALUES (119, '新增 | 系统变量', '2021-08-17 10:42:04', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'POST', '{\"myKey\":\"signOutPost\",\"name\":\"签退推送[0|1]\",\"myValue\":\"1\"}', b'1', 156, 1);
INSERT INTO `e_upms_operate_log` VALUES (120, '新增 | 系统变量', '2021-08-17 10:42:37', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'POST', '{\"myKey\":\"wxPostToken\",\"name\":\"pushplus密钥\",\"myValue\":\"dd7d6bfce36340c7af8c9704596067c4\"}', b'1', 191, 1);
INSERT INTO `e_upms_operate_log` VALUES (121, '删除 | 系统变量', '2021-08-17 10:43:15', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables/7', 'DELETE', NULL, b'1', 236, 1);
INSERT INTO `e_upms_operate_log` VALUES (122, '修改 | 系统变量', '2021-08-17 10:43:33', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"userStatus\",\"name\":\"用户状态表【请勿改动】\",\"myValue\":\"[\\\"访客\\\",\\\"未授权用户\\\",\\\"已录入人脸信息\\\"]\",\"id\":2}', b'1', 229, 1);
INSERT INTO `e_upms_operate_log` VALUES (123, '修改 | 系统变量', '2021-08-17 10:43:37', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"groupClass\",\"name\":\"组别管理类别【请勿修改】\",\"myValue\":\"[\\\"单位管理\\\",\\\"课题组管理\\\",\\\"游客类别管理\\\",\\\"事由管理\\\"]\",\"id\":3}', b'1', 231, 1);
INSERT INTO `e_upms_operate_log` VALUES (124, '修改 | 系统变量', '2021-08-17 11:31:10', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"wxPushToken\",\"name\":\"pushplus密钥\",\"myValue\":\"dd7d6bfce36340c7af8c9704596067c4\",\"id\":10}', b'1', 217, 1);
INSERT INTO `e_upms_operate_log` VALUES (125, '新增 | 系统变量', '2021-08-17 11:32:49', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'POST', '{\"myKey\":\"orderImg\",\"name\":\"微信推送订阅二维码\",\"myValue\":\"https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQHd8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyWldMX1V6Q1BjbkQxMDAwMHcwN1QAAgStLRthAwQAAAAA\"}', b'1', 145, 1);
INSERT INTO `e_upms_operate_log` VALUES (126, '新增 | 系统变量', '2021-08-17 12:15:13', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/SystemVariables', 'POST', '{\"myKey\":\"wxPushGroupId\",\"name\":\"微信推送用户群识别Id\",\"myValue\":\"signIn\"}', b'1', 142, 1);
INSERT INTO `e_upms_operate_log` VALUES (127, '修改 | 系统变量', '2021-08-17 17:10:49', NULL, '45.76.6.85', '美国|0|新泽西|0|0', 'http://sign.404name.top/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"groupClass\",\"name\":\"组别管理类别【请勿修改】\",\"myValue\":\"[\\\"部门管理\\\",\\\"课题组管理\\\",\\\"游客类别管理\\\",\\\"事由管理\\\"]\",\"id\":3}', b'1', 157, 1);
INSERT INTO `e_upms_operate_log` VALUES (128, '修改 | 菜单配置', '2021-08-17 17:16:25', NULL, '45.76.6.85', '美国|0|新泽西|0|0', 'http://sign.404name.top/erupt-api/data/modify/EruptMenu', 'PUT', '{\"code\":\"Group\",\"name\":\"基础数据管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"Group\",\"sort\":85,\"parentMenu\":{\"id\":13,\"name\":\"通用签到考勤系统\"},\"id\":17}', b'1', 113, 1);
INSERT INTO `e_upms_operate_log` VALUES (129, '修改 | 系统变量', '2021-08-17 17:36:40', NULL, '45.76.6.85', '美国|0|新泽西|0|0', 'http://sign.404name.top/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"groupClass\",\"name\":\"组别管理类别【请勿修改】\",\"myValue\":\"[\\\"部门管理\\\",\\\"课题组管理\\\",\\\"用户类型管理\\\",\\\"事由管理\\\"]\",\"id\":3}', b'1', 46, 1);
INSERT INTO `e_upms_operate_log` VALUES (130, '修改 | 单位及课题组管理', '2021-08-17 17:37:04', NULL, '45.76.6.85', '美国|0|新泽西|0|0', 'http://sign.404name.top/erupt-api/data/modify/Group', 'PUT', '{\"groupClass\":\"2\",\"name\":\"访客\",\"message\":\"临时访客\",\"id\":5}', b'1', 43, 1);
INSERT INTO `e_upms_operate_log` VALUES (131, '新增 | 单位及课题组管理', '2021-08-17 17:37:46', NULL, '45.76.6.85', '美国|0|新泽西|0|0', 'http://sign.404name.top/erupt-api/data/modify/Group', 'POST', '{\"groupClass\":\"2\",\"name\":\"工作人员\",\"message\":\"工作人员\"}', b'1', 52, 1);
INSERT INTO `e_upms_operate_log` VALUES (132, '修改 | 单位及课题组管理', '2021-08-17 17:39:27', NULL, '45.76.6.85', '美国|0|新泽西|0|0', 'http://sign.404name.top/erupt-api/data/modify/Group', 'PUT', '{\"groupClass\":\"2\",\"name\":\"学生\",\"message\":\"学生\",\"id\":6}', b'1', 39, 1);
INSERT INTO `e_upms_operate_log` VALUES (133, '修改 | 单位及课题组管理', '2021-08-17 17:39:40', NULL, '45.76.6.85', '美国|0|新泽西|0|0', 'http://sign.404name.top/erupt-api/data/modify/Group', 'PUT', '{\"groupClass\":\"2\",\"name\":\"访客\",\"message\":\"访客\",\"id\":5}', b'1', 54, 1);
INSERT INTO `e_upms_operate_log` VALUES (134, '修改 | 用户信息', '2021-08-17 20:34:37', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"杨澳宇\",\"signState\":true,\"status\":true,\"unitGroup\":\"1\",\"classGroup\":\"3\",\"userGroup\":\"5\",\"faceId\":\"42d84e2cb033dfc3ae1b2d943abd13b2\",\"expiredTime\":\"2021-08-29 17:13:13\",\"id\":2}', b'1', 243, 1);
INSERT INTO `e_upms_operate_log` VALUES (135, '删除 | 菜单配置', '2021-08-17 20:35:39', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptMenu/19', 'DELETE', NULL, b'1', 304, 1);
INSERT INTO `e_upms_operate_log` VALUES (136, '修改 | 用户信息', '2021-08-17 20:36:25', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"李灵智\",\"signState\":false,\"status\":true,\"unitGroup\":\"1\",\"classGroup\":\"3\",\"userGroup\":\"6\",\"telphone\":2147483647,\"email\":\"1308964967@qq.com\",\"faceId\":\"309e8411f79827f093e27803c10a8c86\",\"expiredTime\":\"2021-08-28 14:58:59\",\"id\":1}', b'1', 235, 1);
INSERT INTO `e_upms_operate_log` VALUES (137, '修改 | 用户信息', '2021-08-17 20:36:29', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"杨澳宇\",\"signState\":true,\"status\":true,\"unitGroup\":\"2\",\"classGroup\":\"5\",\"userGroup\":\"6\",\"faceId\":\"42d84e2cb033dfc3ae1b2d943abd13b2\",\"expiredTime\":\"2021-08-29 17:13:13\",\"id\":2}', b'1', 233, 1);
INSERT INTO `e_upms_operate_log` VALUES (138, '修改 | 用户信息', '2021-08-17 20:36:57', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"杨澳宇\",\"signState\":true,\"status\":true,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"6\",\"faceId\":\"42d84e2cb033dfc3ae1b2d943abd13b2\",\"expiredTime\":\"2021-08-29 17:13:13\",\"id\":2}', b'1', 211, 1);
INSERT INTO `e_upms_operate_log` VALUES (139, '修改 | 用户信息', '2021-08-17 20:38:35', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"随便找的boy\",\"signState\":true,\"status\":false,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"6\",\"id\":3}', b'1', 117, 1);
INSERT INTO `e_upms_operate_log` VALUES (140, '修改 | 用户信息', '2021-08-17 20:38:41', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"随便找的boy\",\"signState\":true,\"status\":false,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"6\",\"expiredTime\":\"2021-08-18 20:38:36\",\"id\":3}', b'1', 214, 1);
INSERT INTO `e_upms_operate_log` VALUES (141, '修改 | 用户信息', '2021-08-17 20:38:55', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"测试用户\",\"signState\":false,\"status\":false,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"6\",\"id\":4}', b'1', 114, 1);
INSERT INTO `e_upms_operate_log` VALUES (142, '修改 | 用户信息', '2021-08-17 20:39:02', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"测试用户\",\"signState\":false,\"status\":false,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"5\",\"expiredTime\":\"2021-08-16 20:38:58\",\"id\":4}', b'1', 214, 1);
INSERT INTO `e_upms_operate_log` VALUES (143, '修改 | 用户信息', '2021-08-17 20:39:11', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"灵智\",\"signState\":false,\"status\":false,\"unitGroup\":\"1\",\"classGroup\":\"3\",\"userGroup\":\"5\",\"expiredTime\":\"2021-08-18 12:58:14\",\"id\":5}', b'1', 224, 1);
INSERT INTO `e_upms_operate_log` VALUES (144, '修改 | 用户信息', '2021-08-17 21:47:25', NULL, '115.151.224.198', '中国|0|江西省|萍乡市|电信', 'http://sign.404name.top/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"灵智\",\"signState\":false,\"status\":false,\"unitGroup\":\"2\",\"classGroup\":\"3\",\"userGroup\":\"5\",\"expiredTime\":\"2021-08-18 12:58:14\",\"id\":5}', b'1', 153, 1);
INSERT INTO `e_upms_operate_log` VALUES (145, '修改 | 签到统计', '2021-08-17 21:47:58', NULL, '115.151.224.198', '中国|0|江西省|萍乡市|电信', 'http://sign.404name.top/erupt-api/data/modify/SignLog', 'PUT', '{\"userName\":\"随便找的boy\",\"date\":\"2021-08-17\",\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"5\",\"inTime\":\"15:33:35\",\"toDo\":\"7\",\"fromUserId\":3,\"id\":29}', b'1', 74, 1);
INSERT INTO `e_upms_operate_log` VALUES (146, '修改 | 签到统计', '2021-08-17 21:48:12', NULL, '115.151.224.198', '中国|0|江西省|萍乡市|电信', 'http://sign.404name.top/erupt-api/data/modify/SignLog', 'PUT', '{\"userName\":\"灵智\",\"date\":\"2021-08-17\",\"unitGroup\":\"1\",\"classGroup\":\"3\",\"userGroup\":\"6\",\"signTime\":\"0.5\",\"inTime\":\"21:17:08\",\"outTime\":\"21:20:40\",\"fromUserId\":5,\"id\":32}', b'1', 41, 1);
INSERT INTO `e_upms_operate_log` VALUES (147, '删除 | 签到统计', '2021-08-17 21:48:41', NULL, '115.151.224.198', '中国|0|江西省|萍乡市|电信', 'http://sign.404name.top/erupt-api/data/modify/SignLog/27', 'DELETE', NULL, b'1', 85, 1);
INSERT INTO `e_upms_operate_log` VALUES (148, '删除 | 签到统计', '2021-08-17 21:49:04', NULL, '115.151.224.198', '中国|0|江西省|萍乡市|电信', 'http://sign.404name.top/erupt-api/data/modify/SignLog/25', 'DELETE', NULL, b'1', 37, 1);
INSERT INTO `e_upms_operate_log` VALUES (149, '删除 | 签到统计', '2021-08-17 21:49:17', NULL, '115.151.224.198', '中国|0|江西省|萍乡市|电信', 'http://sign.404name.top/erupt-api/data/modify/SignLog/31', 'DELETE', NULL, b'1', 37, 1);
INSERT INTO `e_upms_operate_log` VALUES (150, '修改 | 系统变量', '2021-08-17 21:56:58', NULL, '115.151.224.198', '中国|0|江西省|萍乡市|电信', 'http://sign.404name.top/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"signOutPost\",\"name\":\"签退推送[0|1]\",\"myValue\":\"0\",\"id\":9}', b'1', 45, 1);
INSERT INTO `e_upms_operate_log` VALUES (151, '修改 | 系统变量', '2021-08-17 21:57:04', NULL, '115.151.224.198', '中国|0|江西省|萍乡市|电信', 'http://sign.404name.top/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"signInPost\",\"name\":\"登录推送[0|1]\",\"myValue\":\"0\",\"id\":8}', b'1', 36, 1);
INSERT INTO `e_upms_operate_log` VALUES (152, '修改 | 用户信息', '2021-08-18 16:09:12', NULL, '45.76.6.85', '美国|0|新泽西|0|0', 'http://sign.404name.top/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"测试用户\",\"signState\":false,\"status\":false,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"5\",\"expiredTime\":\"2021-08-31 16:09:06\",\"id\":4}', b'1', 42, 1);
INSERT INTO `e_upms_operate_log` VALUES (153, '修改 | 用户信息', '2021-08-18 16:09:21', NULL, '45.76.6.85', '美国|0|新泽西|0|0', 'http://sign.404name.top/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"灵智\",\"signState\":false,\"status\":false,\"unitGroup\":\"2\",\"classGroup\":\"3\",\"userGroup\":\"5\",\"expiredTime\":\"2021-08-31 16:09:17\",\"id\":5}', b'1', 38, 1);
INSERT INTO `e_upms_operate_log` VALUES (154, '修改 | 用户信息', '2021-08-18 16:16:47', NULL, '45.76.6.85', '美国|0|新泽西|0|0', 'http://sign.404name.top/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"测试用户\",\"signState\":false,\"status\":false,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"5\",\"expiredTime\":\"2021-08-31 16:09:06\",\"id\":4}', b'1', 37, 1);
INSERT INTO `e_upms_operate_log` VALUES (155, '修改 | 用户信息', '2021-08-18 16:16:54', NULL, '45.76.6.85', '美国|0|新泽西|0|0', 'http://sign.404name.top/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"灵智\",\"signState\":false,\"status\":false,\"unitGroup\":\"2\",\"classGroup\":\"3\",\"userGroup\":\"5\",\"expiredTime\":\"2021-08-31 16:09:17\",\"id\":5}', b'1', 35, 1);
INSERT INTO `e_upms_operate_log` VALUES (156, '修改 | 用户信息', '2021-08-19 13:42:37', NULL, '45.76.6.85', '美国|0|新泽西|0|0', 'http://sign.404name.top/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"测试用户\",\"signState\":false,\"status\":false,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"5\",\"expiredTime\":\"2021-08-31 16:09:06\",\"id\":4}', b'1', 325, 1);
INSERT INTO `e_upms_operate_log` VALUES (157, '修改 | 用户信息', '2021-08-19 13:42:45', NULL, '45.76.6.85', '美国|0|新泽西|0|0', 'http://sign.404name.top/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"杨澳宇\",\"signState\":false,\"status\":true,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"6\",\"faceId\":\"42d84e2cb033dfc3ae1b2d943abd13b2\",\"expiredTime\":\"2021-08-29 17:13:13\",\"id\":2}', b'1', 290, 1);
INSERT INTO `e_upms_operate_log` VALUES (158, '修改 | 用户信息', '2021-08-19 13:43:09', NULL, '45.76.6.85', '美国|0|新泽西|0|0', 'http://sign.404name.top/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"测试用户\",\"signState\":false,\"status\":false,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"5\",\"expiredTime\":\"2021-08-31 16:09:06\",\"id\":4}', b'1', 249, 1);
INSERT INTO `e_upms_operate_log` VALUES (159, '删除 | 签到统计', '2021-08-20 14:21:01', NULL, '182.87.170.134', '中国|0|江西省|萍乡市|电信', 'http://sign.404name.top/erupt-api/data/modify/SignLog/42', 'DELETE', NULL, b'1', 442, 1);
INSERT INTO `e_upms_operate_log` VALUES (160, '删除 | 签到统计', '2021-08-20 14:21:03', NULL, '182.87.170.134', '中国|0|江西省|萍乡市|电信', 'http://sign.404name.top/erupt-api/data/modify/SignLog/43', 'DELETE', NULL, b'1', 273, 1);
INSERT INTO `e_upms_operate_log` VALUES (161, '修改 | 用户信息', '2021-08-20 14:21:11', NULL, '182.87.170.134', '中国|0|江西省|萍乡市|电信', 'http://sign.404name.top/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"测试用户\",\"signState\":false,\"status\":false,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"5\",\"expiredTime\":\"2021-08-31 16:09:06\",\"id\":4}', b'1', 313, 1);
INSERT INTO `e_upms_operate_log` VALUES (162, '修改 | 用户信息', '2021-08-20 14:21:14', NULL, '182.87.170.134', '中国|0|江西省|萍乡市|电信', 'http://sign.404name.top/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"灵智\",\"signState\":false,\"status\":false,\"unitGroup\":\"2\",\"classGroup\":\"3\",\"userGroup\":\"5\",\"expiredTime\":\"2021-08-31 16:09:17\",\"id\":5}', b'1', 308, 1);
INSERT INTO `e_upms_operate_log` VALUES (163, '删除 | 菜单配置', '2021-08-20 16:15:38', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptMenu/2', 'DELETE', NULL, b'1', 343, 1);
INSERT INTO `e_upms_operate_log` VALUES (164, '删除 | 菜单配置', '2021-08-20 16:15:41', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptMenu/1', 'DELETE', NULL, b'1', 301, 1);
INSERT INTO `e_upms_operate_log` VALUES (165, '修改 | 用户角色', '2021-08-20 16:16:30', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptRole', 'PUT', '{\"code\":\"admin\",\"name\":\"普通管理员\",\"status\":true,\"menus\":[{\"id\":\"3\"},{\"id\":\"8\"},{\"id\":\"13\"},{\"id\":\"17\"},{\"id\":\"14\"},{\"id\":\"15\"},{\"id\":\"16\"},{\"id\":\"5\"}],\"users\":[{\"id\":2}],\"id\":1}', b'1', 714, 1);
INSERT INTO `e_upms_operate_log` VALUES (166, '新增 | 用户', '2021-08-20 16:17:01', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptUser', 'POST', '{\"account\":\"admin\",\"status\":true,\"passwordA\":\"admin\",\"passwordB\":\"admin\",\"isMd5\":true,\"roles\":[{\"id\":1}]}', b'1', 157, 1);
INSERT INTO `e_upms_operate_log` VALUES (167, '新增 | 用户', '2021-08-20 16:17:06', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptUser', 'POST', '{\"account\":\"admin\",\"name\":\"管理员\",\"status\":true,\"passwordA\":\"admin\",\"passwordB\":\"admin\",\"isMd5\":true,\"roles\":[{\"id\":1}]}', b'1', 204, 1);
INSERT INTO `e_upms_operate_log` VALUES (168, '修改 | 用户角色', '2021-08-20 16:18:13', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptRole', 'PUT', '{\"code\":\"admin\",\"name\":\"普通管理员\",\"status\":true,\"menus\":[{\"id\":\"3\"},{\"id\":\"8\"},{\"id\":\"11\"},{\"id\":\"13\"},{\"id\":\"17\"},{\"id\":\"14\"},{\"id\":\"15\"},{\"id\":\"16\"}],\"users\":[{\"id\":3},{\"id\":2}],\"id\":1}', b'1', 665, 1);
INSERT INTO `e_upms_operate_log` VALUES (169, '修改 | 菜单配置', '2021-08-20 16:19:12', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptMenu', 'PUT', '{\"code\":\"Group\",\"name\":\"基础数据管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"Group\",\"sort\":85,\"icon\":\"fa-database\",\"id\":17}', b'1', 315, 1);
INSERT INTO `e_upms_operate_log` VALUES (170, '修改 | 菜单配置', '2021-08-20 16:19:39', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptMenu', 'PUT', '{\"code\":\"User\",\"name\":\"用户管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"User\",\"sort\":90,\"icon\":\"fa-user-circle \",\"parentMenu\":{\"id\":13,\"name\":\"通用签到考勤系统\"},\"id\":14}', b'1', 304, 1);
INSERT INTO `e_upms_operate_log` VALUES (171, '修改 | 菜单配置', '2021-08-20 16:19:42', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptMenu', 'PUT', '{\"code\":\"User\",\"name\":\"用户管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"User\",\"sort\":90,\"icon\":\"fa-user-circle \",\"id\":14}', b'1', 304, 1);
INSERT INTO `e_upms_operate_log` VALUES (172, '修改 | 菜单配置', '2021-08-20 16:20:02', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptMenu', 'PUT', '{\"code\":\"SignLog\",\"name\":\"签到日志\",\"status\":\"1\",\"type\":\"table\",\"value\":\"SignLog\",\"sort\":100,\"icon\":\"fa-history\",\"id\":15}', b'1', 301, 1);
INSERT INTO `e_upms_operate_log` VALUES (173, '修改 | 菜单配置', '2021-08-20 16:20:19', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptMenu', 'PUT', '{\"code\":\"SystemVariables\",\"name\":\"系统变量\",\"status\":\"1\",\"type\":\"table\",\"value\":\"SystemVariables\",\"sort\":110,\"icon\":\"fa-cogs\",\"id\":16}', b'1', 313, 1);
INSERT INTO `e_upms_operate_log` VALUES (174, '删除 | 菜单配置', '2021-08-20 16:20:41', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptMenu/13', 'DELETE', NULL, b'1', 284, 1);
INSERT INTO `e_upms_operate_log` VALUES (175, '删除 | 菜单配置', '2021-08-20 16:20:55', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptMenu/13', 'DELETE', NULL, b'1', 247, 1);
INSERT INTO `e_upms_operate_log` VALUES (176, '修改 | 菜单配置', '2021-08-20 16:21:09', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptMenu', 'PUT', '{\"name\":\"通用签到考勤系统\",\"status\":\"1\",\"type\":\"tpl\",\"sort\":80,\"id\":13}', b'1', 134, 1);
INSERT INTO `e_upms_operate_log` VALUES (177, '修改 | 菜单配置', '2021-08-20 16:21:12', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptMenu', 'PUT', '{\"code\":\"e\'eee\",\"name\":\"通用签到考勤系统\",\"status\":\"1\",\"type\":\"tpl\",\"sort\":80,\"id\":13}', b'1', 245, 1);
INSERT INTO `e_upms_operate_log` VALUES (178, '删除 | 菜单配置', '2021-08-20 16:21:16', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptMenu/13', 'DELETE', NULL, b'1', 289, 1);
INSERT INTO `e_upms_operate_log` VALUES (179, '删除 | 菜单配置', '2021-08-20 16:21:23', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptMenu/13', 'DELETE', NULL, b'1', 246, 1);
INSERT INTO `e_upms_operate_log` VALUES (180, '修改 | 菜单配置', '2021-08-20 16:21:28', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptMenu', 'PUT', '{\"code\":\"e\'eee\",\"name\":\"通用签到考勤系统\",\"status\":\"3\",\"type\":\"tpl\",\"sort\":80,\"id\":13}', b'1', 245, 1);
INSERT INTO `e_upms_operate_log` VALUES (181, '修改 | 菜单配置', '2021-08-20 16:21:42', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptMenu', 'PUT', '{\"code\":\"menu1\",\"name\":\"通用签到考勤系统\",\"status\":\"2\",\"type\":\"tpl\",\"value\":\"menu1\",\"sort\":80,\"id\":13}', b'1', 313, 1);
INSERT INTO `e_upms_operate_log` VALUES (182, '修改 | 菜单配置', '2021-08-20 16:22:36', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptMenu', 'PUT', '{\"code\":\"SystemVariables\",\"name\":\"系统变量\",\"status\":\"1\",\"type\":\"table\",\"value\":\"SystemVariables\",\"sort\":110,\"icon\":\"fa fa-wrench\",\"id\":16}', b'1', 305, 1);
INSERT INTO `e_upms_operate_log` VALUES (183, '修改 | 菜单配置', '2021-08-20 16:22:40', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptMenu', 'PUT', '{\"code\":\"SignLog\",\"name\":\"签到日志\",\"status\":\"1\",\"type\":\"table\",\"value\":\"SignLog\",\"sort\":100,\"icon\":\"fa fa-history\",\"id\":15}', b'1', 299, 1);
INSERT INTO `e_upms_operate_log` VALUES (184, '修改 | 菜单配置', '2021-08-20 16:22:43', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptMenu', 'PUT', '{\"code\":\"User\",\"name\":\"用户管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"User\",\"sort\":90,\"icon\":\"fa fa-user-circle \",\"id\":14}', b'1', 301, 1);
INSERT INTO `e_upms_operate_log` VALUES (185, '修改 | 菜单配置', '2021-08-20 16:22:47', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptMenu', 'PUT', '{\"code\":\"Group\",\"name\":\"基础数据管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"Group\",\"sort\":85,\"icon\":\"fa fa-database\",\"id\":17}', b'1', 346, 1);
INSERT INTO `e_upms_operate_log` VALUES (186, '新增 | 菜单配置', '2021-08-20 16:23:42', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptMenu', 'POST', '{\"code\":\"home\",\"name\":\"首页\",\"status\":\"1\",\"type\":\"router\",\"value\":\"/\",\"sort\":120,\"icon\":\"fa fa-home\"}', b'1', 306, 1);
INSERT INTO `e_upms_operate_log` VALUES (187, '修改 | 菜单配置', '2021-08-20 16:23:49', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptMenu', 'PUT', '{\"code\":\"home\",\"name\":\"首页\",\"status\":\"1\",\"type\":\"router\",\"value\":\"/\",\"sort\":20,\"icon\":\"fa fa-home\",\"id\":20}', b'1', 416, 1);
INSERT INTO `e_upms_operate_log` VALUES (188, '修改 | 菜单配置', '2021-08-20 16:24:06', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptMenu', 'PUT', '{\"code\":\"menu1\",\"name\":\"通用签到考勤系统\",\"status\":\"2\",\"type\":\"tpl\",\"value\":\"menu1\",\"sort\":80,\"id\":13}', b'1', 421, 1);
INSERT INTO `e_upms_operate_log` VALUES (189, '修改 | 菜单配置', '2021-08-20 16:24:11', NULL, '192.168.1.112', '0|0|0|内网IP|内网IP', 'http://localhost:8888/erupt-api/data/modify/EruptMenu', 'PUT', '{\"code\":\"$manager\",\"name\":\"系统管理\",\"status\":\"1\",\"sort\":30,\"icon\":\"fa fa-cogs\",\"id\":3}', b'1', 290, 1);
INSERT INTO `e_upms_operate_log` VALUES (190, '修改 | 用户信息', '2021-08-21 13:06:09', NULL, '45.76.6.85', '美国|0|新泽西|0|0', 'http://sign.404name.top/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"杨澳宇\",\"signState\":true,\"status\":true,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"6\",\"faceId\":\"42d84e2cb033dfc3ae1b2d943abd13b2\",\"expiredTime\":\"2021-08-29 17:13:13\",\"id\":2}', b'1', 360, 1);
INSERT INTO `e_upms_operate_log` VALUES (191, '修改 | 用户信息', '2021-08-21 13:34:03', NULL, '45.76.6.85', '美国|0|新泽西|0|0', 'http://sign.404name.top/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"测试用户\",\"signState\":true,\"status\":false,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"5\",\"expiredTime\":\"2021-08-31 16:09:06\",\"id\":4}', b'1', 265, 1);
INSERT INTO `e_upms_operate_log` VALUES (192, '删除 | 签到统计', '2021-08-21 14:49:19', NULL, '45.76.6.85', '美国|0|新泽西|0|0', 'http://sign.404name.top/erupt-api/data/modify/SignLog/47', 'DELETE', NULL, b'1', 314, 1);
INSERT INTO `e_upms_operate_log` VALUES (193, '删除 | 签到统计', '2021-08-21 14:49:22', NULL, '45.76.6.85', '美国|0|新泽西|0|0', 'http://sign.404name.top/erupt-api/data/modify/SignLog/48', 'DELETE', NULL, b'1', 299, 1);
INSERT INTO `e_upms_operate_log` VALUES (194, '修改 | 用户信息', '2021-08-21 14:49:34', NULL, '45.76.6.85', '美国|0|新泽西|0|0', 'http://sign.404name.top/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"测试用户\",\"signState\":false,\"status\":false,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"5\",\"expiredTime\":\"2021-08-31 16:09:06\",\"id\":4}', b'1', 316, 1);
INSERT INTO `e_upms_operate_log` VALUES (195, '修改 | 用户信息', '2021-08-21 14:49:39', NULL, '45.76.6.85', '美国|0|新泽西|0|0', 'http://sign.404name.top/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"杨澳宇\",\"signState\":false,\"status\":true,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"6\",\"faceId\":\"42d84e2cb033dfc3ae1b2d943abd13b2\",\"expiredTime\":\"2021-08-29 17:13:13\",\"id\":2}', b'1', 280, 1);
INSERT INTO `e_upms_operate_log` VALUES (196, '修改 | 用户信息', '2021-08-21 14:49:43', NULL, '45.76.6.85', '美国|0|新泽西|0|0', 'http://sign.404name.top/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"李灵智\",\"signState\":false,\"status\":true,\"unitGroup\":\"1\",\"classGroup\":\"3\",\"userGroup\":\"6\",\"telphone\":2147483647,\"email\":\"1308964967@qq.com\",\"faceId\":\"9e1568d5168bf118eeb377b27b8e023c\",\"expiredTime\":\"2021-08-28 14:58:59\",\"id\":1}', b'1', 250, 1);
INSERT INTO `e_upms_operate_log` VALUES (197, '修改 | 用户信息', '2021-08-22 14:33:03', NULL, '182.87.170.134', '中国|0|江西省|萍乡市|电信', 'http://sign.404name.top/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"随便找的boy\",\"signState\":false,\"status\":true,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"6\",\"faceId\":\"88a737d211370886a1d03c7a3adf2823\",\"expiredTime\":\"2021-10-30 20:38:36\",\"id\":3}', b'1', 308, 1);
INSERT INTO `e_upms_operate_log` VALUES (198, '修改 | 系统变量', '2021-08-22 17:28:06', NULL, '45.76.6.85', '美国|0|新泽西|0|0', 'http://sign.404name.top/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"signInPost\",\"name\":\"登录推送[0|1]\",\"myValue\":\"1\",\"id\":8}', b'1', 285, 3);
INSERT INTO `e_upms_operate_log` VALUES (199, '修改 | 系统变量', '2021-08-22 17:28:14', NULL, '45.76.6.85', '美国|0|新泽西|0|0', 'http://sign.404name.top/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"signOutPost\",\"name\":\"签退推送[0|1]\",\"myValue\":\"1\",\"id\":9}', b'1', 278, 3);
INSERT INTO `e_upms_operate_log` VALUES (200, '修改 | 系统变量', '2021-08-23 19:13:41', NULL, '45.76.6.85', '美国|0|新泽西|0|0', 'http://sign.404name.top/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"signOutPost\",\"name\":\"签退推送[0|1]\",\"myValue\":\"0\",\"id\":9}', b'1', 280, 1);
INSERT INTO `e_upms_operate_log` VALUES (201, '修改 | 系统变量', '2021-08-23 19:13:50', NULL, '45.76.6.85', '美国|0|新泽西|0|0', 'http://sign.404name.top/erupt-api/data/modify/SystemVariables', 'PUT', '{\"myKey\":\"signInPost\",\"name\":\"登录推送[0|1]\",\"myValue\":\"0\",\"id\":8}', b'1', 289, 1);
INSERT INTO `e_upms_operate_log` VALUES (202, '修改 | 用户信息', '2021-08-24 11:08:35', NULL, '45.76.6.85', '美国|0|新泽西|0|0', 'http://sign.404name.top/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"杨澳宇\",\"signState\":false,\"status\":true,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"6\",\"faceId\":\"42d84e2cb033dfc3ae1b2d943abd13b2\",\"expiredTime\":\"2021-08-20 11:08:29\",\"id\":2}', b'1', 259, 1);
INSERT INTO `e_upms_operate_log` VALUES (203, '修改 | 用户信息', '2021-08-25 09:07:34', NULL, '45.76.6.85', '美国|0|新泽西|0|0', 'http://sign.404name.top/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"杨澳宇\",\"signState\":false,\"status\":true,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"6\",\"faceId\":\"42d84e2cb033dfc3ae1b2d943abd13b2\",\"expiredTime\":\"2021-08-31 09:07:29\",\"id\":2}', b'1', 328, 1);
INSERT INTO `e_upms_operate_log` VALUES (204, '修改 | 用户信息', '2021-08-31 19:49:47', NULL, '45.76.6.85', '美国|0|新泽西|0|0', 'http://sign.404name.top/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"杨澳宇\",\"signState\":false,\"status\":true,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"6\",\"faceId\":\"42d84e2cb033dfc3ae1b2d943abd13b2\",\"expiredTime\":\"2021-09-02 19:49:41\",\"id\":2}', b'1', 321, 1);
INSERT INTO `e_upms_operate_log` VALUES (205, '修改 | 用户信息', '2021-08-31 19:50:00', NULL, '45.76.6.85', '美国|0|新泽西|0|0', 'http://sign.404name.top/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"测试用户\",\"signState\":false,\"status\":false,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"5\",\"expiredTime\":\"2021-09-05 19:49:53\",\"id\":4}', b'1', 306, 1);
INSERT INTO `e_upms_operate_log` VALUES (206, '修改 | 用户信息', '2021-08-31 19:50:11', NULL, '45.76.6.85', '美国|0|新泽西|0|0', 'http://sign.404name.top/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"灵智\",\"signState\":false,\"status\":false,\"unitGroup\":\"2\",\"classGroup\":\"3\",\"userGroup\":\"5\",\"expiredTime\":\"2021-09-05 19:50:06\",\"id\":5}', b'1', 235, 1);
INSERT INTO `e_upms_operate_log` VALUES (207, '修改 | 用户信息', '2021-09-07 18:27:22', NULL, '117.150.7.24', '中国|0|湖北省|宜昌市|移动', 'http://sign.404name.top/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"杨澳宇\",\"signState\":false,\"status\":true,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"6\",\"faceId\":\"42d84e2cb033dfc3ae1b2d943abd13b2\",\"expiredTime\":\"2021-09-30 19:49:41\",\"id\":2}', b'1', 294, 1);
INSERT INTO `e_upms_operate_log` VALUES (208, '修改 | 用户信息', '2021-09-07 18:27:33', NULL, '117.150.7.24', '中国|0|湖北省|宜昌市|移动', 'http://sign.404name.top/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"测试用户\",\"signState\":false,\"status\":false,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"5\",\"expiredTime\":\"2021-09-05 19:49:53\",\"id\":4}', b'1', 238, 1);
INSERT INTO `e_upms_operate_log` VALUES (209, '修改 | 用户信息', '2021-09-07 18:27:39', NULL, '117.150.7.24', '中国|0|湖北省|宜昌市|移动', 'http://sign.404name.top/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"李灵智\",\"signState\":false,\"status\":true,\"unitGroup\":\"1\",\"classGroup\":\"3\",\"userGroup\":\"6\",\"telphone\":2147483647,\"email\":\"1308964967@qq.com\",\"faceId\":\"9e1568d5168bf118eeb377b27b8e023c\",\"expiredTime\":\"2021-08-28 14:58:59\",\"id\":1}', b'1', 239, 1);
INSERT INTO `e_upms_operate_log` VALUES (210, '修改 | 用户信息', '2021-09-07 18:27:49', NULL, '117.150.7.24', '中国|0|湖北省|宜昌市|移动', 'http://sign.404name.top/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"李灵智\",\"signState\":false,\"status\":true,\"unitGroup\":\"1\",\"classGroup\":\"3\",\"userGroup\":\"6\",\"telphone\":2147483647,\"email\":\"1308964967@qq.com\",\"faceId\":\"9e1568d5168bf118eeb377b27b8e023c\",\"expiredTime\":\"2021-08-28 14:58:59\",\"id\":1}', b'1', 236, 1);
INSERT INTO `e_upms_operate_log` VALUES (211, '修改 | 用户信息', '2021-09-07 18:27:57', NULL, '117.150.7.24', '中国|0|湖北省|宜昌市|移动', 'http://sign.404name.top/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"测试用户\",\"signState\":false,\"status\":false,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"5\",\"expiredTime\":\"2021-09-05 19:49:53\",\"id\":4}', b'1', 234, 1);
INSERT INTO `e_upms_operate_log` VALUES (212, '修改 | 用户信息', '2021-09-07 18:34:39', NULL, '117.150.7.24', '中国|0|湖北省|宜昌市|移动', 'http://sign.404name.top/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"测试用户\",\"signState\":false,\"status\":false,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"5\",\"expiredTime\":\"2021-09-05 19:49:53\",\"id\":4}', b'1', 221, 1);
INSERT INTO `e_upms_operate_log` VALUES (213, '修改 | 用户信息', '2021-09-29 10:15:35', NULL, '61.136.151.253', '中国|0|湖北省|宜昌市|电信', 'http://sign.404name.top/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"杨澳宇\",\"signState\":true,\"status\":true,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"6\",\"faceId\":\"42d84e2cb033dfc3ae1b2d943abd13b2\",\"expiredTime\":\"2022-09-30 19:49:41\",\"id\":2}', b'1', 239, 1);
INSERT INTO `e_upms_operate_log` VALUES (214, '修改 | 用户信息', '2021-09-29 10:15:44', NULL, '61.136.151.253', '中国|0|湖北省|宜昌市|电信', 'http://sign.404name.top/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"李灵智\",\"signState\":false,\"status\":true,\"unitGroup\":\"1\",\"classGroup\":\"3\",\"userGroup\":\"6\",\"telphone\":2147483647,\"email\":\"1308964967@qq.com\",\"faceId\":\"9e1568d5168bf118eeb377b27b8e023c\",\"expiredTime\":\"2021-08-28 14:58:59\",\"id\":1}', b'1', 209, 1);
INSERT INTO `e_upms_operate_log` VALUES (215, '修改 | 用户信息', '2021-09-29 10:15:54', NULL, '61.136.151.253', '中国|0|湖北省|宜昌市|电信', 'http://sign.404name.top/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"测试用户\",\"signState\":false,\"status\":false,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"5\",\"expiredTime\":\"2022-09-05 19:49:53\",\"id\":4}', b'1', 269, 1);
INSERT INTO `e_upms_operate_log` VALUES (216, '修改 | 用户信息', '2021-09-29 10:16:02', NULL, '61.136.151.253', '中国|0|湖北省|宜昌市|电信', 'http://sign.404name.top/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"灵智\",\"signState\":false,\"status\":false,\"unitGroup\":\"2\",\"classGroup\":\"3\",\"userGroup\":\"5\",\"expiredTime\":\"2021-09-30 19:50:06\",\"id\":5}', b'1', 313, 1);
INSERT INTO `e_upms_operate_log` VALUES (217, '修改 | 用户信息', '2023-04-20 18:51:08', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"随便找的boy\",\"signState\":true,\"status\":false,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"6\",\"faceId\":\"88a737d211370886a1d03c7a3adf2823\",\"expiredTime\":\"2021-10-30 20:38:36\",\"id\":3}', b'1', 328, 3);
INSERT INTO `e_upms_operate_log` VALUES (218, '修改 | 用户信息', '2023-04-20 18:51:39', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"小李\",\"signState\":false,\"status\":true,\"unitGroup\":\"1\",\"classGroup\":\"3\",\"userGroup\":\"6\",\"telphone\":2147483647,\"email\":\"1308964967@qq.com\",\"faceId\":\"9e1568d5168bf118eeb377b27b8e023c\",\"expiredTime\":\"2021-08-28 14:58:59\",\"id\":1}', b'1', 274, 3);
INSERT INTO `e_upms_operate_log` VALUES (219, '修改 | 用户信息', '2023-04-20 18:51:49', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"小杨\",\"signState\":true,\"status\":true,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"6\",\"faceId\":\"42d84e2cb033dfc3ae1b2d943abd13b2\",\"expiredTime\":\"2022-09-30 19:49:41\",\"id\":2}', b'1', 275, 3);
INSERT INTO `e_upms_operate_log` VALUES (220, '修改 | 用户信息', '2023-04-20 18:52:05', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"小杨\",\"signState\":true,\"status\":true,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"6\",\"telphone\":110,\"email\":\"110@qq.com\",\"faceId\":\"42d84e2cb033dfc3ae1b2d943abd13b2\",\"expiredTime\":\"2022-09-30 19:49:41\",\"id\":2}', b'1', 284, 3);
INSERT INTO `e_upms_operate_log` VALUES (221, '修改 | 用户信息', '2023-04-20 18:52:30', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"王思聪\",\"signState\":true,\"status\":false,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"6\",\"telphone\":666,\"email\":\"666@qq.com\",\"faceId\":\"88a737d211370886a1d03c7a3adf2823\",\"expiredTime\":\"2021-10-30 20:38:36\",\"id\":3}', b'1', 336, 3);
INSERT INTO `e_upms_operate_log` VALUES (222, '修改 | 用户信息', '2023-04-20 18:52:39', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"小智\",\"signState\":false,\"status\":false,\"unitGroup\":\"2\",\"classGroup\":\"3\",\"userGroup\":\"5\",\"expiredTime\":\"2021-09-30 19:50:06\",\"id\":5}', b'1', 333, 3);
INSERT INTO `e_upms_operate_log` VALUES (223, '修改 | 单位及课题组管理', '2023-04-20 18:53:26', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/Group', 'PUT', '{\"groupClass\":\"1\",\"name\":\"李老师课题组\",\"message\":\"Java课程设计\",\"id\":3}', b'1', 297, 3);
INSERT INTO `e_upms_operate_log` VALUES (224, '修改 | 单位及课题组管理', '2023-04-20 18:53:33', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/Group', 'PUT', '{\"groupClass\":\"1\",\"name\":\"王老师课题组\",\"message\":\"暑期实践答辩设计\",\"id\":4}', b'1', 305, 3);
INSERT INTO `e_upms_operate_log` VALUES (225, '新增 | 单位及课题组管理', '2023-04-20 18:54:17', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/Group', 'POST', '{\"groupClass\":\"0\",\"name\":\"AI算法部\",\"message\":\"AI算法相关\"}', b'1', 223, 3);
INSERT INTO `e_upms_operate_log` VALUES (226, '修改 | 单位及课题组管理', '2023-04-20 18:54:44', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/Group', 'PUT', '{\"groupClass\":\"2\",\"name\":\"访客\",\"message\":\"访客(仅手动签到)\",\"id\":5}', b'1', 306, 3);
INSERT INTO `e_upms_operate_log` VALUES (227, '修改 | 单位及课题组管理', '2023-04-20 18:54:52', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/Group', 'PUT', '{\"groupClass\":\"2\",\"name\":\"学生\",\"message\":\"学生(人脸识别打卡)\",\"id\":6}', b'1', 342, 3);
INSERT INTO `e_upms_operate_log` VALUES (228, '修改 | 单位及课题组管理', '2023-04-20 18:55:13', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/Group', 'PUT', '{\"groupClass\":\"3\",\"name\":\"访问\",\"message\":\"进行访问\",\"id\":8}', b'1', 349, 3);
INSERT INTO `e_upms_operate_log` VALUES (229, '新增 | 单位及课题组管理', '2023-04-20 18:55:33', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/Group', 'POST', '{\"groupClass\":\"3\",\"name\":\"自习\",\"message\":\"进行自习\"}', b'1', 228, 3);
INSERT INTO `e_upms_operate_log` VALUES (230, '新增 | 单位及课题组管理', '2023-04-20 18:55:42', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/Group', 'POST', '{\"groupClass\":\"3\",\"name\":\"其它\",\"message\":\"其它事情\"}', b'1', 230, 3);
INSERT INTO `e_upms_operate_log` VALUES (231, '新增 | 单位及课题组管理', '2023-04-20 18:56:08', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/Group', 'POST', '{\"groupClass\":\"3\",\"name\":\"维修\",\"message\":\"后勤人员进行维修等工作\"}', b'1', 235, 3);
INSERT INTO `e_upms_operate_log` VALUES (232, '修改 | 用户信息', '2023-04-20 19:17:09', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"王思聪\",\"signState\":true,\"status\":true,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"6\",\"telphone\":666,\"email\":\"666@qq.com\",\"faceId\":\"88a737d211370886a1d03c7a3adf2823\",\"expiredTime\":\"2021-10-30 20:38:36\",\"id\":3}', b'1', 359, 3);
INSERT INTO `e_upms_operate_log` VALUES (233, '修改 | 用户信息', '2023-04-20 19:17:49', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"王思聪\",\"signState\":true,\"status\":false,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"9\",\"telphone\":666,\"email\":\"666@qq.com\",\"faceId\":\"88a737d211370886a1d03c7a3adf2823\",\"expiredTime\":\"2021-10-30 20:38:36\",\"id\":3}', b'1', 281, 3);
INSERT INTO `e_upms_operate_log` VALUES (234, '新增 | 用户信息', '2023-04-21 13:09:20', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/User', 'POST', '{\"realName\":\"访客xz\",\"signState\":false,\"status\":false,\"unitGroup\":\"1\",\"classGroup\":\"0\",\"userGroup\":\"5\",\"expiredTime\":\"2025-04-20 13:09:13\"}', b'1', 416, 3);
INSERT INTO `e_upms_operate_log` VALUES (235, '修改 | 用户信息', '2023-04-21 13:09:30', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"测试用户\",\"signState\":false,\"status\":false,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"5\",\"expiredTime\":\"2022-09-05 19:49:53\",\"id\":4}', b'1', 464, 3);
INSERT INTO `e_upms_operate_log` VALUES (236, '修改 | 用户信息', '2023-04-21 13:10:28', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"访客xz\",\"signState\":false,\"status\":false,\"unitGroup\":\"1\",\"classGroup\":\"4\",\"userGroup\":\"5\",\"expiredTime\":\"2025-04-20 13:09:13\",\"id\":6}', b'1', 400, 3);
INSERT INTO `e_upms_operate_log` VALUES (237, '修改 | 用户信息', '2023-04-21 14:13:12', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"测试用户\",\"signState\":false,\"status\":false,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"5\",\"expiredTime\":\"2030-12-06 19:49:53\",\"id\":4}', b'1', 299, 3);
INSERT INTO `e_upms_operate_log` VALUES (238, '修改 | 用户信息', '2023-04-21 14:13:19', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"小智\",\"signState\":false,\"status\":false,\"unitGroup\":\"2\",\"classGroup\":\"3\",\"userGroup\":\"5\",\"expiredTime\":\"2021-09-30 19:50:06\",\"id\":5}', b'1', 267, 3);
INSERT INTO `e_upms_operate_log` VALUES (239, '修改 | 用户信息', '2023-04-21 14:13:27', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"王思聪\",\"signState\":true,\"status\":false,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"9\",\"telphone\":666,\"email\":\"666@qq.com\",\"faceId\":\"88a737d211370886a1d03c7a3adf2823\",\"expiredTime\":\"2021-10-30 20:38:36\",\"id\":3}', b'1', 263, 3);
INSERT INTO `e_upms_operate_log` VALUES (240, '修改 | 用户信息', '2023-04-21 14:13:34', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"小杨\",\"signState\":true,\"status\":true,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"6\",\"telphone\":110,\"email\":\"110@qq.com\",\"faceId\":\"42d84e2cb033dfc3ae1b2d943abd13b2\",\"expiredTime\":\"2022-09-30 19:49:41\",\"id\":2}', b'1', 284, 3);
INSERT INTO `e_upms_operate_log` VALUES (241, '修改 | 用户信息', '2023-04-21 14:13:40', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"小李\",\"signState\":false,\"status\":true,\"unitGroup\":\"1\",\"classGroup\":\"3\",\"userGroup\":\"6\",\"telphone\":2147483647,\"email\":\"1308964967@qq.com\",\"faceId\":\"9e1568d5168bf118eeb377b27b8e023c\",\"expiredTime\":\"2021-08-28 14:58:59\",\"id\":1}', b'1', 460, 3);
INSERT INTO `e_upms_operate_log` VALUES (242, '修改 | 用户信息', '2023-04-21 14:13:45', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"小杨\",\"signState\":true,\"status\":true,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"6\",\"telphone\":110,\"email\":\"110@qq.com\",\"faceId\":\"42d84e2cb033dfc3ae1b2d943abd13b2\",\"expiredTime\":\"2022-09-30 19:49:41\",\"id\":2}', b'1', 286, 3);
INSERT INTO `e_upms_operate_log` VALUES (243, '修改 | 用户信息', '2023-04-21 14:27:05', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"小智\",\"signState\":false,\"status\":false,\"unitGroup\":\"2\",\"classGroup\":\"3\",\"userGroup\":\"5\",\"expiredTime\":\"2021-09-30 19:50:06\",\"id\":5}', b'1', 297, 3);
INSERT INTO `e_upms_operate_log` VALUES (244, '修改 | 用户信息', '2023-04-21 14:27:34', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"小智\",\"signState\":false,\"status\":false,\"unitGroup\":\"2\",\"classGroup\":\"3\",\"userGroup\":\"5\",\"expiredTime\":\"2031-09-26 19:50:06\",\"id\":5}', b'1', 303, 3);
INSERT INTO `e_upms_operate_log` VALUES (245, '修改 | 用户信息', '2023-04-21 14:28:40', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"测试用户\",\"signState\":false,\"status\":false,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"5\",\"expiredTime\":\"2030-12-06 19:49:53\",\"id\":4}', b'1', 296, 3);
INSERT INTO `e_upms_operate_log` VALUES (246, '修改 | 用户信息', '2023-04-21 19:29:20', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"小李\",\"signState\":false,\"status\":true,\"unitGroup\":\"1\",\"classGroup\":\"3\",\"userGroup\":\"6\",\"telphone\":2147483647,\"email\":\"1308964967@qq.com\",\"faceId\":\"9e1568d5168bf118eeb377b27b8e023c\",\"expiredTime\":\"2030-08-28 14:58:59\",\"id\":1}', b'1', 317, 3);
INSERT INTO `e_upms_operate_log` VALUES (247, '修改 | 用户信息', '2023-04-21 19:29:28', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"小杨\",\"signState\":true,\"status\":true,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"6\",\"telphone\":110,\"email\":\"110@qq.com\",\"faceId\":\"42d84e2cb033dfc3ae1b2d943abd13b2\",\"expiredTime\":\"2030-09-26 19:49:41\",\"id\":2}', b'1', 289, 3);
INSERT INTO `e_upms_operate_log` VALUES (248, '修改 | 用户信息', '2023-04-21 19:29:34', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"王思聪\",\"signState\":true,\"status\":false,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"9\",\"telphone\":666,\"email\":\"666@qq.com\",\"faceId\":\"88a737d211370886a1d03c7a3adf2823\",\"expiredTime\":\"2030-10-12 20:38:36\",\"id\":3}', b'1', 308, 3);
INSERT INTO `e_upms_operate_log` VALUES (249, '修改 | 用户信息', '2023-04-21 19:30:29', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"王思聪\",\"signState\":false,\"status\":true,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"9\",\"telphone\":666,\"email\":\"666@qq.com\",\"faceId\":\"88a737d211370886a1d03c7a3adf2823\",\"expiredTime\":\"2030-10-12 20:38:36\",\"id\":3}', b'1', 306, 3);
INSERT INTO `e_upms_operate_log` VALUES (250, '修改 | 用户信息', '2023-04-21 19:30:35', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"小杨\",\"signState\":false,\"status\":false,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"6\",\"telphone\":110,\"email\":\"110@qq.com\",\"faceId\":\"42d84e2cb033dfc3ae1b2d943abd13b2\",\"expiredTime\":\"2030-09-26 19:49:41\",\"id\":2}', b'1', 353, 3);
INSERT INTO `e_upms_operate_log` VALUES (251, '修改 | 用户信息', '2023-04-21 19:30:39', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"小杨\",\"signState\":false,\"status\":true,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"6\",\"telphone\":110,\"email\":\"110@qq.com\",\"faceId\":\"42d84e2cb033dfc3ae1b2d943abd13b2\",\"expiredTime\":\"2030-09-26 19:49:41\",\"id\":2}', b'1', 306, 3);
INSERT INTO `e_upms_operate_log` VALUES (252, '修改 | 用户信息', '2023-04-21 19:37:56', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"马云\",\"signState\":false,\"status\":true,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"6\",\"telphone\":110,\"email\":\"110@qq.com\",\"faceId\":\"42d84e2cb033dfc3ae1b2d943abd13b2\",\"expiredTime\":\"2030-09-26 19:49:41\",\"id\":2}', b'1', 327, 3);
INSERT INTO `e_upms_operate_log` VALUES (253, '修改 | 用户信息', '2023-04-21 19:38:04', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"蔡徐坤\",\"signState\":false,\"status\":true,\"unitGroup\":\"1\",\"classGroup\":\"3\",\"userGroup\":\"6\",\"telphone\":2147483647,\"email\":\"1308964967@qq.com\",\"faceId\":\"9e1568d5168bf118eeb377b27b8e023c\",\"expiredTime\":\"2030-08-28 14:58:59\",\"id\":1}', b'1', 297, 3);
INSERT INTO `e_upms_operate_log` VALUES (254, '修改 | 用户信息', '2023-04-21 19:38:14', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"小李\",\"signState\":false,\"status\":false,\"unitGroup\":\"2\",\"classGroup\":\"4\",\"userGroup\":\"5\",\"expiredTime\":\"2030-12-06 19:49:53\",\"id\":4}', b'1', 305, 3);
INSERT INTO `e_upms_operate_log` VALUES (255, '修改 | 用户信息', '2023-04-21 19:38:23', NULL, '10.98.184.1', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/User', 'PUT', '{\"realName\":\"小张\",\"signState\":true,\"status\":false,\"unitGroup\":\"1\",\"classGroup\":\"4\",\"userGroup\":\"5\",\"expiredTime\":\"2025-04-20 13:09:13\",\"id\":6}', b'1', 298, 3);

-- ----------------------------
-- Table structure for e_upms_org
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_org`;
CREATE TABLE `e_upms_org`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `sort` int(0) NULL DEFAULT NULL,
  `parent_org_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKtj7222kjnkt7pv9kfn9g8ck4h`(`parent_org_id`) USING BTREE,
  CONSTRAINT `FKtj7222kjnkt7pv9kfn9g8ck4h` FOREIGN KEY (`parent_org_id`) REFERENCES `e_upms_org` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of e_upms_org
-- ----------------------------

-- ----------------------------
-- Table structure for e_upms_post
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_post`;
CREATE TABLE `e_upms_post`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `weight` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKltq5h3n5cyyk5nxtjhg9lhidg`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of e_upms_post
-- ----------------------------

-- ----------------------------
-- Table structure for e_upms_role
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_role`;
CREATE TABLE `e_upms_role`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `power_off` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKjgxkp7mr4183tcwosrbqpsl3a`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of e_upms_role
-- ----------------------------
INSERT INTO `e_upms_role` VALUES (1, 'admin', '普通管理员', NULL, b'1');

-- ----------------------------
-- Table structure for e_upms_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_role_menu`;
CREATE TABLE `e_upms_role_menu`  (
  `role_id` bigint(0) NOT NULL,
  `menu_id` bigint(0) NOT NULL,
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE,
  INDEX `FKr6bl403chgwjnb6jk0uqqd9x8`(`menu_id`) USING BTREE,
  CONSTRAINT `FKgsdnakqsme4htxkiapwmf6tbi` FOREIGN KEY (`role_id`) REFERENCES `e_upms_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKr6bl403chgwjnb6jk0uqqd9x8` FOREIGN KEY (`menu_id`) REFERENCES `e_upms_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of e_upms_role_menu
-- ----------------------------
INSERT INTO `e_upms_role_menu` VALUES (1, 3);
INSERT INTO `e_upms_role_menu` VALUES (1, 8);
INSERT INTO `e_upms_role_menu` VALUES (1, 11);
INSERT INTO `e_upms_role_menu` VALUES (1, 13);
INSERT INTO `e_upms_role_menu` VALUES (1, 14);
INSERT INTO `e_upms_role_menu` VALUES (1, 15);
INSERT INTO `e_upms_role_menu` VALUES (1, 16);
INSERT INTO `e_upms_role_menu` VALUES (1, 17);

-- ----------------------------
-- Table structure for e_upms_user
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_user`;
CREATE TABLE `e_upms_user`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `is_admin` bit(1) NULL DEFAULT NULL,
  `is_md5` bit(1) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `remark` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT NULL,
  `white_ip` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `erupt_org_id` bigint(0) NULL DEFAULT NULL,
  `erupt_post_id` bigint(0) NULL DEFAULT NULL,
  `create_user_id` bigint(0) NULL DEFAULT NULL,
  `update_user_id` bigint(0) NULL DEFAULT NULL,
  `erupt_menu_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK812t22yn0295dkkvx5gjgahax`(`account`) USING BTREE,
  INDEX `FK1re8jv3614mkk2wfxscvgvmnm`(`erupt_org_id`) USING BTREE,
  INDEX `FK53cice19aydjcuykpv847ocdv`(`erupt_post_id`) USING BTREE,
  INDEX `FKdvwfw4x66ahh1tavd69cnx4i0`(`create_user_id`) USING BTREE,
  INDEX `FKct3f9stm4eti10401f7rbh5ey`(`update_user_id`) USING BTREE,
  INDEX `FKga0jd7sahnn1tv14mq4dy5kba`(`erupt_menu_id`) USING BTREE,
  CONSTRAINT `FK1re8jv3614mkk2wfxscvgvmnm` FOREIGN KEY (`erupt_org_id`) REFERENCES `e_upms_org` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK53cice19aydjcuykpv847ocdv` FOREIGN KEY (`erupt_post_id`) REFERENCES `e_upms_post` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKct3f9stm4eti10401f7rbh5ey` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKdvwfw4x66ahh1tavd69cnx4i0` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKga0jd7sahnn1tv14mq4dy5kba` FOREIGN KEY (`erupt_menu_id`) REFERENCES `e_upms_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of e_upms_user
-- ----------------------------
INSERT INTO `e_upms_user` VALUES (1, 'erupt', '2021-08-09 11:01:39', NULL, 'erupt', NULL, b'1', b'1', '610d44f73b7709169e8e06ca4ac5af8e', NULL, NULL, b'1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `e_upms_user` VALUES (2, '李灵智', '2021-08-09 21:06:25', NULL, '404name', NULL, b'0', b'1', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, b'1', NULL, NULL, NULL, 1, NULL, 14);
INSERT INTO `e_upms_user` VALUES (3, '管理员', '2021-08-20 16:17:06', NULL, 'admin', NULL, b'0', b'1', '21232f297a57a5a743894a0e4a801fc3', NULL, NULL, b'1', NULL, NULL, NULL, 1, NULL, NULL);

-- ----------------------------
-- Table structure for e_upms_user_role
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_user_role`;
CREATE TABLE `e_upms_user_role`  (
  `user_id` bigint(0) NOT NULL,
  `role_id` bigint(0) NOT NULL,
  PRIMARY KEY (`role_id`, `user_id`) USING BTREE,
  INDEX `FKes2ylim5w3ej690ss84sb956x`(`user_id`) USING BTREE,
  CONSTRAINT `FK3h4lekfh26f5f8b7by3ejges6` FOREIGN KEY (`role_id`) REFERENCES `e_upms_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKes2ylim5w3ej690ss84sb956x` FOREIGN KEY (`user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of e_upms_user_role
-- ----------------------------
INSERT INTO `e_upms_user_role` VALUES (2, 1);
INSERT INTO `e_upms_user_role` VALUES (3, 1);

-- ----------------------------
-- Table structure for sign_log
-- ----------------------------
DROP TABLE IF EXISTS `sign_log`;
CREATE TABLE `sign_log`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `in_time` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `msg` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `out_time` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `sign_time` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `to_do` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `user_group` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  `from_user_id` bigint(0) NULL DEFAULT NULL,
  `user_class` bit(1) NULL DEFAULT NULL,
  `class_group` bigint(0) NULL DEFAULT NULL,
  `unit_group` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 153 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sign_log
-- ----------------------------
INSERT INTO `sign_log` VALUES (1, '小李', '12:17:22', NULL, '12:17:59', '1.5', '7', '5', '2021-08-09 00:00:00', 1, b'1', 3, 1);
INSERT INTO `sign_log` VALUES (2, '小李', '21:15:50', '无', '21:59:50', '2.0', '8', '5', '2021-08-10 00:00:00', 1, b'1', 4, 1);
INSERT INTO `sign_log` VALUES (7, '小李', '12:00:00', '无', '15:00:00', '3', '8', '5', '2021-08-10 00:00:00', 1, b'1', 4, 1);
INSERT INTO `sign_log` VALUES (8, '小李', '07:00:00', '无', '08:00:00', '3', '1', '5', '2021-08-10 00:00:00', 1, b'1', 0, 2);
INSERT INTO `sign_log` VALUES (9, '小李', '07:00:00', '无', '08:00:00', '3', '7', '5', '2021-08-12 00:00:00', 1, b'1', 3, 2);
INSERT INTO `sign_log` VALUES (10, '小李', '07:00:00', '无', '08:00:00', '3', '7', '5', '2021-08-13 00:00:00', 1, b'1', 0, 1);
INSERT INTO `sign_log` VALUES (11, '小李', '16:14:30', '签到', '16:21:23', '0.5', '8', '5', '2021-08-10 00:00:00', 1, b'1', 0, 1);
INSERT INTO `sign_log` VALUES (12, '小李', '16:28:43', '测试', '16:30:55', '0.5', '1', '5', '2021-08-10 00:00:00', 1, b'1', 0, 1);
INSERT INTO `sign_log` VALUES (13, '测试', '17:40:15', '测试', '17:42:23', '0.5', NULL, '5', '2021-08-14 00:00:00', 1, b'0', 0, 0);
INSERT INTO `sign_log` VALUES (14, '测试', '17:46:54', '【系统强制退出】系统时间', '18:38:00', '1.0', NULL, '5', '2021-08-14 00:00:00', 1, b'0', 0, 0);
INSERT INTO `sign_log` VALUES (15, '小李', '18:22:59', '【系统强制退出】test', '18:42:00', '0.5', NULL, '5', '2021-08-14 00:00:00', 1, b'1', 3, 1);
INSERT INTO `sign_log` VALUES (17, '测试', '18:46:30', '【系统强制退出】null', '18:48:00', '0.5', NULL, '5', '2021-08-14 00:00:00', 1, b'0', 0, 0);
INSERT INTO `sign_log` VALUES (18, '小李', '18:46:48', '【系统强制退出】null', '18:49:00', '0.5', NULL, '5', '2021-08-14 00:00:00', 1, b'1', 3, 1);
INSERT INTO `sign_log` VALUES (19, '测试', '18:51:13', '【系统强制退出】null', '18:54:00', '0.5', NULL, '5', '2021-08-14 00:00:00', 1, b'0', 0, 0);
INSERT INTO `sign_log` VALUES (20, '小李', '18:51:19', '【系统强制退出】呃呃呃', '18:54:00', '0.5', NULL, '5', '2021-08-14 00:00:00', 1, b'1', 3, 1);
INSERT INTO `sign_log` VALUES (23, '测试', '09:50:00', NULL, '09:51:18', '0.5', NULL, '5', '2021-08-16 00:00:00', 1, b'0', 0, 0);
INSERT INTO `sign_log` VALUES (26, '小李', '16:48:59', '【系统强制退出】null', '22:00:00', '5.5', NULL, '5', '2021-08-16 00:00:00', 1, b'1', 3, 1);
INSERT INTO `sign_log` VALUES (28, 'llz', '12:18:08', 'AOP测试', '12:20:18', '0.5', NULL, '5', '2021-08-17 00:00:00', 2, b'0', 0, 0);
INSERT INTO `sign_log` VALUES (29, '王思聪', '15:33:35', '【系统强制退出】null', '22:00:00', '6.5', '7', '5', '2021-08-17 00:00:00', 3, b'1', 4, 2);
INSERT INTO `sign_log` VALUES (30, '小杨', '15:49:27', '【系统强制退出】null', '22:00:00', '6.5', '8', '5', '2021-08-17 00:00:00', 2, b'1', 4, 2);
INSERT INTO `sign_log` VALUES (32, '灵智', '21:17:08', NULL, '21:20:40', '0.5', NULL, '6', '2021-08-17 00:00:00', 5, NULL, 3, 1);
INSERT INTO `sign_log` VALUES (33, '灵智', '21:50:48', NULL, '21:56:14', '0.5', NULL, '5', '2021-08-17 00:00:00', 5, NULL, 3, 2);
INSERT INTO `sign_log` VALUES (34, '小李', '21:54:45', 'ces', '21:57:15', '0.0', NULL, '6', '2021-08-17 00:00:00', 1, NULL, 3, 1);
INSERT INTO `sign_log` VALUES (35, '灵智', '16:09:28', '【系统强制退出】null', '22:00:00', '6.0', '8', '5', '2021-08-18 00:00:00', 5, NULL, 3, 2);
INSERT INTO `sign_log` VALUES (36, '测试用户', '16:15:37', '【系统强制退出】null', '22:00:00', '6.0', '8', '5', '2021-08-18 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (37, '测试用户', '16:18:02', '【系统强制退出】null', '22:00:00', '6.0', '7', '5', '2021-08-18 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (38, '小杨', '16:21:31', '【系统强制退出】null', '22:00:00', '6.0', '8', '6', '2021-08-18 00:00:00', 2, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (39, '小杨', '22:13:09', '【系统强制退出】null', '22:00:00', '0.0', '8', '6', '2021-08-18 00:00:00', 2, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (40, '测试用户', '11:32:17', '【系统强制退出】null', '22:00:00', '10.0', '8', '5', '2021-08-19 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (41, '小杨', '21:42:29', '【系统强制退出】null', '22:00:00', '0.0', '8', '6', '2021-08-19 00:00:00', 2, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (44, '小杨', '13:43:04', '【系统强制退出】null', '22:00:00', '8.5', '8', '6', '2021-08-20 00:00:00', 2, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (45, '测试用户', '14:21:31', NULL, '14:21:47', '0.0', NULL, '5', '2021-08-20 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (46, '灵智', '14:21:36', '【系统强制退出】null', '22:00:00', '8.0', NULL, '5', '2021-08-20 00:00:00', 5, NULL, 3, 2);
INSERT INTO `sign_log` VALUES (49, '小杨', '14:50:21', NULL, '14:51:08', '0.5', '8', '6', '2021-08-21 00:00:00', 2, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (50, '测试用户', '14:50:26', NULL, '14:50:37', '0.5', NULL, '5', '2021-08-21 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (51, '小杨', '15:02:49', NULL, '15:03:02', '0.5', '8', '6', '2021-08-21 00:00:00', 2, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (52, '测试用户', '15:03:17', NULL, '15:12:09', '0.5', '8', '5', '2021-08-21 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (53, '灵智', '15:03:28', NULL, '15:12:50', '0.5', '7', '5', '2021-08-21 00:00:00', 5, NULL, 3, 2);
INSERT INTO `sign_log` VALUES (54, '测试用户', '15:12:20', NULL, '15:12:45', '0.5', '8', '5', '2021-08-21 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (55, '测试用户', '15:13:03', NULL, '15:14:57', '0.5', '8', '5', '2021-08-21 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (56, '灵智', '15:13:22', NULL, '15:15:00', '0.5', '8', '5', '2021-08-21 00:00:00', 5, NULL, 3, 2);
INSERT INTO `sign_log` VALUES (57, '小杨', '15:14:27', NULL, '15:14:42', '0.5', '8', '6', '2021-08-21 00:00:00', 2, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (58, '测试用户', '15:15:10', NULL, '15:16:34', '0.5', '7', '5', '2021-08-21 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (59, '灵智', '15:15:19', NULL, '15:16:37', '0.5', '8', '5', '2021-08-21 00:00:00', 5, NULL, 3, 2);
INSERT INTO `sign_log` VALUES (60, '测试用户', '15:16:49', NULL, '15:18:49', '0.5', '7', '5', '2021-08-21 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (61, '灵智', '15:18:43', NULL, '15:18:52', '0.5', '8', '5', '2021-08-21 00:00:00', 5, NULL, 3, 2);
INSERT INTO `sign_log` VALUES (62, '测试用户', '15:32:58', NULL, '15:33:07', '0.5', '8', '5', '2021-08-21 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (63, '测试用户', '15:34:17', NULL, '15:34:31', '0.5', '8', '5', '2021-08-21 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (64, '灵智', '15:34:23', NULL, '15:55:00', '0.5', '7', '5', '2021-08-21 00:00:00', 5, NULL, 3, 2);
INSERT INTO `sign_log` VALUES (65, '测试用户', '15:35:01', NULL, '15:54:55', '0.5', '8', '5', '2021-08-21 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (66, '小杨', '15:38:12', NULL, '15:43:01', '0.5', '8', '6', '2021-08-21 00:00:00', 2, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (67, '小杨', '15:45:17', NULL, '15:49:11', '0.5', '8', '6', '2021-08-21 00:00:00', 2, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (68, '小杨', '15:49:50', NULL, '15:50:05', '0.5', '8', '6', '2021-08-21 00:00:00', 2, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (69, '小杨', '15:51:16', NULL, '15:51:29', '0.5', '8', '6', '2021-08-21 00:00:00', 2, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (70, '测试用户', '15:55:10', NULL, '15:58:18', '0.5', '8', '5', '2021-08-21 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (71, '小杨', '15:57:48', NULL, '15:58:00', '0.5', '8', '6', '2021-08-21 00:00:00', 2, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (72, '灵智', '15:58:11', NULL, '15:58:19', '0.5', '8', '5', '2021-08-21 00:00:00', 5, NULL, 3, 2);
INSERT INTO `sign_log` VALUES (73, '测试用户', '15:59:14', NULL, '15:59:27', '0.5', '7', '5', '2021-08-21 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (74, '灵智', '15:59:20', NULL, '15:59:27', '0.5', '8', '5', '2021-08-21 00:00:00', 5, NULL, 3, 2);
INSERT INTO `sign_log` VALUES (75, '测试用户', '16:04:10', NULL, '16:04:29', '0.5', '8', '5', '2021-08-21 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (76, '灵智', '16:04:22', NULL, '16:04:38', '0.5', '8', '5', '2021-08-21 00:00:00', 5, NULL, 3, 2);
INSERT INTO `sign_log` VALUES (77, '测试用户', '16:12:05', NULL, '16:12:21', '0.5', '8', '5', '2021-08-21 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (78, '灵智', '16:12:13', NULL, '16:12:26', '0.5', '7', '5', '2021-08-21 00:00:00', 5, NULL, 3, 2);
INSERT INTO `sign_log` VALUES (79, '测试用户', '16:16:47', NULL, '16:16:53', '0.5', '7', '5', '2021-08-21 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (80, '测试用户', '18:47:39', NULL, '21:10:09', '2.5', '8', '5', '2021-08-21 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (81, '灵智', '20:42:13', NULL, '21:03:25', '0.5', NULL, '5', '2021-08-21 00:00:00', 5, NULL, 3, 2);
INSERT INTO `sign_log` VALUES (82, '小杨', '09:40:48', NULL, '09:41:01', '0.5', '8', '6', '2021-08-22 00:00:00', 2, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (83, '测试用户', '09:41:19', NULL, '09:41:26', '0.5', '8', '5', '2021-08-22 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (84, '测试用户', '14:01:28', NULL, '14:06:30', '0.5', NULL, '5', '2021-08-22 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (85, '测试用户', '14:08:11', NULL, '14:08:15', '0.5', NULL, '5', '2021-08-22 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (86, '测试用户', '14:08:24', NULL, '14:33:53', '0.5', NULL, '5', '2021-08-22 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (87, '小李', '14:18:15', '【系统强制退出】null', '22:00:00', '8.0', NULL, '6', '2021-08-22 00:00:00', 1, NULL, 3, 1);
INSERT INTO `sign_log` VALUES (88, '王思聪', '14:33:05', NULL, '14:33:37', '0.5', '7', '6', '2021-08-22 00:00:00', 3, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (89, '灵智', '14:33:49', '【系统强制退出】null', '22:00:00', '7.5', '7', '5', '2021-08-22 00:00:00', 5, NULL, 3, 2);
INSERT INTO `sign_log` VALUES (90, '测试用户', '20:27:03', NULL, '20:33:46', '0.5', '7', '5', '2021-08-22 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (91, '测试用户', '20:35:46', '【系统强制退出】null', '22:00:00', '1.5', '8', '5', '2021-08-22 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (92, '小杨', '18:58:29', NULL, '18:58:42', '0.5', '8', '6', '2021-08-23 00:00:00', 2, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (93, '测试用户', '18:58:52', NULL, '18:59:02', '0.5', '7', '5', '2021-08-23 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (94, '灵智', '18:58:59', NULL, '18:59:06', '0.5', '8', '5', '2021-08-23 00:00:00', 5, NULL, 3, 2);
INSERT INTO `sign_log` VALUES (95, '测试用户', '19:08:14', NULL, '19:08:20', '0.5', '8', '5', '2021-08-23 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (96, '灵智', '19:08:17', NULL, '19:08:21', '0.5', '8', '5', '2021-08-23 00:00:00', 5, NULL, 3, 2);
INSERT INTO `sign_log` VALUES (97, '测试用户', '19:08:26', NULL, '19:08:32', '0.5', '7', '5', '2021-08-23 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (98, '灵智', '19:08:30', NULL, '19:08:34', '0.5', '8', '5', '2021-08-23 00:00:00', 5, NULL, 3, 2);
INSERT INTO `sign_log` VALUES (99, '测试用户', '19:08:44', '【系统强制退出】null', '22:00:00', '3.0', '8', '5', '2021-08-23 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (100, '灵智', '19:08:47', '【系统强制退出】null', '22:00:00', '3.0', '7', '5', '2021-08-23 00:00:00', 5, NULL, 3, 2);
INSERT INTO `sign_log` VALUES (101, '小杨', '19:13:56', NULL, '19:51:06', '1.0', '8', '6', '2021-08-23 00:00:00', 2, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (102, '小杨', '21:49:11', NULL, '21:49:23', '0.5', '8', '6', '2021-08-23 00:00:00', 2, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (103, '小杨', '08:56:59', NULL, '08:57:56', '0.5', '8', '6', '2021-08-24 00:00:00', 2, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (104, '测试用户', '08:58:15', NULL, '08:58:23', '0.5', '8', '5', '2021-08-24 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (105, '小杨', '08:59:21', NULL, '11:07:58', '2.5', '8', '6', '2021-08-24 00:00:00', 2, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (106, '测试用户', '09:04:45', NULL, '09:16:54', '0.5', '7', '5', '2021-08-25 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (107, '小杨', '09:13:01', NULL, '09:13:41', '0.5', '8', '6', '2021-08-25 00:00:00', 2, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (108, '小杨', '09:14:34', NULL, '09:14:47', '0.5', '8', '6', '2021-08-25 00:00:00', 2, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (109, '小杨', '09:16:26', NULL, '09:16:42', '0.5', '8', '6', '2021-08-25 00:00:00', 2, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (110, '灵智', '09:16:50', NULL, '09:16:56', '0.5', '8', '5', '2021-08-25 00:00:00', 5, NULL, 3, 2);
INSERT INTO `sign_log` VALUES (111, '测试用户', '09:17:06', NULL, '09:17:13', '0.5', '7', '5', '2021-08-25 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (112, '灵智', '09:17:10', NULL, '09:17:14', '0.5', '8', '5', '2021-08-25 00:00:00', 5, NULL, 3, 2);
INSERT INTO `sign_log` VALUES (113, '测试用户', '09:17:19', NULL, '09:17:22', '0.5', '8', '5', '2021-08-25 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (114, '小杨', '12:18:41', '【系统强制退出】null', '22:00:00', '10.0', '8', '6', '2021-08-25 00:00:00', 2, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (115, '测试用户', '21:22:06', NULL, '21:22:18', '0.5', '8', '5', '2021-08-30 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (116, '灵智', '21:22:12', NULL, '21:22:21', '0.5', '7', '5', '2021-08-30 00:00:00', 5, NULL, 3, 2);
INSERT INTO `sign_log` VALUES (117, '测试用户', '21:22:29', NULL, '21:22:40', '0.5', '8', '5', '2021-08-30 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (118, '灵智', '21:22:34', NULL, '21:22:43', '0.5', '7', '5', '2021-08-30 00:00:00', 5, NULL, 3, 2);
INSERT INTO `sign_log` VALUES (119, '测试用户', '21:22:50', NULL, '21:23:02', '0.5', '7', '5', '2021-08-30 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (120, '灵智', '21:22:56', NULL, '21:23:25', '0.5', '8', '5', '2021-08-30 00:00:00', 5, NULL, 3, 2);
INSERT INTO `sign_log` VALUES (121, '测试用户', '21:23:10', NULL, '21:23:22', '0.5', '8', '5', '2021-08-30 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (122, '测试用户', '21:23:31', '【系统强制退出】null', '22:00:00', '1.0', '8', '5', '2021-08-30 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (123, '小杨', '21:57:26', '【系统强制退出】null', '22:00:00', '0.5', '8', '6', '2021-08-30 00:00:00', 2, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (124, '小杨', '19:51:05', NULL, '19:53:19', '0.5', '8', '6', '2021-08-31 00:00:00', 2, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (125, '测试用户', '19:51:11', NULL, '19:51:24', '0.5', '8', '5', '2023-04-19 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (126, '灵智', '19:51:15', NULL, '19:51:26', '0.5', '7', '5', '2023-04-19 00:00:00', 5, NULL, 3, 2);
INSERT INTO `sign_log` VALUES (127, '测试用户', '19:51:30', NULL, '19:51:36', '0.5', '8', '5', '2023-04-19 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (128, '灵智', '19:51:34', NULL, '19:51:37', '0.5', '8', '5', '2023-04-19 00:00:00', 5, NULL, 3, 2);
INSERT INTO `sign_log` VALUES (129, '测试用户', '19:51:42', NULL, '19:51:44', '0.5', '8', '5', '2023-04-19 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (130, '测试用户', '19:51:49', NULL, '19:51:56', '0.5', '8', '5', '2023-04-19 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (131, '灵智', '19:51:54', NULL, '19:51:58', '0.5', '7', '5', '2023-04-19 00:00:00', 5, NULL, 3, 2);
INSERT INTO `sign_log` VALUES (132, '测试用户', '13:10:32', NULL, '13:10:42', '0.5', '7', '5', '2023-04-20 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (133, '王思聪', '18:34:57', '【系统强制退出】null', '22:00:00', '3.5', NULL, '6', '2023-04-20 00:00:00', 3, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (134, '小杨', '15:04:37', NULL, NULL, NULL, '8', '6', '2023-04-20 00:00:00', 2, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (135, '王思聪', '10:12:03', NULL, NULL, NULL, '7', '6', '2023-04-20 00:00:00', 3, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (136, '测试用户', '15:51:43', NULL, '14:40:06', '-0.5', '8', '5', '2023-04-20 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (137, '访客xz', '13:34:35', NULL, '13:36:35', '0.5', NULL, '5', '2023-04-21 00:00:00', 6, NULL, 4, 1);
INSERT INTO `sign_log` VALUES (138, '访客xz', '13:37:34', NULL, '14:28:03', '1.0', NULL, '5', '2023-04-21 00:00:00', 6, NULL, 4, 1);
INSERT INTO `sign_log` VALUES (139, '测试用户', '14:13:51', NULL, NULL, NULL, '12', '5', '2023-04-21 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (140, '小智', '14:27:39', NULL, '14:27:53', '0.5', '13', '5', '2023-04-21 00:00:00', 5, NULL, 3, 2);
INSERT INTO `sign_log` VALUES (141, '测试用户', '14:28:58', NULL, NULL, NULL, '7', '5', '2023-04-21 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (142, '测试用户', '14:40:34', NULL, '14:40:40', '0.5', '13', '5', '2023-04-21 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (143, '小智', '14:40:50', NULL, '18:58:34', '4.5', '12', '5', '2023-04-21 00:00:00', 5, NULL, 3, 2);
INSERT INTO `sign_log` VALUES (144, '访客xz', '14:40:57', NULL, '14:41:01', '0.5', '13', '5', '2023-04-21 00:00:00', 6, NULL, 4, 1);
INSERT INTO `sign_log` VALUES (145, '测试用户', '14:42:16', NULL, '15:40:31', '1.0', '12', '5', '2023-04-21 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (146, '访客xz', '15:42:17', NULL, NULL, NULL, '12', '5', '2023-04-21 00:00:00', 6, NULL, 4, 1);
INSERT INTO `sign_log` VALUES (147, '王思聪', '19:36:44', NULL, '19:37:16', '0.5', '13', '9', '2023-04-21 00:00:00', 3, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (148, '马云', '19:41:47', NULL, NULL, NULL, '11', '6', '2023-04-21 00:00:00', 2, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (149, '蔡徐坤', '20:53:03', NULL, '20:53:13', '0.5', '12', '6', '2023-04-21 00:00:00', 1, NULL, 3, 1);
INSERT INTO `sign_log` VALUES (150, '小智', '20:53:20', NULL, '18:09:46', '-2.0', '11', '5', '2023-04-21 00:00:00', 5, NULL, 3, 2);
INSERT INTO `sign_log` VALUES (151, '小李', '18:09:54', NULL, NULL, NULL, '12', '5', '2023-04-28 00:00:00', 4, NULL, 4, 2);
INSERT INTO `sign_log` VALUES (152, '蔡徐坤', '18:12:12', NULL, NULL, NULL, '13', '6', '2023-04-28 00:00:00', 1, NULL, 3, 1);
INSERT INTO `sign_log` VALUES (153, '蔡徐坤', '16:45:40', NULL, NULL, NULL, '13', '6', '2023-04-29 00:00:00', 1, NULL, 3, 1);
INSERT INTO `sign_log` VALUES (154, '马云', '16:46:08', NULL, NULL, NULL, '13', '6', '2023-04-29 00:00:00', 2, NULL, 4, 2);

-- ----------------------------
-- Table structure for system_variables
-- ----------------------------
DROP TABLE IF EXISTS `system_variables`;
CREATE TABLE `system_variables`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `my_key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `my_value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of system_variables
-- ----------------------------
INSERT INTO `system_variables` VALUES (2, 'userStatus', '[\"访客\",\"未授权用户\",\"已录入人脸信息\"]', '用户状态表【请勿改动】');
INSERT INTO `system_variables` VALUES (3, 'groupClass', '[\"部门管理\",\"课题组管理\",\"用户类型管理\",\"事由管理\"]', '组别管理类别【请勿修改】');
INSERT INTO `system_variables` VALUES (4, 'startTime', '08:00:00', '打卡起止时间');
INSERT INTO `system_variables` VALUES (5, 'leaveTime', '22:00:00', '默认结束时间【第二天生效】');
INSERT INTO `system_variables` VALUES (6, 'feedbackList', '[\"测试\",\"哈哈\",\"哈哈\",\"芜湖\"]', '用户反馈表');
INSERT INTO `system_variables` VALUES (8, 'signInPost', '0', '登录推送[0|1]');
INSERT INTO `system_variables` VALUES (9, 'signOutPost', '0', '签退推送[0|1]');
INSERT INTO `system_variables` VALUES (10, 'wxPushToken', 'dd7d6bfce36340c7af8c9704596067c4', 'pushplus密钥');
INSERT INTO `system_variables` VALUES (11, 'orderImg', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQHd8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyWldMX1V6Q1BjbkQxMDAwMHcwN1QAAgStLRthAwQAAAAA', '微信推送订阅二维码');
INSERT INTO `system_variables` VALUES (12, 'wxPushGroupId', 'signIn', '微信推送用户群识别Id');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `real_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0',
  `touch_id` int(0) NULL DEFAULT NULL,
  `user_group` int(0) NULL DEFAULT 5,
  `now_sign_id` int(0) NULL DEFAULT NULL,
  `face_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `unit` int(0) NULL DEFAULT 0,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `telphone` int(0) NULL DEFAULT NULL,
  `group_id` bigint(0) NULL DEFAULT NULL,
  `expired_time` datetime(0) NULL DEFAULT NULL,
  `sign_state` bit(1) NULL DEFAULT b'0',
  `class_group` bigint(0) NULL DEFAULT 0,
  `unit_group` bigint(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK5ixd8ou7x5sln7b00u8qpf7il`(`group_id`) USING BTREE,
  CONSTRAINT `FK5ixd8ou7x5sln7b00u8qpf7il` FOREIGN KEY (`group_id`) REFERENCES `user_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '蔡徐坤', '1', 1, 6, NULL, 'a9791c9c5a4967dfe21c2e6cfd0d2b9e', 1, '1308964967@qq.com', 2147483647, 2, '2050-08-28 14:58:59', b'0', 3, 1);
INSERT INTO `user` VALUES (2, '马云', '1', NULL, 6, NULL, '42d84e2cb033dfc3ae1b2d943abd13b2', 2, '110@qq.com', 110, NULL, '2050-08-28 14:58:59', b'0', 4, 2);
INSERT INTO `user` VALUES (3, '王思聪', '1', NULL, 9, NULL, '88a737d211370886a1d03c7a3adf2823', 2, '666@qq.com', 666, NULL, '2050-08-28 14:58:59', b'0', 4, 2);
INSERT INTO `user` VALUES (4, '小李', '0', NULL, 5, NULL, NULL, 2, NULL, NULL, NULL, '2050-08-28 14:58:59', b'0', 4, 2);
INSERT INTO `user` VALUES (5, '小智', '0', NULL, 5, NULL, NULL, 1, NULL, NULL, NULL, '2050-08-28 14:58:59', b'0', 3, 2);
INSERT INTO `user` VALUES (6, '小张', '0', NULL, 5, NULL, NULL, 0, NULL, NULL, NULL, '2050-08-28 14:58:59', b'0', 4, 1);

-- ----------------------------
-- Table structure for user_group
-- ----------------------------
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `group_class` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_group
-- ----------------------------
INSERT INTO `user_group` VALUES (1, '0', '后勤集团', '后勤部');
INSERT INTO `user_group` VALUES (2, '0', '开发网站', '开发部');
INSERT INTO `user_group` VALUES (3, '1', 'Java课程设计', '李老师课题组');
INSERT INTO `user_group` VALUES (4, '1', '暑期实践答辩设计', '王老师课题组');
INSERT INTO `user_group` VALUES (5, '2', '访客(仅手动签到)', '访客');
INSERT INTO `user_group` VALUES (6, '2', '学生(人脸识别打卡)', '学生');
INSERT INTO `user_group` VALUES (7, '3', '进行实验内容', '实验');
INSERT INTO `user_group` VALUES (8, '3', '进行访问', '访问');
INSERT INTO `user_group` VALUES (9, '2', '工作人员', '工作人员');
INSERT INTO `user_group` VALUES (10, '0', 'AI算法相关', 'AI算法部');
INSERT INTO `user_group` VALUES (11, '3', '进行自习', '自习');
INSERT INTO `user_group` VALUES (12, '3', '其它事情', '其它');
INSERT INTO `user_group` VALUES (13, '3', '后勤人员进行维修等工作', '维修');

-- ----------------------------
-- Table structure for visitor
-- ----------------------------
DROP TABLE IF EXISTS `visitor`;
CREATE TABLE `visitor`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `expired_time` datetime(0) NULL DEFAULT NULL,
  `real_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `telphone` int(0) NULL DEFAULT NULL,
  `visitor_group` int(0) NULL DEFAULT NULL,
  `sign_state` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of visitor
-- ----------------------------
INSERT INTO `visitor` VALUES (1, NULL, '2021-08-14 13:01:25', '访客-王老师', 3, 5, b'1');
INSERT INTO `visitor` VALUES (2, NULL, '2021-08-14 13:01:25', '李老师', NULL, 5, b'1');

-- ----------------------------
-- View structure for signlog_detail
-- ----------------------------
DROP VIEW IF EXISTS `signlog_detail`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `signlog_detail` AS select `sign_log`.`id` AS `id`,`sign_log`.`user_name` AS `user_name`,`sign_log`.`in_time` AS `in_time`,`sign_log`.`out_time` AS `out_time`,`sign_log`.`msg` AS `msg`,`sign_log`.`date` AS `date`,`a`.`name` AS `user_group`,`d`.`name` AS `to_do`,`b`.`name` AS `class_group`,`c`.`name` AS `unit_group`,`sign_log`.`sign_time` AS `sign_time` from ((((`sign_log` left join `user_group` `a` on((`sign_log`.`user_group` = `a`.`id`))) left join `user_group` `b` on((`sign_log`.`class_group` = `b`.`id`))) left join `user_group` `c` on((`sign_log`.`unit_group` = `c`.`id`))) left join `user_group` `d` on((`sign_log`.`to_do` = `d`.`id`)));

-- ----------------------------
-- View structure for user_detail
-- ----------------------------
DROP VIEW IF EXISTS `user_detail`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `user_detail` AS select `a`.`name` AS `user_group`,`user`.`id` AS `id`,`user`.`real_name` AS `real_name`,`user`.`status` AS `status`,`user`.`expired_time` AS `expired_time`,`user`.`sign_state` AS `sign_state`,`user`.`face_id` AS `face_id`,`b`.`name` AS `class_group`,`c`.`name` AS `unit_group` from (((`user` join `user_group` `a` on((`user`.`user_group` = `a`.`id`))) join `user_group` `b` on((`user`.`class_group` = `b`.`id`))) join `user_group` `c` on((`user`.`unit_group` = `c`.`id`)));

SET FOREIGN_KEY_CHECKS = 1;
