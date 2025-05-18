/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : yb_2025_54_gongmu2

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 18/04/2025 20:20:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'yb_zuobiao', '坐标数据', NULL, NULL, 'YbZuobiao', 'crud', 'element-plus', 'com.sxs.ditu', 'ditu', 'zuobiao', '坐标数据', 'sxs', '0', '/', '{\"parentMenuId\":0}', 'admin', '2025-03-23 12:27:18', '', '2025-03-23 12:30:01', NULL);
INSERT INTO `gen_table` VALUES (2, 'yb_biaodan', '表单', NULL, NULL, 'YbBiaodan', 'crud', 'element-plus', 'com.sxs.ditu', 'ditu', 'biaodan', '表单管理', 'sxs', '0', '/', '{\"parentMenuId\":0}', 'admin', '2025-03-23 16:08:59', '', '2025-03-23 16:10:04', NULL);
INSERT INTO `gen_table` VALUES (3, 'yb_tupian', '背景图片', NULL, NULL, 'YbTupian', 'crud', 'element-plus', 'com.sxs.system', 'system', 'tupian', '背景图片', 'sxs', '0', '/', '{}', 'admin', '2025-03-28 01:00:57', '', '2025-03-28 01:01:13', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'id', '编号', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-03-23 12:27:18', '', '2025-03-23 12:30:01');
INSERT INTO `gen_table_column` VALUES (2, 1, 'zuobiao', '坐标数据', 'varchar(255)', 'String', 'zuobiao', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-03-23 12:27:18', '', '2025-03-23 12:30:01');
INSERT INTO `gen_table_column` VALUES (3, 1, 'leibie', '类别', 'varchar(255)', 'String', 'leibie', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2025-03-23 12:27:18', '', '2025-03-23 12:30:01');
INSERT INTO `gen_table_column` VALUES (4, 1, 'zrenshu', '客控总人数', 'varchar(255)', 'String', 'zrenshu', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-03-23 12:27:18', '', '2025-03-23 12:30:01');
INSERT INTO `gen_table_column` VALUES (5, 1, 'fuzeren', '负责人', 'varchar(255)', 'String', 'fuzeren', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-03-23 12:27:18', '', '2025-03-23 12:30:01');
INSERT INTO `gen_table_column` VALUES (6, 1, 'hzhiyuan', '汇泉广场站支援人数', 'varchar(255)', 'String', 'hzhiyuan', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-03-23 12:27:18', '', '2025-03-23 12:30:01');
INSERT INTO `gen_table_column` VALUES (7, 1, 'zzhiyuan', '中山公园站支援人数', 'varchar(255)', 'String', 'zzhiyuan', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2025-03-23 12:27:18', '', '2025-03-23 12:30:01');
INSERT INTO `gen_table_column` VALUES (8, 1, 'status', '显示状态', 'varchar(255)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'xianshistatus', 8, 'admin', '2025-03-23 12:27:18', '', '2025-03-23 12:30:01');
INSERT INTO `gen_table_column` VALUES (9, 1, 'createdtime', '创建时间', 'datetime', 'Date', 'createdtime', '0', '0', '0', '0', '1', '1', '1', 'BETWEEN', 'datetime', '', 9, 'admin', '2025-03-23 12:27:18', '', '2025-03-23 12:30:01');
INSERT INTO `gen_table_column` VALUES (10, 1, 'user_id', '添加人id', 'int', 'Long', 'userId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2025-03-23 12:27:18', '', '2025-03-23 12:30:01');
INSERT INTO `gen_table_column` VALUES (11, 1, 'nick_name', '添加者', 'varchar(255)', 'String', 'nickName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 11, 'admin', '2025-03-23 12:27:18', '', '2025-03-23 12:30:01');
INSERT INTO `gen_table_column` VALUES (12, 1, 'kz1', '扩展1', 'text', 'String', 'kz1', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'textarea', '', 12, 'admin', '2025-03-23 12:27:18', '', '2025-03-23 12:30:01');
INSERT INTO `gen_table_column` VALUES (13, 1, 'kz2', '扩展2', 'text', 'String', 'kz2', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'textarea', '', 13, 'admin', '2025-03-23 12:27:18', '', '2025-03-23 12:30:01');
INSERT INTO `gen_table_column` VALUES (14, 1, 'kz3', '扩展3', 'text', 'String', 'kz3', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'textarea', '', 14, 'admin', '2025-03-23 12:27:18', '', '2025-03-23 12:30:01');
INSERT INTO `gen_table_column` VALUES (15, 2, 'id', '编号', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-03-23 16:08:59', '', '2025-03-23 16:10:04');
INSERT INTO `gen_table_column` VALUES (16, 2, 'zuobiao', '坐标数据', 'varchar(255)', 'String', 'zuobiao', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-03-23 16:08:59', '', '2025-03-23 16:10:04');
INSERT INTO `gen_table_column` VALUES (17, 2, 'leibie', '类别', 'varchar(255)', 'String', 'leibie', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-03-23 16:08:59', '', '2025-03-23 16:10:04');
INSERT INTO `gen_table_column` VALUES (18, 2, 'zrenshu', '客控总人数', 'varchar(255)', 'String', 'zrenshu', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-03-23 16:08:59', '', '2025-03-23 16:10:04');
INSERT INTO `gen_table_column` VALUES (19, 2, 'fuzeren', '负责人', 'varchar(255)', 'String', 'fuzeren', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-03-23 16:08:59', '', '2025-03-23 16:10:04');
INSERT INTO `gen_table_column` VALUES (20, 2, 'hzhiyuan', '汇泉广场站支援人数', 'varchar(255)', 'String', 'hzhiyuan', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-03-23 16:08:59', '', '2025-03-23 16:10:04');
INSERT INTO `gen_table_column` VALUES (21, 2, 'zzhiyuan', '中山公园站支援人数', 'varchar(255)', 'String', 'zzhiyuan', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2025-03-23 16:08:59', '', '2025-03-23 16:10:04');
INSERT INTO `gen_table_column` VALUES (22, 2, 'status', '显示状态', 'varchar(255)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 8, 'admin', '2025-03-23 16:08:59', '', '2025-03-23 16:10:04');
INSERT INTO `gen_table_column` VALUES (23, 2, 'createdtime', '创建时间', 'datetime', 'Date', 'createdtime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datetime', '', 9, 'admin', '2025-03-23 16:08:59', '', '2025-03-23 16:10:04');
INSERT INTO `gen_table_column` VALUES (24, 2, 'user_id', '添加人id', 'int', 'Long', 'userId', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 10, 'admin', '2025-03-23 16:08:59', '', '2025-03-23 16:10:04');
INSERT INTO `gen_table_column` VALUES (25, 2, 'nick_name', '添加者', 'varchar(255)', 'String', 'nickName', '0', '0', '0', '0', '0', '0', '0', 'LIKE', 'input', '', 11, 'admin', '2025-03-23 16:08:59', '', '2025-03-23 16:10:04');
INSERT INTO `gen_table_column` VALUES (26, 2, 'kz1', '扩展1', 'text', 'String', 'kz1', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'textarea', '', 12, 'admin', '2025-03-23 16:08:59', '', '2025-03-23 16:10:04');
INSERT INTO `gen_table_column` VALUES (27, 2, 'kz2', '扩展2', 'text', 'String', 'kz2', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'textarea', '', 13, 'admin', '2025-03-23 16:08:59', '', '2025-03-23 16:10:04');
INSERT INTO `gen_table_column` VALUES (28, 2, 'kz3', '扩展3', 'text', 'String', 'kz3', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'textarea', '', 14, 'admin', '2025-03-23 16:08:59', '', '2025-03-23 16:10:04');
INSERT INTO `gen_table_column` VALUES (29, 3, 'id', 'id', 'int', 'Long', 'id', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-03-28 01:00:57', '', '2025-03-28 01:01:13');
INSERT INTO `gen_table_column` VALUES (30, 3, 'src', '图片', 'varchar(255)', 'String', 'src', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'imageUpload', '', 2, 'admin', '2025-03-28 01:00:57', '', '2025-03-28 01:01:13');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2025-02-06 23:26:50', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2025-02-06 23:26:50', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-light', 'Y', 'admin', '2025-02-06 23:26:50', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2025-02-06 23:26:50', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2025-02-06 23:26:50', 'admin', '2025-02-10 21:12:19', '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2025-02-06 23:26:50', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', 'Admin科技', 0, 'Admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-02-06 23:26:44', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, 'Admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-02-06 23:26:44', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, 'Admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-02-06 23:26:44', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, 'Admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-02-06 23:26:44', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, 'Admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-02-06 23:26:44', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, 'Admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-02-06 23:26:44', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, 'Admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-02-06 23:26:44', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, 'Admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-02-06 23:26:44', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, 'Admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-02-06 23:26:44', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, 'Admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-02-06 23:26:44', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2025-02-06 23:26:49', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-02-06 23:26:49', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-02-06 23:26:49', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2025-02-06 23:26:49', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2025-02-06 23:26:49', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2025-02-06 23:26:49', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2025-02-06 23:26:49', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2025-02-06 23:26:49', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2025-02-06 23:26:49', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2025-02-06 23:26:49', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2025-02-06 23:26:49', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2025-02-06 23:26:49', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2025-02-06 23:26:49', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2025-02-06 23:26:49', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2025-02-06 23:26:49', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2025-02-06 23:26:49', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2025-02-06 23:26:49', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-02-06 23:26:49', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-02-06 23:26:49', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-02-06 23:26:49', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-02-06 23:26:49', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2025-02-06 23:26:50', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-02-06 23:26:50', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-02-06 23:26:50', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-02-06 23:26:50', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-02-06 23:26:50', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-02-06 23:26:50', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2025-02-06 23:26:50', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2025-02-06 23:26:50', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, '显示', '显示', 'xianshistatus', NULL, 'success', 'N', '0', 'admin', '2025-03-23 12:28:10', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 0, '不显示', '不显示', 'xianshistatus', NULL, 'danger', 'N', '0', 'admin', '2025-03-23 12:28:34', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2025-02-06 23:26:49', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2025-02-06 23:26:49', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2025-02-06 23:26:49', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2025-02-06 23:26:49', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2025-02-06 23:26:49', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2025-02-06 23:26:49', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2025-02-06 23:26:49', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2025-02-06 23:26:49', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2025-02-06 23:26:49', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2025-02-06 23:26:49', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '显示状态', 'xianshistatus', '0', 'admin', '2025-03-23 12:27:53', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2025-02-06 23:26:50', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2025-02-06 23:26:50', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2025-02-06 23:26:50', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 181 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2025-02-06 23:44:41');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-07 00:14:19');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2025-02-07 00:31:10');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-07 01:54:22');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2025-02-07 01:54:46');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-07 16:05:49');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-02-07 16:07:24');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-02-07 16:07:29');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-07 16:07:34');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '192.168.190.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2025-02-07 18:10:31');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2025-02-07 18:17:47');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '1', '验证码已失效', '2025-02-07 18:42:14');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2025-02-07 18:42:20');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2025-02-07 18:43:02');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2025-02-07 18:43:15');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2025-02-07 21:55:41');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-07 23:17:29');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-02-07 23:31:10');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2025-02-10 21:11:38');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2025-02-10 21:12:28');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2025-02-11 00:09:41');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2025-02-11 00:11:41');
INSERT INTO `sys_logininfor` VALUES (122, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2025-02-11 00:14:26');
INSERT INTO `sys_logininfor` VALUES (123, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2025-02-11 00:19:44');
INSERT INTO `sys_logininfor` VALUES (124, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2025-02-11 00:22:16');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2025-02-11 00:22:21');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2025-02-11 00:22:27');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2025-02-11 00:23:15');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2025-02-11 00:24:24');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2025-02-11 00:24:27');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2025-02-11 00:24:29');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2025-02-11 00:25:23');
INSERT INTO `sys_logininfor` VALUES (132, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2025-02-11 00:25:49');
INSERT INTO `sys_logininfor` VALUES (133, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2025-02-11 00:27:26');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-02-11 18:29:39');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '192.168.241.99', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2025-02-11 19:00:27');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '192.168.241.175', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-02-11 19:03:27');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '192.168.241.99', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2025-02-11 19:06:36');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '192.168.241.175', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-02-11 19:11:50');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '192.168.241.99', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2025-02-11 19:12:34');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '192.168.241.99', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2025-02-11 19:15:35');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2025-02-11 19:15:50');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-02-11 19:48:40');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '192.168.241.99', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2025-02-11 23:25:20');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2025-02-11 23:25:38');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '192.168.241.175', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-02-11 23:36:44');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '192.168.241.175', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2025-02-11 23:44:39');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '192.168.241.175', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '验证码错误', '2025-02-11 23:44:55');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '192.168.241.175', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-02-11 23:44:59');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '192.168.241.175', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2025-02-11 23:45:09');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2025-02-11 23:55:00');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2025-02-11 23:55:07');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2025-02-12 00:10:41');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2025-02-12 00:10:53');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2025-02-12 01:42:47');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2025-02-16 20:31:39');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2025-02-16 20:33:58');
INSERT INTO `sys_logininfor` VALUES (157, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2025-02-16 20:34:19');
INSERT INTO `sys_logininfor` VALUES (158, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2025-02-16 20:34:45');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2025-02-16 20:34:52');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2025-02-16 20:34:57');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2025-03-23 12:17:00');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2025-03-23 14:09:11');
INSERT INTO `sys_logininfor` VALUES (163, 'admin1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2025-03-23 14:09:22');
INSERT INTO `sys_logininfor` VALUES (164, 'admin1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2025-03-23 15:30:39');
INSERT INTO `sys_logininfor` VALUES (165, 'admin1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2025-03-23 16:06:44');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2025-03-23 16:06:49');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2025-03-23 16:41:23');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2025-03-23 16:41:31');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2025-03-23 16:41:46');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2025-03-23 16:41:50');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2025-03-23 16:41:53');
INSERT INTO `sys_logininfor` VALUES (172, 'admin1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2025-03-23 16:42:03');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2025-03-27 08:47:22');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2025-03-27 11:00:41');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2025-03-27 11:00:45');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2025-03-28 00:08:23');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2025-04-18 16:06:49');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2025-04-18 16:15:05');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2025-04-18 16:18:13');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2025-04-18 16:18:15');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2025-04-18 16:31:14');
INSERT INTO `sys_logininfor` VALUES (182, 'admin1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2025-04-18 16:31:53');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2025-04-18 20:18:58');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2031 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2025-02-06 23:26:45', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2025-02-06 23:26:45', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2025-02-06 23:26:45', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2025-02-06 23:26:45', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2025-02-06 23:26:45', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2025-02-06 23:26:45', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2025-02-06 23:26:45', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2025-02-06 23:26:45', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2025-02-06 23:26:45', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2025-02-06 23:26:45', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2025-02-06 23:26:45', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 0, 988, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2025-02-06 23:26:45', 'admin', '2025-04-18 16:31:04', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2025-02-06 23:26:45', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2025-02-06 23:26:45', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2025-02-06 23:26:45', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2025-02-06 23:26:45', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2025-02-06 23:26:45', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2025-02-06 23:26:45', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2025-02-06 23:26:45', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2025-02-06 23:26:45', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2025-02-06 23:26:45', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2025-02-06 23:26:45', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2025-02-06 23:26:45', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2025-02-06 23:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2025-02-06 23:26:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2025-02-06 23:26:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2025-02-06 23:26:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2025-02-06 23:26:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2025-02-06 23:26:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2025-02-06 23:26:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2025-02-06 23:26:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2025-02-06 23:26:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2025-02-06 23:26:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2025-02-06 23:26:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2025-02-06 23:26:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2025-02-06 23:26:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2025-02-06 23:26:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2025-02-06 23:26:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2025-02-06 23:26:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2025-02-06 23:26:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2025-02-06 23:26:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '用户管理', 0, 4, 'user2', 'system/user/index', NULL, '', 1, 0, 'C', '0', '0', '', 'user', 'admin', '2025-02-07 03:04:46', 'admin', '2025-02-07 03:06:46', '');
INSERT INTO `sys_menu` VALUES (2001, '字典管理', 0, 6, 'dict2', 'system/dict/index', NULL, '', 1, 0, 'C', '0', '0', '', 'dict', 'admin', '2025-02-07 03:08:31', 'admin', '2025-02-07 03:10:03', '');
INSERT INTO `sys_menu` VALUES (2002, '菜单管理', 0, 5, 'menu2', 'system/menu/index', NULL, '', 1, 0, 'C', '0', '0', '', 'tree-table', 'admin', '2025-02-07 03:10:26', 'admin', '2025-02-07 03:11:04', '');
INSERT INTO `sys_menu` VALUES (2003, '代码生成', 0, 7, 'gen2', 'tool/gen/index', NULL, '', 1, 0, 'C', '0', '0', '', 'code', 'admin', '2025-02-07 03:11:32', 'admin', '2025-02-07 03:12:33', '');
INSERT INTO `sys_menu` VALUES (2004, '个人中心', 0, 999, 'user/profile', NULL, NULL, '', 1, 0, 'C', '0', '0', '', 'user', 'admin', '2025-02-07 18:51:34', 'admin', '2025-02-07 18:52:08', '');
INSERT INTO `sys_menu` VALUES (2005, '公墓坐标数据', 0, 10, 'zuobiao', 'ditu/zuobiao/index', NULL, '', 1, 0, 'C', '0', '0', 'ditu:zuobiao:list', 'international', 'admin', '2025-03-23 12:32:20', 'admin', '2025-04-18 16:18:59', '坐标数据菜单');
INSERT INTO `sys_menu` VALUES (2006, '坐标数据查询', 2005, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ditu:zuobiao:query', '#', 'admin', '2025-03-23 12:32:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '坐标数据新增', 2005, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ditu:zuobiao:add', '#', 'admin', '2025-03-23 12:32:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '坐标数据修改', 2005, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ditu:zuobiao:edit', '#', 'admin', '2025-03-23 12:32:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '坐标数据删除', 2005, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ditu:zuobiao:remove', '#', 'admin', '2025-03-23 12:32:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '坐标数据导出', 2005, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ditu:zuobiao:export', '#', 'admin', '2025-03-23 12:32:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '地图', 0, 9, 'ditu2', 'ditu/zuobiao/ditu', NULL, '', 1, 0, 'C', '0', '0', '', 'example', 'admin', '2025-03-23 12:43:45', 'admin', '2025-03-23 12:50:32', '');
INSERT INTO `sys_menu` VALUES (2025, '背景图片', 0, 14, 'tupian', 'system/tupian/index', NULL, '', 1, 0, 'C', '0', '0', 'system:tupian:list', 'dashboard', 'admin', '2025-03-28 01:02:12', 'admin', '2025-04-18 16:19:19', '背景图片菜单');
INSERT INTO `sys_menu` VALUES (2026, '背景图片查询', 2025, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:tupian:query', '#', 'admin', '2025-03-28 01:02:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '背景图片新增', 2025, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:tupian:add', '#', 'admin', '2025-03-28 01:02:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '背景图片修改', 2025, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:tupian:edit', '#', 'admin', '2025-03-28 01:02:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '背景图片删除', 2025, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:tupian:remove', '#', 'admin', '2025-03-28 01:02:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '背景图片导出', 2025, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:tupian:export', '#', 'admin', '2025-03-28 01:02:12', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 Admin新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2025-02-06 23:26:50', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 Admin系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2025-02-06 23:26:50', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 244 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2025-02-06 23:45:32', 8);
INSERT INTO `sys_oper_log` VALUES (101, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-02-06 23:26:45\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-06 23:45:46', 30);
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-06 23:45:58', 10);
INSERT INTO `sys_oper_log` VALUES (103, '角色管理', 2, 'com.sxs.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-02-06 23:26:45\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"管理员\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-07 02:19:31', 45);
INSERT INTO `sys_oper_log` VALUES (104, '角色管理', 2, 'com.sxs.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-02-06 23:26:45\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"普通用户\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通用户\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-07 02:20:14', 15);
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 1, 'com.sxs.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"用户管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"1\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-07 03:04:46', 21);
INSERT INTO `sys_oper_log` VALUES (106, '菜单管理', 2, 'com.sxs.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-02-07 03:04:46\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"用户管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"user\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-07 03:05:33', 9);
INSERT INTO `sys_oper_log` VALUES (107, '菜单管理', 2, 'com.sxs.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-02-07 03:04:46\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"user\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-07 03:06:00', 7);
INSERT INTO `sys_oper_log` VALUES (108, '菜单管理', 2, 'com.sxs.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2025-02-07 03:04:46\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"user\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-07 03:06:20', 8);
INSERT INTO `sys_oper_log` VALUES (109, '菜单管理', 2, 'com.sxs.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2025-02-07 03:04:46\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"user2\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-07 03:06:46', 7);
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 1, 'com.sxs.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"字典管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"1\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-07 03:08:31', 9);
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 2, 'com.sxs.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dict/index\",\"createTime\":\"2025-02-07 03:08:31\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"字典管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"dict2\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-07 03:08:56', 8);
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 2, 'com.sxs.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dict/index\",\"createTime\":\"2025-02-07 03:08:31\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"字典管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"dict2\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-07 03:09:25', 7);
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 2, 'com.sxs.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dict/index\",\"createTime\":\"2025-02-07 03:08:31\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"字典管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"dict2\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-07 03:10:03', 8);
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 1, 'com.sxs.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"菜单管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"1\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-07 03:10:26', 8);
INSERT INTO `sys_oper_log` VALUES (115, '菜单管理', 2, 'com.sxs.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/menu/index\",\"createTime\":\"2025-02-07 03:10:26\",\"icon\":\"tree-table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"菜单管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"menu2\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-07 03:11:04', 7);
INSERT INTO `sys_oper_log` VALUES (116, '菜单管理', 1, 'com.sxs.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"代码生成\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"1\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-07 03:11:32', 9);
INSERT INTO `sys_oper_log` VALUES (117, '菜单管理', 2, 'com.sxs.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"tool/gen/index\",\"createTime\":\"2025-02-07 03:11:32\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"代码生成\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"gen2\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-07 03:12:05', 7);
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 2, 'com.sxs.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"tool/gen/index\",\"createTime\":\"2025-02-07 03:11:32\",\"icon\":\"code\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"代码生成\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"gen2\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-07 03:12:33', 7);
INSERT INTO `sys_oper_log` VALUES (119, '用户管理', 1, 'com.sxs.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"user\",\"params\":{},\"postIds\":[],\"roleIds\":[2],\"status\":\"0\",\"userId\":100,\"userName\":\"user\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-07 18:12:56', 92);
INSERT INTO `sys_oper_log` VALUES (120, '菜单管理', 1, 'com.sxs.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"个人中心\",\"menuType\":\"C\",\"orderNum\":999,\"params\":{},\"parentId\":0,\"path\":\"1\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-07 18:51:34', 15);
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 2, 'com.sxs.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-02-07 18:51:34\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"个人中心\",\"menuType\":\"C\",\"orderNum\":999,\"params\":{},\"parentId\":0,\"path\":\"user/profile\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-07 18:52:08', 8);
INSERT INTO `sys_oper_log` VALUES (122, '用户管理', 3, 'com.sxs.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/user/2', '127.0.0.1', '内网IP', '[2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-07 23:36:20', 32);
INSERT INTO `sys_oper_log` VALUES (123, '参数管理', 2, 'com.sxs.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":5,\"configKey\":\"sys.account.registerUser\",\"configName\":\"账号自助-是否开启用户注册功能\",\"configType\":\"Y\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2025-02-06 23:26:50\",\"params\":{},\"remark\":\"是否开启注册用户功能（true开启，false关闭）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-10 21:12:19', 14);
INSERT INTO `sys_oper_log` VALUES (124, '角色管理', 2, 'com.sxs.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-02-06 23:26:45\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,2004],\"params\":{},\"remark\":\"管理员\",\"roleId\":2,\"roleKey\":\"admin1\",\"roleName\":\"管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-11 00:10:32', 31);
INSERT INTO `sys_oper_log` VALUES (125, '角色管理', 1, 'com.sxs.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2004],\"params\":{},\"roleId\":100,\"roleKey\":\"user\",\"roleName\":\"用户\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-11 00:11:12', 15);
INSERT INTO `sys_oper_log` VALUES (126, '用户管理', 1, 'com.sxs.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"user2\",\"params\":{},\"postIds\":[],\"roleIds\":[100],\"status\":\"0\",\"userId\":102,\"userName\":\"user2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-11 00:24:58', 80);
INSERT INTO `sys_oper_log` VALUES (127, '用户管理', 3, 'com.sxs.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/user/102', '127.0.0.1', '内网IP', '[102]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-11 00:25:11', 29);
INSERT INTO `sys_oper_log` VALUES (128, '用户管理', 3, 'com.sxs.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/user/101', '127.0.0.1', '内网IP', '[101]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-11 00:25:14', 12);
INSERT INTO `sys_oper_log` VALUES (129, '用户管理', 3, 'com.sxs.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/user/103', '127.0.0.1', '内网IP', '[103]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-16 20:31:50', 47);
INSERT INTO `sys_oper_log` VALUES (130, '用户管理', 3, 'com.sxs.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/user/100', '127.0.0.1', '内网IP', '[100]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-16 20:32:09', 10);
INSERT INTO `sys_oper_log` VALUES (131, '用户管理', 1, 'com.sxs.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"admin1\",\"params\":{},\"postIds\":[],\"roleIds\":[2],\"status\":\"0\",\"userId\":104,\"userName\":\"admin1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-16 20:33:51', 77);
INSERT INTO `sys_oper_log` VALUES (132, '代码生成', 6, 'com.sxs.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"yb_zuobiao\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 12:27:18', 74);
INSERT INTO `sys_oper_log` VALUES (133, '字典类型', 1, 'com.sxs.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"显示状态\",\"dictType\":\"xianshistatus\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 12:27:53', 12);
INSERT INTO `sys_oper_log` VALUES (134, '字典数据', 1, 'com.sxs.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"显示\",\"dictSort\":0,\"dictType\":\"xianshistatus\",\"dictValue\":\"显示\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 12:28:10', 10);
INSERT INTO `sys_oper_log` VALUES (135, '字典数据', 1, 'com.sxs.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"不显示\",\"dictSort\":0,\"dictType\":\"xianshistatus\",\"dictValue\":\"不显示\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 12:28:34', 11);
INSERT INTO `sys_oper_log` VALUES (136, '代码生成', 2, 'com.sxs.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"zuobiao\",\"className\":\"YbZuobiao\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"编号\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-23 12:27:18\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Zuobiao\",\"columnComment\":\"坐标数据\",\"columnId\":2,\"columnName\":\"zuobiao\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-23 12:27:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"zuobiao\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Leibie\",\"columnComment\":\"类别\",\"columnId\":3,\"columnName\":\"leibie\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-23 12:27:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"leibie\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Zrenshu\",\"columnComment\":\"客控总人数\",\"columnId\":4,\"columnName\":\"zrenshu\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-23 12:27:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"zrenshu\",\"ja', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 12:29:57', 37);
INSERT INTO `sys_oper_log` VALUES (137, '代码生成', 2, 'com.sxs.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"zuobiao\",\"className\":\"YbZuobiao\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"编号\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-23 12:27:18\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-23 12:29:57\",\"usableColumn\":false},{\"capJavaField\":\"Zuobiao\",\"columnComment\":\"坐标数据\",\"columnId\":2,\"columnName\":\"zuobiao\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-23 12:27:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"zuobiao\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-23 12:29:57\",\"usableColumn\":false},{\"capJavaField\":\"Leibie\",\"columnComment\":\"类别\",\"columnId\":3,\"columnName\":\"leibie\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-23 12:27:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"leibie\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-23 12:29:57\",\"usableColumn\":false},{\"capJavaField\":\"Zrenshu\",\"columnComment\":\"客控总人数\",\"columnId\":4,\"columnName\":\"zrenshu\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-23 12:27:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncre', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 12:30:01', 25);
INSERT INTO `sys_oper_log` VALUES (138, '代码生成', 8, 'com.sxs.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"yb_zuobiao\"}', NULL, 0, NULL, '2025-03-23 12:30:03', 266);
INSERT INTO `sys_oper_log` VALUES (139, '菜单管理', 3, 'com.sxs.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2011', '127.0.0.1', '内网IP', '2011', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2025-03-23 12:32:37', 6);
INSERT INTO `sys_oper_log` VALUES (140, '菜单管理', 3, 'com.sxs.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2012', '127.0.0.1', '内网IP', '2012', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 12:32:41', 11);
INSERT INTO `sys_oper_log` VALUES (141, '菜单管理', 3, 'com.sxs.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2014', '127.0.0.1', '内网IP', '2014', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 12:32:44', 7);
INSERT INTO `sys_oper_log` VALUES (142, '菜单管理', 3, 'com.sxs.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2013', '127.0.0.1', '内网IP', '2013', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 12:32:49', 8);
INSERT INTO `sys_oper_log` VALUES (143, '菜单管理', 3, 'com.sxs.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2015', '127.0.0.1', '内网IP', '2015', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 12:32:52', 11);
INSERT INTO `sys_oper_log` VALUES (144, '菜单管理', 3, 'com.sxs.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2016', '127.0.0.1', '内网IP', '2016', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 12:32:54', 9);
INSERT INTO `sys_oper_log` VALUES (145, '菜单管理', 3, 'com.sxs.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2011', '127.0.0.1', '内网IP', '2011', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 12:32:57', 7);
INSERT INTO `sys_oper_log` VALUES (146, '菜单管理', 2, 'com.sxs.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"ditu/zuobiao/index\",\"createTime\":\"2025-03-23 12:32:20\",\"icon\":\"international\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"坐标数据\",\"menuType\":\"C\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"zuobiao\",\"perms\":\"ditu:zuobiao:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 12:33:29', 16);
INSERT INTO `sys_oper_log` VALUES (147, '菜单管理', 1, 'com.sxs.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"ditu/zuobiao/ditu\",\"createBy\":\"admin\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"地图\",\"menuType\":\"C\",\"orderNum\":9,\"params\":{},\"parentId\":0,\"path\":\"ditu\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 12:43:45', 37);
INSERT INTO `sys_oper_log` VALUES (148, '菜单管理', 2, 'com.sxs.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"ditu/zuobiao/ditu\",\"createTime\":\"2025-03-23 12:43:45\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2017,\"menuName\":\"地图\",\"menuType\":\"C\",\"orderNum\":9,\"params\":{},\"parentId\":0,\"path\":\"ditu2\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 12:50:32', 16);
INSERT INTO `sys_oper_log` VALUES (149, '坐标数据', 1, 'com.sxs.ditu.controller.YbZuobiaoController.add()', 'POST', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-03-23 05:12:50\",\"fuzeren\":\"黄磊\",\"hzhiyuan\":\"11\",\"id\":2,\"leibie\":\"数量\",\"nickName\":\"Admin\",\"params\":{},\"status\":\"显示\",\"userId\":1,\"zrenshu\":\"30\",\"zuobiao\":\"[927,321]\",\"zzhiyuan\":\"9\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 13:13:03', 64);
INSERT INTO `sys_oper_log` VALUES (150, '坐标数据', 1, 'com.sxs.ditu.controller.YbZuobiaoController.add()', 'POST', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-03-23 05:13:03\",\"fuzeren\":\"前\",\"hzhiyuan\":\"11\",\"id\":3,\"leibie\":\"数量\",\"nickName\":\"Admin\",\"params\":{},\"status\":\"显示\",\"userId\":1,\"zrenshu\":\"88\",\"zuobiao\":\"[943,332]\",\"zzhiyuan\":\"33\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 13:13:19', 7);
INSERT INTO `sys_oper_log` VALUES (151, '坐标数据', 1, 'com.sxs.ditu.controller.YbZuobiaoController.add()', 'POST', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-03-23 05:13:59\",\"fuzeren\":\"44\",\"hzhiyuan\":\"\",\"id\":4,\"leibie\":\"数量\",\"nickName\":\"Admin\",\"params\":{},\"status\":\"显示\",\"userId\":1,\"zrenshu\":\"44\",\"zuobiao\":\"[979,232]\",\"zzhiyuan\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 13:14:04', 6);
INSERT INTO `sys_oper_log` VALUES (152, '坐标数据', 1, 'com.sxs.ditu.controller.YbZuobiaoController.add()', 'POST', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-03-23 05:21:48\",\"fuzeren\":\"11\",\"hzhiyuan\":\"\",\"id\":5,\"leibie\":\"数量\",\"nickName\":\"Admin\",\"params\":{},\"status\":\"显示\",\"userId\":1,\"zrenshu\":\"11\",\"zuobiao\":\"[707,554]\",\"zzhiyuan\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 13:21:53', 20);
INSERT INTO `sys_oper_log` VALUES (153, '坐标数据', 1, 'com.sxs.ditu.controller.YbZuobiaoController.add()', 'POST', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-03-23 05:21:53\",\"fuzeren\":\"11\",\"hzhiyuan\":\"11\",\"id\":6,\"leibie\":\"数量\",\"nickName\":\"Admin\",\"params\":{},\"status\":\"显示\",\"userId\":1,\"zrenshu\":\"111\",\"zuobiao\":\"[645,396]\",\"zzhiyuan\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 13:21:59', 6);
INSERT INTO `sys_oper_log` VALUES (154, '坐标数据', 1, 'com.sxs.ditu.controller.YbZuobiaoController.add()', 'POST', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-03-23 05:22:06\",\"fuzeren\":\"55\",\"hzhiyuan\":\"55\",\"id\":7,\"leibie\":\"数量\",\"nickName\":\"Admin\",\"params\":{},\"status\":\"显示\",\"userId\":1,\"zrenshu\":\"55\",\"zuobiao\":\"[639,387]\",\"zzhiyuan\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 13:22:13', 7);
INSERT INTO `sys_oper_log` VALUES (155, '坐标数据', 1, 'com.sxs.ditu.controller.YbZuobiaoController.add()', 'POST', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"fuzeren\":\"11\",\"hzhiyuan\":\"\",\"id\":8,\"leibie\":\"\",\"nickName\":\"Admin\",\"params\":{},\"status\":\"显示\",\"userId\":1,\"zrenshu\":\"\",\"zuobiao\":\"[1074,509]\",\"zzhiyuan\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 13:27:38', 109);
INSERT INTO `sys_oper_log` VALUES (156, '坐标数据', 1, 'com.sxs.ditu.controller.YbZuobiaoController.add()', 'POST', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"fuzeren\":\"111\",\"hzhiyuan\":\"\",\"id\":9,\"leibie\":\"数量\",\"nickName\":\"Admin\",\"params\":{},\"status\":\"显示\",\"userId\":1,\"zrenshu\":\"\",\"zuobiao\":\"[1247,346]\",\"zzhiyuan\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 13:27:45', 8);
INSERT INTO `sys_oper_log` VALUES (157, '坐标数据', 1, 'com.sxs.ditu.controller.YbZuobiaoController.add()', 'POST', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"fuzeren\":\"\",\"hzhiyuan\":\"\",\"id\":10,\"leibie\":\"数量\",\"nickName\":\"Admin\",\"params\":{},\"status\":\"显示\",\"userId\":1,\"zrenshu\":\"111\",\"zuobiao\":\"[1644,87]\",\"zzhiyuan\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 13:27:52', 6);
INSERT INTO `sys_oper_log` VALUES (158, '坐标数据', 1, 'com.sxs.ditu.controller.YbZuobiaoController.add()', 'POST', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"fuzeren\":\"\",\"hzhiyuan\":\"\",\"id\":11,\"leibie\":\"数量\",\"nickName\":\"Admin\",\"params\":{},\"status\":\"显示\",\"userId\":1,\"zrenshu\":\"111\",\"zuobiao\":\"[584,350]\",\"zzhiyuan\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 13:28:22', 6);
INSERT INTO `sys_oper_log` VALUES (159, '角色管理', 2, 'com.sxs.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-02-06 23:26:45\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2005,2006,2007,2008,2009,2010,2004],\"params\":{},\"remark\":\"管理员\",\"roleId\":2,\"roleKey\":\"admin1\",\"roleName\":\"管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 14:08:45', 43);
INSERT INTO `sys_oper_log` VALUES (160, '角色管理', 2, 'com.sxs.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-02-11 00:11:12\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2017,2005,2006,2007,2008,2009,2010,2004],\"params\":{},\"roleId\":100,\"roleKey\":\"user\",\"roleName\":\"用户\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 14:08:59', 12);
INSERT INTO `sys_oper_log` VALUES (161, '角色管理', 2, 'com.sxs.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-02-06 23:26:45\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2017,2005,2006,2007,2008,2009,2010,2004],\"params\":{},\"remark\":\"管理员\",\"roleId\":2,\"roleKey\":\"admin1\",\"roleName\":\"管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 14:09:03', 14);
INSERT INTO `sys_oper_log` VALUES (162, '坐标数据', 3, 'com.sxs.ditu.controller.YbZuobiaoController.remove()', 'DELETE', 1, 'admin1', NULL, '/ditu/zuobiao/18', '127.0.0.1', '内网IP', '[18]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 14:09:35', 9);
INSERT INTO `sys_oper_log` VALUES (163, '坐标数据', 1, 'com.sxs.ditu.controller.YbZuobiaoController.add()', 'POST', 1, 'admin1', NULL, '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"fuzeren\":\"王艳\",\"hzhiyuan\":\"11\",\"id\":24,\"leibie\":\"数量\",\"nickName\":\"\",\"params\":{},\"status\":\"显示\",\"userId\":0,\"zrenshu\":\"33\",\"zuobiao\":\"[438,398]\",\"zzhiyuan\":\"22\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 14:10:37', 13);
INSERT INTO `sys_oper_log` VALUES (164, '坐标数据', 2, 'com.sxs.ditu.controller.YbZuobiaoController.edit()', 'PUT', 1, 'admin1', NULL, '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-03-23 05:12:50\",\"fuzeren\":\"黄磊\",\"hzhiyuan\":\"11\",\"id\":2,\"leibie\":\"中山公园南门\",\"nickName\":\"Admin\",\"params\":{},\"status\":\"显示\",\"userId\":1,\"zrenshu\":\"30\",\"zuobiao\":\"[927,321]\",\"zzhiyuan\":\"9\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 14:29:36', 36);
INSERT INTO `sys_oper_log` VALUES (165, '坐标数据', 2, 'com.sxs.ditu.controller.YbZuobiaoController.edit()', 'PUT', 1, 'admin1', NULL, '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-03-23 05:12:50\",\"fuzeren\":\"黄磊\",\"hzhiyuan\":\"[{\\\"name\\\":\\\"小王\\\",\\\"数据\\\":\\\"8888888\\\"}]\",\"id\":2,\"leibie\":\"中山公园南门\",\"nickName\":\"Admin\",\"params\":{},\"status\":\"显示\",\"userId\":1,\"zrenshu\":\"30\",\"zuobiao\":\"[927,321]\",\"zzhiyuan\":\"9\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 14:36:18', 9);
INSERT INTO `sys_oper_log` VALUES (166, '坐标数据', 2, 'com.sxs.ditu.controller.YbZuobiaoController.edit()', 'PUT', 1, 'admin1', NULL, '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-03-23 13:58:01\",\"fuzeren\":\"王涛\",\"hzhiyuan\":\"[{\\\"name\\\":\\\"小王\\\",\\\"数据\\\":\\\"8888888\\\"}]\",\"id\":22,\"leibie\":\"数量\",\"nickName\":\"\",\"params\":{},\"status\":\"显示\",\"userId\":0,\"zrenshu\":\"20\",\"zuobiao\":\"[1028,760]\",\"zzhiyuan\":\"10\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 14:42:08', 9);
INSERT INTO `sys_oper_log` VALUES (167, '坐标数据', 2, 'com.sxs.ditu.controller.YbZuobiaoController.edit()', 'PUT', 1, 'admin1', NULL, '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-03-23 14:03:11\",\"fuzeren\":\"黄菲\",\"hzhiyuan\":\"[{\\\"name\\\":\\\"小王\\\",\\\"数据\\\":\\\"8888888\\\"}]\",\"id\":23,\"leibie\":\"数量\",\"nickName\":\"\",\"params\":{},\"status\":\"显示\",\"userId\":0,\"zrenshu\":\"11\",\"zuobiao\":\"[761,829]\",\"zzhiyuan\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 14:42:12', 7);
INSERT INTO `sys_oper_log` VALUES (168, '坐标数据', 2, 'com.sxs.ditu.controller.YbZuobiaoController.edit()', 'PUT', 1, 'admin1', NULL, '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-03-23 14:10:37\",\"fuzeren\":\"王艳\",\"hzhiyuan\":\"[{\\\"name\\\":\\\"小王\\\",\\\"数据\\\":\\\"8888888\\\"}]\",\"id\":24,\"leibie\":\"数量\",\"nickName\":\"\",\"params\":{},\"status\":\"显示\",\"userId\":0,\"zrenshu\":\"33\",\"zuobiao\":\"[438,398]\",\"zzhiyuan\":\"22\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 14:42:15', 6);
INSERT INTO `sys_oper_log` VALUES (169, '坐标数据', 2, 'com.sxs.ditu.controller.YbZuobiaoController.edit()', 'PUT', 1, 'admin1', NULL, '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-03-23 05:12:50\",\"fuzeren\":\"黄磊\",\"hzhiyuan\":\"[{\\\"name\\\":\\\"小王\\\",\\\"数据\\\":\\\"8888888\\\"},{\\\"name\\\":\\\"小花\\\",\\\"数据\\\":\\\"99999999\\\"}]\",\"id\":2,\"leibie\":\"中山公园南门\",\"nickName\":\"Admin\",\"params\":{},\"status\":\"显示\",\"userId\":1,\"zrenshu\":\"30\",\"zuobiao\":\"[927,321]\",\"zzhiyuan\":\"9\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 14:55:28', 25);
INSERT INTO `sys_oper_log` VALUES (170, '坐标数据', 3, 'com.sxs.ditu.controller.YbZuobiaoController.remove()', 'DELETE', 1, 'admin1', NULL, '/ditu/zuobiao/30', '127.0.0.1', '内网IP', '[30]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 16:00:02', 9);
INSERT INTO `sys_oper_log` VALUES (171, '坐标数据', 1, 'com.sxs.ditu.controller.YbZuobiaoController.add()', 'POST', 1, 'admin1', NULL, '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"hzhiyuan\":\"[]\",\"id\":31,\"nickName\":\"admin1\",\"params\":{},\"userId\":104,\"zuobiao\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 16:00:10', 12);
INSERT INTO `sys_oper_log` VALUES (172, '坐标数据', 3, 'com.sxs.ditu.controller.YbZuobiaoController.remove()', 'DELETE', 1, 'admin1', NULL, '/ditu/zuobiao/31', '127.0.0.1', '内网IP', '[31]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 16:00:13', 5);
INSERT INTO `sys_oper_log` VALUES (173, '坐标数据', 3, 'com.sxs.ditu.controller.YbZuobiaoController.remove()', 'DELETE', 1, 'admin1', NULL, '/ditu/zuobiao/25,26,28,29', '127.0.0.1', '内网IP', '[25,26,28,29]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 16:00:20', 8);
INSERT INTO `sys_oper_log` VALUES (174, '坐标数据', 2, 'com.sxs.ditu.controller.YbZuobiaoController.edit()', 'PUT', 1, 'admin1', NULL, '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-03-23 05:12:50\",\"fuzeren\":\"黄磊\",\"hzhiyuan\":\"[{\\\"name\\\":\\\"小王\\\",\\\"数据\\\":\\\"8888888\\\"},{\\\"name\\\":\\\"小花\\\",\\\"数据\\\":\\\"99999999\\\"},{\\\"name\\\":\\\"111\\\",\\\"数据\\\":\\\"11\\\"},{\\\"name\\\":\\\"11\\\",\\\"数据\\\":\\\"\\\"},{\\\"name\\\":\\\"111\\\",\\\"数据\\\":\\\"\\\"}]\",\"id\":2,\"leibie\":\"中山公园南门\",\"nickName\":\"Admin\",\"params\":{},\"status\":\"显示\",\"userId\":1,\"zrenshu\":\"30\",\"zuobiao\":\"[927,321]\",\"zzhiyuan\":\"9\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 16:01:37', 9);
INSERT INTO `sys_oper_log` VALUES (175, '角色管理', 2, 'com.sxs.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-02-11 00:11:12\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2005,2006,2007,2008,2009,2010,2004],\"params\":{},\"roleId\":100,\"roleKey\":\"user\",\"roleName\":\"用户\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 16:06:56', 29);
INSERT INTO `sys_oper_log` VALUES (176, '角色管理', 2, 'com.sxs.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-02-06 23:26:45\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2005,2006,2007,2008,2009,2010,2004],\"params\":{},\"remark\":\"管理员\",\"roleId\":2,\"roleKey\":\"admin1\",\"roleName\":\"管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 16:07:03', 10);
INSERT INTO `sys_oper_log` VALUES (177, '代码生成', 6, 'com.sxs.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"yb_biaodan\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 16:08:59', 62);
INSERT INTO `sys_oper_log` VALUES (178, '代码生成', 2, 'com.sxs.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"biaodan\",\"className\":\"YbBiaodan\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"编号\",\"columnId\":15,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-23 16:08:59\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Zuobiao\",\"columnComment\":\"坐标数据\",\"columnId\":16,\"columnName\":\"zuobiao\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-23 16:08:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"zuobiao\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Leibie\",\"columnComment\":\"类别\",\"columnId\":17,\"columnName\":\"leibie\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-23 16:08:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"leibie\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Zrenshu\",\"columnComment\":\"客控总人数\",\"columnId\":18,\"columnName\":\"zrenshu\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-23 16:08:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"zrenshu\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 16:09:58', 39);
INSERT INTO `sys_oper_log` VALUES (179, '代码生成', 2, 'com.sxs.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"biaodan\",\"className\":\"YbBiaodan\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"编号\",\"columnId\":15,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-23 16:08:59\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-03-23 16:09:58\",\"usableColumn\":false},{\"capJavaField\":\"Zuobiao\",\"columnComment\":\"坐标数据\",\"columnId\":16,\"columnName\":\"zuobiao\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-23 16:08:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"zuobiao\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-03-23 16:09:58\",\"usableColumn\":false},{\"capJavaField\":\"Leibie\",\"columnComment\":\"类别\",\"columnId\":17,\"columnName\":\"leibie\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-23 16:08:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"leibie\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-03-23 16:09:58\",\"usableColumn\":false},{\"capJavaField\":\"Zrenshu\",\"columnComment\":\"客控总人数\",\"columnId\":18,\"columnName\":\"zrenshu\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-23 16:08:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isInc', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 16:10:04', 20);
INSERT INTO `sys_oper_log` VALUES (180, '代码生成', 8, 'com.sxs.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"yb_biaodan\"}', NULL, 0, NULL, '2025-03-23 16:10:06', 344);
INSERT INTO `sys_oper_log` VALUES (181, '菜单管理', 2, 'com.sxs.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"ditu/biaodan/index\",\"createTime\":\"2025-03-23 16:12:02\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2018,\"menuName\":\"表单管理\",\"menuType\":\"C\",\"orderNum\":11,\"params\":{},\"parentId\":0,\"path\":\"biaodan\",\"perms\":\"ditu:biaodan:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 16:12:37', 17);
INSERT INTO `sys_oper_log` VALUES (182, '表单管理', 2, 'com.sxs.ditu.controller.YbBiaodanController.edit()', 'PUT', 1, 'admin', '研发部门', '/ditu/biaodan', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-03-23 05:12:50\",\"fuzeren\":\"黄磊\",\"hzhiyuan\":\"8\",\"id\":2,\"leibie\":\"数量\",\"nickName\":\"Admin\",\"params\":{},\"status\":\"显示\",\"userId\":1,\"zrenshu\":\"30\",\"zuobiao\":\"[1431,194]\",\"zzhiyuan\":\"9\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 16:27:44', 30);
INSERT INTO `sys_oper_log` VALUES (183, '角色管理', 2, 'com.sxs.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-02-06 23:26:45\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2005,2006,2007,2008,2009,2010,2018,2019,2020,2021,2022,2023,2004],\"params\":{},\"remark\":\"管理员\",\"roleId\":2,\"roleKey\":\"admin1\",\"roleName\":\"管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 16:41:39', 35);
INSERT INTO `sys_oper_log` VALUES (184, '角色管理', 2, 'com.sxs.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-02-11 00:11:12\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2005,2006,2007,2008,2009,2010,2018,2019,2020,2021,2022,2023,2004],\"params\":{},\"roleId\":100,\"roleKey\":\"user\",\"roleName\":\"用户\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 16:41:42', 16);
INSERT INTO `sys_oper_log` VALUES (185, '坐标数据', 2, 'com.sxs.ditu.controller.YbZuobiaoController.edit()', 'PUT', 1, 'admin1', NULL, '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-03-23 13:58:01\",\"fuzeren\":\"王涛\",\"hzhiyuan\":\"[{\\\"name\\\":\\\"小王\\\",\\\"数据\\\":\\\"8888888\\\"},{\\\"name\\\":\\\"小芳\\\",\\\"数据\\\":\\\"2222\\\"},{\\\"name\\\":\\\"小哈\\\",\\\"数据\\\":\\\"111111\\\"}]\",\"id\":22,\"leibie\":\"数量\",\"nickName\":\"\",\"params\":{},\"status\":\"不显示\",\"userId\":0,\"zrenshu\":\"20\",\"zuobiao\":\"[1028,760]\",\"zzhiyuan\":\"10\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 16:43:52', 12);
INSERT INTO `sys_oper_log` VALUES (186, '坐标数据', 1, 'com.sxs.ditu.controller.YbZuobiaoController.add()', 'POST', 1, 'admin1', NULL, '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"fuzeren\":\"111\",\"hzhiyuan\":\"[]\",\"id\":34,\"leibie\":\"1111\",\"nickName\":\"admin1\",\"params\":{},\"userId\":104,\"zuobiao\":\"[399,499]\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 16:45:33', 7);
INSERT INTO `sys_oper_log` VALUES (187, '表单管理', 2, 'com.sxs.ditu.controller.YbBiaodanController.edit()', 'PUT', 1, 'admin1', NULL, '/ditu/biaodan', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-03-23 05:12:50\",\"fuzeren\":\"黄磊\",\"hzhiyuan\":\"8\",\"id\":2,\"leibie\":\"数量\",\"nickName\":\"Admin\",\"params\":{},\"status\":\"显示\",\"userId\":1,\"zrenshu\":\"9999\",\"zuobiao\":\"[1431,194]\",\"zzhiyuan\":\"9\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 16:46:56', 9);
INSERT INTO `sys_oper_log` VALUES (188, '表单管理', 2, 'com.sxs.ditu.controller.YbBiaodanController.edit()', 'PUT', 1, 'admin1', NULL, '/ditu/biaodan', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-03-23 05:12:50\",\"fuzeren\":\"黄磊\",\"hzhiyuan\":\"8\",\"id\":2,\"leibie\":\"数量\",\"nickName\":\"Admin\",\"params\":{},\"status\":\"不显示\",\"userId\":1,\"zrenshu\":\"9999\",\"zuobiao\":\"[1431,194]\",\"zzhiyuan\":\"9\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-23 16:50:55', 13);
INSERT INTO `sys_oper_log` VALUES (189, '菜单管理', 2, 'com.sxs.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"ditu/zuobiao/index\",\"createTime\":\"2025-03-23 12:32:20\",\"icon\":\"international\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"点位坐标数据\",\"menuType\":\"C\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"zuobiao\",\"perms\":\"ditu:zuobiao:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-27 08:48:33', 24);
INSERT INTO `sys_oper_log` VALUES (190, '菜单管理', 1, 'com.sxs.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"ditu/zuobiao/jiankong\",\"createBy\":\"admin\",\"icon\":\"eye-open\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"监控坐标数据\",\"menuType\":\"C\",\"orderNum\":11,\"params\":{},\"parentId\":0,\"path\":\"jiankong\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-27 08:49:30', 9);
INSERT INTO `sys_oper_log` VALUES (191, '坐标数据', 2, 'com.sxs.ditu.controller.YbZuobiaoController.edit()', 'PUT', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-03-27 08:23:27\",\"fuzeren\":\"\",\"hzhiyuan\":\"[]\",\"id\":35,\"kz1\":\"3\",\"kz2\":\"xx路口摄像头7\",\"leibie\":\"11\",\"nickName\":\"\",\"params\":{},\"status\":\"显示\",\"userId\":0,\"zrenshu\":\"\",\"zuobiao\":\"[600,434]\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-27 08:59:15', 10);
INSERT INTO `sys_oper_log` VALUES (192, '坐标数据', 1, 'com.sxs.ditu.controller.YbZuobiaoController.add()', 'POST', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"hzhiyuan\":\"[]\",\"id\":37,\"kz1\":\"3\",\"kz2\":\"摄像头8\",\"nickName\":\"Admin\",\"params\":{},\"userId\":1,\"zuobiao\":\"[600,500]\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-27 09:00:39', 7);
INSERT INTO `sys_oper_log` VALUES (193, '表单管理', 2, 'com.sxs.ditu.controller.YbBiaodanController.edit()', 'PUT', 1, 'admin', '研发部门', '/ditu/biaodan', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-03-23 05:12:50\",\"fuzeren\":\"黄磊\",\"hzhiyuan\":\"8\",\"id\":2,\"leibie\":\"数量\",\"nickName\":\"Admin\",\"params\":{},\"status\":\"显示\",\"userId\":1,\"zrenshu\":\"9999\",\"zuobiao\":\"[1431,194]\",\"zzhiyuan\":\"9\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-27 09:01:12', 10);
INSERT INTO `sys_oper_log` VALUES (194, '菜单管理', 2, 'com.sxs.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"ditu/biaodan/index\",\"createTime\":\"2025-03-23 16:12:02\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2018,\"menuName\":\"表单管理\",\"menuType\":\"C\",\"orderNum\":13,\"params\":{},\"parentId\":0,\"path\":\"biaodan\",\"perms\":\"ditu:biaodan:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-27 09:02:49', 9);
INSERT INTO `sys_oper_log` VALUES (195, '菜单管理', 2, 'com.sxs.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"ditu/biaodan/index\",\"createTime\":\"2025-03-23 16:12:02\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2018,\"menuName\":\"右上角表单修改\",\"menuType\":\"C\",\"orderNum\":13,\"params\":{},\"parentId\":0,\"path\":\"biaodan\",\"perms\":\"ditu:biaodan:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-27 09:03:10', 10);
INSERT INTO `sys_oper_log` VALUES (196, '坐标数据', 2, 'com.sxs.ditu.controller.YbZuobiaoController.edit()', 'PUT', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-03-27 09:00:39\",\"hzhiyuan\":\"[]\",\"id\":37,\"kz1\":\"3\",\"kz2\":\"摄像头9\",\"nickName\":\"Admin\",\"params\":{},\"userId\":1,\"zuobiao\":\"[600,500]\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-27 11:13:47', 12);
INSERT INTO `sys_oper_log` VALUES (197, '坐标数据', 1, 'com.sxs.ditu.controller.YbZuobiaoController.add()', 'POST', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"hzhiyuan\":\"[]\",\"id\":38,\"kz1\":\"3\",\"kz2\":\"111\",\"nickName\":\"Admin\",\"params\":{},\"userId\":1,\"zuobiao\":\"[600,700]\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-27 11:14:17', 9);
INSERT INTO `sys_oper_log` VALUES (198, '坐标数据', 2, 'com.sxs.ditu.controller.YbZuobiaoController.edit()', 'PUT', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-03-27 11:14:17\",\"hzhiyuan\":\"[]\",\"id\":38,\"kz1\":\"3\",\"kz2\":\"888\",\"nickName\":\"Admin\",\"params\":{},\"userId\":1,\"zuobiao\":\"[600,700]\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-27 11:14:44', 4);
INSERT INTO `sys_oper_log` VALUES (199, '坐标数据', 2, 'com.sxs.ditu.controller.YbZuobiaoController.edit()', 'PUT', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-03-27 11:14:17\",\"hzhiyuan\":\"[]\",\"id\":38,\"kz1\":\"3\",\"kz2\":\"999\",\"nickName\":\"Admin\",\"params\":{},\"userId\":1,\"zuobiao\":\"[600,700]\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-27 11:15:02', 7);
INSERT INTO `sys_oper_log` VALUES (200, '角色管理', 2, 'com.sxs.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-02-06 23:26:45\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2005,2006,2007,2008,2009,2010,2024,2018,2019,2020,2021,2022,2023,2004],\"params\":{},\"remark\":\"管理员\",\"roleId\":2,\"roleKey\":\"admin1\",\"roleName\":\"管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-27 11:37:16', 59);
INSERT INTO `sys_oper_log` VALUES (201, '角色管理', 2, 'com.sxs.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-02-11 00:11:12\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2005,2006,2007,2008,2009,2010,2024,2018,2019,2020,2021,2022,2023,2004],\"params\":{},\"roleId\":100,\"roleKey\":\"user\",\"roleName\":\"用户\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-27 11:37:21', 12);
INSERT INTO `sys_oper_log` VALUES (202, '坐标数据', 1, 'com.sxs.ditu.controller.YbZuobiaoController.add()', 'POST', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"hzhiyuan\":\"[]\",\"id\":40,\"kz1\":\"3\",\"kz2\":\"嘻嘻\",\"nickName\":\"Admin\",\"params\":{},\"userId\":1,\"zuobiao\":\"[600,800]\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-28 00:10:15', 17);
INSERT INTO `sys_oper_log` VALUES (203, '坐标数据', 1, 'com.sxs.ditu.controller.YbZuobiaoController.add()', 'POST', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"hzhiyuan\":\"[]\",\"id\":41,\"nickName\":\"Admin\",\"params\":{},\"userId\":1,\"zuobiao\":\"[602,401]\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-28 00:10:45', 7);
INSERT INTO `sys_oper_log` VALUES (204, '坐标数据', 1, 'com.sxs.ditu.controller.YbZuobiaoController.add()', 'POST', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"hzhiyuan\":\"[]\",\"id\":42,\"nickName\":\"Admin\",\"params\":{},\"userId\":1,\"zuobiao\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-28 00:12:06', 7);
INSERT INTO `sys_oper_log` VALUES (205, '坐标数据', 1, 'com.sxs.ditu.controller.YbZuobiaoController.add()', 'POST', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"hzhiyuan\":\"[]\",\"id\":43,\"kz1\":\"1\",\"nickName\":\"Admin\",\"params\":{},\"userId\":1,\"zuobiao\":\"111\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-28 00:23:02', 7);
INSERT INTO `sys_oper_log` VALUES (206, '坐标数据', 1, 'com.sxs.ditu.controller.YbZuobiaoController.add()', 'POST', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"hzhiyuan\":\"[]\",\"id\":44,\"kz1\":\"1\",\"nickName\":\"Admin\",\"params\":{},\"userId\":1,\"zuobiao\":\"1111111\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-28 00:23:47', 7);
INSERT INTO `sys_oper_log` VALUES (207, '坐标数据', 1, 'com.sxs.ditu.controller.YbZuobiaoController.add()', 'POST', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"fuzeren\":\"11\",\"hzhiyuan\":\"[{\\\"name\\\":\\\"11\\\",\\\"数据\\\":\\\"11\\\"}]\",\"id\":45,\"kz1\":\"1\",\"leibie\":\"11\",\"nickName\":\"Admin\",\"params\":{},\"userId\":1,\"zrenshu\":\"11\",\"zuobiao\":\"[1,2]\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-28 00:24:52', 6);
INSERT INTO `sys_oper_log` VALUES (208, '坐标数据', 2, 'com.sxs.ditu.controller.YbZuobiaoController.edit()', 'PUT', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-03-27 11:48:55\",\"fuzeren\":\"\",\"hzhiyuan\":\"[]\",\"id\":39,\"kz1\":\"1\",\"leibie\":\"777\",\"nickName\":\"\",\"params\":{},\"status\":\"显示\",\"userId\":0,\"zrenshu\":\"\",\"zuobiao\":\"[602,301]\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-28 00:25:04', 8);
INSERT INTO `sys_oper_log` VALUES (209, '坐标数据', 3, 'com.sxs.ditu.controller.YbZuobiaoController.remove()', 'DELETE', 1, 'admin', '研发部门', '/ditu/zuobiao/39', '127.0.0.1', '内网IP', '[39]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-28 00:26:21', 12);
INSERT INTO `sys_oper_log` VALUES (210, '坐标数据', 3, 'com.sxs.ditu.controller.YbZuobiaoController.remove()', 'DELETE', 1, 'admin', '研发部门', '/ditu/zuobiao/44', '127.0.0.1', '内网IP', '[44]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-28 00:26:27', 7);
INSERT INTO `sys_oper_log` VALUES (211, '坐标数据', 1, 'com.sxs.ditu.controller.YbZuobiaoController.add()', 'POST', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"hzhiyuan\":\"[]\",\"id\":46,\"kz1\":\"2\",\"nickName\":\"Admin\",\"params\":{},\"userId\":1,\"zuobiao\":\"111\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-28 00:30:08', 5);
INSERT INTO `sys_oper_log` VALUES (212, '坐标数据', 1, 'com.sxs.ditu.controller.YbZuobiaoController.add()', 'POST', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"hzhiyuan\":\"[]\",\"id\":47,\"kz1\":\"2\",\"nickName\":\"Admin\",\"params\":{},\"userId\":1,\"zuobiao\":\"111\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-28 00:37:06', 7);
INSERT INTO `sys_oper_log` VALUES (213, '坐标数据', 1, 'com.sxs.ditu.controller.YbZuobiaoController.add()', 'POST', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"hzhiyuan\":\"[]\",\"id\":48,\"kz1\":\"1\",\"nickName\":\"Admin\",\"params\":{},\"userId\":1,\"zuobiao\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-28 00:46:24', 17);
INSERT INTO `sys_oper_log` VALUES (214, '坐标数据', 1, 'com.sxs.ditu.controller.YbZuobiaoController.add()', 'POST', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"fuzeren\":\"\",\"hzhiyuan\":\"[]\",\"id\":49,\"kz1\":\"1\",\"leibie\":\"111\",\"nickName\":\"\",\"params\":{},\"status\":\"显示\",\"userId\":0,\"zrenshu\":\"\",\"zuobiao\":\"[551,277]\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-28 00:46:39', 7);
INSERT INTO `sys_oper_log` VALUES (215, '坐标数据', 1, 'com.sxs.ditu.controller.YbZuobiaoController.add()', 'POST', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"hzhiyuan\":\"[]\",\"id\":50,\"kz1\":\"1\",\"nickName\":\"Admin\",\"params\":{},\"userId\":1,\"zuobiao\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-28 00:47:33', 7);
INSERT INTO `sys_oper_log` VALUES (216, '坐标数据', 3, 'com.sxs.ditu.controller.YbZuobiaoController.remove()', 'DELETE', 1, 'admin', '研发部门', '/ditu/zuobiao/50', '127.0.0.1', '内网IP', '[50]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-28 00:51:00', 6);
INSERT INTO `sys_oper_log` VALUES (217, '坐标数据', 3, 'com.sxs.ditu.controller.YbZuobiaoController.remove()', 'DELETE', 1, 'admin', '研发部门', '/ditu/zuobiao/49', '127.0.0.1', '内网IP', '[49]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-28 00:51:15', 6);
INSERT INTO `sys_oper_log` VALUES (218, '坐标数据', 1, 'com.sxs.ditu.controller.YbZuobiaoController.add()', 'POST', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"hzhiyuan\":\"[]\",\"id\":51,\"kz1\":\"1\",\"nickName\":\"Admin\",\"params\":{},\"userId\":1,\"zuobiao\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-28 00:52:52', 6);
INSERT INTO `sys_oper_log` VALUES (219, '坐标数据', 1, 'com.sxs.ditu.controller.YbZuobiaoController.add()', 'POST', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"hzhiyuan\":\"[]\",\"id\":52,\"kz1\":\"1\",\"nickName\":\"Admin\",\"params\":{},\"userId\":1,\"zuobiao\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-28 00:52:56', 6);
INSERT INTO `sys_oper_log` VALUES (220, '坐标数据', 1, 'com.sxs.ditu.controller.YbZuobiaoController.add()', 'POST', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"hzhiyuan\":\"[]\",\"id\":53,\"kz1\":\"1\",\"nickName\":\"Admin\",\"params\":{},\"userId\":1,\"zuobiao\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-28 00:53:00', 6);
INSERT INTO `sys_oper_log` VALUES (221, '坐标数据', 3, 'com.sxs.ditu.controller.YbZuobiaoController.remove()', 'DELETE', 1, 'admin', '研发部门', '/ditu/zuobiao/46,47,48,51,52,53', '127.0.0.1', '内网IP', '[46,47,48,51,52,53]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-28 00:53:37', 8);
INSERT INTO `sys_oper_log` VALUES (222, '坐标数据', 1, 'com.sxs.ditu.controller.YbZuobiaoController.add()', 'POST', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"fuzeren\":\"\",\"hzhiyuan\":\"[]\",\"id\":54,\"kz1\":\"1\",\"leibie\":\"111\",\"nickName\":\"\",\"params\":{},\"status\":\"显示\",\"userId\":0,\"zrenshu\":\"\",\"zuobiao\":\"[717,454]\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-28 00:53:51', 9);
INSERT INTO `sys_oper_log` VALUES (223, '坐标数据', 3, 'com.sxs.ditu.controller.YbZuobiaoController.remove()', 'DELETE', 1, 'admin', '研发部门', '/ditu/zuobiao/54', '127.0.0.1', '内网IP', '[54]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-28 00:54:06', 6);
INSERT INTO `sys_oper_log` VALUES (224, '代码生成', 6, 'com.sxs.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"yb_tupian\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-28 01:00:57', 33);
INSERT INTO `sys_oper_log` VALUES (225, '代码生成', 2, 'com.sxs.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"tupian\",\"className\":\"YbTupian\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":29,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-28 01:00:57\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Src\",\"columnComment\":\"图片\",\"columnId\":30,\"columnName\":\"src\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-28 01:00:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"src\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"sxs\",\"functionName\":\"背景图片\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"system\",\"options\":\"{}\",\"packageName\":\"com.sxs.system\",\"params\":{},\"sub\":false,\"tableComment\":\"背景图片\",\"tableId\":3,\"tableName\":\"yb_tupian\",\"tplCategory\":\"crud\",\"tplWebType\":\"element-plus\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-28 01:01:13', 19);
INSERT INTO `sys_oper_log` VALUES (226, '代码生成', 8, 'com.sxs.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"yb_tupian\"}', NULL, 0, NULL, '2025-03-28 01:01:16', 357);
INSERT INTO `sys_oper_log` VALUES (227, '菜单管理', 2, 'com.sxs.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/tupian/index\",\"createTime\":\"2025-03-28 01:02:12\",\"icon\":\"dashboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"背景图片\",\"menuType\":\"C\",\"orderNum\":14,\"params\":{},\"parentId\":3,\"path\":\"tupian\",\"perms\":\"system:tupian:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-28 01:02:45', 12);
INSERT INTO `sys_oper_log` VALUES (228, '菜单管理', 2, 'com.sxs.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/tupian/index\",\"createTime\":\"2025-03-28 01:02:12\",\"icon\":\"dashboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"背景图片\",\"menuType\":\"C\",\"orderNum\":14,\"params\":{},\"parentId\":0,\"path\":\"tupian\",\"perms\":\"system:tupian:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-28 01:03:00', 9);
INSERT INTO `sys_oper_log` VALUES (229, '背景图片', 1, 'com.sxs.system.controller.YbTupianController.add()', 'POST', 1, 'admin', '研发部门', '/system/tupian', '127.0.0.1', '内网IP', '{\"params\":{},\"src\":\"/profile/upload/2025/03/28/微信图片_20250328010337_20250328010425A002.jpg\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [T:\\01外包2025\\50地图\\soft\\serve\\sxs-admin\\target\\classes\\mapper\\system\\YbTupianMapper.xml]\r\n### The error may involve com.sxs.system.mapper.YbTupianMapper.insertYbTupian-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into yb_tupian          ( src )           values ( ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2025-03-28 01:04:26', 107);
INSERT INTO `sys_oper_log` VALUES (230, '背景图片', 1, 'com.sxs.system.controller.YbTupianController.add()', 'POST', 1, 'admin', '研发部门', '/system/tupian', '127.0.0.1', '内网IP', '{\"params\":{},\"src\":\"/profile/upload/2025/03/28/微信图片_20250328010337_20250328010425A002.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-28 01:04:43', 9);
INSERT INTO `sys_oper_log` VALUES (231, '背景图片', 2, 'com.sxs.system.controller.YbTupianController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/tupian', '127.0.0.1', '内网IP', '{\"id\":1,\"params\":{},\"src\":\"/profile/upload/2025/03/28/下载 (1)_20250328011030A003.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-28 01:10:31', 8);
INSERT INTO `sys_oper_log` VALUES (232, '背景图片', 2, 'com.sxs.system.controller.YbTupianController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/tupian', '127.0.0.1', '内网IP', '{\"id\":1,\"params\":{},\"src\":\"/profile/upload/2025/03/28/10ffa4ef-e453-4777-be84-b095f4bcd70e_1741428945763_20250328011701A004.png\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-28 01:17:02', 7);
INSERT INTO `sys_oper_log` VALUES (233, '角色管理', 2, 'com.sxs.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-02-06 23:26:45\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2005,2006,2007,2008,2009,2010,2024,2018,2019,2020,2021,2022,2023,2025,2026,2027,2028,2029,2030,2004],\"params\":{},\"remark\":\"管理员\",\"roleId\":2,\"roleKey\":\"admin1\",\"roleName\":\"管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-28 01:19:04', 24);
INSERT INTO `sys_oper_log` VALUES (234, '角色管理', 2, 'com.sxs.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-02-11 00:11:12\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2005,2006,2007,2008,2009,2010,2024,2018,2019,2020,2021,2022,2023,2025,2026,2027,2028,2029,2030,2004],\"params\":{},\"roleId\":100,\"roleKey\":\"user\",\"roleName\":\"用户\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-28 01:19:07', 11);
INSERT INTO `sys_oper_log` VALUES (235, '背景图片', 2, 'com.sxs.system.controller.YbTupianController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/tupian', '127.0.0.1', '内网IP', '{\"id\":1,\"params\":{},\"src\":\"/profile/upload/2025/03/28/微信图片_20250328010337_20250328012240A005.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-28 01:22:41', 7);
INSERT INTO `sys_oper_log` VALUES (236, '背景图片', 2, 'com.sxs.system.controller.YbTupianController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/tupian', '127.0.0.1', '内网IP', '{\"id\":1,\"params\":{},\"src\":\"/profile/upload/2025/04/18/微信图片_20250418160735_20250418160808A001.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 16:08:08', 14);
INSERT INTO `sys_oper_log` VALUES (237, '菜单管理', 2, 'com.sxs.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"ditu/zuobiao/index\",\"createTime\":\"2025-03-23 12:32:20\",\"icon\":\"international\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"公墓坐标数据\",\"menuType\":\"C\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"zuobiao\",\"perms\":\"ditu:zuobiao:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 16:18:59', 19);
INSERT INTO `sys_oper_log` VALUES (238, '菜单管理', 2, 'com.sxs.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"ditu/zuobiao/jiankong\",\"createTime\":\"2025-03-27 08:49:30\",\"icon\":\"eye-open\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2024,\"menuName\":\"监控坐标数据\",\"menuType\":\"C\",\"orderNum\":11,\"params\":{},\"parentId\":0,\"path\":\"jiankong\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 16:19:06', 12);
INSERT INTO `sys_oper_log` VALUES (239, '菜单管理', 2, 'com.sxs.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"ditu/biaodan/index\",\"createTime\":\"2025-03-23 16:12:02\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2018,\"menuName\":\"右上角表单修改\",\"menuType\":\"C\",\"orderNum\":13,\"params\":{},\"parentId\":0,\"path\":\"biaodan\",\"perms\":\"ditu:biaodan:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 16:19:13', 11);
INSERT INTO `sys_oper_log` VALUES (240, '菜单管理', 2, 'com.sxs.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/tupian/index\",\"createTime\":\"2025-03-28 01:02:12\",\"icon\":\"dashboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"背景图片\",\"menuType\":\"C\",\"orderNum\":14,\"params\":{},\"parentId\":0,\"path\":\"tupian\",\"perms\":\"system:tupian:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 16:19:19', 12);
INSERT INTO `sys_oper_log` VALUES (241, '角色管理', 2, 'com.sxs.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-02-06 23:26:45\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2005,2006,2007,2008,2009,2010,2025,2026,2027,2028,2029,2030,2004],\"params\":{},\"remark\":\"管理员\",\"roleId\":2,\"roleKey\":\"admin1\",\"roleName\":\"管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 16:19:42', 33);
INSERT INTO `sys_oper_log` VALUES (242, '角色管理', 2, 'com.sxs.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-02-11 00:11:12\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2005,2006,2007,2008,2009,2010,2025,2026,2027,2028,2029,2030,2004],\"params\":{},\"roleId\":100,\"roleKey\":\"user\",\"roleName\":\"用户\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 16:19:48', 14);
INSERT INTO `sys_oper_log` VALUES (243, '坐标数据', 2, 'com.sxs.ditu.controller.YbZuobiaoController.edit()', 'PUT', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-03-23 05:12:50\",\"fuzeren\":\"蒋金龙  韩通航\",\"hzhiyuan\":\"[{\\\"name\\\":\\\"111\\\",\\\"数据\\\":\\\"8888888\\\"},{\\\"name\\\":\\\"222\\\",\\\"数据\\\":\\\"99999999\\\"}]\",\"id\":2,\"kz1\":\"1\",\"leibie\":\"公墓位置1\",\"nickName\":\"Admin\",\"params\":{},\"status\":\"显示\",\"userId\":1,\"zrenshu\":\"<p>公墓位置1</p>\",\"zuobiao\":\"[927,321]\",\"zzhiyuan\":\"9\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 16:20:33', 10);
INSERT INTO `sys_oper_log` VALUES (244, '坐标数据', 2, 'com.sxs.ditu.controller.YbZuobiaoController.edit()', 'PUT', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-04-15 05:12:50\",\"fuzeren\":\"蒋金龙  韩通航\",\"hzhiyuan\":\"[{\\\"name\\\":\\\"111\\\",\\\"数据\\\":\\\"8888888\\\"},{\\\"name\\\":\\\"222\\\",\\\"数据\\\":\\\"99999999\\\"}]\",\"id\":2,\"kz1\":\"1\",\"leibie\":\"公墓位置1\",\"nickName\":\"Admin\",\"params\":{},\"status\":\"显示\",\"userId\":1,\"zrenshu\":\"<p><strong>姓名</strong>：张明远</p><p><strong>生卒</strong>：1945年3月12日 — 2022年11月5日</p><p><strong>墓志铭</strong>：</p><p><em>“一生勤勉，仁厚传家。</em></p><p><br></p><p><em>如山之静，似海之深。”</em></p><p><strong>亲属敬立</strong></p>\",\"zuobiao\":\"[927,321]\",\"zzhiyuan\":\"9\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 16:25:36', 10);
INSERT INTO `sys_oper_log` VALUES (245, '坐标数据', 2, 'com.sxs.ditu.controller.YbZuobiaoController.edit()', 'PUT', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-04-15 05:12:50\",\"fuzeren\":\"尹航 刘成立\",\"hzhiyuan\":\"[{\\\"name\\\":\\\"1\\\",\\\"数据\\\":\\\"\\\"},{\\\"name\\\":\\\"1\\\",\\\"数据\\\":\\\"\\\"},{\\\"name\\\":\\\"1\\\",\\\"数据\\\":\\\"\\\"}]\",\"id\":41,\"kz1\":\"1\",\"leibie\":\"中山公园B口\",\"nickName\":\"\",\"params\":{},\"status\":\"显示\",\"userId\":0,\"zrenshu\":\"<p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">姓名：李婉婷</span></p><p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">生卒：1980年8月20日 — 2023年4月15日</span></p><p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">墓志铭：</span></p><p><em style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">“热爱旅行与诗歌的灵魂，</em></p><p><em style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">永远活在春天的风里。</em></p><p><em style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">‘世界是一本书，而你看完了每一页。’”</em></p><p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">丈夫王志远与女儿小安 永远怀念</span></p>\",\"zuobiao\":\"[1353,315]\"}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'zrenshu\' at row 1\r\n### The error may exist in file [T:\\01外包2025\\666合作电子墓碑公墓系统1200\\soft2\\serve\\sxs-admin\\target\\classes\\mapper\\ditu\\YbZuobiaoMapper.xml]\r\n### The error may involve com.sxs.ditu.mapper.YbZuobiaoMapper.updateYbZuobiao-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update yb_zuobiao          SET zuobiao = ?,             leibie = ?,             zrenshu = ?,             fuzeren = ?,             hzhiyuan = ?,                          status = ?,             createdtime = ?,             user_id = ?,             nick_name = ?,             kz1 = ?          where id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'zrenshu\' at row 1\n; Data truncation: Data too long for column \'zrenshu\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'zrenshu\' at row 1', '2025-04-18 16:25:50', 59);
INSERT INTO `sys_oper_log` VALUES (246, '坐标数据', 2, 'com.sxs.ditu.controller.YbZuobiaoController.edit()', 'PUT', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-04-15 05:12:50\",\"fuzeren\":\"尹航 刘成立\",\"hzhiyuan\":\"\\\"[{\\\\\\\"name\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"数据\\\\\\\":\\\\\\\"\\\\\\\"},{\\\\\\\"name\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"数据\\\\\\\":\\\\\\\"\\\\\\\"},{\\\\\\\"name\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"数据\\\\\\\":\\\\\\\"\\\\\\\"}]\\\"\",\"id\":41,\"kz1\":\"1\",\"leibie\":\"中山公园B口\",\"nickName\":\"\",\"params\":{},\"status\":\"显示\",\"userId\":0,\"zrenshu\":\"<p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">姓名：李婉婷</span></p><p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">生卒：1980年8月20日 — 2023年4月15日</span></p><p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">墓志铭：</span></p><p><em style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">“热爱旅行与诗歌的灵魂，</em></p><p><em style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">永远活在春天的风里。</em></p><p><em style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">‘世界是一本书，而你看完了每一页。’”</em></p><p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">丈夫王志远与女儿小安 永远怀念</span></p>\",\"zuobiao\":\"[1353,315]\"}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'zrenshu\' at row 1\r\n### The error may exist in file [T:\\01外包2025\\666合作电子墓碑公墓系统1200\\soft2\\serve\\sxs-admin\\target\\classes\\mapper\\ditu\\YbZuobiaoMapper.xml]\r\n### The error may involve com.sxs.ditu.mapper.YbZuobiaoMapper.updateYbZuobiao-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update yb_zuobiao          SET zuobiao = ?,             leibie = ?,             zrenshu = ?,             fuzeren = ?,             hzhiyuan = ?,                          status = ?,             createdtime = ?,             user_id = ?,             nick_name = ?,             kz1 = ?          where id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'zrenshu\' at row 1\n; Data truncation: Data too long for column \'zrenshu\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'zrenshu\' at row 1', '2025-04-18 16:25:55', 0);
INSERT INTO `sys_oper_log` VALUES (247, '坐标数据', 2, 'com.sxs.ditu.controller.YbZuobiaoController.edit()', 'PUT', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-04-15 05:12:50\",\"fuzeren\":\"尹航 刘成立\",\"hzhiyuan\":\"\\\"\\\\\\\"[{\\\\\\\\\\\\\\\"name\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\"1\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\"数据\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\"},{\\\\\\\\\\\\\\\"name\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\"1\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\"数据\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\"},{\\\\\\\\\\\\\\\"name\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\"1\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\"数据\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\"}]\\\\\\\"\\\"\",\"id\":41,\"kz1\":\"1\",\"leibie\":\"中山公园B口\",\"nickName\":\"\",\"params\":{},\"status\":\"显示\",\"userId\":0,\"zrenshu\":\"<p><br></p>\",\"zuobiao\":\"[1353,315]\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 16:26:05', 6);
INSERT INTO `sys_oper_log` VALUES (248, '坐标数据', 2, 'com.sxs.ditu.controller.YbZuobiaoController.edit()', 'PUT', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-04-15 05:12:50\",\"fuzeren\":\"尹航 刘成立\",\"hzhiyuan\":\"\\\"\\\\\\\"[{\\\\\\\\\\\\\\\"name\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\"1\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\"数据\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\"},{\\\\\\\\\\\\\\\"name\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\"1\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\"数据\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\"},{\\\\\\\\\\\\\\\"name\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\"1\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\"数据\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\"}]\\\\\\\"\\\"\",\"id\":41,\"kz1\":\"1\",\"leibie\":\"公墓2\",\"nickName\":\"\",\"params\":{},\"status\":\"显示\",\"userId\":0,\"zrenshu\":\"<p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">姓名：李婉婷</span></p><p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">生卒：1980年8月20日 — 2023年4月15日</span></p><p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">墓志铭：</span></p><p><em style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">“热爱旅行与诗歌的灵魂，</em></p><p><em style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">永远活在春天的风里。</em></p><p><em style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">‘世界是一本书，而你看完了每一页。’”</em></p><p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">丈夫王志远与女儿小安 永远怀念</span></p>\",\"zuobiao\":\"[1353,315]\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 16:26:46', 12);
INSERT INTO `sys_oper_log` VALUES (249, '坐标数据', 2, 'com.sxs.ditu.controller.YbZuobiaoController.edit()', 'PUT', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-04-15 05:12:50\",\"fuzeren\":\"戴皓\",\"hzhiyuan\":\"[{\\\"name\\\":\\\"1\\\",\\\"数据\\\":\\\"\\\"},{\\\"name\\\":\\\"2\\\",\\\"数据\\\":\\\"\\\"},{\\\"name\\\":\\\"3\\\",\\\"数据\\\":\\\"\\\"}]\",\"id\":42,\"kz1\":\"1\",\"leibie\":\"公墓3\",\"nickName\":\"\",\"params\":{},\"status\":\"显示\",\"userId\":0,\"zrenshu\":\"<p><strong>姓名</strong>：王建国</p><p><strong>生卒</strong>：1972年6月1日 — 2024年1月30日</p><p><strong>墓志铭</strong>：</p><p><em>“这里躺着一个程序员，</em></p><p><br></p><p><em>他最后的代码没有Bug。</em></p><p><br></p><p><em>‘404 Not Found，但爱仍在缓存区。’”</em></p><p><strong>战友与网友 共缅</strong></p>\",\"zuobiao\":\"[1628,640]\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 16:27:05', 5);
INSERT INTO `sys_oper_log` VALUES (250, '坐标数据', 2, 'com.sxs.ditu.controller.YbZuobiaoController.edit()', 'PUT', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-04-15 05:12:50\",\"fuzeren\":\"高翔（厅A） 林延涛（厅中） 慕相廷（厅B）\",\"hzhiyuan\":\"[{\\\"name\\\":\\\"厅A出站闸机\\\",\\\"数据\\\":\\\"8人\\\"},{\\\"name\\\":\\\"厅中\\\",\\\"数据\\\":\\\"12人\\\"},{\\\"name\\\":\\\"厅B\\\",\\\"数据\\\":\\\"9人\\\"}]\",\"id\":43,\"kz1\":\"1\",\"leibie\":\"中山公园站厅\",\"nickName\":\"\",\"params\":{},\"status\":\"显示\",\"userId\":0,\"zrenshu\":\"<p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">姓名：张明远</span></p><p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">生卒：1945年3月12日 — 2022年11月5日</span></p><p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">墓志铭：</span></p><p><em style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">“一生勤勉，仁厚传家。</em></p><p><em style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">如山之静，似海之深。”</em></p><p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">亲属敬立</span></p>\",\"zuobiao\":\"[1344,437]\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 16:27:35', 6);
INSERT INTO `sys_oper_log` VALUES (251, '坐标数据', 2, 'com.sxs.ditu.controller.YbZuobiaoController.edit()', 'PUT', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-04-15 05:12:50\",\"fuzeren\":\"杨子玚 张丽倩\",\"hzhiyuan\":\"[{\\\"name\\\":\\\"点位1\\\",\\\"数据\\\":\\\"\\\"},{\\\"name\\\":\\\"点位2\\\",\\\"数据\\\":\\\"\\\"},{\\\"name\\\":\\\"点位3\\\",\\\"数据\\\":\\\"\\\"}]\",\"id\":46,\"kz1\":\"2\",\"leibie\":\"中山公园A口\",\"nickName\":\"\",\"params\":{},\"status\":\"显示\",\"userId\":0,\"zrenshu\":\"<p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">姓名：李婉婷</span></p><p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">生卒：1980年8月20日 — 2023年4月15日</span></p><p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">墓志铭：</span></p><p><em style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">“热爱旅行与诗歌的灵魂，</em></p><p><em style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">永远活在春天的风里。</em></p><p><em style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">‘世界是一本书，而你看完了每一页。’”</em></p><p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">丈夫王志远与女儿小安 永远怀念</span></p>\",\"zuobiao\":\"[1080,631]\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 16:27:51', 8);
INSERT INTO `sys_oper_log` VALUES (252, '坐标数据', 2, 'com.sxs.ditu.controller.YbZuobiaoController.edit()', 'PUT', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-04-15 05:12:50\",\"fuzeren\":\"负责人1\",\"hzhiyuan\":\"[{\\\"name\\\":\\\"点位1\\\",\\\"数据\\\":\\\"\\\"},{\\\"name\\\":\\\"点位2\\\",\\\"数据\\\":\\\"\\\"},{\\\"name\\\":\\\"点位3\\\",\\\"数据\\\":\\\"\\\"}]\",\"id\":47,\"kz1\":\"2\",\"leibie\":\"汇泉广场A口\",\"nickName\":\"\",\"params\":{},\"status\":\"显示\",\"userId\":0,\"zrenshu\":\"<p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">姓名：王建国</span></p><p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">生卒：1972年6月1日 — 2024年1月30日</span></p><p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">墓志铭：</span></p><p><em style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">“这里躺着一个程序员，</em></p><p><em style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">他最后的代码没有Bug。</em></p><p><em style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">‘404 Not Found，但爱仍在缓存区。’”</em></p><p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">战友与网友 共缅</span></p>\",\"zuobiao\":\"[311,325]\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 16:28:05', 5);
INSERT INTO `sys_oper_log` VALUES (253, '坐标数据', 2, 'com.sxs.ditu.controller.YbZuobiaoController.edit()', 'PUT', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-04-15 05:12:50\",\"fuzeren\":\"负责人1\",\"hzhiyuan\":\"[{\\\"name\\\":\\\"点位1\\\",\\\"数据\\\":\\\"\\\"},{\\\"name\\\":\\\"点位2\\\",\\\"数据\\\":\\\"\\\"},{\\\"name\\\":\\\"点位3\\\",\\\"数据\\\":\\\"\\\"}]\",\"id\":48,\"kz1\":\"2\",\"leibie\":\"汇泉广场站C口\",\"nickName\":\"\",\"params\":{},\"status\":\"显示\",\"userId\":0,\"zrenshu\":\"<p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">姓名：张明远</span></p><p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">生卒：1945年3月12日 — 2022年11月5日</span></p><p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">墓志铭：</span></p><p><em style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">“一生勤勉，仁厚传家。</em></p><p><em style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">如山之静，似海之深。”</em></p><p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">亲属敬立</span></p>\",\"zuobiao\":\"[83,640]\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 16:28:21', 6);
INSERT INTO `sys_oper_log` VALUES (254, '坐标数据', 3, 'com.sxs.ditu.controller.YbZuobiaoController.remove()', 'DELETE', 1, 'admin', '研发部门', '/ditu/zuobiao/49', '127.0.0.1', '内网IP', '[49]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 16:28:25', 10);
INSERT INTO `sys_oper_log` VALUES (255, '坐标数据', 3, 'com.sxs.ditu.controller.YbZuobiaoController.remove()', 'DELETE', 1, 'admin', '研发部门', '/ditu/zuobiao/50', '127.0.0.1', '内网IP', '[50]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 16:28:27', 5);
INSERT INTO `sys_oper_log` VALUES (256, '坐标数据', 2, 'com.sxs.ditu.controller.YbZuobiaoController.edit()', 'PUT', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-04-15 05:12:50\",\"fuzeren\":\"高翔（厅A） 林延涛（厅中） 慕相廷（厅B）\",\"hzhiyuan\":\"[{\\\"name\\\":\\\"厅A出站闸机\\\",\\\"数据\\\":\\\"8人\\\"},{\\\"name\\\":\\\"厅中\\\",\\\"数据\\\":\\\"12人\\\"},{\\\"name\\\":\\\"厅B\\\",\\\"数据\\\":\\\"9人\\\"}]\",\"id\":43,\"kz1\":\"1\",\"leibie\":\"xx之墓\",\"nickName\":\"\",\"params\":{},\"status\":\"显示\",\"userId\":0,\"zrenshu\":\"<p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">姓名：张明远</span></p><p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">生卒：1945年3月12日 — 2022年11月5日</span></p><p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">墓志铭：</span></p><p><em style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">“一生勤勉，仁厚传家。</em></p><p><em style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">如山之静，似海之深。”</em></p><p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">亲属敬立</span></p>\",\"zuobiao\":\"[1344,437]\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 16:28:49', 5);
INSERT INTO `sys_oper_log` VALUES (257, '坐标数据', 2, 'com.sxs.ditu.controller.YbZuobiaoController.edit()', 'PUT', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-04-15 05:12:50\",\"fuzeren\":\"杨子玚 张丽倩\",\"hzhiyuan\":\"[{\\\"name\\\":\\\"点位1\\\",\\\"数据\\\":\\\"\\\"},{\\\"name\\\":\\\"点位2\\\",\\\"数据\\\":\\\"\\\"},{\\\"name\\\":\\\"点位3\\\",\\\"数据\\\":\\\"\\\"}]\",\"id\":46,\"kz1\":\"2\",\"leibie\":\"xx公墓\",\"nickName\":\"\",\"params\":{},\"status\":\"显示\",\"userId\":0,\"zrenshu\":\"<p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">姓名：李婉婷</span></p><p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">生卒：1980年8月20日 — 2023年4月15日</span></p><p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">墓志铭：</span></p><p><em style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">“热爱旅行与诗歌的灵魂，</em></p><p><em style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">永远活在春天的风里。</em></p><p><em style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">‘世界是一本书，而你看完了每一页。’”</em></p><p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">丈夫王志远与女儿小安 永远怀念</span></p>\",\"zuobiao\":\"[1080,631]\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 16:28:56', 7);
INSERT INTO `sys_oper_log` VALUES (258, '坐标数据', 2, 'com.sxs.ditu.controller.YbZuobiaoController.edit()', 'PUT', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-04-15 05:12:50\",\"fuzeren\":\"负责人1\",\"hzhiyuan\":\"[{\\\"name\\\":\\\"点位1\\\",\\\"数据\\\":\\\"\\\"},{\\\"name\\\":\\\"点位2\\\",\\\"数据\\\":\\\"\\\"},{\\\"name\\\":\\\"点位3\\\",\\\"数据\\\":\\\"\\\"}]\",\"id\":47,\"kz1\":\"2\",\"leibie\":\"公墓5\",\"nickName\":\"\",\"params\":{},\"status\":\"显示\",\"userId\":0,\"zrenshu\":\"<p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">姓名：王建国</span></p><p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">生卒：1972年6月1日 — 2024年1月30日</span></p><p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">墓志铭：</span></p><p><em style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">“这里躺着一个程序员，</em></p><p><em style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">他最后的代码没有Bug。</em></p><p><em style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">‘404 Not Found，但爱仍在缓存区。’”</em></p><p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">战友与网友 共缅</span></p>\",\"zuobiao\":\"[311,325]\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 16:29:02', 5);
INSERT INTO `sys_oper_log` VALUES (259, '坐标数据', 2, 'com.sxs.ditu.controller.YbZuobiaoController.edit()', 'PUT', 1, 'admin', '研发部门', '/ditu/zuobiao', '127.0.0.1', '内网IP', '{\"createdtime\":\"2025-04-15 05:12:50\",\"fuzeren\":\"负责人1\",\"hzhiyuan\":\"[{\\\"name\\\":\\\"点位1\\\",\\\"数据\\\":\\\"\\\"},{\\\"name\\\":\\\"点位2\\\",\\\"数据\\\":\\\"\\\"},{\\\"name\\\":\\\"点位3\\\",\\\"数据\\\":\\\"\\\"}]\",\"id\":48,\"kz1\":\"2\",\"leibie\":\"公墓7\",\"nickName\":\"\",\"params\":{},\"status\":\"显示\",\"userId\":0,\"zrenshu\":\"<p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">姓名：张明远</span></p><p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">生卒：1945年3月12日 — 2022年11月5日</span></p><p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">墓志铭：</span></p><p><em style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">“一生勤勉，仁厚传家。</em></p><p><em style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">如山之静，似海之深。”</em></p><p><span style=\\\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\\\">亲属敬立</span></p>\",\"zuobiao\":\"[83,640]\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 16:29:09', 4);
INSERT INTO `sys_oper_log` VALUES (260, '菜单管理', 2, 'com.sxs.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2025-02-06 23:26:45\",\"icon\":\"log\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":108,\"menuName\":\"日志管理\",\"menuType\":\"M\",\"orderNum\":988,\"params\":{},\"parentId\":0,\"path\":\"log\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 16:31:04', 9);
INSERT INTO `sys_oper_log` VALUES (261, '角色管理', 2, 'com.sxs.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-02-06 23:26:45\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2005,2006,2007,2008,2009,2010,2025,2026,2027,2028,2029,2030,108,500,1039,1040,1041,501,1042,1043,1044,1045,2004],\"params\":{},\"remark\":\"管理员\",\"roleId\":2,\"roleKey\":\"admin1\",\"roleName\":\"管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 16:31:11', 12);
INSERT INTO `sys_oper_log` VALUES (262, '角色管理', 2, 'com.sxs.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-02-06 23:26:45\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2005,2006,2007,2008,2009,2010,2025,2026,2027,2028,2029,2030,108,500,1039,1040,1041,501,1042,1043,1044,1045,2004],\"params\":{},\"remark\":\"管理员\",\"roleId\":2,\"roleKey\":\"admin1\",\"roleName\":\"管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 20:19:18', 25);
INSERT INTO `sys_oper_log` VALUES (263, '菜单管理', 3, 'com.sxs.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2024', '127.0.0.1', '内网IP', '2024', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 20:19:28', 48);
INSERT INTO `sys_oper_log` VALUES (264, '菜单管理', 3, 'com.sxs.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2018', '127.0.0.1', '内网IP', '2018', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2025-04-18 20:19:32', 1);
INSERT INTO `sys_oper_log` VALUES (265, '菜单管理', 3, 'com.sxs.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2019', '127.0.0.1', '内网IP', '2019', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 20:19:40', 10);
INSERT INTO `sys_oper_log` VALUES (266, '菜单管理', 3, 'com.sxs.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2020', '127.0.0.1', '内网IP', '2020', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 20:19:43', 11);
INSERT INTO `sys_oper_log` VALUES (267, '菜单管理', 3, 'com.sxs.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2021', '127.0.0.1', '内网IP', '2021', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 20:19:45', 9);
INSERT INTO `sys_oper_log` VALUES (268, '菜单管理', 3, 'com.sxs.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2022', '127.0.0.1', '内网IP', '2022', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 20:19:49', 8);
INSERT INTO `sys_oper_log` VALUES (269, '菜单管理', 3, 'com.sxs.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2023', '127.0.0.1', '内网IP', '2023', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 20:19:52', 5);
INSERT INTO `sys_oper_log` VALUES (270, '菜单管理', 3, 'com.sxs.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2018', '127.0.0.1', '内网IP', '2018', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 20:19:56', 8);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2025-02-06 23:26:45', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2025-02-06 23:26:45', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2025-02-06 23:26:45', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2025-02-06 23:26:45', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2025-02-06 23:26:45', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '管理员', 'admin1', 2, '2', 1, 1, '0', '0', 'admin', '2025-02-06 23:26:45', 'admin', '2025-04-18 20:19:18', '管理员');
INSERT INTO `sys_role` VALUES (100, '用户', 'user', 0, '1', 1, 1, '0', '0', 'admin', '2025-02-11 00:11:12', 'admin', '2025-04-18 16:19:48', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2004);
INSERT INTO `sys_role_menu` VALUES (2, 2005);
INSERT INTO `sys_role_menu` VALUES (2, 2006);
INSERT INTO `sys_role_menu` VALUES (2, 2007);
INSERT INTO `sys_role_menu` VALUES (2, 2008);
INSERT INTO `sys_role_menu` VALUES (2, 2009);
INSERT INTO `sys_role_menu` VALUES (2, 2010);
INSERT INTO `sys_role_menu` VALUES (2, 2025);
INSERT INTO `sys_role_menu` VALUES (2, 2026);
INSERT INTO `sys_role_menu` VALUES (2, 2027);
INSERT INTO `sys_role_menu` VALUES (2, 2028);
INSERT INTO `sys_role_menu` VALUES (2, 2029);
INSERT INTO `sys_role_menu` VALUES (2, 2030);
INSERT INTO `sys_role_menu` VALUES (100, 2004);
INSERT INTO `sys_role_menu` VALUES (100, 2005);
INSERT INTO `sys_role_menu` VALUES (100, 2006);
INSERT INTO `sys_role_menu` VALUES (100, 2007);
INSERT INTO `sys_role_menu` VALUES (100, 2008);
INSERT INTO `sys_role_menu` VALUES (100, 2009);
INSERT INTO `sys_role_menu` VALUES (100, 2010);
INSERT INTO `sys_role_menu` VALUES (100, 2025);
INSERT INTO `sys_role_menu` VALUES (100, 2026);
INSERT INTO `sys_role_menu` VALUES (100, 2027);
INSERT INTO `sys_role_menu` VALUES (100, 2028);
INSERT INTO `sys_role_menu` VALUES (100, 2029);
INSERT INTO `sys_role_menu` VALUES (100, 2030);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'register' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', 'Admin', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-04-18 20:18:59', 'admin', '2025-02-06 23:26:45', '', '2025-04-18 20:18:58', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', 'Admin', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '2', '127.0.0.1', '2025-02-06 23:26:45', 'admin', '2025-02-06 23:26:45', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (100, NULL, 'user', 'user', '00', '', '', '0', '', '$2a$10$6Bm68gCbkhrnp8Jl.9J/AuPWg4zfebpwj.SJYOdYv2uaW1Omcre2C', '0', '2', '', NULL, 'admin', '2025-02-07 18:12:56', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (101, NULL, 'user1', 'xu', '00', '', '', '0', '', '$2a$10$6i0nl1qyyUiYHtistU4wIOaAvfguT4yE4vziRFLsw8wJ9iu6YMrXS', '0', '2', '127.0.0.1', '2025-02-11 00:19:44', '', '2025-02-11 00:19:36', '', '2025-02-11 00:19:44', NULL);
INSERT INTO `sys_user` VALUES (102, NULL, 'user2', 'user2', '00', '', '', '0', '', '$2a$10$9uA2wB73kCuxrz7EDlzE1.Vx/jrYktrp/bToP9hrlyeDEh39DPOdS', '0', '2', '', NULL, 'admin', '2025-02-11 00:24:58', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (103, NULL, 'user1', 'xu', '00', '', '', '0', '', '$2a$10$YNd7mEk16PCWULWnIhO5pOaxaMJaNPDyVm19FZUoj0Vube32R.7Ea', '0', '2', '127.0.0.1', '2025-02-11 00:25:49', 'register', '2025-02-11 00:25:43', '', '2025-02-11 00:25:49', NULL);
INSERT INTO `sys_user` VALUES (104, NULL, 'admin1', 'admin1', '00', '', '', '0', '', '$2a$10$IyVXJ0vP4DYy15s9btIvPe6r3pVoxPiPAkHuu.gE1ZnyPgKBfPDiO', '0', '0', '127.0.0.1', '2025-04-18 16:31:54', 'admin', '2025-02-16 20:33:51', '', '2025-04-18 16:31:53', NULL);
INSERT INTO `sys_user` VALUES (105, NULL, 'user1', 'user1', '00', '', '', '0', '', '$2a$10$SWF83Z1u0G1iroFzhQVDpOfTp6xUOiZrQNK4ditMkjDSS7w1yMEHu', '0', '0', '127.0.0.1', '2025-02-16 20:34:19', 'register', '2025-02-16 20:34:12', '', '2025-02-16 20:34:19', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (104, 2);
INSERT INTO `sys_user_role` VALUES (105, 100);

-- ----------------------------
-- Table structure for yb_biaodan
-- ----------------------------
DROP TABLE IF EXISTS `yb_biaodan`;
CREATE TABLE `yb_biaodan`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `zuobiao` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '坐标数据',
  `leibie` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '类别',
  `zrenshu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客控总人数',
  `fuzeren` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `hzhiyuan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '汇泉广场站支援人数',
  `zzhiyuan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '中山公园站支援人数',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示状态',
  `createdtime` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `user_id` int NULL DEFAULT NULL COMMENT '添加人id',
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '添加者',
  `kz1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '扩展1',
  `kz2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '扩展2',
  `kz3` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '扩展3',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '表单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of yb_biaodan
-- ----------------------------
INSERT INTO `yb_biaodan` VALUES (2, '[1521,176]', '', '28', '孙蓬勃（中山公园站）赵鑫（汇泉广场站）', '14', '14', '显示', '2025-03-23 05:12:50', 1, 'Admin', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for yb_tupian
-- ----------------------------
DROP TABLE IF EXISTS `yb_tupian`;
CREATE TABLE `yb_tupian`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '背景图片' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of yb_tupian
-- ----------------------------
INSERT INTO `yb_tupian` VALUES (1, '/profile/upload/2025/04/18/微信图片_20250418160735_20250418160808A001.jpg');

-- ----------------------------
-- Table structure for yb_zuobiao
-- ----------------------------
DROP TABLE IF EXISTS `yb_zuobiao`;
CREATE TABLE `yb_zuobiao`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `zuobiao` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '坐标数据',
  `leibie` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '类别',
  `zrenshu` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '客控总人数',
  `fuzeren` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `hzhiyuan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '汇泉广场站支援人数',
  `zzhiyuan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '中山公园站支援人数',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示状态',
  `createdtime` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `user_id` int NULL DEFAULT NULL COMMENT '添加人id',
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '添加者',
  `kz1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '扩展1',
  `kz2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '扩展2',
  `kz3` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '扩展3',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '坐标数据' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of yb_zuobiao
-- ----------------------------
INSERT INTO `yb_zuobiao` VALUES (2, '[927,321]', '公墓位置1', '<p><strong>姓名</strong>：张明远</p><p><strong>生卒</strong>：1945年3月12日 — 2022年11月5日</p><p><strong>墓志铭</strong>：</p><p><em>“一生勤勉，仁厚传家。</em></p><p><br></p><p><em>如山之静，似海之深。”</em></p><p><strong>亲属敬立</strong></p>', '蒋金龙  韩通航', NULL, '9', '显示', '2025-04-15 05:12:50', 1, 'Admin', '1', NULL, NULL);
INSERT INTO `yb_zuobiao` VALUES (41, '[1353,315]', '公墓2', '<p><span style=\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\">姓名：李婉婷</span></p><p><span style=\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\">生卒：1980年8月20日 — 2023年4月15日</span></p><p><span style=\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\">墓志铭：</span></p><p><em style=\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\">“热爱旅行与诗歌的灵魂，</em></p><p><em style=\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\">永远活在春天的风里。</em></p><p><em style=\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\">‘世界是一本书，而你看完了每一页。’”</em></p><p><span style=\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\">丈夫王志远与女儿小安 永远怀念</span></p>', '尹航 刘成立', NULL, NULL, '显示', '2025-04-15 05:12:50', 0, '', '1', NULL, NULL);
INSERT INTO `yb_zuobiao` VALUES (42, '[1628,640]', '公墓3', '<p><strong>姓名</strong>：王建国</p><p><strong>生卒</strong>：1972年6月1日 — 2024年1月30日</p><p><strong>墓志铭</strong>：</p><p><em>“这里躺着一个程序员，</em></p><p><br></p><p><em>他最后的代码没有Bug。</em></p><p><br></p><p><em>‘404 Not Found，但爱仍在缓存区。’”</em></p><p><strong>战友与网友 共缅</strong></p>', '戴皓', NULL, NULL, '显示', '2025-04-15 05:12:50', 0, '', '1', NULL, NULL);
INSERT INTO `yb_zuobiao` VALUES (43, '[1344,437]', 'xx之墓', '<p><span style=\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\">姓名：张明远</span></p><p><span style=\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\">生卒：1945年3月12日 — 2022年11月5日</span></p><p><span style=\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\">墓志铭：</span></p><p><em style=\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\">“一生勤勉，仁厚传家。</em></p><p><em style=\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\">如山之静，似海之深。”</em></p><p><span style=\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\">亲属敬立</span></p>', '高翔（厅A） 林延涛（厅中） 慕相廷（厅B）', NULL, NULL, '显示', '2025-04-15 05:12:50', 0, '', '1', NULL, NULL);
INSERT INTO `yb_zuobiao` VALUES (46, '[1080,631]', 'xx公墓', '<p><span style=\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\">姓名：李婉婷</span></p><p><span style=\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\">生卒：1980年8月20日 — 2023年4月15日</span></p><p><span style=\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\">墓志铭：</span></p><p><em style=\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\">“热爱旅行与诗歌的灵魂，</em></p><p><em style=\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\">永远活在春天的风里。</em></p><p><em style=\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\">‘世界是一本书，而你看完了每一页。’”</em></p><p><span style=\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\">丈夫王志远与女儿小安 永远怀念</span></p>', '杨子玚 张丽倩', NULL, NULL, '显示', '2025-04-15 05:12:50', 0, '', '2', NULL, NULL);
INSERT INTO `yb_zuobiao` VALUES (47, '[311,325]', '公墓5', '<p><span style=\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\">姓名：王建国</span></p><p><span style=\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\">生卒：1972年6月1日 — 2024年1月30日</span></p><p><span style=\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\">墓志铭：</span></p><p><em style=\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\">“这里躺着一个程序员，</em></p><p><em style=\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\">他最后的代码没有Bug。</em></p><p><em style=\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\">‘404 Not Found，但爱仍在缓存区。’”</em></p><p><span style=\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\">战友与网友 共缅</span></p>', '负责人1', NULL, NULL, '显示', '2025-04-15 05:12:50', 0, '', '2', NULL, NULL);
INSERT INTO `yb_zuobiao` VALUES (48, '[83,640]', '公墓7', '<p><span style=\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\">姓名：张明远</span></p><p><span style=\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\">生卒：1945年3月12日 — 2022年11月5日</span></p><p><span style=\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\">墓志铭：</span></p><p><em style=\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\">“一生勤勉，仁厚传家。</em></p><p><em style=\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\">如山之静，似海之深。”</em></p><p><span style=\"background-color: rgb(246, 246, 246); color: rgba(0, 0, 0, 0.9);\">亲属敬立</span></p>', '负责人1', NULL, NULL, '显示', '2025-04-15 05:12:50', 0, '', '2', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
