/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : blog_test

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-12-30 17:57:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `employee_correct_rate`
-- ----------------------------
DROP TABLE IF EXISTS `employee_correct_rate`;
CREATE TABLE `employee_correct_rate` (
  `employee_correct_rate_id` int(50) NOT NULL AUTO_INCREMENT COMMENT '员工正确率主键',
  `employee_correct_rate_info_id` int(50) NOT NULL COMMENT '员工外键',
  `quiz_employee_id` int(50) NOT NULL COMMENT '测验外键',
  `employee_correct_rate` varchar(20) DEFAULT NULL COMMENT '个人正确率',
  `city_privileges` char(20) DEFAULT NULL COMMENT '地区权限',
  `employee_quiz_questions_all` varchar(300) DEFAULT NULL COMMENT '员工测验题所有题的外键',
  `employee_quiz_questions_wrong` text COMMENT '员工错题外键',
  `employee_quiz_questions_count` char(5) DEFAULT NULL COMMENT '本次测验题目数',
  `employee_quiz_wrong_questions_count` char(5) DEFAULT NULL COMMENT '错误的题目数量',
  `employee_correct_rate_date` varchar(20) DEFAULT NULL COMMENT '每次测验的时间',
  PRIMARY KEY (`employee_correct_rate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee_correct_rate
-- ----------------------------
INSERT INTO `employee_correct_rate` VALUES ('1', '5', '27', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('2', '1', '2', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('3', '1', '2', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('4', '1', '2', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('5', '1', '2', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('6', '1', '2', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('7', '1', '2', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('8', '1', '2', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('9', '30', '3', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('10', '31', '3', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('11', '28', '0', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('12', '30', '3', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('13', '27', '6', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('14', '26', '4', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('15', '27', '6', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('16', '26', '2', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('17', '38', '2', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('18', '32', '3', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('19', '32', '3', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('20', '23', '1', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('21', '23', '1', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('22', '23', '1', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('23', '23', '1', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('24', '38', '6', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('25', '23', '1', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('26', '23', '1', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('27', '23', '1', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('28', '29', '2', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('29', '23', '1', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('30', '29', '2', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('31', '38', '1', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('32', '38', '6', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('33', '32', '3', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('34', '38', '6', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('35', '38', '6', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('36', '38', '6', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('37', '30', '2', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('38', '31', '5', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('39', '38', '2', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('40', '29', '5', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('41', '29', '5', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('42', '29', '5', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('43', '31', '2', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('44', '29', '2', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('45', '29', '2', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('46', '29', '2', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('47', '29', '2', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('48', '29', '2', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('49', '29', '2', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('50', '29', '2', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('51', '29', '2', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('52', '29', '2', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('53', '29', '2', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('54', '29', '2', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('55', '38', '2', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('56', '38', '6', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('57', '38', '6', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('58', '38', '6', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('59', '38', '6', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('60', '38', '6', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('61', '38', '6', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('62', '38', '6', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('63', '23', '6', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('64', '38', '6', '28.57', 'HK', '8-11-12-16-20-35-36', '11-12-16-20-36', '7', '5', null);
INSERT INTO `employee_correct_rate` VALUES ('65', '29', '3', '0', 'HK', '2-5-12-15', '2-5-12-15', '4', '4', null);
INSERT INTO `employee_correct_rate` VALUES ('66', '28', '2', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('67', '32', '5', '18.18', 'HK', '1-10-14-15-19-21-34-37-39-40-43', '10-14-15-19-21-34-37-39-43', '11', '9', null);
INSERT INTO `employee_correct_rate` VALUES ('68', '31', '3', '41.67', 'HK', '15-16-17-20-21-34-35-37-38-41-44-45', '16*test_exams_answer_faults-17*test_exams_answer_faultt-21*test_exams_answer_faultf-34*test_exams_an', '12', '7', null);
INSERT INTO `employee_correct_rate` VALUES ('69', '30', '3', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('70', '27', '6', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('71', '30', '3', '46.67', 'HK', '16-17-21-34-37-41', '16*test_exams_answer_faults-17*test_exams_answer_faultt-21*test_exams_answer_faultf-34*test_exams_an', '15', '7', null);
INSERT INTO `employee_correct_rate` VALUES ('72', '38', '2', '128.57', 'HK', '18-19-36-39-41-43', '18*test_exams_answer_faultt-19*test_exams_answer_faults-36*test_exams_answer_faultf-39*test_exams_an', '7', '9', null);
INSERT INTO `employee_correct_rate` VALUES ('73', '38', '2', '71.43', 'HK', '5-14-18-19-34-35-36', '5*test_exams_answer_faultf-14*test_exams_answer_faults-18*test_exams_answer_faultt-34*test_exams_answer_faultf-35*test_exams_answer_faults-36*test_exams_answer_faultt', '7', '5', null);
INSERT INTO `employee_correct_rate` VALUES ('74', '33', '3', '20', 'HK', '13-18-20-34-36-38-40-42-45-46', '13*test_exams_answer_faultt-18*test_exams_answer_faultf-20*test_exams_answer_faultf-34*test_exams_answer_faults-36*test_exams_answer_faults-38*test_exams_answer_faultf-42*test_exams_answer_faults-45*test_exams_answer_faults-46*test_exams_answer_faultf', '10', '8', null);
INSERT INTO `employee_correct_rate` VALUES ('75', '28', '3', '13.33', 'HK', '6-12-15-17-18-20-34-35-39-40-41-43-44-47-48', '6*test_exams_answer_faults-12*test_exams_answer_faults-15*test_exams_answer_faultf-18*test_exams_answer_faultf-20*test_exams_answer_faultf-34*test_exams_answer_faultt-35*test_exams_answer_faultf-39*test_exams_answer_faultt-40*test_exams_answer_faults-41*test_exams_answer_faultt-43*test_exams_answer_faults-44*test_exams_answer_faults-47*test_exams_answer_faultt', '15', '13', null);
INSERT INTO `employee_correct_rate` VALUES ('76', '28', '3', '13.33', 'HK', '6-12-15-18-20-34-35-39-40-41-43-50-51-52-53', '12*test_exams_answer_faults-15*test_exams_answer_faults-18*test_exams_answer_faultt-20*test_exams_answer_faultt-34*test_exams_answer_faultf-35*test_exams_answer_faultf-40*test_exams_answer_faultf-41*test_exams_answer_faultt-43*test_exams_answer_faults-50*test_exams_answer_faultt-51*test_exams_answer_faultt-52*test_exams_answer_faultf-53*test_exams_answer_faultt', '15', '13', null);
INSERT INTO `employee_correct_rate` VALUES ('77', '28', '2', '40', 'HK', '2-19-20-21-36-37-38-39-40-43-44-46-47', '2*test_exams_answer_faults-21*test_exams_answer_faults-36*test_exams_answer_faults-37*test_exams_answer_faultt-38*test_exams_answer_faults-39*test_exams_answer_faults-40*test_exams_answer_faultt-43*test_exams_answer_faults-44*test_exams_answer_faultt', '15', '9', null);
INSERT INTO `employee_correct_rate` VALUES ('78', '28', '2', '33.33', 'HK', '2-11-20-21-36-37-38-39-40-42-47-48-49-50-51', '2*test_exams_answer_faults-11*test_exams_answer_faultf-21*test_exams_answer_faultt-36*test_exams_answer_faultt-38*test_exams_answer_faults-39*test_exams_answer_faults-42*test_exams_answer_faultt-47*test_exams_answer_faultt-48*test_exams_answer_faultt-49*test_exams_answer_faultt', '15', '10', null);
INSERT INTO `employee_correct_rate` VALUES ('79', '35', '2', '42.86', 'HK', '2-11-21-36-38-39-42', '2*test_exams_answer_faultt-11*test_exams_answer_faults-38*test_exams_answer_faultf-39*test_exams_answer_faults', '7', '4', null);
INSERT INTO `employee_correct_rate` VALUES ('80', '34', '3', '37.5', 'HK', '12-15-18-34-35-41-43-51', '18*test_exams_answer_faults-34*test_exams_answer_faults-35*test_exams_answer_faults-41*test_exams_answer_faultf-43*test_exams_answer_faultf', '8', '5', null);
INSERT INTO `employee_correct_rate` VALUES ('81', '28', '2', '', 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('82', '28', '2', null, 'HK', null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('83', '28', '2', '26.67', 'HK', '2-11-20-21-36-38-39-42-45-46-47-48-50-51-52', '2*test_exams_answer_faultf-11*test_exams_answer_faultf-20*test_exams_answer_faultf-21*test_exams_answer_faultt-36*test_exams_answer_faults-39*test_exams_answer_faults-45*test_exams_answer_faultt-46*test_exams_answer_faultt-47*test_exams_answer_faultf-48*test_exams_answer_faultf-52*test_exams_answer_faultt', '15', '11', null);
INSERT INTO `employee_correct_rate` VALUES ('84', '27', '6', '25', 'HK', '17-20-21-36-37-40-41-42-45-46-48-49', '17*test_exams_answer_faults-20*test_exams_answer_faults-21*test_exams_answer_faultt-36*test_exams_answer_faultt-40*test_exams_answer_faultt-41*test_exams_answer_faultf-42*test_exams_answer_faultt-45*test_exams_answer_faultt-46*test_exams_answer_faultt', '12', '9', null);
INSERT INTO `employee_correct_rate` VALUES ('85', '27', '5', '33.33', 'HK', '17-19-20-35-36-37-42-43-44-45-46-47', '17*test_exams_answer_faultt-20*test_exams_answer_faultt-35*test_exams_answer_faultt-36*test_exams_answer_faults-42*test_exams_answer_faultt-43*test_exams_answer_faults-45*test_exams_answer_faults-46*test_exams_answer_faultt', '12', '8', '2017-12-30 15:52:50');
INSERT INTO `employee_correct_rate` VALUES ('86', '32', '3', '9.09', 'HK', '12-15-18-20-34-35-40-43-50-51-52', '12*test_exams_answer_faultt-15*test_exams_answer_faultf-18*test_exams_answer_faultt-20*test_exams_answer_faultt-34*test_exams_answer_faultt-40*test_exams_answer_faultf-43*test_exams_answer_faults-50*test_exams_answer_faults-51*test_exams_answer_faultt-52*test_exams_answer_faults', '11', '10', '2017-12-30 16:14:24-');
INSERT INTO `employee_correct_rate` VALUES ('87', '28', '3', '6.67', 'HK', '10-12-14-15-18-20-34-35-40-41-43-50-51-52-53', '10*test_exams_answer_faults-12*test_exams_answer_faultt-14*test_exams_answer_faultt-15*test_exams_answer_faults-18*test_exams_answer_faultt-20*test_exams_answer_faultt-34*test_exams_answer_faultt-35*test_exams_answer_faultt-40*test_exams_answer_faultf-41*test_exams_answer_faultt-50*test_exams_answer_faults-51*test_exams_answer_faultf-52*test_exams_answer_faultf-53*test_exams_answer_faultt', '15', '14', '58');

-- ----------------------------
-- Table structure for `employee_info`
-- ----------------------------
DROP TABLE IF EXISTS `employee_info`;
CREATE TABLE `employee_info` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `employee_info_name` varchar(20) DEFAULT NULL,
  `employee_info_borthdate` varchar(30) DEFAULT NULL,
  `employee_info_phone` varchar(15) DEFAULT NULL,
  `city_privileges` char(5) DEFAULT NULL,
  `employee_info_quiz` char(20) DEFAULT NULL COMMENT '员工是否有测试经历(1为有  0为没有)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee_info
-- ----------------------------
INSERT INTO `employee_info` VALUES ('1', '小张', '小张生日', null, null, '');
INSERT INTO `employee_info` VALUES ('2', '小李', '小李生日', null, null, '');
INSERT INTO `employee_info` VALUES ('3', '小明', '小明生日', null, null, '');
INSERT INTO `employee_info` VALUES ('4', '小何', '小何生日', null, null, '');
INSERT INTO `employee_info` VALUES ('5', '小王', '小王生日', null, null, '');
INSERT INTO `employee_info` VALUES ('6', '小赵', '小赵生日', null, null, '');

-- ----------------------------
-- Table structure for `employee_middle_wrong_exams`
-- ----------------------------
DROP TABLE IF EXISTS `employee_middle_wrong_exams`;
CREATE TABLE `employee_middle_wrong_exams` (
  `id` int(100) NOT NULL AUTO_INCREMENT COMMENT '员工答错中间表主键',
  `employee_middle_wrong_info_id` int(50) DEFAULT NULL COMMENT '员工外键',
  `employee_middle_test_exams_id` int(100) DEFAULT NULL COMMENT '题目外键',
  `employee_middle_quiz_id` int(30) DEFAULT NULL COMMENT '测验外键',
  `city_privileges` char(5) DEFAULT NULL COMMENT '地区权限',
  `employee_middle_wrong_choice` varchar(30) DEFAULT NULL COMMENT '错误选项是什么',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=689 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee_middle_wrong_exams
-- ----------------------------
INSERT INTO `employee_middle_wrong_exams` VALUES ('571', '2', '2', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('572', '2', '11', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('573', '2', '20', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('574', '2', '21', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('575', '2', '36', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('576', '2', '39', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('577', '2', '45', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('578', '2', '46', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('579', '2', '47', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('580', '2', '48', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('581', '2', '52', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('582', '2', '38', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('583', '2', '42', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('584', '2', '49', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('585', '2', '37', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('586', '2', '40', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('587', '2', '43', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('588', '2', '44', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('589', '2', '5', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('590', '2', '14', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('591', '2', '18', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('592', '2', '34', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('593', '2', '35', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('594', '6', '17', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('595', '6', '20', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('596', '6', '21', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('597', '6', '36', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('598', '6', '40', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('599', '6', '41', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('600', '6', '42', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('601', '6', '45', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('602', '6', '46', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('627', '5', '17', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('628', '5', '20', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('629', '5', '35', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('630', '5', '36', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('631', '5', '42', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('632', '5', '43', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('633', '5', '45', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('634', '5', '46', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('661', '3', '10', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('662', '3', '12', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('663', '3', '14', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('664', '3', '15', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('665', '3', '18', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('666', '3', '20', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('667', '3', '34', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('668', '3', '35', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('669', '3', '40', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('670', '3', '41', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('671', '3', '50', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('672', '3', '51', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('673', '3', '52', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('674', '3', '53', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('675', '3', '43', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('676', '3', '6', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('677', '3', '39', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('678', '3', '44', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('679', '3', '47', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('680', '3', '48', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('681', '3', '49', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('682', '3', '54', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('683', '3', '13', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('684', '3', '36', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('685', '3', '38', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('686', '3', '42', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('687', '3', '45', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('688', '3', '46', '28', 'HK', '');

-- ----------------------------
-- Table structure for `quiz`
-- ----------------------------
DROP TABLE IF EXISTS `quiz`;
CREATE TABLE `quiz` (
  `id` int(50) NOT NULL AUTO_INCREMENT COMMENT '测验主键',
  `quiz_exams_count` int(20) DEFAULT NULL COMMENT '题目总数',
  `quiz_employee_id` varchar(200) DEFAULT NULL COMMENT 'FK=>array,员工外键',
  `quiz_date` varchar(15) DEFAULT NULL COMMENT '测验时段',
  `quiz_name` varchar(20) DEFAULT NULL COMMENT '测验名',
  `quiz_exams_id` varchar(300) DEFAULT NULL COMMENT '测验题目外键array=>FK',
  `quiz_correct_rate` varchar(20) DEFAULT NULL COMMENT '测验正确率',
  `city_privileges` char(5) DEFAULT NULL COMMENT '地区权限',
  `quiz_start_dt` timestamp NULL DEFAULT NULL COMMENT '时间段',
  `quiz_total_test_all` int(100) DEFAULT NULL COMMENT '该测验单的所考过的所有题目数量',
  `quiz_total_test_wrong_all` int(50) DEFAULT NULL COMMENT '错题数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='测验单表';

-- ----------------------------
-- Records of quiz
-- ----------------------------
INSERT INTO `quiz` VALUES ('23', '11', '1,3,6', '问题1修改', '17年秋季第一次测验', '1,3,5', '', 'HK', '2017-12-20 00:00:00', '12', '7');
INSERT INTO `quiz` VALUES ('26', '9', '3,4', '描述1.1', '17年秋季第二次测验', '1,2,3', '89555', 'HK', '2017-12-22 00:00:00', '12', '7');
INSERT INTO `quiz` VALUES ('27', '12', '5,6', '测验单描述', '17年秋季第三次测验', '1,2,3,4', '33.33', 'HK', '2017-12-13 00:00:00', '48', '32');
INSERT INTO `quiz` VALUES ('28', '15', '2,3', '描述详情测试单12', '17年秋季第四次测验', '1,2,3,4,5', '24.51', 'HK', '2017-12-28 00:00:00', '102', '77');
INSERT INTO `quiz` VALUES ('29', '4', '2,3,5,6', '问题描述13', '17年春季第一次测验', '1,2,3,5', '13%', 'HK', '2017-12-13 00:00:00', '12', '7');
INSERT INTO `quiz` VALUES ('30', '15', '2,3,6', '而是下拉', '17年春季第二次测验', '', '47.86', 'HK', null, '117', '56');
INSERT INTO `quiz` VALUES ('31', '12', '2,3,5,6', '下拉测试', '17年春季第三次测验', '', '58.33', 'HK', null, '108', '63');
INSERT INTO `quiz` VALUES ('32', '11', '2,3,5,6', '下拉测试', '17年春季第四次测验', '', '26.09', 'HK', null, '23', '17');
INSERT INTO `quiz` VALUES ('33', '10', '2,3,5,6', '测试下拉', '17年冬季第一次测验', '', '68.18', 'HK', null, '22', '15');
INSERT INTO `quiz` VALUES ('34', '8', '2,3,5,6', '描述89', '17年冬季第二次测验', '', '40', 'HK', null, '20', '12');
INSERT INTO `quiz` VALUES ('35', '7', '1,2,3', '描述90', '16年春季第一次测验', '', '42.11', 'HK', null, '19', '11');
INSERT INTO `quiz` VALUES ('36', '6', '2,3,4', '描述91', '16年春季第二次测验', '', '', 'HK', null, '12', '7');
INSERT INTO `quiz` VALUES ('37', '8', '3,4', '描述测试58', '16年春季第三次测验', '', '', 'HK', '2017-12-20 00:00:00', '12', '7');
INSERT INTO `quiz` VALUES ('38', '7', '1,2,3,4,6', '描述91', '18年春季第二次测验', '', '77.5', 'HK', '2017-12-13 00:00:00', '40', '31');

-- ----------------------------
-- Table structure for `test_exams`
-- ----------------------------
DROP TABLE IF EXISTS `test_exams`;
CREATE TABLE `test_exams` (
  `id` int(100) NOT NULL AUTO_INCREMENT COMMENT '测验题主键',
  `test_exams_contents` varchar(300) DEFAULT NULL COMMENT '测验题内容',
  `test_exams_answer_right` varchar(30) DEFAULT NULL COMMENT '测验题正确答案',
  `test_exams_answer_faultf` varchar(30) DEFAULT NULL COMMENT '错解一',
  `test_exams_answer_faults` varchar(30) DEFAULT NULL COMMENT '错解二',
  `test_exams_answer_faultt` varchar(30) DEFAULT NULL COMMENT 'wrong answer 3',
  `test_exams_kinds` tinyint(1) DEFAULT NULL COMMENT '测验题类型',
  `city_privileges` char(5) DEFAULT NULL COMMENT '地区权限1=>长期,0=>短期,2=>共存',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test_exams
-- ----------------------------
INSERT INTO `test_exams` VALUES ('1', '假如您的客户询问您有关产品的问题,您不知道如何回答,您的做法是', '以您认为对的答案,用好像了解的样子来回答', '承认您缺乏这方面的知识,然后去找正确答案', '答应将问题转呈给业务经理', '给他一个听来很好的答案', '3', 'HK');
INSERT INTO `test_exams` VALUES ('2', '当客户正在谈论,而且很明显,他所说的是错误的,您的做法是', '打断他的话,并予以纠正', '聆听然后改变话题', '聆听并找出错误之处', '利用反问使他发觉错误', '1', 'HK');
INSERT INTO `test_exams` VALUES ('5', '假如您觉得有点泄气时,您的做法是', '请一天假不去想公事', '强迫您自己更卖力去做', '尽量减少拜访', '请示业务经理和您一道去', '1', 'HK');
INSERT INTO `test_exams` VALUES ('6', '当您拜访经常吃闭门羹的客户时,您的做法是', '不必经常去拜访', '根本不去拜访他', '经常去拜访并试图去改善', '请示业务经理换人试试', '1', 'HK');
INSERT INTO `test_exams` VALUES ('8', '您碰到对方说\"您的价格太贵了\"您的做法是', '同意他的说法,然后改变话题', '先感谢他的看法,然后指出一分钱一分货', '不管客户的说法', '运用您强有力的辩解', '0', 'HK');
INSERT INTO `test_exams` VALUES ('10', '当您回答客户的相反意见之后,您的做法是', '保持沉默并等待客户开口', '变换主题,并继续销售', '继续举证,以支持您的观点', '试行订约', '2', 'HK');
INSERT INTO `test_exams` VALUES ('11', '当您进入客户的办公室时,正好他在阅读,他告诉您一边阅读,一边听您的话,那么您的做法是', '开始您的销售说明', '向他说您可以等他阅读完了再开始', '请求合适的时间再访', '请求对方全身聆听', '0', 'HK');
INSERT INTO `test_exams` VALUES ('12', '您正用电话去约客户安排拜访时间,总机小姐把您的电话转给他的秘书,秘书问您有什么事,您的做法是', '告诉她您希望和他商谈', '告诉她这是私事', '向她解释您的拜访将带给他莫大的好处', '告诉她您希望同他谈论您的商品', null, 'HK');
INSERT INTO `test_exams` VALUES ('13', '面对一个激进型的客户,您的做法是', '客气的', '过分的客气', '证明他错了', '拍他马屁', null, 'HK');
INSERT INTO `test_exams` VALUES ('14', '对付一个悲观的客户,您的做法是', '说些乐观的事', '对他的悲观四项一笑了之', '向他解答他的悲观外表是错误的', '引述事实并指出您的论点是完美的', null, 'HK');
INSERT INTO `test_exams` VALUES ('15', '在展示印刷的视觉辅助工具时,您的做法是', '在他阅读时,解释销售重点', '先销售视觉辅助工具,然后再按重点念给他听', '把辅助工具留下来,以待待查之后让他自己阅读', '希望他把这些印刷物张贴起来', null, 'HK');
INSERT INTO `test_exams` VALUES ('16', '客户告诉您,他正在考虑竞争者额产品,他征求您对竞争者的产品意见,您的做法是', '指出竞争者产品的不足', '称赞竞争者产品的特征', '表示知道他人的产品,然后继续销售您自己的产品', '开个玩笑以引开他的注意', null, 'HK');
INSERT INTO `test_exams` VALUES ('17', '当客户有购买的征兆,如\"什么时候可以送货\",您的做法是', '说明送货的时间,然后机修介绍您的产品特点', '告诉他送货时期,并请求订单', '告诉他送货时期,并试做销售提成', '告诉他送货时间并等候客户的下一步骤', null, 'HK');
INSERT INTO `test_exams` VALUES ('18', '当客户有怨言时,您的做法是', '打断他的话,并指责其错误之处', '注意聆听,虽然认为公司错了但有责任予以否认', '同意他的说法,并将错误归咎于您的业务经理', '注意聆听,判断怨言是否正确,适时答应予以纠正', null, 'HK');
INSERT INTO `test_exams` VALUES ('19', '假如客户要求打折,您的做法是', '答应回去后向业务经理要求', '告诉他没有折扣了', '解释贵公司的折扣情况,然后热心推介产品的特点', '不予理会', null, 'HK');
INSERT INTO `test_exams` VALUES ('20', '当销售店向您说:\"这种产品销售不好\"时,您的做法是', '告诉他其他零售店销售成功的实列', '告诉他产品没有照应该陈列方法陈列', '很技巧地建议商品计划的方法', '问他询问小路不好的原因,必要时将货取回', null, 'HK');
INSERT INTO `test_exams` VALUES ('21', '在获得订单后,您的做法是', '高兴地多谢他后才离开', '略为交谈他的嗜好', '告诉他:\"您做了一个明智的决定\"', '请他到附近去喝一杯', null, 'HK');
INSERT INTO `test_exams` VALUES ('34', '在开始做销售说明,您的做法是', '视图去发觉对方的嗜好,并交换意见', '谈谈气候', '谈论今早的新闻', '尽快谈您拜访他的理由,并说明他可获得的好处', null, 'HK');
INSERT INTO `test_exams` VALUES ('35', '在下列的情况,哪一种是销售员充分利用时间的做法,您的做法是', '将客户资料更新', '当他和客户面对面的时候', '在销售会议学习更好的销售方法', '在销售同事谈论时', null, 'HK');
INSERT INTO `test_exams` VALUES ('36', '当您的客户被第三者打岔时,您的做法是', '继续销售并不予理会', '停止销售并等候有利时间', '建议他在其他时间再来拜访', '请客户去喝一杯咖啡', '1', 'HK');
INSERT INTO `test_exams` VALUES ('37', '数据测试', '正确答案', '错解A', '错解B', '错解C', null, 'HK');
INSERT INTO `test_exams` VALUES ('38', '测试', '测试', '测试', '测试', '测试', '1', 'HK');
INSERT INTO `test_exams` VALUES ('39', '数据测试', '正确答案', '错解A', '错解B22222', '错解C22222', null, 'HK');
INSERT INTO `test_exams` VALUES ('40', '数据测试', '正确答案', '错解A', '错解B22222', '错解C22222', null, 'HK');
INSERT INTO `test_exams` VALUES ('41', '内容描述35', '答案A35', '错解A35', '错解B35', '错解C35', null, 'HK');
INSERT INTO `test_exams` VALUES ('42', '在医疗诊治活动中高度危险性物品,必须选用什么处理方法？', '消毒法', '灭菌法', '一般消毒', '清晰处置', null, 'HK');
INSERT INTO `test_exams` VALUES ('43', '进入组织或器官内部的器械,或与破损的组织、皮肤、粘膜密切接触的器材和用品的危险性分类是?', '高度危险性物品', '中毒危险性物品', '帝都危险性物品', '无危险性物品', null, 'HK');
INSERT INTO `test_exams` VALUES ('44', '微生物对消毒因子的抗力从高到低的顺序是？', '细菌芽孢、分枝杆菌、亲水性病毒、真菌孢子、真菌繁殖体、细菌繁', '细菌芽孢、真菌孢子、分枝杆菌、亲水性病毒、真菌繁殖体、细菌繁', '细菌芽孢、分枝杆菌、真菌孢子、亲水性病毒、真菌繁殖体、细菌繁', '真菌孢子、细菌芽孢、分枝杆菌、亲水性病毒、真菌繁殖体、细菌繁', null, 'HK');
INSERT INTO `test_exams` VALUES ('45', '医疗器械用下排气式压力蒸汽灭菌，一般需要维持的温度和时间分别是', '115℃，20—30 min ', '121℃，10—15 min', '121℃，15—30min', '115℃，20—30 min', null, 'HK');
INSERT INTO `test_exams` VALUES ('46', '压力蒸汽灭菌物品存放时间', '7天', '16天', '10-14天', '10小时', null, 'HK');
INSERT INTO `test_exams` VALUES ('47', '紫外线消毒的目标微生物不详时，照射计量不应低于', '10000μW*S/cm2', '600000μW*S/cm2', '60000μW*S/cm2', '100000μW*S/cm2', null, 'HK');
INSERT INTO `test_exams` VALUES ('48', '2%戊二醛对医疗器械浸泡消毒和灭菌的时间分别是', '20分钟达消毒要求，10小时达灭菌要求', '15分钟达消毒要求，4小时达灭菌要求', '45分钟达消毒要求，9小时达灭菌要求', '15分钟达消毒要求，8小时达灭菌要求', null, 'HK');
INSERT INTO `test_exams` VALUES ('49', '用碘伏对细菌繁殖体污染物品的消毒的浓度和时间分别是', '250mg/L，20min', ' 50mg/L，40min', '500mg/L，30min', '200mg/L，15min ', null, 'HK');
INSERT INTO `test_exams` VALUES ('50', '消毒是指杀灭或清除传播媒介上的', '病原细菌', '病原真菌', '病原病毒', '病原微生物', null, 'HK');
INSERT INTO `test_exams` VALUES ('51', '关于影响消毒灭菌效果的因素，下述错误的提法是', '凡是消毒剂，其浓度越高消毒效果越好', '同一消毒剂对不同微生物的杀菌效果不同', '一般温度升高，可提高消毒效果', '消毒剂的杀菌作用受酸碱度影响', null, 'HK');
INSERT INTO `test_exams` VALUES ('52', '在消毒试验中，可用杀灭对数值（KL）表示消毒效果。当KL＝2时，相应杀灭的微生物的百分率为', ' 99.999％', '99.99％', '99.9％', '99％', null, 'HK');
INSERT INTO `test_exams` VALUES ('53', '若某消毒方法的D值为15，则表示该方法', '作用15min，微生物杀灭率可达到100％', '作用15min，微生物杀灭率可达到99％', '作用15min，微生物杀灭率可达到90％', '作用10min，微生物杀灭率可达到50％', null, 'HK');
INSERT INTO `test_exams` VALUES ('54', '残留消毒剂的去除方法包括', '化学中和法', '过滤冲洗法', '稀释法', '离心沉淀法', null, 'HK');
INSERT INTO `test_exams` VALUES ('55', '一般认为，下列微生物中对消毒因子的敏感性最高的是', '细菌繁殖体', '真菌', '亲水病毒（没有脂质包膜的病毒），例如甲型肝炎病毒、脊髓灰质炎', '亲脂病毒（有脂质膜的病毒），例如乙型肝炎病毒、流感病毒等', null, 'HK');
INSERT INTO `test_exams` VALUES ('56', '卫生用品的杀菌性能判定为有杀菌作用时，其杀菌率应为', '杀菌率≥50%', '杀菌率≥90%', '杀菌率≥99%', '杀菌率≥99.9% ', null, 'HK');
INSERT INTO `test_exams` VALUES ('57', '医院消毒效果监测合理的采样时间是', '消毒处理后、医疗活动之前', '医疗活动之中', '医疗活动之后', '随机', null, 'HK');
INSERT INTO `test_exams` VALUES ('58', '干热灭菌效果监测中，生物法常使用的指标菌是', '枯草杆菌黑色变种芽胞（ATCC9372）', '短小杆菌芽胞（E601）', '嗜热脂肪杆菌芽胞（ATCC7953或SSIK31）', '大肠杆菌（8099）E. 白色念珠菌', null, 'HK');
INSERT INTO `test_exams` VALUES ('59', '．《一次性使用卫生用品卫生标准》中规定，生产环境中空气采样应该在下列何种状态下进行', '静态（室内设备正常运行，无工作人员）', '动态（室内设备正常运行，人员正常操作）', '空态（室内无设备和人员）', '消毒处理过程中', null, 'HK');
INSERT INTO `test_exams` VALUES ('60', '《医院消毒卫生标准》中规定，正常情况下物体表面和医护人员手的采样面积分别是', '25cm2，25cm2', '25cm2，30cm2', '50cm2，50cm2', '100cm2，30cm2 ', null, 'HK');
INSERT INTO `test_exams` VALUES ('61', '《医院消毒卫生标准》中规定，使用中消毒液的合格标准是', '无菌，致病性微生物不得检出；', '细菌菌落总数≤10cfu/ml，致病性微生物不得检出', '细菌菌落总数≤20cfu/ml，致病性微生物不得检出', '细菌菌落总数≤100cfu/ml，致病性微生物不得检出', null, 'HK');
INSERT INTO `test_exams` VALUES ('62', '空气过滤除菌的原理是', '随流阻挡', '重力沉降', '静电吸附', '扩散粘留', null, 'HK');
INSERT INTO `test_exams` VALUES ('63', '问题测试的结果', '正解', '错解A', '错解B', '错解C', null, 'HK');
INSERT INTO `test_exams` VALUES ('64', '问题测试的结果2', '正解2', '错解A2', '错解B2', '错解C2', null, 'HK');
INSERT INTO `test_exams` VALUES ('65', '问题测试的结果3', '正解3', '错解A3', '错解B3', '错解C3', null, 'HK');

-- ----------------------------
-- Table structure for `t_exams`
-- ----------------------------
DROP TABLE IF EXISTS `t_exams`;
CREATE TABLE `t_exams` (
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
-- Records of t_exams
-- ----------------------------
