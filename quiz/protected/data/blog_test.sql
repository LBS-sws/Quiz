/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : blog_test

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-01-09 18:01:40
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
  `employee_quiz_start_date` varchar(50) DEFAULT NULL COMMENT '开始的时间',
  PRIMARY KEY (`employee_correct_rate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee_correct_rate
-- ----------------------------
INSERT INTO `employee_correct_rate` VALUES ('1', '5', '27', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('2', '1', '2', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('3', '1', '2', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('4', '1', '2', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('5', '1', '2', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('6', '1', '2', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('7', '1', '2', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('8', '1', '2', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('9', '30', '3', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('10', '31', '3', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('11', '28', '0', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('12', '30', '3', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('13', '27', '6', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('14', '26', '4', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('15', '27', '6', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('16', '26', '2', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('17', '38', '2', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('18', '32', '3', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('19', '32', '3', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('20', '23', '1', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('21', '23', '1', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('22', '23', '1', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('23', '23', '1', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('24', '38', '6', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('25', '23', '1', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('26', '23', '1', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('27', '23', '1', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('28', '29', '2', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('29', '23', '1', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('30', '29', '2', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('31', '38', '1', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('32', '38', '6', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('33', '32', '3', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('34', '38', '6', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('35', '38', '6', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('36', '38', '6', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('37', '30', '2', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('38', '31', '5', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('39', '38', '2', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('40', '29', '5', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('41', '29', '5', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('42', '29', '5', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('43', '31', '2', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('44', '29', '2', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('45', '29', '2', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('46', '29', '2', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('47', '29', '2', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('48', '29', '2', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('49', '29', '2', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('50', '29', '2', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('51', '29', '2', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('52', '29', '2', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('53', '29', '2', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('54', '29', '2', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('55', '38', '2', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('56', '38', '6', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('57', '38', '6', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('58', '38', '6', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('59', '38', '6', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('60', '38', '6', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('61', '38', '6', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('62', '38', '6', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('63', '23', '6', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('64', '38', '6', '28.57', 'HK', '8-11-12-16-20-35-36', null, '7', '5', null, null);
INSERT INTO `employee_correct_rate` VALUES ('65', '29', '3', '0', 'HK', '2-5-12-15', null, '4', '4', null, null);
INSERT INTO `employee_correct_rate` VALUES ('66', '28', '2', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('67', '32', '5', '18.18', 'HK', '1-10-14-15-19-21-34-37-39-40-43', null, '11', '9', null, null);
INSERT INTO `employee_correct_rate` VALUES ('68', '31', '3', '41.67', 'HK', '15-16-17-20-21-34-35-37-38-41-44-45', '16*test_exams_answer_faults-17*test_exams_answer_faultt-21*test_exams_answer_faultf-34*test_exams_an', '12', '7', null, null);
INSERT INTO `employee_correct_rate` VALUES ('69', '30', '3', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('70', '27', '6', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('71', '30', '3', '46.67', 'HK', '16-17-21-34-37-41', '16*test_exams_answer_faults-17*test_exams_answer_faultt-21*test_exams_answer_faultf-34*test_exams_an', '15', '7', null, null);
INSERT INTO `employee_correct_rate` VALUES ('72', '38', '2', '128.57', 'HK', '18-19-36-39-41-43', '18*test_exams_answer_faultt-19*test_exams_answer_faults-36*test_exams_answer_faultf-39*test_exams_an', '7', '9', null, null);
INSERT INTO `employee_correct_rate` VALUES ('73', '38', '2', '71.43', 'HK', '5-14-18-19-34-35-36', '5*test_exams_answer_faultf-14*test_exams_answer_faults-18*test_exams_answer_faultt-34*test_exams_answer_faultf-35*test_exams_answer_faults-36*test_exams_answer_faultt', '7', '5', null, null);
INSERT INTO `employee_correct_rate` VALUES ('74', '33', '3', '20', 'HK', '13-18-20-34-36-38-40-42-45-46', '13*test_exams_answer_faultt-18*test_exams_answer_faultf-20*test_exams_answer_faultf-34*test_exams_answer_faults-36*test_exams_answer_faults-38*test_exams_answer_faultf-42*test_exams_answer_faults-45*test_exams_answer_faults-46*test_exams_answer_faultf', '10', '8', null, null);
INSERT INTO `employee_correct_rate` VALUES ('75', '28', '3', '13.33', 'HK', '6-12-15-17-18-20-34-35-39-40-41-43-44-47-48', '6*test_exams_answer_faults-12*test_exams_answer_faults-15*test_exams_answer_faultf-18*test_exams_answer_faultf-20*test_exams_answer_faultf-34*test_exams_answer_faultt-35*test_exams_answer_faultf-39*test_exams_answer_faultt-40*test_exams_answer_faults-41*test_exams_answer_faultt-43*test_exams_answer_faults-44*test_exams_answer_faults-47*test_exams_answer_faultt', '15', '13', null, null);
INSERT INTO `employee_correct_rate` VALUES ('76', '28', '3', '13.33', 'HK', '6-12-15-18-20-34-35-39-40-41-43-50-51-52-53', '12*test_exams_answer_faults-15*test_exams_answer_faults-18*test_exams_answer_faultt-20*test_exams_answer_faultt-34*test_exams_answer_faultf-35*test_exams_answer_faultf-40*test_exams_answer_faultf-41*test_exams_answer_faultt-43*test_exams_answer_faults-50*test_exams_answer_faultt-51*test_exams_answer_faultt-52*test_exams_answer_faultf-53*test_exams_answer_faultt', '15', '13', null, null);
INSERT INTO `employee_correct_rate` VALUES ('77', '28', '2', '40', 'HK', '2-19-20-21-36-37-38-39-40-43-44-46-47', '2*test_exams_answer_faults-21*test_exams_answer_faults-36*test_exams_answer_faults-37*test_exams_answer_faultt-38*test_exams_answer_faults-39*test_exams_answer_faults-40*test_exams_answer_faultt-43*test_exams_answer_faults-44*test_exams_answer_faultt', '15', '9', null, null);
INSERT INTO `employee_correct_rate` VALUES ('78', '28', '2', '33.33', 'HK', '2-11-20-21-36-37-38-39-40-42-47-48-49-50-51', '2*test_exams_answer_faults-11*test_exams_answer_faultf-21*test_exams_answer_faultt-36*test_exams_answer_faultt-38*test_exams_answer_faults-39*test_exams_answer_faults-42*test_exams_answer_faultt-47*test_exams_answer_faultt-48*test_exams_answer_faultt-49*test_exams_answer_faultt', '15', '10', null, null);
INSERT INTO `employee_correct_rate` VALUES ('79', '35', '2', '42.86', 'HK', '2-11-21-36-38-39-42', '2*test_exams_answer_faultt-11*test_exams_answer_faults-38*test_exams_answer_faultf-39*test_exams_answer_faults', '7', '4', null, null);
INSERT INTO `employee_correct_rate` VALUES ('80', '34', '3', '37.5', 'HK', '12-15-18-34-35-41-43-51', '18*test_exams_answer_faults-34*test_exams_answer_faults-35*test_exams_answer_faults-41*test_exams_answer_faultf-43*test_exams_answer_faultf', '8', '5', null, null);
INSERT INTO `employee_correct_rate` VALUES ('81', '28', '2', '', 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('82', '28', '2', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('83', '28', '2', '26.67', 'HK', '2-11-20-21-36-38-39-42-45-46-47-48-50-51-52', '2*test_exams_answer_faultf-11*test_exams_answer_faultf-20*test_exams_answer_faultf-21*test_exams_answer_faultt-36*test_exams_answer_faults-39*test_exams_answer_faults-45*test_exams_answer_faultt-46*test_exams_answer_faultt-47*test_exams_answer_faultf-48*test_exams_answer_faultf-52*test_exams_answer_faultt', '15', '11', null, null);
INSERT INTO `employee_correct_rate` VALUES ('84', '27', '6', '25', 'HK', '17-20-21-36-37-40-41-42-45-46-48-49', '17*test_exams_answer_faults-20*test_exams_answer_faults-21*test_exams_answer_faultt-36*test_exams_answer_faultt-40*test_exams_answer_faultt-41*test_exams_answer_faultf-42*test_exams_answer_faultt-45*test_exams_answer_faultt-46*test_exams_answer_faultt', '12', '9', null, null);
INSERT INTO `employee_correct_rate` VALUES ('85', '27', '5', '33.33', 'HK', '17-19-20-35-36-37-42-43-44-45-46-47', '17*test_exams_answer_faultt-20*test_exams_answer_faultt-35*test_exams_answer_faultt-36*test_exams_answer_faults-42*test_exams_answer_faultt-43*test_exams_answer_faults-45*test_exams_answer_faults-46*test_exams_answer_faultt', '12', '8', '2017-12-30 15:52:50', null);
INSERT INTO `employee_correct_rate` VALUES ('86', '32', '3', '9.09', 'HK', '12-15-18-20-34-35-40-43-50-51-52', '12*test_exams_answer_faultt-15*test_exams_answer_faultf-18*test_exams_answer_faultt-20*test_exams_answer_faultt-34*test_exams_answer_faultt-40*test_exams_answer_faultf-43*test_exams_answer_faults-50*test_exams_answer_faults-51*test_exams_answer_faultt-52*test_exams_answer_faults', '11', '10', '2017-12-30 16:14:24-', null);
INSERT INTO `employee_correct_rate` VALUES ('87', '28', '3', '6.67', 'HK', '10-12-14-15-18-20-34-35-40-41-43-50-51-52-53', '10*test_exams_answer_faults-12*test_exams_answer_faultt-14*test_exams_answer_faultt-15*test_exams_answer_faults-18*test_exams_answer_faultt-20*test_exams_answer_faultt-34*test_exams_answer_faultt-35*test_exams_answer_faultt-40*test_exams_answer_faultf-41*test_exams_answer_faultt-50*test_exams_answer_faults-51*test_exams_answer_faultf-52*test_exams_answer_faultf-53*test_exams_answer_faultt', '15', '14', '58', null);
INSERT INTO `employee_correct_rate` VALUES ('88', '27', '6', '41.67', 'HK', '12-15-17-18-36-37-39-40-41-43-44-47', '12*test_exams_answer_faultf-17*test_exams_answer_faults-37*test_exams_answer_faultt-40*test_exams_answer_faultf-43*test_exams_answer_faultt-44*test_exams_answer_faultt-47*test_exams_answer_faults', '12', '7', '29', null);
INSERT INTO `employee_correct_rate` VALUES ('89', '27', '5', '16.67', 'HK', '12-13-17-18-20-21-34-35-36-38-39-40', '12*test_exams_answer_faultf-13*test_exams_answer_faultt-17*test_exams_answer_faults-18*test_exams_answer_faultf-21*test_exams_answer_faults-35*test_exams_answer_faultf-36*test_exams_answer_faultt-38*test_exams_answer_faults-39*test_exams_answer_faults-40*test_exams_answer_faultf', '12', '10', '13', null);
INSERT INTO `employee_correct_rate` VALUES ('90', '29', '3', '75', 'HK', '10-12-15-18', '15*test_exams_answer_faults', '4', '1', '5', null);
INSERT INTO `employee_correct_rate` VALUES ('91', '38', '2', '71.43', 'HK', '11-20-21-38-45-47-52', '21*test_exams_answer_faults-45*test_exams_answer_faultt', '7', '2', '2', null);
INSERT INTO `employee_correct_rate` VALUES ('92', '29', '3', '0', 'HK', '10-12-14-15', '10*test_exams_answer_faults-12*test_exams_answer_faults-14*test_exams_answer_faultf-15*test_exams_answer_faults', '4', '4', '12', null);
INSERT INTO `employee_correct_rate` VALUES ('93', '27', '5', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('94', '30', '2', '20', 'HK', '2-10-11-16-19-20-21-36-39-41-45-46-47-48-52', '2*test_exams_answer_faults-10*test_exams_answer_faults-11*test_exams_answer_faultt-19*test_exams_answer_faults-21*test_exams_answer_faultt-36*test_exams_answer_faultt-39*test_exams_answer_faults-41*test_exams_answer_faults-46*test_exams_answer_faults-47*test_exams_answer_faults-48*test_exams_answer_faultf-52*test_exams_answer_faults', '15', '12', '20', null);
INSERT INTO `employee_correct_rate` VALUES ('95', '23', '1', '100', 'HK', '15', '', '1', '0', '20', null);
INSERT INTO `employee_correct_rate` VALUES ('96', '23', '3', '100', 'HK', '10', '', '1', '0', '12', null);
INSERT INTO `employee_correct_rate` VALUES ('97', '23', '1', '0', 'HK', '2', '2*test_exams_answer_faultt', '1', '1', '21', null);
INSERT INTO `employee_correct_rate` VALUES ('98', '29', '7', '25', 'HK', '10-11-35-37-40-43-44-45', '10*test_exams_answer_faultt-11*test_exams_answer_faults-35*test_exams_answer_faultf-37*test_exams_answer_faults-40*test_exams_answer_faultf-43*test_exams_answer_faults', '8', '6', '12', null);
INSERT INTO `employee_correct_rate` VALUES ('99', '29', '7', '37.5', 'HK', '10-19-35-37-38', '10*test_exams_answer_faultt-19*test_exams_answer_faultf-35*test_exams_answer_faults-37*test_exams_answer_faultf-38*test_exams_answer_faults', '8', '5', '1', null);
INSERT INTO `employee_correct_rate` VALUES ('100', '29', '7', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('101', '29', '7', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('102', '29', '7', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('103', '29', '7', '62.5', 'HK', '10-12-16', '10*test_exams_answer_faultt-12*test_exams_answer_faultf-16*test_exams_answer_faultf', '8', '3', '5', null);
INSERT INTO `employee_correct_rate` VALUES ('104', '29', '7', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('105', '29', '7', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('106', '29', '7', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('107', '29', '7', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('108', '29', '7', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('109', '28', '3', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('110', '29', '7', '62.5', 'HK', '10-12-16-17-19', '10*test_exams_answer_faults-12*test_exams_answer_faults-17*test_exams_answer_faultf', '8', '3', '8', null);
INSERT INTO `employee_correct_rate` VALUES ('111', '29', '7', '25', 'HK', '8-10-12-16-17-18-19-35', '10*test_exams_answer_faultt-12*test_exams_answer_faultf-16*test_exams_answer_faultt-17*test_exams_answer_faultf-19*test_exams_answer_faults-35*test_exams_answer_faults', '8', '6', '14', null);
INSERT INTO `employee_correct_rate` VALUES ('112', '28', '3', '20', 'HK', '10-12-15-18-19-20-34-35-40-41-43-50-51-52-53', '10*test_exams_answer_faults-12*test_exams_answer_faultf-18*test_exams_answer_faultt-20*test_exams_answer_faultt-34*test_exams_answer_faultf-35*test_exams_answer_faultt-41*test_exams_answer_faults-43*test_exams_answer_faultf-50*test_exams_answer_faults-51*test_exams_answer_faultf-52*test_exams_answer_faultf-53*test_exams_answer_faults', '15', '12', '16', null);
INSERT INTO `employee_correct_rate` VALUES ('113', '29', '7', '25', 'HK', '1-12-16-17-19-35', '1*test_exams_answer_faultt-12*test_exams_answer_faults-16*test_exams_answer_faults-17*test_exams_answer_faultf-19*test_exams_answer_faults-35*test_exams_answer_faults', '8', '6', '12', null);
INSERT INTO `employee_correct_rate` VALUES ('114', '27', '5', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('115', '27', '5', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('116', '28', '3', '46.67', 'HK', '10-12-14-15-18-20-34-35-37-40-41-43', '10*test_exams_answer_faults-12*test_exams_answer_faultf-14*test_exams_answer_faults-18*test_exams_answer_faults-20*test_exams_answer_faults-35*test_exams_answer_faultf-41*test_exams_answer_faultt-43*test_exams_answer_faultt', '15', '8', '19', null);
INSERT INTO `employee_correct_rate` VALUES ('117', '43', '8', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('118', '43', '8', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('119', '33', '3', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('120', '28', '3', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('121', '43', '8', '75', 'HK', '11-14-15', '11*test_exams_answer_faultf-14*test_exams_answer_faultt-15*test_exams_answer_faults', '12', '3', '5', null);
INSERT INTO `employee_correct_rate` VALUES ('122', '43', '8', '8.33', 'HK', '8-11-16-35-36-38-43-44-45-46-47-48', '8*test_exams_answer_faultf-11*test_exams_answer_faults-16*test_exams_answer_faultf-35*test_exams_answer_faults-36*test_exams_answer_faults-38*test_exams_answer_faultt-43*test_exams_answer_faults-44*test_exams_answer_faultt-45*test_exams_answer_faultt-46*test_exams_answer_faultt-48*test_exams_answer_faults', '12', '11', '21', null);
INSERT INTO `employee_correct_rate` VALUES ('123', '28', '2', '60', 'HK', '2-19-20-21-36-42-46-47-48-49-50-51-52', '19*test_exams_answer_faults-20*test_exams_answer_faultt-36*test_exams_answer_faults-42*test_exams_answer_faultf-47*test_exams_answer_faults-50*test_exams_answer_faultt', '15', '6', '16', null);
INSERT INTO `employee_correct_rate` VALUES ('124', '32', '5', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('125', '44', '7', '76.92', 'HK', '1-12-13', '1*test_exams_answer_faultt-12*test_exams_answer_faults-13*test_exams_answer_faultf', '13', '3', '6', null);
INSERT INTO `employee_correct_rate` VALUES ('126', '44', '7', '76.92', 'HK', '1-11-12', '1*test_exams_answer_faults-11*test_exams_answer_faultt-12*test_exams_answer_faultt', '13', '3', '9', null);
INSERT INTO `employee_correct_rate` VALUES ('127', '23', '400047', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('128', '23', '400047', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('129', '23', '47', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('130', '23', '47', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('131', '23', '47', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('132', '23', '47', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('133', '23', '47', '45.45', 'HK', '12-19-34-36-42-43-45-46-48', '12*test_exams_answer_faults-42*test_exams_answer_faults-43*test_exams_answer_faultf-45*test_exams_answer_faultf-46*test_exams_answer_faultf-48*test_exams_answer_faults', '11', '6', '20', null);
INSERT INTO `employee_correct_rate` VALUES ('134', '23', '1', '36.36', 'HK', '2-8-18-20-36-42-43-45-46', '2*test_exams_answer_faultt-8*test_exams_answer_faultf-20*test_exams_answer_faults-42*test_exams_answer_faults-43*test_exams_answer_faultf-45*test_exams_answer_faultt-46*test_exams_answer_faultf', '11', '7', '19', null);
INSERT INTO `employee_correct_rate` VALUES ('135', '23', '1', '90.91', 'HK', '2-8-14-17-20-36-44-48-54-55-57', '57*test_exams_answer_faultt', '11', '1', '56', null);
INSERT INTO `employee_correct_rate` VALUES ('136', '23', '1', '18.18', 'HK', '8-20-35-43-46-51-58-66-68-69-70', '8*test_exams_answer_faultf-20*test_exams_answer_faultf-43*test_exams_answer_faults-46*test_exams_answer_faultf-51*test_exams_answer_faultf-58*test_exams_answer_faultf-66*test_exams_answer_faultt-68*test_exams_answer_faultf-70*test_exams_answer_faultf', '11', '9', '23', null);
INSERT INTO `employee_correct_rate` VALUES ('137', '26', '47', '22.22', 'HK', '12-13-43-44-45-51-57-61-62', '12*test_exams_answer_faultf-13*test_exams_answer_faults-43*test_exams_answer_faults-44*test_exams_answer_faults-45*test_exams_answer_faultt-51*test_exams_answer_faults-62*test_exams_answer_faultt', '9', '7', '11', null);
INSERT INTO `employee_correct_rate` VALUES ('138', '26', '1', null, 'HK', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('139', '26', '1', '11.11', 'HK', '8-20-34-45-46-48-56', '8*test_exams_answer_faultt-20*test_exams_answer_faults-45*test_exams_answer_faultt-46*test_exams_answer_faultt-48*test_exams_answer_faultt-56*test_exams_answer_faultt', '9', '6', '13', null);
INSERT INTO `employee_correct_rate` VALUES ('140', '26', '1', null, 'HK', null, null, null, null, null, '');
INSERT INTO `employee_correct_rate` VALUES ('141', '26', '1', '11.11', 'HK', '2-6-45-46-47-48-56-57', '2*test_exams_answer_faultt-45*test_exams_answer_faultt-46*test_exams_answer_faultt-47*test_exams_answer_faults-48*test_exams_answer_faults-56*test_exams_answer_faults-57*test_exams_answer_faultt', '9', '7', '17', '2018-01-08 11:45:51');
INSERT INTO `employee_correct_rate` VALUES ('142', '33', '1', '10', 'HK', '2-8-20-34-42-45-48-58-67', '2*test_exams_answer_faults-8*test_exams_answer_faultf-20*test_exams_answer_faultf-34*test_exams_answer_faults-45*test_exams_answer_faultt-48*test_exams_answer_faultt-58*test_exams_answer_faults-67*test_exams_answer_faults', '10', '8', '11', '2018-01-08 11:50:14');
INSERT INTO `employee_correct_rate` VALUES ('143', '23', '39', null, 'HK', null, null, null, null, null, '2018-01-09 11:32:05');
INSERT INTO `employee_correct_rate` VALUES ('144', '23', '39', null, 'HK', null, null, null, null, null, '2018-01-09 11:32:36');
INSERT INTO `employee_correct_rate` VALUES ('145', '23', '47', '18.18', 'HK', '13-15-20-42-43-46-48-63-65-67', '13*test_exams_answer_faultf-15*test_exams_answer_faultf-20*test_exams_answer_faults-43*test_exams_answer_faults-46*test_exams_answer_faults-48*test_exams_answer_faultt-63*test_exams_answer_faultt-65*test_exams_answer_faultt', '11', '8', '13', '2018-01-09 14:06:40');
INSERT INTO `employee_correct_rate` VALUES ('146', '23', '217', '18.18', 'HK', '53-55-72-73-54-56-64-17-62-67-19', '53*test_exams_answer_faultt-55*test_exams_answer_faults-72*test_exams_answer_faults-56*test_exams_answer_faultt-64*test_exams_answer_faultf-17*test_exams_answer_faultf-62*test_exams_answer_faultf-67*test_exams_answer_faultf-19*test_exams_answer_faultf', '11', '9', '17', '2018-01-09 14:22:29');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee_info
-- ----------------------------
INSERT INTO `employee_info` VALUES ('1', '小张', '小张生日', null, 'HK', '');
INSERT INTO `employee_info` VALUES ('2', '小李', '小李生日', null, 'HK', '');
INSERT INTO `employee_info` VALUES ('3', '小明', '小明生日', null, 'HK', '');
INSERT INTO `employee_info` VALUES ('4', '小何', '小何生日', null, 'HK', '');
INSERT INTO `employee_info` VALUES ('5', '小王', '小王生日', null, 'HK', '');
INSERT INTO `employee_info` VALUES ('6', '小赵', '小赵生日', null, 'HK', '');
INSERT INTO `employee_info` VALUES ('7', '小静', '小静生日', null, 'HK', null);
INSERT INTO `employee_info` VALUES ('8', '小刘', '小刘生日', null, 'HK', null);

-- ----------------------------
-- Table structure for `employee_info_v`
-- ----------------------------
DROP TABLE IF EXISTS `employee_info_v`;
CREATE TABLE `employee_info_v` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `employee_info_code` varchar(20) DEFAULT NULL,
  `employee_info_name` varchar(30) NOT NULL,
  `employee_info_birthdate` varchar(40) DEFAULT NULL,
  `employee_info_phone` varchar(20) DEFAULT NULL,
  `city_privileges` char(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee_info_v
-- ----------------------------
INSERT INTO `employee_info_v` VALUES ('39', '400039', '刘比胜', '1972-09-01', '1424232121', 'CD');
INSERT INTO `employee_info_v` VALUES ('40', '400040', '郑晓东', '1982/08/01', '14394545433', 'CD');
INSERT INTO `employee_info_v` VALUES ('41', '400041', '姚星辰', '1988-06-12', '1920923729', 'CD');
INSERT INTO `employee_info_v` VALUES ('42', '400042', '陈思维', '2017-09-21', '23123812738798', 'SH');
INSERT INTO `employee_info_v` VALUES ('43', '400043', '高天启', '1976-09-03', '188123232112', 'CD');
INSERT INTO `employee_info_v` VALUES ('44', '400044', '赖产型', '1975-01-03', '1232137218937982', 'CD');
INSERT INTO `employee_info_v` VALUES ('45', '400045', '游荣为', '2007-09-19', '12312321', 'CD');
INSERT INTO `employee_info_v` VALUES ('46', '400046', '陳大文', '1999-01-01', '12345678', 'SH');
INSERT INTO `employee_info_v` VALUES ('47', '400047', '车核桃', '2017-09-01', '123132342', 'CD');
INSERT INTO `employee_info_v` VALUES ('48', '400048', '沟参与', '2078-02-03', '12321323213', 'CD');
INSERT INTO `employee_info_v` VALUES ('49', '400049', 'Chan Tai M', '1997-01-01', '12234', 'CD');
INSERT INTO `employee_info_v` VALUES ('50', '400050', '古巨基', '2017-10-11', '33123213', 'CD');
INSERT INTO `employee_info_v` VALUES ('51', '400051', '陳小文', '1998-01-01', '12345678', 'SH');
INSERT INTO `employee_info_v` VALUES ('52', '400052', '陈士骏', '2004-09-11', '123123213', 'CN');
INSERT INTO `employee_info_v` VALUES ('53', '400053', '陈龙', '1979-07-11', '13789898989', 'XA');
INSERT INTO `employee_info_v` VALUES ('54', '400054', '权志龙', '1988/06/16', '155232641055', 'ZS');
INSERT INTO `employee_info_v` VALUES ('55', '400055', '测试', '2013/05/30', '12312311', 'SH');
INSERT INTO `employee_info_v` VALUES ('56', '400056', '陳大文', '', '123124', 'SH');
INSERT INTO `employee_info_v` VALUES ('57', '400057', '张艺兴', '1989/10/04', '12345678979', 'CD');
INSERT INTO `employee_info_v` VALUES ('58', '400058', '巡到时', '2001/09/12', '1232323213', 'CN');
INSERT INTO `employee_info_v` VALUES ('60', '400060', '鹿晗', '1989/04/07', '12345678', 'CD');
INSERT INTO `employee_info_v` VALUES ('61', '400061', '陈达标', '1986/11/17', '12321321121', 'CN');
INSERT INTO `employee_info_v` VALUES ('62', '400062', '张三', '1984/08/09', '123456', 'CD');
INSERT INTO `employee_info_v` VALUES ('63', '400063', '陈手刃', '1980/12/12', '123213232', 'CN');
INSERT INTO `employee_info_v` VALUES ('64', '400064', '吴亦凡', '1994/12/14', '123456789', 'CD');
INSERT INTO `employee_info_v` VALUES ('65', '400065', '刘更新', '1997/10/01', '1232132132132', 'CN');
INSERT INTO `employee_info_v` VALUES ('66', '400066', '林昌红', '1981/03/14', '13672784456', 'ZS');
INSERT INTO `employee_info_v` VALUES ('67', '400067', '黄少凤', '1995/08/16', '13425465188', 'ZS');
INSERT INTO `employee_info_v` VALUES ('68', '400068', '刘君蝶', '1969/08/09', '15819348654', 'ZS');
INSERT INTO `employee_info_v` VALUES ('69', '400069', '王杜燕', '1988/11/30', '13703049172', 'ZS');
INSERT INTO `employee_info_v` VALUES ('70', '400070', '连军佐', '1974/04/19', '13500144229', 'ZS');
INSERT INTO `employee_info_v` VALUES ('72', '400072', '任海', '1989/08/19', '18680235150', 'ZS');
INSERT INTO `employee_info_v` VALUES ('73', '400073', '王一', '1971/06/03', '13888888888', 'SH');
INSERT INTO `employee_info_v` VALUES ('74', '400074', '古超文', '1964/11/04', '15811682567', 'ZS');
INSERT INTO `employee_info_v` VALUES ('76', '400076', '郑燕峰', '1990/12/04', '13810762901', '');
INSERT INTO `employee_info_v` VALUES ('77', '400077', '刘海涛', '1985/02/04', '18610659343', 'WH');
INSERT INTO `employee_info_v` VALUES ('78', '400078', '刁云刚', '1982/08/29', '15527632553', 'WH');
INSERT INTO `employee_info_v` VALUES ('79', '400079', '陈德孟', '1972/09/16', '137 1921 8200', 'GZ');
INSERT INTO `employee_info_v` VALUES ('80', '400080', '卢兵兵', '1985/10/11', '150 1305 1302', '');
INSERT INTO `employee_info_v` VALUES ('81', '400081', '梁肖君', '2017/09/30', '137 2546 9207', 'GZ');
INSERT INTO `employee_info_v` VALUES ('82', '400082', '林晓鑫', '1994/04/25', '135 3338 0213', 'GZ');
INSERT INTO `employee_info_v` VALUES ('83', '400083', '赵龙辉', '1972/05/16', '13865715259', 'HZ');
INSERT INTO `employee_info_v` VALUES ('84', '400084', '权志龙', '1989/07/07', '123456', 'XA');
INSERT INTO `employee_info_v` VALUES ('85', '400085', '陳小文', '1997/04/04', '345566667', 'CN');
INSERT INTO `employee_info_v` VALUES ('86', '400086', '王亚丽', '', '18810811131', 'CD');
INSERT INTO `employee_info_v` VALUES ('87', '400087', '黃榮', '1971/09/22', '15012909916', 'SZ');
INSERT INTO `employee_info_v` VALUES ('88', '400088', '李伊', '1994/10/05', '13654563212', 'CD');
INSERT INTO `employee_info_v` VALUES ('89', '400089', '王安', '1977/05/16', '13751004503', 'SZ');
INSERT INTO `employee_info_v` VALUES ('90', '400090', '黃樂照', '1982/10/17', '13923328939', 'SZ');
INSERT INTO `employee_info_v` VALUES ('91', '400091', '王小', '1986/01/29', '4564435', 'CD');
INSERT INTO `employee_info_v` VALUES ('92', '400092', '卜秋平', '1970/07/05', '13416088291', 'ZS');
INSERT INTO `employee_info_v` VALUES ('93', '400093', '赵春玲', '1988/02/23', '13822731291', 'ZS');
INSERT INTO `employee_info_v` VALUES ('94', '400094', '成桂娣', '1970/05/10', '135 3311 0980', 'GZ');
INSERT INTO `employee_info_v` VALUES ('95', '400095', '苏锦湛', '1988/09/21', '18688101038', 'ZS');
INSERT INTO `employee_info_v` VALUES ('96', '400096', '陆广照', '1979/04/14', '15007619256', 'ZS');
INSERT INTO `employee_info_v` VALUES ('97', '400097', '胡月红', '1983-01-27', '13590770242', 'ZS');
INSERT INTO `employee_info_v` VALUES ('98', '400098', '肖燕凤', '1980/10/04', '135 3306 4755', 'GZ');
INSERT INTO `employee_info_v` VALUES ('99', '400099', '张明园', '1970/09/03', '18125267211', 'ZS');
INSERT INTO `employee_info_v` VALUES ('100', '400100', '卢兵兵', '1985/10/11', '150 1305 1302', 'GZ');
INSERT INTO `employee_info_v` VALUES ('101', '400101', '陈芳', '1969/08/14', '13640409752', 'ZS');
INSERT INTO `employee_info_v` VALUES ('102', '400102', '李祥芳', '1964/04/20', '13680157942', 'ZS');
INSERT INTO `employee_info_v` VALUES ('103', '400103', '梁淑芬', '1986/12/28', '15916338213', 'ZS');
INSERT INTO `employee_info_v` VALUES ('104', '400104', '郑周周', '1985-12-25', '13726022634', 'ZS');
INSERT INTO `employee_info_v` VALUES ('105', '400105', '宋显惠', '1968/10/27', '13527105021', 'ZS');
INSERT INTO `employee_info_v` VALUES ('106', '400106', '李彩冰', '1994/06/24', '15992111462', 'ZS');
INSERT INTO `employee_info_v` VALUES ('107', '400107', '郑德利', '1982/01/19', '13590718965', 'ZS');
INSERT INTO `employee_info_v` VALUES ('108', '400108', '胡娟', '1989/12/25', '13590802912', 'ZS');
INSERT INTO `employee_info_v` VALUES ('109', '400109', '相冬萍', '1987/11/17', '13737090476', 'NN');
INSERT INTO `employee_info_v` VALUES ('110', '400110', '韦坚', '1985/06/27', '13737076585 ', 'NN');
INSERT INTO `employee_info_v` VALUES ('111', '400111', '唐才锦  ', '1977/11/09', '13768398663', 'NN');
INSERT INTO `employee_info_v` VALUES ('112', '400112', '吴彦祖', '1985/10/02', '335534534', 'CD');
INSERT INTO `employee_info_v` VALUES ('113', '400113', '欧浩彬', '1970/01/02', '137 1156 3584', '');
INSERT INTO `employee_info_v` VALUES ('114', '400114', '陈玲驹', '1966/08/04', '137 1082 8115', 'GZ');
INSERT INTO `employee_info_v` VALUES ('115', '400115', '尹平红', '1955/06/29', '13715681899', 'ZS');
INSERT INTO `employee_info_v` VALUES ('116', '400116', '陈真', '2001/10/12', '132132132', 'CD');
INSERT INTO `employee_info_v` VALUES ('117', '400117', '測試', '', '23123123', 'CD');
INSERT INTO `employee_info_v` VALUES ('118', '400118', '測試2', '', '12312', 'CD');
INSERT INTO `employee_info_v` VALUES ('119', '400119', '赵龙辉', '1972/05/16', '13865715259', 'HZ');
INSERT INTO `employee_info_v` VALUES ('120', '400120', '王敏', '1994/09/11', '13552986103', 'BJ');
INSERT INTO `employee_info_v` VALUES ('121', '400121', '张保田', '', '13501094180', 'BJ');
INSERT INTO `employee_info_v` VALUES ('122', '400122', '郑燕峰', '', '13810532062', 'BJ');
INSERT INTO `employee_info_v` VALUES ('123', '400123', '李鸿春', '', '13693085543', 'BJ');
INSERT INTO `employee_info_v` VALUES ('124', '400124', '叶敏', '1991/09/28', '18571555160', 'WH');
INSERT INTO `employee_info_v` VALUES ('125', '400125', '黄小建', '1969/06/29', '13647231732', 'WH');
INSERT INTO `employee_info_v` VALUES ('126', '400126', '林柏特', '1955/01/01', '345677890', 'SH');
INSERT INTO `employee_info_v` VALUES ('127', '400127', '金汉成', '1985/01/05', '18827611893', 'WH');
INSERT INTO `employee_info_v` VALUES ('128', '400128', '王一号', '1992/07/31', '12345678', 'SH');
INSERT INTO `employee_info_v` VALUES ('129', '400129', '王2号', '1984/03/01', '1213141516', 'SH');
INSERT INTO `employee_info_v` VALUES ('130', '400130', '姜一号', '1990/01/01', '12131213', 'SH');
INSERT INTO `employee_info_v` VALUES ('131', '400131', '巢颜彩', '1997/03/01', '139 2236 9729', 'GZ');
INSERT INTO `employee_info_v` VALUES ('132', '400132', '梁立鑫', '1992/01/06', '134 2767 1350', 'GZ');
INSERT INTO `employee_info_v` VALUES ('133', '400133', '周淑臻', '1970/05/10', '136 6242 0779', '');
INSERT INTO `employee_info_v` VALUES ('134', '400134', '何平', '1992/10/07', '15757186626', 'HZ');
INSERT INTO `employee_info_v` VALUES ('135', '400135', '莫作升', '1981/06/30', '13000000000', 'NN');
INSERT INTO `employee_info_v` VALUES ('136', '400136', '张三', '1981/11/11', '5785760', 'NN');
INSERT INTO `employee_info_v` VALUES ('137', '400137', '金诚丰', '1992/09/12', '12329967762', 'CD');
INSERT INTO `employee_info_v` VALUES ('138', '400138', '刘德华', '1989/05/17', '121344', 'SH');
INSERT INTO `employee_info_v` VALUES ('139', '400139', '测试3', '', '13243242', 'SH');
INSERT INTO `employee_info_v` VALUES ('140', '400140', 'test', '2017/10/29', '1223512', 'CD');
INSERT INTO `employee_info_v` VALUES ('141', '400141', '图片测试', '', '312312', 'CD');
INSERT INTO `employee_info_v` VALUES ('142', '400142', '图片测试2', '2017/11/15', '123123', 'CD');
INSERT INTO `employee_info_v` VALUES ('143', '400143', '曾建超', '1951/09/11', '14412321323', 'CD');
INSERT INTO `employee_info_v` VALUES ('144', '400144', '黄毅力', '1972/06/23', '1232132132', 'HZ');
INSERT INTO `employee_info_v` VALUES ('145', '400145', '曹校江', '1984/06/02', '17620479884', 'SZ');
INSERT INTO `employee_info_v` VALUES ('146', '400146', '楊思妮', '1995/11/06', '13767170784', 'SZ');
INSERT INTO `employee_info_v` VALUES ('147', '400147', '黃橋勝', '1978/12/10', '13751067488', 'SZ');
INSERT INTO `employee_info_v` VALUES ('148', '400148', '田益達', '1972/10/07', '15014092333', 'SZ');
INSERT INTO `employee_info_v` VALUES ('149', '400149', '艾冬清', '1978/06/07', '13808853404', 'SZ');
INSERT INTO `employee_info_v` VALUES ('150', '400150', '吳子強', '1979/08/10', '13480123147', 'SZ');
INSERT INTO `employee_info_v` VALUES ('151', '400151', '鐘淑君', '1984/10/24', '13510520687', 'SZ');
INSERT INTO `employee_info_v` VALUES ('152', '400152', '彭晶晶', '1990/05/24', '18872211142', 'WH');
INSERT INTO `employee_info_v` VALUES ('153', '400153', '徐棟章', '1977/01/10', '13928472873', 'SZ');
INSERT INTO `employee_info_v` VALUES ('154', '400154', '測試', '', '12312', 'CD');
INSERT INTO `employee_info_v` VALUES ('155', '400155', '測試', '', '88888', 'WH');
INSERT INTO `employee_info_v` VALUES ('156', '400156', '聂一', '', '1245678', 'SH');
INSERT INTO `employee_info_v` VALUES ('157', '400157', '何平', '1992/09/13', '15757186626', 'HZ');
INSERT INTO `employee_info_v` VALUES ('158', '400158', '聂二', '', '121111111', 'SH');
INSERT INTO `employee_info_v` VALUES ('160', '400160', '方欣', '', '13451909978', 'NJ');
INSERT INTO `employee_info_v` VALUES ('161', '400161', '方欣', '', '13451909978', 'NJ');
INSERT INTO `employee_info_v` VALUES ('162', '400162', '吴勇勇', '1969/10/09', '13926991989', 'ZH');
INSERT INTO `employee_info_v` VALUES ('163', '400163', '余明慧', '1966/11/06', '15916209722', 'ZH');
INSERT INTO `employee_info_v` VALUES ('164', '400164', '方欣', '', '13451909978', 'NJ');
INSERT INTO `employee_info_v` VALUES ('165', '400165', '王智东', '1974/09/09', '15936193094', 'BJ');
INSERT INTO `employee_info_v` VALUES ('166', '400166', '张三', '1985/10/31', '123788665675', 'CD');
INSERT INTO `employee_info_v` VALUES ('167', '400167', '測試', '', '1231231', 'SZ');
INSERT INTO `employee_info_v` VALUES ('168', '400168', '张团营', '1971/12/11', '13891483314', 'XA');
INSERT INTO `employee_info_v` VALUES ('169', '400169', '向明', '1987/04/27', '13229212929', 'FS');
INSERT INTO `employee_info_v` VALUES ('170', '400170', '冯友中', '1962/05/02', '15982696945', 'CQ');
INSERT INTO `employee_info_v` VALUES ('171', '400171', '李祥', '1964/04/20', '13680157942', 'ZS');
INSERT INTO `employee_info_v` VALUES ('172', '400172', ' 王喆', '1982/11/15', '17720135932', 'TJ');
INSERT INTO `employee_info_v` VALUES ('173', '400173', '陈亮', '1964/10/05', '13821338298  ', 'TJ');
INSERT INTO `employee_info_v` VALUES ('174', '400174', '张三', '', '18201247410', 'WH');
INSERT INTO `employee_info_v` VALUES ('175', '400175', '杨富成', '1988/08/20', '17715308183', 'WX');
INSERT INTO `employee_info_v` VALUES ('176', '400176', '上海测试人员', '2017/11/01', '1383838483', 'SH');
INSERT INTO `employee_info_v` VALUES ('177', '400177', '赵宇', '1987/05/12', '15785383906', 'HZ');
INSERT INTO `employee_info_v` VALUES ('178', '400178', '赖纪平', '', '13912927517', 'NJ');
INSERT INTO `employee_info_v` VALUES ('179', '400179', '刘一', '1976/11/06', '15916209734', 'ZH');
INSERT INTO `employee_info_v` VALUES ('180', '400180', '吴彩华', '1976/12/28', '13481086019', 'NN');
INSERT INTO `employee_info_v` VALUES ('181', '400181', '周兆秀', '2017/11/21', '136 7441 6237', 'GZ');
INSERT INTO `employee_info_v` VALUES ('182', '400182', '张团营2', '2017/11/21', '1324557985', 'XA');
INSERT INTO `employee_info_v` VALUES ('183', '400183', '张团营3', '', '12345678910', 'XA');
INSERT INTO `employee_info_v` VALUES ('184', '400184', '王力宏（测试）', '1980/12/01', '13612345678', 'SZ');
INSERT INTO `employee_info_v` VALUES ('185', '400185', 'zhnag1333', '', '111', 'CQ');
INSERT INTO `employee_info_v` VALUES ('186', '400186', '1554222', '', '2222', 'XA');
INSERT INTO `employee_info_v` VALUES ('187', '400187', 'EEEEEEE', '', 'DDDD', 'XA');
INSERT INTO `employee_info_v` VALUES ('188', '400188', '杨继荣', '', '15152208289', 'WX');
INSERT INTO `employee_info_v` VALUES ('189', '400189', '孙跃强 ', '1963/10/14', '13642064590 ', 'TJ');
INSERT INTO `employee_info_v` VALUES ('191', '400191', '黄铮', '1976/06/09', '13600290098', 'DG');
INSERT INTO `employee_info_v` VALUES ('192', '400192', '李小花', '1986/09/17', '13751283108', 'DG');
INSERT INTO `employee_info_v` VALUES ('193', '400193', '刘茂胜', '1967/07/10', '13620031283', 'DG');
INSERT INTO `employee_info_v` VALUES ('194', '400194', '刘远光', '1975/02/06', '13546960535', 'DG');
INSERT INTO `employee_info_v` VALUES ('195', '400195', '吴展兴', '1975/01/29', '13728337257', 'DG');
INSERT INTO `employee_info_v` VALUES ('196', '400196', '谢植礼', '1979/07/10', '13597368409', 'DG');
INSERT INTO `employee_info_v` VALUES ('197', '400197', '龚金沙', '1981/09/02', '13662718821', 'DG');
INSERT INTO `employee_info_v` VALUES ('198', '400198', '龙秀先', '1972/05/20', '15285284636', 'DG');
INSERT INTO `employee_info_v` VALUES ('199', '400199', '黄春娣', '1984/09/29', '13427880868', 'DG');
INSERT INTO `employee_info_v` VALUES ('200', '400200', '曹建平', '1979/10/07', '15816839636', 'DG');
INSERT INTO `employee_info_v` VALUES ('201', '400201', '张丽华', '1988/07/31', '15016758355', 'DG');
INSERT INTO `employee_info_v` VALUES ('202', '400202', '葛建标', '1988/09/10', '18028212724', 'DG');
INSERT INTO `employee_info_v` VALUES ('203', '400203', '刘燕君', '1991/05/17', '15019023889', 'DG');
INSERT INTO `employee_info_v` VALUES ('204', '400204', '卢俊鹏', '1983/09/08', '13728166195', 'DG');
INSERT INTO `employee_info_v` VALUES ('205', '400205', '谢记忠', '1976/05/04', '18825708226', 'DG');
INSERT INTO `employee_info_v` VALUES ('206', '400206', '黄嘉欣', '1989/01/23', '13537353099', 'DG');
INSERT INTO `employee_info_v` VALUES ('207', '400207', '尹衬婷', '1996/08/14', '13726488756', 'DG');
INSERT INTO `employee_info_v` VALUES ('208', '400208', '张明国', '1982/04/08', '15337497237', 'DG');
INSERT INTO `employee_info_v` VALUES ('209', '400209', '刘茜践', '1968/11/01', '15625716996', 'DG');
INSERT INTO `employee_info_v` VALUES ('210', '400210', '曾正平', '1976/08/24', '15814252935', 'DG');
INSERT INTO `employee_info_v` VALUES ('211', '400211', '丁文昭', '1993/06/26', '13414429285', 'DG');
INSERT INTO `employee_info_v` VALUES ('212', '400212', '滚兰庆', '1989/04/10', '13885524101', 'DG');
INSERT INTO `employee_info_v` VALUES ('213', '400213', '黎庆华', '1979/11/24', '13686632297', 'DG');
INSERT INTO `employee_info_v` VALUES ('214', '400214', '月仙儿', '1998/01/23', '1232132132', 'CD');
INSERT INTO `employee_info_v` VALUES ('215', '400215', '吴琼辉', '1971/8/24', '15362922475', 'ZS');
INSERT INTO `employee_info_v` VALUES ('216', '400216', '測試', '', '33333333333', 'SH');
INSERT INTO `employee_info_v` VALUES ('217', '400217', '张一', '1980/10/16', '123456', 'FS');

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
) ENGINE=InnoDB AUTO_INCREMENT=1187 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee_middle_wrong_exams
-- ----------------------------
INSERT INTO `employee_middle_wrong_exams` VALUES ('689', '6', '12', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('690', '6', '17', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('691', '6', '37', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('692', '6', '40', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('693', '6', '43', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('694', '6', '44', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('695', '6', '47', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('696', '6', '20', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('697', '6', '21', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('698', '6', '36', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('699', '6', '41', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('700', '6', '42', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('701', '6', '45', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('702', '6', '46', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('703', '5', '12', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('704', '5', '13', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('705', '5', '17', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('706', '5', '18', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('707', '5', '21', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('708', '5', '35', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('709', '5', '36', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('710', '5', '38', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('711', '5', '39', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('712', '5', '40', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('713', '5', '20', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('714', '5', '42', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('715', '5', '43', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('716', '5', '45', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('717', '5', '46', '27', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('971', '3', '10', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('972', '3', '12', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('973', '3', '14', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('974', '3', '18', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('975', '3', '20', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('976', '3', '35', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('977', '3', '41', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('978', '3', '43', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('979', '3', '34', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('980', '3', '50', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('981', '3', '51', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('982', '3', '52', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('983', '3', '53', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('984', '3', '15', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('985', '3', '40', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('986', '3', '6', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('987', '3', '39', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('988', '3', '44', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('989', '3', '47', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('990', '3', '48', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('991', '3', '49', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('992', '3', '54', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('993', '3', '13', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('994', '3', '36', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('995', '3', '38', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('996', '3', '42', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('997', '3', '45', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('998', '3', '46', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1002', '8', '8', '43', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1003', '8', '11', '43', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1004', '8', '16', '43', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1005', '8', '35', '43', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1006', '8', '36', '43', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1007', '8', '38', '43', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1008', '8', '43', '43', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1009', '8', '44', '43', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1010', '8', '45', '43', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1011', '8', '46', '43', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1012', '8', '48', '43', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1013', '8', '14', '43', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1014', '8', '15', '43', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1015', '2', '19', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1016', '2', '20', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1017', '2', '36', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1018', '2', '42', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1019', '2', '47', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1020', '2', '50', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1021', '2', '2', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1022', '2', '10', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1023', '2', '11', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1024', '2', '21', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1025', '2', '39', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1026', '2', '41', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1027', '2', '46', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1028', '2', '48', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1029', '2', '52', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1030', '2', '45', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1031', '2', '38', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1032', '2', '49', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1033', '2', '37', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1034', '2', '40', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1035', '2', '43', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1036', '2', '44', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1037', '2', '5', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1038', '2', '14', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1039', '2', '18', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1040', '2', '34', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1041', '2', '35', '28', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1056', '7', '1', '44', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1057', '7', '11', '44', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1058', '7', '12', '44', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1059', '7', '13', '44', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1060', '7', '16', '44', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1061', '7', '17', '44', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1062', '7', '19', '44', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1063', '7', '35', '44', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1064', '7', '10', '44', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1065', '7', '37', '44', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1066', '7', '38', '44', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1067', '7', '40', '44', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1068', '7', '43', '44', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1069', '7', '44', '44', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1070', '7', '45', '44', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1146', '1', '2', '33', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1147', '1', '8', '33', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1148', '1', '20', '33', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1149', '1', '34', '33', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1150', '1', '45', '33', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1151', '1', '48', '33', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1152', '1', '58', '33', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1153', '1', '67', '33', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1154', '1', '46', '33', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1155', '1', '47', '33', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1156', '1', '56', '33', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1157', '1', '57', '33', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1158', '1', '43', '33', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1159', '1', '51', '33', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1160', '1', '66', '33', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1161', '1', '68', '33', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1162', '1', '70', '33', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1163', '1', '42', '33', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1164', '47', '13', '23', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1165', '47', '15', '23', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1166', '47', '20', '23', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1167', '47', '43', '23', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1168', '47', '46', '23', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1169', '47', '48', '23', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1170', '47', '63', '23', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1171', '47', '65', '23', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1172', '47', '12', '23', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1173', '47', '44', '23', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1174', '47', '45', '23', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1175', '47', '51', '23', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1176', '47', '62', '23', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1177', '47', '42', '23', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1178', '217', '53', '23', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1179', '217', '55', '23', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1180', '217', '72', '23', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1181', '217', '56', '23', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1182', '217', '64', '23', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1183', '217', '17', '23', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1184', '217', '62', '23', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1185', '217', '67', '23', 'HK', '');
INSERT INTO `employee_middle_wrong_exams` VALUES ('1186', '217', '19', '23', 'HK', '');

-- ----------------------------
-- Table structure for `employee_user_bind_v`
-- ----------------------------
DROP TABLE IF EXISTS `employee_user_bind_v`;
CREATE TABLE `employee_user_bind_v` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(10) unsigned NOT NULL,
  `employee_name` varchar(255) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `city` char(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee_user_bind_v
-- ----------------------------
INSERT INTO `employee_user_bind_v` VALUES ('2', '47', '车核桃', '400047', 'employee_400047', 'HK');
INSERT INTO `employee_user_bind_v` VALUES ('3', '48', '沟参与', '400048', 'employee_400048', 'HK');
INSERT INTO `employee_user_bind_v` VALUES ('4', '39', 'boss', 'admin', 'administrator', 'HK');
INSERT INTO `employee_user_bind_v` VALUES ('5', '217', '张山', '400217', 'employee_400217', 'HK');

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
  `quiz_end_dt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='测验单表';

-- ----------------------------
-- Records of quiz
-- ----------------------------
INSERT INTO `quiz` VALUES ('23', '5', '39,47,217', '问题1修改', '17年秋季第一次测验', '', '40.74', 'HK', '2018-01-18 00:00:00', '81', '48', '2018-01-11 00:00:00');
INSERT INTO `quiz` VALUES ('26', '15', '39,48,66,70,217', '描述1.1', '17年秋季第二次测验', '1', '30.77', 'HK', '2018-01-26 00:00:00', '39', '27', '2018-01-18 00:00:00');
INSERT INTO `quiz` VALUES ('27', '11', '5,6,470,217,39', '测验单描述', '17年秋季第三次测验', '1', '31.94', 'HK', '2018-01-25 00:00:00', '72', '49', null);
INSERT INTO `quiz` VALUES ('28', '15', '2,3,407', '描述详情测试单12', '17年秋季第四次测验', '1', '31.48', 'HK', '2018-01-31 19:54:32', '162', '111', null);
INSERT INTO `quiz` VALUES ('29', '8', '2,3,5,6,7,047', '问题描述13', '17年春季第一次测验', '0', '39.71', 'HK', '2018-01-31 19:54:36', '68', '41', null);
INSERT INTO `quiz` VALUES ('30', '12', '2,3,4', '而是下拉', '17年春季第二次测验', '0', '48.48', 'HK', '2017-12-28 00:00:00', '132', '68', null);
INSERT INTO `quiz` VALUES ('31', '12', '2,3,5,6', '下拉测试', '17年春季第三次测验', '1', '58.33', 'HK', '2018-01-20 19:54:42', '108', '63', null);
INSERT INTO `quiz` VALUES ('32', '8', '2,3,4', '下拉测试', '17年春季第四次测验', '0', '26.09', 'HK', '2018-01-28 00:00:00', '23', '17', null);
INSERT INTO `quiz` VALUES ('33', '10', '1', '测试下拉', '17年冬季第一次测验', '1', '28.13', 'HK', '2018-01-27 00:00:00', '32', '23', null);
INSERT INTO `quiz` VALUES ('34', '8', '2,3,5,6', '描述89', '17年冬季第二次测验', '0', '40', 'HK', null, '20', '12', null);
INSERT INTO `quiz` VALUES ('35', '7', '1,2,3', '描述90', '16年春季第一次测验', '1', '42.11', 'HK', '2018-01-19 17:17:30', '19', '11', null);
INSERT INTO `quiz` VALUES ('36', '6', '2,3,4', '描述91', '16年春季第二次测验', '0', '', 'HK', null, '12', '7', null);
INSERT INTO `quiz` VALUES ('37', '8', '3,4', '描述测试58', '16年春季第三次测验', '1', '', 'HK', '2018-01-19 15:45:58', '12', '7', null);
INSERT INTO `quiz` VALUES ('38', '7', '1,2,3,4,6', '描述91', '18年春季第二次测验', '0', '29.79', 'HK', '0000-00-00 00:00:00', '47', '33', null);
INSERT INTO `quiz` VALUES ('40', '11', '1,2,3,4,6', '141414444444444', '', '1', '', 'HK', null, null, null, null);
INSERT INTO `quiz` VALUES ('41', '11', '2,3', '描述19', '', '0', '', 'HK', null, null, null, null);
INSERT INTO `quiz` VALUES ('42', '14', '2,3,4,6', '测试单测试115', '答案88', '1', '', 'HK', null, null, null, null);
INSERT INTO `quiz` VALUES ('43', '12', '3,4', '2018年春季第一次销售测试', '2018年春季第一次', '0', '41.67', 'HK', '2018-01-24 00:00:00', '24', '14', null);
INSERT INTO `quiz` VALUES ('44', '13', '2,3,6,7', '2018年春季第三次测验', '2018年春季第三次', '1', '76.92', 'HK', '2018-01-17 00:00:00', '26', '6', null);
INSERT INTO `quiz` VALUES ('45', '12', '56,61,66', '销售测试', '', '', '', 'HK', '2018-01-09 00:00:00', null, null, '2018-01-03 00:00:00');

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
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test_exams
-- ----------------------------
INSERT INTO `test_exams` VALUES ('1', '11假如您的客户询问您有关产品的问题,您不知道如何回答,您的做法是', '以您认为对的答案,用好像了解的样子来回答', '11承认您缺乏这方面的知识,然后去找正确答案', '11答应将问题转呈给业务经理', '11给他一个听来很好的答案', '3', 'HK');
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
INSERT INTO `test_exams` VALUES ('66', '测试问题1231', '测试问题1231', '测试问题1231', '测试问题1231', '测试问题1231', null, 'HK');
INSERT INTO `test_exams` VALUES ('67', '测试问题1231', '测试问题1232', '测试问题1232', '测试问题1232', '测试问题1232', null, 'HK');
INSERT INTO `test_exams` VALUES ('68', '测试问题1231', '测试问题1233', '测试问题1233', '测试问题1233', '测试问题1233', null, 'HK');
INSERT INTO `test_exams` VALUES ('69', '内容测试', '答案', '错解AAAA', 'BBBBB', 'CCCC', null, 'HK');
INSERT INTO `test_exams` VALUES ('70', '内容测试', '答案', '错解Aaaaa', 'BBBBBBB', 'BBBBBBBBBBB', null, 'HK');
INSERT INTO `test_exams` VALUES ('71', '内容测试1', '正确大暗暗', '错解A', '错解B', '错解C', null, 'HK');
INSERT INTO `test_exams` VALUES ('72', '', '', '', '', '', null, 'HK');
INSERT INTO `test_exams` VALUES ('73', '内容1', '正解1', '错解1', '错解11', '错解111', null, 'HK');
