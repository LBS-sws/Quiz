/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : workflowdev

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-12-19 17:04:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `wf_action`
-- ----------------------------
DROP TABLE IF EXISTS `wf_action`;
CREATE TABLE `wf_action` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `proc_ver_id` int(10) unsigned NOT NULL,
  `code` varchar(15) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lcd` timestamp NULL DEFAULT NULL,
  `lud` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wf_action
-- ----------------------------
INSERT INTO `wf_action` VALUES ('1', '1', 'APPROVE', '批准付款申请', '2017-04-08 00:43:39', '2017-04-08 00:43:39');
INSERT INTO `wf_action` VALUES ('2', '1', 'DENY', '拒绝付款申请', '2017-04-08 00:43:39', '2017-04-08 00:43:39');
INSERT INTO `wf_action` VALUES ('3', '1', 'SUBMIT', '提交付款申请', '2017-04-08 00:43:39', '2017-04-08 00:43:39');
INSERT INTO `wf_action` VALUES ('4', '1', 'CANCEL', '取消付款申请', '2017-04-08 00:43:39', '2017-04-08 00:43:39');
INSERT INTO `wf_action` VALUES ('5', '1', 'REIMBURSE', '报销单申请', '2017-04-08 00:43:39', '2017-04-08 00:43:39');
INSERT INTO `wf_action` VALUES ('6', '1', 'REIMAPPR', '报销单审批', '2017-04-08 00:43:39', '2017-04-08 00:43:39');
INSERT INTO `wf_action` VALUES ('7', '1', 'REIMCANCEL', '取消报销单申请', '2017-04-08 00:43:39', '2017-04-08 00:43:39');
INSERT INTO `wf_action` VALUES ('8', '2', 'APPROVE', '批准付款申请', '2017-05-29 12:26:18', '2017-05-29 12:26:18');
INSERT INTO `wf_action` VALUES ('9', '2', 'DENY', '拒绝付款申请', '2017-05-29 12:26:18', '2017-05-29 12:26:18');
INSERT INTO `wf_action` VALUES ('10', '2', 'SUBMIT', '提交付款申请', '2017-05-29 12:26:18', '2017-05-29 12:26:18');
INSERT INTO `wf_action` VALUES ('11', '2', 'CANCEL', '取消付款申请', '2017-05-29 12:26:18', '2017-05-29 12:26:18');
INSERT INTO `wf_action` VALUES ('12', '2', 'REIMBURSE', '报销单申请', '2017-05-29 12:26:18', '2017-05-29 12:26:18');
INSERT INTO `wf_action` VALUES ('13', '2', 'REIMAPPR', '报销单签字', '2017-05-29 12:26:18', '2017-05-29 12:26:18');
INSERT INTO `wf_action` VALUES ('14', '2', 'REIMCANCEL', '取消报销单申请', '2017-05-29 12:26:18', '2017-05-29 12:26:18');
INSERT INTO `wf_action` VALUES ('15', '2', 'REQUEST', '要求覆核付款申请', '2017-05-29 12:26:18', '2017-05-29 12:26:18');
INSERT INTO `wf_action` VALUES ('16', '2', 'CHECK', '覆核并提交付款申请', '2017-05-29 12:26:18', '2017-05-29 12:26:18');

-- ----------------------------
-- Table structure for `wf_action_task`
-- ----------------------------
DROP TABLE IF EXISTS `wf_action_task`;
CREATE TABLE `wf_action_task` (
  `action_id` int(10) unsigned NOT NULL,
  `task_id` int(10) unsigned NOT NULL,
  `seq_no` int(10) unsigned NOT NULL,
  `lcd` timestamp NULL DEFAULT NULL,
  `lud` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wf_action_task
-- ----------------------------
INSERT INTO `wf_action_task` VALUES ('1', '3', '1', '2017-05-15 01:15:17', '2017-05-15 01:15:17');
INSERT INTO `wf_action_task` VALUES ('1', '1', '2', '2017-05-15 01:15:17', '2017-05-15 01:15:17');
INSERT INTO `wf_action_task` VALUES ('1', '15', '3', '2017-05-15 01:15:17', '2017-05-15 01:15:17');
INSERT INTO `wf_action_task` VALUES ('1', '5', '4', '2017-05-15 01:15:17', '2017-05-15 01:15:17');
INSERT INTO `wf_action_task` VALUES ('1', '12', '5', '2017-05-15 01:15:17', '2017-05-15 01:15:17');
INSERT INTO `wf_action_task` VALUES ('2', '4', '1', '2017-05-15 01:15:17', '2017-05-15 01:15:17');
INSERT INTO `wf_action_task` VALUES ('2', '1', '2', '2017-05-15 01:15:17', '2017-05-15 01:15:17');
INSERT INTO `wf_action_task` VALUES ('2', '13', '3', '2017-05-15 01:15:17', '2017-05-15 01:15:17');
INSERT INTO `wf_action_task` VALUES ('2', '15', '4', '2017-05-15 01:15:17', '2017-05-15 01:15:17');
INSERT INTO `wf_action_task` VALUES ('3', '2', '1', '2017-05-15 01:15:17', '2017-05-15 01:15:17');
INSERT INTO `wf_action_task` VALUES ('3', '10', '2', '2017-05-15 01:15:17', '2017-05-15 01:15:17');
INSERT INTO `wf_action_task` VALUES ('3', '1', '3', '2017-05-15 01:15:17', '2017-05-15 01:15:17');
INSERT INTO `wf_action_task` VALUES ('4', '14', '1', '2017-05-15 01:15:17', '2017-05-15 01:15:17');
INSERT INTO `wf_action_task` VALUES ('4', '1', '2', '2017-05-15 01:15:17', '2017-05-15 01:15:17');
INSERT INTO `wf_action_task` VALUES ('4', '13', '3', '2017-05-15 01:15:17', '2017-05-15 01:15:17');
INSERT INTO `wf_action_task` VALUES ('4', '15', '4', '2017-05-15 01:15:17', '2017-05-15 01:15:17');
INSERT INTO `wf_action_task` VALUES ('5', '7', '1', '2017-05-15 01:15:17', '2017-05-15 01:15:17');
INSERT INTO `wf_action_task` VALUES ('5', '8', '2', '2017-05-15 01:15:17', '2017-05-15 01:15:17');
INSERT INTO `wf_action_task` VALUES ('5', '11', '3', '2017-05-15 01:15:17', '2017-05-15 01:15:17');
INSERT INTO `wf_action_task` VALUES ('5', '1', '4', '2017-05-15 01:15:17', '2017-05-15 01:15:17');
INSERT INTO `wf_action_task` VALUES ('5', '6', '4', '2017-05-15 01:15:17', '2017-05-15 01:15:17');
INSERT INTO `wf_action_task` VALUES ('6', '9', '1', '2017-05-15 01:15:17', '2017-05-15 01:15:17');
INSERT INTO `wf_action_task` VALUES ('6', '1', '2', '2017-05-15 01:15:17', '2017-05-15 01:15:17');
INSERT INTO `wf_action_task` VALUES ('6', '13', '3', '2017-05-15 01:15:17', '2017-05-15 01:15:17');
INSERT INTO `wf_action_task` VALUES ('7', '16', '1', '2017-05-15 01:15:17', '2017-05-15 01:15:17');
INSERT INTO `wf_action_task` VALUES ('7', '1', '2', '2017-05-15 01:15:17', '2017-05-15 01:15:17');
INSERT INTO `wf_action_task` VALUES ('7', '13', '3', '2017-05-15 01:15:17', '2017-05-15 01:15:17');
INSERT INTO `wf_action_task` VALUES ('8', '19', '1', '2017-05-29 12:28:02', '2017-05-29 12:28:02');
INSERT INTO `wf_action_task` VALUES ('8', '17', '2', '2017-05-29 12:28:02', '2017-05-29 12:28:02');
INSERT INTO `wf_action_task` VALUES ('8', '31', '3', '2017-05-29 12:28:02', '2017-05-29 12:28:02');
INSERT INTO `wf_action_task` VALUES ('8', '21', '4', '2017-05-29 12:28:02', '2017-05-29 12:28:02');
INSERT INTO `wf_action_task` VALUES ('8', '28', '5', '2017-05-29 12:28:02', '2017-05-29 12:28:02');
INSERT INTO `wf_action_task` VALUES ('9', '20', '1', '2017-05-29 12:28:02', '2017-05-29 12:28:02');
INSERT INTO `wf_action_task` VALUES ('9', '17', '2', '2017-05-29 12:28:02', '2017-05-29 12:28:02');
INSERT INTO `wf_action_task` VALUES ('9', '29', '3', '2017-05-29 12:28:02', '2017-05-29 12:28:02');
INSERT INTO `wf_action_task` VALUES ('9', '31', '4', '2017-05-29 12:28:02', '2017-05-29 12:28:02');
INSERT INTO `wf_action_task` VALUES ('10', '18', '3', '2017-05-29 12:28:02', '2017-05-29 12:28:02');
INSERT INTO `wf_action_task` VALUES ('10', '26', '4', '2017-05-29 12:28:02', '2017-05-29 12:28:02');
INSERT INTO `wf_action_task` VALUES ('10', '17', '5', '2017-05-29 12:28:02', '2017-05-29 12:28:02');
INSERT INTO `wf_action_task` VALUES ('11', '30', '1', '2017-05-29 12:28:02', '2017-05-29 12:28:02');
INSERT INTO `wf_action_task` VALUES ('11', '17', '2', '2017-05-29 12:28:02', '2017-05-29 12:28:02');
INSERT INTO `wf_action_task` VALUES ('11', '29', '3', '2017-05-29 12:28:02', '2017-05-29 12:28:02');
INSERT INTO `wf_action_task` VALUES ('11', '31', '4', '2017-05-29 12:28:02', '2017-05-29 12:28:02');
INSERT INTO `wf_action_task` VALUES ('12', '23', '1', '2017-05-29 12:28:02', '2017-05-29 12:28:02');
INSERT INTO `wf_action_task` VALUES ('12', '24', '2', '2017-05-29 12:28:02', '2017-05-29 12:28:02');
INSERT INTO `wf_action_task` VALUES ('12', '27', '3', '2017-05-29 12:28:02', '2017-05-29 12:28:02');
INSERT INTO `wf_action_task` VALUES ('12', '17', '4', '2017-05-29 12:28:02', '2017-05-29 12:28:02');
INSERT INTO `wf_action_task` VALUES ('12', '22', '4', '2017-05-29 12:28:02', '2017-05-29 12:28:02');
INSERT INTO `wf_action_task` VALUES ('13', '25', '1', '2017-05-29 12:28:02', '2017-05-29 12:28:02');
INSERT INTO `wf_action_task` VALUES ('13', '17', '2', '2017-05-29 12:28:02', '2017-05-29 12:28:02');
INSERT INTO `wf_action_task` VALUES ('13', '29', '3', '2017-05-29 12:28:02', '2017-05-29 12:28:02');
INSERT INTO `wf_action_task` VALUES ('14', '32', '1', '2017-05-29 12:28:02', '2017-05-29 12:28:02');
INSERT INTO `wf_action_task` VALUES ('14', '17', '2', '2017-05-29 12:28:02', '2017-05-29 12:28:02');
INSERT INTO `wf_action_task` VALUES ('14', '29', '3', '2017-05-29 12:28:02', '2017-05-29 12:28:02');
INSERT INTO `wf_action_task` VALUES ('15', '34', '1', '2017-05-29 12:28:02', '2017-05-29 12:28:02');
INSERT INTO `wf_action_task` VALUES ('15', '35', '2', '2017-05-29 12:28:02', '2017-05-29 12:28:02');
INSERT INTO `wf_action_task` VALUES ('16', '33', '1', '2017-05-29 12:28:02', '2017-05-29 12:28:02');
INSERT INTO `wf_action_task` VALUES ('16', '31', '2', '2017-05-29 12:28:02', '2017-05-29 12:28:02');
INSERT INTO `wf_action_task` VALUES ('16', '18', '3', '2017-05-29 12:28:02', '2017-05-29 12:28:02');
INSERT INTO `wf_action_task` VALUES ('16', '26', '4', '2017-05-29 12:28:02', '2017-05-29 12:28:02');
INSERT INTO `wf_action_task` VALUES ('16', '17', '5', '2017-05-29 12:28:02', '2017-05-29 12:28:02');

-- ----------------------------
-- Table structure for `wf_process`
-- ----------------------------
DROP TABLE IF EXISTS `wf_process`;
CREATE TABLE `wf_process` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(15) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lcd` timestamp NULL DEFAULT NULL,
  `lud` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wf_process
