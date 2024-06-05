/*
 Navicat Premium Data Transfer

 Source Server         : MT2Monster
 Source Server Type    : MySQL
 Source Server Version : 100616 (10.6.16-MariaDB)
 Source Host           : 217.113.49.243:3306
 Source Schema         : web

 Target Server Type    : MySQL
 Target Server Version : 100616 (10.6.16-MariaDB)
 File Encoding         : 65001

 Date: 05/06/2024 18:12:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Procedure structure for thorwException
-- ----------------------------
DROP PROCEDURE IF EXISTS `thorwException`;
delimiter ;;
CREATE PROCEDURE `thorwException`(IN `text` varchar(256))
BEGIN
	
	SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = `text`;

END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
