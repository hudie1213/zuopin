/*
 Navicat Premium Data Transfer

 Source Server         : hudie
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : user

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 22/07/2018 23:13:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo`  (
  `nick` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `imgUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sex` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`openid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('ღ', 'o_mnx5MwvaplaQob0UWITvVkxWJg', 'avsvVHD7W3WOXVFX5wv3vw==', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLaU14vbCnMTzgsUWG09MzNHxp3WXvc38ndM9qFsNwJrj66uldmZ3jk3mW9RwHByluFk2Yw2CDQxg/132', 'man');

-- ----------------------------
-- Table structure for userlike
-- ----------------------------
DROP TABLE IF EXISTS `userlike`;
CREATE TABLE `userlike`  (
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `likes` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `history` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`openid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userlike
-- ----------------------------
INSERT INTO `userlike` VALUES ('o_mnx5MwvaplaQob0UWITvVkxWJgb', '文章啊', '阿斯顿');
INSERT INTO `userlike` VALUES ('o_mnx5MwvaplaQob0UWITvVkxWJg', '文章', '阿斯顿');
INSERT INTO `userlike` VALUES ('o_mnx5MwvaplaQob0UWITvVkxWJga', '阿啊', '啊是青蛙');

SET FOREIGN_KEY_CHECKS = 1;