-- ----------------------------
INSERT INTO `wf_process` VALUES ('1', 'PAYMENT', 'Payment Approval Process', '2017-03-31 09:51:02', '2017-03-31 09:51:02');

-- ----------------------------
-- Table structure for `wf_process_version`
-- ----------------------------
DROP TABLE IF EXISTS `wf_process_version`;
CREATE TABLE `wf_process_version` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `process_id` int(10) unsigned NOT NULL,
  `start_dt` datetime NOT NULL,
  `end_dt` datetime NOT NULL,
  `lcd` timestamp NULL DEFAULT NULL,
  `lud` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wf_process_version
-- ----------------------------
INSERT INTO `wf_process_version` VALUES ('1', '1', '2016-01-01 00:00:00', '2017-05-26 00:00:00', '2017-05-28 18:03:44', '2017-05-28 18:03:44');
INSERT INTO `wf_process_version` VALUES ('2', '1', '2017-05-27 00:00:00', '2099-12-31 00:00:00', '2017-05-28 18:03:44', '2017-05-28 18:03:44');

-- ----------------------------
-- Table structure for `wf_request`
-- ----------------------------
DROP TABLE IF EXISTS `wf_request`;
CREATE TABLE `wf_request` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `proc_ver_id` int(10) unsigned NOT NULL,
  `current_state` int(10) unsigned NOT NULL,
  `doc_id` int(10) unsigned NOT NULL,
  `lcd` timestamp NULL DEFAULT NULL,
  `lud` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wf_request
-- ----------------------------
INSERT INTO `wf_request` VALUES ('1', '1', '2', '1', '2017-04-09 10:39:12', '2017-04-09 10:41:08');
INSERT INTO `wf_request` VALUES ('2', '1', '2', '2', '2017-04-11 10:56:01', '2017-05-11 10:16:50');
INSERT INTO `wf_request` VALUES ('3', '1', '2', '3', '2017-04-27 17:47:06', '2017-05-11 10:14:49');
INSERT INTO `wf_request` VALUES ('4', '1', '2', '12', '2017-05-04 17:38:24', '2017-05-05 01:45:15');
INSERT INTO `wf_request` VALUES ('6', '1', '2', '13', '2017-05-13 23:49:12', '2017-05-15 00:49:16');
INSERT INTO `wf_request` VALUES ('7', '1', '4', '5', '2017-05-14 22:22:26', '2017-05-18 13:06:02');
INSERT INTO `wf_request` VALUES ('10', '1', '2', '6', '2017-05-14 23:36:47', '2017-05-15 01:18:35');
INSERT INTO `wf_request` VALUES ('11', '1', '2', '7', '2017-05-14 23:44:34', '2017-05-15 00:33:17');
INSERT INTO `wf_request` VALUES ('12', '1', '5', '4', '2017-05-14 23:49:29', '2017-05-17 12:26:32');
INSERT INTO `wf_request` VALUES ('13', '1', '2', '10', '2017-05-14 23:50:31', '2017-05-15 00:27:50');
INSERT INTO `wf_request` VALUES ('14', '1', '5', '14', '2017-05-17 12:29:24', '2017-05-17 12:30:47');
INSERT INTO `wf_request` VALUES ('15', '1', '5', '15', '2017-05-19 02:56:12', '2017-05-19 09:41:25');

