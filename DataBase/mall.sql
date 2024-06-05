/*
 Navicat Premium Data Transfer

 Source Server         : MT2Monster
 Source Server Type    : MySQL
 Source Server Version : 100616 (10.6.16-MariaDB)
 Source Host           : 217.113.49.243:3306
 Source Schema         : mall

 Target Server Type    : MySQL
 Target Server Version : 100616 (10.6.16-MariaDB)
 File Encoding         : 65001

 Date: 05/06/2024 18:11:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for currency
-- ----------------------------
DROP TABLE IF EXISTS `currency`;
CREATE TABLE `currency`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'CURRENCY',
  `account_column_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `weighting` int NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 34 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of currency
-- ----------------------------
INSERT INTO `currency` VALUES (32, 'CURRENCY', 'vote_coins', 0, 1);
INSERT INTO `currency` VALUES (33, 'I-Coins', 'cash', 0, 1);

-- ----------------------------
-- Table structure for last_edit_mall
-- ----------------------------
DROP TABLE IF EXISTS `last_edit_mall`;
CREATE TABLE `last_edit_mall`  (
  `mall_id` int NULL DEFAULT NULL,
  `last_edit` datetime NULL DEFAULT '0000-00-00 00:00:00',
  INDEX `fk_lemc_mall_id`(`mall_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of last_edit_mall
-- ----------------------------
INSERT INTO `last_edit_mall` VALUES (1, '2021-06-11 16:41:09');
INSERT INTO `last_edit_mall` VALUES (2, '2021-06-11 16:40:12');
INSERT INTO `last_edit_mall` VALUES (3, '2021-06-11 16:40:12');

-- ----------------------------
-- Table structure for last_edit_mall_overview
-- ----------------------------
DROP TABLE IF EXISTS `last_edit_mall_overview`;
CREATE TABLE `last_edit_mall_overview`  (
  `last_edit` datetime NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of last_edit_mall_overview
-- ----------------------------
INSERT INTO `last_edit_mall_overview` VALUES ('2019-06-05 12:54:52');

-- ----------------------------
-- Table structure for mall
-- ----------------------------
DROP TABLE IF EXISTS `mall`;
CREATE TABLE `mall`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'MALL',
  `currency_id` int NOT NULL,
  `buy_coins_url` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `weighting` int NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_currency_id`(`currency_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mall
-- ----------------------------
INSERT INTO `mall` VALUES (1, 'Itemshop', 33, 'www.google.de', 2, 1);
INSERT INTO `mall` VALUES (2, 'Voteshop', 32, '', 4, 1);
INSERT INTO `mall` VALUES (3, 'Achievementshop', 32, '', 0, 1);

-- ----------------------------
-- Table structure for mall_banner
-- ----------------------------
DROP TABLE IF EXISTS `mall_banner`;
CREATE TABLE `mall_banner`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `path` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `weighting` int NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 26 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mall_banner
-- ----------------------------
INSERT INTO `mall_banner` VALUES (1, 'banner_0.jpg', 22, 1);
INSERT INTO `mall_banner` VALUES (3, 'banner_1.jpg', 0, 1);
INSERT INTO `mall_banner` VALUES (16, 'banner_0.jpg', 0, 1);
INSERT INTO `mall_banner` VALUES (17, 'banner_0.jpg', 0, 1);
INSERT INTO `mall_banner` VALUES (18, 'banner_0.jpg', 0, 1);
INSERT INTO `mall_banner` VALUES (19, 'banner_1.jpg', 0, 1);
INSERT INTO `mall_banner` VALUES (20, 'banner_1.jpg', 0, 1);
INSERT INTO `mall_banner` VALUES (21, 'banner_1.jpg', 0, 1);
INSERT INTO `mall_banner` VALUES (22, 'banner_1.jpg', 0, 1);
INSERT INTO `mall_banner` VALUES (23, 'banner_1.jpg', 0, 1);
INSERT INTO `mall_banner` VALUES (24, 'banner_1.jpg', 0, 1);
INSERT INTO `mall_banner` VALUES (25, 'banner_1.jpg', 0, 1);

-- ----------------------------
-- Table structure for mall_category
-- ----------------------------
DROP TABLE IF EXISTS `mall_category`;
CREATE TABLE `mall_category`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'CATEGORY',
  `color` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `icon_vnum` int NULL DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 19 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mall_category
-- ----------------------------
INSERT INTO `mall_category` VALUES (1, 'Armor', 'F8BF24', NULL, 1);
INSERT INTO `mall_category` VALUES (2, 'Rings', 'F8BF24', NULL, 1);
INSERT INTO `mall_category` VALUES (5, 'Mounts', 'F8BF24', NULL, 1);
INSERT INTO `mall_category` VALUES (6, 'Pets', 'F8BF24', NULL, 1);
INSERT INTO `mall_category` VALUES (7, 'Miscellaneous', 'F8BF24', NULL, 1);
INSERT INTO `mall_category` VALUES (8, 'Potions', 'F8BF24', NULL, 1);
INSERT INTO `mall_category` VALUES (9, 'Special', 'F8BF24', NULL, 1);
INSERT INTO `mall_category` VALUES (10, 'Cups', 'F8BF24', NULL, 1);
INSERT INTO `mall_category` VALUES (11, 'Weapons', 'F8BF24', NULL, 1);
INSERT INTO `mall_category` VALUES (12, 'Cool Stuff', 'F8BF24', NULL, 1);
INSERT INTO `mall_category` VALUES (13, 'Even Cooler Stuff', 'F8BF24', NULL, 1);
INSERT INTO `mall_category` VALUES (14, 'Epic', 'F8BF24', NULL, 1);
INSERT INTO `mall_category` VALUES (15, 'Madness', 'F8BF24', NULL, 1);
INSERT INTO `mall_category` VALUES (16, 'Extra', 'F8BF24', NULL, 1);
INSERT INTO `mall_category` VALUES (17, 'Premium', 'F8BF24', NULL, 1);

-- ----------------------------
-- Table structure for mall_category_connection
-- ----------------------------
DROP TABLE IF EXISTS `mall_category_connection`;
CREATE TABLE `mall_category_connection`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `mall_id` int NOT NULL,
  `category_id` int NOT NULL,
  `weighting` int NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `u_mall_id`(`mall_id`, `category_id`) USING BTREE,
  INDEX `i_mall_id`(`mall_id`) USING BTREE,
  INDEX `i_category_id`(`category_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 41 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of mall_category_connection
-- ----------------------------
INSERT INTO `mall_category_connection` VALUES (17, 1, 1, 11, 1);
INSERT INTO `mall_category_connection` VALUES (18, 1, 2, 0, 1);
INSERT INTO `mall_category_connection` VALUES (21, 1, 5, 0, 1);
INSERT INTO `mall_category_connection` VALUES (22, 1, 6, 0, 1);
INSERT INTO `mall_category_connection` VALUES (23, 1, 7, 0, 1);
INSERT INTO `mall_category_connection` VALUES (24, 1, 8, 0, 1);
INSERT INTO `mall_category_connection` VALUES (25, 1, 10, 0, 1);
INSERT INTO `mall_category_connection` VALUES (26, 2, 10, 0, 1);
INSERT INTO `mall_category_connection` VALUES (27, 1, 11, 12, 1);
INSERT INTO `mall_category_connection` VALUES (30, 1, 12, 0, 1);
INSERT INTO `mall_category_connection` VALUES (32, 1, 13, 0, 1);
INSERT INTO `mall_category_connection` VALUES (33, 1, 14, 0, 1);
INSERT INTO `mall_category_connection` VALUES (34, 1, 15, 0, 1);
INSERT INTO `mall_category_connection` VALUES (35, 1, 16, 0, 1);
INSERT INTO `mall_category_connection` VALUES (36, 1, 17, 0, 1);
INSERT INTO `mall_category_connection` VALUES (38, 3, 10, 0, 1);
INSERT INTO `mall_category_connection` VALUES (39, 3, 8, 0, 1);
INSERT INTO `mall_category_connection` VALUES (40, 3, 1, 0, 1);

-- ----------------------------
-- Table structure for mall_item
-- ----------------------------
DROP TABLE IF EXISTS `mall_item`;
CREATE TABLE `mall_item`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `vnum` int NOT NULL,
  `socket0` int NOT NULL DEFAULT 0,
  `socket1` int NOT NULL DEFAULT 0,
  `socket2` int NOT NULL DEFAULT 0,
  `socket3` int NOT NULL DEFAULT 0,
  `socket4` int NOT NULL DEFAULT 0,
  `socket5` int NOT NULL DEFAULT 0,
  `attrtype0` tinyint NOT NULL DEFAULT 0,
  `attrvalue0` smallint NOT NULL DEFAULT 0,
  `attrtype1` tinyint NOT NULL DEFAULT 0,
  `attrvalue1` smallint NOT NULL DEFAULT 0,
  `attrtype2` tinyint NOT NULL DEFAULT 0,
  `attrvalue2` smallint NOT NULL DEFAULT 0,
  `attrtype3` tinyint NOT NULL DEFAULT 0,
  `attrvalue3` smallint NOT NULL DEFAULT 0,
  `attrtype4` tinyint NOT NULL DEFAULT 0,
  `attrvalue4` smallint NOT NULL DEFAULT 0,
  `attrtype5` tinyint NOT NULL DEFAULT 0,
  `attrvalue5` smallint NOT NULL DEFAULT 0,
  `attrtype6` tinyint NOT NULL DEFAULT 0,
  `attrvalue6` smallint NOT NULL DEFAULT 0,
  `price` int NOT NULL,
  `discount_percent` tinyint NOT NULL DEFAULT 0,
  `start_date` datetime NULL DEFAULT '1970-01-01 08:00:00',
  `end_date` datetime NULL DEFAULT '1970-01-01 08:00:00',
  `buyable_after_run_out` tinyint(1) NOT NULL DEFAULT 0,
  `mall_category_connection_id` int NOT NULL,
  `weighting` int NOT NULL DEFAULT 0,
  `recommended` int NOT NULL DEFAULT 0,
  `new` int NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mall_cat_con_id`(`mall_category_connection_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 63 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of mall_item
-- ----------------------------
INSERT INTO `mall_item` VALUES (1, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 500, 0, '1970-01-01 08:00:00', '1970-01-01 08:00:00', 0, 17, 12, 0, 0, 1);
INSERT INTO `mall_item` VALUES (4, 189, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 310, 0, '1970-01-01 08:00:00', '1970-01-01 08:00:00', 0, 17, 0, 0, 0, 1);
INSERT INTO `mall_item` VALUES (5, 469, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 699, 0, '1970-01-01 08:00:00', '1970-01-01 08:00:00', 0, 17, 0, 0, 1, 1);
INSERT INTO `mall_item` VALUES (6, 7379, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1050, 0, '1970-01-01 08:00:00', '1970-01-01 08:00:00', 0, 17, 22, 0, 1, 1);
INSERT INTO `mall_item` VALUES (8, 2377, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 545, 0, '1970-01-01 08:00:00', '1970-01-01 08:00:00', 0, 17, 0, 0, 0, 1);
INSERT INTO `mall_item` VALUES (9, 12019, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 499, 0, '1970-01-01 08:00:00', '1970-01-01 08:00:00', 0, 17, 0, 0, 0, 1);
INSERT INTO `mall_item` VALUES (10, 12029, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 499, 0, '1970-01-01 08:00:00', '1970-01-01 08:00:00', 0, 17, 0, 0, 0, 1);
INSERT INTO `mall_item` VALUES (11, 12039, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 499, 0, '1970-01-01 08:00:00', '1970-01-01 08:00:00', 0, 17, 0, 0, 0, 1);
INSERT INTO `mall_item` VALUES (12, 12049, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 499, 0, '1970-01-01 08:00:00', '1970-01-01 08:00:00', 0, 17, 0, 0, 0, 1);
INSERT INTO `mall_item` VALUES (13, 71124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 739, 0, '1970-01-01 08:00:00', '1970-01-01 08:00:00', 0, 17, 0, 0, 0, 1);
INSERT INTO `mall_item` VALUES (14, 71125, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 739, 0, '1970-01-01 08:00:00', '1970-01-01 08:00:00', 0, 17, 0, 0, 0, 1);
INSERT INTO `mall_item` VALUES (15, 71126, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 739, 0, '1970-01-01 08:00:00', '1970-01-01 08:00:00', 0, 17, 0, 0, 0, 1);
INSERT INTO `mall_item` VALUES (16, 71127, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 739, 0, '1970-01-01 08:00:00', '1970-01-01 08:00:00', 0, 17, 0, 0, 0, 1);
INSERT INTO `mall_item` VALUES (17, 71127, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 739, 0, '1970-01-01 08:00:00', '1970-01-01 08:00:00', 0, 18, 0, 0, 0, 1);
INSERT INTO `mall_item` VALUES (18, 53001, 4444, 999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1349, 0, '1970-01-01 08:00:00', '1970-01-01 08:00:00', 0, 27, 0, 0, 0, 1);
INSERT INTO `mall_item` VALUES (19, 53002, 44444, 999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1349, 0, '1970-01-01 08:00:00', '1970-01-01 08:00:00', 0, 27, 0, 1, 0, 1);
INSERT INTO `mall_item` VALUES (20, 53003, 444444, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1349, 0, '1970-01-01 08:00:00', '1970-01-01 08:00:00', 0, 27, 0, 0, 0, 1);
INSERT INTO `mall_item` VALUES (24, 53006, 444444, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1349, 0, '1970-01-01 08:00:00', '1970-01-01 08:00:00', 0, 27, 0, 0, 0, 1);
INSERT INTO `mall_item` VALUES (25, 71135, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 119, 0, '1970-01-01 08:00:00', '1970-01-01 08:00:00', 0, 27, 0, 0, 0, 1);
INSERT INTO `mall_item` VALUES (26, 71136, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 119, 0, '1970-01-01 08:00:00', '1970-01-01 08:00:00', 0, 23, 0, 0, 0, 1);
INSERT INTO `mall_item` VALUES (27, 71148, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 119, 0, '1970-01-01 08:00:00', '1970-01-01 08:00:00', 0, 23, 0, 0, 0, 1);
INSERT INTO `mall_item` VALUES (28, 71149, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 119, 0, '1970-01-01 08:00:00', '1970-01-01 08:00:00', 0, 23, 0, 0, 0, 1);
INSERT INTO `mall_item` VALUES (29, 71149, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 119, 0, '1970-01-01 08:00:00', '1970-01-01 08:00:00', 0, 23, 0, 0, 0, 1);
INSERT INTO `mall_item` VALUES (33, 41293, 0, 0, 0, 0, 0, 0, 63, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9999, 0, '1970-01-01 08:00:00', '1970-01-01 08:00:00', 0, 23, 0, 0, 0, 1);
INSERT INTO `mall_item` VALUES (34, 41294, 0, 0, 0, 0, 0, 0, 63, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9999, 0, '1970-01-01 08:00:00', '1970-01-01 08:00:00', 0, 23, 0, 0, 0, 1);
INSERT INTO `mall_item` VALUES (35, 45119, 0, 0, 0, 0, 0, 0, 1, 1250, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9999, 0, '1970-01-01 08:00:00', '1970-01-01 08:00:00', 0, 17, 0, 0, 0, 1);
INSERT INTO `mall_item` VALUES (36, 45120, 0, 0, 0, 0, 0, 0, 1, 1250, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9999, 12, '1970-01-01 08:00:00', '1970-01-01 08:00:00', 0, 26, 0, 0, 0, 1);
INSERT INTO `mall_item` VALUES (37, 50512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50, 0, '1970-01-01 08:00:00', '1970-01-01 08:00:00', 0, 17, 0, 0, 0, 1);
INSERT INTO `mall_item` VALUES (38, 50513, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', 0, 17, 0, 0, 0, 1);
INSERT INTO `mall_item` VALUES (39, 25041, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50, 21, '1970-01-01 08:00:00', '1970-01-01 08:00:00', 0, 17, 0, 0, 0, 1);
INSERT INTO `mall_item` VALUES (40, 27992, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50, 90, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 17, 0, 0, 0, 1);
INSERT INTO `mall_item` VALUES (41, 28037, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 269, 50, '1970-01-01 08:00:00', '2019-05-17 18:34:18', 0, 17, 0, 0, 0, 1);
INSERT INTO `mall_item` VALUES (43, 28039, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 269, 40, '1970-01-01 08:00:00', '2019-05-17 18:34:21', 0, 17, 0, 0, 0, 1);
INSERT INTO `mall_item` VALUES (44, 28040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 269, 0, '1970-01-01 08:00:00', '2019-05-17 18:34:17', 0, 17, 0, 1, 1, 1);
INSERT INTO `mall_item` VALUES (46, 27001, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 269, 1, '1970-01-01 08:00:00', '2019-05-15 19:00:00', 0, 17, 0, 0, 1, 1);
INSERT INTO `mall_item` VALUES (47, 30006, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0, '1970-01-01 08:00:00', '1970-01-01 08:00:00', 0, 17, 0, 0, 1, 1);
INSERT INTO `mall_item` VALUES (48, 30047, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0, '1970-01-01 08:00:00', '1970-01-01 08:00:00', 0, 17, 0, 0, 1, 1);
INSERT INTO `mall_item` VALUES (49, 30166, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0, '1970-01-01 08:00:00', '1970-01-01 08:00:00', 0, 17, 0, 0, 2, 1);
INSERT INTO `mall_item` VALUES (50, 30167, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0, '1970-01-01 08:00:00', '1970-01-01 08:00:00', 0, 17, 0, 0, 4, 1);
INSERT INTO `mall_item` VALUES (51, 30168, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0, '1970-01-01 08:00:00', '1970-01-01 08:00:00', 0, 17, 0, 0, 3, 1);
INSERT INTO `mall_item` VALUES (52, 30165, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0, '1970-01-01 08:00:00', '1970-01-01 08:00:00', 0, 17, 0, 0, 1, 1);

-- ----------------------------
-- Table structure for mall_item_purchase_log
-- ----------------------------
DROP TABLE IF EXISTS `mall_item_purchase_log`;
CREATE TABLE `mall_item_purchase_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `mall_item_id` int NOT NULL,
  `vnum` int NOT NULL,
  `socket0` int NOT NULL DEFAULT 0,
  `socket1` int NOT NULL DEFAULT 0,
  `socket2` int NOT NULL DEFAULT 0,
  `socket3` int NOT NULL DEFAULT 0,
  `socket4` int NOT NULL DEFAULT 0,
  `socket5` int NOT NULL DEFAULT 0,
  `attrtype0` tinyint NOT NULL DEFAULT 0,
  `attrvalue0` smallint NOT NULL DEFAULT 0,
  `attrtype1` tinyint NOT NULL DEFAULT 0,
  `attrvalue1` smallint NOT NULL DEFAULT 0,
  `attrtype2` tinyint NOT NULL DEFAULT 0,
  `attrvalue2` smallint NOT NULL DEFAULT 0,
  `attrtype3` tinyint NOT NULL DEFAULT 0,
  `attrvalue3` smallint NOT NULL DEFAULT 0,
  `attrtype4` tinyint NOT NULL DEFAULT 0,
  `attrvalue4` smallint NOT NULL DEFAULT 0,
  `attrtype5` tinyint NOT NULL DEFAULT 0,
  `attrvalue5` smallint NOT NULL DEFAULT 0,
  `attrtype6` tinyint NOT NULL DEFAULT 0,
  `attrvalue6` smallint NOT NULL DEFAULT 0,
  `mall_id` int NOT NULL,
  `category_id` int NOT NULL,
  `price` int NOT NULL,
  `real_price` int NOT NULL,
  `discount_percent` tinyint NOT NULL,
  `start_date` datetime NULL DEFAULT NULL,
  `end_date` datetime NULL DEFAULT NULL,
  `count` int NOT NULL,
  `account_currency_old_value` int NOT NULL,
  `account_currency_new_value` int NOT NULL,
  `account_id` int NOT NULL,
  `purchase_date` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_mall_item_purchase_log`(`mall_item_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of mall_item_purchase_log
-- ----------------------------
INSERT INTO `mall_item_purchase_log` VALUES (2, 50, 30167, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 15, 15, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1, '2019-06-05 20:20:03');
INSERT INTO `mall_item_purchase_log` VALUES (3, 50, 30167, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 15, 15, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1, '2019-06-05 20:21:21');
INSERT INTO `mall_item_purchase_log` VALUES (4, 50, 30167, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 15, 180, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 12, 0, 0, 1, '2019-06-05 20:21:37');
INSERT INTO `mall_item_purchase_log` VALUES (5, 50, 30167, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 15, 15, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 9914, 9899, 1, '2019-06-05 20:26:02');

-- ----------------------------
-- Triggers structure for table mall
-- ----------------------------
DROP TRIGGER IF EXISTS `insert_trigger_mall`;
delimiter ;;
CREATE TRIGGER `insert_trigger_mall` AFTER INSERT ON `mall` FOR EACH ROW BEGIN

    UPDATE last_edit_mall_overview 
      SET last_edit  = CURRENT_TIMESTAMP;
     INSERT INTO last_edit_mall(mall_id, last_edit) VALUES(NEW.id, CURRENT_TIMESTAMP);
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table mall
-- ----------------------------
DROP TRIGGER IF EXISTS `update_trigger_mall`;
delimiter ;;
CREATE TRIGGER `update_trigger_mall` AFTER UPDATE ON `mall` FOR EACH ROW BEGIN
      UPDATE last_edit_mall_overview 
      SET last_edit  = CURRENT_TIMESTAMP;
UPDATE last_edit_mall
      SET last_edit  = CURRENT_TIMESTAMP WHERE mall_id = NEW.id;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table mall
-- ----------------------------
DROP TRIGGER IF EXISTS `delete_trigger_mall`;
delimiter ;;
CREATE TRIGGER `delete_trigger_mall` AFTER DELETE ON `mall` FOR EACH ROW BEGIN

    UPDATE last_edit_mall_overview 
      SET last_edit  = CURRENT_TIMESTAMP;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table mall_banner
-- ----------------------------
DROP TRIGGER IF EXISTS `insert_trigger_banner`;
delimiter ;;
CREATE TRIGGER `insert_trigger_banner` AFTER INSERT ON `mall_banner` FOR EACH ROW BEGIN

    UPDATE last_edit_mall_overview 
      SET last_edit  = CURRENT_TIMESTAMP;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table mall_banner
-- ----------------------------
DROP TRIGGER IF EXISTS `update_trigger_banner`;
delimiter ;;
CREATE TRIGGER `update_trigger_banner` AFTER UPDATE ON `mall_banner` FOR EACH ROW BEGIN
      UPDATE last_edit_mall_overview
      SET last_edit  = CURRENT_TIMESTAMP;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table mall_banner
-- ----------------------------
DROP TRIGGER IF EXISTS `delete_trigger_banner`;
delimiter ;;
CREATE TRIGGER `delete_trigger_banner` AFTER DELETE ON `mall_banner` FOR EACH ROW BEGIN

    UPDATE last_edit_mall_overview 
      SET last_edit  = CURRENT_TIMESTAMP;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table mall_category
-- ----------------------------
DROP TRIGGER IF EXISTS `update_trigger_mall_category`;
delimiter ;;
CREATE TRIGGER `update_trigger_mall_category` AFTER UPDATE ON `mall_category` FOR EACH ROW BEGIN    
DECLARE done INT DEFAULT FALSE;
    DECLARE ids INT;
    DECLARE cur CURSOR FOR SELECT mall_id FROM mall_category_connection WHERE category_id = NEW.id;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
        ins_loop: LOOP
            FETCH cur INTO ids;
            IF done THEN
                LEAVE ins_loop;
            END IF;
            UPDATE last_edit_mall SET last_edit = CURRENT_TIMESTAMP WHERE mall_id = ids;
        END LOOP;
    CLOSE cur;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table mall_category
-- ----------------------------
DROP TRIGGER IF EXISTS `delete_trigger_mall_category`;
delimiter ;;
CREATE TRIGGER `delete_trigger_mall_category` BEFORE DELETE ON `mall_category` FOR EACH ROW BEGIN    
DECLARE done INT DEFAULT FALSE;
    DECLARE ids INT;
    DECLARE cur CURSOR FOR SELECT mall_id FROM mall_category_connection WHERE category_id = OLD.id;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
        ins_loop: LOOP
            FETCH cur INTO ids;
            IF done THEN
                LEAVE ins_loop;
            END IF;
            UPDATE last_edit_mall SET last_edit = CURRENT_TIMESTAMP WHERE mall_id = ids;
        END LOOP;
    CLOSE cur;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table mall_category_connection
-- ----------------------------
DROP TRIGGER IF EXISTS `insert_trigger_mall_category_connection`;
delimiter ;;
CREATE TRIGGER `insert_trigger_mall_category_connection` AFTER INSERT ON `mall_category_connection` FOR EACH ROW BEGIN
    UPDATE last_edit_mall 
      SET last_edit  = CURRENT_TIMESTAMP WHERE mall_id = NEW.mall_id;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table mall_category_connection
-- ----------------------------
DROP TRIGGER IF EXISTS `update_trigger_mall_category_connection`;
delimiter ;;
CREATE TRIGGER `update_trigger_mall_category_connection` AFTER UPDATE ON `mall_category_connection` FOR EACH ROW BEGIN

    UPDATE last_edit_mall 
      SET last_edit  = CURRENT_TIMESTAMP WHERE mall_id = NEW.mall_id;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table mall_category_connection
-- ----------------------------
DROP TRIGGER IF EXISTS `delete_trigger_mall_category_connection`;
delimiter ;;
CREATE TRIGGER `delete_trigger_mall_category_connection` AFTER DELETE ON `mall_category_connection` FOR EACH ROW BEGIN
    UPDATE last_edit_mall 
      SET last_edit  = CURRENT_TIMESTAMP WHERE mall_id = OLD.mall_id;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table mall_item
-- ----------------------------
DROP TRIGGER IF EXISTS `insert_trigger_mall_item`;
delimiter ;;
CREATE TRIGGER `insert_trigger_mall_item` AFTER INSERT ON `mall_item` FOR EACH ROW BEGIN    
    DECLARE mID INT;
 SELECT mall_id INTO mID FROM mall_category_connection WHERE id = NEW.mall_category_connection_id;
    UPDATE last_edit_mall SET last_edit = CURRENT_TIMESTAMP WHERE mall_id = mID;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table mall_item
-- ----------------------------
DROP TRIGGER IF EXISTS `update_trigger_mall_item`;
delimiter ;;
CREATE TRIGGER `update_trigger_mall_item` AFTER UPDATE ON `mall_item` FOR EACH ROW BEGIN    
    DECLARE mID INT;
 SELECT mall_id INTO mID FROM mall_category_connection WHERE id = NEW.mall_category_connection_id;
    UPDATE last_edit_mall SET last_edit = CURRENT_TIMESTAMP WHERE mall_id = mID;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table mall_item
-- ----------------------------
DROP TRIGGER IF EXISTS `delete_trigger_mall_item`;
delimiter ;;
CREATE TRIGGER `delete_trigger_mall_item` BEFORE DELETE ON `mall_item` FOR EACH ROW BEGIN    
    DECLARE mID INT;
 SELECT mall_id INTO mID FROM mall_category_connection WHERE id = OLD.mall_category_connection_id;
    UPDATE last_edit_mall SET last_edit = CURRENT_TIMESTAMP WHERE mall_id = mID;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
