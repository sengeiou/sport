/*
Navicat MySQL Data Transfer

Source Server         : 体育测试站
Source Server Version : 80015
Source Host           : 13.209.108.189:3306
Source Database       : sports2

Target Server Type    : MYSQL
Target Server Version : 80015
File Encoding         : 65001

Date: 2019-05-25 17:59:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for web_activity_condition
-- ----------------------------
DROP TABLE IF EXISTS `web_activity_condition`;
CREATE TABLE `web_activity_condition` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动名称',
  `condition` json DEFAULT NULL COMMENT '活动条件',
  `white` json DEFAULT NULL COMMENT '白名单',
  `black` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '黑名单',
  `beta` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '内测账号',
  `start_time` timestamp NOT NULL COMMENT '活动开始时间',
  `end_time` timestamp NOT NULL COMMENT '活动结束时间',
  `total` int(10) NOT NULL COMMENT '领取总额',
  `get_money` int(10) NOT NULL DEFAULT '0' COMMENT '已领取总额',
  `status` tinyint(1) NOT NULL COMMENT '0-内测1-启用2-伪删除',
  `server_admin` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '总代理',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='活动';

-- ----------------------------
-- Records of web_activity_condition
-- ----------------------------

-- ----------------------------
-- Table structure for web_activity_receive
-- ----------------------------
DROP TABLE IF EXISTS `web_activity_receive`;
CREATE TABLE `web_activity_receive` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL,
  `money` int(10) NOT NULL COMMENT '领取的金额',
  `ip` varchar(20) NOT NULL COMMENT '领取IP',
  `add_time` timestamp NOT NULL COMMENT '领取时间',
  `activity_id` int(10) NOT NULL COMMENT '关联web_activity_condition',
  `server_admin` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '总代理',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username_idx` (`userid`,`activity_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='活动已领取表';

-- ----------------------------
-- Records of web_activity_receive
-- ----------------------------
INSERT INTO `web_activity_receive` VALUES ('7', '1032', '13', '0:0:0:0:0:0:0:1', '2019-04-05 17:45:29', '5', 'leapi');

-- ----------------------------
-- Table structure for web_admin_rules
-- ----------------------------
DROP TABLE IF EXISTS `web_admin_rules`;
CREATE TABLE `web_admin_rules` (
  `userid` int(5) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-代理1-管理员',
  `rules_id` int(3) NOT NULL COMMENT '对应规则详情表主键ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员-权限关系表';

-- ----------------------------
-- Records of web_admin_rules
-- ----------------------------
INSERT INTO `web_admin_rules` VALUES ('1', '0', '10');
INSERT INTO `web_admin_rules` VALUES ('2', '1', '1');
INSERT INTO `web_admin_rules` VALUES ('2', '1', '2');
INSERT INTO `web_admin_rules` VALUES ('2', '1', '3');
INSERT INTO `web_admin_rules` VALUES ('2', '1', '4');
INSERT INTO `web_admin_rules` VALUES ('2', '1', '5');
INSERT INTO `web_admin_rules` VALUES ('2', '1', '6');
INSERT INTO `web_admin_rules` VALUES ('2', '1', '7');
INSERT INTO `web_admin_rules` VALUES ('2', '1', '8');
INSERT INTO `web_admin_rules` VALUES ('2', '1', '9');
INSERT INTO `web_admin_rules` VALUES ('2', '1', '10');
INSERT INTO `web_admin_rules` VALUES ('2', '1', '11');
INSERT INTO `web_admin_rules` VALUES ('2', '1', '12');
INSERT INTO `web_admin_rules` VALUES ('2', '1', '13');
INSERT INTO `web_admin_rules` VALUES ('2', '1', '14');
INSERT INTO `web_admin_rules` VALUES ('2', '1', '15');
INSERT INTO `web_admin_rules` VALUES ('2', '1', '16');
INSERT INTO `web_admin_rules` VALUES ('3', '1', '1');
INSERT INTO `web_admin_rules` VALUES ('3', '1', '2');
INSERT INTO `web_admin_rules` VALUES ('3', '1', '3');
INSERT INTO `web_admin_rules` VALUES ('3', '1', '4');
INSERT INTO `web_admin_rules` VALUES ('3', '1', '5');
INSERT INTO `web_admin_rules` VALUES ('3', '1', '6');
INSERT INTO `web_admin_rules` VALUES ('3', '1', '7');
INSERT INTO `web_admin_rules` VALUES ('3', '1', '8');
INSERT INTO `web_admin_rules` VALUES ('3', '1', '9');
INSERT INTO `web_admin_rules` VALUES ('3', '1', '10');
INSERT INTO `web_admin_rules` VALUES ('3', '1', '11');
INSERT INTO `web_admin_rules` VALUES ('3', '1', '12');
INSERT INTO `web_admin_rules` VALUES ('3', '1', '13');
INSERT INTO `web_admin_rules` VALUES ('3', '1', '14');
INSERT INTO `web_admin_rules` VALUES ('3', '1', '15');
INSERT INTO `web_admin_rules` VALUES ('3', '1', '16');
INSERT INTO `web_admin_rules` VALUES ('4', '1', '1');
INSERT INTO `web_admin_rules` VALUES ('4', '1', '2');
INSERT INTO `web_admin_rules` VALUES ('4', '1', '3');
INSERT INTO `web_admin_rules` VALUES ('4', '1', '4');
INSERT INTO `web_admin_rules` VALUES ('4', '1', '5');
INSERT INTO `web_admin_rules` VALUES ('4', '1', '6');
INSERT INTO `web_admin_rules` VALUES ('4', '1', '7');
INSERT INTO `web_admin_rules` VALUES ('4', '1', '8');
INSERT INTO `web_admin_rules` VALUES ('4', '1', '9');
INSERT INTO `web_admin_rules` VALUES ('4', '1', '10');
INSERT INTO `web_admin_rules` VALUES ('4', '1', '11');
INSERT INTO `web_admin_rules` VALUES ('4', '1', '12');
INSERT INTO `web_admin_rules` VALUES ('4', '1', '13');
INSERT INTO `web_admin_rules` VALUES ('4', '1', '14');
INSERT INTO `web_admin_rules` VALUES ('4', '1', '15');
INSERT INTO `web_admin_rules` VALUES ('4', '1', '16');
INSERT INTO `web_admin_rules` VALUES ('5', '1', '1');
INSERT INTO `web_admin_rules` VALUES ('5', '1', '2');
INSERT INTO `web_admin_rules` VALUES ('5', '1', '3');
INSERT INTO `web_admin_rules` VALUES ('5', '1', '4');
INSERT INTO `web_admin_rules` VALUES ('5', '1', '5');
INSERT INTO `web_admin_rules` VALUES ('5', '1', '6');
INSERT INTO `web_admin_rules` VALUES ('5', '1', '7');
INSERT INTO `web_admin_rules` VALUES ('5', '1', '8');
INSERT INTO `web_admin_rules` VALUES ('5', '1', '9');
INSERT INTO `web_admin_rules` VALUES ('5', '1', '10');
INSERT INTO `web_admin_rules` VALUES ('5', '1', '11');
INSERT INTO `web_admin_rules` VALUES ('5', '1', '12');
INSERT INTO `web_admin_rules` VALUES ('5', '1', '13');
INSERT INTO `web_admin_rules` VALUES ('5', '1', '14');
INSERT INTO `web_admin_rules` VALUES ('5', '1', '15');
INSERT INTO `web_admin_rules` VALUES ('5', '1', '16');
INSERT INTO `web_admin_rules` VALUES ('1', '1', '1');
INSERT INTO `web_admin_rules` VALUES ('1', '1', '2');
INSERT INTO `web_admin_rules` VALUES ('1', '1', '3');
INSERT INTO `web_admin_rules` VALUES ('1', '1', '4');
INSERT INTO `web_admin_rules` VALUES ('1', '1', '5');
INSERT INTO `web_admin_rules` VALUES ('1', '1', '6');
INSERT INTO `web_admin_rules` VALUES ('1', '1', '7');
INSERT INTO `web_admin_rules` VALUES ('1', '1', '8');
INSERT INTO `web_admin_rules` VALUES ('1', '1', '9');
INSERT INTO `web_admin_rules` VALUES ('1', '1', '10');
INSERT INTO `web_admin_rules` VALUES ('1', '1', '11');
INSERT INTO `web_admin_rules` VALUES ('1', '1', '12');
INSERT INTO `web_admin_rules` VALUES ('1', '1', '13');
INSERT INTO `web_admin_rules` VALUES ('1', '1', '14');
INSERT INTO `web_admin_rules` VALUES ('1', '1', '15');
INSERT INTO `web_admin_rules` VALUES ('1', '1', '16');
INSERT INTO `web_admin_rules` VALUES ('6', '1', '1');
INSERT INTO `web_admin_rules` VALUES ('6', '1', '2');
INSERT INTO `web_admin_rules` VALUES ('6', '1', '3');
INSERT INTO `web_admin_rules` VALUES ('6', '1', '4');
INSERT INTO `web_admin_rules` VALUES ('6', '1', '5');
INSERT INTO `web_admin_rules` VALUES ('6', '1', '6');
INSERT INTO `web_admin_rules` VALUES ('6', '1', '7');
INSERT INTO `web_admin_rules` VALUES ('6', '1', '8');
INSERT INTO `web_admin_rules` VALUES ('6', '1', '9');
INSERT INTO `web_admin_rules` VALUES ('6', '1', '10');
INSERT INTO `web_admin_rules` VALUES ('6', '1', '11');
INSERT INTO `web_admin_rules` VALUES ('6', '1', '12');
INSERT INTO `web_admin_rules` VALUES ('6', '1', '13');
INSERT INTO `web_admin_rules` VALUES ('6', '1', '14');
INSERT INTO `web_admin_rules` VALUES ('6', '1', '15');
INSERT INTO `web_admin_rules` VALUES ('6', '1', '16');

-- ----------------------------
-- Table structure for web_ag_bill
-- ----------------------------
DROP TABLE IF EXISTS `web_ag_bill`;
CREATE TABLE `web_ag_bill` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `billno` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userid` int(11) NOT NULL,
  `game_code` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `net_amount` decimal(11,2) NOT NULL,
  `bet_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `game_type` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `bet_amount` decimal(11,2) NOT NULL,
  `valid_bet_amount` decimal(11,2) NOT NULL,
  `flag` tinyint(1) NOT NULL,
  `play_type` int(4) NOT NULL,
  `currency` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `login_ip` bigint(10) NOT NULL,
  `recalcu_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `platform_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `round` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `remark` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userid_idx` (`userid`) USING BTREE,
  KEY `bet_time_idx` (`bet_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='AG注单表';

-- ----------------------------
-- Records of web_ag_bill
-- ----------------------------
INSERT INTO `web_ag_bill` VALUES ('1', '181023025805293', '1062', 'GC00818A23034', '-50.00', '2019-01-11 16:49:07', 'ROU', '50.00', '50.00', '1', '114', 'CNY', '3232267265', '2019-01-11 01:27:04', 'AGIN', 'DSP', null);
INSERT INTO `web_ag_bill` VALUES ('2', '181023025814276', '1062', 'GB02218A2303D', '-20.00', '2019-01-11 16:49:07', 'NN', '100.00', '20.00', '1', '218', 'CNY', '3232267265', '2019-01-11 01:27:04', 'AGIN', 'AGQ', null);
INSERT INTO `web_ag_bill` VALUES ('3', '181023025850282', '1062', 'GC00318A2304Z', '30.00', '2019-01-11 16:49:07', 'BAC', '30.00', '30.00', '1', '2', 'CNY', '3232267265', '2019-01-11 01:27:04', 'AGIN', 'DSP', null);
INSERT INTO `web_ag_bill` VALUES ('4', '181023025851264', '1062', 'GB00318A2305O', '38.00', '2019-01-11 16:49:07', 'BAC', '40.00', '38.00', '1', '1', 'CNY', '3232267265', '2019-01-11 01:27:04', 'AGIN', 'AGQ', null);

-- ----------------------------
-- Table structure for web_ag_bill_history
-- ----------------------------
DROP TABLE IF EXISTS `web_ag_bill_history`;
CREATE TABLE `web_ag_bill_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `billno` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userid` int(11) NOT NULL,
  `game_code` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `net_amount` decimal(11,2) NOT NULL,
  `bet_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `game_type` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `bet_amount` decimal(11,2) NOT NULL,
  `valid_bet_amount` decimal(11,2) NOT NULL,
  `flag` tinyint(1) NOT NULL,
  `play_type` int(4) NOT NULL,
  `currency` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `login_ip` bigint(10) NOT NULL,
  `recalcu_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `platform_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `round` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `remark` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userid_idx` (`userid`) USING BTREE,
  KEY `bet_time_idx` (`bet_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=288 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='AG注单表';

-- ----------------------------
-- Records of web_ag_bill_history
-- ----------------------------
INSERT INTO `web_ag_bill_history` VALUES ('269', '181023025805293', '1062', 'GC00818A23034', '-50.00', '2019-01-11 16:49:07', 'ROU', '50.00', '50.00', '1', '114', 'CNY', '3232267265', '2019-01-11 01:27:04', 'AGIN', 'DSP', '0');
INSERT INTO `web_ag_bill_history` VALUES ('270', '181023025814276', '1062', 'GB02218A2303D', '-20.00', '2019-01-11 16:49:07', 'NN', '100.00', '20.00', '1', '218', 'CNY', '3232267265', '2019-01-11 01:27:04', 'AGIN', 'AGQ', '0');
INSERT INTO `web_ag_bill_history` VALUES ('271', '181023025850282', '1062', 'GC00318A2304Z', '30.00', '2019-01-11 16:49:07', 'BAC', '30.00', '30.00', '1', '2', 'CNY', '3232267265', '2019-01-11 01:27:04', 'AGIN', 'DSP', '0');
INSERT INTO `web_ag_bill_history` VALUES ('272', '181023025851264', '1062', 'GB00318A2305O', '38.00', '2019-01-11 16:49:07', 'BAC', '40.00', '38.00', '1', '1', 'CNY', '3232267265', '2019-01-11 01:27:04', 'AGIN', 'AGQ', '0');
INSERT INTO `web_ag_bill_history` VALUES ('273', '181023025851386', '1062', 'GB00318A2305O', '-40.00', '2019-01-11 16:49:07', 'BAC', '40.00', '40.00', '1', '15', 'CNY', '3232267265', '2019-01-11 01:27:04', 'AGIN', 'AGQ', '0');
INSERT INTO `web_ag_bill_history` VALUES ('274', '181023025852834', '1062', 'GB00318A2305O', '-20.00', '2019-01-11 16:49:07', 'BAC', '20.00', '20.00', '1', '2', 'CNY', '3232267265', '2019-01-11 01:27:04', 'AGIN', 'AGQ', '0');
INSERT INTO `web_ag_bill_history` VALUES ('275', '181023025853369', '1062', 'GB00218A2305R', '1140.00', '2019-01-11 16:49:07', 'BAC', '1200.00', '1140.00', '1', '1', 'CNY', '3232267265', '2019-01-11 01:27:04', 'AGIN', 'AGQ', '0');
INSERT INTO `web_ag_bill_history` VALUES ('276', '181023025861289', '1062', 'GB00518A2307J', '-950.00', '2019-01-11 02:01:07', 'BAC', '950.00', '950.00', '1', '2', 'CNY', '3232267265', '2019-01-11 02:01:07', 'AGIN', 'AGQ', '0');
INSERT INTO `web_ag_bill_history` VALUES ('277', '181023025865929', '1062', 'GC00618A2303P', '-600.00', '2019-01-11 16:49:07', 'BAC', '600.00', '600.00', '1', '1', 'CNY', '3232267265', '2019-01-11 01:27:04', 'AGIN', 'DSP', '0');
INSERT INTO `web_ag_bill_history` VALUES ('278', '181023025869048', '1062', 'GC00618A2303P', '500.00', '2019-01-11 16:49:07', 'BAC', '500.00', '500.00', '1', '2', 'CNY', '3232267265', '2019-01-11 01:27:04', 'AGIN', 'DSP', '0');
INSERT INTO `web_ag_bill_history` VALUES ('279', '5bb19c0d93b055b0bc512877', '1062', null, '1182.30', '2019-01-11 02:16:40', null, '460.00', '460.00', '0', '0', 'CNY', '3232267265', '2019-01-11 02:16:40', 'HUNTER', null, '126');
INSERT INTO `web_ag_bill_history` VALUES ('280', '5be7b57693b055b0bc27fb66', '1062', null, '-5.97', '2019-01-11 16:49:07', null, '6.00', '6.00', '0', '0', 'CNY', '3232267265', '2019-01-11 01:27:04', 'HUNTER', '2043', '0');
INSERT INTO `web_ag_bill_history` VALUES ('281', '8181001009276488', '1062', null, '-3.00', '2019-01-11 16:49:07', 'SC05', '3.00', '3.00', '1', '0', 'CNY', '3232267265', '2019-01-11 01:27:04', 'SLOT', null, '1');
INSERT INTO `web_ag_bill_history` VALUES ('282', '8181106020083068', '1062', null, '-600.00', '2019-01-11 16:49:07', 'SB55', '1200.00', '1200.00', '1', '0', 'CNY', '3232267265', '2019-01-11 01:27:04', 'SLOT', null, '1');
INSERT INTO `web_ag_bill_history` VALUES ('283', '8181106104426976', '1062', null, '0.00', '2019-01-11 16:49:07', 'TA1X', '0.00', '0.00', '1', '0', 'CNY', '3232267265', '2019-01-11 01:27:04', 'SLOT', null, '11');
INSERT INTO `web_ag_bill_history` VALUES ('284', '8181106194716665', '1062', null, '0.00', '2019-01-11 16:49:07', 'SB08', '0.00', '0.00', '1', '0', 'CNY', '3232267265', '2019-01-11 01:27:04', 'SLOT', null, '2');
INSERT INTO `web_ag_bill_history` VALUES ('285', '9181023028676698', '1062', '797194', '-10.00', '2019-01-11 16:49:07', 'YMBZ', '10.00', '10.00', '1', '0', 'CNY', '3232267265', '2019-01-11 01:27:04', 'YOPLAY', null, '6');
INSERT INTO `web_ag_bill_history` VALUES ('286', '9181023028676699', '1062', '797194', '-10.00', '2019-01-11 16:49:07', 'YMBZ', '10.00', '10.00', '1', '0', 'CNY', '3232267265', '2019-01-11 01:27:04', 'YOPLAY', null, '7');
INSERT INTO `web_ag_bill_history` VALUES ('287', '9181023028676700', '1062', '797194', '-10.00', '2019-01-11 16:49:07', 'YMBZ', '10.00', '10.00', '1', '0', 'CNY', '3232267265', '2019-01-11 01:27:04', 'YOPLAY', null, '8');

-- ----------------------------
-- Table structure for web_ag_sum
-- ----------------------------
DROP TABLE IF EXISTS `web_ag_sum`;
CREATE TABLE `web_ag_sum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agents_id` int(10) NOT NULL COMMENT '上级代理',
  `userid` int(10) NOT NULL,
  `nums` int(11) NOT NULL COMMENT '注单数',
  `date` date NOT NULL COMMENT '日期',
  `user_win` decimal(11,2) NOT NULL COMMENT '会员输赢',
  `bets_money` decimal(11,2) NOT NULL COMMENT '下注金额',
  `valid_money` decimal(11,2) NOT NULL COMMENT '有效金额',
  `server_admin` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '总代理',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `userid_idx` (`userid`,`date`) USING BTREE,
  KEY `server_admin_idx` (`server_admin`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='AG注单汇总表';

-- ----------------------------
-- Records of web_ag_sum
-- ----------------------------

-- ----------------------------
-- Table structure for web_agents_data
-- ----------------------------
DROP TABLE IF EXISTS `web_agents_data`;
CREATE TABLE `web_agents_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_date` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '注册时间',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登陆密码',
  `password_safe` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '取款密码',
  `money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `alias` varchar(173) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '中文名',
  `bank_id` int(5) NOT NULL DEFAULT '0' COMMENT '关联银行卡ID',
  `notes` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '注释',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-正常1-冻结2-伪删除',
  `server_admin` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '总代理',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username_idx` (`username`,`server_admin`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='代理表';

-- ----------------------------
-- Records of web_agents_data
-- ----------------------------
INSERT INTO `web_agents_data` VALUES ('9', 'stamp', '2019-04-20 11:37:01', '30231B277B7F621C4A11E1A8AE2A625C', '30231B277B7F621C4A11E1A8AE2A625C', '100000000.00', 'stamp', '3', '测试代理', '0565865333', '0', 'leapi');
INSERT INTO `web_agents_data` VALUES ('10', 'agent', '2019-04-20 15:09:18', '30231B277B7F621C4A11E1A8AE2A625C', '30231B277B7F621C4A11E1A8AE2A625C', '800000.00', '测试代理', '6', '测试用', '0565865333', '0', 'leapi');

-- ----------------------------
-- Table structure for web_agents_url
-- ----------------------------
DROP TABLE IF EXISTS `web_agents_url`;
CREATE TABLE `web_agents_url` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agents_id` int(11) NOT NULL,
  `agents_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '代理专属网址',
  `notes` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
  `server_admin` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '总代理',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-正常1-伪删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='代理专属域名';

-- ----------------------------
-- Records of web_agents_url
-- ----------------------------
INSERT INTO `web_agents_url` VALUES ('1', '9', 'http://localhost:5858/', '测试', 'leapi', '0');

-- ----------------------------
-- Table structure for web_auth_info
-- ----------------------------
DROP TABLE IF EXISTS `web_auth_info`;
CREATE TABLE `web_auth_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auth_name_CN` varchar(100) DEFAULT NULL COMMENT '权限中文名',
  `auth_name_EN` varchar(100) DEFAULT NULL COMMENT '权限英文名',
  `auth_type` int(5) DEFAULT NULL COMMENT '权限类型',
  `auth_desc` varchar(100) DEFAULT NULL COMMENT '权限描述',
  `auth_url` varchar(255) DEFAULT NULL COMMENT '权限路径',
  `parent` int(5) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of web_auth_info
-- ----------------------------
INSERT INTO `web_auth_info` VALUES ('1', '注单管理', 'gameBillManage', '1', '注单管理--代理系统', '', '0');
INSERT INTO `web_auth_info` VALUES ('2', '体育赛事查询权限', 'sportsBill', '2', '体育赛事注单查询', '/bill/sportPage;/bill/sportBills', '1');
INSERT INTO `web_auth_info` VALUES ('7', '体育赛事审核权限', 'sportsBillAudit', '2', '体育赛事审核', '/bill/audit', '1');
INSERT INTO `web_auth_info` VALUES ('8', '彩票注单查询权限', 'lotteryBill', '2', '彩票注单查询权限', '/bill/lotteryPage;/bill/lotteryBills', '1');
INSERT INTO `web_auth_info` VALUES ('9', '真人荷官查询权限', 'realBill', '2', '真人荷官查询权限', '/bill/realPage;/bill/realBills', '1');
INSERT INTO `web_auth_info` VALUES ('10', 'MG电子查询权限', 'MGBill', '2', 'MG电子查询权限', '/bill/mgPage;/bill/mgBills', '1');
INSERT INTO `web_auth_info` VALUES ('11', 'AG捕鱼查询权限', 'AGFishBill', '2', 'AG捕鱼查询权限', '/bill/agFishPage', '1');
INSERT INTO `web_auth_info` VALUES ('12', 'AG电子YOPlay查询权限', 'AGYOPLAYBill', '2', 'AG电子YOPlay查询权限', '/bill/agYoPlayPage', '1');
INSERT INTO `web_auth_info` VALUES ('13', 'ag电子XIN查询权限', 'AGXINBill', '2', 'ag电子XIN查询权限', '/bill/agXinPage', '1');
INSERT INTO `web_auth_info` VALUES ('14', '会员管理', 'customerManager', '1', '会员管理--代理系统', '', '0');
INSERT INTO `web_auth_info` VALUES ('15', '会员查询权限', 'customerQuery', '2', '会员查询权限', '/user/userPage;/user/userList', '14');
INSERT INTO `web_auth_info` VALUES ('16', '会员新增权限', 'customerAdd', '2', '会员新增权限', '/user/add', '14');
INSERT INTO `web_auth_info` VALUES ('17', '会员编辑权限', 'customerUpdate', '2', '会员编辑权限', '/user/update', '14');
INSERT INTO `web_auth_info` VALUES ('18', '会员平台限额权限', 'customerPlatformLimit', '2', '会员平台限额操作权限', '/limit/bkConfigs;/limit/ftConfigs;/limit/opeBKConfig;/limit/opeFTConfig', '14');
INSERT INTO `web_auth_info` VALUES ('19', '篮球或足球限制下注权限', 'customerLimit', '2', '篮球或足球限制下注权限', '/user/limit', '14');
INSERT INTO `web_auth_info` VALUES ('20', '踢线权限', 'customerOut', '2', '踢线操作权限', '/user/out', '14');
INSERT INTO `web_auth_info` VALUES ('21', '会员等级查询权限', 'customerLevel', '2', '会员等级查询权限', '/level/levelPage;/level/levelList', '14');
INSERT INTO `web_auth_info` VALUES ('22', '会员等级新增权限', 'customerLevelAdd', '2', '会员等级新增权限', '/level/add', '14');
INSERT INTO `web_auth_info` VALUES ('23', '会员等级编辑权限', 'customerLevelEdit', '2', '会员等级编辑权限', '/level/update', '14');
INSERT INTO `web_auth_info` VALUES ('24', '会员等级删除权限', 'customerLevelDel', '2', '会员等级删除权限', '/level/remove', '14');
INSERT INTO `web_auth_info` VALUES ('25', '代理管理', 'agentManager', '1', '代理管理--代理系统', '', '0');
INSERT INTO `web_auth_info` VALUES ('26', '代理列表查询权限', 'agentQuery', '2', '代理列表查询权限', '/agent/agentPage;/agent/agentList', '25');
INSERT INTO `web_auth_info` VALUES ('27', '代理新增权限', 'agentAdd', '2', '代理新增权限', '/agent/add', '25');
INSERT INTO `web_auth_info` VALUES ('28', '代理编辑权限', 'agentUpdate', '2', '代理编辑权限', '/agent/update', '25');
INSERT INTO `web_auth_info` VALUES ('29', '代理删除权限', 'agentDelete', '2', '代理删除权限', '/agent/remove', '25');
INSERT INTO `web_auth_info` VALUES ('30', '代理域名查询权限', 'configQuery', '2', '代理域名查询权限', '/config/configPage;/config/configList', '25');
INSERT INTO `web_auth_info` VALUES ('31', '代理域名新增权限', 'configAdd', '2', '代理域名新增权限', '/config/add', '25');
INSERT INTO `web_auth_info` VALUES ('32', '代理域名编辑权限', 'configUpdate', '2', '代理域名编辑权限', '/config/update', '25');
INSERT INTO `web_auth_info` VALUES ('33', '代理域名删除权限', 'configDelete', '2', '代理域名删除权限', '/config/remove', '25');
INSERT INTO `web_auth_info` VALUES ('34', '权限管理', 'authManage', '1', '权限管理--后台管理系统', '', '0');
INSERT INTO `web_auth_info` VALUES ('35', '管理员列表查询权限', 'adminQuery', '2', '管理员列表查询权限', '/admin/userPage;/admin/userList', '34');
INSERT INTO `web_auth_info` VALUES ('36', '管理员新增权限', 'adminAdd', '2', '管理员新增权限', '/admin/add', '34');
INSERT INTO `web_auth_info` VALUES ('37', '管理员编辑权限', 'adminUpdate', '2', '管理员编辑权限', '/admin/update', '34');
INSERT INTO `web_auth_info` VALUES ('38', '管理员删除权限', 'adminDelete', '2', '管理员删除权限', '/admin/remove', '34');
INSERT INTO `web_auth_info` VALUES ('39', '角色管理查询权限', 'roleQuery', '2', '角色管理查询权限', '/role/rolePage;/role/roleList', '34');
INSERT INTO `web_auth_info` VALUES ('40', '角色修改权限', 'roleUpdate', '2', '角色修改权限', '/role/update', '34');
INSERT INTO `web_auth_info` VALUES ('41', '角色配置权限', 'roleConfig', '2', '角色配置权限', '/role/config', '34');
INSERT INTO `web_auth_info` VALUES ('42', '角色删除权限', 'roleDelete', '2', '角色删除权限', '/role/remove', '34');
INSERT INTO `web_auth_info` VALUES ('43', '权限管理查询权限', 'authQuery', '2', '权限管理查询权限', '/auth/authPage;/auth/authList', '34');
INSERT INTO `web_auth_info` VALUES ('44', '权限新增权限', 'authAdd', '2', '权限新增权限', '/auth/add', '34');
INSERT INTO `web_auth_info` VALUES ('45', '权限编辑权限', 'authUpdate', '2', '权限编辑权限', '/auth/update', '34');
INSERT INTO `web_auth_info` VALUES ('46', '权限删除权限', 'authDelete', '2', '权限删除权限', '/auth/remove', '34');
INSERT INTO `web_auth_info` VALUES ('47', '角色新增权限', 'roleAdd', '2', '角色新增权限', '/role/add', '34');

-- ----------------------------
-- Table structure for web_bank_data
-- ----------------------------
DROP TABLE IF EXISTS `web_bank_data`;
CREATE TABLE `web_bank_data` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `bank` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '卡种',
  `bank_account` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '卡号',
  `bank_address` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '银行地址',
  `bank_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '卡号户主',
  `level_id` int(3) NOT NULL COMMENT '支付分层',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-未启用1-已启用',
  `img_url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '二维码地址',
  `limit_max` int(11) unsigned NOT NULL COMMENT '最高限额',
  `limit_min` int(11) unsigned NOT NULL COMMENT '最低限额',
  `discount_rate` double(4,2) NOT NULL DEFAULT '0.00' COMMENT '线下入款优惠百分比',
  `server_admin` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '总代理',
  `pay_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '关联支付类型字段表pay_type_name',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `status_idx` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下银行支付配置';

-- ----------------------------
-- Records of web_bank_data
-- ----------------------------
INSERT INTO `web_bank_data` VALUES ('1', '中国邮政', '1224545252544565463', '北京', '法海', '1', '0', 'http://google.com', '5000', '100', '0.00', 'leapi', '9');
INSERT INTO `web_bank_data` VALUES ('2', '工商银行', '123456789', '十三里', '小工', '1', '0', 'http://1111', '1000', '1', '0.00', 'leapi', '9');
INSERT INTO `web_bank_data` VALUES ('3', '微信', '7894562233', '测试', '测试', '1', '0', 'https://www.cdn3721.com/sd/201902/zlb.jpg', '10000', '1', '0.00', 'leapi', '10');
INSERT INTO `web_bank_data` VALUES ('4', '支付宝', '4567890', '测试', '测试', '1', '1', 'https://www.cdn3721.com/sd/201902/zlb.jpg', '10000', '1', '0.00', 'leapi', '11');
INSERT INTO `web_bank_data` VALUES ('5', 'qq', '15489996', '测试', '测试', '1', '1', 'https://www.cdn3721.com/sd/201902/zlb.jpg', '10000', '1', '0.00', 'leapi', '13');
INSERT INTO `web_bank_data` VALUES ('6', '中国银行', '458953233', '十三里支行', '皮皮虾', '1', '1', 'http://google.com', '1000', '1', '0.00', 'leapi', '9');
INSERT INTO `web_bank_data` VALUES ('7', '广发银行', '88888888888888888', '沙头角', '小广', '1', '1', 'http://google.com', '50', '100', '0.00', 'leapi', '9');
INSERT INTO `web_bank_data` VALUES ('8', '建设银行', '2222222222222222', '罗湖', '小建', '1', '1', 'http://google.com', '20000', '10000', '0.00', 'leapi', '9');
INSERT INTO `web_bank_data` VALUES ('9', '123123', '123', '123123', '123123', '1', '1', '123', '1', '123', '1.00', '123', '3');

-- ----------------------------
-- Table structure for web_bank_name
-- ----------------------------
DROP TABLE IF EXISTS `web_bank_name`;
CREATE TABLE `web_bank_name` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='银行类型字典表';

-- ----------------------------
-- Records of web_bank_name
-- ----------------------------
INSERT INTO `web_bank_name` VALUES ('1', '中国农业银行', 'ABC');
INSERT INTO `web_bank_name` VALUES ('2', '中国银行', 'BOC');
INSERT INTO `web_bank_name` VALUES ('3', '中国建设银行', 'CCB');
INSERT INTO `web_bank_name` VALUES ('4', '中国工商银行', 'ICBC');
INSERT INTO `web_bank_name` VALUES ('5', '中国邮政储蓄银行', 'PSBC');
INSERT INTO `web_bank_name` VALUES ('6', '招商银行', 'CMB');
INSERT INTO `web_bank_name` VALUES ('7', '兴业银行', 'CIB');
INSERT INTO `web_bank_name` VALUES ('8', '交通银行', 'BCM');
INSERT INTO `web_bank_name` VALUES ('9', '光大银行', 'CEB');
INSERT INTO `web_bank_name` VALUES ('10', '中信银行', 'CTTIC');
INSERT INTO `web_bank_name` VALUES ('11', '广东发展银行', 'GDB');
INSERT INTO `web_bank_name` VALUES ('12', '浦发银行', 'SPDB');
INSERT INTO `web_bank_name` VALUES ('13', '平安银行', 'PINGAN');
INSERT INTO `web_bank_name` VALUES ('14', '华夏银行', 'HXB');
INSERT INTO `web_bank_name` VALUES ('15', '民生银行', 'CMBC');
INSERT INTO `web_bank_name` VALUES ('16', '北京银行', 'BCCB');
INSERT INTO `web_bank_name` VALUES ('17', '深圳发展银行', 'SDB');
INSERT INTO `web_bank_name` VALUES ('18', '上海银行', 'SHB');
INSERT INTO `web_bank_name` VALUES ('19', '渤海银行', 'CBHB');
INSERT INTO `web_bank_name` VALUES ('20', '东亚银行', 'HKBEA');
INSERT INTO `web_bank_name` VALUES ('21', '宁波银行', 'NBCB');
INSERT INTO `web_bank_name` VALUES ('22', '浙商银行', 'CZB');
INSERT INTO `web_bank_name` VALUES ('23', '南京银行', 'NJCB');
INSERT INTO `web_bank_name` VALUES ('24', '杭州银行', 'HZCB');

-- ----------------------------
-- Table structure for web_banner_data
-- ----------------------------
DROP TABLE IF EXISTS `web_banner_data`;
CREATE TABLE `web_banner_data` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片网址',
  `order` int(10) NOT NULL COMMENT '排序',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-pc-1-wap',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0启用1-伪删除',
  `server_admin` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '总代理',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='首页轮播图';

-- ----------------------------
-- Records of web_banner_data
-- ----------------------------
INSERT INTO `web_banner_data` VALUES ('1', '	https://www.cdn3721.com/ali/201809/banner1.JPG', '12', '0', '0', 'leapi');
INSERT INTO `web_banner_data` VALUES ('2', 'https://www.cdn3721.com/ali/201809/banner2.JPG', '11', '0', '0', 'leapi');
INSERT INTO `web_banner_data` VALUES ('3', 'https://www.cdn3721.com/ali/201809/banner3.JPG', '3', '1', '0', 'leapi');
INSERT INTO `web_banner_data` VALUES ('4', 'https://www.cdn3721.com/ali/201809/banner4.JPG', '4', '1', '0', 'leapi');
INSERT INTO `web_banner_data` VALUES ('5', 'https://www.cdn3721.com/ali/201809/banner3.JPG', '13', '0', '0', 'leapi');
INSERT INTO `web_banner_data` VALUES ('6', 'https://www.cdn3721.com/ali/201809/banner4.JPG', '14', '0', '1', 'leapi');
INSERT INTO `web_banner_data` VALUES ('7', '123', '15', '0', '1', 'leapi');
INSERT INTO `web_banner_data` VALUES ('8', '123', '16', '0', '1', 'leapi');
INSERT INTO `web_banner_data` VALUES ('9', '', '122', '0', '1', 'leapi');
INSERT INTO `web_banner_data` VALUES ('10', '', '123', '0', '1', 'leapi');
INSERT INTO `web_banner_data` VALUES ('11', '11', '124', '0', '1', 'leapi');
INSERT INTO `web_banner_data` VALUES ('12', '11', '125', '0', '1', 'leapi');
INSERT INTO `web_banner_data` VALUES ('13', '1', '126', '0', '1', 'leapi');
INSERT INTO `web_banner_data` VALUES ('14', '111111', '127', '0', '1', 'leapi');
INSERT INTO `web_banner_data` VALUES ('15', '1', '128', '0', '1', 'leapi');
INSERT INTO `web_banner_data` VALUES ('16', '11', '129', '0', '1', 'leapi');
INSERT INTO `web_banner_data` VALUES ('17', '1111111', '130', '1', '1', 'leapi');
INSERT INTO `web_banner_data` VALUES ('18', '111', '131', '0', '1', 'leapi');
INSERT INTO `web_banner_data` VALUES ('19', '1111', '132', '0', '1', 'leapi');
INSERT INTO `web_banner_data` VALUES ('20', '1111', '133', '0', '1', 'leapi');
INSERT INTO `web_banner_data` VALUES ('21', '1111', '134', '0', '1', 'leapi');
INSERT INTO `web_banner_data` VALUES ('22', '1111', '135', '0', '1', 'leapi');

-- ----------------------------
-- Table structure for web_captcha_record
-- ----------------------------
DROP TABLE IF EXISTS `web_captcha_record`;
CREATE TABLE `web_captcha_record` (
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `captext` varchar(50) NOT NULL COMMENT '验证码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of web_captcha_record
-- ----------------------------

-- ----------------------------
-- Table structure for web_dict
-- ----------------------------
DROP TABLE IF EXISTS `web_dict`;
CREATE TABLE `web_dict` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'code',
  `type_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT '类型code',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '展示用',
  `value` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '值',
  `fixed` tinyint(4) DEFAULT '0' COMMENT '是否固定 0=固定 1=不固定',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0=不启用 1=启用',
  `sort` tinyint(4) NOT NULL DEFAULT '0' COMMENT '排序号//页面展示用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COMMENT='字典主表';

-- ----------------------------
-- Records of web_dict
-- ----------------------------
INSERT INTO `web_dict` VALUES ('1', 'ag', 'system_maintain', 'AG维护', '2019-04-01 19:00:00~2019-04-01 22:00:00', '0', '1', '4');
INSERT INTO `web_dict` VALUES ('2', 'ag_agent', 'ag_service', 'AG代理用户名', 'R53_AGIN', '0', '1', '1');
INSERT INTO `web_dict` VALUES ('3', 'ag_deskey', 'ag_service', 'AGdes密钥', 'OSzAQjKt', '0', '1', '2');
INSERT INTO `web_dict` VALUES ('4', 'ag_md5key', 'ag_service', 'AGMD5密钥', 'CXljzT5H3Q7p', '0', '1', '3');
INSERT INTO `web_dict` VALUES ('5', 'ag_name_prefix', 'ag_service', 'AG用户前缀', 'WGC', '0', '1', '4');
INSERT INTO `web_dict` VALUES ('6', 'ag_url_get_balance', 'ag_service', 'AG获取余额', 'http://gi.abgj888.com:81/doBusiness.do', '0', '1', '5');
INSERT INTO `web_dict` VALUES ('7', 'ag_url_login', 'ag_service', 'AG登陆', 'http://gi.abgj888.com:81/forwardGame.do', '0', '1', '6');
INSERT INTO `web_dict` VALUES ('8', 'ag_url_register', 'ag_service', 'AG注册', 'http://gi.abgj888.com:81/doBusiness.do', '0', '1', '7');
INSERT INTO `web_dict` VALUES ('9', 'ag_url_transfer', 'ag_service', 'AG额度转换', 'http://gi.abgj888.com:81/doBusiness.do', '0', '1', '8');
INSERT INTO `web_dict` VALUES ('10', 'all_web', 'system_maintain', '全站维护', '2019-04-25 00:00:00 ~ 2019-04-25 23:59:59', '0', '1', '1');
INSERT INTO `web_dict` VALUES ('11', 'android_force_update', 'app_installation', '安卓是否强制更新', '0', '0', '1', '0');
INSERT INTO `web_dict` VALUES ('12', 'android_update_content', 'app_installation', '安卓更新内容', '修改LOGO', '0', '1', '0');
INSERT INTO `web_dict` VALUES ('13', 'android_url', 'app_installation', '安卓安装包路径', 'https://www.baidu.com/ali-v6.7.apk', '0', '1', '0');
INSERT INTO `web_dict` VALUES ('14', 'android_versions', 'app_installation', '安装安装包版本号', '5.2', '0', '1', '0');
INSERT INTO `web_dict` VALUES ('15', 'gunqiu', 'system_maintain', '滚球维护', '2019-04-01 19:00:00~2019-04-01 22:00:00', '0', '1', '6');
INSERT INTO `web_dict` VALUES ('16', 'ios_force_update', 'app_installation', 'IOS是否强制更新', '0', '0', '1', '0');
INSERT INTO `web_dict` VALUES ('17', 'ios_update_content', 'app_installation', '苹果更新内容', '修改LOGO', '0', '1', '0');
INSERT INTO `web_dict` VALUES ('18', 'ios_url', 'app_installation', '苹果安装包', 'https://www.baidu.com/ali-v6.7.ipa', '0', '1', '0');
INSERT INTO `web_dict` VALUES ('19', 'ios_versions', 'app_installation', '苹果版本号', '5.2', '0', '1', '0');
INSERT INTO `web_dict` VALUES ('20', 'jinri', 'system_maintain', '今日维护', '2019-04-01 19:00:00~2019-04-01 22:00:00', '0', '1', '7');
INSERT INTO `web_dict` VALUES ('21', 'lottery', 'system_maintain', '彩票维护', '2019-04-01 19:00:00~2019-04-01 22:00:00', '0', '1', '3');
INSERT INTO `web_dict` VALUES ('22', 'lottery_url_get_balance', 'lottery_service', '彩票获取余额', 'http://api.wgle5.com/user/getBalanceByID', '0', '1', '1');
INSERT INTO `web_dict` VALUES ('23', 'lottery_url_login', 'lottery_service', '彩票登陆', 'http://api.wgle5.com/user/login', '0', '1', '2');
INSERT INTO `web_dict` VALUES ('24', 'lottery_url_mainpage', 'lottery_service', '彩票跳转主页', 'http://api.wgle5.com/Games/jsks', '0', '1', '3');
INSERT INTO `web_dict` VALUES ('25', 'lottery_url_register', 'lottery_service', '彩票注册', 'http://api.wgle5.com/user/register', '0', '1', '4');
INSERT INTO `web_dict` VALUES ('26', 'lottery_url_transfer', 'lottery_service', '彩票额度转换', 'http://api.wgle5.com/sport/moneyChange', '0', '1', '5');
INSERT INTO `web_dict` VALUES ('27', 'mg', 'system_maintain', 'MG维护', '2019-04-01 19:00:00~2019-04-01 22:00:00', '0', '1', '5');
INSERT INTO `web_dict` VALUES ('28', 'mg_api_password', 'mg_service', 'MG鉴权密码', '=G$lU0Mvcxlv8ZTT4$#fX#ws', '0', '1', '2');
INSERT INTO `web_dict` VALUES ('29', 'mg_api_username', 'mg_service', 'MG鉴权用户名', 'GSCZAR_api', '0', '1', '1');
INSERT INTO `web_dict` VALUES ('30', 'mg_parent_id', 'mg_service', 'MG总代编码', '36258855', '0', '1', '3');
INSERT INTO `web_dict` VALUES ('31', 'mg_url_get_balance', 'mg_service', 'MG获取余额', 'https://api.adminserv88.com/v1/wallet', '0', '1', '4');
INSERT INTO `web_dict` VALUES ('32', 'mg_url_get_token', 'mg_service', 'MG获取token', 'https://api.adminserv88.com/oauth/token', '0', '1', '5');
INSERT INTO `web_dict` VALUES ('33', 'mg_url_login', 'mg_service', 'MG登陆', 'https://api.adminserv88.com/v1/launcher/item', '0', '1', '6');
INSERT INTO `web_dict` VALUES ('34', 'mg_url_register', 'mg_service', 'MG注册', 'https://api.adminserv88.com/v1/account/member', '0', '1', '7');
INSERT INTO `web_dict` VALUES ('35', 'mg_url_transfer', 'mg_service', 'MG额度转换', 'https://api.adminserv88.com/v1/transaction ', '0', '1', '8');
INSERT INTO `web_dict` VALUES ('36', 'sport', 'system_maintain', '体育维护', '2019-04-01 19:00:00~2019-04-01 22:00:00', '0', '1', '2');
INSERT INTO `web_dict` VALUES ('38', 'football_ball_type', 'ball_type', '足球', 'ft', '0', '1', '1');
INSERT INTO `web_dict` VALUES ('39', 'baskball_ball_type', 'ball_type', '篮球', 'bk', '0', '1', '2');
INSERT INTO `web_dict` VALUES ('40', 'tennis_ball_type', 'ball_type', '网球', 'tn', '0', '1', '3');
INSERT INTO `web_dict` VALUES ('41', 'baseball_ball_type', 'ball_type', '棒球', 'bs', '0', '1', '4');
INSERT INTO `web_dict` VALUES ('43', 'volleyball_ball_type', 'ball_type', '排球', 'vb', '0', '1', '5');
INSERT INTO `web_dict` VALUES ('44', 'badminton_ball_type', 'ball_type', '羽毛球', 'ba', '0', '1', '6');
INSERT INTO `web_dict` VALUES ('45', 'table_tennis_ball_type', 'ball_type', '乒乓球', 'ta', '0', '1', '7');
INSERT INTO `web_dict` VALUES ('46', 'other_ball_type', 'ball_type', '其它', 'op', '0', '1', '8');
INSERT INTO `web_dict` VALUES ('47', 'win_alone_play_type', 'play_type_ball', '独赢', '1', '0', '1', '1');
INSERT INTO `web_dict` VALUES ('48', 'let_ball_play_type', 'play_type_ball', '让球', '2', '0', '1', '2');
INSERT INTO `web_dict` VALUES ('49', 'big_small_play_type', 'play_type_ball', '大小球', '3', '0', '1', '3');
INSERT INTO `web_dict` VALUES ('50', 'single_double_play_type', 'play_type_ball', '单双', '4', '0', '1', '4');
INSERT INTO `web_dict` VALUES ('51', 'wave_bladder_play_type', 'play_type_ball', '波胆', '5', '0', '1', '5');
INSERT INTO `web_dict` VALUES ('52', 'total_ball_play_type', 'play_type_ball', '总入球', '6', '0', '1', '6');
INSERT INTO `web_dict` VALUES ('53', 'half_full_play_type', 'play_type_ball', '半场全场', '7', '0', '1', '7');
INSERT INTO `web_dict` VALUES ('54', 'first_last_play_type', 'play_type_ball', '最先/后进球', '8', '0', '1', '8');
INSERT INTO `web_dict` VALUES ('55', 'team_size_play_type', 'play_type_ball', '球队大小', '9', '0', '1', '9');
INSERT INTO `web_dict` VALUES ('56', 'champion_play_type', 'play_type_ball', '冠军', '10', '0', '1', '10');
INSERT INTO `web_dict` VALUES ('57', 'cancel_confirmed', 'bill_confirme_type', '取消', '1', '0', '1', '1');
INSERT INTO `web_dict` VALUES ('58', 'waist_cut_confirmed', 'bill_confirme_type', '赛事腰斩', '2', '0', '1', '2');
INSERT INTO `web_dict` VALUES ('59', 'change_date_confirmed', 'bill_confirme_type', '赛事改期', '3', '0', '1', '3');
INSERT INTO `web_dict` VALUES ('60', 'delay_confirmed', 'bill_confirme_type', '赛事延期', '4', '0', '1', '4');
INSERT INTO `web_dict` VALUES ('61', 'delay_match_confirmed', 'bill_confirme_type', '赛事延赛', '5', '0', '1', '5');
INSERT INTO `web_dict` VALUES ('62', 'match_cancel_confirmed', 'bill_confirme_type', '赛事取消', '6', '0', '1', '6');
INSERT INTO `web_dict` VALUES ('63', 'no_pk_confirmed', 'bill_confirme_type', '赛事无PK加时', '7', '0', '1', '7');
INSERT INTO `web_dict` VALUES ('64', 'waiver_confirmed', 'bill_confirme_type', '球员弃权', '8', '0', '1', '8');
INSERT INTO `web_dict` VALUES ('65', 'name_error_confirmed', 'bill_confirme_type', '队名错误', '9', '0', '1', '9');
INSERT INTO `web_dict` VALUES ('66', 'home_away_error_confirmed', 'bill_confirme_type', '主客场错误', '10', '0', '1', '10');
INSERT INTO `web_dict` VALUES ('67', 'first_change_confirmed', 'bill_confirme_type', '先发投手更换', '11', '0', '1', '11');
INSERT INTO `web_dict` VALUES ('68', 'play_change_confirmed', 'bill_confirme_type', '选手更换', '12', '0', '1', '12');
INSERT INTO `web_dict` VALUES ('69', 'mleague_name_error_confirmed', 'bill_confirme_type', '联赛名称错误', '13', '0', '1', '13');
INSERT INTO `web_dict` VALUES ('70', 'position_error_confirmed', 'bill_confirme_type', '盘口错误', '14', '0', '1', '14');
INSERT INTO `web_dict` VALUES ('71', 'early_start_confirmed', 'bill_confirme_type', '提前开赛', '15', '0', '1', '15');
INSERT INTO `web_dict` VALUES ('72', 'score_error_confirmed', 'bill_confirme_type', '比分错误', '16', '0', '1', '16');
INSERT INTO `web_dict` VALUES ('73', 'no_ accept_bill_confirmed', 'bill_confirme_type', '未接受注单', '17', '0', '1', '17');
INSERT INTO `web_dict` VALUES ('74', 'ball_cancel_confirmed', 'bill_confirme_type', '进球取消', '18', '0', '1', '18');
INSERT INTO `web_dict` VALUES ('75', 'red_card_cancel_confirmed', 'bill_confirme_type', '红卡取消', '19', '0', '1', '19');
INSERT INTO `web_dict` VALUES ('76', 'ignormal_bill_confirmed', 'bill_confirme_type', '非正常投注', '20', '0', '1', '20');
INSERT INTO `web_dict` VALUES ('77', 'pay_rat_error_confirmed', 'bill_confirme_type', '赔率错误', '21', '0', '1', '21');
INSERT INTO `web_dict` VALUES ('78', 'normal_bill_confirmed', 'bill_confirme_type', '正常注单', '0', '0', '1', '0');

-- ----------------------------
-- Table structure for web_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `web_dict_type`;
CREATE TABLE `web_dict_type` (
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'code',
  `name` varchar(32) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of web_dict_type
-- ----------------------------
INSERT INTO `web_dict_type` VALUES ('ag_service', 'ag配置信息');
INSERT INTO `web_dict_type` VALUES ('app_installation', 'APP配置安装包');
INSERT INTO `web_dict_type` VALUES ('ball_type', '球赛类型');
INSERT INTO `web_dict_type` VALUES ('bill_confirme_type', '注单确认');
INSERT INTO `web_dict_type` VALUES ('lottery_service', '彩票配置信息');
INSERT INTO `web_dict_type` VALUES ('mg_service', 'mg配置信息');
INSERT INTO `web_dict_type` VALUES ('play_type_ball', '玩法类型');
INSERT INTO `web_dict_type` VALUES ('system_maintain', '系统维护相关');

-- ----------------------------
-- Table structure for web_discount_data
-- ----------------------------
DROP TABLE IF EXISTS `web_discount_data`;
CREATE TABLE `web_discount_data` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动名称',
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '活动简介',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '活动详情',
  `start_time` timestamp NOT NULL COMMENT '开始时间',
  `end_time` timestamp NOT NULL COMMENT '结束时间',
  `pc` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1-pc展示0-不展示',
  `wap` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1-wap展示0-不展示',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-草稿1-发布2-伪删除',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `pc_big_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'pc版活动详情页图片',
  `pc_small_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'pc版活动列表页图片',
  `wap_big_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'wap版活动详情页图片',
  `wap_small_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'wap版活动列表页图片',
  `server_admin` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '总代理',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠活动表';

-- ----------------------------
-- Records of web_discount_data
-- ----------------------------
INSERT INTO `web_discount_data` VALUES ('5', '首存赠送30%', '首存赠送30%，三重优惠无限送', '<p style=\"margin: 2px 2px 10px; font-size: medium; white-space: normal; color: rgb(72, 72, 72); font-family: PMingLiU, &quot;Times New Roman&quot;, Georgia, serif; line-height: 22.4px; text-align: justify;\">1. 在HG8868进行第一次存款时，会员可自由选择，获取/放弃。</p><p style=\"margin: 2px 2px 10px; font-size: medium; white-space: normal; color: rgb(72, 72, 72); font-family: PMingLiU, &quot;Times New Roman&quot;, Georgia, serif; line-height: 22.4px; text-align: justify;\">2. 会员首次存款后, 必须24小时内向在线客服申请, 审核通过后将在20分钟内派发到您的会员账户里, 最高金额8888进入会员账号。</p><p style=\"margin: 2px 2px 10px; font-size: medium; white-space: normal; color: rgb(72, 72, 72); font-family: PMingLiU, &quot;Times New Roman&quot;, Georgia, serif; line-height: 22.4px; text-align: justify;\">3. 首次存款优惠必须要有效投注额的15倍才可申请提款（例：会员入款1000获得优惠300，在有效下注总额达（1000+300）x15=19500才可以申请提款）财务保留权限审核/取消您的提款申请。</p><p style=\"margin: 2px 2px 10px; font-size: medium; white-space: normal; color: rgb(72, 72, 72); font-family: PMingLiU, &quot;Times New Roman&quot;, Georgia, serif; line-height: 22.4px; text-align: justify;\">4. 每位会员首存红利只限申请一次，多账户申请将被取消申请此优惠资格。</p><p style=\"margin: 2px 2px 10px; font-size: medium; white-space: normal; color: rgb(72, 72, 72); font-family: PMingLiU, &quot;Times New Roman&quot;, Georgia, serif; line-height: 22.4px; text-align: justify;\">5. 无论是个人或团体, 如有任何威胁, 滥用HG8868优惠的行为经财务审核, HG8868保留权利取消收回优惠以及优惠产生的盈利。</p><p style=\"margin: 2px 2px 10px; font-size: medium; white-space: normal; color: rgb(72, 72, 72); font-family: PMingLiU, &quot;Times New Roman&quot;, Georgia, serif; line-height: 22.4px; text-align: justify;\">6. 此项优惠必须在体育投注进行，所投注在真人、彩票、电子游戏将不计算在内</p><p style=\"margin: 2px 2px 10px; font-size: medium; white-space: normal; color: rgb(72, 72, 72); font-family: PMingLiU, &quot;Times New Roman&quot;, Georgia, serif; line-height: 22.4px; text-align: justify;\">7. HG8868保留所有权利在任何时候都可以更改.停止.取消优惠活动。</p><p style=\"margin: 2px 2px 10px; font-size: medium; white-space: normal; color: rgb(72, 72, 72); font-family: PMingLiU, &quot;Times New Roman&quot;, Georgia, serif; line-height: 22.4px; text-align: justify;\">8. 本优惠不得与返水优惠并用，会员获得首次存款优惠后，必须成功进行一次取款才可获得返水。</p><p style=\"margin: 2px 2px 10px; font-size: medium; white-space: normal; color: rgb(72, 72, 72); font-family: PMingLiU, &quot;Times New Roman&quot;, Georgia, serif; line-height: 22.4px; text-align: justify;\">*注意：如果在未向客服申请红利之前已经投注，我们将视为您放弃本优惠享有权利。</p><p><br></p>', '2019-01-25 00:00:00', '2019-01-26 00:00:00', '1', '1', '1', '0', 'https://www.8868hk.net/brand/mobile/main/img/jetso1.jpg', 'https://www.8868hk.net/brand/mobile/main/img/jetso1.jpg', 'https://www.8868hk.net/brand/mobile/main/img/jetso1.jpg', 'https://www.8868hk.net/brand/mobile/main/img/jetso1.jpg', 'leapi');
INSERT INTO `web_discount_data` VALUES ('6', '炫酷新版新娱乐', '炫酷新版新娱乐，翻倍返点再次来袭', '<table><tbody><tr class=\"firstRow\"><td width=\"137\" valign=\"top\" style=\"word-break: break-all;\">会员等级</td><td width=\"137\" valign=\"top\" style=\"word-break: break-all;\">日有效投注额</td><td width=\"137\" valign=\"top\" style=\"word-break: break-all;\">体育投注</td><td width=\"137\" valign=\"top\" style=\"word-break: break-all;\">最高返点</td></tr><tr><td width=\"137\" valign=\"top\" style=\"word-break: break-all;\">A</td><td width=\"137\" valign=\"top\" style=\"word-break: break-all;\">2500001以上<br></td><td width=\"137\" valign=\"top\" style=\"word-break: break-all;\">1.2%<span style=\"color: rgb(255, 0, 0);\">+1.0%</span></td><td width=\"137\" valign=\"top\" style=\"word-break: break-all;\">无上限</td></tr><tr><td width=\"137\" valign=\"top\" style=\"word-break: break-all;\">B</td><td width=\"137\" valign=\"top\" style=\"word-break: break-all;\">1000001-2500000</td><td width=\"137\" valign=\"top\" style=\"word-break: break-all;\">1.0%<span style=\"color: rgb(255, 0, 0);\">+0.8%</span></td><td width=\"137\" valign=\"top\" style=\"word-break: break-all;\">无上限</td></tr><tr><td width=\"137\" valign=\"top\" style=\"word-break: break-all;\">C</td><td width=\"137\" valign=\"top\" style=\"word-break: break-all;\">100-1000000</td><td width=\"137\" valign=\"top\" style=\"word-break: break-all;\">0.8%<span style=\"color: rgb(255, 0, 0);\">+0.6%</span></td><td width=\"137\" valign=\"top\" style=\"word-break: break-all;\">无上限</td></tr></tbody></table><p style=\"white-space: normal; text-align: center;\"><br></p><p><br></p>', '2019-01-11 00:00:00', '2019-01-26 00:00:00', '1', '1', '1', '0', 'https://www.8868hk.net/brand/mobile/main/img/jetso38.jpg', 'https://www.8868hk.net/brand/mobile/main/img/jetso38.jpg', 'https://www.8868hk.net/brand/mobile/main/img/jetso38.jpg', 'https://www.8868hk.net/brand/mobile/main/img/jetso38.jpg', 'leapi');

-- ----------------------------
-- Table structure for web_lock_system
-- ----------------------------
DROP TABLE IF EXISTS `web_lock_system`;
CREATE TABLE `web_lock_system` (
  `id` tinyint(1) NOT NULL,
  `lock` tinyint(1) NOT NULL COMMENT '为1的时候改为0注单就能结算了'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='注单不结算';

-- ----------------------------
-- Records of web_lock_system
-- ----------------------------
INSERT INTO `web_lock_system` VALUES ('1', '0');
INSERT INTO `web_lock_system` VALUES ('2', '0');
INSERT INTO `web_lock_system` VALUES ('3', '1');
INSERT INTO `web_lock_system` VALUES ('4', '0');

-- ----------------------------
-- Table structure for web_login_info
-- ----------------------------
DROP TABLE IF EXISTS `web_login_info`;
CREATE TABLE `web_login_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL DEFAULT '0',
  `online` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '0-登出，1-登陆',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-会员1-代理2-管理员',
  `logintime` timestamp NOT NULL COMMENT '登陆时间',
  `login_ip` varchar(30) NOT NULL COMMENT '登陆IP',
  `login_url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登陆地址',
  `onlinetime` timestamp NOT NULL COMMENT '最后在线时间',
  `username` varchar(100) DEFAULT NULL COMMENT '登录用户名',
  `token` varchar(50) DEFAULT NULL COMMENT '登录令牌',
  `logout_time` timestamp NULL DEFAULT NULL COMMENT '登出时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `userid_idx` (`userid`,`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=442 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='在线表';

-- ----------------------------
-- Records of web_login_info
-- ----------------------------
INSERT INTO `web_login_info` VALUES ('341', '1032', '1', '0', '2019-04-06 13:22:59', '0:0:0:0:0:0:0:1', 'localhost:6666', '2019-04-06 13:22:59', 'hugo11', '7bf2c5b7002d43d184ed5c566287fcae', null);
INSERT INTO `web_login_info` VALUES ('400', '1057', '1', '0', '2019-04-13 20:31:09', '0:0:0:0:0:0:0:1', 'localhost:6666', '2019-04-13 20:31:09', 'blessma', '4eee089c5f094cf1971f8874d5de4ccb', null);
INSERT INTO `web_login_info` VALUES ('441', '1044', '1', '0', '2019-05-18 16:20:35', '127.0.0.1', '127.0.0.1:8099', '2019-05-18 16:20:35', 'iostets4', '6767cc17a7054424b9c2b3f722b510a6', null);

-- ----------------------------
-- Table structure for web_login_log
-- ----------------------------
DROP TABLE IF EXISTS `web_login_log`;
CREATE TABLE `web_login_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL,
  `add_time` timestamp NOT NULL COMMENT '登录时间',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录地址',
  `ip` bigint(10) NOT NULL COMMENT '登录IP',
  `server_admin` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '总代理',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userid_idx` (`userid`) USING BTREE,
  KEY `add_time_idx` (`add_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of web_login_log
-- ----------------------------
INSERT INTO `web_login_log` VALUES ('75', '1034', '2019-03-27 02:02:22', 'apisport.8868hh.me:80', '1122502860', 'leapi');
INSERT INTO `web_login_log` VALUES ('76', '1063', '2019-03-27 02:24:58', 'apisport.8868hh.me:80', '1122502860', 'leapi');

-- ----------------------------
-- Table structure for web_lottery_bill
-- ----------------------------
DROP TABLE IF EXISTS `web_lottery_bill`;
CREATE TABLE `web_lottery_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(5) NOT NULL,
  `game_code` int(3) NOT NULL COMMENT '游戏代号',
  `type_code` int(6) NOT NULL COMMENT '下注类型代号',
  `happy8` int(6) NOT NULL COMMENT '类型的class_id',
  `round` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '期号',
  `drop_money` decimal(11,2) NOT NULL COMMENT '下注金额',
  `drop_content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '下注内容',
  `total` decimal(11,2) NOT NULL COMMENT '下注总额',
  `valid_money` decimal(11,2) NOT NULL COMMENT '有效金额',
  `user_win` decimal(11,2) NOT NULL COMMENT '下注输赢，不含退水',
  `user_cut` decimal(11,2) NOT NULL COMMENT '会员退水',
  `user_rate` decimal(7,4) NOT NULL COMMENT '赔率',
  `xq_rate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '小球过关赔率',
  `count_pay` int(3) NOT NULL COMMENT '注数',
  `bet_ip` bigint(10) NOT NULL COMMENT '下注IP',
  `bet_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '下注时间',
  `xq_de_id` int(6) NOT NULL COMMENT '对应小球赔率的ID',
  `count_status` tinyint(1) NOT NULL COMMENT '注单状态:0,未结算;1,已结算;3,已注销;4,已恢复;5,已撤销结算;6,已二次结算;',
  `order_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `order_number_idx` (`order_number`) USING BTREE,
  KEY `userid_idx` (`userid`) USING BTREE,
  KEY `bet_time_idx` (`bet_time`) USING BTREE,
  KEY `gameinfo_idx` (`game_code`,`type_code`,`happy8`) USING BTREE,
  KEY `round_idx` (`round`) USING BTREE,
  KEY `count_status_idx` (`count_status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='彩票注单表';

-- ----------------------------
-- Records of web_lottery_bill
-- ----------------------------
INSERT INTO `web_lottery_bill` VALUES ('1', '1062', '51', '3003', '3003', '724448', '2.00', '9', '2.00', '0.00', '0.00', '100.00', '9.9500', '0', '1', '3232267265', '2019-01-10 14:48:37', '0', '0', '5d82f35b1cbcc2656d0cbc166c5679b8');
INSERT INTO `web_lottery_bill` VALUES ('2', '1062', '51', '3005', '3005', '724448', '2.00', '8', '2.00', '0.00', '0.00', '100.00', '9.9500', '0', '1', '3232267265', '2019-01-10 02:51:46', '0', '0', '2b6ec84c72187dd594f7572dacc45071');
INSERT INTO `web_lottery_bill` VALUES ('3', '1062', '240', '3021', '3021', '20190107174', '18.00', '19', '18.00', '0.00', '0.00', '100.00', '42.5000', '0', '1', '3232267265', '2019-01-10 02:51:46', '0', '0', 'df9194cc33949ace8006ca7b9208c8ce');
INSERT INTO `web_lottery_bill` VALUES ('4', '1062', '2', '1000', '1000', '20190107-054', '5.00', '7', '5.00', '0.00', '0.00', '100.00', '9.9500', '0', '1', '3232267265', '2019-01-10 02:51:46', '0', '0', '9a9bc27611d29f681dbcbd9f05bc4af2');
INSERT INTO `web_lottery_bill` VALUES ('5', '1062', '250', '1001', '1001', '20190107099', '13.00', '4', '13.00', '0.00', '0.00', '100.00', '9.9500', '0', '1', '3232267265', '2019-01-10 02:51:46', '0', '0', '5a7066fa7f5a70166af1e4842f3188f5');
INSERT INTO `web_lottery_bill` VALUES ('6', '1062', '171', '3001', '3001', '20190107022', '1.00', '4', '1.00', '0.00', '0.00', '100.00', '9.9500', '0', '1', '3232267265', '2019-01-10 02:51:46', '0', '0', 'a6b16a77f0a94254829f5e4d1740a87d');
INSERT INTO `web_lottery_bill` VALUES ('7', '1062', '3', '2007', '2007', '20181231-25', '35.00', '4', '35.00', '0.00', '0.00', '100.00', '19.8600', '0', '1', '3232267265', '2019-01-10 02:51:46', '0', '1', '0cd9b28e6ffcddbe0e1ca84026a045ba');
INSERT INTO `web_lottery_bill` VALUES ('8', '1064', '46', '1003', '1003', '20181230282', '1.00', '4', '1.00', '0.00', '0.00', '100.00', '9.9500', '0', '1', '3232267265', '2019-01-15 16:06:47', '0', '1', '5955ef2ed6f56f2743dbce738e02e094');
INSERT INTO `web_lottery_bill` VALUES ('9', '1064', '69', '109', '2', '2019001', '1.00', '1', '1.00', '0.00', '2.76', '100.00', '3.7600', '0', '1', '3232267265', '2019-01-15 16:06:49', '806', '1', '1b3a1ce2599890d1a7186f6af52e7e9c');
INSERT INTO `web_lottery_bill` VALUES ('10', '1064', '69', '120', '28', '2019002', '15.00', '1418,1420,1423', '15.00', '15.00', '-15.00', '100.00', '9.9500', '9.5,12,12', '1', '3232267265', '2019-01-15 16:06:51', '28', '1', '4505b01bebd773d104ebb67557c08390');
INSERT INTO `web_lottery_bill` VALUES ('13', '1064', '69', '85', '13', '2019004', '23.00', '3,25,30', '23.00', '0.00', '0.00', '100.00', '670.0000', '670', '1', '123', '2019-01-15 16:06:55', '617', '0', '8ae0d20ee1316702674aa9641b9c4a16');

-- ----------------------------
-- Table structure for web_lottery_bill_history
-- ----------------------------
DROP TABLE IF EXISTS `web_lottery_bill_history`;
CREATE TABLE `web_lottery_bill_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(5) NOT NULL,
  `game_code` int(3) NOT NULL COMMENT '游戏代号',
  `type_code` int(6) NOT NULL COMMENT '下注类型代号',
  `happy8` int(6) NOT NULL COMMENT '类型的class_id',
  `round` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '期号',
  `drop_money` decimal(11,2) NOT NULL COMMENT '下注金额',
  `drop_content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '下注内容',
  `total` decimal(11,2) NOT NULL COMMENT '下注总额',
  `valid_money` decimal(11,2) NOT NULL COMMENT '有效金额',
  `user_win` decimal(11,2) NOT NULL COMMENT '下注输赢，不含退水',
  `user_cut` decimal(11,2) NOT NULL COMMENT '会员退水',
  `user_rate` decimal(7,4) NOT NULL COMMENT '赔率',
  `xq_rate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '小球过关赔率',
  `count_pay` int(3) NOT NULL COMMENT '注数',
  `bet_ip` bigint(10) NOT NULL COMMENT '下注IP',
  `bet_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '下注时间',
  `xq_de_id` int(6) NOT NULL COMMENT '对应小球赔率的ID',
  `count_status` tinyint(1) NOT NULL COMMENT '注单状态:0,未结算;1,已结算;3,已注销;4,已恢复;5,已撤销结算;6,已二次结算;',
  `order_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `order_number_idx` (`order_number`) USING BTREE,
  KEY `userid_idx` (`userid`) USING BTREE,
  KEY `bet_time_idx` (`bet_time`) USING BTREE,
  KEY `gameinfo_idx` (`game_code`,`type_code`,`happy8`) USING BTREE,
  KEY `round_idx` (`round`) USING BTREE,
  KEY `count_status_idx` (`count_status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='彩票注单表';

-- ----------------------------
-- Records of web_lottery_bill_history
-- ----------------------------

-- ----------------------------
-- Table structure for web_lottery_sum
-- ----------------------------
DROP TABLE IF EXISTS `web_lottery_sum`;
CREATE TABLE `web_lottery_sum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agents_id` int(10) NOT NULL COMMENT '上级代理',
  `userid` int(10) NOT NULL,
  `nums` int(11) NOT NULL COMMENT '注单数',
  `date` date NOT NULL COMMENT '日期',
  `user_win` decimal(11,2) NOT NULL COMMENT '会员输赢',
  `bets_money` decimal(11,2) NOT NULL COMMENT '下注金额',
  `valid_money` decimal(11,2) NOT NULL COMMENT '有效金额',
  `server_admin` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '总代理',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `userid_idx` (`userid`,`date`) USING BTREE,
  KEY `server_admin_idx` (`server_admin`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='彩票注单汇总表';

-- ----------------------------
-- Records of web_lottery_sum
-- ----------------------------

-- ----------------------------
-- Table structure for web_match_crown_bk
-- ----------------------------
DROP TABLE IF EXISTS `web_match_crown_bk`;
CREATE TABLE `web_match_crown_bk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL COMMENT '赛事ID',
  `m_start` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '赛事开始时间',
  `mb_team` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mb_team_tw` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mb_team_en` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `m_league` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `m_league_tw` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `m_league_en` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `m_item` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `m_item_tw` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `m_item_en` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `m_rate` double NOT NULL,
  `gid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mcount` int(5) NOT NULL,
  `mshow` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `win` tinyint(1) NOT NULL DEFAULT '0',
  `mshow2` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `uptime` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `score` tinyint(1) NOT NULL DEFAULT '0',
  `cancel` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `m_start_idx` (`m_start`) USING BTREE,
  KEY `mid_idx` (`mid`,`gid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='蓝球冠军表';

-- ----------------------------
-- Records of web_match_crown_bk
-- ----------------------------

-- ----------------------------
-- Table structure for web_match_crown_ft
-- ----------------------------
DROP TABLE IF EXISTS `web_match_crown_ft`;
CREATE TABLE `web_match_crown_ft` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL COMMENT '赛事ID',
  `m_start` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '赛事开始时间',
  `mb_team` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mb_team_tw` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mb_team_en` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `m_league` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `m_league_tw` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `m_league_en` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `m_item` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `m_item_tw` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `m_item_en` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `m_rate` double NOT NULL,
  `gid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mcount` int(5) NOT NULL,
  `mshow` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `win` tinyint(1) NOT NULL DEFAULT '0',
  `mshow2` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `uptime` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `score` tinyint(1) NOT NULL DEFAULT '0',
  `cancel` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `m_start_idx` (`m_start`) USING BTREE,
  KEY `mid_idx` (`mid`,`gid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='足球冠军表';

-- ----------------------------
-- Records of web_match_crown_ft
-- ----------------------------

-- ----------------------------
-- Table structure for web_match_league
-- ----------------------------
DROP TABLE IF EXISTS `web_match_league`;
CREATE TABLE `web_match_league` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `m_league` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `m_league_tw` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `m_league_en` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `r` int(5) NOT NULL DEFAULT '15000' COMMENT '让球',
  `ou` int(5) NOT NULL DEFAULT '15000' COMMENT '大小',
  `m` int(5) NOT NULL DEFAULT '12000',
  `eo` int(5) NOT NULL DEFAULT '8000',
  `vr` int(5) NOT NULL DEFAULT '12000',
  `vou` int(5) NOT NULL DEFAULT '10000',
  `vm` int(4) NOT NULL DEFAULT '5000',
  `rb` int(5) NOT NULL DEFAULT '20000' COMMENT '滚球让球',
  `rou` int(5) NOT NULL DEFAULT '16000' COMMENT '滚球大小球',
  `rm` int(5) NOT NULL DEFAULT '10000',
  `vrb` int(5) NOT NULL DEFAULT '15000' COMMENT '上半滚球让球',
  `vrou` int(5) NOT NULL DEFAULT '13000' COMMENT '上半滚球大小球',
  `vrm` int(4) NOT NULL DEFAULT '8000',
  `pd` int(4) NOT NULL DEFAULT '5000',
  `t` int(4) NOT NULL DEFAULT '6000',
  `f` int(4) NOT NULL DEFAULT '7000',
  `cs` int(4) NOT NULL DEFAULT '3000' COMMENT '特殊类',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `m_league_idx` (`m_league`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='联盟单注下注限制';

-- ----------------------------
-- Records of web_match_league
-- ----------------------------

-- ----------------------------
-- Table structure for web_match_sports_video
-- ----------------------------
DROP TABLE IF EXISTS `web_match_sports_video`;
CREATE TABLE `web_match_sports_video` (
  `vmid` int(7) NOT NULL,
  `vm_date` date NOT NULL,
  `mpid` int(7) NOT NULL,
  UNIQUE KEY `vmid_idx` (`vmid`,`vm_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='直播模拟图';

-- ----------------------------
-- Records of web_match_sports_video
-- ----------------------------

-- ----------------------------
-- Table structure for web_member_bank
-- ----------------------------
DROP TABLE IF EXISTS `web_member_bank`;
CREATE TABLE `web_member_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL COMMENT '会员或代理ID',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-会员1-代理',
  `bank` tinyint(2) NOT NULL COMMENT '银行编号，对应web_bank_name',
  `bank_address` char(172) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '加密的银行地址',
  `bank_account` char(172) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '加密的银行卡号',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-启用1-伪删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='加密银行资料表';

-- ----------------------------
-- Records of web_member_bank
-- ----------------------------
INSERT INTO `web_member_bank` VALUES ('1', '1033', '0', '1', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '1');
INSERT INTO `web_member_bank` VALUES ('2', '1033', '0', '1', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('3', '1033', '0', '1', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('4', '1046', '0', '1', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('5', '1057', '0', '4', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '1');
INSERT INTO `web_member_bank` VALUES ('6', '1057', '0', '1', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '1');
INSERT INTO `web_member_bank` VALUES ('7', '1062', '0', '8', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('8', '1057', '0', '2', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '1');
INSERT INTO `web_member_bank` VALUES ('9', '1046', '0', '1', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('10', '1046', '0', '5', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('11', '1046', '0', '12', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('12', '1046', '0', '13', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('13', '1046', '0', '18', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('14', '1057', '0', '15', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('15', '1046', '0', '18', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('20', '1062', '0', '24', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('22', '1063', '0', '3', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('23', '1057', '0', '23', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '1');
INSERT INTO `web_member_bank` VALUES ('24', '1057', '0', '22', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('25', '1057', '0', '24', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('26', '1057', '0', '7', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '1');
INSERT INTO `web_member_bank` VALUES ('27', '1057', '0', '2', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('28', '1065', '0', '3', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('29', '1065', '0', '2', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '1');
INSERT INTO `web_member_bank` VALUES ('30', '1065', '0', '1', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '1');
INSERT INTO `web_member_bank` VALUES ('31', '1057', '0', '2', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('32', '1057', '0', '2', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('33', '1065', '0', '22', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('34', '1065', '0', '23', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('35', '1065', '0', '3', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('36', '1065', '0', '2', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('38', '1071', '0', '4', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '1');
INSERT INTO `web_member_bank` VALUES ('39', '1071', '0', '4', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '1');
INSERT INTO `web_member_bank` VALUES ('40', '1071', '0', '17', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('44', '1053', '0', '7', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('62', '1068', '0', '4', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('63', '1068', '0', '13', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('66', '1078', '0', '5', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('68', '1079', '0', '11', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('74', '1081', '0', '9', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('77', '1080', '0', '5', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('78', '1058', '0', '14', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('80', '1058', '0', '24', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('81', '1116', '0', '1', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('82', '1116', '0', '5', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('83', '1116', '0', '14', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('84', '1116', '0', '13', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('154', '1068', '0', '14', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('155', '1063', '0', '8', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('157', '1063', '0', '23', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('158', '1063', '0', '22', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');
INSERT INTO `web_member_bank` VALUES ('160', '1259', '0', '4', 'GI/+q+9iPri0PV5BEtA/u/bYzv/sHPTPAf9LI4SW2ccccmBvYW0D1rGqwWFuIO0drYLTbQXGoHzadkyfT2MT29ls4yrcgftLjrCNol6y3HZ8j974I8hGCZvNSP/JwbF7g8WNq/v3+cLg/jdm03t73tJw719kAA+67l+f7wdn+lI=', 'HfhqIqebIPzbN6H2KrWZoRcbSuD5YWHfZ8TZ2PUj9vr3xjetfVXxXQBYoE7FYkePgOW/DtOjoDyC3B8HgfyIL0Lgs9R22dXEjpN6tUIryi0/45c+v4XNvZ71MWmp3Hx3IRe6d4FBPTBDxnQxC3LB5VZoRnDj2vaq1idtlYe9OtE=', '0');

-- ----------------------------
-- Table structure for web_member_bk_config
-- ----------------------------
DROP TABLE IF EXISTS `web_member_bk_config`;
CREATE TABLE `web_member_bk_config` (
  `userid` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-会员1-代理',
  `server_admin` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bk_re_ftht_min` int(7) NOT NULL DEFAULT '500000' COMMENT '滚球全场独赢最小',
  `bk_re_ftht_max` int(7) NOT NULL DEFAULT '500000' COMMENT '滚球全场独赢最大',
  `bk_re_ah_min` int(6) NOT NULL DEFAULT '500000' COMMENT '滚球全场让球最小',
  `bk_re_ah_max` int(6) NOT NULL DEFAULT '500000' COMMENT '滚球全场让球最大',
  `bk_re_ou_min` int(6) NOT NULL DEFAULT '500000' COMMENT '滚球全场大小单场',
  `bk_re_ou_max` int(6) NOT NULL DEFAULT '500000' COMMENT '滚球全场大小单场',
  `bk_re_big_min` int(6) NOT NULL DEFAULT '500000' COMMENT '滚球球队得分大',
  `bk_re_big_max` int(6) NOT NULL DEFAULT '500000' COMMENT '滚球球队得分大',
  `bk_re_small_min` int(6) NOT NULL DEFAULT '500000' COMMENT '滚球球队得分小',
  `bk_re_small_max` int(6) NOT NULL DEFAULT '500000' COMMENT '滚球球队得分小',
  `bk_rb_ftht_min` int(6) NOT NULL DEFAULT '500000' COMMENT '今日全场独赢最小',
  `bk_rb_ftht_max` int(6) NOT NULL DEFAULT '500000' COMMENT '今日全场独赢最大',
  `bk_rb_ah_min` int(6) NOT NULL DEFAULT '500000' COMMENT '今日全场让球最小',
  `bk_rb_ah_max` int(6) NOT NULL DEFAULT '500000' COMMENT '今日全场让球最大',
  `bk_rb_ou_min` int(6) NOT NULL COMMENT '今日全场大小单场',
  `bk_rb_ou_max` int(6) NOT NULL DEFAULT '500000' COMMENT '今日全场大小单场',
  `bk_rb_big_min` int(6) NOT NULL DEFAULT '500000' COMMENT '今日球队得分大',
  `bk_rb_big_max` int(6) NOT NULL DEFAULT '500000' COMMENT '今日球队得分大',
  `bk_rb_small_min` int(6) NOT NULL DEFAULT '500000' COMMENT '今日球队得分小',
  `bk_rb_small_max` int(6) NOT NULL DEFAULT '500000' COMMENT '今日球队得分小 大',
  `bk_r_ftht_min` int(6) NOT NULL DEFAULT '500000' COMMENT '早盘全场独赢最小',
  `bk_r_ftht_max` int(6) NOT NULL DEFAULT '500000' COMMENT '早盘全场独赢最大',
  `bk_r_ah_min` int(6) NOT NULL DEFAULT '500000' COMMENT '早盘全场让球最小',
  `bk_r_ah_max` int(6) NOT NULL DEFAULT '500000' COMMENT '早盘全场让球最大',
  `bk_r_ou_min` int(6) NOT NULL DEFAULT '500000' COMMENT '早盘全场大小单场',
  `bk_r_ou_max` int(6) NOT NULL DEFAULT '500000' COMMENT '早盘全场大小单场',
  `bk_r_big_min` int(6) NOT NULL DEFAULT '500000' COMMENT '早盘球队得分大',
  `bk_r_big_max` int(6) NOT NULL DEFAULT '500000' COMMENT '早盘球队得分大',
  `bk_r_small_min` int(6) NOT NULL DEFAULT '500000' COMMENT '早盘球队得分小',
  `bk_r_small_max` int(6) NOT NULL DEFAULT '500000' COMMENT '早盘球队得分小',
  `bk_or_min` int(7) NOT NULL DEFAULT '0' COMMENT '冠军小',
  `bk_or_max` int(7) NOT NULL COMMENT '冠军大',
  `bk_p3_min` int(7) NOT NULL DEFAULT '0' COMMENT '串场小',
  `bk_p3_max` int(7) NOT NULL DEFAULT '0' COMMENT '串场大',
  KEY `userid_idx` (`userid`,`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='篮球投注限额表\r\n';

-- ----------------------------
-- Records of web_member_bk_config
-- ----------------------------
INSERT INTO `web_member_bk_config` VALUES ('0', '1', '1', '20', '600000', '20', '600000', '20', '600000', '20', '600000', '20', '600000', '20', '600000', '20', '600000', '20', '600000', '20', '600000', '20', '600000', '20', '600000', '20', '600000', '20', '600000', '20', '600000', '20', '600000', '20', '500000', '30', '500000');
INSERT INTO `web_member_bk_config` VALUES ('0', '1', '2', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '500000');
INSERT INTO `web_member_bk_config` VALUES ('1263', '0', 'leapi', '20', '600000', '20', '600000', '20', '600000', '20', '600000', '20', '600000', '20', '600000', '20', '600000', '20', '600000', '20', '600000', '20', '600000', '20', '600000', '20', '600000', '20', '600000', '20', '600000', '20', '600000', '200', '500000', '30', '500000');
INSERT INTO `web_member_bk_config` VALUES ('1262', '0', 'leapi', '20', '600000', '20', '600000', '20', '600000', '20', '600000', '20', '600000', '100', '600000', '150', '600000', '20', '600000', '20', '600000', '20', '600000', '20', '600000', '20', '600000', '20', '600000', '20', '600000', '20', '600000', '20', '500000', '30', '500000');

-- ----------------------------
-- Table structure for web_member_data
-- ----------------------------
DROP TABLE IF EXISTS `web_member_data`;
CREATE TABLE `web_member_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '会员余额',
  `money2` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '额度修复临时额度',
  `agents_id` int(6) NOT NULL COMMENT '上级代理ID',
  `ctime` int(5) NOT NULL DEFAULT '0' COMMENT '累计存款次数',
  `cmoney` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '累计存款金额',
  `ttime` int(5) NOT NULL DEFAULT '0' COMMENT '累计提款次数',
  `tmoney` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '累计提款金额',
  `sum_bet` bigint(20) NOT NULL DEFAULT '0' COMMENT '累计打码',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登陆密码',
  `level_id` int(11) NOT NULL DEFAULT '0' COMMENT '支付分层',
  `notes_withdrawal` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '出款备注',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-正常1-冻结2-伪删除',
  `server_admin` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '总代理',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username_idx` (`username`,`server_admin`) USING BTREE,
  KEY `agents_id_idx` (`agents_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1264 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员主表';

-- ----------------------------
-- Records of web_member_data
-- ----------------------------
INSERT INTO `web_member_data` VALUES ('1030', 'v7test', '2499947.00', '0.00', '1', '7', '77.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1031', 'hugo2223211', '1000.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '6fa91e9796513ee506f778dc5af1fa54', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1032', 'hugo11', '13.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '6fa91e9796513ee506f778dc5af1fa54', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1033', 'hugo111', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '6fa91e9796513ee506f778dc5af1fa54', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1034', 'hugo1111', '11.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '6fa91e9796513ee506f778dc5af1fa54', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1035', 'hulkios', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '200820e3227815ed1756a6b531e7e0d2', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1036', 'iostets', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '1', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1037', 'iostets2', '100000.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1038', 'iostets3', '100000.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1039', 'aaa12334', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', 'd9f6e636e369552839e7bb8057aeb8da', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1040', 'aaa1233', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', 'd9f6e636e369552839e7bb8057aeb8da', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1041', 'aaa1234', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', 'd9f6e636e369552839e7bb8057aeb8da', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1042', 'aaa123', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', 'd9f6e636e369552839e7bb8057aeb8da', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1043', 'hugo11111', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '6fa91e9796513ee506f778dc5af1fa54', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1044', 'iostets4', '99929.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1045', 'iostets5', '100000.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1046', '111111', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '96e79218965eb72c92a549dd5a330112', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1047', '222222', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '7fa8282ad93047a4d6fe6111c93b308a', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1048', '333333', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '074fd28eff0f5adea071694061739e55', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1049', '444444', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '73882ab1fa529d7273da0db6b49cc4f3', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1050', '555555', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5b1b68a9abf4d2cd155c81a9225fd158', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1051', '111222', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '00b7691d86d96aebd21dd9e138f90840', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1052', '11111122', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '96e79218965eb72c92a549dd5a330112', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1053', '1111111', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '96e79218965eb72c92a549dd5a330112', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1054', '2222222', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '79d886010186eb60e3611cd4a5d0bcae', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1055', '3333334', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '1a100d2c0dab19c4430e7d73762b3423', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1056', 'chin001', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1057', 'blessma', '87997.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '200820e3227815ed1756a6b531e7e0d2', '1', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1058', 'chin002', '83954.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '1', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1059', 'blesscat', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '8255c75218888f0e704184188ae637c4', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1061', 'hulk1111', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '200820e3227815ed1756a6b531e7e0d2', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1062', '1111112', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '96e79218965eb72c92a549dd5a330112', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1063', 'owen111', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '96e79218965eb72c92a549dd5a330112', '1', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1064', 'owentest', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '343b1c4a3ea721b2d640fc8700db0f36', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1065', 'owenqqq', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1066', 'chin003', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1067', 'chin004', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1068', 'iosTest', '86687.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '1', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1069', 'blessma01', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '200820e3227815ed1756a6b531e7e0d2', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1070', 'blessma02', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '200820e3227815ed1756a6b531e7e0d2', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1071', 'hulk123', '99520.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5d93ceb70e2bf5daa84ec3d0cd2c731a', '1', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1072', 'chin005', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1073', 'hulk222', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '200820e3227815ed1756a6b531e7e0d2', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1074', '3weewqqee', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5d93ceb70e2bf5daa84ec3d0cd2c731a', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1075', 'wilson', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '1c63129ae9db9c60c3e8aa94d3e00495', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1076', 'a123456', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '670b14728ad9902aecba32e22fa4f6bd', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1077', 'xiaoxuan0022', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1078', 'a111111', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '96e79218965eb72c92a549dd5a330112', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1079', 'a222222', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '1a100d2c0dab19c4430e7d73762b3423', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1080', 'a333333', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', 'e3ceb5881a0a1fdaad01296d7554868d', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1081', 'a444444', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '96e79218965eb72c92a549dd5a330112', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1082', '123456', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', 'efb541a19df0e51e6f75d018b4db24a2', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1083', 'aaaa11', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '96e79218965eb72c92a549dd5a330112', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1084', 'aa12aa11', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '96e79218965eb72c92a549dd5a330112', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1085', 'aa31a11', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '96e79218965eb72c92a549dd5a330112', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1086', 'a44444', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '96e79218965eb72c92a549dd5a330112', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1087', 'a412444', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '96e79218965eb72c92a549dd5a330112', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1088', 'a433334', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '96e79218965eb72c92a549dd5a330112', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1089', 'a777777', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '96e79218965eb72c92a549dd5a330112', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1090', 'a888888', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '96e79218965eb72c92a549dd5a330112', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1091', 'a433214', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '96e79218965eb72c92a549dd5a330112', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1092', '3333111', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '96e79218965eb72c92a549dd5a330112', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1093', '000088', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '96e79218965eb72c92a549dd5a330112', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1094', '0001088', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '96e79218965eb72c92a549dd5a330112', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1095', 'chin006', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1096', 'asddsa', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', 'fcea920f7412b5da7be0cf42b8c93759', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1097', '99qq99', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', 'fcea920f7412b5da7be0cf42b8c93759', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1098', '9119qq99', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', 'fcea920f7412b5da7be0cf42b8c93759', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1099', 'hbyvgvyv', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', 'fad9527a3f157b64e306282ba816df36', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1101', 'androidtx01', '36000.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '1', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1102', 'h0v0yv', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', 'fad9527a3f157b64e306282ba816df36', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1103', 'androidtx02', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1104', 'androidtx03', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1105', 'androidtx04', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1106', 'can1560', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1107', 'can1561', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1108', 'can1562', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1109', 'can1563', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1110', 'can1564', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1111', 'can1566', '10000.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1112', 'can1567', '999999.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '1', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1113', 'a999999', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '96e79218965eb72c92a549dd5a330112', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1114', 'can1568', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1115', 'can1569', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1116', 'can1570', '89300.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '1', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1117', 'androidtx009', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1118', 'androidtx0091', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1122', 'androidttt', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1123', 'androi321t', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1124', 'androizz', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1125', 'andro333', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1126', 'andr3213', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1127', 'andrtx01', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', 'ac3016961bc81c30d76ac74d9d0391f3', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1128', 'android1111', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '0263bcf70efc6b086280efe4c8d5bf2e', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1129', 'android9999', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '0263bcf70efc6b086280efe4c8d5bf2e', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1130', 'android99o', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '0263bcf70efc6b086280efe4c8d5bf2e', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1131', 'aaa0009', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '0e16ffd2fbb1d47ddee85c3b0c2fd149', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1132', 'andrtt98', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '9a330422ce65b39d045f04f607acad86', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1133', 'tiger001', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1134', 'A1234567', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1135', 'androidtx024', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1136', 'androidtx32', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1137', 'qqq111', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', 'a20fbf085c304d583dfbff37147a94ac', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1138', 'androidtx067', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '34f85ca80ec353d3052b8a2d3973a0c5', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1139', 'androidtx778', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '6f98265e0e0de79bb073651ca30fca1a', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1140', 'androidtx55', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1141', 'androidtx99', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1142', 'androidtx76', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1143', 'andtx111', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1144', 'androidtx44', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1145', 'androidtx61', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '1', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1146', 'qazxsw', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '931bd0e1cc9baae10e9ff6ca7002e834', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1147', 'androidtx38', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', 'd9b9aeb6269985a8a8c3a1ae13bb9cde', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1148', 'androidtx5566', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1149', 'androidtx33', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1150', 'androidtx18', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1151', 'androidtx531', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1152', 'androidtx34', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1153', 'androidtx774', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1154', 'androidtx86', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1155', 'androidtx49', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1156', 'androidtx25', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1157', 'androidtx69', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '1d134dc34526dafda32075ae6f85d3af', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1158', 'androidtx68', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '157ff0d404af9662826e9fa62a4fd595', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1159', 'androidtx65', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1160', 'Androidtx', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1161', 'androidtx52', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1162', 'androidtx53', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1163', 'androidtx117', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1164', 'androidtx07', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1165', 'androidtx556', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '34f85ca80ec353d3052b8a2d3973a0c5', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1166', 'androidtx91', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1167', 'tiger123', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '824a67f29e97b8798a9df7f00189f3e1', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1168', 'qazwe11', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', 'ac9ab77890da016673c36264f638cdc2', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1169', 'tiger226', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '60923c59be8cb958d6aa401f4d21fd49', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1170', 'qwerty5566', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1171', 'foo123', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1172', 'vrvrvtyg', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '8edbf46521a91fd1849e907ffabfa257', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1173', 'cecc554', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1174', 'qwerty123', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '931bd0e1cc9baae10e9ff6ca7002e834', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1175', 'qwert111', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '1', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1176', 'qwerty88', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1177', 'qwert123', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '1', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1178', 'qwert1mm', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1179', 'qqwert117', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '0e16ffd2fbb1d47ddee85c3b0c2fd149', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1180', 'qwerty199', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1181', 'qwerty177', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1182', 'qwerty6268', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1183', 'qwerty117', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1184', 'qwerty5643', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1185', 'qwerty111', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1186', 'qwerty123j', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1187', 'ttfg253', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '0e16ffd2fbb1d47ddee85c3b0c2fd149', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1188', 'qwerty12321', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '332d2e63006f7d505b58977d5acbfb7f', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1189', 'ggrrwq', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1190', 'qwerty1239', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1191', 'qwerty333', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '157ff0d404af9662826e9fa62a4fd595', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1192', 'qwerty012', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', 'd1101d84dcd6eabcf57fff8eab8a3ac3', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1193', 'qqqert123', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '3777a9e9ecf15c723daa8b78bebd07c6', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1194', 'androidtx111', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1195', 'androidtx147', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '8937047c53815f150774440b9174c9cc', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1196', 'qwerty1oop', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '236e49c943db625451941e645f342f9c', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1197', 'qwerty1lk', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1198', 'qwerty1ll', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1199', 'qwerty123tt', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1200', 'qqqqqqq', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1201', 'qqqqqqqq', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5d793fc5b00a2348c3fb9ab59e5ca98a', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1202', 'qwretu123', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '0e16ffd2fbb1d47ddee85c3b0c2fd149', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1203', 'sunny1', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '96e79218965eb72c92a549dd5a330112', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1204', 'sunny2', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '96e79218965eb72c92a549dd5a330112', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1205', 'sunny3', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '96e79218965eb72c92a549dd5a330112', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1206', 'qwerty147', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1207', 'qwerty1', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5cff88c0496f00aead562cfb8423d77e', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1208', 'qwerty1777', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1209', 'qwerxtyv', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1210', 'qwrchg', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '90b741e2757fad490396871cbfe37a5a', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1211', 'qwerty', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1212', 'qwertggg', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1213', 'qwertyuu', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1214', 'q555555', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '96e79218965eb72c92a549dd5a330112', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1215', 'qwertty77', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', 'ed98eadb99fc079ccaa8ccc925e7e5f8', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1216', 'Thuyrgggg', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1217', 'HGTVTV', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1218', 'allallsmall', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1219', '123456123456', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', 'e10adc3949ba59abbe56e057f20f883e', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1220', '123456789', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', 'e10adc3949ba59abbe56e057f20f883e', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1222', '111111112', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '96e79218965eb72c92a549dd5a330112', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1223', 'qwettzzz', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1224', 'qwerty12300', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1225', 'qwerty159', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1226', 'qqq123', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '931bd0e1cc9baae10e9ff6ca7002e834', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1227', 'qwerty123jl', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1228', 'qwerty145', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1229', 'qwerty147m', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '332d2e63006f7d505b58977d5acbfb7f', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1230', 'qwerty15mmm', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1231', 'qweasd', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1232', 'qwerty123kkm', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1233', 'qwetsgxxy', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1234', 'qwerty123fgh', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1235', 'okhhhh', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '931bd0e1cc9baae10e9ff6ca7002e834', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1236', 'qwertasd', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '47aad227c1009acb2244398a7e6f58cb', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1237', 'willwipe', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1238', 'qwerty1458', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1239', 'qwertyzzz', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '9dad7dce437f6108b0fe48cee735490e', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1240', 'qwerty999', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1242', 'a12345678', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', 'e9bc0e13a8a16cbb07b175d92a113126', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1243', 'a12345678910', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', 'd8aef083b975fa612649470de94c6d92', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1244', 'b12345689', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', 'cd29c92ecb7a6849dcc3c81e52d9f629', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1245', 'a12345678911', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '46cfc40c76361dd12d801662c7a0c7c5', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1246', 'a123456789101', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', 'f13b91dcc726eafe9bbb68bbe7be9a6e', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1247', 'c123456789', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', 'eee113d44755c9a48ad47465b4d2da51', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1248', 'n123456789', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '809f09f73d5a61070477b1d676155e25', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1249', 'blessma100', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '200820e3227815ed1756a6b531e7e0d2', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1250', '12345678910000', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', 'e10adc3949ba59abbe56e057f20f883e', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1251', 'a1234567891111', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '16c3a3070156f7d953bdac7d75da3b2c', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1252', 'a11111222', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '71e7b8b17630fe827ad001d3c7c616e9', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1253', 'asdf21313', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '864471f1af1474cad98f7eb65a328d47', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1254', 'qqqqqqqf', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '6846860684f05029abccc09a53cd66f1', '1', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1255', 'androidtx66', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '1', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1256', 'qwerty66', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '1', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1257', 'uggcgh', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', 'afaa827b182beee3dbc307225f9f7d8a', '1', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1258', 'qqqRyuffghi', '100.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '1', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1259', 'cltwn1n1', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', 'f63c24b0a8309868ad79993efb0af6a6', '1', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1260', 'danceinfly0223', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', 'f40b5090a64e9103b5794f00a39f089e', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1261', 'hulk111', '0.00', '0.00', '1', '0', '0.00', '0', '0.00', '0', '5abd06d6f6ef0e022e11b8a41f57ebda', '0', '0', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1262', 'stamp66', '5000.23', '0.00', '9', '0', '0.00', '0', '0.00', '0', '30231B277B7F621C4A11E1A8AE2A625C', '0', '测试出款', '0', 'leapi');
INSERT INTO `web_member_data` VALUES ('1263', 'test55', '555.23', '0.00', '9', '0', '0.00', '0', '0.00', '0', '30231B277B7F621C4A11E1A8AE2A625C', '0', '0', '0', 'leapi');

-- ----------------------------
-- Table structure for web_member_data_lock
-- ----------------------------
DROP TABLE IF EXISTS `web_member_data_lock`;
CREATE TABLE `web_member_data_lock` (
  `mem_id` int(11) NOT NULL,
  `ft` tinyint(1) NOT NULL,
  `bk` tinyint(1) NOT NULL,
  `tn` tinyint(1) NOT NULL,
  `vb` tinyint(1) NOT NULL,
  `bs` tinyint(1) NOT NULL,
  `op` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='限制玩法表';

-- ----------------------------
-- Records of web_member_data_lock
-- ----------------------------

-- ----------------------------
-- Table structure for web_member_ft_config
-- ----------------------------
DROP TABLE IF EXISTS `web_member_ft_config`;
CREATE TABLE `web_member_ft_config` (
  `userid` int(11) NOT NULL COMMENT '关联主表ID',
  `type` tinyint(1) NOT NULL COMMENT '0-会员1-代理',
  `server_admin` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'server_admin',
  `ft_re_ftht_min` int(7) NOT NULL DEFAULT '0' COMMENT '足球滚球全场独赢最小',
  `ft_re_ftht_max` int(7) NOT NULL DEFAULT '0' COMMENT '足球滚球全场独赢最大',
  `ft_re_fthtlst_min` int(7) NOT NULL DEFAULT '0' COMMENT '足球滚球半场独赢最小',
  `ft_re_fthtlst_max` int(7) NOT NULL DEFAULT '0' COMMENT '足球滚球半场独赢最大',
  `ft_re_ah_min` int(7) NOT NULL DEFAULT '0' COMMENT '足球滚球全场让球最小',
  `ft_re_ah_max` int(7) NOT NULL DEFAULT '0' COMMENT '足球滚球全场让球最大',
  `ft_re_ahlst_min` int(7) NOT NULL DEFAULT '500000' COMMENT '足球滚球半场让球独赢最小',
  `ft_re_ahlst_max` int(7) NOT NULL DEFAULT '0' COMMENT '足球滚球半场让球最大',
  `ft_re_ou_min` int(7) NOT NULL DEFAULT '0' COMMENT '足球滚球全场大小单场',
  `ft_re_ou_max` int(7) NOT NULL DEFAULT '500000' COMMENT '足球滚球全场大小单场',
  `ft_re_oulst_min` int(7) NOT NULL DEFAULT '500000' COMMENT '足球滚球半场大小单场',
  `ft_re_oulst_max` int(7) NOT NULL DEFAULT '500000' COMMENT '足球滚球半场大小单场',
  `ft_rb_ftht_min` int(7) NOT NULL DEFAULT '500000' COMMENT '足球今日全场独赢最小',
  `ft_rb_ftht_max` int(7) NOT NULL DEFAULT '500000' COMMENT '足球今日全场独赢最大',
  `ft_rb_fthtlst_min` int(7) NOT NULL DEFAULT '500000' COMMENT '足球今日半场独赢最小',
  `ft_rb_fthtlst_max` int(7) NOT NULL DEFAULT '500000' COMMENT '足球今日半场独赢最大',
  `ft_rb_ah_min` int(7) NOT NULL DEFAULT '500000' COMMENT '足球今日全场让球最小',
  `ft_rb_ah_max` int(7) NOT NULL DEFAULT '500000' COMMENT '足球今日全场让球最大',
  `ft_rb_ahlst_min` int(7) NOT NULL DEFAULT '500000' COMMENT '足球今日半场让球独赢最小',
  `ft_rb_ahlst_max` int(7) NOT NULL DEFAULT '500000' COMMENT '足球今日半场让球最大',
  `ft_rb_ou_min` int(7) NOT NULL DEFAULT '500000' COMMENT '足球今日全场大小小',
  `ft_rb_ou_max` int(7) NOT NULL DEFAULT '500000' COMMENT '足球今日全场大小大',
  `ft_rb_oulst_min` int(7) NOT NULL DEFAULT '500000' COMMENT '足球今日半场大小小',
  `ft_rb_oulst_max` int(7) NOT NULL DEFAULT '500000' COMMENT '足球今日半场大小大',
  `ft_rb_oe_min` int(7) NOT NULL DEFAULT '500000' COMMENT '足球今日全场单双小',
  `ft_rb_oe_max` int(7) NOT NULL DEFAULT '500000' COMMENT '足球今日全场单双大',
  `ft_rb_oelst_min` int(7) NOT NULL DEFAULT '500000' COMMENT '足球今日半场单双小',
  `ft_rb_oelst_max` int(7) NOT NULL DEFAULT '500000' COMMENT '足球今日半场单双大',
  `ft_rb_cs_min` int(7) NOT NULL DEFAULT '500000' COMMENT '足球今日波胆小',
  `ft_rb_cs_max` int(7) NOT NULL DEFAULT '500000' COMMENT '足球今日波胆大',
  `ft_rb_tg_min` int(7) NOT NULL DEFAULT '500000' COMMENT '足球今日全场总入球小',
  `ft_rb_tg_max` int(7) NOT NULL DEFAULT '500000' COMMENT '足球今日全场总入球大',
  `ft_rb_tglst_min` int(7) NOT NULL DEFAULT '500000' COMMENT '足球今日半场总入球小',
  `ft_rb_tglst_max` int(7) NOT NULL DEFAULT '0' COMMENT '足球今日半场总入球大',
  `ft_rb_hf_min` int(7) NOT NULL DEFAULT '0' COMMENT '足球今日半场全场小',
  `ft_rb_hf_max` int(7) NOT NULL DEFAULT '0' COMMENT '足球今日半场全场大',
  `ft_rb_fglg_min` int(7) NOT NULL DEFAULT '0' COMMENT '足球今日最先最后进球小',
  `ft_rb_fglg_max` int(7) NOT NULL DEFAULT '0' COMMENT '足球今日最先最后进球大',
  `ft_r_ftht_min` int(7) NOT NULL DEFAULT '0' COMMENT '足球滚球全场独赢最小',
  `ft_r_ftht_max` int(7) NOT NULL DEFAULT '0' COMMENT '足球滚球全场独赢最大',
  `ft_r_fthtlst_min` int(7) NOT NULL DEFAULT '0' COMMENT '足球滚球半场独赢最小',
  `ft_r_fthtlst_max` int(7) NOT NULL DEFAULT '0' COMMENT '足球滚球半场独赢最大',
  `ft_r_ah_min` int(7) NOT NULL DEFAULT '0' COMMENT '足球早盘全场让球最小',
  `ft_r_ah_max` int(7) NOT NULL DEFAULT '0' COMMENT '足球早盘全场让球最大',
  `ft_r_ahlst_min` int(7) NOT NULL DEFAULT '0' COMMENT '足球早盘半场让球最小',
  `ft_r_ahlst_max` int(7) NOT NULL DEFAULT '0' COMMENT '足球早盘半场让球最大',
  `ft_r_ou_min` int(7) NOT NULL DEFAULT '0' COMMENT '足球早盘全场大小小',
  `ft_r_ou_max` int(7) NOT NULL DEFAULT '0' COMMENT '足球早盘全场大小大',
  `ft_r_oulst_min` int(7) NOT NULL DEFAULT '0' COMMENT '足球早盘半场大小小',
  `ft_r_oulst_max` int(7) NOT NULL DEFAULT '0' COMMENT '足球早盘半场大小大\n',
  `ft_r_oe_min` int(7) NOT NULL DEFAULT '0' COMMENT '足球早盘全场单双小\n',
  `ft_r_oe_max` int(7) NOT NULL DEFAULT '0' COMMENT '足球早盘全场单双大\n\n足球早盘全场单双大\n',
  `ft_r_oelst_min` int(7) NOT NULL DEFAULT '0' COMMENT '足球早盘半场单双小',
  `ft_r_oelst_max` int(7) NOT NULL DEFAULT '0' COMMENT '足球早盘半场单双大',
  `ft_r_cs_min` int(7) NOT NULL DEFAULT '0' COMMENT '足球早盘波胆小',
  `ft_r_cs_max` int(7) NOT NULL DEFAULT '0' COMMENT '足球早盘波胆大',
  `ft_r_tg_min` int(7) NOT NULL DEFAULT '0' COMMENT '足球早盘全场总入球小',
  `ft_r_tg_max` int(7) NOT NULL DEFAULT '0' COMMENT '足球早盘全场总入球大',
  `ft_r_tglst_min` int(7) NOT NULL DEFAULT '0' COMMENT '足球早盘半场总入球小',
  `ft_r_tglst_max` int(7) NOT NULL DEFAULT '0' COMMENT '足球早盘半场总入球大',
  `ft_r_hf_min` int(7) NOT NULL DEFAULT '0' COMMENT '足球早盘半场全场小',
  `ft_r_hf_max` int(7) NOT NULL DEFAULT '0' COMMENT '足球早盘半场全场大',
  `ft_r_fglg_min` int(7) NOT NULL DEFAULT '0' COMMENT '足球早盘最先最后进球小',
  `ft_r_fglg_max` int(7) NOT NULL DEFAULT '0' COMMENT '足球早盘最先最后进球大',
  `ft_or_min` int(7) NOT NULL DEFAULT '0' COMMENT '足球冠军小\n足球冠军小\n',
  `ft_or_max` int(7) NOT NULL DEFAULT '0' COMMENT '足球冠军大',
  `ft_p3_min` int(7) NOT NULL DEFAULT '0' COMMENT '足球串场小',
  `ft_p3_max` int(7) NOT NULL DEFAULT '0' COMMENT '足球串场大'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='足球投注限额表';

-- ----------------------------
-- Records of web_member_ft_config
-- ----------------------------
INSERT INTO `web_member_ft_config` VALUES ('1', '1', '2', '10', '50000', '10', '50000', '10', '50000', '10', '50000', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '500000', '10', '1000000', '50', '1000000');
INSERT INTO `web_member_ft_config` VALUES ('0', '1', '1', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '50', '60000');
INSERT INTO `web_member_ft_config` VALUES ('1263', '0', 'leapi', '600', '60000', '100', '60000', '200', '60000', '300', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '20', '60000', '50', '60000');

-- ----------------------------
-- Table structure for web_member_info
-- ----------------------------
DROP TABLE IF EXISTS `web_member_info`;
CREATE TABLE `web_member_info` (
  `userid` int(11) NOT NULL COMMENT '对应会员主表ID',
  `add_date` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '注册时间',
  `birthday` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT 'Brithday',
  `withdrawal_passwd` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '提款密码',
  `notes` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '会员备注',
  `agopen` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-未开通AG1-开通AG',
  `cpopen` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-彩票未开通1-彩票已开通',
  `mgopen` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-MG未开通1-MG已开通',
  `alias` char(173) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '加密的姓名',
  `test_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-正式会员1-测试会员 2-试玩会员',
  `reg_ip` varchar(50) NOT NULL COMMENT '注册ip',
  `bank_id` int(10) DEFAULT NULL COMMENT '默认银行卡ID',
  `vip_level` int(11) NOT NULL DEFAULT '0' COMMENT 'VIP等级',
  `question` tinyint(1) NOT NULL COMMENT '密保问题，关联web_question_data',
  `answer` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密保问题答案',
  `collection` json DEFAULT NULL COMMENT '收藏赛事',
  `message_time` timestamp NULL DEFAULT '1970-01-01 12:00:00' COMMENT '最新一次获取站内信的时间',
  `his_loss` bigint(20) NOT NULL DEFAULT '0' COMMENT '历史盈亏',
  `his_bets` bigint(20) NOT NULL DEFAULT '0' COMMENT '历史打码',
  `limit_bk` tinyint(1) NOT NULL DEFAULT '0' COMMENT '限制篮球下注 0不限制 1限制第三节第四节',
  `limit_ft` tinyint(1) NOT NULL DEFAULT '0' COMMENT '限制足球下注 0不限制 1限制',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员副表';

-- ----------------------------
-- Records of web_member_info
-- ----------------------------
INSERT INTO `web_member_info` VALUES ('1262', '2019-05-19 14:49:49', '2019-5-18', 'A24AE3658A1E4EF1C0E80588FD638B1C', '备注', '1', '1', '0', '测试账号', '1', '0:0:0:0:0:0:0:1', '0', '0', '0', '0', null, '1970-01-01 12:00:00', '0', '0', '0', '1');
INSERT INTO `web_member_info` VALUES ('1263', '2019-05-19 14:49:29', '2019-5-10', '30231B277B7F621C4A11E1A8AE2A625C', '测试', '0', '0', '1', 'test899', '0', '0:0:0:0:0:0:0:1', '4', '0', '0', '0', null, '1970-01-01 12:00:00', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for web_member_level
-- ----------------------------
DROP TABLE IF EXISTS `web_member_level`;
CREATE TABLE `web_member_level` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sum_money` decimal(11,2) NOT NULL COMMENT '累计存款',
  `sum_bet` decimal(20,2) NOT NULL COMMENT '累计打码',
  `mem_level` tinyint(1) NOT NULL COMMENT '会员等级',
  `notes` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `server_admin` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '总代理',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `mem_level_idx` (`mem_level`,`server_admin`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of web_member_level
-- ----------------------------
INSERT INTO `web_member_level` VALUES ('1', '1000.01', '20000.00', '1', 'VIP1', 'leapi');
INSERT INTO `web_member_level` VALUES ('2', '5000.00', '50000.00', '2', 'VIP2', 'leapi');
INSERT INTO `web_member_level` VALUES ('3', '100000.00', '1000000.00', '3', 'VIP3', 'leapi');
INSERT INTO `web_member_level` VALUES ('4', '150000.00', '1500000.00', '4', 'VIP4', 'leapi');
INSERT INTO `web_member_level` VALUES ('5', '200000.00', '2000000.00', '5', 'VIP5', 'leapi');

-- ----------------------------
-- Table structure for web_message_info
-- ----------------------------
DROP TABLE IF EXISTS `web_message_info`;
CREATE TABLE `web_message_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `message_id` int(10) NOT NULL COMMENT '站内信ID',
  `userid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收件人ID,0为全部会员',
  `read_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已读,0-未读，1-已读',
  `del_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-正常1-删除,客户端删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=552 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='站内信副表';

-- ----------------------------
-- Records of web_message_info
-- ----------------------------
INSERT INTO `web_message_info` VALUES ('10', '12', '1061', '0', '0');
INSERT INTO `web_message_info` VALUES ('11', '12', '1062', '0', '0');
INSERT INTO `web_message_info` VALUES ('12', '12', '1065', '1', '0');
INSERT INTO `web_message_info` VALUES ('13', '12', '1068', '0', '0');
INSERT INTO `web_message_info` VALUES ('14', '13', '1061', '0', '0');
INSERT INTO `web_message_info` VALUES ('15', '13', '1062', '0', '0');
INSERT INTO `web_message_info` VALUES ('16', '13', '1065', '0', '0');
INSERT INTO `web_message_info` VALUES ('17', '13', '1068', '0', '0');
INSERT INTO `web_message_info` VALUES ('18', '14', '1060', '0', '0');
INSERT INTO `web_message_info` VALUES ('19', '14', '1061', '0', '0');
INSERT INTO `web_message_info` VALUES ('20', '15', '1032', '0', '0');
INSERT INTO `web_message_info` VALUES ('21', '15', '1033', '0', '0');
INSERT INTO `web_message_info` VALUES ('22', '15', '1034', '0', '0');
INSERT INTO `web_message_info` VALUES ('23', '15', '1035', '0', '0');
INSERT INTO `web_message_info` VALUES ('24', '15', '1036', '0', '0');
INSERT INTO `web_message_info` VALUES ('25', '15', '1037', '0', '0');
INSERT INTO `web_message_info` VALUES ('26', '15', '1038', '0', '0');
INSERT INTO `web_message_info` VALUES ('27', '15', '1039', '0', '0');
INSERT INTO `web_message_info` VALUES ('28', '15', '1040', '0', '0');
INSERT INTO `web_message_info` VALUES ('29', '15', '1041', '0', '0');
INSERT INTO `web_message_info` VALUES ('30', '15', '1042', '0', '0');
INSERT INTO `web_message_info` VALUES ('31', '15', '1043', '0', '0');
INSERT INTO `web_message_info` VALUES ('32', '15', '1044', '0', '0');
INSERT INTO `web_message_info` VALUES ('33', '15', '1045', '0', '0');
INSERT INTO `web_message_info` VALUES ('34', '15', '1047', '0', '0');
INSERT INTO `web_message_info` VALUES ('35', '15', '1048', '0', '0');
INSERT INTO `web_message_info` VALUES ('36', '15', '1049', '0', '0');
INSERT INTO `web_message_info` VALUES ('37', '15', '1050', '0', '0');
INSERT INTO `web_message_info` VALUES ('38', '15', '1051', '0', '0');
INSERT INTO `web_message_info` VALUES ('39', '15', '1052', '0', '0');
INSERT INTO `web_message_info` VALUES ('40', '15', '1053', '0', '0');
INSERT INTO `web_message_info` VALUES ('41', '15', '1054', '0', '0');
INSERT INTO `web_message_info` VALUES ('42', '15', '1055', '0', '0');
INSERT INTO `web_message_info` VALUES ('43', '15', '1056', '0', '0');
INSERT INTO `web_message_info` VALUES ('44', '15', '1057', '0', '0');
INSERT INTO `web_message_info` VALUES ('45', '15', '1058', '0', '0');
INSERT INTO `web_message_info` VALUES ('46', '15', '1059', '0', '0');
INSERT INTO `web_message_info` VALUES ('47', '15', '1061', '0', '0');
INSERT INTO `web_message_info` VALUES ('48', '15', '1062', '0', '0');
INSERT INTO `web_message_info` VALUES ('49', '15', '1063', '0', '0');
INSERT INTO `web_message_info` VALUES ('50', '15', '1065', '0', '0');
INSERT INTO `web_message_info` VALUES ('51', '15', '1066', '0', '0');
INSERT INTO `web_message_info` VALUES ('52', '15', '1067', '0', '0');
INSERT INTO `web_message_info` VALUES ('53', '15', '1068', '0', '0');
INSERT INTO `web_message_info` VALUES ('54', '15', '1069', '0', '0');
INSERT INTO `web_message_info` VALUES ('55', '15', '1070', '0', '0');
INSERT INTO `web_message_info` VALUES ('56', '15', '1071', '1', '1');
INSERT INTO `web_message_info` VALUES ('57', '15', '1072', '0', '0');
INSERT INTO `web_message_info` VALUES ('58', '15', '1073', '1', '0');
INSERT INTO `web_message_info` VALUES ('59', '15', '1074', '0', '0');
INSERT INTO `web_message_info` VALUES ('60', '15', '1075', '0', '0');
INSERT INTO `web_message_info` VALUES ('61', '15', '1076', '0', '0');
INSERT INTO `web_message_info` VALUES ('62', '15', '1077', '0', '0');
INSERT INTO `web_message_info` VALUES ('63', '15', '1078', '0', '0');
INSERT INTO `web_message_info` VALUES ('64', '15', '1079', '0', '0');
INSERT INTO `web_message_info` VALUES ('65', '15', '1080', '0', '0');
INSERT INTO `web_message_info` VALUES ('66', '15', '1082', '0', '0');
INSERT INTO `web_message_info` VALUES ('67', '15', '1083', '0', '0');
INSERT INTO `web_message_info` VALUES ('68', '15', '1084', '0', '0');
INSERT INTO `web_message_info` VALUES ('69', '15', '1085', '0', '0');
INSERT INTO `web_message_info` VALUES ('70', '15', '1086', '0', '0');
INSERT INTO `web_message_info` VALUES ('71', '15', '1087', '0', '0');
INSERT INTO `web_message_info` VALUES ('72', '15', '1088', '0', '0');
INSERT INTO `web_message_info` VALUES ('73', '15', '1089', '0', '0');
INSERT INTO `web_message_info` VALUES ('74', '15', '1090', '0', '0');
INSERT INTO `web_message_info` VALUES ('75', '15', '1091', '0', '0');
INSERT INTO `web_message_info` VALUES ('76', '15', '1092', '0', '0');
INSERT INTO `web_message_info` VALUES ('77', '15', '1093', '0', '0');
INSERT INTO `web_message_info` VALUES ('78', '15', '1094', '0', '0');
INSERT INTO `web_message_info` VALUES ('79', '15', '1095', '0', '0');
INSERT INTO `web_message_info` VALUES ('80', '15', '1096', '0', '0');
INSERT INTO `web_message_info` VALUES ('81', '15', '1097', '0', '0');
INSERT INTO `web_message_info` VALUES ('82', '15', '1098', '0', '0');
INSERT INTO `web_message_info` VALUES ('83', '15', '1099', '0', '0');
INSERT INTO `web_message_info` VALUES ('84', '15', '1101', '0', '0');
INSERT INTO `web_message_info` VALUES ('85', '15', '1102', '0', '0');
INSERT INTO `web_message_info` VALUES ('86', '15', '1103', '0', '0');
INSERT INTO `web_message_info` VALUES ('87', '15', '1104', '0', '0');
INSERT INTO `web_message_info` VALUES ('88', '15', '1105', '0', '0');
INSERT INTO `web_message_info` VALUES ('89', '15', '1106', '0', '0');
INSERT INTO `web_message_info` VALUES ('90', '15', '1107', '0', '0');
INSERT INTO `web_message_info` VALUES ('91', '15', '1108', '0', '0');
INSERT INTO `web_message_info` VALUES ('92', '15', '1109', '0', '0');
INSERT INTO `web_message_info` VALUES ('93', '15', '1110', '0', '0');
INSERT INTO `web_message_info` VALUES ('94', '15', '1111', '0', '0');
INSERT INTO `web_message_info` VALUES ('95', '15', '1112', '0', '0');
INSERT INTO `web_message_info` VALUES ('96', '15', '1113', '0', '0');
INSERT INTO `web_message_info` VALUES ('97', '15', '1114', '0', '0');
INSERT INTO `web_message_info` VALUES ('98', '15', '1115', '0', '0');
INSERT INTO `web_message_info` VALUES ('99', '15', '1116', '0', '0');
INSERT INTO `web_message_info` VALUES ('100', '15', '1117', '0', '0');
INSERT INTO `web_message_info` VALUES ('101', '15', '1118', '0', '0');
INSERT INTO `web_message_info` VALUES ('102', '15', '1122', '0', '0');
INSERT INTO `web_message_info` VALUES ('103', '15', '1123', '0', '0');
INSERT INTO `web_message_info` VALUES ('104', '15', '1124', '0', '0');
INSERT INTO `web_message_info` VALUES ('105', '15', '1125', '0', '0');
INSERT INTO `web_message_info` VALUES ('106', '15', '1126', '0', '0');
INSERT INTO `web_message_info` VALUES ('107', '15', '1127', '0', '0');
INSERT INTO `web_message_info` VALUES ('108', '15', '1128', '0', '0');
INSERT INTO `web_message_info` VALUES ('109', '15', '1129', '0', '0');
INSERT INTO `web_message_info` VALUES ('110', '15', '1130', '0', '0');
INSERT INTO `web_message_info` VALUES ('111', '15', '1131', '0', '0');
INSERT INTO `web_message_info` VALUES ('112', '15', '1132', '0', '0');
INSERT INTO `web_message_info` VALUES ('113', '15', '1133', '0', '0');
INSERT INTO `web_message_info` VALUES ('114', '15', '1134', '0', '0');
INSERT INTO `web_message_info` VALUES ('115', '15', '1135', '0', '0');
INSERT INTO `web_message_info` VALUES ('116', '15', '1136', '0', '0');
INSERT INTO `web_message_info` VALUES ('117', '15', '1137', '0', '0');
INSERT INTO `web_message_info` VALUES ('118', '15', '1138', '0', '0');
INSERT INTO `web_message_info` VALUES ('119', '15', '1139', '0', '0');
INSERT INTO `web_message_info` VALUES ('120', '15', '1140', '0', '0');
INSERT INTO `web_message_info` VALUES ('121', '15', '1141', '0', '0');
INSERT INTO `web_message_info` VALUES ('122', '15', '1142', '0', '0');
INSERT INTO `web_message_info` VALUES ('123', '15', '1143', '0', '0');
INSERT INTO `web_message_info` VALUES ('124', '15', '1144', '0', '0');
INSERT INTO `web_message_info` VALUES ('125', '15', '1145', '0', '0');
INSERT INTO `web_message_info` VALUES ('126', '15', '1146', '0', '0');
INSERT INTO `web_message_info` VALUES ('127', '15', '1147', '0', '0');
INSERT INTO `web_message_info` VALUES ('128', '15', '1148', '0', '0');
INSERT INTO `web_message_info` VALUES ('129', '15', '1149', '0', '0');
INSERT INTO `web_message_info` VALUES ('130', '15', '1150', '0', '0');
INSERT INTO `web_message_info` VALUES ('131', '15', '1151', '0', '0');
INSERT INTO `web_message_info` VALUES ('132', '15', '1152', '0', '0');
INSERT INTO `web_message_info` VALUES ('133', '15', '1153', '0', '0');
INSERT INTO `web_message_info` VALUES ('134', '15', '1154', '0', '0');
INSERT INTO `web_message_info` VALUES ('135', '15', '1155', '0', '0');
INSERT INTO `web_message_info` VALUES ('136', '15', '1156', '0', '0');
INSERT INTO `web_message_info` VALUES ('137', '15', '1157', '0', '0');
INSERT INTO `web_message_info` VALUES ('138', '15', '1158', '0', '0');
INSERT INTO `web_message_info` VALUES ('139', '15', '1159', '0', '0');
INSERT INTO `web_message_info` VALUES ('140', '15', '1160', '0', '0');
INSERT INTO `web_message_info` VALUES ('141', '15', '1161', '0', '0');
INSERT INTO `web_message_info` VALUES ('142', '15', '1162', '0', '0');
INSERT INTO `web_message_info` VALUES ('143', '15', '1163', '0', '0');
INSERT INTO `web_message_info` VALUES ('144', '15', '1164', '0', '0');
INSERT INTO `web_message_info` VALUES ('145', '15', '1165', '0', '0');
INSERT INTO `web_message_info` VALUES ('146', '15', '1166', '0', '0');
INSERT INTO `web_message_info` VALUES ('147', '15', '1167', '0', '0');
INSERT INTO `web_message_info` VALUES ('148', '15', '1168', '0', '0');
INSERT INTO `web_message_info` VALUES ('149', '15', '1169', '0', '0');
INSERT INTO `web_message_info` VALUES ('150', '15', '1170', '0', '0');
INSERT INTO `web_message_info` VALUES ('151', '15', '1171', '0', '0');
INSERT INTO `web_message_info` VALUES ('152', '15', '1172', '0', '0');
INSERT INTO `web_message_info` VALUES ('153', '15', '1173', '0', '0');
INSERT INTO `web_message_info` VALUES ('154', '15', '1174', '0', '0');
INSERT INTO `web_message_info` VALUES ('155', '15', '1175', '0', '0');
INSERT INTO `web_message_info` VALUES ('156', '15', '1176', '0', '0');
INSERT INTO `web_message_info` VALUES ('157', '15', '1177', '0', '0');
INSERT INTO `web_message_info` VALUES ('158', '15', '1178', '0', '0');
INSERT INTO `web_message_info` VALUES ('159', '15', '1179', '0', '0');
INSERT INTO `web_message_info` VALUES ('160', '15', '1180', '0', '0');
INSERT INTO `web_message_info` VALUES ('161', '15', '1181', '0', '0');
INSERT INTO `web_message_info` VALUES ('162', '15', '1182', '0', '0');
INSERT INTO `web_message_info` VALUES ('163', '15', '1183', '0', '0');
INSERT INTO `web_message_info` VALUES ('164', '15', '1184', '0', '0');
INSERT INTO `web_message_info` VALUES ('165', '15', '1185', '0', '0');
INSERT INTO `web_message_info` VALUES ('166', '15', '1186', '0', '0');
INSERT INTO `web_message_info` VALUES ('167', '15', '1187', '0', '0');
INSERT INTO `web_message_info` VALUES ('168', '15', '1188', '0', '0');
INSERT INTO `web_message_info` VALUES ('169', '15', '1189', '0', '0');
INSERT INTO `web_message_info` VALUES ('170', '15', '1190', '0', '0');
INSERT INTO `web_message_info` VALUES ('171', '15', '1191', '0', '0');
INSERT INTO `web_message_info` VALUES ('172', '15', '1192', '0', '0');
INSERT INTO `web_message_info` VALUES ('173', '15', '1193', '0', '0');
INSERT INTO `web_message_info` VALUES ('174', '15', '1194', '0', '0');
INSERT INTO `web_message_info` VALUES ('175', '15', '1195', '0', '0');
INSERT INTO `web_message_info` VALUES ('176', '15', '1196', '0', '0');
INSERT INTO `web_message_info` VALUES ('177', '15', '1197', '0', '0');
INSERT INTO `web_message_info` VALUES ('178', '15', '1198', '0', '0');
INSERT INTO `web_message_info` VALUES ('179', '15', '1199', '0', '0');
INSERT INTO `web_message_info` VALUES ('180', '15', '1200', '0', '0');
INSERT INTO `web_message_info` VALUES ('181', '15', '1201', '0', '0');
INSERT INTO `web_message_info` VALUES ('182', '15', '1202', '0', '0');
INSERT INTO `web_message_info` VALUES ('183', '15', '1203', '0', '0');
INSERT INTO `web_message_info` VALUES ('184', '15', '1204', '0', '0');
INSERT INTO `web_message_info` VALUES ('185', '15', '1205', '0', '0');
INSERT INTO `web_message_info` VALUES ('186', '11', '1034', '0', '0');
INSERT INTO `web_message_info` VALUES ('187', '12', '1034', '0', '0');
INSERT INTO `web_message_info` VALUES ('188', '13', '1034', '0', '0');
INSERT INTO `web_message_info` VALUES ('189', '14', '1034', '0', '0');
INSERT INTO `web_message_info` VALUES ('190', '15', '1034', '0', '0');
INSERT INTO `web_message_info` VALUES ('191', '11', '1101', '0', '0');
INSERT INTO `web_message_info` VALUES ('192', '12', '1101', '0', '0');
INSERT INTO `web_message_info` VALUES ('193', '13', '1101', '0', '0');
INSERT INTO `web_message_info` VALUES ('194', '14', '1101', '0', '0');
INSERT INTO `web_message_info` VALUES ('195', '15', '1101', '0', '0');
INSERT INTO `web_message_info` VALUES ('196', '11', '1063', '0', '0');
INSERT INTO `web_message_info` VALUES ('197', '12', '1063', '0', '0');
INSERT INTO `web_message_info` VALUES ('198', '13', '1063', '0', '0');
INSERT INTO `web_message_info` VALUES ('199', '14', '1063', '0', '0');
INSERT INTO `web_message_info` VALUES ('200', '15', '1063', '0', '0');
INSERT INTO `web_message_info` VALUES ('201', '11', '1056', '0', '0');
INSERT INTO `web_message_info` VALUES ('202', '12', '1056', '0', '0');
INSERT INTO `web_message_info` VALUES ('203', '13', '1056', '0', '0');
INSERT INTO `web_message_info` VALUES ('204', '14', '1056', '0', '0');
INSERT INTO `web_message_info` VALUES ('205', '15', '1056', '0', '0');
INSERT INTO `web_message_info` VALUES ('206', '11', '1203', '0', '0');
INSERT INTO `web_message_info` VALUES ('207', '12', '1203', '0', '0');
INSERT INTO `web_message_info` VALUES ('208', '13', '1203', '0', '0');
INSERT INTO `web_message_info` VALUES ('209', '14', '1203', '0', '0');
INSERT INTO `web_message_info` VALUES ('210', '15', '1203', '0', '0');
INSERT INTO `web_message_info` VALUES ('211', '11', '1057', '0', '0');
INSERT INTO `web_message_info` VALUES ('212', '12', '1057', '0', '0');
INSERT INTO `web_message_info` VALUES ('213', '13', '1057', '0', '0');
INSERT INTO `web_message_info` VALUES ('214', '14', '1057', '0', '0');
INSERT INTO `web_message_info` VALUES ('215', '15', '1057', '0', '0');
INSERT INTO `web_message_info` VALUES ('216', '11', '1206', '0', '0');
INSERT INTO `web_message_info` VALUES ('217', '12', '1206', '0', '0');
INSERT INTO `web_message_info` VALUES ('218', '13', '1206', '0', '0');
INSERT INTO `web_message_info` VALUES ('219', '14', '1206', '0', '0');
INSERT INTO `web_message_info` VALUES ('220', '15', '1206', '0', '0');
INSERT INTO `web_message_info` VALUES ('221', '11', '1030', '0', '0');
INSERT INTO `web_message_info` VALUES ('222', '12', '1030', '0', '0');
INSERT INTO `web_message_info` VALUES ('223', '13', '1030', '0', '0');
INSERT INTO `web_message_info` VALUES ('224', '14', '1030', '0', '0');
INSERT INTO `web_message_info` VALUES ('225', '15', '1030', '0', '0');
INSERT INTO `web_message_info` VALUES ('226', '11', '1068', '0', '0');
INSERT INTO `web_message_info` VALUES ('227', '12', '1068', '0', '0');
INSERT INTO `web_message_info` VALUES ('228', '13', '1068', '0', '0');
INSERT INTO `web_message_info` VALUES ('229', '14', '1068', '0', '0');
INSERT INTO `web_message_info` VALUES ('230', '15', '1068', '0', '0');
INSERT INTO `web_message_info` VALUES ('231', '11', '1116', '0', '0');
INSERT INTO `web_message_info` VALUES ('232', '12', '1116', '0', '0');
INSERT INTO `web_message_info` VALUES ('233', '13', '1116', '0', '0');
INSERT INTO `web_message_info` VALUES ('234', '14', '1116', '0', '0');
INSERT INTO `web_message_info` VALUES ('235', '15', '1116', '0', '0');
INSERT INTO `web_message_info` VALUES ('236', '11', '1207', '0', '0');
INSERT INTO `web_message_info` VALUES ('237', '12', '1207', '0', '0');
INSERT INTO `web_message_info` VALUES ('238', '13', '1207', '0', '0');
INSERT INTO `web_message_info` VALUES ('239', '14', '1207', '0', '0');
INSERT INTO `web_message_info` VALUES ('240', '15', '1207', '0', '0');
INSERT INTO `web_message_info` VALUES ('241', '11', '1058', '0', '0');
INSERT INTO `web_message_info` VALUES ('242', '12', '1058', '0', '0');
INSERT INTO `web_message_info` VALUES ('243', '13', '1058', '0', '0');
INSERT INTO `web_message_info` VALUES ('244', '14', '1058', '0', '0');
INSERT INTO `web_message_info` VALUES ('245', '15', '1058', '0', '0');
INSERT INTO `web_message_info` VALUES ('246', '11', '1208', '0', '0');
INSERT INTO `web_message_info` VALUES ('247', '12', '1208', '0', '0');
INSERT INTO `web_message_info` VALUES ('248', '13', '1208', '0', '0');
INSERT INTO `web_message_info` VALUES ('249', '14', '1208', '0', '0');
INSERT INTO `web_message_info` VALUES ('250', '15', '1208', '0', '0');
INSERT INTO `web_message_info` VALUES ('251', '11', '1209', '0', '0');
INSERT INTO `web_message_info` VALUES ('252', '12', '1209', '0', '0');
INSERT INTO `web_message_info` VALUES ('253', '13', '1209', '0', '0');
INSERT INTO `web_message_info` VALUES ('254', '14', '1209', '0', '0');
INSERT INTO `web_message_info` VALUES ('255', '15', '1209', '0', '0');
INSERT INTO `web_message_info` VALUES ('256', '11', '1210', '0', '0');
INSERT INTO `web_message_info` VALUES ('257', '12', '1210', '0', '0');
INSERT INTO `web_message_info` VALUES ('258', '13', '1210', '0', '0');
INSERT INTO `web_message_info` VALUES ('259', '14', '1210', '0', '0');
INSERT INTO `web_message_info` VALUES ('260', '15', '1210', '0', '0');
INSERT INTO `web_message_info` VALUES ('261', '11', '1211', '0', '0');
INSERT INTO `web_message_info` VALUES ('262', '12', '1211', '0', '0');
INSERT INTO `web_message_info` VALUES ('263', '13', '1211', '0', '0');
INSERT INTO `web_message_info` VALUES ('264', '14', '1211', '0', '0');
INSERT INTO `web_message_info` VALUES ('265', '15', '1211', '0', '0');
INSERT INTO `web_message_info` VALUES ('266', '11', '1212', '0', '0');
INSERT INTO `web_message_info` VALUES ('267', '12', '1212', '0', '0');
INSERT INTO `web_message_info` VALUES ('268', '13', '1212', '0', '0');
INSERT INTO `web_message_info` VALUES ('269', '14', '1212', '0', '0');
INSERT INTO `web_message_info` VALUES ('270', '15', '1212', '0', '0');
INSERT INTO `web_message_info` VALUES ('271', '11', '1213', '0', '0');
INSERT INTO `web_message_info` VALUES ('272', '12', '1213', '0', '0');
INSERT INTO `web_message_info` VALUES ('273', '13', '1213', '0', '0');
INSERT INTO `web_message_info` VALUES ('274', '14', '1213', '0', '0');
INSERT INTO `web_message_info` VALUES ('275', '15', '1213', '0', '0');
INSERT INTO `web_message_info` VALUES ('276', '11', '1214', '0', '0');
INSERT INTO `web_message_info` VALUES ('277', '12', '1214', '0', '0');
INSERT INTO `web_message_info` VALUES ('278', '13', '1214', '0', '0');
INSERT INTO `web_message_info` VALUES ('279', '14', '1214', '0', '0');
INSERT INTO `web_message_info` VALUES ('280', '15', '1214', '0', '0');
INSERT INTO `web_message_info` VALUES ('281', '11', '1042', '0', '0');
INSERT INTO `web_message_info` VALUES ('282', '12', '1042', '0', '0');
INSERT INTO `web_message_info` VALUES ('283', '13', '1042', '0', '0');
INSERT INTO `web_message_info` VALUES ('284', '14', '1042', '0', '0');
INSERT INTO `web_message_info` VALUES ('285', '15', '1042', '0', '0');
INSERT INTO `web_message_info` VALUES ('286', '11', '1215', '0', '0');
INSERT INTO `web_message_info` VALUES ('287', '12', '1215', '0', '0');
INSERT INTO `web_message_info` VALUES ('288', '13', '1215', '0', '0');
INSERT INTO `web_message_info` VALUES ('289', '14', '1215', '0', '0');
INSERT INTO `web_message_info` VALUES ('290', '15', '1215', '0', '0');
INSERT INTO `web_message_info` VALUES ('291', '11', '1216', '0', '0');
INSERT INTO `web_message_info` VALUES ('292', '12', '1216', '0', '0');
INSERT INTO `web_message_info` VALUES ('293', '13', '1216', '0', '0');
INSERT INTO `web_message_info` VALUES ('294', '14', '1216', '0', '0');
INSERT INTO `web_message_info` VALUES ('295', '15', '1216', '0', '0');
INSERT INTO `web_message_info` VALUES ('296', '11', '1217', '0', '0');
INSERT INTO `web_message_info` VALUES ('297', '12', '1217', '0', '0');
INSERT INTO `web_message_info` VALUES ('298', '13', '1217', '0', '0');
INSERT INTO `web_message_info` VALUES ('299', '14', '1217', '0', '0');
INSERT INTO `web_message_info` VALUES ('300', '15', '1217', '0', '0');
INSERT INTO `web_message_info` VALUES ('301', '11', '1218', '0', '0');
INSERT INTO `web_message_info` VALUES ('302', '12', '1218', '0', '0');
INSERT INTO `web_message_info` VALUES ('303', '13', '1218', '0', '0');
INSERT INTO `web_message_info` VALUES ('304', '14', '1218', '0', '0');
INSERT INTO `web_message_info` VALUES ('305', '15', '1218', '0', '0');
INSERT INTO `web_message_info` VALUES ('306', '11', '1219', '0', '0');
INSERT INTO `web_message_info` VALUES ('307', '12', '1219', '0', '0');
INSERT INTO `web_message_info` VALUES ('308', '13', '1219', '0', '0');
INSERT INTO `web_message_info` VALUES ('309', '14', '1219', '0', '0');
INSERT INTO `web_message_info` VALUES ('310', '15', '1219', '0', '0');
INSERT INTO `web_message_info` VALUES ('311', '11', '1220', '0', '0');
INSERT INTO `web_message_info` VALUES ('312', '12', '1220', '0', '0');
INSERT INTO `web_message_info` VALUES ('313', '13', '1220', '0', '0');
INSERT INTO `web_message_info` VALUES ('314', '14', '1220', '0', '0');
INSERT INTO `web_message_info` VALUES ('315', '15', '1220', '0', '0');
INSERT INTO `web_message_info` VALUES ('316', '11', '1221', '0', '0');
INSERT INTO `web_message_info` VALUES ('317', '12', '1221', '0', '0');
INSERT INTO `web_message_info` VALUES ('318', '13', '1221', '0', '0');
INSERT INTO `web_message_info` VALUES ('319', '14', '1221', '0', '0');
INSERT INTO `web_message_info` VALUES ('320', '15', '1221', '0', '0');
INSERT INTO `web_message_info` VALUES ('321', '11', '1222', '0', '0');
INSERT INTO `web_message_info` VALUES ('322', '12', '1222', '0', '0');
INSERT INTO `web_message_info` VALUES ('323', '13', '1222', '0', '0');
INSERT INTO `web_message_info` VALUES ('324', '14', '1222', '0', '0');
INSERT INTO `web_message_info` VALUES ('325', '15', '1222', '0', '0');
INSERT INTO `web_message_info` VALUES ('326', '11', '1223', '0', '0');
INSERT INTO `web_message_info` VALUES ('327', '12', '1223', '0', '0');
INSERT INTO `web_message_info` VALUES ('328', '13', '1223', '0', '0');
INSERT INTO `web_message_info` VALUES ('329', '14', '1223', '0', '0');
INSERT INTO `web_message_info` VALUES ('330', '15', '1223', '0', '0');
INSERT INTO `web_message_info` VALUES ('331', '11', '1224', '0', '0');
INSERT INTO `web_message_info` VALUES ('332', '12', '1224', '0', '0');
INSERT INTO `web_message_info` VALUES ('333', '13', '1224', '0', '0');
INSERT INTO `web_message_info` VALUES ('334', '14', '1224', '0', '0');
INSERT INTO `web_message_info` VALUES ('335', '15', '1224', '0', '0');
INSERT INTO `web_message_info` VALUES ('336', '11', '1225', '0', '0');
INSERT INTO `web_message_info` VALUES ('337', '12', '1225', '0', '0');
INSERT INTO `web_message_info` VALUES ('338', '13', '1225', '0', '0');
INSERT INTO `web_message_info` VALUES ('339', '14', '1225', '0', '0');
INSERT INTO `web_message_info` VALUES ('340', '15', '1225', '0', '0');
INSERT INTO `web_message_info` VALUES ('341', '11', '1226', '0', '0');
INSERT INTO `web_message_info` VALUES ('342', '12', '1226', '0', '0');
INSERT INTO `web_message_info` VALUES ('343', '13', '1226', '0', '0');
INSERT INTO `web_message_info` VALUES ('344', '14', '1226', '0', '0');
INSERT INTO `web_message_info` VALUES ('345', '15', '1226', '0', '0');
INSERT INTO `web_message_info` VALUES ('346', '11', '1227', '0', '0');
INSERT INTO `web_message_info` VALUES ('347', '12', '1227', '0', '0');
INSERT INTO `web_message_info` VALUES ('348', '13', '1227', '0', '0');
INSERT INTO `web_message_info` VALUES ('349', '14', '1227', '0', '0');
INSERT INTO `web_message_info` VALUES ('350', '15', '1227', '0', '0');
INSERT INTO `web_message_info` VALUES ('351', '11', '1228', '0', '0');
INSERT INTO `web_message_info` VALUES ('352', '12', '1228', '0', '0');
INSERT INTO `web_message_info` VALUES ('353', '13', '1228', '0', '0');
INSERT INTO `web_message_info` VALUES ('354', '14', '1228', '0', '0');
INSERT INTO `web_message_info` VALUES ('355', '15', '1228', '0', '0');
INSERT INTO `web_message_info` VALUES ('356', '11', '1229', '0', '0');
INSERT INTO `web_message_info` VALUES ('357', '12', '1229', '0', '0');
INSERT INTO `web_message_info` VALUES ('358', '13', '1229', '0', '0');
INSERT INTO `web_message_info` VALUES ('359', '14', '1229', '0', '0');
INSERT INTO `web_message_info` VALUES ('360', '15', '1229', '0', '0');
INSERT INTO `web_message_info` VALUES ('361', '11', '1230', '0', '0');
INSERT INTO `web_message_info` VALUES ('362', '12', '1230', '0', '0');
INSERT INTO `web_message_info` VALUES ('363', '13', '1230', '0', '0');
INSERT INTO `web_message_info` VALUES ('364', '14', '1230', '0', '0');
INSERT INTO `web_message_info` VALUES ('365', '15', '1230', '0', '0');
INSERT INTO `web_message_info` VALUES ('366', '11', '1231', '0', '0');
INSERT INTO `web_message_info` VALUES ('367', '12', '1231', '0', '0');
INSERT INTO `web_message_info` VALUES ('368', '13', '1231', '0', '0');
INSERT INTO `web_message_info` VALUES ('369', '14', '1231', '0', '0');
INSERT INTO `web_message_info` VALUES ('370', '15', '1231', '0', '0');
INSERT INTO `web_message_info` VALUES ('371', '11', '1232', '0', '0');
INSERT INTO `web_message_info` VALUES ('372', '12', '1232', '0', '0');
INSERT INTO `web_message_info` VALUES ('373', '13', '1232', '0', '0');
INSERT INTO `web_message_info` VALUES ('374', '14', '1232', '0', '0');
INSERT INTO `web_message_info` VALUES ('375', '15', '1232', '0', '0');
INSERT INTO `web_message_info` VALUES ('376', '11', '1233', '0', '0');
INSERT INTO `web_message_info` VALUES ('377', '12', '1233', '0', '0');
INSERT INTO `web_message_info` VALUES ('378', '13', '1233', '0', '0');
INSERT INTO `web_message_info` VALUES ('379', '14', '1233', '0', '0');
INSERT INTO `web_message_info` VALUES ('380', '15', '1233', '0', '0');
INSERT INTO `web_message_info` VALUES ('381', '11', '1234', '0', '0');
INSERT INTO `web_message_info` VALUES ('382', '12', '1234', '0', '0');
INSERT INTO `web_message_info` VALUES ('383', '13', '1234', '0', '0');
INSERT INTO `web_message_info` VALUES ('384', '14', '1234', '0', '0');
INSERT INTO `web_message_info` VALUES ('385', '15', '1234', '0', '0');
INSERT INTO `web_message_info` VALUES ('386', '11', '1071', '0', '0');
INSERT INTO `web_message_info` VALUES ('387', '12', '1071', '1', '1');
INSERT INTO `web_message_info` VALUES ('388', '13', '1071', '1', '1');
INSERT INTO `web_message_info` VALUES ('389', '14', '1071', '1', '1');
INSERT INTO `web_message_info` VALUES ('390', '15', '1071', '1', '1');
INSERT INTO `web_message_info` VALUES ('391', '11', '1235', '0', '0');
INSERT INTO `web_message_info` VALUES ('392', '12', '1235', '0', '0');
INSERT INTO `web_message_info` VALUES ('393', '13', '1235', '0', '0');
INSERT INTO `web_message_info` VALUES ('394', '14', '1235', '0', '0');
INSERT INTO `web_message_info` VALUES ('395', '15', '1235', '0', '0');
INSERT INTO `web_message_info` VALUES ('396', '11', '1236', '0', '0');
INSERT INTO `web_message_info` VALUES ('397', '12', '1236', '0', '0');
INSERT INTO `web_message_info` VALUES ('398', '13', '1236', '0', '0');
INSERT INTO `web_message_info` VALUES ('399', '14', '1236', '0', '0');
INSERT INTO `web_message_info` VALUES ('400', '15', '1236', '0', '0');
INSERT INTO `web_message_info` VALUES ('401', '11', '1237', '0', '0');
INSERT INTO `web_message_info` VALUES ('402', '12', '1237', '0', '0');
INSERT INTO `web_message_info` VALUES ('403', '13', '1237', '0', '0');
INSERT INTO `web_message_info` VALUES ('404', '14', '1237', '0', '0');
INSERT INTO `web_message_info` VALUES ('405', '15', '1237', '0', '0');
INSERT INTO `web_message_info` VALUES ('406', '11', '1238', '0', '0');
INSERT INTO `web_message_info` VALUES ('407', '12', '1238', '0', '0');
INSERT INTO `web_message_info` VALUES ('408', '13', '1238', '0', '0');
INSERT INTO `web_message_info` VALUES ('409', '14', '1238', '0', '0');
INSERT INTO `web_message_info` VALUES ('410', '15', '1238', '0', '0');
INSERT INTO `web_message_info` VALUES ('411', '11', '1239', '0', '0');
INSERT INTO `web_message_info` VALUES ('412', '12', '1239', '0', '0');
INSERT INTO `web_message_info` VALUES ('413', '13', '1239', '0', '0');
INSERT INTO `web_message_info` VALUES ('414', '14', '1239', '0', '0');
INSERT INTO `web_message_info` VALUES ('415', '15', '1239', '0', '0');
INSERT INTO `web_message_info` VALUES ('416', '11', '1240', '0', '0');
INSERT INTO `web_message_info` VALUES ('417', '12', '1240', '0', '0');
INSERT INTO `web_message_info` VALUES ('418', '13', '1240', '0', '0');
INSERT INTO `web_message_info` VALUES ('419', '14', '1240', '0', '0');
INSERT INTO `web_message_info` VALUES ('420', '15', '1240', '0', '0');
INSERT INTO `web_message_info` VALUES ('421', '11', '1112', '0', '0');
INSERT INTO `web_message_info` VALUES ('422', '12', '1112', '0', '0');
INSERT INTO `web_message_info` VALUES ('423', '13', '1112', '0', '0');
INSERT INTO `web_message_info` VALUES ('424', '14', '1112', '0', '0');
INSERT INTO `web_message_info` VALUES ('425', '15', '1112', '0', '0');
INSERT INTO `web_message_info` VALUES ('426', '11', '1242', '0', '0');
INSERT INTO `web_message_info` VALUES ('427', '12', '1242', '0', '0');
INSERT INTO `web_message_info` VALUES ('428', '13', '1242', '0', '0');
INSERT INTO `web_message_info` VALUES ('429', '14', '1242', '0', '0');
INSERT INTO `web_message_info` VALUES ('430', '15', '1242', '0', '0');
INSERT INTO `web_message_info` VALUES ('431', '11', '1243', '0', '0');
INSERT INTO `web_message_info` VALUES ('432', '12', '1243', '0', '0');
INSERT INTO `web_message_info` VALUES ('433', '13', '1243', '0', '0');
INSERT INTO `web_message_info` VALUES ('434', '14', '1243', '0', '0');
INSERT INTO `web_message_info` VALUES ('435', '15', '1243', '0', '0');
INSERT INTO `web_message_info` VALUES ('436', '11', '1244', '0', '0');
INSERT INTO `web_message_info` VALUES ('437', '12', '1244', '0', '0');
INSERT INTO `web_message_info` VALUES ('438', '13', '1244', '0', '0');
INSERT INTO `web_message_info` VALUES ('439', '14', '1244', '0', '0');
INSERT INTO `web_message_info` VALUES ('440', '15', '1244', '0', '0');
INSERT INTO `web_message_info` VALUES ('441', '11', '1245', '0', '0');
INSERT INTO `web_message_info` VALUES ('442', '12', '1245', '0', '0');
INSERT INTO `web_message_info` VALUES ('443', '13', '1245', '0', '0');
INSERT INTO `web_message_info` VALUES ('444', '14', '1245', '0', '0');
INSERT INTO `web_message_info` VALUES ('445', '15', '1245', '0', '0');
INSERT INTO `web_message_info` VALUES ('446', '11', '1246', '0', '0');
INSERT INTO `web_message_info` VALUES ('447', '12', '1246', '0', '0');
INSERT INTO `web_message_info` VALUES ('448', '13', '1246', '0', '0');
INSERT INTO `web_message_info` VALUES ('449', '14', '1246', '0', '0');
INSERT INTO `web_message_info` VALUES ('450', '15', '1246', '0', '0');
INSERT INTO `web_message_info` VALUES ('451', '11', '1247', '0', '0');
INSERT INTO `web_message_info` VALUES ('452', '12', '1247', '0', '0');
INSERT INTO `web_message_info` VALUES ('453', '13', '1247', '0', '0');
INSERT INTO `web_message_info` VALUES ('454', '14', '1247', '0', '0');
INSERT INTO `web_message_info` VALUES ('455', '15', '1247', '0', '0');
INSERT INTO `web_message_info` VALUES ('456', '11', '1248', '0', '0');
INSERT INTO `web_message_info` VALUES ('457', '12', '1248', '0', '0');
INSERT INTO `web_message_info` VALUES ('458', '13', '1248', '0', '0');
INSERT INTO `web_message_info` VALUES ('459', '14', '1248', '0', '0');
INSERT INTO `web_message_info` VALUES ('460', '15', '1248', '0', '0');
INSERT INTO `web_message_info` VALUES ('461', '11', '1249', '0', '0');
INSERT INTO `web_message_info` VALUES ('462', '12', '1249', '0', '0');
INSERT INTO `web_message_info` VALUES ('463', '13', '1249', '0', '0');
INSERT INTO `web_message_info` VALUES ('464', '14', '1249', '0', '0');
INSERT INTO `web_message_info` VALUES ('465', '15', '1249', '0', '0');
INSERT INTO `web_message_info` VALUES ('466', '11', '1250', '0', '0');
INSERT INTO `web_message_info` VALUES ('467', '12', '1250', '0', '0');
INSERT INTO `web_message_info` VALUES ('468', '13', '1250', '0', '0');
INSERT INTO `web_message_info` VALUES ('469', '14', '1250', '0', '0');
INSERT INTO `web_message_info` VALUES ('470', '15', '1250', '0', '0');
INSERT INTO `web_message_info` VALUES ('471', '11', '1251', '0', '0');
INSERT INTO `web_message_info` VALUES ('472', '12', '1251', '0', '0');
INSERT INTO `web_message_info` VALUES ('473', '13', '1251', '0', '0');
INSERT INTO `web_message_info` VALUES ('474', '14', '1251', '0', '0');
INSERT INTO `web_message_info` VALUES ('475', '15', '1251', '0', '0');
INSERT INTO `web_message_info` VALUES ('476', '11', '1252', '0', '0');
INSERT INTO `web_message_info` VALUES ('477', '12', '1252', '0', '0');
INSERT INTO `web_message_info` VALUES ('478', '13', '1252', '0', '0');
INSERT INTO `web_message_info` VALUES ('479', '14', '1252', '0', '0');
INSERT INTO `web_message_info` VALUES ('480', '15', '1252', '0', '0');
INSERT INTO `web_message_info` VALUES ('481', '11', '1253', '0', '0');
INSERT INTO `web_message_info` VALUES ('482', '12', '1253', '0', '0');
INSERT INTO `web_message_info` VALUES ('483', '13', '1253', '0', '0');
INSERT INTO `web_message_info` VALUES ('484', '14', '1253', '0', '0');
INSERT INTO `web_message_info` VALUES ('485', '15', '1253', '0', '0');
INSERT INTO `web_message_info` VALUES ('486', '11', '1254', '0', '0');
INSERT INTO `web_message_info` VALUES ('487', '12', '1254', '0', '0');
INSERT INTO `web_message_info` VALUES ('488', '13', '1254', '0', '0');
INSERT INTO `web_message_info` VALUES ('489', '14', '1254', '0', '0');
INSERT INTO `web_message_info` VALUES ('490', '15', '1254', '0', '0');
INSERT INTO `web_message_info` VALUES ('491', '11', '1175', '0', '0');
INSERT INTO `web_message_info` VALUES ('492', '12', '1175', '0', '0');
INSERT INTO `web_message_info` VALUES ('493', '13', '1175', '0', '0');
INSERT INTO `web_message_info` VALUES ('494', '14', '1175', '0', '0');
INSERT INTO `web_message_info` VALUES ('495', '15', '1175', '0', '0');
INSERT INTO `web_message_info` VALUES ('496', '11', '1177', '0', '0');
INSERT INTO `web_message_info` VALUES ('497', '12', '1177', '0', '0');
INSERT INTO `web_message_info` VALUES ('498', '13', '1177', '0', '0');
INSERT INTO `web_message_info` VALUES ('499', '14', '1177', '0', '0');
INSERT INTO `web_message_info` VALUES ('500', '15', '1177', '0', '0');
INSERT INTO `web_message_info` VALUES ('501', '11', '1145', '0', '0');
INSERT INTO `web_message_info` VALUES ('502', '12', '1145', '0', '0');
INSERT INTO `web_message_info` VALUES ('503', '13', '1145', '0', '0');
INSERT INTO `web_message_info` VALUES ('504', '14', '1145', '0', '0');
INSERT INTO `web_message_info` VALUES ('505', '15', '1145', '0', '0');
INSERT INTO `web_message_info` VALUES ('506', '11', '1255', '0', '0');
INSERT INTO `web_message_info` VALUES ('507', '12', '1255', '0', '0');
INSERT INTO `web_message_info` VALUES ('508', '13', '1255', '0', '0');
INSERT INTO `web_message_info` VALUES ('509', '14', '1255', '0', '0');
INSERT INTO `web_message_info` VALUES ('510', '15', '1255', '0', '0');
INSERT INTO `web_message_info` VALUES ('511', '11', '1256', '0', '0');
INSERT INTO `web_message_info` VALUES ('512', '12', '1256', '0', '0');
INSERT INTO `web_message_info` VALUES ('513', '13', '1256', '0', '0');
INSERT INTO `web_message_info` VALUES ('514', '14', '1256', '0', '0');
INSERT INTO `web_message_info` VALUES ('515', '15', '1256', '0', '0');
INSERT INTO `web_message_info` VALUES ('516', '11', '1257', '0', '0');
INSERT INTO `web_message_info` VALUES ('517', '12', '1257', '0', '0');
INSERT INTO `web_message_info` VALUES ('518', '13', '1257', '0', '0');
INSERT INTO `web_message_info` VALUES ('519', '14', '1257', '0', '0');
INSERT INTO `web_message_info` VALUES ('520', '15', '1257', '0', '0');
INSERT INTO `web_message_info` VALUES ('521', '11', '1258', '0', '0');
INSERT INTO `web_message_info` VALUES ('522', '12', '1258', '0', '0');
INSERT INTO `web_message_info` VALUES ('523', '13', '1258', '0', '0');
INSERT INTO `web_message_info` VALUES ('524', '14', '1258', '0', '0');
INSERT INTO `web_message_info` VALUES ('525', '15', '1258', '0', '0');
INSERT INTO `web_message_info` VALUES ('526', '11', '1259', '0', '0');
INSERT INTO `web_message_info` VALUES ('527', '12', '1259', '0', '0');
INSERT INTO `web_message_info` VALUES ('528', '13', '1259', '0', '0');
INSERT INTO `web_message_info` VALUES ('529', '14', '1259', '0', '0');
INSERT INTO `web_message_info` VALUES ('530', '15', '1259', '0', '0');
INSERT INTO `web_message_info` VALUES ('531', '11', '1260', '0', '0');
INSERT INTO `web_message_info` VALUES ('532', '12', '1260', '0', '0');
INSERT INTO `web_message_info` VALUES ('533', '13', '1260', '0', '0');
INSERT INTO `web_message_info` VALUES ('534', '14', '1260', '0', '0');
INSERT INTO `web_message_info` VALUES ('535', '15', '1260', '0', '0');
INSERT INTO `web_message_info` VALUES ('536', '11', '1075', '0', '0');
INSERT INTO `web_message_info` VALUES ('537', '12', '1075', '0', '0');
INSERT INTO `web_message_info` VALUES ('538', '13', '1075', '0', '0');
INSERT INTO `web_message_info` VALUES ('539', '14', '1075', '0', '0');
INSERT INTO `web_message_info` VALUES ('540', '15', '1075', '0', '0');
INSERT INTO `web_message_info` VALUES ('541', '11', '1261', '0', '0');
INSERT INTO `web_message_info` VALUES ('542', '12', '1261', '0', '1');
INSERT INTO `web_message_info` VALUES ('543', '13', '1261', '1', '1');
INSERT INTO `web_message_info` VALUES ('544', '14', '1261', '1', '1');
INSERT INTO `web_message_info` VALUES ('545', '15', '1261', '1', '1');
INSERT INTO `web_message_info` VALUES ('546', '11', '1073', '0', '0');
INSERT INTO `web_message_info` VALUES ('547', '12', '1073', '0', '0');
INSERT INTO `web_message_info` VALUES ('548', '13', '1073', '1', '0');
INSERT INTO `web_message_info` VALUES ('549', '14', '1073', '1', '0');
INSERT INTO `web_message_info` VALUES ('550', '15', '1073', '1', '0');
INSERT INTO `web_message_info` VALUES ('551', '31', '1032', '0', '1');

-- ----------------------------
-- Table structure for web_message_text
-- ----------------------------
DROP TABLE IF EXISTS `web_message_text`;
CREATE TABLE `web_message_text` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `from_user` int(50) NOT NULL DEFAULT '0' COMMENT '发信人ID',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `context` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `add_time` timestamp NOT NULL COMMENT '插入时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-正常1-伪删除 2=客户端删除',
  `to_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收件人ID,0为全部会员',
  `from_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '发信人类型，0-管理员1-代理',
  `reply_id` int(10) NOT NULL DEFAULT '0' COMMENT '0-主体消息，其他为回复消息的ID',
  `server_admin` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '总代理',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='站内信主表';

-- ----------------------------
-- Records of web_message_text
-- ----------------------------
INSERT INTO `web_message_text` VALUES ('11', '1044', '1', '1', '2019-02-23 16:01:32', '1', '0', '0', '0', 'leapi');
INSERT INTO `web_message_text` VALUES ('12', '1043', '这个一条站内信', '这是站内信内容', '2019-02-23 16:37:29', '0', '0', '0', '0', 'leapi');
INSERT INTO `web_message_text` VALUES ('13', '1063', '这个一条站内信', '这是站内信内容', '2019-02-23 16:38:32', '0', '1061,1062', '0', '0', 'leapi');
INSERT INTO `web_message_text` VALUES ('14', '1046', '这个一条站内新嘻嘻嘻', '自定义固定的排序策略,该策略在任何排序操作中总是起效.可以通过对一个列的固定排序(可以是隐藏的列)来定义列表默认的排序策略.\r\n\r\n数组方式,定义优先排序策略,如:\r\n\r\n\"orderFixed\": [ 0, \'asc\' ]\r\n\r\n该参数说明无论如何排序,永远先进行第一列的正向排序.\r\n\r\n对象方式,可以利用关键字pre或post来定义这个规则是优先生效还是置后生效.', '2019-02-23 16:43:54', '0', '1063,1064', '0', '0', 'leapi');
INSERT INTO `web_message_text` VALUES ('15', '1045', 'hello', 'world', '2019-02-24 15:21:04', '1', '0', '0', '0', 'leapi');
INSERT INTO `web_message_text` VALUES ('31', '1032', '这个一条站内信', '哈哈哈，我測試一下', '2019-04-06 13:14:20', '1', '1032', '0', '13', 'leapi');

-- ----------------------------
-- Table structure for web_mg_bill
-- ----------------------------
DROP TABLE IF EXISTS `web_mg_bill`;
CREATE TABLE `web_mg_bill` (
  `key` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `colId` bigint(20) NOT NULL COMMENT '注单号',
  `type` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'mgsaspibet为投注mgsapiwin为赔付',
  `transactionTimestampDate` bigint(13) NOT NULL,
  `amount` decimal(11,2) NOT NULL,
  `mbrCode` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gameCasinoId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `afterTxWalletAmount` decimal(11,2) NOT NULL,
  `mgsGameId` int(4) NOT NULL,
  `gamePlatformType` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userid` int(11) NOT NULL,
  KEY `userid_idx` (`userid`) USING BTREE,
  KEY `time_idx` (`transactionTimestampDate`) USING BTREE,
  KEY `colld_idx` (`colId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='MG注单表';

-- ----------------------------
-- Records of web_mg_bill
-- ----------------------------
INSERT INTO `web_mg_bill` VALUES ('1001', '50673609528', 'mgsaspibet', '1538371147305', '3.00', 'cai6565', 'MGS_ImmortalRomance', '64.80', '1103', 'FLASH', '1062');
INSERT INTO `web_mg_bill` VALUES ('1001', '50673609529', 'mgsaspibet', '1538371149305', '3.00', 'cai6565', 'MGS_ImmortalRomance', '64.80', '1103', 'FLASH', '1062');
INSERT INTO `web_mg_bill` VALUES ('1001', '50673612120', 'mgsaspibet', '1538371154149', '3.00', 'cai6565', 'MGS_ImmortalRomance', '61.80', '1103', 'FLASH', '1062');
INSERT INTO `web_mg_bill` VALUES ('1001', '50673614379', 'mgsaspibet', '1538371160367', '3.00', 'cai6565', 'MGS_ImmortalRomance', '55.80', '1103', 'FLASH', '1062');
INSERT INTO `web_mg_bill` VALUES ('1001', '50673616410', 'mgsapiwin', '1538371165603', '0.50', 'cai6565', 'MGS_ImmortalRomance', '59.80', '1103', 'FLASH', '1062');
INSERT INTO `web_mg_bill` VALUES ('1001', '50673618399', 'mgsaspibet', '1538371170961', '3.00', 'cai6565', 'MGS_ImmortalRomance', '53.30', '1103', 'FLASH', '1062');
INSERT INTO `web_mg_bill` VALUES ('1001', '50673620312', 'mgsaspibet', '1538371175936', '3.00', 'cai6565', 'MGS_ImmortalRomance', '50.30', '1103', 'FLASH', '1062');
INSERT INTO `web_mg_bill` VALUES ('1001', '50673622035', 'mgsaspibet', '1538371180489', '3.00', 'cai6565', 'MGS_ImmortalRomance', '47.30', '1103', 'FLASH', '1062');
INSERT INTO `web_mg_bill` VALUES ('1001', '50673623827', 'mgsaspibet', '1538371185246', '3.00', 'cai6565', 'MGS_ImmortalRomance', '44.30', '1103', 'FLASH', '1062');
INSERT INTO `web_mg_bill` VALUES ('1001', '50673625594', 'mgsaspibet', '1538371189997', '3.00', 'cai6565', 'MGS_ImmortalRomance', '41.30', '1103', 'FLASH', '1062');
INSERT INTO `web_mg_bill` VALUES ('1001', '50673625595', 'mgsapiwin', '1538371190027', '3.00', 'cai6565', 'MGS_ImmortalRomance', '50.30', '1103', 'FLASH', '1062');
INSERT INTO `web_mg_bill` VALUES ('1001', '50673625596', 'mgsapiwin', '1538371290027', '3.00', 'cai6565', 'MGS_ImmortalRomance', '50.30', '1103', 'FLASH', '1062');

-- ----------------------------
-- Table structure for web_mg_bill_history
-- ----------------------------
DROP TABLE IF EXISTS `web_mg_bill_history`;
CREATE TABLE `web_mg_bill_history` (
  `key` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `colId` bigint(20) NOT NULL COMMENT '注单号',
  `type` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'mgsaspibet为投注mgsapiwin为赔付',
  `transactionTimestampDate` bigint(13) NOT NULL,
  `amount` decimal(11,2) NOT NULL,
  `mbrCode` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gameCasinoId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `afterTxWalletAmount` decimal(11,2) NOT NULL,
  `mgsGameId` int(4) NOT NULL,
  `gamePlatformType` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userid` int(11) NOT NULL,
  KEY `userid_idx` (`userid`) USING BTREE,
  KEY `time_idx` (`transactionTimestampDate`) USING BTREE,
  KEY `colld_idx` (`colId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='MG注单表';

-- ----------------------------
-- Records of web_mg_bill_history
-- ----------------------------
INSERT INTO `web_mg_bill_history` VALUES ('1001', '50673609528', 'mgsaspibet', '1538371147305', '3.00', 'cai6565', 'MGS_ImmortalRomance', '64.80', '1103', 'FLASH', '1062');
INSERT INTO `web_mg_bill_history` VALUES ('1001', '50673609529', 'mgsaspibet', '1538371149305', '3.00', 'cai6565', 'MGS_ImmortalRomance', '64.80', '1103', 'FLASH', '1062');
INSERT INTO `web_mg_bill_history` VALUES ('1001', '50673612120', 'mgsaspibet', '1538371154149', '3.00', 'cai6565', 'MGS_ImmortalRomance', '61.80', '1103', 'FLASH', '1062');
INSERT INTO `web_mg_bill_history` VALUES ('1001', '50673614379', 'mgsaspibet', '1538371160367', '3.00', 'cai6565', 'MGS_ImmortalRomance', '55.80', '1103', 'FLASH', '1062');
INSERT INTO `web_mg_bill_history` VALUES ('1001', '50673616410', 'mgsapiwin', '1538371165603', '0.50', 'cai6565', 'MGS_ImmortalRomance', '59.80', '1103', 'FLASH', '1062');
INSERT INTO `web_mg_bill_history` VALUES ('1001', '50673618399', 'mgsaspibet', '1538371170961', '3.00', 'cai6565', 'MGS_ImmortalRomance', '53.30', '1103', 'FLASH', '1062');
INSERT INTO `web_mg_bill_history` VALUES ('1001', '50673620312', 'mgsaspibet', '1538371175936', '3.00', 'cai6565', 'MGS_ImmortalRomance', '50.30', '1103', 'FLASH', '1062');
INSERT INTO `web_mg_bill_history` VALUES ('1001', '50673622035', 'mgsaspibet', '1538371180489', '3.00', 'cai6565', 'MGS_ImmortalRomance', '47.30', '1103', 'FLASH', '1062');
INSERT INTO `web_mg_bill_history` VALUES ('1001', '50673623827', 'mgsaspibet', '1538371185246', '3.00', 'cai6565', 'MGS_ImmortalRomance', '44.30', '1103', 'FLASH', '1062');
INSERT INTO `web_mg_bill_history` VALUES ('1001', '50673625594', 'mgsaspibet', '1538371189997', '3.00', 'cai6565', 'MGS_ImmortalRomance', '41.30', '1103', 'FLASH', '1062');
INSERT INTO `web_mg_bill_history` VALUES ('1001', '50673625595', 'mgsapiwin', '1538371190027', '3.00', 'cai6565', 'MGS_ImmortalRomance', '50.30', '1103', 'FLASH', '1062');
INSERT INTO `web_mg_bill_history` VALUES ('1001', '50673625596', 'mgsapiwin', '1538371290027', '3.00', 'cai6565', 'MGS_ImmortalRomance', '50.30', '1103', 'FLASH', '1062');

-- ----------------------------
-- Table structure for web_mg_games
-- ----------------------------
DROP TABLE IF EXISTS `web_mg_games`;
CREATE TABLE `web_mg_games` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `game_item_id` int(6) NOT NULL COMMENT '游戏item_id',
  `swa_app_id` int(11) NOT NULL DEFAULT '0' COMMENT '单钱包app_id',
  `h5_item_id` int(11) NOT NULL COMMENT '游戏h5id',
  `h5_app_id` int(11) NOT NULL COMMENT 'h5单钱包app',
  `game_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_cn` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `game_category` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `game_category2` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `game_category3` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `game_img` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片地址',
  `is_cn` tinyint(1) NOT NULL,
  `flash` tinyint(1) NOT NULL,
  `is_html5` tinyint(1) NOT NULL COMMENT '1是html',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=343 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='MG游戏种类';

-- ----------------------------
-- Records of web_mg_games
-- ----------------------------
INSERT INTO `web_mg_games` VALUES ('1', '1949', '1001', '1949', '1002', 'Diamond Empire', '钻石帝国', 'Video Slot', '0', '15', 'BTN_DiamondEmpire_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('2', '1948', '1001', '1948', '1002', 'Dream Date', '梦幻邂逅', 'Video Slot', '0', '243', 'BTN_DreamDate_ZH', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('3', '1302', '1001', '1302', '1002', '108 Heroes', '108好汉', 'Bonus Slot', '0', '15', 'BTN_108Heroes_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('4', '1897', '1001', '1897', '1002', '108 Heroes Multiplier Fortunes', '108好汉乘数财富', 'Video Slot', '0', '9', 'BTN_108HeroesMF_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('5', '1109', '1001', '0', '0', '3 Empires', '三國', 'Bonus Slot', '0', '40', 'BTN_3Empire_ZH', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('6', '1077', '1001', '0', '0', '4 Play Deuces Wild', '4手万能两点', 'Video Poker', '0', '', 'BTN_DeucesWild1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('7', '1276', '1001', '0', '0', '4 Play Double Joker', '4手双百搭', 'Video Poker', '0', '', 'BTN_DoubleJoker1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('8', '1149', '1001', '0', '0', '4 Play Joker Poker', '4手小丑扑克', 'Video Poker', '0', '', 'BTN_JokerPokerPowerPoker1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('9', '1035', '1001', '1035', '1002', '5 Reel Drive', '5卷的驱动器', 'Video Slot', '0', '9', 'BTN_5ReelDrive1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('10', '1010', '1001', '1010', '1002', 'Adventure Palace HD', '冒险宫殿', 'Video Slot', '0', '9', 'BTN_AdventurePalaceHD', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('11', '1246', '1001', '1246', '1002', 'Age of Discovery', '史地大发现', 'Bonus Slot', '0', '25', 'BTN_AgeofDiscovery3', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('12', '1155', '1001', '1155', '1002', 'Agent Jane Blonde', '特务珍金', 'Feature Slot', '0', '9', 'BTN_AgentJaneBlonde7', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('13', '1004', '1001', '1004', '1002', 'Alaskan Fishing', '阿拉斯加捕捞', 'Video Slot', '0', '243', 'BTN_AlaskanFishing1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('14', '1299', '1001', '0', '0', 'Alaxe in Zombieland', '亚里尸乐园', 'Bonus Slot', '0', '25', 'BTN_AlaxeInZombieland', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('15', '1248', '1001', '0', '0', 'American Roulette', '美国轮盘', 'Table', '0', '', 'BTN_USRoulette1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('16', '1304', '1001', '0', '0', 'Arctic Fortune', '极寒鸿运', 'Bonus Slot', '0', '1024', 'BTN_ArcticFortune1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('17', '1021', '1001', '0', '0', 'Ariana', '爱丽娜', 'Video Slot', '0', '25', 'BTN_Ariana_ZH', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('18', '1065', '1001', '0', '0', 'Around the World', '环游世界', 'Bonus Slot', '0', '20', 'BTN_AroundTheWorld', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('19', '1384', '1001', '1384', '1002', 'Asian Beauty', '亚洲美人', 'Video Slot', '0', '243', 'BTN_AsianBeauty1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('20', '1013', '1001', '1013', '1002', 'Avalon HD', '阿瓦隆', 'Video Slot', '0', '20', 'BTN_AvalonHD_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('21', '1079', '1001', '0', '0', 'Avalon II-L-Quest for the Grai', '阿瓦隆2', 'Bonus Slot', '0', '243', 'BTN_AvalonII', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('22', '1042', '1001', '0', '0', 'Baccarat', '百家乐', 'Table', '0', '', 'BTN_Baccarat2', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('23', '1329', '1001', '0', '0', 'Baccarat Gold', '百家乐黄金版', 'Table', '0', '', 'BTN_GoldSeries_Baccarat1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('24', '0', '0', '1257', '1002', 'Bars and Stripes', '美国酒吧', 'Video Slot', '0', '25', 'BTN_barsandstripes', '1', '0', '1');
INSERT INTO `web_mg_games` VALUES ('25', '1159', '1001', '1159', '1002', 'Basketball Star', '篮球巨星', 'Video Slot', '0', '243', 'BTN_BasketballStar_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('26', '1372', '1001', '0', '0', 'Battlestar Galactica', '太空堡垒', 'Feature Slot', '0', '243', 'BTN_BattlestarGalactica1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('27', '0', '0', '1263', '1002', 'Beach Babes', '沙滩宝贝', 'Video Slot', '0', '25', 'BTN_beachbabes', '1', '0', '1');
INSERT INTO `web_mg_games` VALUES ('28', '1890', '1001', '1890', '1002', 'Beautiful Bones', '美丽骷髅', 'Video Slot', '0', '243', 'BTN_BeautifulBones_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('29', '1076', '1001', '0', '0', 'Beer Fest', '啤酒巨星', 'Others', '0', '', 'BTN_BeerFest1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('30', '1367', '1001', '0', '0', 'Belissimo!', '超级厨王', 'Classic Slot', '0', '5', 'BTN_Belissimo17', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('31', '1337', '1001', '0', '0', 'Big 5 Blackjack Gold', '大五黄金21点', 'Table', '0', '', 'BTN_GoldSeries_BigFive1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('32', '1206', '1001', '0', '0', 'Big Break', '大破', 'Bonus Slot', '0', '15', 'BTN_BigBreak1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('33', '1140', '1001', '0', '0', 'Big Chef', '厨神', 'Video Slot', '0', '15', 'BTN_BigChef_ZH', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('34', '1399', '1001', '0', '0', 'Big Kahuna', '征服钱海', 'Bonus Slot', '0', '9', 'BTN_BigKahuna1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('35', '1256', '1001', '0', '0', 'Big Kahuna - Snakes & Ladders', '征服钱海-蛇与梯子', 'Video Slot', '0', '15', 'BTN_BigKahuna_SL1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('36', '1133', '1001', '1133', '1002', 'Big Top', '马戏篷', 'Video Slot', '0', '9', 'BTN_BigTop1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('37', '1290', '1001', '1290', '1002', 'Bikini Party', '比基尼派对', 'Video Slot', '0', '243', 'BTN_BikiniParty_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('38', '1073', '1001', '0', '0', 'Bingo Bonanza', '宾果富豪', 'Others', '0', '', 'BTN_BingoBonanza1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('39', '1375', '1001', '0', '0', 'Booty Time', '藏宝时间', 'Bonus Slot', '0', '25', 'BTN_BootyTime', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('40', '1344', '1001', '0', '0', 'Bowled Over', '击倒', 'Others', '0', '', 'BTN_BowledOver1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('41', '1229', '1001', '1229', '1002', 'Break Away', '冰球突破', 'Feature Slot', '0', '243', 'BTN_BreakAway1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('42', '1023', '1001', '1023', '1002', 'Break Da Bank', '抢银行', 'Classic Slot', '0', '5', 'BTN_BreakDaBank1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('43', '0', '0', '1360', '1002', 'Bridesmaids', '伴娘', 'Video Slot', '0', '40', 'BTN_Bridesmaids', '1', '0', '1');
INSERT INTO `web_mg_games` VALUES ('44', '1341', '1001', '0', '0', 'Bridezilla', '新娘吉拉', 'Bonus Slot', '0', '243', 'BTN_BrideZilla', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('45', '1050', '1001', '0', '0', 'Bubble Bonanza', '泡泡富豪', 'Others', '0', '', 'BTN_BubbleBonanza', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('46', '1718', '1001', '1718', '1002', 'Bulls Eye', '靶心', 'Classic Slot', '0', '1', 'BTN_Bullseye_Gameshow', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('47', '1402', '1001', '0', '0', 'Bunny Boiler', '兔子锅炉', 'Others', '0', '', 'BTN_BunnyBoiler1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('48', '1003', '1001', '0', '0', 'Bunny Boiler Gold', '黄金兔子锅炉', 'Others', '0', '', 'BTN_BunnyBoilerGold1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('49', '1318', '1001', '1318', '1002', 'Burning Desire', '燃烧的欲望', 'Video Slot', '0', '243', 'BTN_BurningDesire1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('50', '1173', '1001', '1173', '1002', 'Bush Telegraph', '丛林摇摆', 'Video Slot', '0', '15', 'BTN_BushTelegraph1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('51', '1204', '1001', '1204', '1002', 'Bust the Bank', '抢劫银行', 'Bonus Slot', '0', '243', 'BTN_BustTheBank1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('52', '0', '0', '1886', '1002', 'Candy Dreams', '梦果子乐园', 'Video Slot', '0', '720', 'BTN_CandyDreams_ZH', '1', '0', '1');
INSERT INTO `web_mg_games` VALUES ('53', '1117', '1001', '1117', '1002', 'Carnaval', '狂欢节', 'Video Slot', '0', '9', 'BTN_Carnaval2', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('54', '1181', '1001', '0', '0', 'Cash Clams', '现金蚬', 'Classic Slot', '0', '1', 'BTN_CashClams2', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('55', '1393', '1001', '1393', '1002', 'Cash Crazy', '财运疯狂', 'Classic Slot', '0', '1', 'BTN_CashCrazy9', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('56', '1178', '1001', '0', '0', 'Cashanova', '卡萨努瓦', 'Bonus Slot', '0', '30', 'BTN_Cashanova1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('57', '1366', '1001', '1366', '1002', 'Cashapillar', '昆虫派对', 'Video Slot', '0', '100', 'BTN_Cashapillar1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('58', '1396', '1001', '0', '0', 'Cashapillar Scratch Card', '昆虫派对(刮刮卡)', 'Others', '0', '', 'BTN_Cashapillar1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('59', '1197', '1001', '0', '0', 'Cashville', '挥金如土', 'Bonus Slot', '0', '20', 'BTN_Cashville1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('60', '1291', '1001', '1291', '1002', 'Centre Court', '中心球场', 'Video Slot', '0', '9', 'BTN_CentreCourt1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('61', '1106', '1001', '0', '0', 'Chain Mail', '锁子甲', 'Video Slot', '0', '20', 'BTN_ChainMail_ZH', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('62', '1879', '1001', '1879', '1002', 'Classic 243', '经典243', 'Video Slot', '0', '243', 'BTN_Classic243', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('63', '1187', '1001', '0', '0', 'Cool Buck', '运财酷儿', 'Classic Slot', '0', '5', 'BTN_CoolBuck1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('64', '1884', '1001', '1884', '1002', 'Cool Buck - 5 Reel', '运财酷儿-5卷轴', 'Video Slot', '0', '9', 'BTN_CoolBuck_5Reel_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('65', '1084', '1001', '1084', '1002', 'Cool Wolf', '酷狼', 'Feature Slot', '0', '243', 'BTN_CoolWolf3', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('66', '1016', '1001', '0', '0', 'Cosmic Cat', '宇宙猫', 'Classic Slot', '0', '1', 'BTN_CosmicCat1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('67', '1327', '1001', '1327', '1002', 'Couch Potato', '沙发土豆', 'Classic Slot', '0', '1', 'BTN_CouchPotato2', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('68', '1057', '1001', '0', '0', 'Crazy 80s', '疯狂的80年代', 'Video Slot', '0', '9', 'BTN_Crazy80s4', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('69', '1202', '1001', '1202', '1002', 'Crazy Chameleons', '疯狂变色龙', 'Video Slot', '0', '5', 'BTN_CrazyChameleons1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('70', '1075', '1001', '0', '0', 'Cricket Star', '板球明星', 'Video Slot', '0', '243', 'BTN_CricketStar', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('71', '1064', '1001', '0', '0', 'Crocodopolis', '鳄鱼建城邦', 'Video Slot', '0', '25', 'BTN_Crocodopolis', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('72', '1303', '1001', '0', '0', 'Crown and Anchor', '国际鱼虾蟹骰宝', 'Others', '0', '', 'BTN_CrownAndAnchor1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('73', '1174', '1001', '0', '0', 'Crypt Crusade', '地穴的远征', 'Others', '0', '', 'BTN_CryptCrusade1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('74', '1390', '1001', '0', '0', 'Crypt Crusade Gold', '黄金地穴的远征', 'Others', '0', '', 'BTN_CryptCrusadeGold1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('75', '1249', '1001', '0', '0', 'Cyberstud Poker', '网络扑克', 'Table', '0', '', 'BTN_Cyberstud1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('76', '1119', '1001', '0', '0', 'Dawn Of The Bread', '黎明的面包', 'Others', '0', '', 'BTN_DawnoftheBread1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('77', '1234', '1001', '1234', '1002', 'Deck The Halls', '闪亮的圣诞节？', 'Video Slot', '0', '30', 'BTN_DeckTheHalls1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('78', '1415', '1001', '1415', '1002', 'Deuces Wild', '万能两点', 'Video Poker', '0', '', 'BTN_DeucesWildPowerPoker1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('79', '1185', '1001', '0', '0', 'Dino Might', '恐龙迪诺', 'Bonus Slot', '0', '25', 'BTN_DinoMight1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('80', '1069', '1001', '0', '0', 'Doctor Love', '医生的爱', 'Video Slot', '0', '20', 'BTN_DrLove', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('81', '1082', '1001', '0', '0', 'Dogfather', '狗爸爸', 'Bonus Slot', '0', '20', 'BTN_Dogfather2', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('82', '1309', '1001', '1309', '1002', 'Dolphin Quest', '寻访海豚', 'Bonus Slot', '0', '50', 'BTN_DolphinQuest', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('83', '1240', '1001', '1240', '1002', 'Double Double Bonus', '换牌扑克', 'Video Poker', '0', '', 'BTN_DoubleDoubleBonus1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('84', '1416', '1001', '0', '0', 'Double Joker', '双百搭', 'Video Poker', '0', '', 'BTN_DoubleJokerPowerPoker1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('85', '1143', '1001', '0', '0', 'Double Magic', '双魔', 'Classic Slot', '0', '1', 'BTN_DoubleMagic1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('86', '1102', '1001', '1102', '1002', 'Double Wammy', '双重韦密', 'Classic Slot', '0', '1', 'BTN_DoubleWammy1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('87', '1319', '1001', '0', '0', 'Dr. Watts Up', '恐怖实验室', 'Bonus Slot', '0', '243', 'BTN_DrWattsUp1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('88', '1037', '1001', '1037', '1002', 'Dragon Dance', '舞龙', 'Video Slot', '0', '243', 'BTN_DragonDance_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('89', '1022', '1001', '0', '0', 'Dragons Fortune', '龙的鸿运', 'Others', '0', '', 'BTN_DragonsFortune1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('90', '1424', '1001', '1424', '1002', 'Dragonz', '幸运龙宝贝', 'Video Slot', '0', '243', 'BTN_Dragonz_sc', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('91', '1272', '1001', '0', '0', 'Drone Wars', '熊峰战争', 'Bonus Slot', '0', '25', 'BTN_DroneWars', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('92', '1236', '1001', '1236', '1002', 'Eagles Wings', '老鹰的翅膀', 'Bonus Slot', '0', '25', 'BTN_EaglesWings1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('93', '1104', '1001', '0', '0', 'Electric Diva', '雷电歌后', 'Bonus Slot', '0', '40', 'BTN_ElectricDiva_zh', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('94', '1040', '1001', '0', '0', 'Electro Bingo', '电宾果', 'Others', '0', '', 'BTN_ElectroBingo1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('95', '1137', '1001', '0', '0', 'Elementals', '水果怪兽', 'Feature Slot', '0', '20', 'BTN_Elementals2', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('96', '1895', '1001', '1895', '1002', 'EmotiCoins', '表情金币', 'Video Slot', '0', '30', 'BTN_EmotiCoins_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('97', '1882', '1001', '1882', '1002', 'Emperor of The Sea', '青龙出海', 'Video Slot', '0', '88', 'BTN_EmperorOfTheSea_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('98', '1292', '1001', '0', '0', 'Enchanted Woods', '魔法森林', 'Video Slot', '0', '1', 'BTN_EnchantedWoods1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('99', '1199', '1001', '0', '0', 'European Roulette Gold', '欧式轮盘黄金桌', 'Table', '0', '', 'BTN_GoldSeries_EuroRoulette1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('100', '1017', '1001', '0', '0', 'Fantastic 7s', '奇妙7', 'Classic Slot', '0', '1', 'BTN_FantasticSevens1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('101', '1125', '1001', '0', '0', 'Fat Lady Sings', '胖女人辛斯', 'Video Slot', '0', '25', 'BTN_FatLadySings1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('102', '1113', '1001', '1113', '1002', 'Fish Party', '派对鱼', 'Feature Slot', '0', '243', 'BTN_FishParty', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('103', '1192', '1001', '0', '0', 'Flying Ace', '超级飞行员', 'Classic Slot', '0', '5', 'BTN_FlyingAce2', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('104', '1316', '1001', '0', '0', 'Foamy Fortunes', '泡沫财富', 'Others', '0', '', 'BTN_FoamyFortunes1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('105', '1186', '1001', '1186', '1002', 'Football Star', '足球明星', 'Video Slot', '0', '243', 'BTN_footballstar1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('106', '1887', '1001', '1887', '1002', 'Forbidden Throne', '禁忌王座', 'Video Slot', '0', '40', 'BTN_ForbiddenThrone', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('107', '1282', '1001', '0', '0', 'Fortune Cookie', '幸运曲奇', 'Classic Slot', '0', '1', 'BTN_FortuneCookie7', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('108', '1888', '1001', '1888', '1002', 'Fortune Girl', '金库甜心', 'Video Slot', '0', '15', 'BTN_FortuneGirl_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('109', '1237', '1001', '0', '0', 'Four by Four', '四乘四', 'Others', '0', '', 'BTN_FourByFour1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('110', '1015', '1001', '0', '0', 'Freezing Fuzzballs', '冻结模糊球', 'Others', '0', '', 'BTN_FreezingFuzzballs1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('111', '1288', '1001', '0', '0', 'French Roulette', '法式轮盘', 'Table', '0', '', 'BTN_FrenchRoulette1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('112', '1165', '1001', '1165', '1002', 'Frozen Diamonds', '急冻钻石', 'Video Slot', '0', '20', 'BTN_FrozenDiamonds', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('113', '1943', '1001', '1943', '1002', 'Fruit Blast', '水果大爆发', 'Others', '0', '', 'BTN_FruitBlast_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('114', '1285', '1001', '0', '0', 'Fruit Slots', '水果老虎机', 'Classic Slot', '0', '1', 'BTN_FruitSlots1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('115', '1878', '1001', '1878', '1002', 'Fruit Vs Candy', '水果VS糖果', 'Video Slot', '0', '243', 'BTN_FruitVsCandy_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('116', '1311', '1001', '0', '0', 'Galacticons', '银河舰队', 'Feature Slot', '0', '243', 'BTN_Galacticons', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('117', '1089', '1001', '0', '0', 'Game Set And Scratch', '网球最终局', 'Others', '0', '', 'BTN_GameSetandScratch1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('118', '1945', '1001', '1945', '1002', 'Gems Odyssey', '宝石奥德赛', 'Others', '0', '', 'BTN_GemsOdyssey_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('119', '1083', '1001', '0', '0', 'Genies Gems', '精灵宝石', 'Video Slot', '0', '5', 'BTN_GeniesGems2', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('120', '1259', '1001', '0', '0', 'Germinator', '细菌对对碰', 'Others', '0', '', 'BTN_Germinator1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('121', '1225', '1001', '0', '0', 'Gift Rap', '礼品包装', 'Bonus Slot', '0', '25', 'BTN_GiftRap2', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('122', '1322', '1001', '0', '0', 'Girls With Guns-L-Frozen Dawn', '女孩与枪II', 'Bonus Slot', '0', '243', 'BTN_GirlswithGuns2', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('123', '1313', '1001', '1313', '1002', 'Girls With Guns-L-Jungle Heat', '美女枪手丛林激战', 'Bonus Slot', '0', '243', 'BTN_GirlswithGuns1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('124', '1900', '1001', '1900', '1002', 'Gnome Wood', '矮木头', 'Video Slot', '0', '25', 'BTN_GnomeWood_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('125', '1066', '1001', '0', '0', 'Gold Coast', '黄金海岸', 'Classic Slot', '0', '5', 'BTN_GoldCoast3', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('126', '1267', '1001', '1267', '1002', 'Gold Factory', '黄金工厂', 'Feature Slot', '0', '50', 'BTN_GoldFactory_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('127', '1138', '1001', '0', '0', 'Golden Dragon', '黄金龙', 'Classic Slot', '0', '5', 'BTN_GoldenDragon6', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('128', '1041', '1001', '1041', '1002', 'Golden Era', '黄金时代', 'Video Slot', '0', '15', 'BTN_GoldenEra', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('129', '1044', '1001', '0', '0', 'Golden Ghouls', '黄金食尸鬼', 'Others', '0', '', 'BTN_GoldenGhouls1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('130', '1190', '1001', '1190', '1002', 'Golden Princess', '黄金公主', 'Video Slot', '0', '25', 'BTN_GoldenPrincess', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('131', '1055', '1001', '0', '0', 'Good To Go', '疯狂赛道', 'Feature Slot', '0', '9', 'BTN_GoodToGo2', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('132', '1216', '1001', '1216', '1002', 'Gopher Gold', '黄金囊地鼠', 'Video Slot', '0', '5', 'BTN_GopherGold2', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('133', '1112', '1001', '0', '0', 'Granny Prix', '老太太赛车', 'Others', '0', '', 'BTN_GrannyPrix1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('134', '1347', '1001', '0', '0', 'Great Griffin', '大狮鹫', 'Video Slot', '0', '50', 'BTN_GreatGriffin1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('135', '1182', '1001', '0', '0', 'Hairy Fairies', '毛茸茸的仙女', 'Others', '0', '', 'BTN_HairyFairies1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('136', '1904', '1001', '1904', '1002', 'Halloween', '万圣劫', 'Video Slot', '0', '50', 'BTN_Halloween', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('137', '1047', '1001', '1047', '1002', 'Halloweenies', '万圣节', 'Video Slot', '0', '20', 'BTN_Halloweenies1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('138', '1014', '1001', '0', '0', 'Halloweenies(Scratch Card)', '万圣节(刮刮卡)', 'Others', '0', '', 'BTN_Halloweenies1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('139', '1086', '1001', '0', '0', 'Hand to Hand Combat', '肉搏战', 'Others', '0', '', 'BTN_HandToHandCombat1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('140', '1072', '1001', '1072', '1002', 'Happy Holidays', '快乐假日', 'Video Slot', '0', '243', 'BTN_HappyHolidays_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('141', '1145', '1001', '0', '0', 'Happy New Year', '新年快乐', 'Classic Slot', '0', '5', 'BTN_HappyNewYear3', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('142', '1139', '1001', '0', '0', 'Harveys', '哈维斯的晚餐', 'Feature Slot', '0', '25', 'BTN_Harveys1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('143', '1081', '1001', '1081', '1002', 'Hellboy', '地狱男爵', 'Bonus Slot', '0', '20', 'BTN_HellBoy1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('144', '1252', '1001', '0', '0', 'Hells Grannies', '地狱阿嬷', 'Bonus Slot', '0', '25', 'BTN_HellGrannies', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('145', '1335', '1001', '0', '0', 'Hexaline', '六线', 'Others', '0', '', 'BTN_Hexaline1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('146', '1265', '1001', '0', '0', 'High Limit Baccarat', '高限制百家乐', 'Table', '0', '', 'BTN_HighLimitBaccarat1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('147', '1163', '1001', '1163', '1002', 'High Society', '上流社会', 'Bonus Slot', '0', '25', 'BTN_HighSociety', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('148', '1203', '1001', '0', '0', 'High Speed Poker', '高速扑克', 'Table', '0', '', 'BTN_GoldSeries_MHHighSpeedPoker1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('149', '1909', '1001', '1909', '1002', 'Highlander', '时空英豪', 'Video Slot', '0', '243', 'BTN_Highlander_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('150', '1321', '1001', '1321', '1002', 'HitMan', '终极杀手', 'Video Slot', '0', '15', 'BTN_Hitman1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('151', '1296', '1001', '0', '0', 'Ho Ho Ho', '嗬嗬嗬', 'Feature Slot', '0', '15', 'BTN_Hohoho1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('152', '1910', '1001', '1910', '1002', 'Holly Jolly Penguins', '圣诞企鹅', 'Video Slot', '0', '45', 'BTN_HollyJollyPenguins_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('153', '1261', '1001', '0', '0', 'Hot as Hades', '地府烈焰', 'Video Slot', '0', '20', 'BTN_HotAsHades_ZH', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('154', '1376', '1001', '0', '0', 'Hot Ink', '神奇墨水', 'Feature Slot', '0', '1024', 'BTN_HotInk1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('155', '1177', '1001', '0', '0', 'Hot Shot', '棒球直击', 'Video Slot', '0', '9', 'BTN_HotShot3', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('156', '1063', '1001', '0', '0', 'Hound Hotel', '酷犬酒店', 'Video Slot', '0', '25', 'BTN_HoundHotel_ZH', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('157', '1067', '1001', '0', '0', 'House of Dragons', '龙之家', 'Bonus Slot', '0', '20', 'BTN_HouseofDragons', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('158', '1849', '1001', '1849', '1002', 'Huangdi - The Yellow Emperor', '轩辕帝传', 'Video Slot', '0', '25', 'BTN_Huangdi_TheYellowEmperor_zh', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('159', '1103', '1001', '1103', '1002', 'Immortal Romance', '不朽情缘', 'Video Slot', '0', '243', 'BTN_ImmortalRomance1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('160', '1331', '1001', '0', '0', 'Instant Win Card Selector', '刮刮卡20合一', 'Others', '0', '', 'BTN_InstantWinCardSelector1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('161', '1361', '1001', '0', '0', 'Irish E1', '爱尔兰眼睛', 'Video Slot', '0', '25', 'BTN_IrishEyes', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('162', '0', '0', '1250', '1002', 'Isis', '埃及女神伊西絲', 'Video Slot', '0', '25', 'BTN_isis', '1', '0', '1');
INSERT INTO `web_mg_games` VALUES ('163', '1071', '1001', '0', '0', 'Jackpot Express', '累计奖金快车', 'Classic Slot', '0', '5', 'BTN_JackpotExpress1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('164', '1068', '1001', '0', '0', 'Jekyll And Hyde', '判若两人', 'Bonus Slot', '0', '243', 'BTN_JekyllandHyde', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('165', '1941', '1001', '1941', '1002', 'Jewel Quest Riches', '宝石探秘财富加倍', 'Others', '0', '', 'BTN_JewelQuestRiches_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('166', '1005', '1001', '0', '0', 'Jewels of the Orient Video Slo', '东方珠宝', 'Bonus Slot', '0', '9', 'BTN_JewelsoftheOrient1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('167', '1205', '1001', '0', '0', 'Jingle Bells', '铃儿响叮当', 'Classic Slot', '0', '5', 'BTN_JingleBells', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('168', '1418', '1001', '0', '0', 'Joker Poker', '小丑扑克', 'Video Poker', '0', '', 'BTN_JokerPoker1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('169', '1244', '1001', '1244', '1002', 'Jungle Jim EL Dorado', '丛林吉姆-黄金国', 'Video Slot', '0', '25', 'BTN_Junglejim_zh', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('170', '1297', '1001', '0', '0', 'Jurassic Jackpot', '侏罗纪大奖', 'Classic Slot', '0', '1', 'BTN_JurassicJackpot1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('171', '1891', '1001', '1891', '1002', 'Jurassic World', '侏罗纪世界', 'Video Slot', '0', '243', 'BTN_JurassicWorld', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('172', '1053', '1001', '1053', '1002', 'Karaoke Party', 'K歌乐韵', 'Video Slot', '0', '15', 'BTN_KaraokeParty_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('173', '1258', '1001', '0', '0', 'Karate Pig', '功夫小胖猪', 'Video Slot', '0', '40', 'BTN_KaratePig1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('174', '1151', '1001', '1151', '1002', 'Kathmandu', '卡萨缦都', 'Video Slot', '0', '9', 'BTN_Kathmandu1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('175', '1262', '1001', '0', '0', 'Keno', '基诺', 'Others', '0', '', 'BTN_Keno3', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('176', '1048', '1001', '0', '0', 'King Arthur', '亚瑟王', 'Bonus Slot', '0', '20', 'BTN_KingArthur', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('177', '1908', '1001', '1908', '1002', 'King Tusk', '大象之王', 'Video Slot', '0', '25', 'BTN_KingTusk_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('178', '1400', '1001', '0', '0', 'Kings of Cash', '现金之王', 'Video Slot', '0', '15', 'BTN_KingsofCash1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('179', '1286', '1001', '0', '0', 'Kitty Cabana', '凯蒂卡巴拉', 'Video Slot', '0', '25', 'BTN_KittyCabana_ZH', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('180', '1389', '1001', '1389', '1002', 'Ladies Nite', '女仕之夜', 'Video Slot', '0', '9', 'BTN_LadiesNite5', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('181', '1124', '1001', '1124', '1002', 'Lady in Red', '红衣女郎', 'Video Slot', '0', '25', 'BTN_LadyInRed2', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('182', '1378', '1001', '0', '0', 'Leagues Of Fortune', '财富阶级', 'Bonus Slot', '0', '1024', 'BTN_LeaguesOfFortune1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('183', '1279', '1001', '0', '0', 'Legacy', '遗产L', 'Classic Slot', '0', '5', 'BTN_Legacy2', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('184', '1851', '1001', '1851', '1002', 'Life of Riches', '富裕人生', 'Video Slot', '0', '30', 'BTN_LifeOfRiches_zh', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('185', '0', '0', '1049', '1002', 'Lion\'ride', '狮子的骄傲', 'Video Slot', '0', '100', 'BTN_LionsPride', '1', '0', '1');
INSERT INTO `web_mg_games` VALUES ('186', '1245', '1001', '1245', '1002', 'Loaded', '炫富一族', 'Bonus Slot', '0', '25', 'BTN_Loaded1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('187', '1135', '1001', '0', '0', 'Loose Cannon', '海盗王', 'Bonus Slot', '0', '243', 'BTN_LooseCannon1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('188', '1420', '1001', '1420', '1002', 'Lost Vegas', '迷失拉斯维加斯', 'Video Slot', '0', '243', 'BTN_LostVegas_zh', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('189', '1059', '1001', '0', '0', 'Louisiana Double', '路易斯安那双', 'Video Poker', '0', '', 'BTN_LouisianaDouble1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('190', '1126', '1001', '0', '0', 'Lucky Firecracker', '招财鞭炮', 'Video Slot', '0', '243', 'BTN_LuckyFirecracker', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('191', '1060', '1001', '1060', '1002', 'Lucky Koi', '幸运的锦鲤', 'Bonus Slot', '0', '25', 'BTN_LuckyKoi', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('192', '1212', '1001', '0', '0', 'Lucky Leprechaun', '幸运的小妖精', 'Video Slot', '0', '20', 'BTN_LuckyLeprechaun', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('193', '1235', '1001', '0', '0', 'Lucky Leprechaun’s Loot', '妖精的战利品', 'Bonus Slot', '0', '50', 'BTN_LuckyLeprechaunsLoot', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('194', '1944', '1001', '1944', '1002', 'Lucky Little Gods', '宝贝财神', 'Video Slot', '0', '243', 'BTN_LuckyLittleGods_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('195', '1224', '1001', '0', '0', 'Lucky Numbers', '幸运数字', 'Others', '0', '', 'BTN_LuckyNumbers1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('196', '1283', '1001', '1283', '1002', 'Lucky Twins', '幸运双星', 'Video Slot', '0', '9', 'BTN_luckyTwins_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('197', '1129', '1001', '0', '0', 'Lucky Witch', '幸运女巫', 'Feature Slot', '0', '15', 'BTN_LuckyWitch1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('198', '1273', '1001', '1273', '1002', 'Lucky Zodiac', '幸运生肖', 'Video Slot', '0', '20', 'BTN_LuckyZodiac_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('199', '1314', '1001', '1314', '1002', 'Mad Hatters', '疯狂的帽子', 'Video Slot', '0', '30', 'BTN_MadHatters1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('200', '1115', '1001', '0', '0', 'Max Damage', '终极破坏', 'Video Slot', '0', '243', 'BTN_MaxDamageSlot', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('201', '1223', '1001', '0', '0', 'Max Damage and The Alien Attac', '星战传奇', 'Others', '0', '', 'BTN_MaxDamage1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('202', '1061', '1001', '0', '0', 'Mayan Bingo', '玛雅宾果', 'Others', '0', '', 'BTN_MayanBingo1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('203', '1343', '1001', '1343', '1002', 'Mayan Princess', '玛雅公主', 'Feature Slot', '0', '20', 'BTN_MayanPrincess1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('204', '1885', '1001', '1885', '1002', 'Mega Money Multiplier', '巨额现金乘数', 'Video Slot', '0', '9', 'BTN_MegaMoneyMultiplier_Zh', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('205', '1942', '1001', '1942', '1002', 'Mega Money Rush', '巨款大冲击', 'Others', '0', '', 'BTN_MegaMoneyRush_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('206', '1308', '1001', '1308', '1002', 'Mermaids Millions', '海底世界', 'Video Slot', '0', '15', 'BTN_MermaidsMillions1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('207', '1905', '1001', '1905', '1002', 'Moby Dick', '白鲸记', 'Video Slot', '0', '25', 'BTN_MobyDick', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('208', '1184', '1001', '0', '0', 'Money Mad Monkey', '疯狂的猴子', 'Bonus Slot', '0', '20', 'BTN_MoneyMadMonkey1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('209', '1269', '1001', '0', '0', 'Monkey Keno', '猴子基诺', 'Others', '0', '', 'BTN_MonkeyKeno_ZH', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('210', '1006', '1001', '0', '0', 'Monster Mania', '怪物躁狂症', 'Video Slot', '0', '9', 'BTN_MonsterMania1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('211', '1903', '1001', '1903', '1002', 'Monster Wheels', '怪物赛车', 'Video Slot', '0', '288', 'BTN_MonsterWheels_BTN_Rollover_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('212', '1007', '1001', '0', '0', 'Moonshine', '月光', 'Bonus Slot', '0', '25', 'BTN_Moonshine1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('213', '1158', '1001', '0', '0', 'Mount Olympus', '奥林匹斯山', 'Bonus Slot', '0', '25', 'BTN_MountOlympus', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('214', '1338', '1001', '0', '0', 'Mugshot Madness', '疯狂假面', 'Feature Slot', '0', '20', 'BTN_MugshotMadness1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('215', '1090', '1001', '0', '0', 'Multi Wheel Roulette Gold', '复式黄金轮盘', 'Table', '0', '', 'BTN_GoldSeries_MultiWheelRoulette1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('216', '1353', '1001', '0', '0', 'Mumbai Magic', '孟买魔术', 'Others', '0', '', 'BTN_MumbaiMagic1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('217', '1008', '1001', '1008', '1002', 'Munchkins', '怪兽曼琪肯', 'Feature Slot', '0', '15', 'BTN_Munchkins2', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('218', '1254', '1001', '1254', '1002', 'Mystic Dreams', '神秘梦境', 'Video Slot', '0', '243', 'BTN_MysticDreams1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('219', '1371', '1001', '0', '0', 'Mystique Grove', '神秘森林', 'Bonus Slot', '0', '243', 'BTN_MystiqueGrove', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('220', '1315', '1001', '0', '0', 'Ninja Magic', '忍者法宝', 'Bonus Slot', '0', '40', 'BTN_NinjaMagic_zh', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('221', '1340', '1001', '0', '0', 'Octopays', '章鱼', 'Feature Slot', '0', '243', 'BTN_Octopays', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('222', '1078', '1001', '0', '0', 'Offside And Seek', '临门一脚', 'Others', '0', '', 'BTN_OffsideandSeek1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('223', '1896', '1001', '1896', '1002', 'Oink Country Love', '呼撸撸爱上乡下', 'Bonus Slot', '0', '45', 'BTN_OinkCountryLove_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('224', '1221', '1001', '0', '0', 'Oriental Fortune', '东方财富', 'Video Slot', '0', '5', 'BTN_OrientalFortune2', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('225', '1334', '1001', '0', '0', 'Paradise Found', '发现天堂', 'Bonus Slot', '0', '20', 'BTN_ParadiseFound', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('226', '1147', '1001', '1147', '1002', 'Peek-a-boo', '躲猫猫', 'Video Slot', '0', '40', 'BTN_PeekABoo_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('227', '1251', '1001', '0', '0', 'Phantom Cash', '幻影现金', 'Bonus Slot', '0', '25', 'BTN_PhantomCash', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('228', '1260', '1001', '0', '0', 'Pharaoh Bingo', '法老宾果', 'Others', '0', '', 'BTN_PharaohBingo1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('229', '1355', '1001', '0', '0', 'Pharoah\'s Gems', '隔离的宝石', 'Others', '0', '', 'BTN_PharoahsGems1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('230', '1101', '1001', '0', '0', 'Piggy Fortunes', '小猪财富', 'Bonus Slot', '0', '25', 'BTN_PiggyFortunes', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('231', '1160', '1001', '1160', '1002', 'Pistoleras', '持枪王者', 'Video Slot', '0', '25', 'BTN_Pistoleras_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('232', '1188', '1001', '1188', '1002', 'Playboy', '花花公子', 'Bonus Slot', '0', '243', 'BTN_Playboy', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('233', '1946', '1001', '1946', '1002', 'Playboy Gold', '黄金花花公子', 'Others', '0', '100', 'BTN_PlayboyGold_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('234', '1226', '1001', '0', '0', 'Plunder The Sea', '掠夺之海', 'Others', '0', '', 'BTN_PlundertheSea1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('235', '1369', '1001', '0', '0', 'Poker Pursuit', '扑克追求', 'Video Poker', '0', '', 'BTN_PokerPursuit1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('236', '1176', '1001', '0', '0', 'Pollen Nation', '蜜蜂乐园', 'Bonus Slot', '0', '25', 'BTN_PollenNation1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('237', '1881', '1001', '1881', '1002', 'Pollen Party', '花粉之国', 'Video Slot', '0', '720', 'BTN_PollenParty_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('238', '1033', '1001', '0', '0', 'Premier Racing', '超级赛马', 'Others', '0', '', 'BTN_PremierRacing1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('239', '1233', '1001', '0', '0', 'Premier Roulette', '轮盘', 'Table', '0', '', 'BTN_PremierRoulette9', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('240', '1213', '1001', '0', '0', 'Premier Roulette Diamond Editi', '轮盘钻石版', 'Table', '0', '', 'BTN_PremierRouletteDE1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('241', '1107', '1001', '0', '0', 'Premier Trotting', '超级马车赛', 'Others', '0', '', 'BTN_PremierTrotting1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('242', '1045', '1001', '1045', '1002', 'Pretty Kitty', '漂亮猫咪', 'Video Slot', '0', '243', 'BTN_prettykitty_zh', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('243', '1024', '1001', '0', '0', 'Prime Property', '优质物业', 'Bonus Slot', '0', '40', 'BTN_PrimeProperty1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('244', '1312', '1001', '1312', '1002', 'Pure Platinum', '纯铂', 'Video Slot', '0', '40', 'BTN_PurePlatinum1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('245', '1275', '1001', '0', '0', 'Rabbit in the Hat', '帽子里的兔子', 'Video Slot', '0', '9', 'BTN_RabbitintheHat', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('246', '1195', '1001', '0', '0', 'Racing For Pinks', '为粉红而战', 'Bonus Slot', '0', '243', 'BTN_RacingForPinks', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('247', '1362', '1001', '0', '0', 'Ramesses Riches', '拉美西斯的财富', 'Video Slot', '0', '20', 'BTN_RamessesRiches', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('248', '1278', '1001', '0', '0', 'Rapid Reels', '急速转轮', 'Classic Slot', '0', '5', 'BTN_RapidReels5', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('249', '1247', '1001', '0', '0', 'Red Hot Devil', '红唇诱惑', 'Video Slot', '0', '25', 'BTN_RedHotDevil', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('250', '1207', '1001', '1207', '1002', 'Reel Gems', '宝石迷阵', 'Feature Slot', '0', '243', 'BTN_ReelGems1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('251', '1294', '1001', '1294', '1002', 'Reel Spinner', '旋转大战', 'Video Slot', '0', '15', 'BTN_ReelSpinner_zh', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('252', '1157', '1001', '1157', '1002', 'Reel Strike', '卷行使价', 'Feature Slot', '0', '15', 'BTN_ReelStrike1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('253', '1293', '1001', '1293', '1002', 'Reel Thunder', '雷电击', 'Video Slot', '0', '9', 'BTN_ReelThunder2', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('254', '1110', '1001', '1110', '1002', 'Retro Reels', '复古旋转', 'Feature Slot', '0', '20', 'BTN_RetroReels1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('255', '1189', '1001', '1189', '1002', 'Retro Reels - Extreme Heat', '复古卷轴-极热', 'Feature Slot', '0', '30', 'BTN_RRExtreme1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('256', '1100', '1001', '1100', '1002', 'Retro Reels Diamond Glitz', '复古卷轴钻石耀眼', 'Feature Slot', '0', '25', 'BTN_RRDiamondGlitz1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('257', '1009', '1001', '1009', '1002', 'Rhyming Reels - Hearts & Tarts', '押韵的卷轴-心挞', 'Feature Slot', '0', '30', 'BTN_RRHearts&Tarts1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('258', '1359', '1001', '0', '0', 'Riviera Riches', '海滨财富', 'Feature Slot', '0', '15', 'BTN_RivieraRiches1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('259', '1132', '1001', '0', '0', 'Robo Jack', '洛伯杰克', 'Bonus Slot', '0', '243', 'BTN_robojack1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('260', '1305', '1001', '0', '0', 'Rock The Boat', '摇滚船', 'Classic Slot', '0', '1', 'BTN_RocktheBoat18', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('261', '1146', '1001', '0', '0', 'Roller Derby', '滚德比', 'Bonus Slot', '0', '25', 'BTN_RollerDerby', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('262', '1377', '1001', '0', '0', 'Roman Riches', '罗马财富', 'Classic Slot', '0', '5', 'BTN_RomanRiches11', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('263', '1287', '1001', '1287', '1002', 'Rugby Star', '橄榄球明星', 'Video Slot', '0', '243', 'BTN_RugbyStar_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('264', '1156', '1001', '0', '0', 'Samba Bingo', '萨巴宾果', 'Others', '0', '', 'BTN_SambaBingo1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('265', '1095', '1001', '1095', '1002', 'Santas Wild Ride', '圣诞老人的百搭摩拖车', 'Bonus Slot', '0', '243', 'BTN_SantasWildRide1_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('266', '1030', '1001', '1030', '1002', 'Scrooge', '小气财神', 'Video Slot', '0', '50', 'BTN_Scrooge1_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('267', '1325', '1001', '0', '0', 'Secret Admirer', '秘密崇拜者', 'Feature Slot', '0', '9', 'BTN_SecretAdmirer1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('268', '1877', '1001', '1877', '1002', 'Secret Romance', '秘密爱慕者', 'Video Slot', '0', '15', 'BTN_SecretRomance_1_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('269', '1381', '1001', '0', '0', 'Secret Santa', '圣诞老人的秘密', 'Bonus Slot', '0', '1024', 'BTN_SecretSanta', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('270', '1300', '1001', '0', '0', 'Serenity', '宁静', 'Video Slot', '0', '15', 'BTN_Serenity_ZH', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('271', '0', '0', '1421', '1002', 'Shanghai Beauty', '上海美人', 'Video Slot', '0', '9', 'BTN_ShanghaiBeauty', '1', '0', '1');
INSERT INTO `web_mg_games` VALUES ('272', '1274', '1001', '1274', '1002', 'Shoot!', '射击', 'Bonus Slot', '0', '50', 'BTN_Shoot', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('273', '1062', '1001', '1062', '1002', 'Silver Fang', '银芳', 'Feature Slot', '0', '50', 'BTN_SilverFang1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('274', '1892', '1001', '1892', '1002', 'Six Acrobats', '杂技群英会', 'Video Slot', '0', '9', 'BTN_SixAcrobats_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('275', '1196', '1001', '0', '0', 'Slam Funk', '猛撞恐惧', 'Others', '0', '', 'BTN_SlamFunk1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('276', '1001', '1001', '1001', '1002', 'So Many Monsters', '怪兽多多', 'Video Slot', '0', '25', 'BTN_somanymonsters', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('277', '1218', '1001', '0', '0', 'Soccer Safari', '动物足球', 'Bonus Slot', '0', '30', 'BTN_SoccerSafari1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('278', '1231', '1001', '0', '0', 'Space Evader', '太空逃避物', 'Others', '0', '', 'BTN_SpaceEvader1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('279', '1336', '1001', '0', '0', 'Space Evader Gold', '太空逃避物黄金版', 'Others', '0', '', 'BTN_SpaceEvaderGold1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('280', '1031', '1001', '0', '0', 'Spectacular Wheel of Wealth', '财富之轮', 'Classic Slot', '0', '1', 'BTN_SpectacularWheelOfWealth1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('281', '1217', '1001', '0', '0', 'Spingo', '我推', 'Others', '0', '', 'BTN_Spingo', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('282', '1002', '1001', '1002', '1002', 'Spring Break', '春假', 'Video Slot', '0', '9', 'BTN_SpringBreak2', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('283', '1404', '1001', '1404', '1002', 'Stardust', '星尘', 'Video Slot', '0', '40', 'BTN_StarDust_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('284', '1118', '1001', '0', '0', 'Starscape', '星云', 'Bonus Slot', '0', '25', 'BTN_StarScape1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('285', '1320', '1001', '1320', '1002', 'Stash of the Titans', '泰坦之藏匿', 'Video Slot', '0', '20', 'BTN_StashoftheTitans1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('286', '1162', '1001', '0', '0', 'Steam Punk Heroes', '蒸汽朋克英雄', 'Bonus Slot', '0', '25', 'BTN_SteamPunkHeroes', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('287', '0', '0', '1170', '1002', 'Sterling Silver', '纯银', 'Video Slot', '0', '25', 'BTN_SterlingSilver3D1', '1', '0', '1');
INSERT INTO `web_mg_games` VALUES ('288', '1317', '1001', '0', '0', 'Sterling Silver 3D', '纯银3D', 'Bonus Slot', '0', '25', 'BTN_SterlingSilver3D1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('289', '1893', '1001', '1893', '1002', 'Sugar Parade', '糖果巡游', 'Video Slot', '0', '15', 'BTN_SugarParade_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('290', '1130', '1001', '1130', '1002', 'Summertime', '夏天', 'Video Slot', '0', '9', 'BTN_summertime', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('291', '1127', '1001', '1127', '1002', 'SunQuest', '探索太阳', 'Video Slot', '0', '9', 'BTN_SunQuest3', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('292', '1150', '1001', '1150', '1002', 'SunTide', '太阳征程', 'Video Slot', '0', '9', 'BTN_SunTide_Button_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('293', '1289', '1001', '0', '0', 'Supe it Up', '跑起来', 'Video Slot', '0', '25', 'BTN_SupeItUp2', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('294', '1029', '1001', '0', '0', 'Super Zeroes', '超级零点', 'Others', '0', '', 'BTN_SuperZeroes1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('295', '1039', '1001', '0', '0', 'Surf Safari', '动物冲浪', 'Bonus Slot', '0', '243', 'BTN_SurfSafari', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('296', '1153', '1001', '0', '0', 'Sweet Harvest', '甜蜜的收获', 'Video Slot', '0', '20', 'BTN_SweetHarvest1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('297', '1395', '1001', '1395', '1002', 'Tally Ho', '泰利嗬', 'Video Slot', '0', '9', 'BTN_TallyHo1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('298', '1847', '1001', '1847', '1002', 'Tarzan', '泰山', 'Video Slot', '0', '40', 'BTN_Tarzan_Button_en', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('299', '1070', '1001', '0', '0', 'Terminator 2', '终结者2', 'Bonus Slot', '0', '243', 'BTN_Terminator2', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('300', '0', '0', '1169', '1002', 'The Grand Journey', '冒险之旅', 'Video Slot', '0', '30', 'BTN_thegrandjourney_1', '1', '0', '1');
INSERT INTO `web_mg_games` VALUES ('301', '1883', '1001', '1883', '1002', 'The Heat Is On', '热力四射', 'Video Slot', '0', '45', 'BTN_TheHeatIsOn', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('302', '1121', '1001', '0', '0', 'The Lost Princess Anastasia', '失落的阿纳斯塔西娅公', 'Bonus Slot', '0', '25', 'BTN_TheLostPrincessAnastasia', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('303', '1906', '1001', '1906', '1002', 'The Phantom Of The Opera', '歌剧魅影', 'Video Slot', '0', '243', 'BTN_ThePhantomOfTheOpera_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('304', '1398', '1001', '1398', '1002', 'The Rat Pack', '鼠包', 'Video Slot', '0', '30', 'BTN_RatPack1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('305', '1386', '1001', '1386', '1002', 'The Twisted Circus', '反转马戏团', 'Video Slot', '0', '243', 'BTN_TwistedCircus', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('306', '1394', '1001', '0', '0', 'Throne of Egypt', '埃及王座', 'Video Slot', '0', '25', 'BTN_ThroneOfEgypt1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('307', '1028', '1001', '1028', '1002', 'Thunderstruck', '雷神', 'Video Slot', '0', '9', 'BTN_Thunderstruck1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('308', '1330', '1001', '1330', '1002', 'Thunderstruck II', '雷神2', 'Video Slot', '0', '243', 'BTN_ThunderstruckTwo1', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('309', '1277', '1001', '0', '0', 'Tiger Vs Bear', '熊虎之战', 'Bonus Slot', '0', '25', 'BTN_TigerVsBear', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('310', '0', '0', '1232', '1002', 'Tigers Eye', '老虎之眼', 'Video Slot', '0', '40', 'BTN_tigersEye_2', '1', '0', '1');
INSERT INTO `web_mg_games` VALUES ('311', '1208', '1001', '1208', '1002', 'Titans of the Sun Hyperion', '太阳神之许珀里翁', 'Video Slot', '0', '15', 'BTN_TitansOfTheSunHyperion_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('312', '1385', '1001', '1385', '1002', 'Titans of the Sun Theia', '太阳神之忒伊亚', 'Video Slot', '0', '15', 'BTN_TitansOfTheSunTheia_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('313', '1122', '1001', '1122', '1002', 'Tomb Raider', '古墓丽影', 'Bonus Slot', '0', '15', 'BTN_TombRaider2', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('314', '1383', '1001', '0', '0', 'Tomb Raider 2', '古墓丽影2', 'Bonus Slot', '0', '30', 'BTN_TombRaiderSotS1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('315', '1354', '1001', '0', '0', 'Totem Treasure', '图腾宝藏', 'Video Slot', '0', '5', 'BTN_TotemTreasure1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('316', '0', '0', '1020', '1002', 'Treasure Palace', '财宝宫殿', 'Video Slot', '0', '9', 'BTN_TreasurePalace', '1', '0', '1');
INSERT INTO `web_mg_games` VALUES ('317', '1096', '1001', '0', '0', 'Triangulation', '三角', 'Others', '0', '', 'BTN_Triangulation', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('318', '1131', '1001', '0', '0', 'Triple Magic', '三魔法', 'Classic Slot', '0', '1', 'BTN_TripleMagic1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('319', '1105', '1001', '0', '0', 'Triple Pocket Holdem Poker', '三人德州扑克', 'Table', '0', '', 'BTN_GoldSeries_TriplePocket1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('320', '0', '0', '0', '0', 'Twister', '扭曲', 'Video Slot', '0', '15', '', '1', '0', '0');
INSERT INTO `web_mg_games` VALUES ('321', '1111', '1001', '0', '0', 'Untamed Bengal Tiger', '野性的孟加拉虎', 'Bonus Slot', '0', '243', 'BTN_UntamedBengalTiger1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('322', '1357', '1001', '0', '0', 'Untamed Crowned Eagle', '狂野之鹰', 'Bonus Slot', '0', '243', 'BTN_UntamedCrownedEagle', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('323', '1222', '1001', '1222', '1002', 'Untamed Giant Panda', '大熊猫', 'Video Slot', '0', '243', 'BTN_UntamedGiantPanda', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('324', '1091', '1001', '0', '0', 'Untamed Wolf Pack', '野性的狼群', 'Bonus Slot', '0', '243', 'BTN_UntamedWolfPack1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('325', '1271', '1001', '0', '0', 'Victorian Villain', '维多利亚的恶棍', 'Bonus Slot', '0', '243', 'BTN_VictorianVillian', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('326', '1306', '1001', '1306', '1002', 'Vinyl Countdown', '黑胶热舞', 'Video Slot', '0', '9', 'BTN_VinylCountdown4_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('327', '0', '0', '1241', '1002', 'Voila!', '瞧！', 'Video Slot', '0', '243', 'BTN_voila_2', '1', '0', '1');
INSERT INTO `web_mg_games` VALUES ('328', '1911', '1001', '1911', '1002', 'Wacky Panda', '囧囧熊猫', 'Video Slot', '0', '1', 'BTN_WackyPanda_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('329', '1328', '1001', '0', '0', 'Wasabi San', '芥末寿司', 'Bonus Slot', '0', '15', 'BTN_WasabiSan4', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('330', '1403', '1001', '0', '0', 'Whack a Jackpot', '瓜分大奖', 'Others', '0', '', 'BTN_WhackaJackpot1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('331', '1171', '1001', '1171', '1002', 'What A Hoot', '猫头鹰乐园', 'Video Slot', '0', '9', 'BTN_WhataHoot3', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('332', '1388', '1001', '0', '0', 'What on Earth', '地球生物', 'Bonus Slot', '0', '9', 'BTN_WhatonEarth1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('333', '1198', '1001', '0', '0', 'Wheel of Wealth', '财富转轮', 'Classic Slot', '0', '1', 'BTN_WheelOfWealth1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('334', '1175', '1001', '0', '0', 'Wheel of Wealth Special Editio', '财富转轮特别版', 'Bonus Slot', '0', '25', 'BTN_WheelofWealthSE1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('335', '1043', '1001', '0', '0', 'White Buffalo', '白水牛', 'Bonus Slot', '0', '25', 'BTN_WhiteBuffalo', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('336', '1152', '1001', '0', '0', 'Wild Catch', '野生捕鱼', 'Video Slot', '0', '243', 'BTN_WildCatch', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('337', '1301', '1001', '0', '0', 'Wild Champions', '野生冠军', 'Others', '0', '', 'BTN_WildChampions1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('338', '1164', '1001', '1164', '1002', 'Wild Orient', '东方珍兽', 'Bonus Slot', '0', '243', 'BTN_WildOrient_Button_ZH', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('339', '1345', '1001', '1345', '1002', 'Win Sum Dim Sum', '开心点心', 'Video Slot', '0', '9', 'BTN_WinSumDimSum_zh', '1', '1', '1');
INSERT INTO `web_mg_games` VALUES ('340', '1242', '1001', '0', '0', 'Winning Wizards', '赢得向导', 'Video Slot', '0', '5', 'BTN_WinningWizards1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('341', '1255', '1001', '0', '0', 'Witches Wealth', '女巫的财富', 'Bonus Slot', '0', '9', 'BTN_WitchesWealth1', '1', '1', '0');
INSERT INTO `web_mg_games` VALUES ('342', '1382', '1001', '0', '0', 'Zany Zebra', '燃尼巨蟒', 'Classic Slot', '0', '5', 'BTN_ZanyZebra1', '1', '1', '0');

-- ----------------------------
-- Table structure for web_mg_sum
-- ----------------------------
DROP TABLE IF EXISTS `web_mg_sum`;
CREATE TABLE `web_mg_sum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agents_id` int(10) NOT NULL COMMENT '上级代理',
  `userid` int(10) NOT NULL,
  `nums` int(11) NOT NULL COMMENT '注单数',
  `date` date NOT NULL COMMENT '日期',
  `user_win` decimal(11,2) NOT NULL COMMENT '会员输赢',
  `bets_money` decimal(11,2) NOT NULL COMMENT '下注金额',
  `valid_money` decimal(11,2) NOT NULL COMMENT '有效金额',
  `server_admin` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '总代理',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `userid_idx` (`userid`,`date`) USING BTREE,
  KEY `server_admin_iddx` (`server_admin`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='MG注单汇总表';

-- ----------------------------
-- Records of web_mg_sum
-- ----------------------------

-- ----------------------------
-- Table structure for web_money_log
-- ----------------------------
DROP TABLE IF EXISTS `web_money_log`;
CREATE TABLE `web_money_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `moneyf` decimal(11,2) NOT NULL COMMENT '变动前金额',
  `money` decimal(11,2) NOT NULL COMMENT '变动金额',
  `moneys` decimal(11,2) NOT NULL COMMENT '变动后金额',
  `type` tinyint(2) NOT NULL COMMENT '例如1-下注2-结算-3活动-4充值-5提款-6额度转换',
  `order_id` int(11) NOT NULL COMMENT '关联ID',
  `add_date` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '动态时间',
  `notes` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userid_idx` (`userid`) USING BTREE,
  KEY `order_id_idx` (`order_id`) USING BTREE,
  KEY `add_date_idx` (`add_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=332 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='资金变动日志表';

-- ----------------------------
-- Records of web_money_log
-- ----------------------------
INSERT INTO `web_money_log` VALUES ('1', '1057', '99998.00', '100.00', '99898.00', '1', '120068', '1551090399', '半场让球下注');
INSERT INTO `web_money_log` VALUES ('2', '1057', '99898.00', '100.00', '99798.00', '1', '120069', '1551144479', '独赢下注');
INSERT INTO `web_money_log` VALUES ('3', '1057', '99798.00', '100.00', '99698.00', '1', '120070', '1551144497', '让球下注');
INSERT INTO `web_money_log` VALUES ('4', '1057', '99698.00', '100.00', '99598.00', '1', '120071', '1551144501', '大小下注');
INSERT INTO `web_money_log` VALUES ('5', '1030', '11.00', '10.00', '1.00', '5', '0', '1551512492', '测试');
INSERT INTO `web_money_log` VALUES ('6', '1030', '1.00', '10.00', '-9.00', '5', '0', '1551512505', '测试');
INSERT INTO `web_money_log` VALUES ('7', '1030', '-9.00', '100.00', '91.00', '4', '0', '1551513112', '测试');
INSERT INTO `web_money_log` VALUES ('8', '1030', '91.00', '100.00', '191.00', '4', '0', '1551513409', '测试');
INSERT INTO `web_money_log` VALUES ('9', '1030', '191.00', '100.00', '291.00', '4', '0', '1551513451', '测试');
INSERT INTO `web_money_log` VALUES ('10', '1030', '22.00', '11.00', '33.00', '4', '13', '1551780278', '线上入款');
INSERT INTO `web_money_log` VALUES ('11', '1030', '33.00', '11.00', '44.00', '4', '15', '1551785456', '线上入款');
INSERT INTO `web_money_log` VALUES ('12', '1030', '44.00', '11.00', '55.00', '4', '16', '1551785616', '线上入款');
INSERT INTO `web_money_log` VALUES ('13', '1030', '55.00', '11.00', '66.00', '4', '18', '1551785775', '线上入款');
INSERT INTO `web_money_log` VALUES ('14', '1258', '0.00', '100.00', '100.00', '4', '0', '1552028251', '线下充值');
INSERT INTO `web_money_log` VALUES ('15', '1057', '99598.00', '100.00', '99498.00', '1', '120072', '1552315832', '半场让球下注');
INSERT INTO `web_money_log` VALUES ('16', '1057', '99498.00', '100.00', '99398.00', '1', '120073', '1552317280', '独赢下注');
INSERT INTO `web_money_log` VALUES ('17', '1057', '99398.00', '100.00', '99298.00', '1', '120074', '1552317422', '大小下注');
INSERT INTO `web_money_log` VALUES ('18', '1057', '99298.00', '200.00', '99098.00', '1', '120075', '1552317616', '大小下注');
INSERT INTO `web_money_log` VALUES ('19', '1057', '99098.00', '100.00', '98998.00', '1', '120076', '1552317929', '大小下注');
INSERT INTO `web_money_log` VALUES ('20', '1057', '98998.00', '100.00', '98898.00', '1', '120077', '1552317994', '让球下注');
INSERT INTO `web_money_log` VALUES ('21', '1057', '98898.00', '100.00', '98798.00', '1', '120078', '1552318000', '大小下注');
INSERT INTO `web_money_log` VALUES ('22', '1057', '98798.00', '100.00', '98698.00', '1', '120079', '1552318305', '让球下注');
INSERT INTO `web_money_log` VALUES ('23', '1057', '98698.00', '100.00', '98598.00', '1', '120080', '1552318311', '大小下注');
INSERT INTO `web_money_log` VALUES ('24', '1057', '98598.00', '100.00', '98498.00', '1', '120081', '1552319320', '大小下注');
INSERT INTO `web_money_log` VALUES ('25', '1057', '98498.00', '100.00', '98398.00', '1', '120082', '1552320149', '让球下注');
INSERT INTO `web_money_log` VALUES ('26', '1057', '98398.00', '100.00', '98298.00', '1', '120083', '1552320445', '让球下注');
INSERT INTO `web_money_log` VALUES ('27', '1057', '98298.00', '100.00', '98198.00', '1', '120084', '1552320489', '让球下注');
INSERT INTO `web_money_log` VALUES ('28', '1057', '98198.00', '100.00', '98098.00', '1', '120085', '1552320568', '大小下注');
INSERT INTO `web_money_log` VALUES ('29', '1057', '98098.00', '100.00', '97998.00', '1', '120086', '1552320607', '大小下注');
INSERT INTO `web_money_log` VALUES ('30', '1057', '97998.00', '100.00', '97898.00', '1', '120087', '1552320675', '大小下注');
INSERT INTO `web_money_log` VALUES ('31', '1057', '97898.00', '1001.00', '96897.00', '1', '120088', '1552320766', '大小下注');
INSERT INTO `web_money_log` VALUES ('32', '1057', '96897.00', '100.00', '96797.00', '1', '120089', '1552320898', '大小下注');
INSERT INTO `web_money_log` VALUES ('33', '1057', '96797.00', '100.00', '96697.00', '1', '120090', '1552320983', '大小下注');
INSERT INTO `web_money_log` VALUES ('34', '1057', '96697.00', '100.00', '96597.00', '1', '120091', '1552321031', '大小下注');
INSERT INTO `web_money_log` VALUES ('35', '1057', '96597.00', '100.00', '96497.00', '1', '120092', '1552321348', '独赢下注');
INSERT INTO `web_money_log` VALUES ('36', '1057', '96497.00', '100.00', '96397.00', '1', '120093', '1552321540', '大小下注');
INSERT INTO `web_money_log` VALUES ('37', '1057', '96397.00', '100.00', '96297.00', '1', '120094', '1552321574', '大小下注');
INSERT INTO `web_money_log` VALUES ('38', '1057', '96297.00', '100.00', '96197.00', '1', '120095', '1552321594', '大小下注');
INSERT INTO `web_money_log` VALUES ('39', '1057', '96197.00', '100.00', '96097.00', '1', '120096', '1552321996', '让球下注');
INSERT INTO `web_money_log` VALUES ('40', '1057', '96097.00', '100.00', '95997.00', '1', '120097', '1552356876', '独赢下注');
INSERT INTO `web_money_log` VALUES ('41', '1057', '95997.00', '100.00', '95897.00', '1', '120098', '1552357630', '大小下注');
INSERT INTO `web_money_log` VALUES ('42', '1057', '95897.00', '100.00', '95797.00', '1', '120099', '1552357630', '大小下注');
INSERT INTO `web_money_log` VALUES ('43', '1057', '95797.00', '100.00', '95697.00', '1', '120100', '1552359258', '独赢下注');
INSERT INTO `web_money_log` VALUES ('44', '1057', '95697.00', '100.00', '95597.00', '1', '120101', '1552359258', '让球下注');
INSERT INTO `web_money_log` VALUES ('45', '1057', '95597.00', '100.00', '95497.00', '1', '120102', '1552370287', '让球下注');
INSERT INTO `web_money_log` VALUES ('46', '1057', '95497.00', '100.00', '95397.00', '1', '120103', '1552373666', '让球下注');
INSERT INTO `web_money_log` VALUES ('47', '1057', '95397.00', '100.00', '95297.00', '1', '120104', '1552374535', '独赢下注');
INSERT INTO `web_money_log` VALUES ('48', '1057', '95297.00', '100.00', '95197.00', '1', '120105', '1552376322', '让球下注');
INSERT INTO `web_money_log` VALUES ('49', '1057', '95197.00', '100.00', '95097.00', '1', '120106', '1552376339', '滚球让球下注');
INSERT INTO `web_money_log` VALUES ('50', '1030', '844.13', '10.00', '834.13', '5', '1061', '1552385951', 'MG转账到体育');
INSERT INTO `web_money_log` VALUES ('51', '1030', '76.00', '10.00', '66.00', '5', '1062', '1552385992', '体育转账到mg');
INSERT INTO `web_money_log` VALUES ('52', '1030', '66.00', '10.00', '56.00', '5', '1064', '1552386683', '体育转账到mg');
INSERT INTO `web_money_log` VALUES ('53', '1030', '56.00', '10.00', '46.00', '5', '1065', '1552386961', '体育转账到mg');
INSERT INTO `web_money_log` VALUES ('54', '1030', '46.00', '10.00', '36.00', '5', '1066', '1552387027', '体育转账到mg');
INSERT INTO `web_money_log` VALUES ('55', '1057', '95097.00', '100.00', '94997.00', '1', '120107', '1552405486', '大小下注');
INSERT INTO `web_money_log` VALUES ('56', '1057', '94997.00', '100.00', '94897.00', '1', '120108', '1552405571', '大小下注');
INSERT INTO `web_money_log` VALUES ('57', '1057', '94897.00', '100.00', '94797.00', '1', '120109', '1552407969', '让球下注');
INSERT INTO `web_money_log` VALUES ('58', '1057', '94797.00', '100.00', '94697.00', '1', '120110', '1552408543', '大小下注');
INSERT INTO `web_money_log` VALUES ('59', '1057', '94697.00', '100.00', '94597.00', '1', '120111', '1552408913', '大小下注');
INSERT INTO `web_money_log` VALUES ('60', '1057', '94597.00', '100.00', '94497.00', '1', '120112', '1552409279', '大小下注');
INSERT INTO `web_money_log` VALUES ('61', '1057', '94497.00', '100.00', '94397.00', '1', '120113', '1552409328', '大小下注');
INSERT INTO `web_money_log` VALUES ('62', '1057', '94397.00', '100.00', '94297.00', '1', '120114', '1552409429', '大小下注');
INSERT INTO `web_money_log` VALUES ('63', '1057', '94297.00', '100.00', '94197.00', '1', '120115', '1552409534', '大小下注');
INSERT INTO `web_money_log` VALUES ('64', '1057', '94197.00', '100.00', '94097.00', '1', '120116', '1552409705', '让球下注');
INSERT INTO `web_money_log` VALUES ('65', '1057', '94097.00', '100.00', '93997.00', '1', '120117', '1552446094', '让球下注');
INSERT INTO `web_money_log` VALUES ('66', '1057', '93997.00', '100.00', '93897.00', '1', '120118', '1552446110', '让球下注');
INSERT INTO `web_money_log` VALUES ('67', '1057', '93897.00', '100.00', '93797.00', '1', '120119', '1552446135', '让球下注');
INSERT INTO `web_money_log` VALUES ('68', '1057', '93797.00', '100.00', '93697.00', '1', '120120', '1552446135', '让球下注');
INSERT INTO `web_money_log` VALUES ('69', '1057', '93697.00', '100.00', '93597.00', '1', '120121', '1552457179', '让球下注');
INSERT INTO `web_money_log` VALUES ('70', '1057', '93597.00', '100.00', '93497.00', '1', '120122', '1552457764', '让球下注');
INSERT INTO `web_money_log` VALUES ('71', '1030', '36.00', '10.00', '26.00', '5', '1067', '1552457990', '体育转账到mg');
INSERT INTO `web_money_log` VALUES ('72', '1057', '93497.00', '100.00', '93397.00', '1', '120123', '1552460531', '单双下注');
INSERT INTO `web_money_log` VALUES ('73', '1057', '93397.00', '100.00', '93297.00', '1', '120124', '1552464311', '大小下注');
INSERT INTO `web_money_log` VALUES ('74', '1057', '93297.00', '100.00', '93197.00', '1', '120125', '1552464695', '半场让球下注');
INSERT INTO `web_money_log` VALUES ('75', '1057', '93197.00', '100.00', '93097.00', '1', '120126', '1552464788', '半场让球下注');
INSERT INTO `web_money_log` VALUES ('76', '1057', '93097.00', '100.00', '92997.00', '1', '120127', '1552464848', '大小下注');
INSERT INTO `web_money_log` VALUES ('77', '1057', '92997.00', '100.00', '92897.00', '1', '120128', '1552465064', '半场让球下注');
INSERT INTO `web_money_log` VALUES ('78', '1057', '92897.00', '100.00', '92797.00', '1', '120129', '1552465207', '大小下注');
INSERT INTO `web_money_log` VALUES ('79', '1057', '92797.00', '100.00', '92697.00', '1', '120130', '1552465681', '独赢下注');
INSERT INTO `web_money_log` VALUES ('80', '1057', '92697.00', '100.00', '92597.00', '1', '120131', '1552470702', '大小下注');
INSERT INTO `web_money_log` VALUES ('81', '1057', '92597.00', '100.00', '92497.00', '1', '120132', '1552493399', '大小下注');
INSERT INTO `web_money_log` VALUES ('82', '1057', '92497.00', '100.00', '92397.00', '1', '120133', '1552529309', '半场让球下注');
INSERT INTO `web_money_log` VALUES ('83', '1057', '92397.00', '100.00', '92297.00', '1', '120134', '1552529425', '半场让球下注');
INSERT INTO `web_money_log` VALUES ('84', '1057', '92297.00', '100.00', '92197.00', '1', '120135', '1552529496', '半场让球下注');
INSERT INTO `web_money_log` VALUES ('85', '1057', '92197.00', '100.00', '92097.00', '1', '120136', '1552529816', '半场让球下注');
INSERT INTO `web_money_log` VALUES ('86', '1057', '92097.00', '100.00', '91997.00', '1', '120137', '1552530221', '半场让球下注');
INSERT INTO `web_money_log` VALUES ('87', '1057', '91997.00', '100.00', '91897.00', '1', '120138', '1552531636', '独赢下注');
INSERT INTO `web_money_log` VALUES ('88', '1057', '91897.00', '100.00', '91797.00', '1', '120139', '1552531747', '半场让球下注');
INSERT INTO `web_money_log` VALUES ('89', '1057', '91797.00', '10.00', '91787.00', '1', '120140', '1552544383', '让球下注');
INSERT INTO `web_money_log` VALUES ('90', '1068', '99999.00', '100.00', '99899.00', '1', '120141', '1552544523', '让球下注');
INSERT INTO `web_money_log` VALUES ('91', '1068', '99899.00', '10028.00', '89871.00', '1', '120142', '1552545877', '让球下注');
INSERT INTO `web_money_log` VALUES ('92', '1057', '91787.00', '10.00', '91777.00', '1', '120143', '1552546155', '让球下注');
INSERT INTO `web_money_log` VALUES ('93', '1057', '91777.00', '10.00', '91767.00', '1', '120144', '1552547642', '半场独赢下注');
INSERT INTO `web_money_log` VALUES ('94', '1057', '91767.00', '10.00', '91757.00', '1', '120145', '1552548102', '半场让球下注');
INSERT INTO `web_money_log` VALUES ('95', '1068', '89871.00', '100.00', '89771.00', '1', '120146', '1552556545', '让球下注');
INSERT INTO `web_money_log` VALUES ('96', '1068', '89771.00', '100.00', '89671.00', '1', '120147', '1552556673', '滚球让球下注');
INSERT INTO `web_money_log` VALUES ('97', '1068', '89671.00', '90.00', '89581.00', '1', '120148', '1552556763', '滚球让球下注');
INSERT INTO `web_money_log` VALUES ('98', '1068', '89581.00', '17.00', '89564.00', '1', '120149', '1552556930', '让球下注');
INSERT INTO `web_money_log` VALUES ('99', '1068', '89564.00', '87.00', '89477.00', '1', '120150', '1552556930', '让球下注');
INSERT INTO `web_money_log` VALUES ('100', '1068', '89477.00', '100.00', '89377.00', '1', '120151', '1552557006', '让球下注');
INSERT INTO `web_money_log` VALUES ('101', '1068', '89377.00', '1100.00', '88277.00', '1', '120152', '1552557020', '让球下注');
INSERT INTO `web_money_log` VALUES ('102', '1068', '88277.00', '77.00', '88200.00', '1', '120153', '1552557473', '让球下注');
INSERT INTO `web_money_log` VALUES ('103', '1068', '88200.00', '12.00', '88188.00', '1', '120154', '1552557489', '让球下注');
INSERT INTO `web_money_log` VALUES ('104', '1068', '88188.00', '12.00', '88176.00', '1', '120155', '1552557502', '让球下注');
INSERT INTO `web_money_log` VALUES ('105', '1068', '88176.00', '11.00', '88165.00', '1', '120156', '1552557513', '让球下注');
INSERT INTO `web_money_log` VALUES ('106', '1068', '88165.00', '1112.00', '87053.00', '1', '120157', '1552557522', '让球下注');
INSERT INTO `web_money_log` VALUES ('107', '1068', '87053.00', '12.00', '87041.00', '1', '120158', '1552557536', '让球下注');
INSERT INTO `web_money_log` VALUES ('108', '1068', '87041.00', '12.00', '87029.00', '1', '120159', '1552557597', '让球下注');
INSERT INTO `web_money_log` VALUES ('109', '1068', '87029.00', '12.00', '87017.00', '1', '120160', '1552557665', '让球下注');
INSERT INTO `web_money_log` VALUES ('110', '1068', '87017.00', '122.00', '86895.00', '1', '120161', '1552557675', '让球下注');
INSERT INTO `web_money_log` VALUES ('111', '1068', '86895.00', '12.00', '86883.00', '1', '120162', '1552557690', '让球下注');
INSERT INTO `web_money_log` VALUES ('112', '1068', '86883.00', '12.00', '86871.00', '1', '120163', '1552557706', '让球下注');
INSERT INTO `web_money_log` VALUES ('113', '1068', '86871.00', '12.00', '86859.00', '1', '120164', '1552557725', '大小下注');
INSERT INTO `web_money_log` VALUES ('114', '1068', '86859.00', '12.00', '86847.00', '1', '120165', '1552557787', '大小下注');
INSERT INTO `web_money_log` VALUES ('115', '1057', '91757.00', '100.00', '91657.00', '1', '120166', '1552590654', '滚球独赢下注');
INSERT INTO `web_money_log` VALUES ('116', '1057', '91657.00', '100.00', '91557.00', '1', '120167', '1552590917', '滚球独赢下注');
INSERT INTO `web_money_log` VALUES ('117', '1057', '91557.00', '100.00', '91457.00', '1', '120168', '1552591796', '滚球让球下注');
INSERT INTO `web_money_log` VALUES ('118', '1057', '91457.00', '100.00', '91357.00', '1', '120169', '1552592009', '滚球让球下注');
INSERT INTO `web_money_log` VALUES ('119', '1057', '91357.00', '100.00', '91257.00', '1', '120170', '1552592213', '滚球让球下注');
INSERT INTO `web_money_log` VALUES ('120', '1057', '91257.00', '100.00', '91157.00', '1', '120171', '1552592601', '滚球大小下注');
INSERT INTO `web_money_log` VALUES ('121', '1057', '91157.00', '100.00', '91057.00', '1', '120172', '1552592748', '滚球大小下注');
INSERT INTO `web_money_log` VALUES ('122', '1057', '91057.00', '200.00', '90857.00', '1', '120173', '1552592770', '滚球大小下注');
INSERT INTO `web_money_log` VALUES ('123', '1057', '90857.00', '100.00', '90757.00', '1', '120174', '1552592849', '滚球大小下注');
INSERT INTO `web_money_log` VALUES ('124', '1057', '90757.00', '100.00', '90657.00', '1', '120175', '1552615468', '大小下注');
INSERT INTO `web_money_log` VALUES ('125', '1057', '90657.00', '100.00', '90557.00', '1', '120176', '1552615758', '半场让球下注');
INSERT INTO `web_money_log` VALUES ('126', '1068', '86847.00', '10.00', '86837.00', '1', '120177', '1552632773', '让球下注');
INSERT INTO `web_money_log` VALUES ('127', '1068', '86837.00', '10.00', '86827.00', '1', '120178', '1552632833', '让球下注');
INSERT INTO `web_money_log` VALUES ('128', '1116', '99999.00', '100.00', '99899.00', '1', '120179', '1552639248', '滚球独赢下注');
INSERT INTO `web_money_log` VALUES ('129', '1068', '86827.00', '10.00', '86817.00', '1', '120180', '1552642056', '让球下注');
INSERT INTO `web_money_log` VALUES ('130', '1068', '86817.00', '10.00', '86807.00', '1', '120181', '1552642113', '让球下注');
INSERT INTO `web_money_log` VALUES ('131', '1068', '86807.00', '10.00', '86797.00', '1', '120182', '1552642228', '让球下注');
INSERT INTO `web_money_log` VALUES ('132', '1057', '90557.00', '100.00', '90457.00', '1', '120183', '1552826668', '让球下注');
INSERT INTO `web_money_log` VALUES ('133', '1057', '90457.00', '100.00', '90357.00', '1', '120184', '1552826681', '让球下注');
INSERT INTO `web_money_log` VALUES ('134', '1057', '90357.00', '100.00', '90257.00', '1', '120185', '1552826682', '让球下注');
INSERT INTO `web_money_log` VALUES ('135', '1057', '90257.00', '100.00', '90157.00', '1', '120186', '1552826682', '让球下注');
INSERT INTO `web_money_log` VALUES ('136', '1057', '90157.00', '100.00', '90057.00', '1', '120187', '1552826699', '让球下注');
INSERT INTO `web_money_log` VALUES ('137', '1068', '86797.00', '10.00', '86787.00', '1', '120188', '1553146180', '滚球让球下注');
INSERT INTO `web_money_log` VALUES ('138', '1068', '86787.00', '100.00', '86687.00', '1', '120189', '1553146565', '滚球让球下注');
INSERT INTO `web_money_log` VALUES ('139', '1057', '90057.00', '10.00', '90047.00', '1', '120190', '1553149178', '大小下注');
INSERT INTO `web_money_log` VALUES ('140', '1057', '90047.00', '10.00', '90037.00', '1', '120191', '1553149184', '半场让球下注');
INSERT INTO `web_money_log` VALUES ('141', '1057', '90037.00', '10.00', '90027.00', '1', '120192', '1553149189', '让球下注');
INSERT INTO `web_money_log` VALUES ('142', '1057', '90027.00', '100.00', '89927.00', '1', '120193', '1553149516', '单双下注');
INSERT INTO `web_money_log` VALUES ('143', '1057', '89927.00', '100.00', '89827.00', '1', '120194', '1553149582', '单双下注');
INSERT INTO `web_money_log` VALUES ('144', '1057', '89827.00', '100.00', '89727.00', '1', '120195', '1553152292', '大小下注');
INSERT INTO `web_money_log` VALUES ('145', '1057', '89727.00', '100.00', '89627.00', '1', '120196', '1553152298', '独赢下注');
INSERT INTO `web_money_log` VALUES ('146', '1057', '89627.00', '100.00', '89527.00', '1', '120197', '1553152304', '半场让球下注');
INSERT INTO `web_money_log` VALUES ('147', '1057', '89527.00', '100.00', '89427.00', '1', '120198', '1553152322', '半场让球下注');
INSERT INTO `web_money_log` VALUES ('148', '1057', '89427.00', '100.00', '89327.00', '1', '120199', '1553152352', '大小下注');
INSERT INTO `web_money_log` VALUES ('149', '1057', '89327.00', '100.00', '89227.00', '1', '120200', '1553152358', '独赢下注');
INSERT INTO `web_money_log` VALUES ('150', '1057', '89227.00', '100.00', '89127.00', '1', '120201', '1553152364', '大小下注');
INSERT INTO `web_money_log` VALUES ('151', '1057', '89127.00', '100.00', '89027.00', '1', '120202', '1553152383', '独赢下注');
INSERT INTO `web_money_log` VALUES ('152', '1057', '89027.00', '100.00', '88927.00', '1', '120203', '1553152430', '单双下注');
INSERT INTO `web_money_log` VALUES ('153', '1057', '88927.00', '100.00', '88827.00', '1', '120204', '1553152496', '单双下注');
INSERT INTO `web_money_log` VALUES ('154', '1058', '99999.00', '5000.00', '94999.00', '1', '120205', '1553152676', '让球下注');
INSERT INTO `web_money_log` VALUES ('155', '1057', '88827.00', '100.00', '88727.00', '1', '120206', '1553152721', '大小下注');
INSERT INTO `web_money_log` VALUES ('156', '1057', '88727.00', '100.00', '88627.00', '1', '120207', '1553152750', '让球下注');
INSERT INTO `web_money_log` VALUES ('157', '1057', '88627.00', '100.00', '88527.00', '1', '120208', '1553152756', '大小下注');
INSERT INTO `web_money_log` VALUES ('158', '1057', '88527.00', '100.00', '88427.00', '1', '120209', '1553153014', '让球下注');
INSERT INTO `web_money_log` VALUES ('159', '1030', '26.00', '10.00', '16.00', '1', '120210', '1553153670', '独赢下注');
INSERT INTO `web_money_log` VALUES ('160', '1030', '16.00', '10.00', '6.00', '1', '120211', '1553154581', '独赢下注');
INSERT INTO `web_money_log` VALUES ('161', '1057', '88427.00', '100.00', '88327.00', '1', '120212', '1553154681', '让球下注');
INSERT INTO `web_money_log` VALUES ('162', '1058', '94999.00', '5000.00', '89999.00', '1', '120213', '1553155343', '让球下注');
INSERT INTO `web_money_log` VALUES ('163', '1030', '2500000.00', '10.00', '2499990.00', '1', '120214', '1553156147', '独赢下注');
INSERT INTO `web_money_log` VALUES ('164', '1030', '2499990.00', '10.00', '2499980.00', '1', '120215', '1553156448', '独赢下注');
INSERT INTO `web_money_log` VALUES ('165', '1030', '2499980.00', '11.00', '2499969.00', '1', '120216', '1553156685', '独赢下注');
INSERT INTO `web_money_log` VALUES ('166', '1030', '2499969.00', '11.00', '2499958.00', '1', '120217', '1553156776', '独赢下注');
INSERT INTO `web_money_log` VALUES ('167', '1030', '2499958.00', '11.00', '2499947.00', '1', '120218', '1553156852', '让球下注');
INSERT INTO `web_money_log` VALUES ('168', '1058', '89999.00', '100.00', '89899.00', '1', '120219', '1553157399', '让球下注');
INSERT INTO `web_money_log` VALUES ('169', '1058', '89899.00', '5000.00', '84899.00', '1', '120220', '1553157518', '让球下注');
INSERT INTO `web_money_log` VALUES ('170', '1058', '84899.00', '100.00', '84799.00', '1', '120221', '1553157868', '让球下注');
INSERT INTO `web_money_log` VALUES ('171', '1058', '84799.00', '100.00', '84699.00', '1', '120222', '1553159424', '让球下注');
INSERT INTO `web_money_log` VALUES ('172', '1058', '84699.00', '100.00', '84599.00', '1', '120223', '1553219256', '让球下注');
INSERT INTO `web_money_log` VALUES ('173', '1058', '84599.00', '100.00', '84499.00', '1', '120224', '1553219256', '让球下注');
INSERT INTO `web_money_log` VALUES ('174', '1058', '84499.00', '55.00', '84554.00', '4', '0', '1553221559', '线下充值');
INSERT INTO `web_money_log` VALUES ('175', '1057', '88327.00', '10.00', '88317.00', '1', '120225', '1553226813', '独赢下注');
INSERT INTO `web_money_log` VALUES ('176', '1057', '88317.00', '10.00', '88307.00', '1', '120226', '1553227150', '独赢下注');
INSERT INTO `web_money_log` VALUES ('177', '1057', '88307.00', '10.00', '88297.00', '1', '120227', '1553232787', '独赢下注');
INSERT INTO `web_money_log` VALUES ('178', '1071', '100000.00', '10.00', '99990.00', '1', '120228', '1553232936', '独赢下注');
INSERT INTO `web_money_log` VALUES ('179', '1071', '100000.00', '10.00', '99990.00', '1', '120229', '1553232951', '独赢下注');
INSERT INTO `web_money_log` VALUES ('180', '1071', '99980.00', '10.00', '99970.00', '1', '120230', '1553232987', '独赢下注');
INSERT INTO `web_money_log` VALUES ('181', '1057', '88297.00', '10.00', '88287.00', '1', '120231', '1553233111', '独赢下注');
INSERT INTO `web_money_log` VALUES ('182', '1071', '99970.00', '10.00', '99960.00', '1', '120232', '1553233191', '独赢下注');
INSERT INTO `web_money_log` VALUES ('183', '1057', '88287.00', '10.00', '88277.00', '1', '120233', '1553234264', '独赢下注');
INSERT INTO `web_money_log` VALUES ('184', '1071', '99960.00', '10.00', '99950.00', '1', '120234', '1553234305', '独赢下注');
INSERT INTO `web_money_log` VALUES ('185', '1057', '88277.00', '10.00', '88267.00', '1', '120235', '1553234313', '独赢下注');
INSERT INTO `web_money_log` VALUES ('186', '1071', '99950.00', '10.00', '99940.00', '1', '120236', '1553234328', '独赢下注');
INSERT INTO `web_money_log` VALUES ('187', '1071', '99940.00', '10.00', '99930.00', '1', '120237', '1553234412', '独赢下注');
INSERT INTO `web_money_log` VALUES ('188', '1071', '99930.00', '10.00', '99920.00', '1', '120238', '1553234436', '独赢下注');
INSERT INTO `web_money_log` VALUES ('189', '1071', '99920.00', '10.00', '99910.00', '1', '120239', '1553234888', '独赢下注');
INSERT INTO `web_money_log` VALUES ('190', '1071', '99910.00', '10.00', '99900.00', '1', '120240', '1553234976', '独赢下注');
INSERT INTO `web_money_log` VALUES ('191', '1071', '99900.00', '10.00', '99890.00', '1', '120241', '1553235014', '独赢下注');
INSERT INTO `web_money_log` VALUES ('192', '1071', '99890.00', '10.00', '99880.00', '1', '120242', '1553235092', '独赢下注');
INSERT INTO `web_money_log` VALUES ('193', '1071', '99880.00', '10.00', '99870.00', '1', '120243', '1553235192', '独赢下注');
INSERT INTO `web_money_log` VALUES ('194', '1071', '99870.00', '10.00', '99860.00', '1', '120244', '1553235207', '独赢下注');
INSERT INTO `web_money_log` VALUES ('195', '1071', '99860.00', '10.00', '99850.00', '1', '120245', '1553235225', '独赢下注');
INSERT INTO `web_money_log` VALUES ('196', '1071', '99850.00', '10.00', '99840.00', '1', '120246', '1553235234', '独赢下注');
INSERT INTO `web_money_log` VALUES ('197', '1071', '99840.00', '10.00', '99830.00', '1', '120247', '1553235350', '独赢下注');
INSERT INTO `web_money_log` VALUES ('198', '1057', '88267.00', '10.00', '88257.00', '1', '120248', '1553235642', '独赢下注');
INSERT INTO `web_money_log` VALUES ('199', '1057', '88257.00', '10.00', '88247.00', '1', '120249', '1553235644', '独赢下注');
INSERT INTO `web_money_log` VALUES ('200', '1057', '88247.00', '10.00', '88237.00', '1', '120250', '1553235646', '独赢下注');
INSERT INTO `web_money_log` VALUES ('201', '1057', '88237.00', '10.00', '88227.00', '1', '120251', '1553235647', '独赢下注');
INSERT INTO `web_money_log` VALUES ('202', '1057', '88227.00', '10.00', '88217.00', '1', '120252', '1553235648', '独赢下注');
INSERT INTO `web_money_log` VALUES ('203', '1057', '88217.00', '10.00', '88207.00', '1', '120253', '1553235649', '独赢下注');
INSERT INTO `web_money_log` VALUES ('204', '1057', '88207.00', '10.00', '88197.00', '1', '120254', '1553235788', '独赢下注');
INSERT INTO `web_money_log` VALUES ('205', '1071', '99830.00', '10.00', '99820.00', '1', '120255', '1553235999', '独赢下注');
INSERT INTO `web_money_log` VALUES ('206', '1057', '88197.00', '100.00', '88097.00', '1', '120256', '1553236428', '让球下注');
INSERT INTO `web_money_log` VALUES ('207', '1057', '88097.00', '100.00', '87997.00', '1', '120257', '1553236506', '让球下注');
INSERT INTO `web_money_log` VALUES ('208', '1071', '99820.00', '10.00', '99810.00', '1', '120258', '1553236514', '独赢下注');
INSERT INTO `web_money_log` VALUES ('209', '1071', '99810.00', '10.00', '99800.00', '1', '120259', '1553236562', '独赢下注');
INSERT INTO `web_money_log` VALUES ('210', '1071', '99800.00', '10.00', '99790.00', '1', '120260', '1553236568', '独赢下注');
INSERT INTO `web_money_log` VALUES ('211', '1071', '99790.00', '10.00', '99780.00', '1', '120261', '1553236620', '独赢下注');
INSERT INTO `web_money_log` VALUES ('212', '1071', '99780.00', '10.00', '99770.00', '1', '120262', '1553237200', '独赢下注');
INSERT INTO `web_money_log` VALUES ('213', '1071', '99770.00', '10.00', '99760.00', '1', '120263', '1553237207', '独赢下注');
INSERT INTO `web_money_log` VALUES ('214', '1116', '99899.00', '100.00', '99799.00', '1', '120264', '1553244381', '让球下注');
INSERT INTO `web_money_log` VALUES ('215', '1116', '99799.00', '100.00', '99699.00', '1', '120265', '1553244986', '让球下注');
INSERT INTO `web_money_log` VALUES ('216', '1116', '99699.00', '100.00', '99599.00', '1', '120266', '1553245052', '让球下注');
INSERT INTO `web_money_log` VALUES ('217', '1116', '99599.00', '100.00', '99499.00', '1', '120267', '1553245137', '让球下注');
INSERT INTO `web_money_log` VALUES ('218', '1116', '99499.00', '100.00', '99399.00', '1', '120268', '1553245163', '让球下注');
INSERT INTO `web_money_log` VALUES ('219', '1116', '99399.00', '100.00', '99299.00', '1', '120269', '1553245249', '让球下注');
INSERT INTO `web_money_log` VALUES ('220', '1116', '99299.00', '100.00', '99199.00', '1', '120270', '1553245284', '让球下注');
INSERT INTO `web_money_log` VALUES ('221', '1116', '99199.00', '100.00', '99099.00', '1', '120271', '1553245359', '让球下注');
INSERT INTO `web_money_log` VALUES ('222', '1071', '99760.00', '10.00', '99750.00', '1', '120272', '1553246406', '独赢下注');
INSERT INTO `web_money_log` VALUES ('223', '1071', '99750.00', '10.00', '99740.00', '1', '120273', '1553246415', '独赢下注');
INSERT INTO `web_money_log` VALUES ('224', '1071', '99740.00', '10.00', '99730.00', '1', '120274', '1553246417', '独赢下注');
INSERT INTO `web_money_log` VALUES ('225', '1071', '99730.00', '10.00', '99720.00', '1', '120275', '1553246434', '独赢下注');
INSERT INTO `web_money_log` VALUES ('226', '1071', '99720.00', '10.00', '99710.00', '1', '120276', '1553246448', '独赢下注');
INSERT INTO `web_money_log` VALUES ('227', '1071', '99710.00', '10.00', '99700.00', '1', '120277', '1553246613', '独赢下注');
INSERT INTO `web_money_log` VALUES ('228', '1071', '99700.00', '10.00', '99690.00', '1', '120278', '1553246622', '独赢下注');
INSERT INTO `web_money_log` VALUES ('229', '1071', '99690.00', '10.00', '99680.00', '1', '120279', '1553246703', '独赢下注');
INSERT INTO `web_money_log` VALUES ('230', '1071', '99680.00', '10.00', '99670.00', '1', '120280', '1553247080', '独赢下注');
INSERT INTO `web_money_log` VALUES ('231', '1071', '99670.00', '10.00', '99660.00', '1', '120281', '1553247101', '独赢下注');
INSERT INTO `web_money_log` VALUES ('232', '1071', '99660.00', '10.00', '99650.00', '1', '120282', '1553247246', '独赢下注');
INSERT INTO `web_money_log` VALUES ('233', '1071', '99650.00', '10.00', '99640.00', '1', '120283', '1553247255', '独赢下注');
INSERT INTO `web_money_log` VALUES ('234', '1071', '99640.00', '10.00', '99630.00', '1', '120284', '1553247284', '独赢下注');
INSERT INTO `web_money_log` VALUES ('235', '1071', '99630.00', '10.00', '99620.00', '1', '120285', '1553247510', '独赢下注');
INSERT INTO `web_money_log` VALUES ('236', '1071', '99620.00', '10.00', '99610.00', '1', '120286', '1553247512', '独赢下注');
INSERT INTO `web_money_log` VALUES ('237', '1071', '99610.00', '10.00', '99600.00', '1', '120287', '1553247513', '独赢下注');
INSERT INTO `web_money_log` VALUES ('238', '1071', '99600.00', '10.00', '99590.00', '1', '120288', '1553247514', '独赢下注');
INSERT INTO `web_money_log` VALUES ('239', '1071', '99590.00', '10.00', '99580.00', '1', '120289', '1553247515', '独赢下注');
INSERT INTO `web_money_log` VALUES ('240', '1071', '99580.00', '10.00', '99570.00', '1', '120290', '1553247516', '独赢下注');
INSERT INTO `web_money_log` VALUES ('241', '1071', '99570.00', '10.00', '99560.00', '1', '120291', '1553247517', '独赢下注');
INSERT INTO `web_money_log` VALUES ('242', '1071', '99560.00', '10.00', '99550.00', '1', '120292', '1553247786', '独赢下注');
INSERT INTO `web_money_log` VALUES ('243', '1071', '99550.00', '10.00', '99540.00', '1', '120293', '1553247789', '独赢下注');
INSERT INTO `web_money_log` VALUES ('244', '1071', '99540.00', '10.00', '99530.00', '1', '120294', '1553247790', '独赢下注');
INSERT INTO `web_money_log` VALUES ('245', '1071', '99530.00', '10.00', '99520.00', '1', '120295', '1553247791', '独赢下注');
INSERT INTO `web_money_log` VALUES ('246', '1116', '99099.00', '100.00', '98999.00', '1', '120296', '1553506416', '让球下注');
INSERT INTO `web_money_log` VALUES ('247', '1116', '98999.00', '100.00', '98899.00', '1', '120297', '1553506779', '让球下注');
INSERT INTO `web_money_log` VALUES ('248', '1116', '98899.00', '1000.00', '97899.00', '1', '120298', '1553527540', '让球下注');
INSERT INTO `web_money_log` VALUES ('249', '1116', '97899.00', '99.00', '97800.00', '1', '120299', '1553527553', '让球下注');
INSERT INTO `web_money_log` VALUES ('250', '1116', '97800.00', '100.00', '97700.00', '1', '120300', '1553527918', '让球下注');
INSERT INTO `web_money_log` VALUES ('251', '1116', '97700.00', '800.00', '96900.00', '1', '120301', '1553527930', '让球下注');
INSERT INTO `web_money_log` VALUES ('252', '1116', '96900.00', '900.00', '96000.00', '1', '120302', '1553531210', '让球下注');
INSERT INTO `web_money_log` VALUES ('253', '1116', '96000.00', '1000.00', '95000.00', '1', '120303', '1553531234', '让球下注');
INSERT INTO `web_money_log` VALUES ('254', '1116', '95000.00', '100.00', '94900.00', '1', '120304', '1553531479', '让球下注');
INSERT INTO `web_money_log` VALUES ('255', '1116', '94900.00', '100.00', '94800.00', '1', '120305', '1553531624', '让球下注');
INSERT INTO `web_money_log` VALUES ('256', '1116', '94800.00', '100.00', '94700.00', '1', '120306', '1553531646', '让球下注');
INSERT INTO `web_money_log` VALUES ('257', '1116', '94700.00', '100.00', '94600.00', '1', '120307', '1553531737', '让球下注');
INSERT INTO `web_money_log` VALUES ('258', '1116', '94600.00', '100.00', '94500.00', '1', '120308', '1553531754', '让球下注');
INSERT INTO `web_money_log` VALUES ('259', '1116', '94500.00', '100.00', '94400.00', '1', '120309', '1553531938', '让球下注');
INSERT INTO `web_money_log` VALUES ('260', '1116', '94400.00', '100.00', '94300.00', '1', '120310', '1553532093', '让球下注');
INSERT INTO `web_money_log` VALUES ('261', '1116', '94300.00', '100.00', '94200.00', '1', '120311', '1553532167', '让球下注');
INSERT INTO `web_money_log` VALUES ('262', '1116', '94200.00', '100.00', '94100.00', '1', '120312', '1553532310', '让球下注');
INSERT INTO `web_money_log` VALUES ('263', '1116', '94100.00', '100.00', '94000.00', '1', '120313', '1553532421', '让球下注');
INSERT INTO `web_money_log` VALUES ('264', '1116', '94000.00', '100.00', '93900.00', '1', '120314', '1553533265', '让球下注');
INSERT INTO `web_money_log` VALUES ('265', '1116', '93900.00', '100.00', '93800.00', '1', '120315', '1553533903', '让球下注');
INSERT INTO `web_money_log` VALUES ('266', '1116', '93800.00', '100.00', '93700.00', '1', '120316', '1553534041', '让球下注');
INSERT INTO `web_money_log` VALUES ('267', '1116', '93700.00', '100.00', '93600.00', '1', '120317', '1553534247', '让球下注');
INSERT INTO `web_money_log` VALUES ('268', '1116', '93600.00', '100.00', '93500.00', '1', '120318', '1553568098', '让球下注');
INSERT INTO `web_money_log` VALUES ('269', '1116', '93500.00', '100.00', '93400.00', '1', '120319', '1553568156', '让球下注');
INSERT INTO `web_money_log` VALUES ('270', '1116', '93400.00', '400.00', '93000.00', '1', '120320', '1553572117', '让球下注');
INSERT INTO `web_money_log` VALUES ('271', '1116', '93000.00', '100.00', '92900.00', '1', '120321', '1553572332', '让球下注');
INSERT INTO `web_money_log` VALUES ('272', '1116', '92900.00', '100.00', '92800.00', '1', '120322', '1553576994', '让球下注');
INSERT INTO `web_money_log` VALUES ('273', '1116', '92800.00', '100.00', '92700.00', '1', '120323', '1553577014', '让球下注');
INSERT INTO `web_money_log` VALUES ('274', '1116', '92700.00', '100.00', '92600.00', '1', '120324', '1553577493', '让球下注');
INSERT INTO `web_money_log` VALUES ('275', '1058', '84554.00', '100.00', '84454.00', '1', '120325', '1553577907', '让球下注');
INSERT INTO `web_money_log` VALUES ('276', '1058', '84454.00', '100.00', '84354.00', '1', '120326', '1553577926', '让球下注');
INSERT INTO `web_money_log` VALUES ('277', '1058', '84354.00', '100.00', '84254.00', '1', '120327', '1553577940', '让球下注');
INSERT INTO `web_money_log` VALUES ('278', '1058', '84254.00', '100.00', '84154.00', '1', '120328', '1553579262', '让球下注');
INSERT INTO `web_money_log` VALUES ('279', '1058', '84154.00', '100.00', '84054.00', '1', '120329', '1553579507', '让球下注');
INSERT INTO `web_money_log` VALUES ('280', '1058', '84054.00', '100.00', '83954.00', '1', '120330', '1553579565', '让球下注');
INSERT INTO `web_money_log` VALUES ('282', '1030', '2499947.00', '10.00', '2499937.00', '9', '1070', '1553592633', '体育转账到ag');
INSERT INTO `web_money_log` VALUES ('283', '1030', '1062.00', '10.00', '1052.00', '10', '1071', '1553592671', 'MG转账到体育');
INSERT INTO `web_money_log` VALUES ('284', '1030', '2499947.00', '10.00', '2499937.00', '9', '1072', '1553593059', '体育转账到AG');
INSERT INTO `web_money_log` VALUES ('285', '1030', '1062.00', '10.00', '1052.00', '10', '1073', '1553593104', 'AG转账到体育');
INSERT INTO `web_money_log` VALUES ('286', '1116', '92600.00', '100.00', '92500.00', '1', '120331', '1553651938', '让球下注');
INSERT INTO `web_money_log` VALUES ('287', '1116', '92500.00', '100.00', '92400.00', '1', '120332', '1553651953', '让球下注');
INSERT INTO `web_money_log` VALUES ('288', '1116', '92400.00', '100.00', '92300.00', '1', '120333', '1553652071', '让球下注');
INSERT INTO `web_money_log` VALUES ('289', '1116', '92300.00', '100.00', '92200.00', '1', '120334', '1553652085', '让球下注');
INSERT INTO `web_money_log` VALUES ('290', '1116', '92200.00', '100.00', '92100.00', '1', '120335', '1553652194', '让球下注');
INSERT INTO `web_money_log` VALUES ('291', '1116', '92100.00', '100.00', '92000.00', '1', '120336', '1553652201', '让球下注');
INSERT INTO `web_money_log` VALUES ('292', '1116', '92000.00', '100.00', '91900.00', '1', '120337', '1553652343', '滚球让球下注');
INSERT INTO `web_money_log` VALUES ('293', '1116', '91900.00', '100.00', '91800.00', '1', '120338', '1553652371', '让球下注');
INSERT INTO `web_money_log` VALUES ('294', '1116', '91800.00', '100.00', '91700.00', '1', '120339', '1553652435', '让球下注');
INSERT INTO `web_money_log` VALUES ('295', '1116', '91700.00', '100.00', '91600.00', '1', '120340', '1553652499', '让球下注');
INSERT INTO `web_money_log` VALUES ('296', '1116', '91600.00', '100.00', '91500.00', '1', '120341', '1553653144', '让球下注');
INSERT INTO `web_money_log` VALUES ('297', '1116', '91500.00', '100.00', '91400.00', '1', '120342', '1553653198', '让球下注');
INSERT INTO `web_money_log` VALUES ('298', '1116', '91400.00', '100.00', '91300.00', '1', '120343', '1553653966', '让球下注');
INSERT INTO `web_money_log` VALUES ('299', '1116', '91300.00', '100.00', '91200.00', '1', '120344', '1553653992', '让球下注');
INSERT INTO `web_money_log` VALUES ('300', '1116', '91200.00', '100.00', '91100.00', '1', '120345', '1553654142', '让球下注');
INSERT INTO `web_money_log` VALUES ('301', '1116', '91100.00', '100.00', '91000.00', '1', '120346', '1553654161', '让球下注');
INSERT INTO `web_money_log` VALUES ('302', '1116', '91000.00', '100.00', '90900.00', '1', '120347', '1553654645', '让球下注');
INSERT INTO `web_money_log` VALUES ('303', '1116', '90900.00', '100.00', '90800.00', '1', '120348', '1553654671', '让球下注');
INSERT INTO `web_money_log` VALUES ('304', '1116', '90800.00', '100.00', '90700.00', '1', '120349', '1553655251', '让球下注');
INSERT INTO `web_money_log` VALUES ('305', '1116', '90700.00', '100.00', '90600.00', '1', '120350', '1553655629', '让球下注');
INSERT INTO `web_money_log` VALUES ('306', '1116', '90600.00', '100.00', '90500.00', '1', '120351', '1553655918', '让球下注');
INSERT INTO `web_money_log` VALUES ('307', '1116', '90500.00', '100.00', '90400.00', '1', '120352', '1553656328', '让球下注');
INSERT INTO `web_money_log` VALUES ('308', '1116', '90400.00', '100.00', '90300.00', '1', '120353', '1553656489', '让球下注');
INSERT INTO `web_money_log` VALUES ('309', '1116', '90300.00', '100.00', '90200.00', '1', '120354', '1553656507', '让球下注');
INSERT INTO `web_money_log` VALUES ('310', '1116', '90200.00', '100.00', '90100.00', '1', '120355', '1553657572', '让球下注');
INSERT INTO `web_money_log` VALUES ('311', '1116', '90100.00', '100.00', '90000.00', '1', '120356', '1553657581', '让球下注');
INSERT INTO `web_money_log` VALUES ('312', '1116', '90000.00', '100.00', '89900.00', '1', '120357', '1553657868', '让球下注');
INSERT INTO `web_money_log` VALUES ('313', '1116', '89900.00', '100.00', '89800.00', '1', '120358', '1553657881', '让球下注');
INSERT INTO `web_money_log` VALUES ('314', '1116', '89800.00', '100.00', '89700.00', '1', '120359', '1553657892', '让球下注');
INSERT INTO `web_money_log` VALUES ('315', '1116', '89700.00', '100.00', '89600.00', '1', '120360', '1553657892', '让球下注');
INSERT INTO `web_money_log` VALUES ('316', '1116', '89600.00', '100.00', '89500.00', '1', '120361', '1553657903', '让球下注');
INSERT INTO `web_money_log` VALUES ('317', '1116', '89500.00', '100.00', '89400.00', '1', '120362', '1553657903', '让球下注');
INSERT INTO `web_money_log` VALUES ('318', '1116', '89400.00', '100.00', '89300.00', '1', '120363', '1553658065', '让球下注');
INSERT INTO `web_money_log` VALUES ('319', '1101', '36000.00', '12000.00', '48000.00', '4', '33', '1556507816', '线下入款审核');
INSERT INTO `web_money_log` VALUES ('322', '1101', '48000.00', '-12000.00', '36000.00', '4', '33', '1556515088', '线下入款反审核');
INSERT INTO `web_money_log` VALUES ('323', '1258', '100.00', '-100.00', '0.00', '4', '30', '1556515377', '线下入款反审核');
INSERT INTO `web_money_log` VALUES ('324', '1258', '0.00', '100.00', '100.00', '4', '30', '1556515389', '线下入款审核');
INSERT INTO `web_money_log` VALUES ('325', '1044', '100000.00', '-10.00', '99990.00', '4', '1', '1557560963', '下注');
INSERT INTO `web_money_log` VALUES ('326', '1044', '99990.00', '-10.00', '99980.00', '4', '1', '1557561004', '下注');
INSERT INTO `web_money_log` VALUES ('327', '1044', '99980.00', '-10.00', '99970.00', '4', '1', '1557732742', '下注');
INSERT INTO `web_money_log` VALUES ('328', '1044', '99970.00', '-10.00', '99960.00', '4', '1', '1557732866', '下注');
INSERT INTO `web_money_log` VALUES ('329', '1044', '99960.00', '-11.00', '99949.00', '4', '1', '1557817675', '下注');
INSERT INTO `web_money_log` VALUES ('330', '1044', '99949.00', '-10.00', '99939.00', '4', '1', '1558167648', '下注');
INSERT INTO `web_money_log` VALUES ('331', '1044', '99939.00', '-10.00', '99929.00', '4', '1', '1558167975', '下注');

-- ----------------------------
-- Table structure for web_moneychange
-- ----------------------------
DROP TABLE IF EXISTS `web_moneychange`;
CREATE TABLE `web_moneychange` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `goldf` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '转换前金额',
  `gold` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '转换金额',
  `golds` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '转换后金额',
  `order_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单号',
  `add_date` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '插入时间',
  `change_type_id` tinyint(3) NOT NULL DEFAULT '0' COMMENT '关联额度转换类型表web_moneychange_type',
  `ip` bigint(10) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-失败1成功',
  `server_admin` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '总代理',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `order_code_idx` (`order_code`) USING BTREE,
  KEY `userid_idx` (`userid`) USING BTREE,
  KEY `add_date_idx` (`add_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1074 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='额度转换表\r\n';

-- ----------------------------
-- Records of web_moneychange
-- ----------------------------
INSERT INTO `web_moneychange` VALUES ('16', '1057', '100.00', '10.00', '110.00', 'AGToSP106420181209202444', '2019-01-11 11:47:52', '1', '3232267265', '1', 'leapi');
INSERT INTO `web_moneychange` VALUES ('17', '1057', '100.00', '10.00', '110.00', 'AGToSP10642018120920241', '2019-01-11 11:47:56', '1', '3232267265', '0', 'leapi');
INSERT INTO `web_moneychange` VALUES ('18', '1057', '100.00', '10.00', '10000.00', 'SPToAG52732158374854', '2019-01-11 11:48:06', '2', '3232267265', '1', 'leapi');
INSERT INTO `web_moneychange` VALUES ('19', '1057', '1000.00', '10.00', '10000.00', 'SPToCP52732158374854', '2019-01-11 11:48:09', '3', '3232267265', '1', 'leapi');
INSERT INTO `web_moneychange` VALUES ('20', '1057', '1000.00', '10.00', '10000.00', 'CPToSP52732158374854', '2019-01-11 11:48:10', '4', '3232267265', '1', 'leapi');
INSERT INTO `web_moneychange` VALUES ('21', '1057', '1000.00', '10.00', '10000.00', 'MGtoSP52732158374854', '2019-01-11 11:48:11', '5', '3232267265', '1', 'leapi');
INSERT INTO `web_moneychange` VALUES ('22', '1057', '100.00', '10.00', '10000.00', 'SPToMG52732158374854', '2019-01-11 11:48:19', '6', '3232267265', '0', 'leapi');
INSERT INTO `web_moneychange` VALUES ('23', '1042', '100.00', '10.00', '110.00', 'AGToSP1064201812092024441', '2019-01-11 11:47:52', '1', '3232267265', '1', 'leapi');
INSERT INTO `web_moneychange` VALUES ('24', '1042', '100.00', '10.00', '110.00', 'AGToSP1064201812092021411', '2019-01-11 11:47:56', '1', '3232267265', '0', 'leapi');
INSERT INTO `web_moneychange` VALUES ('25', '1042', '100.00', '10.00', '10000.00', 'SPToAG527321583748154', '2019-01-11 11:48:06', '2', '3232267265', '1', 'leapi');
INSERT INTO `web_moneychange` VALUES ('26', '1042', '1000.00', '10.00', '10000.00', 'SPToCP527321583741854', '2019-01-11 11:48:09', '3', '3232267265', '1', 'leapi');
INSERT INTO `web_moneychange` VALUES ('27', '1042', '1000.00', '10.00', '10000.00', 'CPToSP527321583741854', '2019-01-11 11:48:10', '4', '3232267265', '1', 'leapi');
INSERT INTO `web_moneychange` VALUES ('28', '1042', '1000.00', '10.00', '10000.00', 'MGtoSP527321583741854', '2019-01-11 11:48:11', '5', '3232267265', '1', 'leapi');
INSERT INTO `web_moneychange` VALUES ('29', '1042', '100.00', '10.00', '10000.00', 'SPToMG527321583748154', '2019-01-11 11:48:19', '6', '3232267265', '0', 'leapi');
INSERT INTO `web_moneychange` VALUES ('30', '1068', '100.00', '10.00', '110.00', 'AGToSP1064201811209202444', '2019-01-11 11:47:52', '1', '3232267265', '1', 'leapi');
INSERT INTO `web_moneychange` VALUES ('31', '1068', '100.00', '10.00', '110.00', 'AGToSP106420181120920241', '2019-01-11 11:47:56', '1', '3232267265', '0', 'leapi');
INSERT INTO `web_moneychange` VALUES ('32', '1068', '100.00', '10.00', '10000.00', 'SPToAG527321158374854', '2019-01-11 11:48:06', '2', '3232267265', '1', 'leapi');
INSERT INTO `web_moneychange` VALUES ('33', '1068', '1000.00', '10.00', '10000.00', 'SPToCP527312158374854', '2019-01-11 11:48:09', '3', '3232267265', '1', 'leapi');
INSERT INTO `web_moneychange` VALUES ('34', '1068', '1000.00', '10.00', '10000.00', 'CPToSP527312158374854', '2019-01-11 11:48:10', '4', '3232267265', '1', 'leapi');
INSERT INTO `web_moneychange` VALUES ('35', '1068', '1000.00', '10.00', '10000.00', 'MGtoSP527312158374854', '2019-01-11 11:48:11', '5', '3232267265', '1', 'leapi');
INSERT INTO `web_moneychange` VALUES ('36', '1068', '100.00', '10.00', '10000.00', 'SPToMG527321158374854', '2019-01-11 11:48:19', '6', '3232267265', '0', 'leapi');
INSERT INTO `web_moneychange` VALUES ('37', '1060', '100.00', '10.00', '110.00', 'AGToSP10642011811209202444', '2019-01-11 11:47:52', '1', '3232267265', '1', 'leapi');
INSERT INTO `web_moneychange` VALUES ('38', '1060', '100.00', '10.00', '110.00', 'AGToSP1064201811209210241', '2019-01-11 11:47:56', '1', '3232267265', '0', 'leapi');
INSERT INTO `web_moneychange` VALUES ('39', '1060', '100.00', '10.00', '10000.00', 'SPToAG5217321158374854', '2019-01-11 11:48:06', '2', '3232267265', '1', 'leapi');
INSERT INTO `web_moneychange` VALUES ('40', '1060', '1000.00', '10.00', '10000.00', 'SPToCP5127321158374854', '2019-01-11 11:48:09', '3', '3232267265', '1', 'leapi');
INSERT INTO `web_moneychange` VALUES ('41', '1060', '1000.00', '10.00', '10000.00', 'CPToSP5127321158374854', '2019-01-11 11:48:10', '4', '3232267265', '1', 'leapi');
INSERT INTO `web_moneychange` VALUES ('42', '1060', '1000.00', '10.00', '10000.00', 'MGtoSP5127321158374854', '2019-01-11 11:48:11', '5', '3232267265', '1', 'leapi');
INSERT INTO `web_moneychange` VALUES ('43', '1060', '100.00', '10.00', '10000.00', 'SPToMG5217321518374854', '2019-01-11 11:48:19', '6', '3232267265', '0', 'leapi');
INSERT INTO `web_moneychange` VALUES ('44', '1056', '100.00', '10.00', '110.00', 'AGToSP1064201182120920241', '2019-01-11 11:47:56', '1', '3232267265', '0', 'leapi');
INSERT INTO `web_moneychange` VALUES ('45', '1056', '100.00', '10.00', '10000.00', 'SPToAG5273211258374854', '2019-01-11 11:48:06', '2', '3232267265', '1', 'leapi');
INSERT INTO `web_moneychange` VALUES ('46', '1056', '1000.00', '10.00', '10000.00', 'SPToCP5273122158374854', '2019-01-11 11:48:09', '3', '3232267265', '1', 'leapi');
INSERT INTO `web_moneychange` VALUES ('47', '1056', '1000.00', '10.00', '10000.00', 'CPToSP5273122158374854', '2019-01-11 11:48:10', '4', '3232267265', '1', 'leapi');
INSERT INTO `web_moneychange` VALUES ('48', '1056', '1000.00', '10.00', '10000.00', 'MGtoSP5273122158374854', '2019-01-11 11:48:11', '5', '3232267265', '1', 'leapi');
INSERT INTO `web_moneychange` VALUES ('49', '1056', '100.00', '10.00', '10000.00', 'SPToMG5273221158374854', '2019-01-11 11:48:19', '6', '3232267265', '0', 'leapi');
INSERT INTO `web_moneychange` VALUES ('50', '1068', '100.00', '10.00', '110.00', 'AGToSP10642018112093202444', '2019-01-11 11:47:52', '1', '3232267265', '1', 'leapi');
INSERT INTO `web_moneychange` VALUES ('51', '1068', '100.00', '10.00', '110.00', 'AGToSP1064201811209320241', '2019-01-11 11:47:56', '1', '3232267265', '0', 'leapi');
INSERT INTO `web_moneychange` VALUES ('52', '1068', '100.00', '10.00', '10000.00', 'SPToAG5273211583374854', '2019-01-11 11:48:06', '2', '3232267265', '1', 'leapi');
INSERT INTO `web_moneychange` VALUES ('53', '1068', '1000.00', '10.00', '10000.00', 'SPToCP5273121583374854', '2019-01-11 11:48:09', '3', '3232267265', '1', 'leapi');
INSERT INTO `web_moneychange` VALUES ('54', '1068', '1000.00', '10.00', '10000.00', 'CPToSP5273121583374854', '2019-01-11 11:48:10', '4', '3232267265', '1', 'leapi');
INSERT INTO `web_moneychange` VALUES ('55', '1068', '1000.00', '10.00', '10000.00', 'MGtoSP5273121538374854', '2019-01-11 11:48:11', '5', '3232267265', '1', 'leapi');
INSERT INTO `web_moneychange` VALUES ('56', '1068', '100.00', '10.00', '10000.00', 'SPToMG5273211583374854', '2019-01-11 11:48:19', '6', '3232267265', '0', 'leapi');
INSERT INTO `web_moneychange` VALUES ('1061', '1030', '844.13', '10.00', '854.13', '13332649901', '2019-03-12 06:19:11', '2', '1122502860', '0', 'leapi');
INSERT INTO `web_moneychange` VALUES ('1062', '1030', '76.00', '10.00', '66.00', '', '2019-03-12 06:19:52', '2', '1122502860', '0', 'leapi');
INSERT INTO `web_moneychange` VALUES ('1064', '1030', '66.00', '10.00', '56.00', null, '2019-03-12 06:31:23', '4', '1122502860', '0', 'leapi');
INSERT INTO `web_moneychange` VALUES ('1065', '1030', '56.00', '10.00', '46.00', null, '2019-03-12 06:36:01', '4', '1122502860', '0', 'leapi');
INSERT INTO `web_moneychange` VALUES ('1066', '1030', '46.00', '10.00', '36.00', '13332919761', '2019-03-12 18:37:13', '4', '1122502860', '1', 'leapi');
INSERT INTO `web_moneychange` VALUES ('1067', '1030', '36.00', '10.00', '26.00', null, '2019-03-13 02:19:50', '4', '1122502860', '0', 'leapi');
INSERT INTO `web_moneychange` VALUES ('1070', '1030', '2499947.00', '10.00', '2499937.00', '20190326053033Fr35IN1030q', '2019-03-26 17:30:45', '2', '1122502860', '1', 'leapi');
INSERT INTO `web_moneychange` VALUES ('1071', '1030', '1062.00', '10.00', '1072.00', '20190326053059Dr35OUT1030F', '2019-03-26 05:31:11', '1', '1122502860', '1', 'leapi');
INSERT INTO `web_moneychange` VALUES ('1072', '1030', '2499947.00', '10.00', '2499937.00', '20190326053739Tr35IN1030n', '2019-03-26 17:37:51', '2', '1122502860', '1', 'leapi');
INSERT INTO `web_moneychange` VALUES ('1073', '1030', '1062.00', '10.00', '1072.00', '20190326053812xr35OUT1030H', '2019-03-26 05:38:24', '1', '1122502860', '1', 'leapi');

-- ----------------------------
-- Table structure for web_moneychange_type
-- ----------------------------
DROP TABLE IF EXISTS `web_moneychange_type`;
CREATE TABLE `web_moneychange_type` (
  `id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '额度转换类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of web_moneychange_type
-- ----------------------------
INSERT INTO `web_moneychange_type` VALUES ('1', 'AG转体育');
INSERT INTO `web_moneychange_type` VALUES ('2', '体育转AG');
INSERT INTO `web_moneychange_type` VALUES ('3', 'MG转体育');
INSERT INTO `web_moneychange_type` VALUES ('4', '体育转MG');
INSERT INTO `web_moneychange_type` VALUES ('5', '彩票转体育');
INSERT INTO `web_moneychange_type` VALUES ('6', '体育转彩票');

-- ----------------------------
-- Table structure for web_notices
-- ----------------------------
DROP TABLE IF EXISTS `web_notices`;
CREATE TABLE `web_notices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `context` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息内容',
  `alert` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '0-为登陆弹框1-支付中心弹框2-消息中心展示，012都会在消息中心展示',
  `type` tinyint(4) NOT NULL COMMENT '1-会员2-代理',
  `add_date` timestamp NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-正常1-伪删除',
  `server_admin` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '总代理',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `add_date_idx` (`add_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='消息中心表';

-- ----------------------------
-- Records of web_notices
-- ----------------------------
INSERT INTO `web_notices` VALUES ('15', '123', '123', '0', '1', '2019-04-27 09:46:42', '1', '123');
INSERT INTO `web_notices` VALUES ('16', '123', '123', '0', '1', '2019-04-27 09:48:08', '1', '123');
INSERT INTO `web_notices` VALUES ('17', '123', '123', '0', '1', '2019-04-27 09:51:38', '1', '123');
INSERT INTO `web_notices` VALUES ('18', '123', '123', '0', '1', '2019-04-27 09:52:17', '1', '123');
INSERT INTO `web_notices` VALUES ('19', '邱琦雯', '後來 我總算學會了如何去愛 可惜你早已遠去 消失在人海\r\n後來 終於在眼淚中明白 有些人 一旦錯過就不再\r\n梔子花白花瓣 落在我藍色百褶裙上\r\n愛你 你輕聲說 我低下頭聞見一陣芬芳\r\n那個永恆的夜晚 十七歲仲夏 你吻我的那個夜晚\r\n讓我往後的時光 每當有感嘆 總想起台北的星光\r\n那時候的愛情 為什麼就能那樣簡單\r\n而又是為什麼 人年少時 一定要讓深愛的人受傷\r\n在這相似的深夜裡 你是否一樣 也在靜靜追悔感傷\r\n如果當時我們能 不那麼倔強 現在也不那麼遺憾\r\n你都如何回憶我 帶著笑或是很沉默\r\n這些年來 有沒有人能讓你不寂寞\r\n後來 我總算學會了如何去愛 可惜你早已遠去 消失在人海\r\n後來 終於在眼淚中明白 有些人 一旦錯過就不再\r\n你都如何回憶我 帶著笑或是很沉默\r\n這些年來 有沒有人能讓你不寂寞\r\n後來 我總算學會了如何去愛 可惜你早已遠去 消失在人海\r\n後來 終於在眼淚中明白 有些人 一旦錯過就不再\r\n後來 我總算學會了如何去愛 可惜你早已遠去 消失在人海\r\n後來 終於在眼淚中明白 有些人 一旦錯過就不再\r\n永遠不會再重來 有一個男孩 愛著那個女孩', '0', '1', '2019-04-27 11:27:20', '0', '请问');
INSERT INTO `web_notices` VALUES ('20', 'qwe', 'qweqwe', '0', '1', '2019-04-29 09:53:11', '0', 'qwe');

-- ----------------------------
-- Table structure for web_pay_in
-- ----------------------------
DROP TABLE IF EXISTS `web_pay_in`;
CREATE TABLE `web_pay_in` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `goldf` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '存款前金额',
  `gold` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '存款金额',
  `golds` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '存款后金额',
  `order_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `youhui_gold` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '充值优惠金额',
  `add_date` timestamp NOT NULL COMMENT '插入时间',
  `notes` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `operator` int(5) DEFAULT NULL COMMENT '入款的人',
  `pay_id` int(11) NOT NULL COMMENT 'web_payment_data-线上/web_bank_data-线下',
  `pay_type_id` tinyint(3) NOT NULL DEFAULT '0' COMMENT '关联web_pay_type_name',
  `payment_name_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关联web_payment_name//这个字段先去掉',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-未审核2-已入款',
  `ip` bigint(10) NOT NULL,
  `type` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '支付方式类型：1，线上 2，线下 3， 额度转换 4，人工入款 5，活动入款',
  `server_admin` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '总代理',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `order_code_idx` (`order_code`) USING BTREE,
  KEY `userid_idx` (`userid`) USING BTREE,
  KEY `add_date_idx` (`add_date`) USING BTREE,
  KEY `status_idx` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='入款表\r\n';

-- ----------------------------
-- Records of web_pay_in
-- ----------------------------
INSERT INTO `web_pay_in` VALUES ('18', '1030', '55.00', '11.00', '66.00', 'hs201902191714414098638', '0.00', '2019-03-05 19:36:15', '', '1030', '6', '1', '154', '2', '2050489410', '1', 'leapi');
INSERT INTO `web_pay_in` VALUES ('19', '1058', '99999.00', '100.00', '100099.00', 'OfflinePayIn10581551857068', '0.00', '2019-03-06 03:24:28', null, null, '1', '0', '0', '0', '1122502860', '1', 'leapi');
INSERT INTO `web_pay_in` VALUES ('20', '1254', '0.00', '865369.00', '865369.00', 'OfflinePayIn12541551928903', '0.00', '2019-03-06 23:21:43', null, null, '1', '0', '0', '0', '1122502860', '1', 'leapi');
INSERT INTO `web_pay_in` VALUES ('21', '1101', '0.00', '50.00', '50.00', 'OfflinePayIn11011551930145', '0.00', '2019-03-06 23:42:25', null, null, '2', '0', '0', '0', '1122502860', '1', 'leapi');
INSERT INTO `web_pay_in` VALUES ('22', '1175', '0.00', '666.00', '666.00', 'OfflinePayIn11751551938526', '0.00', '2019-03-07 02:02:06', null, null, '5', '0', '0', '0', '1122502860', '1', 'leapi');
INSERT INTO `web_pay_in` VALUES ('23', '1177', '0.00', '556.00', '556.00', 'OfflinePayIn11771551938724', '0.00', '2019-03-07 02:05:24', null, null, '5', '0', '0', '0', '1122502860', '1', 'leapi');
INSERT INTO `web_pay_in` VALUES ('24', '1145', '0.00', '6666.00', '6666.00', 'OfflinePayIn11451551938816', '0.00', '2019-03-07 02:06:56', null, null, '4', '0', '0', '0', '1122502860', '1', 'leapi');
INSERT INTO `web_pay_in` VALUES ('25', '1255', '0.00', '3333.00', '3333.00', 'OfflinePayIn12551551939107', '0.00', '2019-03-07 02:11:47', null, null, '4', '0', '0', '0', '1122502860', '1', 'leapi');
INSERT INTO `web_pay_in` VALUES ('26', '1256', '0.00', '5566.00', '5566.00', 'OfflinePayIn12561551939413', '0.00', '2019-03-07 02:16:53', null, null, '4', '0', '0', '0', '1122502860', '1', 'leapi');
INSERT INTO `web_pay_in` VALUES ('27', '1257', '0.00', '3633.00', '3633.00', 'OfflinePayIn12571551941310', '0.00', '2019-03-07 02:48:30', null, null, '3', '0', '0', '0', '1122502860', '1', 'leapi');
INSERT INTO `web_pay_in` VALUES ('29', '1258', '0.00', '100.00', '100.00', 'OfflinePayIn12581552027211', '0.00', '2019-03-08 02:40:11', null, null, '1', '0', '0', '0', '1122502860', '1', 'leapi');
INSERT INTO `web_pay_in` VALUES ('30', '1258', '0.00', '100.00', '100.00', 'OfflinePayIn12581552027520', '0.00', '2019-03-08 14:57:31', null, '4', '1', '0', '0', '2', '1122502860', '2', 'leapi');
INSERT INTO `web_pay_in` VALUES ('31', '1071', '0.00', '300.00', '300.00', 'OfflinePayIn10711552270578', '0.00', '2019-03-10 22:16:18', null, null, '1', '0', '0', '0', '1122502860', '2', 'leapi');
INSERT INTO `web_pay_in` VALUES ('32', '1058', '99999.00', '55.00', '100054.00', 'OfflinePayIn10581552273891', '0.00', '2019-03-22 10:25:59', null, '6', '6', '0', '0', '2', '1122502860', '2', 'leapi');
INSERT INTO `web_pay_in` VALUES ('33', '1101', '0.00', '12000.00', '12000.00', 'OfflinePayIn11011552296403', '0.00', '2019-04-29 11:16:57', null, null, '8', '0', '0', '0', '1122502860', '2', 'leapi');

-- ----------------------------
-- Table structure for web_pay_level
-- ----------------------------
DROP TABLE IF EXISTS `web_pay_level`;
CREATE TABLE `web_pay_level` (
  `id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `level_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '层级名称',
  `reg_start` date NOT NULL COMMENT '开始注册时间',
  `reg_end` date NOT NULL COMMENT '结束注册时间',
  `mix_ctime` smallint(4) unsigned NOT NULL COMMENT '最低存款次数',
  `max_ctime` mediumint(7) unsigned NOT NULL COMMENT '最高存款次数',
  `mix_amount` decimal(11,2) unsigned NOT NULL COMMENT '最低存款金额',
  `max_amount` decimal(11,2) unsigned NOT NULL COMMENT '最高存款金额',
  `notes` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
  `server_admin` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '总代理',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='支付分层表\r\n';

-- ----------------------------
-- Records of web_pay_level
-- ----------------------------
INSERT INTO `web_pay_level` VALUES ('1', '测试分层一', '2018-03-20', '2020-02-20', '0', '10', '0.00', '50000.00', '测试分层一', 'leapi', '1');
INSERT INTO `web_pay_level` VALUES ('2', '测试分层二', '2018-03-20', '2020-02-20', '10', '999', '100.00', '2000000.00', '测试分层二', 'leapi', '1');
INSERT INTO `web_pay_level` VALUES ('3', '123', '2019-04-20', '2019-04-27', '0', '100', '0.00', '10000.00', '111123', '123', '0');

-- ----------------------------
-- Table structure for web_pay_out
-- ----------------------------
DROP TABLE IF EXISTS `web_pay_out`;
CREATE TABLE `web_pay_out` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `goldf` decimal(11,2) NOT NULL COMMENT '取款前金额',
  `gold` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '取款金额',
  `golds` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '取款后金额',
  `bank_id` int(10) NOT NULL COMMENT '出款银行卡ID',
  `order_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `add_date` timestamp NOT NULL COMMENT '插入时间',
  `notes` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `auditor` int(5) DEFAULT NULL COMMENT '审核人',
  `operator` int(5) DEFAULT NULL COMMENT '出款的人',
  `pay_id` int(11) NOT NULL DEFAULT '0' COMMENT 'web_payment_data的id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-未审核1-审核成功2-已出款-3-审核失败-4-出款中-5-撤销出款',
  `ip` bigint(10) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-会员提款1-代理提款3-人工扣款',
  `server_admin` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '总代理',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userid_idx` (`userid`) USING BTREE,
  KEY `add_data_idx` (`add_date`) USING BTREE,
  KEY `status_idx` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='出款表';

-- ----------------------------
-- Records of web_pay_out
-- ----------------------------
INSERT INTO `web_pay_out` VALUES ('1', '1033', '0.00', '111', '111', '0', 'Withdraw10331544193400', '2019-03-24 23:35:28', null, '4', null, '0', '1', '1729650217', '0', 'leapi');
INSERT INTO `web_pay_out` VALUES ('2', '1057', '100000.00', '100', '99900', '0', 'Withdraw10571546484228', '2019-01-03 11:00:50', null, null, null, '0', '2', '1122502860', '0', 'leapi');
INSERT INTO `web_pay_out` VALUES ('3', '1034', '10000.00', '100', '9900', '0', 'Withdraw10341546855059', '2019-03-24 23:37:10', null, '4', '4', '0', '2', '3482593356', '0', 'leapi');
INSERT INTO `web_pay_out` VALUES ('4', '1068', '100000.00', '100', '99900', '0', 'Withdraw10681546855196', '2019-03-24 23:35:24', null, '4', null, '0', '1', '3482593356', '0', 'leapi');
INSERT INTO `web_pay_out` VALUES ('5', '1057', '99999.00', '1000', '98999', '0', 'Withdraw10571547194950', '2019-03-24 23:35:25', null, '4', null, '0', '1', '3482593356', '0', 'leapi');
INSERT INTO `web_pay_out` VALUES ('6', '1116', '100000.00', '100', '99900', '81', 'Withdraw11161551161413', '2019-03-24 23:35:20', null, '4', null, '0', '0', '1122502860', '0', 'leapi');
INSERT INTO `web_pay_out` VALUES ('7', '1058', '100000.00', '1000', '99000', '78', 'Withdraw10581551161611', '2019-04-29 16:47:21', null, '4', '4', '0', '3', '1122502860', '0', 'leapi');
INSERT INTO `web_pay_out` VALUES ('9', '1030', '11.00', '10', '1', '0', 'manualSub15515124921030574', '2019-04-29 16:47:23', '测试', null, null, '0', '4', '1122502860', '3', 'leapi');
INSERT INTO `web_pay_out` VALUES ('10', '1030', '1.00', '10', '-9', '0', 'manualSub15515125051030348', '2019-03-02 15:41:45', '测试', null, null, '0', '2', '1122502860', '3', 'leapi');
INSERT INTO `web_pay_out` VALUES ('11', '1112', '1000000.00', '100', '999900', '1', 'Withdraw11121551691469', '2019-04-29 16:47:27', null, '4', null, '0', '5', '1122502860', '0', 'leapi');

-- ----------------------------
-- Table structure for web_pay_record
-- ----------------------------
DROP TABLE IF EXISTS `web_pay_record`;
CREATE TABLE `web_pay_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL COMMENT '会员id',
  `money` decimal(11,2) NOT NULL COMMENT '本次支付金额',
  `created_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `ip` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pay_type` tinyint(2) NOT NULL COMMENT '支付类型关联web_pay_type_name',
  `pay_id` int(3) NOT NULL COMMENT '关联web_payment_data',
  `payment_name_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联web_payment_name',
  `return_para` json NOT NULL COMMENT '存回调参数',
  `order_number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-未支付1-已支付',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-线上1-线下2-代理提款',
  `bank_id` int(3) NOT NULL COMMENT '关联web_bank_data',
  `server_admin` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '总代理',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userid_idx` (`userid`) USING BTREE,
  KEY `type_idx` (`type`) USING BTREE,
  KEY `order_code_idx` (`order_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=313 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='支付日志表';

-- ----------------------------
-- Records of web_pay_record
-- ----------------------------

-- ----------------------------
-- Table structure for web_pay_type_name
-- ----------------------------
DROP TABLE IF EXISTS `web_pay_type_name`;
CREATE TABLE `web_pay_type_name` (
  `id` tinyint(3) NOT NULL AUTO_INCREMENT COMMENT '主键（支付序列号）',
  `pay_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付方式名称',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '支付方式类型：1，线上 2，线下 3， 额度转换 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='支付类型字典表\r\n';

-- ----------------------------
-- Records of web_pay_type_name
-- ----------------------------
INSERT INTO `web_pay_type_name` VALUES ('1', '支付宝支付', '1');
INSERT INTO `web_pay_type_name` VALUES ('2', '微信支付', '1');
INSERT INTO `web_pay_type_name` VALUES ('3', 'QQ支付', '1');
INSERT INTO `web_pay_type_name` VALUES ('4', '快捷支付', '1');
INSERT INTO `web_pay_type_name` VALUES ('5', '银联支付', '1');
INSERT INTO `web_pay_type_name` VALUES ('6', '京东支付', '1');
INSERT INTO `web_pay_type_name` VALUES ('7', '在线网银', '1');
INSERT INTO `web_pay_type_name` VALUES ('8', '其他线上支付', '1');
INSERT INTO `web_pay_type_name` VALUES ('9', '银行转账', '2');
INSERT INTO `web_pay_type_name` VALUES ('10', '微信转账', '2');
INSERT INTO `web_pay_type_name` VALUES ('11', '支付宝转账', '2');
INSERT INTO `web_pay_type_name` VALUES ('12', '额度转换', '3');
INSERT INTO `web_pay_type_name` VALUES ('13', 'QQ转账', '2');
INSERT INTO `web_pay_type_name` VALUES ('14', '人工入款', '4');
INSERT INTO `web_pay_type_name` VALUES ('15', '活动入款', '5');

-- ----------------------------
-- Table structure for web_payment_data
-- ----------------------------
DROP TABLE IF EXISTS `web_payment_data`;
CREATE TABLE `web_payment_data` (
  `id` smallint(3) NOT NULL AUTO_INCREMENT,
  `account_company` varchar(30) NOT NULL DEFAULT '0' COMMENT '支付平台名称',
  `url` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '返回地址',
  `business_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户号',
  `baofooid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '终端号',
  `business_pwd` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '第一密钥',
  `key2` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '第二密钥',
  `pay_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '关联支付类型字段表pay_type_name',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-未启用1-已启用',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-入款1-出款',
  `total_money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '累计存取款金额',
  `total_time` int(11) NOT NULL DEFAULT '0' COMMENT '累计存取款次数',
  `level_id` int(3) NOT NULL DEFAULT '0' COMMENT '支付分层',
  `limit_min` decimal(11,0) NOT NULL DEFAULT '0' COMMENT '最低限额',
  `limit_max` decimal(11,0) NOT NULL DEFAULT '0' COMMENT '最高限额',
  `discount_rate` double(4,2) NOT NULL DEFAULT '0.00' COMMENT '优惠百分比',
  `notes` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `choose_bank` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否开启选择银行：0关闭，1开启',
  `pay_bank` text COMMENT '网银支持的银行类型',
  `fees_rate` decimal(6,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '手续费百分比',
  `server_admin` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '总代理',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `status_idx` (`status`) USING BTREE,
  KEY `type_idx` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='第三方支付配置表';

-- ----------------------------
-- Records of web_payment_data
-- ----------------------------
INSERT INTO `web_payment_data` VALUES ('13', '天天付', '', '54111', '', 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCxgT5BK6H4z0sz6yP7h8pP/3in\r\nj6wvWKorkI4xXKOVQcPsbkb3xHwVYBrIqZpvCYTRMddIdBxP94N/c4+0Zuu1VQQY\r\n6+VC/+vLTNPkDlYd4o2lL8fMXMm74y+rRql/Le5QiKrAik2ym7U7SDldleTAfu8b\r\ny0Y8KgfPGqEzgncdcQIDAQAB', '', '4', '1', '0', '0.00', '0', '1', '0', '0', '0.00', '', '0', '', '0.0000', 'admin');
INSERT INTO `web_payment_data` VALUES ('14', '百汇通', '', '1121', '', 'admin', '', '1', '0', '0', '0.00', '0', '1', '0', '0', '0.00', '', '1', 'CCB,ICBC,PSBC,CMB,CIB,BCM,CEB,CTTIC,SPDB,PINGAN,HXB', '0.0000', 'admin');
INSERT INTO `web_payment_data` VALUES ('15', '荣耀付', '', 'a121', '', 'dasw', '', '1', '0', '0', '0.00', '0', '1', '0', '0', '0.00', '', '1', 'CIB,BCM,CEB,CTTIC,SPDB,PINGAN,HXB', '0.0000', 'admin');

-- ----------------------------
-- Table structure for web_payment_name
-- ----------------------------
DROP TABLE IF EXISTS `web_payment_name`;
CREATE TABLE `web_payment_name` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pay_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '第三方支付名称，例：1-易付宝',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='第三方支付名称字典表';

-- ----------------------------
-- Records of web_payment_name
-- ----------------------------
INSERT INTO `web_payment_name` VALUES ('1', '易宝');
INSERT INTO `web_payment_name` VALUES ('2', '宝付');
INSERT INTO `web_payment_name` VALUES ('3', '智付');
INSERT INTO `web_payment_name` VALUES ('4', '闪付');
INSERT INTO `web_payment_name` VALUES ('5', '易付宝');
INSERT INTO `web_payment_name` VALUES ('6', '银宝');
INSERT INTO `web_payment_name` VALUES ('7', '乐盈');
INSERT INTO `web_payment_name` VALUES ('8', '金付卡');
INSERT INTO `web_payment_name` VALUES ('9', '魔宝');
INSERT INTO `web_payment_name` VALUES ('10', '迅汇');
INSERT INTO `web_payment_name` VALUES ('11', '秒付');
INSERT INTO `web_payment_name` VALUES ('12', '合利宝');
INSERT INTO `web_payment_name` VALUES ('13', '智汇付');
INSERT INTO `web_payment_name` VALUES ('14', 'e宝');
INSERT INTO `web_payment_name` VALUES ('15', '多德宝');
INSERT INTO `web_payment_name` VALUES ('16', '通宝');
INSERT INTO `web_payment_name` VALUES ('17', '银盛');
INSERT INTO `web_payment_name` VALUES ('18', '立刻付');
INSERT INTO `web_payment_name` VALUES ('19', '毕付');
INSERT INTO `web_payment_name` VALUES ('20', '仁信');
INSERT INTO `web_payment_name` VALUES ('21', '云盛');
INSERT INTO `web_payment_name` VALUES ('22', '路德');
INSERT INTO `web_payment_name` VALUES ('23', '顺宝');
INSERT INTO `web_payment_name` VALUES ('24', '新锐');
INSERT INTO `web_payment_name` VALUES ('25', '和宝');
INSERT INTO `web_payment_name` VALUES ('26', '信汇');
INSERT INTO `web_payment_name` VALUES ('27', '新码');
INSERT INTO `web_payment_name` VALUES ('28', '我付');
INSERT INTO `web_payment_name` VALUES ('29', '速汇宝');
INSERT INTO `web_payment_name` VALUES ('30', '高通');
INSERT INTO `web_payment_name` VALUES ('31', 'qyfpay');
INSERT INTO `web_payment_name` VALUES ('32', '企业微信');
INSERT INTO `web_payment_name` VALUES ('33', '合生');
INSERT INTO `web_payment_name` VALUES ('34', '易到');
INSERT INTO `web_payment_name` VALUES ('35', '优畅');
INSERT INTO `web_payment_name` VALUES ('36', '云付');
INSERT INTO `web_payment_name` VALUES ('37', '企业支付宝');
INSERT INTO `web_payment_name` VALUES ('38', '海鸥');
INSERT INTO `web_payment_name` VALUES ('39', '源支付');
INSERT INTO `web_payment_name` VALUES ('40', 'ak47pay');
INSERT INTO `web_payment_name` VALUES ('41', '迅捷通');
INSERT INTO `web_payment_name` VALUES ('42', '一码通');
INSERT INTO `web_payment_name` VALUES ('43', '长城付');
INSERT INTO `web_payment_name` VALUES ('44', '畅汇通');
INSERT INTO `web_payment_name` VALUES ('45', '华银');
INSERT INTO `web_payment_name` VALUES ('46', '启付通');
INSERT INTO `web_payment_name` VALUES ('47', '威付通');
INSERT INTO `web_payment_name` VALUES ('48', '汇通');
INSERT INTO `web_payment_name` VALUES ('49', '智通宝');
INSERT INTO `web_payment_name` VALUES ('50', 'pay32');
INSERT INTO `web_payment_name` VALUES ('51', '沃宝付');
INSERT INTO `web_payment_name` VALUES ('52', '优活');
INSERT INTO `web_payment_name` VALUES ('53', '聚点');
INSERT INTO `web_payment_name` VALUES ('54', 'QQ付');
INSERT INTO `web_payment_name` VALUES ('55', 'yhpay');
INSERT INTO `web_payment_name` VALUES ('56', '元启');
INSERT INTO `web_payment_name` VALUES ('57', '博士');
INSERT INTO `web_payment_name` VALUES ('58', '雅付');
INSERT INTO `web_payment_name` VALUES ('59', '新E付');
INSERT INTO `web_payment_name` VALUES ('60', '福卡通');
INSERT INTO `web_payment_name` VALUES ('61', 'bingo付');
INSERT INTO `web_payment_name` VALUES ('62', '飞秒付');
INSERT INTO `web_payment_name` VALUES ('63', '畅汇');
INSERT INTO `web_payment_name` VALUES ('64', '久通付');
INSERT INTO `web_payment_name` VALUES ('65', 'sapepay');
INSERT INTO `web_payment_name` VALUES ('66', '佰仟');
INSERT INTO `web_payment_name` VALUES ('67', '优米');
INSERT INTO `web_payment_name` VALUES ('68', '速龙支付');
INSERT INTO `web_payment_name` VALUES ('69', '国富通支付');
INSERT INTO `web_payment_name` VALUES ('70', 'alih5');
INSERT INTO `web_payment_name` VALUES ('71', 'upay支付');
INSERT INTO `web_payment_name` VALUES ('72', '信付通');
INSERT INTO `web_payment_name` VALUES ('73', 'jkpay');
INSERT INTO `web_payment_name` VALUES ('74', 'xgxpay');
INSERT INTO `web_payment_name` VALUES ('75', '汇天付');
INSERT INTO `web_payment_name` VALUES ('76', 'cfpay');
INSERT INTO `web_payment_name` VALUES ('77', 'lypay');
INSERT INTO `web_payment_name` VALUES ('78', '创富');
INSERT INTO `web_payment_name` VALUES ('79', '速付');
INSERT INTO `web_payment_name` VALUES ('80', '全银');
INSERT INTO `web_payment_name` VALUES ('81', '嘉亿');
INSERT INTO `web_payment_name` VALUES ('82', '彬德');
INSERT INTO `web_payment_name` VALUES ('83', '兴推');
INSERT INTO `web_payment_name` VALUES ('84', '金阳');
INSERT INTO `web_payment_name` VALUES ('85', '盒付');
INSERT INTO `web_payment_name` VALUES ('86', '企业QQ');
INSERT INTO `web_payment_name` VALUES ('87', '易联支付');
INSERT INTO `web_payment_name` VALUES ('88', '众信联支付');
INSERT INTO `web_payment_name` VALUES ('89', '智融宝');
INSERT INTO `web_payment_name` VALUES ('90', '云安付');
INSERT INTO `web_payment_name` VALUES ('91', '易充');
INSERT INTO `web_payment_name` VALUES ('92', '686支付');
INSERT INTO `web_payment_name` VALUES ('93', '随意支付');
INSERT INTO `web_payment_name` VALUES ('94', '南瓜支付');
INSERT INTO `web_payment_name` VALUES ('95', '小熊支付');
INSERT INTO `web_payment_name` VALUES ('96', '千禧(旧),');
INSERT INTO `web_payment_name` VALUES ('97', '佰亿支付');
INSERT INTO `web_payment_name` VALUES ('98', '亿金支付');
INSERT INTO `web_payment_name` VALUES ('99', '五福支付');
INSERT INTO `web_payment_name` VALUES ('100', '商易支付');
INSERT INTO `web_payment_name` VALUES ('101', '亿途卡支付');
INSERT INTO `web_payment_name` VALUES ('102', '卡拉支付');
INSERT INTO `web_payment_name` VALUES ('103', '自然支付(旧)');
INSERT INTO `web_payment_name` VALUES ('104', '艾付');
INSERT INTO `web_payment_name` VALUES ('105', '九域');
INSERT INTO `web_payment_name` VALUES ('106', '便利付');
INSERT INTO `web_payment_name` VALUES ('107', '个付');
INSERT INTO `web_payment_name` VALUES ('108', '九州');
INSERT INTO `web_payment_name` VALUES ('109', '联合');
INSERT INTO `web_payment_name` VALUES ('110', '艾玛');
INSERT INTO `web_payment_name` VALUES ('111', '博顺');
INSERT INTO `web_payment_name` VALUES ('112', '千禧(新)');
INSERT INTO `web_payment_name` VALUES ('113', '通宝');
INSERT INTO `web_payment_name` VALUES ('114', '乐享');
INSERT INTO `web_payment_name` VALUES ('115', '大富豪');
INSERT INTO `web_payment_name` VALUES ('116', '金顺');
INSERT INTO `web_payment_name` VALUES ('117', 'A9付');
INSERT INTO `web_payment_name` VALUES ('118', '今汇通');
INSERT INTO `web_payment_name` VALUES ('119', '彩付');
INSERT INTO `web_payment_name` VALUES ('120', '牛狗付');
INSERT INTO `web_payment_name` VALUES ('121', '云端支付');
INSERT INTO `web_payment_name` VALUES ('122', '八八支付');
INSERT INTO `web_payment_name` VALUES ('123', '98k支付');
INSERT INTO `web_payment_name` VALUES ('124', '中信(优活)');
INSERT INTO `web_payment_name` VALUES ('125', '奥邦');
INSERT INTO `web_payment_name` VALUES ('126', '捷付宝');
INSERT INTO `web_payment_name` VALUES ('127', '顺优付');
INSERT INTO `web_payment_name` VALUES ('128', '聚合支付');
INSERT INTO `web_payment_name` VALUES ('129', '付比支付');
INSERT INTO `web_payment_name` VALUES ('130', '先锋支付');
INSERT INTO `web_payment_name` VALUES ('131', '易达支付');
INSERT INTO `web_payment_name` VALUES ('134', '自然支付(新)');
INSERT INTO `web_payment_name` VALUES ('135', '个人支付');
INSERT INTO `web_payment_name` VALUES ('136', 'SHpay');
INSERT INTO `web_payment_name` VALUES ('137', '涉月宝');
INSERT INTO `web_payment_name` VALUES ('138', '华腾支付');
INSERT INTO `web_payment_name` VALUES ('139', '五易宝');
INSERT INTO `web_payment_name` VALUES ('140', '即付');
INSERT INTO `web_payment_name` VALUES ('141', '永福星');
INSERT INTO `web_payment_name` VALUES ('142', '万能付');
INSERT INTO `web_payment_name` VALUES ('143', '艺新');
INSERT INTO `web_payment_name` VALUES ('144', 'CK付');
INSERT INTO `web_payment_name` VALUES ('145', '新艺支付');
INSERT INTO `web_payment_name` VALUES ('146', '智能云支付');
INSERT INTO `web_payment_name` VALUES ('147', '361支付');
INSERT INTO `web_payment_name` VALUES ('148', '阿福支付');
INSERT INTO `web_payment_name` VALUES ('149', 'Q宝支付');
INSERT INTO `web_payment_name` VALUES ('150', '彩付通');
INSERT INTO `web_payment_name` VALUES ('151', '恒胜');
INSERT INTO `web_payment_name` VALUES ('152', '支付佳');
INSERT INTO `web_payment_name` VALUES ('153', '快付');
INSERT INTO `web_payment_name` VALUES ('154', '恒胜2');

-- ----------------------------
-- Table structure for web_proxy_ip
-- ----------------------------
DROP TABLE IF EXISTS `web_proxy_ip`;
CREATE TABLE `web_proxy_ip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) NOT NULL COMMENT '0所有都适用 1.足球滚球ip 2.篮球滚球ip  3.全部滚球ip 4.足球今日 5.篮球今日 6.足球早盘 7.篮球早盘 8.足球赛果 9.篮球赛果 10.球赛数量',
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `port` int(5) NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0正常 1手动停用 2.系统停用',
  `notes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备忘',
  `update_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of web_proxy_ip
-- ----------------------------
INSERT INTO `web_proxy_ip` VALUES ('146', '0', '121.136.10.140', '8080', '0', null, '2019-05-18 16:50:14');
INSERT INTO `web_proxy_ip` VALUES ('150', '0', '203.190.54.50', '8080', '0', null, '2019-05-18 16:50:14');
INSERT INTO `web_proxy_ip` VALUES ('151', '0', '103.24.93.16', '8110', '0', null, '2019-05-15 20:55:10');
INSERT INTO `web_proxy_ip` VALUES ('152', '0', '103.24.93.17', '8110', '0', null, '2019-05-15 20:55:10');
INSERT INTO `web_proxy_ip` VALUES ('153', '0', '103.24.93.18', '8110', '0', null, '2019-05-15 20:55:10');
INSERT INTO `web_proxy_ip` VALUES ('154', '0', '103.24.93.19', '8110', '0', null, '2019-05-15 20:55:10');
INSERT INTO `web_proxy_ip` VALUES ('155', '0', '103.24.93.20', '8110', '0', null, '2019-05-15 20:55:10');
INSERT INTO `web_proxy_ip` VALUES ('156', '0', '103.24.93.21', '8110', '0', null, '2019-05-15 20:55:10');
INSERT INTO `web_proxy_ip` VALUES ('157', '0', '103.24.93.22', '8110', '0', null, '2019-05-15 20:55:10');
INSERT INTO `web_proxy_ip` VALUES ('158', '0', '103.24.93.23', '8110', '0', null, '2019-05-15 20:55:10');
INSERT INTO `web_proxy_ip` VALUES ('159', '0', '103.24.93.24', '8110', '0', null, '2019-05-15 20:55:10');
INSERT INTO `web_proxy_ip` VALUES ('160', '0', '103.24.93.25', '8110', '0', null, '2019-05-15 20:55:10');
INSERT INTO `web_proxy_ip` VALUES ('161', '0', '103.24.93.26', '8110', '0', null, '2019-05-15 20:55:10');
INSERT INTO `web_proxy_ip` VALUES ('162', '0', '103.24.93.27', '8110', '0', null, '2019-05-15 20:55:10');
INSERT INTO `web_proxy_ip` VALUES ('163', '0', '103.24.93.67', '8110', '0', null, '2019-05-15 20:55:10');
INSERT INTO `web_proxy_ip` VALUES ('164', '0', '103.24.93.68', '8110', '0', null, '2019-05-15 20:55:10');
INSERT INTO `web_proxy_ip` VALUES ('165', '0', '103.24.93.69', '8110', '0', null, '2019-05-15 20:55:10');
INSERT INTO `web_proxy_ip` VALUES ('166', '0', '103.24.93.70', '8110', '0', null, '2019-05-15 20:55:10');
INSERT INTO `web_proxy_ip` VALUES ('167', '0', '103.24.93.71', '8110', '0', null, '2019-05-15 20:55:10');
INSERT INTO `web_proxy_ip` VALUES ('168', '0', '103.24.93.72', '8110', '0', null, '2019-05-15 20:55:10');
INSERT INTO `web_proxy_ip` VALUES ('169', '0', '103.24.93.73', '8110', '0', null, '2019-05-15 20:55:10');
INSERT INTO `web_proxy_ip` VALUES ('170', '0', '103.24.93.74', '8110', '0', null, '2019-05-15 20:55:10');
INSERT INTO `web_proxy_ip` VALUES ('171', '0', '103.24.93.75', '8110', '0', null, '2019-05-15 20:55:10');
INSERT INTO `web_proxy_ip` VALUES ('172', '0', '103.24.93.76', '8110', '0', null, '2019-05-15 20:55:10');
INSERT INTO `web_proxy_ip` VALUES ('173', '0', '103.24.93.77', '8110', '0', null, '2019-05-15 20:55:10');
INSERT INTO `web_proxy_ip` VALUES ('174', '0', '103.24.93.78', '8110', '0', null, '2019-05-15 20:55:10');
INSERT INTO `web_proxy_ip` VALUES ('175', '0', '103.24.93.79', '8110', '0', null, '2019-05-15 20:55:10');
INSERT INTO `web_proxy_ip` VALUES ('176', '0', '103.24.93.80', '8110', '0', null, '2019-05-15 20:55:10');
INSERT INTO `web_proxy_ip` VALUES ('177', '0', '103.24.93.81', '8110', '0', null, '2019-05-15 20:55:10');
INSERT INTO `web_proxy_ip` VALUES ('178', '0', '103.24.93.82', '8110', '0', null, '2019-05-15 20:55:10');
INSERT INTO `web_proxy_ip` VALUES ('179', '0', '103.24.93.83', '8110', '0', null, '2019-05-15 20:55:10');
INSERT INTO `web_proxy_ip` VALUES ('180', '0', '103.24.93.84', '8110', '0', null, '2019-05-15 20:55:10');
INSERT INTO `web_proxy_ip` VALUES ('181', '0', '103.24.93.85', '8110', '0', null, '2019-05-15 20:55:10');
INSERT INTO `web_proxy_ip` VALUES ('182', '0', '103.24.93.86', '8110', '0', null, '2019-05-15 20:55:10');
INSERT INTO `web_proxy_ip` VALUES ('183', '0', '103.24.93.87', '8110', '0', null, '2019-05-15 20:55:10');
INSERT INTO `web_proxy_ip` VALUES ('184', '0', '103.24.93.88', '8110', '0', null, '2019-05-15 20:55:10');
INSERT INTO `web_proxy_ip` VALUES ('185', '0', '103.24.93.89', '8110', '0', null, '2019-05-15 20:55:10');
INSERT INTO `web_proxy_ip` VALUES ('186', '0', '103.24.93.90', '8110', '0', null, '2019-05-15 20:55:10');

-- ----------------------------
-- Table structure for web_question_data
-- ----------------------------
DROP TABLE IF EXISTS `web_question_data`;
CREATE TABLE `web_question_data` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密保问题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='密保问题字典表';

-- ----------------------------
-- Records of web_question_data
-- ----------------------------
INSERT INTO `web_question_data` VALUES ('1', '您的第一份工作的公司名称');
INSERT INTO `web_question_data` VALUES ('2', '您初吻的城市');
INSERT INTO `web_question_data` VALUES ('3', '您最好朋友的名字');
INSERT INTO `web_question_data` VALUES ('4', '您的车牌号');
INSERT INTO `web_question_data` VALUES ('5', '您的出生地');
INSERT INTO `web_question_data` VALUES ('6', '您父亲的名字');
INSERT INTO `web_question_data` VALUES ('7', '您初中班主任的名字');

-- ----------------------------
-- Table structure for web_role_auth_map
-- ----------------------------
DROP TABLE IF EXISTS `web_role_auth_map`;
CREATE TABLE `web_role_auth_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(10) DEFAULT NULL COMMENT '角色id',
  `auth_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3354 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of web_role_auth_map
-- ----------------------------
INSERT INTO `web_role_auth_map` VALUES ('3196', '8', '1');
INSERT INTO `web_role_auth_map` VALUES ('3197', '8', '2');
INSERT INTO `web_role_auth_map` VALUES ('3198', '8', '8');
INSERT INTO `web_role_auth_map` VALUES ('3199', '8', '9');
INSERT INTO `web_role_auth_map` VALUES ('3200', '8', '10');
INSERT INTO `web_role_auth_map` VALUES ('3201', '8', '11');
INSERT INTO `web_role_auth_map` VALUES ('3202', '8', '12');
INSERT INTO `web_role_auth_map` VALUES ('3203', '8', '13');
INSERT INTO `web_role_auth_map` VALUES ('3204', '8', '14');
INSERT INTO `web_role_auth_map` VALUES ('3205', '8', '15');
INSERT INTO `web_role_auth_map` VALUES ('3206', '8', '21');
INSERT INTO `web_role_auth_map` VALUES ('3207', '8', '25');
INSERT INTO `web_role_auth_map` VALUES ('3208', '8', '26');
INSERT INTO `web_role_auth_map` VALUES ('3209', '8', '30');
INSERT INTO `web_role_auth_map` VALUES ('3210', '7', '1');
INSERT INTO `web_role_auth_map` VALUES ('3211', '7', '2');
INSERT INTO `web_role_auth_map` VALUES ('3212', '7', '7');
INSERT INTO `web_role_auth_map` VALUES ('3213', '7', '8');
INSERT INTO `web_role_auth_map` VALUES ('3214', '7', '9');
INSERT INTO `web_role_auth_map` VALUES ('3215', '7', '10');
INSERT INTO `web_role_auth_map` VALUES ('3216', '7', '11');
INSERT INTO `web_role_auth_map` VALUES ('3217', '7', '12');
INSERT INTO `web_role_auth_map` VALUES ('3218', '7', '13');
INSERT INTO `web_role_auth_map` VALUES ('3219', '7', '14');
INSERT INTO `web_role_auth_map` VALUES ('3220', '7', '15');
INSERT INTO `web_role_auth_map` VALUES ('3221', '7', '16');
INSERT INTO `web_role_auth_map` VALUES ('3222', '7', '17');
INSERT INTO `web_role_auth_map` VALUES ('3223', '7', '18');
INSERT INTO `web_role_auth_map` VALUES ('3224', '7', '19');
INSERT INTO `web_role_auth_map` VALUES ('3225', '7', '20');
INSERT INTO `web_role_auth_map` VALUES ('3226', '7', '21');
INSERT INTO `web_role_auth_map` VALUES ('3227', '7', '22');
INSERT INTO `web_role_auth_map` VALUES ('3228', '7', '23');
INSERT INTO `web_role_auth_map` VALUES ('3229', '7', '24');
INSERT INTO `web_role_auth_map` VALUES ('3230', '7', '25');
INSERT INTO `web_role_auth_map` VALUES ('3231', '7', '26');
INSERT INTO `web_role_auth_map` VALUES ('3232', '7', '27');
INSERT INTO `web_role_auth_map` VALUES ('3233', '7', '28');
INSERT INTO `web_role_auth_map` VALUES ('3234', '7', '29');
INSERT INTO `web_role_auth_map` VALUES ('3235', '7', '30');
INSERT INTO `web_role_auth_map` VALUES ('3236', '7', '31');
INSERT INTO `web_role_auth_map` VALUES ('3237', '7', '32');
INSERT INTO `web_role_auth_map` VALUES ('3238', '7', '33');
INSERT INTO `web_role_auth_map` VALUES ('3239', '2', '1');
INSERT INTO `web_role_auth_map` VALUES ('3240', '2', '2');
INSERT INTO `web_role_auth_map` VALUES ('3241', '2', '8');
INSERT INTO `web_role_auth_map` VALUES ('3242', '2', '9');
INSERT INTO `web_role_auth_map` VALUES ('3243', '2', '10');
INSERT INTO `web_role_auth_map` VALUES ('3244', '2', '11');
INSERT INTO `web_role_auth_map` VALUES ('3245', '2', '12');
INSERT INTO `web_role_auth_map` VALUES ('3246', '2', '13');
INSERT INTO `web_role_auth_map` VALUES ('3247', '2', '14');
INSERT INTO `web_role_auth_map` VALUES ('3248', '2', '15');
INSERT INTO `web_role_auth_map` VALUES ('3249', '2', '18');
INSERT INTO `web_role_auth_map` VALUES ('3250', '2', '19');
INSERT INTO `web_role_auth_map` VALUES ('3251', '2', '20');
INSERT INTO `web_role_auth_map` VALUES ('3252', '2', '21');
INSERT INTO `web_role_auth_map` VALUES ('3253', '2', '22');
INSERT INTO `web_role_auth_map` VALUES ('3254', '2', '23');
INSERT INTO `web_role_auth_map` VALUES ('3255', '2', '24');
INSERT INTO `web_role_auth_map` VALUES ('3256', '2', '25');
INSERT INTO `web_role_auth_map` VALUES ('3257', '2', '26');
INSERT INTO `web_role_auth_map` VALUES ('3258', '2', '30');
INSERT INTO `web_role_auth_map` VALUES ('3259', '2', '31');
INSERT INTO `web_role_auth_map` VALUES ('3260', '2', '32');
INSERT INTO `web_role_auth_map` VALUES ('3261', '2', '33');
INSERT INTO `web_role_auth_map` VALUES ('3262', '2', '34');
INSERT INTO `web_role_auth_map` VALUES ('3263', '2', '35');
INSERT INTO `web_role_auth_map` VALUES ('3264', '2', '39');
INSERT INTO `web_role_auth_map` VALUES ('3265', '2', '42');
INSERT INTO `web_role_auth_map` VALUES ('3266', '2', '43');
INSERT INTO `web_role_auth_map` VALUES ('3267', '2', '44');
INSERT INTO `web_role_auth_map` VALUES ('3268', '2', '46');
INSERT INTO `web_role_auth_map` VALUES ('3311', '1', '1');
INSERT INTO `web_role_auth_map` VALUES ('3312', '1', '2');
INSERT INTO `web_role_auth_map` VALUES ('3313', '1', '7');
INSERT INTO `web_role_auth_map` VALUES ('3314', '1', '8');
INSERT INTO `web_role_auth_map` VALUES ('3315', '1', '9');
INSERT INTO `web_role_auth_map` VALUES ('3316', '1', '10');
INSERT INTO `web_role_auth_map` VALUES ('3317', '1', '11');
INSERT INTO `web_role_auth_map` VALUES ('3318', '1', '12');
INSERT INTO `web_role_auth_map` VALUES ('3319', '1', '13');
INSERT INTO `web_role_auth_map` VALUES ('3320', '1', '14');
INSERT INTO `web_role_auth_map` VALUES ('3321', '1', '15');
INSERT INTO `web_role_auth_map` VALUES ('3322', '1', '16');
INSERT INTO `web_role_auth_map` VALUES ('3323', '1', '17');
INSERT INTO `web_role_auth_map` VALUES ('3324', '1', '18');
INSERT INTO `web_role_auth_map` VALUES ('3325', '1', '19');
INSERT INTO `web_role_auth_map` VALUES ('3326', '1', '20');
INSERT INTO `web_role_auth_map` VALUES ('3327', '1', '21');
INSERT INTO `web_role_auth_map` VALUES ('3328', '1', '22');
INSERT INTO `web_role_auth_map` VALUES ('3329', '1', '23');
INSERT INTO `web_role_auth_map` VALUES ('3330', '1', '24');
INSERT INTO `web_role_auth_map` VALUES ('3331', '1', '25');
INSERT INTO `web_role_auth_map` VALUES ('3332', '1', '26');
INSERT INTO `web_role_auth_map` VALUES ('3333', '1', '27');
INSERT INTO `web_role_auth_map` VALUES ('3334', '1', '28');
INSERT INTO `web_role_auth_map` VALUES ('3335', '1', '29');
INSERT INTO `web_role_auth_map` VALUES ('3336', '1', '30');
INSERT INTO `web_role_auth_map` VALUES ('3337', '1', '31');
INSERT INTO `web_role_auth_map` VALUES ('3338', '1', '32');
INSERT INTO `web_role_auth_map` VALUES ('3339', '1', '33');
INSERT INTO `web_role_auth_map` VALUES ('3340', '1', '34');
INSERT INTO `web_role_auth_map` VALUES ('3341', '1', '35');
INSERT INTO `web_role_auth_map` VALUES ('3342', '1', '36');
INSERT INTO `web_role_auth_map` VALUES ('3343', '1', '37');
INSERT INTO `web_role_auth_map` VALUES ('3344', '1', '38');
INSERT INTO `web_role_auth_map` VALUES ('3345', '1', '39');
INSERT INTO `web_role_auth_map` VALUES ('3346', '1', '40');
INSERT INTO `web_role_auth_map` VALUES ('3347', '1', '41');
INSERT INTO `web_role_auth_map` VALUES ('3348', '1', '42');
INSERT INTO `web_role_auth_map` VALUES ('3349', '1', '43');
INSERT INTO `web_role_auth_map` VALUES ('3350', '1', '44');
INSERT INTO `web_role_auth_map` VALUES ('3351', '1', '45');
INSERT INTO `web_role_auth_map` VALUES ('3352', '1', '46');
INSERT INTO `web_role_auth_map` VALUES ('3353', '1', '47');

-- ----------------------------
-- Table structure for web_role_info
-- ----------------------------
DROP TABLE IF EXISTS `web_role_info`;
CREATE TABLE `web_role_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name_CN` varchar(100) DEFAULT NULL COMMENT '角色中文名',
  `role_name_EN` varchar(100) DEFAULT NULL COMMENT '角色英文名',
  `role_desc` varchar(255) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of web_role_info
-- ----------------------------
INSERT INTO `web_role_info` VALUES ('1', '超级管理员', 'admin', '超级管理员');
INSERT INTO `web_role_info` VALUES ('2', '普通管理员', 'normal', '普通管理员');
INSERT INTO `web_role_info` VALUES ('7', '普通代理', 'agent', '普通代理');
INSERT INTO `web_role_info` VALUES ('8', '只读代理', 'readOnlyAgent', '只读账号代理');

-- ----------------------------
-- Table structure for web_rules_info
-- ----------------------------
DROP TABLE IF EXISTS `web_rules_info`;
CREATE TABLE `web_rules_info` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `rules` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对应的权限说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='权限字典表';

-- ----------------------------
-- Records of web_rules_info
-- ----------------------------
INSERT INTO `web_rules_info` VALUES ('1', '注单管理');
INSERT INTO `web_rules_info` VALUES ('2', '报表管理');
INSERT INTO `web_rules_info` VALUES ('3', '出入款配置');
INSERT INTO `web_rules_info` VALUES ('4', '现金系统');
INSERT INTO `web_rules_info` VALUES ('5', '管理员列表');
INSERT INTO `web_rules_info` VALUES ('6', '会员列表');
INSERT INTO `web_rules_info` VALUES ('7', '代理列表');
INSERT INTO `web_rules_info` VALUES ('8', '系统维护');
INSERT INTO `web_rules_info` VALUES ('9', '消息中心');
INSERT INTO `web_rules_info` VALUES ('10', '额度转换');
INSERT INTO `web_rules_info` VALUES ('11', '代理域名');
INSERT INTO `web_rules_info` VALUES ('12', '半场不结算');
INSERT INTO `web_rules_info` VALUES ('13', '站点配置');
INSERT INTO `web_rules_info` VALUES ('14', '活动管理');
INSERT INTO `web_rules_info` VALUES ('15', '日志管理');
INSERT INTO `web_rules_info` VALUES ('16', '健康管理');

-- ----------------------------
-- Table structure for web_score_change_ft
-- ----------------------------
DROP TABLE IF EXISTS `web_score_change_ft`;
CREATE TABLE `web_score_change_ft` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL COMMENT '球赛ID',
  `mb_team` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主队名称	',
  `tg_team` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客队名称',
  `mb_score` tinyint(3) NOT NULL COMMENT '主队进球',
  `tg_score` tinyint(3) NOT NULL COMMENT '客队进球',
  `m_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '进球时间',
  `m_start` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '赛事开始日期时间',
  `now_play` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '赛事进行阶段和时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `mid_idx` (`mid`) USING BTREE,
  KEY `m_time` (`m_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='足球比分变化记录表';

-- ----------------------------
-- Records of web_score_change_ft
-- ----------------------------

-- ----------------------------
-- Table structure for web_score_sports_bk
-- ----------------------------
DROP TABLE IF EXISTS `web_score_sports_bk`;
CREATE TABLE `web_score_sports_bk` (
  `mid` int(11) NOT NULL,
  `mb_team` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主队名称',
  `tg_team` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客队名称',
  `mb_score_q1` tinyint(3) NOT NULL COMMENT '第一节比分(主队）',
  `tg_score_q1` tinyint(3) NOT NULL COMMENT '第一节比分(客队）	',
  `mb_score_q2` tinyint(3) NOT NULL COMMENT '第二节比分(主队）',
  `tg_score_q2` tinyint(3) NOT NULL COMMENT '第二节比分(客队）',
  `mb_score_q3` tinyint(3) NOT NULL COMMENT '第三节比分(主队）',
  `tg_score_q3` tinyint(3) NOT NULL COMMENT '第三节比分(客队）',
  `mb_score_q4` tinyint(3) NOT NULL COMMENT '第四节比分(主队）',
  `tg_score_q4` tinyint(3) NOT NULL COMMENT '第四节比分(客队）',
  `mb_score_hr` tinyint(3) NOT NULL COMMENT '半场比分(主队）',
  `tg_score_hr` tinyint(3) NOT NULL COMMENT '半场比分(客队）',
  `mb_score` tinyint(3) NOT NULL COMMENT '全场比分(主队）',
  `tg_score` tinyint(3) NOT NULL COMMENT '全场比分(客队）',
  `mb_score_ot1` tinyint(3) NOT NULL COMMENT '加时比分1(主队）',
  `tb_score_ot1` tinyint(3) NOT NULL COMMENT '加时比分2(客队）',
  `mb_score_ot2` tinyint(3) NOT NULL COMMENT '加时比分2(主队）',
  `tb_score_ot2` tinyint(3) NOT NULL COMMENT '加时比分2(客队）',
  `m_date` date NOT NULL COMMENT '日期',
  PRIMARY KEY (`mid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='篮球比分变化记录表';

-- ----------------------------
-- Records of web_score_sports_bk
-- ----------------------------

-- ----------------------------
-- Table structure for web_sports_bifen
-- ----------------------------
DROP TABLE IF EXISTS `web_sports_bifen`;
CREATE TABLE `web_sports_bifen` (
  `mid` int(10) NOT NULL,
  `mleagueid` int(10) NOT NULL,
  `type` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mleague` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mbteam` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tgteam` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mdate` date NOT NULL,
  `datetimes` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `scoreFirstHalf` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `scoreFullCourt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `all` json DEFAULT NULL,
  `score1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `score2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `score3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `score4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0比分没有更新完 1 更新完毕 2 手动更新完毕 3上半场人工更新'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of web_sports_bifen
-- ----------------------------

-- ----------------------------
-- Table structure for web_sports_bill
-- ----------------------------
DROP TABLE IF EXISTS `web_sports_bill`;
CREATE TABLE `web_sports_bill` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `active` tinyint(2) DEFAULT NULL,
  `mid` int(10) DEFAULT NULL COMMENT '赛事ID',
  `mleagueid` int(10) DEFAULT NULL,
  `mtype` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '足球盘口类型 r 早盘 rb今日 re 滚球 or 冠军',
  `linetype` tinyint(2) DEFAULT NULL COMMENT '下注类型id//废弃',
  `bettime` timestamp NOT NULL,
  `gold` decimal(11,2) NOT NULL COMMENT '下注金额',
  `mdate` timestamp NULL DEFAULT NULL,
  `mrate` decimal(11,2) NOT NULL,
  `m_place` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `gwin` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '可赢金额',
  `m_result` decimal(11,2) DEFAULT '0.00' COMMENT '和会员结帐的金额',
  `show_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '下注球队H：主队；C客队',
  `cancel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否取消0-正常 1-取消',
  `type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `ptype` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '注单种类',
  `gtype` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT 'FT：足球；BK：篮球；TN：网球；VB：排球、羽毛球、乒乓球；BS：棒球；OP：其他',
  `mb_ball` tinyint(3) NOT NULL DEFAULT '0' COMMENT '主队得分',
  `tg_ball` tinyint(3) NOT NULL DEFAULT '0' COMMENT '客队得分',
  `checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-未结算1-结算',
  `confirmed` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1-取消2-赛事腰斩3-赛事改期4-赛事延期5-赛事延赛6-赛事取消7-赛事无PK加时8-球员弃权9-队名错误10-主客场错误11-先发投手更换12-选手更换13-联赛名称错误14-盘口错误15-提前开赛16-比分错误17-未接受注单18-进球取消19-红卡取消20-非正常投注21-赔率错误',
  `danger` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1-危险注单0-正常注单',
  `score1` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '下注時的比分',
  `score2` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `last_bet_money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '下注前金额',
  `agent_id` int(11) NOT NULL COMMENT '上级代理id',
  `betip` bigint(10) NOT NULL COMMENT '下注ip',
  `order_no` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '注单号',
  `after_bet_credit` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '下注后额度',
  `server_admin` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '平台',
  `mleague_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tgteam` varchar(50) DEFAULT NULL COMMENT '客队名称',
  `mbteam` varchar(50) DEFAULT NULL COMMENT '主队名称',
  `bill_val` varchar(255) DEFAULT NULL COMMENT '注单值',
  `event_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `orderno_idx` (`order_no`) USING BTREE,
  KEY `mid_idx` (`mid`) USING BTREE,
  KEY `bettime_idx` (`bettime`) USING BTREE,
  KEY `userid_idx` (`userid`) USING BTREE,
  KEY `username_idx` (`username`) USING BTREE,
  KEY `mdate_idx` (`mdate`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=120398 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='体育注单表';

-- ----------------------------
-- Records of web_sports_bill
-- ----------------------------

-- ----------------------------
-- Table structure for web_sports_bill_history
-- ----------------------------
DROP TABLE IF EXISTS `web_sports_bill_history`;
CREATE TABLE `web_sports_bill_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `active` tinyint(2) NOT NULL COMMENT '1-足球滚球11-足球单式2-篮球 22-篮球 3-棒球 33-棒球 4-网球 44-网球 5-排球 55-排球 6-其它 66-其它 7-指数 77-指数',
  `mid` int(10) NOT NULL COMMENT '赛事ID',
  `mleagueid` int(10) NOT NULL,
  `mtype` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '足球盘口类型 r 早盘 rb今日 re 滚球 or 冠军',
  `middle` json NOT NULL COMMENT '下注详情',
  `linetype` tinyint(2) NOT NULL COMMENT '下注类型id',
  `bettime` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `gold` decimal(11,2) NOT NULL COMMENT '下注金额',
  `mdate` date NOT NULL COMMENT ' 赛事日期',
  `mrate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `m_place` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `gwin` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '可赢金额',
  `m_result` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '和会员结帐的金额',
  `show_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '下注球队H：主队；C客队',
  `cancel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否取消0-正常 1-取消',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `ptype` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '注单种类',
  `gtype` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT 'FT：足球；BK：篮球；TN：网球；VB：排球、羽毛球、乒乓球；BS：棒球；OP：其他',
  `mb_ball` tinyint(3) NOT NULL DEFAULT '0' COMMENT '主队得分',
  `tg_ball` tinyint(3) NOT NULL DEFAULT '0' COMMENT '客队得分',
  `checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-未结算1-结算',
  `confirmed` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1-取消2-赛事腰斩3-赛事该期4-赛事延期5-赛事延赛6-赛事取消7-赛事无PK加时8-球员弃权9-队名错误10-主客场错误11-先发投手更换12-选手更换13-联赛名称错误14-盘口错误15-提前开赛16-比分错误17-未接受注单18-进球取消19-红卡取消20-非正常投注21-赔率错误',
  `danger` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1-危险注单0-正常注单',
  `score1` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '下注時的比分',
  `score2` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `last_bet_money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '下注前金额',
  `agent_id` int(11) NOT NULL COMMENT '上级代理id',
  `betip` bigint(10) NOT NULL COMMENT '下注ip',
  `server_admin` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '平台',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of web_sports_bill_history
-- ----------------------------

-- ----------------------------
-- Table structure for web_sports_bill_mix
-- ----------------------------
DROP TABLE IF EXISTS `web_sports_bill_mix`;
CREATE TABLE `web_sports_bill_mix` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mid` int(10) NOT NULL COMMENT '赛事ID',
  `mleagueid` int(10) NOT NULL,
  `mtype` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '足球盘口类型 r 早盘 rb今日 re 滚球 or 冠军',
  `mrate` decimal(11,2) NOT NULL,
  `m_place` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0',
  `show_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '下注球队H：主队；C客队',
  `type` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0',
  `ptype` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '注单种类',
  `gtype` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT 'FT：足球；BK：篮球；TN：网球；VB：排球、羽毛球、乒乓球；BS：棒球；OP：其他',
  `mb_ball` tinyint(3) NOT NULL DEFAULT '0' COMMENT '主队得分',
  `tg_ball` tinyint(3) NOT NULL DEFAULT '0' COMMENT '客队得分',
  `confirmed` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1-取消2-赛事腰斩3-赛事改期4-赛事延期5-赛事延赛6-赛事取消7-赛事无PK加时8-球员弃权9-队名错误10-主客场错误11-先发投手更换12-选手更换13-联赛名称错误14-盘口错误15-提前开赛16-比分错误17-未接受注单18-进球取消19-红卡取消20-非正常投注21-赔率错误',
  `checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-未结算1-输 2=赢',
  `order_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '注单id',
  `mdate` timestamp NOT NULL,
  `mleague_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `event_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `mid_idx` (`mid`) USING BTREE,
  KEY `order_idx` (`order_no`) USING BTREE,
  KEY `mdate` (`mdate`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=120370 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='串场注单子表';

-- ----------------------------
-- Records of web_sports_bill_mix
-- ----------------------------

-- ----------------------------
-- Table structure for web_sports_hot
-- ----------------------------
DROP TABLE IF EXISTS `web_sports_hot`;
CREATE TABLE `web_sports_hot` (
  `mid` int(10) NOT NULL DEFAULT '10' COMMENT '赛事id',
  `mleagueid` int(10) NOT NULL COMMENT '联赛id',
  `mleague` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联赛名',
  `mbteam` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主队名',
  `tgteam` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客队名',
  `type` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '游戏类型',
  `mdate` date NOT NULL COMMENT '开赛日期',
  `mtime` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开赛时间',
  `status` tinyint(1) NOT NULL COMMENT '0正常 1取消',
  `server_admin` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '平台标识'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of web_sports_hot
-- ----------------------------
INSERT INTO `web_sports_hot` VALUES ('2935535', '27942', '西班牙杯', '赫塔菲', '巴拉多利德', 'ft', '2019-01-09', '15:30', '0', 'leapi');
INSERT INTO `web_sports_hot` VALUES ('2935525', '27942', '西班牙杯', '赫罗纳', '马德里体育会', 'ft', '2019-01-09', '14:30', '0', 'leapi');
INSERT INTO `web_sports_hot` VALUES ('2932924', '28649', '法国甲组联赛', '里昂', '兰斯', 'ft', '2019-01-11', '15:45', '0', 'leapi');
INSERT INTO `web_sports_hot` VALUES ('2935567', '27942', '西班牙杯', '皇家贝迪斯', '皇家苏斯达', 'ft', '2019-01-10', '15:30', '0', 'leapi');
INSERT INTO `web_sports_hot` VALUES ('2938742', '26326', '英格兰冠军联赛', '利兹联', '德比郡', 'ft', '2019-01-11', '15:45', '0', 'leapi');
INSERT INTO `web_sports_hot` VALUES ('2932943', '28649', '法国甲组联赛', '第戎 ', '蒙彼利埃', 'ft', '2019-01-13', '12:00', '0', 'leapi');

-- ----------------------------
-- Table structure for web_sports_shield
-- ----------------------------
DROP TABLE IF EXISTS `web_sports_shield`;
CREATE TABLE `web_sports_shield` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `m_id` int(10) NOT NULL COMMENT '赛事id/联赛id',
  `mleague` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联赛名',
  `mbteam` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '主队名',
  `tgteam` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '客队名',
  `sportType` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '球赛类型',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1 是屏蔽单场赛事2屏蔽整个联赛',
  `server_admin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '平台标识',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `m_id` (`m_id`) USING BTREE COMMENT 'mid'
) ENGINE=InnoDB AUTO_INCREMENT=666 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='赛事屏蔽表';

-- ----------------------------
-- Records of web_sports_shield
-- ----------------------------

-- ----------------------------
-- Table structure for web_sports_sum
-- ----------------------------
DROP TABLE IF EXISTS `web_sports_sum`;
CREATE TABLE `web_sports_sum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agents_id` int(10) NOT NULL COMMENT '上级代理',
  `userid` int(10) NOT NULL,
  `nums` int(11) NOT NULL COMMENT '注单数',
  `date` date NOT NULL COMMENT '日期',
  `user_win` decimal(11,2) NOT NULL COMMENT '会员输赢',
  `bets_money` decimal(11,2) NOT NULL COMMENT '下注金额',
  `valid_money` decimal(11,2) NOT NULL COMMENT '有效金额',
  `server_admin` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '总代理',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `userid_idx` (`userid`,`date`) USING BTREE,
  KEY `server_admin_idx` (`server_admin`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='体育注单汇总表';

-- ----------------------------
-- Records of web_sports_sum
-- ----------------------------

-- ----------------------------
-- Table structure for web_system_data
-- ----------------------------
DROP TABLE IF EXISTS `web_system_data`;
CREATE TABLE `web_system_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_date` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '注册时间',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '0-超级管理员，1-普通管理员',
  `alias` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员明码名字',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-正常1-冻结2-伪删除',
  `agent_flag` int(1) NOT NULL DEFAULT '0' COMMENT '代理用户标识  1 代理用户 0 后台管理系统用户',
  `server_admin` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '总代理',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username_idx` (`username`,`server_admin`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员表';

-- ----------------------------
-- Records of web_system_data
-- ----------------------------
INSERT INTO `web_system_data` VALUES ('8', 'admin', '2019-04-20 11:12:31', '30231B277B7F621C4A11E1A8AE2A625C', '1', '系统管理员', '0', '2', 'leapi');
INSERT INTO `web_system_data` VALUES ('14', 'test66', '2019-05-24 15:32:07', '30231B277B7F621C4A11E1A8AE2A625C', '2', 'test66', '0', '0', 'leapi');
INSERT INTO `web_system_data` VALUES ('15', 'stamp', '2019-04-20 11:37:02', '30231B277B7F621C4A11E1A8AE2A625C', '7', 'stamp', '0', '1', 'leapi');
INSERT INTO `web_system_data` VALUES ('17', 'agent', '2019-05-24 15:38:04', '30231B277B7F621C4A11E1A8AE2A625C', '8', '测试代理', '0', '1', 'leapi');
INSERT INTO `web_system_data` VALUES ('18', 'test', '2019-05-25 11:52:32', '30231B277B7F621C4A11E1A8AE2A625C', '1', '测试', '0', '0', 'leapi');

-- ----------------------------
-- Table structure for web_system_log
-- ----------------------------
DROP TABLE IF EXISTS `web_system_log`;
CREATE TABLE `web_system_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(5) NOT NULL COMMENT '用户ID',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `ip` varchar(50) NOT NULL COMMENT 'IP地址',
  `datetime` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `param` varchar(1000) DEFAULT NULL,
  `type` tinyint(1) NOT NULL COMMENT '0-管理员1-代理2-会员',
  `server_admin` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `admin_id_idx` (`user_id`) USING BTREE,
  KEY `datetime_idx` (`datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=600 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统日志表';

-- ----------------------------
-- Records of web_system_log
-- ----------------------------
INSERT INTO `web_system_log` VALUES ('181', '8', 'admin', '0:0:0:0:0:0:0:1', '2019-05-27 10:56:42', '/logout', '', '0', 'leapi');
INSERT INTO `web_system_log` VALUES ('182', '8', 'admin', '0:0:0:0:0:0:0:1', '2019-05-27 10:56:45', '用户登录 >> 后台管理系统', '', '0', 'leapi');
INSERT INTO `web_system_log` VALUES ('183', '8', 'admin', '0:0:0:0:0:0:0:1', '2019-05-27 10:56:47', '/admin/userList', '{\"userName\":\"\",\"alias\":\"\",\"agentFlag\":\"-1\",\"status\":\"-1\",\"filterTime\":\"2019-05-20 00:00:00 - 2019-05-27 23:59:59\",\"\":\"\",\"beginTime\":\"2019-05-20 00:00:00\",\"endTime\":\"2019-05-27 23:59:59\",\"start\":0,\"length\":10}', '0', 'leapi');
INSERT INTO `web_system_log` VALUES ('184', '8', 'admin', '0:0:0:0:0:0:0:1', '2019-05-27 10:57:12', '用户登录 >> 代理系统', '', '1', 'leapi');
INSERT INTO `web_system_log` VALUES ('185', '8', 'admin', '0:0:0:0:0:0:0:1', '2019-05-27 10:57:14', '/bill/playTypes', '', '1', 'leapi');
INSERT INTO `web_system_log` VALUES ('186', '8', 'admin', '0:0:0:0:0:0:0:1', '2019-05-27 10:57:15', '/bill/billConfirmeTypes', '', '1', 'leapi');
INSERT INTO `web_system_log` VALUES ('187', '8', 'admin', '0:0:0:0:0:0:0:1', '2019-05-27 10:57:15', '/bill/sportBills', '{\"userName\":\"\",\"orderNo\":\"\",\"filterTime\":\"2019-05-20 00:00:00 - 2019-05-27 23:59:59\",\"gType\":\"\",\"pType\":\"\",\"checked\":\"-1\",\"\":\"\",\"beginTime\":\"2019-05-20 00:00:00\",\"endTime\":\"2019-05-27 23:59:59\",\"start\":0,\"length\":10}', '1', 'leapi');
INSERT INTO `web_system_log` VALUES ('188', '8', 'admin', '0:0:0:0:0:0:0:1', '2019-05-27 10:57:18', '/bill/lotteryBills', '{\"orderNumber\":\"\",\"round\":\"\",\"countStatus\":\"-1\",\"filterTime\":\"2019-05-20 00:00:00 - 2019-05-27 23:59:59\",\"\":\"\",\"beginTime\":\"2019-05-20 00:00:00\",\"endTime\":\"2019-05-27 23:59:59\",\"start\":0,\"length\":10}', '1', 'leapi');
INSERT INTO `web_system_log` VALUES ('189', '8', 'admin', '0:0:0:0:0:0:0:1', '2019-05-27 10:57:24', '用户登录 >> 后台管理系统', '', '0', 'leapi');
INSERT INTO `web_system_log` VALUES ('190', '8', 'admin', '0:0:0:0:0:0:0:1', '2019-05-27 10:57:26', '/admin/userList', '{\"userName\":\"\",\"alias\":\"\",\"agentFlag\":\"-1\",\"status\":\"-1\",\"filterTime\":\"2019-05-20 00:00:00 - 2019-05-27 23:59:59\",\"\":\"\",\"beginTime\":\"2019-05-20 00:00:00\",\"endTime\":\"2019-05-27 23:59:59\",\"start\":0,\"length\":10}', '0', 'leapi');
INSERT INTO `web_system_log` VALUES ('191', '8', 'admin', '0:0:0:0:0:0:0:1', '2019-05-27 11:00:42', '/dict/enumTypeList', '{\"name\":\"\",\"code\":\"\",\"\":\"\",\"start\":0,\"length\":10}', '0', 'leapi');
INSERT INTO `web_system_log` VALUES ('192', '8', 'admin', '0:0:0:0:0:0:0:1', '2019-05-27 11:04:17', '/limit/bkConfigs', '', '0', 'leapi');
-- ----------------------------
-- Table structure for web_website_info
-- ----------------------------
DROP TABLE IF EXISTS `web_website_info`;
CREATE TABLE `web_website_info` (
  `server_admin` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '总代理',
  `kefu_tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客服电话',
  `tousu_tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投诉电话',
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `online_kefu` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '在线客服',
  `bf_domain` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '比分网址',
  `wechart_image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信客服二维码',
  UNIQUE KEY `server_admin_idx` (`server_admin`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='网站基本信息表';

-- ----------------------------
-- Records of web_website_info
-- ----------------------------
INSERT INTO `web_website_info` VALUES ('leapi', '+63123456789', '', '', 'https://szzero.livechatvalue.com/chat/chatClient/chatbox.jsp?companyID=752050&configID=54206&jid=2152723166&s=1', '', '');

-- ----------------------------
-- Table structure for web_withdraw_name
-- ----------------------------
DROP TABLE IF EXISTS `web_withdraw_name`;
CREATE TABLE `web_withdraw_name` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pay_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '第三方名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='提现出款第三方名称';

-- ----------------------------
-- Records of web_withdraw_name
-- ----------------------------
INSERT INTO `web_withdraw_name` VALUES ('1', '全银');
INSERT INTO `web_withdraw_name` VALUES ('2', '优活');
INSERT INTO `web_withdraw_name` VALUES ('3', '新汇');
INSERT INTO `web_withdraw_name` VALUES ('4', '新E付');
INSERT INTO `web_withdraw_name` VALUES ('5', '久通');

-- ----------------------------
-- Table structure for web_xq_defrate
-- ----------------------------
DROP TABLE IF EXISTS `web_xq_defrate`;
CREATE TABLE `web_xq_defrate` (
  `id` int(11) NOT NULL,
  `classid` int(11) NOT NULL COMMENT '对应退水的id',
  `class1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `class2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `class3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='小球默认赔率信息';

-- ----------------------------
-- Records of web_xq_defrate
-- ----------------------------
INSERT INTO `web_xq_defrate` VALUES ('1510', '112', '全不中', '九不中', '10');
INSERT INTO `web_xq_defrate` VALUES ('1509', '112', '全不中', '九不中', '9');
INSERT INTO `web_xq_defrate` VALUES ('1508', '112', '全不中', '九不中', '8');
INSERT INTO `web_xq_defrate` VALUES ('1507', '112', '全不中', '九不中', '7');
INSERT INTO `web_xq_defrate` VALUES ('1506', '112', '全不中', '九不中', '6');
INSERT INTO `web_xq_defrate` VALUES ('1505', '112', '全不中', '九不中', '5');
INSERT INTO `web_xq_defrate` VALUES ('1504', '112', '全不中', '九不中', '4');
INSERT INTO `web_xq_defrate` VALUES ('1503', '112', '全不中', '九不中', '3');
INSERT INTO `web_xq_defrate` VALUES ('1502', '112', '全不中', '九不中', '2');
INSERT INTO `web_xq_defrate` VALUES ('1501', '112', '全不中', '九不中', '1');
INSERT INTO `web_xq_defrate` VALUES ('1299', '111', '全不中', '八不中', '49');
INSERT INTO `web_xq_defrate` VALUES ('1298', '111', '全不中', '八不中', '48');
INSERT INTO `web_xq_defrate` VALUES ('1297', '111', '全不中', '八不中', '47');
INSERT INTO `web_xq_defrate` VALUES ('1296', '111', '全不中', '八不中', '46');
INSERT INTO `web_xq_defrate` VALUES ('1295', '111', '全不中', '八不中', '45');
INSERT INTO `web_xq_defrate` VALUES ('1294', '111', '全不中', '八不中', '44');
INSERT INTO `web_xq_defrate` VALUES ('1293', '111', '全不中', '八不中', '43');
INSERT INTO `web_xq_defrate` VALUES ('1292', '111', '全不中', '八不中', '42');
INSERT INTO `web_xq_defrate` VALUES ('1291', '111', '全不中', '八不中', '41');
INSERT INTO `web_xq_defrate` VALUES ('1290', '111', '全不中', '八不中', '40');
INSERT INTO `web_xq_defrate` VALUES ('1289', '111', '全不中', '八不中', '39');
INSERT INTO `web_xq_defrate` VALUES ('1288', '111', '全不中', '八不中', '38');
INSERT INTO `web_xq_defrate` VALUES ('1287', '111', '全不中', '八不中', '37');
INSERT INTO `web_xq_defrate` VALUES ('1286', '111', '全不中', '八不中', '36');
INSERT INTO `web_xq_defrate` VALUES ('1285', '111', '全不中', '八不中', '35');
INSERT INTO `web_xq_defrate` VALUES ('1284', '111', '全不中', '八不中', '34');
INSERT INTO `web_xq_defrate` VALUES ('1283', '111', '全不中', '八不中', '33');
INSERT INTO `web_xq_defrate` VALUES ('1282', '111', '全不中', '八不中', '32');
INSERT INTO `web_xq_defrate` VALUES ('1281', '111', '全不中', '八不中', '31');
INSERT INTO `web_xq_defrate` VALUES ('1280', '111', '全不中', '八不中', '30');
INSERT INTO `web_xq_defrate` VALUES ('1279', '111', '全不中', '八不中', '29');
INSERT INTO `web_xq_defrate` VALUES ('1278', '111', '全不中', '八不中', '28');
INSERT INTO `web_xq_defrate` VALUES ('1277', '111', '全不中', '八不中', '27');
INSERT INTO `web_xq_defrate` VALUES ('1276', '111', '全不中', '八不中', '26');
INSERT INTO `web_xq_defrate` VALUES ('1275', '111', '全不中', '八不中', '25');
INSERT INTO `web_xq_defrate` VALUES ('1274', '111', '全不中', '八不中', '24');
INSERT INTO `web_xq_defrate` VALUES ('1273', '111', '全不中', '八不中', '23');
INSERT INTO `web_xq_defrate` VALUES ('1272', '111', '全不中', '八不中', '22');
INSERT INTO `web_xq_defrate` VALUES ('1271', '111', '全不中', '八不中', '21');
INSERT INTO `web_xq_defrate` VALUES ('1270', '111', '全不中', '八不中', '20');
INSERT INTO `web_xq_defrate` VALUES ('1269', '111', '全不中', '八不中', '19');
INSERT INTO `web_xq_defrate` VALUES ('1268', '111', '全不中', '八不中', '18');
INSERT INTO `web_xq_defrate` VALUES ('1267', '111', '全不中', '八不中', '17');
INSERT INTO `web_xq_defrate` VALUES ('1266', '111', '全不中', '八不中', '16');
INSERT INTO `web_xq_defrate` VALUES ('1265', '111', '全不中', '八不中', '15');
INSERT INTO `web_xq_defrate` VALUES ('1264', '111', '全不中', '八不中', '14');
INSERT INTO `web_xq_defrate` VALUES ('1263', '111', '全不中', '八不中', '13');
INSERT INTO `web_xq_defrate` VALUES ('1262', '111', '全不中', '八不中', '12');
INSERT INTO `web_xq_defrate` VALUES ('1261', '111', '全不中', '八不中', '11');
INSERT INTO `web_xq_defrate` VALUES ('1260', '111', '全不中', '八不中', '10');
INSERT INTO `web_xq_defrate` VALUES ('1259', '111', '全不中', '八不中', '9');
INSERT INTO `web_xq_defrate` VALUES ('1258', '111', '全不中', '八不中', '8');
INSERT INTO `web_xq_defrate` VALUES ('1257', '111', '全不中', '八不中', '7');
INSERT INTO `web_xq_defrate` VALUES ('1256', '111', '全不中', '八不中', '6');
INSERT INTO `web_xq_defrate` VALUES ('1255', '111', '全不中', '八不中', '5');
INSERT INTO `web_xq_defrate` VALUES ('1254', '111', '全不中', '八不中', '4');
INSERT INTO `web_xq_defrate` VALUES ('1253', '111', '全不中', '八不中', '3');
INSERT INTO `web_xq_defrate` VALUES ('1252', '111', '全不中', '八不中', '2');
INSERT INTO `web_xq_defrate` VALUES ('1251', '111', '全不中', '八不中', '1');
INSERT INTO `web_xq_defrate` VALUES ('1199', '109', '全不中', '六不中', '49');
INSERT INTO `web_xq_defrate` VALUES ('1198', '109', '全不中', '六不中', '48');
INSERT INTO `web_xq_defrate` VALUES ('1197', '109', '全不中', '六不中', '47');
INSERT INTO `web_xq_defrate` VALUES ('1196', '109', '全不中', '六不中', '46');
INSERT INTO `web_xq_defrate` VALUES ('1195', '109', '全不中', '六不中', '45');
INSERT INTO `web_xq_defrate` VALUES ('1194', '109', '全不中', '六不中', '44');
INSERT INTO `web_xq_defrate` VALUES ('1193', '109', '全不中', '六不中', '43');
INSERT INTO `web_xq_defrate` VALUES ('1192', '109', '全不中', '六不中', '42');
INSERT INTO `web_xq_defrate` VALUES ('1191', '109', '全不中', '六不中', '41');
INSERT INTO `web_xq_defrate` VALUES ('1190', '109', '全不中', '六不中', '40');
INSERT INTO `web_xq_defrate` VALUES ('1189', '109', '全不中', '六不中', '39');
INSERT INTO `web_xq_defrate` VALUES ('1188', '109', '全不中', '六不中', '38');
INSERT INTO `web_xq_defrate` VALUES ('1187', '109', '全不中', '六不中', '37');
INSERT INTO `web_xq_defrate` VALUES ('1186', '109', '全不中', '六不中', '36');
INSERT INTO `web_xq_defrate` VALUES ('1185', '109', '全不中', '六不中', '35');
INSERT INTO `web_xq_defrate` VALUES ('1184', '109', '全不中', '六不中', '34');
INSERT INTO `web_xq_defrate` VALUES ('1183', '109', '全不中', '六不中', '33');
INSERT INTO `web_xq_defrate` VALUES ('1182', '109', '全不中', '六不中', '32');
INSERT INTO `web_xq_defrate` VALUES ('1181', '109', '全不中', '六不中', '31');
INSERT INTO `web_xq_defrate` VALUES ('1180', '109', '全不中', '六不中', '30');
INSERT INTO `web_xq_defrate` VALUES ('1179', '109', '全不中', '六不中', '29');
INSERT INTO `web_xq_defrate` VALUES ('1178', '109', '全不中', '六不中', '28');
INSERT INTO `web_xq_defrate` VALUES ('1177', '109', '全不中', '六不中', '27');
INSERT INTO `web_xq_defrate` VALUES ('1176', '109', '全不中', '六不中', '26');
INSERT INTO `web_xq_defrate` VALUES ('1175', '109', '全不中', '六不中', '25');
INSERT INTO `web_xq_defrate` VALUES ('1174', '109', '全不中', '六不中', '24');
INSERT INTO `web_xq_defrate` VALUES ('1173', '109', '全不中', '六不中', '23');
INSERT INTO `web_xq_defrate` VALUES ('1172', '109', '全不中', '六不中', '22');
INSERT INTO `web_xq_defrate` VALUES ('1171', '109', '全不中', '六不中', '21');
INSERT INTO `web_xq_defrate` VALUES ('1170', '109', '全不中', '六不中', '20');
INSERT INTO `web_xq_defrate` VALUES ('1169', '109', '全不中', '六不中', '19');
INSERT INTO `web_xq_defrate` VALUES ('1168', '109', '全不中', '六不中', '18');
INSERT INTO `web_xq_defrate` VALUES ('1167', '109', '全不中', '六不中', '17');
INSERT INTO `web_xq_defrate` VALUES ('1166', '109', '全不中', '六不中', '16');
INSERT INTO `web_xq_defrate` VALUES ('1165', '109', '全不中', '六不中', '15');
INSERT INTO `web_xq_defrate` VALUES ('1164', '109', '全不中', '六不中', '14');
INSERT INTO `web_xq_defrate` VALUES ('1163', '109', '全不中', '六不中', '13');
INSERT INTO `web_xq_defrate` VALUES ('1162', '109', '全不中', '六不中', '12');
INSERT INTO `web_xq_defrate` VALUES ('1161', '109', '全不中', '六不中', '11');
INSERT INTO `web_xq_defrate` VALUES ('1160', '109', '全不中', '六不中', '10');
INSERT INTO `web_xq_defrate` VALUES ('1159', '109', '全不中', '六不中', '9');
INSERT INTO `web_xq_defrate` VALUES ('1158', '109', '全不中', '六不中', '8');
INSERT INTO `web_xq_defrate` VALUES ('1157', '109', '全不中', '六不中', '7');
INSERT INTO `web_xq_defrate` VALUES ('1156', '109', '全不中', '六不中', '6');
INSERT INTO `web_xq_defrate` VALUES ('1155', '109', '全不中', '六不中', '5');
INSERT INTO `web_xq_defrate` VALUES ('1154', '109', '全不中', '六不中', '4');
INSERT INTO `web_xq_defrate` VALUES ('1153', '109', '全不中', '六不中', '3');
INSERT INTO `web_xq_defrate` VALUES ('1152', '109', '全不中', '六不中', '2');
INSERT INTO `web_xq_defrate` VALUES ('1151', '109', '全不中', '六不中', '1');
INSERT INTO `web_xq_defrate` VALUES ('1472', '125', '生肖连', '四肖连不中', '猪');
INSERT INTO `web_xq_defrate` VALUES ('1471', '125', '生肖连', '四肖连不中', '鸡');
INSERT INTO `web_xq_defrate` VALUES ('1470', '125', '生肖连', '四肖连不中', '羊');
INSERT INTO `web_xq_defrate` VALUES ('1469', '125', '生肖连', '四肖连不中', '蛇');
INSERT INTO `web_xq_defrate` VALUES ('1468', '125', '生肖连', '四肖连不中', '兔');
INSERT INTO `web_xq_defrate` VALUES ('1467', '125', '生肖连', '四肖连不中', '牛');
INSERT INTO `web_xq_defrate` VALUES ('1466', '125', '生肖连', '四肖连不中', '狗');
INSERT INTO `web_xq_defrate` VALUES ('1465', '125', '生肖连', '四肖连不中', '猴');
INSERT INTO `web_xq_defrate` VALUES ('1464', '125', '生肖连', '四肖连不中', '马');
INSERT INTO `web_xq_defrate` VALUES ('1463', '125', '生肖连', '四肖连不中', '龙');
INSERT INTO `web_xq_defrate` VALUES ('1462', '125', '生肖连', '四肖连不中', '虎');
INSERT INTO `web_xq_defrate` VALUES ('1461', '125', '生肖连', '四肖连不中', '鼠');
INSERT INTO `web_xq_defrate` VALUES ('1460', '124', '生肖连', '三肖连不中', '猪');
INSERT INTO `web_xq_defrate` VALUES ('1459', '124', '生肖连', '三肖连不中', '鸡');
INSERT INTO `web_xq_defrate` VALUES ('1458', '124', '生肖连', '三肖连不中', '羊');
INSERT INTO `web_xq_defrate` VALUES ('1457', '124', '生肖连', '三肖连不中', '蛇');
INSERT INTO `web_xq_defrate` VALUES ('1456', '124', '生肖连', '三肖连不中', '兔');
INSERT INTO `web_xq_defrate` VALUES ('1455', '124', '生肖连', '三肖连不中', '牛');
INSERT INTO `web_xq_defrate` VALUES ('1454', '124', '生肖连', '三肖连不中', '狗');
INSERT INTO `web_xq_defrate` VALUES ('1453', '124', '生肖连', '三肖连不中', '猴');
INSERT INTO `web_xq_defrate` VALUES ('1452', '124', '生肖连', '三肖连不中', '马');
INSERT INTO `web_xq_defrate` VALUES ('1451', '124', '生肖连', '三肖连不中', '龙');
INSERT INTO `web_xq_defrate` VALUES ('1450', '124', '生肖连', '三肖连不中', '虎');
INSERT INTO `web_xq_defrate` VALUES ('1449', '124', '生肖连', '三肖连不中', '鼠');
INSERT INTO `web_xq_defrate` VALUES ('1448', '123', '生肖连', '二肖连不中', '猪');
INSERT INTO `web_xq_defrate` VALUES ('1447', '123', '生肖连', '二肖连不中', '鸡');
INSERT INTO `web_xq_defrate` VALUES ('1446', '123', '生肖连', '二肖连不中', '羊');
INSERT INTO `web_xq_defrate` VALUES ('1445', '123', '生肖连', '二肖连不中', '蛇');
INSERT INTO `web_xq_defrate` VALUES ('1444', '123', '生肖连', '二肖连不中', '兔');
INSERT INTO `web_xq_defrate` VALUES ('1443', '123', '生肖连', '二肖连不中', '牛');
INSERT INTO `web_xq_defrate` VALUES ('1442', '123', '生肖连', '二肖连不中', '狗');
INSERT INTO `web_xq_defrate` VALUES ('1441', '123', '生肖连', '二肖连不中', '猴');
INSERT INTO `web_xq_defrate` VALUES ('1440', '123', '生肖连', '二肖连不中', '马');
INSERT INTO `web_xq_defrate` VALUES ('1439', '123', '生肖连', '二肖连不中', '龙');
INSERT INTO `web_xq_defrate` VALUES ('1438', '123', '生肖连', '二肖连不中', '虎');
INSERT INTO `web_xq_defrate` VALUES ('1437', '123', '生肖连', '二肖连不中', '鼠');
INSERT INTO `web_xq_defrate` VALUES ('1436', '121', '生肖连', '四肖连中', '猪');
INSERT INTO `web_xq_defrate` VALUES ('1435', '121', '生肖连', '四肖连中', '鸡');
INSERT INTO `web_xq_defrate` VALUES ('1434', '121', '生肖连', '四肖连中', '羊');
INSERT INTO `web_xq_defrate` VALUES ('1433', '121', '生肖连', '四肖连中', '蛇');
INSERT INTO `web_xq_defrate` VALUES ('1432', '121', '生肖连', '四肖连中', '兔');
INSERT INTO `web_xq_defrate` VALUES ('1431', '121', '生肖连', '四肖连中', '牛');
INSERT INTO `web_xq_defrate` VALUES ('1430', '121', '生肖连', '四肖连中', '狗');
INSERT INTO `web_xq_defrate` VALUES ('1429', '121', '生肖连', '四肖连中', '猴');
INSERT INTO `web_xq_defrate` VALUES ('1428', '121', '生肖连', '四肖连中', '马');
INSERT INTO `web_xq_defrate` VALUES ('1427', '121', '生肖连', '四肖连中', '龙');
INSERT INTO `web_xq_defrate` VALUES ('1426', '121', '生肖连', '四肖连中', '虎');
INSERT INTO `web_xq_defrate` VALUES ('1425', '121', '生肖连', '四肖连中', '鼠');
INSERT INTO `web_xq_defrate` VALUES ('1424', '120', '生肖连', '三肖连中', '猪');
INSERT INTO `web_xq_defrate` VALUES ('1423', '120', '生肖连', '三肖连中', '鸡');
INSERT INTO `web_xq_defrate` VALUES ('1422', '120', '生肖连', '三肖连中', '羊');
INSERT INTO `web_xq_defrate` VALUES ('1421', '120', '生肖连', '三肖连中', '蛇');
INSERT INTO `web_xq_defrate` VALUES ('1420', '120', '生肖连', '三肖连中', '兔');
INSERT INTO `web_xq_defrate` VALUES ('1419', '120', '生肖连', '三肖连中', '牛');
INSERT INTO `web_xq_defrate` VALUES ('1418', '120', '生肖连', '三肖连中', '狗');
INSERT INTO `web_xq_defrate` VALUES ('1417', '120', '生肖连', '三肖连中', '猴');
INSERT INTO `web_xq_defrate` VALUES ('1416', '120', '生肖连', '三肖连中', '马');
INSERT INTO `web_xq_defrate` VALUES ('1415', '120', '生肖连', '三肖连中', '龙');
INSERT INTO `web_xq_defrate` VALUES ('1414', '120', '生肖连', '三肖连中', '虎');
INSERT INTO `web_xq_defrate` VALUES ('1413', '120', '生肖连', '三肖连中', '鼠');
INSERT INTO `web_xq_defrate` VALUES ('1412', '119', '生肖连', '二肖连中', '猪');
INSERT INTO `web_xq_defrate` VALUES ('1411', '119', '生肖连', '二肖连中', '鸡');
INSERT INTO `web_xq_defrate` VALUES ('1410', '119', '生肖连', '二肖连中', '羊');
INSERT INTO `web_xq_defrate` VALUES ('1409', '119', '生肖连', '二肖连中', '蛇');
INSERT INTO `web_xq_defrate` VALUES ('1408', '119', '生肖连', '二肖连中', '兔');
INSERT INTO `web_xq_defrate` VALUES ('1407', '119', '生肖连', '二肖连中', '牛');
INSERT INTO `web_xq_defrate` VALUES ('1406', '119', '生肖连', '二肖连中', '狗');
INSERT INTO `web_xq_defrate` VALUES ('1405', '119', '生肖连', '二肖连中', '猴');
INSERT INTO `web_xq_defrate` VALUES ('1404', '119', '生肖连', '二肖连中', '马');
INSERT INTO `web_xq_defrate` VALUES ('1403', '119', '生肖连', '二肖连中', '龙');
INSERT INTO `web_xq_defrate` VALUES ('1402', '119', '生肖连', '二肖连中', '虎');
INSERT INTO `web_xq_defrate` VALUES ('1401', '119', '生肖连', '二肖连中', '鼠');
INSERT INTO `web_xq_defrate` VALUES ('1360', '132', '尾数连', '四尾连不中', '0');
INSERT INTO `web_xq_defrate` VALUES ('1359', '132', '尾数连', '四尾连不中', '9');
INSERT INTO `web_xq_defrate` VALUES ('1358', '132', '尾数连', '四尾连不中', '8');
INSERT INTO `web_xq_defrate` VALUES ('1357', '132', '尾数连', '四尾连不中', '7');
INSERT INTO `web_xq_defrate` VALUES ('1356', '132', '尾数连', '四尾连不中', '6');
INSERT INTO `web_xq_defrate` VALUES ('1355', '132', '尾数连', '四尾连不中', '5');
INSERT INTO `web_xq_defrate` VALUES ('1354', '132', '尾数连', '四尾连不中', '4');
INSERT INTO `web_xq_defrate` VALUES ('1353', '132', '尾数连', '四尾连不中', '3');
INSERT INTO `web_xq_defrate` VALUES ('1352', '132', '尾数连', '四尾连不中', '2');
INSERT INTO `web_xq_defrate` VALUES ('1351', '132', '尾数连', '四尾连不中', '1');
INSERT INTO `web_xq_defrate` VALUES ('1350', '131', '尾数连', '三尾连不中', '0');
INSERT INTO `web_xq_defrate` VALUES ('1349', '131', '尾数连', '三尾连不中', '9');
INSERT INTO `web_xq_defrate` VALUES ('1348', '131', '尾数连', '三尾连不中', '8');
INSERT INTO `web_xq_defrate` VALUES ('1347', '131', '尾数连', '三尾连不中', '7');
INSERT INTO `web_xq_defrate` VALUES ('1346', '131', '尾数连', '三尾连不中', '6');
INSERT INTO `web_xq_defrate` VALUES ('1345', '131', '尾数连', '三尾连不中', '5');
INSERT INTO `web_xq_defrate` VALUES ('1344', '131', '尾数连', '三尾连不中', '4');
INSERT INTO `web_xq_defrate` VALUES ('1343', '131', '尾数连', '三尾连不中', '3');
INSERT INTO `web_xq_defrate` VALUES ('1342', '131', '尾数连', '三尾连不中', '2');
INSERT INTO `web_xq_defrate` VALUES ('1341', '131', '尾数连', '三尾连不中', '1');
INSERT INTO `web_xq_defrate` VALUES ('1340', '130', '尾数连', '二尾连不中', '0');
INSERT INTO `web_xq_defrate` VALUES ('1339', '130', '尾数连', '二尾连不中', '9');
INSERT INTO `web_xq_defrate` VALUES ('1338', '130', '尾数连', '二尾连不中', '8');
INSERT INTO `web_xq_defrate` VALUES ('1337', '130', '尾数连', '二尾连不中', '7');
INSERT INTO `web_xq_defrate` VALUES ('1336', '130', '尾数连', '二尾连不中', '6');
INSERT INTO `web_xq_defrate` VALUES ('1335', '130', '尾数连', '二尾连不中', '5');
INSERT INTO `web_xq_defrate` VALUES ('1334', '130', '尾数连', '二尾连不中', '4');
INSERT INTO `web_xq_defrate` VALUES ('1333', '130', '尾数连', '二尾连不中', '3');
INSERT INTO `web_xq_defrate` VALUES ('1332', '130', '尾数连', '二尾连不中', '2');
INSERT INTO `web_xq_defrate` VALUES ('1331', '130', '尾数连', '二尾连不中', '1');
INSERT INTO `web_xq_defrate` VALUES ('1330', '129', '尾数连', '四尾连中', '0');
INSERT INTO `web_xq_defrate` VALUES ('1329', '129', '尾数连', '四尾连中', '9');
INSERT INTO `web_xq_defrate` VALUES ('1328', '129', '尾数连', '四尾连中', '8');
INSERT INTO `web_xq_defrate` VALUES ('1327', '129', '尾数连', '四尾连中', '7');
INSERT INTO `web_xq_defrate` VALUES ('1326', '129', '尾数连', '四尾连中', '6');
INSERT INTO `web_xq_defrate` VALUES ('1325', '129', '尾数连', '四尾连中', '5');
INSERT INTO `web_xq_defrate` VALUES ('1324', '129', '尾数连', '四尾连中', '4');
INSERT INTO `web_xq_defrate` VALUES ('1323', '129', '尾数连', '四尾连中', '3');
INSERT INTO `web_xq_defrate` VALUES ('1322', '129', '尾数连', '四尾连中', '2');
INSERT INTO `web_xq_defrate` VALUES ('1321', '129', '尾数连', '四尾连中', '1');
INSERT INTO `web_xq_defrate` VALUES ('1320', '128', '尾数连', '三尾连中', '0');
INSERT INTO `web_xq_defrate` VALUES ('1319', '128', '尾数连', '三尾连中', '9');
INSERT INTO `web_xq_defrate` VALUES ('1318', '128', '尾数连', '三尾连中', '8');
INSERT INTO `web_xq_defrate` VALUES ('1317', '128', '尾数连', '三尾连中', '7');
INSERT INTO `web_xq_defrate` VALUES ('1316', '128', '尾数连', '三尾连中', '6');
INSERT INTO `web_xq_defrate` VALUES ('1315', '128', '尾数连', '三尾连中', '5');
INSERT INTO `web_xq_defrate` VALUES ('1314', '128', '尾数连', '三尾连中', '4');
INSERT INTO `web_xq_defrate` VALUES ('1313', '128', '尾数连', '三尾连中', '3');
INSERT INTO `web_xq_defrate` VALUES ('1312', '128', '尾数连', '三尾连中', '2');
INSERT INTO `web_xq_defrate` VALUES ('1311', '128', '尾数连', '三尾连中', '1');
INSERT INTO `web_xq_defrate` VALUES ('1310', '127', '尾数连', '二尾连中', '0');
INSERT INTO `web_xq_defrate` VALUES ('1309', '127', '尾数连', '二尾连中', '9');
INSERT INTO `web_xq_defrate` VALUES ('1308', '127', '尾数连', '二尾连中', '8');
INSERT INTO `web_xq_defrate` VALUES ('1307', '127', '尾数连', '二尾连中', '7');
INSERT INTO `web_xq_defrate` VALUES ('1306', '127', '尾数连', '二尾连中', '6');
INSERT INTO `web_xq_defrate` VALUES ('1305', '127', '尾数连', '二尾连中', '5');
INSERT INTO `web_xq_defrate` VALUES ('1304', '127', '尾数连', '二尾连中', '4');
INSERT INTO `web_xq_defrate` VALUES ('1303', '127', '尾数连', '二尾连中', '3');
INSERT INTO `web_xq_defrate` VALUES ('1302', '127', '尾数连', '二尾连中', '2');
INSERT INTO `web_xq_defrate` VALUES ('1301', '127', '尾数连', '二尾连中', '1');
INSERT INTO `web_xq_defrate` VALUES ('960', '92', '生肖', '六肖', '猪');
INSERT INTO `web_xq_defrate` VALUES ('959', '92', '生肖', '六肖', '鸡');
INSERT INTO `web_xq_defrate` VALUES ('958', '92', '生肖', '六肖', '羊');
INSERT INTO `web_xq_defrate` VALUES ('957', '92', '生肖', '六肖', '蛇');
INSERT INTO `web_xq_defrate` VALUES ('956', '92', '生肖', '六肖', '兔');
INSERT INTO `web_xq_defrate` VALUES ('955', '92', '生肖', '六肖', '牛');
INSERT INTO `web_xq_defrate` VALUES ('954', '92', '生肖', '六肖', '狗');
INSERT INTO `web_xq_defrate` VALUES ('953', '92', '生肖', '六肖', '猴');
INSERT INTO `web_xq_defrate` VALUES ('952', '92', '生肖', '六肖', '马');
INSERT INTO `web_xq_defrate` VALUES ('951', '92', '生肖', '六肖', '龙');
INSERT INTO `web_xq_defrate` VALUES ('950', '92', '生肖', '六肖', '虎');
INSERT INTO `web_xq_defrate` VALUES ('949', '92', '生肖', '六肖', '鼠');
INSERT INTO `web_xq_defrate` VALUES ('948', '91', '生肖', '五肖', '猪');
INSERT INTO `web_xq_defrate` VALUES ('947', '91', '生肖', '五肖', '鸡');
INSERT INTO `web_xq_defrate` VALUES ('946', '91', '生肖', '五肖', '羊');
INSERT INTO `web_xq_defrate` VALUES ('945', '91', '生肖', '五肖', '蛇');
INSERT INTO `web_xq_defrate` VALUES ('944', '91', '生肖', '五肖', '兔');
INSERT INTO `web_xq_defrate` VALUES ('943', '91', '生肖', '五肖', '牛');
INSERT INTO `web_xq_defrate` VALUES ('942', '91', '生肖', '五肖', '狗');
INSERT INTO `web_xq_defrate` VALUES ('941', '91', '生肖', '五肖', '猴');
INSERT INTO `web_xq_defrate` VALUES ('940', '91', '生肖', '五肖', '马');
INSERT INTO `web_xq_defrate` VALUES ('939', '91', '生肖', '五肖', '龙');
INSERT INTO `web_xq_defrate` VALUES ('938', '91', '生肖', '五肖', '虎');
INSERT INTO `web_xq_defrate` VALUES ('937', '91', '生肖', '五肖', '鼠');
INSERT INTO `web_xq_defrate` VALUES ('936', '90', '生肖', '四肖', '猪');
INSERT INTO `web_xq_defrate` VALUES ('935', '90', '生肖', '四肖', '鸡');
INSERT INTO `web_xq_defrate` VALUES ('934', '90', '生肖', '四肖', '羊');
INSERT INTO `web_xq_defrate` VALUES ('933', '90', '生肖', '四肖', '蛇');
INSERT INTO `web_xq_defrate` VALUES ('932', '90', '生肖', '四肖', '兔');
INSERT INTO `web_xq_defrate` VALUES ('931', '90', '生肖', '四肖', '牛');
INSERT INTO `web_xq_defrate` VALUES ('930', '90', '生肖', '四肖', '狗');
INSERT INTO `web_xq_defrate` VALUES ('929', '90', '生肖', '四肖', '猴');
INSERT INTO `web_xq_defrate` VALUES ('928', '90', '生肖', '四肖', '马');
INSERT INTO `web_xq_defrate` VALUES ('927', '90', '生肖', '四肖', '龙');
INSERT INTO `web_xq_defrate` VALUES ('926', '90', '生肖', '四肖', '虎');
INSERT INTO `web_xq_defrate` VALUES ('907', '97', '生肖', '二肖', '牛');
INSERT INTO `web_xq_defrate` VALUES ('906', '97', '生肖', '二肖', '狗');
INSERT INTO `web_xq_defrate` VALUES ('923', '98', '生肖', '三肖', '鸡');
INSERT INTO `web_xq_defrate` VALUES ('922', '98', '生肖', '三肖', '羊');
INSERT INTO `web_xq_defrate` VALUES ('921', '98', '生肖', '三肖', '蛇');
INSERT INTO `web_xq_defrate` VALUES ('924', '98', '生肖', '三肖', '猪');
INSERT INTO `web_xq_defrate` VALUES ('908', '97', '生肖', '二肖', '兔');
INSERT INTO `web_xq_defrate` VALUES ('920', '98', '生肖', '三肖', '兔');
INSERT INTO `web_xq_defrate` VALUES ('925', '90', '生肖', '四肖', '鼠');
INSERT INTO `web_xq_defrate` VALUES ('916', '98', '生肖', '三肖', '马');
INSERT INTO `web_xq_defrate` VALUES ('915', '98', '生肖', '三肖', '龙');
INSERT INTO `web_xq_defrate` VALUES ('914', '98', '生肖', '三肖', '虎');
INSERT INTO `web_xq_defrate` VALUES ('917', '98', '生肖', '三肖', '猴');
INSERT INTO `web_xq_defrate` VALUES ('903', '97', '生肖', '二肖', '龙');
INSERT INTO `web_xq_defrate` VALUES ('902', '97', '生肖', '二肖', '虎');
INSERT INTO `web_xq_defrate` VALUES ('904', '97', '生肖', '二肖', '马');
INSERT INTO `web_xq_defrate` VALUES ('905', '97', '生肖', '二肖', '猴');
INSERT INTO `web_xq_defrate` VALUES ('1249', '110', '全不中', '七不中', '49');
INSERT INTO `web_xq_defrate` VALUES ('1248', '110', '全不中', '七不中', '48');
INSERT INTO `web_xq_defrate` VALUES ('1247', '110', '全不中', '七不中', '47');
INSERT INTO `web_xq_defrate` VALUES ('1246', '110', '全不中', '七不中', '46');
INSERT INTO `web_xq_defrate` VALUES ('1245', '110', '全不中', '七不中', '45');
INSERT INTO `web_xq_defrate` VALUES ('1244', '110', '全不中', '七不中', '44');
INSERT INTO `web_xq_defrate` VALUES ('1243', '110', '全不中', '七不中', '43');
INSERT INTO `web_xq_defrate` VALUES ('1242', '110', '全不中', '七不中', '42');
INSERT INTO `web_xq_defrate` VALUES ('1241', '110', '全不中', '七不中', '41');
INSERT INTO `web_xq_defrate` VALUES ('1240', '110', '全不中', '七不中', '40');
INSERT INTO `web_xq_defrate` VALUES ('1239', '110', '全不中', '七不中', '39');
INSERT INTO `web_xq_defrate` VALUES ('1238', '110', '全不中', '七不中', '38');
INSERT INTO `web_xq_defrate` VALUES ('1237', '110', '全不中', '七不中', '37');
INSERT INTO `web_xq_defrate` VALUES ('1236', '110', '全不中', '七不中', '36');
INSERT INTO `web_xq_defrate` VALUES ('1235', '110', '全不中', '七不中', '35');
INSERT INTO `web_xq_defrate` VALUES ('1234', '110', '全不中', '七不中', '34');
INSERT INTO `web_xq_defrate` VALUES ('1233', '110', '全不中', '七不中', '33');
INSERT INTO `web_xq_defrate` VALUES ('1232', '110', '全不中', '七不中', '32');
INSERT INTO `web_xq_defrate` VALUES ('1231', '110', '全不中', '七不中', '31');
INSERT INTO `web_xq_defrate` VALUES ('1230', '110', '全不中', '七不中', '30');
INSERT INTO `web_xq_defrate` VALUES ('1229', '110', '全不中', '七不中', '29');
INSERT INTO `web_xq_defrate` VALUES ('1228', '110', '全不中', '七不中', '28');
INSERT INTO `web_xq_defrate` VALUES ('1227', '110', '全不中', '七不中', '27');
INSERT INTO `web_xq_defrate` VALUES ('1226', '110', '全不中', '七不中', '26');
INSERT INTO `web_xq_defrate` VALUES ('1225', '110', '全不中', '七不中', '25');
INSERT INTO `web_xq_defrate` VALUES ('1224', '110', '全不中', '七不中', '24');
INSERT INTO `web_xq_defrate` VALUES ('1223', '110', '全不中', '七不中', '23');
INSERT INTO `web_xq_defrate` VALUES ('1222', '110', '全不中', '七不中', '22');
INSERT INTO `web_xq_defrate` VALUES ('1221', '110', '全不中', '七不中', '21');
INSERT INTO `web_xq_defrate` VALUES ('1220', '110', '全不中', '七不中', '20');
INSERT INTO `web_xq_defrate` VALUES ('1219', '110', '全不中', '七不中', '19');
INSERT INTO `web_xq_defrate` VALUES ('1218', '110', '全不中', '七不中', '18');
INSERT INTO `web_xq_defrate` VALUES ('1217', '110', '全不中', '七不中', '17');
INSERT INTO `web_xq_defrate` VALUES ('1216', '110', '全不中', '七不中', '16');
INSERT INTO `web_xq_defrate` VALUES ('1215', '110', '全不中', '七不中', '15');
INSERT INTO `web_xq_defrate` VALUES ('1214', '110', '全不中', '七不中', '14');
INSERT INTO `web_xq_defrate` VALUES ('1213', '110', '全不中', '七不中', '13');
INSERT INTO `web_xq_defrate` VALUES ('1212', '110', '全不中', '七不中', '12');
INSERT INTO `web_xq_defrate` VALUES ('1211', '110', '全不中', '七不中', '11');
INSERT INTO `web_xq_defrate` VALUES ('1210', '110', '全不中', '七不中', '10');
INSERT INTO `web_xq_defrate` VALUES ('1209', '110', '全不中', '七不中', '9');
INSERT INTO `web_xq_defrate` VALUES ('1208', '110', '全不中', '七不中', '8');
INSERT INTO `web_xq_defrate` VALUES ('1207', '110', '全不中', '七不中', '7');
INSERT INTO `web_xq_defrate` VALUES ('1206', '110', '全不中', '七不中', '6');
INSERT INTO `web_xq_defrate` VALUES ('1205', '110', '全不中', '七不中', '5');
INSERT INTO `web_xq_defrate` VALUES ('1204', '110', '全不中', '七不中', '4');
INSERT INTO `web_xq_defrate` VALUES ('1203', '110', '全不中', '七不中', '3');
INSERT INTO `web_xq_defrate` VALUES ('1202', '110', '全不中', '七不中', '2');
INSERT INTO `web_xq_defrate` VALUES ('1201', '110', '全不中', '七不中', '1');
INSERT INTO `web_xq_defrate` VALUES ('1149', '108', '全不中', '五不中', '49');
INSERT INTO `web_xq_defrate` VALUES ('1148', '108', '全不中', '五不中', '48');
INSERT INTO `web_xq_defrate` VALUES ('1147', '108', '全不中', '五不中', '47');
INSERT INTO `web_xq_defrate` VALUES ('1146', '108', '全不中', '五不中', '46');
INSERT INTO `web_xq_defrate` VALUES ('1145', '108', '全不中', '五不中', '45');
INSERT INTO `web_xq_defrate` VALUES ('1144', '108', '全不中', '五不中', '44');
INSERT INTO `web_xq_defrate` VALUES ('1143', '108', '全不中', '五不中', '43');
INSERT INTO `web_xq_defrate` VALUES ('1142', '108', '全不中', '五不中', '42');
INSERT INTO `web_xq_defrate` VALUES ('1141', '108', '全不中', '五不中', '41');
INSERT INTO `web_xq_defrate` VALUES ('1140', '108', '全不中', '五不中', '40');
INSERT INTO `web_xq_defrate` VALUES ('1139', '108', '全不中', '五不中', '39');
INSERT INTO `web_xq_defrate` VALUES ('1138', '108', '全不中', '五不中', '38');
INSERT INTO `web_xq_defrate` VALUES ('1137', '108', '全不中', '五不中', '37');
INSERT INTO `web_xq_defrate` VALUES ('1136', '108', '全不中', '五不中', '36');
INSERT INTO `web_xq_defrate` VALUES ('1135', '108', '全不中', '五不中', '35');
INSERT INTO `web_xq_defrate` VALUES ('1134', '108', '全不中', '五不中', '34');
INSERT INTO `web_xq_defrate` VALUES ('1133', '108', '全不中', '五不中', '33');
INSERT INTO `web_xq_defrate` VALUES ('1132', '108', '全不中', '五不中', '32');
INSERT INTO `web_xq_defrate` VALUES ('1131', '108', '全不中', '五不中', '31');
INSERT INTO `web_xq_defrate` VALUES ('1130', '108', '全不中', '五不中', '30');
INSERT INTO `web_xq_defrate` VALUES ('1129', '108', '全不中', '五不中', '29');
INSERT INTO `web_xq_defrate` VALUES ('1128', '108', '全不中', '五不中', '28');
INSERT INTO `web_xq_defrate` VALUES ('1127', '108', '全不中', '五不中', '27');
INSERT INTO `web_xq_defrate` VALUES ('1126', '108', '全不中', '五不中', '26');
INSERT INTO `web_xq_defrate` VALUES ('1125', '108', '全不中', '五不中', '25');
INSERT INTO `web_xq_defrate` VALUES ('1124', '108', '全不中', '五不中', '24');
INSERT INTO `web_xq_defrate` VALUES ('1123', '108', '全不中', '五不中', '23');
INSERT INTO `web_xq_defrate` VALUES ('1122', '108', '全不中', '五不中', '22');
INSERT INTO `web_xq_defrate` VALUES ('1121', '108', '全不中', '五不中', '21');
INSERT INTO `web_xq_defrate` VALUES ('1120', '108', '全不中', '五不中', '20');
INSERT INTO `web_xq_defrate` VALUES ('1119', '108', '全不中', '五不中', '19');
INSERT INTO `web_xq_defrate` VALUES ('1118', '108', '全不中', '五不中', '18');
INSERT INTO `web_xq_defrate` VALUES ('1117', '108', '全不中', '五不中', '17');
INSERT INTO `web_xq_defrate` VALUES ('1116', '108', '全不中', '五不中', '16');
INSERT INTO `web_xq_defrate` VALUES ('1115', '108', '全不中', '五不中', '15');
INSERT INTO `web_xq_defrate` VALUES ('1114', '108', '全不中', '五不中', '14');
INSERT INTO `web_xq_defrate` VALUES ('1113', '108', '全不中', '五不中', '13');
INSERT INTO `web_xq_defrate` VALUES ('1112', '108', '全不中', '五不中', '12');
INSERT INTO `web_xq_defrate` VALUES ('1111', '108', '全不中', '五不中', '11');
INSERT INTO `web_xq_defrate` VALUES ('1110', '108', '全不中', '五不中', '10');
INSERT INTO `web_xq_defrate` VALUES ('1109', '108', '全不中', '五不中', '9');
INSERT INTO `web_xq_defrate` VALUES ('1108', '108', '全不中', '五不中', '8');
INSERT INTO `web_xq_defrate` VALUES ('1107', '108', '全不中', '五不中', '7');
INSERT INTO `web_xq_defrate` VALUES ('1106', '108', '全不中', '五不中', '6');
INSERT INTO `web_xq_defrate` VALUES ('1105', '108', '全不中', '五不中', '5');
INSERT INTO `web_xq_defrate` VALUES ('1104', '108', '全不中', '五不中', '4');
INSERT INTO `web_xq_defrate` VALUES ('1103', '108', '全不中', '五不中', '3');
INSERT INTO `web_xq_defrate` VALUES ('1102', '108', '全不中', '五不中', '2');
INSERT INTO `web_xq_defrate` VALUES ('912', '97', '生肖', '二肖', '猪');
INSERT INTO `web_xq_defrate` VALUES ('913', '98', '生肖', '三肖', '鼠');
INSERT INTO `web_xq_defrate` VALUES ('919', '98', '生肖', '三肖', '牛');
INSERT INTO `web_xq_defrate` VALUES ('910', '97', '生肖', '二肖', '羊');
INSERT INTO `web_xq_defrate` VALUES ('909', '97', '生肖', '二肖', '蛇');
INSERT INTO `web_xq_defrate` VALUES ('911', '97', '生肖', '二肖', '鸡');
INSERT INTO `web_xq_defrate` VALUES ('1101', '108', '全不中', '五不中', '1');
INSERT INTO `web_xq_defrate` VALUES ('918', '98', '生肖', '三肖', '狗');
INSERT INTO `web_xq_defrate` VALUES ('901', '97', '生肖', '二肖', '鼠');
INSERT INTO `web_xq_defrate` VALUES ('1082', '118', '正1-6', '正码6', '尾小');
INSERT INTO `web_xq_defrate` VALUES ('1081', '118', '正1-6', '正码6', '尾大');
INSERT INTO `web_xq_defrate` VALUES ('1080', '118', '正1-6', '正码6', '合双');
INSERT INTO `web_xq_defrate` VALUES ('1079', '118', '正1-6', '正码6', '合单');
INSERT INTO `web_xq_defrate` VALUES ('1078', '118', '正1-6', '正码6', '合小');
INSERT INTO `web_xq_defrate` VALUES ('1077', '118', '正1-6', '正码6', '合大');
INSERT INTO `web_xq_defrate` VALUES ('1076', '118', '正1-6', '正码5', '尾小');
INSERT INTO `web_xq_defrate` VALUES ('1075', '118', '正1-6', '正码5', '尾大');
INSERT INTO `web_xq_defrate` VALUES ('1074', '118', '正1-6', '正码5', '合双');
INSERT INTO `web_xq_defrate` VALUES ('1073', '118', '正1-6', '正码5', '合单');
INSERT INTO `web_xq_defrate` VALUES ('1072', '118', '正1-6', '正码5', '合小');
INSERT INTO `web_xq_defrate` VALUES ('1071', '118', '正1-6', '正码5', '合大');
INSERT INTO `web_xq_defrate` VALUES ('1070', '118', '正1-6', '正码4', '尾小');
INSERT INTO `web_xq_defrate` VALUES ('1069', '118', '正1-6', '正码4', '尾大');
INSERT INTO `web_xq_defrate` VALUES ('1068', '118', '正1-6', '正码4', '合双');
INSERT INTO `web_xq_defrate` VALUES ('1067', '118', '正1-6', '正码4', '合单');
INSERT INTO `web_xq_defrate` VALUES ('1066', '118', '正1-6', '正码4', '合小');
INSERT INTO `web_xq_defrate` VALUES ('1065', '118', '正1-6', '正码4', '合大');
INSERT INTO `web_xq_defrate` VALUES ('1064', '118', '正1-6', '正码3', '尾小');
INSERT INTO `web_xq_defrate` VALUES ('1063', '118', '正1-6', '正码3', '尾大');
INSERT INTO `web_xq_defrate` VALUES ('1062', '118', '正1-6', '正码3', '合双');
INSERT INTO `web_xq_defrate` VALUES ('1061', '118', '正1-6', '正码3', '合单');
INSERT INTO `web_xq_defrate` VALUES ('1060', '118', '正1-6', '正码3', '合小');
INSERT INTO `web_xq_defrate` VALUES ('1059', '118', '正1-6', '正码3', '合大');
INSERT INTO `web_xq_defrate` VALUES ('1058', '118', '正1-6', '正码2', '尾小');
INSERT INTO `web_xq_defrate` VALUES ('1045', '75', '正特', '正2特', '合大');
INSERT INTO `web_xq_defrate` VALUES ('1044', '75', '正特', '正3特', '合大');
INSERT INTO `web_xq_defrate` VALUES ('1043', '75', '正特', '正4特', '合大');
INSERT INTO `web_xq_defrate` VALUES ('1042', '75', '正特', '正5特', '合大');
INSERT INTO `web_xq_defrate` VALUES ('1041', '75', '正特', '正6特', '合大');
INSERT INTO `web_xq_defrate` VALUES ('1047', '118', '正1-6', '正码1', '合大');
INSERT INTO `web_xq_defrate` VALUES ('1048', '118', '正1-6', '正码1', '合小');
INSERT INTO `web_xq_defrate` VALUES ('1087', '75', '正特', '正6特', '合小');
INSERT INTO `web_xq_defrate` VALUES ('1086', '75', '正特', '正5特', '合小');
INSERT INTO `web_xq_defrate` VALUES ('1085', '75', '正特', '正4特', '合小');
INSERT INTO `web_xq_defrate` VALUES ('1084', '75', '正特', '正3特', '合小');
INSERT INTO `web_xq_defrate` VALUES ('1035', '75', '正特', '正1特', '合小');
INSERT INTO `web_xq_defrate` VALUES ('1034', '75', '正特', '正1特', '合大');
INSERT INTO `web_xq_defrate` VALUES ('1083', '75', '正特', '正2特', '合小');
INSERT INTO `web_xq_defrate` VALUES ('1049', '118', '正1-6', '正码1', '合单');
INSERT INTO `web_xq_defrate` VALUES ('1056', '118', '正1-6', '正码2', '合双');
INSERT INTO `web_xq_defrate` VALUES ('1057', '118', '正1-6', '正码2', '尾大');
INSERT INTO `web_xq_defrate` VALUES ('1050', '118', '正1-6', '正码1', '合双');
INSERT INTO `web_xq_defrate` VALUES ('1051', '118', '正1-6', '正码1', '尾大');
INSERT INTO `web_xq_defrate` VALUES ('1052', '118', '正1-6', '正码1', '尾小');
INSERT INTO `web_xq_defrate` VALUES ('1053', '118', '正1-6', '正码2', '合大');
INSERT INTO `web_xq_defrate` VALUES ('1055', '118', '正1-6', '正码2', '合单');
INSERT INTO `web_xq_defrate` VALUES ('1054', '118', '正1-6', '正码2', '合小');
INSERT INTO `web_xq_defrate` VALUES ('1032', '107', '连肖', '五肖碰', '五肖碰');
INSERT INTO `web_xq_defrate` VALUES ('1031', '107', '连肖', '四肖碰', '四肖碰');
INSERT INTO `web_xq_defrate` VALUES ('1030', '107', '连肖', '三肖碰', '三肖碰');
INSERT INTO `web_xq_defrate` VALUES ('1029', '107', '连肖', '二肖碰', '二肖碰');
INSERT INTO `web_xq_defrate` VALUES ('1028', '115', '自选', '自选', '十二不中');
INSERT INTO `web_xq_defrate` VALUES ('1027', '114', '自选', '自选', '十一不中');
INSERT INTO `web_xq_defrate` VALUES ('1026', '113', '自选', '自选', '十不中');
INSERT INTO `web_xq_defrate` VALUES ('1025', '112', '自选', '自选', '九不中');
INSERT INTO `web_xq_defrate` VALUES ('1024', '111', '自选', '自选', '八不中');
INSERT INTO `web_xq_defrate` VALUES ('1023', '110', '自选', '自选', '七不中');
INSERT INTO `web_xq_defrate` VALUES ('1022', '109', '自选', '自选', '六不中');
INSERT INTO `web_xq_defrate` VALUES ('1021', '108', '自选', '自选', '五不中');
INSERT INTO `web_xq_defrate` VALUES ('795', '104', '特码', '特A', '尾大');
INSERT INTO `web_xq_defrate` VALUES ('796', '104', '特码', '特A', '尾小');
INSERT INTO `web_xq_defrate` VALUES ('797', '105', '特码', '特A', '大单');
INSERT INTO `web_xq_defrate` VALUES ('798', '105', '特码', '特A', '小单');
INSERT INTO `web_xq_defrate` VALUES ('799', '106', '特码', '特A', '大双');
INSERT INTO `web_xq_defrate` VALUES ('800', '106', '特码', '特A', '小双');
INSERT INTO `web_xq_defrate` VALUES ('801', '104', '特码', '特B', '尾大');
INSERT INTO `web_xq_defrate` VALUES ('802', '104', '特码', '特B', '尾小');
INSERT INTO `web_xq_defrate` VALUES ('803', '105', '特码', '特B', '大单');
INSERT INTO `web_xq_defrate` VALUES ('804', '105', '特码', '特B', '小单');
INSERT INTO `web_xq_defrate` VALUES ('805', '106', '特码', '特B', '大双');
INSERT INTO `web_xq_defrate` VALUES ('806', '106', '特码', '特B', '小双');
INSERT INTO `web_xq_defrate` VALUES ('794', '103', '正肖', '正肖', '猪');
INSERT INTO `web_xq_defrate` VALUES ('793', '103', '正肖', '正肖', '鸡');
INSERT INTO `web_xq_defrate` VALUES ('792', '103', '正肖', '正肖', '羊');
INSERT INTO `web_xq_defrate` VALUES ('791', '103', '正肖', '正肖', '蛇');
INSERT INTO `web_xq_defrate` VALUES ('790', '103', '正肖', '正肖', '兔');
INSERT INTO `web_xq_defrate` VALUES ('789', '103', '正肖', '正肖', '牛');
INSERT INTO `web_xq_defrate` VALUES ('788', '103', '正肖', '正肖', '狗');
INSERT INTO `web_xq_defrate` VALUES ('787', '103', '正肖', '正肖', '猴');
INSERT INTO `web_xq_defrate` VALUES ('786', '103', '正肖', '正肖', '马');
INSERT INTO `web_xq_defrate` VALUES ('785', '103', '正肖', '正肖', '龙');
INSERT INTO `web_xq_defrate` VALUES ('784', '103', '正肖', '正肖', '虎');
INSERT INTO `web_xq_defrate` VALUES ('783', '103', '正肖', '正肖', '鼠');
INSERT INTO `web_xq_defrate` VALUES ('782', '102', '七色波', '七色波', '合局');
INSERT INTO `web_xq_defrate` VALUES ('781', '102', '七色波', '七色波', '蓝波');
INSERT INTO `web_xq_defrate` VALUES ('779', '102', '七色波', '七色波', '红波');
INSERT INTO `web_xq_defrate` VALUES ('780', '102', '七色波', '七色波', '绿波');
INSERT INTO `web_xq_defrate` VALUES ('778', '101', '正特尾数', '正特尾数', '9');
INSERT INTO `web_xq_defrate` VALUES ('777', '101', '正特尾数', '正特尾数', '8');
INSERT INTO `web_xq_defrate` VALUES ('776', '101', '正特尾数', '正特尾数', '7');
INSERT INTO `web_xq_defrate` VALUES ('775', '101', '正特尾数', '正特尾数', '6');
INSERT INTO `web_xq_defrate` VALUES ('774', '101', '正特尾数', '正特尾数', '5');
INSERT INTO `web_xq_defrate` VALUES ('773', '101', '正特尾数', '正特尾数', '4');
INSERT INTO `web_xq_defrate` VALUES ('772', '101', '正特尾数', '正特尾数', '3');
INSERT INTO `web_xq_defrate` VALUES ('771', '101', '正特尾数', '正特尾数', '2');
INSERT INTO `web_xq_defrate` VALUES ('770', '101', '正特尾数', '正特尾数', '1');
INSERT INTO `web_xq_defrate` VALUES ('769', '101', '正特尾数', '正特尾数', '0');
INSERT INTO `web_xq_defrate` VALUES ('762', '99', '半半波', '半半波', '蓝小单');
INSERT INTO `web_xq_defrate` VALUES ('761', '99', '半半波', '半半波', '蓝大双');
INSERT INTO `web_xq_defrate` VALUES ('760', '99', '半半波', '半半波', '蓝大单');
INSERT INTO `web_xq_defrate` VALUES ('759', '99', '半半波', '半半波', '绿小双');
INSERT INTO `web_xq_defrate` VALUES ('758', '99', '半半波', '半半波', '绿小单');
INSERT INTO `web_xq_defrate` VALUES ('757', '99', '半半波', '半半波', '绿大双');
INSERT INTO `web_xq_defrate` VALUES ('756', '99', '半半波', '半半波', '绿大单');
INSERT INTO `web_xq_defrate` VALUES ('755', '99', '半半波', '半半波', '红小双');
INSERT INTO `web_xq_defrate` VALUES ('754', '99', '半半波', '半半波', '红小单');
INSERT INTO `web_xq_defrate` VALUES ('753', '99', '半半波', '半半波', '红大双');
INSERT INTO `web_xq_defrate` VALUES ('752', '99', '半半波', '半半波', '红大单');
INSERT INTO `web_xq_defrate` VALUES ('763', '99', '半半波', '半半波', '蓝小双');
INSERT INTO `web_xq_defrate` VALUES ('764', '100', '头数', '头数', '0');
INSERT INTO `web_xq_defrate` VALUES ('765', '100', '头数', '头数', '1');
INSERT INTO `web_xq_defrate` VALUES ('768', '100', '头数', '头数', '4');
INSERT INTO `web_xq_defrate` VALUES ('766', '100', '头数', '头数', '2');
INSERT INTO `web_xq_defrate` VALUES ('767', '100', '头数', '头数', '3');
INSERT INTO `web_xq_defrate` VALUES ('751', '95', '特码', '特B', '野兽');
INSERT INTO `web_xq_defrate` VALUES ('750', '95', '特码', '特B', '家禽');
INSERT INTO `web_xq_defrate` VALUES ('749', '95', '特码', '特A', '野兽');
INSERT INTO `web_xq_defrate` VALUES ('748', '95', '特码', '特A', '家禽');
INSERT INTO `web_xq_defrate` VALUES ('747', '73', '花会', '特花', '双');
INSERT INTO `web_xq_defrate` VALUES ('746', '73', '花会', '特花', '单');
INSERT INTO `web_xq_defrate` VALUES ('723', '82', '半波', '半波', '蓝合双');
INSERT INTO `web_xq_defrate` VALUES ('722', '82', '半波', '半波', '蓝合单');
INSERT INTO `web_xq_defrate` VALUES ('721', '82', '半波', '半波', '绿合双');
INSERT INTO `web_xq_defrate` VALUES ('720', '82', '半波', '半波', '绿合单');
INSERT INTO `web_xq_defrate` VALUES ('719', '82', '半波', '半波', '红合双');
INSERT INTO `web_xq_defrate` VALUES ('718', '82', '半波', '半波', '红合单');
INSERT INTO `web_xq_defrate` VALUES ('717', '96', '五行', '五行', '土');
INSERT INTO `web_xq_defrate` VALUES ('716', '96', '五行', '五行', '火');
INSERT INTO `web_xq_defrate` VALUES ('715', '96', '五行', '五行', '水');
INSERT INTO `web_xq_defrate` VALUES ('714', '96', '五行', '五行', '木');
INSERT INTO `web_xq_defrate` VALUES ('713', '96', '五行', '五行', '金');
INSERT INTO `web_xq_defrate` VALUES ('711', '93', '生肖', '一肖', '猪');
INSERT INTO `web_xq_defrate` VALUES ('710', '93', '生肖', '一肖', '鸡');
INSERT INTO `web_xq_defrate` VALUES ('709', '93', '生肖', '一肖', '羊');
INSERT INTO `web_xq_defrate` VALUES ('708', '93', '生肖', '一肖', '蛇');
INSERT INTO `web_xq_defrate` VALUES ('707', '93', '生肖', '一肖', '兔');
INSERT INTO `web_xq_defrate` VALUES ('706', '93', '生肖', '一肖', '牛');
INSERT INTO `web_xq_defrate` VALUES ('705', '93', '生肖', '一肖', '狗');
INSERT INTO `web_xq_defrate` VALUES ('704', '93', '生肖', '一肖', '猴');
INSERT INTO `web_xq_defrate` VALUES ('703', '93', '生肖', '一肖', '马');
INSERT INTO `web_xq_defrate` VALUES ('702', '93', '生肖', '一肖', '龙');
INSERT INTO `web_xq_defrate` VALUES ('701', '93', '生肖', '一肖', '虎');
INSERT INTO `web_xq_defrate` VALUES ('700', '93', '生肖', '一肖', '鼠');
INSERT INTO `web_xq_defrate` VALUES ('699', '94', '尾数', '尾数', '9');
INSERT INTO `web_xq_defrate` VALUES ('698', '94', '尾数', '尾数', '8');
INSERT INTO `web_xq_defrate` VALUES ('697', '94', '尾数', '尾数', '7');
INSERT INTO `web_xq_defrate` VALUES ('696', '94', '尾数', '尾数', '6');
INSERT INTO `web_xq_defrate` VALUES ('695', '94', '尾数', '尾数', '5');
INSERT INTO `web_xq_defrate` VALUES ('694', '94', '尾数', '尾数', '4');
INSERT INTO `web_xq_defrate` VALUES ('693', '94', '尾数', '尾数', '3');
INSERT INTO `web_xq_defrate` VALUES ('692', '94', '尾数', '尾数', '2');
INSERT INTO `web_xq_defrate` VALUES ('691', '94', '尾数', '尾数', '1');
INSERT INTO `web_xq_defrate` VALUES ('690', '94', '尾数', '尾数', '0');
INSERT INTO `web_xq_defrate` VALUES ('685', '89', '生肖', '特肖', '猪');
INSERT INTO `web_xq_defrate` VALUES ('684', '89', '生肖', '特肖', '鸡');
INSERT INTO `web_xq_defrate` VALUES ('683', '89', '生肖', '特肖', '羊');
INSERT INTO `web_xq_defrate` VALUES ('682', '89', '生肖', '特肖', '蛇');
INSERT INTO `web_xq_defrate` VALUES ('681', '89', '生肖', '特肖', '兔');
INSERT INTO `web_xq_defrate` VALUES ('680', '89', '生肖', '特肖', '牛');
INSERT INTO `web_xq_defrate` VALUES ('679', '89', '生肖', '特肖', '狗');
INSERT INTO `web_xq_defrate` VALUES ('678', '89', '生肖', '特肖', '猴');
INSERT INTO `web_xq_defrate` VALUES ('677', '89', '生肖', '特肖', '马');
INSERT INTO `web_xq_defrate` VALUES ('676', '89', '生肖', '特肖', '龙');
INSERT INTO `web_xq_defrate` VALUES ('675', '89', '生肖', '特肖', '虎');
INSERT INTO `web_xq_defrate` VALUES ('674', '89', '生肖', '特肖', '鼠');
INSERT INTO `web_xq_defrate` VALUES ('673', '82', '半波', '半波', '蓝小');
INSERT INTO `web_xq_defrate` VALUES ('672', '82', '半波', '半波', '蓝大');
INSERT INTO `web_xq_defrate` VALUES ('671', '82', '半波', '半波', '蓝双');
INSERT INTO `web_xq_defrate` VALUES ('670', '82', '半波', '半波', '蓝单');
INSERT INTO `web_xq_defrate` VALUES ('669', '82', '半波', '半波', '绿小');
INSERT INTO `web_xq_defrate` VALUES ('668', '82', '半波', '半波', '绿大');
INSERT INTO `web_xq_defrate` VALUES ('667', '82', '半波', '半波', '绿双');
INSERT INTO `web_xq_defrate` VALUES ('666', '82', '半波', '半波', '绿单');
INSERT INTO `web_xq_defrate` VALUES ('665', '82', '半波', '半波', '红小');
INSERT INTO `web_xq_defrate` VALUES ('664', '82', '半波', '半波', '红大');
INSERT INTO `web_xq_defrate` VALUES ('663', '82', '半波', '半波', '红双');
INSERT INTO `web_xq_defrate` VALUES ('662', '82', '半波', '半波', '红单');
INSERT INTO `web_xq_defrate` VALUES ('661', '83', '过关', '正码6', '蓝波');
INSERT INTO `web_xq_defrate` VALUES ('660', '83', '过关', '正码6', '绿波');
INSERT INTO `web_xq_defrate` VALUES ('659', '83', '过关', '正码6', '红波');
INSERT INTO `web_xq_defrate` VALUES ('658', '83', '过关', '正码6', '小');
INSERT INTO `web_xq_defrate` VALUES ('657', '83', '过关', '正码6', '大');
INSERT INTO `web_xq_defrate` VALUES ('656', '83', '过关', '正码6', '双');
INSERT INTO `web_xq_defrate` VALUES ('655', '83', '过关', '正码6', '单');
INSERT INTO `web_xq_defrate` VALUES ('654', '83', '过关', '正码5', '蓝波');
INSERT INTO `web_xq_defrate` VALUES ('653', '83', '过关', '正码5', '绿波');
INSERT INTO `web_xq_defrate` VALUES ('652', '83', '过关', '正码5', '红波');
INSERT INTO `web_xq_defrate` VALUES ('651', '83', '过关', '正码5', '小');
INSERT INTO `web_xq_defrate` VALUES ('650', '83', '过关', '正码5', '大');
INSERT INTO `web_xq_defrate` VALUES ('649', '83', '过关', '正码5', '双');
INSERT INTO `web_xq_defrate` VALUES ('648', '83', '过关', '正码5', '单');
INSERT INTO `web_xq_defrate` VALUES ('647', '83', '过关', '正码4', '蓝波');
INSERT INTO `web_xq_defrate` VALUES ('646', '83', '过关', '正码4', '绿波');
INSERT INTO `web_xq_defrate` VALUES ('645', '83', '过关', '正码4', '红波');
INSERT INTO `web_xq_defrate` VALUES ('644', '83', '过关', '正码4', '小');
INSERT INTO `web_xq_defrate` VALUES ('643', '83', '过关', '正码4', '大');
INSERT INTO `web_xq_defrate` VALUES ('642', '83', '过关', '正码4', '双');
INSERT INTO `web_xq_defrate` VALUES ('641', '83', '过关', '正码4', '单');
INSERT INTO `web_xq_defrate` VALUES ('640', '83', '过关', '正码3', '蓝波');
INSERT INTO `web_xq_defrate` VALUES ('639', '83', '过关', '正码3', '绿波');
INSERT INTO `web_xq_defrate` VALUES ('638', '83', '过关', '正码3', '红波');
INSERT INTO `web_xq_defrate` VALUES ('637', '83', '过关', '正码3', '小');
INSERT INTO `web_xq_defrate` VALUES ('636', '83', '过关', '正码3', '大');
INSERT INTO `web_xq_defrate` VALUES ('635', '83', '过关', '正码3', '双');
INSERT INTO `web_xq_defrate` VALUES ('634', '83', '过关', '正码3', '单');
INSERT INTO `web_xq_defrate` VALUES ('633', '83', '过关', '正码2', '蓝波');
INSERT INTO `web_xq_defrate` VALUES ('632', '83', '过关', '正码2', '绿波');
INSERT INTO `web_xq_defrate` VALUES ('631', '83', '过关', '正码2', '红波');
INSERT INTO `web_xq_defrate` VALUES ('630', '83', '过关', '正码2', '小');
INSERT INTO `web_xq_defrate` VALUES ('629', '83', '过关', '正码2', '大');
INSERT INTO `web_xq_defrate` VALUES ('628', '83', '过关', '正码2', '双');
INSERT INTO `web_xq_defrate` VALUES ('627', '83', '过关', '正码2', '单');
INSERT INTO `web_xq_defrate` VALUES ('626', '83', '过关', '正码1', '蓝波');
INSERT INTO `web_xq_defrate` VALUES ('625', '83', '过关', '正码1', '绿波');
INSERT INTO `web_xq_defrate` VALUES ('624', '83', '过关', '正码1', '红波');
INSERT INTO `web_xq_defrate` VALUES ('623', '83', '过关', '正码1', '小');
INSERT INTO `web_xq_defrate` VALUES ('622', '83', '过关', '正码1', '大');
INSERT INTO `web_xq_defrate` VALUES ('621', '83', '过关', '正码1', '双');
INSERT INTO `web_xq_defrate` VALUES ('620', '83', '过关', '正码1', '单');
INSERT INTO `web_xq_defrate` VALUES ('619', '86', '连码', '三中二', '中三');
INSERT INTO `web_xq_defrate` VALUES ('618', '86', '连码', '三中二', '中二');
INSERT INTO `web_xq_defrate` VALUES ('617', '85', '连码', '三全中', '三全中');
INSERT INTO `web_xq_defrate` VALUES ('616', '88', '连码', '特串', '特串');
INSERT INTO `web_xq_defrate` VALUES ('615', '87', '连码', '二中特', '中二');
INSERT INTO `web_xq_defrate` VALUES ('614', '87', '连码', '二中特', '中特');
INSERT INTO `web_xq_defrate` VALUES ('613', '84', '连码', '二全中', '二全中');
INSERT INTO `web_xq_defrate` VALUES ('612', '118', '正1-6', '正码6', '蓝波');
INSERT INTO `web_xq_defrate` VALUES ('611', '118', '正1-6', '正码6', '绿波');
INSERT INTO `web_xq_defrate` VALUES ('610', '118', '正1-6', '正码6', '红波');
INSERT INTO `web_xq_defrate` VALUES ('609', '118', '正1-6', '正码6', '双');
INSERT INTO `web_xq_defrate` VALUES ('608', '118', '正1-6', '正码6', '单');
INSERT INTO `web_xq_defrate` VALUES ('607', '118', '正1-6', '正码6', '小');
INSERT INTO `web_xq_defrate` VALUES ('606', '118', '正1-6', '正码6', '大');
INSERT INTO `web_xq_defrate` VALUES ('605', '118', '正1-6', '正码5', '蓝波');
INSERT INTO `web_xq_defrate` VALUES ('604', '118', '正1-6', '正码5', '绿波');
INSERT INTO `web_xq_defrate` VALUES ('603', '118', '正1-6', '正码5', '红波');
INSERT INTO `web_xq_defrate` VALUES ('602', '118', '正1-6', '正码5', '双');
INSERT INTO `web_xq_defrate` VALUES ('601', '118', '正1-6', '正码5', '单');
INSERT INTO `web_xq_defrate` VALUES ('600', '118', '正1-6', '正码5', '小');
INSERT INTO `web_xq_defrate` VALUES ('599', '118', '正1-6', '正码5', '大');
INSERT INTO `web_xq_defrate` VALUES ('598', '118', '正1-6', '正码4', '蓝波');
INSERT INTO `web_xq_defrate` VALUES ('597', '118', '正1-6', '正码4', '绿波');
INSERT INTO `web_xq_defrate` VALUES ('596', '118', '正1-6', '正码4', '红波');
INSERT INTO `web_xq_defrate` VALUES ('595', '118', '正1-6', '正码4', '双');
INSERT INTO `web_xq_defrate` VALUES ('594', '118', '正1-6', '正码4', '单');
INSERT INTO `web_xq_defrate` VALUES ('593', '118', '正1-6', '正码4', '小');
INSERT INTO `web_xq_defrate` VALUES ('592', '118', '正1-6', '正码4', '大');
INSERT INTO `web_xq_defrate` VALUES ('591', '118', '正1-6', '正码3', '蓝波');
INSERT INTO `web_xq_defrate` VALUES ('590', '118', '正1-6', '正码3', '绿波');
INSERT INTO `web_xq_defrate` VALUES ('589', '118', '正1-6', '正码3', '红波');
INSERT INTO `web_xq_defrate` VALUES ('588', '118', '正1-6', '正码3', '双');
INSERT INTO `web_xq_defrate` VALUES ('587', '118', '正1-6', '正码3', '单');
INSERT INTO `web_xq_defrate` VALUES ('586', '118', '正1-6', '正码3', '小');
INSERT INTO `web_xq_defrate` VALUES ('585', '118', '正1-6', '正码3', '大');
INSERT INTO `web_xq_defrate` VALUES ('584', '118', '正1-6', '正码2', '蓝波');
INSERT INTO `web_xq_defrate` VALUES ('583', '118', '正1-6', '正码2', '绿波');
INSERT INTO `web_xq_defrate` VALUES ('582', '118', '正1-6', '正码2', '红波');
INSERT INTO `web_xq_defrate` VALUES ('581', '118', '正1-6', '正码2', '双');
INSERT INTO `web_xq_defrate` VALUES ('580', '118', '正1-6', '正码2', '单');
INSERT INTO `web_xq_defrate` VALUES ('579', '118', '正1-6', '正码2', '小');
INSERT INTO `web_xq_defrate` VALUES ('578', '118', '正1-6', '正码2', '大');
INSERT INTO `web_xq_defrate` VALUES ('577', '118', '正1-6', '正码1', '蓝波');
INSERT INTO `web_xq_defrate` VALUES ('576', '118', '正1-6', '正码1', '绿波');
INSERT INTO `web_xq_defrate` VALUES ('575', '118', '正1-6', '正码1', '红波');
INSERT INTO `web_xq_defrate` VALUES ('574', '118', '正1-6', '正码1', '双');
INSERT INTO `web_xq_defrate` VALUES ('573', '118', '正1-6', '正码1', '单');
INSERT INTO `web_xq_defrate` VALUES ('572', '118', '正1-6', '正码1', '小');
INSERT INTO `web_xq_defrate` VALUES ('571', '118', '正1-6', '正码1', '大');
INSERT INTO `web_xq_defrate` VALUES ('570', '80', '正码', '正B', '总小');
INSERT INTO `web_xq_defrate` VALUES ('569', '80', '正码', '正B', '总大');
INSERT INTO `web_xq_defrate` VALUES ('568', '79', '正码', '正B', '总双');
INSERT INTO `web_xq_defrate` VALUES ('567', '79', '正码', '正B', '总单');
INSERT INTO `web_xq_defrate` VALUES ('566', '78', '正码', '正B', '49');
INSERT INTO `web_xq_defrate` VALUES ('565', '78', '正码', '正B', '48');
INSERT INTO `web_xq_defrate` VALUES ('564', '78', '正码', '正B', '47');
INSERT INTO `web_xq_defrate` VALUES ('563', '78', '正码', '正B', '46');
INSERT INTO `web_xq_defrate` VALUES ('562', '78', '正码', '正B', '45');
INSERT INTO `web_xq_defrate` VALUES ('561', '78', '正码', '正B', '44');
INSERT INTO `web_xq_defrate` VALUES ('560', '78', '正码', '正B', '43');
INSERT INTO `web_xq_defrate` VALUES ('559', '78', '正码', '正B', '42');
INSERT INTO `web_xq_defrate` VALUES ('558', '78', '正码', '正B', '41');
INSERT INTO `web_xq_defrate` VALUES ('557', '78', '正码', '正B', '40');
INSERT INTO `web_xq_defrate` VALUES ('556', '78', '正码', '正B', '39');
INSERT INTO `web_xq_defrate` VALUES ('555', '78', '正码', '正B', '38');
INSERT INTO `web_xq_defrate` VALUES ('554', '78', '正码', '正B', '37');
INSERT INTO `web_xq_defrate` VALUES ('553', '78', '正码', '正B', '36');
INSERT INTO `web_xq_defrate` VALUES ('552', '78', '正码', '正B', '35');
INSERT INTO `web_xq_defrate` VALUES ('551', '78', '正码', '正B', '34');
INSERT INTO `web_xq_defrate` VALUES ('550', '78', '正码', '正B', '33');
INSERT INTO `web_xq_defrate` VALUES ('549', '78', '正码', '正B', '32');
INSERT INTO `web_xq_defrate` VALUES ('548', '78', '正码', '正B', '31');
INSERT INTO `web_xq_defrate` VALUES ('547', '78', '正码', '正B', '30');
INSERT INTO `web_xq_defrate` VALUES ('546', '78', '正码', '正B', '29');
INSERT INTO `web_xq_defrate` VALUES ('545', '78', '正码', '正B', '28');
INSERT INTO `web_xq_defrate` VALUES ('544', '78', '正码', '正B', '27');
INSERT INTO `web_xq_defrate` VALUES ('543', '78', '正码', '正B', '26');
INSERT INTO `web_xq_defrate` VALUES ('542', '78', '正码', '正B', '25');
INSERT INTO `web_xq_defrate` VALUES ('541', '78', '正码', '正B', '24');
INSERT INTO `web_xq_defrate` VALUES ('540', '78', '正码', '正B', '23');
INSERT INTO `web_xq_defrate` VALUES ('539', '78', '正码', '正B', '22');
INSERT INTO `web_xq_defrate` VALUES ('538', '78', '正码', '正B', '21');
INSERT INTO `web_xq_defrate` VALUES ('537', '78', '正码', '正B', '20');
INSERT INTO `web_xq_defrate` VALUES ('536', '78', '正码', '正B', '19');
INSERT INTO `web_xq_defrate` VALUES ('535', '78', '正码', '正B', '18');
INSERT INTO `web_xq_defrate` VALUES ('534', '78', '正码', '正B', '17');
INSERT INTO `web_xq_defrate` VALUES ('533', '78', '正码', '正B', '16');
INSERT INTO `web_xq_defrate` VALUES ('532', '78', '正码', '正B', '15');
INSERT INTO `web_xq_defrate` VALUES ('531', '78', '正码', '正B', '14');
INSERT INTO `web_xq_defrate` VALUES ('530', '78', '正码', '正B', '13');
INSERT INTO `web_xq_defrate` VALUES ('529', '78', '正码', '正B', '12');
INSERT INTO `web_xq_defrate` VALUES ('528', '78', '正码', '正B', '11');
INSERT INTO `web_xq_defrate` VALUES ('527', '78', '正码', '正B', '10');
INSERT INTO `web_xq_defrate` VALUES ('526', '78', '正码', '正B', '9');
INSERT INTO `web_xq_defrate` VALUES ('525', '78', '正码', '正B', '8');
INSERT INTO `web_xq_defrate` VALUES ('524', '78', '正码', '正B', '7');
INSERT INTO `web_xq_defrate` VALUES ('523', '78', '正码', '正B', '6');
INSERT INTO `web_xq_defrate` VALUES ('522', '78', '正码', '正B', '5');
INSERT INTO `web_xq_defrate` VALUES ('521', '78', '正码', '正B', '4');
INSERT INTO `web_xq_defrate` VALUES ('520', '78', '正码', '正B', '3');
INSERT INTO `web_xq_defrate` VALUES ('519', '78', '正码', '正B', '2');
INSERT INTO `web_xq_defrate` VALUES ('518', '78', '正码', '正B', '1');
INSERT INTO `web_xq_defrate` VALUES ('517', '80', '正码', '正A', '总小');
INSERT INTO `web_xq_defrate` VALUES ('516', '80', '正码', '正A', '总大');
INSERT INTO `web_xq_defrate` VALUES ('515', '79', '正码', '正A', '总双');
INSERT INTO `web_xq_defrate` VALUES ('514', '79', '正码', '正A', '总单');
INSERT INTO `web_xq_defrate` VALUES ('513', '77', '正码', '正A', '49');
INSERT INTO `web_xq_defrate` VALUES ('512', '77', '正码', '正A', '48');
INSERT INTO `web_xq_defrate` VALUES ('511', '77', '正码', '正A', '47');
INSERT INTO `web_xq_defrate` VALUES ('510', '77', '正码', '正A', '46');
INSERT INTO `web_xq_defrate` VALUES ('509', '77', '正码', '正A', '45');
INSERT INTO `web_xq_defrate` VALUES ('508', '77', '正码', '正A', '44');
INSERT INTO `web_xq_defrate` VALUES ('507', '77', '正码', '正A', '43');
INSERT INTO `web_xq_defrate` VALUES ('506', '77', '正码', '正A', '42');
INSERT INTO `web_xq_defrate` VALUES ('505', '77', '正码', '正A', '41');
INSERT INTO `web_xq_defrate` VALUES ('504', '77', '正码', '正A', '40');
INSERT INTO `web_xq_defrate` VALUES ('503', '77', '正码', '正A', '39');
INSERT INTO `web_xq_defrate` VALUES ('502', '77', '正码', '正A', '38');
INSERT INTO `web_xq_defrate` VALUES ('501', '77', '正码', '正A', '37');
INSERT INTO `web_xq_defrate` VALUES ('500', '77', '正码', '正A', '36');
INSERT INTO `web_xq_defrate` VALUES ('499', '77', '正码', '正A', '35');
INSERT INTO `web_xq_defrate` VALUES ('498', '77', '正码', '正A', '34');
INSERT INTO `web_xq_defrate` VALUES ('497', '77', '正码', '正A', '33');
INSERT INTO `web_xq_defrate` VALUES ('496', '77', '正码', '正A', '32');
INSERT INTO `web_xq_defrate` VALUES ('495', '77', '正码', '正A', '31');
INSERT INTO `web_xq_defrate` VALUES ('494', '77', '正码', '正A', '30');
INSERT INTO `web_xq_defrate` VALUES ('493', '77', '正码', '正A', '29');
INSERT INTO `web_xq_defrate` VALUES ('492', '77', '正码', '正A', '28');
INSERT INTO `web_xq_defrate` VALUES ('491', '77', '正码', '正A', '27');
INSERT INTO `web_xq_defrate` VALUES ('490', '77', '正码', '正A', '26');
INSERT INTO `web_xq_defrate` VALUES ('489', '77', '正码', '正A', '25');
INSERT INTO `web_xq_defrate` VALUES ('488', '77', '正码', '正A', '24');
INSERT INTO `web_xq_defrate` VALUES ('487', '77', '正码', '正A', '23');
INSERT INTO `web_xq_defrate` VALUES ('486', '77', '正码', '正A', '22');
INSERT INTO `web_xq_defrate` VALUES ('485', '77', '正码', '正A', '21');
INSERT INTO `web_xq_defrate` VALUES ('484', '77', '正码', '正A', '20');
INSERT INTO `web_xq_defrate` VALUES ('483', '77', '正码', '正A', '19');
INSERT INTO `web_xq_defrate` VALUES ('482', '77', '正码', '正A', '18');
INSERT INTO `web_xq_defrate` VALUES ('481', '77', '正码', '正A', '17');
INSERT INTO `web_xq_defrate` VALUES ('480', '77', '正码', '正A', '16');
INSERT INTO `web_xq_defrate` VALUES ('479', '77', '正码', '正A', '15');
INSERT INTO `web_xq_defrate` VALUES ('478', '77', '正码', '正A', '14');
INSERT INTO `web_xq_defrate` VALUES ('477', '77', '正码', '正A', '13');
INSERT INTO `web_xq_defrate` VALUES ('476', '77', '正码', '正A', '12');
INSERT INTO `web_xq_defrate` VALUES ('475', '77', '正码', '正A', '11');
INSERT INTO `web_xq_defrate` VALUES ('474', '77', '正码', '正A', '10');
INSERT INTO `web_xq_defrate` VALUES ('473', '77', '正码', '正A', '9');
INSERT INTO `web_xq_defrate` VALUES ('472', '77', '正码', '正A', '8');
INSERT INTO `web_xq_defrate` VALUES ('471', '77', '正码', '正A', '7');
INSERT INTO `web_xq_defrate` VALUES ('470', '77', '正码', '正A', '6');
INSERT INTO `web_xq_defrate` VALUES ('469', '77', '正码', '正A', '5');
INSERT INTO `web_xq_defrate` VALUES ('468', '77', '正码', '正A', '4');
INSERT INTO `web_xq_defrate` VALUES ('467', '77', '正码', '正A', '3');
INSERT INTO `web_xq_defrate` VALUES ('466', '77', '正码', '正A', '2');
INSERT INTO `web_xq_defrate` VALUES ('465', '77', '正码', '正A', '1');
INSERT INTO `web_xq_defrate` VALUES ('464', '81', '正特', '正6特', '蓝波');
INSERT INTO `web_xq_defrate` VALUES ('463', '81', '正特', '正6特', '绿波');
INSERT INTO `web_xq_defrate` VALUES ('462', '81', '正特', '正6特', '红波');
INSERT INTO `web_xq_defrate` VALUES ('461', '75', '正特', '正6特', '合双');
INSERT INTO `web_xq_defrate` VALUES ('460', '75', '正特', '正6特', '合单');
INSERT INTO `web_xq_defrate` VALUES ('459', '74', '正特', '正6特', '小');
INSERT INTO `web_xq_defrate` VALUES ('458', '74', '正特', '正6特', '大');
INSERT INTO `web_xq_defrate` VALUES ('457', '73', '正特', '正6特', '双');
INSERT INTO `web_xq_defrate` VALUES ('456', '73', '正特', '正6特', '单');
INSERT INTO `web_xq_defrate` VALUES ('455', '76', '正特', '正6特', '49');
INSERT INTO `web_xq_defrate` VALUES ('454', '76', '正特', '正6特', '48');
INSERT INTO `web_xq_defrate` VALUES ('453', '76', '正特', '正6特', '47');
INSERT INTO `web_xq_defrate` VALUES ('452', '76', '正特', '正6特', '46');
INSERT INTO `web_xq_defrate` VALUES ('451', '76', '正特', '正6特', '45');
INSERT INTO `web_xq_defrate` VALUES ('450', '76', '正特', '正6特', '44');
INSERT INTO `web_xq_defrate` VALUES ('449', '76', '正特', '正6特', '43');
INSERT INTO `web_xq_defrate` VALUES ('448', '76', '正特', '正6特', '42');
INSERT INTO `web_xq_defrate` VALUES ('447', '76', '正特', '正6特', '41');
INSERT INTO `web_xq_defrate` VALUES ('446', '76', '正特', '正6特', '40');
INSERT INTO `web_xq_defrate` VALUES ('445', '76', '正特', '正6特', '39');
INSERT INTO `web_xq_defrate` VALUES ('444', '76', '正特', '正6特', '38');
INSERT INTO `web_xq_defrate` VALUES ('443', '76', '正特', '正6特', '37');
INSERT INTO `web_xq_defrate` VALUES ('442', '76', '正特', '正6特', '36');
INSERT INTO `web_xq_defrate` VALUES ('441', '76', '正特', '正6特', '35');
INSERT INTO `web_xq_defrate` VALUES ('440', '76', '正特', '正6特', '34');
INSERT INTO `web_xq_defrate` VALUES ('439', '76', '正特', '正6特', '33');
INSERT INTO `web_xq_defrate` VALUES ('438', '76', '正特', '正6特', '32');
INSERT INTO `web_xq_defrate` VALUES ('437', '76', '正特', '正6特', '31');
INSERT INTO `web_xq_defrate` VALUES ('436', '76', '正特', '正6特', '30');
INSERT INTO `web_xq_defrate` VALUES ('435', '76', '正特', '正6特', '29');
INSERT INTO `web_xq_defrate` VALUES ('434', '76', '正特', '正6特', '28');
INSERT INTO `web_xq_defrate` VALUES ('433', '76', '正特', '正6特', '27');
INSERT INTO `web_xq_defrate` VALUES ('432', '76', '正特', '正6特', '26');
INSERT INTO `web_xq_defrate` VALUES ('431', '76', '正特', '正6特', '25');
INSERT INTO `web_xq_defrate` VALUES ('430', '76', '正特', '正6特', '24');
INSERT INTO `web_xq_defrate` VALUES ('429', '76', '正特', '正6特', '23');
INSERT INTO `web_xq_defrate` VALUES ('428', '76', '正特', '正6特', '22');
INSERT INTO `web_xq_defrate` VALUES ('427', '76', '正特', '正6特', '21');
INSERT INTO `web_xq_defrate` VALUES ('426', '76', '正特', '正6特', '20');
INSERT INTO `web_xq_defrate` VALUES ('425', '76', '正特', '正6特', '19');
INSERT INTO `web_xq_defrate` VALUES ('424', '76', '正特', '正6特', '18');
INSERT INTO `web_xq_defrate` VALUES ('423', '76', '正特', '正6特', '17');
INSERT INTO `web_xq_defrate` VALUES ('422', '76', '正特', '正6特', '16');
INSERT INTO `web_xq_defrate` VALUES ('421', '76', '正特', '正6特', '15');
INSERT INTO `web_xq_defrate` VALUES ('420', '76', '正特', '正6特', '14');
INSERT INTO `web_xq_defrate` VALUES ('419', '76', '正特', '正6特', '13');
INSERT INTO `web_xq_defrate` VALUES ('418', '76', '正特', '正6特', '12');
INSERT INTO `web_xq_defrate` VALUES ('417', '76', '正特', '正6特', '11');
INSERT INTO `web_xq_defrate` VALUES ('416', '76', '正特', '正6特', '10');
INSERT INTO `web_xq_defrate` VALUES ('415', '76', '正特', '正6特', '9');
INSERT INTO `web_xq_defrate` VALUES ('414', '76', '正特', '正6特', '8');
INSERT INTO `web_xq_defrate` VALUES ('413', '76', '正特', '正6特', '7');
INSERT INTO `web_xq_defrate` VALUES ('412', '76', '正特', '正6特', '6');
INSERT INTO `web_xq_defrate` VALUES ('411', '76', '正特', '正6特', '5');
INSERT INTO `web_xq_defrate` VALUES ('410', '76', '正特', '正6特', '4');
INSERT INTO `web_xq_defrate` VALUES ('409', '76', '正特', '正6特', '3');
INSERT INTO `web_xq_defrate` VALUES ('408', '76', '正特', '正6特', '2');
INSERT INTO `web_xq_defrate` VALUES ('407', '76', '正特', '正6特', '1');
INSERT INTO `web_xq_defrate` VALUES ('406', '81', '正特', '正5特', '蓝波');
INSERT INTO `web_xq_defrate` VALUES ('405', '81', '正特', '正5特', '绿波');
INSERT INTO `web_xq_defrate` VALUES ('404', '81', '正特', '正5特', '红波');
INSERT INTO `web_xq_defrate` VALUES ('403', '75', '正特', '正5特', '合双');
INSERT INTO `web_xq_defrate` VALUES ('402', '75', '正特', '正5特', '合单');
INSERT INTO `web_xq_defrate` VALUES ('401', '74', '正特', '正5特', '小');
INSERT INTO `web_xq_defrate` VALUES ('400', '74', '正特', '正5特', '大');
INSERT INTO `web_xq_defrate` VALUES ('399', '73', '正特', '正5特', '双');
INSERT INTO `web_xq_defrate` VALUES ('398', '73', '正特', '正5特', '单');
INSERT INTO `web_xq_defrate` VALUES ('397', '76', '正特', '正5特', '49');
INSERT INTO `web_xq_defrate` VALUES ('396', '76', '正特', '正5特', '48');
INSERT INTO `web_xq_defrate` VALUES ('395', '76', '正特', '正5特', '47');
INSERT INTO `web_xq_defrate` VALUES ('394', '76', '正特', '正5特', '46');
INSERT INTO `web_xq_defrate` VALUES ('393', '76', '正特', '正5特', '45');
INSERT INTO `web_xq_defrate` VALUES ('392', '76', '正特', '正5特', '44');
INSERT INTO `web_xq_defrate` VALUES ('391', '76', '正特', '正5特', '43');
INSERT INTO `web_xq_defrate` VALUES ('390', '76', '正特', '正5特', '42');
INSERT INTO `web_xq_defrate` VALUES ('389', '76', '正特', '正5特', '41');
INSERT INTO `web_xq_defrate` VALUES ('388', '76', '正特', '正5特', '40');
INSERT INTO `web_xq_defrate` VALUES ('387', '76', '正特', '正5特', '39');
INSERT INTO `web_xq_defrate` VALUES ('386', '76', '正特', '正5特', '38');
INSERT INTO `web_xq_defrate` VALUES ('385', '76', '正特', '正5特', '37');
INSERT INTO `web_xq_defrate` VALUES ('384', '76', '正特', '正5特', '36');
INSERT INTO `web_xq_defrate` VALUES ('383', '76', '正特', '正5特', '35');
INSERT INTO `web_xq_defrate` VALUES ('382', '76', '正特', '正5特', '34');
INSERT INTO `web_xq_defrate` VALUES ('381', '76', '正特', '正5特', '33');
INSERT INTO `web_xq_defrate` VALUES ('380', '76', '正特', '正5特', '32');
INSERT INTO `web_xq_defrate` VALUES ('379', '76', '正特', '正5特', '31');
INSERT INTO `web_xq_defrate` VALUES ('378', '76', '正特', '正5特', '30');
INSERT INTO `web_xq_defrate` VALUES ('377', '76', '正特', '正5特', '29');
INSERT INTO `web_xq_defrate` VALUES ('376', '76', '正特', '正5特', '28');
INSERT INTO `web_xq_defrate` VALUES ('375', '76', '正特', '正5特', '27');
INSERT INTO `web_xq_defrate` VALUES ('374', '76', '正特', '正5特', '26');
INSERT INTO `web_xq_defrate` VALUES ('373', '76', '正特', '正5特', '25');
INSERT INTO `web_xq_defrate` VALUES ('372', '76', '正特', '正5特', '24');
INSERT INTO `web_xq_defrate` VALUES ('371', '76', '正特', '正5特', '23');
INSERT INTO `web_xq_defrate` VALUES ('370', '76', '正特', '正5特', '22');
INSERT INTO `web_xq_defrate` VALUES ('369', '76', '正特', '正5特', '21');
INSERT INTO `web_xq_defrate` VALUES ('368', '76', '正特', '正5特', '20');
INSERT INTO `web_xq_defrate` VALUES ('367', '76', '正特', '正5特', '19');
INSERT INTO `web_xq_defrate` VALUES ('366', '76', '正特', '正5特', '18');
INSERT INTO `web_xq_defrate` VALUES ('365', '76', '正特', '正5特', '17');
INSERT INTO `web_xq_defrate` VALUES ('364', '76', '正特', '正5特', '16');
INSERT INTO `web_xq_defrate` VALUES ('363', '76', '正特', '正5特', '15');
INSERT INTO `web_xq_defrate` VALUES ('362', '76', '正特', '正5特', '14');
INSERT INTO `web_xq_defrate` VALUES ('361', '76', '正特', '正5特', '13');
INSERT INTO `web_xq_defrate` VALUES ('360', '76', '正特', '正5特', '12');
INSERT INTO `web_xq_defrate` VALUES ('359', '76', '正特', '正5特', '11');
INSERT INTO `web_xq_defrate` VALUES ('358', '76', '正特', '正5特', '10');
INSERT INTO `web_xq_defrate` VALUES ('357', '76', '正特', '正5特', '9');
INSERT INTO `web_xq_defrate` VALUES ('356', '76', '正特', '正5特', '8');
INSERT INTO `web_xq_defrate` VALUES ('355', '76', '正特', '正5特', '7');
INSERT INTO `web_xq_defrate` VALUES ('354', '76', '正特', '正5特', '6');
INSERT INTO `web_xq_defrate` VALUES ('353', '76', '正特', '正5特', '5');
INSERT INTO `web_xq_defrate` VALUES ('352', '76', '正特', '正5特', '4');
INSERT INTO `web_xq_defrate` VALUES ('351', '76', '正特', '正5特', '3');
INSERT INTO `web_xq_defrate` VALUES ('350', '76', '正特', '正5特', '2');
INSERT INTO `web_xq_defrate` VALUES ('349', '76', '正特', '正5特', '1');
INSERT INTO `web_xq_defrate` VALUES ('348', '81', '正特', '正4特', '蓝波');
INSERT INTO `web_xq_defrate` VALUES ('347', '81', '正特', '正4特', '绿波');
INSERT INTO `web_xq_defrate` VALUES ('346', '81', '正特', '正4特', '红波');
INSERT INTO `web_xq_defrate` VALUES ('345', '75', '正特', '正4特', '合双');
INSERT INTO `web_xq_defrate` VALUES ('344', '75', '正特', '正4特', '合单');
INSERT INTO `web_xq_defrate` VALUES ('343', '74', '正特', '正4特', '小');
INSERT INTO `web_xq_defrate` VALUES ('342', '74', '正特', '正4特', '大');
INSERT INTO `web_xq_defrate` VALUES ('341', '73', '正特', '正4特', '双');
INSERT INTO `web_xq_defrate` VALUES ('340', '73', '正特', '正4特', '单');
INSERT INTO `web_xq_defrate` VALUES ('339', '76', '正特', '正4特', '49');
INSERT INTO `web_xq_defrate` VALUES ('338', '76', '正特', '正4特', '48');
INSERT INTO `web_xq_defrate` VALUES ('337', '76', '正特', '正4特', '47');
INSERT INTO `web_xq_defrate` VALUES ('336', '76', '正特', '正4特', '46');
INSERT INTO `web_xq_defrate` VALUES ('335', '76', '正特', '正4特', '45');
INSERT INTO `web_xq_defrate` VALUES ('334', '76', '正特', '正4特', '44');
INSERT INTO `web_xq_defrate` VALUES ('333', '76', '正特', '正4特', '43');
INSERT INTO `web_xq_defrate` VALUES ('332', '76', '正特', '正4特', '42');
INSERT INTO `web_xq_defrate` VALUES ('331', '76', '正特', '正4特', '41');
INSERT INTO `web_xq_defrate` VALUES ('330', '76', '正特', '正4特', '40');
INSERT INTO `web_xq_defrate` VALUES ('329', '76', '正特', '正4特', '39');
INSERT INTO `web_xq_defrate` VALUES ('328', '76', '正特', '正4特', '38');
INSERT INTO `web_xq_defrate` VALUES ('327', '76', '正特', '正4特', '37');
INSERT INTO `web_xq_defrate` VALUES ('326', '76', '正特', '正4特', '36');
INSERT INTO `web_xq_defrate` VALUES ('325', '76', '正特', '正4特', '35');
INSERT INTO `web_xq_defrate` VALUES ('324', '76', '正特', '正4特', '34');
INSERT INTO `web_xq_defrate` VALUES ('323', '76', '正特', '正4特', '33');
INSERT INTO `web_xq_defrate` VALUES ('322', '76', '正特', '正4特', '32');
INSERT INTO `web_xq_defrate` VALUES ('321', '76', '正特', '正4特', '31');
INSERT INTO `web_xq_defrate` VALUES ('320', '76', '正特', '正4特', '30');
INSERT INTO `web_xq_defrate` VALUES ('319', '76', '正特', '正4特', '29');
INSERT INTO `web_xq_defrate` VALUES ('318', '76', '正特', '正4特', '28');
INSERT INTO `web_xq_defrate` VALUES ('317', '76', '正特', '正4特', '27');
INSERT INTO `web_xq_defrate` VALUES ('316', '76', '正特', '正4特', '26');
INSERT INTO `web_xq_defrate` VALUES ('315', '76', '正特', '正4特', '25');
INSERT INTO `web_xq_defrate` VALUES ('314', '76', '正特', '正4特', '24');
INSERT INTO `web_xq_defrate` VALUES ('313', '76', '正特', '正4特', '23');
INSERT INTO `web_xq_defrate` VALUES ('312', '76', '正特', '正4特', '22');
INSERT INTO `web_xq_defrate` VALUES ('311', '76', '正特', '正4特', '21');
INSERT INTO `web_xq_defrate` VALUES ('310', '76', '正特', '正4特', '20');
INSERT INTO `web_xq_defrate` VALUES ('309', '76', '正特', '正4特', '19');
INSERT INTO `web_xq_defrate` VALUES ('308', '76', '正特', '正4特', '18');
INSERT INTO `web_xq_defrate` VALUES ('307', '76', '正特', '正4特', '17');
INSERT INTO `web_xq_defrate` VALUES ('306', '76', '正特', '正4特', '16');
INSERT INTO `web_xq_defrate` VALUES ('305', '76', '正特', '正4特', '15');
INSERT INTO `web_xq_defrate` VALUES ('304', '76', '正特', '正4特', '14');
INSERT INTO `web_xq_defrate` VALUES ('303', '76', '正特', '正4特', '13');
INSERT INTO `web_xq_defrate` VALUES ('302', '76', '正特', '正4特', '12');
INSERT INTO `web_xq_defrate` VALUES ('301', '76', '正特', '正4特', '11');
INSERT INTO `web_xq_defrate` VALUES ('300', '76', '正特', '正4特', '10');
INSERT INTO `web_xq_defrate` VALUES ('299', '76', '正特', '正4特', '9');
INSERT INTO `web_xq_defrate` VALUES ('298', '76', '正特', '正4特', '8');
INSERT INTO `web_xq_defrate` VALUES ('297', '76', '正特', '正4特', '7');
INSERT INTO `web_xq_defrate` VALUES ('296', '76', '正特', '正4特', '6');
INSERT INTO `web_xq_defrate` VALUES ('295', '76', '正特', '正4特', '5');
INSERT INTO `web_xq_defrate` VALUES ('294', '76', '正特', '正4特', '4');
INSERT INTO `web_xq_defrate` VALUES ('293', '76', '正特', '正4特', '3');
INSERT INTO `web_xq_defrate` VALUES ('292', '76', '正特', '正4特', '2');
INSERT INTO `web_xq_defrate` VALUES ('291', '76', '正特', '正4特', '1');
INSERT INTO `web_xq_defrate` VALUES ('290', '81', '正特', '正3特', '蓝波');
INSERT INTO `web_xq_defrate` VALUES ('289', '81', '正特', '正3特', '绿波');
INSERT INTO `web_xq_defrate` VALUES ('288', '81', '正特', '正3特', '红波');
INSERT INTO `web_xq_defrate` VALUES ('287', '75', '正特', '正3特', '合双');
INSERT INTO `web_xq_defrate` VALUES ('286', '75', '正特', '正3特', '合单');
INSERT INTO `web_xq_defrate` VALUES ('285', '74', '正特', '正3特', '小');
INSERT INTO `web_xq_defrate` VALUES ('284', '74', '正特', '正3特', '大');
INSERT INTO `web_xq_defrate` VALUES ('283', '73', '正特', '正3特', '双');
INSERT INTO `web_xq_defrate` VALUES ('282', '73', '正特', '正3特', '单');
INSERT INTO `web_xq_defrate` VALUES ('281', '76', '正特', '正3特', '49');
INSERT INTO `web_xq_defrate` VALUES ('280', '76', '正特', '正3特', '48');
INSERT INTO `web_xq_defrate` VALUES ('279', '76', '正特', '正3特', '47');
INSERT INTO `web_xq_defrate` VALUES ('278', '76', '正特', '正3特', '46');
INSERT INTO `web_xq_defrate` VALUES ('277', '76', '正特', '正3特', '45');
INSERT INTO `web_xq_defrate` VALUES ('276', '76', '正特', '正3特', '44');
INSERT INTO `web_xq_defrate` VALUES ('275', '76', '正特', '正3特', '43');
INSERT INTO `web_xq_defrate` VALUES ('274', '76', '正特', '正3特', '42');
INSERT INTO `web_xq_defrate` VALUES ('273', '76', '正特', '正3特', '41');
INSERT INTO `web_xq_defrate` VALUES ('272', '76', '正特', '正3特', '40');
INSERT INTO `web_xq_defrate` VALUES ('271', '76', '正特', '正3特', '39');
INSERT INTO `web_xq_defrate` VALUES ('270', '76', '正特', '正3特', '38');
INSERT INTO `web_xq_defrate` VALUES ('269', '76', '正特', '正3特', '37');
INSERT INTO `web_xq_defrate` VALUES ('268', '76', '正特', '正3特', '36');
INSERT INTO `web_xq_defrate` VALUES ('267', '76', '正特', '正3特', '35');
INSERT INTO `web_xq_defrate` VALUES ('266', '76', '正特', '正3特', '34');
INSERT INTO `web_xq_defrate` VALUES ('265', '76', '正特', '正3特', '33');
INSERT INTO `web_xq_defrate` VALUES ('264', '76', '正特', '正3特', '32');
INSERT INTO `web_xq_defrate` VALUES ('263', '76', '正特', '正3特', '31');
INSERT INTO `web_xq_defrate` VALUES ('262', '76', '正特', '正3特', '30');
INSERT INTO `web_xq_defrate` VALUES ('261', '76', '正特', '正3特', '29');
INSERT INTO `web_xq_defrate` VALUES ('260', '76', '正特', '正3特', '28');
INSERT INTO `web_xq_defrate` VALUES ('259', '76', '正特', '正3特', '27');
INSERT INTO `web_xq_defrate` VALUES ('258', '76', '正特', '正3特', '26');
INSERT INTO `web_xq_defrate` VALUES ('257', '76', '正特', '正3特', '25');
INSERT INTO `web_xq_defrate` VALUES ('256', '76', '正特', '正3特', '24');
INSERT INTO `web_xq_defrate` VALUES ('255', '76', '正特', '正3特', '23');
INSERT INTO `web_xq_defrate` VALUES ('254', '76', '正特', '正3特', '22');
INSERT INTO `web_xq_defrate` VALUES ('253', '76', '正特', '正3特', '21');
INSERT INTO `web_xq_defrate` VALUES ('252', '76', '正特', '正3特', '20');
INSERT INTO `web_xq_defrate` VALUES ('251', '76', '正特', '正3特', '19');
INSERT INTO `web_xq_defrate` VALUES ('250', '76', '正特', '正3特', '18');
INSERT INTO `web_xq_defrate` VALUES ('249', '76', '正特', '正3特', '17');
INSERT INTO `web_xq_defrate` VALUES ('248', '76', '正特', '正3特', '16');
INSERT INTO `web_xq_defrate` VALUES ('247', '76', '正特', '正3特', '15');
INSERT INTO `web_xq_defrate` VALUES ('246', '76', '正特', '正3特', '14');
INSERT INTO `web_xq_defrate` VALUES ('245', '76', '正特', '正3特', '13');
INSERT INTO `web_xq_defrate` VALUES ('244', '76', '正特', '正3特', '12');
INSERT INTO `web_xq_defrate` VALUES ('243', '76', '正特', '正3特', '11');
INSERT INTO `web_xq_defrate` VALUES ('242', '76', '正特', '正3特', '10');
INSERT INTO `web_xq_defrate` VALUES ('241', '76', '正特', '正3特', '9');
INSERT INTO `web_xq_defrate` VALUES ('240', '76', '正特', '正3特', '8');
INSERT INTO `web_xq_defrate` VALUES ('239', '76', '正特', '正3特', '7');
INSERT INTO `web_xq_defrate` VALUES ('238', '76', '正特', '正3特', '6');
INSERT INTO `web_xq_defrate` VALUES ('237', '76', '正特', '正3特', '5');
INSERT INTO `web_xq_defrate` VALUES ('236', '76', '正特', '正3特', '4');
INSERT INTO `web_xq_defrate` VALUES ('235', '76', '正特', '正3特', '3');
INSERT INTO `web_xq_defrate` VALUES ('234', '76', '正特', '正3特', '2');
INSERT INTO `web_xq_defrate` VALUES ('233', '76', '正特', '正3特', '1');
INSERT INTO `web_xq_defrate` VALUES ('232', '81', '正特', '正2特', '蓝波');
INSERT INTO `web_xq_defrate` VALUES ('231', '81', '正特', '正2特', '绿波');
INSERT INTO `web_xq_defrate` VALUES ('230', '81', '正特', '正2特', '红波');
INSERT INTO `web_xq_defrate` VALUES ('229', '75', '正特', '正2特', '合双');
INSERT INTO `web_xq_defrate` VALUES ('228', '75', '正特', '正2特', '合单');
INSERT INTO `web_xq_defrate` VALUES ('227', '74', '正特', '正2特', '小');
INSERT INTO `web_xq_defrate` VALUES ('226', '74', '正特', '正2特', '大');
INSERT INTO `web_xq_defrate` VALUES ('225', '73', '正特', '正2特', '双');
INSERT INTO `web_xq_defrate` VALUES ('224', '73', '正特', '正2特', '单');
INSERT INTO `web_xq_defrate` VALUES ('223', '76', '正特', '正2特', '49');
INSERT INTO `web_xq_defrate` VALUES ('222', '76', '正特', '正2特', '48');
INSERT INTO `web_xq_defrate` VALUES ('221', '76', '正特', '正2特', '47');
INSERT INTO `web_xq_defrate` VALUES ('220', '76', '正特', '正2特', '46');
INSERT INTO `web_xq_defrate` VALUES ('219', '76', '正特', '正2特', '45');
INSERT INTO `web_xq_defrate` VALUES ('218', '76', '正特', '正2特', '44');
INSERT INTO `web_xq_defrate` VALUES ('217', '76', '正特', '正2特', '43');
INSERT INTO `web_xq_defrate` VALUES ('216', '76', '正特', '正2特', '42');
INSERT INTO `web_xq_defrate` VALUES ('215', '76', '正特', '正2特', '41');
INSERT INTO `web_xq_defrate` VALUES ('214', '76', '正特', '正2特', '40');
INSERT INTO `web_xq_defrate` VALUES ('213', '76', '正特', '正2特', '39');
INSERT INTO `web_xq_defrate` VALUES ('212', '76', '正特', '正2特', '38');
INSERT INTO `web_xq_defrate` VALUES ('211', '76', '正特', '正2特', '37');
INSERT INTO `web_xq_defrate` VALUES ('210', '76', '正特', '正2特', '36');
INSERT INTO `web_xq_defrate` VALUES ('209', '76', '正特', '正2特', '35');
INSERT INTO `web_xq_defrate` VALUES ('208', '76', '正特', '正2特', '34');
INSERT INTO `web_xq_defrate` VALUES ('207', '76', '正特', '正2特', '33');
INSERT INTO `web_xq_defrate` VALUES ('206', '76', '正特', '正2特', '32');
INSERT INTO `web_xq_defrate` VALUES ('205', '76', '正特', '正2特', '31');
INSERT INTO `web_xq_defrate` VALUES ('204', '76', '正特', '正2特', '30');
INSERT INTO `web_xq_defrate` VALUES ('203', '76', '正特', '正2特', '29');
INSERT INTO `web_xq_defrate` VALUES ('202', '76', '正特', '正2特', '28');
INSERT INTO `web_xq_defrate` VALUES ('201', '76', '正特', '正2特', '27');
INSERT INTO `web_xq_defrate` VALUES ('200', '76', '正特', '正2特', '26');
INSERT INTO `web_xq_defrate` VALUES ('199', '76', '正特', '正2特', '25');
INSERT INTO `web_xq_defrate` VALUES ('198', '76', '正特', '正2特', '24');
INSERT INTO `web_xq_defrate` VALUES ('197', '76', '正特', '正2特', '23');
INSERT INTO `web_xq_defrate` VALUES ('196', '76', '正特', '正2特', '22');
INSERT INTO `web_xq_defrate` VALUES ('195', '76', '正特', '正2特', '21');
INSERT INTO `web_xq_defrate` VALUES ('194', '76', '正特', '正2特', '20');
INSERT INTO `web_xq_defrate` VALUES ('193', '76', '正特', '正2特', '19');
INSERT INTO `web_xq_defrate` VALUES ('192', '76', '正特', '正2特', '18');
INSERT INTO `web_xq_defrate` VALUES ('191', '76', '正特', '正2特', '17');
INSERT INTO `web_xq_defrate` VALUES ('190', '76', '正特', '正2特', '16');
INSERT INTO `web_xq_defrate` VALUES ('189', '76', '正特', '正2特', '15');
INSERT INTO `web_xq_defrate` VALUES ('188', '76', '正特', '正2特', '14');
INSERT INTO `web_xq_defrate` VALUES ('187', '76', '正特', '正2特', '13');
INSERT INTO `web_xq_defrate` VALUES ('186', '76', '正特', '正2特', '12');
INSERT INTO `web_xq_defrate` VALUES ('185', '76', '正特', '正2特', '11');
INSERT INTO `web_xq_defrate` VALUES ('184', '76', '正特', '正2特', '10');
INSERT INTO `web_xq_defrate` VALUES ('183', '76', '正特', '正2特', '9');
INSERT INTO `web_xq_defrate` VALUES ('182', '76', '正特', '正2特', '8');
INSERT INTO `web_xq_defrate` VALUES ('181', '76', '正特', '正2特', '7');
INSERT INTO `web_xq_defrate` VALUES ('180', '76', '正特', '正2特', '6');
INSERT INTO `web_xq_defrate` VALUES ('179', '76', '正特', '正2特', '5');
INSERT INTO `web_xq_defrate` VALUES ('178', '76', '正特', '正2特', '4');
INSERT INTO `web_xq_defrate` VALUES ('177', '76', '正特', '正2特', '3');
INSERT INTO `web_xq_defrate` VALUES ('176', '76', '正特', '正2特', '2');
INSERT INTO `web_xq_defrate` VALUES ('175', '76', '正特', '正2特', '1');
INSERT INTO `web_xq_defrate` VALUES ('174', '81', '正特', '正1特', '蓝波');
INSERT INTO `web_xq_defrate` VALUES ('173', '81', '正特', '正1特', '绿波');
INSERT INTO `web_xq_defrate` VALUES ('172', '81', '正特', '正1特', '红波');
INSERT INTO `web_xq_defrate` VALUES ('171', '75', '正特', '正1特', '合双');
INSERT INTO `web_xq_defrate` VALUES ('170', '75', '正特', '正1特', '合单');
INSERT INTO `web_xq_defrate` VALUES ('169', '74', '正特', '正1特', '小');
INSERT INTO `web_xq_defrate` VALUES ('168', '74', '正特', '正1特', '大');
INSERT INTO `web_xq_defrate` VALUES ('167', '73', '正特', '正1特', '双');
INSERT INTO `web_xq_defrate` VALUES ('166', '73', '正特', '正1特', '单');
INSERT INTO `web_xq_defrate` VALUES ('165', '76', '正特', '正1特', '49');
INSERT INTO `web_xq_defrate` VALUES ('164', '76', '正特', '正1特', '48');
INSERT INTO `web_xq_defrate` VALUES ('163', '76', '正特', '正1特', '47');
INSERT INTO `web_xq_defrate` VALUES ('162', '76', '正特', '正1特', '46');
INSERT INTO `web_xq_defrate` VALUES ('161', '76', '正特', '正1特', '45');
INSERT INTO `web_xq_defrate` VALUES ('160', '76', '正特', '正1特', '44');
INSERT INTO `web_xq_defrate` VALUES ('159', '76', '正特', '正1特', '43');
INSERT INTO `web_xq_defrate` VALUES ('158', '76', '正特', '正1特', '42');
INSERT INTO `web_xq_defrate` VALUES ('157', '76', '正特', '正1特', '41');
INSERT INTO `web_xq_defrate` VALUES ('156', '76', '正特', '正1特', '40');
INSERT INTO `web_xq_defrate` VALUES ('155', '76', '正特', '正1特', '39');
INSERT INTO `web_xq_defrate` VALUES ('154', '76', '正特', '正1特', '38');
INSERT INTO `web_xq_defrate` VALUES ('153', '76', '正特', '正1特', '37');
INSERT INTO `web_xq_defrate` VALUES ('152', '76', '正特', '正1特', '36');
INSERT INTO `web_xq_defrate` VALUES ('151', '76', '正特', '正1特', '35');
INSERT INTO `web_xq_defrate` VALUES ('150', '76', '正特', '正1特', '34');
INSERT INTO `web_xq_defrate` VALUES ('149', '76', '正特', '正1特', '33');
INSERT INTO `web_xq_defrate` VALUES ('148', '76', '正特', '正1特', '32');
INSERT INTO `web_xq_defrate` VALUES ('147', '76', '正特', '正1特', '31');
INSERT INTO `web_xq_defrate` VALUES ('146', '76', '正特', '正1特', '30');
INSERT INTO `web_xq_defrate` VALUES ('145', '76', '正特', '正1特', '29');
INSERT INTO `web_xq_defrate` VALUES ('144', '76', '正特', '正1特', '28');
INSERT INTO `web_xq_defrate` VALUES ('143', '76', '正特', '正1特', '27');
INSERT INTO `web_xq_defrate` VALUES ('142', '76', '正特', '正1特', '26');
INSERT INTO `web_xq_defrate` VALUES ('141', '76', '正特', '正1特', '25');
INSERT INTO `web_xq_defrate` VALUES ('140', '76', '正特', '正1特', '24');
INSERT INTO `web_xq_defrate` VALUES ('139', '76', '正特', '正1特', '23');
INSERT INTO `web_xq_defrate` VALUES ('138', '76', '正特', '正1特', '22');
INSERT INTO `web_xq_defrate` VALUES ('137', '76', '正特', '正1特', '21');
INSERT INTO `web_xq_defrate` VALUES ('136', '76', '正特', '正1特', '20');
INSERT INTO `web_xq_defrate` VALUES ('135', '76', '正特', '正1特', '19');
INSERT INTO `web_xq_defrate` VALUES ('134', '76', '正特', '正1特', '18');
INSERT INTO `web_xq_defrate` VALUES ('133', '76', '正特', '正1特', '17');
INSERT INTO `web_xq_defrate` VALUES ('132', '76', '正特', '正1特', '16');
INSERT INTO `web_xq_defrate` VALUES ('131', '76', '正特', '正1特', '15');
INSERT INTO `web_xq_defrate` VALUES ('130', '76', '正特', '正1特', '14');
INSERT INTO `web_xq_defrate` VALUES ('129', '76', '正特', '正1特', '13');
INSERT INTO `web_xq_defrate` VALUES ('128', '76', '正特', '正1特', '12');
INSERT INTO `web_xq_defrate` VALUES ('127', '76', '正特', '正1特', '11');
INSERT INTO `web_xq_defrate` VALUES ('126', '76', '正特', '正1特', '10');
INSERT INTO `web_xq_defrate` VALUES ('125', '76', '正特', '正1特', '9');
INSERT INTO `web_xq_defrate` VALUES ('124', '76', '正特', '正1特', '8');
INSERT INTO `web_xq_defrate` VALUES ('123', '76', '正特', '正1特', '7');
INSERT INTO `web_xq_defrate` VALUES ('122', '76', '正特', '正1特', '6');
INSERT INTO `web_xq_defrate` VALUES ('121', '76', '正特', '正1特', '5');
INSERT INTO `web_xq_defrate` VALUES ('120', '76', '正特', '正1特', '4');
INSERT INTO `web_xq_defrate` VALUES ('119', '76', '正特', '正1特', '3');
INSERT INTO `web_xq_defrate` VALUES ('118', '76', '正特', '正1特', '2');
INSERT INTO `web_xq_defrate` VALUES ('117', '76', '正特', '正1特', '1');
INSERT INTO `web_xq_defrate` VALUES ('116', '81', '特码', '特B', '蓝波');
INSERT INTO `web_xq_defrate` VALUES ('115', '81', '特码', '特B', '绿波');
INSERT INTO `web_xq_defrate` VALUES ('114', '81', '特码', '特B', '红波');
INSERT INTO `web_xq_defrate` VALUES ('113', '75', '特码', '特B', '合双');
INSERT INTO `web_xq_defrate` VALUES ('112', '75', '特码', '特B', '合单');
INSERT INTO `web_xq_defrate` VALUES ('111', '74', '特码', '特B', '小');
INSERT INTO `web_xq_defrate` VALUES ('110', '74', '特码', '特B', '大');
INSERT INTO `web_xq_defrate` VALUES ('109', '73', '特码', '特B', '双');
INSERT INTO `web_xq_defrate` VALUES ('108', '73', '特码', '特B', '单');
INSERT INTO `web_xq_defrate` VALUES ('107', '72', '特码', '特B', '49');
INSERT INTO `web_xq_defrate` VALUES ('106', '72', '特码', '特B', '48');
INSERT INTO `web_xq_defrate` VALUES ('105', '72', '特码', '特B', '47');
INSERT INTO `web_xq_defrate` VALUES ('104', '72', '特码', '特B', '46');
INSERT INTO `web_xq_defrate` VALUES ('103', '72', '特码', '特B', '45');
INSERT INTO `web_xq_defrate` VALUES ('102', '72', '特码', '特B', '44');
INSERT INTO `web_xq_defrate` VALUES ('101', '72', '特码', '特B', '43');
INSERT INTO `web_xq_defrate` VALUES ('100', '72', '特码', '特B', '42');
INSERT INTO `web_xq_defrate` VALUES ('99', '72', '特码', '特B', '41');
INSERT INTO `web_xq_defrate` VALUES ('98', '72', '特码', '特B', '40');
INSERT INTO `web_xq_defrate` VALUES ('97', '72', '特码', '特B', '39');
INSERT INTO `web_xq_defrate` VALUES ('96', '72', '特码', '特B', '38');
INSERT INTO `web_xq_defrate` VALUES ('95', '72', '特码', '特B', '37');
INSERT INTO `web_xq_defrate` VALUES ('94', '72', '特码', '特B', '36');
INSERT INTO `web_xq_defrate` VALUES ('93', '72', '特码', '特B', '35');
INSERT INTO `web_xq_defrate` VALUES ('92', '72', '特码', '特B', '34');
INSERT INTO `web_xq_defrate` VALUES ('91', '72', '特码', '特B', '33');
INSERT INTO `web_xq_defrate` VALUES ('90', '72', '特码', '特B', '32');
INSERT INTO `web_xq_defrate` VALUES ('89', '72', '特码', '特B', '31');
INSERT INTO `web_xq_defrate` VALUES ('88', '72', '特码', '特B', '30');
INSERT INTO `web_xq_defrate` VALUES ('87', '72', '特码', '特B', '29');
INSERT INTO `web_xq_defrate` VALUES ('86', '72', '特码', '特B', '28');
INSERT INTO `web_xq_defrate` VALUES ('85', '72', '特码', '特B', '27');
INSERT INTO `web_xq_defrate` VALUES ('84', '72', '特码', '特B', '26');
INSERT INTO `web_xq_defrate` VALUES ('83', '72', '特码', '特B', '25');
INSERT INTO `web_xq_defrate` VALUES ('82', '72', '特码', '特B', '24');
INSERT INTO `web_xq_defrate` VALUES ('81', '72', '特码', '特B', '23');
INSERT INTO `web_xq_defrate` VALUES ('80', '72', '特码', '特B', '22');
INSERT INTO `web_xq_defrate` VALUES ('79', '72', '特码', '特B', '21');
INSERT INTO `web_xq_defrate` VALUES ('78', '72', '特码', '特B', '20');
INSERT INTO `web_xq_defrate` VALUES ('77', '72', '特码', '特B', '19');
INSERT INTO `web_xq_defrate` VALUES ('76', '72', '特码', '特B', '18');
INSERT INTO `web_xq_defrate` VALUES ('75', '72', '特码', '特B', '17');
INSERT INTO `web_xq_defrate` VALUES ('74', '72', '特码', '特B', '16');
INSERT INTO `web_xq_defrate` VALUES ('73', '72', '特码', '特B', '15');
INSERT INTO `web_xq_defrate` VALUES ('72', '72', '特码', '特B', '14');
INSERT INTO `web_xq_defrate` VALUES ('71', '72', '特码', '特B', '13');
INSERT INTO `web_xq_defrate` VALUES ('70', '72', '特码', '特B', '12');
INSERT INTO `web_xq_defrate` VALUES ('69', '72', '特码', '特B', '11');
INSERT INTO `web_xq_defrate` VALUES ('68', '72', '特码', '特B', '10');
INSERT INTO `web_xq_defrate` VALUES ('67', '72', '特码', '特B', '9');
INSERT INTO `web_xq_defrate` VALUES ('66', '72', '特码', '特B', '8');
INSERT INTO `web_xq_defrate` VALUES ('65', '72', '特码', '特B', '7');
INSERT INTO `web_xq_defrate` VALUES ('64', '72', '特码', '特B', '6');
INSERT INTO `web_xq_defrate` VALUES ('63', '72', '特码', '特B', '5');
INSERT INTO `web_xq_defrate` VALUES ('62', '72', '特码', '特B', '4');
INSERT INTO `web_xq_defrate` VALUES ('61', '72', '特码', '特B', '3');
INSERT INTO `web_xq_defrate` VALUES ('60', '72', '特码', '特B', '2');
INSERT INTO `web_xq_defrate` VALUES ('59', '72', '特码', '特B', '1');
INSERT INTO `web_xq_defrate` VALUES ('58', '81', '特码', '特A', '蓝波');
INSERT INTO `web_xq_defrate` VALUES ('57', '81', '特码', '特A', '绿波');
INSERT INTO `web_xq_defrate` VALUES ('56', '81', '特码', '特A', '红波');
INSERT INTO `web_xq_defrate` VALUES ('55', '75', '特码', '特A', '合双');
INSERT INTO `web_xq_defrate` VALUES ('54', '75', '特码', '特A', '合单');
INSERT INTO `web_xq_defrate` VALUES ('53', '74', '特码', '特A', '小');
INSERT INTO `web_xq_defrate` VALUES ('52', '74', '特码', '特A', '大');
INSERT INTO `web_xq_defrate` VALUES ('51', '73', '特码', '特A', '双');
INSERT INTO `web_xq_defrate` VALUES ('50', '73', '特码', '特A', '单');
INSERT INTO `web_xq_defrate` VALUES ('49', '71', '特码', '特A', '49');
INSERT INTO `web_xq_defrate` VALUES ('48', '71', '特码', '特A', '48');
INSERT INTO `web_xq_defrate` VALUES ('47', '71', '特码', '特A', '47');
INSERT INTO `web_xq_defrate` VALUES ('46', '71', '特码', '特A', '46');
INSERT INTO `web_xq_defrate` VALUES ('45', '71', '特码', '特A', '45');
INSERT INTO `web_xq_defrate` VALUES ('44', '71', '特码', '特A', '44');
INSERT INTO `web_xq_defrate` VALUES ('43', '71', '特码', '特A', '43');
INSERT INTO `web_xq_defrate` VALUES ('42', '71', '特码', '特A', '42');
INSERT INTO `web_xq_defrate` VALUES ('41', '71', '特码', '特A', '41');
INSERT INTO `web_xq_defrate` VALUES ('40', '71', '特码', '特A', '40');
INSERT INTO `web_xq_defrate` VALUES ('39', '71', '特码', '特A', '39');
INSERT INTO `web_xq_defrate` VALUES ('38', '71', '特码', '特A', '38');
INSERT INTO `web_xq_defrate` VALUES ('37', '71', '特码', '特A', '37');
INSERT INTO `web_xq_defrate` VALUES ('36', '71', '特码', '特A', '36');
INSERT INTO `web_xq_defrate` VALUES ('35', '71', '特码', '特A', '35');
INSERT INTO `web_xq_defrate` VALUES ('34', '71', '特码', '特A', '34');
INSERT INTO `web_xq_defrate` VALUES ('33', '71', '特码', '特A', '33');
INSERT INTO `web_xq_defrate` VALUES ('32', '71', '特码', '特A', '32');
INSERT INTO `web_xq_defrate` VALUES ('31', '71', '特码', '特A', '31');
INSERT INTO `web_xq_defrate` VALUES ('30', '71', '特码', '特A', '30');
INSERT INTO `web_xq_defrate` VALUES ('29', '71', '特码', '特A', '29');
INSERT INTO `web_xq_defrate` VALUES ('28', '71', '特码', '特A', '28');
INSERT INTO `web_xq_defrate` VALUES ('27', '71', '特码', '特A', '27');
INSERT INTO `web_xq_defrate` VALUES ('26', '71', '特码', '特A', '26');
INSERT INTO `web_xq_defrate` VALUES ('25', '71', '特码', '特A', '25');
INSERT INTO `web_xq_defrate` VALUES ('24', '71', '特码', '特A', '24');
INSERT INTO `web_xq_defrate` VALUES ('23', '71', '特码', '特A', '23');
INSERT INTO `web_xq_defrate` VALUES ('22', '71', '特码', '特A', '22');
INSERT INTO `web_xq_defrate` VALUES ('21', '71', '特码', '特A', '21');
INSERT INTO `web_xq_defrate` VALUES ('20', '71', '特码', '特A', '20');
INSERT INTO `web_xq_defrate` VALUES ('19', '71', '特码', '特A', '19');
INSERT INTO `web_xq_defrate` VALUES ('18', '71', '特码', '特A', '18');
INSERT INTO `web_xq_defrate` VALUES ('17', '71', '特码', '特A', '17');
INSERT INTO `web_xq_defrate` VALUES ('16', '71', '特码', '特A', '16');
INSERT INTO `web_xq_defrate` VALUES ('15', '71', '特码', '特A', '15');
INSERT INTO `web_xq_defrate` VALUES ('14', '71', '特码', '特A', '14');
INSERT INTO `web_xq_defrate` VALUES ('13', '71', '特码', '特A', '13');
INSERT INTO `web_xq_defrate` VALUES ('12', '71', '特码', '特A', '12');
INSERT INTO `web_xq_defrate` VALUES ('11', '71', '特码', '特A', '11');
INSERT INTO `web_xq_defrate` VALUES ('10', '71', '特码', '特A', '10');
INSERT INTO `web_xq_defrate` VALUES ('9', '71', '特码', '特A', '9');
INSERT INTO `web_xq_defrate` VALUES ('8', '71', '特码', '特A', '8');
INSERT INTO `web_xq_defrate` VALUES ('7', '71', '特码', '特A', '7');
INSERT INTO `web_xq_defrate` VALUES ('6', '71', '特码', '特A', '6');
INSERT INTO `web_xq_defrate` VALUES ('5', '71', '特码', '特A', '5');
INSERT INTO `web_xq_defrate` VALUES ('4', '71', '特码', '特A', '4');
INSERT INTO `web_xq_defrate` VALUES ('3', '71', '特码', '特A', '3');
INSERT INTO `web_xq_defrate` VALUES ('2', '71', '特码', '特A', '2');
INSERT INTO `web_xq_defrate` VALUES ('1', '71', '特码', '特A', '1');
INSERT INTO `web_xq_defrate` VALUES ('1511', '112', '全不中', '九不中', '11');
INSERT INTO `web_xq_defrate` VALUES ('1512', '112', '全不中', '九不中', '12');
INSERT INTO `web_xq_defrate` VALUES ('1513', '112', '全不中', '九不中', '13');
INSERT INTO `web_xq_defrate` VALUES ('1514', '112', '全不中', '九不中', '14');
INSERT INTO `web_xq_defrate` VALUES ('1515', '112', '全不中', '九不中', '15');
INSERT INTO `web_xq_defrate` VALUES ('1516', '112', '全不中', '九不中', '16');
INSERT INTO `web_xq_defrate` VALUES ('1517', '112', '全不中', '九不中', '17');
INSERT INTO `web_xq_defrate` VALUES ('1518', '112', '全不中', '九不中', '18');
INSERT INTO `web_xq_defrate` VALUES ('1519', '112', '全不中', '九不中', '19');
INSERT INTO `web_xq_defrate` VALUES ('1520', '112', '全不中', '九不中', '20');
INSERT INTO `web_xq_defrate` VALUES ('1521', '112', '全不中', '九不中', '21');
INSERT INTO `web_xq_defrate` VALUES ('1522', '112', '全不中', '九不中', '22');
INSERT INTO `web_xq_defrate` VALUES ('1523', '112', '全不中', '九不中', '23');
INSERT INTO `web_xq_defrate` VALUES ('1524', '112', '全不中', '九不中', '24');
INSERT INTO `web_xq_defrate` VALUES ('1525', '112', '全不中', '九不中', '25');
INSERT INTO `web_xq_defrate` VALUES ('1526', '112', '全不中', '九不中', '26');
INSERT INTO `web_xq_defrate` VALUES ('1527', '112', '全不中', '九不中', '27');
INSERT INTO `web_xq_defrate` VALUES ('1528', '112', '全不中', '九不中', '28');
INSERT INTO `web_xq_defrate` VALUES ('1529', '112', '全不中', '九不中', '29');
INSERT INTO `web_xq_defrate` VALUES ('1530', '112', '全不中', '九不中', '30');
INSERT INTO `web_xq_defrate` VALUES ('1531', '112', '全不中', '九不中', '31');
INSERT INTO `web_xq_defrate` VALUES ('1532', '112', '全不中', '九不中', '32');
INSERT INTO `web_xq_defrate` VALUES ('1533', '112', '全不中', '九不中', '33');
INSERT INTO `web_xq_defrate` VALUES ('1534', '112', '全不中', '九不中', '34');
INSERT INTO `web_xq_defrate` VALUES ('1535', '112', '全不中', '九不中', '35');
INSERT INTO `web_xq_defrate` VALUES ('1536', '112', '全不中', '九不中', '36');
INSERT INTO `web_xq_defrate` VALUES ('1537', '112', '全不中', '九不中', '37');
INSERT INTO `web_xq_defrate` VALUES ('1538', '112', '全不中', '九不中', '38');
INSERT INTO `web_xq_defrate` VALUES ('1539', '112', '全不中', '九不中', '39');
INSERT INTO `web_xq_defrate` VALUES ('1540', '112', '全不中', '九不中', '40');
INSERT INTO `web_xq_defrate` VALUES ('1541', '112', '全不中', '九不中', '41');
INSERT INTO `web_xq_defrate` VALUES ('1542', '112', '全不中', '九不中', '42');
INSERT INTO `web_xq_defrate` VALUES ('1543', '112', '全不中', '九不中', '43');
INSERT INTO `web_xq_defrate` VALUES ('1544', '112', '全不中', '九不中', '44');
INSERT INTO `web_xq_defrate` VALUES ('1545', '112', '全不中', '九不中', '45');
INSERT INTO `web_xq_defrate` VALUES ('1546', '112', '全不中', '九不中', '46');
INSERT INTO `web_xq_defrate` VALUES ('1547', '112', '全不中', '九不中', '47');
INSERT INTO `web_xq_defrate` VALUES ('1548', '112', '全不中', '九不中', '48');
INSERT INTO `web_xq_defrate` VALUES ('1549', '112', '全不中', '九不中', '49');
INSERT INTO `web_xq_defrate` VALUES ('1551', '113', '全不中', '十不中', '1');
INSERT INTO `web_xq_defrate` VALUES ('1552', '113', '全不中', '十不中', '2');
INSERT INTO `web_xq_defrate` VALUES ('1553', '113', '全不中', '十不中', '3');
INSERT INTO `web_xq_defrate` VALUES ('1554', '113', '全不中', '十不中', '4');
INSERT INTO `web_xq_defrate` VALUES ('1555', '113', '全不中', '十不中', '5');
INSERT INTO `web_xq_defrate` VALUES ('1556', '113', '全不中', '十不中', '6');
INSERT INTO `web_xq_defrate` VALUES ('1557', '113', '全不中', '十不中', '7');
INSERT INTO `web_xq_defrate` VALUES ('1558', '113', '全不中', '十不中', '8');
INSERT INTO `web_xq_defrate` VALUES ('1559', '113', '全不中', '十不中', '9');
INSERT INTO `web_xq_defrate` VALUES ('1560', '113', '全不中', '十不中', '10');
INSERT INTO `web_xq_defrate` VALUES ('1561', '113', '全不中', '十不中', '11');
INSERT INTO `web_xq_defrate` VALUES ('1562', '113', '全不中', '十不中', '12');
INSERT INTO `web_xq_defrate` VALUES ('1563', '113', '全不中', '十不中', '13');
INSERT INTO `web_xq_defrate` VALUES ('1564', '113', '全不中', '十不中', '14');
INSERT INTO `web_xq_defrate` VALUES ('1565', '113', '全不中', '十不中', '15');
INSERT INTO `web_xq_defrate` VALUES ('1566', '113', '全不中', '十不中', '16');
INSERT INTO `web_xq_defrate` VALUES ('1567', '113', '全不中', '十不中', '17');
INSERT INTO `web_xq_defrate` VALUES ('1568', '113', '全不中', '十不中', '18');
INSERT INTO `web_xq_defrate` VALUES ('1569', '113', '全不中', '十不中', '19');
INSERT INTO `web_xq_defrate` VALUES ('1570', '113', '全不中', '十不中', '20');
INSERT INTO `web_xq_defrate` VALUES ('1571', '113', '全不中', '十不中', '21');
INSERT INTO `web_xq_defrate` VALUES ('1572', '113', '全不中', '十不中', '22');
INSERT INTO `web_xq_defrate` VALUES ('1573', '113', '全不中', '十不中', '23');
INSERT INTO `web_xq_defrate` VALUES ('1574', '113', '全不中', '十不中', '24');
INSERT INTO `web_xq_defrate` VALUES ('1575', '113', '全不中', '十不中', '25');
INSERT INTO `web_xq_defrate` VALUES ('1576', '113', '全不中', '十不中', '26');
INSERT INTO `web_xq_defrate` VALUES ('1577', '113', '全不中', '十不中', '27');
INSERT INTO `web_xq_defrate` VALUES ('1578', '113', '全不中', '十不中', '28');
INSERT INTO `web_xq_defrate` VALUES ('1579', '113', '全不中', '十不中', '29');
INSERT INTO `web_xq_defrate` VALUES ('1580', '113', '全不中', '十不中', '30');
INSERT INTO `web_xq_defrate` VALUES ('1581', '113', '全不中', '十不中', '31');
INSERT INTO `web_xq_defrate` VALUES ('1582', '113', '全不中', '十不中', '32');
INSERT INTO `web_xq_defrate` VALUES ('1583', '113', '全不中', '十不中', '33');
INSERT INTO `web_xq_defrate` VALUES ('1584', '113', '全不中', '十不中', '34');
INSERT INTO `web_xq_defrate` VALUES ('1585', '113', '全不中', '十不中', '35');
INSERT INTO `web_xq_defrate` VALUES ('1586', '113', '全不中', '十不中', '36');
INSERT INTO `web_xq_defrate` VALUES ('1587', '113', '全不中', '十不中', '37');
INSERT INTO `web_xq_defrate` VALUES ('1588', '113', '全不中', '十不中', '38');
INSERT INTO `web_xq_defrate` VALUES ('1589', '113', '全不中', '十不中', '39');
INSERT INTO `web_xq_defrate` VALUES ('1590', '113', '全不中', '十不中', '40');
INSERT INTO `web_xq_defrate` VALUES ('1591', '113', '全不中', '十不中', '41');
INSERT INTO `web_xq_defrate` VALUES ('1592', '113', '全不中', '十不中', '42');
INSERT INTO `web_xq_defrate` VALUES ('1593', '113', '全不中', '十不中', '43');
INSERT INTO `web_xq_defrate` VALUES ('1594', '113', '全不中', '十不中', '44');
INSERT INTO `web_xq_defrate` VALUES ('1595', '113', '全不中', '十不中', '45');
INSERT INTO `web_xq_defrate` VALUES ('1596', '113', '全不中', '十不中', '46');
INSERT INTO `web_xq_defrate` VALUES ('1597', '113', '全不中', '十不中', '47');
INSERT INTO `web_xq_defrate` VALUES ('1598', '113', '全不中', '十不中', '48');
INSERT INTO `web_xq_defrate` VALUES ('1599', '113', '全不中', '十不中', '49');
INSERT INTO `web_xq_defrate` VALUES ('1473', '122', '生肖连', '五肖连中', '鼠');
INSERT INTO `web_xq_defrate` VALUES ('1474', '122', '生肖连', '五肖连中', '虎');
INSERT INTO `web_xq_defrate` VALUES ('1475', '122', '生肖连', '五肖连中', '龙');
INSERT INTO `web_xq_defrate` VALUES ('1476', '122', '生肖连', '五肖连中', '马');
INSERT INTO `web_xq_defrate` VALUES ('1477', '122', '生肖连', '五肖连中', '猴');
INSERT INTO `web_xq_defrate` VALUES ('1478', '122', '生肖连', '五肖连中', '狗');
INSERT INTO `web_xq_defrate` VALUES ('1479', '122', '生肖连', '五肖连中', '牛');
INSERT INTO `web_xq_defrate` VALUES ('1480', '122', '生肖连', '五肖连中', '兔');
INSERT INTO `web_xq_defrate` VALUES ('1481', '122', '生肖连', '五肖连中', '蛇');
INSERT INTO `web_xq_defrate` VALUES ('1482', '122', '生肖连', '五肖连中', '羊');
INSERT INTO `web_xq_defrate` VALUES ('1483', '122', '生肖连', '五肖连中', '鸡');
INSERT INTO `web_xq_defrate` VALUES ('1484', '122', '生肖连', '五肖连中', '猪');
INSERT INTO `web_xq_defrate` VALUES ('1602', '114', '全不中', '十一不中', '2');
INSERT INTO `web_xq_defrate` VALUES ('1603', '114', '全不中', '十一不中', '3');
INSERT INTO `web_xq_defrate` VALUES ('1601', '114', '全不中', '十一不中', '1');
INSERT INTO `web_xq_defrate` VALUES ('1604', '114', '全不中', '十一不中', '4');
INSERT INTO `web_xq_defrate` VALUES ('1605', '114', '全不中', '十一不中', '5');
INSERT INTO `web_xq_defrate` VALUES ('1606', '114', '全不中', '十一不中', '6');
INSERT INTO `web_xq_defrate` VALUES ('1607', '114', '全不中', '十一不中', '7');
INSERT INTO `web_xq_defrate` VALUES ('1608', '114', '全不中', '十一不中', '8');
INSERT INTO `web_xq_defrate` VALUES ('1609', '114', '全不中', '十一不中', '9');
INSERT INTO `web_xq_defrate` VALUES ('1610', '114', '全不中', '十一不中', '10');
INSERT INTO `web_xq_defrate` VALUES ('1611', '114', '全不中', '十一不中', '11');
INSERT INTO `web_xq_defrate` VALUES ('1612', '114', '全不中', '十一不中', '12');
INSERT INTO `web_xq_defrate` VALUES ('1613', '114', '全不中', '十一不中', '13');
INSERT INTO `web_xq_defrate` VALUES ('1614', '114', '全不中', '十一不中', '14');
INSERT INTO `web_xq_defrate` VALUES ('1615', '114', '全不中', '十一不中', '15');
INSERT INTO `web_xq_defrate` VALUES ('1616', '114', '全不中', '十一不中', '16');
INSERT INTO `web_xq_defrate` VALUES ('1617', '114', '全不中', '十一不中', '17');
INSERT INTO `web_xq_defrate` VALUES ('1618', '114', '全不中', '十一不中', '18');
INSERT INTO `web_xq_defrate` VALUES ('1619', '114', '全不中', '十一不中', '19');
INSERT INTO `web_xq_defrate` VALUES ('1620', '114', '全不中', '十一不中', '20');
INSERT INTO `web_xq_defrate` VALUES ('1621', '114', '全不中', '十一不中', '21');
INSERT INTO `web_xq_defrate` VALUES ('1622', '114', '全不中', '十一不中', '22');
INSERT INTO `web_xq_defrate` VALUES ('1623', '114', '全不中', '十一不中', '23');
INSERT INTO `web_xq_defrate` VALUES ('1624', '114', '全不中', '十一不中', '24');
INSERT INTO `web_xq_defrate` VALUES ('1625', '114', '全不中', '十一不中', '25');
INSERT INTO `web_xq_defrate` VALUES ('1626', '114', '全不中', '十一不中', '26');
INSERT INTO `web_xq_defrate` VALUES ('1627', '114', '全不中', '十一不中', '27');
INSERT INTO `web_xq_defrate` VALUES ('1628', '114', '全不中', '十一不中', '28');
INSERT INTO `web_xq_defrate` VALUES ('1629', '114', '全不中', '十一不中', '29');
INSERT INTO `web_xq_defrate` VALUES ('1630', '114', '全不中', '十一不中', '30');
INSERT INTO `web_xq_defrate` VALUES ('1631', '114', '全不中', '十一不中', '31');
INSERT INTO `web_xq_defrate` VALUES ('1632', '114', '全不中', '十一不中', '32');
INSERT INTO `web_xq_defrate` VALUES ('1633', '114', '全不中', '十一不中', '33');
INSERT INTO `web_xq_defrate` VALUES ('1634', '114', '全不中', '十一不中', '34');
INSERT INTO `web_xq_defrate` VALUES ('1635', '114', '全不中', '十一不中', '35');
INSERT INTO `web_xq_defrate` VALUES ('1636', '114', '全不中', '十一不中', '36');
INSERT INTO `web_xq_defrate` VALUES ('1637', '114', '全不中', '十一不中', '37');
INSERT INTO `web_xq_defrate` VALUES ('1638', '114', '全不中', '十一不中', '38');
INSERT INTO `web_xq_defrate` VALUES ('1639', '114', '全不中', '十一不中', '39');
INSERT INTO `web_xq_defrate` VALUES ('1640', '114', '全不中', '十一不中', '40');
INSERT INTO `web_xq_defrate` VALUES ('1641', '114', '全不中', '十一不中', '41');
INSERT INTO `web_xq_defrate` VALUES ('1642', '114', '全不中', '十一不中', '42');
INSERT INTO `web_xq_defrate` VALUES ('1643', '114', '全不中', '十一不中', '43');
INSERT INTO `web_xq_defrate` VALUES ('1644', '114', '全不中', '十一不中', '44');
INSERT INTO `web_xq_defrate` VALUES ('1645', '114', '全不中', '十一不中', '45');
INSERT INTO `web_xq_defrate` VALUES ('1646', '114', '全不中', '十一不中', '46');
INSERT INTO `web_xq_defrate` VALUES ('1647', '114', '全不中', '十一不中', '47');
INSERT INTO `web_xq_defrate` VALUES ('1648', '114', '全不中', '十一不中', '48');
INSERT INTO `web_xq_defrate` VALUES ('1649', '114', '全不中', '十一不中', '49');
INSERT INTO `web_xq_defrate` VALUES ('1651', '115', '全不中', '十二不中', '1');
INSERT INTO `web_xq_defrate` VALUES ('1652', '115', '全不中', '十二不中', '2');
INSERT INTO `web_xq_defrate` VALUES ('1653', '115', '全不中', '十二不中', '3');
INSERT INTO `web_xq_defrate` VALUES ('1654', '115', '全不中', '十二不中', '4');
INSERT INTO `web_xq_defrate` VALUES ('1655', '115', '全不中', '十二不中', '5');
INSERT INTO `web_xq_defrate` VALUES ('1656', '115', '全不中', '十二不中', '6');
INSERT INTO `web_xq_defrate` VALUES ('1657', '115', '全不中', '十二不中', '7');
INSERT INTO `web_xq_defrate` VALUES ('1658', '115', '全不中', '十二不中', '8');
INSERT INTO `web_xq_defrate` VALUES ('1659', '115', '全不中', '十二不中', '9');
INSERT INTO `web_xq_defrate` VALUES ('1660', '115', '全不中', '十二不中', '10');
INSERT INTO `web_xq_defrate` VALUES ('1661', '115', '全不中', '十二不中', '11');
INSERT INTO `web_xq_defrate` VALUES ('1662', '115', '全不中', '十二不中', '12');
INSERT INTO `web_xq_defrate` VALUES ('1663', '115', '全不中', '十二不中', '13');
INSERT INTO `web_xq_defrate` VALUES ('1664', '115', '全不中', '十二不中', '14');
INSERT INTO `web_xq_defrate` VALUES ('1665', '115', '全不中', '十二不中', '15');
INSERT INTO `web_xq_defrate` VALUES ('1666', '115', '全不中', '十二不中', '16');
INSERT INTO `web_xq_defrate` VALUES ('1667', '115', '全不中', '十二不中', '17');
INSERT INTO `web_xq_defrate` VALUES ('1668', '115', '全不中', '十二不中', '18');
INSERT INTO `web_xq_defrate` VALUES ('1669', '115', '全不中', '十二不中', '19');
INSERT INTO `web_xq_defrate` VALUES ('1670', '115', '全不中', '十二不中', '20');
INSERT INTO `web_xq_defrate` VALUES ('1671', '115', '全不中', '十二不中', '21');
INSERT INTO `web_xq_defrate` VALUES ('1672', '115', '全不中', '十二不中', '22');
INSERT INTO `web_xq_defrate` VALUES ('1673', '115', '全不中', '十二不中', '23');
INSERT INTO `web_xq_defrate` VALUES ('1674', '115', '全不中', '十二不中', '24');
INSERT INTO `web_xq_defrate` VALUES ('1675', '115', '全不中', '十二不中', '25');
INSERT INTO `web_xq_defrate` VALUES ('1676', '115', '全不中', '十二不中', '26');
INSERT INTO `web_xq_defrate` VALUES ('1677', '115', '全不中', '十二不中', '27');
INSERT INTO `web_xq_defrate` VALUES ('1678', '115', '全不中', '十二不中', '28');
INSERT INTO `web_xq_defrate` VALUES ('1679', '115', '全不中', '十二不中', '29');
INSERT INTO `web_xq_defrate` VALUES ('1680', '115', '全不中', '十二不中', '30');
INSERT INTO `web_xq_defrate` VALUES ('1681', '115', '全不中', '十二不中', '31');
INSERT INTO `web_xq_defrate` VALUES ('1682', '115', '全不中', '十二不中', '32');
INSERT INTO `web_xq_defrate` VALUES ('1683', '115', '全不中', '十二不中', '33');
INSERT INTO `web_xq_defrate` VALUES ('1684', '115', '全不中', '十二不中', '34');
INSERT INTO `web_xq_defrate` VALUES ('1685', '115', '全不中', '十二不中', '35');
INSERT INTO `web_xq_defrate` VALUES ('1686', '115', '全不中', '十二不中', '36');
INSERT INTO `web_xq_defrate` VALUES ('1687', '115', '全不中', '十二不中', '37');
INSERT INTO `web_xq_defrate` VALUES ('1688', '115', '全不中', '十二不中', '38');
INSERT INTO `web_xq_defrate` VALUES ('1689', '115', '全不中', '十二不中', '39');
INSERT INTO `web_xq_defrate` VALUES ('1690', '115', '全不中', '十二不中', '40');
INSERT INTO `web_xq_defrate` VALUES ('1691', '115', '全不中', '十二不中', '41');
INSERT INTO `web_xq_defrate` VALUES ('1692', '115', '全不中', '十二不中', '42');
INSERT INTO `web_xq_defrate` VALUES ('1693', '115', '全不中', '十二不中', '43');
INSERT INTO `web_xq_defrate` VALUES ('1694', '115', '全不中', '十二不中', '44');
INSERT INTO `web_xq_defrate` VALUES ('1695', '115', '全不中', '十二不中', '45');
INSERT INTO `web_xq_defrate` VALUES ('1696', '115', '全不中', '十二不中', '46');
INSERT INTO `web_xq_defrate` VALUES ('1697', '115', '全不中', '十二不中', '47');
INSERT INTO `web_xq_defrate` VALUES ('1698', '115', '全不中', '十二不中', '48');
INSERT INTO `web_xq_defrate` VALUES ('1699', '115', '全不中', '十二不中', '49');
INSERT INTO `web_xq_defrate` VALUES ('808', '116', '连码', '四中一', '四中一');