-- ----------------------------
-- Table structure for `wf_request_data`
-- ----------------------------
DROP TABLE IF EXISTS `wf_request_data`;
CREATE TABLE `wf_request_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `request_id` int(10) unsigned NOT NULL,
  `data_name` varchar(100) NOT NULL,
  `data_value` varchar(5000) DEFAULT NULL,
  `lcd` timestamp NULL DEFAULT NULL,
  `lud` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `request` (`request_id`,`data_name`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wf_request_data
-- ----------------------------
INSERT INTO `wf_request_data` VALUES ('1', '1', 'CITY', 'SH', '2017-04-09 10:39:12', '2017-04-09 10:39:12');
INSERT INTO `wf_request_data` VALUES ('2', '1', 'REQ_USER', 'test', '2017-04-09 10:39:12', '2017-04-09 10:39:12');
INSERT INTO `wf_request_data` VALUES ('3', '1', 'REF_NO', 'SH20170409103912', '2017-04-09 10:39:12', '2017-04-09 10:39:12');
INSERT INTO `wf_request_data` VALUES ('4', '1', 'AMOUNT', '800', '2017-04-09 10:39:12', '2017-04-09 10:39:12');
INSERT INTO `wf_request_data` VALUES ('5', '2', 'CITY', 'SH', '2017-04-11 10:56:01', '2017-04-11 10:56:01');
INSERT INTO `wf_request_data` VALUES ('6', '2', 'REQ_USER', 'test', '2017-04-11 10:56:01', '2017-04-11 10:56:01');
INSERT INTO `wf_request_data` VALUES ('7', '2', 'REF_NO', 'SH20170411105601', '2017-04-11 10:56:01', '2017-04-11 10:56:01');
INSERT INTO `wf_request_data` VALUES ('8', '2', 'AMOUNT', '500', '2017-04-11 10:56:01', '2017-04-11 10:56:01');
INSERT INTO `wf_request_data` VALUES ('9', '3', 'CITY', 'SH', '2017-04-27 17:47:06', '2017-04-27 17:47:06');
INSERT INTO `wf_request_data` VALUES ('10', '3', 'REQ_USER', 'test', '2017-04-27 17:47:06', '2017-04-27 17:47:06');
INSERT INTO `wf_request_data` VALUES ('11', '3', 'REF_NO', 'SH20170427174706', '2017-04-27 17:47:06', '2017-04-27 17:47:06');
INSERT INTO `wf_request_data` VALUES ('12', '3', 'AMOUNT', '1000', '2017-04-27 17:47:06', '2017-04-27 17:47:06');
INSERT INTO `wf_request_data` VALUES ('13', '3', 'APPROVER', 'director1', '2017-04-27 18:36:55', '2017-04-27 18:36:55');
INSERT INTO `wf_request_data` VALUES ('14', '4', 'CITY', 'SH', '2017-05-04 17:38:24', '2017-05-04 17:38:24');
INSERT INTO `wf_request_data` VALUES ('15', '4', 'REQ_USER', 'test', '2017-05-04 17:38:24', '2017-05-04 17:38:24');
INSERT INTO `wf_request_data` VALUES ('16', '4', 'REF_NO', 'SH20170504173824', '2017-05-04 17:38:24', '2017-05-04 17:38:24');
INSERT INTO `wf_request_data` VALUES ('17', '4', 'AMOUNT', '1000', '2017-05-04 17:38:24', '2017-05-04 17:38:24');
INSERT INTO `wf_request_data` VALUES ('18', '4', 'APPROVER', 'manager', '2017-05-04 17:42:47', '2017-05-04 17:42:47');
INSERT INTO `wf_request_data` VALUES ('19', '2', 'APPROVER', 'manager1', '2017-05-11 10:16:00', '2017-05-11 10:16:00');
INSERT INTO `wf_request_data` VALUES ('20', '6', 'CITY', 'SH', '2017-05-13 23:49:12', '2017-05-13 23:49:12');
INSERT INTO `wf_request_data` VALUES ('21', '6', 'REQ_USER', 'test', '2017-05-13 23:49:12', '2017-05-13 23:49:12');
INSERT INTO `wf_request_data` VALUES ('22', '6', 'REF_NO', 'SH20170513234912', '2017-05-13 23:49:12', '2017-05-13 23:49:12');
INSERT INTO `wf_request_data` VALUES ('23', '6', 'AMOUNT', '800.00', '2017-05-13 23:49:12', '2017-05-13 23:49:12');
INSERT INTO `wf_request_data` VALUES ('24', '7', 'CITY', 'SH', '2017-05-14 22:22:26', '2017-05-14 22:22:26');
INSERT INTO `wf_request_data` VALUES ('25', '7', 'REQ_USER', 'test', '2017-05-14 22:22:26', '2017-05-14 22:22:26');
INSERT INTO `wf_request_data` VALUES ('26', '7', 'REF_NO', 'SH20170514222226', '2017-05-14 22:22:26', '2017-05-14 22:22:26');
INSERT INTO `wf_request_data` VALUES ('27', '7', 'AMOUNT', '100.00', '2017-05-14 22:22:26', '2017-05-14 22:22:26');
INSERT INTO `wf_request_data` VALUES ('36', '10', 'CITY', 'SH', '2017-05-14 23:36:47', '2017-05-14 23:36:47');
INSERT INTO `wf_request_data` VALUES ('37', '10', 'REQ_USER', 'test', '2017-05-14 23:36:47', '2017-05-14 23:36:47');
INSERT INTO `wf_request_data` VALUES ('38', '10', 'REF_NO', 'SH20170514233647', '2017-05-14 23:36:47', '2017-05-14 23:36:47');
INSERT INTO `wf_request_data` VALUES ('39', '10', 'AMOUNT', '100.00', '2017-05-14 23:36:47', '2017-05-14 23:36:47');
INSERT INTO `wf_request_data` VALUES ('40', '11', 'CITY', 'SH', '2017-05-14 23:44:34', '2017-05-14 23:44:34');
INSERT INTO `wf_request_data` VALUES ('41', '11', 'REQ_USER', 'test', '2017-05-14 23:44:34', '2017-05-14 23:44:34');
INSERT INTO `wf_request_data` VALUES ('42', '11', 'REF_NO', 'SH20170514234434', '2017-05-14 23:44:34', '2017-05-14 23:44:34');
INSERT INTO `wf_request_data` VALUES ('43', '11', 'AMOUNT', '100.00', '2017-05-14 23:44:34', '2017-05-14 23:44:34');
INSERT INTO `wf_request_data` VALUES ('44', '12', 'CITY', 'SH', '2017-05-14 23:49:29', '2017-05-14 23:49:29');
INSERT INTO `wf_request_data` VALUES ('45', '12', 'REQ_USER', 'test', '2017-05-14 23:49:29', '2017-05-14 23:49:29');
INSERT INTO `wf_request_data` VALUES ('46', '12', 'REF_NO', 'SH20170514234929', '2017-05-14 23:49:29', '2017-05-14 23:49:29');
INSERT INTO `wf_request_data` VALUES ('47', '12', 'AMOUNT', '100.00', '2017-05-14 23:49:29', '2017-05-14 23:49:29');
INSERT INTO `wf_request_data` VALUES ('48', '13', 'CITY', 'SH', '2017-05-14 23:50:31', '2017-05-14 23:50:31');
INSERT INTO `wf_request_data` VALUES ('49', '13', 'REQ_USER', 'test', '2017-05-14 23:50:31', '2017-05-14 23:50:31');
INSERT INTO `wf_request_data` VALUES ('50', '13', 'REF_NO', 'SH20170514235031', '2017-05-14 23:50:31', '2017-05-14 23:50:31');
INSERT INTO `wf_request_data` VALUES ('51', '13', 'AMOUNT', '200.00', '2017-05-14 23:50:31', '2017-05-14 23:50:31');
INSERT INTO `wf_request_data` VALUES ('55', '13', 'APPROVER', 'manager', '2017-05-15 00:00:09', '2017-05-15 00:00:09');
INSERT INTO `wf_request_data` VALUES ('56', '12', 'APPROVER', 'manager1', '2017-05-17 12:25:29', '2017-05-17 12:25:29');
INSERT INTO `wf_request_data` VALUES ('57', '14', 'CITY', 'SH', '2017-05-17 12:29:24', '2017-05-17 12:29:24');
INSERT INTO `wf_request_data` VALUES ('58', '14', 'REQ_USER', 'test', '2017-05-17 12:29:24', '2017-05-17 12:29:24');
INSERT INTO `wf_request_data` VALUES ('59', '14', 'REF_NO', 'SH20170517122924', '2017-05-17 12:29:24', '2017-05-17 12:29:24');
INSERT INTO `wf_request_data` VALUES ('60', '14', 'AMOUNT', '500', '2017-05-17 12:29:24', '2017-05-17 12:29:24');
INSERT INTO `wf_request_data` VALUES ('61', '14', 'APPROVER', 'manager1', '2017-05-17 12:30:01', '2017-05-17 12:30:01');
INSERT INTO `wf_request_data` VALUES ('62', '7', 'APPROVER', 'manager', '2017-05-18 13:06:02', '2017-05-18 13:06:02');
INSERT INTO `wf_request_data` VALUES ('63', '15', 'CITY', 'SH', '2017-05-19 02:56:12', '2017-05-19 02:56:12');
INSERT INTO `wf_request_data` VALUES ('64', '15', 'REQ_USER', 'test', '2017-05-19 02:56:12', '2017-05-19 02:56:12');
INSERT INTO `wf_request_data` VALUES ('65', '15', 'REF_NO', 'SH20170519025612', '2017-05-19 02:56:12', '2017-05-19 02:56:12');
INSERT INTO `wf_request_data` VALUES ('66', '15', 'AMOUNT', '1000', '2017-05-19 02:56:12', '2017-05-19 02:56:12');
INSERT INTO `wf_request_data` VALUES ('67', '15', 'APPROVER', 'manager', '2017-05-19 02:56:45', '2017-05-19 02:56:45');

-- ----------------------------
-- Table structure for `wf_request_resp_user`
-- ----------------------------
DROP TABLE IF EXISTS `wf_request_resp_user`;
CREATE TABLE `wf_request_resp_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `request_id` int(10) unsigned NOT NULL,
  `log_id` int(10) unsigned NOT NULL,
  `current_state` int(10) unsigned NOT NULL,
  `username` varchar(30) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'P',
  `action_id` int(10) unsigned DEFAULT '0',
  `lcd` timestamp NULL DEFAULT NULL,
  `lud` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wf_request_resp_user
