/*
 Navicat MySQL Data Transfer

 Source Server         : 服务器测试
 Source Server Type    : MySQL
 Source Server Version : 50650
 Source Host           : 139.224.231.217:3306
 Source Schema         : face_sign_in

 Target Server Type    : MySQL
 Target Server Version : 50650
 File Encoding         : 65001

 Date: 10/08/2021 16:38:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for e_dict
-- ----------------------------
DROP TABLE IF EXISTS `e_dict`;
CREATE TABLE `e_dict`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_user_id` bigint(20) NULL DEFAULT NULL,
  `update_user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKf5wwh5osfukkeebw7h2yb4kmp`(`code`) USING BTREE,
  INDEX `FKi8lurtplfsktg01y6uevop5yp`(`create_user_id`) USING BTREE,
  INDEX `FKhxpr89ae0g4rd9xpfgcdjf0sa`(`update_user_id`) USING BTREE,
  CONSTRAINT `FKhxpr89ae0g4rd9xpfgcdjf0sa` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKi8lurtplfsktg01y6uevop5yp` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of e_dict
-- ----------------------------

-- ----------------------------
-- Table structure for e_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `e_dict_item`;
CREATE TABLE `e_dict_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `create_user_id` bigint(20) NULL DEFAULT NULL,
  `update_user_id` bigint(20) NULL DEFAULT NULL,
  `erupt_dict_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKl0kiq8otpn3fvtlvarebt8xkh`(`code`, `erupt_dict_id`) USING BTREE,
  INDEX `FKij9x8hwy16dra7d49h483lu2u`(`create_user_id`) USING BTREE,
  INDEX `FKmlg0pjfxwih4i6r0g0iilh1lu`(`update_user_id`) USING BTREE,
  INDEX `FKrrbi2dt94rjd8sjt830m3w0a`(`erupt_dict_id`) USING BTREE,
  CONSTRAINT `FKij9x8hwy16dra7d49h483lu2u` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKmlg0pjfxwih4i6r0g0iilh1lu` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKrrbi2dt94rjd8sjt830m3w0a` FOREIGN KEY (`erupt_dict_id`) REFERENCES `e_dict` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of e_dict_item
-- ----------------------------

-- ----------------------------
-- Table structure for e_generator_class
-- ----------------------------
DROP TABLE IF EXISTS `e_generator_class`;
CREATE TABLE `e_generator_class`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `table_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_user_id` bigint(20) NULL DEFAULT NULL,
  `update_user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKbnmtsmoprxey1uh6hwa7kl15b`(`create_user_id`) USING BTREE,
  INDEX `FKl47n6nt0w2ulphuhmwht6jdlw`(`update_user_id`) USING BTREE,
  CONSTRAINT `FKbnmtsmoprxey1uh6hwa7kl15b` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKl47n6nt0w2ulphuhmwht6jdlw` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of e_generator_class
-- ----------------------------
INSERT INTO `e_generator_class` VALUES (1, '2021-08-09 11:17:34', '2021-08-09 17:35:43', 'User', '用户信息', NULL, 'user', 1, 1);
INSERT INTO `e_generator_class` VALUES (2, '2021-08-09 11:29:02', NULL, 'SignLog', '签到统计', NULL, 'sign_log', 1, NULL);
INSERT INTO `e_generator_class` VALUES (3, '2021-08-09 11:51:51', NULL, 'SystemVariables', '系统变量', NULL, 'system_variables', 1, NULL);

-- ----------------------------
-- Table structure for e_generator_field
-- ----------------------------
DROP TABLE IF EXISTS `e_generator_field`;
CREATE TABLE `e_generator_field`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_show` bit(1) NULL DEFAULT NULL,
  `link_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `not_null` bit(1) NULL DEFAULT NULL,
  `query` bit(1) NULL DEFAULT NULL,
  `show_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `sortable` bit(1) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `class_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKslwo9qwwfbgif9mbbhg072s4i`(`class_id`) USING BTREE,
  CONSTRAINT `FKslwo9qwwfbgif9mbbhg072s4i` FOREIGN KEY (`class_id`) REFERENCES `e_generator_class` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of e_generator_field
-- ----------------------------
INSERT INTO `e_generator_field` VALUES (1, 'realName', b'1', NULL, b'1', b'1', '用户姓名', 1, b'0', 'INPUT', 1);
INSERT INTO `e_generator_field` VALUES (2, 'userGroup', b'1', NULL, b'1', b'1', '用户组', 1, b'0', 'NUMBER', 1);
INSERT INTO `e_generator_field` VALUES (3, 'stuId', b'1', NULL, b'1', b'1', '学号', 1, b'0', 'NUMBER', 1);
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

-- ----------------------------
-- Table structure for e_upms_login_log
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_login_log`;
CREATE TABLE `e_upms_login_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `device_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `login_time` datetime NULL DEFAULT NULL,
  `region` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `system_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `erupt_user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKjqnr9oel32kajm6bpvqwomv6m`(`erupt_user_id`) USING BTREE,
  CONSTRAINT `FKjqnr9oel32kajm6bpvqwomv6m` FOREIGN KEY (`erupt_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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

-- ----------------------------
-- Table structure for e_upms_menu
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_menu`;
CREATE TABLE `e_upms_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `power_off` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_user_id` bigint(20) NULL DEFAULT NULL,
  `update_user_id` bigint(20) NULL DEFAULT NULL,
  `parent_menu_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK95xpkppt33d2bka0g2d7rgwqt`(`code`) USING BTREE,
  INDEX `FK4p5siq6l1rf9y47bosayghcsv`(`create_user_id`) USING BTREE,
  INDEX `FKtm66wffkyyluinneyva8kd2bc`(`update_user_id`) USING BTREE,
  INDEX `FK5mkgea183mm02v7ic1pdwxy5s`(`parent_menu_id`) USING BTREE,
  CONSTRAINT `FK4p5siq6l1rf9y47bosayghcsv` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK5mkgea183mm02v7ic1pdwxy5s` FOREIGN KEY (`parent_menu_id`) REFERENCES `e_upms_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKtm66wffkyyluinneyva8kd2bc` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of e_upms_menu
-- ----------------------------
INSERT INTO `e_upms_menu` VALUES (1, '2021-08-09 11:01:38', NULL, '$generator', 'fa fa-code', '代码生成', NULL, NULL, 40, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (2, '2021-08-09 11:01:38', NULL, 'GeneratorClass', NULL, '生成Erupt代码', NULL, NULL, 0, 1, 'table', 'GeneratorClass', NULL, NULL, 1);
INSERT INTO `e_upms_menu` VALUES (3, '2021-08-09 11:01:39', NULL, '$manager', 'fa fa-cogs', '系统管理', NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (4, '2021-08-09 11:01:39', NULL, 'EruptMenu', 'fa fa-list-ul', '菜单维护', NULL, NULL, 10, 1, 'tree', 'EruptMenu', NULL, NULL, 3);
INSERT INTO `e_upms_menu` VALUES (5, '2021-08-09 11:01:39', NULL, 'EruptRole', NULL, '角色维护', NULL, NULL, 20, 1, 'table', 'EruptRole', NULL, NULL, 3);
INSERT INTO `e_upms_menu` VALUES (6, '2021-08-09 11:01:39', NULL, 'EruptOrg', 'fa fa-users', '组织维护', NULL, NULL, 30, 1, 'tree', 'EruptOrg', NULL, NULL, 3);
INSERT INTO `e_upms_menu` VALUES (7, '2021-08-09 11:01:39', NULL, 'EruptPost', 'fa fa-id-card', '岗位维护', NULL, NULL, 35, 1, 'table', 'EruptPost', NULL, NULL, 3);
INSERT INTO `e_upms_menu` VALUES (8, '2021-08-09 11:01:39', NULL, 'EruptUser', 'fa fa-user', '用户维护', NULL, NULL, 40, 1, 'table', 'EruptUser', NULL, NULL, 3);
INSERT INTO `e_upms_menu` VALUES (9, '2021-08-09 11:01:39', NULL, 'EruptDict', NULL, '字典维护', NULL, NULL, 50, 1, 'table', 'EruptDict', NULL, NULL, 3);
INSERT INTO `e_upms_menu` VALUES (10, '2021-08-09 11:01:39', NULL, 'EruptDictItem', NULL, '字典项', NULL, NULL, 10, 2, 'table', 'EruptDictItem', NULL, NULL, 9);
INSERT INTO `e_upms_menu` VALUES (11, '2021-08-09 11:01:39', NULL, 'EruptLoginLog', NULL, '登录日志', NULL, NULL, 60, 1, 'table', 'EruptLoginLog', NULL, NULL, 3);
INSERT INTO `e_upms_menu` VALUES (12, '2021-08-09 11:01:39', NULL, 'EruptOperateLog', NULL, '操作日志', NULL, NULL, 70, 1, 'table', 'EruptOperateLog', NULL, NULL, 3);
INSERT INTO `e_upms_menu` VALUES (13, '2021-08-09 12:07:21', NULL, 'menu1', NULL, '通用签到考勤系统', NULL, NULL, 80, 1, 'tpl', 'menu1', 1, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (14, '2021-08-09 12:08:28', NULL, 'User', NULL, '用户管理', NULL, NULL, 90, 1, 'table', 'User', 1, NULL, 13);
INSERT INTO `e_upms_menu` VALUES (15, '2021-08-09 12:08:54', NULL, 'SignLog', NULL, '签到日志', NULL, NULL, 100, 1, 'table', 'SignLog', 1, NULL, 13);
INSERT INTO `e_upms_menu` VALUES (16, '2021-08-09 12:09:27', NULL, 'SystemVariables', NULL, '系统变量', NULL, NULL, 110, 1, 'table', 'SystemVariables', 1, NULL, 13);

-- ----------------------------
-- Table structure for e_upms_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_operate_log`;
CREATE TABLE `e_upms_operate_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `api_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `error_info` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `region` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `req_addr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `req_method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `req_param` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT NULL,
  `total_time` bigint(20) NULL DEFAULT NULL,
  `erupt_user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK27xepkxthq9snq3yk6k7iad33`(`erupt_user_id`) USING BTREE,
  CONSTRAINT `FK27xepkxthq9snq3yk6k7iad33` FOREIGN KEY (`erupt_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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

-- ----------------------------
-- Table structure for e_upms_org
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_org`;
CREATE TABLE `e_upms_org`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `parent_org_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKtj7222kjnkt7pv9kfn9g8ck4h`(`parent_org_id`) USING BTREE,
  CONSTRAINT `FKtj7222kjnkt7pv9kfn9g8ck4h` FOREIGN KEY (`parent_org_id`) REFERENCES `e_upms_org` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of e_upms_org
-- ----------------------------

-- ----------------------------
-- Table structure for e_upms_post
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_post`;
CREATE TABLE `e_upms_post`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weight` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKltq5h3n5cyyk5nxtjhg9lhidg`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of e_upms_post
-- ----------------------------

-- ----------------------------
-- Table structure for e_upms_role
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_role`;
CREATE TABLE `e_upms_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `power_off` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKjgxkp7mr4183tcwosrbqpsl3a`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of e_upms_role
-- ----------------------------
INSERT INTO `e_upms_role` VALUES (1, 'admin', '普通管理员', NULL, b'1');

-- ----------------------------
-- Table structure for e_upms_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_role_menu`;
CREATE TABLE `e_upms_role_menu`  (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE,
  INDEX `FKr6bl403chgwjnb6jk0uqqd9x8`(`menu_id`) USING BTREE,
  CONSTRAINT `FKgsdnakqsme4htxkiapwmf6tbi` FOREIGN KEY (`role_id`) REFERENCES `e_upms_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKr6bl403chgwjnb6jk0uqqd9x8` FOREIGN KEY (`menu_id`) REFERENCES `e_upms_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of e_upms_role_menu
-- ----------------------------
INSERT INTO `e_upms_role_menu` VALUES (1, 13);
INSERT INTO `e_upms_role_menu` VALUES (1, 14);
INSERT INTO `e_upms_role_menu` VALUES (1, 15);
INSERT INTO `e_upms_role_menu` VALUES (1, 16);

-- ----------------------------
-- Table structure for e_upms_user
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_user`;
CREATE TABLE `e_upms_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_admin` bit(1) NULL DEFAULT NULL,
  `is_md5` bit(1) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT NULL,
  `white_ip` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `erupt_org_id` bigint(20) NULL DEFAULT NULL,
  `erupt_post_id` bigint(20) NULL DEFAULT NULL,
  `create_user_id` bigint(20) NULL DEFAULT NULL,
  `update_user_id` bigint(20) NULL DEFAULT NULL,
  `erupt_menu_id` bigint(20) NULL DEFAULT NULL,
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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of e_upms_user
-- ----------------------------
INSERT INTO `e_upms_user` VALUES (1, 'erupt', '2021-08-09 11:01:39', NULL, 'erupt', NULL, b'1', b'1', '610d44f73b7709169e8e06ca4ac5af8e', NULL, NULL, b'1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `e_upms_user` VALUES (2, '李灵智', '2021-08-09 21:06:25', NULL, '404name', NULL, b'0', b'1', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, b'1', NULL, NULL, NULL, 1, NULL, 14);

-- ----------------------------
-- Table structure for e_upms_user_role
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_user_role`;
CREATE TABLE `e_upms_user_role`  (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`, `user_id`) USING BTREE,
  INDEX `FKes2ylim5w3ej690ss84sb956x`(`user_id`) USING BTREE,
  CONSTRAINT `FK3h4lekfh26f5f8b7by3ejges6` FOREIGN KEY (`role_id`) REFERENCES `e_upms_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKes2ylim5w3ej690ss84sb956x` FOREIGN KEY (`user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of e_upms_user_role
-- ----------------------------
INSERT INTO `e_upms_user_role` VALUES (2, 1);

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
  `unit` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sign_log
-- ----------------------------
INSERT INTO `sign_log` VALUES (1, '李灵智', '12:17:22', NULL, '12:17:59', '1.5', '0', '1', '2021-08-09 00:00:00', 1, 1);
INSERT INTO `sign_log` VALUES (2, '李灵智', '21:15:50', '无', '21:59:50', '2.0', '0', '0', '2021-08-10 00:00:00', 1, 1);
INSERT INTO `sign_log` VALUES (7, '李灵智', '12:00:00', '无', '15:00:00', '3', '3', '0', '2021-08-10 00:00:00', 1, 1);
INSERT INTO `sign_log` VALUES (8, '李灵智', '07:00:00', '无', '08:00:00', '3', '1', '0', '2021-08-10 00:00:00', 1, 2);
INSERT INTO `sign_log` VALUES (9, '李灵智', '7:00:00', '无', '8:00:00', '3', '3', '0', '2021-08-12 00:00:00', 1, 2);
INSERT INTO `sign_log` VALUES (10, '李灵智', '7:00:00', '无', '8:00:00', '3', '3', '0', '2021-08-13 00:00:00', 1, 1);
INSERT INTO `sign_log` VALUES (11, '李灵智', '16:14:30', '签到', '16:21:23', '0.5', '1', '0', '2021-08-10 00:00:00', 1, 1);
INSERT INTO `sign_log` VALUES (12, '李灵智', '16:28:43', '测试', '16:30:55', '0.5', '1', '0', '2021-08-10 00:00:00', 1, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of system_variables
-- ----------------------------
INSERT INTO `system_variables` VALUES (1, 'toDO', '[\"学习\",\"实验\",\"请教问题\",\"杂物打理\",\"其他\"]', '事由表');
INSERT INTO `system_variables` VALUES (2, 'userStatus', '[\"游客\",\"激活\",\"禁用\"]', '用户状态表');
INSERT INTO `system_variables` VALUES (3, 'userGroup', '[\"开发课题组\",\"硬件课题组\",\"算法课题组\"]', '用户课题组');
INSERT INTO `system_variables` VALUES (4, 'startTime', '08:00:00', '打卡起止时间');
INSERT INTO `system_variables` VALUES (5, 'leaveTime', '22:00:00', '默认结束时间');
INSERT INTO `system_variables` VALUES (6, 'feedbackList', '[\"测试\",\"哈哈\",\"哈哈\",\"芜湖\"]', '用户反馈表');
INSERT INTO `system_variables` VALUES (7, 'unit', '[\"研发部\",\"市场部\",\"后勤部\",\"办公部\"]', '单位表');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stu_id` int(11) NULL DEFAULT NULL,
  `touch_id` int(11) NULL DEFAULT NULL,
  `user_group` int(11) NULL DEFAULT NULL,
  `now_sign_id` int(11) NULL DEFAULT NULL,
  `face_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `unit` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '李灵智', '1', 2019112404, 1, 0, NULL, '0056acac40284a1ee703d2c5d9bab03b', 1);
INSERT INTO `user` VALUES (2, '高质量男性', '0', 2012404, NULL, 1, NULL, 'e69aa8e122a69e6dd4da5804a7bdefec', 1);
INSERT INTO `user` VALUES (3, '随便找的boy', '0', 20112404, NULL, 2, NULL, '50139fadc89518d86324c0c24356201a', 2);
INSERT INTO `user` VALUES (4, '测试用户', '0', 201911404, NULL, 1, NULL, NULL, 2);
INSERT INTO `user` VALUES (5, '灵智', '0', 201911204, NULL, 1, NULL, NULL, 3);

SET FOREIGN_KEY_CHECKS = 1;
