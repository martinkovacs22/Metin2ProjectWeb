/*
 Navicat Premium Data Transfer

 Source Server         : MT2Monster
 Source Server Type    : MySQL
 Source Server Version : 100616 (10.6.16-MariaDB)
 Source Host           : 217.113.49.243:3306
 Source Schema         : account

 Target Server Type    : MySQL
 Target Server Version : 100616 (10.6.16-MariaDB)
 File Encoding         : 65001

 Date: 05/06/2024 18:09:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `real_name` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT '',
  `social_id` varchar(13) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `phone1` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `phone2` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `address` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `zipcode` varchar(7) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `question1` varchar(48) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `answer1` varchar(48) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `question2` varchar(48) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `answer2` varchar(48) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `is_testor` tinyint(1) NOT NULL DEFAULT 0,
  `status` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'OK',
  `securitycode` varchar(192) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT '',
  `newsletter` tinyint(1) NULL DEFAULT 0,
  `empire` tinyint NOT NULL DEFAULT 0,
  `name_checked` tinyint(1) NOT NULL DEFAULT 0,
  `availDt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mileage` int NOT NULL DEFAULT 0,
  `cash` int NOT NULL DEFAULT 0,
  `gold_expire` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `silver_expire` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `safebox_expire` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `autoloot_expire` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fish_mind_expire` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `marriage_fast_expire` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `money_drop_rate_expire` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ttl_cash` int NOT NULL DEFAULT 0,
  `ttl_mileage` int NOT NULL DEFAULT 0,
  `channel_company` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `last_play` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` tinyint NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `login`(`login`) USING BTREE,
  INDEX `social_id`(`social_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 101 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES (2, 'Kismester2', '*9C04E6C4DDEDB821995FA59EAA0766D6F02FEF17', '', '', '', NULL, NULL, NULL, '', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 0, 'OK', '', 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, '', '2024-05-08 15:39:12', 10);
INSERT INTO `account` VALUES (1, 'ExeKLP', '*9A6B00E22F7D401A1C8A229F247336486E5D3F67', '', '1234567', '', NULL, NULL, NULL, '', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 0, 'OK', '', 0, 0, 0, '0000-00-00 00:00:00', 0, 2363, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, '', '2024-06-01 19:12:04', 10);
INSERT INTO `account` VALUES (3, 'Kismester', '*9C04E6C4DDEDB821995FA59EAA0766D6F02FEF17', '', '1234567', '', NULL, NULL, NULL, '', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 0, 'OK', '', 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, '', '2024-05-08 13:59:34', 10);
INSERT INTO `account` VALUES (4, 'test', '*9C04E6C4DDEDB821995FA59EAA0766D6F02FEF17', '', '', '', NULL, NULL, NULL, '', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 0, 'OK', '', 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, '', '2024-05-08 15:22:46', 10);
INSERT INTO `account` VALUES (5, 'Kismester3', '*9C04E6C4DDEDB821995FA59EAA0766D6F02FEF17', '', '', '', NULL, NULL, NULL, '', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 0, 'OK', '', 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, '', '2024-05-08 15:41:08', 10);

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int NOT NULL DEFAULT 0,
  `admin` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'ExeKLP', '*9A6B00E22F7D401A1C8A229F247336486E5D3F67');
INSERT INTO `admin` VALUES (2, 'Kismester', '*9C04E6C4DDEDB821995FA59EAA0766D6F02FEF17');
INSERT INTO `admin` VALUES (4, 'test', '*9C04E6C4DDEDB821995FA59EAA0766D6F02FEF17');
INSERT INTO `admin` VALUES (3, 'test', '*9C04E6C4DDEDB821995FA59EAA0766D6F02FEF17');

-- ----------------------------
-- Table structure for ban_log
-- ----------------------------
DROP TABLE IF EXISTS `ban_log`;
CREATE TABLE `ban_log`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `admin_id` int UNSIGNED NOT NULL,
  `account_id` int UNSIGNED NOT NULL,
  `time` datetime NOT NULL,
  `reason` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `typ` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ban_log
-- ----------------------------

-- ----------------------------
-- Table structure for block_exception
-- ----------------------------
DROP TABLE IF EXISTS `block_exception`;
CREATE TABLE `block_exception`  (
  `login` int NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Records of block_exception
-- ----------------------------
INSERT INTO `block_exception` VALUES (1);

-- ----------------------------
-- Table structure for gametime
-- ----------------------------
DROP TABLE IF EXISTS `gametime`;
CREATE TABLE `gametime`  (
  `UserID` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `paymenttype` tinyint NOT NULL DEFAULT 1,
  `LimitTime` int NULL DEFAULT 0,
  `LimitDt` datetime NULL DEFAULT '0000-00-00 00:00:00',
  `Scores` int NULL DEFAULT 0,
  PRIMARY KEY (`UserID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gametime
-- ----------------------------

-- ----------------------------
-- Table structure for gametimeip
-- ----------------------------
DROP TABLE IF EXISTS `gametimeip`;
CREATE TABLE `gametimeip`  (
  `ipid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `ip` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '000.000.000',
  `startIP` int NOT NULL DEFAULT 0,
  `endIP` int NOT NULL DEFAULT 255,
  `paymenttype` tinyint NOT NULL DEFAULT 1,
  `LimitTime` int NOT NULL DEFAULT 0,
  `LimitDt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `readme` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ipid`) USING BTREE,
  UNIQUE INDEX `ip_uniq`(`ip`, `startIP`, `endIP`) USING BTREE,
  INDEX `ip_idx`(`ip`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gametimeip
-- ----------------------------

-- ----------------------------
-- Table structure for gametimelog
-- ----------------------------
DROP TABLE IF EXISTS `gametimelog`;
CREATE TABLE `gametimelog`  (
  `login` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `type` enum('IP_FREE','FREE','IP_TIME','IP_DAY','TIME','DAY') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `logon_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `logout_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `use_time` int NULL DEFAULT NULL,
  `ip` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '000.000.000.000',
  `server` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  INDEX `login_key`(`login`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gametimelog
-- ----------------------------

-- ----------------------------
-- Table structure for iptocountry
-- ----------------------------
DROP TABLE IF EXISTS `iptocountry`;
CREATE TABLE `iptocountry`  (
  `IP_FROM` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `IP_TO` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `COUNTRY_NAME` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of iptocountry
-- ----------------------------
INSERT INTO `iptocountry` VALUES ('127.0.0.1', '127.0.0.1', 'localhost');

-- ----------------------------
-- Table structure for monarch
-- ----------------------------
DROP TABLE IF EXISTS `monarch`;
CREATE TABLE `monarch`  (
  `empire` int UNSIGNED NOT NULL DEFAULT 0,
  `pid` int UNSIGNED NULL DEFAULT 0,
  `name` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `windate` datetime NULL DEFAULT '0000-00-00 00:00:00',
  `money` bigint UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`empire`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of monarch
-- ----------------------------

-- ----------------------------
-- Table structure for send_notice
-- ----------------------------
DROP TABLE IF EXISTS `send_notice`;
CREATE TABLE `send_notice`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` tinyint NOT NULL DEFAULT 0,
  `server` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `show_check` tinyint NOT NULL DEFAULT 0,
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of send_notice
-- ----------------------------

-- ----------------------------
-- Table structure for server_settings
-- ----------------------------
DROP TABLE IF EXISTS `server_settings`;
CREATE TABLE `server_settings`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `variable` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `beschreibung` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `typ` enum('CHA','BOO','INT','DEC') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `value` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `variable`(`variable`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of server_settings
-- ----------------------------

-- ----------------------------
-- Table structure for string
-- ----------------------------
DROP TABLE IF EXISTS `string`;
CREATE TABLE `string`  (
  `name` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `text` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of string
-- ----------------------------

-- ----------------------------
-- Table structure for tele_block
-- ----------------------------
DROP TABLE IF EXISTS `tele_block`;
CREATE TABLE `tele_block`  (
  `account_id` int NOT NULL DEFAULT 0,
  `lastlogin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tele_block` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`account_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tele_block
-- ----------------------------

-- ----------------------------
-- Procedure structure for login
-- ----------------------------
DROP PROCEDURE IF EXISTS `login`;
delimiter ;;
CREATE PROCEDURE `login`(IN `login` varchar(256),IN `password` varchar(256))
BEGIN
	
	SELECT account.account.* FROM account.account LIMIT 1;

END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