-- ----------------------------
INSERT INTO `wf_request_resp_user` VALUES ('1', '1', '1', '3', 'manager', 'C', '1', '2017-04-09 10:39:12', '2017-04-09 10:40:10');
INSERT INTO `wf_request_resp_user` VALUES ('2', '1', '1', '3', 'manager1', 'T', '0', '2017-04-09 10:39:12', '2017-04-09 10:40:10');
INSERT INTO `wf_request_resp_user` VALUES ('3', '1', '3', '4', 'test', 'C', '5', '2017-04-09 10:40:10', '2017-04-09 10:40:45');
INSERT INTO `wf_request_resp_user` VALUES ('4', '1', '5', '5', 'boss', 'C', '6', '2017-04-09 10:40:45', '2017-04-09 10:41:08');
INSERT INTO `wf_request_resp_user` VALUES ('5', '2', '8', '3', 'manager1', 'C', '1', '2017-04-11 10:56:01', '2017-05-11 10:16:00');
INSERT INTO `wf_request_resp_user` VALUES ('6', '2', '8', '3', '', 'T', '0', '2017-04-11 10:56:01', '2017-05-11 10:16:00');
INSERT INTO `wf_request_resp_user` VALUES ('7', '3', '9', '3', 'boss', 'T', '0', '2017-04-27 17:47:06', '2017-04-27 18:36:56');
INSERT INTO `wf_request_resp_user` VALUES ('8', '3', '9', '3', 'director', 'T', '0', '2017-04-27 17:47:06', '2017-04-27 18:36:56');
INSERT INTO `wf_request_resp_user` VALUES ('9', '3', '9', '3', 'director1', 'C', '1', '2017-04-27 17:47:06', '2017-04-27 18:36:55');
INSERT INTO `wf_request_resp_user` VALUES ('10', '3', '9', '3', 'manager', 'T', '0', '2017-04-27 17:47:06', '2017-04-27 18:36:56');
INSERT INTO `wf_request_resp_user` VALUES ('11', '3', '11', '4', 'test', 'C', '5', '2017-04-27 18:36:56', '2017-05-02 18:20:38');
INSERT INTO `wf_request_resp_user` VALUES ('12', '3', '13', '5', 'director1', 'C', '6', '2017-05-02 18:20:38', '2017-05-11 10:14:49');
INSERT INTO `wf_request_resp_user` VALUES ('13', '4', '14', '3', 'boss', 'T', '0', '2017-05-04 17:38:24', '2017-05-04 17:42:47');
INSERT INTO `wf_request_resp_user` VALUES ('14', '4', '14', '3', 'director', 'T', '0', '2017-05-04 17:38:24', '2017-05-04 17:42:47');
INSERT INTO `wf_request_resp_user` VALUES ('15', '4', '14', '3', 'director1', 'T', '0', '2017-05-04 17:38:24', '2017-05-04 17:42:47');
INSERT INTO `wf_request_resp_user` VALUES ('16', '4', '14', '3', 'manager', 'C', '1', '2017-05-04 17:38:24', '2017-05-04 17:42:47');
INSERT INTO `wf_request_resp_user` VALUES ('17', '4', '16', '4', 'test', 'C', '5', '2017-05-04 17:42:47', '2017-05-04 18:51:54');
INSERT INTO `wf_request_resp_user` VALUES ('18', '4', '18', '5', 'manager', 'C', '6', '2017-05-04 18:51:54', '2017-05-05 01:45:15');
INSERT INTO `wf_request_resp_user` VALUES ('19', '2', '24', '4', 'test', 'C', '5', '2017-05-11 10:16:00', '2017-05-11 10:16:34');
INSERT INTO `wf_request_resp_user` VALUES ('20', '2', '26', '5', 'manager1', 'C', '6', '2017-05-11 10:16:34', '2017-05-11 10:16:50');
INSERT INTO `wf_request_resp_user` VALUES ('21', '6', '29', '3', 'boss', 'Q', '0', '2017-05-13 23:49:12', '2017-05-13 23:49:12');
INSERT INTO `wf_request_resp_user` VALUES ('22', '6', '29', '3', 'director', 'Q', '0', '2017-05-13 23:49:12', '2017-05-13 23:49:12');
INSERT INTO `wf_request_resp_user` VALUES ('23', '6', '29', '3', 'director1', 'Q', '0', '2017-05-13 23:49:12', '2017-05-13 23:49:12');
INSERT INTO `wf_request_resp_user` VALUES ('24', '6', '29', '3', 'manager', 'C', '2', '2017-05-13 23:49:12', '2017-05-15 00:49:16');
INSERT INTO `wf_request_resp_user` VALUES ('25', '7', '30', '3', 'boss', 'T', '0', '2017-05-14 22:22:26', '2017-05-18 13:06:02');
INSERT INTO `wf_request_resp_user` VALUES ('26', '7', '30', '3', 'director', 'T', '0', '2017-05-14 22:22:26', '2017-05-18 13:06:02');
INSERT INTO `wf_request_resp_user` VALUES ('27', '7', '30', '3', 'director1', 'T', '0', '2017-05-14 22:22:26', '2017-05-18 13:06:02');
INSERT INTO `wf_request_resp_user` VALUES ('28', '7', '30', '3', 'manager', 'C', '1', '2017-05-14 22:22:26', '2017-05-18 13:06:02');
INSERT INTO `wf_request_resp_user` VALUES ('29', '7', '30', '3', 'manager1', 'T', '0', '2017-05-14 22:22:26', '2017-05-18 13:06:02');
INSERT INTO `wf_request_resp_user` VALUES ('30', '7', '30', '3', '', 'T', '0', '2017-05-14 22:22:26', '2017-05-18 13:06:02');
INSERT INTO `wf_request_resp_user` VALUES ('41', '10', '33', '3', 'boss', 'T', '0', '2017-05-14 23:36:47', '2017-05-15 01:18:35');
INSERT INTO `wf_request_resp_user` VALUES ('42', '10', '33', '3', 'director', 'T', '0', '2017-05-14 23:36:47', '2017-05-15 01:18:35');
INSERT INTO `wf_request_resp_user` VALUES ('43', '10', '33', '3', 'director1', 'T', '0', '2017-05-14 23:36:47', '2017-05-15 01:18:35');
INSERT INTO `wf_request_resp_user` VALUES ('44', '10', '33', '3', 'manager', 'C', '2', '2017-05-14 23:36:47', '2017-05-15 01:18:35');
INSERT INTO `wf_request_resp_user` VALUES ('45', '10', '33', '3', 'manager1', 'T', '0', '2017-05-14 23:36:47', '2017-05-15 01:18:35');
INSERT INTO `wf_request_resp_user` VALUES ('46', '11', '34', '3', 'boss', 'T', '0', '2017-05-14 23:44:34', '2017-05-15 01:15:54');
INSERT INTO `wf_request_resp_user` VALUES ('47', '11', '34', '3', 'director', 'T', '0', '2017-05-14 23:44:34', '2017-05-15 01:15:54');
INSERT INTO `wf_request_resp_user` VALUES ('48', '11', '34', '3', 'director1', 'T', '0', '2017-05-14 23:44:34', '2017-05-15 01:15:54');
INSERT INTO `wf_request_resp_user` VALUES ('49', '11', '34', '3', 'manager', 'T', '0', '2017-05-14 23:44:34', '2017-05-15 01:15:54');
INSERT INTO `wf_request_resp_user` VALUES ('50', '11', '34', '3', 'manager1', 'C', '2', '2017-05-14 23:44:34', '2017-05-15 00:33:17');
INSERT INTO `wf_request_resp_user` VALUES ('51', '12', '35', '3', 'boss', 'T', '0', '2017-05-14 23:49:29', '2017-05-17 12:25:29');
INSERT INTO `wf_request_resp_user` VALUES ('52', '12', '35', '3', 'director', 'T', '0', '2017-05-14 23:49:29', '2017-05-17 12:25:29');
INSERT INTO `wf_request_resp_user` VALUES ('53', '12', '35', '3', 'director1', 'T', '0', '2017-05-14 23:49:29', '2017-05-17 12:25:29');
INSERT INTO `wf_request_resp_user` VALUES ('54', '12', '35', '3', 'manager', 'T', '0', '2017-05-14 23:49:29', '2017-05-17 12:25:29');
INSERT INTO `wf_request_resp_user` VALUES ('55', '12', '35', '3', 'manager1', 'C', '1', '2017-05-14 23:49:29', '2017-05-17 12:25:29');
INSERT INTO `wf_request_resp_user` VALUES ('56', '13', '36', '3', 'boss', 'T', '0', '2017-05-14 23:50:31', '2017-05-15 00:00:09');
INSERT INTO `wf_request_resp_user` VALUES ('57', '13', '36', '3', 'director', 'T', '0', '2017-05-14 23:50:31', '2017-05-15 00:00:09');
INSERT INTO `wf_request_resp_user` VALUES ('58', '13', '36', '3', 'director1', 'T', '0', '2017-05-14 23:50:31', '2017-05-15 00:00:09');
INSERT INTO `wf_request_resp_user` VALUES ('59', '13', '36', '3', 'manager', 'C', '1', '2017-05-14 23:50:31', '2017-05-15 00:00:09');
INSERT INTO `wf_request_resp_user` VALUES ('60', '13', '36', '3', 'manager1', 'T', '0', '2017-05-14 23:50:31', '2017-05-15 00:00:09');
INSERT INTO `wf_request_resp_user` VALUES ('61', '13', '41', '4', 'test', 'C', '5', '2017-05-15 00:00:09', '2017-05-15 00:03:22');
INSERT INTO `wf_request_resp_user` VALUES ('62', '13', '43', '5', 'manager', 'C', '6', '2017-05-15 00:03:22', '2017-05-15 00:27:50');
INSERT INTO `wf_request_resp_user` VALUES ('63', '12', '55', '4', 'test', 'C', '5', '2017-05-17 12:25:29', '2017-05-17 12:26:32');
INSERT INTO `wf_request_resp_user` VALUES ('64', '12', '57', '5', 'manager1', 'P', '0', '2017-05-17 12:26:32', '2017-05-17 12:26:32');
INSERT INTO `wf_request_resp_user` VALUES ('65', '14', '58', '3', 'boss', 'T', '0', '2017-05-17 12:29:24', '2017-05-17 12:30:01');
INSERT INTO `wf_request_resp_user` VALUES ('66', '14', '58', '3', 'director', 'T', '0', '2017-05-17 12:29:24', '2017-05-17 12:30:01');
INSERT INTO `wf_request_resp_user` VALUES ('67', '14', '58', '3', 'director1', 'T', '0', '2017-05-17 12:29:24', '2017-05-17 12:30:01');
INSERT INTO `wf_request_resp_user` VALUES ('68', '14', '58', '3', 'manager', 'T', '0', '2017-05-17 12:29:24', '2017-05-17 12:30:01');
INSERT INTO `wf_request_resp_user` VALUES ('69', '14', '58', '3', 'manager1', 'C', '1', '2017-05-17 12:29:24', '2017-05-17 12:30:01');
INSERT INTO `wf_request_resp_user` VALUES ('70', '14', '60', '4', 'test', 'C', '5', '2017-05-17 12:30:01', '2017-05-17 12:30:47');
INSERT INTO `wf_request_resp_user` VALUES ('71', '14', '62', '5', 'manager1', 'P', '0', '2017-05-17 12:30:47', '2017-05-17 12:30:47');
INSERT INTO `wf_request_resp_user` VALUES ('72', '7', '64', '4', 'test', 'P', '0', '2017-05-18 13:06:02', '2017-05-18 13:06:02');
INSERT INTO `wf_request_resp_user` VALUES ('73', '15', '65', '3', 'boss', 'T', '0', '2017-05-19 02:56:12', '2017-05-19 02:56:45');
INSERT INTO `wf_request_resp_user` VALUES ('74', '15', '65', '3', 'director', 'T', '0', '2017-05-19 02:56:12', '2017-05-19 02:56:45');
INSERT INTO `wf_request_resp_user` VALUES ('75', '15', '65', '3', 'director1', 'T', '0', '2017-05-19 02:56:12', '2017-05-19 02:56:45');
INSERT INTO `wf_request_resp_user` VALUES ('76', '15', '65', '3', 'manager', 'C', '1', '2017-05-19 02:56:12', '2017-05-19 02:56:45');
INSERT INTO `wf_request_resp_user` VALUES ('77', '15', '67', '4', 'test', 'C', '5', '2017-05-19 02:56:45', '2017-05-19 09:41:25');
INSERT INTO `wf_request_resp_user` VALUES ('78', '15', '69', '5', 'manager', 'P', '0', '2017-05-19 09:41:25', '2017-05-19 09:41:25');

