/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : swoper_w

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-12-19 17:04:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `aa`
-- ----------------------------
DROP TABLE IF EXISTS `aa`;
CREATE TABLE `aa` (
  `id` int(10) NOT NULL DEFAULT '0',
  `user` varchar(20) DEFAULT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aa
-- ----------------------------

-- ----------------------------
-- Table structure for `swo_city`
-- ----------------------------
DROP TABLE IF EXISTS `swo_city`;
CREATE TABLE `swo_city` (
  `code` char(5) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `region` char(5) DEFAULT NULL,
  `incharge` varchar(30) DEFAULT NULL,
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swo_city
-- ----------------------------
INSERT INTO `swo_city` VALUES ('HK', '香港', null, null, 'admin', 'admin', '2017-11-30 11:53:01', '0000-00-00 00:00:00');
INSERT INTO `swo_city` VALUES ('SH', '上海', null, null, 'admin', 'admin', '2017-11-30 11:53:01', '0000-00-00 00:00:00');
INSERT INTO `swo_city` VALUES ('SZ', '深圳', null, null, 'admin', 'admin', '2017-11-30 11:53:01', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `swo_company`
-- ----------------------------
DROP TABLE IF EXISTS `swo_company`;
CREATE TABLE `swo_company` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roster_id` mediumint(9) DEFAULT NULL,
  `code` varchar(8) DEFAULT NULL,
  `name` varchar(1000) NOT NULL,
  `cont_name` varchar(100) DEFAULT NULL,
  `cont_phone` varchar(30) DEFAULT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `city` char(5) NOT NULL,
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swo_company
-- ----------------------------

-- ----------------------------
-- Table structure for `swo_customer_type`
-- ----------------------------
DROP TABLE IF EXISTS `swo_customer_type`;
CREATE TABLE `swo_customer_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  `rpt_cat` char(10) DEFAULT NULL,
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swo_customer_type
-- ----------------------------
INSERT INTO `swo_customer_type` VALUES ('1', 'IA 客户', 'IA-01', 'admin', 'admin', '2017-11-30 11:53:01', '0000-00-00 00:00:00');
INSERT INTO `swo_customer_type` VALUES ('2', 'IB 客户', 'IB-01', 'admin', 'admin', '2017-11-30 11:53:01', '0000-00-00 00:00:00');
INSERT INTO `swo_customer_type` VALUES ('3', 'BAF 客户', 'BAF-01', 'admin', 'admin', '2017-11-30 11:53:01', '0000-00-00 00:00:00');
INSERT INTO `swo_customer_type` VALUES ('4', '飘盈香客户', 'NEW-01', 'admin', 'admin', '2017-11-30 11:53:02', '0000-00-00 00:00:00');
INSERT INTO `swo_customer_type` VALUES ('5', '甲醛客戶', 'NEW-02', 'admin', 'admin', '2017-11-30 11:53:02', '0000-00-00 00:00:00');
INSERT INTO `swo_customer_type` VALUES ('6', 'INV 客户', 'NEW-03', 'admin', 'admin', '2017-11-30 11:53:02', '0000-00-00 00:00:00');
INSERT INTO `swo_customer_type` VALUES ('7', null, null, 'admin', 'admin', '2017-12-14 16:17:14', '0000-00-00 00:00:00');
INSERT INTO `swo_customer_type` VALUES ('8', null, null, 'admin', 'admin', '2017-12-14 16:18:53', '0000-00-00 00:00:00');
INSERT INTO `swo_customer_type` VALUES ('9', null, null, 'admin', 'admin', '2017-12-14 16:18:53', '0000-00-00 00:00:00');
INSERT INTO `swo_customer_type` VALUES ('10', null, null, 'admin', 'admin', '2017-12-14 16:19:05', '0000-00-00 00:00:00');
INSERT INTO `swo_customer_type` VALUES ('11', null, null, 'admin', 'admin', '2017-12-14 16:19:05', '0000-00-00 00:00:00');
INSERT INTO `swo_customer_type` VALUES ('12', '客户K', 'xsqwe', 'admin', 'admin', '2017-12-14 16:25:21', '0000-00-00 00:00:00');
INSERT INTO `swo_customer_type` VALUES ('13', '客户测试', '客户列别', 'admin', 'admin', '2017-12-14 16:37:22', '0000-00-00 00:00:00');
INSERT INTO `swo_customer_type` VALUES ('14', '测试1', '类别测试2', 'admin', 'admin', '2017-12-14 16:43:23', '0000-00-00 00:00:00');
INSERT INTO `swo_customer_type` VALUES ('15', '测试1204', '', 'admin', 'admin', '2017-12-14 16:44:05', '0000-00-00 00:00:00');
INSERT INTO `swo_customer_type` VALUES ('16', '测试数据demo', 'demo', 'admin', 'admin', '2017-12-14 16:45:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `swo_email_queue`
-- ----------------------------
DROP TABLE IF EXISTS `swo_email_queue`;
CREATE TABLE `swo_email_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `request_dt` datetime NOT NULL,
  `from_addr` varchar(255) NOT NULL,
  `to_addr` varchar(1000) NOT NULL,
  `cc_addr` varchar(1000) DEFAULT NULL,
  `subject` varchar(1000) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `message` varchar(5000) DEFAULT NULL,
  `status` char(1) DEFAULT 'N',
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swo_email_queue
-- ----------------------------

-- ----------------------------
-- Table structure for `swo_enquiry`
-- ----------------------------
DROP TABLE IF EXISTS `swo_enquiry`;
CREATE TABLE `swo_enquiry` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contact_dt` datetime NOT NULL,
  `customer` varchar(255) NOT NULL,
  `nature_type` int(10) unsigned DEFAULT NULL,
  `type` varchar(100) NOT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `tel_no` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `source_code` char(5) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `follow_staff` varchar(500) DEFAULT NULL,
  `follow_dt` datetime DEFAULT NULL,
  `follow_result` varchar(1000) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `record_by` varchar(100) DEFAULT NULL,
  `city` char(5) NOT NULL,
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swo_enquiry
-- ----------------------------

-- ----------------------------
-- Table structure for `swo_followup`
-- ----------------------------
DROP TABLE IF EXISTS `swo_followup`;
CREATE TABLE `swo_followup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_dt` datetime NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `company_name` varchar(1000) NOT NULL,
  `content` varchar(5000) DEFAULT NULL,
  `cont_info` varchar(500) DEFAULT NULL,
  `resp_staff` varchar(1000) DEFAULT NULL,
  `resp_tech` varchar(1000) DEFAULT NULL,
  `mgr_notify` char(1) DEFAULT '',
  `sch_dt` datetime DEFAULT NULL,
  `follow_staff` varchar(1000) DEFAULT NULL,
  `leader` char(1) DEFAULT '',
  `follow_tech` varchar(1000) DEFAULT NULL,
  `fin_dt` datetime DEFAULT NULL,
  `follow_action` varchar(1000) DEFAULT NULL,
  `mgr_talk` char(1) DEFAULT '',
  `changex` varchar(1000) DEFAULT NULL,
  `tech_notify` varchar(1000) DEFAULT NULL,
  `fp_fin_dt` datetime DEFAULT NULL,
  `fp_call_dt` datetime DEFAULT NULL,
  `fp_cust_name` varchar(100) DEFAULT NULL,
  `fp_comment` varchar(1000) DEFAULT NULL,
  `svc_next_dt` datetime DEFAULT NULL,
  `svc_call_dt` datetime DEFAULT NULL,
  `svc_cust_name` varchar(100) DEFAULT NULL,
  `svc_comment` varchar(1000) DEFAULT NULL,
  `mcard_remarks` varchar(1000) DEFAULT NULL,
  `mcard_staff` varchar(1000) DEFAULT NULL,
  `city` char(5) NOT NULL,
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swo_followup
-- ----------------------------

-- ----------------------------
-- Table structure for `swo_group`
-- ----------------------------
DROP TABLE IF EXISTS `swo_group`;
CREATE TABLE `swo_group` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL,
  `a_read_only` varchar(255) DEFAULT '',
  `a_read_write` varchar(255) DEFAULT '',
  `a_control` varchar(255) DEFAULT '',
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swo_group
-- ----------------------------
INSERT INTO `swo_group` VALUES ('1', 'Site Admin', '', 'C01C02C05C06C07D01D02D03D04D05', '', 'admin', 'admin', '2017-11-30 11:53:00', '0000-00-00 00:00:00');
INSERT INTO `swo_group` VALUES ('2', 'Normal User', 'B01B02B03B04B05B06B07B08B09B10', 'A01A02A03A04A05A06A07C03C04', '', 'admin', 'admin', '2017-11-30 11:53:00', '0000-00-00 00:00:00');
INSERT INTO `swo_group` VALUES ('3', 'View Only User', 'A01A02A03A04A05A06A07C03C04B01B02B03B04B05B06B07B08B09B10', '', '', 'admin', 'admin', '2017-11-30 11:53:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `swo_location`
-- ----------------------------
DROP TABLE IF EXISTS `swo_location`;
CREATE TABLE `swo_location` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  `city` char(5) NOT NULL,
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swo_location
-- ----------------------------

-- ----------------------------
-- Table structure for `swo_login_log`
-- ----------------------------
DROP TABLE IF EXISTS `swo_login_log`;
CREATE TABLE `swo_login_log` (
  `station_id` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `client_ip` varchar(20) DEFAULT NULL,
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swo_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for `swo_logistic`
-- ----------------------------
DROP TABLE IF EXISTS `swo_logistic`;
CREATE TABLE `swo_logistic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_dt` datetime NOT NULL,
  `seq` tinyint(3) unsigned DEFAULT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `company_name` varchar(1000) NOT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `follow_staff` varchar(1000) DEFAULT NULL,
  `pay_method` varchar(200) DEFAULT NULL,
  `location` int(10) unsigned NOT NULL,
  `location_dtl` varchar(200) DEFAULT NULL,
  `finish` char(1) DEFAULT 'N',
  `deadline` varchar(200) DEFAULT NULL,
  `reason` varchar(1000) DEFAULT NULL,
  `repair` varchar(1000) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `city` char(5) NOT NULL,
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swo_logistic
-- ----------------------------

-- ----------------------------
-- Table structure for `swo_logistic_copy`
-- ----------------------------
DROP TABLE IF EXISTS `swo_logistic_copy`;
CREATE TABLE `swo_logistic_copy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_dt` datetime NOT NULL,
  `seq` tinyint(3) unsigned DEFAULT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `company_name` varchar(1000) NOT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `follow_staff` varchar(1000) DEFAULT NULL,
  `pay_method` varchar(200) DEFAULT NULL,
  `location` int(10) unsigned NOT NULL,
  `location_dtl` varchar(200) DEFAULT NULL,
  `finish` char(1) DEFAULT 'N',
  `deadline` varchar(200) DEFAULT NULL,
  `reason` varchar(1000) DEFAULT NULL,
  `repair` varchar(1000) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `city` char(5) NOT NULL,
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swo_logistic_copy
-- ----------------------------

-- ----------------------------
-- Table structure for `swo_logistic_dtl`
-- ----------------------------
DROP TABLE IF EXISTS `swo_logistic_dtl`;
CREATE TABLE `swo_logistic_dtl` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_id` int(10) unsigned NOT NULL,
  `task` int(10) unsigned NOT NULL,
  `qty` int(10) unsigned DEFAULT NULL,
  `finish` char(1) DEFAULT 'N',
  `deadline` datetime DEFAULT NULL,
  `city` char(5) NOT NULL,
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swo_logistic_dtl
-- ----------------------------

-- ----------------------------
-- Table structure for `swo_mgr_feedback`
-- ----------------------------
DROP TABLE IF EXISTS `swo_mgr_feedback`;
CREATE TABLE `swo_mgr_feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `request_dt` datetime NOT NULL,
  `feedback_dt` datetime DEFAULT NULL,
  `feedback_cat_list` varchar(300) DEFAULT NULL,
  `city` char(5) NOT NULL,
  `status` char(1) DEFAULT 'N',
  `rpt_id` int(10) unsigned DEFAULT NULL,
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swo_mgr_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for `swo_mgr_feedback_rmk`
-- ----------------------------
DROP TABLE IF EXISTS `swo_mgr_feedback_rmk`;
CREATE TABLE `swo_mgr_feedback_rmk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `feedback_id` int(10) unsigned NOT NULL,
  `feedback_cat` char(5) NOT NULL,
  `feedback` varchar(5000) DEFAULT NULL,
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swo_mgr_feedback_rmk
-- ----------------------------

-- ----------------------------
-- Table structure for `swo_monthly_dtl`
-- ----------------------------
DROP TABLE IF EXISTS `swo_monthly_dtl`;
CREATE TABLE `swo_monthly_dtl` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hdr_id` int(10) unsigned NOT NULL,
  `data_field` char(5) NOT NULL,
  `data_value` varchar(100) DEFAULT NULL,
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swo_monthly_dtl
-- ----------------------------

-- ----------------------------
-- Table structure for `swo_monthly_field`
-- ----------------------------
DROP TABLE IF EXISTS `swo_monthly_field`;
CREATE TABLE `swo_monthly_field` (
  `code` char(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `upd_type` char(1) NOT NULL DEFAULT 'M',
  `field_type` char(1) NOT NULL DEFAULT 'N',
  `status` char(1) DEFAULT 'Y',
  `function_name` varchar(200) DEFAULT NULL,
  `excel_row` smallint(5) unsigned DEFAULT NULL,
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swo_monthly_field
-- ----------------------------
INSERT INTO `swo_monthly_field` VALUES ('00001', '上月生意额', 'Y', 'N', 'Y', 'CalcService::getLastMonthFigure,00002', '3', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00002', '今月生意额', 'M', 'N', 'Y', null, '4', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00003', '今月IA生意额', 'M', 'N', 'Y', null, '5', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00004', '今月IB生意额', 'M', 'N', 'Y', null, '6', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00005', '上月新（IA，IB）服务年生意额', 'Y', 'N', 'Y', 'CalcService::getLastMonthFigure,00006', '7', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00006', '今月新（IA，IB）服务年生意额', 'Y', 'N', 'Y', 'CalcService::sumAmountIAIB', '8', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00007', '去年今月新（IA，IB）服务年生意额', 'M', 'N', 'Y', null, '9', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00008', '上月新业务年生意额', 'Y', 'N', 'Y', 'CalcService::getLastMonthFigure,00009', '10', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00009', '今月新业务年生意额', 'Y', 'N', 'Y', 'CalcService::sumAmountNEW', '11', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00010', '去年今月新业务年生意额', 'M', 'N', 'Y', null, '12', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00011', '今月餐饮年生意额', 'Y', 'N', 'Y', 'CalcService::sumAmountRestaurant', '13', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00012', '今月非餐饮年生意额', 'Y', 'N', 'Y', 'CalcService::sumAmountNonRestaurant', '14', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00013', '上月生意净增长 （年生意额）', 'Y', 'N', 'Y', 'CalcService::getLastMonthFigure,00014', '15', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00014', '今月生意净增长 （年生意额', 'Y', 'N', 'Y', 'CalcService::sumAmountNetGrowth', '16', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00015', '去年今月生意额净增长 （年生意额）', 'M', 'N', 'Y', null, '17', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00016', '今月服务金额', 'M', 'N', 'Y', null, '18', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00017', '今月停单月生意额', 'Y', 'N', 'Y', 'CalcService::sumAmountTerminate', '19', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00018', '技术员当月平均生意额', 'M', 'N', 'Y', null, '20', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00019', '当月最高技术员生意金额', 'M', 'N', 'Y', null, '21', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00020', '问题客户（应收报表超过90天）总金额', 'M', 'N', 'Y', null, '22', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00021', '今月收款额', 'M', 'N', 'Y', null, '23', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00022', '今月材料订购金额', 'M', 'N', 'Y', null, '24', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00023', '技术员今月领货金额（IA）', 'M', 'N', 'Y', null, '25', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00024', '技术员今月领货金额（IB）', 'M', 'N', 'Y', null, '26', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00025', '今月技术员总工资', 'M', 'N', 'Y', null, '27', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00026', '今月工资总金额', 'M', 'N', 'Y', null, '28', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00027', '上月底公司累计结余', 'M', 'N', 'Y', null, '29', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00028', '上月新（IA，IB）服务合同数目', 'Y', 'N', 'Y', 'CalcService::getLastMonthFigure,00029', '31', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00029', '今月新（IA，IB）服务合同数目', 'Y', 'N', 'Y', 'CalcService::countCaseIAIB', '32', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00030', '今月新IA服务合同数目', 'Y', 'N', 'Y', 'CalcService::countCaseIA', '33', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00031', '去年今月新（IA，IB）服务合同数目', 'M', 'N', 'Y', null, '34', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00032', '锦旗今月数目', 'M', 'N', 'Y', null, '36', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00033', '襟章获颁技术员数目', 'M', 'N', 'Y', null, '37', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00034', '襟章发放数目', 'M', 'N', 'Y', null, '38', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00035', '上月客诉数目', 'Y', 'N', 'Y', 'CalcComplaint::getLastMonthFigure,00036', '40', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00036', '今月客诉数目', 'Y', 'N', 'Y', 'CalcComplaint::countCase', '41', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00037', '当月解决客诉数目', 'Y', 'N', 'Y', 'CalcComplaint::countFinishCase', '42', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00038', '2天内解决客诉数目', 'Y', 'N', 'Y', 'CalcComplaint::countFinishCaseIn2Days', '43', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00039', '客诉后7天内电话客户回访数目', 'Y', 'N', 'Y', 'CalcComplaint::countCallIn7days', '44', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00040', '队长/组长跟客诉技术员面谈数目', 'Y', 'N', 'Y', 'CalcComplaint::countNotifyLeader', '45', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00041', '问题客户需要队长/组长跟进数目', 'Y', 'N', 'Y', 'CalcComplaint::countLeaderHandle', '46', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00042', '今月质检客户数量', 'Y', 'N', 'Y', 'CalcQc::countCase', '47', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00043', '低于70分质检客户数量', 'Y', 'N', 'Y', 'CalcQc::countResultBelow70', '48', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00044', '质检拜访平均分数最高同事', 'Y', 'S', 'Y', 'CalcQc::listHighestMarkStaff', '49', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00045', '5天成功安装机器合同数目', 'Y', 'N', 'Y', 'CalcService::countInstallIn5Days', '50', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00046', '7天成功安排首次合同数目', 'Y', 'N', 'Y', 'CalcService::countFirstTimeIn7Days', '51', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00047', '车辆数目', 'M', 'N', 'Y', null, '53', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00048', '今月平均每部车用油金额', 'M', 'N', 'Y', null, '54', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00049', '今月应送皂液（桶）', 'Y', 'N', 'Y', 'CalcLogistic::sumSoapPlanQty', '55', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00050', '今月实际送皂液（桶）', 'Y', 'N', 'Y', 'CalcLogistic::sumSoapActualQty', '56', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00051', '今月应送纸品（箱）', 'Y', 'N', 'Y', 'CalcLogistic::sumPaperPlanQty', '57', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00052', '今月实际送纸品（箱）', 'Y', 'N', 'Y', 'CalcLogistic::sumPaperActualQty', '58', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00053', '上月盘点准确度（实际货品量/储存电脑数量）', 'M', 'N', 'Y', null, '59', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00054', '超过一个月没有签署劳动合同同事数目（张）', 'Y', 'N', 'Y', 'CalcStaff::countNoContract', '61', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00055', '今月销售离职人数（工作满一个月）数目', 'Y', 'N', 'Y', 'CalcStaff::countStaffResignSales', '62', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00056', '今月技术员离职人数（工作满一个月）数目', 'Y', 'N', 'Y', 'CalcStaff::countStaffResignTech', '63', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00057', '今月办公室离职人数（工作满一个月）数目', 'Y', 'N', 'Y', 'CalcStaff::countStaffResignOffice', '64', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00058', '技术员今月整体人员数目', 'Y', 'N', 'Y', 'CalcStaff::countStaffTech', '65', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00059', '现有队长数目', 'Y', 'N', 'Y', 'CalcStaff::countLeaderTeam', '66', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00060', '现有组长数目', 'Y', 'N', 'Y', 'CalcStaff::countLeaderGroup', '67', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00061', '今月销售人员数目', 'Y', 'N', 'Y', 'CalcStaff::countStaffSales', '68', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00062', '今月办公室人员数目', 'Y', 'N', 'Y', 'CalcStaff::countStaffOffice', '69', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00063', '销售划分区域', 'M', 'N', 'Y', 'CalcService::getLastMonthFigure,00063', '70', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');
INSERT INTO `swo_monthly_field` VALUES ('00064', '销售公共区域', 'M', 'N', 'Y', 'CalcService::getLastMonthFigure,00064', '71', 'admin', 'admin', '2017-11-30 11:53:03', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `swo_monthly_hdr`
-- ----------------------------
DROP TABLE IF EXISTS `swo_monthly_hdr`;
CREATE TABLE `swo_monthly_hdr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city` char(5) NOT NULL,
  `year_no` smallint(5) unsigned NOT NULL,
  `month_no` tinyint(3) unsigned NOT NULL,
  `status` char(1) DEFAULT 'N',
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swo_monthly_hdr
-- ----------------------------

-- ----------------------------
-- Table structure for `swo_nature`
-- ----------------------------
DROP TABLE IF EXISTS `swo_nature`;
CREATE TABLE `swo_nature` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  `rpt_cat` char(10) DEFAULT NULL,
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swo_nature
-- ----------------------------
INSERT INTO `swo_nature` VALUES ('1', '餐飲', 'A01', 'admin', 'admin', '2017-11-30 11:53:01', '0000-00-00 00:00:00');
INSERT INTO `swo_nature` VALUES ('2', '非餐饮', 'B01', 'admin', 'admin', '2017-11-30 11:53:01', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `swo_product`
-- ----------------------------
DROP TABLE IF EXISTS `swo_product`;
CREATE TABLE `swo_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(15) NOT NULL DEFAULT '',
  `description` varchar(1000) DEFAULT NULL,
  `city` char(5) NOT NULL,
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swo_product
-- ----------------------------

-- ----------------------------
-- Table structure for `swo_qc`
-- ----------------------------
DROP TABLE IF EXISTS `swo_qc`;
CREATE TABLE `swo_qc` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_dt` datetime NOT NULL,
  `job_staff` varchar(500) DEFAULT NULL,
  `team` varchar(100) DEFAULT NULL,
  `month` char(5) DEFAULT NULL,
  `input_dt` datetime DEFAULT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `company_name` varchar(500) DEFAULT NULL,
  `service_type` varchar(100) DEFAULT NULL,
  `service_score` varchar(100) DEFAULT NULL,
  `cust_score` varchar(100) DEFAULT NULL,
  `cust_comment` varchar(1000) DEFAULT NULL,
  `qc_result` varchar(100) DEFAULT NULL,
  `env_grade` char(1) DEFAULT NULL,
  `qc_dt` datetime DEFAULT NULL,
  `cust_sign` varchar(100) DEFAULT NULL,
  `qc_staff` varchar(500) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `city` char(5) NOT NULL,
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swo_qc
-- ----------------------------

-- ----------------------------
-- Table structure for `swo_queue`
-- ----------------------------
DROP TABLE IF EXISTS `swo_queue`;
CREATE TABLE `swo_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rpt_desc` varchar(250) NOT NULL,
  `req_dt` datetime DEFAULT NULL,
  `fin_dt` datetime DEFAULT NULL,
  `username` varchar(30) NOT NULL,
  `status` char(1) NOT NULL,
  `rpt_type` varchar(10) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rpt_content` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swo_queue
-- ----------------------------

-- ----------------------------
-- Table structure for `swo_queue_param`
-- ----------------------------
DROP TABLE IF EXISTS `swo_queue_param`;
CREATE TABLE `swo_queue_param` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `queue_id` int(10) unsigned NOT NULL,
  `param_field` varchar(50) NOT NULL,
  `param_value` varchar(500) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swo_queue_param
-- ----------------------------

-- ----------------------------
-- Table structure for `swo_queue_user`
-- ----------------------------
DROP TABLE IF EXISTS `swo_queue_user`;
CREATE TABLE `swo_queue_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `queue_id` int(10) unsigned NOT NULL,
  `username` varchar(30) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swo_queue_user
-- ----------------------------

-- ----------------------------
-- Table structure for `swo_service`
-- ----------------------------
DROP TABLE IF EXISTS `swo_service`;
CREATE TABLE `swo_service` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned DEFAULT NULL,
  `company_name` varchar(1000) NOT NULL,
  `nature_type` int(10) unsigned DEFAULT NULL,
  `cust_type` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `b4_product_id` int(10) unsigned DEFAULT NULL,
  `b4_service` varchar(1000) DEFAULT NULL,
  `b4_freq` varchar(100) DEFAULT NULL,
  `b4_paid_type` char(1) DEFAULT 'M',
  `b4_amt_paid` decimal(11,2) DEFAULT '0.00',
  `service` varchar(1000) DEFAULT NULL,
  `freq` varchar(100) DEFAULT NULL,
  `paid_type` char(1) DEFAULT 'M',
  `amt_paid` decimal(11,2) DEFAULT '0.00',
  `amt_install` decimal(11,2) DEFAULT '0.00',
  `need_install` char(1) DEFAULT 'N',
  `salesman` varchar(1000) DEFAULT NULL,
  `sign_dt` datetime DEFAULT NULL,
  `ctrt_end_dt` datetime DEFAULT NULL,
  `ctrt_period` tinyint(4) DEFAULT '0',
  `cont_info` varchar(500) DEFAULT NULL,
  `first_dt` datetime DEFAULT NULL,
  `first_tech` varchar(1000) DEFAULT NULL,
  `reason` varchar(1000) DEFAULT NULL,
  `status` char(1) DEFAULT 'N',
  `status_dt` datetime DEFAULT NULL,
  `remarks` varchar(2000) DEFAULT NULL,
  `equip_install_dt` datetime DEFAULT NULL,
  `org_equip_qty` smallint(5) unsigned DEFAULT '0',
  `rtn_equip_qty` smallint(5) unsigned DEFAULT '0',
  `remarks2` varchar(1000) DEFAULT NULL,
  `city` char(5) NOT NULL,
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swo_service
-- ----------------------------

-- ----------------------------
-- Table structure for `swo_service_type`
-- ----------------------------
DROP TABLE IF EXISTS `swo_service_type`;
CREATE TABLE `swo_service_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  `rpt_cat` char(10) DEFAULT NULL,
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swo_service_type
-- ----------------------------

-- ----------------------------
-- Table structure for `swo_staff`
-- ----------------------------
DROP TABLE IF EXISTS `swo_staff`;
CREATE TABLE `swo_staff` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `position` varchar(250) DEFAULT NULL,
  `staff_type` varchar(15) DEFAULT NULL,
  `leader` varchar(15) DEFAULT NULL,
  `join_dt` datetime DEFAULT NULL,
  `ctrt_start_dt` datetime DEFAULT NULL,
  `ctrt_period` tinyint(4) DEFAULT '0',
  `ctrt_renew_dt` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `leave_dt` datetime DEFAULT NULL,
  `leave_reason` varchar(1000) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `city` char(5) NOT NULL,
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swo_staff
-- ----------------------------

-- ----------------------------
-- Table structure for `swo_station`
-- ----------------------------
DROP TABLE IF EXISTS `swo_station`;
CREATE TABLE `swo_station` (
  `station_id` varchar(30) NOT NULL,
  `station_name` varchar(30) NOT NULL,
  `city` char(5) NOT NULL,
  `status` char(1) DEFAULT 'Y',
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swo_station
-- ----------------------------

-- ----------------------------
-- Table structure for `swo_station_request`
-- ----------------------------
DROP TABLE IF EXISTS `swo_station_request`;
CREATE TABLE `swo_station_request` (
  `req_key` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `station_name` varchar(30) NOT NULL,
  `city` char(5) NOT NULL,
  `station_id` varchar(30) DEFAULT NULL,
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`req_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swo_station_request
-- ----------------------------

-- ----------------------------
-- Table structure for `swo_supplier`
-- ----------------------------
DROP TABLE IF EXISTS `swo_supplier`;
CREATE TABLE `swo_supplier` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(8) DEFAULT NULL,
  `name` varchar(1000) NOT NULL,
  `cont_name` varchar(100) DEFAULT NULL,
  `cont_phone` varchar(30) DEFAULT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `acct_no` varchar(100) DEFAULT NULL,
  `city` char(5) NOT NULL,
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swo_supplier
-- ----------------------------

-- ----------------------------
-- Table structure for `swo_task`
-- ----------------------------
DROP TABLE IF EXISTS `swo_task`;
CREATE TABLE `swo_task` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  `task_type` char(5) DEFAULT NULL,
  `city` char(5) NOT NULL,
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swo_task
-- ----------------------------

-- ----------------------------
-- Table structure for `swo_user`
-- ----------------------------
DROP TABLE IF EXISTS `swo_user`;
CREATE TABLE `swo_user` (
  `username` varchar(30) NOT NULL,
  `password` varchar(128) DEFAULT NULL,
  `disp_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `logon_time` datetime DEFAULT NULL,
  `logoff_time` datetime DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `fail_count` tinyint(3) unsigned DEFAULT '0',
  `locked` char(1) DEFAULT 'N',
  `session_key` varchar(500) DEFAULT NULL,
  `city` char(5) NOT NULL DEFAULT '',
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swo_user
-- ----------------------------
INSERT INTO `swo_user` VALUES ('admin', '319153b210a3f6efde35e1486638f2cd', 'administrator', null, null, null, 'A', '1', '0', 'N', null, 'HK', 'admin', 'admin', '2017-12-18 14:56:21', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `swo_user_option`
-- ----------------------------
DROP TABLE IF EXISTS `swo_user_option`;
CREATE TABLE `swo_user_option` (
  `username` varchar(30) NOT NULL,
  `option_key` varchar(30) NOT NULL,
  `option_value` varchar(255) DEFAULT NULL,
  UNIQUE KEY `idx_swo_user_option_1` (`username`,`option_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swo_user_option
-- ----------------------------

-- ----------------------------
-- Table structure for `swo_wservice`
-- ----------------------------
DROP TABLE IF EXISTS `swo_wservice`;
CREATE TABLE `swo_wservice` (
  `wsvc_key` varchar(50) NOT NULL,
  `wsvc_desc` varchar(100) NOT NULL,
  `city` char(5) NOT NULL,
  `session_key` varchar(50) DEFAULT NULL,
  `session_time` datetime DEFAULT NULL,
  PRIMARY KEY (`wsvc_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swo_wservice
-- ----------------------------
