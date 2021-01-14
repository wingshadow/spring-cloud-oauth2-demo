/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : dld2

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 12/01/2021 16:51:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for oauth_access_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_token`;
CREATE TABLE `oauth_access_token`  (
  `token_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `token` blob NULL,
  `authentication_id` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `client_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authentication` blob NULL,
  `refresh_token` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`authentication_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_access_token
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_approvals
-- ----------------------------
DROP TABLE IF EXISTS `oauth_approvals`;
CREATE TABLE `oauth_approvals`  (
  `userId` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `clientId` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scope` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expiresAt` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `lastModifiedAt` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_approvals
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details`  (
  `client_id` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `resource_ids` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `client_secret` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scope` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authorized_grant_types` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authorities` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `access_token_validity` int(11) NULL DEFAULT NULL,
  `refresh_token_validity` int(11) NULL DEFAULT NULL,
  `additional_information` varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `autoapprove` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
INSERT INTO `oauth_client_details` VALUES ('app', NULL, 'app', 'app', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oauth_client_details` VALUES ('XcWebApp', NULL, '$2a$10$9bEpZ/hWRQxyr5hn5wHUj.jxFpIrnOmBcWlE/g/0Zp3uNxt9QTh/S', 'app', 'authorization_code,password,mobile,refresh_token,client_credentials', NULL, NULL, 43200, 43200, NULL, NULL);

-- ----------------------------
-- Table structure for oauth_client_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_token`;
CREATE TABLE `oauth_client_token`  (
  `token_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `token` blob NULL,
  `authentication_id` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `client_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`authentication_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_client_token
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_code
-- ----------------------------
DROP TABLE IF EXISTS `oauth_code`;
CREATE TABLE `oauth_code`  (
  `code` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authentication` blob NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_code
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_refresh_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_token`;
CREATE TABLE `oauth_refresh_token`  (
  `token_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `token` blob NULL,
  `authentication` blob NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_refresh_token
-- ----------------------------
INSERT INTO `oauth_refresh_token` VALUES ('b96e057b4e1c4920428e833db48d4c15', 0xEFBFBDEFBFBD00057372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FEFBFBD4763EFBFBDEFBFBDC9B70200014C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73EFBFBD0E0A6354EFBFBD5E0200014C000576616C75657400124C6A6176612F6C616E672F537472696E673B787074002462303132643438372D613930382D343361662D613865662D3533633533393963386264367372000E6A6176612E7574696C2E44617465686AEFBFBD014B59741903000078707708000001613B74C98E78, 0xEFBFBDEFBFBD0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EEFBFBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374EFBFBD0F2531EFBFBDEFBFBD100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E194200EFBFBDEFBFBD5EEFBFBD1E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C69737478EFBFBDEFBFBD1DEFBFBDEFBFBD61EFBFBD03000149000473697A65787000000009770400000009737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001EFBFBD0200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B787074000A524F4C455F61646D696E7371007E000D740006617069646F637371007E000D74000C64617461626173652F6C6F677371007E000D74000673797374656D7371007E000D740008757365722F6164647371007E000D74000B757365722F64656C6574657371007E000D740009757365722F656469747371007E000D740009757365722F766965777371007E000D740008757365724C6973747871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200075A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C00077265667265736874003B4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F546F6B656E526571756573743B4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0024787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EEFBFBD7169EFBFBD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00224C000573636F706571007E00247870740006776562417070737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170EFBFBDEFBFBD74EFBFBD07420200014C00016D71007E00227870737200116A6176612E7574696C2E486173684D61700507EFBFBDEFBFBDEFBFBD1660EFBFBD03000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000037708000000040000000274000A6772616E745F7479706574000870617373776F7264740008757365726E616D6574000561646D696E78737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574EFBFBD1DEFBFBDD18FEFBFBDEFBFBD550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574EFBFBD6CEFBFBD5AEFBFBDEFBFBD2A1E020000787200116A6176612E7574696C2E48617368536574EFBFBD44EFBFBDEFBFBDEFBFBDEFBFBDEFBFBD340300007870770C000000103F4000000000000174000361707078017371007E0033770C000000103F40000000000000787371007E002A3F40000000000000770800000010000000007870707371007E0033770C000000103F40000000000000787371007E0033770C000000103F40000000000000787372004F6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E00000000000001EFBFBD0200024C000B63726564656E7469616C7371007E00054C00097072696E636970616C71007E00057871007E0003017371007E00077371007E000B0000000977040000000971007E000F71007E001171007E001371007E001571007E001771007E001971007E001B71007E001D71007E001F7871007E003D737200176A6176612E7574696C2E4C696E6B6564486173684D617034EFBFBD4E5C106CEFBFBDEFBFBD0200015A000B6163636573734F726465727871007E002A3F400000000000067708000000080000000271007E002C71007E002D71007E002E71007E002F780070737200326F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657200000000000001EFBFBD0200075A00116163636F756E744E6F6E457870697265645A00106163636F756E744E6F6E4C6F636B65645A001563726564656E7469616C734E6F6E457870697265645A0007656E61626C65644C000B617574686F72697469657371007E00244C000870617373776F726471007E000E4C0008757365726E616D6571007E000E7870010101017371007E0030737200116A6176612E7574696C2E54726565536574DD9850EFBFBDEFBFBDEFBFBD5B0300007870737200466F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657224417574686F72697479436F6D70617261746F7200000000000001EFBFBD020000787077040000000971007E000F71007E001171007E001371007E001571007E001771007E001971007E001B71007E001D71007E001F787074000561646D696E);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据值',
  `label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签名',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `sort` decimal(10, 0) NOT NULL COMMENT '排序（升序）',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '上级机构ID，一级机构为0',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '1:学校 2：实践基地 3：运营',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_update_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '机构管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (2, '多乐多', 0, 1, 2, 'admin', '2018-09-23 19:35:55', NULL, NULL, 0);
INSERT INTO `sys_dept` VALUES (3, '历城微视频', 2, 1, NULL, 'admin', '2020-10-29 17:12:17', NULL, NULL, NULL);
INSERT INTO `sys_dept` VALUES (4, '平阴微视频', 2, 2, NULL, 'admin', '2020-10-29 17:12:40', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据值',
  `label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签名',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `sort` int(10) NOT NULL COMMENT '排序（升序）',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 259353136886583297 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (259352796753694720, '1', '学习教育', 'wx_title_icon', 'desc', 1, 'admin', '2020-09-15 16:15:25', 'admin', '2020-09-15 16:15:45', 'remark', NULL);
INSERT INTO `sys_dict` VALUES (259352984285220864, '2', '岗位培训', 'wx_title_icon', 'desc', 2, 'admin', '2020-09-15 16:16:09', NULL, NULL, 'remark', NULL);
INSERT INTO `sys_dict` VALUES (259353070314590208, '3', '学习参考', 'wx_title_icon', 'desc', 3, 'admin', '2020-09-15 16:16:30', NULL, NULL, 'remark', NULL);
INSERT INTO `sys_dict` VALUES (259353136886583296, '4', '我的', 'wx_title_icon', 'desc', 4, 'admin', '2020-09-15 16:16:46', NULL, NULL, 'remark', NULL);

-- ----------------------------
-- Table structure for sys_express
-- ----------------------------
DROP TABLE IF EXISTS `sys_express`;
CREATE TABLE `sys_express`  (
  `id` bigint(20) NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 物流公司代码',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '物流公司表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_express
-- ----------------------------

-- ----------------------------
-- Table structure for sys_grade
-- ----------------------------
DROP TABLE IF EXISTS `sys_grade`;
CREATE TABLE `sys_grade`  (
  `id` bigint(20) NOT NULL,
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '学校主键',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班级名称',
  `is_delete` tinyint(2) NULL DEFAULT NULL COMMENT '0：未删除 1：已删除',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '班级管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_grade
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `params` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统操作日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统登录日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `perms` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_update_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 275216777846329345 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, '/Teacher/List', '', 0, 'fa fa-cog', 99, NULL, NULL, 'admin', '2020-10-29 10:48:35', 0);
INSERT INTO `sys_menu` VALUES (2, '用户管理', 1, '/sys/user', NULL, 1, 'el-icon-service', 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (3, '查看', 2, NULL, 'sys:user:view', 2, NULL, 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (4, '新增', 2, NULL, 'sys:user:add', 2, NULL, 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (5, '修改', 2, NULL, 'sys:user:edit', 2, NULL, 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (6, '删除', 2, NULL, 'sys:user:delete', 2, NULL, 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (7, '机构管理', 1, '/sys/dept', NULL, 1, 'el-icon-news', 2, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (8, '查看', 7, NULL, 'sys:dept:view', 2, NULL, 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (9, '新增', 7, NULL, 'sys:dept:add', 2, NULL, 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (10, '修改', 7, NULL, 'sys:dept:edit', 2, NULL, 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (11, '删除', 7, NULL, 'sys:dept:delete', 2, NULL, 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (12, '角色管理', 1, '/sys/role', NULL, 1, 'el-icon-view', 4, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (13, '查看', 12, NULL, 'sys:role:view', 2, NULL, 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (14, '新增', 12, NULL, 'sys:role:add', 2, NULL, 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (15, '修改', 12, NULL, 'sys:role:edit', 2, NULL, 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (16, '删除', 12, NULL, 'sys:role:delete', 2, NULL, 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (17, '菜单管理', 1, '/sys/menu', NULL, 1, 'el-icon-menu', 5, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (18, '查看', 17, NULL, 'sys:menu:view', 2, NULL, 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (19, '新增', 17, NULL, 'sys:menu:add', 2, NULL, 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (20, '修改', 17, NULL, 'sys:menu:edit', 2, NULL, 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (21, '删除', 17, NULL, 'sys:menu:delete', 2, NULL, 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (22, '字典管理', 1, '/sys/dict', NULL, 1, 'el-icon-edit-outline', 7, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (23, '查看', 22, NULL, 'sys:dict:view', 2, NULL, 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (24, '新增', 22, NULL, 'sys:dict:add', 2, NULL, 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (25, '修改', 22, NULL, 'sys:dict:edit', 2, NULL, 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (26, '删除', 22, NULL, 'sys:dict:delete', 2, NULL, 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (27, '系统配置', 1, '/sys/config', NULL, 1, 'el-icon-edit-outline', 7, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (28, '查看', 27, NULL, 'sys:config:view', 2, NULL, 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (29, '新增', 27, NULL, 'sys:config:add', 2, NULL, 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (30, '修改', 27, NULL, 'sys:config:edit', 2, NULL, 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (31, '删除', 27, NULL, 'sys:config:delete', 2, NULL, 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (32, '登录日志', 1, '/sys/loginlog', NULL, 1, 'el-icon-info', 8, NULL, NULL, 'admin', '2018-09-23 19:32:28', 0);
INSERT INTO `sys_menu` VALUES (33, '查看', 32, NULL, 'sys:loginlog:view', 2, NULL, 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (34, '删除', 32, NULL, 'sys:loginlog:delete', 2, NULL, 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (35, '操作日志', 1, '/sys/log', NULL, 1, 'el-icon-info', 8, NULL, NULL, 'admin', '2018-09-23 19:32:28', 0);
INSERT INTO `sys_menu` VALUES (36, '查看', 35, NULL, 'sys:log:view', 2, NULL, 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (37, '删除', 35, NULL, 'sys:log:delete', 2, NULL, 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (228532836645343232, '栏目管理', 259003898298241024, '/cms/categoryIndex', '', 1, '', 0, 'admin', '2020-06-22 15:07:54', 'admin', '2020-06-22 15:30:23', NULL);
INSERT INTO `sys_menu` VALUES (228532956023623680, '查询', 228532836645343232, '', 'buiss:category:view', 2, '', 0, 'admin', '2020-06-22 15:08:23', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (228533128245940224, '编辑', 228532836645343232, '', 'buiss:category:edit', 2, '', 0, 'admin', '2020-06-22 15:09:04', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (228533236224102400, '新增', 228532836645343232, '', 'buiss:category:add', 2, '', 0, 'admin', '2020-06-22 15:09:29', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (228533313210552320, '删除', 228532836645343232, '', 'buiss:category:delete', 2, '', 0, 'admin', '2020-06-22 15:09:48', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (229189083509952512, '内容管理', 259003898298241024, '/cms/contentIndex', '', 1, '', 0, 'admin', '2020-06-24 10:35:36', 'admin', '2020-06-24 10:36:01', NULL);
INSERT INTO `sys_menu` VALUES (229189921833881600, '新增', 229189083509952512, '', 'buiss:content:add', 2, '', 0, 'admin', '2020-06-24 10:38:56', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (229190237434286080, '修改', 229189083509952512, '', 'buiss:content:edit', 2, '', 0, 'admin', '2020-06-24 10:40:11', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (229190419521605632, '查询', 229189083509952512, '', 'buiss:content:view', 2, '', 0, 'admin', '2020-06-24 10:40:54', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (229190535267618816, '删除', 229189083509952512, '', 'buiss:content:delete', 2, '', 0, 'admin', '2020-06-24 10:41:22', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (259003898298241024, 'CMS', 0, '', '', 0, 'fa fa-cube', 3, 'admin', '2020-09-14 17:09:01', 'admin', '2020-10-29 10:47:21', NULL);
INSERT INTO `sys_menu` VALUES (259379084646289408, '轮播图管理', 259003898298241024, '/banner/bannerIndex', '', 1, '', 0, 'admin', '2020-09-15 17:59:53', 'admin', '2020-09-18 17:19:35', NULL);
INSERT INTO `sys_menu` VALUES (259379751230246912, '查询', 259379084646289408, '', 'buiss:banner:view', 2, '', 0, 'admin', '2020-09-15 18:02:32', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (259379951160135680, '删除', 259379084646289408, '', 'buiss:banner:delete', 2, '', 0, 'admin', '2020-09-15 18:03:19', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (259380045758468096, '编辑', 259379084646289408, '', 'buiss:banner:edit', 2, '', 0, 'admin', '2020-09-15 18:03:42', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (259380457689452544, '新增', 259379084646289408, '', 'buiss:banner:add', 2, '', 0, 'admin', '2020-09-15 18:05:20', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (259746588484833280, '课程管理', 0, '/course/List', '', 1, 'fa fa-calendar-plus-o', 0, 'admin', '2020-09-16 18:20:13', 'admin', '2020-10-29 10:45:44', 0);
INSERT INTO `sys_menu` VALUES (259747095936897024, '课件管理', 0, '/courseware/list', '', 1, 'fa fa-cc', 0, 'admin', '2020-09-16 18:22:14', 'admin', '2020-10-29 10:46:49', NULL);
INSERT INTO `sys_menu` VALUES (259971407717470208, '查看', 259746588484833280, '', 'course:list:view', 2, '', 0, 'admin', '2020-09-17 09:13:34', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (259974034295492608, '修改', 259746588484833280, '', 'course:list:edit', 2, '', 0, 'admin', '2020-09-17 09:24:00', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (259974160606957568, '删除', 259746588484833280, '', 'course:list:delete', 2, '', 0, 'admin', '2020-09-17 09:24:30', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (259974298675056640, '添加', 259746588484833280, '', 'course:list:add', 2, '', 0, 'admin', '2020-09-17 09:25:03', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (259975490838859776, '章节管理', 259746588484833280, '', 'course:list:chapter', 2, '', 0, 'admin', '2020-09-17 09:29:47', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (259975615476797440, '课件管理', 259746588484833280, '', 'course:list:ware', 2, '', 0, 'admin', '2020-09-17 09:30:17', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (259976669073379328, '查看', 259747095936897024, '', 'courseware:list:view', 2, '', 0, 'admin', '2020-09-17 09:34:28', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (259976813374214144, '添加', 259747095936897024, '', 'courseware:list:add', 2, '', 0, 'admin', '2020-09-17 09:35:02', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (259976944681095168, '修改', 259747095936897024, '', 'courseware:list:edit', 2, '', 0, 'admin', '2020-09-17 09:35:34', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (259977067288989696, '删除', 259747095936897024, '', 'courseware:list:delete', 2, '', 0, 'admin', '2020-09-17 09:36:03', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (260139324249608192, '培训方案', 264715073275170816, '/Scheme/List', '', 1, '', 0, 'admin', '2020-09-17 20:20:48', 'admin', '2020-10-07 13:17:06', NULL);
INSERT INTO `sys_menu` VALUES (260359452073529344, '查看', 260139324249608192, '', 'scheme:list:view', 2, '', 0, 'admin', '2020-09-18 10:55:31', 'admin', '2020-09-24 14:42:38', NULL);
INSERT INTO `sys_menu` VALUES (260359548387332096, '添加', 260139324249608192, '', 'scheme:list:add', 2, '', 0, 'admin', '2020-09-18 10:55:54', 'admin', '2020-09-24 14:42:28', NULL);
INSERT INTO `sys_menu` VALUES (260359689575993344, '修改', 260139324249608192, '', 'scheme:list:edit', 2, '', 0, 'admin', '2020-09-18 10:56:27', 'admin', '2020-09-24 14:42:17', NULL);
INSERT INTO `sys_menu` VALUES (260359784031719424, '删除', 260139324249608192, '', 'scheme:list:delete', 2, '', 0, 'admin', '2020-09-18 10:56:50', 'admin', '2020-09-24 14:42:06', NULL);
INSERT INTO `sys_menu` VALUES (260527885817876480, '教师管理', NULL, '/Teacher/List', '', 1, 'fa fa-user', 0, 'admin', '2020-09-18 22:04:48', 'admin', '2020-09-18 22:22:37', NULL);
INSERT INTO `sys_menu` VALUES (260875387486212096, '添加', 260527885817876480, '', 'teacher:list:add', 2, '', 1, 'admin', '2020-09-19 21:05:39', 'admin', '2020-09-19 21:10:27', NULL);
INSERT INTO `sys_menu` VALUES (260875516796604416, '修改', 260527885817876480, '', 'teacher:list:edit', 2, '', 2, 'admin', '2020-09-19 21:06:10', 'admin', '2020-09-19 21:10:35', NULL);
INSERT INTO `sys_menu` VALUES (260875735730884608, '删除', 260527885817876480, '', 'teacher:list:delete', 2, '', 3, 'admin', '2020-09-19 21:07:02', 'admin', '2020-09-19 21:10:44', NULL);
INSERT INTO `sys_menu` VALUES (260875877007626240, '查看', 260527885817876480, '', 'teacher:list:view', 2, '', 0, 'admin', '2020-09-19 21:07:36', 'admin', '2020-09-19 21:09:42', NULL);
INSERT INTO `sys_menu` VALUES (260875997807775744, '批量删除', 260527885817876480, '', 'teacher:list:batchDel', 2, '', 4, 'admin', '2020-09-19 21:08:05', 'admin', '2020-09-19 21:10:52', NULL);
INSERT INTO `sys_menu` VALUES (260875997807775745, '学生管理', 0, '/Student/List', '', 1, 'fa fa-user-circle-o', 0, NULL, NULL, 'admin', '2020-10-29 10:42:03', 0);
INSERT INTO `sys_menu` VALUES (260875997807775746, '查看', 260875997807775745, '', 'student:list:view', 2, '', 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (260875997807775747, '添加', 260875997807775745, '', 'student:list:add', 2, '', 2, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (260875997807775748, '修改', 260875997807775745, '', 'student:list:edit', 2, '', 3, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (260875997807775749, '删除', 260875997807775745, '', 'student:list:delete', 2, '', 4, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (260875997807775750, '批量删除', 260875997807775745, '', 'student:list:batchDel', 2, '', 5, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (260875997807775751, '班级管理', 0, '/Grade/List', '', 1, 'fa fa-suitcase', 0, NULL, NULL, 'admin', '2020-10-29 10:43:02', 0);
INSERT INTO `sys_menu` VALUES (260875997807775752, '查看', 260875997807775751, '', 'grade:list:view', 2, '', 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (260875997807775753, '添加', 260875997807775751, '', 'grade:list:add', 2, '', 2, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (260875997807775754, '修改', 260875997807775751, '', 'grade:list:edit', 2, '', 3, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (260875997807775755, '删除', 260875997807775751, '', 'grade:list:delete', 2, '', 4, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (260875997807775756, '批量删除', 260875997807775751, '', 'grade:list:batchDel', 2, '', 5, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (261791080293470208, '激活', 260527885817876480, '', 'teacher:list:activate', 2, '', 5, 'admin', '2020-09-22 09:44:17', 'admin', '2020-09-22 09:44:40', NULL);
INSERT INTO `sys_menu` VALUES (261791285122306048, '冻结', 260527885817876480, '', 'teacher:list:frozen', 2, '', 0, 'admin', '2020-09-22 09:45:06', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (262147533030166528, '教师列表', 260875997807775751, '', 'grade:list:teachers', 2, '', 0, 'admin', '2020-09-23 09:20:42', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (262230668900175872, '重置密码', 260875997807775745, '', 'student:list:resetPwd', 2, '', 0, 'admin', '2020-09-23 14:51:03', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (262240594372464640, '重置密码', 260527885817876480, '', 'teacher:list:resetPwd', 2, '', 0, 'admin', '2020-09-23 15:30:30', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (264715073275170816, '培训管理', 0, '', '', 0, 'fa fa-calendar-o', 0, 'admin', '2020-09-30 11:23:12', 'admin', '2020-10-29 10:46:24', NULL);
INSERT INTO `sys_menu` VALUES (264715073275170817, '视频方案种类管理', 264715073275170816, '/SchemeCategory/List', '', 1, '', 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (264715073275170818, '查看', 264715073275170817, '', 'schemeCategory:list:view', 2, '', 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (264715073275170819, '添加', 264715073275170817, '', 'schemeCategory:list:add', 2, '', 2, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (264715073275170820, '修改', 264715073275170817, '', 'schemeCategory:list:edit', 2, '', 3, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (264715073275170821, '删除', 264715073275170817, '', 'schemeCategory:list:delete', 2, '', 4, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (269855488060035072, '绑定种类', 260139324249608192, '', 'scheme:list:bind', 2, '', 0, 'admin', '2020-10-14 15:49:22', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (269878850203291648, '绑定课程', 260139324249608192, '', 'scheme:list:bindCourse', 2, '', 0, 'admin', '2020-10-14 17:22:12', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (275215979980656640, '交易管理', 0, '', '', 0, 'fa fa-bars', 5, 'admin', '2020-10-29 10:50:03', 'admin', '2020-10-29 10:53:29', NULL);
INSERT INTO `sys_menu` VALUES (275216300119298048, '订单管理', 275215979980656640, '/order/index', 'biz:order:list', 1, 'fa fa-shopping-bag', 1, 'admin', '2020-10-29 10:51:19', 'admin', '2020-10-29 10:54:28', NULL);
INSERT INTO `sys_menu` VALUES (275216777846329344, '支付管理', 275215979980656640, '/paylog/index', '', 1, 'fa fa-credit-card', 2, 'admin', '2020-10-29 10:53:13', 'admin', '2020-10-29 10:54:09', NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_update_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'admin', '超级管理员', 'admin', '2019-01-19 11:11:11', 'admin', '2019-01-19 19:07:18', 0);
INSERT INTO `sys_role` VALUES (2, 'mng', '项目经理', 'admin', '2019-01-19 11:11:11', 'admin', '2019-01-19 11:39:28', 0);
INSERT INTO `sys_role` VALUES (3, 'dev', '开发人员', 'admin', '2019-01-19 11:11:11', 'admin', '2019-01-19 11:39:28', 0);
INSERT INTO `sys_role` VALUES (4, 'test', '测试人员', 'admin', '2019-01-19 11:11:11', 'admin', '2019-01-19 11:11:11', 0);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '机构ID',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色机构' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (1, 1, 1, 'admin', '2019-01-11 08:30:37', 'admin', '2019-01-11 08:30:25');
INSERT INTO `sys_role_dept` VALUES (2, 2, 2, 'admin', '2019-01-11 08:31:01', 'admin', '2019-01-11 08:31:04');
INSERT INTO `sys_role_dept` VALUES (3, 3, 3, 'admin', '2019-01-11 08:31:18', 'admin', '2019-01-11 08:31:21');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单ID',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 233567653069983759 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (431, 8, 1, 'admin', '2018-09-23 19:55:08', NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (432, 8, 2, 'admin', '2018-09-23 19:55:08', NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (433, 8, 9, 'admin', '2018-09-23 19:55:08', NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (434, 8, 3, 'admin', '2018-09-23 19:55:08', NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (435, 8, 13, 'admin', '2018-09-23 19:55:08', NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (436, 8, 4, 'admin', '2018-09-23 19:55:08', NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (437, 8, 17, 'admin', '2018-09-23 19:55:08', NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (438, 8, 5, 'admin', '2018-09-23 19:55:08', NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (439, 8, 21, 'admin', '2018-09-23 19:55:08', NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (440, 8, 7, 'admin', '2018-09-23 19:55:08', NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (441, 8, 31, 'admin', '2018-09-23 19:55:08', NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (442, 8, 8, 'admin', '2018-09-23 19:55:08', NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (443, 8, 6, 'admin', '2018-09-23 19:55:08', NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (444, 8, 35, 'admin', '2018-09-23 19:55:08', NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (147359226178703360, 147359155982831616, 1, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (147359226178703361, 147359155982831616, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (147359226178703362, 147359155982831616, 3, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (147359226178703363, 147359155982831616, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (147359226178703364, 147359155982831616, 5, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (147359226178703365, 147359155982831616, 6, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (147359226178703366, 147359155982831616, 7, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (147359226178703367, 147359155982831616, 8, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (147359226178703368, 147359155982831616, 9, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (147359226178703369, 147359155982831616, 10, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (147359226178703370, 147359155982831616, 11, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (147359226178703371, 147359155982831616, 12, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (147359226178703372, 147359155982831616, 13, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (147359226178703373, 147359155982831616, 14, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (147359226178703374, 147359155982831616, 15, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (147359226178703375, 147359155982831616, 16, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (147359226178703376, 147359155982831616, 17, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (147359226178703377, 147359155982831616, 18, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (147359226178703378, 147359155982831616, 19, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (147359226178703379, 147359155982831616, 20, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (147359226178703380, 147359155982831616, 21, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (147359226178703381, 147359155982831616, 22, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (147359226178703382, 147359155982831616, 23, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (147359226178703383, 147359155982831616, 24, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (147359226178703384, 147359155982831616, 25, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (147359226178703385, 147359155982831616, 26, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (147359226178703386, 147359155982831616, 27, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (147359226178703387, 147359155982831616, 28, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (147359226178703388, 147359155982831616, 29, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (147359226178703389, 147359155982831616, 30, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (147359226178703390, 147359155982831616, 31, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (147359226178703391, 147359155982831616, 32, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (147359226178703392, 147359155982831616, 33, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (147359226178703393, 147359155982831616, 34, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (147359226178703394, 147359155982831616, 35, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (147359226178703395, 147359155982831616, 36, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (147359226178703396, 147359155982831616, 37, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (153806952856686592, 4, 1, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (153806952856686593, 4, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (153806952856686594, 4, 3, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (153806952856686595, 4, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (153806952856686596, 4, 5, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (153806952856686597, 4, 6, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (153806952856686598, 4, 7, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (153806952856686599, 4, 8, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (153806952856686600, 4, 9, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (153806952856686601, 4, 10, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (153806952856686602, 4, 11, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (153806952856686603, 4, 12, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (153806952856686604, 4, 13, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (153806952856686605, 4, 14, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (153806952856686606, 4, 15, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (153806952856686607, 4, 16, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (153806952856686608, 4, 17, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (153806952856686609, 4, 18, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (153806952856686610, 4, 19, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (153806952856686611, 4, 20, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (153806952856686612, 4, 21, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (153806952856686613, 4, 22, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (153806952856686614, 4, 23, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (153806952856686615, 4, 24, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (153806952856686616, 4, 25, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (153806952856686617, 4, 26, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (153806952856686618, 4, 27, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (153806952856686619, 4, 28, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (153806952856686620, 4, 29, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (153806952856686621, 4, 30, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (153806952856686622, 4, 31, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (153806952856686623, 4, 32, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (153806952856686624, 4, 33, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (153806952856686625, 4, 34, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (153806952856686626, 4, 35, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (153806952856686627, 4, 36, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (153806952856686628, 4, 37, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (230773033621655552, 3, 228532396557996032, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (230773033621655553, 3, 229189083509952512, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (230773033621655554, 3, 229189921833881600, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (230773033621655555, 3, 229190237434286080, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (230773033621655556, 3, 229190535267618816, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (230773033621655557, 3, 229190419521605632, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (230773033621655558, 3, 228532836645343232, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (230773033621655559, 3, 228532956023623680, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (230773033621655560, 3, 228533313210552320, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (230773033621655561, 3, 228533128245940224, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (230773033621655562, 3, 228533236224102400, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (233567653069983744, 2, 225302779751698432, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (233567653069983745, 2, 225303555098152960, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (233567653069983746, 2, 225303664204582912, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (233567653069983747, 2, 225303791451377664, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (233567653069983748, 2, 232907995518996480, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (233567653069983749, 2, 232908158903914496, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (233567653069983750, 2, 232860924736835584, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (233567653069983751, 2, 232862044326596608, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (233567653069983752, 2, 232887377037758464, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (233567653069983753, 2, 232887377037758465, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (233567653069983754, 2, 232887377037758466, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (233567653069983755, 2, 232860924736835585, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (233567653069983756, 2, 232887377037758467, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (233567653069983757, 2, 232887377037758468, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (233567653069983758, 2, 232887377037758469, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(20) NOT NULL COMMENT '编号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nick_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `avatar` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `salt` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '机构ID',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_update_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  `open_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '超管', 'user2.png', 'bd1718f058d8a02468134432b8656a86', 'YzcmCZNvbXocrsz9dm8e', 'admin@qq.com', '13612345678', 1, 0, 'admin', '2018-08-14 11:11:11', 'admin', '2018-08-14 11:11:11', 0, '(NULL)');
INSERT INTO `sys_user` VALUES (22, 'liubei', '刘备', NULL, 'fd80ebd493a655608dc893a9f897d845', 'YzcmCZNvbXocrsz9dm8e', 'test@qq.com', '13889700023', 1, 7, 'admin', '2018-09-23 19:43:00', 'admin', '2019-01-10 11:41:13', 0, NULL);
INSERT INTO `sys_user` VALUES (23, 'zhaoyun', '赵云', NULL, 'bd1718f058d8a02468134432b8656a86', 'YzcmCZNvbXocrsz9dm8e', 'test@qq.com', '13889700023', 1, 7, 'admin', '2018-09-23 19:43:44', 'admin', '2018-09-23 19:43:52', 0, NULL);
INSERT INTO `sys_user` VALUES (24, 'zhugeliang', '诸葛亮', NULL, 'fd80ebd493a655608dc893a9f897d845', 'YzcmCZNvbXocrsz9dm8e', 'test@qq.com', '13889700023', 7, 11, 'admin', '2018-09-23 19:44:23', 'admin', '2018-09-23 19:44:29', 0, NULL);
INSERT INTO `sys_user` VALUES (25, 'caocao', '曹操', NULL, 'fd80ebd493a655608dc893a9f897d845', 'YzcmCZNvbXocrsz9dm8e', 'test@qq.com', '13889700023', 1, 8, 'admin', '2018-09-23 19:45:32', 'admin', '2019-01-10 17:59:14', 0, NULL);
INSERT INTO `sys_user` VALUES (26, 'dianwei', '典韦', NULL, 'fd80ebd493a655608dc893a9f897d845', 'YzcmCZNvbXocrsz9dm8e', 'test@qq.com', '13889700023', 1, 10, 'admin', '2018-09-23 19:45:48', 'admin', '2018-09-23 19:45:57', 0, NULL);
INSERT INTO `sys_user` VALUES (27, 'xiahoudun', '夏侯惇', NULL, 'fd80ebd493a655608dc893a9f897d845', 'YzcmCZNvbXocrsz9dm8e', 'test@qq.com', '13889700023', 1, 8, 'admin', '2018-09-23 19:46:09', 'admin', '2018-09-23 19:46:17', 0, NULL);
INSERT INTO `sys_user` VALUES (28, 'xunyu', '荀彧', NULL, 'fd80ebd493a655608dc893a9f897d845', 'YzcmCZNvbXocrsz9dm8e', 'test@qq.com', '13889700023', 1, 10, 'admin', '2018-09-23 19:46:38', 'admin', '2018-11-04 15:33:17', 0, NULL);
INSERT INTO `sys_user` VALUES (29, 'yanjun', '严峻', NULL, '2bc2d89751c507fac7e9ed21289b5e47', '170841a9e8124c12a6ab', 'test@qq.com', '13889700023', 1, 10, 'admin', '2018-09-23 19:46:54', 'admin', '2018-09-23 19:47:03', 0, NULL);
INSERT INTO `sys_user` VALUES (30, 'zhouyu', '周瑜', NULL, 'fd80ebd493a655608dc893a9f897d845', 'YzcmCZNvbXocrsz9dm8e', 'test@qq.com', '13889700023', 1, 11, 'admin', '2018-09-23 19:47:28', 'admin', '2018-09-23 19:48:04', 0, NULL);
INSERT INTO `sys_user` VALUES (31, 'luxun', '陆逊', NULL, 'fd80ebd493a655608dc893a9f897d845', 'YzcmCZNvbXocrsz9dm8e', 'test@qq.com', '13889700023', 1, 11, 'admin', '2018-09-23 19:47:44', 'admin', '2018-09-23 19:47:58', 0, NULL);
INSERT INTO `sys_user` VALUES (32, 'huanggai', '黄盖', NULL, 'fd80ebd493a655608dc893a9f897d845', 'YzcmCZNvbXocrsz9dm8e', 'test@qq.com', '13889700023', 1, 11, 'admin', '2018-09-23 19:48:38', 'admin', '2018-09-23 19:49:02', 0, 'oWfv-44rDVz-QjVWj4C1YmVdDlQA');
INSERT INTO `sys_user` VALUES (147634648799907840, 'machao', '马超', NULL, '$2a$10$dtHVJYl6cjXOhdXXTLd8R.v1migvAA95wWWoM6EwX2f3MVSMArbmq', '7e4680373002429582ba', 'test@qq.com', '13889700023', 1, 5, NULL, '2019-11-12 09:27:23', NULL, NULL, NULL, 'oWfv-47tPmyKiXv68k31N2Zm9dXg');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 147634683658768388 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (2, 2, 1, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (26, 5, 3, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (33, 6, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (34, 4, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (35, 9, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (36, 10, 3, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (37, 11, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (38, 12, 3, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (39, 15, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (41, 16, 3, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (42, 8, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (43, 7, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (45, 18, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (46, 17, 3, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (47, 3, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (48, 21, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (57, 31, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (58, 30, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (59, 32, 3, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (73, 33, 8, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (74, 25, 8, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (75, 25, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (81, 23, 3, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (82, 24, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (83, 26, 3, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (86, 28, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (87, 27, 3, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (146277929112965120, 145834657164955648, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (147631967423303680, 147631912716996608, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (147634683658768384, 147634648799907840, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (147634683658768385, 22, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (147634683658768386, 29, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (147634683658768387, 29, 1, NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