-- ----------------------------
-- Table structure for `wf_request_transit_log`
-- ----------------------------
DROP TABLE IF EXISTS `wf_request_transit_log`;
CREATE TABLE `wf_request_transit_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `request_id` int(10) unsigned NOT NULL,
  `old_state` int(10) unsigned NOT NULL,
  `new_state` int(10) unsigned NOT NULL,
  `lcd` timestamp NULL DEFAULT NULL,
  `lud` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wf_request_transit_log
-- ----------------------------
INSERT INTO `wf_request_transit_log` VALUES ('1', '1', '1', '3', '2017-04-09 10:39:12', '2017-04-09 10:39:12');
INSERT INTO `wf_request_transit_log` VALUES ('2', '1', '3', '6', '2017-04-09 10:40:10', '2017-04-09 10:40:10');
INSERT INTO `wf_request_transit_log` VALUES ('3', '1', '6', '4', '2017-04-09 10:40:10', '2017-04-09 10:40:10');
INSERT INTO `wf_request_transit_log` VALUES ('4', '1', '4', '9', '2017-04-09 10:40:45', '2017-04-09 10:40:45');
INSERT INTO `wf_request_transit_log` VALUES ('5', '1', '9', '5', '2017-04-09 10:40:45', '2017-04-09 10:40:45');
INSERT INTO `wf_request_transit_log` VALUES ('6', '1', '5', '10', '2017-04-09 10:41:08', '2017-04-09 10:41:08');
INSERT INTO `wf_request_transit_log` VALUES ('7', '1', '10', '2', '2017-04-09 10:41:08', '2017-04-09 10:41:08');
INSERT INTO `wf_request_transit_log` VALUES ('8', '2', '1', '3', '2017-04-11 10:56:01', '2017-04-11 10:56:01');
INSERT INTO `wf_request_transit_log` VALUES ('9', '3', '1', '3', '2017-04-27 17:47:06', '2017-04-27 17:47:06');
INSERT INTO `wf_request_transit_log` VALUES ('10', '3', '3', '6', '2017-04-27 18:36:55', '2017-04-27 18:36:55');
INSERT INTO `wf_request_transit_log` VALUES ('11', '3', '6', '4', '2017-04-27 18:36:56', '2017-04-27 18:36:56');
INSERT INTO `wf_request_transit_log` VALUES ('12', '3', '4', '9', '2017-05-02 18:20:38', '2017-05-02 18:20:38');
INSERT INTO `wf_request_transit_log` VALUES ('13', '3', '9', '5', '2017-05-02 18:20:38', '2017-05-02 18:20:38');
INSERT INTO `wf_request_transit_log` VALUES ('14', '4', '1', '3', '2017-05-04 17:38:24', '2017-05-04 17:38:24');
INSERT INTO `wf_request_transit_log` VALUES ('15', '4', '3', '6', '2017-05-04 17:42:47', '2017-05-04 17:42:47');
INSERT INTO `wf_request_transit_log` VALUES ('16', '4', '6', '4', '2017-05-04 17:42:47', '2017-05-04 17:42:47');
INSERT INTO `wf_request_transit_log` VALUES ('17', '4', '4', '9', '2017-05-04 18:51:54', '2017-05-04 18:51:54');
INSERT INTO `wf_request_transit_log` VALUES ('18', '4', '9', '5', '2017-05-04 18:51:54', '2017-05-04 18:51:54');
INSERT INTO `wf_request_transit_log` VALUES ('19', '4', '5', '10', '2017-05-05 01:45:15', '2017-05-05 01:45:15');
INSERT INTO `wf_request_transit_log` VALUES ('20', '4', '10', '2', '2017-05-05 01:45:15', '2017-05-05 01:45:15');
INSERT INTO `wf_request_transit_log` VALUES ('21', '3', '5', '10', '2017-05-11 10:14:49', '2017-05-11 10:14:49');
INSERT INTO `wf_request_transit_log` VALUES ('22', '3', '10', '2', '2017-05-11 10:14:49', '2017-05-11 10:14:49');
INSERT INTO `wf_request_transit_log` VALUES ('23', '2', '3', '6', '2017-05-11 10:16:00', '2017-05-11 10:16:00');
INSERT INTO `wf_request_transit_log` VALUES ('24', '2', '6', '4', '2017-05-11 10:16:00', '2017-05-11 10:16:00');
INSERT INTO `wf_request_transit_log` VALUES ('25', '2', '4', '9', '2017-05-11 10:16:34', '2017-05-11 10:16:34');
INSERT INTO `wf_request_transit_log` VALUES ('26', '2', '9', '5', '2017-05-11 10:16:34', '2017-05-11 10:16:34');
INSERT INTO `wf_request_transit_log` VALUES ('27', '2', '5', '10', '2017-05-11 10:16:50', '2017-05-11 10:16:50');
INSERT INTO `wf_request_transit_log` VALUES ('28', '2', '10', '2', '2017-05-11 10:16:50', '2017-05-11 10:16:50');
INSERT INTO `wf_request_transit_log` VALUES ('29', '6', '1', '3', '2017-05-13 23:49:12', '2017-05-13 23:49:12');
INSERT INTO `wf_request_transit_log` VALUES ('30', '7', '1', '3', '2017-05-14 22:22:26', '2017-05-14 22:22:26');
INSERT INTO `wf_request_transit_log` VALUES ('33', '10', '1', '3', '2017-05-14 23:36:47', '2017-05-14 23:36:47');
INSERT INTO `wf_request_transit_log` VALUES ('34', '11', '1', '3', '2017-05-14 23:44:34', '2017-05-14 23:44:34');
INSERT INTO `wf_request_transit_log` VALUES ('35', '12', '1', '3', '2017-05-14 23:49:29', '2017-05-14 23:49:29');
INSERT INTO `wf_request_transit_log` VALUES ('36', '13', '1', '3', '2017-05-14 23:50:31', '2017-05-14 23:50:31');
INSERT INTO `wf_request_transit_log` VALUES ('40', '13', '3', '6', '2017-05-15 00:00:09', '2017-05-15 00:00:09');
INSERT INTO `wf_request_transit_log` VALUES ('41', '13', '6', '4', '2017-05-15 00:00:09', '2017-05-15 00:00:09');
INSERT INTO `wf_request_transit_log` VALUES ('42', '13', '4', '9', '2017-05-15 00:03:22', '2017-05-15 00:03:22');
INSERT INTO `wf_request_transit_log` VALUES ('43', '13', '9', '5', '2017-05-15 00:03:22', '2017-05-15 00:03:22');
INSERT INTO `wf_request_transit_log` VALUES ('44', '13', '5', '10', '2017-05-15 00:27:50', '2017-05-15 00:27:50');
INSERT INTO `wf_request_transit_log` VALUES ('45', '13', '10', '2', '2017-05-15 00:27:50', '2017-05-15 00:27:50');
INSERT INTO `wf_request_transit_log` VALUES ('46', '11', '3', '7', '2017-05-15 00:33:17', '2017-05-15 00:33:17');
INSERT INTO `wf_request_transit_log` VALUES ('47', '11', '7', '2', '2017-05-15 00:33:17', '2017-05-15 00:33:17');
INSERT INTO `wf_request_transit_log` VALUES ('48', '6', '3', '7', '2017-05-15 00:49:16', '2017-05-15 00:49:16');
INSERT INTO `wf_request_transit_log` VALUES ('49', '6', '7', '2', '2017-05-15 00:49:16', '2017-05-15 00:49:16');
INSERT INTO `wf_request_transit_log` VALUES ('52', '10', '3', '7', '2017-05-15 01:18:35', '2017-05-15 01:18:35');
INSERT INTO `wf_request_transit_log` VALUES ('53', '10', '7', '2', '2017-05-15 01:18:35', '2017-05-15 01:18:35');
INSERT INTO `wf_request_transit_log` VALUES ('54', '12', '3', '6', '2017-05-17 12:25:29', '2017-05-17 12:25:29');
INSERT INTO `wf_request_transit_log` VALUES ('55', '12', '6', '4', '2017-05-17 12:25:29', '2017-05-17 12:25:29');
INSERT INTO `wf_request_transit_log` VALUES ('56', '12', '4', '9', '2017-05-17 12:26:32', '2017-05-17 12:26:32');
INSERT INTO `wf_request_transit_log` VALUES ('57', '12', '9', '5', '2017-05-17 12:26:32', '2017-05-17 12:26:32');
INSERT INTO `wf_request_transit_log` VALUES ('58', '14', '1', '3', '2017-05-17 12:29:24', '2017-05-17 12:29:24');
INSERT INTO `wf_request_transit_log` VALUES ('59', '14', '3', '6', '2017-05-17 12:30:01', '2017-05-17 12:30:01');
INSERT INTO `wf_request_transit_log` VALUES ('60', '14', '6', '4', '2017-05-17 12:30:01', '2017-05-17 12:30:01');
INSERT INTO `wf_request_transit_log` VALUES ('61', '14', '4', '9', '2017-05-17 12:30:47', '2017-05-17 12:30:47');
INSERT INTO `wf_request_transit_log` VALUES ('62', '14', '9', '5', '2017-05-17 12:30:47', '2017-05-17 12:30:47');
INSERT INTO `wf_request_transit_log` VALUES ('63', '7', '3', '6', '2017-05-18 13:06:02', '2017-05-18 13:06:02');
INSERT INTO `wf_request_transit_log` VALUES ('64', '7', '6', '4', '2017-05-18 13:06:02', '2017-05-18 13:06:02');
INSERT INTO `wf_request_transit_log` VALUES ('65', '15', '1', '3', '2017-05-19 02:56:12', '2017-05-19 02:56:12');
INSERT INTO `wf_request_transit_log` VALUES ('66', '15', '3', '6', '2017-05-19 02:56:45', '2017-05-19 02:56:45');
INSERT INTO `wf_request_transit_log` VALUES ('67', '15', '6', '4', '2017-05-19 02:56:45', '2017-05-19 02:56:45');
INSERT INTO `wf_request_transit_log` VALUES ('68', '15', '4', '9', '2017-05-19 09:41:25', '2017-05-19 09:41:25');
INSERT INTO `wf_request_transit_log` VALUES ('69', '15', '9', '5', '2017-05-19 09:41:25', '2017-05-19 09:41:25');

-- ----------------------------
-- Table structure for `wf_state`
-- ----------------------------
DROP TABLE IF EXISTS `wf_state`;
CREATE TABLE `wf_state` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `proc_ver_id` int(10) unsigned NOT NULL,
  `code` char(2) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lcd` timestamp NULL DEFAULT NULL,
  `lud` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wf_state
