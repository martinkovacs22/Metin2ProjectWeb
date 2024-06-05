/*
 Navicat Premium Data Transfer

 Source Server         : MT2Monster
 Source Server Type    : MySQL
 Source Server Version : 100616 (10.6.16-MariaDB)
 Source Host           : 217.113.49.243:3306
 Source Schema         : common

 Target Server Type    : MySQL
 Target Server Version : 100616 (10.6.16-MariaDB)
 File Encoding         : 65001

 Date: 05/06/2024 18:10:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gmhost
-- ----------------------------
DROP TABLE IF EXISTS `gmhost`;
CREATE TABLE `gmhost`  (
  `mIP` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`mIP`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gmhost
-- ----------------------------
INSERT INTO `gmhost` VALUES ('ALL');

-- ----------------------------
-- Table structure for gmlist
-- ----------------------------
DROP TABLE IF EXISTS `gmlist`;
CREATE TABLE `gmlist`  (
  `mID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `mAccount` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `mName` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `mContactIP` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `mServerIP` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'ALL',
  `mAuthority` enum('IMPLEMENTOR','HIGH_WIZARD','GOD','LOW_WIZARD','PLAYER') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT 'PLAYER',
  PRIMARY KEY (`mID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gmlist
-- ----------------------------
INSERT INTO `gmlist` VALUES (1, 'ExeKLP', '{AD}Exe', '', 'ALL', 'IMPLEMENTOR');
INSERT INTO `gmlist` VALUES (2, 'Kismester', '[SA]Kismester', '', 'ALL', 'IMPLEMENTOR');
INSERT INTO `gmlist` VALUES (3, 'test', '[SA]Genios', '', 'ALL', 'IMPLEMENTOR');
INSERT INTO `gmlist` VALUES (4, 'Kismester2', 'Kismester2', '', 'ALL', 'IMPLEMENTOR');
INSERT INTO `gmlist` VALUES (5, 'Kismester3', 'kismester3', '', 'ALL', 'IMPLEMENTOR');
INSERT INTO `gmlist` VALUES (6, 'test', 'csecse', '', 'ALL', 'IMPLEMENTOR');
INSERT INTO `gmlist` VALUES (7, 'kismester2', 'armored', '', 'ALL', 'IMPLEMENTOR');
INSERT INTO `gmlist` VALUES (8, 'kismester3', 'kardjozsi', '', 'ALL', 'IMPLEMENTOR');
INSERT INTO `gmlist` VALUES (9, 'kismester3', '2kezROZI', '', 'ALL', 'IMPLEMENTOR');
INSERT INTO `gmlist` VALUES (10, 'test', 'buffigenyo', '', 'ALL', 'IMPLEMENTOR');
INSERT INTO `gmlist` VALUES (11, 'kismester2', 'minden1', '', 'ALL', 'IMPLEMENTOR');
INSERT INTO `gmlist` VALUES (12, 'kismester2', 'minden2', '', 'ALL', 'IMPLEMENTOR');
INSERT INTO `gmlist` VALUES (13, 'kismester3', 'minden3', '', 'ALL', 'IMPLEMENTOR');
INSERT INTO `gmlist` VALUES (14, 'kismester3', 'minden4', '', 'ALL', 'IMPLEMENTOR');

-- ----------------------------
-- Table structure for locale
-- ----------------------------
DROP TABLE IF EXISTS `locale`;
CREATE TABLE `locale`  (
  `mKey` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `mValue` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`mKey`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of locale
-- ----------------------------
INSERT INTO `locale` VALUES ('SKILL_POWER_BY_LEVEL_TYPE0', '0 5 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 50 52 54 56 58 60 63 66 69 72 82 85 88 91 94 98 102 106 110 115 125 125 125 125 125');
INSERT INTO `locale` VALUES ('SKILL_POWER_BY_LEVEL_TYPE1', '0 5 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 50 52 54 56 58 60 63 66 69 72 82 85 88 91 94 98 102 106 110 115 125 125 125 125 125');
INSERT INTO `locale` VALUES ('SKILL_POWER_BY_LEVEL_TYPE2', '0 5 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 50 52 54 56 58 60 63 66 69 72 82 85 88 91 94 98 102 106 110 115 125 125 125 125 125');
INSERT INTO `locale` VALUES ('SKILL_POWER_BY_LEVEL_TYPE3', '0 5 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 50 52 54 56 58 60 63 66 69 72 82 85 88 91 94 98 102 106 110 115 125 125 125 125 125');
INSERT INTO `locale` VALUES ('SKILL_POWER_BY_LEVEL_TYPE4', '0 5 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 50 52 54 56 58 60 63 66 69 72 82 85 88 91 94 98 102 106 110 115 125 125 125 125 125');
INSERT INTO `locale` VALUES ('SKILL_POWER_BY_LEVEL_TYPE5', '0 5 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 50 52 54 56 58 60 63 66 69 72 82 85 88 91 94 98 102 106 110 115 125 125 125 125 125');
INSERT INTO `locale` VALUES ('SKILL_POWER_BY_LEVEL_TYPE6', '0 5 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 50 52 54 56 58 60 63 66 69 72 82 85 88 91 94 98 102 106 110 115 125 125 125 125 125');
INSERT INTO `locale` VALUES ('SKILL_POWER_BY_LEVEL_TYPE7', '0 5 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 50 52 54 56 58 60 63 66 69 72 82 85 88 91 94 98 102 106 110 115 125 125 125 125 125');
INSERT INTO `locale` VALUES ('LOCALE', 'europe');
INSERT INTO `locale` VALUES ('DB_NAME_COLUMN', 'locale_name');
INSERT INTO `locale` VALUES ('SKILL_DAMAGE_BY_LEVEL_UNDER_90', '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0');
INSERT INTO `locale` VALUES ('SKILL_DAMAGE_BY_LEVEL_UNDER_45', '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0');
INSERT INTO `locale` VALUES ('SKILL_POWER_BY_LEVEL', '0 5 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 50 52 54 56 58 60 63 66 69 72 82 85 88 91 94 98 102 106 110 115 125 125 125 125 125');

-- ----------------------------
-- Table structure for locale_bug
-- ----------------------------
DROP TABLE IF EXISTS `locale_bug`;
CREATE TABLE `locale_bug`  (
  `mKey` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `mValue` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`mKey`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of locale_bug
-- ----------------------------

-- ----------------------------
-- Table structure for spam_db
-- ----------------------------
DROP TABLE IF EXISTS `spam_db`;
CREATE TABLE `spam_db`  (
  `word` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `score` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `type` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of spam_db
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
