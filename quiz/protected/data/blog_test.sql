/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : blog_test

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-12-29 18:11:22
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
  `city_privileges` char(5) DEFAULT NULL COMMENT '地区权限',
  `employee_quiz_questions_all` varchar(300) DEFAULT NULL COMMENT '员工测验题所有题的外键',
  `employee_quiz_questions_wrong` varchar(100) DEFAULT NULL COMMENT '员工错题外键',
  `employee_quiz_questions_count` char(5) DEFAULT NULL COMMENT '本次测验题目数',
  `employee_quiz_wrong_questions_count` char(5) DEFAULT NULL COMMENT '错误的题目数量',
  PRIMARY KEY (`employee_correct_rate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee_correct_rate
-- ----------------------------
INSERT INTO `employee_correct_rate` VALUES ('1', '5', '27', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('2', '1', '2', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('3', '1', '2', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('4', '1', '2', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('5', '1', '2', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('6', '1', '2', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('7', '1', '2', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('8', '1', '2', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('9', '30', '3', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('10', '31', '3', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('11', '28', '0', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('12', '30', '3', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('13', '27', '6', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('14', '26', '4', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('15', '27', '6', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('16', '26', '2', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('17', '38', '2', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('18', '32', '3', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('19', '32', '3', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('20', '23', '1', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('21', '23', '1', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('22', '23', '1', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('23', '23', '1', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('24', '38', '6', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('25', '23', '1', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('26', '23', '1', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('27', '23', '1', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('28', '29', '2', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('29', '23', '1', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('30', '29', '2', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('31', '38', '1', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('32', '38', '6', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('33', '32', '3', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('34', '38', '6', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('35', '38', '6', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('36', '38', '6', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('37', '30', '2', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('38', '31', '5', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('39', '38', '2', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('40', '29', '5', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('41', '29', '5', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('42', '29', '5', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('43', '31', '2', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('44', '29', '2', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('45', '29', '2', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('46', '29', '2', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('47', '29', '2', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('48', '29', '2', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('49', '29', '2', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('50', '29', '2', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('51', '29', '2', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('52', '29', '2', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('53', '29', '2', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('54', '29', '2', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('55', '38', '2', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('56', '38', '6', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('57', '38', '6', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('58', '38', '6', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('59', '38', '6', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('60', '38', '6', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('61', '38', '6', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('62', '38', '6', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('63', '23', '6', null, null, null, null, null, null);
INSERT INTO `employee_correct_rate` VALUES ('64', '38', '6', '28.57', '5', '8-11-12-16-20-35-36', '11-12-16-20-36', '7', '5');
INSERT INTO `employee_correct_rate` VALUES ('65', '29', '3', '0', '5', '2-5-12-15', '2-5-12-15', '4', '4');
INSERT INTO `employee_correct_rate` VALUES ('66', '28', '2', null, null, null, null, null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee_middle_wrong_exams
-- ----------------------------
INSERT INTO `employee_middle_wrong_exams` VALUES ('1', '3', '1', '32', null, null);
INSERT INTO `employee_middle_wrong_exams` VALUES ('2', '3', '2', '32', null, null);
INSERT INTO `employee_middle_wrong_exams` VALUES ('3', '3', '5', '32', null, null);
INSERT INTO `employee_middle_wrong_exams` VALUES ('4', '1', '6', '23', null, null);
INSERT INTO `employee_middle_wrong_exams` VALUES ('5', '1', '8', '23', null, null);
INSERT INTO `employee_middle_wrong_exams` VALUES ('6', '1', '10', '23', null, null);
INSERT INTO `employee_middle_wrong_exams` VALUES ('7', '1', '11', '23', null, null);
INSERT INTO `employee_middle_wrong_exams` VALUES ('8', '1', '12', '23', null, null);
INSERT INTO `employee_middle_wrong_exams` VALUES ('9', '1', '13', '23', null, null);
INSERT INTO `employee_middle_wrong_exams` VALUES ('10', '1', '14', '23', null, null);
INSERT INTO `employee_middle_wrong_exams` VALUES ('11', '1', '15', '23', null, null);
INSERT INTO `employee_middle_wrong_exams` VALUES ('12', '1', '16', '23', null, null);
INSERT INTO `employee_middle_wrong_exams` VALUES ('13', '1', '17', '23', null, null);
INSERT INTO `employee_middle_wrong_exams` VALUES ('14', '1', '18', '23', null, null);
INSERT INTO `employee_middle_wrong_exams` VALUES ('15', '1', '19', '23', null, null);
INSERT INTO `employee_middle_wrong_exams` VALUES ('16', '1', '20', '23', null, null);
INSERT INTO `employee_middle_wrong_exams` VALUES ('17', '1', '21', '23', null, null);
INSERT INTO `employee_middle_wrong_exams` VALUES ('18', '1', '34', '23', null, null);
INSERT INTO `employee_middle_wrong_exams` VALUES ('19', '1', '35', '23', null, null);
INSERT INTO `employee_middle_wrong_exams` VALUES ('20', '1', '36', '23', null, null);
INSERT INTO `employee_middle_wrong_exams` VALUES ('21', '1', '37', '23', null, null);
INSERT INTO `employee_middle_wrong_exams` VALUES ('22', '1', '38', '23', null, null);
INSERT INTO `employee_middle_wrong_exams` VALUES ('23', '1', '39', '23', null, null);
INSERT INTO `employee_middle_wrong_exams` VALUES ('24', null, null, null, null, null);
INSERT INTO `employee_middle_wrong_exams` VALUES ('25', '2', '45', '29', null, null);
INSERT INTO `employee_middle_wrong_exams` VALUES ('26', '2', '46', '29', null, null);
INSERT INTO `employee_middle_wrong_exams` VALUES ('27', '2', '47', '29', null, null);
INSERT INTO `employee_middle_wrong_exams` VALUES ('28', '2', '48', '29', null, null);
INSERT INTO `employee_middle_wrong_exams` VALUES ('29', '2', '49', '29', null, null);
INSERT INTO `employee_middle_wrong_exams` VALUES ('30', '2', '50', '29', null, null);
INSERT INTO `employee_middle_wrong_exams` VALUES ('31', '6', '20', '38', null, null);
INSERT INTO `employee_middle_wrong_exams` VALUES ('32', '3', '15', '32', null, null);
INSERT INTO `employee_middle_wrong_exams` VALUES ('33', '3', '16', '32', null, null);
INSERT INTO `employee_middle_wrong_exams` VALUES ('34', '3', '17', '32', null, null);

-- ----------------------------
-- Table structure for `hd_admin`
-- ----------------------------
DROP TABLE IF EXISTS `hd_admin`;
CREATE TABLE `hd_admin` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(10) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_admin
-- ----------------------------
INSERT INTO `hd_admin` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- ----------------------------
-- Table structure for `hd_article`
-- ----------------------------
DROP TABLE IF EXISTS `hd_article`;
CREATE TABLE `hd_article` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(155) NOT NULL DEFAULT '',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `thumb` varchar(200) NOT NULL DEFAULT '',
  `content` text,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `info` varchar(155) NOT NULL DEFAULT '',
  `cid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_article
-- ----------------------------
INSERT INTO `hd_article` VALUES ('28', '蹲下来抱抱自己', '1385708865', '13837859443974.jpg', '柳梅是个乡下姑娘，高中毕业后没考上大学，在家干了半年农活就跑出来进城打工，她在一个小超市里找到了份做营业员的工作。\r\n\r\n　　三年过去了，凭着那股农村人特有的纯朴和吃苦耐劳的韧劲，她从超市营业员升到了店长。超市不大，是个在老城区的一个生活区里不足一千平米的生活小超市，店里除了老板娘和她就只有两个收银员和三个营业员外加一个晚上守夜看店的保安，保安是老板娘的亲戚。另外还有三、四个供货商和厂商派驻进来推销他们自己的商品的促销员。\r\n\r\n　　店虽不大可生意挺好，生意好人手不够自然就会很忙，加班加点那是常有的事，两个收银员每星期有一天轮休，如果碰上其中一个休息她还得顶替当临时收银员，就算没人休息，如果顾客多要开两台收款机收钱，她这备用收银员也的上。\r\n\r\n　　老板娘每天只管钱和账，营业操作的具体事务全都扔给她，一个十几、二十岁的小姑娘，每天要安排好店里的大小事务，要收货录单，要处理顾客的各种奇奇怪怪的投诉，碰上一些小团购还得亲自给人家送货上门，可真忙得她够呛的。\r\n\r\n　　她说收银不能坐，有时实在是累得不行，瞧着没人过来买单就赶紧蹲下抱着自己歇会，哪怕是歇上一两分钟也会舒服许多。\r\n\r\n　　她说 她最怕夏天和秋天刮台风下暴雨，因为店和租住的地方都在老城区，老城区常常内涝，被水淹的那种慌乱狼狈和无奈真的无法言说。\r\n\r\n　　我说既然这样你干嘛还要在这老城区租房住？换个地方不行吗？\r\n\r\n　　她说想过要换，可考虑来考虑去还是觉得这样将就着住比较好。\r\n\r\n　　她租住的地方就在超市后面小区的一栋最破旧的老楼里，就在一楼，是个改装出来的单间配套，因为一楼容易挨水淹，所以租金特便宜，每月才250元，在市中心这算是最便宜的了。她说住近一点好，省时省钱，远了上下班要浪费很多时间在路上，而且一个单身女人常常要忙到十一点多才能回去，实在是不安全，再说住远了还得花钱买电动车，还得花钱保管修理太浪费了。\r\n\r\n　　我笑她：“你这么省干嘛？想攒嫁妆啊？”\r\n\r\n　　她红着脸说：“才不是呢，我要攒钱供我弟读书，我考不上大学一直很遗憾，我希望我弟能考上，就算考不上，哪怕是自费的我也要供他上，我爸妈只会种田什么都不会，我弟只能靠我，我不省不行啊。”\r\n\r\n　　那天，我去她们超市想跟老板娘对对账，走进超市一股浓浓的霉臭味熏得我难受极了，暗想前两晚那场大暴雨肯定是把这给淹了，一问店长柳梅，果真是。\r\n\r\n　　柳梅一边指挥营业员把一些泡湿的东西搬到店外停车场上的空地去晒，一边疲惫的跟我说：“老板娘说这个月不对账了，改下个月。”\r\n\r\n　　我说：“哦，特殊情况可以理解。你干嘛变熊猫眼了？这两天都没睡觉吗？”\r\n\r\n　　她眼圈红红的说：“是啊！你不知道，那晚的雨可真够大的，我住这三年多了，还没见过淹这么厉害的，超市水淹到了膝盖，我住的那小区水淹到了窗口。那晚，为了来超市抢救贵重物品，我屋里的东西全泡水里了，忙了整整一晚上，浑身都湿了，第二天早上回去又累又饿又冷，弄不了吃的，也没有干的衣服换洗。跟你熟，说出来也不怕你笑话，那天我难过得就蹲在房里抱着自己哭了。”\r\n\r\n　　“哦，你真不容易，不过现在雨过天晴了，你看，外面的太阳那么灿烂，它会把你的东西晒干把你的心烘暖的。”我笑笑说。\r\n\r\n　　“是的，雨会停，太阳会出来，湿了的东西可以晒干，超市停业快三天了，明天重新开业，一切得赶紧恢复正常才行。”柳梅感叹道。\r\n\r\n　　回去的路上我脑海里老闪着柳梅的那句：“跟你熟，说出来也不怕你笑话，那天我难过得就蹲在房里抱着自己哭了。”还有她说过的“有时实在是累得不行，瞧着没人过来买单就赶紧蹲下抱着自己歇会，哪怕是歇上一两分钟也会舒服许多。”\r\n\r\n　　人活这世上，总难免会有劳累有辛酸有无奈，有时候太累太苦太痛，蹲下来抱抱自己会舒缓很多很多。\r\n\r\n　　记得刚来这城市的时候，我天天跑人才市场，资料一份份的递，每一扇希望的门我都小心翼翼的去敲，使劲的去推，可失望的冷水却何不留情的一盆盆向我泼来。有一天，走出人才市场，我终于忍不住了，蹲下把手中的资料袋狠狠的甩地上，抱着腿，头趴膝盖上，泪很不挣气的吧嗒吧嗒往下流，湿了袖子湿了裤管，不少路人不解的瞄我一两眼便又匆匆而过。\r\n\r\n　　今年夏天的一个下午，在科园秀厢路口不远处，我的电动车后轮不知为什么突然爆胎了，平时没留意，以为顺着秀厢大道往前走会有修理店，可谁知道要到大学秀厢路口才有修理店。那么长的一段路，三、四十度的高温天气，穿着高跟鞋，推着爆了胎重重的电动车，汗流满面的走了将近一个小时的路，我热得累得烦得想哭想喊想把车扔了不要了，那时觉得自己好累好命苦，脚板疼的实在走不动了，就把车支路边上，在路边的绿化带上蹲下抱着自己歇口气，眼眶都红了，拼命忍着才没让泪珠子滚出来。\r\n\r\n　　人啊！不是每一次的尝试都能成功，不是每一个希望都能实现，也不是每一次的辛酸都会有人安慰，更不是每一次的苦痛都会有人理解。很多时候，你得自己在失望和失落、无奈和苦痛中自己慢慢挣扎着走出来，如果实在受不了就蹲下来抱抱自己，当没有人关心你疼爱你的时候不要绝望不要放弃，你还可以自己疼自己，自己抱抱自己，虽然这疼这抱有些许酸楚，但怎么说也会让自己舒缓很多很多。\r\n\r\n　　累了，痛了，没处可靠，就蹲下来抱抱自己吧！', '1', '三年过去了，凭着那股农村人特有的纯朴和吃苦耐劳的韧劲，她从超市营业员升到了店长。超市不大，是个在老城区的一个生活区里不足一千平米的生活小超市，店里除了老板娘和她就只有两个收银员和三个营业员外加一个晚上守夜看店的保安，保安是老板娘的亲戚。另外还有三、四个供货商和厂商派驻进来推销他们自己的商品的促销员。', '15');
INSERT INTO `hd_article` VALUES ('29', '父亲的爱', '1383786651', '13837866512457.jpg', '傍晚，路过一家音像店，放着筷子兄弟的那首《父亲》，我不禁驻足，“谢谢你做的一切 双手撑起我们的家………”一曲终了，已是泪盈满眶。\r\n\r\n父亲的爱　　1984年秋，我出生在苏北农村的一个普通家庭，一家人过得平淡幸福。然而在我8岁那年，一场突如其来的变故将这平淡彻底打破了。父亲在工地不慎坠落，我成了一个没有父亲的孩子，以前的一切一切不复存在。\r\n\r\n　　三年后，母亲为了生活，经人介绍，带着我改嫁给邻村的小篾匠张志明－张瘸子。当第一眼见到这个男人，母亲告诉我，以后他是父亲的时候，我满眼委屈地哭着跑出了家门。在我心里，无比地怨恨母亲，怎么能嫁给他！不仅是瘸腿，而且瘦小，长相奇丑，跟我的生父根本没法比，尽管怨恨，却无力挣脱。于是在接下来的近四年里，我尽着最大的可能带给这个男人难堪甚至屈辱。平日里我与他如同陌生人，鲜有沟通，对他的称谓也只有“喂” ……\r\n\r\n　　记得小的时候，我是个出名的捣蛋鬼，经常带着一群小伙伴，在村子里东闯西窜。我们捣蛋次数最多的要数村西头王婆家。太阳落山时把她们家的鸡放跑，偷偷望着她急急忙忙的把鸡往窝里赶；爬上屋顶，用青草死死塞住她家烟囱，远远瞄着她踉踉跄跄冲出厨房，边骂边咳，边咳边骂，心情无比畅快！\r\n\r\n　　元宵节，农村有着放哨火的传统。96年的元宵节，虽然那天刮着大风，我与小伙伴们依然在村西头紧邻王婆家的河埂上放哨火，玩得不亦乐乎。然而就在我点燃河埂西头最大的一个枯草堆的时候，火借着风，迅速烧上了王婆家的东厢房，西北风吹着大火，顿时“哔哔啵啵”声肆起，火势越来越大，我们分散着喊人救火……\r\n\r\n　　当邻居们把大火扑灭的时候，王婆家的东厢房几乎成了灰烬，只有四面被烧着炭黑，冒着热气的墙矗立着。我呆如木鸡地站在那里，耳朵嗡嗡直响。王婆一把将我揪了过来，嘴唇上下翻飞，狠狠地骂着，发红的双眼，狠狠地瞪着，手指头狠狠地戳着我的额头，恨不得深深地插进我的脑袋里。我害怕极了。\r\n\r\n　　这时候，小篾匠来了，跟王婆不停的道歉，王婆放开我，一屁股坐到地上，开始号啕大哭“小篾匠，大妈待你不薄啊，婆娘帮你娶上了，却烧了我的房……”王婆的哭，邻居们的指指点点，让小篾匠火冒三丈，顺手抄起一根粗树枝，一把抓住我，一顿胖揍。我挣扎着骂道：“你不是我爸，你凭什么打我？我烧了怎么了，谁让她把我妈介绍给你这个死瘸子，丑瘸子……”小篾匠愣住了，我努力挣脱，瞥见他的脸涨得跟猪肝似的，脖子上的青筋高高地鼓着，王婆也停止了哭嚎愣坐在地上，邻居们唉声叹气地散去，我飞似地逃离。\r\n\r\n　　在田埂上，一边走一边哭。不知过了多久，母亲把我领回了家，经过一翻教训与教育后，我跟母亲说了句“我要我爸爸！”母亲泪眼朦胧，小篾匠进来了，看到这一幕，不知所措，我狠狠地瞪了一眼，他知趣地走开了。夜里，我久久不能入眠，想起离我而去的亲生父亲，想起疼爱我的那一幕幕，无比的伤心。\r\n\r\n　　然而有一次，夜里醒来，听到了母亲跟小篾匠的谈话，心里不惊咯噔一下。\r\n\r\n　　“志明，你看我们年纪也不大，要不生一个吧？”\r\n\r\n　　“不行，孩子都这么大了，再生一个，他怎么想！睡吧！别想了！”\r\n\r\n　　……\r\n\r\n　　时间过得飞快，转眼又是一个冬天。一天早晨，醒来，我躲在被窝里，看到窗玻璃上，糊着一层白晃晃的冰膜，心想，“下了一夜大雪，今天不上学多好啊！”在母亲地催促下，我磨磨蹭蹭起了床，推开门，顿时一股寒气扑面而来，迅速包裹着我，不禁打了个冷颤。到处银装素裹，冰棱像透亮的水晶小柱子，一排排地挂在屋檐上，就连门前河里也结冰了。\r\n\r\n　　吃早饭时，母亲说“外面这么厚的雪，不好骑车，今天坐船去，河东头上岸就是马路，近很多。”这时，小篾匠，推门进屋，两只手，通红通红的，手指像煮熟了的大虾一样。母亲从锅里端出一碗酒，他咕咚咕咚一口气喝光了。\r\n\r\n　　“吃好了没？”他看着我问道。\r\n\r\n　　“嗯。”\r\n\r\n　　“走！”\r\n\r\n　　我背起书包，跟着一瘸一拐的他来到河边，上了小船，蹲了下来。\r\n\r\n　　“慢点啊！”母亲叮嘱着。\r\n\r\n　　“回吧！外面冷！”他冲着母亲挥了挥手。\r\n\r\n　　这时，我才发现，河中央的冰，碎成一块一块的了，飘浮在水面上，向前方望去，足有2千米远，形成了一条小小的航道。小船开始缓慢前行，船体挤着冰块，吱吱作响。我回看船尾撑船的小篾匠，从嘴里、鼻孔里喷出来的团团热气凝成了一层层霜花儿，冻在胡子上，那张脸像熟透了柿子，通红通红。只见他，双手握着竹篙，卯足了力气，向后一撑，小船儿向前挪两米，然后拔起，竹篙上的水也顺着他的手腕流进了衣袖，他却浑然不觉。徒然间，我感觉到一股暖暖的东西在心间流淌起来。是他，一点一点把厚厚的冰层敲破，一点一点撑着小船挤开冰块……就这样，撑开、拔起，撑开，小船在吱吱不停的响声中到达了河尽头。\r\n\r\n　　上岸后，我转过身，鼓足勇气对他说，“衣服湿了，快回家换吧！”\r\n\r\n　　“啊！”那一瞬间，他愣了一下，随后喜笑颜开，拍了拍硬邦邦衣袖，“没事，呵呵，你去吧！”。我抱以微笑，转身冲向了学校。几年来，这是我第一次，认真的跟他对话；第一次，认真的看他的笑；第一次，体味到一种让我温暖的东西。\r\n\r\n　　随后的日子里，我从母亲那里得到更多关于他的信息，如他有一手编织的好手艺，少言寡语，实在，爱喝点米酒等等。渐渐的，我们之间有了点沟通，有的时候，作业做完了，我也会跟他一起编编篮子。渐渐地发现，他原来并没有那么讨厌，每次我编篮子都编不好，他总是默默地拆开重新编，以至于我后来不再动手编。渐渐地发现，他很聪明。他是周围几个村子编黄蟮笼编得最好的篾匠。渐渐地发现，他对我母亲很好，每次集市回来，买两个包子，一个给我，一个铁定留给母亲。\r\n\r\n　　时光飞逝，我初三那年，体育课上一次意外，脚踝环节骨裂，医生建议静养。为了我不落下功课，每天就由他骑车三轮车接送。晚上9点下了晚自习，就由同学搀扶着我到校门口，他在离校门不远的地方，亮着一支发着橘黄色的灯光的手电筒，等到校门口同学们陆续被接走后，他才来把我扶上车。一天、两天、一星期、两星期……慢慢的习惯了校门不远处那橘黄的灯光。可是有一天，我站在校门口，同学们走光了，还没有看到那盏灯，心里很不安，不停的向远处眺望着。这时，那束橘黄的灯光，闪烁着由远及近，是他，是他，一瘸一拐的奔过来。\r\n\r\n　　“等了吧？车子坏了！”他满头大汗，一脸歉意的说到。\r\n\r\n　　“那怎么回家？”我不禁有点犯愁。\r\n\r\n　　“我背你！”他看我有点迟疑，急忙弯下了腰，“来，上来！行的！”\r\n\r\n　　就这样，他一瘸一捌的背着我，往回走。良久两人无语，我先打破了沉默，“嗯，你为什么，每次都等到同学们走完了，才来接我？”\r\n\r\n　　“嗨！我这腿，同学们会笑话的！”\r\n\r\n　　我没再说话，趴在他背上，不一会儿就感觉到他的呼吸越来越重，越来越急促，于是我说道：“放我下来，歇会儿，再走吧！”\r\n\r\n　　“没事！再走一会儿！”\r\n\r\n　　“爸，你放我下来，歇会儿！”\r\n\r\n　　“啊！你叫我‘爸’了！”他突然大声地喊道，“哈哈，儿子，我们快到家了，不歇了！”\r\n\r\n　　陡然间，他似乎脚下生风，走得更快了，没到家门前，就冲着家门喊到“儿子回来了，开门！”母亲，惊讶地把我从他背上扶下来。\r\n\r\n　　“车坏了！我把儿子背回来啦！”他眉开眼笑地说。\r\n\r\n　　“什么事把你乐得，衣服湿了，快去换。”母亲嗔怪到。\r\n\r\n　　“呵呵，不说了，给儿子弄点好吃的，我也饿了！”父亲冁然而笑。\r\n\r\n　　母亲一头雾水地看了看我们俩，去弄吃的。我看见他汗流满面，前胸后背也被汗水浸透，莫名的感动。\r\n\r\n　　“爸，你明天，去校门口接我！”我对着正在坐在椅子上，心花怒发的父亲说到。\r\n\r\n　　“哎，好！”\r\n\r\n　　就在我跟父亲说话的当儿，母亲进来了，“噢，我晓得了，原来这么开心呢！嗯，就为了听儿子叫你一下啊！”母亲恍然大悟，一家人，相视而笑。\r\n\r\n　　那天晚上，躺在床上，我又一次久久不能入眠。张志明啊张志明，你在我心里，早已是父亲，喊您“爸爸”，早已憋闷许久。\r\n\r\n　　蓦然回首曾经的那个顽皮少年，而今已知是非温情；曾经的那个讨厌丑陋的张瘸子，而今在我心里早已是伟岸可敬的好父亲；曾经因你的残疾而害怕被讥笑，而今我却懂得残缺是种美。父亲，您不擅言词，但您的爱让我如沐春风，您用灵巧的双手给了我一个家；您敲碎冰面，冰水灌满衣袖，但您的爱让我的心悄然融化；您总在不远处留一盏灯，为了给我“尊严”而放弃亲近，但您的爱总在我心间；您一路把我背回家，汗如雨下，您的爱让我感知您的伟大与无私；您的爱总是那样的悄然无声，但我总能明白。\r\n\r\n　　父亲，您因为我喊了您一声“爸爸”而激动不已，但您可知那是儿子迟到许久的歉意，对不起，父亲让您等了这么多年！愿您吉祥安康，幸福永远！', '0', '1984年秋，我出生在苏北农村的一个普通家庭，一家人过得平淡幸福。然而在我8岁那年，一场突如其来的变故将这平淡彻底打破了。父亲在工地不慎坠落，我成了一个没有父亲的孩子，以前的一切一切不复存在。', '15');
INSERT INTO `hd_article` VALUES ('30', '母亲的短信', '1383786778', '13837867783210.jpg', '（ 一）\r\n\r\n　　母亲历来节约，始终不愿意给乡下的老家装个电话，用母亲的话说，电话费高，不打电话都还要交座机费，太浪费。于是，每次打电话都要请邻居叫下母亲，然后，听见母亲气喘吁吁跑来听我的电话，我的心总是很疼很疼。\r\n\r\n母亲的短信　　下决心要给母亲送个手机，不为别的，只为母亲能平静接我的电话，能随时和我聊聊天 。我在外面的城市里打拼，一年回家的次数并不多。\r\n\r\n　　母亲60大寿，我送了一部手机给她，说：妈，这手机不贵，以后就不要麻烦邻居，我不要你总气喘吁吁的跑，你可以随时打电话给我，不要考虑话费的问题。\r\n\r\n　　也许是母亲的年龄渐渐的老了，也许是母亲的心底对她的孩子有太多的牵挂，她并没说太多的话语，只是不停的唠叨：这手机好漂亮，花了不少钱吧…可是，我不会拨手机号码，我也记不住。\r\n\r\n　　我把我的手机号码设置好了，对母亲说：很简单的，打我的电话，就按1……于是，母亲就按了一个1，当我的样子显示在母亲的手机上时，母亲高兴的像小孩似的：这手机真高级，居然能看到你的样子。\r\n\r\n　　那天晚上，我有好几次接到了母亲的电话，我的手机里，都有着母亲笑逐颜开的模样。\r\n\r\n　　（二）\r\n\r\n　　第2天，母亲一脸的凝重找到我，说：这手机我还是不要了，给你们打电话，长途，很贵的，听说，一分钟要一元多钱呢？\r\n\r\n　　原来，昨天晚上，母亲在村里的几位老人聊天时了解到，她这种可视电话费用高，如果是长途电话，更贵，母亲也清楚的知道，我会偷偷的支付电话费，不会让她知悉。\r\n\r\n　　我微笑着解释：这电话是包月的，不贵，一个月才50元。\r\n\r\n　　母亲喃喃自语：一年也要600元，我不如装个座机电话呢？\r\n\r\n　　我说：你到邻居家聊天了，我能随时找到你，你去菜园里种菜了，我也能随时找到你，给你配个手机，是方便我们找到你啊。\r\n\r\n　　母亲不啃声了，我知道 ，母亲这辈子节简惯了，平时，恨不能一元钱当做十元钱用，如不解除她心底的这个结，这个手机， 母亲，恐怕用的也不会开心。\r\n\r\n　　我灵机一动，说：其实我有一个方法，让你联系我，不用打电话，而且很便宜。\r\n\r\n　　母亲来了兴致说：是什么？\r\n\r\n　　我说：你可以给我发短信啊，一条才一角钱，而且10元包月。\r\n\r\n　　母亲有些不好意思：可是，我不会写什么字，小时候读书不多。\r\n\r\n　　我说：这个好办，把你平时想说的话，我给你事先编好，保存到你的电话，然后，你想说那句，说发给我那句。\r\n\r\n　　于是，教母亲学习发短信。母亲毕竟年岁大了，虽然一直在“恩恩”的点头，可她的眼睛里，分明写着一丝茫然。\r\n\r\n　　(三)\r\n\r\n　　在给母亲编短信信息时，母亲说的第一句话就是：我和你父亲身体很好，不要担心。\r\n\r\n　　儿子，上火车了吗？\r\n\r\n　　儿子，到家了吗？\r\n\r\n　　儿子，工作顺利吗？\r\n\r\n　　儿媳身体好吗？工作顺心吗？\r\n\r\n　　孙子的学习好不？\r\n\r\n　　………\r\n\r\n　　在母亲的诉说中，我一字一句都存到母亲的电话中，最后，竞然有50多条信息。除了第一句话， 母亲所有的问候都是我，我的孩子，我的妻子，就连第一句话，也只是不想让当儿子的我不要担心家里，担心她们。\r\n\r\n　　那天，我躲在一个无人的地方，泪流满脸。我的母亲啊，只是一生都牵挂儿女的一位普普通通的妈妈。可是，这世界，还有那种爱能够和这朴素的母爱比肩。\r\n\r\n　　（四）\r\n\r\n　　临走的时候，母亲扬扬手机说：“我会发短信了，我会给你发短信，嘿嘿，省钱些。”\r\n\r\n　　刚上火车不久，手机就响了。一看，竟然是母亲的短信。\r\n\r\n　　打开，却发现是空白的。\r\n\r\n　　一分钟后，母亲的短信又来了，这次写的是：儿子，上火车了吗？\r\n\r\n　　我先是一笑，继而心头一热。我立即回道：妈，我已经上车了，不要担心。同时，打了个电话回去，电话那边是母亲一脸的诧然：第一次发，紧张，什么也没有，你收不到吧，现在，我真的会发短信了。\r\n\r\n　　刚回到家，母亲的短信又来了：儿子，到家了吗？\r\n\r\n　　我立即回道：请放心，我已经到家了，。\r\n\r\n　　就这样，隔三差五，母亲的短信就如约而至。\r\n\r\n　　每次我都这样回答：我们全家挺好的，工作非常顺利，你孙子的学习又进步了……”\r\n\r\n　　我知道，坐在门前的老枣树下，我的老母亲看着儿子的平安短信，一定是那无声的微笑。\r\n\r\n　　（五）\r\n\r\n　　今年5月，我37岁的生日那天，手机突然响了。我打开一看，是母亲的短信。再一看，我惊讶地发现，这次的短信竟然出现了两个数字：37\r\n\r\n　　我知道，母亲记得我的生日的，我为她保存的短信信息中也许没有相关的话语，母亲定是琢磨了很久，才输出这条数字短信的。\r\n\r\n　　我知道， 母亲想说：儿子，你37岁了，生日快乐！\r\n\r\n　　我知道， 母亲想说，我和你爸都好，不要挂念……\r\n\r\n　　读着母亲的这简单的2个字，我又读出了一脸的泪水。', '0', '母亲历来节约，始终不愿意给乡下的老家装个电话，用母亲的话说，电话费高，不打电话都还要交座机费，太浪费。于是，每次打电话都要请邻居叫下母亲，然后，听见母亲气喘吁吁跑来听我的电话，我的心总是很疼很疼。\r\n', '15');
INSERT INTO `hd_article` VALUES ('31', '活在当下', '1383787042', '13837870419190.jpg', '这句佛语，直接去解释说明，很难揭示出本质内涵，借用一个故事来说明：《传灯录》中讲道：会元和尚师徒二人赶路，到一条河边看见一女子待渡，无船无桥，老和尚二话没说就背女子渡过河去。回到寺庙小和尚忍不住问老和尚：“出家人禁近女色，师傅为何要背那女子？”老和尚正色道：“我早就放下了那女子，你怎么还背着？”\r\n\r\n　　昨天已经过去，即使昨天发生了再美的事情，我们也无法让它重新来过，明天还未来到，你把未来想象的像花一样那也是以后的事情，纵使你的手在长也无法抓到，我们唯一能够抓得到，掌控的了的就是今天。\r\n\r\n　　人生苦短，匆匆几十年，上帝把我们带到这个世界上来，我们应该感谢上帝的恩赐，感激世界带给我们的自然万物，我们更应该善待我们自己，好好的去生活，把自己的人生经营的精彩，活出自己的快乐，这一生便不枉活。佛告诉我们要活在当下。\r\n\r\n　　就像第一段引用的故事一样，老和尚虽然背了想要渡河的女子，但是放下女子的同时，老和尚的心也随之放下这件事情，而小和尚虽然没有背那名女子，但是已经到了庙中，小和尚却还没有忘记，依然提及此事。老和尚做到了活在当下，而小和尚却还是活在从前。\r\n\r\n　　活在当下，就是要我们放下负担，快乐地生活在此时此刻，就是要我们活得无忧无悔。对未来发生什么不要去作无谓的想象和担心，我们就做到了无忧，对过去已经发生的事情不要去作无谓的想象与担心，我们就做到了无悔。人能无忧无悔的活在当下，思想就不会被其他的东西所束缚，便会达到最高的境界—最单纯的喜悦。\r\n\r\n　　过去和未来都不是属于我的，现在才是真正属于我的时光，假设我们只有一天的时间，我们应该怎么去做，应该怎么去把今天经营的漂亮、完美，我们才不枉来到这个世界上。抛却不必要的烦恼，生活便只剩下了快乐，告诉自己：我现在就是快乐的，我活得就是现在。\r\n\r\n　　现在的社会是愈加现实和残酷的，生活亦不容易，我们更要明确自己应该怎么去活，应该怎么才能让自己不被世俗的压力所束缚，学会放松自己的心境，学会活在当下，经营美好的人生。', '0', '这句佛语，直接去解释说明，很难揭示出本质内涵，借用一个故事来说明：《传灯录》中讲道：会元和尚师徒二人赶路，到一条河边看见一女子待渡，无船无桥，老和尚二话没说就背女子渡过河去。回到寺庙小和尚忍不住问老和尚：“出家人禁近女色，师傅为何要背那女子？”老和尚正色道：“我早就放下了那女子，你怎么还背着？”', '15');
INSERT INTO `hd_article` VALUES ('34', '感受宁静.....', '1383787424', '13837874248659.jpg', ' 随着年龄的增长，特别近几年来，越来越感觉到宁静是一种美、是一种滋味，是一种深广。在这个日感浮躁的社会里，能够保持和拥有一份心灵的宁静，真的很好；真的有一种宁静以致远的感受。于是，渐渐地习惯于生活的宁静了，一支烟、一杯茶、一卷书，一首曲子甚至于一个宁静的夜晚，在淡然的时光里，一份属于自己的神情淡定……\r\n\r\n　　宁静或许是对生活，对人生的一种感悟。更多的时候不在于生活的平静而是内心的那份沉静。不敢说心静如水，因为没有那份功力，只是漫看四季变换、斗转星移，春去春又来……一切在淡然之中，一切在宁静之中！\r\n\r\n　　不怨岁月悠悠、不叹时光匆匆。很多的时候，手指于键盘飞舞，思绪潺潺，串串文字的汇集，也给自己心灵有了一个宣泄的窗口，在渐逝的流年岁月里给了自己一份恬然和宁静，或如泣如诉或如风如雨亦惑亮丽亦或暗淡，随岁月缓缓流逝，亦真，亦梦……\r\n\r\n　　流年似水，似水流年，一般的人毕竟无法脱俗，也只能在红尘俗世中按自己的想法和现实的约束中一路走去……哭过、苦过、累过、幸福快乐过，悲伤痛苦过，成功过失败过。别人的事我管不了，能管好自己就很不错了！探寻自己的一方乐土，让心淡然稳定，独自在岁月的转角处，携一份淡然，一份宁静，任岁月渐行渐远……\r\n\r\n　　人生总是会有许多难以忘怀的过往，或喜或悲，或惆怅，或惋惜，但终究是飞花流水……\r\n\r\n　　虽说人生总是有着太多的不尽如意，总有些繁重喧嚣的日子，总有些迷茫纠结的情绪，但尽量不要忽略了生命美好与美丽！多一份宁静，多一份美！\r\n\r\n　　喜欢在夜色中远望，细数繁星点点，感受宇宙、世界之大，人的生命之渺小！这个时候才感觉人生真的需要一片与世无争的净土，持有一份淡泊，宁静，纯美，致远……伫立在无声的夜色中，静静地感受着那份空灵飘逸的静谧……\r\n\r\n　　这份宁静，是经历沧桑后的沉静，是看淡了俗世纷争后的淡然，是饱经风霜后的祥和，是历经磨砺后的恬淡。宁静是生命中最美好的境界，它不仅是人生底蕴的丰后也是心胸广阔豁达，更是心灵的渐悟和灵魂的升华。\r\n\r\n　　品味宁静，就是品味生命旅途中当尘埃落定后的一份厚重，就是品味灵魂深处的感动。夜的静美，日的绚丽，雨的飘逸，风的洒脱，雪的轻盈，都会使你感受到蔓延在生命深处的极致炫丽、清幽淡雅……坚守一份宁静吧！', '1', ' 随着年龄的增长，特别近几年来，越来越感觉到宁静是一种美、是一种滋味，是一种深广。在这个日感浮躁的社会里，能够保持和拥有一份心灵的宁静，真的很好；真的有一种宁静以致远的感受。于是，渐渐地习惯于生活的宁静了，一支烟、一杯茶、一卷书，一首曲子甚至于一个宁静的夜晚，在淡然的时光里，一份属于自己的神情淡定……', '15');
INSERT INTO `hd_article` VALUES ('35', '青春千里行、梦想始足下', '1383788025', '13837880257908.jpg', ' 白岩松说过；“没有一代人的青春是容易的。”我们的青春就像是奔流不息的江河，呼啸着追求我们想要的一切。从来没有想过，也从来没有问过，我们想要的又是何物？中学时，我们为了考大学，秉烛夜战、闻鸡起舞，那段黑色的岁月每个人都会在心口留个位置。我们那时向往大学的自由。转眼大学了，我们自由了，可是自由的代价我们从未想像过，只道青春年少，当青春之河呼啸而去，难道我们忍心成为岸边的枯草吗？青春的血液从未曾低沉过，但青春的我们却消沉了自我，这是青春年少的代价，还是青春成长的剧痛。今朝且吟且闻，明日且听且悟，只道青春年少，梦之方向未了。\r\n\r\n　　 大学的校园，活力与青春就是全部，我们将青春的快乐留在了这片土地，同时也有可能留下青春的疼痛。不曾想象不曾回忆，青春的我们都需要一个坚定的勇气。\r\n\r\n　　带着青春的勇气走过一个又一个路口，面对一个又一个选择，青春给了我们太多五彩的世界，我们开始享受物质所带来的一切快乐，很少用笔了，只能听到键盘敲打的声音，这是属于青春的节奏——丰富多彩，快捷疯狂，我们奔着一个目标去，一切只为了寻找一份简单的快乐，而我们真的快乐吗？青春的勇气耗费了我们太多的时光，周而复始地重复着一日三餐，为了生活而生活，为了简单而简单，为了快乐而快乐。\r\n\r\n　　 我们都期待每一天简单而快乐，可这简单的快乐却让我们变得那么复杂，我们刻意地去追求简单，逃避所有复杂的事情，因为不想太累。有时候，会忘了肩上的责任，因为不想被人注意，有时候会忘记真是的自我，因为不想留下遗憾，失去后才去弥补，却忘记了失去的不会再回来。这就是青春，这就是青春一路我们的无奈，这就是青春的疼痛。\r\n\r\n　　青春需要梦想，需要方向， 青春之路行千里，每一步都应为了梦想而努力。回首我们走过的错过的，还有什么能够让你悲伤或者微笑的？或许，这是一种成长，青春的成长。正如白岩松所言“没有一代人的青春是容易的”，我们站在大学的校园里，是否也在努力寻找自己的方向， 青春之路行千里，每一步都应为了梦想而努力。回首我们走过的错过的，还有什么能够让你悲伤或者微笑的？或许，这是一种成长，青春的成长。正如白岩松所言“没有一代人的青春是容易的”，我们站在大学的校园里，是否也在努力寻找自己的方向，是否也在追求青春的梦想，是否也在用文字写下自己所有的回忆。\r\n\r\n　　 青春千里行，梦想始足下，青春的疼痛让我们找到了自己，青春的成长让我们找到了最初的梦想。谁言青春痛，我要感谢青春的疼痛，让我成长，让我们的努力有了方向，青春的我们需要走好每一步，践行目标，更应当让青春活力永驻，我们需要的是属于青春的快乐，我们拥有的是属于青春的色彩。青春一程，风雨兼行，谁在乎付出多少，谁在意得到多少，当青春的江河奔流呼啸而过时，我们应扬起风帆，驶向更远的彼岸，彼岸有你我未知的梦想。\r\n\r\n　　 青春千里行，梦想始足下，青春一路，梦想做伴，千里之行，始于足下。元青春的你我将青春这部戏进行到底，愿青春的你我将青春的活力洒满整个校园，愿青春的你我，将青春的梦想传遍每个角落！…', '1', '白岩松说过；“没有一代人的青春是容易的。”我们的青春就像是奔流不息的江河，呼啸着追求我们想要的一切。从来没有想过，也从来没有问过，我们想要的又是何物？中学时，我们为了考大学，秉烛夜战、闻鸡起舞，那段黑色的岁月每个', '16');
INSERT INTO `hd_article` VALUES ('37', '郭敬明语录', '1383788260', '13837882604130.jpg', '1、生活就是***，假如不能反抗就躺下来享受。——《梦里花落知多少》\r\n\r\n　　2、你笑一次，我就可以高兴好几天；可看你哭一次，我就难过了好几年。——《左手倒影右手年华》\r\n\r\n　　3、你给我一滴眼泪，我就看到了你心中全部的海洋。——《左手倒影右手年华》\r\n\r\n　　4、你永远也看不到我最寂寞时候的样子，因为只有你不在我身边的时候，我才最寂寞。——《爱与痛的边缘》\r\n\r\n　　5、自己越在乎的人自己就越不能承受他对自己不好。——《梦里花落知多少》\r\n\r\n　　6、寂寞的人总是会用心的记住他生命中出现过的每一个人，于是我总是意犹未尽地想起你，在每个星光陨落的晚上一遍一遍数我的寂寞。——《左手倒影右手年华》\r\n\r\n　　7、每当我看天的时候我就不喜欢再说话每当我说话的时候我却不敢再看天。\r\n\r\n　　8、我每天都在数着你的笑，可是你连笑的时候，都好寂寞。他们说你的笑容，又漂亮又落拓。\r\n\r\n　　9、我生命里的温暖就那么多，我全部给了你，但是你离开了我，你叫我以后怎么再对别人笑。\r\n\r\n　　10、忧伤是嵌在心里不可名状的灼热，不可言说。能说出来的就不叫忧伤了。——《爱与痛的边缘》\r\n\r\n　　11、风空空洞洞地吹过。一年又这么过去。而来年，还要这么过去。我不知道是安稳的背后隐藏着沮丧，还是沮丧里终归有安稳。只是我们，无法找到。\r\n\r\n　　12、离去，让事情变得简单，人们变得善良，像个孩子一样，我们重新开始。\r\n\r\n　　13、一只野兽受了伤，它可以自己跑到一个山洞躲起来，然后自己舔舔伤口，自己坚持，可是一旦被嘘寒问暖，它就受不了。\r\n\r\n　　14、伤口就像我一样，是个倔强的孩子，不肯愈合，因为内心是温暖潮湿的地方，适合任何东西生长。\r\n\r\n　　15、因为我知道你是个容易担心的小孩，所以我将线交你手中却也不敢飞得太远。不管我随着风飞翔到云间我都希望你能看见，就算我偶尔会贪玩了迷了路也知道你在等我。\r\n\r\n　　16、我不喜欢说话却每天说最多的话，我不喜欢笑却总笑个不停，身边的每个人都说我的生活好快乐，于是我也就认为自己真的快乐。可是为什么我会在一大群朋友中突然地就沉默，为什么在人群中看到个相似的背影就难过，看见秋天树木疯狂地掉叶子我就忘记了说话，看见天色渐晚路上暖黄色的灯火就忘记了自己原来的方向……\r\n\r\n　　17、我发现人总是要失去了一样东西才发现那样东西的可贵，于是玩命儿似的补偿。——《梦里花落知多少》\r\n\r\n　　18、每个人都会成长，只是看那些成长的风雨什么时候到来而已。——《梦里花落知多少》\r\n\r\n　　19、那些刻在椅子背后的爱情，会不会像水泥上的花朵，开出没有风的，寂寞的森林。\r\n\r\n　　20、那些曾经以为念念不忘的事情就在我们念念不忘的过程里，被我们遗忘了。\r\n\r\n　　21、曾经也有一个笑容出现在我的生命里，可是最后还是如雾般消散，而那个笑容，就成为我心中深深埋藏的一条湍急河流，无法泅渡，那河流的声音，就成为我每日每夜绝望的歌唱。\r\n\r\n　　22、凡世的喧嚣和明亮，世俗的快乐和幸福，如同清亮的溪涧，在风里，在我眼前，汨汨而过，温暖如同泉水一样涌出来，我没有奢望，我只要你快乐，不要哀伤……\r\n\r\n　　23、风吹起如花般破碎的流年，而你的笑容摇晃摇晃，成为我命途中最美的点缀，看天，看雪，看季节深深的暗影。\r\n\r\n　　24、一个人总要走陌生的路，看陌生的风景，听陌生的歌，然后在某个不经意的瞬间，你会发现，原本费尽心机想要忘记的事情真的就这么忘记了。\r\n\r\n　　25、躲在某一时间，想念一段时光的掌纹；躲在某一地点，想念一个站在来路也站在去路的，让我牵挂的人。\r\n\r\n　　26、牵着我的手，闭着眼睛走你也不会迷路。\r\n\r\n　　27、假如有一天我们不在一起了，也要像在一起一样。\r\n\r\n　　28、有些事情还没讲完那就算了吧。每个人都是一个国王，在自己的世界里纵横跋扈，你不要听我的，但你也不要让我听你的。\r\n\r\n　　29、我忘了哪年哪月的哪一日我在哪面墙上刻下一张脸一张微笑着忧伤着凝望我的脸，我们微笑着说。\r\n\r\n　　30、我们停留在时光的原处，其实早已被洪流无声地卷走。\r\n\r\n　　31、有些人会一直刻在记忆里的，即使忘记了他的声音，忘记了他的笑容，忘记了他的脸，但是每当想起他时的那种感受，是永远都不会改变的。\r\n\r\n　　32、那些以前说着永不分离的人，早已经散落在天涯了。\r\n\r\n　　33、歌声形成的空间，任凭年华来去自由，所以依然保护着的人的容颜不曾改和一场庞大而没有落幕的恨。\r\n\r\n　　34、也许就像人说的那样，人往往能集注痛苦，因为痛苦比快乐更为深刻。——《爱与痛的边缘》\r\n\r\n　　35、其实人是很容易妥协的，有时甚至不用压力。——《爱与痛的边缘》\r\n\r\n　　36、紧握在手里的幸福应该是简单而透明的，就像两只大雁，依偎在一起飞过天空，那么简单，那么快乐。——《爱与痛的边缘》\r\n\r\n　　37、谁是谁生命中的过客，谁是谁生命的转轮，前世的尘，今世的风，无穷无尽的哀伤的精魂。我回过头去看自己成长的道路，一天一天地观望，我站在路边上，双手插在风衣的兜里看到无数的人群从我身边面无表情地走过，偶尔有人停下来对我微笑，灿若桃花。我知道这些停留下来的人终究会成为我生命中的温暖，看到他们，我会想起不离不弃。\r\n\r\n　　38、这个城市没有草长莺飞的传说，它永远活在现实里面，快速的鼓点，匆忙的身影，麻木的眼神，虚假的笑容，而我正在被同化。\r\n\r\n　　39、总有一天都会面目全非，时光没有教会我任何东西，却教会了我不要轻易去相信神话。\r\n\r\n　　40、遗忘，是我们不可更改的宿命，所有的一切都像是没有对齐的图纸，从前的一切回不到过去，就这样慢慢延伸，一点一点的错开来，也许，错开了的东西，我们真的应该遗忘了。\r\n\r\n　　41、什么叫快乐？就是掩饰自己的悲伤对每个人微笑。\r\n\r\n　　42、坚硬的城市里没有柔软的爱情生活不是林黛玉，不会因为忧伤而风情万种人永远看不破的镜花水月，不过我指间烟云世间千年如我一瞬。\r\n\r\n　　43、记忆想是倒在掌心的水不论你摊开还是紧握终究还是会从指缝中一滴一滴流淌干净。\r\n\r\n　　44、简单一些，再简单一些，这就是生活。——《左手倒影右手年华》\r\n\r\n　　45、身边的位置就那么多，自己能给的就那么多，这个狭小的圈子里有人要进来，就有人不得不离开。——《左手倒影右手年华》\r\n\r\n　　46、歌声形成的空间，任凭年华来去自由，所以依然保护着的人的容颜不曾改和一场庞大而没有落幕的恨。\r\n\r\n　　47、总有一天我会从你身边默默地走开，不带任何声响。我错过了很多，我总是一个人难过。\r\n\r\n　　48、我就像现在一样看着你微笑，沉默，得意，失落，于是我跟着你开心也跟着你难过，只是我一直站在现在而你却永远停留过去。\r\n\r\n　　49、如果我们都是孩子，就可以留在时光的原地，坐在一起一边听那些永不老去的故事一边慢慢皓首。\r\n\r\n　　50、感情对每个人都是一样的。遇到真正喜欢的人，谁敢说自己不在乎？可是不喜欢就是不喜欢了，强求也是没有用。\r\n\r\n　　51、你爱的，爱你的，一生一世，纠纠缠缠，怎么可以分得清？\r\n\r\n　　52、不管如何受伤，我们还是要在爱情里一往无前。\r\n\r\n　　53、人生聚散无常，谁也不知道下一秒钟会发生什么样的事情，所以我的原则就是遇到自己喜欢的，决不放手，决不错过，决不让自己后悔！\r\n\r\n　　55、爱情是很无聊。无聊它也是爱情。\r\n\r\n　　56、友情其实和爱情一样，很多的时候，距离才可以让彼此更懂得彼此。\r\n\r\n　　57、爱情还有个磨合的过程。这个过程很美妙，要学会享受。\r\n\r\n　　58、当爱情已经渐渐地不可阻挡地淡去，谁还会在乎曾经爱过的人被一首伤心的情歌伤得不能动弹？谁还会站在原地，不离不弃？\r\n\r\n　　59、有些人是一直会刻在生命里的，哪怕忘记了他的声音忘记了他的笑容忘记了他的脸，可是每次想起他，那种感受，却永远不会变。——《梦里花落知多少》\r\n\r\n　　60、如果上帝要毁灭一个人必先令其疯狂。可我疯狂了这么久为何上帝还不把我毁掉。\r\n\r\n　　61、一个人总要走陌生的路，看陌生的风景，听陌生的歌，然后在某个不经意的瞬间，你会发现，原本费尽心机想要忘记的事情真的就这么忘记了。\r\n\r\n　　62、躲在某一时间，想念一段时光的掌纹；躲在某一地点，想念一个站在来路也站在去路的，让我牵挂的人。\r\n\r\n　　63、不是每一次努力都会有收获，但是，每一次收获都必须努力，这是一个不公平的不可逆转的命题。\r\n\r\n　　64、当你真正爱一样东西的时候你就会发现语言多么的脆弱和无力。文字与感觉永远有隔阂。\r\n\r\n　　65、我的记忆是不是活在长街的那头，而我的年轮却死在了长街的这头。\r\n\r\n　　66、喜欢文字的人都是不快乐的。\r\n\r\n　　67、朋友总是为你挡风遮雪，如果你在远处承受着风霜，而我无能为力，我也会祈祷，让那些风霜，降临在我的身上。——《梦里花落知多少》\r\n\r\n　　68、我就是那么地热爱绝望。\r\n\r\n　　69、我在天堂向你俯身凝望就像你凝望我一样略带忧伤我在九泉向你抬头仰望就像你站在旷野之上仰望你曾经圣洁的理想总有一天我会回来带回满身木棉与紫荆的清香带回我们闪闪亮亮的时光然后告诉你我已找到天堂。\r\n\r\n　　70、我不寂寞，我只是一个人而已，我的世界有我一个人就好，已经足够热闹。\r\n\r\n　　71、年轮的磨损中，沉淀了悲喜，却浮上了一层唤不回的感伤。\r\n\r\n　　73、他也很温柔，他也很体贴，他也会在我生病的时候买药给我。可是他永远都给不了我你曾经给我的那些色彩。\r\n\r\n　　74、有时候觉得你太过自私，带我看过了那么美好的风景，却又中途离开。而我以后的路途，从此变得没有了任何可以超越从前的惊奇。\r\n\r\n　　75、当你真正爱一样东西时，你会发现语言是多么的脆弱和无力。文字与感觉永远有隔阂。\r\n\r\n　　76、时间没有等我。是你，忘了带我走。——《梦里花落知多少》\r\n\r\n　　77、那些我们以为发生过的事，其实从来就没发生过；那些我们以为爱过的人，却永远地爱着我们。\r\n\r\n　　78、我像是个孤单的木偶，失去了和我形影不离的另一个木偶，从此不会表演不会动，被人遗弃在角落里落满灰尘，在孤单中绝望，在绝望中悲伤，然后继续不停地，想念你……\r\n\r\n　　79、你随便的说，我却认真的难过。\r\n\r\n　　80、天空的飞鸟，是你的寂寞比我多，还是我的孤单比你多。剩下的时光，你陪我，好不好。这样你不寂寞，我也不会孤单。\r\n\r\n　　81、沉默的浮云，是你的难过比我多，还是我的隐忍比你多。以后的路程，忘记我，好不好。这样你不难过，我也忘记了回忆。\r\n\r\n　　82、那个男孩，教会我成长；那个女孩，教会我爱。他们曾经出现在我的生命里，然后又消失不见。可是我不相信他们是天使，他们是世间最普通的男孩和女孩，所以我就一直这么站在香樟树下等待着，因为我相信，他们总有一天会回来，回来找我教会我更多的事…那些曾经出现在你生命中后来又消失的人，他们都是天使，带给你幸福，或者教会你懂得更多的道理。\r\n\r\n　　83、当潮水涌上年代久远的堤岸，夏天连接了下一个夏天，你，什么样？当大雨席卷烈日当头的村落，夏天淹没了下一个夏天，你，什么样？\r\n\r\n　　84、我落日般的忧伤就像惆怅的飞鸟，惆怅的飞鸟飞成我落日般的忧伤。\r\n\r\n　　85、你唱了，笑了，离开了。我听了，哭了，留下了。\r\n\r\n　　86、生活，就是他妈的一场戏。比电视剧都让人跌破眼睛。——《梦里花落知多少》\r\n\r\n　　87、生活就是这样，永远占领着绝对领导地位。当无数的傻子高呼着自己控制了生活自己掌握了命运，却没有看到生活站在更高的苍穹之上，露出讥笑嘲讽的面容。——《梦里花落知多少》\r\n\r\n　　88、如果记忆像钢铁般坚固那我该微笑还是哭泣如果钢铁像记忆般腐浊那这是欢城还是废墟。\r\n\r\n　　89、总有一天我会从你身边默默地走开，不带任何声响。我错过了很多，我总是一个人难过。', '1', '那个男孩，教会我成长；那个女孩，教会我爱。他们曾经出现在我的生命里，然后又消失不见。可是我不相信他们是天使，他们是世间最普通的男孩和女孩，所以我就一直这么站在香樟树下等待着，因为我相信，他们总有一天会回来，回来找我教会我更多的', '16');
INSERT INTO `hd_article` VALUES ('38', '惜别，亲爱的友情', '1383788378', '13837883784768.jpg', '有些时候，总喜欢一个人看着天空发呆，反而自己都不懂得到底在看什么，或许只有洁白的云朵蔚蓝色的天空懂得。\r\n\r\n　　有些时候，角落成了自己最热爱的栖息之地，好似这样能就够把自己包裹的严实起来，能够与外界完全隔绝。\r\n\r\n　　有些时候，莫名的孤独，就算周围的人很多，却也全都是陌生的，陌生的叫人害怕。偶尔有人给我一个灿烂的微笑，我却显得受宠若惊。\r\n\r\n　　原来那些曾经逝去的，还有没有好好把握过的，都早就无影无踪了。我们把它称为友情。\r\n\r\n　　何为友情？时常这样反问自己，也有时看着书上或者网络上的一句话，对于友情的解释各异，让我着实摸不着头脑。那么友情到底是什么呢。\r\n\r\n　　或许从字面上我们可以简单的理解为：朋友之间的感情。\r\n\r\n　　我常常讲若是身边没有了你们，那我的世界就会灰暗。\r\n\r\n　　一个人站在水泥路上，秋天的风吹得万分萧瑟，让我显得更加凄凉。一双空洞的眼睛望向远方，那是家的方向。那里有你们，我最亲爱的人儿啊。眸子深处有我最深的忧伤。\r\n\r\n　　为什么年轻的我们总是忧伤？是我们经常性的聚散离别，颠沛流离吗？\r\n\r\n　　也许是吧。我们总不能相依一辈子。是谁说的放手也是一种爱？这样成全了自己也成全了他人，否则束缚是很累人的。\r\n\r\n　　曾经无数次写过关于友情的东西，寥寥数字或长篇大论，可是不管怎样还是写不完，道不尽，反而越来越得劲儿了。但是每次都被压抑的气氛混肴，不知那时的欢乐到底哪儿去了。\r\n\r\n　　小时候友情是一棵茂盛的杨树，我是其中的一根枝干。\r\n\r\n　　再往大了友情如同一朵白云，时而随风相聚，时而分散。\r\n\r\n　　如今呢友情只是友情，没有仿佛没有如同，友情是什么？\r\n\r\n　　回答：是友情。\r\n\r\n　　因为我们无法真正的参透，你见过多少事、多少风景、多少人，可是友情你有历经过多少。\r\n\r\n　　每个角落里或许都有我们留下的痕迹，可每一处痕迹之上都有着我们或多或少的故事——\r\n\r\n　　璀璨的，悲伤的。\r\n\r\n　　很害怕相识，就好像预兆着终有一天离去般，我仿佛能够刺穿透时间，看到我们相向离去的场景——你的背影，我的背影。\r\n\r\n　　过程是快乐的，孤独的相伴带给了我们最新的慰藉，就算偶尔有点小摩擦，可又有多大的仇恨呢？\r\n\r\n　　而往后的回忆是酸楚的，虽然经常回忆的是那些快乐的过程，因为我们留下的友情，朋友，也只剩下回忆了。\r\n\r\n　　一个人忘记一件事情很容易，可是和那些人一起做的事情，很难忘。点点滴滴的挥之不去。\r\n\r\n　　我们能做的也只有沉浸在悲伤的回忆里。\r\n\r\n　　想起离别，空气总会弥漫着不舍，然后各自孤零零的返回。仿佛这个世界只剩下自己一个人了。\r\n\r\n　　避免不了的离别，曾让我无限憎恨，可是若是没有离别，又怎能认识现在的人儿呢？老天是公平的，离开一些人，总也会让你认识另外一些人。\r\n\r\n　　朋友是无论如何都不会消失的，友情也是。它无时不刻的出现在我们的周围乃至生命里，它带给了我们比爱情更加弥之珍贵的东西，如果说爱情是世间最甜蜜的东西，那么友情即是世间最有滋味的东西。\r\n\r\n　　友情犹如一副长长的画卷展开，身临其境。里面有我们各色的青春，有我们数不尽的快乐，有我们看不完的传奇。\r\n\r\n　　友情犹如一场看不完的电影，电影之间的酸，甜，苦，辣，都仔细的在上演着不同的悲欢离合。\r\n\r\n　　友情犹如一本书，书香气卷着风儿漂流到很远很远，我们翻开书，都会看到彼此的笑脸，面若桃花。\r\n\r\n　　友情若是消失，那么这个世界将失去璀璨的星光，苍穹若是没有星光点缀，并不是完美的，只有无尽的黑暗，让自己在角落里，独自泪流。\r\n\r\n　　友情若是消失，那么这个世界的山群转瞬踏陷，没有山群映衬的大地，变得坑坑洼洼，只有无尽的风无情地吹刮着，让自己在角落里，寂静的清冷着。\r\n\r\n　　友情若是消失，那么这个世界将缺少分离的疼痛，没有疼痛的后果，又怎能体验到愉悦的铺垫，只有麻木的同行尸走肉般，看似清高，可也孤独。\r\n\r\n　　如今，我用一幅文字铸成的画卷，将友情的点滴铺展开来，那些灿烂，那些趋之若鹜的往事，那些能够笑得开怀又纯真的美丽，把时光尝试着倒流，到如今，再穿插起来——并不是完美的，杜撰的，却也真实的存在过。\r\n\r\n　　可惜，物是人非的场景反复的上演着，倔强的把悲伤汇成河流飘逝到人生中未知的尽头。\r\n\r\n　　那么，友情的定义——并不是三言两语的，支言片段的，也并不是长篇大论的，阔阔而谈的。\r\n\r\n　　而是疯狂的拼凑，漫无目的地的拼凑。\r\n\r\n　　惜别，亲爱的友情。属于我们最朴实的青春，让我们一起放飞梦想……', '1', '有些时候，总喜欢一个人看着天空发呆，反而自己都不懂得到底在看什么，或许只有洁白的云朵蔚蓝色的天空懂得。', '16');
INSERT INTO `hd_article` VALUES ('40', '后盾网激情澎湃的篮球赛', '1385693196', '13838043822685.jpg', ' 9月30日，后盾网组织了规模盛大的篮球友谊赛，本次共有三支由后盾学员、讲师、热心盾友组成的代表队参加了比赛，以下是老鱼手中的比赛合影，更多详情等我把图片收集一下再给分享给大家哦！  \r\n\r\n  球赛完毕后，后盾组织了聚餐活动，即将毕业的20期学员为后盾网送上了锦旗，并对老师表达了诚挚的谢意，让在场的各位都非常感动。更活动揭秘请关注后续发布的活动实况录像，有你想看的，有你期待的！', '0', '9月30日，后盾网组织了规模盛大的篮球友谊赛，本次共有三支由后盾学员、讲师、热心盾友组成的代表队参加了比赛，以下是老鱼手中的比赛合影，更多详情等我把图片收集一下再给分享给大家哦！ ', '15');

-- ----------------------------
-- Table structure for `hd_category`
-- ----------------------------
DROP TABLE IF EXISTS `hd_category`;
CREATE TABLE `hd_category` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cname` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_category
-- ----------------------------
INSERT INTO `hd_category` VALUES ('15', '情感');
INSERT INTO `hd_category` VALUES ('16', '生活');
INSERT INTO `hd_category` VALUES ('17', '趣事');
INSERT INTO `hd_category` VALUES ('18', '奇闻');

-- ----------------------------
-- Table structure for `hr_agreement`
-- ----------------------------
DROP TABLE IF EXISTS `hr_agreement`;
CREATE TABLE `hr_agreement` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `docx_url` varchar(300) NOT NULL,
  `type` int(30) NOT NULL DEFAULT '0' COMMENT '是否启用',
  `city` varchar(30) DEFAULT NULL,
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合同文檔';

-- ----------------------------
-- Records of hr_agreement
-- ----------------------------

-- ----------------------------
-- Table structure for `hr_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `hr_attachment`;
CREATE TABLE `hr_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `path_url` varchar(255) NOT NULL COMMENT '附件地址',
  `file_name` varchar(255) NOT NULL COMMENT '附件名字',
  `lcu` varchar(255) DEFAULT NULL,
  `lcd` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='員工的附件表';

-- ----------------------------
-- Records of hr_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for `hr_binding`
-- ----------------------------
DROP TABLE IF EXISTS `hr_binding`;
CREATE TABLE `hr_binding` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(10) unsigned NOT NULL,
  `employee_name` varchar(255) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `lcu` varchar(255) DEFAULT NULL,
  `luu` varchar(255) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='......';

-- ----------------------------
-- Records of hr_binding
-- ----------------------------

-- ----------------------------
-- Table structure for `hr_company`
-- ----------------------------
DROP TABLE IF EXISTS `hr_company`;
CREATE TABLE `hr_company` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '公司名字',
  `agent` varchar(30) NOT NULL COMMENT '代理人',
  `agent_email` varchar(100) DEFAULT NULL,
  `head` varchar(30) NOT NULL COMMENT '負責人',
  `head_email` varchar(100) DEFAULT NULL,
  `legal` varchar(30) DEFAULT NULL COMMENT '法定負責人',
  `legal_email` varchar(100) DEFAULT NULL,
  `legal_city` varchar(100) DEFAULT NULL COMMENT '法人章所在城市',
  `address` varchar(255) NOT NULL COMMENT '公司地址',
  `postal` varchar(100) DEFAULT NULL COMMENT '郵政編碼',
  `address2` varchar(255) DEFAULT NULL,
  `postal2` varchar(255) DEFAULT NULL,
  `city` varchar(30) NOT NULL COMMENT '公司歸屬地區',
  `phone` varchar(255) DEFAULT NULL COMMENT '公司電話',
  `tacitly` varchar(11) DEFAULT '0' COMMENT '默認公司：0（否）1（是）',
  `organization_code` varchar(30) DEFAULT NULL COMMENT '組織機構代碼',
  `organization_time` varchar(60) DEFAULT NULL COMMENT '組織機構代碼發出時間',
  `security_code` varchar(30) DEFAULT NULL COMMENT '勞動保障代碼',
  `license_code` varchar(30) DEFAULT NULL COMMENT '證照編號',
  `license_time` varchar(60) DEFAULT NULL COMMENT '證照發出日期',
  `mie` varchar(10) DEFAULT NULL COMMENT '滅蟲執照級別',
  `taxpayer_num` varchar(100) DEFAULT NULL COMMENT '纳税人识别号',
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司資料表';

-- ----------------------------
-- Records of hr_company
-- ----------------------------

-- ----------------------------
-- Table structure for `hr_contract`
-- ----------------------------
DROP TABLE IF EXISTS `hr_contract`;
CREATE TABLE `hr_contract` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `city` varchar(30) NOT NULL,
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='...';

-- ----------------------------
-- Records of hr_contract
-- ----------------------------

-- ----------------------------
-- Table structure for `hr_contract_docx`
-- ----------------------------
DROP TABLE IF EXISTS `hr_contract_docx`;
CREATE TABLE `hr_contract_docx` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contract_id` int(10) NOT NULL,
  `docx` int(10) NOT NULL,
  `index` int(10) DEFAULT NULL COMMENT '層級',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合同與文檔的關連表';

-- ----------------------------
-- Records of hr_contract_docx
-- ----------------------------

-- ----------------------------
-- Table structure for `hr_dept`
-- ----------------------------
DROP TABLE IF EXISTS `hr_dept`;
CREATE TABLE `hr_dept` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `z_index` varchar(11) DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0:部門  1:職位',
  `city` varchar(255) DEFAULT NULL,
  `dept_id` int(11) DEFAULT '1' COMMENT '部門id',
  `dept_class` varchar(50) DEFAULT NULL COMMENT '職位類別',
  `lcu` varchar(50) DEFAULT NULL,
  `luu` varchar(50) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作部門';

-- ----------------------------
-- Records of hr_dept
-- ----------------------------

-- ----------------------------
-- Table structure for `hr_docx`
-- ----------------------------
DROP TABLE IF EXISTS `hr_docx`;
CREATE TABLE `hr_docx` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `docx_url` varchar(300) NOT NULL,
  `type` varchar(30) NOT NULL COMMENT '文檔可見類型（local：本地可見，default：全球可見）',
  `city` varchar(30) DEFAULT NULL,
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合同文檔';

-- ----------------------------
-- Records of hr_docx
-- ----------------------------

-- ----------------------------
-- Table structure for `hr_employee`
-- ----------------------------
DROP TABLE IF EXISTS `hr_employee`;
CREATE TABLE `hr_employee` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '員工名字',
  `code` varchar(20) DEFAULT NULL COMMENT '員工編號',
  `sex` varchar(10) DEFAULT NULL,
  `city` varchar(20) NOT NULL,
  `staff_id` varchar(10) DEFAULT NULL,
  `company_id` int(10) unsigned NOT NULL COMMENT '公司id',
  `contract_id` int(10) unsigned NOT NULL COMMENT '合同id',
  `user_card` varchar(50) NOT NULL COMMENT '身份證號碼',
  `address` varchar(255) NOT NULL COMMENT '員工住址',
  `address_code` varchar(10) DEFAULT NULL COMMENT '郵政編碼',
  `contact_address` varchar(255) NOT NULL COMMENT '通訊地址',
  `contact_address_code` varchar(10) DEFAULT NULL COMMENT '郵政編碼',
  `phone` varchar(20) NOT NULL COMMENT '聯繫電話',
  `phone2` varchar(20) DEFAULT NULL COMMENT '緊急電話',
  `department` varchar(20) NOT NULL COMMENT '部門',
  `position` varchar(20) NOT NULL COMMENT '職位',
  `wage` varchar(20) NOT NULL COMMENT '工資',
  `fix_time` varchar(11) NOT NULL DEFAULT 'fixation' COMMENT 'fixation：有固定期限  nofixed：無固定期限',
  `start_time` date NOT NULL COMMENT '合同開始時間',
  `end_time` varchar(50) DEFAULT NULL COMMENT '合同結束時間',
  `test_start_time` varchar(40) DEFAULT NULL COMMENT '試用期開始時間',
  `test_end_time` varchar(40) DEFAULT NULL COMMENT '試用期結束時間',
  `test_wage` varchar(20) DEFAULT NULL COMMENT '試用期工資',
  `test_type` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '試用期類型：0（無試用期）、 1（有試用期）',
  `test_length` varchar(10) DEFAULT NULL,
  `word_status` int(10) NOT NULL DEFAULT '0' COMMENT '是否已經生成合同：0（沒有）、1（有）',
  `word_url` varchar(300) DEFAULT NULL COMMENT '員工合同的地址',
  `staff_old_status` int(11) NOT NULL DEFAULT '1' COMMENT '員工的前一個狀態',
  `staff_status` int(11) NOT NULL DEFAULT '0' COMMENT '員工狀態：0（已經入職）',
  `entry_time` varchar(40) DEFAULT '2017-08-01' COMMENT '入職時間',
  `age` varchar(11) DEFAULT NULL COMMENT '年齡',
  `birth_time` varchar(40) DEFAULT NULL COMMENT '出生日期',
  `ld_card` varchar(40) DEFAULT NULL COMMENT '勞動保障卡號',
  `sb_card` varchar(40) DEFAULT NULL COMMENT '社保卡號',
  `jj_card` varchar(40) DEFAULT NULL COMMENT '公積金卡號',
  `house_type` varchar(20) DEFAULT NULL COMMENT '戶籍類型',
  `health` varchar(100) DEFAULT NULL COMMENT '身體狀態',
  `education` varchar(100) DEFAULT NULL COMMENT '學歷',
  `experience` varchar(100) DEFAULT NULL COMMENT '工作經驗',
  `english` text COMMENT '外語水平',
  `technology` text COMMENT '技術水平',
  `other` text COMMENT '其它',
  `year_day` varchar(11) DEFAULT NULL COMMENT '年假',
  `email` varchar(50) DEFAULT NULL COMMENT '員工郵箱',
  `ject_remark` text COMMENT '拒絕備註',
  `remark` text COMMENT '備註',
  `price1` varchar(20) DEFAULT NULL COMMENT '每月工資',
  `price2` varchar(20) DEFAULT NULL COMMENT '加班工資',
  `price3` varchar(255) DEFAULT NULL COMMENT '每月補貼',
  `image_user` varchar(255) DEFAULT NULL COMMENT '員工照片地址',
  `image_code` varchar(255) DEFAULT NULL COMMENT '員工身份證照片',
  `image_work` varchar(255) DEFAULT NULL COMMENT '工作證明照片',
  `image_other` varchar(255) DEFAULT NULL COMMENT '其它照片',
  `staff_type` varchar(50) DEFAULT NULL,
  `staff_leader` varchar(50) DEFAULT NULL,
  `attachment` text COMMENT '附件',
  `nation` varchar(100) DEFAULT NULL COMMENT '民族',
  `household` varchar(50) DEFAULT NULL COMMENT '户籍类型',
  `empoyment_code` varchar(100) DEFAULT NULL COMMENT '就业登记证号',
  `social_code` varchar(100) DEFAULT NULL COMMENT '社会保障卡号',
  `leave_time` varchar(255) DEFAULT NULL,
  `leave_reason` text,
  `user_card_date` varchar(100) DEFAULT NULL,
  `emergency_user` varchar(255) DEFAULT NULL,
  `emergency_phone` varchar(255) DEFAULT NULL,
  `code_old` varchar(255) DEFAULT NULL,
  `lcu` varchar(20) DEFAULT NULL,
  `luu` varchar(20) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='員工表';

-- ----------------------------
-- Records of hr_employee
-- ----------------------------

-- ----------------------------
-- Table structure for `hr_employee_operate`
-- ----------------------------
DROP TABLE IF EXISTS `hr_employee_operate`;
CREATE TABLE `hr_employee_operate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(10) unsigned NOT NULL,
  `name` varchar(30) NOT NULL COMMENT '員工名字',
  `code` varchar(20) DEFAULT NULL COMMENT '員工編號',
  `sex` varchar(10) DEFAULT NULL,
  `city` varchar(20) NOT NULL,
  `staff_id` varchar(10) DEFAULT NULL,
  `company_id` int(10) unsigned NOT NULL COMMENT '公司id',
  `contract_id` int(10) unsigned NOT NULL COMMENT '合同id',
  `user_card` varchar(50) NOT NULL COMMENT '身份證號碼',
  `address` varchar(255) NOT NULL COMMENT '員工住址',
  `address_code` varchar(10) DEFAULT NULL COMMENT '郵政編碼',
  `contact_address` varchar(255) NOT NULL COMMENT '通訊地址',
  `contact_address_code` varchar(10) DEFAULT NULL COMMENT '郵政編碼',
  `phone` varchar(20) NOT NULL COMMENT '聯繫電話',
  `phone2` varchar(20) DEFAULT NULL COMMENT '緊急電話',
  `department` varchar(20) NOT NULL COMMENT '部門',
  `position` varchar(20) NOT NULL COMMENT '職位',
  `wage` int(20) unsigned NOT NULL COMMENT '工資',
  `fix_time` varchar(10) NOT NULL DEFAULT 'fixation',
  `start_time` date NOT NULL COMMENT '合同開始時間',
  `end_time` varchar(100) DEFAULT NULL COMMENT '合同結束時間',
  `test_start_time` varchar(20) DEFAULT NULL COMMENT '試用期開始時間',
  `test_end_time` varchar(20) DEFAULT NULL COMMENT '試用期結束時間',
  `test_wage` varchar(20) DEFAULT NULL COMMENT '試用期工資',
  `test_type` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '試用期類型：0（無試用期）、 1（有試用期）',
  `test_length` varchar(10) DEFAULT NULL,
  `word_status` int(10) NOT NULL DEFAULT '0' COMMENT '是否已經生成合同：0（沒有）、1（有）',
  `word_url` varchar(300) DEFAULT NULL COMMENT '員工合同的地址',
  `staff_old_status` int(11) NOT NULL DEFAULT '1' COMMENT '員工的前一個狀態',
  `operation` varchar(255) NOT NULL DEFAULT 'update' COMMENT '操作原因',
  `opr_type` varchar(255) DEFAULT NULL COMMENT '合同變更類型',
  `finish` int(10) NOT NULL DEFAULT '0' COMMENT '是否完成。1：是，0：否',
  `staff_status` int(11) NOT NULL DEFAULT '0' COMMENT '員工狀態：0（已經入職）',
  `entry_time` varchar(20) DEFAULT '2017-08-01' COMMENT '入職時間',
  `age` varchar(11) DEFAULT NULL COMMENT '年齡',
  `birth_time` varchar(20) DEFAULT NULL COMMENT '出生日期',
  `ld_card` varchar(40) DEFAULT NULL COMMENT '勞動保障卡號',
  `sb_card` varchar(40) DEFAULT NULL COMMENT '社保卡號',
  `jj_card` varchar(40) DEFAULT NULL COMMENT '公積金卡號',
  `house_type` varchar(20) DEFAULT NULL COMMENT '戶籍類型',
  `health` varchar(100) DEFAULT NULL COMMENT '身體狀態',
  `education` varchar(100) DEFAULT NULL COMMENT '學歷',
  `experience` varchar(100) DEFAULT NULL COMMENT '工作經驗',
  `english` text COMMENT '外語水平',
  `technology` text COMMENT '技術水平',
  `other` text COMMENT '其它',
  `year_day` varchar(11) DEFAULT NULL COMMENT '年假',
  `email` varchar(50) DEFAULT NULL COMMENT '員工郵箱',
  `ject_remark` text COMMENT '拒絕備註',
  `remark` text COMMENT '備註',
  `update_remark` text COMMENT '變更說明',
  `price1` varchar(20) DEFAULT NULL COMMENT '每月工資',
  `price2` varchar(20) DEFAULT NULL COMMENT '加班工資',
  `price3` varchar(255) DEFAULT NULL COMMENT '每月補貼',
  `image_user` varchar(255) DEFAULT NULL COMMENT '員工照片地址',
  `image_code` varchar(255) DEFAULT NULL COMMENT '員工身份證照片',
  `image_work` varchar(255) DEFAULT NULL COMMENT '工作證明照片',
  `image_other` varchar(255) DEFAULT NULL COMMENT '其它照片',
  `staff_type` varchar(50) DEFAULT NULL,
  `staff_leader` varchar(50) DEFAULT NULL,
  `attachment` text COMMENT '附件',
  `nation` varchar(100) DEFAULT NULL COMMENT '民族',
  `household` varchar(50) DEFAULT NULL COMMENT '户籍类型',
  `empoyment_code` varchar(100) DEFAULT NULL COMMENT '就业登记证号',
  `social_code` varchar(100) DEFAULT NULL COMMENT '社会保障卡号',
  `leave_time` varchar(255) DEFAULT NULL,
  `leave_reason` text,
  `user_card_date` varchar(100) DEFAULT NULL,
  `emergency_user` varchar(255) DEFAULT NULL,
  `emergency_phone` varchar(255) DEFAULT NULL,
  `change_city` varchar(255) DEFAULT NULL COMMENT '調職城市',
  `code_old` varchar(255) DEFAULT NULL,
  `lcu` varchar(20) DEFAULT NULL,
  `luu` varchar(20) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='員工表';

-- ----------------------------
-- Records of hr_employee_operate
-- ----------------------------

-- ----------------------------
-- Table structure for `hr_employee_reward`
-- ----------------------------
DROP TABLE IF EXISTS `hr_employee_reward`;
CREATE TABLE `hr_employee_reward` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `employee_code` varchar(100) NOT NULL,
  `employee_name` varchar(255) NOT NULL,
  `reward_id` int(11) NOT NULL,
  `reward_name` varchar(255) NOT NULL,
  `reward_money` varchar(255) DEFAULT NULL,
  `reward_goods` varchar(255) DEFAULT NULL,
  `remark` text,
  `reject_remark` text,
  `status` int(10) NOT NULL DEFAULT '0',
  `city` varchar(255) DEFAULT NULL,
  `lcu` varchar(255) DEFAULT NULL,
  `luu` varchar(255) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='員工獲獎列表';

-- ----------------------------
-- Records of hr_employee_reward
-- ----------------------------

-- ----------------------------
-- Table structure for `hr_employee_wages`
-- ----------------------------
DROP TABLE IF EXISTS `hr_employee_wages`;
CREATE TABLE `hr_employee_wages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city` varchar(40) DEFAULT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `wages_head` text,
  `wages_body` varchar(255) DEFAULT NULL,
  `wages_date` date DEFAULT NULL,
  `wages_status` int(11) NOT NULL DEFAULT '1',
  `just_remark` varchar(255) DEFAULT NULL,
  `hour` varchar(50) DEFAULT NULL,
  `sum` varchar(50) DEFAULT NULL,
  `lcu` varchar(50) DEFAULT NULL,
  `luu` varchar(50) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='員工的工資表';

-- ----------------------------
-- Records of hr_employee_wages
-- ----------------------------

-- ----------------------------
-- Table structure for `hr_employee_work`
-- ----------------------------
DROP TABLE IF EXISTS `hr_employee_work`;
CREATE TABLE `hr_employee_work` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(10) unsigned NOT NULL,
  `employee_name` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT '0' COMMENT '0... 1...',
  `holiday_id` int(10) unsigned NOT NULL,
  `holiday_name` varchar(100) DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `hour` varchar(10) DEFAULT '1' COMMENT '.......hour.',
  `remark` text COMMENT '..',
  `reject_remark` text,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '.. 0...  1...  2..... 3... 4:..',
  `city` varchar(255) DEFAULT NULL,
  `lcu` varchar(100) DEFAULT NULL,
  `luu` varchar(100) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='........';

-- ----------------------------
-- Records of hr_employee_work
-- ----------------------------

-- ----------------------------
-- Table structure for `hr_holiday`
-- ----------------------------
DROP TABLE IF EXISTS `hr_holiday`;
CREATE TABLE `hr_holiday` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `z_index` varchar(50) DEFAULT NULL,
  `type` int(10) NOT NULL DEFAULT '0' COMMENT '0... 1...',
  `lcu` varchar(50) DEFAULT NULL,
  `luu` varchar(50) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='.....';

-- ----------------------------
-- Records of hr_holiday
-- ----------------------------

-- ----------------------------
-- Table structure for `hr_queue`
-- ----------------------------
DROP TABLE IF EXISTS `hr_queue`;
CREATE TABLE `hr_queue` (
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
-- Records of hr_queue
-- ----------------------------

-- ----------------------------
-- Table structure for `hr_queue_param`
-- ----------------------------
DROP TABLE IF EXISTS `hr_queue_param`;
CREATE TABLE `hr_queue_param` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `queue_id` int(10) unsigned NOT NULL,
  `param_field` varchar(50) NOT NULL,
  `param_value` varchar(500) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hr_queue_param
-- ----------------------------

-- ----------------------------
-- Table structure for `hr_queue_user`
-- ----------------------------
DROP TABLE IF EXISTS `hr_queue_user`;
CREATE TABLE `hr_queue_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `queue_id` int(10) unsigned NOT NULL,
  `username` varchar(30) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hr_queue_user
-- ----------------------------

-- ----------------------------
-- Table structure for `hr_reward`
-- ----------------------------
DROP TABLE IF EXISTS `hr_reward`;
CREATE TABLE `hr_reward` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '獎勵名字',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '獎勵類型：0（僅獎金）、1（僅物品）、2（獎金加物品）',
  `money` varchar(100) DEFAULT NULL COMMENT '獎金',
  `goods` varchar(255) DEFAULT NULL COMMENT '獎勵物品',
  `city` varchar(100) DEFAULT NULL,
  `lcu` varchar(100) DEFAULT NULL,
  `luu` varchar(100) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='獎勵表';

-- ----------------------------
-- Records of hr_reward
-- ----------------------------

-- ----------------------------
-- Table structure for `hr_wages`
-- ----------------------------
DROP TABLE IF EXISTS `hr_wages`;
CREATE TABLE `hr_wages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wages_name` varchar(30) NOT NULL COMMENT '工資組成名稱',
  `city` varchar(30) NOT NULL COMMENT '所在城市',
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工資配置表';

-- ----------------------------
-- Records of hr_wages
-- ----------------------------

-- ----------------------------
-- Table structure for `hr_wages_con`
-- ----------------------------
DROP TABLE IF EXISTS `hr_wages_con`;
CREATE TABLE `hr_wages_con` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wages_id` int(10) unsigned NOT NULL COMMENT '工資id',
  `type_name` varchar(30) NOT NULL COMMENT '屬性名稱',
  `compute` int(11) NOT NULL DEFAULT '0' COMMENT '計算方式：0（固定工資）、1（每小時工資）、2（提成百分比）',
  `z_index` int(11) NOT NULL DEFAULT '0' COMMENT '層級',
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工資組合表(配置)';

-- ----------------------------
-- Records of hr_wages_con
-- ----------------------------

-- ----------------------------
-- Table structure for `opr_classify`
-- ----------------------------
DROP TABLE IF EXISTS `opr_classify`;
CREATE TABLE `opr_classify` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '小分類的名字',
  `class_type` varchar(40) NOT NULL DEFAULT 'Import' COMMENT '所屬類型',
  `level` varchar(10) DEFAULT NULL COMMENT '級別',
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物品小分類表（暫時只給總部管理員使用）';

-- ----------------------------
-- Records of opr_classify
-- ----------------------------

-- ----------------------------
-- Table structure for `opr_email`
-- ----------------------------
DROP TABLE IF EXISTS `opr_email`;
CREATE TABLE `opr_email` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '中央郵件的名字',
  `email` varchar(30) NOT NULL COMMENT '中央郵箱',
  `lcu` varchar(255) DEFAULT NULL,
  `luu` varchar(255) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='中央郵箱';

-- ----------------------------
-- Records of opr_email
-- ----------------------------

-- ----------------------------
-- Table structure for `opr_goods`
-- ----------------------------
DROP TABLE IF EXISTS `opr_goods`;
CREATE TABLE `opr_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_code` varchar(20) DEFAULT NULL,
  `goods_class` varchar(255) DEFAULT NULL COMMENT '物品類型（Import：進口貨、Domestic：國產貨、Fast：快速貨）',
  `name` varchar(30) NOT NULL COMMENT '物品名字',
  `type` varchar(30) NOT NULL COMMENT '物品規格',
  `unit` varchar(30) NOT NULL COMMENT '物品單位',
  `price` varchar(30) NOT NULL COMMENT '物品單價',
  `big_num` int(10) unsigned DEFAULT '0' COMMENT '總部數量限制',
  `small_num` int(10) DEFAULT '0' COMMENT '區域數量限制',
  `lcu` varchar(30) CHARACTER SET utf32 DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物品表';

-- ----------------------------
-- Records of opr_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `opr_goods_do`
-- ----------------------------
DROP TABLE IF EXISTS `opr_goods_do`;
CREATE TABLE `opr_goods_do` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_code` varchar(20) DEFAULT NULL COMMENT '物品編號',
  `classify_id` int(10) DEFAULT NULL COMMENT '小分類的id',
  `name` varchar(100) NOT NULL COMMENT '物品名字',
  `type` varchar(30) NOT NULL COMMENT '物品規格',
  `unit` varchar(30) NOT NULL COMMENT '物品單位',
  `price` varchar(30) DEFAULT NULL COMMENT '物品單價',
  `rules_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '混合規則id',
  `multiple` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '數量倍率',
  `big_num` int(10) unsigned DEFAULT '0' COMMENT '最大數量限制',
  `small_num` int(10) DEFAULT '0' COMMENT '最小數量限制',
  `origin` varchar(30) DEFAULT NULL COMMENT '來源地',
  `stickies_id` varchar(10) DEFAULT NULL COMMENT '標籤id',
  `lcu` varchar(30) CHARACTER SET utf32 DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物品表(只含有進口物品）';

-- ----------------------------
-- Records of opr_goods_do
-- ----------------------------

-- ----------------------------
-- Table structure for `opr_goods_fa`
-- ----------------------------
DROP TABLE IF EXISTS `opr_goods_fa`;
CREATE TABLE `opr_goods_fa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_code` varchar(20) DEFAULT NULL COMMENT '物品編號',
  `classify_id` int(10) DEFAULT NULL COMMENT '小分類的id',
  `name` varchar(100) NOT NULL COMMENT '物品名字',
  `type` varchar(30) NOT NULL COMMENT '物品規格',
  `unit` varchar(30) NOT NULL COMMENT '物品單位',
  `price` varchar(30) DEFAULT NULL COMMENT '物品單價',
  `rules_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '混合規則id',
  `multiple` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '數量倍率',
  `big_num` int(10) unsigned DEFAULT '0' COMMENT '總部數量限制',
  `small_num` int(10) DEFAULT '0' COMMENT '區域數量限制',
  `origin` varchar(30) DEFAULT NULL COMMENT '來源地',
  `lcu` varchar(30) CHARACTER SET utf32 DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物品表';

-- ----------------------------
-- Records of opr_goods_fa
-- ----------------------------

-- ----------------------------
-- Table structure for `opr_goods_im`
-- ----------------------------
DROP TABLE IF EXISTS `opr_goods_im`;
CREATE TABLE `opr_goods_im` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_code` varchar(20) DEFAULT NULL COMMENT '物品編號',
  `classify_id` int(10) DEFAULT NULL COMMENT '物品分類的id',
  `name` varchar(100) NOT NULL COMMENT '物品名字',
  `type` varchar(30) NOT NULL COMMENT '物品規格',
  `unit` varchar(30) NOT NULL COMMENT '物品單位',
  `price` varchar(30) DEFAULT NULL COMMENT '物品單價',
  `net_weight` varchar(30) DEFAULT NULL COMMENT '净重',
  `gross_weight` varchar(30) DEFAULT NULL COMMENT '毛重',
  `len` varchar(11) DEFAULT NULL COMMENT '長',
  `width` varchar(11) DEFAULT NULL COMMENT '寬',
  `height` varchar(11) DEFAULT NULL COMMENT '高',
  `rules_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '混合規則id',
  `multiple` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '數量倍率',
  `big_num` int(10) unsigned DEFAULT '0' COMMENT '總部數量限制',
  `small_num` int(10) DEFAULT '0' COMMENT '區域數量限制',
  `origin` varchar(30) DEFAULT NULL COMMENT '來源地',
  `lcu` varchar(30) CHARACTER SET utf32 DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物品表';

-- ----------------------------
-- Records of opr_goods_im
-- ----------------------------

-- ----------------------------
-- Table structure for `opr_goods_rules`
-- ----------------------------
DROP TABLE IF EXISTS `opr_goods_rules`;
CREATE TABLE `opr_goods_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '規則的名字',
  `multiple` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '倍數',
  `max` int(10) unsigned NOT NULL DEFAULT '99999' COMMENT '最大數量',
  `min` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '最小數量',
  `lcu` varchar(20) DEFAULT NULL,
  `luu` varchar(20) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物品的混合限制表';

-- ----------------------------
-- Records of opr_goods_rules
-- ----------------------------

-- ----------------------------
-- Table structure for `opr_monthly_dtl`
-- ----------------------------
DROP TABLE IF EXISTS `opr_monthly_dtl`;
CREATE TABLE `opr_monthly_dtl` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hdr_id` int(10) unsigned NOT NULL,
  `data_field` char(6) NOT NULL,
  `data_value` varchar(100) DEFAULT NULL,
  `manual_input` char(1) DEFAULT 'N',
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of opr_monthly_dtl
-- ----------------------------

-- ----------------------------
-- Table structure for `opr_monthly_field`
-- ----------------------------
DROP TABLE IF EXISTS `opr_monthly_field`;
CREATE TABLE `opr_monthly_field` (
  `code` char(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `upd_type` char(1) NOT NULL DEFAULT 'M',
  `field_type` char(1) NOT NULL DEFAULT 'N',
  `status` char(1) DEFAULT 'Y',
  `function_name` varchar(200) DEFAULT NULL,
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of opr_monthly_field
-- ----------------------------

-- ----------------------------
-- Table structure for `opr_monthly_hdr`
-- ----------------------------
DROP TABLE IF EXISTS `opr_monthly_hdr`;
CREATE TABLE `opr_monthly_hdr` (
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
-- Records of opr_monthly_hdr
-- ----------------------------

-- ----------------------------
-- Table structure for `opr_order`
-- ----------------------------
DROP TABLE IF EXISTS `opr_order`;
CREATE TABLE `opr_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '訂單id',
  `order_code` varchar(20) DEFAULT NULL COMMENT '訂單號（自動生成）',
  `order_user` varchar(30) NOT NULL COMMENT '訂購的用戶',
  `order_class` varchar(30) DEFAULT NULL COMMENT '訂單類型（Import：進口貨、Domestic：國產貨、Fast：快速貨）',
  `activity_id` varchar(10) DEFAULT NULL COMMENT '訂單所屬的活動的id',
  `technician` varchar(10) DEFAULT NULL COMMENT '技術員',
  `status_type` int(10) NOT NULL DEFAULT '0' COMMENT '0:地區審核  1：總部審核',
  `status` varchar(30) NOT NULL COMMENT '訂單狀態（pending / sent / approve / reject / cancelled）',
  `city` varchar(30) DEFAULT NULL COMMENT '訂單歸屬城市',
  `remark` varchar(255) DEFAULT NULL COMMENT '備註',
  `judge` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '是否是總部訂單。1：是，0：否',
  `lcu_email` varchar(40) DEFAULT NULL COMMENT '地區郵箱',
  `ject_remark` text COMMENT '拒絕原因',
  `fish_remark` text COMMENT '收貨信息',
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='訂單表';

-- ----------------------------
-- Records of opr_order
-- ----------------------------

-- ----------------------------
-- Table structure for `opr_order_acc`
-- ----------------------------
DROP TABLE IF EXISTS `opr_order_acc`;
CREATE TABLE `opr_order_acc` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city` varchar(255) NOT NULL,
  `acc_do` int(11) DEFAULT '0',
  `acc_im` int(11) DEFAULT '0',
  `lcu` varchar(255) DEFAULT NULL,
  `luu` varchar(255) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='多訂單限制';

-- ----------------------------
-- Records of opr_order_acc
-- ----------------------------

-- ----------------------------
-- Table structure for `opr_order_activity`
-- ----------------------------
DROP TABLE IF EXISTS `opr_order_activity`;
CREATE TABLE `opr_order_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主鍵',
  `activity_code` varchar(50) DEFAULT NULL COMMENT '活動的編號',
  `activity_title` varchar(50) NOT NULL COMMENT '活動的標題',
  `start_time` date NOT NULL COMMENT '收集開始時間',
  `end_time` date NOT NULL COMMENT '收集結束時間',
  `order_class` varchar(30) DEFAULT NULL COMMENT '訂單類型:Import/Domestic/Fast',
  `num` int(10) unsigned DEFAULT '1' COMMENT '訂單的數量限制',
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='訂單權限表';

-- ----------------------------
-- Records of opr_order_activity
-- ----------------------------

-- ----------------------------
-- Table structure for `opr_order_goods`
-- ----------------------------
DROP TABLE IF EXISTS `opr_order_goods`;
CREATE TABLE `opr_order_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) unsigned NOT NULL COMMENT '物品id',
  `order_id` int(10) unsigned NOT NULL COMMENT '訂單id',
  `goods_num` varchar(10) NOT NULL COMMENT '物品數量',
  `confirm_num` varchar(10) DEFAULT NULL COMMENT '實際數量',
  `note` varchar(255) DEFAULT NULL COMMENT '要求備註',
  `remark` varchar(255) DEFAULT NULL COMMENT '總部備註',
  `order_status` varchar(255) DEFAULT 'pending',
  `city` varchar(50) DEFAULT NULL COMMENT '物品申請人所在城市',
  `lcu` varchar(255) DEFAULT NULL,
  `luu` varchar(255) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='訂單內的物品表';

-- ----------------------------
-- Records of opr_order_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `opr_order_status`
-- ----------------------------
DROP TABLE IF EXISTS `opr_order_status`;
CREATE TABLE `opr_order_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '訂單狀態id',
  `order_id` int(10) unsigned NOT NULL,
  `status` varchar(30) NOT NULL COMMENT '訂單狀態（pending / sent / approve / reject / cancelled）',
  `r_remark` varchar(255) DEFAULT NULL COMMENT '備註',
  `time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '訂單狀態時間',
  `lcu` varchar(255) NOT NULL COMMENT '操作人員',
  `lcd` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='訂單的狀態表';

-- ----------------------------
-- Records of opr_order_status
-- ----------------------------

-- ----------------------------
-- Table structure for `opr_queue`
-- ----------------------------
DROP TABLE IF EXISTS `opr_queue`;
CREATE TABLE `opr_queue` (
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
-- Records of opr_queue
-- ----------------------------

-- ----------------------------
-- Table structure for `opr_queue_param`
-- ----------------------------
DROP TABLE IF EXISTS `opr_queue_param`;
CREATE TABLE `opr_queue_param` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `queue_id` int(10) unsigned NOT NULL,
  `param_field` varchar(50) NOT NULL,
  `param_value` varchar(500) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of opr_queue_param
-- ----------------------------

-- ----------------------------
-- Table structure for `opr_queue_user`
-- ----------------------------
DROP TABLE IF EXISTS `opr_queue_user`;
CREATE TABLE `opr_queue_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `queue_id` int(10) unsigned NOT NULL,
  `username` varchar(30) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of opr_queue_user
-- ----------------------------

-- ----------------------------
-- Table structure for `opr_stickies`
-- ----------------------------
DROP TABLE IF EXISTS `opr_stickies`;
CREATE TABLE `opr_stickies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '標籤的名稱',
  `content` varchar(255) NOT NULL COMMENT '標籤內容',
  `index` int(10) unsigned DEFAULT NULL COMMENT '級別',
  `lcu` varchar(30) DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='標籤表（暫時只給國內貨的物品使用）';

-- ----------------------------
-- Records of opr_stickies
-- ----------------------------

-- ----------------------------
-- Table structure for `opr_warehouse`
-- ----------------------------
DROP TABLE IF EXISTS `opr_warehouse`;
CREATE TABLE `opr_warehouse` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_code` varchar(20) DEFAULT NULL COMMENT '物品編號',
  `classify_id` varchar(11) DEFAULT NULL COMMENT '物品分類的id',
  `name` varchar(100) NOT NULL COMMENT '物品名字',
  `unit` varchar(30) NOT NULL COMMENT '物品單位',
  `price` float(30,2) NOT NULL DEFAULT '0.00',
  `inventory` varchar(10) DEFAULT '0' COMMENT '庫存',
  `city` varchar(30) DEFAULT NULL COMMENT '地區',
  `costing` varchar(20) DEFAULT '0' COMMENT '成本',
  `decimal_num` varchar(10) DEFAULT '否' COMMENT '是否允許小數',
  `lcu` varchar(30) CHARACTER SET utf32 DEFAULT NULL,
  `luu` varchar(30) DEFAULT NULL,
  `lcd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lud` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='倉庫表';

-- ----------------------------
-- Records of opr_warehouse
-- ----------------------------

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='测验单表';

-- ----------------------------
-- Records of quiz
-- ----------------------------
INSERT INTO `quiz` VALUES ('23', '11', '1,3,6', '问题1修改', '17年秋季第一次测验', '1,3,5', '', '', '2017-12-20 00:00:00');
INSERT INTO `quiz` VALUES ('26', '9', '3,4', '描述1.1', '17年秋季第二次测验', '1,2,3', '89555', '', '2017-12-22 00:00:00');
INSERT INTO `quiz` VALUES ('27', '12', '5,6', '测验单描述', '17年秋季第三次测验', '1,2,3,4', '88%', 'HK', '2017-12-13 00:00:00');
INSERT INTO `quiz` VALUES ('28', '15', '2,3', '描述详情测试单12', '17年秋季第四次测验', '1,2,3,4,5', '77%', 'HK', '2017-12-28 00:00:00');
INSERT INTO `quiz` VALUES ('29', '4', '2,3,5,6', '问题描述13', '17年春季第一次测验', '1,2,3,5', '13%', 'HK', '2017-12-13 00:00:00');
INSERT INTO `quiz` VALUES ('30', '15', '2,3,6', '而是下拉', '17年春季第二次测验', '', '', '', null);
INSERT INTO `quiz` VALUES ('31', '12', '2,3,5,6', '下拉测试', '17年春季第三次测验', '', '', '', null);
INSERT INTO `quiz` VALUES ('32', '11', '2,3,5,6', '下拉测试', '17年春季第四次测验', '', '', '', null);
INSERT INTO `quiz` VALUES ('33', '10', '2,3,5,6', '测试下拉', '17年冬季第一次测验', '', '', '', null);
INSERT INTO `quiz` VALUES ('34', '8', '2,3,5,6', '描述89', '17年冬季第二次测验', '', '', '', null);
INSERT INTO `quiz` VALUES ('35', '7', '1,2,3', '描述90', '16年春季第一次测验', '', '', '', null);
INSERT INTO `quiz` VALUES ('36', '6', '2,3,4', '描述91', '16年春季第二次测验', '', '', '', null);
INSERT INTO `quiz` VALUES ('37', '8', '3,4', '描述测试58', '16年春季第三次测验', '', '', '', '2017-12-20 00:00:00');
INSERT INTO `quiz` VALUES ('38', '7', '1,2,3,4,6', '描述91', '18年春季第二次测验', '', '', '', '2017-12-13 00:00:00');

-- ----------------------------
-- Table structure for `sa_good`
-- ----------------------------
DROP TABLE IF EXISTS `sa_good`;
CREATE TABLE `sa_good` (
  `id` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `goodid` int(64) NOT NULL COMMENT '商品ID',
  `gname` varchar(64) NOT NULL COMMENT '商品名字',
  `gmoney` int(64) NOT NULL COMMENT '商品价格',
  `gtype` int(64) NOT NULL,
  `pid` int(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sa_good
-- ----------------------------
INSERT INTO `sa_good` VALUES ('1', '5', '清洁', '0', '1', '0');
INSERT INTO `sa_good` VALUES ('2', '1', '灭虫', '0', '1', '0');
INSERT INTO `sa_good` VALUES ('3', '2', '飘盈香', '0', '1', '0');
INSERT INTO `sa_good` VALUES ('4', '3', '甲醛', '0', '1', '0');
INSERT INTO `sa_good` VALUES ('5', '4', '纸品', '0', '1', '0');
INSERT INTO `sa_good` VALUES ('6', '100', '马桶', '100', '2', '5');
INSERT INTO `sa_good` VALUES ('7', '101', '尿斗', '100', '2', '5');
INSERT INTO `sa_good` VALUES ('8', '102', '水盆', '100', '2', '5');
INSERT INTO `sa_good` VALUES ('9', '103', '清新机', '100', '2', '5');
INSERT INTO `sa_good` VALUES ('10', '104', '皂液机', '100', '2', '5');
INSERT INTO `sa_good` VALUES ('11', '105', '租赁机器', '100', '2', '5');
INSERT INTO `sa_good` VALUES ('12', '106', '老鼠', '100', '2', '1');
INSERT INTO `sa_good` VALUES ('13', '107', '蟑螂', '100', '2', '1');
INSERT INTO `sa_good` VALUES ('14', '108', '果蝇', '100', '2', '1');
INSERT INTO `sa_good` VALUES ('15', '109', '租灭蝇灯', '100', '2', '1');
INSERT INTO `sa_good` VALUES ('16', '110', '老鼠蟑螂', '100', '2', '1');
INSERT INTO `sa_good` VALUES ('17', '111', '老鼠果蝇', '100', '2', '1');
INSERT INTO `sa_good` VALUES ('18', '112', '蟑螂果蝇', '100', '2', '1');
INSERT INTO `sa_good` VALUES ('19', '113', '老鼠蟑螂果蝇', '100', '2', '1');
INSERT INTO `sa_good` VALUES ('20', '114', '老鼠蟑螂+租灯', '100', '2', '1');
INSERT INTO `sa_good` VALUES ('21', '115', '蟑螂果蝇+租灯', '100', '2', '1');
INSERT INTO `sa_good` VALUES ('22', '116', '老鼠蟑螂果蝇+租灯', '100', '2', '1');
INSERT INTO `sa_good` VALUES ('23', '117', '小机', '100', '2', '2');
INSERT INTO `sa_good` VALUES ('24', '118', '大机', '100', '2', '2');
INSERT INTO `sa_good` VALUES ('25', '119', '中机', '100', '2', '2');
INSERT INTO `sa_good` VALUES ('26', '120', '迷你小机', '100', '2', '2');
INSERT INTO `sa_good` VALUES ('27', '121', '除甲醛', '100', '2', '3');
INSERT INTO `sa_good` VALUES ('28', '122', 'AC30', '100', '2', '3');
INSERT INTO `sa_good` VALUES ('29', '123', 'PR10', '100', '2', '3');
INSERT INTO `sa_good` VALUES ('30', '124', '迷你清洁炮', '100', '2', '3');
INSERT INTO `sa_good` VALUES ('31', '125', '擦手纸', '100', '2', '4');
INSERT INTO `sa_good` VALUES ('32', '126', '大卷厕纸', '100', '2', '4');
INSERT INTO `sa_good` VALUES ('33', '6', '类型', '0', '1', '0');
INSERT INTO `sa_good` VALUES ('34', '127', '陌拜', '0', '2', '6');
INSERT INTO `sa_good` VALUES ('35', '128', '日常跟进', '0', '2', '6');
INSERT INTO `sa_good` VALUES ('36', '129', '客户资源', '0', '2', '6');
INSERT INTO `sa_good` VALUES ('37', '7', '目的', '0', '1', '0');
INSERT INTO `sa_good` VALUES ('38', '130', '首次', '0', '2', '7');
INSERT INTO `sa_good` VALUES ('39', '131', '报价', '0', '2', '7');
INSERT INTO `sa_good` VALUES ('40', '132', '客诉', '0', '2', '7');
INSERT INTO `sa_good` VALUES ('41', '133', '收款', '0', '2', '7');
INSERT INTO `sa_good` VALUES ('42', '134', '追款', '0', '2', '7');
INSERT INTO `sa_good` VALUES ('43', '135', '签单', '0', '2', '7');
INSERT INTO `sa_good` VALUES ('44', '136', '续约', '0', '2', '7');
INSERT INTO `sa_good` VALUES ('45', '137', '回访', '0', '2', '7');
INSERT INTO `sa_good` VALUES ('46', '138', '其他', '0', '2', '7');
INSERT INTO `sa_good` VALUES ('47', '138', '更改项目', '0', '2', '7');
INSERT INTO `sa_good` VALUES ('48', '8', '客户种类', '0', '1', '0');
INSERT INTO `sa_good` VALUES ('49', '139', '粤菜', '0', '2', '8');
INSERT INTO `sa_good` VALUES ('50', '140', '烧烤', '0', '2', '8');
INSERT INTO `sa_good` VALUES ('51', '141', '西餐', '0', '2', '8');
INSERT INTO `sa_good` VALUES ('52', '142', '火锅', '0', '2', '8');
INSERT INTO `sa_good` VALUES ('53', '143', '网吧', '0', '2', '8');
INSERT INTO `sa_good` VALUES ('54', '144', '影院', '0', '2', '8');
INSERT INTO `sa_good` VALUES ('55', '145', '酒吧', '0', '2', '8');
INSERT INTO `sa_good` VALUES ('56', '146', '其他', '0', '2', '8');
INSERT INTO `sa_good` VALUES ('57', '147', 'KTV', '0', '2', '8');
INSERT INTO `sa_good` VALUES ('58', '148', '茶餐厅', '0', '2', '8');
INSERT INTO `sa_good` VALUES ('59', '149', '江浙菜', '0', '2', '8');
INSERT INTO `sa_good` VALUES ('60', '150', '美容院', '0', '2', '8');
INSERT INTO `sa_good` VALUES ('61', '151', '饮品店', '0', '2', '8');
INSERT INTO `sa_good` VALUES ('62', '152', '咖啡厅', '0', '2', '8');
INSERT INTO `sa_good` VALUES ('63', '153', '清真菜', '0', '2', '8');
INSERT INTO `sa_good` VALUES ('64', '154', '俱乐部', '0', '2', '8');
INSERT INTO `sa_good` VALUES ('65', '155', '快简餐', '0', '2', '8');
INSERT INTO `sa_good` VALUES ('66', '156', '川辣菜', '0', '0', '8');
INSERT INTO `sa_good` VALUES ('67', '157', '日本料理', '0', '0', '8');
INSERT INTO `sa_good` VALUES ('68', '158', '水疗会所', '0', '0', '8');
INSERT INTO `sa_good` VALUES ('69', '159', '韩国料理', '0', '0', '8');
INSERT INTO `sa_good` VALUES ('70', '160', '面包甜点', '0', '0', '8');
INSERT INTO `sa_good` VALUES ('71', '161', '星马月泰菜', '0', '0', '8');
INSERT INTO `sa_good` VALUES ('72', '162', '东西北菜', '0', '0', '8');

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
INSERT INTO `test_exams` VALUES ('1', '假如您的客户询问您有关产品的问题,您不知道如何回答,您的做法是', '以您认为对的答案,用好像了解的样子来回答', '承认您缺乏这方面的知识,然后去找正确答案', '答应将问题转呈给业务经理', '给他一个听来很好的答案', '3', 'HK141');
INSERT INTO `test_exams` VALUES ('2', '当客户正在谈论,而且很明显,他所说的是错误的,您的做法是', '打断他的话,并予以纠正', '聆听然后改变话题', '聆听并找出错误之处', '利用反问使他发觉错误', '1', 'CN');
INSERT INTO `test_exams` VALUES ('5', '假如您觉得有点泄气时,您的做法是', '请一天假不去想公事', '强迫您自己更卖力去做', '尽量减少拜访', '请示业务经理和您一道去', '1', null);
INSERT INTO `test_exams` VALUES ('6', '当您拜访经常吃闭门羹的客户时,您的做法是', '不必经常去拜访', '根本不去拜访他', '经常去拜访并试图去改善', '请示业务经理换人试试', '1', null);
INSERT INTO `test_exams` VALUES ('8', '您碰到对方说\"您的价格太贵了\"您的做法是', '同意他的说法,然后改变话题', '先感谢他的看法,然后指出一分钱一分货', '不管客户的说法', '运用您强有力的辩解', '0', null);
INSERT INTO `test_exams` VALUES ('10', '当您回答客户的相反意见之后,您的做法是', '保持沉默并等待客户开口', '变换主题,并继续销售', '继续举证,以支持您的观点', '试行订约', '2', null);
INSERT INTO `test_exams` VALUES ('11', '当您进入客户的办公室时,正好他在阅读,他告诉您一边阅读,一边听您的话,那么您的做法是', '开始您的销售说明', '向他说您可以等他阅读完了再开始', '请求合适的时间再访', '请求对方全身聆听', '0', 'HK');
INSERT INTO `test_exams` VALUES ('12', '您正用电话去约客户安排拜访时间,总机小姐把您的电话转给他的秘书,秘书问您有什么事,您的做法是', '告诉她您希望和他商谈', '告诉她这是私事', '向她解释您的拜访将带给他莫大的好处', '告诉她您希望同他谈论您的商品', null, null);
INSERT INTO `test_exams` VALUES ('13', '面对一个激进型的客户,您的做法是', '客气的', '过分的客气', '证明他错了', '拍他马屁', null, null);
INSERT INTO `test_exams` VALUES ('14', '对付一个悲观的客户,您的做法是', '说些乐观的事', '对他的悲观四项一笑了之', '向他解答他的悲观外表是错误的', '引述事实并指出您的论点是完美的', null, null);
INSERT INTO `test_exams` VALUES ('15', '在展示印刷的视觉辅助工具时,您的做法是', '在他阅读时,解释销售重点', '先销售视觉辅助工具,然后再按重点念给他听', '把辅助工具留下来,以待待查之后让他自己阅读', '希望他把这些印刷物张贴起来', null, null);
INSERT INTO `test_exams` VALUES ('16', '客户告诉您,他正在考虑竞争者额产品,他征求您对竞争者的产品意见,您的做法是', '指出竞争者产品的不足', '称赞竞争者产品的特征', '表示知道他人的产品,然后继续销售您自己的产品', '开个玩笑以引开他的注意', null, null);
INSERT INTO `test_exams` VALUES ('17', '当客户有购买的征兆,如\"什么时候可以送货\",您的做法是', '说明送货的时间,然后机修介绍您的产品特点', '告诉他送货时期,并请求订单', '告诉他送货时期,并试做销售提成', '告诉他送货时间并等候客户的下一步骤', null, null);
INSERT INTO `test_exams` VALUES ('18', '当客户有怨言时,您的做法是', '打断他的话,并指责其错误之处', '注意聆听,虽然认为公司错了但有责任予以否认', '同意他的说法,并将错误归咎于您的业务经理', '注意聆听,判断怨言是否正确,适时答应予以纠正', null, null);
INSERT INTO `test_exams` VALUES ('19', '假如客户要求打折,您的做法是', '答应回去后向业务经理要求', '告诉他没有折扣了', '解释贵公司的折扣情况,然后热心推介产品的特点', '不予理会', null, null);
INSERT INTO `test_exams` VALUES ('20', '当销售店向您说:\"这种产品销售不好\"时,您的做法是', '告诉他其他零售店销售成功的实列', '告诉他产品没有照应该陈列方法陈列', '很技巧地建议商品计划的方法', '问他询问小路不好的原因,必要时将货取回', null, null);
INSERT INTO `test_exams` VALUES ('21', '在获得订单后,您的做法是', '高兴地多谢他后才离开', '略为交谈他的嗜好', '告诉他:\"您做了一个明智的决定\"', '请他到附近去喝一杯', null, null);
INSERT INTO `test_exams` VALUES ('34', '在开始做销售说明,您的做法是', '视图去发觉对方的嗜好,并交换意见', '谈谈气候', '谈论今早的新闻', '尽快谈您拜访他的理由,并说明他可获得的好处', null, null);
INSERT INTO `test_exams` VALUES ('35', '在下列的情况,哪一种是销售员充分利用时间的做法,您的做法是', '将客户资料更新', '当他和客户面对面的时候', '在销售会议学习更好的销售方法', '在销售同事谈论时', null, null);
INSERT INTO `test_exams` VALUES ('36', '当您的客户被第三者打岔时,您的做法是', '继续销售并不予理会', '停止销售并等候有利时间', '建议他在其他时间再来拜访', '请客户去喝一杯咖啡', '1', 'HK');
INSERT INTO `test_exams` VALUES ('37', '数据测试', '正确答案', '错解A', '错解B', '错解C', null, null);
INSERT INTO `test_exams` VALUES ('38', '测试', '测试', '测试', '测试', '测试', '1', '测试');
INSERT INTO `test_exams` VALUES ('39', '数据测试', '正确答案', '错解A', '错解B22222', '错解C22222', null, null);
INSERT INTO `test_exams` VALUES ('40', '数据测试', '正确答案', '错解A', '错解B22222', '错解C22222', null, null);
INSERT INTO `test_exams` VALUES ('41', '内容描述35', '答案A35', '错解A35', '错解B35', '错解C35', null, null);
INSERT INTO `test_exams` VALUES ('42', '在医疗诊治活动中高度危险性物品,必须选用什么处理方法？', '消毒法', '灭菌法', '一般消毒', '清晰处置', null, null);
INSERT INTO `test_exams` VALUES ('43', '进入组织或器官内部的器械,或与破损的组织、皮肤、粘膜密切接触的器材和用品的危险性分类是?', '高度危险性物品', '中毒危险性物品', '帝都危险性物品', '无危险性物品', null, null);
INSERT INTO `test_exams` VALUES ('44', '微生物对消毒因子的抗力从高到低的顺序是？', '细菌芽孢、分枝杆菌、亲水性病毒、真菌孢子、真菌繁殖体、细菌繁', '细菌芽孢、真菌孢子、分枝杆菌、亲水性病毒、真菌繁殖体、细菌繁', '细菌芽孢、分枝杆菌、真菌孢子、亲水性病毒、真菌繁殖体、细菌繁', '真菌孢子、细菌芽孢、分枝杆菌、亲水性病毒、真菌繁殖体、细菌繁', null, null);
INSERT INTO `test_exams` VALUES ('45', '医疗器械用下排气式压力蒸汽灭菌，一般需要维持的温度和时间分别是', '115℃，20—30 min ', '121℃，10—15 min', '121℃，15—30min', '115℃，20—30 min', null, null);
INSERT INTO `test_exams` VALUES ('46', '压力蒸汽灭菌物品存放时间', '7天', '16天', '10-14天', '10小时', null, null);
INSERT INTO `test_exams` VALUES ('47', '紫外线消毒的目标微生物不详时，照射计量不应低于', '10000μW*S/cm2', '600000μW*S/cm2', '60000μW*S/cm2', '100000μW*S/cm2', null, null);
INSERT INTO `test_exams` VALUES ('48', '2%戊二醛对医疗器械浸泡消毒和灭菌的时间分别是', '20分钟达消毒要求，10小时达灭菌要求', '15分钟达消毒要求，4小时达灭菌要求', '45分钟达消毒要求，9小时达灭菌要求', '15分钟达消毒要求，8小时达灭菌要求', null, null);
INSERT INTO `test_exams` VALUES ('49', '用碘伏对细菌繁殖体污染物品的消毒的浓度和时间分别是', '250mg/L，20min', ' 50mg/L，40min', '500mg/L，30min', '200mg/L，15min ', null, null);
INSERT INTO `test_exams` VALUES ('50', '消毒是指杀灭或清除传播媒介上的', '病原细菌', '病原真菌', '病原病毒', '病原微生物', null, null);
INSERT INTO `test_exams` VALUES ('51', '关于影响消毒灭菌效果的因素，下述错误的提法是', '凡是消毒剂，其浓度越高消毒效果越好', '同一消毒剂对不同微生物的杀菌效果不同', '一般温度升高，可提高消毒效果', '消毒剂的杀菌作用受酸碱度影响', null, null);
INSERT INTO `test_exams` VALUES ('52', '在消毒试验中，可用杀灭对数值（KL）表示消毒效果。当KL＝2时，相应杀灭的微生物的百分率为', ' 99.999％', '99.99％', '99.9％', '99％', null, null);
INSERT INTO `test_exams` VALUES ('53', '若某消毒方法的D值为15，则表示该方法', '作用15min，微生物杀灭率可达到100％', '作用15min，微生物杀灭率可达到99％', '作用15min，微生物杀灭率可达到90％', '作用10min，微生物杀灭率可达到50％', null, null);
INSERT INTO `test_exams` VALUES ('54', '残留消毒剂的去除方法包括', '化学中和法', '过滤冲洗法', '稀释法', '离心沉淀法', null, null);
INSERT INTO `test_exams` VALUES ('55', '一般认为，下列微生物中对消毒因子的敏感性最高的是', '细菌繁殖体', '真菌', '亲水病毒（没有脂质包膜的病毒），例如甲型肝炎病毒、脊髓灰质炎', '亲脂病毒（有脂质膜的病毒），例如乙型肝炎病毒、流感病毒等', null, null);
INSERT INTO `test_exams` VALUES ('56', '卫生用品的杀菌性能判定为有杀菌作用时，其杀菌率应为', '杀菌率≥50%', '杀菌率≥90%', '杀菌率≥99%', '杀菌率≥99.9% ', null, null);
INSERT INTO `test_exams` VALUES ('57', '医院消毒效果监测合理的采样时间是', '消毒处理后、医疗活动之前', '医疗活动之中', '医疗活动之后', '随机', null, null);
INSERT INTO `test_exams` VALUES ('58', '干热灭菌效果监测中，生物法常使用的指标菌是', '枯草杆菌黑色变种芽胞（ATCC9372）', '短小杆菌芽胞（E601）', '嗜热脂肪杆菌芽胞（ATCC7953或SSIK31）', '大肠杆菌（8099）E. 白色念珠菌', null, null);
INSERT INTO `test_exams` VALUES ('59', '．《一次性使用卫生用品卫生标准》中规定，生产环境中空气采样应该在下列何种状态下进行', '静态（室内设备正常运行，无工作人员）', '动态（室内设备正常运行，人员正常操作）', '空态（室内无设备和人员）', '消毒处理过程中', null, null);
INSERT INTO `test_exams` VALUES ('60', '《医院消毒卫生标准》中规定，正常情况下物体表面和医护人员手的采样面积分别是', '25cm2，25cm2', '25cm2，30cm2', '50cm2，50cm2', '100cm2，30cm2 ', null, null);
INSERT INTO `test_exams` VALUES ('61', '《医院消毒卫生标准》中规定，使用中消毒液的合格标准是', '无菌，致病性微生物不得检出；', '细菌菌落总数≤10cfu/ml，致病性微生物不得检出', '细菌菌落总数≤20cfu/ml，致病性微生物不得检出', '细菌菌落总数≤100cfu/ml，致病性微生物不得检出', null, null);
INSERT INTO `test_exams` VALUES ('62', '空气过滤除菌的原理是', '随流阻挡', '重力沉降', '静电吸附', '扩散粘留', null, null);
INSERT INTO `test_exams` VALUES ('63', '问题测试的结果', '正解', '错解A', '错解B', '错解C', null, null);
INSERT INTO `test_exams` VALUES ('64', '问题测试的结果2', '正解2', '错解A2', '错解B2', '错解C2', null, null);
INSERT INTO `test_exams` VALUES ('65', '问题测试的结果3', '正解3', '错解A3', '错解B3', '错解C3', null, null);

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