-- ----------------------------
INSERT INTO `wf_state` VALUES ('1', '1', 'ST', '开始', '2017-04-08 00:44:56', '2017-04-08 00:44:56');
INSERT INTO `wf_state` VALUES ('2', '1', 'ED', '结束', '2017-04-08 00:44:56', '2017-04-08 00:44:56');
INSERT INTO `wf_state` VALUES ('3', '1', 'PA', '有待申请审核', '2017-04-08 00:44:56', '2017-04-08 00:44:56');
INSERT INTO `wf_state` VALUES ('4', '1', 'PR', '有待报销单申请', '2017-04-08 00:44:56', '2017-04-08 00:44:56');
INSERT INTO `wf_state` VALUES ('5', '1', 'PS', '有待报销单审批', '2017-04-08 00:44:56', '2017-04-08 00:44:56');
INSERT INTO `wf_state` VALUES ('6', '1', 'A', '已批准付款申请', '2017-04-08 00:44:56', '2017-04-08 00:44:56');
INSERT INTO `wf_state` VALUES ('7', '1', 'D', '已拒绝付款申请', '2017-04-08 00:44:56', '2017-04-08 00:44:56');
INSERT INTO `wf_state` VALUES ('8', '1', 'C', '已取消付款申请', '2017-04-08 00:44:56', '2017-04-08 00:44:56');
INSERT INTO `wf_state` VALUES ('9', '1', 'RE', '已申请报销单', '2017-04-08 00:44:56', '2017-04-08 00:44:56');
INSERT INTO `wf_state` VALUES ('10', '1', 'SI', '已审批报销单', '2017-04-08 00:44:56', '2017-04-08 00:44:56');
INSERT INTO `wf_state` VALUES ('11', '1', 'RC', '已取消报销单申请', '2017-04-08 00:44:56', '2017-04-08 00:44:56');
INSERT INTO `wf_state` VALUES ('12', '2', 'ST', '开始', '2017-05-28 18:02:34', '2017-05-28 18:02:34');
INSERT INTO `wf_state` VALUES ('13', '2', 'ED', '结束', '2017-05-28 18:02:34', '2017-05-28 18:02:34');
INSERT INTO `wf_state` VALUES ('14', '2', 'PA', '有待申请审核', '2017-05-28 18:02:34', '2017-05-28 18:02:34');
INSERT INTO `wf_state` VALUES ('15', '2', 'PR', '有待报销单申请', '2017-05-28 18:02:34', '2017-05-28 18:02:34');
INSERT INTO `wf_state` VALUES ('16', '2', 'PS', '有待报销单审批', '2017-05-28 18:02:34', '2017-05-28 18:02:34');
INSERT INTO `wf_state` VALUES ('17', '2', 'A', '已批准付款申请', '2017-05-28 18:02:34', '2017-05-28 18:02:34');
INSERT INTO `wf_state` VALUES ('18', '2', 'D', '已拒绝付款申请', '2017-05-28 18:02:34', '2017-05-28 18:02:34');
INSERT INTO `wf_state` VALUES ('19', '2', 'C', '已取消付款申请', '2017-05-28 18:02:34', '2017-05-28 18:02:34');
INSERT INTO `wf_state` VALUES ('20', '2', 'RE', '已申请报销单', '2017-05-28 18:02:34', '2017-05-28 18:02:34');
INSERT INTO `wf_state` VALUES ('21', '2', 'SI', '已签字报销单', '2017-05-28 18:02:34', '2017-05-28 18:02:34');
INSERT INTO `wf_state` VALUES ('22', '2', 'RC', '已取消报销单申请', '2017-05-28 18:02:34', '2017-05-28 18:02:34');
INSERT INTO `wf_state` VALUES ('23', '2', 'PC', '有待覆核付款申请', '2017-05-28 18:02:34', '2017-05-28 18:02:34');
INSERT INTO `wf_state` VALUES ('24', '2', 'CK', '已覆核付款申请', '2017-05-28 18:02:34', '2017-05-28 18:02:34');

