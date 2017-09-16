/*
Navicat MySQL Data Transfer

Source Server         : dong
Source Server Version : 50147
Source Host           : localhost:3306
Source Database       : ams

Target Server Type    : MYSQL
Target Server Version : 50147
File Encoding         : 65001

Date: 2015-10-23 21:45:12
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `deptment`
-- ----------------------------
DROP TABLE IF EXISTS `deptment`;
CREATE TABLE `deptment` (
  `dept_id` int(8) NOT NULL AUTO_INCREMENT,
  `deptName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deptment
-- ----------------------------
INSERT INTO `deptment` VALUES ('1', '行政部');
INSERT INTO `deptment` VALUES ('2', '企管部');
INSERT INTO `deptment` VALUES ('3', '财务部');
INSERT INTO `deptment` VALUES ('4', '市场部');
INSERT INTO `deptment` VALUES ('5', '运营部');
INSERT INTO `deptment` VALUES ('6', '销售部');
INSERT INTO `deptment` VALUES ('7', '后勤部');
INSERT INTO `deptment` VALUES ('8', '人事部');
INSERT INTO `deptment` VALUES ('9', '技术部');
INSERT INTO `deptment` VALUES ('10', 'dwadawd');

-- ----------------------------
-- Table structure for `email`
-- ----------------------------
DROP TABLE IF EXISTS `email`;
CREATE TABLE `email` (
  `email_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `type` varchar(11) DEFAULT NULL,
  `beginDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `applicationDate` datetime DEFAULT NULL,
  `approval_emp_id` int(11) DEFAULT NULL,
  `approvalStatus` varchar(11) DEFAULT NULL,
  `approvalDate` datetime DEFAULT NULL,
  `assign_emp_id` int(11) DEFAULT NULL,
  `assignStatus` varchar(11) DEFAULT NULL,
  `assignDate` datetime DEFAULT NULL,
  `process_emp_id` int(11) DEFAULT NULL,
  `processStatus` varchar(11) DEFAULT NULL,
  `processDate` datetime DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of email
-- ----------------------------
INSERT INTO `email` VALUES ('1', '100020', '新增', '2015-10-04 09:13:08', '2015-10-05 09:13:12', '有需求', '2015-10-04 09:21:50', null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `emp_id` int(8) NOT NULL AUTO_INCREMENT,
  `dept_id` int(8) DEFAULT NULL,
  `empName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` varchar(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `createTime` date DEFAULT NULL,
  `cellphone` int(20) DEFAULT NULL,
  `empContent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100031 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('100001', '1', '振国', '123', '男', '1977-01-01', '2015-10-07', '11111', '11');
INSERT INTO `employee` VALUES ('100002', '2', '倩妹', '123', '女', '1977-02-02', '2015-10-04', '11111', '10');
INSERT INTO `employee` VALUES ('100003', '3', '飘雪', '123', '女', '1980-08-19', '2015-10-04', '11111', '11');
INSERT INTO `employee` VALUES ('100004', '1', '张三', '123', '男', '1966-09-09', '2015-10-04', '1111', '11');
INSERT INTO `employee` VALUES ('100005', '4', '镇国', '123', '男', '1976-08-28', '2015-10-04', '11111', '11');
INSERT INTO `employee` VALUES ('100006', '5', '老马', '123', '男', '1988-12-11', '2015-10-03', '11111', '11');
INSERT INTO `employee` VALUES ('100007', '6', '张鹏', '123', '男', '1982-07-12', '2015-10-04', '11111', '12');
INSERT INTO `employee` VALUES ('100008', '7', '小猪', '123', '女', '1980-02-29', '2015-10-04', '12313', '23');
INSERT INTO `employee` VALUES ('100009', '8', '龙哥', '123', '男', '1966-12-31', '2015-10-04', '12333', '213');
INSERT INTO `employee` VALUES ('100010', '9', '郑大世', '123', '男', '1982-01-23', '2015-10-04', '123123', '12213');
INSERT INTO `employee` VALUES ('100011', '1', '大致', '123', '男', '1977-07-30', '2015-10-04', '11111', '111');
INSERT INTO `employee` VALUES ('100012', '1', '小章', '123', '女', '1976-08-23', '2015-10-04', '11111', '12321');
INSERT INTO `employee` VALUES ('100013', '2', '张伟', '123', '男', '1990-08-27', '2015-10-04', '12331', '21312');
INSERT INTO `employee` VALUES ('100014', '2', '张强', '123', '男', '1988-06-15', '2015-10-04', '123123', '123');
INSERT INTO `employee` VALUES ('100015', '3', '贾科', '123', '男', '1978-10-20', '2015-10-04', '12312', '2132');
INSERT INTO `employee` VALUES ('100016', '3', '黄石', '123', '男', '1991-08-23', '2015-10-04', '12312', '444');
INSERT INTO `employee` VALUES ('100017', '4', '李思', '123', '女', '1974-04-30', '2015-10-04', '12333', '43');
INSERT INTO `employee` VALUES ('100018', '4', '赵爽', '123', '女', '1979-09-24', '2015-10-04', '123123', '1231');
INSERT INTO `employee` VALUES ('100019', '5', '钱闲', '123', '男', '1965-10-29', '2015-10-04', '12312', '123123');
INSERT INTO `employee` VALUES ('100020', '5', '周伟', '123', '男', '1995-05-15', '2015-10-04', '123123', '2133');
INSERT INTO `employee` VALUES ('100021', '6', '罗至', '123', '男', '1970-01-01', '2015-10-04', '12312', '2131');
INSERT INTO `employee` VALUES ('100022', '6', '吴用', '123', '男', '1980-01-02', '2015-10-04', '123123', '6');
INSERT INTO `employee` VALUES ('100023', '7', '曹爽', '123', '女', '1989-09-30', '2015-10-04', '1232', '33');
INSERT INTO `employee` VALUES ('100024', '7', '刘薇', '123', '女', '1988-12-13', '2015-10-04', '12312', '7');
INSERT INTO `employee` VALUES ('100025', '8', '薇薇', '123', '女', '1988-08-08', '2015-10-04', '1111', '132');
INSERT INTO `employee` VALUES ('100026', '8', '王波', '123', '男', '1993-06-01', '2015-10-04', '123123', '213');
INSERT INTO `employee` VALUES ('100027', '9', '小乔', '123', '女', '1986-10-20', '2015-10-04', '12321', '213123');
INSERT INTO `employee` VALUES ('100028', '9', '大乔', '123', '女', '1986-10-20', '2015-10-04', '123123', '12312');
INSERT INTO `employee` VALUES ('100030', '2', 'tom1', '123', '男', '1992-06-01', '1992-06-12', '1192', 'xadddadw');

-- ----------------------------
-- Table structure for `ip`
-- ----------------------------
DROP TABLE IF EXISTS `ip`;
CREATE TABLE `ip` (
  `IP_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `IF_num` int(11) DEFAULT NULL,
  `useDay` int(11) DEFAULT NULL,
  `applicationDate` datetime DEFAULT NULL,
  `approval_emp_id` int(11) DEFAULT NULL,
  `approvalStatus` varchar(11) DEFAULT NULL,
  `approvalDate` datetime DEFAULT NULL,
  `assign_emp_id` int(11) DEFAULT NULL,
  `assignStatus` varchar(11) DEFAULT NULL,
  `assignDate` datetime DEFAULT NULL,
  `process_emp_id` int(11) DEFAULT NULL,
  `processStatus` varchar(11) DEFAULT NULL,
  `processDate` datetime DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IP_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ip
-- ----------------------------
INSERT INTO `ip` VALUES ('2', '100025', '2222', '2222', '2222', '2222', '2222', '2015-10-06 11:00:59', '100025', '2', '2015-10-06 17:07:30', '100010', '2', '2015-10-06 17:11:41', '100027', '2', '2015-10-06 17:12:06', null);
INSERT INTO `ip` VALUES ('3', '100020', '1111', '1111', '1111', '1111', '1111', '2015-10-06 16:29:53', '100020', '2', '2015-10-06 16:32:49', '100010', '2', '2015-10-06 16:33:29', '100027', '2', '2015-10-06 16:42:11', null);
INSERT INTO `ip` VALUES ('7', '100025', '6666', '6666', '6666', '6666', '6666', '2015-10-06 19:58:37', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `ip` VALUES ('10', '100025', '7777', '7777', '7777', '7777', '7777', '2015-10-07 10:45:15', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `ip` VALUES ('16', '100025', '4444', '4444', '4444', '4444', '4444', '2015-10-07 14:25:42', '100025', '1', '2015-10-07 14:47:49', '100010', '1', null, '0', '0', null, null);
INSERT INTO `ip` VALUES ('17', '100025', '1111', '5555', '5555', '7777', '4444', '2015-10-07 14:51:06', '100025', '2', '2015-10-07 14:51:23', '100010', '1', null, '0', '0', null, null);
INSERT INTO `ip` VALUES ('18', '100025', '88995', '8888', '5555', '7777', '4444', '2015-10-07 14:53:50', '100025', '2', '2015-10-07 14:54:17', '100010', '1', null, '0', '0', null, null);
INSERT INTO `ip` VALUES ('19', '100025', '9999', '9999', '9999', '9999', '9999', '2015-10-07 14:58:35', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `ip` VALUES ('20', '100025', '8888', '5555', '9999', '4444', '7777', '2015-10-07 15:02:13', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `ip` VALUES ('21', '100020', '谁谁谁谁谁谁水水水水', '2222', '222', '3333', '3', '2015-10-23 20:19:24', null, '1', null, null, null, null, null, null, null, null);
INSERT INTO `ip` VALUES ('22', '100020', '1111', '1111', '22222', '4444', '4444', '2015-10-23 20:44:24', null, '1', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `leaves`
-- ----------------------------
DROP TABLE IF EXISTS `leaves`;
CREATE TABLE `leaves` (
  `leave_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `beginDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `type` varchar(11) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `applicationDate` datetime DEFAULT NULL,
  `approvalStatus` varchar(11) DEFAULT NULL,
  `approvalDate` datetime DEFAULT NULL,
  `approval_emp_id` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`leave_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of leaves
-- ----------------------------
INSERT INTO `leaves` VALUES ('1', '100020', '2015-10-04 09:09:21', '2015-10-05 09:09:28', '1', '病假', '头疼', '2015-10-04 09:09:51', null, null, null, null);
INSERT INTO `leaves` VALUES ('4', '100020', '2015-10-06 00:00:00', '2015-10-14 00:00:00', '8', '病假', '1111', '2015-10-23 20:43:53', null, null, null, null);
INSERT INTO `leaves` VALUES ('5', '100020', '2015-10-06 00:00:00', '2015-10-14 00:00:00', '8', '事假', '111', '2015-10-23 20:45:50', null, null, null, null);

-- ----------------------------
-- Table structure for `memory`
-- ----------------------------
DROP TABLE IF EXISTS `memory`;
CREATE TABLE `memory` (
  `memory_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `space` varchar(255) DEFAULT NULL,
  `beginDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `authority` varchar(255) DEFAULT NULL,
  `requirement` varchar(255) DEFAULT NULL,
  `dept_port` int(11) DEFAULT NULL,
  `applicationDate` datetime DEFAULT NULL,
  `approval_emp_id` int(11) DEFAULT NULL,
  `approvalStatus` varchar(11) DEFAULT NULL,
  `approvalDate` datetime DEFAULT NULL,
  `assign_emp_id` int(11) DEFAULT NULL,
  `assignStatus` varchar(11) DEFAULT NULL,
  `assignDate` datetime DEFAULT NULL,
  `process_emp_id` int(11) DEFAULT NULL,
  `processStatus` varchar(11) DEFAULT NULL,
  `processDate` datetime DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`memory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of memory
-- ----------------------------
INSERT INTO `memory` VALUES ('1', '100020', '50m', '2015-10-04 09:16:38', '2015-10-05 09:16:42', '有需求', '所有', '无', '100006', '2015-10-04 09:19:50', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `memory` VALUES ('2', '10020', '50M', '2015-05-08 10:10:10', '2015-06-08 10:10:10', '有需求', '所有', '无', '100006', '2015-05-08 10:10:10', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `memory` VALUES ('3', '100020', '50M', '2015-05-08 10:10:10', '2015-06-08 10:10:10', '有需求', '所有', '无', '100006', '2015-05-08 10:10:10', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `memory` VALUES ('4', '100020', '50m', '2015-05-08 10:10:10', '2015-06-08 10:10:10', '有需求', '所有', '无', '100006', '2015-05-08 10:10:10', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `memory` VALUES ('5', '10020', '42m', '2015-05-08 10:10:10', '2015-06-08 10:10:10', 'dwadaw', 'ddd', 'wu', '100008', '2015-05-08 10:10:10', null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `menus`
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(255) DEFAULT NULL,
  `menu_url` varchar(255) DEFAULT NULL,
  `menu_pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES ('101', '申请管理', null, '0');
INSERT INTO `menus` VALUES ('102', 'IP单创建', null, '101');
INSERT INTO `menus` VALUES ('103', 'E单创建', null, '101');
INSERT INTO `menus` VALUES ('104', 'M单创建', null, '101');
INSERT INTO `menus` VALUES ('105', 'T单创建', null, '101');
INSERT INTO `menus` VALUES ('106', 'L单创建', null, '101');
INSERT INTO `menus` VALUES ('107', '查询申请', null, '0');
INSERT INTO `menus` VALUES ('108', 'IP单查询', null, '107');
INSERT INTO `menus` VALUES ('109', 'E单查询', null, '107');
INSERT INTO `menus` VALUES ('110', 'M单查询', null, '107');
INSERT INTO `menus` VALUES ('111', 'T单查询', null, '107');
INSERT INTO `menus` VALUES ('112', 'L单查询', null, '107');
INSERT INTO `menus` VALUES ('113', '审批管理', null, '0');
INSERT INTO `menus` VALUES ('114', 'IP单审批', null, '113');
INSERT INTO `menus` VALUES ('115', 'E单审批', null, '113');
INSERT INTO `menus` VALUES ('116', 'M单审批', null, '113');
INSERT INTO `menus` VALUES ('117', 'T单审批', null, '113');
INSERT INTO `menus` VALUES ('118', 'L单审批', null, '113');
INSERT INTO `menus` VALUES ('119', '分配管理', null, '0');
INSERT INTO `menus` VALUES ('120', 'IP单分配', null, '119');
INSERT INTO `menus` VALUES ('121', 'E单分配', null, '119');
INSERT INTO `menus` VALUES ('122', 'M单分配', null, '119');
INSERT INTO `menus` VALUES ('123', 'T单分配', null, '119');
INSERT INTO `menus` VALUES ('124', '处理管理', null, '0');
INSERT INTO `menus` VALUES ('125', 'IP单处理', null, '124');
INSERT INTO `menus` VALUES ('126', 'E单处理', null, '124');
INSERT INTO `menus` VALUES ('127', 'M单处理', null, '124');
INSERT INTO `menus` VALUES ('128', 'T单处理', null, '124');
INSERT INTO `menus` VALUES ('129', '个人设置', null, '0');
INSERT INTO `menus` VALUES ('130', '查询个人信息', null, '129');
INSERT INTO `menus` VALUES ('131', '修改密码', null, '129');
INSERT INTO `menus` VALUES ('132', '系统管理', null, '0');
INSERT INTO `menus` VALUES ('133', '查询用户', null, '132');
INSERT INTO `menus` VALUES ('134', '查询部门', null, '132');
INSERT INTO `menus` VALUES ('135', '权限管理', null, '132');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'user', '普通员工');
INSERT INTO `role` VALUES ('2', 'manager', '部门经理');
INSERT INTO `role` VALUES ('3', 'assigner', '分配人');
INSERT INTO `role` VALUES ('4', 'actorUser', '处理人');
INSERT INTO `role` VALUES ('5', 'admin', '管理员');
INSERT INTO `role` VALUES ('6', 'boss', '老板');

-- ----------------------------
-- Table structure for `t_emp_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_emp_role`;
CREATE TABLE `t_emp_role` (
  `emp_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`emp_id`,`role_id`),
  KEY `role_id_fk` (`role_id`),
  CONSTRAINT `emp_id_fk` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_id_fk` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_emp_role
-- ----------------------------
INSERT INTO `t_emp_role` VALUES ('100011', '1');
INSERT INTO `t_emp_role` VALUES ('100012', '1');
INSERT INTO `t_emp_role` VALUES ('100013', '1');
INSERT INTO `t_emp_role` VALUES ('100014', '1');
INSERT INTO `t_emp_role` VALUES ('100015', '1');
INSERT INTO `t_emp_role` VALUES ('100016', '1');
INSERT INTO `t_emp_role` VALUES ('100017', '1');
INSERT INTO `t_emp_role` VALUES ('100018', '1');
INSERT INTO `t_emp_role` VALUES ('100019', '1');
INSERT INTO `t_emp_role` VALUES ('100020', '1');
INSERT INTO `t_emp_role` VALUES ('100021', '1');
INSERT INTO `t_emp_role` VALUES ('100022', '1');
INSERT INTO `t_emp_role` VALUES ('100023', '1');
INSERT INTO `t_emp_role` VALUES ('100024', '1');
INSERT INTO `t_emp_role` VALUES ('100025', '1');
INSERT INTO `t_emp_role` VALUES ('100026', '1');
INSERT INTO `t_emp_role` VALUES ('100027', '1');
INSERT INTO `t_emp_role` VALUES ('100028', '1');
INSERT INTO `t_emp_role` VALUES ('100002', '2');
INSERT INTO `t_emp_role` VALUES ('100003', '2');
INSERT INTO `t_emp_role` VALUES ('100004', '2');
INSERT INTO `t_emp_role` VALUES ('100005', '2');
INSERT INTO `t_emp_role` VALUES ('100006', '2');
INSERT INTO `t_emp_role` VALUES ('100007', '2');
INSERT INTO `t_emp_role` VALUES ('100008', '2');
INSERT INTO `t_emp_role` VALUES ('100009', '2');
INSERT INTO `t_emp_role` VALUES ('100010', '2');
INSERT INTO `t_emp_role` VALUES ('100010', '3');
INSERT INTO `t_emp_role` VALUES ('100027', '4');
INSERT INTO `t_emp_role` VALUES ('100028', '4');
INSERT INTO `t_emp_role` VALUES ('100001', '5');
INSERT INTO `t_emp_role` VALUES ('100001', '6');

-- ----------------------------
-- Table structure for `t_privilege`
-- ----------------------------
DROP TABLE IF EXISTS `t_privilege`;
CREATE TABLE `t_privilege` (
  `privilege_id` int(11) NOT NULL AUTO_INCREMENT,
  `privilege_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`privilege_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_privilege
-- ----------------------------
INSERT INTO `t_privilege` VALUES ('1', '增加');
INSERT INTO `t_privilege` VALUES ('2', '删除');
INSERT INTO `t_privilege` VALUES ('3', '修改');
INSERT INTO `t_privilege` VALUES ('4', '查询');
INSERT INTO `t_privilege` VALUES ('5', '审批');
INSERT INTO `t_privilege` VALUES ('6', '分配');
INSERT INTO `t_privilege` VALUES ('7', '处理');
INSERT INTO `t_privilege` VALUES ('8', '打印');
INSERT INTO `t_privilege` VALUES ('9', '报表');

-- ----------------------------
-- Table structure for `t_role_menu_privilege`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu_privilege`;
CREATE TABLE `t_role_menu_privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `privilege_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id_fk2` (`role_id`) USING BTREE,
  KEY `menu_id_fk2` (`menu_id`) USING BTREE,
  KEY `privilage_id_fk2` (`privilege_id`) USING BTREE,
  CONSTRAINT `menu_id_fk2` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`menu_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `privilage_id_fk2` FOREIGN KEY (`privilege_id`) REFERENCES `t_privilege` (`privilege_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_id_fk2` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_menu_privilege
-- ----------------------------
INSERT INTO `t_role_menu_privilege` VALUES ('1', '1', '101', '1');
INSERT INTO `t_role_menu_privilege` VALUES ('6', '1', '107', '4');
INSERT INTO `t_role_menu_privilege` VALUES ('7', '1', '129', '4');
INSERT INTO `t_role_menu_privilege` VALUES ('8', '2', '101', '1');
INSERT INTO `t_role_menu_privilege` VALUES ('9', '2', '107', '4');
INSERT INTO `t_role_menu_privilege` VALUES ('10', '2', '113', '5');
INSERT INTO `t_role_menu_privilege` VALUES ('11', '2', '129', '4');
INSERT INTO `t_role_menu_privilege` VALUES ('14', '3', '119', '6');
INSERT INTO `t_role_menu_privilege` VALUES ('18', '4', '124', '7');
INSERT INTO `t_role_menu_privilege` VALUES ('20', '5', '132', '4');
INSERT INTO `t_role_menu_privilege` VALUES ('21', '6', '101', '1');
INSERT INTO `t_role_menu_privilege` VALUES ('22', '6', '107', '4');
INSERT INTO `t_role_menu_privilege` VALUES ('23', '6', '113', '5');
INSERT INTO `t_role_menu_privilege` VALUES ('24', '6', '119', '6');
INSERT INTO `t_role_menu_privilege` VALUES ('25', '6', '124', '7');
INSERT INTO `t_role_menu_privilege` VALUES ('26', '6', '129', '4');
INSERT INTO `t_role_menu_privilege` VALUES ('27', '6', '132', '4');

-- ----------------------------
-- Table structure for `teleconference`
-- ----------------------------
DROP TABLE IF EXISTS `teleconference`;
CREATE TABLE `teleconference` (
  `teleconference_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `meetDate` date DEFAULT NULL,
  `room` varchar(255) DEFAULT NULL,
  `beginDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `conventioner` int(11) DEFAULT NULL,
  `isDevice` varchar(11) DEFAULT NULL,
  `requirement` varchar(255) DEFAULT NULL,
  `applicationDate` datetime DEFAULT NULL,
  `telephone` int(11) DEFAULT NULL,
  `approval_emp_id` int(11) DEFAULT NULL,
  `approvalStatus` varchar(11) DEFAULT NULL,
  `approvalDate` datetime DEFAULT NULL,
  `assign_emp_id` int(11) DEFAULT NULL,
  `assignStatus` varchar(11) DEFAULT NULL,
  `assignDate` datetime DEFAULT NULL,
  `process_emp_id` int(11) DEFAULT NULL,
  `processStatus` varchar(11) DEFAULT NULL,
  `processDate` datetime DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`teleconference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teleconference
-- ----------------------------
INSERT INTO `teleconference` VALUES ('1', '100020', '2015-10-05', '506', '2015-10-05 09:00:00', '2015-10-05 15:00:00', '5', '是', '无', '2015-10-04 09:25:04', '4383388', null, null, null, null, null, null, null, null, null, null);
