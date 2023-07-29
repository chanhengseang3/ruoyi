/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50540
 Source Host           : 127.0.0.1:3306
 Source Schema         : image_manage

 Target Server Type    : MySQL
 Target Server Version : 50540
 File Encoding         : 65001

 Date: 05/08/2022 18:26:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'sys_country', '国家表', NULL, NULL, 'SysCountry', 'crud', 'com.ruoyi.system', 'system', 'country', '国家', 'ruoyi', '0', '/', NULL, 'admin', '2022-07-25 11:43:04', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (2, 'sys_goods', '商品表', NULL, NULL, 'SysGoods', 'crud', 'com.ruoyi.system', 'system', 'goods', '商品', 'ruoyi', '0', '/', NULL, 'admin', '2022-07-25 11:43:04', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (3, 'sys_white_ip', 'ip白名单表', NULL, NULL, 'SysWhiteIp', 'crud', 'com.ruoyi.system', 'system', 'ip', 'ip白名单', 'ruoyi', '0', '/', NULL, 'admin', '2022-07-25 11:43:04', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'country_id', NULL, 'int(11)', 'Long', 'countryId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-07-25 11:43:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (2, '1', 'country_name', NULL, 'varchar(255)', 'String', 'countryName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-07-25 11:43:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (3, '1', 'country_letter', NULL, 'varchar(255)', 'String', 'countryLetter', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-07-25 11:43:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (4, '1', 'country_type', '名单类型（0-白名单 1-黑名单）', 'int(1)', 'Integer', 'countryType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2022-07-25 11:43:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (5, '2', 'goods_id', '商品ID', 'int(11)', 'Long', 'goodsId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-07-25 11:43:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (6, '2', 'goods_name', '商品名称', 'varchar(255)', 'String', 'goodsName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-07-25 11:43:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (7, '2', 'white_img', '白名单商品图片', 'text', 'String', 'whiteImg', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 'admin', '2022-07-25 11:43:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (8, '2', 'black_img', '黑名单商品图片', 'text', 'String', 'blackImg', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 4, 'admin', '2022-07-25 11:43:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (9, '2', 'create_by', '创建人', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2022-07-25 11:43:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (10, '2', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2022-07-25 11:43:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (11, '2', 'update_by', '修改人', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2022-07-25 11:43:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (12, '2', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2022-07-25 11:43:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (13, '2', 'del_flag', '是否删除（0否1是）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2022-07-25 11:43:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (14, '3', 'white_ip_id', 'ID', 'int(11)', 'Long', 'whiteIpId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-07-25 11:43:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (15, '3', 'white_ip_add', '白名单ip地址', 'varchar(50)', 'String', 'whiteIpAdd', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-07-25 11:43:04', '', NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-07-21 11:44:59', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-07-21 11:44:59', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-07-21 11:44:59', '', NULL, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-07-21 11:44:59', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2022-07-21 11:44:59', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES (6, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '0', 'Y', 'admin', '2022-07-21 11:44:59', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (7, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2022-07-21 11:44:59', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2022-07-21 11:44:59', '', NULL, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES (9, '主框架页-是否开启页脚', 'sys.index.footer', 'true', 'Y', 'admin', '2022-07-21 11:44:59', '', NULL, '是否开启底部页脚显示（true显示，false隐藏）');
INSERT INTO `sys_config` VALUES (10, '主框架页-是否开启页签', 'sys.index.tagsView', 'true', 'Y', 'admin', '2022-07-21 11:44:59', '', NULL, '是否开启菜单多页签显示（true显示，false隐藏）');

-- ----------------------------
-- Table structure for sys_country
-- ----------------------------
DROP TABLE IF EXISTS `sys_country`;
CREATE TABLE `sys_country`  (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `country_letter` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `country_type` int(1) NOT NULL DEFAULT 0 COMMENT '名单类型（0-白名单 1-黑名单）',
  PRIMARY KEY (`country_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 197 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '国家表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_country
-- ----------------------------
INSERT INTO `sys_country` VALUES (1, '中国', NULL, 1);
INSERT INTO `sys_country` VALUES (2, '蒙古', NULL, 0);
INSERT INTO `sys_country` VALUES (3, '朝鲜', NULL, 0);
INSERT INTO `sys_country` VALUES (4, '韩国', NULL, 0);
INSERT INTO `sys_country` VALUES (5, '日本', NULL, 0);
INSERT INTO `sys_country` VALUES (6, '菲律宾', NULL, 0);
INSERT INTO `sys_country` VALUES (7, '越南', NULL, 0);
INSERT INTO `sys_country` VALUES (8, '老挝', NULL, 0);
INSERT INTO `sys_country` VALUES (9, '柬埔寨', NULL, 0);
INSERT INTO `sys_country` VALUES (10, '缅甸', NULL, 0);
INSERT INTO `sys_country` VALUES (11, '泰国', NULL, 0);
INSERT INTO `sys_country` VALUES (12, '马来西亚', NULL, 0);
INSERT INTO `sys_country` VALUES (13, '文莱', NULL, 0);
INSERT INTO `sys_country` VALUES (14, '新加坡', NULL, 0);
INSERT INTO `sys_country` VALUES (15, '印度尼西亚', NULL, 0);
INSERT INTO `sys_country` VALUES (16, '东帝汶', NULL, 0);
INSERT INTO `sys_country` VALUES (17, '尼泊尔', NULL, 0);
INSERT INTO `sys_country` VALUES (18, '不丹', NULL, 0);
INSERT INTO `sys_country` VALUES (19, '孟加拉国', NULL, 0);
INSERT INTO `sys_country` VALUES (20, '印度', NULL, 0);
INSERT INTO `sys_country` VALUES (21, '巴基斯坦', NULL, 0);
INSERT INTO `sys_country` VALUES (22, '斯里兰卡', NULL, 0);
INSERT INTO `sys_country` VALUES (23, '马尔代夫', NULL, 0);
INSERT INTO `sys_country` VALUES (24, '哈萨克斯坦', NULL, 0);
INSERT INTO `sys_country` VALUES (25, '吉尔吉斯斯坦', NULL, 0);
INSERT INTO `sys_country` VALUES (26, '塔吉克斯坦', NULL, 0);
INSERT INTO `sys_country` VALUES (27, '乌兹别克斯坦', NULL, 0);
INSERT INTO `sys_country` VALUES (28, '土库曼斯坦', NULL, 0);
INSERT INTO `sys_country` VALUES (29, '阿富汗', NULL, 0);
INSERT INTO `sys_country` VALUES (30, '伊拉克', NULL, 0);
INSERT INTO `sys_country` VALUES (31, '伊朗', NULL, 0);
INSERT INTO `sys_country` VALUES (32, '叙利亚', NULL, 0);
INSERT INTO `sys_country` VALUES (33, '约旦', NULL, 0);
INSERT INTO `sys_country` VALUES (34, '黎巴嫩', NULL, 0);
INSERT INTO `sys_country` VALUES (35, '以色列', NULL, 0);
INSERT INTO `sys_country` VALUES (36, '巴勒斯坦', NULL, 0);
INSERT INTO `sys_country` VALUES (37, '沙特阿拉伯', NULL, 0);
INSERT INTO `sys_country` VALUES (38, '巴林', NULL, 0);
INSERT INTO `sys_country` VALUES (39, '卡塔尔', NULL, 0);
INSERT INTO `sys_country` VALUES (40, '科威特', NULL, 0);
INSERT INTO `sys_country` VALUES (41, '阿拉伯联合酋长国', NULL, 0);
INSERT INTO `sys_country` VALUES (42, '阿曼', NULL, 0);
INSERT INTO `sys_country` VALUES (43, '也门', NULL, 0);
INSERT INTO `sys_country` VALUES (44, '格鲁吉亚', NULL, 0);
INSERT INTO `sys_country` VALUES (45, '亚美尼亚', NULL, 0);
INSERT INTO `sys_country` VALUES (46, '阿塞拜疆', NULL, 0);
INSERT INTO `sys_country` VALUES (47, '土耳其', NULL, 0);
INSERT INTO `sys_country` VALUES (48, '塞浦路斯', NULL, 0);
INSERT INTO `sys_country` VALUES (49, '芬兰', NULL, 0);
INSERT INTO `sys_country` VALUES (50, '瑞典', NULL, 0);
INSERT INTO `sys_country` VALUES (51, '挪威', NULL, 0);
INSERT INTO `sys_country` VALUES (52, '冰岛', NULL, 0);
INSERT INTO `sys_country` VALUES (53, '丹麦', NULL, 0);
INSERT INTO `sys_country` VALUES (54, '爱沙尼亚', NULL, 0);
INSERT INTO `sys_country` VALUES (55, '拉脱维亚', NULL, 0);
INSERT INTO `sys_country` VALUES (56, '立陶宛', NULL, 0);
INSERT INTO `sys_country` VALUES (57, '摩尔多瓦', NULL, 0);
INSERT INTO `sys_country` VALUES (58, '白俄罗斯', NULL, 0);
INSERT INTO `sys_country` VALUES (59, '俄罗斯', NULL, 0);
INSERT INTO `sys_country` VALUES (60, '乌克兰', NULL, 0);
INSERT INTO `sys_country` VALUES (61, '波兰', NULL, 0);
INSERT INTO `sys_country` VALUES (62, '捷克', NULL, 0);
INSERT INTO `sys_country` VALUES (63, '斯洛伐克', NULL, 0);
INSERT INTO `sys_country` VALUES (64, '匈牙利', NULL, 0);
INSERT INTO `sys_country` VALUES (65, '德国', NULL, 0);
INSERT INTO `sys_country` VALUES (66, '奥地利', NULL, 0);
INSERT INTO `sys_country` VALUES (67, '瑞士', NULL, 0);
INSERT INTO `sys_country` VALUES (68, '列支敦士登', NULL, 0);
INSERT INTO `sys_country` VALUES (69, '英国', NULL, 0);
INSERT INTO `sys_country` VALUES (70, '爱尔兰', NULL, 0);
INSERT INTO `sys_country` VALUES (71, '荷兰', NULL, 0);
INSERT INTO `sys_country` VALUES (72, '比利时', NULL, 0);
INSERT INTO `sys_country` VALUES (73, '卢森堡', NULL, 0);
INSERT INTO `sys_country` VALUES (74, '法国', NULL, 0);
INSERT INTO `sys_country` VALUES (75, '摩纳哥', NULL, 0);
INSERT INTO `sys_country` VALUES (76, '罗马尼亚', NULL, 0);
INSERT INTO `sys_country` VALUES (77, '保加利亚', NULL, 0);
INSERT INTO `sys_country` VALUES (78, '塞尔维亚', NULL, 0);
INSERT INTO `sys_country` VALUES (79, '北马其顿', NULL, 0);
INSERT INTO `sys_country` VALUES (80, '斯洛文尼亚', NULL, 0);
INSERT INTO `sys_country` VALUES (81, '克罗地亚', NULL, 0);
INSERT INTO `sys_country` VALUES (82, '黑山', NULL, 0);
INSERT INTO `sys_country` VALUES (83, '波斯尼亚和黑塞哥维那', NULL, 0);
INSERT INTO `sys_country` VALUES (84, '希腊', NULL, 0);
INSERT INTO `sys_country` VALUES (85, '意大利', NULL, 0);
INSERT INTO `sys_country` VALUES (86, '马耳他', NULL, 0);
INSERT INTO `sys_country` VALUES (87, '梵蒂冈', NULL, 0);
INSERT INTO `sys_country` VALUES (88, '圣马力诺', NULL, 0);
INSERT INTO `sys_country` VALUES (89, '西班牙', NULL, 0);
INSERT INTO `sys_country` VALUES (90, '葡萄牙', NULL, 0);
INSERT INTO `sys_country` VALUES (91, '安道尔', NULL, 0);
INSERT INTO `sys_country` VALUES (92, '埃及', NULL, 0);
INSERT INTO `sys_country` VALUES (93, '利比亚', NULL, 0);
INSERT INTO `sys_country` VALUES (94, '突尼斯', NULL, 0);
INSERT INTO `sys_country` VALUES (95, '阿尔及利亚', NULL, 0);
INSERT INTO `sys_country` VALUES (96, '摩洛哥', NULL, 0);
INSERT INTO `sys_country` VALUES (97, '苏丹', NULL, 0);
INSERT INTO `sys_country` VALUES (98, '南苏丹', NULL, 0);
INSERT INTO `sys_country` VALUES (99, '埃塞俄比亚', NULL, 0);
INSERT INTO `sys_country` VALUES (100, '厄立特里亚', NULL, 0);
INSERT INTO `sys_country` VALUES (101, '索马里', NULL, 0);
INSERT INTO `sys_country` VALUES (102, '吉布提', NULL, 0);
INSERT INTO `sys_country` VALUES (103, '肯尼亚', NULL, 0);
INSERT INTO `sys_country` VALUES (104, '坦桑尼亚', NULL, 0);
INSERT INTO `sys_country` VALUES (105, '乌干达', NULL, 0);
INSERT INTO `sys_country` VALUES (106, '卢旺达', NULL, 0);
INSERT INTO `sys_country` VALUES (107, '布隆迪', NULL, 0);
INSERT INTO `sys_country` VALUES (108, '塞舌尔', NULL, 0);
INSERT INTO `sys_country` VALUES (109, '乍得', NULL, 0);
INSERT INTO `sys_country` VALUES (110, '中非', NULL, 0);
INSERT INTO `sys_country` VALUES (111, '喀麦隆', NULL, 0);
INSERT INTO `sys_country` VALUES (112, '赤道几内亚', NULL, 0);
INSERT INTO `sys_country` VALUES (113, '加蓬', NULL, 0);
INSERT INTO `sys_country` VALUES (114, '刚果共和国', NULL, 0);
INSERT INTO `sys_country` VALUES (115, '刚果民主共和国', NULL, 0);
INSERT INTO `sys_country` VALUES (116, '圣多美和普林西比', NULL, 0);
INSERT INTO `sys_country` VALUES (117, '毛里塔尼亚', NULL, 0);
INSERT INTO `sys_country` VALUES (118, '塞内加尔', NULL, 0);
INSERT INTO `sys_country` VALUES (119, '冈比亚', NULL, 0);
INSERT INTO `sys_country` VALUES (120, '马里', NULL, 0);
INSERT INTO `sys_country` VALUES (121, '布基纳法索', NULL, 0);
INSERT INTO `sys_country` VALUES (122, '几内亚', NULL, 0);
INSERT INTO `sys_country` VALUES (123, '几内亚比绍', NULL, 0);
INSERT INTO `sys_country` VALUES (124, '佛得角', NULL, 0);
INSERT INTO `sys_country` VALUES (125, '塞拉利昂', NULL, 0);
INSERT INTO `sys_country` VALUES (126, '利比里亚', NULL, 0);
INSERT INTO `sys_country` VALUES (127, '科特迪瓦', NULL, 0);
INSERT INTO `sys_country` VALUES (128, '加纳', NULL, 0);
INSERT INTO `sys_country` VALUES (129, '多哥', NULL, 0);
INSERT INTO `sys_country` VALUES (130, '贝宁', NULL, 0);
INSERT INTO `sys_country` VALUES (131, '尼日尔', NULL, 0);
INSERT INTO `sys_country` VALUES (132, '尼日利亚', NULL, 0);
INSERT INTO `sys_country` VALUES (133, '赞比亚', NULL, 0);
INSERT INTO `sys_country` VALUES (134, '安哥拉', NULL, 0);
INSERT INTO `sys_country` VALUES (135, '津巴布韦', NULL, 0);
INSERT INTO `sys_country` VALUES (136, '马拉维', NULL, 0);
INSERT INTO `sys_country` VALUES (137, '莫桑比克', NULL, 0);
INSERT INTO `sys_country` VALUES (138, '博茨瓦纳', NULL, 0);
INSERT INTO `sys_country` VALUES (139, '纳米比亚', NULL, 0);
INSERT INTO `sys_country` VALUES (140, '南非', NULL, 0);
INSERT INTO `sys_country` VALUES (141, '斯威士兰', NULL, 0);
INSERT INTO `sys_country` VALUES (142, '莱索托', NULL, 0);
INSERT INTO `sys_country` VALUES (143, '马达加斯加', NULL, 0);
INSERT INTO `sys_country` VALUES (144, '科摩罗', NULL, 0);
INSERT INTO `sys_country` VALUES (145, '毛里求斯', NULL, 0);
INSERT INTO `sys_country` VALUES (146, '加拿大', NULL, 0);
INSERT INTO `sys_country` VALUES (147, '美国', NULL, 0);
INSERT INTO `sys_country` VALUES (148, '墨西哥', NULL, 0);
INSERT INTO `sys_country` VALUES (149, '危地马拉', NULL, 0);
INSERT INTO `sys_country` VALUES (150, '伯利兹', NULL, 0);
INSERT INTO `sys_country` VALUES (151, '萨尔瓦多', NULL, 0);
INSERT INTO `sys_country` VALUES (152, '洪都拉斯', NULL, 0);
INSERT INTO `sys_country` VALUES (153, '尼加拉瓜', NULL, 0);
INSERT INTO `sys_country` VALUES (154, '哥斯达黎加', NULL, 0);
INSERT INTO `sys_country` VALUES (155, '巴拿马', NULL, 0);
INSERT INTO `sys_country` VALUES (156, '巴哈马', NULL, 0);
INSERT INTO `sys_country` VALUES (157, '古巴', NULL, 0);
INSERT INTO `sys_country` VALUES (158, '牙买加', NULL, 0);
INSERT INTO `sys_country` VALUES (159, '海地', NULL, 0);
INSERT INTO `sys_country` VALUES (160, '多米尼加', NULL, 0);
INSERT INTO `sys_country` VALUES (161, '安提瓜和巴布达', NULL, 0);
INSERT INTO `sys_country` VALUES (162, '圣基茨和尼维斯', NULL, 0);
INSERT INTO `sys_country` VALUES (163, '多米尼克', NULL, 0);
INSERT INTO `sys_country` VALUES (164, '圣卢西亚', NULL, 0);
INSERT INTO `sys_country` VALUES (165, '圣文森特和格林纳丁斯', NULL, 0);
INSERT INTO `sys_country` VALUES (166, '格林纳达', NULL, 0);
INSERT INTO `sys_country` VALUES (167, '巴巴多斯', NULL, 0);
INSERT INTO `sys_country` VALUES (168, '特立尼达和多巴哥', NULL, 0);
INSERT INTO `sys_country` VALUES (169, '哥伦比亚', NULL, 0);
INSERT INTO `sys_country` VALUES (170, '委内瑞拉', NULL, 0);
INSERT INTO `sys_country` VALUES (171, '圭亚那', NULL, 0);
INSERT INTO `sys_country` VALUES (172, '苏里南', NULL, 0);
INSERT INTO `sys_country` VALUES (173, '厄瓜多尔', NULL, 0);
INSERT INTO `sys_country` VALUES (174, '秘鲁', NULL, 0);
INSERT INTO `sys_country` VALUES (175, '玻利维亚', NULL, 0);
INSERT INTO `sys_country` VALUES (176, '巴西', NULL, 0);
INSERT INTO `sys_country` VALUES (177, '智利', NULL, 0);
INSERT INTO `sys_country` VALUES (178, '阿根廷', NULL, 0);
INSERT INTO `sys_country` VALUES (179, '乌拉圭', NULL, 0);
INSERT INTO `sys_country` VALUES (180, '巴拉圭', NULL, 0);
INSERT INTO `sys_country` VALUES (181, '澳大利亚', NULL, 0);
INSERT INTO `sys_country` VALUES (182, '新西兰', NULL, 0);
INSERT INTO `sys_country` VALUES (183, '帕劳', NULL, 0);
INSERT INTO `sys_country` VALUES (184, '密克罗尼西亚联邦', NULL, 0);
INSERT INTO `sys_country` VALUES (185, '马绍尔群岛', NULL, 0);
INSERT INTO `sys_country` VALUES (186, '基里巴斯', NULL, 0);
INSERT INTO `sys_country` VALUES (187, '瑙鲁', NULL, 0);
INSERT INTO `sys_country` VALUES (188, '巴布亚新几内亚', NULL, 0);
INSERT INTO `sys_country` VALUES (189, '所罗门群岛', NULL, 0);
INSERT INTO `sys_country` VALUES (190, '瓦努阿图', NULL, 0);
INSERT INTO `sys_country` VALUES (191, '斐济', NULL, 0);
INSERT INTO `sys_country` VALUES (192, '图瓦卢', NULL, 0);
INSERT INTO `sys_country` VALUES (193, '萨摩亚', NULL, 0);
INSERT INTO `sys_country` VALUES (194, '汤加', NULL, 0);
INSERT INTO `sys_country` VALUES (195, '库克群岛', NULL, 0);
INSERT INTO `sys_country` VALUES (196, '纽埃', NULL, 0);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-07-21 11:44:59', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-07-21 11:44:59', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-07-21 11:44:59', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-07-21 11:44:59', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-07-21 11:44:59', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-07-21 11:44:59', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-07-21 11:44:59', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-07-21 11:44:59', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-07-21 11:44:59', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-07-21 11:44:59', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_goods
-- ----------------------------
DROP TABLE IF EXISTS `sys_goods`;
CREATE TABLE `sys_goods`  (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `white_img` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '白名单商品图片',
  `black_img` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '黑名单商品图片',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否删除（0否1是）',
  PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_goods
-- ----------------------------
INSERT INTO `sys_goods` VALUES (1, '商品211', NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_goods` VALUES (12, '蓝牙耳机', NULL, NULL, NULL, '2022-08-04 16:50:12', NULL, NULL, '0');
INSERT INTO `sys_goods` VALUES (13, '蓝牙耳机', NULL, NULL, NULL, '2022-08-04 16:51:44', NULL, NULL, '0');
INSERT INTO `sys_goods` VALUES (14, '蓝牙耳机', '[object File],[object File]', '[object File]', NULL, '2022-08-04 16:58:03', NULL, NULL, '0');
INSERT INTO `sys_goods` VALUES (15, '蓝牙耳机111', 'http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100552_20220805154215A001.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100558_20220805154215A002.jpg', 'http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100558_20220805154215A003.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100601_20220805154215A004.jpg', NULL, '2022-08-05 10:32:37', NULL, '2022-08-05 15:42:15', '0');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-07-21 11:44:59', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 271 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '1', '验证码错误', '2022-07-21 11:48:25');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-21 11:48:29');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '退出成功', '2022-07-21 14:31:07');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-21 14:32:52');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '退出成功', '2022-07-21 14:34:19');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-21 16:02:54');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-21 16:04:55');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '1', '验证码错误', '2022-07-25 10:43:12');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 10:43:16');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '退出成功', '2022-07-25 14:12:42');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 14:12:45');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 14:16:44');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '退出成功', '2022-07-25 14:31:37');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 14:31:39');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 14:40:16');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 15:10:15');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 15:12:45');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 15:21:11');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 15:24:26');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 15:26:07');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 15:27:32');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 15:28:20');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 15:32:34');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 15:33:38');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 15:48:12');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 15:49:37');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 16:05:54');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 16:10:36');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 16:20:27');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 16:25:07');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 16:29:37');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 16:32:27');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 16:37:32');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 16:41:40');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 16:42:36');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 16:43:26');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 16:47:16');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 16:48:33');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 16:54:58');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 16:56:57');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 17:01:15');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 17:07:43');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 17:09:04');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 18:28:38');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 18:32:27');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 18:34:20');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 18:59:11');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 19:05:21');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 19:07:13');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 19:19:12');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 19:22:00');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 19:23:23');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 19:27:09');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-07-25 19:29:58');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 11:06:38');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 11:42:24');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 13:40:40');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 13:43:14');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 13:47:35');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 13:51:25');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 13:58:55');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '1', '验证码错误', '2022-08-04 14:01:14');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '1', '验证码错误', '2022-08-04 14:01:17');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 14:01:20');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 14:15:42');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 14:17:48');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 14:25:15');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 14:26:17');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 14:40:14');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '1', '验证码错误', '2022-08-04 14:41:54');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 14:41:58');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 14:43:41');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 14:48:38');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 14:51:17');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 14:54:47');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 14:57:17');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 15:07:18');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 15:12:58');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 15:22:13');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 15:27:36');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '1', '验证码错误', '2022-08-04 15:30:36');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 15:30:38');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 15:32:55');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 15:39:24');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 15:43:38');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 15:47:58');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 15:49:59');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 16:11:24');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 16:14:43');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 16:16:18');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 16:18:13');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 16:19:15');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 16:20:23');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 16:22:00');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 16:26:16');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 16:28:07');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 16:30:12');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 16:32:46');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 16:41:50');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 16:43:39');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 16:46:24');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 16:49:15');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 16:57:28');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 17:30:27');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 17:40:30');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 17:44:49');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 17:48:26');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 17:50:59');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 18:01:03');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 18:10:43');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 18:15:28');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 18:17:15');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 18:18:53');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 18:29:21');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 18:40:01');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 18:45:01');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-04 18:49:32');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 10:01:02');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 10:02:31');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 10:24:34');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 10:29:00');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 10:31:57');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 10:54:11');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 10:55:25');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 10:57:17');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 11:02:31');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '1', '验证码错误', '2022-08-05 11:04:23');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '1', '验证码错误', '2022-08-05 11:04:25');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 11:04:27');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 11:07:04');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 11:08:27');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 11:15:31');
INSERT INTO `sys_logininfor` VALUES (232, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '1', '验证码错误', '2022-08-05 11:28:38');
INSERT INTO `sys_logininfor` VALUES (233, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 11:28:40');
INSERT INTO `sys_logininfor` VALUES (234, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 11:30:47');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '1', '验证码错误', '2022-08-05 11:33:16');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 11:33:19');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 11:38:10');
INSERT INTO `sys_logininfor` VALUES (238, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 11:42:31');
INSERT INTO `sys_logininfor` VALUES (239, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 11:43:44');
INSERT INTO `sys_logininfor` VALUES (240, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 11:47:13');
INSERT INTO `sys_logininfor` VALUES (241, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 13:41:07');
INSERT INTO `sys_logininfor` VALUES (242, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 13:43:31');
INSERT INTO `sys_logininfor` VALUES (243, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 13:46:03');
INSERT INTO `sys_logininfor` VALUES (244, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 13:48:40');
INSERT INTO `sys_logininfor` VALUES (245, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 13:50:15');
INSERT INTO `sys_logininfor` VALUES (246, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 13:52:56');
INSERT INTO `sys_logininfor` VALUES (247, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 13:56:43');
INSERT INTO `sys_logininfor` VALUES (248, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 14:12:33');
INSERT INTO `sys_logininfor` VALUES (249, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 14:41:40');
INSERT INTO `sys_logininfor` VALUES (250, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 14:47:12');
INSERT INTO `sys_logininfor` VALUES (251, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 14:49:40');
INSERT INTO `sys_logininfor` VALUES (252, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 15:04:16');
INSERT INTO `sys_logininfor` VALUES (253, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 15:06:04');
INSERT INTO `sys_logininfor` VALUES (254, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 15:07:12');
INSERT INTO `sys_logininfor` VALUES (255, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 15:19:24');
INSERT INTO `sys_logininfor` VALUES (256, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 15:22:16');
INSERT INTO `sys_logininfor` VALUES (257, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 15:30:15');
INSERT INTO `sys_logininfor` VALUES (258, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 15:41:32');
INSERT INTO `sys_logininfor` VALUES (259, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 15:44:10');
INSERT INTO `sys_logininfor` VALUES (260, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 15:46:47');
INSERT INTO `sys_logininfor` VALUES (261, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 17:57:46');
INSERT INTO `sys_logininfor` VALUES (262, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 17:59:12');
INSERT INTO `sys_logininfor` VALUES (263, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 18:03:42');
INSERT INTO `sys_logininfor` VALUES (264, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 18:06:05');
INSERT INTO `sys_logininfor` VALUES (265, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 18:09:11');
INSERT INTO `sys_logininfor` VALUES (266, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 18:11:50');
INSERT INTO `sys_logininfor` VALUES (267, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 18:13:43');
INSERT INTO `sys_logininfor` VALUES (268, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 18:20:12');
INSERT INTO `sys_logininfor` VALUES (269, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '1', '验证码错误', '2022-08-05 18:25:07');
INSERT INTO `sys_logininfor` VALUES (270, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2022-08-05 18:25:10');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2008 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', '', 'M', '1', '1', '', 'fa fa-gear', 'admin', '2022-07-21 11:44:59', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, '#', '', 'M', '1', '1', '', 'fa fa-video-camera', 'admin', '2022-07-21 11:44:59', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, '#', '', 'M', '0', '1', '', 'fa fa-bars', 'admin', '2022-07-21 11:44:59', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', 'menuBlank', 'C', '1', '1', '', 'fa fa-location-arrow', 'admin', '2022-07-21 11:44:59', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', 'admin', '2022-07-21 11:44:59', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '1', '1', 'system:role:view', 'fa fa-user-secret', 'admin', '2022-07-21 11:44:59', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '1', '1', 'system:menu:view', 'fa fa-th-list', 'admin', '2022-07-21 11:44:59', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', '', 'C', '1', '1', 'system:dept:view', 'fa fa-outdent', 'admin', '2022-07-21 11:44:59', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', '', 'C', '1', '1', 'system:post:view', 'fa fa-address-card-o', 'admin', '2022-07-21 11:44:59', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', '', 'C', '1', '1', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2022-07-21 11:44:59', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', '', 'C', '1', '1', 'system:config:view', 'fa fa-sun-o', 'admin', '2022-07-21 11:44:59', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', '', 'C', '1', '1', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2022-07-21 11:44:59', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', '', 'M', '0', '1', '', 'fa fa-pencil-square-o', 'admin', '2022-07-21 11:44:59', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', '1', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2022-07-21 11:44:59', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', '1', 'monitor:job:view', 'fa fa-tasks', 'admin', '2022-07-21 11:44:59', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', '1', 'monitor:data:view', 'fa fa-bug', 'admin', '2022-07-21 11:44:59', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, '/monitor/server', '', 'C', '0', '1', 'monitor:server:view', 'fa fa-server', 'admin', '2022-07-21 11:44:59', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, '/monitor/cache', '', 'C', '0', '1', 'monitor:cache:view', 'fa fa-cube', 'admin', '2022-07-21 11:44:59', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, '/tool/build', '', 'C', '1', '1', 'tool:build:view', 'fa fa-wpforms', 'admin', '2022-07-21 11:44:59', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, '/tool/gen', '', 'C', '1', '1', 'tool:gen:view', 'fa fa-code', 'admin', '2022-07-21 11:44:59', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', '1', 'tool:swagger:view', 'fa fa-gg', 'admin', '2022-07-21 11:44:59', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', '1', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2022-07-21 11:44:59', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2022-07-21 11:44:59', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', '1', 'system:user:list', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', '1', 'system:user:add', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', '1', 'system:user:edit', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', '1', 'system:user:remove', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', '1', 'system:user:export', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', '1', 'system:user:import', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', '1', 'system:role:list', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', '1', 'system:role:add', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', '1', 'system:role:edit', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', '1', 'system:role:remove', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', '1', 'system:role:export', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', '1', 'system:menu:list', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', '1', 'system:menu:add', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', '1', 'system:menu:edit', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', '1', 'system:menu:remove', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', '1', 'system:dept:list', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', '1', 'system:dept:add', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', '1', 'system:dept:edit', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', '1', 'system:dept:remove', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', '1', 'system:post:list', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', '1', 'system:post:add', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', '1', 'system:post:edit', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', '1', 'system:post:remove', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', '1', 'system:post:export', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', '1', 'system:dict:list', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', '1', 'system:dict:add', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', '1', 'system:dict:edit', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', '1', 'system:dict:remove', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', '1', 'system:dict:export', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', '1', 'system:config:list', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', '1', 'system:config:add', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', '1', 'system:config:edit', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', '1', 'system:config:remove', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', '1', 'system:config:export', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', 'F', '0', '1', 'system:notice:list', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', '1', 'system:notice:add', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', '1', 'system:notice:edit', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', '1', 'system:notice:remove', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', '1', 'monitor:operlog:list', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', '1', 'monitor:operlog:remove', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', '1', 'monitor:operlog:detail', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', '1', 'monitor:operlog:export', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', '1', 'monitor:logininfor:list', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', '1', 'monitor:logininfor:remove', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', '1', 'monitor:logininfor:export', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '账户解锁', 501, 4, '#', '', 'F', '0', '1', 'monitor:logininfor:unlock', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '在线查询', 109, 1, '#', '', 'F', '0', '1', 'monitor:online:list', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '批量强退', 109, 2, '#', '', 'F', '0', '1', 'monitor:online:batchForceLogout', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '单条强退', 109, 3, '#', '', 'F', '0', '1', 'monitor:online:forceLogout', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务查询', 110, 1, '#', '', 'F', '0', '1', 'monitor:job:list', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务新增', 110, 2, '#', '', 'F', '0', '1', 'monitor:job:add', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务修改', 110, 3, '#', '', 'F', '0', '1', 'monitor:job:edit', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '任务删除', 110, 4, '#', '', 'F', '0', '1', 'monitor:job:remove', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '状态修改', 110, 5, '#', '', 'F', '0', '1', 'monitor:job:changeStatus', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '任务详细', 110, 6, '#', '', 'F', '0', '1', 'monitor:job:detail', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '任务导出', 110, 7, '#', '', 'F', '0', '1', 'monitor:job:export', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成查询', 115, 1, '#', '', 'F', '0', '1', 'tool:gen:list', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '生成修改', 115, 2, '#', '', 'F', '0', '1', 'tool:gen:edit', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '生成删除', 115, 3, '#', '', 'F', '0', '1', 'tool:gen:remove', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '预览代码', 115, 4, '#', '', 'F', '0', '1', 'tool:gen:preview', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '生成代码', 115, 5, '#', '', 'F', '0', '1', 'tool:gen:code', '#', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '商品管理', 0, 7, '#', '', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2022-07-21 11:44:59', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2002, '名单管理', 0, 9, '#', '', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2022-07-21 11:44:59', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2004, '商品列表', 2000, 1, '/system/goods', '', 'C', '0', '1', 'system:goods:goods', 'fa fa-user-o', 'admin', '2022-07-21 11:44:59', '', NULL, '商品管理菜单');
INSERT INTO `sys_menu` VALUES (2006, '名单设置', 2002, 1, '/system/country', '', 'C', '0', '1', 'system:country:country', 'fa fa-user-o', 'admin', '2022-07-21 11:44:59', '', NULL, '商品管理菜单');
INSERT INTO `sys_menu` VALUES (2007, 'IP地址白名单', 2002, 1, '/system/ip', '', 'C', '0', '1', 'system:ip:ip', 'fa fa-user-o', 'admin', '2022-07-21 11:44:59', '', NULL, '商品管理菜单');

-- ----------------------------
-- Table structure for sys_nation
-- ----------------------------
DROP TABLE IF EXISTS `sys_nation`;
CREATE TABLE `sys_nation`  (
  `nation_id` int(11) NOT NULL AUTO_INCREMENT,
  `nation_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nation_letter` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`nation_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 149 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '国家地区表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_nation
-- ----------------------------
INSERT INTO `sys_nation` VALUES (1, '阿尔巴尼亚', 'A');
INSERT INTO `sys_nation` VALUES (2, '阿尔及利亚', 'A');
INSERT INTO `sys_nation` VALUES (3, '阿富汗', 'A');
INSERT INTO `sys_nation` VALUES (4, '阿根廷', 'A');
INSERT INTO `sys_nation` VALUES (5, '阿拉伯联合酋长国', 'A');
INSERT INTO `sys_nation` VALUES (6, '阿鲁巴', 'A');
INSERT INTO `sys_nation` VALUES (7, '阿曼', 'A');
INSERT INTO `sys_nation` VALUES (8, '阿塞拜疆', 'A');
INSERT INTO `sys_nation` VALUES (9, '埃塞俄比亚', 'A');
INSERT INTO `sys_nation` VALUES (10, '爱尔兰', 'A');
INSERT INTO `sys_nation` VALUES (11, '爱沙尼亚', NULL);
INSERT INTO `sys_nation` VALUES (12, '安道尔', NULL);
INSERT INTO `sys_nation` VALUES (13, '安哥拉', NULL);
INSERT INTO `sys_nation` VALUES (14, '安圭拉', NULL);
INSERT INTO `sys_nation` VALUES (15, '安提瓜岛和巴布达', NULL);
INSERT INTO `sys_nation` VALUES (16, '奥地利', NULL);
INSERT INTO `sys_nation` VALUES (17, '奧兰群岛', NULL);
INSERT INTO `sys_nation` VALUES (18, '澳大利亚', NULL);
INSERT INTO `sys_nation` VALUES (19, '巴巴多斯岛', NULL);
INSERT INTO `sys_nation` VALUES (20, '巴布亚新几内亚', NULL);
INSERT INTO `sys_nation` VALUES (21, '巴哈马', NULL);
INSERT INTO `sys_nation` VALUES (22, '巴基斯坦', NULL);
INSERT INTO `sys_nation` VALUES (23, '巴拉主', NULL);
INSERT INTO `sys_nation` VALUES (24, '巴勒斯坦领土', NULL);
INSERT INTO `sys_nation` VALUES (25, '巴林', NULL);
INSERT INTO `sys_nation` VALUES (26, '巴拿马', NULL);
INSERT INTO `sys_nation` VALUES (27, '巴西', NULL);
INSERT INTO `sys_nation` VALUES (28, '白俄罗斯', NULL);
INSERT INTO `sys_nation` VALUES (29, '百慕大', NULL);
INSERT INTO `sys_nation` VALUES (30, '保加利亚', NULL);
INSERT INTO `sys_nation` VALUES (31, '北马里亚群岛', NULL);
INSERT INTO `sys_nation` VALUES (32, NULL, 'B');
INSERT INTO `sys_nation` VALUES (33, '比利时', NULL);
INSERT INTO `sys_nation` VALUES (34, '冰岛', NULL);
INSERT INTO `sys_nation` VALUES (35, '波多黎各', NULL);
INSERT INTO `sys_nation` VALUES (36, '波黑', NULL);
INSERT INTO `sys_nation` VALUES (37, '波兰', NULL);
INSERT INTO `sys_nation` VALUES (38, '玻利维亚', NULL);
INSERT INTO `sys_nation` VALUES (39, '伯利兹', NULL);
INSERT INTO `sys_nation` VALUES (40, '博茨瓦纳', NULL);
INSERT INTO `sys_nation` VALUES (41, '不丹', NULL);
INSERT INTO `sys_nation` VALUES (42, '布基纳法索', NULL);
INSERT INTO `sys_nation` VALUES (43, '布隆迪', NULL);
INSERT INTO `sys_nation` VALUES (44, '布韦岛', NULL);
INSERT INTO `sys_nation` VALUES (45, '朝鲜', NULL);
INSERT INTO `sys_nation` VALUES (46, '赤道几内亚', NULL);
INSERT INTO `sys_nation` VALUES (47, '丹麦', NULL);
INSERT INTO `sys_nation` VALUES (48, '德国', NULL);
INSERT INTO `sys_nation` VALUES (49, '东帝汶', NULL);
INSERT INTO `sys_nation` VALUES (50, '多哥', NULL);
INSERT INTO `sys_nation` VALUES (51, '多米尼亚共和国', NULL);
INSERT INTO `sys_nation` VALUES (52, '多米尼克', NULL);
INSERT INTO `sys_nation` VALUES (53, '俄罗斯', NULL);
INSERT INTO `sys_nation` VALUES (54, '厄瓜多尔', NULL);
INSERT INTO `sys_nation` VALUES (55, '厄立特里亚', NULL);
INSERT INTO `sys_nation` VALUES (56, '法国', NULL);
INSERT INTO `sys_nation` VALUES (57, '法罗群岛', NULL);
INSERT INTO `sys_nation` VALUES (58, '法属玻里尼西亚', NULL);
INSERT INTO `sys_nation` VALUES (59, '法属南部领土', NULL);
INSERT INTO `sys_nation` VALUES (60, '梵蒂冈', NULL);
INSERT INTO `sys_nation` VALUES (61, '菲律宾', NULL);
INSERT INTO `sys_nation` VALUES (62, '斐济', NULL);
INSERT INTO `sys_nation` VALUES (63, '芬兰', NULL);
INSERT INTO `sys_nation` VALUES (64, '佛得角', NULL);
INSERT INTO `sys_nation` VALUES (65, '弗兰克群岛', NULL);
INSERT INTO `sys_nation` VALUES (66, '冈比亚', NULL);
INSERT INTO `sys_nation` VALUES (67, '刚果民主共和国', NULL);
INSERT INTO `sys_nation` VALUES (68, '哥伦比亚', NULL);
INSERT INTO `sys_nation` VALUES (69, '哥斯达黎加', NULL);
INSERT INTO `sys_nation` VALUES (70, '格恩西岛', NULL);
INSERT INTO `sys_nation` VALUES (71, '格林纳达', NULL);
INSERT INTO `sys_nation` VALUES (72, '格陵兰', NULL);
INSERT INTO `sys_nation` VALUES (73, '古巴', NULL);
INSERT INTO `sys_nation` VALUES (74, '瓜德罗普岛', NULL);
INSERT INTO `sys_nation` VALUES (75, '关岛', NULL);
INSERT INTO `sys_nation` VALUES (76, '圭亚那', NULL);
INSERT INTO `sys_nation` VALUES (77, '哈萨克斯坦', NULL);
INSERT INTO `sys_nation` VALUES (78, '海地', NULL);
INSERT INTO `sys_nation` VALUES (79, '韩国', NULL);
INSERT INTO `sys_nation` VALUES (80, '荷兰', NULL);
INSERT INTO `sys_nation` VALUES (81, '荷属圣马丁岛', NULL);
INSERT INTO `sys_nation` VALUES (82, '赫德与麦克唐纳群岛', NULL);
INSERT INTO `sys_nation` VALUES (83, '黑山共和国', NULL);
INSERT INTO `sys_nation` VALUES (84, '洪都拉斯', NULL);
INSERT INTO `sys_nation` VALUES (85, '基里巴斯', NULL);
INSERT INTO `sys_nation` VALUES (86, '吉布提', NULL);
INSERT INTO `sys_nation` VALUES (87, '吉尔吉斯斯坦', NULL);
INSERT INTO `sys_nation` VALUES (88, '几内亚', NULL);
INSERT INTO `sys_nation` VALUES (89, '几内亚比绍', NULL);
INSERT INTO `sys_nation` VALUES (90, '加勒比荷兰', NULL);
INSERT INTO `sys_nation` VALUES (91, '加拿大', NULL);
INSERT INTO `sys_nation` VALUES (92, '加纳', NULL);
INSERT INTO `sys_nation` VALUES (93, '加蓬', NULL);
INSERT INTO `sys_nation` VALUES (94, '束埔寨', NULL);
INSERT INTO `sys_nation` VALUES (95, '捷克共和国', NULL);
INSERT INTO `sys_nation` VALUES (96, '津巴布韦', NULL);
INSERT INTO `sys_nation` VALUES (97, '客麦隆', NULL);
INSERT INTO `sys_nation` VALUES (98, '卡塔尔', NULL);
INSERT INTO `sys_nation` VALUES (99, '开曼群岛', NULL);
INSERT INTO `sys_nation` VALUES (100, '科科斯群岛', NULL);
INSERT INTO `sys_nation` VALUES (101, '科摩罗', NULL);
INSERT INTO `sys_nation` VALUES (102, '科索沃', NULL);
INSERT INTO `sys_nation` VALUES (103, '科特迪瓦', NULL);
INSERT INTO `sys_nation` VALUES (104, '科威特', NULL);
INSERT INTO `sys_nation` VALUES (105, '克罗地亚', NULL);
INSERT INTO `sys_nation` VALUES (106, '肯尼亚', NULL);
INSERT INTO `sys_nation` VALUES (107, '库克群岛', NULL);
INSERT INTO `sys_nation` VALUES (108, '库拉索', NULL);
INSERT INTO `sys_nation` VALUES (109, '拉脱维亚', NULL);
INSERT INTO `sys_nation` VALUES (110, '菜索托', NULL);
INSERT INTO `sys_nation` VALUES (111, '老挝', NULL);
INSERT INTO `sys_nation` VALUES (112, '黎巴嫩', NULL);
INSERT INTO `sys_nation` VALUES (113, '立陶宛', NULL);
INSERT INTO `sys_nation` VALUES (114, '利比里亚', NULL);
INSERT INTO `sys_nation` VALUES (115, '利比亚', NULL);
INSERT INTO `sys_nation` VALUES (116, NULL, 'L');
INSERT INTO `sys_nation` VALUES (117, '留尼旺岛', NULL);
INSERT INTO `sys_nation` VALUES (118, '卢森堡', NULL);
INSERT INTO `sys_nation` VALUES (119, '卢旺达', NULL);
INSERT INTO `sys_nation` VALUES (120, '罗马尼亚', NULL);
INSERT INTO `sys_nation` VALUES (121, '马达加斯加', NULL);
INSERT INTO `sys_nation` VALUES (122, '马尔代夫', NULL);
INSERT INTO `sys_nation` VALUES (123, '马耳他', NULL);
INSERT INTO `sys_nation` VALUES (124, '马拉维', NULL);
INSERT INTO `sys_nation` VALUES (125, '马来西亚', NULL);
INSERT INTO `sys_nation` VALUES (126, '马里', NULL);
INSERT INTO `sys_nation` VALUES (127, '马其顿', NULL);
INSERT INTO `sys_nation` VALUES (128, '马绍尔群岛', NULL);
INSERT INTO `sys_nation` VALUES (129, '马尼提克群岛', NULL);
INSERT INTO `sys_nation` VALUES (130, '马约特', NULL);
INSERT INTO `sys_nation` VALUES (131, '毛里求斯', NULL);
INSERT INTO `sys_nation` VALUES (132, '毛里塔尼亚', NULL);
INSERT INTO `sys_nation` VALUES (133, '美国', NULL);
INSERT INTO `sys_nation` VALUES (134, '美国边远小岛', NULL);
INSERT INTO `sys_nation` VALUES (135, '美属萨摩亚', NULL);
INSERT INTO `sys_nation` VALUES (136, '美属维京群岛', NULL);
INSERT INTO `sys_nation` VALUES (137, '蒙特色拉特岛', NULL);
INSERT INTO `sys_nation` VALUES (138, '孟加拉', NULL);
INSERT INTO `sys_nation` VALUES (139, '秘鲁', NULL);
INSERT INTO `sys_nation` VALUES (140, '密克罗尼西亚', NULL);
INSERT INTO `sys_nation` VALUES (141, '缅甸', NULL);
INSERT INTO `sys_nation` VALUES (142, '摩洛哥', NULL);
INSERT INTO `sys_nation` VALUES (143, '摩纳哥', NULL);
INSERT INTO `sys_nation` VALUES (144, '莫桑比克', NULL);
INSERT INTO `sys_nation` VALUES (145, '墨西哥', NULL);
INSERT INTO `sys_nation` VALUES (146, '纳米比亚', NULL);
INSERT INTO `sys_nation` VALUES (147, '南非', NULL);
INSERT INTO `sys_nation` VALUES (148, '南极洲', NULL);

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_white_ip,sys_country,sys_goods\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-07-25 11:43:04');
INSERT INTO `sys_oper_log` VALUES (2, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_country,sys_goods,sys_white_ip\"]}', NULL, 0, NULL, '2022-07-25 11:43:16');
INSERT INTO `sys_oper_log` VALUES (3, 'ip白名单', 1, 'com.ruoyi.web.controller.image.SysWhiteIpController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/ip/add', '127.0.0.1', '内网IP', '{\"whiteIpAdd\":[\"192.168.3.2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-07-25 15:50:07');
INSERT INTO `sys_oper_log` VALUES (4, 'ip白名单', 3, 'com.ruoyi.web.controller.image.SysWhiteIpController.remove()', 'POST', 1, 'admin', '研发部门', '/system/ip/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-07-25 15:50:15');
INSERT INTO `sys_oper_log` VALUES (5, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-07-25 15:57:33');
INSERT INTO `sys_oper_log` VALUES (6, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-07-25 15:57:48');
INSERT INTO `sys_oper_log` VALUES (7, '商品', 1, 'com.ruoyi.web.controller.image.SysGoodsController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/add', '127.0.0.1', '内网IP', '{\"goodsName\":[\"蓝牙耳机111\"],\"whiteImg\":[\"\"],\"blackImg\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-07-25 16:11:27');
INSERT INTO `sys_oper_log` VALUES (8, '国家', 3, 'com.ruoyi.web.controller.image.SysCountryController.editIp()', 'POST', 1, 'admin', '研发部门', '/system/country/editIp', '127.0.0.1', '内网IP', '{\"undefined\":[\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]}', NULL, 1, '', '2022-07-25 19:19:19');
INSERT INTO `sys_oper_log` VALUES (9, '国家', 3, 'com.ruoyi.web.controller.image.SysCountryController.editIp()', 'POST', 1, 'admin', '研发部门', '/system/country/editIp', '127.0.0.1', '内网IP', '{\"undefined\":[\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]}', NULL, 1, '', '2022-07-25 19:20:08');
INSERT INTO `sys_oper_log` VALUES (10, '国家', 3, 'com.ruoyi.web.controller.image.SysCountryController.editIp()', 'POST', 1, 'admin', '研发部门', '/system/country/editIp', '127.0.0.1', '内网IP', '{\"undefined\":[\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]}', NULL, 1, '', '2022-07-25 19:20:09');
INSERT INTO `sys_oper_log` VALUES (11, '国家', 3, 'com.ruoyi.web.controller.image.SysCountryController.editIp()', 'POST', 1, 'admin', '研发部门', '/system/country/editIp', '127.0.0.1', '内网IP', '{\"ids[]\":[\"1\",\"165\",\"166\",\"167\",\"168\",\"169\",\"170\",\"171\",\"172\",\"173\",\"174\",\"175\",\"176\",\"177\",\"178\",\"179\",\"180\",\"181\",\"182\",\"183\",\"184\",\"185\",\"186\"]}', NULL, 1, '', '2022-07-25 19:22:09');
INSERT INTO `sys_oper_log` VALUES (12, '国家', 2, 'com.ruoyi.web.controller.image.SysCountryController.editIp()', 'POST', 1, 'admin', '研发部门', '/system/country/editIp', '127.0.0.1', '内网IP', '{\"ids[]\":[\"1\",\"165\",\"166\",\"167\",\"168\",\"169\",\"170\",\"171\",\"172\",\"173\",\"174\",\"175\",\"176\",\"177\",\"178\",\"179\",\"180\",\"181\",\"182\",\"183\",\"184\",\"185\",\"186\"]}', NULL, 1, '', '2022-07-25 19:27:20');
INSERT INTO `sys_oper_log` VALUES (13, '国家', 2, 'com.ruoyi.web.controller.image.SysCountryController.editIp()', 'POST', 1, 'admin', '研发部门', '/system/country/editIp', '127.0.0.1', '内网IP', '{\"ids[]\":[\"4\",\"165\",\"166\",\"167\",\"168\",\"169\",\"170\",\"171\",\"172\",\"173\",\"174\",\"175\",\"176\",\"177\",\"178\",\"179\",\"180\",\"181\",\"182\",\"183\",\"184\",\"185\",\"186\"]}', NULL, 1, '', '2022-07-25 19:30:09');
INSERT INTO `sys_oper_log` VALUES (14, '国家', 2, 'com.ruoyi.web.controller.image.SysCountryController.editIp()', 'POST', 1, 'admin', '研发部门', '/system/country/editIp', '127.0.0.1', '内网IP', '{\"ids[]\":[\"3\",\"165\",\"166\",\"167\",\"168\",\"169\",\"170\",\"171\",\"172\",\"173\",\"174\",\"175\",\"176\",\"177\",\"178\",\"179\",\"180\",\"181\",\"182\",\"183\",\"184\",\"185\",\"186\"]}', NULL, 1, '', '2022-08-04 11:43:05');
INSERT INTO `sys_oper_log` VALUES (15, '国家', 2, 'com.ruoyi.web.controller.image.SysCountryController.editIp()', 'POST', 1, 'admin', '研发部门', '/system/country/editIp', '127.0.0.1', '内网IP', '{\"ids[]\":[\"8\",\"165\",\"166\",\"167\",\"168\",\"169\",\"170\",\"171\",\"172\",\"173\",\"174\",\"175\",\"176\",\"177\",\"178\",\"179\",\"180\",\"181\",\"182\",\"183\",\"184\",\"185\",\"186\"]}', NULL, 1, '', '2022-08-04 13:41:02');
INSERT INTO `sys_oper_log` VALUES (16, '国家', 2, 'com.ruoyi.web.controller.image.SysCountryController.editIp()', 'POST', 1, 'admin', '研发部门', '/system/country/editIp', '127.0.0.1', '内网IP', '{\"ids[]\":[\"8\",\"165\",\"166\",\"167\",\"168\",\"169\",\"170\",\"171\",\"172\",\"173\",\"174\",\"175\",\"176\",\"177\",\"178\",\"179\",\"180\",\"181\",\"182\",\"183\",\"184\",\"185\",\"186\"]}', NULL, 1, '', '2022-08-04 13:41:22');
INSERT INTO `sys_oper_log` VALUES (17, '国家', 2, 'com.ruoyi.web.controller.image.SysCountryController.editIp()', 'POST', 1, 'admin', '研发部门', '/system/country/editIp', '127.0.0.1', '内网IP', '{\"ids[]\":[\"6\",\"165\",\"166\",\"167\",\"168\",\"169\",\"170\",\"171\",\"172\",\"173\",\"174\",\"175\",\"176\",\"177\",\"178\",\"179\",\"180\",\"181\",\"182\",\"183\",\"184\",\"185\",\"186\"]}', NULL, 1, '', '2022-08-04 13:45:11');
INSERT INTO `sys_oper_log` VALUES (18, '国家', 2, 'com.ruoyi.web.controller.image.SysCountryController.editIp()', 'POST', 1, 'admin', '研发部门', '/system/country/editIp', '127.0.0.1', '内网IP', '{\"ids\":[\"165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'update sys_country set country_type = 1\n            where country_id = \'165\'\n   \' at line 2\r\n### The error may exist in file [D:\\program\\Image_Manager\\ruoyi-system\\target\\classes\\mapper\\system\\SysCountryMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysCountryMapper.updateSysCountryByCountryIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_country set country_type = 0;           (               update sys_country set country_type = 1             where country_id = ?          ,              update sys_country set country_type = 1             where country_id = ?          ,              update sys_country set country_type = 1             where country_id = ?          ,              update sys_country set country_type = 1             where country_id = ?          ,              update sys_country set country_type = 1             where country_id = ?          ,              update sys_country set country_type = 1             where country_id = ?          ,              update sys_country set country_type = 1             where country_id = ?          ,              update sys_country set country_type = 1             where country_id = ?          ,              update sys_country set country_type = 1             where country_id = ?          ,              update sys_country set country_type = 1             where country_id = ?          ,              update sys_country set country_type = 1             where country_id = ?          ,              update sys_country set country_type = 1             where country_id = ?          ,              update sys_country set country_type = 1             where country_id = ?          ,              update sys_country set country_type = 1             where country_id = ?          ,   ', '2022-08-04 13:47:44');
INSERT INTO `sys_oper_log` VALUES (19, '国家', 2, 'com.ruoyi.web.controller.image.SysCountryController.editIp()', 'POST', 1, 'admin', '研发部门', '/system/country/editIp', '127.0.0.1', '内网IP', '{\"ids\":[\"1,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'update sys_country set country_type = 1\n            where country_id = \'1\'\n     \' at line 2\r\n### The error may exist in file [D:\\program\\Image_Manager\\ruoyi-system\\target\\classes\\mapper\\system\\SysCountryMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysCountryMapper.updateSysCountryByCountryIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_country set country_type = 0;           (               update sys_country set country_type = 1             where country_id = ?          ,              update sys_country set country_type = 1             where country_id = ?          ,              update sys_country set country_type = 1             where country_id = ?          ,              update sys_country set country_type = 1             where country_id = ?          ,              update sys_country set country_type = 1             where country_id = ?          ,              update sys_country set country_type = 1             where country_id = ?          ,              update sys_country set country_type = 1             where country_id = ?          ,              update sys_country set country_type = 1             where country_id = ?          ,              update sys_country set country_type = 1             where country_id = ?          ,              update sys_country set country_type = 1             where country_id = ?          ,              update sys_country set country_type = 1             where country_id = ?          ,              update sys_country set country_type = 1             where country_id = ?          ,              update sys_country set country_type = 1             where country_id = ?          ,              update sys_country set country_type = 1             where country_id = ?          ,   ', '2022-08-04 13:47:54');
INSERT INTO `sys_oper_log` VALUES (20, '国家', 2, 'com.ruoyi.web.controller.image.SysCountryController.editIp()', 'POST', 1, 'admin', '研发部门', '/system/country/editIp', '127.0.0.1', '内网IP', '{\"ids\":[\"7\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'update sys_country set country_type = 1\n            where country_id = \'7\'\n     \' at line 2\r\n### The error may exist in file [D:\\program\\Image_Manager\\ruoyi-system\\target\\classes\\mapper\\system\\SysCountryMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysCountryMapper.updateSysCountryByCountryIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_country set country_type = 0;           (               update sys_country set country_type = 1             where country_id = ?          )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'update sys_country set country_type = 1\n            where country_id = \'7\'\n     \' at line 2\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'update sys_country set country_type = 1\n            where country_id = \'7\'\n     \' at line 2', '2022-08-04 13:51:48');
INSERT INTO `sys_oper_log` VALUES (21, '国家', 2, 'com.ruoyi.web.controller.image.SysCountryController.editIp()', 'POST', 1, 'admin', '研发部门', '/system/country/editIp', '127.0.0.1', '内网IP', '{\"ids\":[\"2,4\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'update sys_country set country_type = 1\n            where country_id = \'2\'\n     \' at line 2\r\n### The error may exist in file [D:\\program\\Image_Manager\\ruoyi-system\\target\\classes\\mapper\\system\\SysCountryMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysCountryMapper.updateSysCountryByCountryIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: (               update sys_country set country_type = 1             where country_id = ?          ,              update sys_country set country_type = 1             where country_id = ?          )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'update sys_country set country_type = 1\n            where country_id = \'2\'\n     \' at line 2\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'update sys_country set country_type = 1\n            where country_id = \'2\'\n     \' at line 2', '2022-08-04 13:59:05');
INSERT INTO `sys_oper_log` VALUES (22, '国家', 2, 'com.ruoyi.web.controller.image.SysCountryController.editIp()', 'POST', 1, 'admin', '研发部门', '/system/country/editIp', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'update sys_country set country_type = 1\n            where country_id = 1\n       \' at line 2\r\n### The error may exist in file [D:\\program\\Image_Manager\\ruoyi-system\\target\\classes\\mapper\\system\\SysCountryMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysCountryMapper.updateSysCountryByCountryIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: (               update sys_country set country_type = 1             where country_id = ?          )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'update sys_country set country_type = 1\n            where country_id = 1\n       \' at line 2\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'update sys_country set country_type = 1\n            where country_id = 1\n       \' at line 2', '2022-08-04 14:01:31');
INSERT INTO `sys_oper_log` VALUES (23, '国家', 2, 'com.ruoyi.web.controller.image.SysCountryController.editIp()', 'POST', 1, 'admin', '研发部门', '/system/country/editIp', '127.0.0.1', '内网IP', '{\"ids\":[\"1,2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-08-04 14:15:53');
INSERT INTO `sys_oper_log` VALUES (24, '国家', 2, 'com.ruoyi.web.controller.image.SysCountryController.editIp()', 'POST', 1, 'admin', '研发部门', '/system/country/editIp', '127.0.0.1', '内网IP', '{\"ids\":[\"1,2,4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-08-04 14:17:54');
INSERT INTO `sys_oper_log` VALUES (25, '国家', 2, 'com.ruoyi.web.controller.image.SysCountryController.editIp()', 'POST', 1, 'admin', '研发部门', '/system/country/editIp', '127.0.0.1', '内网IP', '{\"ids\":[\"2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-08-04 14:26:30');
INSERT INTO `sys_oper_log` VALUES (26, 'ip白名单', 1, 'com.ruoyi.web.controller.image.SysWhiteIpController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/ip/add', '127.0.0.1', '内网IP', '{\"whiteIpAdd\":[\"127.0.0.9\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-08-04 14:27:23');
INSERT INTO `sys_oper_log` VALUES (27, '商品', 1, 'com.ruoyi.web.controller.image.SysGoodsController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/add', '127.0.0.1', '内网IP', '{\"goodsName\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-08-04 15:48:20');
INSERT INTO `sys_oper_log` VALUES (28, '商品', 1, 'com.ruoyi.web.controller.image.SysGoodsController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/add', '127.0.0.1', '内网IP', '{\"goodsName\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-08-04 15:50:27');
INSERT INTO `sys_oper_log` VALUES (29, '商品', 1, 'com.ruoyi.web.controller.image.SysGoodsController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/add', '127.0.0.1', '内网IP', '{\"goodsName\":[\"1111\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-08-04 16:06:58');
INSERT INTO `sys_oper_log` VALUES (30, '商品', 1, 'com.ruoyi.web.controller.image.SysGoodsController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/add', '127.0.0.1', '内网IP', '{\"goodsName\":[\"蓝牙耳机\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-08-04 16:09:01');
INSERT INTO `sys_oper_log` VALUES (31, '商品', 1, 'com.ruoyi.web.controller.image.SysGoodsController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/add', '127.0.0.1', '内网IP', '{\"goodsName\":[\"蓝牙耳机\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-08-04 16:11:46');
INSERT INTO `sys_oper_log` VALUES (32, '商品', 1, 'com.ruoyi.web.controller.image.SysGoodsController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/add', '127.0.0.1', '内网IP', '{\"goodsName\":[\"蓝牙耳机\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-08-04 16:20:47');
INSERT INTO `sys_oper_log` VALUES (33, '商品', 1, 'com.ruoyi.web.controller.image.SysGoodsController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/add', '127.0.0.1', '内网IP', '{\"goodsName\":[\"蓝牙耳机\"],\"whiteImg\":[\"[object Object]\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-08-04 16:33:03');
INSERT INTO `sys_oper_log` VALUES (34, '商品', 1, 'com.ruoyi.web.controller.image.SysGoodsController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/add', '127.0.0.1', '内网IP', '{\"goodsName\":[\"蓝牙耳机\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-08-04 16:44:05');
INSERT INTO `sys_oper_log` VALUES (35, '商品', 1, 'com.ruoyi.web.controller.image.SysGoodsController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/add', '127.0.0.1', '内网IP', '{\"goodsName\":[\"111\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-08-04 16:49:30');
INSERT INTO `sys_oper_log` VALUES (36, '商品', 1, 'com.ruoyi.web.controller.image.SysGoodsController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/add', '127.0.0.1', '内网IP', '{\"goodsName\":[\"蓝牙耳机\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-08-04 16:50:12');
INSERT INTO `sys_oper_log` VALUES (37, '商品', 1, 'com.ruoyi.web.controller.image.SysGoodsController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/add', '127.0.0.1', '内网IP', '{\"goodsName\":[\"蓝牙耳机\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-08-04 16:51:44');
INSERT INTO `sys_oper_log` VALUES (38, '商品', 1, 'com.ruoyi.web.controller.image.SysGoodsController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/add', '127.0.0.1', '内网IP', '{\"goodsName\":[\"蓝牙耳机\"],\"whiteImg\":[\"[object File],[object File]\"],\"blackImg\":[\"[object File]\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-08-04 16:58:03');
INSERT INTO `sys_oper_log` VALUES (39, '商品', 1, 'com.ruoyi.web.controller.image.SysGoodsController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/add', '127.0.0.1', '内网IP', '{\"goodsName\":[\"蓝牙耳机\"],\"whiteImg\":[\"[object File],[object File]\"],\"blackImg\":[\"[object File],[object File]\"]}', NULL, 1, 'syntax error, expect {, actual error, pos 1, fastjson-version 1.2.83', '2022-08-04 17:30:54');
INSERT INTO `sys_oper_log` VALUES (40, '商品', 1, 'com.ruoyi.web.controller.image.SysGoodsController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/add', '127.0.0.1', '内网IP', '{\"goodsName\":[\"蓝牙耳机\"],\"whiteImg\":[\"[object File],[object File]\"],\"blackImg\":[\"[object File],[object File]\"]}', NULL, 1, 'syntax error, expect {, actual error, pos 1, fastjson-version 1.2.83', '2022-08-04 17:32:42');
INSERT INTO `sys_oper_log` VALUES (41, '商品', 1, 'com.ruoyi.web.controller.image.SysGoodsController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/add', '127.0.0.1', '内网IP', '{\"goodsName\":[\"蓝牙耳机\"],\"whiteImg\":[\"[object File],[object File]\"],\"blackImg\":[\"[object File],[object File]\"]}', NULL, 1, 'syntax error, expect {, actual error, pos 1, fastjson-version 1.2.83', '2022-08-04 17:35:04');
INSERT INTO `sys_oper_log` VALUES (42, '商品', 1, 'com.ruoyi.web.controller.image.SysGoodsController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/add', '127.0.0.1', '内网IP', '', NULL, 1, '', '2022-08-04 17:40:44');
INSERT INTO `sys_oper_log` VALUES (43, '商品', 1, 'com.ruoyi.web.controller.image.SysGoodsController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/add', '127.0.0.1', '内网IP', '', NULL, 1, '', '2022-08-04 17:44:00');
INSERT INTO `sys_oper_log` VALUES (44, '商品', 1, 'com.ruoyi.web.controller.image.SysGoodsController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/add', '127.0.0.1', '内网IP', '{\"goodsName\":[\"蓝牙耳机\"],\"whiteImg\":[\"[object File],[object File]\"],\"blackImg\":[\"[object File],[object File]\"]}', NULL, 1, '', '2022-08-04 17:47:44');
INSERT INTO `sys_oper_log` VALUES (45, '商品', 1, 'com.ruoyi.web.controller.image.SysGoodsController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/add', '127.0.0.1', '内网IP', '{\"goodsName\":[\"蓝牙耳机\"],\"whiteImg\":[\"[object File],[object File]\"],\"blackImg\":[\"[object File],[object File]\"]}', NULL, 1, 'syntax error, pos 2, line 1, column 3[object File],[object File]', '2022-08-04 17:51:25');
INSERT INTO `sys_oper_log` VALUES (46, '商品', 1, 'com.ruoyi.web.controller.image.SysGoodsController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/add', '127.0.0.1', '内网IP', '{\"goodsName\":[\"\"],\"whiteImg\":[\"[object File],[object File]\"],\"blackImg\":[\"[object File],[object File]\"]}', NULL, 1, 'syntax error, expect {, actual [, pos 0, fastjson-version 1.2.83', '2022-08-04 18:19:06');
INSERT INTO `sys_oper_log` VALUES (47, '商品', 1, 'com.ruoyi.web.controller.image.SysGoodsController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/add', '127.0.0.1', '内网IP', '{\"goodsName\":[\"\"],\"whiteImg\":[\"[object File],[object File]\"],\"blackImg\":[\"[object File],[object File]\"]}', NULL, 1, 'syntax error, expect {, actual [, pos 0, fastjson-version 1.2.83', '2022-08-04 18:19:19');
INSERT INTO `sys_oper_log` VALUES (48, '商品', 1, 'com.ruoyi.web.controller.image.SysGoodsController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/add', '127.0.0.1', '内网IP', '{\"goodsName\":[\"1212\"],\"whiteImg\":[\"[object File]\"],\"blackImg\":[\"\"]}', NULL, 1, 'syntax error, expect {, actual [, pos 0, fastjson-version 1.2.83', '2022-08-05 10:03:12');
INSERT INTO `sys_oper_log` VALUES (49, '商品', 1, 'com.ruoyi.web.controller.image.SysGoodsController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/add', '127.0.0.1', '内网IP', '{\"goodsName\":[\"\"],\"whiteImg\":[\"[object File],[object File]\"],\"blackImg\":[\"\"]}', NULL, 1, 'syntax error, expect {, actual [, pos 0, fastjson-version 1.2.83', '2022-08-05 10:25:26');
INSERT INTO `sys_oper_log` VALUES (50, '商品', 1, 'com.ruoyi.web.controller.image.SysGoodsController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/add', '127.0.0.1', '内网IP', '{\"goodsName\":[\"蓝牙耳机\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-08-05 10:32:37');
INSERT INTO `sys_oper_log` VALUES (51, '商品', 2, 'com.ruoyi.web.controller.image.SysGoodsController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/edit', '127.0.0.1', '内网IP', '{\"goodsId\":[\"15\"],\"goodsName\":[\"蓝牙耳机111\"],\"whiteImg\":[\"http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220725155256_20220805103225A001.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100552_20220805103225A002.jpg\"],\"blackImg\":[\"http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100558_20220805103226A003.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100601_20220805103226A004.jpg\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-08-05 11:51:59');
INSERT INTO `sys_oper_log` VALUES (52, '商品', 1, 'com.ruoyi.web.controller.image.SysGoodsController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/add', '127.0.0.1', '内网IP', '{\"goodsName\":[\"蓝牙耳机111\"]}', NULL, 1, '', '2022-08-05 13:46:48');
INSERT INTO `sys_oper_log` VALUES (53, '商品', 1, 'com.ruoyi.web.controller.image.SysGoodsController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/add', '127.0.0.1', '内网IP', '{\"goodsName\":[\"1212\"]}', NULL, 1, '', '2022-08-05 14:20:14');
INSERT INTO `sys_oper_log` VALUES (54, '商品', 2, 'com.ruoyi.web.controller.image.SysGoodsController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/edit', '127.0.0.1', '内网IP', '{\"goodsName\":[\"蓝牙耳机111\"],\"whiteImgEdit\":[\"http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220725155256_20220805103225A001.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100552_20220805103225A002.jpg\"],\"blackImgEdit\":[\"http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100558_20220805103226A003.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100601_20220805103226A004.jpg\"]}', NULL, 1, '', '2022-08-05 14:41:53');
INSERT INTO `sys_oper_log` VALUES (55, '商品', 2, 'com.ruoyi.web.controller.image.SysGoodsController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/edit', '127.0.0.1', '内网IP', '{\"goodsName\":[\"蓝牙耳机111\"],\"whiteImgEdit\":[\"http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220725155256_20220805103225A001.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100552_20220805103225A002.jpg\"],\"blackImgEdit\":[\"http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100558_20220805103226A003.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100601_20220805103226A004.jpg\"]}', NULL, 1, '', '2022-08-05 14:47:41');
INSERT INTO `sys_oper_log` VALUES (56, '商品', 2, 'com.ruoyi.web.controller.image.SysGoodsController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/edit', '127.0.0.1', '内网IP', '{\"goodsName\":[\"蓝牙耳机111\"],\"whiteImgEdit\":[\"http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220725155256_20220805103225A001.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100552_20220805103225A002.jpg\"],\"blackImgEdit\":[\"http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100558_20220805103226A003.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100601_20220805103226A004.jpg\"]}', NULL, 1, '', '2022-08-05 14:49:59');
INSERT INTO `sys_oper_log` VALUES (57, '商品', 2, 'com.ruoyi.web.controller.image.SysGoodsController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/edit', '127.0.0.1', '内网IP', '{\"goodsName\":[\"蓝牙耳机111\"],\"whiteImgEdit\":[\"http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220725155256_20220805103225A001.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100552_20220805103225A002.jpg\"],\"blackImgEdit\":[\"http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100558_20220805103226A003.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100601_20220805103226A004.jpg\"]}', NULL, 1, '', '2022-08-05 14:51:24');
INSERT INTO `sys_oper_log` VALUES (58, '商品', 2, 'com.ruoyi.web.controller.image.SysGoodsController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/edit', '127.0.0.1', '内网IP', '{\"goodsName\":[\"蓝牙耳机111\"],\"whiteImgEdit\":[\"http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220725155256_20220805103225A001.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100552_20220805103225A002.jpg\"],\"blackImgEdit\":[\"http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100558_20220805103226A003.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100601_20220805103226A004.jpg\"]}', NULL, 1, '', '2022-08-05 14:56:21');
INSERT INTO `sys_oper_log` VALUES (59, '商品', 2, 'com.ruoyi.web.controller.image.SysGoodsController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/edit', '127.0.0.1', '内网IP', '{\"goodsName\":[\"蓝牙耳机111\"],\"whiteImgEdit\":[\"\"],\"blackImgEdit\":[\"http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100558_20220805103226A003.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100601_20220805103226A004.jpg\"]}', NULL, 1, '', '2022-08-05 14:57:13');
INSERT INTO `sys_oper_log` VALUES (60, '商品', 2, 'com.ruoyi.web.controller.image.SysGoodsController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/edit', '127.0.0.1', '内网IP', '{\"goodsName\":[\"蓝牙耳机111\"],\"whiteImgEdit\":[\"http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220725155256_20220805103225A001.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100552_20220805103225A002.jpg\"],\"blackImgEdit\":[\"http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100558_20220805103226A003.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100601_20220805103226A004.jpg\"]}', NULL, 1, '', '2022-08-05 15:06:16');
INSERT INTO `sys_oper_log` VALUES (61, '商品', 2, 'com.ruoyi.web.controller.image.SysGoodsController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/edit', '127.0.0.1', '内网IP', '{\"goodsName\":[\"蓝牙耳机111\"],\"whiteImgEdit\":[\"http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220725155256_20220805103225A001.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100552_20220805103225A002.jpg\"],\"blackImgEdit\":[\"http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100558_20220805103226A003.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100601_20220805103226A004.jpg\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-08-05 15:08:04');
INSERT INTO `sys_oper_log` VALUES (62, '商品', 2, 'com.ruoyi.web.controller.image.SysGoodsController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/edit', '127.0.0.1', '内网IP', '{\"goodsName\":[\"蓝牙耳机111\"],\"whiteImgEdit\":[\"http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220725155256_20220805103225A001.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100552_20220805103225A002.jpg\"],\"blackImgEdit\":[\"http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100558_20220805103226A003.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100601_20220805103226A004.jpg\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-08-05 15:10:01');
INSERT INTO `sys_oper_log` VALUES (63, '商品', 2, 'com.ruoyi.web.controller.image.SysGoodsController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/edit', '127.0.0.1', '内网IP', '{\"goodsId\":[\"15\"],\"goodsName\":[\"蓝牙耳机111\"],\"whiteImgEdit\":[\"http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220725155256_20220805103225A001.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100552_20220805103225A002.jpg\"],\"blackImgEdit\":[\"http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100558_20220805103226A003.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100601_20220805103226A004.jpg\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-08-05 15:19:57');
INSERT INTO `sys_oper_log` VALUES (64, '商品', 2, 'com.ruoyi.web.controller.image.SysGoodsController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/edit', '127.0.0.1', '内网IP', '{\"goodsId\":[\"15\"],\"goodsName\":[\"蓝牙耳机111\"],\"whiteImgEdit\":[\"http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220725155256_20220805103225A001.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100552_20220805103225A002.jpg\"],\"blackImgEdit\":[\"http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100558_20220805103226A003.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100601_20220805103226A004.jpg\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-08-05 15:22:53');
INSERT INTO `sys_oper_log` VALUES (65, '商品', 2, 'com.ruoyi.web.controller.image.SysGoodsController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/edit', '127.0.0.1', '内网IP', '{\"goodsId\":[\"15\"],\"goodsName\":[\"蓝牙耳机111\"],\"whiteImgEdit\":[\"\"],\"blackImgEdit\":[\"http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100558_20220805103226A003.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100601_20220805103226A004.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220725155307_20220805152253A003.jpg\"]}', '{\"msg\":\"请填写完整信息后再保存\",\"code\":500}', 0, NULL, '2022-08-05 15:24:11');
INSERT INTO `sys_oper_log` VALUES (66, '商品', 2, 'com.ruoyi.web.controller.image.SysGoodsController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/edit', '127.0.0.1', '内网IP', '{\"goodsId\":[\"15\"],\"goodsName\":[\"蓝牙耳机111\"],\"whiteImgEdit\":[\"\"],\"blackImgEdit\":[\"http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100558_20220805103226A003.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100601_20220805103226A004.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220725155307_20220805152253A003.jpg\"]}', '{\"msg\":\"请填写完整信息后再保存\",\"code\":500}', 0, NULL, '2022-08-05 15:25:24');
INSERT INTO `sys_oper_log` VALUES (67, '商品', 2, 'com.ruoyi.web.controller.image.SysGoodsController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/edit', '127.0.0.1', '内网IP', '{\"goodsId\":[\"15\"],\"goodsName\":[\"蓝牙耳机111\"],\"whiteImgEdit\":[\"\"],\"blackImgEdit\":[\"http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100558_20220805103226A003.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100601_20220805103226A004.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220725155307_20220805152253A003.jpg\"]}', '{\"msg\":\"请填写完整信息后再保存\",\"code\":500}', 0, NULL, '2022-08-05 15:25:27');
INSERT INTO `sys_oper_log` VALUES (68, '商品', 2, 'com.ruoyi.web.controller.image.SysGoodsController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/edit', '127.0.0.1', '内网IP', '{\"goodsId\":[\"15\"],\"goodsName\":[\"蓝牙耳机111\"],\"whiteImgEdit\":[\"http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220725155256_20220805103225A001.jpg\"],\"blackImgEdit\":[\"http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100558_20220805103226A003.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100601_20220805103226A004.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220725155307_20220805152253A003.jpg\"]}', '{\"code\":500}', 0, NULL, '2022-08-05 15:25:36');
INSERT INTO `sys_oper_log` VALUES (69, '商品', 2, 'com.ruoyi.web.controller.image.SysGoodsController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/edit', '127.0.0.1', '内网IP', '{\"goodsId\":[\"15\"],\"goodsName\":[\"蓝牙耳机111\"],\"whiteImgEdit\":[\"\"],\"blackImgEdit\":[\"http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100558_20220805103226A003.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100601_20220805103226A004.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220725155307_20220805152253A003.jpg\"]}', '{\"msg\":\"请填写完整信息后再保存\",\"code\":500}', 0, NULL, '2022-08-05 15:26:04');
INSERT INTO `sys_oper_log` VALUES (70, '商品', 2, 'com.ruoyi.web.controller.image.SysGoodsController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/edit', '127.0.0.1', '内网IP', '{\"goodsId\":[\"15\"],\"goodsName\":[\"蓝牙耳机111\"],\"whiteImgEdit\":[\"\"],\"blackImgEdit\":[\"http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100558_20220805103226A003.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100601_20220805103226A004.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220725155307_20220805152253A003.jpg\"]}', '{\"msg\":\"请填写完整信息后再保存\",\"code\":500}', 0, NULL, '2022-08-05 15:26:26');
INSERT INTO `sys_oper_log` VALUES (71, '商品', 2, 'com.ruoyi.web.controller.image.SysGoodsController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/edit', '127.0.0.1', '内网IP', '{\"goodsId\":[\"15\"],\"goodsName\":[\"蓝牙耳机111\"],\"whiteImgEdit\":[\"http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220725155256_20220805103225A001.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100552_20220805103225A002.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220725155312_20220805152253A001.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100552_20220805152253A002.jpg\"],\"blackImgEdit\":[\"http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100558_20220805103226A003.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100601_20220805103226A004.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220725155307_20220805152253A003.jpg\"]}', '{\"code\":500}', 0, NULL, '2022-08-05 15:26:50');
INSERT INTO `sys_oper_log` VALUES (72, '商品', 2, 'com.ruoyi.web.controller.image.SysGoodsController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/edit', '127.0.0.1', '内网IP', '{\"goodsId\":[\"15\"],\"goodsName\":[\"蓝牙耳机111\"],\"whiteImgEdit\":[\"\"],\"blackImgEdit\":[\"http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100558_20220805103226A003.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100601_20220805103226A004.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220725155307_20220805152253A003.jpg\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-08-05 15:28:12');
INSERT INTO `sys_oper_log` VALUES (73, '商品', 2, 'com.ruoyi.web.controller.image.SysGoodsController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/edit', '127.0.0.1', '内网IP', '{\"goodsId\":[\"15\"],\"goodsName\":[\"蓝牙耳机111\"],\"whiteImgEdit\":[\"\"],\"blackImgEdit\":[\"http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100558_20220805103226A003.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100601_20220805103226A004.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220725155307_20220805152253A003.jpg,http://127.0.0.1/profile/upload/2022/08/05/微信图片_20220805100552_20220805152812A005.jpg\"]}', '{\"msg\":\"黑白两个名单内的图片，需保证图片一一对应\",\"code\":500}', 0, NULL, '2022-08-05 15:31:35');
INSERT INTO `sys_oper_log` VALUES (74, '商品', 2, 'com.ruoyi.web.controller.image.SysGoodsController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/edit', '127.0.0.1', '内网IP', '{\"goodsId\":[\"15\"],\"goodsName\":[\"蓝牙耳机111\"],\"whiteImgEdit\":[\"\"],\"blackImgEdit\":[\"\"]}', '{\"msg\":\"请填写完整信息后再保存\",\"code\":500}', 0, NULL, '2022-08-05 15:41:49');
INSERT INTO `sys_oper_log` VALUES (75, '商品', 2, 'com.ruoyi.web.controller.image.SysGoodsController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/edit', '127.0.0.1', '内网IP', '{\"goodsId\":[\"15\"],\"goodsName\":[\"蓝牙耳机111\"],\"whiteImgEdit\":[\"\"],\"blackImgEdit\":[\"\"]}', '{\"msg\":\"黑白两个名单内的图片，需保证图片一一对应\",\"code\":500}', 0, NULL, '2022-08-05 15:42:07');
INSERT INTO `sys_oper_log` VALUES (76, '商品', 2, 'com.ruoyi.web.controller.image.SysGoodsController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/goods/edit', '127.0.0.1', '内网IP', '{\"goodsId\":[\"15\"],\"goodsName\":[\"蓝牙耳机111\"],\"whiteImgEdit\":[\"\"],\"blackImgEdit\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-08-05 15:42:15');
INSERT INTO `sys_oper_log` VALUES (77, '国家', 2, 'com.ruoyi.web.controller.image.SysCountryController.editIp()', 'POST', 1, 'admin', '研发部门', '/system/country/editIp', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-08-05 18:10:47');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2022-07-21 11:44:59', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2022-07-21 11:44:59', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2022-07-21 11:44:59', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Compact;

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
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 1061);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '/profile/avatar/2022/07/25/blob_20220725155748A002.png', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2022-08-05 18:25:10', '2022-07-21 11:44:59', 'admin', '2022-07-21 11:44:59', '', '2022-08-05 18:25:10', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2022-07-21 11:44:59', '2022-07-21 11:44:59', 'admin', '2022-07-21 11:44:59', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在线用户记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('a351e826-6cd3-40f6-882f-9254ff9f76a8', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 7', 'on_line', '2022-08-05 17:57:42', '2022-08-05 18:25:10', 1800000);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_white_ip
-- ----------------------------
DROP TABLE IF EXISTS `sys_white_ip`;
CREATE TABLE `sys_white_ip`  (
  `white_ip_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `white_ip_add` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '白名单ip地址',
  PRIMARY KEY (`white_ip_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'ip白名单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_white_ip
-- ----------------------------
INSERT INTO `sys_white_ip` VALUES (1, '192.168.0.1');
INSERT INTO `sys_white_ip` VALUES (3, '192.168.3.2');
INSERT INTO `sys_white_ip` VALUES (4, '127.0.0.9');

SET FOREIGN_KEY_CHECKS = 1;