-- ----------------------------
-- Table structure for `wf_task`
-- ----------------------------
DROP TABLE IF EXISTS `wf_task`;
CREATE TABLE `wf_task` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `proc_ver_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `function_call` varchar(255) NOT NULL,
  `param` varchar(1000) DEFAULT NULL,
  `lcd` timestamp NULL DEFAULT NULL,
  `lud` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wf_task
-- ----------------------------
INSERT INTO `wf_task` VALUES ('1', '1', 'Send Email', 'sendEmail', '', '2017-04-08 00:44:04', '2017-04-08 00:44:04');
INSERT INTO `wf_task` VALUES ('2', '1', 'Status=Pending for Approval', 'transit', 'PA', '2017-04-08 00:44:04', '2017-04-08 00:44:04');
INSERT INTO `wf_task` VALUES ('3', '1', 'Status=Approved', 'transit', 'A', '2017-04-08 00:44:04', '2017-04-08 00:44:04');
INSERT INTO `wf_task` VALUES ('4', '1', 'Status=Denied', 'transit', 'D', '2017-04-08 00:44:04', '2017-04-08 00:44:04');
INSERT INTO `wf_task` VALUES ('5', '1', 'Status=Pending for Reimbursement', 'transit', 'PR', '2017-04-08 00:44:04', '2017-04-08 00:44:04');
INSERT INTO `wf_task` VALUES ('6', '1', 'Generate Transaction', 'generateTransaction', '', '2017-04-08 00:44:04', '2017-04-08 00:44:04');
INSERT INTO `wf_task` VALUES ('7', '1', 'Status=Reimbursed', 'transit', 'RE', '2017-04-08 00:44:04', '2017-04-08 00:44:04');
INSERT INTO `wf_task` VALUES ('8', '1', 'Status=Pending for Reimbursement Approval', 'transit', 'PS', '2017-04-08 00:44:04', '2017-04-08 00:44:04');
INSERT INTO `wf_task` VALUES ('9', '1', 'Status=Signed', 'transit', 'SI', '2017-04-08 00:44:04', '2017-04-08 00:44:04');
INSERT INTO `wf_task` VALUES ('10', '1', 'Route to Approver', 'routeToApprover', '', '2017-04-08 00:44:04', '2017-04-08 00:44:04');
INSERT INTO `wf_task` VALUES ('11', '1', 'Route to Signer', 'routeToSigner', '', '2017-04-08 00:44:04', '2017-04-08 00:44:04');
INSERT INTO `wf_task` VALUES ('12', '1', 'Route to Requestor', 'routeToRequestor', '', '2017-04-08 00:44:04', '2017-04-08 00:44:04');
INSERT INTO `wf_task` VALUES ('13', '1', 'Status=End', 'transit', 'ED', '2017-04-08 00:44:04', '2017-04-08 00:44:04');
INSERT INTO `wf_task` VALUES ('14', '1', 'Status=Cancel', 'transit', 'C', '2017-04-08 00:44:04', '2017-04-08 00:44:04');
INSERT INTO `wf_task` VALUES ('15', '1', 'Clear All Pending', 'clearAllPending', '', '2017-04-08 00:44:04', '2017-04-08 00:44:04');
INSERT INTO `wf_task` VALUES ('16', '1', 'Status=Cancel', 'transit', 'RC', '2017-04-08 00:44:04', '2017-04-08 00:44:04');
INSERT INTO `wf_task` VALUES ('17', '2', 'Send Email', 'sendEmail', '', '2017-05-28 18:02:18', '2017-05-28 18:02:18');
INSERT INTO `wf_task` VALUES ('18', '2', 'Status=Pending for Approval', 'transit', 'PA', '2017-05-28 18:02:18', '2017-05-28 18:02:18');
INSERT INTO `wf_task` VALUES ('19', '2', 'Status=Approved', 'transit', 'A', '2017-05-28 18:02:18', '2017-05-28 18:02:18');
INSERT INTO `wf_task` VALUES ('20', '2', 'Status=Denied', 'transit', 'D', '2017-05-28 18:02:18', '2017-05-28 18:02:18');
INSERT INTO `wf_task` VALUES ('21', '2', 'Status=Pending for Reimbursement', 'transit', 'PR', '2017-05-28 18:02:18', '2017-05-28 18:02:18');
INSERT INTO `wf_task` VALUES ('22', '2', 'Generate Transaction', 'generateTransaction', '', '2017-05-28 18:02:18', '2017-05-28 18:02:18');
INSERT INTO `wf_task` VALUES ('23', '2', 'Status=Reimbursed', 'transit', 'RE', '2017-05-28 18:02:18', '2017-05-28 18:02:18');
INSERT INTO `wf_task` VALUES ('24', '2', 'Status=Pending for Reimbursement Approval', 'transit', 'PS', '2017-05-28 18:02:18', '2017-05-28 18:02:18');
INSERT INTO `wf_task` VALUES ('25', '2', 'Status=Signed', 'transit', 'SI', '2017-05-28 18:02:18', '2017-05-28 18:02:18');
INSERT INTO `wf_task` VALUES ('26', '2', 'Route to Approver', 'routeToApprover', '', '2017-05-28 18:02:18', '2017-05-28 18:02:18');
INSERT INTO `wf_task` VALUES ('27', '2', 'Route to Signer', 'routeToSigner', '', '2017-05-28 18:02:18', '2017-05-28 18:02:18');
INSERT INTO `wf_task` VALUES ('28', '2', 'Route to Requestor', 'routeToRequestor', '', '2017-05-28 18:02:18', '2017-05-28 18:02:18');
INSERT INTO `wf_task` VALUES ('29', '2', 'Status=End', 'transit', 'ED', '2017-05-28 18:02:18', '2017-05-28 18:02:18');
INSERT INTO `wf_task` VALUES ('30', '2', 'Status=Cancel', 'transit', 'C', '2017-05-28 18:02:18', '2017-05-28 18:02:18');
INSERT INTO `wf_task` VALUES ('31', '2', 'Clear All Pending', 'clearAllPending', '', '2017-05-28 18:02:18', '2017-05-28 18:02:18');
INSERT INTO `wf_task` VALUES ('32', '2', 'Status=Cancel', 'transit', 'RC', '2017-05-28 18:02:18', '2017-05-28 18:02:18');
INSERT INTO `wf_task` VALUES ('33', '2', 'Status=Checked', 'transit', 'CK', '2017-05-28 18:02:18', '2017-05-28 18:02:18');
INSERT INTO `wf_task` VALUES ('34', '2', 'Status=Pending for Checking', 'transit', 'PC', '2017-05-28 18:02:18', '2017-05-28 18:02:18');
INSERT INTO `wf_task` VALUES ('35', '2', 'Route to Account', 'routeToAccount', '', '2017-05-28 18:02:18', '2017-05-28 18:02:18');

-- ----------------------------
-- Table structure for `wf_transition`
-- ----------------------------
DROP TABLE IF EXISTS `wf_transition`;
CREATE TABLE `wf_transition` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `proc_ver_id` int(10) unsigned NOT NULL,
  `current_state` int(10) unsigned NOT NULL,
  `next_state` int(10) unsigned NOT NULL,
  `lcd` timestamp NULL DEFAULT NULL,
  `lud` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wf_transition
-- ----------------------------
INSERT INTO `wf_transition` VALUES ('1', '1', '1', '3', '2017-04-08 00:45:34', '2017-04-08 00:45:34');
INSERT INTO `wf_transition` VALUES ('2', '1', '3', '6', '2017-04-08 00:45:34', '2017-04-08 00:45:34');
INSERT INTO `wf_transition` VALUES ('3', '1', '3', '7', '2017-04-08 00:45:34', '2017-04-08 00:45:34');
INSERT INTO `wf_transition` VALUES ('4', '1', '6', '4', '2017-04-08 00:45:34', '2017-04-08 00:45:34');
INSERT INTO `wf_transition` VALUES ('5', '1', '7', '2', '2017-04-08 00:45:34', '2017-04-08 00:45:34');
INSERT INTO `wf_transition` VALUES ('6', '1', '4', '9', '2017-04-08 00:45:34', '2017-04-08 00:45:34');
INSERT INTO `wf_transition` VALUES ('7', '1', '9', '5', '2017-04-08 00:45:34', '2017-04-08 00:45:34');
INSERT INTO `wf_transition` VALUES ('8', '1', '5', '10', '2017-04-08 00:45:34', '2017-04-08 00:45:34');
INSERT INTO `wf_transition` VALUES ('9', '1', '10', '2', '2017-04-08 00:45:34', '2017-04-08 00:45:34');
INSERT INTO `wf_transition` VALUES ('10', '1', '3', '8', '2017-04-08 00:45:34', '2017-04-08 00:45:34');
INSERT INTO `wf_transition` VALUES ('11', '1', '8', '2', '2017-04-08 00:45:34', '2017-04-08 00:45:34');
INSERT INTO `wf_transition` VALUES ('12', '1', '4', '11', '2017-04-08 00:45:34', '2017-04-08 00:45:34');
INSERT INTO `wf_transition` VALUES ('13', '1', '11', '2', '2017-04-08 00:45:34', '2017-04-08 00:45:34');
INSERT INTO `wf_transition` VALUES ('29', '2', '12', '23', '2017-05-29 12:29:30', '2017-05-29 12:29:30');
INSERT INTO `wf_transition` VALUES ('30', '2', '12', '14', '2017-05-29 12:29:30', '2017-05-29 12:29:30');
INSERT INTO `wf_transition` VALUES ('31', '2', '23', '24', '2017-05-29 12:29:30', '2017-05-29 12:29:30');
INSERT INTO `wf_transition` VALUES ('32', '2', '24', '14', '2017-05-29 12:29:30', '2017-05-29 12:29:30');
INSERT INTO `wf_transition` VALUES ('33', '2', '14', '17', '2017-05-29 12:29:30', '2017-05-29 12:29:30');
INSERT INTO `wf_transition` VALUES ('34', '2', '14', '18', '2017-05-29 12:29:30', '2017-05-29 12:29:30');
INSERT INTO `wf_transition` VALUES ('35', '2', '17', '15', '2017-05-29 12:29:30', '2017-05-29 12:29:30');
INSERT INTO `wf_transition` VALUES ('36', '2', '18', '13', '2017-05-29 12:29:30', '2017-05-29 12:29:30');
INSERT INTO `wf_transition` VALUES ('37', '2', '15', '20', '2017-05-29 12:29:30', '2017-05-29 12:29:30');
INSERT INTO `wf_transition` VALUES ('38', '2', '20', '16', '2017-05-29 12:29:30', '2017-05-29 12:29:30');
INSERT INTO `wf_transition` VALUES ('39', '2', '16', '21', '2017-05-29 12:29:30', '2017-05-29 12:29:30');
INSERT INTO `wf_transition` VALUES ('40', '2', '21', '13', '2017-05-29 12:29:30', '2017-05-29 12:29:30');
INSERT INTO `wf_transition` VALUES ('41', '2', '14', '19', '2017-05-29 12:29:30', '2017-05-29 12:29:30');
INSERT INTO `wf_transition` VALUES ('42', '2', '19', '13', '2017-05-29 12:29:30', '2017-05-29 12:29:30');
INSERT INTO `wf_transition` VALUES ('43', '2', '15', '22', '2017-05-29 12:29:30', '2017-05-29 12:29:30');
INSERT INTO `wf_transition` VALUES ('44', '2', '22', '13', '2017-05-29 12:29:30', '2017-05-29 12:29:30');
