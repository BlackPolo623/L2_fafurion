/*
 Navicat Premium Data Transfer

 Source Server         : L2_fafurion
 Source Server Type    : MariaDB
 Source Server Version : 101001
 Source Host           : localhost:3306
 Source Schema         : l2jmobius_fafurion

 Target Server Type    : MariaDB
 Target Server Version : 101001
 File Encoding         : 65001

 Date: 11/04/2025 22:47:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_data
-- ----------------------------
DROP TABLE IF EXISTS `account_data`;
CREATE TABLE `account_data`  (
  `account_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `var` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`account_name`, `var`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_data
-- ----------------------------

-- ----------------------------
-- Table structure for account_gsdata
-- ----------------------------
DROP TABLE IF EXISTS `account_gsdata`;
CREATE TABLE `account_gsdata`  (
  `account_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `var` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `value` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`account_name`, `var`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_gsdata
-- ----------------------------

-- ----------------------------
-- Table structure for account_premium
-- ----------------------------
DROP TABLE IF EXISTS `account_premium`;
CREATE TABLE `account_premium`  (
  `account_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `enddate` decimal(20, 0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`account_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_premium
-- ----------------------------

-- ----------------------------
-- Table structure for accounts
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts`  (
  `login` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `lastactive` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  `accessLevel` tinyint(4) NOT NULL DEFAULT 0,
  `lastIP` char(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `lastServer` tinyint(4) NULL DEFAULT 1,
  `pcIp` char(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `hop1` char(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `hop2` char(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `hop3` char(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `hop4` char(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`login`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accounts
-- ----------------------------
INSERT INTO `accounts` VALUES ('111', 'oFbI0FrprGyhgLyZG5O3/+N1Y+A=', NULL, '2025-04-02 15:49:35', 1743904151310, 0, '192.168.1.1', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `accounts` VALUES ('1234', 'cRDtpNCeBiql5KOQsKVyrA0sAiA=', NULL, '2025-04-02 02:00:53', 1744382393088, 0, '100.75.148.39', 2, '192.168.1.105', '192.168.1.1', '168.95.98.254', '168.95.22.234', '220.128.1.78');
INSERT INTO `accounts` VALUES ('mh55660006', 'lT9h5tcmzpi1TfundaVAraIC7kY=', NULL, '2025-04-01 20:20:38', 1743533617841, 0, '1.34.101.128', 2, '192.168.1.108', '192.168.1.1', '168.95.98.254', '168.95.90.166', '220.128.1.78');
INSERT INTO `accounts` VALUES ('s8524120', 'oFbI0FrprGyhgLyZG5O3/+N1Y+A=', NULL, '2025-04-02 19:20:58', 1743951093861, 0, '114.32.75.177', 2, '172.22.160.1', '10.0.0.1', '192.168.100.1', '168.95.98.254', '168.95.105.146');
INSERT INTO `accounts` VALUES ('special884500', 'FjHQ4JarG/H+gGsgplE6fIdfXzk=', NULL, '2025-04-01 20:42:15', 1744118433621, 0, '59.127.48.67', 2, '25.63.177.168', '192.168.50.1', '168.95.98.254', '168.95.54.34', '220.128.27.70');

-- ----------------------------
-- Table structure for accounts_ipauth
-- ----------------------------
DROP TABLE IF EXISTS `accounts_ipauth`;
CREATE TABLE `accounts_ipauth`  (
  `login` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ip` char(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` enum('deny','allow') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT 'allow'
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accounts_ipauth
-- ----------------------------

-- ----------------------------
-- Table structure for airships
-- ----------------------------
DROP TABLE IF EXISTS `airships`;
CREATE TABLE `airships`  (
  `owner_id` int(11) NOT NULL,
  `fuel` decimal(5, 0) NOT NULL DEFAULT 600,
  PRIMARY KEY (`owner_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of airships
-- ----------------------------

-- ----------------------------
-- Table structure for announcements
-- ----------------------------
DROP TABLE IF EXISTS `announcements`;
CREATE TABLE `announcements`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `initial` bigint(20) NOT NULL DEFAULT 0,
  `delay` bigint(20) NOT NULL DEFAULT 0,
  `repeat` int(11) NOT NULL DEFAULT 0,
  `author` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of announcements
-- ----------------------------
INSERT INTO `announcements` VALUES (1, 0, 0, 0, 0, 'L2jMobius', '台灣法利昂測試伺服器');
INSERT INTO `announcements` VALUES (2, 0, 0, 0, 0, 'L2jMobius', '[=目前處於測試階段=]');

-- ----------------------------
-- Table structure for auction_bid
-- ----------------------------
DROP TABLE IF EXISTS `auction_bid`;
CREATE TABLE `auction_bid`  (
  `id` int(11) NOT NULL DEFAULT 0,
  `auctionId` int(11) NOT NULL DEFAULT 0,
  `bidderId` int(11) NOT NULL DEFAULT 0,
  `bidderName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `clan_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `maxBid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `time_bid` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`auctionId`, `bidderId`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auction_bid
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_favorites
-- ----------------------------
DROP TABLE IF EXISTS `bbs_favorites`;
CREATE TABLE `bbs_favorites`  (
  `favId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `playerId` int(10) UNSIGNED NOT NULL,
  `favTitle` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `favBypass` varchar(127) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `favAddDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`favId`) USING BTREE,
  UNIQUE INDEX `favId_playerId`(`favId`, `playerId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bbs_favorites
-- ----------------------------

-- ----------------------------
-- Table structure for bot_reported_char_data
-- ----------------------------
DROP TABLE IF EXISTS `bot_reported_char_data`;
CREATE TABLE `bot_reported_char_data`  (
  `botId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `reporterId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `reportDate` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`botId`, `reporterId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bot_reported_char_data
-- ----------------------------

-- ----------------------------
-- Table structure for buylists
-- ----------------------------
DROP TABLE IF EXISTS `buylists`;
CREATE TABLE `buylists`  (
  `buylist_id` int(10) UNSIGNED NOT NULL,
  `item_id` int(10) UNSIGNED NOT NULL,
  `count` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `next_restock_time` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`buylist_id`, `item_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of buylists
-- ----------------------------

-- ----------------------------
-- Table structure for castle
-- ----------------------------
DROP TABLE IF EXISTS `castle`;
CREATE TABLE `castle`  (
  `id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `side` enum('NEUTRAL','LIGHT','DARK') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'NEUTRAL',
  `treasury` bigint(20) NOT NULL DEFAULT 0,
  `siegeDate` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  `regTimeOver` enum('true','false') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'true',
  `regTimeEnd` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  `showNpcCrest` enum('true','false') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'false',
  `ticketBuyCount` smallint(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of castle
-- ----------------------------
INSERT INTO `castle` VALUES (5, '亞丁', 'NEUTRAL', 0, 1744531200865, 'true', 0, 'false', 0);
INSERT INTO `castle` VALUES (9, '修加特', 'NEUTRAL', 0, 1744531200869, 'true', 0, 'false', 0);
INSERT INTO `castle` VALUES (1, '古魯丁', 'NEUTRAL', 0, 1744531200859, 'true', 0, 'false', 0);
INSERT INTO `castle` VALUES (6, '因納德立', 'NEUTRAL', 0, 1744545600866, 'true', 0, 'false', 0);
INSERT INTO `castle` VALUES (3, '奇岩', 'NEUTRAL', 0, 1744531200863, 'true', 0, 'false', 0);
INSERT INTO `castle` VALUES (4, '歐瑞', 'NEUTRAL', 0, 1744545600864, 'true', 0, 'false', 0);
INSERT INTO `castle` VALUES (2, '狄恩', 'NEUTRAL', 0, 1744545600862, 'true', 0, 'false', 0);
INSERT INTO `castle` VALUES (7, '高達特', 'NEUTRAL', 0, 1744531200867, 'true', 0, 'false', 0);
INSERT INTO `castle` VALUES (8, '魯茵', 'NEUTRAL', 0, 1744545600868, 'true', 0, 'false', 0);

-- ----------------------------
-- Table structure for castle_doorupgrade
-- ----------------------------
DROP TABLE IF EXISTS `castle_doorupgrade`;
CREATE TABLE `castle_doorupgrade`  (
  `doorId` int(8) UNSIGNED NOT NULL DEFAULT 0,
  `ratio` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `castleId` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`doorId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of castle_doorupgrade
-- ----------------------------

-- ----------------------------
-- Table structure for castle_functions
-- ----------------------------
DROP TABLE IF EXISTS `castle_functions`;
CREATE TABLE `castle_functions`  (
  `castle_id` int(2) NOT NULL DEFAULT 0,
  `type` int(1) NOT NULL DEFAULT 0,
  `lvl` int(3) NOT NULL DEFAULT 0,
  `lease` int(10) NOT NULL DEFAULT 0,
  `rate` decimal(20, 0) NOT NULL DEFAULT 0,
  `endTime` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`castle_id`, `type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of castle_functions
-- ----------------------------

-- ----------------------------
-- Table structure for castle_manor_procure
-- ----------------------------
DROP TABLE IF EXISTS `castle_manor_procure`;
CREATE TABLE `castle_manor_procure`  (
  `castle_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `crop_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `amount` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `start_amount` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `price` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `reward_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `next_period` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`castle_id`, `crop_id`, `next_period`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of castle_manor_procure
-- ----------------------------

-- ----------------------------
-- Table structure for castle_manor_production
-- ----------------------------
DROP TABLE IF EXISTS `castle_manor_production`;
CREATE TABLE `castle_manor_production`  (
  `castle_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `seed_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `amount` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `start_amount` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `price` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `next_period` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`castle_id`, `seed_id`, `next_period`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of castle_manor_production
-- ----------------------------

-- ----------------------------
-- Table structure for castle_siege_guards
-- ----------------------------
DROP TABLE IF EXISTS `castle_siege_guards`;
CREATE TABLE `castle_siege_guards`  (
  `castleId` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `id` smallint(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  `npcId` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `x` mediumint(6) NOT NULL DEFAULT 0,
  `y` mediumint(6) NOT NULL DEFAULT 0,
  `z` mediumint(6) NOT NULL DEFAULT 0,
  `heading` mediumint(6) NOT NULL DEFAULT 0,
  `respawnDelay` mediumint(5) NOT NULL DEFAULT 0,
  `isHired` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`castleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3690 CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of castle_siege_guards
-- ----------------------------
INSERT INTO `castle_siege_guards` VALUES (1, 1, 35085, -18460, 113107, -2759, 15608, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 2, 35085, -18432, 113107, -2759, 15608, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 3, 35085, -18404, 113107, -2759, 15608, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 4, 35085, -18376, 113107, -2759, 15608, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 5, 35085, -18348, 113107, -2759, 15608, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 6, 35085, -18320, 113107, -2759, 15608, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 7, 35085, -18292, 113107, -2759, 15608, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 8, 35085, -18264, 113107, -2759, 15608, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 9, 35085, -18236, 113107, -2759, 15608, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 10, 35083, -18460, 113127, -2759, 15608, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 11, 35082, -18432, 113127, -2759, 15608, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 12, 35083, -18404, 113127, -2759, 15608, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 13, 35082, -18376, 113127, -2759, 15608, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 14, 35083, -18348, 113127, -2759, 15608, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 15, 35082, -18320, 113127, -2759, 15608, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 16, 35083, -18292, 113127, -2759, 15608, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 17, 35082, -18264, 113127, -2759, 15608, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 18, 35083, -18236, 113127, -2759, 15608, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 19, 35084, -18460, 113147, -2759, 15608, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 20, 35084, -18432, 113147, -2759, 15608, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 21, 35084, -18404, 113147, -2759, 15608, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 22, 35084, -18376, 113147, -2759, 15608, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 23, 35079, -18348, 113147, -2759, 15608, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 24, 35084, -18320, 113147, -2759, 15608, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 25, 35084, -18292, 113147, -2759, 15608, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 26, 35084, -18264, 113147, -2759, 15608, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 27, 35084, -18236, 113147, -2759, 15608, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 28, 35084, -18603, 112729, -2749, 64848, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 29, 35084, -18602, 112698, -2748, 64848, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 30, 35079, -18602, 112668, -2748, 64848, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 31, 35084, -18602, 112638, -2747, 64848, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 32, 35084, -18603, 112607, -2748, 64848, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 33, 35084, -18601, 112578, -2747, 64848, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 34, 35079, -18601, 112548, -2747, 64848, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 35, 35084, -18601, 112518, -2746, 64848, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 36, 35084, -18602, 112487, -2747, 64848, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 37, 35083, -18628, 112711, -2767, 64848, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 38, 35083, -18628, 112681, -2767, 64848, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 39, 35082, -18628, 112650, -2766, 64848, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 40, 35083, -18629, 112620, -2767, 64848, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 41, 35083, -18627, 112590, -2766, 64848, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 42, 35082, -18627, 112560, -2766, 64848, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 43, 35083, -18626, 112531, -2765, 64848, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 44, 35083, -18627, 112499, -2766, 64848, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 45, 35085, -18649, 112727, -2771, 64848, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 46, 35085, -18648, 112697, -2771, 64848, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 47, 35085, -18648, 112667, -2770, 64848, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 48, 35085, -18647, 112636, -2770, 64848, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 49, 35085, -18649, 112606, -2770, 64848, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 50, 35085, -18647, 112576, -2769, 64848, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 51, 35085, -18647, 112546, -2769, 64848, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 52, 35085, -18646, 112517, -2768, 64848, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 53, 35085, -18647, 112485, -2769, 64848, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 54, 35085, -18795, 112709, -2772, 64848, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 55, 35085, -18795, 112679, -2771, 64848, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 56, 35085, -18795, 112648, -2771, 64848, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 57, 35085, -18794, 112618, -2770, 64848, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 58, 35085, -18795, 112588, -2770, 64848, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 59, 35085, -18793, 112558, -2770, 64848, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 60, 35085, -18792, 112528, -2769, 64848, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 61, 35085, -18792, 112498, -2769, 64848, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 62, 35081, -18896, 112378, -2763, 15900, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 63, 35081, -18866, 112377, -2764, 15900, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 64, 35071, -18658, 112496, -2747, 64848, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 65, 35071, -18659, 112560, -2747, 64848, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 66, 35071, -18659, 112649, -2747, 64848, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 67, 35071, -18656, 112709, -2747, 64848, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 68, 35085, -18410, 112356, -2498, 15900, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 69, 35085, -18380, 112355, -2499, 15900, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 70, 35080, -18350, 112358, -2498, 15900, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 71, 35085, -18320, 112359, -2498, 15900, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 72, 35085, -18291, 112360, -2497, 15900, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 73, 35085, -18640, 112422, -2496, 15900, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 74, 35085, -18610, 112421, -2497, 15900, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 75, 35080, -18581, 112424, -2496, 15900, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 76, 35085, -18551, 112425, -2496, 15900, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 77, 35085, -18521, 112426, -2495, 15900, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 78, 35085, -18107, 112560, -2497, 31664, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 79, 35085, -18104, 112590, -2498, 31664, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 80, 35080, -18106, 112619, -2497, 31664, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 81, 35085, -18105, 112649, -2497, 31664, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 82, 35085, -18104, 112679, -2496, 31664, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 83, 35084, -17840, 112354, -2600, 65480, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 84, 35079, -17839, 112320, -2600, 65480, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 85, 35084, -17835, 112279, -2599, 65480, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 86, 35083, -17861, 112354, -2589, 65480, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 87, 35083, -17860, 112320, -2590, 65480, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 88, 35083, -17856, 112279, -2589, 65480, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 89, 35082, -17879, 112354, -2575, 65480, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 90, 35082, -17878, 112320, -2576, 65480, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 91, 35082, -17874, 112279, -2575, 65480, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 92, 35081, -18207, 112313, -2498, 22676, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 93, 35085, -18410, 112356, -2498, 15900, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 94, 35080, -18350, 112358, -2498, 15900, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 95, 35085, -18291, 112360, -2497, 15900, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 96, 35085, -18640, 112422, -2496, 15900, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 97, 35085, -18610, 112421, -2497, 15900, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 98, 35080, -18581, 112424, -2496, 15900, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 99, 35085, -18551, 112425, -2496, 15900, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 100, 35085, -18107, 112560, -2497, 31664, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 101, 35080, -18106, 112619, -2497, 31664, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 102, 35085, -18104, 112679, -2496, 31664, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 103, 35082, -18257, 110335, -2493, 6320, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 104, 35084, -18240, 110310, -2494, 6320, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 105, 35082, -18216, 110284, -2493, 6320, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 106, 35084, -18197, 110261, -2493, 6320, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 107, 35082, -18182, 110243, -2492, 6320, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 108, 35084, -18160, 110217, -2494, 6320, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 109, 35082, -18143, 110192, -2494, 6320, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 110, 35084, -18123, 110171, -2494, 6320, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 111, 35082, -18099, 110160, -2495, 17076, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 112, 35084, -18074, 110179, -2494, 25568, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 113, 35082, -18056, 110203, -2494, 25568, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 114, 35084, -18043, 110223, -2493, 25568, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 115, 35082, -18024, 110250, -2495, 25568, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 116, 35084, -18005, 110274, -2496, 25568, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 117, 35082, -17986, 110304, -2495, 25568, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 118, 35084, -17969, 110329, -2495, 25568, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 119, 35082, -17956, 110348, -2494, 25568, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 120, 35083, -18272, 110315, -2495, 6320, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 121, 35085, -18254, 110291, -2496, 6320, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 122, 35083, -18230, 110265, -2495, 6320, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 123, 35085, -18211, 110241, -2495, 6320, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 124, 35083, -18196, 110223, -2494, 6320, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 125, 35085, -18175, 110197, -2496, 6320, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 126, 35083, -18157, 110173, -2496, 6320, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 127, 35085, -18138, 110152, -2496, 6320, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 128, 35083, -18113, 110141, -2497, 17076, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 129, 35085, -18085, 110142, -2494, 17076, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 130, 35083, -18060, 110161, -2493, 25568, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 131, 35085, -18042, 110185, -2493, 25568, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 132, 35083, -18029, 110205, -2492, 25568, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 133, 35085, -18010, 110232, -2494, 25568, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 134, 35083, -17991, 110256, -2495, 25568, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 135, 35085, -17972, 110286, -2494, 25568, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 136, 35083, -17955, 110311, -2494, 25568, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 137, 35085, -17942, 110330, -2493, 25568, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 138, 35085, -18300, 110210, -2493, 6320, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 139, 35085, -18281, 110187, -2493, 6320, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 140, 35085, -18266, 110169, -2492, 6320, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 141, 35085, -18244, 110143, -2494, 6320, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 142, 35085, -18227, 110118, -2495, 6320, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 143, 35085, -17999, 110152, -2489, 25568, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 144, 35085, -17986, 110172, -2488, 25568, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 145, 35085, -17966, 110199, -2490, 25568, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 146, 35085, -17948, 110223, -2491, 25568, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 147, 35085, -17929, 110253, -2490, 25568, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 148, 35081, -17968, 110076, -2491, 15620, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 149, 35080, -17934, 110076, -2492, 15620, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 150, 35080, -18213, 110073, -2492, 15620, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 151, 35081, -18190, 110074, -2492, 15620, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 152, 35085, -18265, 110348, -2490, 25568, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 153, 35071, -18274, 110294, -2493, 6320, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 154, 35071, -18193, 110203, -2493, 6320, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 155, 35071, -18008, 110212, -2493, 6320, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 156, 35071, -17936, 110315, -2493, 6320, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 157, 35064, -18173, 108190, -2555, 16344, 300, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 158, 35065, -18061, 108187, -2554, 16344, 180, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 159, 35072, -17959, 108204, -2560, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 160, 35072, -17922, 108203, -2560, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 161, 35072, -17889, 108203, -2560, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 162, 35072, -17851, 108202, -2560, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 163, 35072, -17814, 108202, -2559, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 164, 35072, -17776, 108201, -2559, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 165, 35072, -17744, 108201, -2559, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 166, 35072, -17706, 108200, -2559, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 167, 35069, -17959, 108238, -2561, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 168, 35069, -17921, 108237, -2561, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 169, 35069, -17888, 108237, -2561, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 170, 35069, -17851, 108236, -2561, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 171, 35069, -17813, 108236, -2560, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 172, 35069, -17776, 108235, -2560, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 173, 35069, -17743, 108235, -2560, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 174, 35069, -17706, 108234, -2560, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 175, 35071, -17957, 108276, -2562, 16344, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 176, 35071, -17919, 108275, -2562, 16344, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 177, 35066, -17887, 108275, -2562, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 178, 35071, -17849, 108274, -2562, 16344, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 179, 35071, -17812, 108274, -2561, 16344, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 180, 35066, -17774, 108273, -2561, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 181, 35071, -17742, 108273, -2561, 16344, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 182, 35071, -17704, 108272, -2561, 16344, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 183, 35072, -18519, 108210, -2556, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 184, 35072, -18481, 108210, -2556, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 185, 35072, -18449, 108210, -2556, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 186, 35072, -18411, 108209, -2556, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 187, 35072, -18374, 108208, -2555, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 188, 35072, -18336, 108208, -2555, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 189, 35072, -18303, 108207, -2555, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 190, 35072, -18266, 108207, -2555, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 191, 35069, -18518, 108245, -2557, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 192, 35069, -18480, 108244, -2557, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 193, 35069, -18448, 108244, -2557, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 194, 35069, -18410, 108243, -2557, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 195, 35069, -18373, 108242, -2556, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 196, 35069, -18335, 108242, -2556, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 197, 35069, -18303, 108242, -2556, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 198, 35069, -18265, 108241, -2556, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 199, 35071, -18517, 108282, -2558, 16344, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 200, 35071, -18479, 108281, -2558, 16344, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 201, 35066, -18446, 108281, -2558, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 202, 35071, -18409, 108280, -2558, 16344, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 203, 35071, -18371, 108280, -2557, 16344, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 204, 35066, -18334, 108279, -2557, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 205, 35071, -18301, 108279, -2557, 16344, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 206, 35071, -18264, 108278, -2557, 16344, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 207, 35068, -18439, 108045, -2555, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 208, 35068, -18355, 108045, -2554, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 209, 35068, -18276, 108044, -2554, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 210, 35068, -18201, 108044, -2554, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 211, 35068, -18024, 108044, -2551, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 212, 35068, -17941, 108044, -2551, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 213, 35068, -17861, 108043, -2551, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 214, 35068, -17787, 108043, -2551, 16344, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 215, 35084, -17599, 109170, -2333, 16088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 216, 35079, -17625, 109170, -2333, 16088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 217, 35084, -17653, 109170, -2332, 16088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 218, 35083, -17599, 109148, -2337, 16088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 219, 35083, -17626, 109148, -2337, 16088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 220, 35083, -17653, 109148, -2336, 16088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 221, 35082, -17600, 109123, -2335, 16088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 222, 35082, -17627, 109123, -2335, 16088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 223, 35082, -17654, 109124, -2334, 16088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 224, 35081, -17540, 109046, -2335, 16088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 225, 35081, -17566, 109046, -2335, 16088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 226, 35081, -17594, 109046, -2334, 16088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 227, 35085, -17795, 108473, -2338, 32692, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 228, 35085, -17794, 108436, -2338, 32692, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 229, 35080, -17794, 108399, -2337, 32692, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 230, 35085, -17793, 108363, -2337, 32692, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 231, 35085, -17793, 108327, -2337, 32692, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 232, 35080, -17792, 108289, -2337, 32692, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 233, 35085, -17792, 108258, -2336, 32692, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 234, 35085, -17791, 108221, -2336, 32692, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 235, 35080, -17790, 108186, -2336, 32692, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 236, 35085, -17790, 108149, -2336, 32692, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 237, 35085, -17790, 108112, -2336, 32692, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 238, 35084, -18574, 109236, -2333, 16088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 239, 35079, -18600, 109236, -2333, 16088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 240, 35084, -18643, 109233, -2332, 16088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 241, 35083, -18574, 109214, -2337, 16088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 242, 35083, -18601, 109214, -2337, 16088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 243, 35083, -18628, 109214, -2336, 16088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 244, 35082, -18575, 109189, -2335, 16088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 245, 35082, -18602, 109189, -2335, 16088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 246, 35082, -18629, 109190, -2334, 16088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 247, 35081, -18536, 108948, -2335, 16088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 248, 35081, -18562, 108948, -2335, 16088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 249, 35081, -18590, 108948, -2334, 16088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 250, 35085, -18428, 108118, -2338, 65152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 251, 35085, -18427, 108154, -2338, 65152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 252, 35080, -18426, 108191, -2337, 65152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 253, 35085, -18426, 108227, -2337, 65152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 254, 35085, -18426, 108263, -2337, 65152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 255, 35080, -18425, 108301, -2337, 65152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 256, 35085, -18425, 108332, -2336, 65152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 257, 35085, -18424, 108369, -2336, 65152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 258, 35080, -18424, 108404, -2336, 65152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 259, 35085, -18423, 108441, -2336, 65152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 260, 35085, -18422, 108478, -2336, 65152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 261, 35085, -18096, 113184, -2384, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 262, 35085, -18096, 113248, -2384, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 263, 35085, -18096, 113296, -2384, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 264, 35085, -18048, 113296, -2384, 20480, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 265, 35085, -18000, 113296, -2384, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 266, 35085, -17936, 113296, -2384, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 267, 35085, -17872, 113296, -2384, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 268, 35085, -18602, 113174, -2376, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 269, 35085, -18608, 113232, -2384, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 270, 35085, -18611, 113295, -2376, 8192, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 271, 35085, -18672, 113296, -2384, 12288, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 272, 35085, -18720, 113296, -2384, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 273, 35085, -18780, 113296, -2384, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 274, 35085, -18830, 113296, -2384, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 275, 35080, -18096, 113216, -2384, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 276, 35080, -18096, 113264, -2384, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 277, 35080, -18608, 113200, -2384, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 278, 35080, -18611, 113261, -2376, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 279, 35081, -18025, 113264, -2384, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 280, 35081, -18704, 113256, -2384, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 281, 35085, -18648, 113313, -2376, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 282, 35085, -18692, 113313, -2376, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 283, 35085, -18759, 113311, -2376, 24576, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 284, 35085, -18804, 113316, -2376, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 285, 35085, -18071, 113326, -2376, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 286, 35085, -18011, 113328, -2376, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 287, 35085, -17969, 113325, -2376, 8192, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 288, 35085, -17923, 113326, -2376, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 289, 35080, -18096, 113216, -2384, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 290, 35080, -18096, 113264, -2384, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 291, 35080, -18608, 113200, -2384, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 292, 35080, -18611, 113261, -2376, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 293, 35081, -18025, 113264, -2384, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 294, 35081, -18704, 113256, -2384, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 295, 35072, -18176, 111420, -2500, 16384, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 296, 35072, -18048, 111420, -2500, 16384, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 297, 35072, -17985, 111420, -2500, 16384, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 298, 35072, -18240, 111420, -2500, 16384, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 299, 35072, -18371, 111420, -2500, 16384, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 300, 35072, -18499, 111420, -2500, 16384, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 301, 35072, -17857, 111420, -2500, 16384, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 302, 35072, -17728, 111420, -2500, 16384, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 303, 35067, -18304, 111420, -2500, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 304, 35067, -17921, 111420, -2500, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 305, 35067, -17664, 111420, -2500, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 306, 35067, -18563, 111420, -2500, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 307, 35068, -18112, 111420, -2500, 16384, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 308, 35068, -17793, 111420, -2500, 16384, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 309, 35068, -18435, 111420, -2500, 16384, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 310, 35071, -18560, 111570, -2500, 16384, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 311, 35071, -18496, 111570, -2500, 16384, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 312, 35071, -17664, 111570, -2500, 16384, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 313, 35071, -17728, 111570, -2500, 16384, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 314, 35066, -18112, 111570, -2500, 16384, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 315, 35071, -18432, 111570, -2500, 16384, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 316, 35071, -18368, 111570, -2500, 16384, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 317, 35071, -18304, 111570, -2500, 16384, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 318, 35071, -18240, 111570, -2500, 16384, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 319, 35066, -18176, 111570, -2500, 16384, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 320, 35066, -18049, 111570, -2500, 16384, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 321, 35071, -17985, 111570, -2500, 16384, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 322, 35071, -17921, 111570, -2500, 16384, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 323, 35071, -17857, 111570, -2500, 16384, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 324, 35071, -17793, 111570, -2500, 16384, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 325, 35085, -17880, 110667, -2191, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 326, 35085, -17881, 110789, -2191, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 327, 35085, -17826, 110850, -2191, 24576, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 328, 35085, -17801, 110869, -2191, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 329, 35085, -17762, 110870, -2191, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 330, 35085, -17726, 110870, -2191, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 331, 35085, -17880, 110710, -2191, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 332, 35080, -17852, 110825, -2191, 24576, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 333, 35080, -17880, 110749, -2190, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 334, 35081, -17778, 110804, -2192, 24576, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 335, 35085, -18333, 110661, -2193, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 336, 35085, -18333, 110701, -2191, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 337, 35085, -18333, 110786, -2192, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 338, 35085, -18391, 110851, -2191, 8192, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 339, 35085, -18418, 110871, -2190, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 340, 35085, -18458, 110870, -2191, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 341, 35085, -18497, 110871, -2191, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 342, 35080, -18333, 110745, -2189, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 343, 35080, -18355, 110815, -2192, 8192, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 344, 35081, -18435, 110797, -2189, 8192, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 345, 35085, -18220, 110540, -2500, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 346, 35085, -18189, 110540, -2500, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 347, 35085, -18158, 110540, -2500, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 348, 35085, -18126, 110540, -2500, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 349, 35085, -18095, 110540, -2500, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 350, 35085, -18063, 110540, -2500, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 351, 35085, -18032, 110540, -2500, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 352, 35080, -18000, 110540, -2500, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 353, 35080, -18220, 110560, -2500, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 354, 35081, -18189, 110560, -2500, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 355, 35085, -18158, 110560, -2500, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 356, 35085, -18126, 110560, -2500, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 357, 35085, -18095, 110560, -2500, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 358, 35085, -18063, 110560, -2500, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 359, 35085, -18032, 110560, -2500, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 360, 35085, -18000, 110560, -2500, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 361, 35085, -16548, 111653, -2376, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 362, 35085, -16548, 111602, -2376, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 363, 35085, -16548, 111552, -2376, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 364, 35085, -16548, 111502, -2376, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 365, 35081, -16548, 111452, -2376, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 366, 35085, -16548, 111402, -2376, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 367, 35085, -16548, 111352, -2376, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 368, 35085, -16548, 111302, -2376, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 369, 35085, -16548, 111252, -2376, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 370, 35080, -16548, 111202, -2376, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 371, 35085, -16548, 111152, -2376, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 372, 35085, -16548, 111102, -2376, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 373, 35085, -19950, 111653, -2376, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 374, 35085, -19950, 111602, -2376, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 375, 35085, -19950, 111552, -2376, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 376, 35085, -19950, 111502, -2376, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 377, 35081, -19950, 111452, -2376, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 378, 35085, -19950, 111402, -2376, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 379, 35085, -19950, 111352, -2376, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 380, 35085, -19950, 111302, -2376, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 381, 35085, -19950, 111252, -2376, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 382, 35080, -19950, 111202, -2376, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 383, 35085, -19950, 111152, -2376, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (1, 384, 35085, -19950, 111102, -2376, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 385, 35127, 22420, 156643, -2953, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 386, 35127, 22392, 156643, -2953, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 387, 35127, 22364, 156643, -2953, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 388, 35127, 22336, 156643, -2953, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 389, 35127, 22308, 156643, -2953, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 390, 35127, 22280, 156643, -2953, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 391, 35127, 22252, 156643, -2953, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 392, 35127, 22224, 156643, -2953, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 393, 35127, 22196, 156643, -2953, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 394, 35125, 22420, 156623, -2953, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 395, 35124, 22392, 156623, -2953, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 396, 35125, 22364, 156623, -2953, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 397, 35124, 22336, 156623, -2953, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 398, 35125, 22308, 156623, -2953, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 399, 35124, 22280, 156623, -2953, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 400, 35125, 22252, 156623, -2953, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 401, 35124, 22224, 156623, -2953, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 402, 35125, 22196, 156623, -2953, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 403, 35126, 22420, 156603, -2953, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 404, 35126, 22392, 156603, -2953, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 405, 35126, 22364, 156603, -2953, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 406, 35126, 22336, 156603, -2953, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 407, 35121, 22308, 156603, -2953, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 408, 35126, 22280, 156603, -2953, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 409, 35126, 22252, 156603, -2953, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 410, 35126, 22224, 156603, -2953, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 411, 35126, 22196, 156603, -2953, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 412, 35126, 22563, 157021, -2943, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 413, 35126, 22562, 157052, -2942, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 414, 35121, 22562, 157082, -2942, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 415, 35126, 22562, 157112, -2941, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 416, 35126, 22563, 157143, -2942, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 417, 35126, 22561, 157172, -2941, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 418, 35121, 22561, 157202, -2941, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 419, 35126, 22561, 157232, -2940, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 420, 35126, 22562, 157263, -2941, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 421, 35125, 22588, 157039, -2961, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 422, 35125, 22588, 157069, -2961, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 423, 35124, 22588, 157100, -2960, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 424, 35125, 22589, 157130, -2961, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 425, 35125, 22587, 157160, -2960, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 426, 35124, 22587, 157190, -2960, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 427, 35125, 22586, 157219, -2959, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 428, 35125, 22587, 157251, -2960, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 429, 35127, 22609, 157023, -2965, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 430, 35127, 22608, 157053, -2965, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 431, 35127, 22608, 157083, -2964, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 432, 35127, 22607, 157114, -2964, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 433, 35127, 22609, 157144, -2964, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 434, 35127, 22607, 157174, -2963, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 435, 35127, 22607, 157204, -2963, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 436, 35127, 22606, 157233, -2962, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 437, 35127, 22607, 157265, -2963, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 438, 35127, 22755, 157041, -2966, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 439, 35127, 22755, 157071, -2965, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 440, 35127, 22755, 157102, -2965, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 441, 35127, 22754, 157132, -2964, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 442, 35127, 22755, 157162, -2964, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 443, 35127, 22753, 157192, -2964, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 444, 35127, 22752, 157222, -2963, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 445, 35127, 22752, 157252, -2963, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 446, 35123, 22856, 157372, -2957, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 447, 35123, 22826, 157373, -2958, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 448, 35113, 22618, 157254, -2941, 32080, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 449, 35113, 22619, 157190, -2941, 32080, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 450, 35113, 22619, 157101, -2941, 32080, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 451, 35113, 22616, 157041, -2941, 32080, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 452, 35127, 22370, 157394, -2692, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 453, 35127, 22340, 157395, -2693, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 454, 35122, 22310, 157392, -2692, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 455, 35127, 22280, 157391, -2692, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 456, 35127, 22251, 157390, -2691, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 457, 35127, 22600, 157328, -2690, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 458, 35127, 22570, 157329, -2691, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 459, 35122, 22541, 157326, -2690, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 460, 35127, 22511, 157325, -2690, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 461, 35127, 22481, 157324, -2689, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 462, 35127, 22067, 157190, -2691, 64432, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 463, 35127, 22064, 157160, -2692, 64432, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 464, 35122, 22066, 157131, -2691, 64432, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 465, 35127, 22065, 157101, -2691, 64432, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 466, 35127, 22064, 157071, -2690, 64432, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 467, 35126, 21800, 157396, -2794, 32712, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 468, 35121, 21799, 157430, -2794, 32712, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 469, 35126, 21795, 157471, -2793, 32712, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 470, 35125, 21821, 157396, -2783, 32712, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 471, 35125, 21820, 157430, -2784, 32712, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 472, 35125, 21816, 157471, -2783, 32712, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 473, 35124, 21839, 157396, -2769, 32712, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 474, 35124, 21838, 157430, -2770, 32712, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 475, 35124, 21834, 157471, -2769, 32712, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 476, 35123, 22167, 157437, -2692, 55444, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 477, 35127, 22370, 157394, -2692, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 478, 35122, 22310, 157392, -2692, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 479, 35127, 22251, 157390, -2691, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 480, 35127, 22600, 157328, -2690, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 481, 35127, 22570, 157329, -2691, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 482, 35122, 22541, 157326, -2690, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 483, 35127, 22511, 157325, -2690, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 484, 35127, 22067, 157190, -2691, 64432, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 485, 35122, 22066, 157131, -2691, 64432, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 486, 35127, 22064, 157071, -2690, 64432, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 487, 35124, 22217, 159415, -2687, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 488, 35126, 22200, 159440, -2688, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 489, 35124, 22176, 159466, -2687, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 490, 35126, 22157, 159489, -2687, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 491, 35124, 22142, 159507, -2686, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 492, 35126, 22120, 159533, -2688, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 493, 35124, 22103, 159558, -2688, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 494, 35126, 22083, 159579, -2688, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 495, 35124, 22059, 159590, -2689, 49844, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 496, 35126, 22034, 159571, -2688, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 497, 35124, 22016, 159547, -2688, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 498, 35126, 22003, 159527, -2687, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 499, 35124, 21984, 159500, -2689, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 500, 35126, 21965, 159476, -2690, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 501, 35124, 21946, 159446, -2689, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 502, 35126, 21929, 159421, -2689, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 503, 35124, 21916, 159402, -2688, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 504, 35125, 22232, 159435, -2689, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 505, 35127, 22214, 159459, -2690, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 506, 35125, 22190, 159485, -2689, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 507, 35127, 22171, 159509, -2689, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 508, 35125, 22156, 159527, -2688, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 509, 35127, 22135, 159553, -2690, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 510, 35125, 22117, 159577, -2690, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 511, 35127, 22098, 159598, -2690, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 512, 35125, 22073, 159609, -2691, 49844, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 513, 35127, 22045, 159608, -2688, 49844, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 514, 35125, 22020, 159589, -2687, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 515, 35127, 22002, 159565, -2687, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 516, 35125, 21989, 159545, -2686, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 517, 35127, 21970, 159518, -2688, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 518, 35125, 21951, 159494, -2689, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 519, 35127, 21932, 159464, -2688, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 520, 35125, 21915, 159439, -2688, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 521, 35127, 21902, 159420, -2687, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 522, 35127, 22260, 159540, -2687, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 523, 35127, 22241, 159563, -2687, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 524, 35127, 22226, 159581, -2686, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 525, 35127, 22204, 159607, -2688, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 526, 35127, 22187, 159632, -2689, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 527, 35127, 21959, 159598, -2683, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 528, 35127, 21946, 159578, -2682, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 529, 35127, 21926, 159551, -2684, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 530, 35127, 21908, 159527, -2685, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 531, 35127, 21889, 159497, -2684, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 532, 35123, 21928, 159674, -2685, 48388, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 533, 35122, 21894, 159674, -2686, 48388, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 534, 35122, 22173, 159677, -2686, 48388, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 535, 35123, 22150, 159676, -2686, 48388, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 536, 35127, 22225, 159402, -2684, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 537, 35113, 22234, 159456, -2687, 39088, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 538, 35113, 22153, 159547, -2687, 39088, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 539, 35113, 21968, 159538, -2687, 39088, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 540, 35113, 21896, 159435, -2687, 39088, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 541, 35106, 22133, 161560, -2749, 49112, 300, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 542, 35107, 22021, 161563, -2748, 49112, 180, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 543, 35114, 21919, 161546, -2754, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 544, 35114, 21882, 161547, -2754, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 545, 35114, 21849, 161547, -2754, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 546, 35114, 21811, 161548, -2754, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 547, 35114, 21774, 161548, -2753, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 548, 35114, 21736, 161549, -2753, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 549, 35114, 21704, 161549, -2753, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 550, 35114, 21666, 161550, -2753, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 551, 35111, 21919, 161512, -2755, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 552, 35111, 21881, 161513, -2755, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 553, 35111, 21848, 161513, -2755, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 554, 35111, 21811, 161514, -2755, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 555, 35111, 21773, 161514, -2754, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 556, 35111, 21736, 161515, -2754, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 557, 35111, 21703, 161515, -2754, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 558, 35111, 21666, 161516, -2754, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 559, 35113, 21917, 161474, -2756, 49112, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 560, 35113, 21879, 161475, -2756, 49112, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 561, 35108, 21847, 161475, -2756, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 562, 35113, 21809, 161476, -2756, 49112, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 563, 35113, 21772, 161476, -2755, 49112, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 564, 35108, 21734, 161477, -2755, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 565, 35113, 21702, 161477, -2755, 49112, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 566, 35113, 21664, 161478, -2755, 49112, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 567, 35114, 22479, 161540, -2750, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 568, 35114, 22441, 161540, -2750, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 569, 35114, 22409, 161540, -2750, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 570, 35114, 22371, 161541, -2750, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 571, 35114, 22334, 161542, -2749, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 572, 35114, 22296, 161542, -2749, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 573, 35114, 22263, 161543, -2749, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 574, 35114, 22226, 161543, -2749, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 575, 35111, 22478, 161505, -2751, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 576, 35111, 22440, 161506, -2751, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 577, 35111, 22408, 161506, -2751, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 578, 35111, 22370, 161507, -2751, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 579, 35111, 22333, 161508, -2750, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 580, 35111, 22295, 161508, -2750, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 581, 35111, 22263, 161508, -2750, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 582, 35111, 22225, 161509, -2750, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 583, 35113, 22477, 161468, -2752, 49112, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 584, 35113, 22439, 161469, -2752, 49112, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 585, 35108, 22406, 161469, -2752, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 586, 35113, 22369, 161470, -2752, 49112, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 587, 35113, 22331, 161470, -2751, 49112, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 588, 35108, 22294, 161471, -2751, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 589, 35113, 22261, 161471, -2751, 49112, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 590, 35113, 22224, 161472, -2751, 49112, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 591, 35110, 22399, 161705, -2749, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 592, 35110, 22315, 161705, -2748, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 593, 35110, 22236, 161706, -2748, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 594, 35110, 22161, 161706, -2748, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 595, 35110, 21984, 161706, -2745, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 596, 35110, 21901, 161706, -2745, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 597, 35110, 21821, 161707, -2745, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 598, 35110, 21747, 161707, -2745, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 599, 35126, 21559, 160580, -2527, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 600, 35121, 21585, 160580, -2527, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 601, 35126, 21613, 160580, -2526, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 602, 35125, 21559, 160602, -2531, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 603, 35125, 21586, 160602, -2531, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 604, 35125, 21613, 160602, -2530, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 605, 35124, 21560, 160627, -2529, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 606, 35124, 21587, 160627, -2529, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 607, 35124, 21614, 160626, -2528, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 608, 35123, 21500, 160704, -2529, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 609, 35123, 21526, 160704, -2529, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 610, 35123, 21554, 160704, -2528, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 611, 35127, 21755, 161277, -2532, 65460, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 612, 35127, 21754, 161314, -2532, 65460, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 613, 35122, 21754, 161351, -2531, 65460, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 614, 35127, 21753, 161387, -2531, 65460, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 615, 35127, 21753, 161423, -2531, 65460, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 616, 35122, 21752, 161461, -2531, 65460, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 617, 35127, 21752, 161492, -2530, 65460, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 618, 35127, 21751, 161529, -2530, 65460, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 619, 35122, 21750, 161564, -2530, 65460, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 620, 35127, 21750, 161601, -2530, 65460, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 621, 35127, 21750, 161638, -2530, 65460, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 622, 35126, 22534, 160514, -2527, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 623, 35121, 22560, 160514, -2527, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 624, 35126, 22603, 160517, -2526, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 625, 35125, 22534, 160536, -2531, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 626, 35125, 22561, 160536, -2531, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 627, 35125, 22588, 160536, -2530, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 628, 35124, 22535, 160561, -2529, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 629, 35124, 22562, 160561, -2529, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 630, 35124, 22589, 160560, -2528, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 631, 35123, 22496, 160802, -2529, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 632, 35123, 22522, 160802, -2529, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 633, 35123, 22550, 160802, -2528, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 634, 35127, 22388, 161632, -2532, 32384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 635, 35127, 22387, 161596, -2532, 32384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 636, 35122, 22386, 161559, -2531, 32384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 637, 35127, 22386, 161523, -2531, 32384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 638, 35127, 22386, 161487, -2531, 32384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 639, 35122, 22385, 161449, -2531, 32384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 640, 35127, 22385, 161418, -2530, 32384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 641, 35127, 22384, 161381, -2530, 32384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 642, 35122, 22384, 161346, -2530, 32384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 643, 35127, 22383, 161309, -2530, 32384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 644, 35127, 22382, 161272, -2530, 32384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 645, 35127, 22084, 156570, -2576, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 646, 35127, 22084, 156502, -2576, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 647, 35127, 22066, 156434, -2576, 57344, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 648, 35127, 22034, 156410, -2576, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 649, 35127, 21997, 156410, -2576, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 650, 35127, 21960, 156410, -2576, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 651, 35127, 21922, 156410, -2576, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 652, 35127, 22540, 156570, -2576, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 653, 35127, 22540, 156498, -2576, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 654, 35127, 22560, 156432, -2576, 40960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 655, 35127, 22592, 156405, -2576, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 656, 35127, 22629, 156405, -2576, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 657, 35127, 22665, 156405, -2576, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 658, 35127, 22700, 156405, -2576, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 659, 35122, 22084, 156536, -2576, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 660, 35122, 22084, 156470, -2576, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 661, 35122, 22540, 156533, -2576, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 662, 35122, 22540, 156464, -2576, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 663, 35123, 22020, 156475, -2576, 57344, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 664, 35123, 22599, 156480, -2576, 40960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 665, 35127, 22064, 156579, -2567, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 666, 35127, 22064, 156467, -2567, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 667, 35127, 22017, 156408, -2567, 57344, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 668, 35127, 21950, 156394, -2567, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 669, 35127, 22549, 156540, -2567, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 670, 35127, 22548, 156460, -2567, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 671, 35127, 22594, 156403, -2567, 40960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 672, 35127, 22666, 156391, -2567, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 673, 35122, 22549, 156499, -2566, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 674, 35122, 22560, 156428, -2566, 40960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 675, 35122, 22054, 156431, -2566, 57344, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 676, 35122, 22064, 156515, -2567, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 677, 35123, 22648, 156430, -2567, 40960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 678, 35123, 21958, 156438, -2567, 57344, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 679, 35114, 22136, 158330, -2694, 49152, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 680, 35114, 22008, 158330, -2694, 49152, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 681, 35114, 21945, 158330, -2694, 49152, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 682, 35114, 22200, 158330, -2694, 49152, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 683, 35114, 22331, 158330, -2694, 49152, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 684, 35114, 22459, 158330, -2694, 49152, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 685, 35114, 21817, 158330, -2694, 49152, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 686, 35114, 21688, 158330, -2694, 49152, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 687, 35109, 22264, 158330, -2694, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 688, 35109, 21881, 158330, -2694, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 689, 35109, 21624, 158330, -2694, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 690, 35109, 22523, 158330, -2694, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 691, 35110, 22072, 158330, -2694, 49152, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 692, 35110, 21753, 158330, -2694, 49152, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 693, 35110, 22395, 158330, -2694, 49152, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 694, 35113, 22520, 158180, -2694, 49152, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 695, 35113, 22456, 158180, -2694, 49152, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 696, 35113, 21624, 158180, -2694, 49152, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 697, 35113, 21688, 158180, -2694, 49152, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 698, 35108, 22072, 158180, -2694, 49152, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 699, 35113, 22392, 158180, -2694, 49152, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 700, 35113, 22328, 158180, -2694, 49152, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 701, 35113, 22264, 158180, -2694, 49152, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 702, 35113, 22200, 158180, -2694, 49152, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 703, 35108, 22136, 158180, -2694, 49152, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 704, 35108, 22009, 158180, -2694, 49152, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 705, 35113, 21945, 158180, -2694, 49152, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 706, 35113, 21881, 158180, -2694, 49152, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 707, 35113, 21817, 158180, -2694, 49152, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 708, 35113, 21753, 158180, -2694, 49152, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 709, 35127, 21840, 159083, -2385, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 710, 35127, 21841, 158961, -2385, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 711, 35127, 21786, 158900, -2385, 57344, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 712, 35127, 21761, 158881, -2385, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 713, 35127, 21722, 158880, -2385, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 714, 35127, 21686, 158880, -2385, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 715, 35127, 21840, 159040, -2385, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 716, 35122, 21812, 158925, -2385, 57344, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 717, 35122, 21840, 159001, -2384, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 718, 35123, 21738, 158946, -2386, 57344, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 719, 35127, 22293, 159089, -2387, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 720, 35127, 22293, 159049, -2385, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 721, 35127, 22293, 158964, -2386, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 722, 35127, 22351, 158899, -2385, 40960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 723, 35127, 22378, 158879, -2384, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 724, 35127, 22418, 158880, -2385, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 725, 35127, 22457, 158879, -2385, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 726, 35122, 22293, 159005, -2383, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 727, 35122, 22315, 158935, -2386, 40960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 728, 35123, 22395, 158953, -2383, 40960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 729, 35127, 22180, 159210, -2694, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 730, 35127, 22149, 159210, -2694, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 731, 35127, 22118, 159210, -2694, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 732, 35127, 22086, 159210, -2694, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 733, 35127, 22055, 159210, -2694, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 734, 35127, 22023, 159210, -2694, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 735, 35127, 21992, 159210, -2694, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 736, 35122, 21960, 159210, -2694, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 737, 35122, 22180, 159190, -2694, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 738, 35123, 22149, 159190, -2694, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 739, 35127, 22118, 159190, -2694, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 740, 35127, 22086, 159190, -2694, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 741, 35127, 22055, 159190, -2694, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 742, 35127, 22023, 159190, -2694, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 743, 35127, 21992, 159190, -2694, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 744, 35127, 21960, 159190, -2694, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 745, 35127, 20508, 158097, -2570, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 746, 35127, 20508, 158148, -2570, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 747, 35127, 20508, 158198, -2570, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 748, 35127, 20508, 158248, -2570, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 749, 35123, 20508, 158298, -2570, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 750, 35127, 20508, 158348, -2570, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 751, 35127, 20508, 158398, -2570, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 752, 35127, 20508, 158448, -2570, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 753, 35127, 20508, 158498, -2570, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 754, 35122, 20508, 158548, -2570, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 755, 35127, 20508, 158598, -2570, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 756, 35127, 20508, 158648, -2570, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 757, 35127, 23910, 158097, -2570, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 758, 35127, 23910, 158148, -2570, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 759, 35127, 23910, 158198, -2570, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 760, 35127, 23910, 158248, -2570, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 761, 35123, 23910, 158298, -2570, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 762, 35127, 23910, 158348, -2570, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 763, 35127, 23910, 158398, -2570, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 764, 35127, 23910, 158448, -2570, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 765, 35127, 23910, 158498, -2570, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 766, 35122, 23910, 158548, -2570, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 767, 35127, 23910, 158598, -2570, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 768, 35127, 23910, 158648, -2570, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 769, 35106, 117732, 145036, -2622, 32728, 300, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 770, 35107, 117735, 145148, -2621, 32728, 180, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 771, 35106, 83808, 37131, -2349, 32728, 300, 0);
INSERT INTO `castle_siege_guards` VALUES (2, 772, 35107, 83811, 37243, -2348, 32728, 180, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 773, 35169, 112815, 144749, -2826, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 774, 35169, 112815, 144777, -2826, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 775, 35169, 112815, 144805, -2826, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 776, 35169, 112815, 144833, -2826, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 777, 35169, 112815, 144861, -2826, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 778, 35169, 112815, 144889, -2826, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 779, 35169, 112815, 144917, -2826, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 780, 35169, 112815, 144945, -2826, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 781, 35169, 112815, 144973, -2826, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 782, 35167, 112795, 144749, -2826, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 783, 35166, 112795, 144777, -2826, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 784, 35167, 112795, 144805, -2826, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 785, 35166, 112795, 144833, -2826, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 786, 35167, 112795, 144861, -2826, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 787, 35166, 112795, 144889, -2826, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 788, 35167, 112795, 144917, -2826, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 789, 35166, 112795, 144945, -2826, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 790, 35167, 112795, 144973, -2826, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 791, 35168, 112775, 144749, -2826, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 792, 35168, 112775, 144777, -2826, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 793, 35168, 112775, 144805, -2826, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 794, 35168, 112775, 144833, -2826, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 795, 35163, 112775, 144861, -2826, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 796, 35168, 112775, 144889, -2826, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 797, 35168, 112775, 144917, -2826, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 798, 35168, 112775, 144945, -2826, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 799, 35168, 112775, 144973, -2826, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 800, 35168, 113193, 144606, -2816, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 801, 35168, 113224, 144607, -2815, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 802, 35163, 113254, 144607, -2815, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 803, 35168, 113284, 144607, -2814, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 804, 35168, 113315, 144606, -2815, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 805, 35168, 113344, 144608, -2814, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 806, 35163, 113374, 144608, -2814, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 807, 35168, 113404, 144608, -2813, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 808, 35168, 113435, 144607, -2814, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 809, 35167, 113211, 144581, -2834, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 810, 35167, 113241, 144581, -2834, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 811, 35166, 113272, 144581, -2833, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 812, 35167, 113302, 144580, -2834, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 813, 35167, 113332, 144582, -2833, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 814, 35166, 113362, 144582, -2833, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 815, 35167, 113391, 144583, -2832, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 816, 35167, 113423, 144582, -2833, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 817, 35169, 113195, 144560, -2838, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 818, 35169, 113225, 144561, -2838, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 819, 35169, 113255, 144561, -2837, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 820, 35169, 113286, 144562, -2837, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 821, 35169, 113316, 144560, -2837, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 822, 35169, 113346, 144562, -2836, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 823, 35169, 113376, 144562, -2836, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 824, 35169, 113405, 144563, -2835, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 825, 35169, 113437, 144562, -2836, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 826, 35169, 113213, 144414, -2839, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 827, 35169, 113243, 144414, -2838, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 828, 35169, 113274, 144414, -2838, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 829, 35169, 113304, 144415, -2837, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 830, 35169, 113334, 144414, -2837, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 831, 35169, 113364, 144416, -2837, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 832, 35169, 113394, 144417, -2836, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 833, 35169, 113424, 144417, -2836, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 834, 35165, 113544, 144313, -2830, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 835, 35165, 113545, 144343, -2831, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 836, 35155, 113426, 144551, -2814, 15696, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 837, 35155, 113362, 144550, -2814, 15696, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 838, 35155, 113273, 144550, -2814, 15696, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 839, 35155, 113213, 144553, -2814, 15696, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 840, 35169, 113566, 144799, -2565, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 841, 35169, 113567, 144829, -2566, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 842, 35164, 113564, 144859, -2565, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 843, 35169, 113563, 144889, -2565, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 844, 35169, 113562, 144918, -2564, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 845, 35169, 113500, 144569, -2563, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 846, 35169, 113501, 144599, -2564, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 847, 35164, 113498, 144628, -2563, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 848, 35169, 113497, 144658, -2563, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 849, 35169, 113496, 144688, -2562, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 850, 35169, 113362, 145102, -2564, 48048, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 851, 35169, 113332, 145105, -2565, 48048, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 852, 35164, 113303, 145103, -2564, 48048, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 853, 35169, 113273, 145104, -2564, 48048, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 854, 35169, 113243, 145105, -2563, 48048, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 855, 35168, 113568, 145369, -2667, 16328, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 856, 35163, 113602, 145370, -2667, 16328, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 857, 35168, 113643, 145374, -2666, 16328, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 858, 35167, 113568, 145348, -2656, 16328, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 859, 35167, 113602, 145349, -2657, 16328, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 860, 35167, 113643, 145353, -2656, 16328, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 861, 35166, 113568, 145330, -2642, 16328, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 862, 35166, 113602, 145331, -2643, 16328, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 863, 35166, 113643, 145335, -2642, 16328, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 864, 35165, 113609, 145002, -2565, 39060, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 865, 35169, 113566, 144799, -2565, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 866, 35164, 113564, 144859, -2565, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 867, 35169, 113562, 144918, -2564, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 868, 35169, 113500, 144569, -2563, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 869, 35169, 113501, 144599, -2564, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 870, 35164, 113498, 144628, -2563, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 871, 35169, 113497, 144658, -2563, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 872, 35169, 113362, 145102, -2564, 48048, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 873, 35164, 113303, 145103, -2564, 48048, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 874, 35169, 113243, 145105, -2563, 48048, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 875, 35166, 115587, 144952, -2560, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 876, 35168, 115612, 144969, -2561, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 877, 35166, 115638, 144993, -2560, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 878, 35168, 115661, 145012, -2560, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 879, 35166, 115679, 145027, -2559, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 880, 35168, 115705, 145049, -2561, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 881, 35166, 115730, 145066, -2561, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 882, 35168, 115751, 145086, -2561, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 883, 35166, 115762, 145110, -2562, 33460, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 884, 35168, 115743, 145135, -2561, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 885, 35166, 115719, 145153, -2561, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 886, 35168, 115699, 145166, -2560, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 887, 35166, 115672, 145185, -2562, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 888, 35168, 115648, 145204, -2563, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 889, 35166, 115618, 145223, -2562, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 890, 35168, 115593, 145240, -2562, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 891, 35166, 115574, 145253, -2561, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 892, 35167, 115607, 144937, -2562, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 893, 35169, 115631, 144955, -2563, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 894, 35167, 115657, 144979, -2562, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 895, 35169, 115681, 144998, -2562, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 896, 35167, 115699, 145013, -2561, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 897, 35169, 115725, 145034, -2563, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 898, 35167, 115749, 145052, -2563, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 899, 35169, 115770, 145071, -2563, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 900, 35167, 115781, 145096, -2564, 33460, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 901, 35169, 115780, 145124, -2561, 33460, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 902, 35167, 115761, 145149, -2560, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 903, 35169, 115737, 145167, -2560, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 904, 35167, 115717, 145180, -2559, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 905, 35169, 115690, 145199, -2561, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 906, 35167, 115666, 145218, -2562, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 907, 35169, 115636, 145237, -2561, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 908, 35167, 115611, 145254, -2561, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 909, 35169, 115592, 145267, -2560, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 910, 35169, 115712, 144909, -2560, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 911, 35169, 115735, 144928, -2560, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 912, 35169, 115753, 144943, -2559, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 913, 35169, 115779, 144965, -2561, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 914, 35169, 115804, 144982, -2562, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 915, 35169, 115770, 145210, -2556, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 916, 35169, 115750, 145223, -2555, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 917, 35169, 115723, 145243, -2557, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 918, 35169, 115699, 145261, -2558, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 919, 35169, 115669, 145280, -2557, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 920, 35165, 115846, 145241, -2558, 32004, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 921, 35164, 115846, 145275, -2559, 32004, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 922, 35164, 115849, 144996, -2559, 32004, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 923, 35165, 115848, 145019, -2559, 32004, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 924, 35169, 115574, 144944, -2557, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 925, 35155, 115628, 144935, -2560, 22704, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 926, 35155, 115719, 145016, -2560, 22704, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 927, 35155, 115710, 145201, -2560, 22704, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 928, 35155, 115607, 145273, -2560, 22704, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 929, 35156, 117718, 145250, -2627, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 930, 35156, 117719, 145287, -2627, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 931, 35156, 117719, 145320, -2627, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 932, 35156, 117720, 145358, -2627, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 933, 35156, 117720, 145395, -2626, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 934, 35156, 117721, 145433, -2626, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 935, 35156, 117721, 145465, -2626, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 936, 35156, 117722, 145503, -2626, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 937, 35153, 117684, 145250, -2628, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 938, 35153, 117685, 145288, -2628, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 939, 35153, 117685, 145321, -2628, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 940, 35153, 117686, 145358, -2628, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 941, 35153, 117686, 145396, -2627, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 942, 35153, 117687, 145433, -2627, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 943, 35153, 117687, 145466, -2627, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 944, 35153, 117688, 145503, -2627, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 945, 35155, 117646, 145252, -2629, 32728, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 946, 35155, 117647, 145290, -2629, 32728, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 947, 35150, 117647, 145322, -2629, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 948, 35155, 117648, 145360, -2629, 32728, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 949, 35155, 117648, 145397, -2628, 32728, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 950, 35150, 117649, 145435, -2628, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 951, 35155, 117649, 145467, -2628, 32728, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 952, 35155, 117650, 145505, -2628, 32728, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 953, 35156, 117712, 144690, -2623, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 954, 35156, 117712, 144728, -2623, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 955, 35156, 117712, 144760, -2623, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 956, 35156, 117713, 144798, -2623, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 957, 35156, 117714, 144835, -2622, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 958, 35156, 117714, 144873, -2622, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 959, 35156, 117715, 144906, -2622, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 960, 35156, 117715, 144943, -2622, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 961, 35153, 117677, 144691, -2624, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 962, 35153, 117678, 144729, -2624, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 963, 35153, 117678, 144761, -2624, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 964, 35153, 117679, 144799, -2624, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 965, 35153, 117680, 144836, -2623, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 966, 35153, 117680, 144874, -2623, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 967, 35153, 117680, 144906, -2623, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 968, 35153, 117681, 144944, -2623, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 969, 35155, 117640, 144692, -2625, 32728, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 970, 35155, 117641, 144730, -2625, 32728, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 971, 35150, 117641, 144763, -2625, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 972, 35155, 117642, 144800, -2625, 32728, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 973, 35155, 117642, 144838, -2624, 32728, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 974, 35150, 117643, 144875, -2624, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 975, 35155, 117643, 144908, -2624, 32728, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 976, 35155, 117644, 144945, -2624, 32728, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 977, 35152, 117877, 144770, -2622, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 978, 35152, 117877, 144854, -2621, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 979, 35152, 117878, 144933, -2621, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 980, 35152, 117878, 145008, -2621, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 981, 35152, 117878, 145185, -2618, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 982, 35152, 117878, 145268, -2618, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 983, 35152, 117879, 145348, -2618, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 984, 35152, 117879, 145422, -2618, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 985, 35168, 116752, 145610, -2400, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 986, 35163, 116752, 145584, -2400, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 987, 35168, 116752, 145556, -2399, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 988, 35167, 116774, 145610, -2404, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 989, 35167, 116774, 145583, -2404, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 990, 35167, 116774, 145556, -2403, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 991, 35166, 116799, 145609, -2402, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 992, 35166, 116799, 145582, -2402, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 993, 35166, 116798, 145555, -2401, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 994, 35165, 116876, 145669, -2402, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 995, 35165, 116876, 145643, -2402, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 996, 35165, 116876, 145615, -2401, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 997, 35169, 117449, 145414, -2405, 49076, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 998, 35169, 117486, 145415, -2405, 49076, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 999, 35164, 117523, 145415, -2404, 49076, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1000, 35169, 117559, 145416, -2404, 49076, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1001, 35169, 117595, 145416, -2404, 49076, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1002, 35164, 117633, 145417, -2404, 49076, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1003, 35169, 117664, 145417, -2403, 49076, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1004, 35169, 117701, 145418, -2403, 49076, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1005, 35164, 117736, 145419, -2403, 49076, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1006, 35169, 117773, 145419, -2403, 49076, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1007, 35169, 117810, 145419, -2403, 49076, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1008, 35168, 116686, 144635, -2400, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1009, 35163, 116686, 144609, -2400, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1010, 35168, 116689, 144566, -2399, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1011, 35167, 116708, 144635, -2404, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1012, 35167, 116708, 144608, -2404, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1013, 35167, 116708, 144581, -2403, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1014, 35166, 116733, 144634, -2402, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1015, 35166, 116733, 144607, -2402, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1016, 35166, 116732, 144580, -2401, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1017, 35165, 116974, 144673, -2402, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1018, 35165, 116974, 144647, -2402, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1019, 35165, 116974, 144619, -2401, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1020, 35169, 117804, 144781, -2405, 16000, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1021, 35169, 117768, 144782, -2405, 16000, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1022, 35164, 117731, 144783, -2404, 16000, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1023, 35169, 117695, 144783, -2404, 16000, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1024, 35169, 117659, 144783, -2404, 16000, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1025, 35164, 117621, 144784, -2404, 16000, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1026, 35169, 117590, 144784, -2403, 16000, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1027, 35169, 117553, 144785, -2403, 16000, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1028, 35164, 117518, 144785, -2403, 16000, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1029, 35169, 117481, 144786, -2403, 16000, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1030, 35169, 117444, 144787, -2403, 16000, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1031, 35169, 112740, 145089, -2440, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1032, 35169, 112671, 145088, -2400, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1033, 35169, 112612, 145089, -2440, 40960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1034, 35169, 112585, 145136, -2440, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1035, 35169, 112582, 145181, -2440, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1036, 35169, 112582, 145219, -2440, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1037, 35169, 112582, 145259, -2440, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1038, 35169, 112730, 144624, -2440, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1039, 35169, 112683, 144620, -2440, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1040, 35169, 112612, 144628, -2440, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1041, 35169, 112582, 144589, -2440, 24576, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1042, 35169, 112577, 144541, -2440, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1043, 35169, 112577, 144503, -2440, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1044, 35169, 112583, 144464, -2440, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1045, 35164, 112697, 145089, -2440, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1046, 35164, 112636, 145090, -2440, 24576, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1047, 35164, 112705, 144621, -2440, 40960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1048, 35164, 112652, 144627, -2440, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1049, 35165, 112659, 145168, -2440, 24576, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1050, 35165, 112659, 144553, -2440, 40960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1051, 35169, 112751, 145105, -2440, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1052, 35169, 112639, 145105, -2440, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1053, 35169, 112580, 145152, -2440, 40960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1054, 35169, 112566, 145219, -2440, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1055, 35169, 112712, 144620, -2440, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1056, 35169, 112632, 144621, -2440, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1057, 35169, 112575, 144575, -2440, 24576, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1058, 35169, 112563, 144503, -2440, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1059, 35164, 112671, 144620, -2439, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1060, 35164, 112600, 144609, -2439, 24576, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1061, 35164, 112603, 145115, -2439, 40960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1062, 35164, 112687, 145105, -2440, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1063, 35165, 112602, 144521, -2440, 24576, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1064, 35165, 112610, 145211, -2440, 40960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1065, 35156, 114502, 145033, -2567, 32768, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1066, 35156, 114502, 145161, -2567, 32768, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1067, 35156, 114502, 145224, -2567, 32768, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1068, 35156, 114502, 144969, -2567, 32768, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1069, 35156, 114502, 144838, -2567, 32768, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1070, 35156, 114502, 144710, -2567, 32768, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1071, 35156, 114502, 145352, -2567, 32768, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1072, 35156, 114502, 145481, -2567, 32768, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1073, 35151, 114502, 144905, -2567, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1074, 35151, 114502, 145288, -2567, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1075, 35151, 114502, 145545, -2567, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1076, 35151, 114502, 144646, -2567, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1077, 35152, 114502, 145097, -2567, 32768, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1078, 35152, 114502, 145416, -2567, 32768, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1079, 35152, 114502, 144774, -2567, 32768, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1080, 35155, 114352, 144649, -2567, 32768, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1081, 35155, 114352, 144713, -2567, 32768, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1082, 35155, 114352, 145545, -2567, 32768, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1083, 35155, 114352, 145481, -2567, 32768, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1084, 35150, 114352, 145097, -2567, 32768, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1085, 35155, 114352, 144777, -2567, 32768, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1086, 35155, 114352, 144841, -2567, 32768, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1087, 35155, 114352, 144905, -2567, 32768, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1088, 35155, 114352, 144969, -2567, 32768, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1089, 35150, 114352, 145033, -2567, 32768, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1090, 35150, 114352, 145160, -2567, 32768, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1091, 35155, 114352, 145224, -2567, 32768, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1092, 35155, 114352, 145288, -2567, 32768, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1093, 35155, 114352, 145352, -2567, 32768, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1094, 35155, 114352, 145416, -2567, 32768, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1095, 35169, 115255, 145329, -2258, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1096, 35169, 115133, 145328, -2258, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1097, 35169, 115072, 145383, -2258, 40960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1098, 35169, 115053, 145408, -2258, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1099, 35169, 115052, 145447, -2258, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1100, 35169, 115052, 145483, -2258, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1101, 35169, 115212, 145329, -2258, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1102, 35164, 115097, 145357, -2258, 40960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1103, 35164, 115173, 145329, -2257, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1104, 35165, 115118, 145431, -2259, 40960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1105, 35169, 115261, 144876, -2260, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1106, 35169, 115221, 144876, -2258, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1107, 35169, 115136, 144876, -2259, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1108, 35169, 115071, 144818, -2258, 24576, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1109, 35169, 115051, 144791, -2257, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1110, 35169, 115052, 144751, -2258, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1111, 35169, 115051, 144712, -2258, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1112, 35164, 115177, 144876, -2256, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1113, 35164, 115107, 144854, -2259, 24576, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1114, 35165, 115125, 144774, -2256, 24576, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1115, 35169, 115382, 144989, -2567, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1116, 35169, 115382, 145020, -2567, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1117, 35169, 115382, 145051, -2567, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1118, 35169, 115382, 145083, -2567, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1119, 35169, 115382, 145114, -2567, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1120, 35169, 115382, 145146, -2567, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1121, 35169, 115382, 145177, -2567, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1122, 35164, 115382, 145209, -2567, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1123, 35164, 115362, 144989, -2567, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1124, 35165, 115362, 145020, -2567, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1125, 35169, 115362, 145051, -2567, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1126, 35169, 115362, 145083, -2567, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1127, 35169, 115362, 145114, -2567, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1128, 35169, 115362, 145146, -2567, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1129, 35169, 115362, 145177, -2567, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1130, 35169, 115362, 145209, -2567, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1131, 35169, 114269, 146661, -2443, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1132, 35169, 114320, 146661, -2443, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1133, 35169, 114370, 146661, -2443, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1134, 35169, 114420, 146661, -2443, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1135, 35165, 114470, 146661, -2443, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1136, 35169, 114520, 146661, -2443, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1137, 35169, 114570, 146661, -2443, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1138, 35169, 114620, 146661, -2443, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1139, 35169, 114670, 146661, -2443, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1140, 35164, 114720, 146661, -2443, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1141, 35169, 114770, 146661, -2443, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1142, 35169, 114820, 146661, -2443, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1143, 35169, 114269, 143259, -2443, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1144, 35169, 114320, 143259, -2443, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1145, 35169, 114370, 143259, -2443, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1146, 35169, 114420, 143259, -2443, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1147, 35165, 114470, 143259, -2443, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1148, 35169, 114520, 143259, -2443, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1149, 35169, 114570, 143259, -2443, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1150, 35169, 114620, 143259, -2443, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1151, 35169, 114670, 143259, -2443, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1152, 35164, 114720, 143259, -2443, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1153, 35169, 114770, 143259, -2443, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (3, 1154, 35169, 114820, 143259, -2443, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1155, 35211, 78891, 36844, -2553, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1156, 35211, 78891, 36872, -2553, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1157, 35211, 78891, 36900, -2553, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1158, 35211, 78891, 36928, -2553, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1159, 35211, 78891, 36956, -2553, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1160, 35211, 78891, 36984, -2553, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1161, 35211, 78891, 37012, -2553, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1162, 35211, 78891, 37040, -2553, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1163, 35211, 78891, 37068, -2553, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1164, 35209, 78871, 36844, -2553, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1165, 35208, 78871, 36872, -2553, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1166, 35209, 78871, 36900, -2553, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1167, 35208, 78871, 36928, -2553, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1168, 35209, 78871, 36956, -2553, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1169, 35208, 78871, 36984, -2553, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1170, 35209, 78871, 37012, -2553, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1171, 35208, 78871, 37040, -2553, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1172, 35209, 78871, 37068, -2553, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1173, 35210, 78851, 36844, -2553, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1174, 35210, 78851, 36872, -2553, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1175, 35210, 78851, 36900, -2553, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1176, 35210, 78851, 36928, -2553, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1177, 35205, 78851, 36956, -2553, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1178, 35210, 78851, 36984, -2553, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1179, 35210, 78851, 37012, -2553, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1180, 35210, 78851, 37040, -2553, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1181, 35210, 78851, 37068, -2553, 31992, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1182, 35210, 79269, 36701, -2543, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1183, 35210, 79300, 36702, -2542, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1184, 35205, 79330, 36702, -2542, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1185, 35210, 79360, 36702, -2541, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1186, 35210, 79391, 36701, -2542, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1187, 35210, 79420, 36703, -2541, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1188, 35205, 79450, 36703, -2541, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1189, 35210, 79480, 36703, -2540, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1190, 35210, 79511, 36702, -2541, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1191, 35209, 79287, 36676, -2561, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1192, 35209, 79317, 36676, -2561, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1193, 35208, 79348, 36676, -2560, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1194, 35209, 79378, 36675, -2561, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1195, 35209, 79408, 36677, -2560, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1196, 35208, 79438, 36677, -2560, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1197, 35209, 79467, 36678, -2559, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1198, 35209, 79499, 36677, -2560, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1199, 35211, 79271, 36655, -2565, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1200, 35211, 79301, 36656, -2565, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1201, 35211, 79331, 36656, -2564, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1202, 35211, 79362, 36657, -2564, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1203, 35211, 79392, 36655, -2564, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1204, 35211, 79422, 36657, -2563, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1205, 35211, 79452, 36657, -2563, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1206, 35211, 79481, 36658, -2562, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1207, 35211, 79513, 36657, -2563, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1208, 35211, 79289, 36509, -2566, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1209, 35211, 79319, 36509, -2565, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1210, 35211, 79350, 36509, -2565, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1211, 35211, 79380, 36510, -2564, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1212, 35211, 79410, 36509, -2564, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1213, 35211, 79440, 36511, -2564, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1214, 35211, 79470, 36512, -2563, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1215, 35211, 79500, 36512, -2563, 15696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1216, 35207, 79620, 36408, -2557, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1217, 35207, 79621, 36438, -2558, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1218, 35197, 79502, 36646, -2541, 15696, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1219, 35197, 79438, 36645, -2541, 15696, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1220, 35197, 79349, 36645, -2541, 15696, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1221, 35197, 79289, 36648, -2541, 15696, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1222, 35211, 79642, 36894, -2292, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1223, 35211, 79643, 36924, -2293, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1224, 35206, 79640, 36954, -2292, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1225, 35211, 79639, 36984, -2292, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1226, 35211, 79638, 37013, -2291, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1227, 35211, 79576, 36664, -2290, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1228, 35211, 79577, 36694, -2291, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1229, 35206, 79574, 36723, -2290, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1230, 35211, 79573, 36753, -2290, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1231, 35211, 79572, 36783, -2289, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1232, 35211, 79438, 37197, -2291, 48048, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1233, 35211, 79408, 37200, -2292, 48048, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1234, 35206, 79379, 37198, -2291, 48048, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1235, 35211, 79349, 37199, -2291, 48048, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1236, 35211, 79319, 37200, -2290, 48048, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1237, 35210, 79644, 37464, -2394, 16328, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1238, 35205, 79678, 37465, -2394, 16328, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1239, 35210, 79719, 37469, -2393, 16328, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1240, 35209, 79644, 37443, -2383, 16328, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1241, 35209, 79678, 37444, -2384, 16328, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1242, 35209, 79719, 37448, -2383, 16328, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1243, 35208, 79644, 37425, -2369, 16328, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1244, 35208, 79678, 37426, -2370, 16328, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1245, 35208, 79719, 37430, -2369, 16328, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1246, 35207, 79685, 37097, -2292, 39060, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1247, 35211, 79642, 36894, -2292, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1248, 35206, 79640, 36954, -2292, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1249, 35211, 79638, 37013, -2291, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1250, 35211, 79576, 36664, -2290, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1251, 35211, 79577, 36694, -2291, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1252, 35206, 79574, 36723, -2290, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1253, 35211, 79573, 36753, -2290, 32284, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1254, 35211, 79438, 37197, -2291, 48048, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1255, 35206, 79379, 37198, -2291, 48048, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1256, 35211, 79319, 37200, -2290, 48048, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1257, 35208, 81663, 37047, -2287, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1258, 35210, 81688, 37064, -2288, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1259, 35208, 81714, 37088, -2287, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1260, 35210, 81737, 37107, -2287, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1261, 35208, 81755, 37122, -2286, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1262, 35210, 81781, 37144, -2288, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1263, 35208, 81806, 37161, -2288, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1264, 35210, 81827, 37181, -2288, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1265, 35208, 81838, 37205, -2289, 33460, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1266, 35210, 81819, 37230, -2288, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1267, 35208, 81795, 37248, -2288, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1268, 35210, 81775, 37261, -2287, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1269, 35208, 81748, 37280, -2289, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1270, 35210, 81724, 37299, -2290, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1271, 35208, 81694, 37318, -2289, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1272, 35210, 81669, 37335, -2289, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1273, 35208, 81650, 37348, -2288, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1274, 35209, 81683, 37032, -2289, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1275, 35211, 81707, 37050, -2290, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1276, 35209, 81733, 37074, -2289, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1277, 35211, 81757, 37093, -2289, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1278, 35209, 81775, 37108, -2288, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1279, 35211, 81801, 37129, -2290, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1280, 35209, 81825, 37147, -2290, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1281, 35211, 81846, 37166, -2290, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1282, 35209, 81857, 37191, -2291, 33460, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1283, 35211, 81856, 37219, -2288, 33460, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1284, 35209, 81837, 37244, -2287, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1285, 35211, 81813, 37262, -2287, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1286, 35209, 81793, 37275, -2286, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1287, 35211, 81766, 37294, -2288, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1288, 35209, 81742, 37313, -2289, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1289, 35211, 81712, 37332, -2288, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1290, 35209, 81687, 37349, -2288, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1291, 35211, 81668, 37362, -2287, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1292, 35211, 81788, 37004, -2287, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1293, 35211, 81811, 37023, -2287, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1294, 35211, 81829, 37038, -2286, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1295, 35211, 81855, 37060, -2288, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1296, 35211, 81880, 37077, -2289, 22704, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1297, 35211, 81846, 37305, -2283, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1298, 35211, 81826, 37318, -2282, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1299, 35211, 81799, 37338, -2284, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1300, 35211, 81775, 37356, -2285, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1301, 35211, 81745, 37375, -2284, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1302, 35207, 81922, 37336, -2285, 32004, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1303, 35206, 81922, 37370, -2286, 32004, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1304, 35206, 81925, 37091, -2286, 32004, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1305, 35207, 81924, 37114, -2286, 32004, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1306, 35211, 81650, 37039, -2284, 41952, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1307, 35197, 81704, 37030, -2287, 22704, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1308, 35197, 81795, 37111, -2287, 22704, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1309, 35197, 81786, 37296, -2287, 22704, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1310, 35197, 81683, 37368, -2287, 22704, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1311, 35198, 83794, 37345, -2354, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1312, 35198, 83795, 37382, -2354, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1313, 35198, 83795, 37415, -2354, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1314, 35198, 83796, 37453, -2354, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1315, 35198, 83796, 37490, -2353, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1316, 35198, 83797, 37528, -2353, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1317, 35198, 83797, 37560, -2353, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1318, 35198, 83798, 37598, -2353, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1319, 35195, 83760, 37345, -2355, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1320, 35195, 83761, 37383, -2355, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1321, 35195, 83761, 37416, -2355, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1322, 35195, 83762, 37453, -2355, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1323, 35195, 83762, 37491, -2354, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1324, 35195, 83763, 37528, -2354, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1325, 35195, 83763, 37561, -2354, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1326, 35195, 83764, 37598, -2354, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1327, 35197, 83722, 37347, -2356, 32728, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1328, 35197, 83723, 37385, -2356, 32728, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1329, 35192, 83723, 37417, -2356, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1330, 35197, 83724, 37455, -2356, 32728, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1331, 35197, 83724, 37492, -2355, 32728, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1332, 35192, 83725, 37530, -2355, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1333, 35197, 83725, 37562, -2355, 32728, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1334, 35197, 83726, 37600, -2355, 32728, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1335, 35198, 83788, 36785, -2350, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1336, 35198, 83788, 36823, -2350, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1337, 35198, 83788, 36855, -2350, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1338, 35198, 83789, 36893, -2350, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1339, 35198, 83790, 36930, -2349, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1340, 35198, 83790, 36968, -2349, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1341, 35198, 83791, 37001, -2349, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1342, 35198, 83791, 37038, -2349, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1343, 35195, 83753, 36786, -2351, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1344, 35195, 83754, 36824, -2351, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1345, 35195, 83754, 36856, -2351, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1346, 35195, 83755, 36894, -2351, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1347, 35195, 83756, 36931, -2350, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1348, 35195, 83756, 36969, -2350, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1349, 35195, 83756, 37001, -2350, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1350, 35195, 83757, 37039, -2350, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1351, 35197, 83716, 36787, -2352, 32728, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1352, 35197, 83717, 36825, -2352, 32728, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1353, 35192, 83717, 36858, -2352, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1354, 35197, 83718, 36895, -2352, 32728, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1355, 35197, 83718, 36933, -2351, 32728, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1356, 35192, 83719, 36970, -2351, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1357, 35197, 83719, 37003, -2351, 32728, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1358, 35197, 83720, 37040, -2351, 32728, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1359, 35194, 83953, 36865, -2349, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1360, 35194, 83953, 36949, -2348, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1361, 35194, 83954, 37028, -2348, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1362, 35194, 83954, 37103, -2348, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1363, 35194, 83954, 37280, -2345, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1364, 35194, 83954, 37363, -2345, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1365, 35194, 83955, 37443, -2345, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1366, 35194, 83955, 37517, -2345, 32728, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1367, 35210, 82828, 37705, -2127, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1368, 35205, 82828, 37679, -2127, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1369, 35210, 82828, 37651, -2126, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1370, 35209, 82850, 37705, -2131, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1371, 35209, 82850, 37678, -2131, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1372, 35209, 82850, 37651, -2130, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1373, 35208, 82875, 37704, -2129, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1374, 35208, 82875, 37677, -2129, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1375, 35208, 82874, 37650, -2128, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1376, 35207, 82952, 37764, -2129, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1377, 35207, 82952, 37738, -2129, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1378, 35207, 82952, 37710, -2128, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1379, 35211, 83525, 37509, -2132, 49076, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1380, 35211, 83562, 37510, -2132, 49076, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1381, 35206, 83599, 37510, -2131, 49076, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1382, 35211, 83635, 37511, -2131, 49076, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1383, 35211, 83671, 37511, -2131, 49076, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1384, 35206, 83709, 37512, -2131, 49076, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1385, 35211, 83740, 37512, -2130, 49076, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1386, 35211, 83777, 37513, -2130, 49076, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1387, 35206, 83812, 37514, -2130, 49076, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1388, 35211, 83849, 37514, -2130, 49076, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1389, 35211, 83886, 37514, -2130, 49076, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1390, 35210, 82762, 36730, -2127, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1391, 35205, 82762, 36704, -2127, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1392, 35210, 82765, 36661, -2126, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1393, 35209, 82784, 36730, -2131, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1394, 35209, 82784, 36703, -2131, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1395, 35209, 82784, 36676, -2130, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1396, 35208, 82809, 36729, -2129, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1397, 35208, 82809, 36702, -2129, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1398, 35208, 82808, 36675, -2128, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1399, 35207, 83050, 36768, -2129, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1400, 35207, 83050, 36742, -2129, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1401, 35207, 83050, 36714, -2128, 32472, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1402, 35211, 83880, 36876, -2132, 16000, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1403, 35211, 83844, 36877, -2132, 16000, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1404, 35206, 83807, 36878, -2131, 16000, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1405, 35211, 83771, 36878, -2131, 16000, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1406, 35211, 83735, 36878, -2131, 16000, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1407, 35206, 83697, 36879, -2131, 16000, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1408, 35211, 83666, 36879, -2130, 16000, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1409, 35211, 83629, 36880, -2130, 16000, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1410, 35206, 83594, 36880, -2130, 16000, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1411, 35211, 83557, 36881, -2130, 16000, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1412, 35211, 83520, 36882, -2130, 16000, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1413, 35211, 78822, 37198, -2168, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1414, 35211, 78759, 37185, -2168, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1415, 35211, 78697, 37187, -2168, 40960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1416, 35211, 78657, 37233, -2168, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1417, 35211, 78656, 37278, -2168, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1418, 35211, 78657, 37310, -2168, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1419, 35211, 78659, 37348, -2168, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1420, 35211, 78820, 36711, -2168, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1421, 35211, 78755, 36710, -2168, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1422, 35211, 78689, 36718, -2168, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1423, 35211, 78660, 36672, -2168, 24576, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1424, 35211, 78656, 36620, -2168, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1425, 35211, 78653, 36580, -2168, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1426, 35211, 78655, 36537, -2168, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1427, 35206, 78783, 37187, -2168, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1428, 35206, 78734, 37184, -2168, 24576, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1429, 35206, 78785, 36711, -2168, 40960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1430, 35206, 78728, 36709, -2168, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1431, 35207, 78728, 37265, -2168, 24576, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1432, 35207, 78741, 36649, -2168, 40960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1433, 35211, 78822, 37198, -2168, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1434, 35211, 78759, 37185, -2168, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1435, 35211, 78697, 37187, -2168, 40960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1436, 35211, 78657, 37233, -2168, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1437, 35211, 78820, 36711, -2168, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1438, 35211, 78755, 36710, -2168, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1439, 35211, 78689, 36718, -2168, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1440, 35211, 78660, 36672, -2168, 24576, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1441, 35206, 78783, 37187, -2168, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1442, 35206, 78734, 37184, -2168, 24576, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1443, 35206, 78785, 36711, -2168, 40960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1444, 35206, 78728, 36709, -2168, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1445, 35207, 78728, 37265, -2168, 24576, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1446, 35207, 78741, 36649, -2168, 40960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1447, 35198, 80578, 37128, -2294, 32768, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1448, 35198, 80578, 37256, -2294, 32768, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1449, 35198, 80578, 37319, -2294, 32768, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1450, 35198, 80578, 37064, -2294, 32768, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1451, 35198, 80578, 36933, -2294, 32768, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1452, 35198, 80578, 36805, -2294, 32768, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1453, 35198, 80578, 37447, -2294, 32768, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1454, 35198, 80578, 37576, -2294, 32768, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1455, 35193, 80578, 37000, -2294, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1456, 35193, 80578, 37383, -2294, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1457, 35193, 80578, 37640, -2294, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1458, 35193, 80578, 36741, -2294, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1459, 35194, 80578, 37192, -2294, 32768, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1460, 35194, 80578, 37511, -2294, 32768, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1461, 35194, 80578, 36869, -2294, 32768, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1462, 35197, 80428, 36744, -2294, 32768, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1463, 35197, 80428, 36808, -2294, 32768, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1464, 35197, 80428, 37640, -2294, 32768, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1465, 35197, 80428, 37576, -2294, 32768, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1466, 35192, 80428, 37192, -2294, 32768, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1467, 35197, 80428, 36872, -2294, 32768, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1468, 35197, 80428, 36936, -2294, 32768, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1469, 35197, 80428, 37000, -2294, 32768, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1470, 35197, 80428, 37064, -2294, 32768, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1471, 35192, 80428, 37128, -2294, 32768, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1472, 35192, 80428, 37255, -2294, 32768, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1473, 35197, 80428, 37319, -2294, 32768, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1474, 35197, 80428, 37383, -2294, 32768, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1475, 35197, 80428, 37447, -2294, 32768, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1476, 35197, 80428, 37511, -2294, 32768, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1477, 35211, 81331, 37424, -1985, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1478, 35211, 81209, 37423, -1985, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1479, 35211, 81148, 37478, -1985, 40960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1480, 35211, 81129, 37503, -1985, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1481, 35211, 81128, 37542, -1985, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1482, 35211, 81128, 37578, -1985, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1483, 35211, 81288, 37424, -1985, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1484, 35206, 81173, 37452, -1985, 40960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1485, 35206, 81249, 37424, -1984, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1486, 35207, 81194, 37526, -1986, 40960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1487, 35211, 81337, 36971, -1987, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1488, 35211, 81297, 36971, -1985, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1489, 35211, 81212, 36971, -1986, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1490, 35211, 81147, 36913, -1985, 24576, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1491, 35211, 81127, 36886, -1984, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1492, 35211, 81128, 36846, -1985, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1493, 35211, 81127, 36807, -1985, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1494, 35206, 81253, 36971, -1983, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1495, 35206, 81183, 36949, -1986, 24576, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1496, 35207, 81201, 36869, -1983, 24576, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1497, 35211, 81458, 37084, -2294, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1498, 35211, 81458, 37115, -2294, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1499, 35211, 81458, 37146, -2294, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1500, 35211, 81458, 37178, -2294, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1501, 35211, 81458, 37209, -2294, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1502, 35211, 81458, 37241, -2294, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1503, 35211, 81458, 37272, -2294, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1504, 35206, 81458, 37304, -2294, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1505, 35206, 81438, 37084, -2294, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1506, 35207, 81438, 37115, -2294, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1507, 35211, 81438, 37146, -2294, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1508, 35211, 81438, 37178, -2294, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1509, 35211, 81438, 37209, -2294, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1510, 35211, 81438, 37241, -2294, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1511, 35211, 81438, 37272, -2294, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1512, 35211, 81438, 37304, -2294, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1513, 35211, 80345, 38756, -2170, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1514, 35211, 80396, 38756, -2170, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1515, 35211, 80446, 38756, -2170, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1516, 35211, 80496, 38756, -2170, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1517, 35207, 80546, 38756, -2170, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1518, 35211, 80596, 38756, -2170, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1519, 35211, 80646, 38756, -2170, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1520, 35211, 80696, 38756, -2170, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1521, 35211, 80746, 38756, -2170, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1522, 35206, 80796, 38756, -2170, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1523, 35211, 80846, 38756, -2170, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1524, 35211, 80896, 38756, -2170, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1525, 35211, 80345, 35354, -2170, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1526, 35211, 80396, 35354, -2170, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1527, 35211, 80446, 35354, -2170, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1528, 35211, 80496, 35354, -2170, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1529, 35207, 80546, 35354, -2170, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1530, 35211, 80596, 35354, -2170, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1531, 35211, 80646, 35354, -2170, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1532, 35211, 80696, 35354, -2170, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1533, 35211, 80746, 35354, -2170, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1534, 35206, 80796, 35354, -2170, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1535, 35211, 80846, 35354, -2170, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (4, 1536, 35211, 80896, 35354, -2170, 16384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1537, 35250, 147290, 8527, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1538, 35250, 147356, 8527, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1539, 35250, 147423, 8527, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1540, 35250, 147490, 8527, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1541, 35250, 147556, 8527, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1542, 35254, 147290, 8547, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1543, 35254, 147323, 8547, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1544, 35254, 147356, 8547, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1545, 35254, 147390, 8547, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1546, 35254, 147423, 8547, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1547, 35254, 147456, 8547, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1548, 35254, 147490, 8547, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1549, 35254, 147523, 8547, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1550, 35254, 147556, 8547, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1551, 35254, 147590, 8547, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1552, 35254, 147290, 8567, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1553, 35252, 147323, 8567, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1554, 35251, 147356, 8567, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1555, 35252, 147390, 8567, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1556, 35251, 147423, 8567, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1557, 35252, 147456, 8567, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1558, 35251, 147490, 8567, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1559, 35252, 147523, 8567, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1560, 35251, 147556, 8567, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1561, 35252, 147590, 8567, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1562, 35251, 147290, 8587, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1563, 35253, 147323, 8587, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1564, 35253, 147356, 8587, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1565, 35253, 147390, 8587, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1566, 35253, 147423, 8587, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1567, 35248, 147456, 8587, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1568, 35253, 147490, 8587, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1569, 35253, 147523, 8587, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1570, 35253, 147556, 8587, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1571, 35253, 147590, 8587, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1572, 35254, 148185, 8527, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1573, 35254, 148185, 8567, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1574, 35254, 148185, 8608, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1575, 35254, 148185, 8649, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1576, 35254, 148185, 8689, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1577, 35254, 148185, 8730, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1578, 35254, 148185, 8771, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1579, 35254, 148185, 8811, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1580, 35254, 148185, 8852, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1581, 35254, 148185, 8893, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1582, 35254, 148185, 8933, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1583, 35254, 148185, 8974, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1584, 35254, 148185, 9015, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1585, 35254, 148185, 9055, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1586, 35254, 148185, 9096, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1587, 35254, 148185, 9137, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1588, 35254, 148185, 9177, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1589, 35254, 148185, 9218, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1590, 35254, 148185, 9259, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1591, 35254, 148185, 9300, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1592, 35249, 148231, 8724, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1593, 35249, 148231, 8839, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1594, 35249, 148231, 8954, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1595, 35249, 148231, 9069, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1596, 35249, 148231, 8954, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1597, 35249, 148231, 9069, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1598, 35250, 148261, 8621, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1599, 35250, 148261, 8757, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1600, 35250, 148261, 8894, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1601, 35250, 148261, 9030, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1602, 35250, 148261, 9167, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1603, 35254, 147984, 8486, -212, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1604, 35254, 147955, 8486, -212, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1605, 35254, 147927, 8486, -212, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1606, 35254, 147896, 8485, -212, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1607, 35254, 147865, 8485, -212, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1608, 35254, 147835, 8485, -212, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1609, 35254, 147983, 8467, -212, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1610, 35249, 147954, 8467, -212, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1611, 35250, 147925, 8467, -212, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1612, 35249, 147895, 8466, -212, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1613, 35250, 147864, 8466, -212, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1614, 35249, 147833, 8466, -212, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1615, 35254, 147064, 8489, -212, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1616, 35254, 147035, 8489, -212, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1617, 35254, 147007, 8489, -212, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1618, 35254, 146976, 8488, -212, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1619, 35254, 146945, 8488, -212, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1620, 35254, 146915, 8488, -212, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1621, 35254, 147065, 8466, -212, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1622, 35249, 147036, 8466, -212, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1623, 35250, 147007, 8466, -212, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1624, 35249, 146977, 8465, -212, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1625, 35250, 146946, 8465, -212, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1626, 35249, 146915, 8465, -212, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1627, 35252, 149105, 6657, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1628, 35252, 149142, 6657, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1629, 35252, 149180, 6657, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1630, 35252, 149217, 6657, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1631, 35252, 149255, 6657, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1632, 35252, 149292, 6657, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1633, 35252, 149330, 6657, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1634, 35254, 149105, 6637, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1635, 35254, 149142, 6637, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1636, 35254, 149180, 6637, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1637, 35254, 149217, 6637, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1638, 35254, 149255, 6637, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1639, 35254, 149292, 6637, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1640, 35254, 149330, 6637, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1641, 35254, 149105, 6617, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1642, 35249, 149142, 6617, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1643, 35254, 149180, 6617, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1644, 35249, 149217, 6617, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1645, 35254, 149255, 6617, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1646, 35249, 149292, 6617, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1647, 35254, 149330, 6617, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1648, 35252, 145569, 6657, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1649, 35252, 145606, 6657, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1650, 35252, 145644, 6657, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1651, 35252, 145682, 6657, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1652, 35252, 145719, 6657, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1653, 35252, 145757, 6657, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1654, 35252, 145795, 6657, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1655, 35254, 145569, 6637, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1656, 35254, 145606, 6637, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1657, 35254, 145644, 6637, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1658, 35254, 145682, 6637, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1659, 35254, 145719, 6637, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1660, 35254, 145757, 6637, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1661, 35254, 145795, 6637, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1662, 35254, 145569, 6617, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1663, 35249, 145606, 6617, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1664, 35254, 145644, 6617, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1665, 35249, 145682, 6617, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1666, 35254, 145719, 6617, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1667, 35249, 145757, 6617, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1668, 35254, 145795, 6617, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1669, 35239, 145762, 7588, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1670, 35239, 146067, 7588, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1671, 35239, 146372, 7588, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1672, 35239, 146678, 7588, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1673, 35239, 146983, 7588, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1674, 35251, 147288, 7588, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1675, 35239, 147594, 7588, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1676, 35239, 147899, 7588, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1677, 35251, 148204, 7588, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1678, 35239, 148510, 7588, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1679, 35239, 148815, 7588, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1680, 35239, 149121, 7588, -470, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1681, 35250, 149083, 4965, -20, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1682, 35254, 149082, 4926, -20, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1683, 35254, 149081, 4886, -20, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1684, 35254, 149081, 4843, -20, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1685, 35254, 149057, 4810, -20, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1686, 35254, 149034, 4790, -20, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1687, 35254, 149008, 4773, -20, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1688, 35254, 148980, 4766, -20, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1689, 35249, 148951, 4766, -20, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1690, 35254, 148921, 4766, -20, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1691, 35250, 149006, 4835, -20, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1692, 35250, 149056, 4219, -20, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1693, 35254, 149080, 4252, -20, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1694, 35254, 149080, 4295, -20, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1695, 35254, 149081, 4335, -20, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1696, 35254, 149082, 4374, -20, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1697, 35254, 149038, 4416, -20, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1698, 35254, 149011, 4439, -20, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1699, 35254, 148984, 4449, -20, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1700, 35249, 148955, 4450, -20, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1701, 35254, 148922, 4451, -20, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1702, 35250, 149006, 4362, -20, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1703, 35250, 145831, 4252, -20, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1704, 35254, 145909, 4440, -20, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1705, 35254, 145883, 4421, -20, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1706, 35254, 145833, 4374, -20, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1707, 35254, 145833, 4335, -20, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1708, 35254, 145832, 4295, -20, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1709, 35254, 145852, 4404, -20, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1710, 35254, 145936, 4450, -20, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1711, 35249, 145966, 4450, -20, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1712, 35254, 145995, 4449, -20, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1713, 35250, 145926, 4377, -20, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1714, 35250, 145836, 4968, -20, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1715, 35254, 145836, 4929, -20, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1716, 35254, 145835, 4889, -20, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1717, 35254, 145834, 4846, -20, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1718, 35254, 145853, 4815, -20, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1719, 35254, 145874, 4797, -20, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1720, 35254, 145901, 4774, -20, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1721, 35254, 145989, 4766, -20, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1722, 35249, 145958, 4767, -20, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1723, 35254, 145928, 4767, -20, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1724, 35250, 145921, 4829, -20, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1725, 35254, 147146, 5459, -340, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1726, 35254, 147196, 5459, -340, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1727, 35254, 147247, 5459, -340, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1728, 35254, 147298, 5459, -340, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1729, 35254, 147349, 5459, -340, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1730, 35254, 147400, 5459, -340, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1731, 35254, 147451, 5459, -340, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1732, 35254, 147501, 5459, -340, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1733, 35254, 147552, 5459, -340, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1734, 35254, 147603, 5459, -340, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1735, 35254, 147654, 5459, -340, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1736, 35254, 147705, 5459, -340, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1737, 35254, 147756, 5459, -340, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1738, 35250, 147554, 5354, -340, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1739, 35250, 147352, 5354, -340, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1740, 35249, 147560, 5754, -340, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1741, 35249, 147356, 5754, -340, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1742, 35250, 147457, 5754, -340, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1743, 35252, 147556, 5857, -400, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1744, 35252, 147522, 5857, -400, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1745, 35252, 147488, 5857, -400, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1746, 35252, 147455, 5857, -400, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1747, 35252, 147421, 5857, -400, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1748, 35252, 147387, 5857, -400, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1749, 35252, 147353, 5857, -400, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1750, 35252, 147320, 5857, -400, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1751, 35252, 147455, 3221, -400, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1752, 35252, 147334, 5827, -400, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1753, 35252, 147367, 5827, -400, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1754, 35252, 147401, 5827, -400, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1755, 35252, 147435, 5827, -400, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1756, 35252, 147468, 5827, -400, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1757, 35252, 147502, 5827, -400, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1758, 35252, 147536, 5827, -400, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1759, 35252, 147570, 5827, -400, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1760, 35252, 147590, 5857, -400, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1761, 35252, 148161, 1600, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1762, 35252, 148199, 1600, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1763, 35252, 148161, 1620, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1764, 35252, 148199, 1620, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1765, 35252, 148161, 1640, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1766, 35252, 148199, 1640, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1767, 35252, 148161, 1660, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1768, 35252, 148199, 1660, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1769, 35252, 148161, 1680, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1770, 35252, 148199, 1680, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1771, 35254, 148161, 1700, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1772, 35254, 148199, 1700, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1773, 35254, 148161, 1720, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1774, 35254, 148199, 1720, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1775, 35252, 146750, 1600, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1776, 35252, 146707, 1600, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1777, 35252, 146750, 1620, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1778, 35252, 146707, 1620, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1779, 35252, 146750, 1640, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1780, 35252, 146707, 1640, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1781, 35252, 146750, 1660, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1782, 35252, 146707, 1660, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1783, 35252, 146750, 1680, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1784, 35252, 146707, 1680, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1785, 35254, 146750, 1700, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1786, 35254, 146707, 1700, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1787, 35254, 146750, 1720, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1788, 35254, 146707, 1720, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1789, 35254, 146818, 1300, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1790, 35254, 146861, 1300, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1791, 35254, 146905, 1300, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1792, 35254, 146949, 1300, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1793, 35254, 146993, 1300, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1794, 35254, 147037, 1300, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1795, 35254, 147351, 1300, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1796, 35254, 147393, 1300, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1797, 35254, 147435, 1300, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1798, 35254, 147477, 1300, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1799, 35254, 147519, 1300, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1800, 35254, 147561, 1300, -150, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1801, 35249, 147461, 1245, -150, 16391, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1802, 35249, 146933, 1245, -150, 16392, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1803, 35250, 147441, 1245, -150, 16391, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1804, 35250, 146953, 1245, -150, 16392, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1805, 35234, 147468, 1671, -338, 16389, 200, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1806, 35250, 147428, 1671, -338, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1807, 35251, 147508, 1671, -338, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1808, 35252, 147482, 1933, -468, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1809, 35252, 147449, 1933, -468, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1810, 35254, 147740, 2020, -450, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1811, 35254, 147690, 2020, -450, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1812, 35254, 147641, 2020, -450, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1813, 35254, 147592, 2020, -450, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1814, 35254, 147542, 2020, -450, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1815, 35254, 147493, 2020, -450, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1816, 35254, 147444, 2020, -450, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1817, 35254, 147395, 2020, -450, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1818, 35254, 147345, 2020, -450, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1819, 35254, 147296, 2020, -450, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1820, 35254, 147247, 2020, -450, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1821, 35254, 147198, 2020, -450, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1822, 35254, 147740, 2040, -450, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1823, 35254, 147690, 2040, -450, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1824, 35254, 147641, 2040, -450, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1825, 35254, 147592, 2040, -450, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1826, 35254, 147542, 2040, -450, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1827, 35254, 147493, 2040, -450, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1828, 35254, 147444, 2040, -450, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1829, 35254, 147395, 2040, -450, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1830, 35254, 147345, 2040, -450, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1831, 35254, 147296, 2040, -450, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1832, 35254, 147247, 2040, -450, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1833, 35254, 147198, 2040, -450, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1834, 35240, 147740, 2060, -450, 16389, 200, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1835, 35240, 147690, 2060, -450, 16389, 200, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1836, 35240, 147641, 2060, -450, 16389, 200, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1837, 35240, 147592, 2060, -450, 16389, 200, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1838, 35240, 147542, 2060, -450, 16389, 200, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1839, 35240, 147493, 2060, -450, 16389, 200, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1840, 35240, 147444, 2060, -450, 16389, 200, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1841, 35240, 147395, 2060, -450, 16389, 200, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1842, 35240, 147345, 2060, -450, 16389, 200, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1843, 35240, 147296, 2060, -450, 16389, 200, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1844, 35240, 147247, 2060, -450, 16389, 200, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1845, 35240, 147198, 2060, -450, 16389, 200, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1846, 35240, 147740, 2080, -450, 16389, 200, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1847, 35240, 147690, 2080, -450, 16389, 200, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1848, 35240, 147641, 2080, -450, 16389, 200, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1849, 35240, 147592, 2080, -450, 16389, 200, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1850, 35240, 147542, 2080, -450, 16389, 200, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1851, 35240, 147493, 2080, -450, 16389, 200, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1852, 35240, 147444, 2080, -450, 16389, 200, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1853, 35240, 147395, 2080, -450, 16389, 200, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1854, 35240, 147345, 2080, -450, 16389, 200, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1855, 35240, 147296, 2080, -450, 16389, 200, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1856, 35240, 147247, 2080, -450, 16389, 200, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1857, 35240, 147198, 2080, -450, 16389, 200, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1858, 35250, 148404, 5289, -21, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1859, 35249, 148404, 5309, -21, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1860, 35250, 148404, 5328, -21, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1861, 35249, 148404, 5348, -21, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1862, 35250, 148404, 5368, -21, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1863, 35254, 148424, 5289, -21, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1864, 35254, 148424, 5309, -21, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1865, 35254, 148424, 5328, -21, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1866, 35254, 148424, 5348, -21, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1867, 35254, 148424, 5368, -21, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1868, 35254, 148444, 5289, -21, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1869, 35254, 148444, 5309, -21, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1870, 35254, 148444, 5328, -21, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1871, 35254, 148444, 5348, -21, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1872, 35254, 148444, 5368, -21, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1873, 35240, 148464, 5289, -21, 0, 200, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1874, 35240, 148464, 5309, -21, 0, 200, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1875, 35240, 148464, 5328, -21, 0, 200, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1876, 35240, 148464, 5348, -21, 0, 200, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1877, 35240, 148464, 5368, -21, 0, 200, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1878, 35250, 146520, 5289, -21, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1879, 35249, 146520, 5308, -21, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1880, 35250, 146520, 5328, -21, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1881, 35249, 146520, 5348, -21, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1882, 35250, 146520, 5368, -21, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1883, 35254, 146500, 5289, -21, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1884, 35254, 146500, 5308, -21, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1885, 35254, 146500, 5328, -21, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1886, 35254, 146500, 5348, -21, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1887, 35254, 146500, 5368, -21, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1888, 35254, 146480, 5289, -21, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1889, 35254, 146480, 5308, -21, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1890, 35254, 146480, 5328, -21, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1891, 35254, 146480, 5348, -21, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1892, 35254, 146480, 5368, -21, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1893, 35240, 146460, 5289, -21, 32768, 200, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1894, 35240, 146460, 5308, -21, 32768, 200, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1895, 35240, 146460, 5328, -21, 32768, 200, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1896, 35240, 146460, 5348, -21, 32768, 200, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1897, 35240, 146460, 5368, -21, 32768, 200, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1898, 35254, 149936, 5168, -80, 8192, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1899, 35254, 149893, 5230, -80, 8192, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1900, 35254, 149851, 5293, -80, 8192, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1901, 35254, 149809, 5355, -80, 8192, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1902, 35254, 149767, 5418, -80, 8192, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1903, 35254, 149725, 5480, -80, 8192, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1904, 35254, 149682, 5543, -80, 8192, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1905, 35254, 149640, 5605, -80, 8192, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1906, 35254, 149598, 5668, -80, 8192, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1907, 35254, 149556, 5730, -80, 8192, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1908, 35254, 149514, 5793, -80, 8192, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1909, 35254, 149472, 5856, -80, 8192, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1910, 35254, 144976, 5136, -80, 8192, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1911, 35254, 145015, 5197, -80, 8192, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1912, 35254, 145054, 5258, -80, 8192, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1913, 35254, 145093, 5319, -80, 8192, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1914, 35254, 145133, 5380, -80, 8192, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1915, 35254, 145172, 5441, -80, 8192, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1916, 35254, 145211, 5502, -80, 8192, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1917, 35254, 145250, 5563, -80, 8192, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1918, 35254, 145290, 5624, -80, 8192, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1919, 35254, 145329, 5685, -80, 8192, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1920, 35254, 145368, 5746, -80, 8192, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1921, 35254, 145408, 5808, -80, 8192, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1922, 35254, 148185, 8527, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1923, 35254, 148185, 8567, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1924, 35254, 148185, 8649, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1925, 35254, 148185, 8689, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1926, 35254, 148185, 8771, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1927, 35254, 148185, 8811, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1928, 35254, 148185, 8893, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1929, 35254, 148185, 8933, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1930, 35254, 148185, 9015, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1931, 35254, 148185, 9055, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1932, 35254, 148185, 9137, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1933, 35254, 148185, 9177, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1934, 35254, 148185, 9259, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1935, 35254, 148185, 9300, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1936, 35249, 148231, 8724, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1937, 35249, 148231, 8839, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1938, 35249, 148231, 9069, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1939, 35249, 148231, 8954, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1940, 35250, 148261, 8621, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1941, 35250, 148261, 8894, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (5, 1942, 35250, 148261, 9167, -212, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1943, 35301, 116371, 245422, -1049, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1944, 35301, 116343, 245422, -1049, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1945, 35301, 116315, 245422, -1049, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1946, 35301, 116287, 245422, -1049, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1947, 35301, 116259, 245422, -1049, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1948, 35301, 116231, 245422, -1049, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1949, 35301, 116203, 245422, -1049, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1950, 35301, 116175, 245422, -1049, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1951, 35301, 116147, 245422, -1049, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1952, 35299, 116371, 245402, -1049, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1953, 35298, 116343, 245402, -1049, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1954, 35299, 116315, 245402, -1049, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1955, 35298, 116287, 245402, -1049, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1956, 35299, 116259, 245402, -1049, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1957, 35298, 116231, 245402, -1049, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1958, 35299, 116203, 245402, -1049, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1959, 35298, 116175, 245402, -1049, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1960, 35299, 116147, 245402, -1049, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1961, 35300, 116371, 245382, -1049, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1962, 35300, 116343, 245382, -1049, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1963, 35300, 116315, 245382, -1049, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1964, 35300, 116287, 245382, -1049, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1965, 35295, 116259, 245382, -1049, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1966, 35300, 116231, 245382, -1049, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1967, 35300, 116203, 245382, -1049, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1968, 35300, 116175, 245382, -1049, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1969, 35300, 116147, 245382, -1049, 48376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1970, 35300, 116514, 245800, -1039, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1971, 35300, 116513, 245831, -1038, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1972, 35295, 116513, 245861, -1038, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1973, 35300, 116513, 245891, -1037, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1974, 35300, 116514, 245922, -1038, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1975, 35300, 116512, 245951, -1037, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1976, 35295, 116512, 245981, -1037, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1977, 35300, 116512, 246011, -1036, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1978, 35300, 116513, 246042, -1037, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1979, 35299, 116539, 245818, -1057, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1980, 35299, 116539, 245848, -1057, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1981, 35298, 116539, 245879, -1056, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1982, 35299, 116540, 245909, -1057, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1983, 35299, 116538, 245939, -1056, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1984, 35298, 116538, 245969, -1056, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1985, 35299, 116537, 245998, -1055, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1986, 35299, 116538, 246030, -1056, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1987, 35301, 116560, 245802, -1061, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1988, 35301, 116559, 245832, -1061, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1989, 35301, 116559, 245862, -1060, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1990, 35301, 116558, 245893, -1060, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1991, 35301, 116560, 245923, -1060, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1992, 35301, 116558, 245953, -1059, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1993, 35301, 116558, 245983, -1059, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1994, 35301, 116557, 246012, -1058, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1995, 35301, 116558, 246044, -1059, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1996, 35301, 116706, 245820, -1062, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1997, 35301, 116706, 245850, -1061, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1998, 35301, 116706, 245881, -1061, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 1999, 35301, 116705, 245911, -1060, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2000, 35301, 116706, 245941, -1060, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2001, 35301, 116704, 245971, -1060, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2002, 35301, 116703, 246001, -1059, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2003, 35301, 116703, 246031, -1059, 32080, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2004, 35297, 116807, 246151, -1053, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2005, 35297, 116777, 246152, -1054, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2006, 35287, 116569, 246033, -1037, 32080, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2007, 35287, 116570, 245969, -1037, 32080, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2008, 35287, 116570, 245880, -1037, 32080, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2009, 35287, 116567, 245820, -1037, 32080, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2010, 35301, 116321, 246173, -788, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2011, 35301, 116291, 246174, -789, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2012, 35296, 116261, 246171, -788, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2013, 35301, 116231, 246170, -788, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2014, 35301, 116202, 246169, -787, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2015, 35301, 116551, 246107, -786, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2016, 35301, 116521, 246108, -787, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2017, 35296, 116492, 246105, -786, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2018, 35301, 116462, 246104, -786, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2019, 35301, 116432, 246103, -785, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2020, 35301, 116018, 245969, -787, 64432, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2021, 35301, 116015, 245939, -788, 64432, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2022, 35296, 116017, 245910, -787, 64432, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2023, 35301, 116016, 245880, -787, 64432, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2024, 35301, 116015, 245850, -786, 64432, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2025, 35300, 115751, 246175, -890, 32712, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2026, 35295, 115750, 246209, -890, 32712, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2027, 35300, 115746, 246250, -889, 32712, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2028, 35299, 115772, 246175, -879, 32712, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2029, 35299, 115771, 246209, -880, 32712, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2030, 35299, 115767, 246250, -879, 32712, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2031, 35298, 115790, 246175, -865, 32712, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2032, 35298, 115789, 246209, -866, 32712, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2033, 35298, 115785, 246250, -865, 32712, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2034, 35297, 116118, 246216, -788, 55444, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2035, 35301, 116321, 246173, -788, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2036, 35296, 116261, 246171, -788, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2037, 35301, 116202, 246169, -787, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2038, 35301, 116551, 246107, -786, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2039, 35301, 116521, 246108, -787, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2040, 35296, 116492, 246105, -786, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2041, 35301, 116462, 246104, -786, 48668, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2042, 35301, 116018, 245969, -787, 64432, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2043, 35296, 116017, 245910, -787, 64432, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2044, 35301, 116015, 245850, -786, 64432, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2045, 35298, 116168, 248194, -783, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2046, 35300, 116151, 248219, -784, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2047, 35298, 116127, 248245, -783, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2048, 35300, 116108, 248268, -783, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2049, 35298, 116093, 248286, -782, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2050, 35300, 116071, 248312, -784, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2051, 35298, 116054, 248337, -784, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2052, 35300, 116034, 248358, -784, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2053, 35298, 116010, 248369, -785, 49844, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2054, 35300, 115985, 248350, -784, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2055, 35298, 115967, 248326, -784, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2056, 35300, 115954, 248306, -783, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2057, 35298, 115935, 248279, -785, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2058, 35300, 115916, 248255, -786, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2059, 35298, 115897, 248225, -785, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2060, 35300, 115880, 248200, -785, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2061, 35298, 115867, 248181, -784, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2062, 35299, 116183, 248214, -785, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2063, 35301, 116165, 248238, -786, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2064, 35299, 116141, 248264, -785, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2065, 35301, 116122, 248288, -785, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2066, 35299, 116107, 248306, -784, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2067, 35301, 116086, 248332, -786, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2068, 35299, 116068, 248356, -786, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2069, 35301, 116049, 248377, -786, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2070, 35299, 116024, 248388, -787, 49844, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2071, 35301, 115996, 248387, -784, 49844, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2072, 35299, 115971, 248368, -783, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2073, 35301, 115953, 248344, -783, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2074, 35299, 115940, 248324, -782, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2075, 35301, 115921, 248297, -784, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2076, 35299, 115902, 248273, -785, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2077, 35301, 115883, 248243, -784, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2078, 35299, 115866, 248218, -784, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2079, 35301, 115853, 248199, -783, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2080, 35301, 116211, 248319, -783, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2081, 35301, 116192, 248342, -783, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2082, 35301, 116177, 248360, -782, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2083, 35301, 116155, 248386, -784, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2084, 35301, 116138, 248411, -785, 39088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2085, 35301, 115910, 248377, -779, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2086, 35301, 115897, 248357, -778, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2087, 35301, 115877, 248330, -780, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2088, 35301, 115859, 248306, -781, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2089, 35301, 115840, 248276, -780, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2090, 35297, 115879, 248453, -781, 48388, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2091, 35296, 115845, 248453, -782, 48388, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2092, 35296, 116124, 248456, -782, 48388, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2093, 35297, 116101, 248455, -782, 48388, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2094, 35301, 116176, 248181, -780, 58336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2095, 35287, 116185, 248235, -783, 39088, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2096, 35287, 116104, 248326, -783, 39088, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2097, 35287, 115919, 248317, -783, 39088, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2098, 35287, 115847, 248214, -783, 39088, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2099, 35280, 116084, 250339, -845, 49112, 300, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2100, 35281, 115972, 250342, -844, 49112, 180, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2101, 35288, 115870, 250325, -850, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2102, 35288, 115833, 250326, -850, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2103, 35288, 115800, 250326, -850, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2104, 35288, 115762, 250327, -850, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2105, 35288, 115725, 250327, -849, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2106, 35288, 115687, 250328, -849, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2107, 35288, 115655, 250328, -849, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2108, 35288, 115617, 250329, -849, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2109, 35285, 115870, 250291, -851, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2110, 35285, 115832, 250292, -851, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2111, 35285, 115799, 250292, -851, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2112, 35285, 115762, 250293, -851, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2113, 35285, 115724, 250293, -850, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2114, 35285, 115687, 250294, -850, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2115, 35285, 115654, 250294, -850, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2116, 35285, 115617, 250295, -850, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2117, 35287, 115868, 250253, -852, 49112, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2118, 35287, 115830, 250254, -852, 49112, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2119, 35282, 115798, 250254, -852, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2120, 35287, 115760, 250255, -852, 49112, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2121, 35287, 115723, 250255, -851, 49112, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2122, 35282, 115685, 250256, -851, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2123, 35287, 115653, 250256, -851, 49112, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2124, 35287, 115615, 250257, -851, 49112, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2125, 35288, 116430, 250319, -846, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2126, 35288, 116392, 250319, -846, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2127, 35288, 116360, 250319, -846, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2128, 35288, 116322, 250320, -846, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2129, 35288, 116285, 250321, -845, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2130, 35288, 116247, 250321, -845, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2131, 35288, 116214, 250322, -845, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2132, 35288, 116177, 250322, -845, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2133, 35285, 116429, 250284, -847, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2134, 35285, 116391, 250285, -847, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2135, 35285, 116359, 250285, -847, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2136, 35285, 116321, 250286, -847, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2137, 35285, 116284, 250287, -846, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2138, 35285, 116246, 250287, -846, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2139, 35285, 116214, 250287, -846, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2140, 35285, 116176, 250288, -846, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2141, 35287, 116428, 250247, -848, 49112, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2142, 35287, 116390, 250248, -848, 49112, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2143, 35282, 116357, 250248, -848, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2144, 35287, 116320, 250249, -848, 49112, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2145, 35287, 116282, 250249, -847, 49112, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2146, 35282, 116245, 250250, -847, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2147, 35287, 116212, 250250, -847, 49112, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2148, 35287, 116175, 250251, -847, 49112, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2149, 35284, 116350, 250484, -845, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2150, 35284, 116266, 250484, -844, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2151, 35284, 116187, 250485, -844, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2152, 35284, 116112, 250485, -844, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2153, 35284, 115935, 250485, -841, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2154, 35284, 115852, 250485, -841, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2155, 35284, 115772, 250486, -841, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2156, 35284, 115698, 250486, -841, 49112, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2157, 35300, 115510, 249359, -623, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2158, 35295, 115536, 249359, -623, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2159, 35300, 115564, 249359, -622, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2160, 35299, 115510, 249381, -627, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2161, 35299, 115537, 249381, -627, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2162, 35299, 115564, 249381, -626, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2163, 35298, 115511, 249406, -625, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2164, 35298, 115538, 249406, -625, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2165, 35298, 115565, 249405, -624, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2166, 35297, 115451, 249483, -625, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2167, 35297, 115477, 249483, -625, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2168, 35297, 115505, 249483, -624, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2169, 35301, 115706, 250056, -628, 65460, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2170, 35301, 115705, 250093, -628, 65460, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2171, 35296, 115705, 250130, -627, 65460, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2172, 35301, 115704, 250166, -627, 65460, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2173, 35301, 115704, 250202, -627, 65460, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2174, 35296, 115703, 250240, -627, 65460, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2175, 35301, 115703, 250271, -626, 65460, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2176, 35301, 115702, 250308, -626, 65460, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2177, 35296, 115701, 250343, -626, 65460, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2178, 35301, 115701, 250380, -626, 65460, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2179, 35301, 115701, 250417, -626, 65460, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2180, 35300, 116485, 249293, -623, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2181, 35295, 116511, 249293, -623, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2182, 35300, 116554, 249296, -622, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2183, 35299, 116485, 249315, -627, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2184, 35299, 116512, 249315, -627, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2185, 35299, 116539, 249315, -626, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2186, 35298, 116486, 249340, -625, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2187, 35298, 116513, 249340, -625, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2188, 35298, 116540, 249339, -624, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2189, 35297, 116447, 249581, -625, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2190, 35297, 116473, 249581, -625, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2191, 35297, 116501, 249581, -624, 48856, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2192, 35301, 116339, 250411, -628, 32384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2193, 35301, 116338, 250375, -628, 32384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2194, 35296, 116337, 250338, -627, 32384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2195, 35301, 116337, 250302, -627, 32384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2196, 35301, 116337, 250266, -627, 32384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2197, 35296, 116336, 250228, -627, 32384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2198, 35301, 116336, 250197, -626, 32384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2199, 35301, 116335, 250160, -626, 32384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2200, 35296, 116335, 250125, -626, 32384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2201, 35301, 116334, 250088, -626, 32384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2202, 35301, 116333, 250051, -626, 32384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2203, 35301, 116032, 245348, -672, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2204, 35301, 116032, 245277, -672, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2205, 35301, 116015, 245210, -672, 57344, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2206, 35301, 115984, 245185, -672, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2207, 35301, 115946, 245185, -672, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2208, 35301, 115910, 245185, -672, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2209, 35301, 115872, 245185, -672, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2210, 35301, 116491, 245349, -672, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2211, 35301, 116491, 245280, -672, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2212, 35301, 116512, 245216, -672, 40960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2213, 35301, 116544, 245185, -672, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2214, 35301, 116579, 245185, -672, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2215, 35301, 116614, 245185, -672, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2216, 35301, 116650, 245185, -672, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2217, 35296, 116032, 245315, -672, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2218, 35296, 116032, 245240, -672, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2219, 35296, 116491, 245312, -672, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2220, 35296, 116491, 245242, -672, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2221, 35297, 115968, 245248, -672, 57344, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2222, 35297, 116544, 245248, -672, 40960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2223, 35301, 116015, 245358, -663, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2224, 35301, 116015, 245246, -663, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2225, 35301, 115968, 245187, -663, 57344, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2226, 35301, 115901, 245173, -663, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2227, 35301, 116500, 245319, -663, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2228, 35301, 116499, 245239, -663, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2229, 35301, 116545, 245182, -663, 40960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2230, 35301, 116617, 245170, -663, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2231, 35296, 116500, 245278, -662, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2232, 35296, 116511, 245207, -662, 40960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2233, 35296, 116005, 245210, -662, 57344, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2234, 35296, 116015, 245294, -663, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2235, 35297, 116599, 245209, -663, 40960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2236, 35297, 115909, 245217, -663, 57344, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2237, 35288, 116087, 247109, -790, 49152, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2238, 35288, 115959, 247109, -790, 49152, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2239, 35288, 115896, 247109, -790, 49152, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2240, 35288, 116151, 247109, -790, 49152, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2241, 35288, 116282, 247109, -790, 49152, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2242, 35288, 116410, 247109, -790, 49152, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2243, 35288, 115768, 247109, -790, 49152, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2244, 35288, 115639, 247109, -790, 49152, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2245, 35283, 116215, 247109, -790, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2246, 35283, 115832, 247109, -790, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2247, 35283, 115575, 247109, -790, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2248, 35283, 116474, 247109, -790, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2249, 35284, 116023, 247109, -790, 49152, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2250, 35284, 115704, 247109, -790, 49152, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2251, 35284, 116346, 247109, -790, 49152, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2252, 35287, 116471, 246959, -790, 49152, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2253, 35287, 116407, 246959, -790, 49152, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2254, 35287, 115575, 246959, -790, 49152, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2255, 35287, 115639, 246959, -790, 49152, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2256, 35282, 116023, 246959, -790, 49152, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2257, 35287, 116343, 246959, -790, 49152, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2258, 35287, 116279, 246959, -790, 49152, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2259, 35287, 116215, 246959, -790, 49152, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2260, 35287, 116151, 246959, -790, 49152, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2261, 35282, 116087, 246959, -790, 49152, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2262, 35282, 115960, 246959, -790, 49152, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2263, 35287, 115896, 246959, -790, 49152, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2264, 35287, 115832, 246959, -790, 49152, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2265, 35287, 115768, 246959, -790, 49152, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2266, 35287, 115704, 246959, -790, 49152, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2267, 35301, 115791, 247862, -481, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2268, 35301, 115792, 247740, -481, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2269, 35301, 115737, 247679, -481, 57344, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2270, 35301, 115712, 247660, -481, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2271, 35301, 115673, 247659, -481, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2272, 35301, 115637, 247659, -481, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2273, 35301, 115791, 247819, -481, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2274, 35296, 115763, 247704, -481, 57344, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2275, 35296, 115791, 247780, -480, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2276, 35297, 115689, 247725, -482, 57344, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2277, 35301, 116244, 247868, -483, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2278, 35301, 116244, 247828, -481, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2279, 35301, 116244, 247743, -482, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2280, 35301, 116302, 247678, -481, 40960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2281, 35301, 116329, 247658, -480, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2282, 35301, 116369, 247659, -481, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2283, 35301, 116408, 247658, -481, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2284, 35296, 116244, 247784, -479, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2285, 35296, 116266, 247714, -482, 40960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2286, 35297, 116346, 247732, -479, 40960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2287, 35301, 116131, 247989, -790, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2288, 35301, 116100, 247989, -790, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2289, 35301, 116069, 247989, -790, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2290, 35301, 116037, 247989, -790, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2291, 35301, 116006, 247989, -790, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2292, 35301, 115974, 247989, -790, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2293, 35301, 115943, 247989, -790, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2294, 35296, 115911, 247989, -790, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2295, 35296, 116131, 247969, -790, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2296, 35297, 116100, 247969, -790, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2297, 35301, 116069, 247969, -790, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2298, 35301, 116037, 247969, -790, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2299, 35301, 116006, 247969, -790, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2300, 35301, 115974, 247969, -790, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2301, 35301, 115943, 247969, -790, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2302, 35301, 115911, 247969, -790, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2303, 35301, 114459, 246876, -666, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2304, 35301, 114459, 246927, -666, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2305, 35301, 114459, 246977, -666, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2306, 35301, 114459, 247027, -666, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2307, 35297, 114459, 247077, -666, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2308, 35301, 114459, 247127, -666, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2309, 35301, 114459, 247177, -666, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2310, 35301, 114459, 247227, -666, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2311, 35301, 114459, 247277, -666, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2312, 35296, 114459, 247327, -666, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2313, 35301, 114459, 247377, -666, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2314, 35301, 114459, 247427, -666, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2315, 35301, 117861, 246876, -666, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2316, 35301, 117861, 246927, -666, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2317, 35301, 117861, 246977, -666, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2318, 35301, 117861, 247027, -666, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2319, 35297, 117861, 247077, -666, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2320, 35301, 117861, 247127, -666, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2321, 35301, 117861, 247177, -666, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2322, 35301, 117861, 247227, -666, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2323, 35301, 117861, 247277, -666, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2324, 35296, 117861, 247327, -666, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2325, 35301, 117861, 247377, -666, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (6, 2326, 35301, 117861, 247427, -666, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2327, 35340, 147134, -45144, -1357, 16416, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2328, 35351, 147218, -45144, -1357, 16416, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2329, 35351, 147105, -45263, -1357, 31296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2330, 35351, 147117, -45180, -1357, 31296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2331, 35340, 147111, -45221, -1357, 31296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2332, 35340, 147241, -45225, -1357, 1424, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2333, 35351, 147247, -45267, -1357, 1424, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2334, 35351, 147236, -45184, -1357, 1424, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2335, 35340, 147134, -45144, -1357, 16416, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2336, 35351, 147218, -45144, -1357, 16416, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2337, 35351, 147105, -45263, -1357, 31296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2338, 35351, 147117, -45180, -1357, 31296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2339, 35340, 147111, -45221, -1357, 31296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2340, 35340, 147241, -45225, -1357, 1424, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2341, 35351, 147247, -45267, -1357, 1424, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2342, 35351, 147236, -45184, -1357, 1424, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2343, 35351, 147714, -45140, -1357, 16416, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2344, 35340, 147797, -45140, -1357, 16416, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2345, 35351, 147684, -45258, -1357, 31296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2346, 35351, 147696, -45176, -1357, 31296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2347, 35340, 147690, -45217, -1357, 31296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2348, 35340, 147820, -45221, -1357, 1424, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2349, 35351, 147826, -45262, -1357, 1424, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2350, 35351, 147815, -45179, -1357, 1424, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2351, 35351, 147714, -45140, -1357, 16416, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2352, 35340, 147797, -45140, -1357, 16416, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2353, 35351, 147684, -45258, -1357, 31296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2354, 35351, 147696, -45176, -1357, 31296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2355, 35340, 147690, -45217, -1357, 31296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2356, 35340, 147820, -45221, -1357, 1424, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2357, 35351, 147826, -45262, -1357, 1424, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2358, 35351, 147815, -45179, -1357, 1424, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2359, 35351, 147315, -45496, -2082, 16296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2360, 35351, 147353, -45496, -2082, 16296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2361, 35351, 147391, -45496, -2082, 16296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2362, 35351, 147427, -45496, -2082, 16296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2363, 35351, 147463, -45496, -2082, 16296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2364, 35351, 147500, -45497, -2082, 16296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2365, 35351, 147537, -45497, -2082, 16296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2366, 35351, 147574, -45497, -2082, 16296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2367, 35351, 147611, -45496, -2082, 16296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2368, 35343, 147316, -45424, -2082, 16296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2369, 35343, 147352, -45425, -2082, 16296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2370, 35343, 147389, -45425, -2082, 16296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2371, 35343, 147425, -45426, -2082, 16296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2372, 35343, 147462, -45425, -2082, 16296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2373, 35343, 147500, -45424, -2082, 16296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2374, 35343, 147536, -45424, -2082, 16296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2375, 35343, 147573, -45424, -2082, 16296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2376, 35343, 147608, -45425, -2082, 16296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2377, 35339, 147461, -45371, -2082, 16296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2378, 35350, 147423, -45372, -2082, 16296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2379, 35350, 147387, -45373, -2082, 16296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2380, 35350, 147316, -45372, -2082, 16296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2381, 35350, 147350, -45372, -2082, 16296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2382, 35350, 147606, -45373, -2082, 16296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2383, 35350, 147570, -45374, -2082, 16296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2384, 35350, 147499, -45373, -2082, 16296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2385, 35350, 147533, -45373, -2082, 16296, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2386, 35350, 147465, -45619, -2082, 16352, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2387, 35350, 147426, -45619, -2082, 16352, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2388, 35350, 147390, -45619, -2082, 16352, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2389, 35350, 147356, -45620, -2082, 16352, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2390, 35350, 147320, -45620, -2082, 16352, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2391, 35350, 147609, -45619, -2082, 16352, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2392, 35350, 147573, -45619, -2082, 16352, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2393, 35350, 147539, -45619, -2082, 16352, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2394, 35350, 147503, -45620, -2082, 16352, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2395, 35343, 147464, -45674, -2082, 16352, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2396, 35343, 147429, -45674, -2082, 16352, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2397, 35343, 147394, -45674, -2082, 16352, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2398, 35343, 147359, -45674, -2082, 16352, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2399, 35343, 147320, -45675, -2082, 16352, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2400, 35343, 147610, -45675, -2082, 16352, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2401, 35343, 147575, -45675, -2082, 16352, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2402, 35343, 147539, -45676, -2082, 16352, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2403, 35343, 147501, -45675, -2082, 16352, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2404, 35350, 147167, -45677, -2082, -64, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2405, 35350, 147159, -45707, -2082, -64, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2406, 35350, 147167, -45735, -2082, -64, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2407, 35350, 147158, -45765, -2082, -48, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2408, 35339, 147167, -45795, -2082, -64, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2409, 35350, 147157, -45825, -2082, -32, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2410, 35350, 147168, -45852, -2082, -64, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2411, 35350, 147157, -45881, -2082, -64, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2412, 35350, 147168, -45910, -2082, -64, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2413, 35351, 147111, -45679, -2082, -64, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2414, 35351, 147103, -45708, -2082, -64, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2415, 35351, 147111, -45737, -2082, -64, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2416, 35351, 147102, -45766, -2082, -48, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2417, 35351, 147110, -45796, -2082, -64, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2418, 35351, 147101, -45826, -2082, -32, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2419, 35351, 147112, -45853, -2082, -64, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2420, 35351, 147100, -45883, -2082, -64, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2421, 35351, 147111, -45911, -2082, -64, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2422, 35341, 147051, -45793, -2082, -64, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2423, 35350, 147771, -45678, -2082, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2424, 35350, 147779, -45706, -2082, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2425, 35350, 147771, -45735, -2082, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2426, 35350, 147779, -45764, -2082, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2427, 35350, 147772, -45794, -2082, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2428, 35350, 147780, -45823, -2082, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2429, 35350, 147772, -45852, -2082, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2430, 35350, 147778, -45881, -2082, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2431, 35350, 147772, -45911, -2082, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2432, 35351, 147823, -45678, -2082, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2433, 35351, 147831, -45706, -2082, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2434, 35351, 147823, -45735, -2082, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2435, 35351, 147831, -45764, -2082, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2436, 35351, 147824, -45794, -2082, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2437, 35351, 147832, -45823, -2082, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2438, 35351, 147824, -45852, -2082, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2439, 35351, 147830, -45881, -2082, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2440, 35351, 147824, -45910, -2082, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2441, 35341, 147898, -45793, -2082, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2442, 35351, 146697, -45659, -1744, 18936, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2443, 35351, 146731, -45650, -1744, 18936, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2444, 35340, 146766, -45641, -1744, 18936, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2445, 35351, 146839, -45622, -1744, 18936, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2446, 35351, 146769, -45706, -1744, 52040, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2447, 35340, 146801, -45632, -1744, 18936, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2448, 35351, 146875, -45612, -1744, 18936, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2449, 35351, 146912, -45603, -1744, 18936, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2450, 35351, 146733, -45719, -1744, 52040, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2451, 35351, 146697, -45731, -1744, 52040, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2452, 35351, 146658, -45742, -1744, 52040, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2453, 35341, 146620, -45752, -1744, 52040, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2454, 35351, 146581, -45764, -1744, 52040, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2455, 35351, 146543, -45774, -1744, 52040, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2456, 35351, 146506, -45785, -1744, 52040, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2457, 35351, 148004, -45603, -1744, 13712, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2458, 35351, 148039, -45612, -1744, 13712, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2459, 35351, 148074, -45620, -1744, 13712, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2460, 35340, 148109, -45629, -1744, 13712, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2461, 35351, 148181, -45648, -1744, 13712, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2462, 35340, 148143, -45638, -1744, 13712, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2463, 35351, 148219, -45656, -1744, 13712, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2464, 35351, 148433, -45784, -1744, 46376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2465, 35351, 148395, -45776, -1744, 46376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2466, 35351, 148356, -45765, -1744, 46376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2467, 35341, 148318, -45755, -1744, 46376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2468, 35351, 148279, -45744, -1744, 46376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2469, 35351, 148241, -45733, -1744, 46376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2470, 35351, 148204, -45723, -1744, 46376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2471, 35351, 148165, -45712, -1744, 46376, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2472, 35351, 146305, -45571, -1744, 19960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2473, 35340, 146373, -45544, -1744, 19960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2474, 35351, 146400, -45568, -1744, 4744, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2475, 35340, 146419, -45600, -1744, 4744, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2476, 35351, 146435, -45633, -1744, 4352, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2477, 35351, 146317, -45678, -1744, 34888, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2478, 35340, 146310, -45642, -1744, 34496, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2479, 35351, 146302, -45605, -1744, 34496, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2480, 35351, 146305, -45571, -1744, 19960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2481, 35340, 146373, -45544, -1744, 19960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2482, 35351, 146400, -45568, -1744, 4744, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2483, 35340, 146419, -45600, -1744, 4744, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2484, 35351, 146435, -45633, -1744, 4352, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2485, 35351, 146317, -45678, -1744, 34888, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2486, 35340, 146310, -45642, -1744, 34496, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2487, 35351, 146302, -45605, -1744, 34496, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2488, 35340, 148552, -45546, -1744, 12832, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2489, 35351, 148621, -45569, -1744, 12832, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2490, 35351, 148628, -45604, -1744, -2384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2491, 35340, 148622, -45642, -1744, -2384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2492, 35351, 148613, -45677, -1744, -2776, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2493, 35351, 148493, -45638, -1744, 27760, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2494, 35340, 148511, -45605, -1744, 27368, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2495, 35351, 148528, -45571, -1744, 27368, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2496, 35340, 148552, -45546, -1744, 12832, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2497, 35351, 148621, -45569, -1744, 12832, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2498, 35351, 148628, -45604, -1744, -2384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2499, 35340, 148622, -45642, -1744, -2384, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2500, 35351, 148613, -45677, -1744, -2776, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2501, 35351, 148493, -45638, -1744, 27760, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2502, 35340, 148511, -45605, -1744, 27368, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2503, 35351, 148528, -45571, -1744, 27368, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2504, 35351, 145387, -45445, -1744, 6128, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2505, 35351, 145517, -45613, -1744, 6128, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2506, 35340, 145554, -45665, -1744, 5672, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2507, 35351, 145432, -45503, -1744, 6128, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2508, 35351, 145473, -45560, -1744, 6128, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2509, 35340, 145591, -45718, -1744, 6128, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2510, 35351, 145632, -45775, -1744, 6128, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2511, 35351, 145672, -45828, -1744, 6128, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2512, 35340, 145464, -45730, -1744, 39264, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2513, 35340, 145499, -45783, -1744, 39264, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2514, 35351, 145535, -45836, -1744, 39264, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2515, 35351, 145566, -45883, -1744, 39264, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2516, 35351, 145430, -45680, -1744, 39264, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2517, 35351, 145394, -45627, -1744, 39264, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2518, 35351, 145356, -45570, -1744, 39264, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2519, 35351, 145322, -45516, -1744, 39264, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2520, 35351, 149607, -45516, -1744, -6640, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2521, 35351, 149493, -45695, -1744, -6640, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2522, 35340, 149456, -45747, -1744, -7096, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2523, 35351, 149567, -45577, -1744, -6640, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2524, 35351, 149528, -45635, -1744, -6640, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2525, 35340, 149419, -45800, -1744, -6640, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2526, 35351, 149379, -45858, -1744, -6640, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2527, 35351, 149343, -45914, -1744, -6640, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2528, 35340, 149365, -45685, -1744, 26496, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2529, 35340, 149326, -45736, -1744, 26496, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2530, 35351, 149289, -45787, -1744, 26496, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2531, 35351, 149256, -45833, -1744, 26496, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2532, 35351, 149400, -45636, -1744, 26496, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2533, 35351, 149437, -45584, -1744, 26496, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2534, 35351, 149478, -45528, -1744, 26496, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2535, 35351, 149517, -45479, -1744, 26496, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2536, 35351, 144645, -47090, -1744, 27912, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2537, 35340, 144676, -47024, -1744, 27912, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2538, 35351, 144711, -47022, -1744, 12696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2539, 35340, 144748, -47033, -1744, 12696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2540, 35351, 144782, -47046, -1744, 12304, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2541, 35351, 144728, -47160, -1744, 42840, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2542, 35340, 144698, -47139, -1744, 42448, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2543, 35351, 144666, -47117, -1744, 42448, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2544, 35351, 144645, -47090, -1744, 27912, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2545, 35340, 144676, -47024, -1744, 27912, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2546, 35351, 144711, -47022, -1744, 12696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2547, 35340, 144748, -47033, -1744, 12696, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2548, 35351, 144782, -47046, -1744, 12304, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2549, 35351, 144728, -47160, -1744, 42840, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2550, 35340, 144698, -47139, -1744, 42448, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2551, 35351, 144666, -47117, -1744, 42448, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2552, 35340, 150254, -47023, -1744, 4736, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2553, 35351, 150288, -47087, -1744, 4736, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2554, 35351, 150268, -47117, -1744, -10480, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2555, 35340, 150238, -47139, -1744, -10480, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2556, 35351, 150206, -47159, -1744, -10872, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2557, 35351, 150148, -47047, -1744, 19664, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2558, 35340, 150184, -47036, -1744, 19272, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2559, 35351, 150220, -47023, -1744, 19272, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2560, 35340, 150254, -47023, -1744, 4736, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2561, 35351, 150288, -47087, -1744, 4736, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2562, 35351, 150268, -47117, -1744, -10480, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2563, 35340, 150238, -47139, -1744, -10480, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2564, 35351, 150206, -47159, -1744, -10872, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2565, 35351, 150148, -47047, -1744, 19664, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2566, 35340, 150184, -47036, -1744, 19272, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2567, 35351, 150220, -47023, -1744, 19272, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2568, 35351, 144383, -47805, -1744, 29552, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2569, 35340, 144403, -47735, -1744, 29552, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2570, 35351, 144439, -47728, -1744, 14336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2571, 35340, 144476, -47732, -1744, 14336, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2572, 35351, 144512, -47740, -1744, 13944, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2573, 35351, 144476, -47861, -1744, 44480, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2574, 35340, 144443, -47845, -1744, 44088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2575, 35351, 144409, -47828, -1744, 44088, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2576, 35340, 150525, -47733, -1744, 2960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2577, 35351, 150547, -47803, -1744, 2960, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2578, 35351, 150522, -47829, -1744, -12256, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2579, 35340, 150488, -47846, -1744, -12256, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2580, 35351, 150454, -47860, -1744, -12648, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2581, 35351, 150416, -47739, -1744, 17888, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2582, 35340, 150453, -47734, -1744, 17496, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2583, 35351, 150491, -47728, -1744, 17496, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2584, 35350, 145615, -48338, -2381, 32744, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2585, 35350, 145616, -48300, -2381, 32744, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2586, 35350, 145616, -48263, -2381, 32744, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2587, 35350, 145615, -48226, -2381, 32744, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2588, 35350, 145615, -48188, -2381, 32744, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2589, 35350, 145615, -48149, -2381, 32744, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2590, 35350, 145662, -48338, -2381, 32744, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2591, 35350, 145662, -48299, -2381, 32744, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2592, 35350, 145662, -48262, -2381, 32744, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2593, 35350, 145661, -48225, -2381, 32744, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2594, 35350, 145661, -48187, -2381, 32744, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2595, 35350, 145661, -48149, -2381, 32744, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2596, 35343, 145721, -48338, -2381, 32744, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2597, 35343, 145721, -48299, -2381, 32744, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2598, 35343, 145721, -48262, -2381, 32744, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2599, 35343, 145720, -48225, -2381, 32744, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2600, 35343, 145720, -48187, -2381, 32744, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2601, 35343, 145720, -48148, -2381, 32744, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2602, 35350, 149318, -48143, -2381, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2603, 35350, 149319, -48181, -2381, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2604, 35350, 149320, -48222, -2381, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2605, 35350, 149320, -48262, -2381, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2606, 35350, 149319, -48300, -2381, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2607, 35350, 149319, -48341, -2381, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2608, 35350, 149274, -48144, -2381, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2609, 35350, 149274, -48182, -2381, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2610, 35350, 149275, -48223, -2381, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2611, 35350, 149275, -48263, -2381, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2612, 35350, 149274, -48301, -2381, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2613, 35350, 149274, -48342, -2381, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2614, 35343, 149178, -48139, -2381, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2615, 35343, 149178, -48178, -2381, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2616, 35343, 149179, -48218, -2381, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2617, 35343, 149180, -48258, -2381, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2618, 35343, 149179, -48296, -2381, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2619, 35343, 149178, -48338, -2381, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2620, 35343, 145886, -47792, -1604, 28152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2621, 35343, 145900, -47763, -1604, 28152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2622, 35343, 145872, -47822, -1604, 28152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2623, 35343, 145914, -47734, -1604, 28152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2624, 35343, 145866, -47780, -1604, 28152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2625, 35343, 145880, -47751, -1604, 28152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2626, 35343, 145852, -47809, -1604, 28152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2627, 35343, 145894, -47721, -1604, 28152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2628, 35350, 145778, -47743, -1604, 28152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2629, 35350, 145793, -47713, -1604, 28152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2630, 35339, 145805, -47736, -1604, 28152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2631, 35350, 145828, -47693, -1604, 28152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2632, 35350, 145787, -47781, -1604, 28152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2633, 35343, 145846, -47771, -1604, 28152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2634, 35343, 145860, -47742, -1604, 28152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2635, 35343, 145831, -47800, -1604, 28152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2636, 35343, 145873, -47712, -1604, 28152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2637, 35343, 149027, -47763, -1604, 4672, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2638, 35343, 149042, -47793, -1604, 4672, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2639, 35343, 149014, -47733, -1604, 4672, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2640, 35343, 149056, -47821, -1604, 4672, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2641, 35343, 149050, -47756, -1604, 4672, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2642, 35343, 149064, -47785, -1604, 4672, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2643, 35343, 149036, -47726, -1604, 4672, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2644, 35343, 149078, -47814, -1604, 4672, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2645, 35350, 149134, -47710, -1604, 4672, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2646, 35350, 149148, -47741, -1604, 4672, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2647, 35339, 149123, -47736, -1604, 4672, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2648, 35350, 149141, -47780, -1604, 4672, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2649, 35350, 149099, -47693, -1604, 4672, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2650, 35343, 149070, -47745, -1604, 4672, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2651, 35343, 149084, -47774, -1604, 4672, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2652, 35343, 149056, -47715, -1604, 4672, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2653, 35343, 149098, -47803, -1604, 4672, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2654, 35351, 145995, -47693, -1608, 28128, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2655, 35351, 146011, -47662, -1608, 28128, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2656, 35351, 146019, -47707, -1608, 28128, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2657, 35351, 146036, -47676, -1608, 28128, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2658, 35351, 146047, -47721, -1608, 28128, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2659, 35340, 146064, -47690, -1608, 28128, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2660, 35351, 145876, -47941, -1608, 28128, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2661, 35351, 145893, -47910, -1608, 28128, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2662, 35351, 145896, -47950, -1608, 28128, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2663, 35351, 145913, -47918, -1608, 28128, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2664, 35340, 145921, -47961, -1608, 28128, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2665, 35351, 145938, -47930, -1608, 28128, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2666, 35340, 145949, -47972, -1608, 28128, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2667, 35351, 145966, -47941, -1608, 28128, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2668, 35351, 146077, -47736, -1608, 28128, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2669, 35340, 146093, -47705, -1608, 28128, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2670, 35341, 146082, -47657, -1608, 28128, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2671, 35341, 145905, -48000, -1608, 28128, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2672, 35351, 149033, -47903, -1608, 4424, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2673, 35351, 149047, -47934, -1608, 4424, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2674, 35351, 149002, -47915, -1608, 4424, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2675, 35351, 149016, -47947, -1608, 4424, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2676, 35351, 148977, -47927, -1608, 4424, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2677, 35340, 148960, -47977, -1608, 4424, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2678, 35351, 148913, -47956, -1608, 4424, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2679, 35340, 148929, -47988, -1608, 4424, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2680, 35351, 148923, -47672, -1608, 4424, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2681, 35351, 148937, -47700, -1608, 4424, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2682, 35351, 148900, -47682, -1608, 4424, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2683, 35351, 148915, -47712, -1608, 4424, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2684, 35351, 148868, -47694, -1608, 4424, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2685, 35351, 148882, -47725, -1608, 4424, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2686, 35340, 148831, -47711, -1608, 4424, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2687, 35340, 148788, -47729, -1608, 4424, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2688, 35341, 148974, -48007, -1608, 4424, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2689, 35341, 148815, -47680, -1608, 4424, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2690, 35351, 146467, -47149, -1608, 21928, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2691, 35351, 146648, -47035, -1608, 21928, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2692, 35351, 146585, -47075, -1608, 21928, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2693, 35351, 146527, -47110, -1608, 21928, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2694, 35351, 146503, -47138, -1608, 53248, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2695, 35351, 146684, -47023, -1608, 53248, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2696, 35351, 146621, -47063, -1608, 53248, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2697, 35351, 146563, -47099, -1608, 53248, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2698, 35351, 148292, -47048, -1608, 10752, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2699, 35351, 148348, -47080, -1608, 10752, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2700, 35351, 148409, -47118, -1608, 10752, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2701, 35351, 148461, -47152, -1608, 10752, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2702, 35351, 148262, -47032, -1608, 45056, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2703, 35351, 148319, -47065, -1608, 45056, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2704, 35351, 148380, -47103, -1608, 45056, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2705, 35351, 148432, -47136, -1608, 45056, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2706, 35350, 146652, -47383, -1613, 53248, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2707, 35350, 146686, -47362, -1613, 53248, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2708, 35350, 146721, -47339, -1613, 53248, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2709, 35350, 146790, -47295, -1613, 53248, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2710, 35350, 146754, -47318, -1613, 53248, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2711, 35343, 146681, -47428, -1613, 53248, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2712, 35343, 146716, -47407, -1613, 53248, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2713, 35343, 146750, -47384, -1613, 53248, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2714, 35343, 146819, -47340, -1613, 53248, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2715, 35343, 146783, -47363, -1613, 53248, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2716, 35350, 148136, -47292, -1613, 45056, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2717, 35350, 148175, -47313, -1613, 45056, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2718, 35350, 148215, -47335, -1613, 45056, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2719, 35350, 148251, -47357, -1613, 45056, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2720, 35350, 148284, -47378, -1613, 45056, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2721, 35343, 148114, -47328, -1613, 45056, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2722, 35343, 148152, -47348, -1613, 45056, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2723, 35343, 148193, -47371, -1613, 45056, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2724, 35343, 148228, -47393, -1613, 45056, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2725, 35343, 148262, -47414, -1613, 45056, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2726, 35350, 147101, -50056, -2128, 30048, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2727, 35350, 147111, -50022, -2128, 30048, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2728, 35350, 147119, -49988, -2128, 30048, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2729, 35350, 147127, -49956, -2128, 30048, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2730, 35350, 147137, -49923, -2128, 30048, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2731, 35350, 147144, -49894, -2128, 30048, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2732, 35350, 147153, -49860, -2128, 30048, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2733, 35343, 147132, -50052, -2128, 30048, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2734, 35343, 147141, -50017, -2128, 30048, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2735, 35343, 147150, -49983, -2128, 30048, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2736, 35343, 147158, -49951, -2128, 30048, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2737, 35343, 147168, -49918, -2128, 30048, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2738, 35343, 147175, -49889, -2128, 30048, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2739, 35343, 147184, -49855, -2128, 30048, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2740, 35350, 147782, -49845, -2128, 68248, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2741, 35350, 147791, -49879, -2128, 68248, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2742, 35350, 147801, -49913, -2128, 68248, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2743, 35350, 147809, -49945, -2128, 68248, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2744, 35350, 147817, -49978, -2128, 68248, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2745, 35350, 147826, -50007, -2128, 68248, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2746, 35350, 147835, -50041, -2128, 68248, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2747, 35343, 147750, -49842, -2128, 68248, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2748, 35343, 147760, -49877, -2128, 68248, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2749, 35343, 147769, -49911, -2128, 68248, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2750, 35343, 147777, -49943, -2128, 68248, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2751, 35343, 147785, -49975, -2128, 68248, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2752, 35343, 147794, -50005, -2128, 68248, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2753, 35343, 147803, -50038, -2128, 68248, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2754, 35351, 146896, -49631, -2125, 43520, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2755, 35351, 146934, -49653, -2125, 43520, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2756, 35351, 146971, -49674, -2125, 43520, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2757, 35351, 147006, -49695, -2125, 43520, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2758, 35351, 147041, -49715, -2125, 43520, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2759, 35351, 147081, -49736, -2125, 43520, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2760, 35351, 147863, -49743, -2125, 54616, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2761, 35351, 147900, -49720, -2125, 54616, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2762, 35351, 147937, -49698, -2125, 54616, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2763, 35351, 147973, -49677, -2125, 54616, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2764, 35351, 148007, -49656, -2125, 54616, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2765, 35351, 148044, -49632, -2125, 54616, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2766, 35350, 145837, -50098, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2767, 35350, 145869, -50098, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2768, 35350, 145900, -50098, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2769, 35350, 145931, -50098, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2770, 35350, 145963, -50098, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2771, 35350, 145994, -50098, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2772, 35350, 146026, -50098, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2773, 35350, 146057, -50098, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2774, 35343, 145852, -50136, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2775, 35343, 145884, -50136, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2776, 35343, 145915, -50136, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2777, 35343, 145946, -50136, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2778, 35343, 145978, -50136, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2779, 35343, 146010, -50136, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2780, 35343, 146041, -50136, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2781, 35343, 146072, -50136, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2782, 35343, 145850, -50177, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2783, 35341, 145882, -50177, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2784, 35343, 145913, -50177, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2785, 35343, 145944, -50177, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2786, 35326, 145976, -50177, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2787, 35343, 146007, -50177, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2788, 35341, 146039, -50177, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2789, 35325, 146070, -50177, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2790, 35350, 148877, -50096, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2791, 35350, 148909, -50096, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2792, 35350, 148940, -50096, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2793, 35350, 148971, -50096, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2794, 35350, 149003, -50096, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2795, 35350, 149034, -50096, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2796, 35350, 149066, -50096, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2797, 35350, 149097, -50096, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2798, 35343, 148862, -50132, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2799, 35343, 148894, -50132, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2800, 35343, 148925, -50132, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2801, 35343, 148956, -50132, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2802, 35343, 148988, -50132, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2803, 35343, 149020, -50132, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2804, 35343, 149051, -50132, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2805, 35343, 149082, -50132, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2806, 35324, 148860, -50174, -1601, 16312, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2807, 35341, 148892, -50174, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2808, 35343, 148923, -50174, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2809, 35326, 148954, -50174, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2810, 35343, 148986, -50174, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2811, 35343, 149017, -50174, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2812, 35341, 149049, -50174, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2813, 35343, 149080, -50174, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2814, 35330, 145969, -50642, -1601, 16312, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2815, 35330, 146017, -50642, -1601, 16312, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2816, 35330, 146068, -50642, -1601, 16312, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2817, 35330, 146117, -50642, -1601, 16312, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2818, 35330, 146168, -50642, -1601, 16312, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2819, 35330, 146217, -50642, -1601, 16312, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2820, 35330, 146268, -50642, -1601, 16312, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2821, 35330, 146316, -50642, -1601, 16312, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2822, 35326, 145965, -50678, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2823, 35327, 146014, -50678, -1601, 16312, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2824, 35328, 146065, -50678, -1601, 16312, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2825, 35328, 146113, -50678, -1601, 16312, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2826, 35328, 146164, -50678, -1601, 16312, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2827, 35328, 146213, -50678, -1601, 16312, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2828, 35327, 146264, -50678, -1601, 16312, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2829, 35326, 146313, -50678, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2830, 35351, 146443, -50721, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2831, 35351, 146492, -50721, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2832, 35351, 146543, -50721, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2833, 35351, 146592, -50721, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2834, 35351, 146643, -50721, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2835, 35351, 146691, -50721, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2836, 35351, 146742, -50721, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2837, 35351, 146791, -50721, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2838, 35330, 148660, -50692, -1601, 16312, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2839, 35330, 148709, -50692, -1601, 16312, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2840, 35330, 148759, -50692, -1601, 16312, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2841, 35330, 148808, -50692, -1601, 16312, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2842, 35330, 148859, -50692, -1601, 16312, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2843, 35330, 148908, -50692, -1601, 16312, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2844, 35330, 148959, -50692, -1601, 16312, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2845, 35330, 149008, -50692, -1601, 16312, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2846, 35326, 148656, -50728, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2847, 35327, 148705, -50728, -1601, 16312, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2848, 35328, 148756, -50728, -1601, 16312, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2849, 35328, 148805, -50728, -1601, 16312, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2850, 35328, 148856, -50728, -1601, 16312, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2851, 35328, 148904, -50728, -1601, 16312, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2852, 35327, 148955, -50728, -1601, 16312, 120, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2853, 35326, 149004, -50728, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2854, 35351, 148144, -50736, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2855, 35351, 148193, -50736, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2856, 35351, 148244, -50736, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2857, 35351, 148293, -50736, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2858, 35351, 148344, -50736, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2859, 35351, 148392, -50736, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2860, 35351, 148443, -50736, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2861, 35351, 148492, -50736, -1601, 16312, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2862, 35340, 145779, -50371, -1341, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2863, 35351, 145779, -50325, -1341, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2864, 35341, 145778, -50281, -1341, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2865, 35351, 145779, -50419, -1341, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2866, 35351, 145778, -50469, -1341, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2867, 35351, 145778, -50606, -1341, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2868, 35351, 145777, -50561, -1341, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2869, 35351, 145778, -50513, -1341, 0, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2870, 35340, 149150, -50389, -1341, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2871, 35351, 149150, -50344, -1341, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2872, 35341, 149150, -50299, -1341, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2873, 35351, 149150, -50437, -1341, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2874, 35351, 149150, -50488, -1341, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2875, 35351, 149150, -50624, -1341, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2876, 35351, 149150, -50579, -1341, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2877, 35351, 149150, -50531, -1341, 32768, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2878, 35340, 146188, -50876, -1341, 16416, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2879, 35351, 146243, -50876, -1341, 16416, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2880, 35341, 146363, -50876, -1341, 16416, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2881, 35351, 146302, -50876, -1341, 16416, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2882, 35351, 146423, -50876, -1341, 16416, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2883, 35351, 146480, -50876, -1341, 16416, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2884, 35351, 146590, -50876, -1341, 16416, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2885, 35340, 146533, -50876, -1341, 16416, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2886, 35340, 148317, -50871, -1341, 16416, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2887, 35351, 148372, -50871, -1341, 16416, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2888, 35341, 148491, -50871, -1341, 16416, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2889, 35351, 148430, -50871, -1341, 16416, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2890, 35351, 148551, -50871, -1341, 16416, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2891, 35351, 148608, -50871, -1341, 16416, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2892, 35351, 148719, -50871, -1341, 16416, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2893, 35340, 148661, -50871, -1341, 16416, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2894, 35351, 146413, -50047, -1341, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2895, 35351, 146473, -50048, -1341, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2896, 35351, 146527, -50048, -1341, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2897, 35340, 146642, -50049, -1341, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2898, 35351, 146585, -50048, -1341, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2899, 35351, 146755, -50050, -1341, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2900, 35351, 146697, -50050, -1341, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2901, 35351, 146809, -50051, -1341, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2902, 35351, 148155, -50045, -1341, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2903, 35351, 148215, -50045, -1341, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2904, 35351, 148269, -50046, -1341, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2905, 35340, 148384, -50046, -1341, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2906, 35351, 148328, -50046, -1341, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2907, 35351, 148497, -50048, -1341, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2908, 35351, 148439, -50047, -1341, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (7, 2909, 35351, 148552, -50048, -1341, 49152, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2910, 35516, 79062, -154856, 122, 15541, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2911, 35516, 79011, -154872, 122, 14451, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2912, 35516, 78957, -154862, 122, 16881, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2913, 35516, 78907, -154864, 122, 13107, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2914, 35516, 78991, -154187, 122, 16785, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2915, 35517, 76142, -154189, 122, 15666, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2916, 35518, 75987, -154843, 122, 15850, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2917, 35518, 76320, -154840, 122, 14962, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2918, 35518, 76055, -154192, 122, 16948, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2919, 35518, 79108, -154860, 122, 19389, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2920, 35518, 78853, -154869, 122, 15163, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2921, 35518, 79082, -154188, 122, 14451, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2922, 35519, 76036, -154842, 122, 16384, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2923, 35519, 76271, -154836, 122, 16176, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2924, 35520, 76078, -154842, 122, 16819, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2925, 35520, 76123, -154837, 122, 18617, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2926, 35520, 76168, -154837, 122, 19199, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2927, 35520, 76223, -154831, 122, 16801, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2928, 35522, 75988, -154795, 122, 14904, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2929, 35522, 76035, -154792, 122, 17865, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2930, 35522, 76077, -154792, 122, 17424, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2931, 35522, 76124, -154791, 122, 15613, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2932, 35522, 76166, -154793, 122, 16771, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2933, 35522, 76221, -154788, 122, 16785, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2934, 35522, 76270, -154786, 122, 16087, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2935, 35522, 76318, -154785, 122, 17359, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2936, 35522, 79156, -154805, 122, 16384, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2937, 35522, 79111, -154809, 122, 14604, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2938, 35522, 79063, -154815, 122, 13380, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2939, 35522, 79010, -154825, 122, 16700, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2940, 35522, 78962, -154823, 101, 16785, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2941, 35522, 78912, -154823, 122, 16384, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2942, 35522, 78855, -154827, 122, 17289, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2943, 35522, 78806, -154829, 122, 11935, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2944, 35531, 77213, -149857, -358, 62180, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2945, 35531, 77566, -149497, -358, 14054, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2946, 35531, 75901, -151796, 121, 28435, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2947, 35531, 79209, -151802, 121, 4473, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2948, 35532, 76697, -154094, 382, 49586, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2949, 35532, 76864, -154946, 382, 17723, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2950, 35532, 76490, -154938, 382, 16147, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2951, 35532, 75870, -154537, 382, 65233, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2952, 35532, 78125, -154933, 382, 22390, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2953, 35532, 78601, -154939, 382, 14138, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2954, 35532, 79251, -154476, 382, 33635, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2955, 35532, 76910, -149714, -17, 18039, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2956, 35532, 76872, -149719, -37, 18335, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2957, 35532, 76484, -149616, -19, 16633, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2958, 35532, 76508, -149661, -17, 16384, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2959, 35532, 76403, -149710, -17, 18684, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2960, 35532, 75587, -149642, -17, 16384, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2961, 35532, 75479, -149687, -17, 29598, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2962, 35532, 75612, -149682, -17, 23008, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2963, 35532, 75507, -149727, -17, 27982, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2964, 35532, 74786, -151087, -17, 24614, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2965, 35532, 74849, -151115, -17, 15439, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2966, 35532, 74804, -151215, -17, 32598, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2967, 35532, 74509, -151788, -17, 29315, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2968, 35532, 74571, -151793, -17, 25670, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2969, 35532, 74542, -151904, -17, 34211, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2970, 35532, 77330, -149317, 366, 62495, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2971, 35532, 77223, -149209, 366, 18586, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2972, 35532, 77201, -149289, 366, 18715, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2973, 35532, 77892, -149214, 366, 12468, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2974, 35532, 77915, -149331, 366, 10081, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2975, 35532, 77779, -149334, 366, 21915, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2976, 35532, 76136, -151775, 117, 28517, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2977, 35532, 76157, -151787, 117, 28181, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2978, 35532, 76041, -151999, 117, 28545, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2979, 35532, 76062, -152012, 117, 28651, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2980, 35532, 79068, -152019, 117, 2903, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2981, 35532, 79038, -152032, 110, 5889, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2982, 35532, 78917, -151775, 110, 5193, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2983, 35532, 78884, -151766, 110, 5567, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2984, 35532, 78273, -149718, -17, 13829, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2985, 35532, 78225, -149712, -17, 12597, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2986, 35532, 78634, -149626, -17, 18311, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2987, 35532, 78601, -149707, -17, 18443, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2988, 35532, 78697, -149715, -17, 6085, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2989, 35532, 79563, -149790, -17, 10068, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2990, 35532, 79537, -149833, -17, 8435, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2991, 35532, 79491, -149702, -17, 11345, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2992, 35532, 79462, -149744, -17, 12765, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2993, 35532, 80304, -151217, -17, 1723, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2994, 35532, 80332, -151083, -17, 9129, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2995, 35532, 80263, -151114, -17, 10848, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2996, 35532, 80551, -151924, -17, 60850, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2997, 35532, 80600, -151798, -17, 5323, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2998, 35532, 80515, -151805, -17, 6075, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 2999, 35533, 76695, -154945, 382, 15596, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3000, 35533, 75863, -154413, 382, 1723, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3001, 35533, 75960, -154202, 122, 19264, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3002, 35533, 76113, -154192, 122, 17650, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3003, 35533, 78369, -154939, 382, 13829, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3004, 35533, 78479, -154106, 382, 50426, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3005, 35533, 79240, -154347, 382, 33870, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3006, 35533, 79173, -154190, 122, 14167, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3007, 35533, 79019, -154187, 122, 14434, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3008, 35533, 78034, -149889, -300, 24261, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3009, 35533, 77110, -149863, -316, 387, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3010, 35533, 76718, -149806, -17, 52961, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3011, 35533, 76126, -151742, 117, 27211, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3012, 35533, 76021, -152022, 117, 27495, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3013, 35533, 79058, -152046, 117, 3713, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3014, 35533, 78936, -151742, 117, 4511, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3015, 35533, 78390, -149812, -17, 45442, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3016, 35535, 75927, -154186, 122, 16771, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3017, 35535, 75960, -154173, 122, 16229, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3018, 35535, 75993, -154168, 122, 18330, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3019, 35535, 76027, -154172, 122, 18107, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3020, 35535, 76061, -154168, 122, 17539, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3021, 35535, 76090, -154169, 122, 19686, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3022, 35535, 76115, -154170, 122, 15568, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3023, 35535, 76141, -154165, 122, 13029, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3024, 35535, 75924, -154204, 122, 17128, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3025, 35535, 75989, -154198, 122, 27132, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3026, 35535, 76023, -154197, 122, 15806, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3027, 35535, 76087, -154187, 122, 18795, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3028, 35535, 79159, -154849, 122, 16188, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3029, 35535, 78805, -154862, 122, 13029, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3030, 35535, 79199, -154176, 122, 15921, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3031, 35535, 79174, -154172, 122, 15962, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3032, 35535, 79145, -154172, 122, 16384, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3033, 35535, 79112, -154168, 122, 15244, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3034, 35535, 79081, -154165, 122, 14783, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3035, 35535, 79047, -154166, 122, 16236, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3036, 35535, 79022, -154165, 122, 15619, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3037, 35535, 78991, -154161, 122, 15126, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3038, 35535, 79200, -154196, 122, 16866, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3039, 35535, 79145, -154190, 122, 17919, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3040, 35535, 79113, -154192, 122, 15087, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3041, 35535, 79050, -154187, 122, 15480, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3042, 35535, 77703, -149698, -358, 14434, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3043, 35535, 77668, -149694, -358, 14292, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3044, 35535, 77636, -149692, -358, 15772, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3045, 35535, 77604, -149687, -358, 14509, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3046, 35535, 77573, -149689, -358, 15067, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3047, 35535, 77536, -149683, -358, 14662, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3048, 35535, 77503, -149687, -358, 14904, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3049, 35535, 77470, -149685, -358, 15571, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3050, 35535, 77437, -149683, -358, 18489, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3051, 35535, 77702, -149539, -358, 18061, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3052, 35535, 77671, -149548, -379, 12873, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3053, 35535, 77636, -149550, -358, 13303, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3054, 35535, 77587, -149549, -358, 16710, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3055, 35535, 77547, -149559, -358, 19287, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3056, 35535, 77513, -149561, -358, 9876, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3057, 35535, 77485, -149559, -358, 13029, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3058, 35535, 77454, -149562, -358, 11548, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3059, 35535, 77417, -149562, -358, 14509, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3060, 35535, 76947, -151454, 110, 55842, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3061, 35535, 76911, -151479, 110, 56098, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3062, 35535, 76866, -151506, 110, 54544, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3063, 35535, 76833, -151527, 110, 54961, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3064, 35535, 76805, -151557, 110, 54393, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3065, 35535, 75950, -151765, 121, 28694, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3066, 35535, 75966, -151774, 121, 27222, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3067, 35535, 75985, -151784, 121, 28996, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3068, 35535, 75928, -151784, 121, 26716, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3069, 35535, 75946, -151794, 121, 27510, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3070, 35535, 75968, -151803, 121, 28258, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3071, 35535, 75911, -151811, 121, 28077, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3072, 35535, 75927, -151819, 121, 28154, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3073, 35535, 75961, -151832, 121, 28771, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3074, 35535, 75912, -151850, 121, 28422, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3075, 35535, 75932, -151861, 121, 27760, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3076, 35535, 75950, -151869, 121, 28676, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3077, 35535, 77239, -154111, -401, 31794, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3078, 35535, 77240, -154079, -401, 30835, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3079, 35535, 77244, -154051, -401, 31163, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3080, 35535, 77254, -154023, -401, 30749, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3081, 35535, 77251, -153994, -401, 33083, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3082, 35535, 77263, -153968, -401, 30465, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3083, 35535, 77273, -153943, -401, 31046, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3084, 35535, 75815, -152203, -655, 30255, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3085, 35535, 75814, -152233, -656, 32042, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3086, 35535, 75811, -152262, -656, 32334, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3087, 35535, 75811, -152293, -655, 31950, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3088, 35535, 75811, -152324, -657, 32439, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3089, 35535, 75807, -152362, -657, 33494, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3090, 35535, 78188, -151391, 110, 43370, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3091, 35535, 78220, -151414, 110, 42758, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3092, 35535, 78262, -151442, 110, 44928, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3093, 35535, 78300, -151470, 110, 44552, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3094, 35535, 78342, -151496, 110, 44812, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3095, 35535, 77864, -154130, -401, 64475, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3096, 35535, 77862, -154095, -401, 1481, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3097, 35535, 77855, -154067, -401, 1974, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3098, 35535, 77845, -154038, -401, 232, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3099, 35535, 77839, -154007, -401, 0, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3100, 35535, 77829, -153978, -401, 1771, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3101, 35535, 77815, -153948, -401, 1646, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3102, 35535, 79304, -152404, -657, 65113, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3103, 35535, 79307, -152374, -657, 1440, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3104, 35535, 79307, -152345, -657, 64238, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3105, 35535, 79308, -152307, -657, 63902, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3106, 35535, 79308, -152263, -657, 64481, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3107, 35535, 79312, -152225, -657, 65242, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3108, 35535, 79201, -151859, 121, 4067, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3109, 35535, 79195, -151835, 121, 6301, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3110, 35535, 79182, -151813, 121, 5320, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3111, 35535, 79174, -151781, 121, 4521, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3112, 35535, 79147, -151793, 121, 5912, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3113, 35535, 79118, -151809, 121, 3853, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3114, 35535, 79168, -151816, 121, 3839, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3115, 35535, 79125, -151833, 121, 4943, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3116, 35535, 79179, -151840, 121, 5308, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3117, 35535, 79147, -151854, 121, 5011, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3118, 35535, 79183, -151868, 121, 4139, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3119, 35535, 79154, -151879, 121, 4432, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3120, 35542, 76143, -154139, 122, 15453, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3121, 35542, 76117, -154146, 122, 15153, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3122, 35542, 76088, -154144, 122, 15493, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3123, 35542, 76061, -154141, 122, 15248, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3124, 35542, 76028, -154146, 122, 15046, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3125, 35542, 75996, -154143, 122, 15103, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3126, 35542, 75960, -154143, 122, 16955, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3127, 35542, 75929, -154145, 122, 16384, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3128, 35542, 79203, -154141, 122, 15840, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3129, 35542, 79174, -154147, 122, 15723, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3130, 35542, 79144, -154150, 122, 15214, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3131, 35542, 79113, -154148, 122, 15781, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3132, 35542, 79081, -154147, 122, 16021, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3133, 35542, 79051, -154146, 122, 16906, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3134, 35542, 79024, -154149, 122, 18565, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3135, 35542, 78992, -154146, 122, 16384, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3136, 35542, 77898, -149967, -358, 36306, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3137, 35542, 77902, -149942, -358, 34169, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3138, 35542, 77907, -149919, -358, 32768, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3139, 35542, 77914, -149892, -358, 31152, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3140, 35542, 77918, -149865, -358, 33989, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3141, 35542, 77920, -149839, -358, 34948, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3142, 35542, 77923, -149814, -358, 38901, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3143, 35542, 77921, -149778, -358, 29103, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3144, 35542, 77922, -149756, -358, 39479, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3145, 35542, 77187, -149761, -356, 65062, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3146, 35542, 77187, -149777, -358, 4837, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3147, 35542, 77186, -149794, -356, 10251, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3148, 35542, 77185, -149821, -356, 3539, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3149, 35542, 77185, -149843, -356, 4837, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3150, 35542, 77187, -149873, -357, 522, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3151, 35542, 77189, -149902, -357, 64496, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3152, 35542, 77188, -149925, -358, 1298, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3153, 35542, 77186, -149949, -356, 1155, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3154, 35542, 77709, -149671, -358, 16456, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3155, 35542, 77670, -149671, -358, 14546, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3156, 35542, 77637, -149666, -358, 14451, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3157, 35542, 77605, -149666, -358, 16231, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3158, 35542, 77573, -149668, -358, 15299, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3159, 35542, 77538, -149667, -358, 15584, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3160, 35542, 77504, -149664, -358, 17410, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3161, 35542, 77471, -149665, -358, 17016, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3162, 35542, 77439, -149664, -358, 16216, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3163, 35542, 77702, -149514, -358, 19740, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3164, 35542, 77668, -149518, -358, 17606, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3165, 35542, 77630, -149524, -358, 14904, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3166, 35542, 77579, -149529, -358, 20939, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3167, 35542, 77544, -149530, -358, 11797, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3168, 35542, 77503, -149522, -358, 18181, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3169, 35542, 77471, -149521, -358, 20275, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3170, 35542, 77444, -149517, -358, 17424, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3171, 35542, 77411, -149513, -358, 15046, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3172, 35542, 76778, -151510, 110, 54277, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3173, 35542, 76812, -151491, 110, 53745, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3174, 35542, 76847, -151467, 110, 54441, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3175, 35542, 76881, -151441, 110, 55547, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3176, 35542, 76920, -151419, 110, 55725, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3177, 35542, 75921, -151750, 121, 27898, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3178, 35542, 75891, -151774, 121, 27543, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3179, 35542, 75880, -151801, 121, 29119, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3180, 35542, 75882, -151845, 121, 28636, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3181, 35542, 77199, -154108, -401, 34120, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3182, 35542, 77209, -154076, -401, 29655, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3183, 35542, 77216, -154045, -401, 30510, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3184, 35542, 77226, -154018, -401, 31314, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3185, 35542, 77233, -153994, -401, 31716, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3186, 35542, 77238, -153966, -401, 30594, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3187, 35542, 77248, -153940, -401, 31778, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3188, 35542, 75838, -152206, -653, 33807, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3189, 35542, 75836, -152235, -653, 32603, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3190, 35542, 75834, -152260, -653, 32650, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3191, 35542, 75835, -152291, -653, 32266, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3192, 35542, 75833, -152323, -653, 30515, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3193, 35542, 75825, -152359, -653, 33635, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3194, 35542, 75862, -152205, -653, 33088, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3195, 35542, 75862, -152238, -653, 34227, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3196, 35542, 75862, -152262, -653, 33511, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3197, 35542, 75864, -152291, -653, 33369, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3198, 35542, 75862, -152323, -653, 34106, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3199, 35542, 75863, -152358, -653, 32768, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3200, 35542, 78212, -151353, 110, 44361, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3201, 35542, 78245, -151369, 110, 41988, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3202, 35542, 78286, -151404, 110, 44805, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3203, 35542, 78326, -151431, 110, 43968, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3204, 35542, 78367, -151456, 110, 43287, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3205, 35542, 77913, -154126, -401, 760, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3206, 35542, 77901, -154092, -401, 2476, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3207, 35542, 77889, -154063, -401, 1383, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3208, 35542, 77876, -154036, -401, 213, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3209, 35542, 77870, -154005, -401, 1797, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3210, 35542, 77856, -153973, -401, 946, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3211, 35542, 77843, -153943, -401, 2827, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3212, 35542, 79392, -152408, -657, 64248, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3213, 35542, 79386, -152377, -657, 64552, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3214, 35542, 79386, -152343, -657, 64456, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3215, 35542, 79383, -152301, -657, 64256, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3216, 35542, 79381, -152265, -657, 64001, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3217, 35542, 79371, -152222, -657, 2091, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3218, 35542, 79352, -152404, -657, 3743, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3219, 35542, 79348, -152377, -657, 63859, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3220, 35542, 79348, -152346, -657, 868, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3221, 35542, 79342, -152305, -657, 64850, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3222, 35542, 79341, -152264, -657, 64578, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3223, 35542, 79341, -152223, -657, 332, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3224, 35542, 79244, -151843, 121, 3969, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3225, 35542, 79215, -151748, 121, 3782, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3226, 35542, 79243, -151770, 121, 4210, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3227, 35542, 79248, -151803, 121, 3782, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3228, 35543, 76478, -154115, 382, 48500, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3229, 35543, 76408, -154110, 382, 48500, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3230, 35543, 76556, -154113, 382, 48425, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3231, 35543, 76621, -154115, 382, 49828, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3232, 35543, 76771, -154113, 382, 50397, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3233, 35543, 77550, -149572, -358, 16858, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3234, 35543, 76851, -154110, 382, 47822, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3235, 35543, 76939, -154110, 382, 51608, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3236, 35543, 76938, -154929, 382, 12041, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3237, 35543, 76802, -154938, 382, 18047, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3238, 35543, 76751, -154943, 382, 15753, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3239, 35543, 76632, -154939, 382, 17228, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3240, 35543, 76565, -154934, 382, 17988, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3241, 35543, 75880, -154815, 382, 63227, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3242, 35543, 75880, -154764, 382, 1876, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3243, 35543, 75878, -154715, 382, 766, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3244, 35543, 75879, -154660, 382, 64096, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3245, 35543, 75877, -154599, 382, 65238, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3246, 35543, 75877, -154478, 382, 65382, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3247, 35543, 77006, -154843, 122, 16666, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3248, 35543, 76952, -154846, 122, 15394, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3249, 35543, 76897, -154852, 122, 14220, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3250, 35543, 76857, -154855, 122, 13959, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3251, 35543, 76805, -154856, 122, 16384, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3252, 35543, 76761, -154856, 122, 15370, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3253, 35543, 76718, -154863, 122, 16059, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3254, 35543, 76675, -154870, 122, 17814, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3255, 35543, 78206, -154927, 382, 16545, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3256, 35543, 78288, -154927, 382, 16696, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3257, 35543, 78453, -154934, 382, 18383, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3258, 35543, 78525, -154930, 382, 17238, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3259, 35543, 78690, -154929, 382, 18309, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3260, 35543, 78661, -154108, 382, 49673, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3261, 35543, 78609, -154103, 382, 49483, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3262, 35543, 78552, -154105, 382, 50097, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3263, 35543, 78411, -154115, 382, 50544, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3264, 35543, 78349, -154115, 382, 48421, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3265, 35543, 78290, -154114, 382, 50490, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3266, 35543, 78221, -154114, 382, 48145, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3267, 35543, 79239, -154788, 382, 32471, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3268, 35543, 79235, -154722, 382, 35413, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3269, 35543, 79236, -154652, 382, 34771, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3270, 35543, 79234, -154592, 382, 34538, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3271, 35543, 79235, -154538, 382, 33338, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3272, 35543, 79246, -154413, 382, 33979, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3273, 35543, 78168, -154841, 122, 17786, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3274, 35543, 78225, -154848, 122, 17399, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3275, 35543, 78278, -154847, 122, 19119, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3276, 35543, 78332, -154855, 122, 21980, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3277, 35543, 78388, -154856, 122, 20214, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3278, 35543, 78435, -154854, 122, 18192, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3279, 35543, 78487, -154860, 122, 21478, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3280, 35543, 78540, -154861, 122, 16893, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3281, 35543, 78582, -154862, 122, 16666, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3282, 35543, 77930, -149963, -353, 28258, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3283, 35543, 77934, -149946, -351, 36123, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3284, 35543, 77935, -149918, -351, 32768, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3285, 35543, 77940, -149892, -348, 34302, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3286, 35543, 77944, -149866, -346, 37976, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3287, 35543, 77946, -149836, -345, 32768, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3288, 35543, 77948, -149810, -344, 31901, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3289, 35543, 77949, -149780, -343, 33202, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3290, 35543, 77948, -149752, -344, 36636, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3291, 35543, 77165, -149760, -344, 6134, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3292, 35543, 77155, -149782, -340, 2556, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3293, 35543, 77156, -149807, -340, 613, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3294, 35543, 77157, -149831, -369, 417, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3295, 35543, 77153, -149852, -338, 3356, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3296, 35543, 77158, -149877, -341, 65082, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3297, 35543, 77158, -149903, -342, 833, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3298, 35543, 77158, -149923, -342, 7392, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3299, 35543, 77156, -149953, -341, 57344, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3300, 35543, 77701, -149556, -358, 18039, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3301, 35543, 77674, -149564, -358, 15002, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3302, 35543, 77640, -149567, -358, 19941, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3303, 35543, 77596, -149564, -358, 17146, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3304, 35543, 77512, -149576, -358, 16828, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3305, 35543, 77487, -149569, -358, 12962, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3306, 35543, 77452, -149576, -358, 14822, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3307, 35543, 77415, -149574, -358, 26635, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3308, 35543, 77037, -149671, -17, 19639, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3309, 35543, 76995, -149675, -17, 16606, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3310, 35543, 76956, -149690, -17, 16117, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3311, 35543, 76825, -149728, -17, 17729, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3312, 35543, 76786, -149732, -17, 17565, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3313, 35543, 76858, -149771, -17, 54978, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3314, 35543, 76823, -149780, -17, 52894, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3315, 35543, 76789, -149783, -17, 51590, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3316, 35543, 76754, -149799, -17, 51269, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3317, 35543, 76690, -149813, -17, 55900, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3318, 35543, 76659, -149820, -17, 52566, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3319, 35543, 76619, -149836, -17, 51759, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3320, 35543, 76389, -149643, -17, 16384, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3321, 35543, 76497, -149639, -17, 19740, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3322, 35543, 76529, -149700, -17, 20059, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3323, 35543, 76396, -149672, -17, 21278, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3324, 35543, 76408, -149733, -17, 20306, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3325, 35543, 75437, -149443, -17, 12302, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3326, 35543, 75354, -149492, -17, 25922, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3327, 35543, 75474, -149492, -17, 15327, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3328, 35543, 75511, -149543, -17, 12821, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3329, 35543, 75554, -149604, -17, 13946, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3330, 35543, 75389, -149552, -17, 44850, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3331, 35543, 75422, -149595, -17, 29592, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3332, 35543, 75458, -149657, -38, 26331, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3333, 35543, 75648, -149722, -17, 18768, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3334, 35543, 75696, -149796, -17, 15968, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3335, 35543, 75536, -149779, -37, 31664, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3336, 35543, 75589, -149849, -17, 26367, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3337, 35543, 74811, -151089, -17, 22430, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3338, 35543, 74897, -151132, -17, 17767, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3339, 35543, 74733, -151164, -17, 32352, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3340, 35543, 74771, -151193, -17, 36079, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3341, 35543, 74845, -151241, -17, 36251, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3342, 35543, 74525, -151790, -17, 24240, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3343, 35543, 74612, -151802, -17, 26244, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3344, 35543, 74475, -151877, -17, 31499, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3345, 35543, 74501, -151891, -17, 29413, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3346, 35543, 74575, -151919, -17, 33837, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3347, 35543, 77320, -149215, 366, 12416, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3348, 35543, 77324, -149274, 366, 9802, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3349, 35543, 77327, -149367, 366, 17306, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3350, 35543, 77216, -149262, 345, 63334, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3351, 35543, 77196, -149352, 366, 21093, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3352, 35543, 77801, -149213, 366, 32325, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3353, 35543, 77908, -149260, 366, 13331, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3354, 35543, 77928, -149393, 366, 12310, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3355, 35543, 77786, -149268, 366, 18565, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3356, 35543, 77771, -149385, 366, 21406, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3357, 35543, 76796, -151092, 117, 51978, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3358, 35543, 76754, -151115, 117, 19244, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3359, 35543, 76714, -151155, 117, 56189, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3360, 35543, 76651, -151184, 117, 19615, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3361, 35543, 76617, -151225, 117, 54682, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3362, 35543, 76575, -151243, 117, 23850, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3363, 35543, 76545, -151272, 117, 55285, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3364, 35543, 76815, -151070, 117, 30312, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3365, 35543, 76088, -151778, 117, 29991, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3366, 35543, 76115, -151791, 117, 29154, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3367, 35543, 76133, -151801, 117, 28258, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3368, 35543, 76156, -151810, 117, 28373, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3369, 35543, 76095, -151757, 117, 28077, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3370, 35543, 76113, -151765, 117, 30288, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3371, 35543, 76011, -151961, 117, 27560, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3372, 35543, 76040, -151975, 117, 29497, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3373, 35543, 76059, -151983, 117, 27831, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3374, 35543, 76077, -151989, 117, 28276, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3375, 35543, 75997, -151981, 117, 29991, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3376, 35543, 76017, -151987, 117, 28276, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3377, 35543, 76981, -153686, -401, 44098, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3378, 35543, 77011, -153705, -401, 43472, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3379, 35543, 77041, -153720, -401, 43794, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3380, 35543, 77071, -153738, -401, 43325, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3381, 35543, 77105, -153752, -401, 43625, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3382, 35543, 77144, -153778, -401, 43845, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3383, 35543, 78321, -151073, 117, 40411, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3384, 35543, 78342, -151092, 117, 8192, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3385, 35543, 78363, -151108, 117, 41905, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3386, 35543, 78389, -151117, 117, 10576, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3387, 35543, 78414, -151131, 117, 40960, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3388, 35543, 78440, -151138, 117, 10081, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3389, 35543, 78456, -151161, 117, 42440, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3390, 35543, 78488, -151178, 117, 6971, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3391, 35543, 78126, -153692, -401, 53176, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3392, 35543, 78091, -153701, -401, 56462, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3393, 35543, 78063, -153725, -401, 55522, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3394, 35543, 78036, -153739, -401, 52997, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3395, 35543, 78012, -153751, -401, 56220, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3396, 35543, 77983, -153770, -401, 53832, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3397, 35543, 79121, -151957, 117, 6134, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3398, 35543, 79102, -151966, 117, 4837, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3399, 35543, 79077, -151978, 117, 3743, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3400, 35543, 79017, -152014, 110, 4837, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3401, 35543, 79125, -151991, 117, 3356, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3402, 35543, 79103, -151998, 117, 4555, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3403, 35543, 79026, -151780, 117, 4737, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3404, 35543, 79002, -151791, 117, 4168, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3405, 35543, 78983, -151800, 117, 3682, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3406, 35543, 79021, -151755, 117, 4776, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3407, 35543, 78997, -151767, 117, 4661, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3408, 35543, 78971, -151778, 117, 4555, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3409, 35543, 78094, -149671, -17, 12022, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3410, 35543, 78131, -149687, -17, 20199, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3411, 35543, 78176, -149700, -17, 16819, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3412, 35543, 78315, -149734, -17, 12747, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3413, 35543, 78375, -149745, -17, 13291, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3414, 35543, 78246, -149773, -17, 45261, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3415, 35543, 78289, -149782, -17, 55621, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3416, 35543, 78326, -149793, -17, 47093, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3417, 35543, 78360, -149802, -17, 47188, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3418, 35543, 78430, -149820, -17, 44491, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3419, 35543, 78470, -149828, -17, 43987, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3420, 35543, 78512, -149842, -17, 45688, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3421, 35543, 78614, -149642, -17, 15439, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3422, 35543, 78582, -149723, -17, 18638, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3423, 35543, 78721, -149649, -17, 10357, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3424, 35543, 78718, -149682, -17, 8621, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3425, 35543, 78688, -149760, -17, 9084, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3426, 35543, 79721, -149542, -17, 10295, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3427, 35543, 79685, -149598, -17, 9046, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3428, 35543, 79647, -149659, -17, 11770, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3429, 35543, 79608, -149721, -17, 9138, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3430, 35543, 79489, -149879, -17, 11918, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3431, 35543, 79468, -149925, -17, 6947, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3432, 35543, 79651, -149482, -17, 11095, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3433, 35543, 79611, -149536, -17, 10618, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3434, 35543, 79571, -149588, -17, 12447, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3435, 35543, 79525, -149660, -17, 10304, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3436, 35543, 79422, -149803, -17, 11721, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3437, 35543, 79385, -149862, -17, 12909, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3438, 35543, 80370, -151161, -17, 64261, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3439, 35543, 80333, -151185, -17, 2091, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3440, 35543, 80274, -151241, -17, 3881, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3441, 35543, 80308, -151100, -17, 10501, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3442, 35543, 80222, -151125, -17, 9869, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3443, 35543, 80619, -151882, -17, 2593, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3444, 35543, 80586, -151902, -17, 62409, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3445, 35543, 80496, -151939, -17, 61631, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3446, 35543, 80563, -151799, -17, 7849, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (9, 3447, 35543, 80464, -151813, -17, 6828, 60, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3448, 35486, 18535, -49055, -1217, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3449, 35486, 18535, -49095, -1217, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3450, 35486, 18535, -49135, -1217, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3451, 35486, 18535, -49175, -1217, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3452, 35486, 18535, -49215, -1217, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3453, 35490, 18555, -49055, -1217, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3454, 35490, 18555, -49075, -1217, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3455, 35490, 18555, -49095, -1217, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3456, 35490, 18555, -49115, -1217, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3457, 35490, 18555, -49135, -1217, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3458, 35490, 18555, -49155, -1217, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3459, 35490, 18555, -49175, -1217, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3460, 35490, 18555, -49195, -1217, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3461, 35490, 18555, -49215, -1217, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3462, 35490, 18555, -49235, -1217, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3463, 35490, 18575, -49055, -1217, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3464, 35488, 18575, -49075, -1217, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3465, 35487, 18575, -49095, -1217, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3466, 35488, 18575, -49115, -1217, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3467, 35487, 18575, -49135, -1217, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3468, 35488, 18575, -49155, -1217, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3469, 35487, 18575, -49175, -1217, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3470, 35488, 18575, -49195, -1217, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3471, 35487, 18575, -49215, -1217, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3472, 35488, 18575, -49235, -1217, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3473, 35487, 18595, -49055, -1217, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3474, 35489, 18595, -49075, -1217, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3475, 35489, 18595, -49095, -1217, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3476, 35489, 18595, -49115, -1217, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3477, 35489, 18595, -49135, -1217, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3478, 35484, 18595, -49155, -1217, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3479, 35489, 18595, -49175, -1217, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3480, 35489, 18595, -49195, -1217, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3481, 35489, 18595, -49215, -1217, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3482, 35489, 18595, -49235, -1217, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3483, 35486, 15490, -49055, -1059, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3484, 35486, 15490, -49095, -1059, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3485, 35486, 15490, -49135, -1059, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3486, 35486, 15490, -49175, -1059, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3487, 35486, 15490, -49215, -1059, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3488, 35490, 15510, -49055, -1059, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3489, 35490, 15510, -49075, -1059, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3490, 35490, 15510, -49095, -1059, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3491, 35490, 15510, -49115, -1059, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3492, 35490, 15510, -49135, -1059, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3493, 35490, 15510, -49155, -1059, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3494, 35490, 15510, -49175, -1059, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3495, 35490, 15510, -49195, -1059, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3496, 35490, 15510, -49215, -1059, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3497, 35490, 15510, -49235, -1059, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3498, 35490, 15530, -49055, -1059, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3499, 35488, 15530, -49075, -1059, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3500, 35487, 15530, -49095, -1059, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3501, 35488, 15530, -49115, -1059, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3502, 35487, 15530, -49135, -1059, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3503, 35488, 15530, -49155, -1059, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3504, 35487, 15530, -49175, -1059, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3505, 35488, 15530, -49195, -1059, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3506, 35487, 15530, -49215, -1059, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3507, 35488, 15530, -49235, -1059, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3508, 35487, 15550, -49055, -1059, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3509, 35489, 15550, -49075, -1059, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3510, 35489, 15550, -49095, -1059, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3511, 35489, 15550, -49115, -1059, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3512, 35489, 15550, -49135, -1059, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3513, 35484, 15550, -49155, -1059, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3514, 35489, 15550, -49175, -1059, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3515, 35489, 15550, -49195, -1059, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3516, 35489, 15550, -49215, -1059, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3517, 35489, 15550, -49235, -1059, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3518, 35486, 13395, -49055, -537, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3519, 35486, 13395, -49095, -537, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3520, 35486, 13395, -49135, -537, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3521, 35486, 13395, -49175, -537, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3522, 35486, 13405, -49215, -537, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3523, 35490, 13405, -49055, -537, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3524, 35490, 13405, -49075, -537, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3525, 35490, 13405, -49095, -537, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3526, 35490, 13405, -49115, -537, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3527, 35490, 13405, -49135, -537, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3528, 35490, 13405, -49155, -537, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3529, 35490, 13405, -49175, -537, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3530, 35490, 13405, -49195, -537, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3531, 35490, 13405, -49215, -537, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3532, 35490, 13405, -49235, -537, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3533, 35490, 13415, -49055, -537, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3534, 35488, 13415, -49075, -537, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3535, 35487, 13415, -49095, -537, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3536, 35488, 13415, -49115, -537, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3537, 35487, 13415, -49135, -537, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3538, 35488, 13415, -49155, -537, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3539, 35487, 13415, -49175, -537, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3540, 35488, 13415, -49195, -537, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3541, 35487, 13415, -49215, -537, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3542, 35488, 13415, -49235, -537, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3543, 35487, 13435, -49055, -537, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3544, 35489, 13435, -49075, -537, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3545, 35489, 13435, -49095, -537, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3546, 35489, 13435, -49115, -537, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3547, 35489, 13435, -49135, -537, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3548, 35484, 13435, -49155, -537, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3549, 35489, 13435, -49175, -537, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3550, 35489, 13435, -49195, -537, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3551, 35489, 13435, -49215, -537, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3552, 35489, 13435, -49235, -537, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3553, 35486, 11040, -49055, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3554, 35486, 11040, -49095, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3555, 35486, 11040, -49135, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3556, 35486, 11040, -49175, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3557, 35486, 11060, -49215, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3558, 35490, 11060, -49055, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3559, 35490, 11060, -49075, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3560, 35490, 11060, -49095, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3561, 35490, 11060, -49115, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3562, 35490, 11060, -49135, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3563, 35490, 11060, -49155, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3564, 35490, 11060, -49175, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3565, 35490, 11060, -49195, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3566, 35490, 11060, -49215, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3567, 35490, 11060, -49235, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3568, 35490, 11080, -49055, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3569, 35488, 11080, -49075, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3570, 35487, 11080, -49095, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3571, 35488, 11080, -49115, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3572, 35487, 11080, -49135, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3573, 35488, 11080, -49155, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3574, 35487, 11080, -49175, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3575, 35488, 11080, -49195, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3576, 35487, 11080, -49215, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3577, 35488, 11080, -49235, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3578, 35487, 11100, -49055, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3579, 35489, 11100, -49075, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3580, 35489, 11100, -49095, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3581, 35489, 11100, -49115, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3582, 35489, 11100, -49135, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3583, 35484, 11100, -49155, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3584, 35489, 11100, -49175, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3585, 35489, 11100, -49195, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3586, 35489, 11100, -49215, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3587, 35489, 11100, -49235, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3588, 35486, 9445, -49055, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3589, 35486, 9445, -49095, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3590, 35486, 9445, -49135, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3591, 35486, 9445, -49175, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3592, 35486, 9445, -49215, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3593, 35490, 9465, -48905, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3594, 35490, 9465, -48955, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3595, 35490, 9465, -49005, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3596, 35490, 9465, -49055, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3597, 35490, 9465, -49105, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3598, 35490, 9465, -49155, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3599, 35490, 9465, -49205, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3600, 35490, 9465, -49255, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3601, 35490, 9465, -49305, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3602, 35490, 9465, -49355, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3603, 35490, 9485, -48905, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3604, 35488, 9485, -48955, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3605, 35487, 9485, -49005, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3606, 35488, 9485, -49055, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3607, 35487, 9485, -49105, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3608, 35488, 9485, -49155, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3609, 35487, 9485, -49205, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3610, 35488, 9485, -49255, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3611, 35487, 9485, -49305, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3612, 35488, 9485, -49355, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3613, 35487, 9505, -48905, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3614, 35489, 9505, -48955, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3615, 35489, 9505, -49005, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3616, 35489, 9505, -49055, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3617, 35489, 9505, -49105, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3618, 35484, 9505, -49155, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3619, 35489, 9505, -49205, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3620, 35489, 9505, -49255, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3621, 35489, 9505, -49305, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3622, 35489, 9505, -49355, 996, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3623, 35484, 9231, -49151, 1093, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3624, 35486, 9135, -49076, 1093, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3625, 35486, 9135, -49236, 1093, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3626, 35484, 9035, -49151, 1093, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3627, 35480, 8941, -48580, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3628, 35480, 8974, -48580, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3629, 35480, 9007, -48580, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3630, 35480, 9051, -48580, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3631, 35480, 9074, -48580, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3632, 35480, 9107, -48580, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3633, 35480, 9151, -48580, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3634, 35480, 9174, -48580, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3635, 35480, 9207, -48580, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3636, 35480, 9251, -48580, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3637, 35480, 8941, -48600, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3638, 35480, 8974, -48600, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3639, 35480, 9007, -48600, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3640, 35480, 9051, -48600, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3641, 35480, 9074, -48600, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3642, 35480, 9107, -48600, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3643, 35480, 9151, -48600, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3644, 35480, 9174, -48600, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3645, 35480, 9207, -48600, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3646, 35480, 9251, -48600, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3647, 35480, 8941, -49701, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3648, 35480, 8974, -49701, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3649, 35480, 9007, -49701, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3650, 35480, 9051, -49701, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3651, 35480, 9074, -49701, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3652, 35480, 9107, -49701, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3653, 35480, 9151, -49701, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3654, 35480, 9174, -49701, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3655, 35480, 9207, -49701, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3656, 35480, 9251, -49701, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3657, 35480, 8941, -49721, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3658, 35480, 8974, -49721, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3659, 35480, 9007, -49721, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3660, 35480, 9051, -49721, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3661, 35480, 9074, -49721, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3662, 35480, 9107, -49721, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3663, 35480, 9151, -49721, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3664, 35480, 9174, -49721, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3665, 35480, 9207, -49721, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3666, 35480, 9251, -49721, 1252, 16389, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3667, 35477, 8484, -48905, 1252, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3668, 35477, 8484, -48955, 1252, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3669, 35477, 8484, -49005, 1252, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3670, 35477, 8484, -49055, 1252, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3671, 35477, 8484, -49105, 1252, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3672, 35477, 8484, -49155, 1252, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3673, 35477, 8484, -49205, 1252, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3674, 35477, 8484, -49255, 1252, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3675, 35477, 8484, -49305, 1252, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3676, 35477, 8484, -49355, 1252, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3677, 35477, 8484, -48905, 1252, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3678, 35477, 8484, -48955, 1252, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3679, 35477, 8484, -49005, 1252, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3680, 35477, 8484, -49055, 1252, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3681, 35477, 8504, -49105, 1252, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3682, 35477, 8505, -49155, 1252, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3683, 35477, 8505, -49205, 1252, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3684, 35477, 8505, -49255, 1252, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3685, 35477, 8505, -49305, 1252, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3686, 35475, 17655, -49140, -1181, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3687, 35475, 17255, -49140, -1124, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3688, 35475, 16855, -49140, -1088, 63418, 10800, 0);
INSERT INTO `castle_siege_guards` VALUES (8, 3689, 35477, 8505, -49355, 1252, 63418, 10800, 0);

-- ----------------------------
-- Table structure for castle_trapupgrade
-- ----------------------------
DROP TABLE IF EXISTS `castle_trapupgrade`;
CREATE TABLE `castle_trapupgrade`  (
  `castleId` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `towerIndex` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `level` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`towerIndex`, `castleId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of castle_trapupgrade
-- ----------------------------

-- ----------------------------
-- Table structure for character_contacts
-- ----------------------------
DROP TABLE IF EXISTS `character_contacts`;
CREATE TABLE `character_contacts`  (
  `charId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `contactId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`charId`, `contactId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character_contacts
-- ----------------------------

-- ----------------------------
-- Table structure for character_daily_rewards
-- ----------------------------
DROP TABLE IF EXISTS `character_daily_rewards`;
CREATE TABLE `character_daily_rewards`  (
  `charId` int(10) UNSIGNED NOT NULL,
  `rewardId` int(3) UNSIGNED NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `progress` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `lastCompleted` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`charId`, `rewardId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character_daily_rewards
-- ----------------------------
INSERT INTO `character_daily_rewards` VALUES (268492456, 1001, 2, 3, 0);
INSERT INTO `character_daily_rewards` VALUES (268492456, 3027, 2, 3, 0);
INSERT INTO `character_daily_rewards` VALUES (268492456, 3028, 2, 3, 0);
INSERT INTO `character_daily_rewards` VALUES (268492456, 3029, 2, 3, 0);
INSERT INTO `character_daily_rewards` VALUES (268534748, 3027, 2, 9, 0);
INSERT INTO `character_daily_rewards` VALUES (268534748, 3028, 2, 9, 0);
INSERT INTO `character_daily_rewards` VALUES (268534748, 3029, 2, 9, 0);

-- ----------------------------
-- Table structure for character_friends
-- ----------------------------
DROP TABLE IF EXISTS `character_friends`;
CREATE TABLE `character_friends`  (
  `charId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `friendId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `relation` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `memo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`charId`, `friendId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character_friends
-- ----------------------------

-- ----------------------------
-- Table structure for character_hennas
-- ----------------------------
DROP TABLE IF EXISTS `character_hennas`;
CREATE TABLE `character_hennas`  (
  `charId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `symbol_id` int(11) NULL DEFAULT NULL,
  `slot` int(11) NOT NULL DEFAULT 0,
  `class_index` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`charId`, `slot`, `class_index`) USING BTREE,
  INDEX `idx_charId_classIndex`(`charId`, `class_index`) USING BTREE,
  INDEX `idx_charId_slot_classIndex`(`charId`, `slot`, `class_index`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character_hennas
-- ----------------------------

-- ----------------------------
-- Table structure for character_instance_time
-- ----------------------------
DROP TABLE IF EXISTS `character_instance_time`;
CREATE TABLE `character_instance_time`  (
  `charId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `instanceId` int(3) NOT NULL DEFAULT 0,
  `time` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`charId`, `instanceId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character_instance_time
-- ----------------------------

-- ----------------------------
-- Table structure for character_item_reuse_save
-- ----------------------------
DROP TABLE IF EXISTS `character_item_reuse_save`;
CREATE TABLE `character_item_reuse_save`  (
  `charId` int(11) NOT NULL DEFAULT 0,
  `itemId` int(11) NOT NULL DEFAULT 0,
  `itemObjId` int(3) NOT NULL DEFAULT 1,
  `reuseDelay` int(8) NOT NULL DEFAULT 0,
  `systime` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`charId`, `itemId`, `itemObjId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character_item_reuse_save
-- ----------------------------

-- ----------------------------
-- Table structure for character_macroses
-- ----------------------------
DROP TABLE IF EXISTS `character_macroses`;
CREATE TABLE `character_macroses`  (
  `charId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `id` int(11) NOT NULL DEFAULT 0,
  `icon` int(11) NULL DEFAULT NULL,
  `name` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `descr` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `acronym` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `commands` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`charId`, `id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character_macroses
-- ----------------------------
INSERT INTO `character_macroses` VALUES (268491433, 1000, 104, '11001', '', '1100', '3,0,0,//admin;');

-- ----------------------------
-- Table structure for character_mentees
-- ----------------------------
DROP TABLE IF EXISTS `character_mentees`;
CREATE TABLE `character_mentees`  (
  `charId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mentorId` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character_mentees
-- ----------------------------

-- ----------------------------
-- Table structure for character_offline_trade
-- ----------------------------
DROP TABLE IF EXISTS `character_offline_trade`;
CREATE TABLE `character_offline_trade`  (
  `charId` int(10) UNSIGNED NOT NULL,
  `time` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  `type` tinyint(4) NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`charId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character_offline_trade
-- ----------------------------

-- ----------------------------
-- Table structure for character_offline_trade_items
-- ----------------------------
DROP TABLE IF EXISTS `character_offline_trade_items`;
CREATE TABLE `character_offline_trade_items`  (
  `charId` int(10) UNSIGNED NOT NULL,
  `item` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `count` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `price` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  INDEX `charId`(`charId`) USING BTREE,
  INDEX `item`(`item`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character_offline_trade_items
-- ----------------------------

-- ----------------------------
-- Table structure for character_pet_skills_save
-- ----------------------------
DROP TABLE IF EXISTS `character_pet_skills_save`;
CREATE TABLE `character_pet_skills_save`  (
  `petObjItemId` int(11) NOT NULL DEFAULT 0,
  `skill_id` int(11) NOT NULL DEFAULT 0,
  `skill_level` int(3) NOT NULL DEFAULT 1,
  `skill_sub_level` int(4) NOT NULL DEFAULT 0,
  `remaining_time` int(11) NOT NULL DEFAULT 0,
  `buff_index` int(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`petObjItemId`, `skill_id`, `skill_level`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character_pet_skills_save
-- ----------------------------

-- ----------------------------
-- Table structure for character_premium_items
-- ----------------------------
DROP TABLE IF EXISTS `character_premium_items`;
CREATE TABLE `character_premium_items`  (
  `charId` int(11) NOT NULL,
  `itemNum` int(11) NOT NULL,
  `itemId` int(11) NOT NULL,
  `itemCount` bigint(20) UNSIGNED NOT NULL,
  `itemSender` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  INDEX `charId`(`charId`) USING BTREE,
  INDEX `itemNum`(`itemNum`) USING BTREE,
  INDEX `itemId`(`itemId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character_premium_items
-- ----------------------------

-- ----------------------------
-- Table structure for character_quests
-- ----------------------------
DROP TABLE IF EXISTS `character_quests`;
CREATE TABLE `character_quests`  (
  `charId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `var` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`charId`, `name`, `var`) USING BTREE,
  UNIQUE INDEX `idx_charId_name_var`(`charId`, `name`, `var`) USING BTREE,
  INDEX `idx_charId_name`(`charId`, `name`) USING BTREE,
  INDEX `idx_charId_var`(`charId`, `var`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character_quests
-- ----------------------------
INSERT INTO `character_quests` VALUES (268534748, 'Q10320_LetsGoToTheCentralSquare', '<state>', 'Completed');
INSERT INTO `character_quests` VALUES (268534748, 'Q10321_QualificationsOfTheSeeker', '<state>', 'Completed');
INSERT INTO `character_quests` VALUES (268534748, 'Q10541_TrainLikeTheRealThing', '<state>', 'Completed');
INSERT INTO `character_quests` VALUES (268534748, 'Q10542_SearchingForNewPower', '<state>', 'Started');
INSERT INTO `character_quests` VALUES (268534748, 'Q10542_SearchingForNewPower', 'cond', '3');

-- ----------------------------
-- Table structure for character_recipebook
-- ----------------------------
DROP TABLE IF EXISTS `character_recipebook`;
CREATE TABLE `character_recipebook`  (
  `charId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `id` decimal(11, 0) NOT NULL DEFAULT 0,
  `classIndex` tinyint(4) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`, `charId`, `classIndex`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character_recipebook
-- ----------------------------

-- ----------------------------
-- Table structure for character_recipeshoplist
-- ----------------------------
DROP TABLE IF EXISTS `character_recipeshoplist`;
CREATE TABLE `character_recipeshoplist`  (
  `charId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `recipeId` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `price` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `index` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`charId`, `recipeId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character_recipeshoplist
-- ----------------------------

-- ----------------------------
-- Table structure for character_reco_bonus
-- ----------------------------
DROP TABLE IF EXISTS `character_reco_bonus`;
CREATE TABLE `character_reco_bonus`  (
  `charId` int(10) UNSIGNED NOT NULL,
  `rec_have` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `rec_left` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `time_left` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  UNIQUE INDEX `charId`(`charId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character_reco_bonus
-- ----------------------------
INSERT INTO `character_reco_bonus` VALUES (268491433, 0, 0, 0);
INSERT INTO `character_reco_bonus` VALUES (268492103, 0, 0, 3600000);
INSERT INTO `character_reco_bonus` VALUES (268492456, 0, 0, 3600000);
INSERT INTO `character_reco_bonus` VALUES (268534748, 0, 0, 3600000);

-- ----------------------------
-- Table structure for character_shortcuts
-- ----------------------------
DROP TABLE IF EXISTS `character_shortcuts`;
CREATE TABLE `character_shortcuts`  (
  `charId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `slot` decimal(3, 0) NOT NULL DEFAULT 0,
  `page` decimal(3, 0) NOT NULL DEFAULT 0,
  `type` decimal(3, 0) NULL DEFAULT NULL,
  `shortcut_id` decimal(16, 0) NULL DEFAULT NULL,
  `level` mediumint(9) NULL DEFAULT NULL,
  `sub_level` int(4) NOT NULL DEFAULT 0,
  `class_index` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`charId`, `slot`, `page`, `class_index`) USING BTREE,
  INDEX `shortcut_id`(`shortcut_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character_shortcuts
-- ----------------------------
INSERT INTO `character_shortcuts` VALUES (268491433, 0, 0, 3, 2, 0, 0, 0);
INSERT INTO `character_shortcuts` VALUES (268491433, 1, 0, 4, 1000, 0, 0, 0);
INSERT INTO `character_shortcuts` VALUES (268491433, 3, 0, 3, 5, 0, 0, 0);
INSERT INTO `character_shortcuts` VALUES (268491433, 4, 0, 3, 4, 0, 0, 0);
INSERT INTO `character_shortcuts` VALUES (268491433, 10, 0, 3, 0, 0, 0, 0);
INSERT INTO `character_shortcuts` VALUES (268492103, 0, 0, 3, 2, 0, 0, 0);
INSERT INTO `character_shortcuts` VALUES (268492103, 3, 0, 3, 5, 0, 0, 0);
INSERT INTO `character_shortcuts` VALUES (268492103, 4, 0, 3, 4, 0, 0, 0);
INSERT INTO `character_shortcuts` VALUES (268492103, 10, 0, 3, 0, 0, 0, 0);
INSERT INTO `character_shortcuts` VALUES (268492456, 0, 0, 3, 2, 0, 0, 0);
INSERT INTO `character_shortcuts` VALUES (268492456, 1, 0, 3, 1099, 0, 0, 0);
INSERT INTO `character_shortcuts` VALUES (268492456, 3, 0, 3, 5, 0, 0, 0);
INSERT INTO `character_shortcuts` VALUES (268492456, 4, 0, 3, 4, 0, 0, 0);
INSERT INTO `character_shortcuts` VALUES (268492456, 10, 0, 3, 0, 0, 0, 0);
INSERT INTO `character_shortcuts` VALUES (268534748, 0, 0, 3, 2, 0, 0, 0);
INSERT INTO `character_shortcuts` VALUES (268534748, 3, 0, 3, 5, 0, 0, 0);
INSERT INTO `character_shortcuts` VALUES (268534748, 4, 0, 3, 4, 0, 0, 0);
INSERT INTO `character_shortcuts` VALUES (268534748, 10, 0, 3, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for character_skills
-- ----------------------------
DROP TABLE IF EXISTS `character_skills`;
CREATE TABLE `character_skills`  (
  `charId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `skill_id` int(11) NOT NULL DEFAULT 0,
  `skill_level` int(4) NOT NULL DEFAULT 1,
  `skill_sub_level` int(4) NOT NULL DEFAULT 0,
  `class_index` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`charId`, `skill_id`, `class_index`) USING BTREE,
  INDEX `idx_charId_classIndex`(`charId`, `class_index`) USING BTREE,
  INDEX `idx_skillId_charId_classIndex`(`skill_id`, `charId`, `class_index`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character_skills
-- ----------------------------
INSERT INTO `character_skills` VALUES (268491433, 194, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268491433, 239, 10, 0, 0);
INSERT INTO `character_skills` VALUES (268491433, 1320, 10, 0, 0);
INSERT INTO `character_skills` VALUES (268491433, 1322, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268491433, 17192, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268491433, 30400, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268491433, 30401, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268491433, 30402, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 7, 46, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 150, 3, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 194, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 239, 11, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 248, 6, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 261, 36, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 345, 17, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 430, 11, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 1320, 10, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 1322, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 1405, 6, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 1571, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 1572, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 1901, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 1902, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 1929, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 1947, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 1986, 7, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 8601, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10251, 7, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10252, 7, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10253, 7, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10254, 7, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10255, 7, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10256, 7, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10257, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10258, 13, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10260, 13, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10262, 11, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10265, 13, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10266, 13, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10267, 11, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10268, 6, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10269, 12, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10270, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10271, 2, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10273, 4, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10274, 4, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10275, 6, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10276, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10278, 8, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10279, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10280, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10281, 7, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10286, 7, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10289, 4, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10291, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10292, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10293, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10294, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10295, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10296, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10297, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10298, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10300, 8, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10301, 2, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10304, 4, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10318, 9, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10320, 3, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10324, 3, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10332, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 10956, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 11400, 30, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 11401, 30, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 11402, 30, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 11403, 30, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 11404, 30, 0, 0);
INSERT INTO `character_skills` VALUES (268492103, 17192, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 194, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 239, 11, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 841, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 842, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 1320, 10, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 1322, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 1405, 6, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 1571, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 1572, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 1986, 7, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 8904, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 10956, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 11400, 30, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 11401, 30, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 11402, 30, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 11403, 30, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 11404, 30, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 11509, 13, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 11510, 13, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 17192, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 17920, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 17943, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 30400, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 30401, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 30402, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 30500, 30, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 30501, 29, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 30502, 26, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 30503, 13, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 30504, 18, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 30505, 12, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 30506, 16, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 30507, 26, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 30508, 29, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 30509, 5, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 30510, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 30511, 7, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 30512, 4, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 30514, 3, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 30515, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 30516, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 30517, 13, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 30518, 13, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 30519, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 30520, 4, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 30522, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 30526, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 30530, 17, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 30540, 14, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 30541, 14, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 30542, 10, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 30543, 8, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 30544, 2, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 30545, 3, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 30546, 13, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 30547, 6, 0, 0);
INSERT INTO `character_skills` VALUES (268492456, 30602, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268534748, 194, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268534748, 239, 5, 0, 0);
INSERT INTO `character_skills` VALUES (268534748, 1320, 10, 0, 0);
INSERT INTO `character_skills` VALUES (268534748, 1322, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268534748, 1906, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268534748, 1908, 1, 0, 0);
INSERT INTO `character_skills` VALUES (268534748, 17192, 1, 0, 0);

-- ----------------------------
-- Table structure for character_skills_save
-- ----------------------------
DROP TABLE IF EXISTS `character_skills_save`;
CREATE TABLE `character_skills_save`  (
  `charId` int(11) NOT NULL DEFAULT 0,
  `skill_id` int(11) NOT NULL DEFAULT 0,
  `skill_level` int(4) NOT NULL DEFAULT 1,
  `skill_sub_level` int(4) NOT NULL DEFAULT 0,
  `remaining_time` int(11) NOT NULL DEFAULT 0,
  `reuse_delay` int(8) NOT NULL DEFAULT 0,
  `systime` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  `restore_type` int(1) NOT NULL DEFAULT 0,
  `class_index` int(1) NOT NULL DEFAULT 0,
  `buff_index` int(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`charId`, `skill_id`, `skill_level`, `class_index`) USING BTREE,
  INDEX `idx_charId_classIndex`(`charId`, `class_index`) USING BTREE,
  INDEX `idx_charId_classIndex_buffIndex`(`charId`, `class_index`, `buff_index`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character_skills_save
-- ----------------------------
INSERT INTO `character_skills_save` VALUES (268492103, 10291, 1, 0, 228, 0, 0, 0, 0, 9);
INSERT INTO `character_skills_save` VALUES (268492103, 10297, 1, 0, 1729, 0, 0, 0, 0, 10);
INSERT INTO `character_skills_save` VALUES (268492103, 15642, 1, 0, 2169, 0, 0, 0, 0, 1);
INSERT INTO `character_skills_save` VALUES (268492103, 15643, 1, 0, 2169, 0, 0, 0, 0, 2);
INSERT INTO `character_skills_save` VALUES (268492103, 15644, 1, 0, 2169, 0, 0, 0, 0, 3);
INSERT INTO `character_skills_save` VALUES (268492103, 15645, 1, 0, 2169, 0, 0, 0, 0, 4);
INSERT INTO `character_skills_save` VALUES (268492103, 15648, 1, 0, 2169, 0, 0, 0, 0, 8);
INSERT INTO `character_skills_save` VALUES (268492103, 15651, 1, 0, 2169, 0, 0, 0, 0, 5);
INSERT INTO `character_skills_save` VALUES (268492103, 15652, 1, 0, 2169, 0, 0, 0, 0, 6);
INSERT INTO `character_skills_save` VALUES (268492103, 15653, 1, 0, 2169, 0, 0, 0, 0, 7);
INSERT INTO `character_skills_save` VALUES (268534748, 15642, 1, 0, 865, 0, 0, 0, 0, 1);
INSERT INTO `character_skills_save` VALUES (268534748, 15643, 1, 0, 865, 0, 0, 0, 0, 3);
INSERT INTO `character_skills_save` VALUES (268534748, 15644, 1, 0, 865, 0, 0, 0, 0, 4);
INSERT INTO `character_skills_save` VALUES (268534748, 15645, 1, 0, 865, 0, 0, 0, 0, 2);
INSERT INTO `character_skills_save` VALUES (268534748, 15649, 1, 0, 865, 0, 0, 0, 0, 8);
INSERT INTO `character_skills_save` VALUES (268534748, 15651, 1, 0, 865, 0, 0, 0, 0, 5);
INSERT INTO `character_skills_save` VALUES (268534748, 15652, 1, 0, 865, 0, 0, 0, 0, 6);
INSERT INTO `character_skills_save` VALUES (268534748, 15653, 1, 0, 865, 0, 0, 0, 0, 7);

-- ----------------------------
-- Table structure for character_subclasses
-- ----------------------------
DROP TABLE IF EXISTS `character_subclasses`;
CREATE TABLE `character_subclasses`  (
  `charId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `class_id` int(2) NOT NULL DEFAULT 0,
  `exp` bigint(20) NOT NULL DEFAULT 0,
  `sp` bigint(10) NOT NULL DEFAULT 0,
  `level` int(2) NOT NULL DEFAULT 40,
  `vitality_points` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `class_index` int(1) NOT NULL DEFAULT 0,
  `dual_class` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`charId`, `class_id`) USING BTREE,
  INDEX `idx_charId_classIndex`(`charId`, `class_index`) USING BTREE,
  INDEX `idx_charId_classId`(`charId`, `class_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character_subclasses
-- ----------------------------

-- ----------------------------
-- Table structure for character_summon_skills_save
-- ----------------------------
DROP TABLE IF EXISTS `character_summon_skills_save`;
CREATE TABLE `character_summon_skills_save`  (
  `ownerId` int(11) NOT NULL DEFAULT 0,
  `ownerClassIndex` int(1) NOT NULL DEFAULT 0,
  `summonSkillId` int(11) NOT NULL DEFAULT 0,
  `skill_id` int(11) NOT NULL DEFAULT 0,
  `skill_level` int(3) NOT NULL DEFAULT 1,
  `skill_sub_level` int(4) NOT NULL DEFAULT 0,
  `remaining_time` int(11) NOT NULL DEFAULT 0,
  `buff_index` int(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ownerId`, `ownerClassIndex`, `summonSkillId`, `skill_id`, `skill_level`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character_summon_skills_save
-- ----------------------------
INSERT INTO `character_summon_skills_save` VALUES (268492456, 0, 1332, 4703, 8, 0, 197, 1);
INSERT INTO `character_summon_skills_save` VALUES (268492456, 0, 11329, 4703, 8, 0, 148, 1);
INSERT INTO `character_summon_skills_save` VALUES (268492456, 0, 11330, 4703, 8, 0, 158, 1);
INSERT INTO `character_summon_skills_save` VALUES (268492456, 0, 11331, 4703, 8, 0, 168, 1);
INSERT INTO `character_summon_skills_save` VALUES (268492456, 0, 11370, 11288, 4, 0, 1362, 1);
INSERT INTO `character_summon_skills_save` VALUES (268492456, 0, 11370, 11297, 4, 0, 1391, 2);
INSERT INTO `character_summon_skills_save` VALUES (268492456, 0, 11370, 11303, 1, 0, 1406, 6);
INSERT INTO `character_summon_skills_save` VALUES (268492456, 0, 11370, 11304, 1, 0, 1400, 5);
INSERT INTO `character_summon_skills_save` VALUES (268492456, 0, 11370, 11305, 1, 0, 1394, 3);
INSERT INTO `character_summon_skills_save` VALUES (268492456, 0, 11370, 11306, 1, 0, 1396, 4);
INSERT INTO `character_summon_skills_save` VALUES (268492456, 0, 11370, 11307, 1, 0, 1409, 7);
INSERT INTO `character_summon_skills_save` VALUES (268492456, 0, 11370, 11308, 1, 0, 1410, 8);
INSERT INTO `character_summon_skills_save` VALUES (268492456, 0, 11370, 11347, 7, 0, 1415, 9);
INSERT INTO `character_summon_skills_save` VALUES (268492456, 0, 11371, 4703, 8, 0, 178, 1);
INSERT INTO `character_summon_skills_save` VALUES (268492456, 0, 11372, 4703, 8, 0, 157, 1);
INSERT INTO `character_summon_skills_save` VALUES (268492456, 0, 11373, 11349, 7, 0, 1498, 1);
INSERT INTO `character_summon_skills_save` VALUES (268492456, 0, 11373, 19220, 1, 0, 1518, 2);
INSERT INTO `character_summon_skills_save` VALUES (268492456, 0, 11374, 11349, 7, 0, 1498, 1);
INSERT INTO `character_summon_skills_save` VALUES (268492456, 0, 11374, 19220, 1, 0, 1518, 2);

-- ----------------------------
-- Table structure for character_summons
-- ----------------------------
DROP TABLE IF EXISTS `character_summons`;
CREATE TABLE `character_summons`  (
  `ownerId` int(10) UNSIGNED NOT NULL,
  `summonId` int(10) UNSIGNED NOT NULL,
  `summonSkillId` int(10) UNSIGNED NOT NULL,
  `curHp` int(9) UNSIGNED NULL DEFAULT 0,
  `curMp` int(9) UNSIGNED NULL DEFAULT 0,
  `time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`ownerId`, `summonId`, `summonSkillId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character_summons
-- ----------------------------

-- ----------------------------
-- Table structure for character_tpbookmark
-- ----------------------------
DROP TABLE IF EXISTS `character_tpbookmark`;
CREATE TABLE `character_tpbookmark`  (
  `charId` int(20) NOT NULL,
  `Id` int(20) NOT NULL,
  `x` int(20) NOT NULL,
  `y` int(20) NOT NULL,
  `z` int(20) NOT NULL,
  `icon` int(20) NOT NULL,
  `tag` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`charId`, `Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character_tpbookmark
-- ----------------------------

-- ----------------------------
-- Table structure for character_transmogs
-- ----------------------------
DROP TABLE IF EXISTS `character_transmogs`;
CREATE TABLE `character_transmogs`  (
  `owner` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `itemId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`owner`, `itemId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character_transmogs
-- ----------------------------

-- ----------------------------
-- Table structure for character_variables
-- ----------------------------
DROP TABLE IF EXISTS `character_variables`;
CREATE TABLE `character_variables`  (
  `charId` int(10) UNSIGNED NOT NULL,
  `var` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `val` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  INDEX `idx_charId`(`charId`) USING BTREE,
  INDEX `idx_var`(`var`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character_variables
-- ----------------------------
INSERT INTO `character_variables` VALUES (268492103, 'AUTO_USE_SETTINGS', '0,0,1,1,0,50,1');
INSERT INTO `character_variables` VALUES (268492103, 'AUTO_USE_ACTIONS', '2');
INSERT INTO `character_variables` VALUES (268492103, 'TUTORIAL', '1');
INSERT INTO `character_variables` VALUES (268492103, 'TI_presentation_movie', 'true');
INSERT INTO `character_variables` VALUES (268492103, 'AUTO_USE_BUFFS', '10274,10291,10279,10297,10332');
INSERT INTO `character_variables` VALUES (268492103, 'TI_YESEGIRA_MOVIE', 'true');
INSERT INTO `character_variables` VALUES (268492103, 'AUTO_USE_SKILLS', '7,261,10258,10260,10262,10265,10269');
INSERT INTO `character_variables` VALUES (268492103, 'CLIENT_SETTINGS', '{PARTY_CONTRIBUTION_TYPE=0, FRIENDS_REQUEST_RESTRICTED_FROM_OTHERS=false, PARTY_REQUEST_RESTRICTED_FROM_FRIENDS=false, FRIENDS_REQUEST_RESTRICTED_FROM_CLAN=false, PARTY_REQUEST_RESTRICTED_FROM_OTHERS=false, PARTY_REQUEST_RESTRICTED_FROM_CLAN=false}');
INSERT INTO `character_variables` VALUES (268492456, 'CLAN_CONTRIBUTION_TOTAL_PREVIOUS', '2');
INSERT INTO `character_variables` VALUES (268492456, 'AUTO_USE_SETTINGS', '0,0,1,1,0,50,1');
INSERT INTO `character_variables` VALUES (268492456, 'CLAN_CONTRIBUTION_TOTAL', '2');
INSERT INTO `character_variables` VALUES (268492456, 'WORLD_CHAT_USED', '0');
INSERT INTO `character_variables` VALUES (268492456, 'TUTORIAL', '1');
INSERT INTO `character_variables` VALUES (268492456, 'CLAN_CONTRIBUTION_PREVIOUS', '2');
INSERT INTO `character_variables` VALUES (268492456, 'ANCIENT_ARCAN_CITY_SCENE', 'false');
INSERT INTO `character_variables` VALUES (268492456, 'TI_YESEGIRA_MOVIE', 'true');
INSERT INTO `character_variables` VALUES (268492456, 'CLIENT_SETTINGS', '{PARTY_CONTRIBUTION_TYPE=0, FRIENDS_REQUEST_RESTRICTED_FROM_OTHERS=false, PARTY_REQUEST_RESTRICTED_FROM_FRIENDS=false, FRIENDS_REQUEST_RESTRICTED_FROM_CLAN=false, PARTY_REQUEST_RESTRICTED_FROM_OTHERS=false, PARTY_REQUEST_RESTRICTED_FROM_CLAN=false}');
INSERT INTO `character_variables` VALUES (268534748, 'AUTO_USE_SETTINGS', '0,0,1,1,0,50,1');
INSERT INTO `character_variables` VALUES (268534748, 'TUTORIAL', '1');
INSERT INTO `character_variables` VALUES (268534748, 'TI_YESEGIRA_MOVIE', 'true');
INSERT INTO `character_variables` VALUES (268491433, 'AUTO_USE_SETTINGS', '0,0,0,1,1,50,0');
INSERT INTO `character_variables` VALUES (268491433, 'TUTORIAL', '1');

-- ----------------------------
-- Table structure for characters
-- ----------------------------
DROP TABLE IF EXISTS `characters`;
CREATE TABLE `characters`  (
  `account_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `charId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `char_name` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `level` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `maxHp` mediumint(8) UNSIGNED NULL DEFAULT NULL,
  `curHp` mediumint(8) UNSIGNED NULL DEFAULT NULL,
  `maxCp` mediumint(8) UNSIGNED NULL DEFAULT NULL,
  `curCp` mediumint(8) UNSIGNED NULL DEFAULT NULL,
  `maxMp` mediumint(8) UNSIGNED NULL DEFAULT NULL,
  `curMp` mediumint(8) UNSIGNED NULL DEFAULT NULL,
  `face` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `hairStyle` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `hairColor` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `sex` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `heading` mediumint(9) NULL DEFAULT NULL,
  `x` mediumint(9) NULL DEFAULT NULL,
  `y` mediumint(9) NULL DEFAULT NULL,
  `z` mediumint(9) NULL DEFAULT NULL,
  `exp` bigint(20) UNSIGNED NULL DEFAULT 0,
  `expBeforeDeath` bigint(20) UNSIGNED NULL DEFAULT 0,
  `sp` bigint(10) UNSIGNED NOT NULL DEFAULT 0,
  `reputation` int(11) NULL DEFAULT NULL,
  `fame` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `raidbossPoints` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `pvpkills` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `pkkills` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `clanid` int(10) UNSIGNED NULL DEFAULT NULL,
  `race` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `classid` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `base_class` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `transform_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `deletetime` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  `cancraft` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `title` varchar(21) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `title_color` mediumint(8) UNSIGNED NOT NULL DEFAULT 15530402,
  `accesslevel` mediumint(9) NULL DEFAULT 0,
  `online` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `onlinetime` int(11) NULL DEFAULT NULL,
  `char_slot` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `lastAccess` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  `clan_privs` int(10) UNSIGNED NULL DEFAULT 0,
  `wantspeace` tinyint(3) UNSIGNED NULL DEFAULT 0,
  `power_grade` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `nobless` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `subpledge` smallint(6) NOT NULL DEFAULT 0,
  `lvl_joined_academy` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `apprentice` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sponsor` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `clan_join_expiry_time` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  `clan_create_expiry_time` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  `bookmarkslot` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `vitality_points` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `createDate` date NOT NULL DEFAULT '2015-01-01',
  `language` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `faction` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `pccafe_points` int(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`charId`) USING BTREE,
  INDEX `account_name`(`account_name`) USING BTREE,
  INDEX `char_name`(`char_name`) USING BTREE,
  INDEX `clanid`(`clanid`) USING BTREE,
  INDEX `online`(`online`) USING BTREE,
  INDEX `idx_charId`(`charId`) USING BTREE,
  INDEX `idx_char_name`(`char_name`) USING BTREE,
  INDEX `idx_account_name`(`account_name`) USING BTREE,
  INDEX `idx_accountName_createDate`(`account_name`, `createDate`) USING BTREE,
  INDEX `idx_createDate`(`createDate`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of characters
-- ----------------------------
INSERT INTO `characters` VALUES ('1234', 268491433, '測試人員', 100, 4479, 4479, 1722, 1722, 7952, 7690, 0, 3, 1, 1, 29345, 83020, 148585, -3472, 5627754979660, 0, 0, 0, 0, 0, 0, 0, 0, 6, 182, 182, 0, 0, 0, '', 52479, 100, 0, 2854, NULL, 1744382595004, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 140000, '2025-04-02', NULL, 0, 0);
INSERT INTO `characters` VALUES ('mh55660006', 268492103, '黑泥哥', 120, 62359, 62359, 47272, 39900, 24956, 11535, 0, 2, 2, 0, 33705, 73353, 117748, -3704, 2303169468849899999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 152, 152, 0, 0, 0, '', 52479, 100, 0, 1607, NULL, 1743533767998, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 140000, '2025-04-01', NULL, 0, 0);
INSERT INTO `characters` VALUES ('special884500', 268492456, '丐幫幫主君逍遙', 120, 23392, 23392, 14348, 14348, 8916, 8916, 2, 2, 3, 1, 63477, 83307, 148036, -3408, 1885854757371170057, 0, 97607602024, 0, 0, 1001, 0, 0, 0, 6, 188, 188, 0, 0, 0, '', 52479, 100, 0, 326573, NULL, 1743849700159, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 140000, '2025-04-01', NULL, 0, 0);
INSERT INTO `characters` VALUES ('s8524120', 268534748, '9999123', 5, 434, 434, 133, 133, 93, 93, 0, 0, 2, 1, 29412, -111512, 255954, -1432, 2994, 0, 18, 0, 0, 0, 0, 0, 0, 1, 18, 18, 0, 0, 0, '', 52479, 100, 0, 3445, NULL, 1743951404809, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 140000, '2025-04-02', NULL, 0, 0);

-- ----------------------------
-- Table structure for clan_data
-- ----------------------------
DROP TABLE IF EXISTS `clan_data`;
CREATE TABLE `clan_data`  (
  `clan_id` int(11) NOT NULL DEFAULT 0,
  `clan_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `clan_level` int(11) NULL DEFAULT NULL,
  `reputation_score` int(11) NOT NULL DEFAULT 0,
  `hasCastle` int(11) NULL DEFAULT NULL,
  `blood_alliance_count` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `blood_oath_count` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `ally_id` int(11) NULL DEFAULT NULL,
  `ally_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `leader_id` int(11) NULL DEFAULT NULL,
  `crest_id` int(11) NULL DEFAULT NULL,
  `crest_large_id` int(11) NULL DEFAULT NULL,
  `ally_crest_id` int(11) NULL DEFAULT NULL,
  `auction_bid_at` int(11) NOT NULL DEFAULT 0,
  `ally_penalty_expiry_time` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  `ally_penalty_type` tinyint(1) NOT NULL DEFAULT 0,
  `char_penalty_expiry_time` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  `dissolving_expiry_time` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  `new_leader_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`clan_id`) USING BTREE,
  INDEX `ally_id`(`ally_id`) USING BTREE,
  INDEX `leader_id`(`leader_id`) USING BTREE,
  INDEX `auction_bid_at`(`auction_bid_at`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clan_data
-- ----------------------------

-- ----------------------------
-- Table structure for clan_notices
-- ----------------------------
DROP TABLE IF EXISTS `clan_notices`;
CREATE TABLE `clan_notices`  (
  `clan_id` int(11) NOT NULL DEFAULT 0,
  `enabled` enum('true','false') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'false',
  `notice` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`clan_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clan_notices
-- ----------------------------

-- ----------------------------
-- Table structure for clan_privs
-- ----------------------------
DROP TABLE IF EXISTS `clan_privs`;
CREATE TABLE `clan_privs`  (
  `clan_id` int(11) NOT NULL DEFAULT 0,
  `rank` int(11) NOT NULL DEFAULT 0,
  `party` int(11) NOT NULL DEFAULT 0,
  `privs` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`clan_id`, `rank`, `party`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clan_privs
-- ----------------------------

-- ----------------------------
-- Table structure for clan_skills
-- ----------------------------
DROP TABLE IF EXISTS `clan_skills`;
CREATE TABLE `clan_skills`  (
  `clan_id` int(11) NOT NULL DEFAULT 0,
  `skill_id` int(11) NOT NULL DEFAULT 0,
  `skill_level` int(5) NOT NULL DEFAULT 0,
  `skill_name` varchar(26) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `sub_pledge_id` int(11) NOT NULL DEFAULT -2,
  PRIMARY KEY (`clan_id`, `skill_id`, `sub_pledge_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clan_skills
-- ----------------------------

-- ----------------------------
-- Table structure for clan_subpledges
-- ----------------------------
DROP TABLE IF EXISTS `clan_subpledges`;
CREATE TABLE `clan_subpledges`  (
  `clan_id` int(11) NOT NULL DEFAULT 0,
  `sub_pledge_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `leader_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`clan_id`, `sub_pledge_id`) USING BTREE,
  INDEX `leader_id`(`leader_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clan_subpledges
-- ----------------------------

-- ----------------------------
-- Table structure for clan_variables
-- ----------------------------
DROP TABLE IF EXISTS `clan_variables`;
CREATE TABLE `clan_variables`  (
  `clanId` int(10) UNSIGNED NOT NULL,
  `var` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `val` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  INDEX `clanId`(`clanId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clan_variables
-- ----------------------------

-- ----------------------------
-- Table structure for clan_wars
-- ----------------------------
DROP TABLE IF EXISTS `clan_wars`;
CREATE TABLE `clan_wars`  (
  `clan1` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `clan2` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `clan1Kill` int(11) NOT NULL DEFAULT 0,
  `clan2Kill` int(11) NOT NULL DEFAULT 0,
  `winnerClan` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `startTime` bigint(13) NOT NULL DEFAULT 0,
  `endTime` bigint(13) NOT NULL DEFAULT 0,
  `state` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`clan1`, `clan2`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clan_wars
-- ----------------------------

-- ----------------------------
-- Table structure for clanhall
-- ----------------------------
DROP TABLE IF EXISTS `clanhall`;
CREATE TABLE `clanhall`  (
  `id` int(11) NOT NULL DEFAULT 0,
  `ownerId` int(11) NOT NULL DEFAULT 0,
  `paidUntil` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ownerId`(`ownerId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clanhall
-- ----------------------------
INSERT INTO `clanhall` VALUES (22, 0, 0);
INSERT INTO `clanhall` VALUES (23, 0, 0);
INSERT INTO `clanhall` VALUES (24, 0, 0);
INSERT INTO `clanhall` VALUES (25, 0, 0);
INSERT INTO `clanhall` VALUES (26, 0, 0);
INSERT INTO `clanhall` VALUES (27, 0, 0);
INSERT INTO `clanhall` VALUES (28, 0, 0);
INSERT INTO `clanhall` VALUES (29, 0, 0);
INSERT INTO `clanhall` VALUES (30, 0, 0);
INSERT INTO `clanhall` VALUES (31, 0, 0);
INSERT INTO `clanhall` VALUES (32, 0, 0);
INSERT INTO `clanhall` VALUES (33, 0, 0);
INSERT INTO `clanhall` VALUES (36, 0, 0);
INSERT INTO `clanhall` VALUES (37, 0, 0);
INSERT INTO `clanhall` VALUES (38, 0, 0);
INSERT INTO `clanhall` VALUES (39, 0, 0);
INSERT INTO `clanhall` VALUES (40, 0, 0);
INSERT INTO `clanhall` VALUES (41, 0, 0);
INSERT INTO `clanhall` VALUES (42, 0, 0);
INSERT INTO `clanhall` VALUES (43, 0, 0);
INSERT INTO `clanhall` VALUES (44, 0, 0);
INSERT INTO `clanhall` VALUES (45, 0, 0);
INSERT INTO `clanhall` VALUES (46, 0, 0);
INSERT INTO `clanhall` VALUES (47, 0, 0);
INSERT INTO `clanhall` VALUES (48, 0, 0);
INSERT INTO `clanhall` VALUES (49, 0, 0);
INSERT INTO `clanhall` VALUES (50, 0, 0);
INSERT INTO `clanhall` VALUES (51, 0, 0);
INSERT INTO `clanhall` VALUES (52, 0, 0);
INSERT INTO `clanhall` VALUES (53, 0, 0);
INSERT INTO `clanhall` VALUES (54, 0, 0);
INSERT INTO `clanhall` VALUES (55, 0, 0);
INSERT INTO `clanhall` VALUES (56, 0, 0);
INSERT INTO `clanhall` VALUES (57, 0, 0);
INSERT INTO `clanhall` VALUES (58, 0, 0);
INSERT INTO `clanhall` VALUES (59, 0, 0);
INSERT INTO `clanhall` VALUES (60, 0, 0);
INSERT INTO `clanhall` VALUES (61, 0, 0);
INSERT INTO `clanhall` VALUES (65, 0, 0);
INSERT INTO `clanhall` VALUES (66, 0, 0);
INSERT INTO `clanhall` VALUES (67, 0, 0);
INSERT INTO `clanhall` VALUES (68, 0, 0);
INSERT INTO `clanhall` VALUES (69, 0, 0);
INSERT INTO `clanhall` VALUES (70, 0, 0);
INSERT INTO `clanhall` VALUES (71, 0, 0);
INSERT INTO `clanhall` VALUES (72, 0, 0);
INSERT INTO `clanhall` VALUES (73, 0, 0);
INSERT INTO `clanhall` VALUES (74, 0, 0);
INSERT INTO `clanhall` VALUES (186, 0, 0);
INSERT INTO `clanhall` VALUES (187, 0, 0);
INSERT INTO `clanhall` VALUES (188, 0, 0);
INSERT INTO `clanhall` VALUES (189, 0, 0);
INSERT INTO `clanhall` VALUES (190, 0, 0);
INSERT INTO `clanhall` VALUES (191, 0, 0);
INSERT INTO `clanhall` VALUES (192, 0, 0);
INSERT INTO `clanhall` VALUES (193, 0, 0);
INSERT INTO `clanhall` VALUES (194, 0, 0);

-- ----------------------------
-- Table structure for clanhall_auctions_bidders
-- ----------------------------
DROP TABLE IF EXISTS `clanhall_auctions_bidders`;
CREATE TABLE `clanhall_auctions_bidders`  (
  `clanHallId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `clanId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `bid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `bidTime` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`clanHallId`, `clanId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clanhall_auctions_bidders
-- ----------------------------

-- ----------------------------
-- Table structure for commission_items
-- ----------------------------
DROP TABLE IF EXISTS `commission_items`;
CREATE TABLE `commission_items`  (
  `commission_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_object_id` int(11) NOT NULL,
  `price_per_unit` bigint(20) NOT NULL,
  `start_time` timestamp NOT NULL,
  `duration_in_days` tinyint(4) NOT NULL,
  `discount_in_percentage` tinyint(4) NOT NULL,
  PRIMARY KEY (`commission_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commission_items
-- ----------------------------

-- ----------------------------
-- Table structure for crests
-- ----------------------------
DROP TABLE IF EXISTS `crests`;
CREATE TABLE `crests`  (
  `crest_id` int(11) NOT NULL,
  `data` varbinary(2176) NOT NULL,
  `type` tinyint(4) NOT NULL,
  PRIMARY KEY (`crest_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crests
-- ----------------------------

-- ----------------------------
-- Table structure for cursed_weapons
-- ----------------------------
DROP TABLE IF EXISTS `cursed_weapons`;
CREATE TABLE `cursed_weapons`  (
  `itemId` int(11) NOT NULL,
  `charId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `playerReputation` int(11) NULL DEFAULT 0,
  `playerPkKills` int(11) NULL DEFAULT 0,
  `nbKills` int(11) NULL DEFAULT 0,
  `endTime` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`itemId`) USING BTREE,
  INDEX `charId`(`charId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cursed_weapons
-- ----------------------------

-- ----------------------------
-- Table structure for custom_mail
-- ----------------------------
DROP TABLE IF EXISTS `custom_mail`;
CREATE TABLE `custom_mail`  (
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `receiver` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `subject` tinytext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `items` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of custom_mail
-- ----------------------------

-- ----------------------------
-- Table structure for dzchar
-- ----------------------------
DROP TABLE IF EXISTS `dzchar`;
CREATE TABLE `dzchar`  (
  `id` int(11) NOT NULL,
  `shuzhi` int(11) NULL DEFAULT NULL,
  `part` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `level` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dzchar
-- ----------------------------

-- ----------------------------
-- Table structure for event_schedulers
-- ----------------------------
DROP TABLE IF EXISTS `event_schedulers`;
CREATE TABLE `event_schedulers`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `eventName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `schedulerName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `lastRun` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `eventName_schedulerName`(`eventName`, `schedulerName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of event_schedulers
-- ----------------------------

-- ----------------------------
-- Table structure for fort
-- ----------------------------
DROP TABLE IF EXISTS `fort`;
CREATE TABLE `fort`  (
  `id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `siegeDate` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  `lastOwnedTime` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0,
  `fortType` int(1) NOT NULL DEFAULT 0,
  `state` int(1) NOT NULL DEFAULT 0,
  `castleId` int(1) NOT NULL DEFAULT 0,
  `supplyLvL` int(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `owner`(`owner`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fort
-- ----------------------------
INSERT INTO `fort` VALUES (101, 'Shanty', 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `fort` VALUES (102, 'Southern', 0, 0, 0, 1, 0, 0, 0);
INSERT INTO `fort` VALUES (103, 'Hive', 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `fort` VALUES (104, 'Valley', 0, 0, 0, 1, 0, 0, 0);
INSERT INTO `fort` VALUES (105, 'Ivory', 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `fort` VALUES (106, 'Narsell', 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `fort` VALUES (107, 'Bayou', 0, 0, 0, 1, 0, 0, 0);
INSERT INTO `fort` VALUES (108, 'White Sands', 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `fort` VALUES (109, 'Borderland', 0, 0, 0, 1, 0, 0, 0);
INSERT INTO `fort` VALUES (110, 'Swamp', 0, 0, 0, 1, 0, 0, 0);
INSERT INTO `fort` VALUES (111, 'Archaic', 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `fort` VALUES (112, 'Floran', 0, 0, 0, 1, 0, 0, 0);
INSERT INTO `fort` VALUES (114, 'Tanor', 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `fort` VALUES (115, 'Dragonspine', 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `fort` VALUES (116, 'Antharas', 0, 0, 0, 1, 0, 0, 0);
INSERT INTO `fort` VALUES (117, 'Western', 0, 0, 0, 1, 0, 0, 0);
INSERT INTO `fort` VALUES (118, 'Hunters', 0, 0, 0, 1, 0, 0, 0);
INSERT INTO `fort` VALUES (119, 'Aaru', 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `fort` VALUES (120, 'Demon', 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `fort` VALUES (121, 'Monastic', 0, 0, 0, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for fort_doorupgrade
-- ----------------------------
DROP TABLE IF EXISTS `fort_doorupgrade`;
CREATE TABLE `fort_doorupgrade`  (
  `doorId` int(11) NOT NULL DEFAULT 0,
  `fortId` int(11) NOT NULL,
  `hp` int(11) NOT NULL DEFAULT 0,
  `pDef` int(11) NOT NULL DEFAULT 0,
  `mDef` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`doorId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fort_doorupgrade
-- ----------------------------

-- ----------------------------
-- Table structure for fort_functions
-- ----------------------------
DROP TABLE IF EXISTS `fort_functions`;
CREATE TABLE `fort_functions`  (
  `fort_id` int(2) NOT NULL DEFAULT 0,
  `type` int(1) NOT NULL DEFAULT 0,
  `lvl` int(3) NOT NULL DEFAULT 0,
  `lease` int(10) NOT NULL DEFAULT 0,
  `rate` decimal(20, 0) NOT NULL DEFAULT 0,
  `endTime` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`fort_id`, `type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fort_functions
-- ----------------------------

-- ----------------------------
-- Table structure for fort_siege_guards
-- ----------------------------
DROP TABLE IF EXISTS `fort_siege_guards`;
CREATE TABLE `fort_siege_guards`  (
  `fortId` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `id` smallint(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  `npcId` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `x` mediumint(6) NOT NULL DEFAULT 0,
  `y` mediumint(6) NOT NULL DEFAULT 0,
  `z` mediumint(6) NOT NULL DEFAULT 0,
  `heading` mediumint(6) NOT NULL DEFAULT 0,
  `respawnDelay` mediumint(5) NOT NULL DEFAULT 0,
  `isHired` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`fortId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3498 CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fort_siege_guards
-- ----------------------------
INSERT INTO `fort_siege_guards` VALUES (101, 1, 35682, -53815, 155646, -2024, 56240, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 2, 35681, -53824, 155264, -2024, 14952, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 3, 35681, -53694, 155121, -2024, 13264, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 4, 35681, -53711, 155501, -2024, 23976, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 5, 35682, -53673, 155308, -2024, 17760, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 6, 35681, -54208, 155632, -2024, 3672, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 7, 35685, -53378, 154775, -2048, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 8, 35674, -54112, 154912, -1672, 37000, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 9, 35674, -54080, 154880, -1672, 45000, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 10, 35674, -53928, 154752, -1672, 43000, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 11, 35674, -53882, 154739, -1672, 50000, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 12, 35674, -54644, 157598, -1672, 8028, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 13, 35672, -53279, 156004, -1680, 46167, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 14, 35672, -53308, 156012, -1680, 46167, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 15, 35672, -53339, 156021, -1680, 46167, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 16, 35682, -54638, 156499, -1872, 3692, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 17, 35674, -54665, 156490, -1872, 17332, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 18, 35674, -54677, 156521, -1872, 17677, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 19, 35681, -54706, 157042, -2048, 27522, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 20, 35674, -54248, 156312, -1696, 36288, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 21, 35674, -54237, 156284, -1696, 36288, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 22, 35682, -54224, 156320, -1696, 36292, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 23, 35681, -54214, 156292, -1696, 36292, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 24, 35674, -54467, 157550, -1872, 10226, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 25, 35674, -54445, 157575, -1872, 10108, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 26, 35682, -54427, 157559, -1872, 57719, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 27, 35681, -54626, 157154, -2048, 34565, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 28, 35682, -53970, 157575, -1696, 25380, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 29, 35674, -53990, 157591, -1696, 25380, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 30, 35674, -53970, 157615, -1696, 25380, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 31, 35681, -53951, 157598, -1696, 25380, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 32, 35673, -54767, 157106, -2048, 28672, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 33, 35674, -54488, 156515, -1608, 20000, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 34, 35674, -54509, 156473, -1608, 20000, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 35, 35674, -54556, 156492, -1608, 20000, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 36, 35674, -54520, 156504, -1608, 20000, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 37, 35674, -54363, 157530, -1592, 41216, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 38, 35674, -54369, 157577, -1608, 41216, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 39, 35674, -54419, 157579, -1608, 41216, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 40, 35674, -54392, 157553, -1608, 41216, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 41, 35674, -53899, 156904, -2048, 28672, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 42, 35674, -53841, 156940, -2048, 28672, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 43, 35674, -53862, 156871, -2048, 28672, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 44, 35674, -53851, 156906, -2048, 28672, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 45, 35674, -53873, 156836, -2048, 28672, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 46, 35674, -54657, 157544, -1656, 8241, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 47, 35674, -54912, 156704, -1656, 14303, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 48, 35674, -54926, 156651, -1672, 14407, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 49, 35673, -53338, 156719, -2048, 28672, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 50, 35673, -53347, 156689, -2048, 28672, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 51, 35673, -53358, 156657, -2048, 28672, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 52, 35673, -53368, 156625, -2048, 28672, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 53, 35673, -54747, 157168, -2048, 28672, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 54, 35673, -54756, 157138, -2048, 28672, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 55, 35673, -54777, 157074, -2048, 28672, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 56, 35674, -51243, 155431, -1608, 8500, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 57, 35684, -52131, 155249, -1976, 62488, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 58, 35684, -52702, 155018, -1976, 30240, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 59, 35684, -52465, 155136, -1976, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 60, 35684, -52604, 155371, -1976, 30328, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 61, 35684, -52296, 154863, -1976, 45936, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 62, 35684, -52671, 154976, -1976, 45936, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 63, 35684, -52566, 155402, -1976, 12624, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 64, 35684, -52170, 155285, -1976, 12624, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 65, 35684, -52252, 154873, -1976, 62832, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 66, 35684, -52550, 154894, -1872, 12624, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 67, 35684, -52521, 154884, -1872, 12624, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 68, 35684, -52285, 155363, -1872, 46392, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 69, 35684, -52316, 155373, -1872, 45936, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 70, 35674, -51569, 155421, -1696, 56696, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 71, 35674, -51593, 155400, -1696, 56696, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 72, 35682, -51590, 155441, -1696, 56696, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 73, 35681, -51613, 155421, -1696, 56696, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 74, 35674, -51269, 155502, -1608, 8500, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 75, 35674, -51244, 155478, -1608, 8500, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 76, 35674, -51219, 155454, -1608, 8500, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 77, 35685, -53090, 155633, -2048, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 78, 35674, -52979, 154458, -1656, 42999, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 79, 35674, -52929, 154446, -1672, 64153, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 80, 35674, -51529, 154796, -1672, 59999, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 81, 35674, -51563, 154766, -1672, 54000, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 82, 35672, -52633, 155907, -1536, 29823, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 83, 35672, -52625, 155937, -1544, 29823, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 84, 35672, -52616, 155967, -1536, 29823, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 85, 35672, -52277, 156720, -1336, 45999, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 86, 35672, -52246, 156710, -1336, 45999, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 87, 35672, -52307, 156729, -1336, 45999, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 88, 35672, -53018, 156745, -1160, 29500, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 89, 35672, -53009, 156773, -1160, 29500, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 90, 35672, -53000, 156801, -1160, 29500, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 91, 35672, -52991, 156829, -1160, 29500, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 92, 35672, -53053, 156622, -1160, 29500, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 93, 35672, -53044, 156651, -1160, 29500, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 94, 35672, -53026, 156707, -1160, 29500, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 95, 35672, -53035, 156679, -1160, 29500, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 96, 35671, -52650, 156505, -1128, 62264, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 97, 35671, -52659, 156478, -1128, 62264, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 98, 35671, -52668, 156451, -1128, 62264, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 99, 35671, -52846, 156563, -1128, 29992, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 100, 35671, -52677, 156424, -1128, 62264, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 101, 35671, -52854, 156535, -1128, 29992, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 102, 35671, -52861, 156508, -1128, 29992, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 103, 35671, -52869, 156481, -1128, 29992, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 104, 35670, -52818, 156512, -1128, 29992, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 105, 35678, -52279, 157693, -2024, 62372, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 106, 35673, -52185, 156258, -2048, 62199, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 107, 35685, -52000, 157181, -2048, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 108, 35674, -51679, 156168, -2048, 62199, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 109, 35674, -51710, 156231, -2048, 62199, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 110, 35674, -51730, 156162, -2048, 62199, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 111, 35673, -52153, 156362, -2048, 62199, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 112, 35673, -52174, 156292, -2048, 62199, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 113, 35673, -52163, 156328, -2048, 62199, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 114, 35674, -51741, 156128, -2048, 62199, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 115, 35674, -51720, 156198, -2048, 62199, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 116, 35674, -51068, 155409, -1872, 10396, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 117, 35674, -51089, 155386, -1872, 10619, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 118, 35682, -51049, 155390, -1872, 24632, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 119, 35681, -50888, 155864, -2056, 3620, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 120, 35674, -50871, 155481, -1672, 13190, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 121, 35674, -50884, 155429, -1672, 13248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 122, 35674, -50934, 156494, -1608, 52148, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 123, 35674, -50731, 156483, -1872, 16818, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 124, 35674, -50722, 156453, -1872, 17146, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 125, 35681, -50830, 155970, -2056, 64002, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 126, 35682, -50703, 156490, -1872, 35592, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 127, 35674, -51151, 156716, -1696, 3068, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 128, 35674, -51161, 156745, -1696, 3068, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 129, 35682, -51178, 156708, -1696, 3068, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 130, 35681, -51186, 156736, -1696, 3068, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 131, 35674, -50942, 156526, -1608, 52148, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 132, 35674, -50969, 156485, -1608, 52148, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 133, 35674, -50897, 156503, -1608, 52148, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 134, 35674, -50602, 156356, -1656, 17810, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 135, 35674, -50618, 156304, -1672, 16876, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 136, 35674, -50787, 157291, -1672, 22514, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 137, 35674, -50782, 157246, -1656, 22466, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 138, 35673, -50779, 155857, -2056, 62199, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 139, 35673, -50770, 155889, -2056, 62199, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 140, 35673, -50759, 155920, -2056, 62199, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 141, 35673, -50750, 155952, -2056, 62199, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 142, 35679, -52278, 157907, -2016, 62372, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 143, 35679, -52291, 157857, -2016, 62372, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 144, 35679, -52305, 157809, -2016, 62372, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 145, 35679, -52319, 157760, -2016, 62372, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 146, 35679, -52335, 157711, -2016, 62372, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 147, 35678, -52221, 157889, -2024, 62372, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 148, 35678, -52234, 157839, -2024, 62372, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 149, 35678, -52249, 157791, -2016, 62372, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 150, 35678, -52263, 157742, -2024, 62372, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 151, 35685, -53107, 158323, -2048, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 152, 35674, -53152, 158544, -1672, 23673, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 153, 35674, -51796, 158336, -1648, 14064, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 154, 35674, -53109, 158560, -1648, 26067, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 155, 35674, -51757, 158318, -1672, 16217, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 156, 35674, -53965, 158258, -1672, 4966, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (101, 157, 35674, -53999, 158222, -1672, 5495, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 158, 35706, -25056, 218992, -2856, 33596, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 159, 35706, -25072, 219008, -2856, 33596, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 160, 35706, -24640, 218272, -2856, 35420, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 161, 35706, -24656, 218288, -2856, 35420, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 162, 35705, -25156, 219826, -3240, 32716, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 163, 35705, -25156, 219923, -3240, 32716, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 164, 35706, -24972, 219602, -3064, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 165, 35706, -24972, 219567, -3064, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 166, 35717, -25008, 219600, -3056, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 167, 35718, -25008, 219568, -3056, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 168, 35706, -24701, 219258, -2880, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 169, 35706, -24701, 219226, -2880, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 170, 35717, -24669, 219226, -2880, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 171, 35718, -24669, 219258, -2880, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 172, 35706, -24960, 220160, -3072, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 173, 35706, -24960, 220192, -3072, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 174, 35718, -25008, 220160, -3056, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 175, 35717, -25008, 220192, -3056, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 176, 35706, -24699, 220525, -2880, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 177, 35718, -24667, 220525, -2880, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 178, 35706, -24699, 220493, -2880, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 179, 35717, -24667, 220493, -2880, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 180, 35706, -24928, 219472, -2792, 16552, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 181, 35706, -24896, 219520, -2792, 16552, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 182, 35706, -24960, 219520, -2792, 16552, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 183, 35706, -24928, 219520, -2792, 16552, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 184, 35706, -24944, 220272, -2792, 49120, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 185, 35706, -24906, 220224, -2792, 49120, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 186, 35706, -24976, 220224, -2792, 49120, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 187, 35706, -24944, 220224, -2792, 49120, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 188, 35706, -25056, 220784, -2856, 30696, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 189, 35706, -25072, 220752, -2856, 30696, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 190, 35705, -25156, 219859, -3240, 32716, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 191, 35705, -25156, 219891, -3240, 32716, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 192, 35712, -23984, 218864, -3072, 56680, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 193, 35712, -24320, 218768, -3136, 20088, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 194, 35708, -24394, 219179, -3232, 24964, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 195, 35710, -24528, 218864, -3136, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 196, 35708, -24397, 218548, -3232, 40180, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 197, 35707, -23992, 218883, -3072, 24440, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 198, 35710, -24080, 218416, -3104, 17068, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 199, 35710, -24096, 219296, -3168, 51760, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 200, 35708, -23765, 219176, -3232, 8152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 201, 35708, -23764, 218552, -3232, 58036, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 202, 35706, -24104, 219918, -3232, 32716, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 203, 35706, -24656, 221472, -2856, 27176, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 204, 35706, -24104, 219950, -3232, 32716, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 205, 35706, -24144, 219936, -3232, 32716, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 206, 35706, -24104, 219982, -3232, 32716, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 207, 35706, -24640, 221504, -2856, 27176, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 208, 35709, -23490, 218863, -3232, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 209, 35711, -23294, 218987, -3232, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 210, 35711, -23422, 218987, -3232, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 211, 35711, -23198, 219033, -3232, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 212, 35711, -23326, 218849, -3232, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 213, 35711, -23358, 218849, -3232, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 214, 35711, -23230, 218711, -3232, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 215, 35712, -24064, 218576, -3104, 29524, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 216, 35715, -22851, 218091, -3200, 32716, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 217, 35715, -22850, 218204, -3200, 32716, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 218, 35715, -22850, 218172, -3200, 32716, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 219, 35714, -22897, 218091, -3208, 32716, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 220, 35715, -22850, 218107, -3200, 32716, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 221, 35715, -22850, 218140, -3200, 32716, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 222, 35714, -22895, 218109, -3200, 32716, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 223, 35714, -22895, 218141, -3200, 32716, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 224, 35714, -22895, 218205, -3200, 32716, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 225, 35714, -22896, 218173, -3200, 32716, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 226, 35723, -22740, 218883, -3232, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 227, 35706, -23248, 217472, -2856, 49996, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 228, 35706, -23280, 217472, -2856, 49996, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 229, 35704, -23040, 220256, -2712, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 230, 35704, -23040, 220320, -2712, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 231, 35704, -23071, 219456, -2520, 15616, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 232, 35704, -23040, 220288, -2712, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 233, 35704, -23120, 219456, -2520, 15616, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 234, 35704, -23094, 219456, -2520, 15616, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 235, 35703, -22815, 219785, -2312, 32672, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 236, 35703, -22815, 219759, -2312, 32672, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 237, 35703, -22814, 219841, -2312, 32672, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 238, 35703, -22815, 219813, -2312, 32672, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 239, 35703, -22592, 219760, -2312, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 240, 35703, -22591, 219840, -2312, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 241, 35703, -22591, 219785, -2312, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 242, 35703, -22591, 219813, -2312, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 243, 35702, -22625, 219799, -2312, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 244, 35712, -24144, 219136, -3168, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 245, 35706, -24095, 220448, -3088, 16040, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 246, 35706, -24058, 220447, -3080, 16040, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 247, 35718, -23726, 220704, -2864, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 248, 35718, -24096, 220416, -3072, 16040, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 249, 35717, -24059, 220414, -3064, 16040, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 250, 35706, -23726, 220672, -2880, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 251, 35706, -23758, 220672, -2880, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 252, 35717, -23758, 220704, -2880, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 253, 35706, -23968, 220288, -2792, 41284, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 254, 35706, -23984, 220320, -2792, 41284, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 255, 35706, -24016, 220352, -2792, 41284, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 256, 35706, -24016, 220288, -2792, 41284, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 257, 35723, -22777, 220679, -3232, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 258, 35706, -24104, 219886, -3232, 32716, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 259, 35705, -23327, 219753, -3232, 32716, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 260, 35705, -23327, 219786, -3232, 32716, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 261, 35705, -23327, 219818, -3232, 32716, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 262, 35705, -23327, 219850, -3232, 32716, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 263, 35722, -22729, 221658, -3200, 32628, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 264, 35723, -23748, 221847, -3232, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 265, 35706, -23248, 222288, -2856, 18436, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 266, 35706, -23280, 222288, -2856, 18436, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 267, 35706, -21347, 219734, -3232, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 268, 35723, -21753, 217807, -3232, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 269, 35706, -22256, 217472, -2856, 48024, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 270, 35706, -20658, 220540, -2880, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 271, 35706, -21296, 220240, -2792, 56880, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 272, 35717, -20686, 219235, -2880, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 273, 35706, -21360, 220160, -2792, 56880, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 274, 35706, -20654, 219235, -2880, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 275, 35706, -21296, 220176, -2792, 56880, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 276, 35706, -20658, 220508, -2880, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 277, 35706, -21328, 220208, -2792, 56880, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 278, 35706, -20654, 219267, -2880, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 279, 35718, -20690, 220508, -2880, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 280, 35706, -21562, 220067, -2880, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 281, 35706, -21231, 220329, -3064, 49444, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 282, 35717, -20690, 220540, -2880, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 283, 35718, -20686, 219267, -2880, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 284, 35720, -21248, 219088, -3056, 48744, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 285, 35706, -21266, 220328, -3064, 49444, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 286, 35720, -21060, 218677, -3160, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 287, 35717, -21594, 220037, -2880, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 288, 35720, -21376, 218592, -3056, 16448, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 289, 35720, -21104, 219056, -3160, 17016, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 290, 35720, -21504, 219056, -3160, 17016, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 291, 35720, -21312, 218832, -3160, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 292, 35718, -21562, 220037, -2880, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 293, 35717, -21264, 220368, -3056, 49444, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 294, 35706, -21594, 220067, -2880, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 295, 35704, -22400, 219577, -2344, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 296, 35720, -21344, 218592, -3056, 16448, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 297, 35720, -21552, 219008, -3160, 32872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 298, 35718, -21232, 220368, -3056, 49444, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 299, 35704, -22400, 219737, -2344, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 300, 35704, -22400, 219705, -2344, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 301, 35720, -21280, 219088, -3056, 48744, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 302, 35720, -21568, 218672, -3160, 32872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 303, 35720, -21104, 218631, -3160, 47608, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 304, 35720, -21522, 218629, -3160, 47608, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 305, 35704, -22400, 219769, -2344, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 306, 35720, -21056, 219024, -3160, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 307, 35704, -22400, 219609, -2344, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 308, 35704, -22317, 220384, -2864, 16604, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 309, 35704, -22400, 219641, -2344, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 310, 35704, -22351, 220384, -2864, 16964, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 311, 35706, -22288, 217472, -2856, 48024, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 312, 35706, -20992, 218000, -2856, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 313, 35706, -21008, 217984, -2856, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 314, 35706, -21347, 219670, -3232, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 315, 35704, -22282, 220384, -2864, 16964, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 316, 35704, -22400, 219545, -2344, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 317, 35704, -22400, 219673, -2344, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 318, 35706, -21347, 219638, -3232, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 319, 35706, -21347, 219702, -3232, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 320, 35706, -21297, 219688, -3232, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 321, 35705, -22081, 219756, -3232, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 322, 35705, -22081, 219789, -3232, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 323, 35705, -22081, 219821, -3232, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 324, 35705, -22081, 219853, -3232, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 325, 35706, -20304, 218992, -2856, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 326, 35706, -20304, 219024, -2856, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 327, 35705, -20207, 219839, -3240, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 328, 35705, -20208, 219872, -3240, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 329, 35705, -20208, 219904, -3240, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 330, 35705, -20208, 219936, -3232, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 331, 35706, -20416, 219552, -2792, 16836, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 332, 35706, -20383, 219552, -2792, 16836, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 333, 35706, -20412, 220204, -3072, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 334, 35706, -20411, 220171, -3072, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 335, 35718, -20368, 220208, -3056, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 336, 35717, -20368, 220171, -3056, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 337, 35706, -20385, 219598, -3064, 33388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 338, 35717, -20351, 219568, -3056, 33388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 339, 35706, -20384, 219566, -3056, 33388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 340, 35718, -20352, 219601, -3056, 33388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 341, 35706, -20400, 220240, -2792, 49904, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 342, 35706, -20432, 220272, -2792, 49904, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 343, 35706, -20464, 220240, -2792, 49904, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 344, 35706, -20432, 220240, -2792, 49904, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 345, 35706, -20413, 219506, -2792, 16836, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 346, 35706, -20448, 219552, -2776, 16836, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 347, 35706, -20400, 220928, -2856, 6864, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 348, 35706, -20384, 220896, -2856, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 349, 35706, -21712, 222176, -2856, 8936, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 350, 35717, -21776, 221504, -3208, 6672, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 351, 35718, -21360, 221344, -3208, 22236, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 352, 35717, -21568, 221360, -3208, 20132, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 353, 35718, -21632, 221680, -3208, 48568, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 354, 35717, -21312, 221456, -3208, 37504, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (102, 355, 35717, -21648, 221408, -3208, 10732, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 356, 35741, 16284, 188689, -2552, 27344, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 357, 35741, 16319, 188745, -2552, 27344, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 358, 35741, 16301, 188717, -2552, 27344, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 359, 35751, 16256, 189504, -2888, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 360, 35750, 16128, 189680, -2888, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 361, 35750, 15968, 189296, -2888, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 362, 35750, 15840, 189472, -2888, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 363, 35751, 16144, 189376, -2888, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 364, 35750, 15871, 189294, -2888, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 365, 35754, 14974, 188725, -2920, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 366, 35754, 15961, 188781, -2920, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 367, 35743, 14656, 188516, -2544, 12724, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 368, 35743, 14640, 188548, -2544, 11642, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 369, 35743, 17296, 189912, -2744, 62559, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 370, 35743, 17328, 189912, -2744, 62492, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 371, 35751, 17297, 189952, -2744, 49124, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 372, 35750, 17723, 189775, -2920, 25935, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 373, 35743, 16950, 189649, -2568, 16512, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 374, 35743, 16982, 189649, -2560, 16512, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 375, 35751, 16950, 189617, -2560, 16512, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 376, 35750, 16982, 189617, -2560, 16512, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 377, 35743, 18148, 189365, -2744, 56218, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 378, 35743, 18161, 189337, -2744, 56396, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 379, 35751, 18174, 189376, -2736, 36884, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 380, 35750, 17866, 189626, -2920, 18898, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 381, 35743, 18047, 188938, -2560, 4980, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 382, 35743, 18063, 188906, -2560, 4980, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 383, 35751, 18015, 188922, -2560, 4980, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 384, 35750, 18031, 188890, -2560, 4980, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 385, 35743, 17200, 189808, -2472, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 386, 35743, 17264, 189760, -2472, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 387, 35743, 17264, 189856, -2456, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 388, 35743, 17264, 189808, -2472, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 389, 35743, 18081, 189229, -2472, 20960, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 390, 35743, 18098, 189269, -2472, 20960, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 391, 35743, 18041, 189241, -2472, 20960, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 392, 35743, 18069, 189255, -2472, 20960, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 393, 35743, 17326, 189015, -2920, 10136, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 394, 35743, 17340, 188949, -2920, 10136, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 395, 35743, 17313, 188968, -2920, 10136, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 396, 35743, 17284, 188986, -2920, 10136, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 397, 35743, 17256, 189005, -2920, 10136, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 398, 35743, 16791, 190139, -2544, 64316, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 399, 35743, 16775, 190159, -2544, 64616, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 400, 35742, 16969, 188550, -2920, 10136, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 401, 35742, 16941, 188569, -2920, 10136, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 402, 35742, 16913, 188588, -2920, 10136, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 403, 35742, 16884, 188606, -2920, 10136, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 404, 35742, 17885, 189759, -2920, 10136, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 405, 35742, 17858, 189777, -2920, 10136, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 406, 35742, 17829, 189796, -2920, 10136, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 407, 35742, 17801, 189815, -2920, 10136, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 408, 35743, 18750, 188629, -2544, 50082, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 409, 35743, 18734, 188661, -2544, 50280, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 410, 35741, 16631, 187514, -2208, 25584, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 411, 35741, 16650, 187535, -2208, 25584, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 412, 35741, 16667, 187560, -2208, 25584, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 413, 35741, 16944, 188176, -2032, 10096, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 414, 35741, 16765, 188292, -2032, 10096, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 415, 35741, 16919, 188193, -2032, 10096, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 416, 35741, 16868, 188228, -2032, 10096, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 417, 35741, 16894, 188210, -2032, 10096, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 418, 35740, 16652, 188147, -2000, 10096, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 419, 35740, 16677, 188131, -2000, 10096, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 420, 35741, 16841, 188244, -2032, 10096, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 421, 35741, 16790, 188276, -2032, 10096, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 422, 35741, 16816, 188259, -2032, 10096, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 423, 35740, 16604, 188180, -1976, 10096, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 424, 35740, 16628, 188163, -2000, 10096, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 425, 35740, 16554, 187944, -2000, 42948, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 426, 35740, 16481, 187993, -2000, 42948, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 427, 35740, 16504, 187978, -2000, 42948, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 428, 35740, 16529, 187962, -2000, 42948, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 429, 35739, 16621, 188124, -2000, 10096, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 430, 35748, 17846, 187459, -2888, 10792, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 431, 35748, 17978, 187384, -2888, 10792, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 432, 35748, 17878, 187441, -2888, 10792, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 433, 35748, 17945, 187402, -2888, 10792, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 434, 35748, 17911, 187422, -2888, 10792, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 435, 35747, 17978, 187456, -2896, 10792, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 436, 35747, 18012, 187437, -2896, 10792, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 437, 35747, 17944, 187476, -2896, 10792, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 438, 35747, 17879, 187513, -2896, 10792, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 439, 35747, 17911, 187494, -2896, 10792, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 440, 35743, 16481, 186451, -2568, 48068, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 441, 35743, 16449, 186454, -2560, 48068, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 442, 35751, 16484, 186481, -2560, 48068, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 443, 35750, 16452, 186485, -2560, 48068, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 444, 35754, 16981, 187276, -2920, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 445, 35754, 18325, 188158, -2920, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 446, 35743, 17925, 186370, -2544, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 447, 35741, 15963, 188069, -2400, 10208, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 448, 35741, 16011, 188037, -2400, 10208, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 449, 35741, 15987, 188053, -2400, 10208, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 450, 35753, 15120, 188128, -2840, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 451, 35753, 14928, 187872, -2840, 48392, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 452, 35753, 14880, 187920, -2840, 32792, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 453, 35753, 15264, 187840, -2840, 48392, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 454, 35753, 15328, 187888, -2840, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 455, 35753, 15376, 188304, -2784, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 456, 35753, 15328, 188352, -2840, 15736, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 457, 35753, 14960, 188384, -2840, 15736, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 458, 35753, 14928, 188352, -2840, 32792, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 459, 35753, 14878, 188165, -2736, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 460, 35753, 14880, 188200, -2736, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 461, 35753, 15378, 188062, -2736, 31696, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 462, 35753, 15376, 188030, -2736, 31696, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 463, 35743, 15230, 186752, -2744, 24371, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 464, 35743, 15216, 186784, -2752, 25155, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 465, 35751, 15192, 186732, -2736, 4416, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 466, 35750, 15533, 186398, -2920, 44073, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 467, 35743, 15322, 187178, -2560, 37240, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 468, 35743, 15306, 187210, -2560, 37240, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 469, 35751, 15354, 187194, -2560, 37240, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 470, 35750, 15338, 187226, -2560, 37240, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 471, 35743, 15200, 186832, -2472, 54720, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 472, 35743, 15232, 186848, -2472, 54720, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 473, 35743, 15264, 186864, -2472, 54720, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 474, 35743, 15216, 186880, -2472, 54720, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 475, 35743, 15968, 187143, -2920, 42688, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 476, 35743, 16034, 187146, -2920, 42688, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 477, 35743, 16004, 187167, -2920, 42688, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 478, 35743, 15976, 187186, -2920, 42688, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 479, 35743, 15948, 187204, -2920, 42688, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 480, 35743, 14720, 187296, -2544, 19892, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 481, 35743, 14704, 187328, -2544, 22014, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 482, 35742, 16275, 187520, -2920, 42688, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 483, 35742, 16245, 187540, -2920, 42688, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 484, 35742, 16217, 187559, -2920, 42688, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 485, 35742, 16188, 187577, -2920, 42688, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 486, 35743, 16771, 185956, -2544, 53248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 487, 35743, 16748, 185947, -2544, 53248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 488, 35743, 17901, 186362, -2544, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 489, 35742, 15497, 186310, -2920, 42688, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 490, 35743, 16077, 186219, -2744, 15624, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 491, 35743, 16109, 186217, -2752, 15624, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 492, 35751, 16074, 186186, -2744, 15624, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 493, 35750, 16106, 186184, -2744, 15624, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 494, 35743, 16157, 186220, -2472, 31852, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 495, 35743, 16160, 186256, -2472, 31852, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 496, 35743, 16162, 186289, -2472, 31852, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 497, 35743, 16194, 186254, -2472, 31852, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 498, 35742, 15555, 186271, -2920, 42688, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 499, 35742, 15525, 186292, -2920, 42688, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (103, 500, 35742, 15469, 186329, -2920, 42688, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 501, 35787, 126687, 120722, -2400, 15996, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 502, 35775, 125471, 120735, -2400, 16148, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 503, 35787, 125470, 120704, -2400, 16148, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 504, 35775, 125440, 120736, -2400, 16148, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 505, 35786, 125440, 120704, -2400, 16148, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 506, 35775, 126688, 120752, -2400, 15996, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 507, 35786, 126657, 120723, -2400, 15996, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 508, 35775, 126658, 120753, -2400, 15996, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 509, 35774, 126013, 120640, -2584, 49024, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 510, 35774, 126045, 120640, -2584, 49024, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 511, 35774, 126077, 120640, -2584, 49024, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 512, 35774, 126109, 120640, -2584, 49024, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 513, 35775, 127056, 120784, -2184, 49320, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 514, 35775, 127024, 120768, -2208, 49320, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 515, 35789, 124560, 121648, -2504, 32720, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 516, 35789, 124608, 121584, -2504, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 517, 35789, 124560, 122064, -2504, 32720, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 518, 35789, 124608, 122112, -2504, 16152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 519, 35789, 124768, 121856, -2504, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 520, 35789, 124528, 121884, -2400, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 521, 35789, 124528, 121913, -2400, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 522, 35792, 124111, 122246, -2584, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 523, 35775, 124208, 121344, -2208, 32728, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 524, 35775, 124192, 121376, -2208, 32728, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 525, 35775, 123808, 122064, -2208, 32672, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 526, 35775, 123792, 122096, -2208, 32672, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 527, 35775, 125728, 120832, -2136, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 528, 35780, 126391, 121328, -2584, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 529, 35780, 126453, 122603, -2584, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 530, 35780, 126763, 122178, -2584, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 531, 35789, 124960, 121584, -2504, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 532, 35789, 124976, 122112, -2504, 16152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 533, 35775, 126368, 120832, -2136, 32728, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 534, 35789, 125008, 122064, -2440, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 535, 35789, 125008, 121632, -2448, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 536, 35789, 125036, 121783, -2400, 32840, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 537, 35789, 125036, 121812, -2400, 32840, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 538, 35775, 125776, 122258, -2312, 32748, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 539, 35787, 125808, 122258, -2312, 32748, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 540, 35775, 125776, 122288, -2312, 32748, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 541, 35786, 125808, 122288, -2312, 32748, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 542, 35775, 125761, 121915, -2224, 16488, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 543, 35787, 125760, 121872, -2224, 16488, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 544, 35775, 125808, 121915, -2224, 16488, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 545, 35786, 125808, 121872, -2224, 16488, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 546, 35775, 125792, 121088, -2224, 49148, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 547, 35775, 125760, 121087, -2224, 49148, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 548, 35787, 125792, 121120, -2224, 49148, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 549, 35786, 125760, 121120, -2224, 49148, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 550, 35775, 126341, 121097, -2224, 49140, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 551, 35787, 126341, 121130, -2224, 49140, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 552, 35786, 126368, 121130, -2224, 49140, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 553, 35775, 126368, 121097, -2224, 49140, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 554, 35775, 125728, 122064, -2136, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 555, 35775, 125760, 122096, -2136, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 556, 35775, 125760, 122032, -2136, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 557, 35775, 125760, 122064, -2136, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 558, 35775, 126148, 122073, -2584, 49024, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 559, 35775, 125728, 120864, -2136, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 560, 35775, 125694, 120863, -2136, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 561, 35775, 125728, 120896, -2136, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 562, 35775, 126260, 122073, -2584, 49024, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 563, 35775, 126416, 120864, -2136, 32728, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 564, 35775, 126368, 120896, -2136, 32728, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 565, 35775, 126372, 120863, -2136, 32728, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 566, 35775, 126094, 122075, -2584, 49024, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 567, 35775, 126177, 122005, -2584, 49024, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 568, 35775, 126204, 122073, -2584, 49024, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 569, 35775, 124944, 120864, -2208, 38768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 570, 35775, 124976, 120848, -2208, 38768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 571, 35778, 126736, 121808, -2584, 32876, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 572, 35777, 126969, 121480, -2584, 41660, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 573, 35777, 126969, 122128, -2584, 24908, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 574, 35774, 126027, 122713, -2584, 49024, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 575, 35774, 126062, 122713, -2584, 49024, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 576, 35774, 126098, 122713, -2584, 49024, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 577, 35774, 126131, 122712, -2584, 49024, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 578, 35780, 127073, 122858, -2584, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 579, 35780, 127321, 122858, -2584, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 580, 35780, 127507, 122518, -2584, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 581, 35781, 127120, 121840, -2424, 8544, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 582, 35781, 127440, 121600, -2520, 39460, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 583, 35781, 127488, 121920, -2488, 57212, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 584, 35781, 127024, 121760, -2552, 33324, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 585, 35775, 127984, 121488, -2208, 56868, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 586, 35775, 128000, 121520, -2208, 56868, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 587, 35777, 127615, 121481, -2584, 57540, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 588, 35777, 127618, 122121, -2584, 8112, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 589, 35779, 127296, 122256, -2456, 51072, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 590, 35779, 127728, 121808, -2488, 33328, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 591, 35779, 127296, 121360, -2520, 17444, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 592, 35776, 127189, 121806, -2424, 56872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 593, 35767, 128106, 122635, -2588, 33036, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 594, 35758, 126080, 123808, -2424, 48972, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 595, 35784, 124267, 123480, -2552, 16352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 596, 35784, 124239, 123479, -2552, 16352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 597, 35784, 124356, 123479, -2552, 16352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 598, 35784, 124297, 123480, -2552, 16352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 599, 35784, 124326, 123480, -2552, 16352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 600, 35783, 124355, 123520, -2552, 16352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 601, 35783, 124326, 123520, -2552, 16352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 602, 35783, 124297, 123520, -2552, 16352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 603, 35783, 124240, 123520, -2552, 16352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 604, 35783, 124269, 123520, -2552, 16352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 605, 35786, 124560, 124624, -2552, 1484, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 606, 35786, 124624, 124400, -2528, 13072, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 607, 35786, 124704, 124416, -2552, 17088, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 608, 35787, 124816, 124448, -2552, 19892, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 609, 35775, 123648, 123424, -2208, 26908, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 610, 35775, 123648, 123472, -2208, 26908, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 611, 35773, 126435, 122923, -1872, 32648, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 612, 35773, 125560, 123006, -2064, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 613, 35773, 125592, 123006, -2064, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 614, 35773, 125624, 123006, -2064, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 615, 35773, 126435, 122979, -1872, 32648, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 616, 35773, 126435, 122951, -1872, 32648, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 617, 35773, 125504, 123770, -2216, 33088, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 618, 35773, 125505, 123698, -2216, 33088, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 619, 35773, 125504, 123735, -2216, 33088, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 620, 35773, 126298, 123644, -1688, 16248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 621, 35773, 126330, 123644, -1688, 16248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 622, 35773, 126266, 123644, -1688, 16248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 623, 35773, 126234, 123644, -1688, 16248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 624, 35773, 126202, 123644, -1688, 16248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 625, 35773, 126170, 123644, -1688, 16248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 626, 35773, 126138, 123644, -1688, 16248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 627, 35773, 126106, 123644, -1688, 16248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 628, 35772, 126064, 123234, -1656, 48972, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 629, 35772, 126094, 123233, -1656, 48972, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 630, 35772, 126034, 123234, -1656, 48972, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 631, 35772, 126124, 123233, -1656, 48972, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 632, 35772, 126094, 123452, -1656, 16248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 633, 35772, 126125, 123452, -1656, 16248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 634, 35772, 126065, 123452, -1656, 16248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 635, 35772, 126035, 123453, -1656, 16248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 636, 35771, 126079, 123550, -1688, 16248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 637, 35787, 124944, 124864, -2552, 47800, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 638, 35786, 125040, 124544, -2552, 25844, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 639, 35775, 126842, 124595, -2400, 49068, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 640, 35775, 126874, 124595, -2400, 49068, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 641, 35787, 126842, 124627, -2400, 49068, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 642, 35786, 126874, 124627, -2400, 49068, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 643, 35775, 126960, 124576, -2136, 32376, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 644, 35775, 126928, 124544, -2136, 32376, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 645, 35775, 126928, 124608, -2136, 32376, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 646, 35775, 126928, 124576, -2136, 32376, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 647, 35792, 126826, 122978, -2584, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 648, 35792, 125120, 123360, -2584, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 649, 35775, 126056, 124654, -2584, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 650, 35775, 126126, 124608, -2584, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 651, 35775, 126032, 124608, -2584, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 652, 35775, 125984, 124608, -2584, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 653, 35775, 126080, 124608, -2584, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 654, 35774, 126025, 123961, -2584, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 655, 35774, 126129, 123962, -2584, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 656, 35774, 126095, 123962, -2584, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 657, 35774, 126060, 123962, -2584, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 658, 35775, 127184, 124241, -2224, 16348, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 659, 35775, 127217, 124241, -2224, 16348, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 660, 35787, 127184, 124208, -2224, 16348, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 661, 35786, 127216, 124208, -2224, 16348, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 662, 35775, 128464, 123424, -2208, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 663, 35792, 127575, 124886, -2584, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 664, 35775, 128464, 123456, -2208, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 665, 35775, 127984, 124736, -2208, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 666, 35775, 128000, 124704, -2208, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 667, 35791, 128056, 123440, -2536, 33000, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 668, 35775, 124800, 125280, -2208, 16292, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 669, 35775, 124832, 125296, -2208, 16292, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 670, 35775, 126656, 125472, -2400, 49124, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 671, 35775, 126688, 125472, -2400, 49124, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 672, 35787, 126656, 125504, -2400, 49124, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 673, 35786, 126688, 125504, -2400, 49124, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 674, 35775, 126352, 125088, -2224, 16080, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 675, 35775, 126320, 125088, -2224, 16080, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 676, 35787, 126320, 125120, -2224, 16080, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 677, 35786, 126352, 125120, -2224, 16080, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 678, 35775, 125422, 125482, -2400, 49188, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 679, 35775, 125454, 125482, -2400, 49188, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 680, 35787, 125422, 125514, -2400, 49188, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 681, 35786, 125454, 125514, -2400, 49188, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 682, 35787, 125792, 125088, -2224, 15912, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 683, 35775, 125792, 125120, -2224, 15912, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 684, 35786, 125760, 125088, -2224, 15912, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 685, 35775, 125759, 125120, -2224, 15912, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 686, 35775, 126415, 125360, -2136, 32828, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 687, 35775, 126384, 125392, -2136, 32828, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 688, 35775, 126384, 125328, -2136, 32828, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 689, 35775, 126384, 125360, -2136, 32828, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 690, 35775, 125708, 125359, -2136, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 691, 35775, 125744, 125392, -2136, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 692, 35775, 125744, 125328, -2136, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 693, 35775, 125744, 125360, -2136, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 694, 35774, 126112, 125584, -2584, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 695, 35774, 126080, 125584, -2584, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 696, 35774, 126048, 125584, -2584, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 697, 35774, 126016, 125584, -2584, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 698, 35775, 127024, 125472, -2192, 4964, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (104, 699, 35775, 127056, 125440, -2192, 4964, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 700, 35810, 72672, 3684, -2520, 24056, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 701, 35810, 72719, 3723, -2520, 24056, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 702, 35810, 72695, 3703, -2520, 24056, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 703, 35822, 72384, 2912, -2960, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 704, 35822, 72704, 2976, -2960, 61536, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 705, 35822, 72560, 2624, -2960, 61536, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 706, 35822, 72512, 2608, -2960, 45756, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 707, 35822, 72096, 2784, -2960, 45756, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 708, 35822, 72080, 2832, -2960, 28780, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 709, 35822, 72272, 3184, -2960, 11896, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 710, 35822, 72224, 3168, -2960, 28780, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 711, 35822, 72688, 3024, -2896, 11896, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 712, 35822, 72265, 2679, -2856, 12340, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 713, 35822, 72236, 2691, -2856, 12340, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 714, 35822, 72517, 3121, -2856, 44924, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 715, 35822, 72548, 3109, -2856, 44924, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 716, 35812, 71856, 2560, -2664, 45816, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 717, 35812, 73568, 3440, -3040, 56456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 718, 35812, 73648, 3408, -3040, 56456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 719, 35812, 73700, 2538, -2856, 18232, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 720, 35819, 73705, 2507, -2856, 18232, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 721, 35812, 73317, 2827, -2680, 50816, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 722, 35812, 73350, 2833, -2680, 50816, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 723, 35820, 73312, 2855, -2680, 50816, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 724, 35819, 73345, 2861, -2680, 50816, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 725, 35812, 73602, 2615, -2592, 2300, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 726, 35812, 73633, 2656, -2592, 2300, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 727, 35812, 73646, 2594, -2592, 2300, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 728, 35812, 73640, 2625, -2592, 2300, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 729, 35823, 71777, 3073, -3040, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 730, 35823, 72186, 3762, -3040, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 731, 35812, 73680, 3536, -3040, 56456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 732, 35812, 73616, 3488, -3040, 56456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 733, 35812, 73520, 3392, -3040, 56456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 734, 35812, 73008, 2272, -2664, 50792, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 735, 35812, 73056, 2272, -2640, 50792, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 736, 35812, 71824, 2576, -2664, 45816, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 737, 35811, 73221, 3766, -3040, 56456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 738, 35811, 73287, 3821, -3040, 56456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 739, 35811, 73243, 3784, -3040, 56456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 740, 35811, 73265, 3803, -3040, 56456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 741, 35810, 73357, 4207, -2328, 39880, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 742, 35810, 73395, 4161, -2328, 39880, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 743, 35810, 73376, 4184, -2328, 39880, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 744, 35810, 72172, 4177, -2672, 40028, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 745, 35810, 72132, 4223, -2672, 40028, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 746, 35810, 72152, 4200, -2672, 40028, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 747, 35810, 72788, 4607, -2152, 23660, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 748, 35810, 72695, 4528, -2152, 23660, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 749, 35810, 72718, 4548, -2152, 23660, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 750, 35810, 72857, 4664, -2152, 23660, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 751, 35810, 72835, 4645, -2152, 23664, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 752, 35810, 72811, 4626, -2152, 23664, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 753, 35809, 72917, 4185, -2120, 56456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 754, 35810, 72742, 4568, -2152, 23660, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 755, 35809, 72961, 4222, -2120, 56456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 756, 35809, 72938, 4203, -2120, 56456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 757, 35810, 72765, 4588, -2152, 23660, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 758, 35809, 72802, 4369, -2120, 23656, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 759, 35809, 72896, 4167, -2120, 56456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 760, 35809, 72822, 4386, -2120, 23656, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 761, 35809, 72759, 4334, -2120, 23660, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 762, 35808, 72814, 4327, -2120, 23656, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 763, 35809, 72781, 4351, -2120, 23656, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 764, 35812, 72459, 5917, -2680, 18360, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 765, 35812, 72489, 5923, -2680, 18360, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 766, 35820, 72465, 5892, -2680, 18360, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 767, 35819, 72494, 5898, -2680, 18360, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 768, 35812, 72190, 6117, -2592, 34332, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 769, 35812, 72155, 6143, -2592, 34332, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 770, 35812, 72165, 6078, -2592, 34332, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 771, 35812, 72160, 6112, -2592, 34332, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 772, 35823, 73616, 6096, -3040, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 773, 35812, 72165, 5223, -3040, 23840, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 774, 35812, 72238, 5193, -3040, 23840, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 775, 35812, 72279, 5228, -3040, 23840, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 776, 35812, 72192, 5152, -3040, 23840, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 777, 35812, 72149, 5113, -3040, 23840, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 778, 35811, 72495, 4784, -3040, 23840, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 779, 35811, 72474, 4766, -3040, 23840, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 780, 35811, 72453, 4748, -3040, 23840, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 781, 35811, 72431, 4730, -3040, 23840, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 782, 35812, 74554, 3250, -2864, 28652, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 783, 35812, 74543, 3223, -2864, 28652, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 784, 35820, 74584, 3239, -2864, 28652, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 785, 35819, 74572, 3210, -2864, 28652, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 786, 35812, 74363, 3716, -2688, 61980, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 787, 35812, 74353, 3688, -2688, 61980, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 788, 35820, 74338, 3725, -2688, 61980, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 789, 35819, 74328, 3697, -2688, 61980, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 790, 35812, 73728, 2544, -2856, 18232, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 791, 35820, 73734, 2511, -2856, 18232, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 792, 35812, 74488, 3381, -2592, 44728, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 793, 35812, 74448, 3362, -2592, 44728, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 794, 35812, 74501, 3339, -2592, 44728, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 795, 35812, 74474, 3350, -2592, 44728, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 796, 35812, 74944, 3856, -2648, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 797, 35812, 74928, 3824, -2664, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 798, 35811, 74183, 2741, -3040, 56456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 799, 35811, 74205, 2759, -3040, 56456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 800, 35811, 74226, 2778, -3040, 56456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 801, 35811, 74248, 2796, -3040, 56456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 802, 35817, 73810, 5358, -3008, 24564, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 803, 35817, 73895, 5443, -3016, 24564, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 804, 35817, 73874, 5422, -3016, 24564, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 805, 35817, 73853, 5402, -3016, 24564, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 806, 35817, 73830, 5380, -3016, 24564, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 807, 35816, 73841, 5455, -3016, 24564, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 808, 35816, 73777, 5392, -3016, 24564, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 809, 35816, 73863, 5475, -3016, 24564, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 810, 35816, 73820, 5434, -3016, 24564, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 811, 35816, 73798, 5414, -3016, 24564, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 812, 35823, 73799, 4465, -3040, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 813, 35812, 74864, 5072, -2664, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 814, 35812, 74880, 5040, -2664, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 815, 35819, 71200, 3920, -3008, 8836, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 816, 35820, 71472, 3872, -3008, 23492, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 817, 35819, 71440, 3984, -3008, 25044, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 818, 35819, 71136, 4320, -3008, 56236, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 819, 35820, 71488, 4288, -3008, 40056, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 820, 35819, 71488, 4112, -2992, 32492, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 821, 35812, 71230, 5576, -2864, 62020, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 822, 35812, 71220, 5544, -2864, 62020, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 823, 35820, 71208, 5584, -2864, 62020, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 824, 35819, 71198, 5553, -2864, 62020, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 825, 35812, 71469, 5126, -2688, 12506, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 826, 35812, 71458, 5097, -2688, 12512, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 827, 35820, 71488, 5086, -2688, 12512, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 828, 35819, 71498, 5116, -2688, 12502, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 829, 35812, 71319, 5413, -2592, 12944, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 830, 35812, 71356, 5430, -2592, 12944, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 831, 35812, 71299, 5449, -2592, 12944, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 832, 35812, 71328, 5440, -2592, 12944, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 833, 35812, 70912, 5056, -2664, 28632, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 834, 35812, 70928, 5088, -2664, 28632, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 835, 35811, 71613, 6009, -3040, 23840, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 836, 35811, 71591, 5990, -3040, 23840, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 837, 35811, 71570, 5972, -3040, 23840, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 838, 35811, 71549, 5954, -3040, 23840, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 839, 35812, 72048, 6244, -2856, 50940, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 840, 35812, 72079, 6249, -2856, 50940, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 841, 35820, 72044, 6266, -2856, 50940, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 842, 35819, 72074, 6272, -2856, 50940, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 843, 35812, 72912, 6496, -2664, 15392, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (105, 844, 35812, 72944, 6500, -2664, 15392, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 845, 35843, 155976, 53878, -2800, 3592, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 846, 35843, 156778, 54594, -3072, 30476, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 847, 35843, 156784, 54624, -3072, 30476, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 848, 35851, 156810, 54619, -3072, 30476, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 849, 35850, 156803, 54588, -3072, 30476, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 850, 35843, 156475, 55045, -2896, 63272, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 851, 35843, 156466, 55012, -2896, 63272, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 852, 35851, 156449, 55049, -2896, 63272, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 853, 35850, 156442, 55017, -2896, 63272, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 854, 35843, 156113, 53748, -3072, 20484, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 855, 35843, 156083, 53737, -3072, 20484, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 856, 35851, 156122, 53722, -3072, 20484, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 857, 35850, 156093, 53710, -3072, 20484, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 858, 35843, 156666, 54743, -2808, 46792, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 859, 35843, 156627, 54720, -2808, 46792, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 860, 35843, 156693, 54705, -2808, 46792, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 861, 35843, 156660, 54712, -2808, 46792, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 862, 35843, 155960, 53837, -2800, 3592, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 863, 35843, 156000, 53816, -2800, 3592, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 864, 35843, 155987, 53846, -2784, 3592, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 865, 35843, 156096, 54449, -3256, 58368, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 866, 35843, 156094, 54561, -3256, 58368, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 867, 35843, 156059, 54523, -3256, 58368, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 868, 35843, 156022, 54483, -3256, 58368, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 869, 35843, 155988, 54441, -3256, 58368, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 870, 35843, 157024, 55264, -2872, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 871, 35842, 156486, 54058, -3256, 58368, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 872, 35842, 156506, 54081, -3256, 58368, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 873, 35842, 156526, 54105, -3256, 58368, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 874, 35842, 156545, 54129, -3256, 58368, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 875, 35841, 154830, 54689, -2736, 25576, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 876, 35841, 154849, 54712, -2736, 25576, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 877, 35841, 154868, 54735, -2736, 25576, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 878, 35841, 154202, 55118, -2880, 41980, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 879, 35841, 154227, 55098, -2880, 41980, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 880, 35841, 154252, 55078, -2880, 41980, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 881, 35840, 154971, 55224, -2328, 58368, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 882, 35840, 154989, 55247, -2328, 58368, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 883, 35840, 154953, 55200, -2328, 58368, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 884, 35840, 155008, 55268, -2312, 58368, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 885, 35853, 154704, 53872, -3168, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 886, 35853, 154416, 53728, -3168, 30512, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 887, 35853, 154492, 54081, -3168, 30512, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 888, 35853, 154992, 53984, -3168, 63400, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 889, 35853, 154928, 53632, -3168, 63400, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 890, 35853, 154528, 54112, -3168, 14128, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 891, 35853, 154976, 54032, -3168, 14128, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 892, 35853, 154880, 53600, -3168, 46952, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 893, 35853, 154448, 53680, -3168, 46952, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 894, 35853, 154594, 53627, -3064, 14128, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 895, 35853, 154627, 53621, -3064, 14128, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 896, 35853, 154821, 54102, -3064, 46952, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 897, 35853, 154788, 54109, -3064, 46952, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 898, 35851, 153600, 54784, -3216, 34208, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 899, 35843, 155641, 53981, -2888, 52976, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 900, 35843, 155613, 53971, -2888, 52976, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 901, 35851, 155632, 54006, -2896, 52976, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 902, 35850, 155603, 53994, -2888, 52976, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 903, 35854, 154220, 53714, -3256, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 904, 35854, 154282, 54682, -3256, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 905, 35843, 155472, 53376, -2872, 52320, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 906, 35843, 155440, 53360, -2872, 52320, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 907, 35843, 154256, 53424, -2872, 47120, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 908, 35843, 154224, 53440, -2872, 47120, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 909, 35842, 155345, 54872, -3256, 58368, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 910, 35842, 155365, 54897, -3248, 58368, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 911, 35842, 155386, 54922, -3248, 58368, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 912, 35842, 155406, 54947, -3248, 58368, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 913, 35851, 153705, 57100, -3072, 52912, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 914, 35841, 155401, 55344, -2536, 41552, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 915, 35841, 155449, 55303, -2536, 41552, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 916, 35841, 155425, 55323, -2536, 41552, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 917, 35841, 154729, 55564, -2360, 25416, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 918, 35841, 154833, 55691, -2360, 25416, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 919, 35841, 154812, 55665, -2360, 25416, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 920, 35841, 154792, 55640, -2360, 25416, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 921, 35841, 154685, 55513, -2360, 25416, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 922, 35841, 154708, 55538, -2360, 25416, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 923, 35841, 154771, 55615, -2360, 25416, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 924, 35841, 154749, 55589, -2360, 25416, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 925, 35840, 154808, 55358, -2328, 25416, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 926, 35840, 154828, 55380, -2328, 25416, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 927, 35840, 154847, 55401, -2328, 25416, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 928, 35840, 154790, 55337, -2328, 25416, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 929, 35839, 154848, 55344, -2328, 25416, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 930, 35848, 155639, 56458, -3224, 26156, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 931, 35847, 155601, 56484, -3224, 26156, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 932, 35847, 155643, 56547, -3224, 26156, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 933, 35847, 155622, 56516, -3224, 26156, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 934, 35843, 153714, 57077, -3072, 52912, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 935, 35843, 153743, 57089, -3072, 52912, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 936, 35850, 153733, 57111, -3072, 52912, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 937, 35843, 154178, 56827, -2888, 20188, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 938, 35843, 154208, 56840, -2888, 20188, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 939, 35851, 154218, 56814, -2896, 20188, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 940, 35850, 154189, 56803, -2896, 20188, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 941, 35843, 153881, 56993, -2800, 36816, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 942, 35843, 153867, 56948, -2800, 36816, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 943, 35843, 153840, 57013, -2800, 36816, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 944, 35843, 153853, 56981, -2800, 36816, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 945, 35854, 155351, 57202, -3256, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 946, 35843, 153968, 56176, -3256, 25416, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 947, 35843, 154027, 56167, -3256, 25416, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 948, 35843, 154055, 56205, -3256, 25416, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 949, 35843, 153997, 56126, -3256, 25416, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 950, 35843, 153965, 56087, -3256, 25416, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 951, 35842, 154451, 55730, -3248, 25416, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 952, 35842, 154430, 55706, -3248, 25416, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 953, 35842, 154410, 55681, -3256, 25416, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 954, 35842, 154389, 55658, -3248, 25416, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 955, 35848, 155662, 56488, -3224, 26156, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 956, 35848, 155727, 56578, -3224, 26156, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 957, 35848, 155683, 56518, -3224, 26156, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 958, 35848, 155706, 56549, -3224, 26156, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 959, 35847, 155689, 56602, -3224, 26156, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 960, 35847, 155666, 56576, -3224, 26156, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 961, 35854, 155690, 55650, -3256, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 962, 35843, 156720, 56464, -2872, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 963, 35843, 156736, 56432, -2856, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 964, 35843, 157024, 55296, -2856, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 965, 35851, 153216, 55024, -3216, 55104, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 966, 35850, 153536, 55024, -3216, 39772, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 967, 35850, 153591, 54867, -3216, 34712, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 968, 35850, 153332, 54643, -3216, 14292, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 969, 35850, 153568, 54672, -3216, 29608, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 970, 35843, 153160, 56118, -2808, 14756, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 971, 35843, 153032, 56228, -3072, 64072, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 972, 35843, 153036, 56260, -3072, 64072, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 973, 35851, 153016, 56263, -3072, 64072, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 974, 35850, 153011, 56233, -3072, 64072, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 975, 35843, 153374, 55829, -2896, 30996, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 976, 35843, 153378, 55860, -2896, 30996, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 977, 35851, 153399, 55825, -2896, 30996, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 978, 35850, 153402, 55857, -2896, 30996, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 979, 35843, 153193, 56142, -2808, 14756, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 980, 35843, 153131, 56151, -2808, 14756, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 981, 35843, 153164, 56146, -2808, 14756, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 982, 35843, 152832, 55696, -2872, 32888, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 983, 35843, 152848, 55728, -2872, 32888, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 984, 35842, 153320, 56734, -3256, 25416, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 985, 35842, 153340, 56757, -3256, 25416, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 986, 35842, 153300, 56710, -3256, 25416, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 987, 35842, 153279, 56686, -3257, 25416, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 988, 35843, 154512, 57504, -2872, 20056, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (106, 989, 35843, 154544, 57512, -2872, 20056, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 990, 35886, 190198, 41484, -3048, 16600, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 991, 35875, 190168, 41512, -3048, 16600, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 992, 35886, 188436, 41034, -3376, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 993, 35886, 188795, 41211, -3376, 44352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 994, 35887, 188832, 40960, -3376, 24344, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 995, 35886, 189660, 41484, -3048, 16572, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 996, 35875, 189272, 41890, -3232, 48972, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 997, 35887, 189630, 41483, -3056, 16572, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 998, 35875, 190200, 41512, -3048, 16600, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 999, 35887, 190167, 41484, -3048, 16600, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1000, 35875, 189302, 41889, -3232, 48972, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1001, 35887, 189274, 41918, -3232, 48972, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1002, 35875, 189630, 41511, -3048, 16572, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1003, 35886, 189304, 41918, -3232, 48972, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1004, 35875, 189661, 41512, -3048, 16572, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1005, 35875, 189549, 41759, -2960, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1006, 35875, 189584, 41728, -2960, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1007, 35875, 189584, 41792, -2960, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1008, 35875, 189584, 41760, -2960, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1009, 35875, 190276, 41760, -2960, 32908, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1010, 35875, 190240, 41790, -2960, 32908, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1011, 35875, 190240, 41728, -2960, 32908, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1012, 35875, 190240, 41760, -2960, 32908, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1013, 35875, 188656, 41680, -3032, 21816, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1014, 35875, 188688, 41696, -3032, 21816, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1015, 35874, 189960, 41975, -3408, 16316, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1016, 35874, 189928, 41975, -3408, 16316, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1017, 35874, 189896, 41976, -3408, 16316, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1018, 35874, 189864, 41975, -3408, 16316, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1019, 35868, 189776, 41872, -3408, 49148, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1020, 35875, 190693, 41001, -3232, 49420, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1021, 35875, 190723, 41002, -3232, 49420, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1022, 35886, 190723, 41026, -3232, 49420, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1023, 35887, 190692, 41026, -3232, 49420, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1024, 35875, 190524, 41885, -3224, 49024, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1025, 35875, 190556, 41885, -3224, 49024, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1026, 35887, 190524, 41917, -3224, 49024, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1027, 35886, 190556, 41917, -3224, 49024, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1028, 35875, 190816, 40976, -2960, 28000, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1029, 35875, 190800, 41024, -2960, 28000, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1030, 35875, 190784, 40992, -2960, 28000, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1031, 35875, 191856, 41136, -3016, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1032, 35875, 191864, 41104, -3032, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1033, 35875, 190864, 41856, -3032, 10808, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1034, 35875, 190896, 41840, -3032, 10808, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1035, 35884, 188243, 39796, -3376, 16376, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1036, 35884, 188073, 39796, -3376, 16376, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1037, 35884, 188115, 39796, -3376, 16376, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1038, 35884, 188160, 39797, -3376, 16376, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1039, 35884, 188201, 39796, -3376, 16376, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1040, 35883, 188243, 39861, -3376, 16376, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1041, 35883, 188072, 39861, -3376, 16376, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1042, 35883, 188114, 39861, -3376, 16376, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1043, 35883, 188200, 39861, -3376, 16376, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1044, 35883, 188160, 39861, -3376, 16376, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1045, 35875, 187504, 39840, -3032, 33328, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1046, 35875, 187504, 39872, -3032, 33328, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1047, 35873, 189411, 39403, -2888, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1048, 35873, 189443, 39403, -2888, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1049, 35873, 189475, 39403, -2888, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1050, 35873, 190288, 39376, -2696, 32824, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1051, 35873, 190288, 39312, -2696, 32824, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1052, 35873, 190288, 39344, -2696, 32824, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1053, 35873, 189344, 40160, -3040, 32704, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1054, 35873, 189344, 40096, -3040, 32704, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1055, 35873, 190053, 40032, -2512, 16316, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1056, 35873, 189344, 40128, -3040, 32704, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1057, 35873, 190087, 40032, -2512, 16316, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1058, 35873, 190122, 40032, -2512, 16316, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1059, 35873, 190019, 40032, -2512, 16316, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1060, 35873, 190156, 40032, -2512, 16316, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1061, 35873, 189984, 40032, -2512, 16316, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1062, 35873, 190192, 40032, -2472, 16316, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1063, 35873, 189952, 40032, -2512, 16316, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1064, 35872, 189917, 39637, -2480, 49148, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1065, 35872, 189974, 39635, -2480, 49148, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1066, 35872, 189946, 39637, -2480, 49148, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1067, 35872, 189889, 39637, -2480, 49148, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1068, 35872, 189944, 39843, -2480, 16316, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1069, 35872, 189916, 39843, -2480, 16316, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1070, 35872, 189972, 39843, -2480, 16316, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1071, 35872, 189888, 39843, -2480, 16316, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1072, 35871, 189930, 39808, -2480, 16316, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1073, 35887, 188768, 40896, -3352, 22872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1074, 35886, 188672, 40848, -3376, 20656, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1075, 35886, 188542, 40815, -3376, 16340, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1076, 35874, 189918, 40364, -3408, 16316, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1077, 35874, 189885, 40365, -3408, 16316, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1078, 35892, 189082, 39869, -3408, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1079, 35875, 189940, 40946, -3408, 16316, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1080, 35875, 190020, 40895, -3408, 16316, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1081, 35875, 189969, 40895, -3408, 16316, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1082, 35875, 189908, 40897, -3408, 16316, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1083, 35875, 189852, 40896, -3408, 16316, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1084, 35874, 189946, 39117, -3408, 49148, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1085, 35874, 189978, 39117, -3408, 49148, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1086, 35874, 189882, 39117, -3408, 49148, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1087, 35874, 189914, 39116, -3408, 49148, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1088, 35874, 189982, 40364, -3408, 16316, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1089, 35874, 189950, 40364, -3408, 16316, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1090, 35886, 191088, 40596, -3056, 15964, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1091, 35880, 191917, 39044, -3408, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1092, 35875, 191057, 40623, -3056, 15964, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1093, 35887, 191056, 40597, -3056, 15964, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1094, 35875, 191088, 40622, -3056, 15964, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1095, 35875, 190784, 40944, -2960, 28000, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1096, 35892, 190711, 39356, -3408, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1097, 35875, 192320, 39856, -3032, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1098, 35875, 192320, 39824, -3032, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1099, 35891, 191846, 39844, -3368, 33020, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1100, 35875, 189594, 38482, -2960, 60184, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1101, 35889, 188624, 38240, -3328, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1102, 35889, 188816, 37984, -3328, 49428, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1103, 35889, 188480, 37984, -3328, 49428, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1104, 35889, 188464, 38496, -3328, 16324, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1105, 35889, 188800, 38496, -3328, 16324, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1106, 35889, 188848, 38016, -3328, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1107, 35889, 188848, 38464, -3328, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1108, 35889, 188416, 38016, -3328, 32788, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1109, 35889, 188416, 38464, -3328, 32788, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1110, 35889, 188880, 38176, -3224, 32788, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1111, 35889, 188880, 38208, -3224, 32788, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1112, 35875, 189273, 38674, -3232, 48832, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1113, 35875, 189302, 38674, -3232, 48832, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1114, 35887, 189303, 38699, -3232, 48832, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1115, 35886, 189272, 38700, -3232, 48832, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1116, 35875, 189632, 38268, -3056, 16556, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1117, 35875, 189631, 38300, -3048, 16556, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1118, 35887, 189663, 38268, -3048, 16556, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1119, 35875, 190197, 37500, -3048, 48928, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1120, 35886, 189663, 38300, -3048, 16556, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1121, 35875, 190163, 37502, -3056, 48928, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1122, 35887, 190199, 37533, -3056, 48928, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1123, 35886, 190164, 37533, -3048, 48928, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1124, 35875, 189304, 37127, -3224, 16356, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1125, 35887, 189303, 37101, -3224, 16356, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1126, 35875, 189273, 37127, -3224, 16356, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1127, 35886, 189272, 37101, -3224, 16356, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1128, 35875, 189662, 37505, -3048, 49428, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1129, 35875, 189632, 37504, -3048, 49428, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1130, 35887, 189661, 37532, -3048, 49428, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1131, 35886, 189630, 37532, -3048, 49428, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1132, 35875, 189572, 38437, -2960, 60184, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1133, 35875, 189607, 38452, -2960, 60184, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1134, 35875, 189600, 38416, -2960, 60184, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1135, 35875, 190229, 37296, -2960, 32824, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1136, 35875, 190265, 37261, -2960, 32824, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1137, 35875, 190231, 37230, -2960, 32824, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1138, 35875, 190231, 37262, -2960, 32824, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1139, 35875, 189558, 37260, -2960, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1140, 35875, 189592, 37226, -2960, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1141, 35875, 189592, 37296, -2960, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1142, 35875, 189592, 37260, -2960, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1143, 35875, 189959, 37691, -3408, 49148, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1144, 35875, 190032, 37744, -3408, 49148, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1145, 35875, 189984, 37744, -3408, 49148, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1146, 35875, 189936, 37744, -3408, 49148, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1147, 35875, 189888, 37744, -3408, 49148, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1148, 35875, 188816, 37232, -3032, 44232, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1149, 35875, 188784, 37248, -3032, 44232, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1150, 35874, 189862, 37046, -3408, 49148, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1151, 35874, 189894, 37046, -3408, 49148, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1152, 35874, 189926, 37046, -3408, 49148, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1153, 35874, 189957, 37046, -3408, 49148, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1154, 35869, 189776, 36960, -3408, 49148, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1155, 35869, 190048, 37152, -3408, 16316, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1156, 35880, 191502, 38810, -3408, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1157, 35880, 191668, 38576, -3408, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1158, 35880, 190672, 38732, -3408, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1159, 35880, 190672, 38654, -3408, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1160, 35880, 191336, 38888, -3408, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1161, 35881, 190976, 38240, -3256, 9736, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1162, 35881, 191376, 38288, -3320, 50656, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1163, 35881, 191248, 37968, -3352, 35624, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1164, 35881, 190864, 38176, -3384, 32732, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1165, 35875, 190550, 37128, -3232, 16680, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1166, 35875, 190518, 37128, -3232, 16680, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1167, 35886, 190518, 37103, -3232, 16680, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1168, 35887, 190548, 37104, -3232, 16680, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1169, 35892, 192019, 38645, -3408, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1170, 35875, 190896, 37168, -3032, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1171, 35875, 190864, 37152, -3032, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1172, 35878, 190570, 38200, -3408, 32704, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1173, 35875, 191856, 37904, -3032, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1174, 35875, 191840, 37872, -3032, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1175, 35877, 190825, 37882, -3408, 41856, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1176, 35877, 191465, 37881, -3408, 57244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1177, 35877, 191465, 38521, -3408, 9028, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1178, 35877, 190825, 38526, -3408, 24516, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1179, 35879, 191152, 38640, -3288, 49304, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1180, 35879, 191600, 38208, -3320, 33536, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1181, 35879, 191152, 37760, -3352, 17036, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1182, 35876, 191056, 38179, -3256, 57256, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1183, 35889, 188369, 38276, -3224, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1184, 35889, 188369, 38308, -3224, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1185, 35892, 187714, 38906, -3408, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1186, 35875, 187664, 38448, -3032, 38724, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1187, 35875, 187648, 38480, -3032, 38724, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1188, 35875, 188064, 37744, -3032, 38336, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (107, 1189, 35875, 188048, 37776, -3032, 38336, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1190, 35912, 116450, 204522, -3152, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1191, 35912, 116450, 204490, -3152, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1192, 35920, 116418, 204522, -3152, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1193, 35919, 116418, 204490, -3152, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1194, 35912, 116577, 204609, -2888, 48708, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1195, 35912, 116544, 204577, -2888, 48708, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1196, 35912, 116607, 204575, -2888, 48708, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1197, 35912, 116575, 204576, -2888, 48708, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1198, 35912, 116368, 204304, -2952, 38104, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1199, 35912, 116368, 204336, -2952, 38104, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1200, 35911, 116570, 203971, -3336, 38352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1201, 35911, 116585, 203942, -3336, 38352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1202, 35911, 116616, 203885, -3336, 38352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1203, 35911, 116600, 203913, -3336, 38352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1204, 35910, 118251, 204437, -2616, 21528, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1205, 35910, 118228, 204425, -2616, 21528, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1206, 35910, 118203, 204411, -2616, 21528, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1207, 35912, 116965, 203481, -3152, 11132, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1208, 35912, 116939, 203495, -3152, 11132, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1209, 35919, 116928, 203474, -3152, 11132, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1210, 35920, 116953, 203461, -3152, 11132, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1211, 35920, 117471, 203645, -2976, 43400, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1212, 35912, 117458, 203625, -2976, 43400, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1213, 35912, 117434, 203639, -2976, 43400, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1214, 35919, 117447, 203660, -2976, 43400, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1215, 35912, 117109, 203546, -2888, 26964, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1216, 35912, 117085, 203561, -2888, 26964, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1217, 35912, 117069, 203534, -2888, 26964, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1218, 35912, 117101, 203587, -2888, 26964, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1219, 35912, 117279, 204244, -3336, 38352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1220, 35923, 118694, 203076, -3336, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1221, 35923, 118378, 204000, -3336, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1222, 35912, 117266, 204332, -3336, 38352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1223, 35912, 117296, 204288, -3336, 38352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1224, 35912, 117324, 204240, -3336, 38352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1225, 35912, 117351, 204198, -3336, 38352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1226, 35912, 116800, 203504, -2952, 37708, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1227, 35912, 116784, 203536, -2952, 37708, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1228, 35912, 117584, 202976, -2952, 43160, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1229, 35912, 117552, 202992, -2952, 43160, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1230, 35911, 117840, 204673, -3328, 38352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1231, 35911, 117855, 204643, -3336, 38352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1232, 35911, 117872, 204612, -3328, 38352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1233, 35911, 117888, 204583, -3328, 38352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1234, 35922, 117216, 205648, -3256, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1235, 35922, 117301, 205401, -3152, 21480, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1236, 35922, 116912, 205728, -3256, 21480, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1237, 35922, 117072, 205376, -3256, 38832, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1238, 35909, 118483, 205009, -2408, 5396, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1239, 35912, 116826, 204835, -2976, 32332, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1240, 35909, 118497, 204983, -2408, 5396, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1241, 35909, 118341, 204830, -2408, 38352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1242, 35922, 117271, 205388, -3152, 21480, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1243, 35919, 116851, 204864, -2960, 32332, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1244, 35909, 118314, 204880, -2408, 38352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1245, 35922, 117120, 205344, -3256, 54132, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1246, 35910, 117881, 205192, -2808, 5416, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1247, 35910, 117897, 205164, -2808, 5416, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1248, 35909, 118327, 204855, -2408, 38352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1249, 35910, 118759, 204927, -2440, 5396, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1250, 35922, 117520, 205600, -3256, 5400, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1251, 35922, 117520, 205552, -3256, 54132, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1252, 35922, 116912, 205664, -3256, 38832, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1253, 35910, 118512, 205632, -2960, 21528, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1254, 35910, 118742, 204955, -2440, 5396, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1255, 35910, 118695, 205038, -2440, 5396, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1256, 35910, 117865, 205220, -2808, 5416, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1257, 35909, 118525, 204932, -2408, 5396, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1258, 35910, 118448, 205600, -2960, 21528, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1259, 35909, 118511, 204958, -2408, 5396, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1260, 35910, 118710, 205011, -2440, 5396, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1261, 35909, 118299, 204905, -2408, 38352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1262, 35908, 118472, 204952, -2408, 5396, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1263, 35910, 118774, 204899, -2440, 5396, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1264, 35910, 118726, 204983, -2440, 5396, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1265, 35910, 118480, 205616, -2960, 21528, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1266, 35912, 116352, 205264, -2952, 33428, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1267, 35912, 116352, 205296, -2952, 33428, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1268, 35922, 117296, 205936, -3256, 21480, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1269, 35922, 117344, 205920, -3256, 5400, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1270, 35922, 117147, 205901, -3152, 54132, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1271, 35922, 117116, 205884, -3152, 54132, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1272, 35920, 118292, 206421, -3304, 5576, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1273, 35919, 118715, 206601, -3304, 37536, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1274, 35920, 118496, 206384, -3304, 13508, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1275, 35919, 118614, 206327, -3304, 13584, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1276, 35919, 118348, 206360, -3304, 7708, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1277, 35919, 118375, 206630, -3304, 57676, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1278, 35912, 116827, 204864, -2976, 32332, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1279, 35920, 116850, 204834, -2976, 32332, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1280, 35923, 117077, 206107, -3336, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1281, 35923, 118004, 205749, -3336, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1282, 35912, 117104, 206480, -2952, 20696, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1283, 35912, 117136, 206496, -2952, 20696, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1284, 35912, 117984, 206944, -2952, 21772, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1285, 35912, 118256, 206976, -2936, 14472, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1286, 35912, 118016, 206960, -2952, 21772, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1287, 35912, 118224, 206976, -2952, 14472, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1288, 35912, 119472, 205504, -3336, 5396, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1289, 35912, 119763, 206220, -2888, 60016, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1290, 35912, 119779, 206246, -2888, 60016, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1291, 35912, 119440, 205552, -3336, 5396, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1292, 35912, 119504, 205456, -3336, 5396, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1293, 35920, 119392, 206171, -2976, 11844, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1294, 35912, 119747, 206264, -2888, 60016, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1295, 35912, 119794, 206273, -2888, 60016, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1296, 35912, 119531, 205508, -3336, 5396, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1297, 35919, 119419, 206158, -2976, 11844, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1298, 35912, 119430, 206179, -2976, 11844, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1299, 35912, 119403, 206191, -2976, 11844, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1300, 35920, 119912, 206345, -3152, 43536, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1301, 35912, 119900, 206325, -3152, 43536, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1302, 35910, 118805, 204842, -2440, 5396, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1303, 35910, 118789, 204870, -2440, 5396, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1304, 35917, 118948, 203642, -3304, 38352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1305, 35912, 119024, 202944, -2952, 51912, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1306, 35912, 120496, 204560, -2952, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1307, 35916, 118967, 203538, -3304, 38352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1308, 35912, 120064, 206288, -2952, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1309, 35912, 119527, 205417, -3336, 5396, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1310, 35916, 118897, 203650, -3304, 38352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1311, 35912, 120128, 203744, -2952, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1312, 35916, 118914, 203622, -3304, 38352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1313, 35916, 118931, 203595, -3304, 38352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1314, 35917, 118965, 203615, -3304, 38352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1315, 35917, 118930, 203669, -3304, 38352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1316, 35917, 119000, 203557, -3304, 38352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1317, 35917, 118982, 203585, -3304, 38352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1318, 35916, 118948, 203565, -3304, 38352, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1319, 35912, 118992, 202944, -2952, 51912, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1320, 35912, 120096, 203712, -2952, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1321, 35912, 120496, 204528, -2952, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1322, 35912, 119924, 206311, -3152, 43536, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1323, 35919, 119936, 206330, -3152, 43536, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1324, 35919, 120446, 205346, -3152, 32412, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1325, 35912, 120425, 205377, -3152, 32412, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1326, 35912, 120030, 205042, -2976, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1327, 35920, 120447, 205375, -3152, 32412, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1328, 35912, 120424, 205348, -3152, 32412, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1329, 35920, 120000, 205008, -2976, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1330, 35919, 120000, 205042, -2976, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1331, 35912, 120029, 205007, -2976, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1332, 35912, 120286, 205253, -2888, 15872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1333, 35912, 120319, 205293, -2888, 15872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1334, 35912, 120256, 205296, -2888, 15872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1335, 35912, 120288, 205294, -2888, 15872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1336, 35912, 120048, 206320, -2952, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1337, 35912, 120480, 205520, -2952, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1338, 35912, 120496, 205488, -2952, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1339, 35911, 118984, 205165, -3328, 5396, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1340, 35911, 118968, 205196, -3328, 5396, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1341, 35911, 118952, 205226, -3328, 5396, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1342, 35911, 118935, 205258, -3328, 5396, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1343, 35911, 120292, 205846, -3336, 5396, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1344, 35911, 120276, 205874, -3336, 5396, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1345, 35911, 120261, 205901, -3336, 5396, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (108, 1346, 35911, 120245, 205931, -3336, 5396, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1347, 35956, 157328, -70800, -2832, 16472, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1348, 35955, 157463, -70870, -2832, 25440, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1349, 35955, 157492, -70713, -2832, 30712, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1350, 35956, 157492, -70607, -2832, 32980, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1351, 35955, 157533, -70508, -2832, 36940, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1352, 35955, 157337, -70477, -2832, 50800, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1353, 35944, 156999, -69660, -2688, 59524, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1354, 35956, 156975, -69646, -2688, 59524, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1355, 35944, 157015, -69635, -2688, 59524, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1356, 35944, 156816, -70288, -2488, 31496, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1357, 35944, 156816, -70256, -2488, 31496, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1358, 35944, 157507, -69567, -2504, 25844, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1359, 35955, 156992, -69621, -2688, 59524, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1360, 35944, 157525, -69544, -2512, 25844, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1361, 35956, 157529, -69582, -2504, 25844, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1362, 35944, 157691, -68621, -2680, 59472, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1363, 35955, 157546, -69558, -2504, 25844, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1364, 35956, 157668, -68608, -2680, 59472, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1365, 35955, 157685, -68583, -2680, 59472, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1366, 35944, 157639, -68938, -2416, 43096, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1367, 35944, 157277, -69490, -2416, 11300, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1368, 35944, 157658, -68909, -2416, 43096, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1369, 35944, 157267, -69448, -2416, 11300, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1370, 35944, 157292, -69461, -2416, 11300, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1371, 35944, 157663, -68953, -2416, 43096, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1372, 35944, 157614, -68922, -2416, 43096, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1373, 35944, 157317, -69475, -2416, 11300, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1374, 35943, 157304, -69040, -2864, 27244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1375, 35943, 157286, -69067, -2864, 27244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1376, 35943, 157269, -69095, -2864, 27244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1377, 35943, 157252, -69122, -2864, 27244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1378, 35942, 158995, -70013, -1968, 27244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1379, 35942, 158498, -70578, -2496, 43156, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1380, 35942, 159140, -70926, -2344, 26960, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1381, 35942, 159156, -70900, -2344, 26960, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1382, 35942, 159173, -70875, -2344, 26960, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1383, 35942, 159647, -70215, -2104, 43156, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1384, 35942, 159699, -70249, -2144, 43156, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1385, 35942, 159674, -70231, -2144, 43156, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1386, 35942, 158473, -70562, -2496, 43156, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1387, 35942, 158524, -70595, -2496, 43156, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1388, 35942, 158976, -70041, -1968, 27244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1389, 35942, 159013, -69985, -1968, 27244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1390, 35942, 158958, -70070, -1968, 27244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1391, 35942, 159030, -69956, -1968, 27244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1392, 35942, 158940, -70099, -1968, 27244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1393, 35942, 159048, -69930, -1968, 27244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1394, 35942, 158923, -70128, -1968, 27244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1395, 35941, 159217, -70399, -1936, 59020, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1396, 35941, 159232, -70377, -1936, 59020, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1397, 35941, 159247, -70355, -1936, 59020, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1398, 35941, 159262, -70334, -1936, 59020, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1399, 35941, 159057, -70263, -1936, 27244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1400, 35941, 159071, -70240, -1936, 27244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1401, 35941, 159084, -70219, -1936, 27244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1402, 35940, 159088, -70272, -1936, 27244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1403, 35941, 159044, -70283, -1936, 27244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1404, 35953, 158057, -71678, -2832, 27244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1405, 35953, 158076, -71648, -2832, 27244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1406, 35952, 158018, -71654, -2832, 27244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1407, 35952, 158035, -71626, -2832, 27244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1408, 35944, 159691, -71423, -2688, 59460, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1409, 35944, 159669, -71408, -2688, 59460, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1410, 35956, 159676, -71448, -2688, 59460, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1411, 35955, 159653, -71433, -2688, 59460, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1412, 35961, 158676, -71010, -2864, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1413, 35944, 158247, -69664, -2864, 27244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1414, 35944, 158181, -69690, -2864, 27244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1415, 35943, 159674, -70639, -2864, 59020, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1416, 35944, 158226, -69696, -2864, 27244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1417, 35944, 158208, -69728, -2864, 27244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1418, 35944, 158192, -69760, -2864, 27244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1419, 35943, 159637, -70692, -2864, 59020, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1420, 35943, 159656, -70666, -2864, 59020, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1421, 35943, 159693, -70612, -2864, 59020, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1422, 35943, 158661, -69918, -2864, 27244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1423, 35943, 158643, -69946, -2864, 27244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1424, 35943, 158625, -69974, -2864, 27244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1425, 35943, 158607, -70003, -2864, 27244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1426, 35944, 158538, -68946, -2688, 60068, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1427, 35944, 158524, -68970, -2688, 60068, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1428, 35955, 158503, -68958, -2688, 60068, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1429, 35956, 158517, -68934, -2688, 60068, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1430, 35944, 159031, -68885, -2512, 26024, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1431, 35944, 159050, -68857, -2512, 26024, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1432, 35956, 159053, -68898, -2512, 26024, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1433, 35955, 159072, -68873, -2512, 26024, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1434, 35944, 157707, -68595, -2680, 59472, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1435, 35944, 157821, -69104, -2504, 26492, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1436, 35944, 157843, -69118, -2504, 26492, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1437, 35956, 157804, -69128, -2504, 26492, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1438, 35955, 157826, -69142, -2504, 26493, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1439, 35944, 158603, -68865, -2416, 35548, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1440, 35944, 158613, -68901, -2416, 35548, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1441, 35944, 158566, -68862, -2416, 35548, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1442, 35944, 158576, -68896, -2416, 35548, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1443, 35944, 159056, -67952, -2488, 16860, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1444, 35944, 157904, -68352, -2488, 19356, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1445, 35944, 159088, -67952, -2472, 16860, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1446, 35944, 157936, -68336, -2488, 19356, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1447, 35953, 158007, -71763, -2832, 27244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1448, 35953, 158022, -71733, -2832, 27244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1449, 35953, 158041, -71706, -2832, 27244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1450, 35952, 157968, -71739, -2832, 27244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1451, 35952, 157984, -71712, -2832, 27244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1452, 35952, 158000, -71683, -2832, 27244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1453, 35958, 159664, -72208, -2784, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1454, 35958, 159552, -71936, -2784, 26704, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1455, 35958, 159360, -72224, -2784, 26704, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1456, 35958, 159376, -72288, -2784, 43156, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1457, 35958, 159728, -72528, -2784, 43156, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1458, 35958, 159616, -71920, -2784, 10768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1459, 35958, 159501, -72419, -2680, 10768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1460, 35958, 159471, -72400, -2672, 10768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1461, 35961, 158667, -72530, -2864, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1462, 35944, 157696, -72256, -2488, 44404, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1463, 35944, 157728, -72272, -2488, 44404, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1464, 35944, 158960, -72912, -2488, 48900, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1465, 35944, 158912, -72912, -2488, 48900, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1466, 35944, 160837, -71800, -2504, 59636, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1467, 35958, 159792, -72512, -2784, 59860, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1468, 35958, 159984, -72224, -2784, 59860, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1469, 35958, 159984, -72160, -2720, 10768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1470, 35958, 159840, -72026, -2680, 43156, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1471, 35958, 159869, -72046, -2680, 43156, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1472, 35955, 160815, -71786, -2504, 59636, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1473, 35944, 160977, -72282, -2680, 26660, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1474, 35944, 160962, -72304, -2680, 26660, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1475, 35956, 160831, -71761, -2504, 59636, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1476, 35955, 160981, -72318, -2680, 26660, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1477, 35956, 160997, -72295, -2680, 26660, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1478, 35944, 160854, -71775, -2504, 59636, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1479, 35944, 160996, -72002, -2416, 9824, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1480, 35944, 161049, -71986, -2416, 9824, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1481, 35944, 160995, -71948, -2416, 9824, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1482, 35944, 161022, -71966, -2416, 9824, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1483, 35944, 159776, -72976, -2488, 47640, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1484, 35944, 159744, -72976, -2488, 47640, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1485, 35944, 160608, -72624, -2488, 55604, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1486, 35944, 160576, -72640, -2488, 55604, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1487, 35943, 161370, -71836, -2864, 59020, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1488, 35943, 161352, -71863, -2864, 59020, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1489, 35943, 161390, -71809, -2864, 59020, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1490, 35943, 161409, -71781, -2864, 59020, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1491, 35949, 160527, -70042, -2864, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1492, 35949, 161003, -70843, -2864, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1493, 35949, 160663, -70754, -2864, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1494, 35949, 160527, -70042, -2864, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1495, 35950, 160960, -70272, -2712, 18576, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1496, 35950, 161168, -69904, -2776, 58276, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1497, 35950, 160944, -70400, -2840, 44664, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1498, 35950, 161344, -70240, -2808, 44536, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1499, 35947, 160753, -70682, -2864, 42660, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1500, 35946, 160657, -70243, -2864, 34940, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1501, 35946, 161010, -69712, -2864, 19060, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1502, 35946, 161548, -70064, -2864, 1580, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1503, 35946, 161200, -70592, -2864, 51012, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1504, 35948, 160736, -69904, -2744, 59956, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1505, 35948, 161367, -69758, -2776, 44008, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1506, 35948, 161504, -70400, -2808, 26872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1507, 35945, 161066, -70241, -2712, 1744, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1508, 35944, 160185, -71361, -2504, 27084, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1509, 35944, 160200, -71338, -2512, 27084, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1510, 35956, 160207, -71373, -2504, 27084, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1511, 35955, 160222, -71348, -2504, 27084, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1512, 35956, 161685, -71255, -2688, 26400, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1513, 35944, 161663, -71242, -2688, 26400, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1514, 35944, 161647, -71266, -2688, 26400, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1515, 35955, 161668, -71279, -2688, 26400, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1516, 35944, 161156, -71330, -2504, 58224, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1517, 35956, 161135, -71313, -2512, 58224, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1518, 35944, 161136, -71355, -2504, 58224, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1519, 35955, 161115, -71338, -2504, 58224, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1520, 35944, 161377, -71431, -2416, 43456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1521, 35944, 160048, -71328, -2416, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1522, 35944, 160048, -71296, -2416, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1523, 35961, 160000, -69863, -2864, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1524, 35944, 160271, -70936, -2864, 59020, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1525, 35944, 160224, -70928, -2864, 59020, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1526, 35944, 160193, -70967, -2864, 59020, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1527, 35944, 160254, -70890, -2864, 59020, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1528, 35944, 160280, -70855, -2864, 59020, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1529, 35944, 161760, -69760, -2488, 4788, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1530, 35944, 161760, -69728, -2472, 3788, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1531, 35944, 161395, -71401, -2416, 43456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1532, 35944, 160080, -71344, -2416, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1533, 35944, 161347, -71413, -2416, 43456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1534, 35944, 160080, -71312, -2416, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1535, 35944, 161406, -71448, -2416, 43456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1536, 35949, 161411, -69508, -2864, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1537, 35949, 160595, -69597, -2864, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1538, 35960, 160146, -68656, -2824, 43272, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1539, 35961, 161272, -69361, -2864, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1540, 35944, 160384, -68256, -2488, 10548, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1541, 35944, 160416, -68272, -2464, 10548, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1542, 35944, 161824, -70944, -2488, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (109, 1543, 35944, 161824, -70976, -2472, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1544, 35998, 68146, -60737, -2744, 44530, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1545, 35980, 69437, -60801, -2416, 28628, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1546, 35980, 69409, -60868, -2416, 28628, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1547, 35980, 69423, -60834, -2416, 28628, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1548, 35994, 68784, -59536, -2752, 43868, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1549, 35993, 68910, -59805, -2752, 24424, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1550, 35993, 68828, -59866, -2752, 22032, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1551, 35994, 68720, -59920, -2752, 19692, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1552, 35993, 68637, -59870, -2752, 14780, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1553, 35993, 68544, -59888, -2752, 10500, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1554, 35999, 68990, -61040, -2784, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1555, 35982, 68000, -59616, -2408, 22760, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1556, 35982, 68016, -59600, -2408, 22760, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1557, 35982, 67696, -60096, -2408, 28804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1558, 35982, 67712, -60064, -2408, 28804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1559, 35980, 70097, -61213, -1888, 12388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1560, 35980, 70065, -61201, -1888, 12388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1561, 35980, 70129, -61224, -1888, 12388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1562, 35980, 70033, -61189, -1888, 12388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1563, 35980, 70161, -61236, -1888, 12388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1564, 35980, 70003, -61177, -1888, 12388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1565, 35980, 70190, -61247, -1888, 12388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1566, 35980, 69972, -61165, -1888, 12388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1567, 35979, 69890, -61333, -1856, 12388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1568, 35979, 69861, -61321, -1856, 12388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1569, 35979, 69917, -61345, -1856, 12388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1570, 35978, 69860, -61364, -1856, 12388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1571, 35979, 69833, -61310, -1856, 12388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1572, 35996, 71248, -60512, -2704, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1573, 35996, 71323, -60817, -2704, 45160, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1574, 35996, 70990, -60678, -2704, 45160, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1575, 35996, 71520, -60336, -2704, 12076, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1576, 35996, 71186, -60196, -2704, 12076, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1577, 35996, 71385, -60786, -2704, 61032, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1578, 35996, 71546, -60401, -2704, 61032, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1579, 35996, 71120, -60228, -2704, 28628, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1580, 35996, 70962, -60610, -2704, 28628, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1581, 35996, 71481, -60638, -2600, 28628, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1582, 35996, 71468, -60669, -2600, 28628, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1583, 35996, 71027, -60378, -2600, 61032, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1584, 35996, 71040, -60347, -2600, 61032, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1585, 35982, 69817, -59833, -2608, 61256, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1586, 35982, 69828, -59808, -2608, 61256, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1587, 35994, 69794, -59823, -2608, 61256, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1588, 35993, 69805, -59798, -2608, 61256, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1589, 35982, 70042, -60280, -2432, 28620, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1590, 35982, 70031, -60306, -2432, 28620, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1591, 35994, 70064, -60289, -2432, 28620, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1592, 35993, 70053, -60314, -2432, 28620, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1593, 35982, 71095, -59761, -2432, 12588, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1594, 35982, 71123, -59771, -2432, 12588, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1595, 35994, 71086, -59783, -2432, 12588, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1596, 35993, 71113, -59794, -2432, 12588, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1597, 35982, 70012, -60004, -2336, 4192, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1598, 35982, 69999, -59974, -2336, 4192, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1599, 35982, 70044, -60009, -2336, 4192, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1600, 35982, 70029, -59979, -2336, 4192, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1601, 35982, 70976, -59448, -2336, 28356, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1602, 35982, 70957, -59404, -2336, 28356, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1603, 35982, 70931, -59462, -2336, 28356, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1604, 35982, 70944, -59433, -2336, 28356, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1605, 35982, 70609, -60237, -2784, 12388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1606, 35982, 70576, -60224, -2784, 12388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1607, 35982, 70541, -60210, -2784, 12388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1608, 35982, 70506, -60195, -2784, 12388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1609, 35982, 70572, -60185, -2784, 12388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1610, 35982, 71488, -59504, -2408, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1611, 35982, 71504, -59536, -2408, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1612, 35981, 70126, -60877, -2784, 12388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1613, 35981, 70091, -60862, -2784, 12388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1614, 35981, 70055, -60847, -2784, 12388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1615, 35981, 70019, -60832, -2784, 12388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1616, 35982, 70403, -59058, -2608, 45208, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1617, 35982, 70427, -59068, -2608, 45208, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1618, 35994, 70412, -59037, -2608, 45208, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1619, 35993, 70435, -59046, -2608, 45208, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1620, 35982, 69931, -59280, -2432, 12220, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1621, 35982, 69957, -59291, -2432, 12220, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1622, 35994, 69923, -59302, -2432, 12220, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1623, 35993, 69948, -59313, -2432, 12220, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1624, 35982, 70916, -59275, -2608, 45188, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1625, 35982, 70942, -59285, -2608, 45188, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1626, 35994, 70926, -59252, -2608, 45188, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1627, 35993, 70952, -59263, -2608, 45188, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1628, 35982, 70269, -59154, -2336, 61308, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1629, 35982, 70290, -59192, -2336, 61308, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1630, 35982, 70312, -59142, -2336, 61308, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1631, 35982, 70301, -59167, -2336, 61308, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1632, 35982, 69680, -58864, -2408, 19180, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1633, 35982, 69712, -58864, -2408, 19180, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1634, 35981, 70722, -59105, -2784, 12388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1635, 35981, 70752, -59119, -2784, 12388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1636, 35981, 70691, -59093, -2784, 12388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1637, 35981, 70659, -59080, -2784, 12388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1638, 35982, 72160, -60528, -2408, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1639, 35982, 72160, -60560, -2408, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1640, 35981, 69614, -62009, -2784, 45292, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1641, 35980, 69252, -61552, -2264, 12552, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1642, 35984, 68592, -62160, -2784, 4136, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1643, 35984, 68013, -61916, -2784, 21000, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1644, 35985, 68722, -62554, -2784, 61508, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1645, 35984, 68356, -62741, -2784, 53344, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1646, 35984, 67767, -62500, -2784, 37948, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1647, 35986, 68352, -61936, -2720, 46212, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1648, 35986, 68016, -62736, -2656, 13892, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1649, 35986, 67776, -62160, -2688, 62716, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1650, 35983, 68289, -62354, -2624, 20544, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1651, 35980, 69222, -61541, -2264, 12552, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1652, 35980, 69282, -61564, -2264, 12552, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1653, 35987, 68667, -62063, -2784, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1654, 35987, 68744, -62671, -2784, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1655, 35987, 68898, -62367, -2784, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1656, 35987, 68898, -62367, -2784, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1657, 35987, 68436, -62823, -2784, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1658, 35987, 68975, -62519, -2784, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1659, 35988, 68336, -62400, -2624, 38144, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1660, 35988, 67936, -62320, -2688, 12636, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1661, 35988, 68192, -62080, -2720, 61064, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1662, 35988, 68464, -62432, -2752, 60752, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1663, 35982, 69575, -63461, -2432, 44768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1664, 35982, 69600, -63472, -2432, 44768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1665, 35994, 69584, -63440, -2432, 44768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1666, 35993, 69610, -63451, -2432, 44768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1667, 35982, 68590, -63468, -2608, 12512, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1668, 35982, 68616, -63477, -2608, 12512, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1669, 35982, 68411, -62981, -2432, 45576, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1670, 35982, 68438, -62990, -2432, 45576, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1671, 35994, 68447, -62968, -2432, 45576, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1672, 35993, 68420, -62959, -2432, 45576, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1673, 35982, 68563, -63308, -2336, 61368, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1674, 35982, 68579, -63346, -2336, 61368, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1675, 35982, 68590, -63320, -2336, 61368, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1676, 35982, 68602, -63293, -2336, 61368, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1677, 35982, 69231, -62973, -2784, 45292, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1678, 35982, 69151, -62943, -2784, 45292, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1679, 35982, 69191, -62958, -2784, 45292, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1680, 35982, 69110, -62926, -2784, 45292, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1681, 35982, 69154, -62996, -2784, 45292, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1682, 35982, 68048, -63248, -2408, 40016, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1683, 35982, 68016, -63216, -2408, 40016, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1684, 35981, 69543, -61980, -2784, 45292, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1685, 35981, 69578, -61995, -2784, 45292, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1686, 35980, 70006, -61926, -2072, 28628, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1687, 35980, 70017, -61899, -2072, 28628, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1688, 35980, 69995, -61953, -2072, 28628, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1689, 35979, 69779, -61521, -1856, 45292, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1690, 35979, 69807, -61534, -1856, 45292, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1691, 35979, 69750, -61509, -1856, 45292, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1692, 35979, 69835, -61545, -1856, 45292, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1693, 35991, 71345, -62287, -2752, 45292, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1694, 35991, 71315, -62274, -2752, 45292, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1695, 35991, 71254, -62249, -2752, 45292, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1696, 35991, 71285, -62261, -2752, 45292, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1697, 35991, 71222, -62236, -2752, 45292, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1698, 35990, 71331, -62323, -2752, 45292, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1699, 35990, 71300, -62311, -2752, 45292, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1700, 35990, 71269, -62299, -2752, 45292, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1701, 35990, 71239, -62287, -2752, 45292, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1702, 35990, 71207, -62274, -2752, 45292, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1703, 35994, 70191, -62696, -2608, 45224, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1704, 35982, 70183, -62719, -2608, 45224, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1705, 35982, 70208, -62728, -2608, 45224, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1706, 35982, 69737, -62945, -2432, 12244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1707, 35993, 70216, -62706, -2608, 45224, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1708, 35982, 69711, -62934, -2432, 12244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1709, 35994, 69728, -62966, -2432, 12244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1710, 35993, 69702, -62955, -2432, 12244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1711, 35982, 69847, -62847, -2336, 34624, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1712, 35982, 69840, -62816, -2336, 34624, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1713, 35982, 69813, -62836, -2336, 34624, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1714, 35982, 69819, -62866, -2336, 34624, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1715, 35999, 70603, -61725, -2784, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1716, 35981, 69649, -62023, -2784, 45292, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1717, 35999, 71984, -61487, -2784, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1718, 35982, 71760, -62816, -2408, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1719, 35982, 71744, -62848, -2408, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1720, 35982, 72160, -61904, -2408, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1721, 35982, 72144, -61936, -2408, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1722, 35982, 67536, -62592, -2408, 41036, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1723, 35982, 67520, -62560, -2408, 41036, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1724, 35982, 67312, -61008, -2408, 28824, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1725, 35999, 67459, -61298, -2784, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1726, 35982, 67328, -60976, -2408, 28824, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1727, 35982, 69133, -63688, -2608, 12516, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1728, 35982, 69108, -63679, -2608, 12516, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1729, 35994, 69124, -63709, -2608, 12516, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1730, 35993, 69099, -63699, -2608, 12516, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1731, 35994, 68582, -63490, -2608, 12512, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1732, 35993, 68606, -63500, -2608, 12512, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1733, 35982, 69271, -63600, -2336, 28844, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1734, 35982, 69254, -63561, -2336, 28844, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1735, 35982, 69232, -63616, -2336, 28844, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1736, 35982, 69243, -63588, -2336, 28844, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1737, 35981, 68779, -63634, -2784, 45292, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1738, 35981, 68810, -63646, -2784, 45292, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1739, 35981, 68842, -63660, -2784, 45292, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1740, 35981, 68872, -63673, -2784, 45292, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1741, 35982, 69696, -63920, -2408, 50516, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1742, 35982, 69664, -63920, -2408, 50516, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1743, 35982, 70512, -63808, -2408, 50588, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (110, 1744, 35982, 70480, -63808, -2408, 50588, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1745, 36018, 111457, -141672, -2960, 62612, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1746, 36018, 111447, -141703, -2960, 62612, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1747, 36018, 111438, -141736, -2960, 62612, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1748, 36018, 111428, -141768, -2960, 62612, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1749, 36019, 111369, -141092, -2512, 51072, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1750, 36019, 110720, -142800, -2576, 57632, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1751, 36019, 110752, -142784, -2576, 57632, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1752, 36019, 110720, -139456, -2576, 8564, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1753, 36019, 110752, -139472, -2552, 8564, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1754, 36019, 111456, -140416, -2552, 4172, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1755, 36019, 111456, -140448, -2576, 4172, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1756, 36019, 110834, -141561, -2952, 62612, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1757, 36019, 110768, -141637, -2952, 62612, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1758, 36019, 110785, -141576, -2952, 62612, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1759, 36019, 110800, -141520, -2952, 62612, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1760, 36019, 110818, -141462, -2952, 62612, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1761, 36030, 111206, -140667, -2952, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1762, 36019, 111339, -141097, -2512, 51072, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1763, 36019, 111040, -142160, -2504, 8252, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1764, 36019, 111019, -142139, -2504, 8252, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1765, 36019, 111060, -142180, -2504, 8252, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1766, 36019, 111021, -142178, -2504, 8252, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1767, 36019, 111309, -141104, -2512, 51072, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1768, 36019, 111334, -141069, -2512, 51072, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1769, 36026, 110641, -142162, -2592, 57028, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1770, 36019, 110658, -142181, -2600, 57028, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1771, 36019, 110679, -142161, -2592, 57028, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1772, 36026, 111222, -142214, -2776, 24388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1773, 36027, 111202, -142233, -2776, 24388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1774, 36019, 111205, -142196, -2776, 24388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1775, 36019, 111185, -142216, -2776, 24388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1776, 36026, 111020, -140860, -2600, 2748, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1777, 36027, 111027, -140889, -2600, 2748, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1778, 36019, 111044, -140854, -2600, 2748, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1779, 36019, 111052, -140883, -2600, 2748, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1780, 36026, 111517, -141157, -2776, 35104, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1781, 36027, 111510, -141129, -2776, 35104, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1782, 36019, 111492, -141163, -2776, 35104, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1783, 36019, 111486, -141134, -2776, 35104, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1784, 36019, 109584, -143216, -2576, 52864, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1785, 36018, 110095, -141353, -2952, 62612, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1786, 36018, 110085, -141386, -2952, 62612, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1787, 36018, 110064, -141453, -2952, 62612, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1788, 36019, 109616, -143200, -2576, 52864, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1789, 36018, 110074, -141419, -2952, 62612, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1790, 36030, 110118, -140598, -2952, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1791, 36029, 110032, -142368, -2872, 18368, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1792, 36027, 110662, -142143, -2600, 57028, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1793, 36024, 109705, -139732, -2928, 29804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1794, 36029, 109875, -142365, -2768, 51260, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1795, 36029, 109843, -142889, -2768, 18368, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1796, 36029, 109874, -142883, -2768, 18368, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1797, 36023, 109636, -139821, -2928, 29804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1798, 36029, 109843, -142372, -2768, 51260, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1799, 36029, 110151, -142753, -2872, 2772, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1800, 36023, 109665, -139720, -2928, 29804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1801, 36029, 109642, -142868, -2872, 34944, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1802, 36024, 109716, -139698, -2928, 29804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1803, 36029, 109600, -142448, -2872, 18368, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1804, 36023, 109676, -139687, -2928, 29804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1805, 36023, 109656, -139752, -2928, 29804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1806, 36024, 109675, -139832, -2928, 29804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1807, 36024, 109685, -139798, -2928, 29804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1808, 36024, 109695, -139764, -2928, 29804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1809, 36029, 109568, -142496, -2872, 34944, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1810, 36016, 109592, -141241, -2032, 62612, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1811, 36016, 109575, -141297, -2032, 62612, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1812, 36023, 109646, -139787, -2928, 29804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1813, 36029, 110080, -142400, -2872, 2772, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1814, 36017, 109674, -141758, -2432, 29856, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1815, 36029, 110128, -142800, -2872, 51260, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1816, 36029, 109696, -142896, -2872, 51260, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1817, 36029, 109856, -142624, -2872, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1818, 36017, 109967, -141004, -2240, 46084, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1819, 36017, 109665, -141788, -2432, 29856, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1820, 36017, 109656, -141818, -2432, 29856, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1821, 36016, 109601, -141213, -2008, 62612, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1822, 36017, 109994, -141012, -2240, 46084, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1823, 36017, 109939, -140996, -2240, 46084, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1824, 36016, 109584, -141269, -2032, 62612, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1825, 36017, 108912, -141654, -2584, 46084, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1826, 36017, 108975, -141673, -2584, 46084, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1827, 36017, 108944, -141664, -2584, 46084, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1828, 36030, 108958, -142888, -2960, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1829, 36030, 109179, -142057, -2952, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1830, 36017, 109238, -140982, -2064, 29804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1831, 36017, 109228, -141012, -2064, 29804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1832, 36017, 109219, -141042, -2064, 29804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1833, 36017, 109248, -140950, -2064, 29804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1834, 36017, 109257, -140919, -2064, 29804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1835, 36017, 109209, -141073, -2064, 29804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1836, 36017, 109200, -141104, -2064, 29804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1837, 36017, 109266, -140889, -2064, 29804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1838, 36016, 109387, -141178, -2032, 29804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1839, 36016, 109379, -141206, -2032, 29804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1840, 36016, 109395, -141150, -2032, 29804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1841, 36016, 109371, -141234, -2032, 29804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1842, 36015, 109423, -141204, -2032, 29804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1843, 36018, 108906, -140993, -2952, 29804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1844, 36018, 108896, -141025, -2952, 29804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1845, 36018, 108886, -141059, -2952, 29804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1846, 36018, 108875, -141093, -2952, 29804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1847, 36027, 108107, -141920, -2920, 56268, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1848, 36026, 108476, -142277, -2920, 29120, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1849, 36026, 108286, -142320, -2920, 20180, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1850, 36027, 108437, -142101, -2920, 39544, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1851, 36026, 108271, -141965, -2920, 47208, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1852, 36026, 108124, -142146, -2920, 60980, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1853, 36019, 107873, -141326, -2600, 35900, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1854, 36026, 107897, -141319, -2600, 35900, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1855, 36019, 107424, -141632, -2576, 34436, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1856, 36019, 107440, -141664, -2576, 34436, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1857, 36019, 108335, -140753, -2952, 29804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1858, 36019, 107414, -141076, -2776, 3308, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1859, 36019, 107405, -141048, -2776, 3308, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1860, 36027, 107391, -141083, -2776, 3308, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1861, 36026, 107382, -141056, -2776, 3308, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1862, 36019, 107864, -141298, -2600, 35900, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1863, 36027, 107888, -141291, -2600, 35900, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1864, 36019, 107737, -140023, -2776, 56356, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1865, 36019, 107715, -140042, -2776, 56356, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1866, 36027, 107721, -140005, -2776, 56356, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1867, 36026, 107700, -140023, -2776, 56356, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1868, 36019, 108238, -140078, -2592, 23836, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1869, 36019, 108259, -140060, -2600, 23836, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1870, 36027, 108255, -140096, -2592, 23836, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1871, 36026, 108276, -140078, -2592, 23836, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1872, 36019, 107568, -141135, -2512, 18972, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1873, 36019, 107589, -141098, -2512, 18972, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1874, 36019, 107532, -141113, -2512, 18972, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1875, 36019, 107560, -141105, -2512, 18972, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1876, 36019, 107894, -140060, -2504, 40748, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1877, 36019, 107852, -140059, -2504, 40748, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1878, 36019, 107894, -140101, -2504, 40748, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1879, 36019, 107873, -140080, -2504, 40748, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1880, 36018, 107479, -140502, -2960, 29804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1881, 36019, 108320, -140797, -2952, 29804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1882, 36019, 108304, -140848, -2952, 29804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1883, 36019, 108287, -140899, -2952, 29804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1884, 36019, 108260, -140804, -2952, 29804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1885, 36019, 108320, -139312, -2560, 25276, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1886, 36019, 108288, -139344, -2576, 25276, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1887, 36018, 107490, -140471, -2960, 29804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1888, 36018, 107470, -140534, -2960, 29804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (111, 1889, 36018, 107461, -140566, -2960, 29804, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1890, 36065, 6304, 151648, -2808, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1891, 36065, 6736, 151647, -2808, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1892, 36065, 6736, 152096, -2808, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1893, 36065, 6303, 152096, -2808, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1894, 36065, 6262, 151683, -2808, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1895, 36065, 6260, 152059, -2808, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1896, 36065, 6776, 152057, -2808, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1897, 36065, 6773, 151668, -2808, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1898, 36065, 6528, 151872, -2808, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1899, 36065, 6486, 151617, -2704, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1900, 36065, 6453, 151616, -2704, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1901, 36065, 6552, 152129, -2704, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1902, 36065, 6584, 152129, -2704, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1903, 36051, 7472, 151728, -2504, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1904, 36051, 7472, 151776, -2504, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1905, 36051, 7344, 152320, -2512, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1906, 36051, 7312, 152352, -2512, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1907, 36051, 6976, 152688, -2512, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1908, 36051, 6960, 152704, -2512, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1909, 36051, 6496, 152816, -2504, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1910, 36051, 6448, 152816, -2504, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1911, 36050, 7457, 150716, -2888, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1912, 36051, 7370, 151012, -2712, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1913, 36063, 7394, 151012, -2712, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1914, 36051, 7370, 150983, -2712, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1915, 36051, 6997, 151344, -2528, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1916, 36062, 7394, 150984, -2712, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1917, 36051, 6997, 151373, -2528, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1918, 36063, 6973, 151344, -2528, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1919, 36062, 6972, 151372, -2528, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1920, 36051, 7364, 150458, -2712, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1921, 36051, 7363, 150487, -2712, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1922, 36063, 7388, 150486, -2712, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1923, 36062, 7388, 150459, -2712, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1924, 36063, 6968, 150125, -2528, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1925, 36051, 6993, 150125, -2528, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1926, 36051, 6993, 150097, -2528, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1927, 36062, 6969, 150097, -2528, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1928, 36051, 7248, 151102, -2440, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1929, 36051, 7216, 151072, -2440, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1930, 36051, 7280, 151072, -2440, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1931, 36051, 7248, 151072, -2440, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1932, 36051, 7248, 150384, -2440, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1933, 36051, 7248, 150351, -2440, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1934, 36051, 7280, 150384, -2440, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1935, 36051, 7216, 150384, -2440, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1936, 36051, 6631, 150558, -2888, 9440, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1937, 36051, 6591, 150587, -2888, 9440, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1938, 36051, 6675, 150524, -2888, 9440, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1939, 36051, 6716, 150495, -2888, 9440, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1940, 36051, 6687, 150580, -2888, 9440, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1941, 36051, 7472, 149584, -2504, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1942, 36051, 7472, 149616, -2504, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1943, 36050, 6234, 149696, -2888, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1944, 36050, 6234, 149731, -2888, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1945, 36050, 6233, 149765, -2888, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1946, 36050, 6233, 149799, -2888, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1947, 36050, 7457, 150683, -2888, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1948, 36050, 7457, 150749, -2888, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1949, 36050, 7457, 150783, -2888, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1950, 36049, 5314, 149781, -1992, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1951, 36049, 5978, 150102, -2176, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1952, 36049, 6033, 150102, -2176, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1953, 36049, 5314, 149940, -1992, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1954, 36049, 6005, 150102, -2176, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1955, 36049, 5314, 149877, -1992, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1956, 36048, 5719, 149767, -1960, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1957, 36049, 5314, 149845, -1992, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1958, 36049, 5314, 149909, -1992, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1959, 36049, 5314, 149971, -1992, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1960, 36049, 5314, 149813, -1992, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1961, 36049, 5314, 150003, -1992, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1962, 36048, 5719, 149737, -1960, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1963, 36048, 5719, 149707, -1960, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1964, 36048, 5719, 149797, -1960, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1965, 36048, 5505, 149767, -1960, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1966, 36047, 5542, 149751, -1960, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1967, 36048, 5505, 149737, -1960, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1968, 36048, 5505, 149708, -1960, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1969, 36048, 5505, 149796, -1960, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1970, 36062, 4353, 150837, -2856, 12848, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1971, 36063, 4544, 151232, -2856, 42296, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1972, 36063, 4560, 150832, -2856, 25720, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1973, 36062, 4352, 151120, -2856, 53848, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1974, 36062, 4624, 150896, -2856, 28720, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1975, 36062, 4633, 151067, -2856, 36136, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1976, 36062, 5618, 151196, -2712, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1977, 36051, 5642, 151169, -2712, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1978, 36051, 5642, 151196, -2712, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1979, 36063, 5618, 151169, -2712, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1980, 36051, 6010, 150829, -2528, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1981, 36063, 6035, 150830, -2528, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1982, 36051, 6010, 150802, -2528, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1983, 36062, 6035, 150802, -2528, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1984, 36051, 5859, 150870, -2440, 58016, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1985, 36051, 5886, 150901, -2440, 58016, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1986, 36051, 5916, 150898, -2440, 58016, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1987, 36051, 5890, 150869, -2440, 58016, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1988, 36068, 5610, 150544, -2888, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1989, 36050, 4996, 149801, -2888, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1990, 36050, 4995, 149766, -2888, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1991, 36050, 4995, 149732, -2888, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1992, 36050, 4995, 149699, -2888, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1993, 36468, 4326, 149651, -2888, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1994, 36067, 5182, 152320, -2848, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1995, 36068, 5907, 152603, -2888, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1996, 36051, 5824, 152832, -2504, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1997, 36051, 5792, 152832, -2504, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1998, 36051, 4496, 152704, -2512, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 1999, 36051, 4464, 152672, -2512, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2000, 36051, 5152, 152832, -2504, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2001, 36051, 5120, 152832, -2504, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2002, 36051, 4128, 152352, -2512, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2003, 36051, 4112, 152320, -2512, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2004, 36054, 4816, 148016, -2888, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2005, 36053, 5136, 147744, -2888, 7600, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2006, 36053, 4499, 147751, -2888, 25408, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2007, 36052, 4794, 147528, -2728, 40880, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2008, 36049, 5951, 149230, -2368, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2009, 36049, 5951, 149262, -2368, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2010, 36049, 5951, 149294, -2368, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2011, 36049, 5193, 149154, -2520, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2012, 36049, 5225, 149154, -2520, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2013, 36049, 5257, 149154, -2520, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2014, 36056, 5238, 147853, -2888, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2015, 36056, 5570, 147483, -2888, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2016, 36056, 4325, 147705, -2888, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2017, 36056, 4740, 148149, -2888, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2018, 36056, 5487, 147557, -2888, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2019, 36057, 4848, 147632, -2728, 58432, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2020, 36057, 4800, 147728, -2856, 14988, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2021, 36051, 4463, 148113, -2528, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2022, 36063, 4487, 148113, -2528, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2023, 36051, 4463, 148086, -2528, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2024, 36062, 4488, 148087, -2528, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2025, 36051, 4097, 149019, -2712, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2026, 36051, 4097, 148992, -2712, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2027, 36051, 4467, 149355, -2528, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2028, 36051, 4467, 149384, -2528, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2029, 36063, 4492, 149354, -2528, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2030, 36051, 5634, 148502, -2712, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2031, 36051, 5662, 148502, -2712, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2032, 36062, 4492, 149383, -2528, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2033, 36063, 5634, 148527, -2712, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2034, 36062, 5662, 148527, -2712, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2035, 36051, 5304, 148130, -2528, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2036, 36051, 5304, 148102, -2528, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2037, 36063, 5280, 148131, -2528, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2038, 36062, 5280, 148103, -2528, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2039, 36051, 4254, 148384, -2440, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2040, 36051, 4222, 148352, -2440, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2041, 36051, 4190, 148384, -2440, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2042, 36051, 4222, 148384, -2440, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2043, 36051, 4197, 149085, -2440, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2044, 36051, 4229, 149117, -2440, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2045, 36051, 4261, 149085, -2440, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2046, 36051, 4229, 149085, -2440, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2047, 36051, 5336, 148458, -2440, 28400, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2048, 36051, 5359, 148494, -2440, 28400, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2049, 36051, 5345, 148519, -2440, 28400, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2050, 36051, 5331, 148489, -2440, 28400, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2051, 36068, 5530, 148820, -2888, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2052, 36051, 4719, 148896, -2888, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2053, 36051, 4719, 148832, -2888, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2054, 36051, 4720, 148764, -2888, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2055, 36051, 4719, 148704, -2888, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2056, 36051, 4672, 148797, -2888, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2057, 36060, 6912, 148339, -2856, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2058, 36060, 6911, 148288, -2856, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2059, 36060, 6910, 148242, -2856, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2060, 36060, 6909, 148196, -2856, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2061, 36060, 6908, 148148, -2856, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2062, 36059, 6953, 148338, -2856, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2063, 36059, 6950, 148242, -2856, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2064, 36059, 6952, 148288, -2856, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2065, 36059, 6949, 148196, -2856, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2066, 36059, 6949, 148148, -2856, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2067, 36051, 7472, 147936, -2504, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2068, 36051, 7472, 147968, -2504, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2069, 36051, 7472, 148752, -2504, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2070, 36051, 7472, 148800, -2488, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2071, 36056, 5653, 147187, -2888, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2072, 36057, 4576, 147344, -2824, 15104, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2073, 36055, 4368, 147424, -2824, 2312, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2074, 36053, 4501, 147117, -2888, 40716, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2075, 36057, 4912, 147200, -2792, 32172, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2076, 36055, 5264, 147424, -2760, 32684, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2077, 36055, 4816, 146992, -2792, 16576, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2078, 36053, 5132, 147118, -2888, 57864, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2079, 36051, 5792, 146640, -2504, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2080, 36051, 6496, 146624, -2504, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2081, 36051, 7344, 147136, -2512, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2082, 36051, 4496, 146768, -2512, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2083, 36051, 4480, 146800, -2512, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2084, 36051, 6448, 146624, -2504, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2085, 36051, 4112, 147152, -2512, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2086, 36051, 6992, 146784, -2512, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2087, 36068, 6687, 146909, -2888, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2088, 36051, 7328, 147104, -2512, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2089, 36051, 5840, 146640, -2504, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2090, 36051, 6960, 146768, -2512, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2091, 36051, 5152, 146640, -2504, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2092, 36051, 4144, 147120, -2512, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2093, 36051, 5120, 146640, -2504, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2094, 36051, 3984, 149840, -2504, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2095, 36051, 3984, 151536, -2504, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2096, 36051, 3984, 151488, -2504, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2097, 36051, 3984, 150672, -2504, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2098, 36051, 3984, 150704, -2504, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2099, 36051, 3984, 149872, -2504, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2100, 36050, 3995, 148715, -2888, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2101, 36050, 3995, 148747, -2888, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2102, 36050, 3995, 148779, -2888, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2103, 36051, 4091, 148447, -2712, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2104, 36051, 4091, 148475, -2712, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2105, 36063, 4067, 148448, -2712, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2106, 36062, 4067, 148475, -2712, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2107, 36063, 4073, 149019, -2712, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2108, 36062, 4073, 148992, -2712, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2109, 36051, 3984, 147632, -2504, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2110, 36051, 3984, 147600, -2504, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (112, 2111, 36050, 3995, 148683, -2888, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2112, 36131, 61771, 139177, -1728, 14280, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2113, 36131, 61808, 139170, -1728, 14280, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2114, 36131, 61844, 139164, -1728, 14280, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2115, 36131, 61879, 139157, -1728, 14280, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2116, 36131, 61916, 139151, -1728, 14280, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2117, 36130, 61778, 139215, -1728, 14280, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2118, 36130, 61815, 139207, -1728, 14280, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2119, 36130, 61851, 139200, -1728, 14280, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2120, 36130, 61886, 139193, -1728, 14280, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2121, 36130, 61923, 139186, -1728, 14280, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2122, 36126, 61584, 137568, -1376, 2321, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2123, 36126, 61616, 137552, -1376, 2364, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2124, 36126, 62672, 138256, -1376, 3125, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2125, 36126, 62688, 138288, -1376, 2789, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2126, 36126, 62864, 139232, -1376, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2127, 36134, 61870, 140645, -1568, 46936, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2128, 36133, 62134, 140145, -1392, 14420, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2129, 36126, 62139, 140170, -1392, 14420, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2130, 36126, 61865, 140621, -1568, 14638, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2131, 36126, 61835, 140628, -1568, 14764, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2132, 36134, 62103, 140151, -1392, 14420, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2133, 36133, 61578, 140687, -1752, 10553, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2134, 36126, 62108, 140176, -1392, 14420, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2135, 36126, 61933, 140466, -1304, 30684, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2136, 36126, 61903, 140503, -1304, 30684, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2137, 36126, 61891, 140444, -1304, 30684, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2138, 36126, 61897, 140473, -1304, 30684, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2139, 36137, 62720, 139538, -1752, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2140, 36126, 62880, 139280, -1360, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2141, 36126, 62400, 140624, -1376, 1797, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2142, 36126, 62368, 140624, -1376, 4532, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2143, 36125, 61596, 140760, -1752, 5133, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2144, 36125, 61565, 140766, -1752, 4274, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2145, 36125, 61531, 140772, -1752, 14480, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2146, 36125, 61498, 140779, -1752, 14480, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2147, 36124, 59760, 139901, -1384, 30752, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2148, 36124, 59774, 139965, -1384, 30752, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2149, 36124, 59767, 139933, -1384, 30752, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2150, 36124, 60362, 139714, -856, 14480, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2151, 36124, 60425, 139703, -856, 14480, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2152, 36124, 60394, 139708, -856, 14480, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2153, 36124, 60456, 139697, -856, 14480, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2154, 36124, 60488, 139691, -856, 14480, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2155, 36124, 60551, 139680, -856, 14480, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2156, 36124, 60520, 139685, -856, 14480, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2157, 36124, 60582, 139674, -856, 14480, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2158, 36123, 60303, 139321, -824, 46872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2159, 36123, 60272, 139328, -824, 46872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2160, 36123, 60243, 139334, -824, 46872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2161, 36123, 60213, 139341, -824, 46872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2162, 36123, 60348, 139528, -824, 14480, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2163, 36123, 60317, 139534, -824, 14480, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2164, 36123, 60287, 139539, -824, 14480, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2165, 36123, 60254, 139545, -824, 14480, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2166, 36122, 60296, 139508, -824, 14480, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2167, 36134, 59502, 140575, -1720, 19184, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2168, 36133, 59677, 140648, -1720, 27056, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2169, 36133, 59590, 140849, -1720, 35344, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2170, 36126, 61198, 140754, -1568, 47132, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2171, 36126, 61227, 140749, -1568, 47132, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2172, 36134, 61204, 140780, -1568, 47132, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2173, 36133, 61232, 140774, -1560, 47132, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2174, 36126, 60774, 140444, -1392, 14196, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2175, 36126, 60804, 140438, -1392, 14196, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2176, 36134, 60769, 140420, -1392, 14196, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2177, 36133, 60798, 140414, -1392, 14196, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2178, 36126, 61118, 140660, -1304, 63356, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2179, 36126, 61072, 140639, -1304, 63356, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2180, 36126, 61105, 140600, -1304, 63356, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2181, 36126, 61111, 140630, -1304, 63356, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2182, 36137, 61079, 139309, -1752, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2183, 36137, 59454, 139641, -1752, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2184, 36126, 61024, 140144, -1752, 7020, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2185, 36126, 60992, 140176, -1752, 7020, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2186, 36126, 60960, 140224, -1752, 7020, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2187, 36126, 60928, 140272, -1752, 7020, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2188, 36126, 61034, 140240, -1752, 7020, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2189, 36126, 60416, 141024, -1360, 14540, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2190, 36126, 60368, 141024, -1376, 14540, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2191, 36125, 60349, 140053, -1752, 14480, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2192, 36125, 60383, 140046, -1752, 14480, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2193, 36125, 60415, 140040, -1752, 14480, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2194, 36125, 60449, 140033, -1752, 14480, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2195, 36124, 59705, 139207, -1232, 14424, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2196, 36124, 59735, 139202, -1232, 14424, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2197, 36124, 59765, 139196, -1232, 14424, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2198, 36124, 60563, 139009, -1040, 30840, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2199, 36124, 60552, 138951, -1040, 30840, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2200, 36124, 60557, 138980, -1040, 30840, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2201, 36126, 59733, 138438, -1392, 46756, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2202, 36126, 59763, 138432, -1392, 46756, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2203, 36134, 59738, 138463, -1392, 46756, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2204, 36133, 59768, 138457, -1392, 46756, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2205, 36126, 59453, 138242, -1304, 30576, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2206, 36126, 59429, 138278, -1304, 30576, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2207, 36126, 59422, 138249, -1304, 30576, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2208, 36126, 59416, 138219, -1304, 30576, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2209, 36126, 59489, 138738, -1752, 39680, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2210, 36126, 59552, 138658, -1752, 39680, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2211, 36126, 59521, 138698, -1752, 39680, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2212, 36126, 59461, 138686, -1752, 39680, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2213, 36126, 59456, 138784, -1752, 39680, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2214, 36126, 60112, 137856, -1376, 62063, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2215, 36126, 60144, 137856, -1376, 62418, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2216, 36125, 60110, 138835, -1752, 46872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2217, 36125, 60143, 138829, -1752, 46872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2218, 36125, 60175, 138822, -1752, 46872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2219, 36125, 60207, 138815, -1752, 46872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2220, 36126, 59336, 138125, -1568, 14120, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2221, 36126, 59307, 138131, -1568, 14120, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2222, 36134, 59331, 138101, -1568, 14120, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2223, 36133, 59302, 138107, -1568, 14120, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2224, 36126, 58697, 138254, -1568, 13984, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2225, 36126, 58669, 138260, -1568, 13984, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2226, 36134, 58663, 138235, -1568, 13984, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2227, 36126, 58421, 138702, -1392, 46940, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2228, 36133, 58691, 138229, -1568, 13984, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2229, 36126, 58392, 138707, -1392, 46940, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2230, 36134, 58425, 138726, -1392, 46940, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2231, 36133, 58396, 138732, -1392, 46940, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2232, 36126, 58602, 138414, -1304, 63152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2233, 36126, 58640, 138435, -1304, 63152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2234, 36126, 58634, 138406, -1304, 63152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2235, 36126, 58628, 138378, -1304, 63152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2236, 36126, 57568, 139152, -1376, 18523, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2237, 36126, 57552, 139120, -1376, 16081, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2238, 36126, 58112, 138256, -1376, 22889, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2239, 36126, 58160, 138256, -1376, 24963, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2240, 36125, 59028, 138102, -1752, 46872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2241, 36125, 58963, 138116, -1752, 46872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2242, 36125, 58996, 138109, -1752, 46872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2243, 36125, 58929, 138124, -1752, 46872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2244, 36136, 58783, 139771, -1672, 63536, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2245, 36136, 58656, 139377, -1672, 46872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2246, 36136, 58707, 139408, -1664, 63536, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2247, 36136, 58240, 139457, -1672, 46872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2248, 36136, 58205, 139512, -1672, 30776, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2249, 36136, 58275, 139866, -1672, 30776, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2250, 36136, 58320, 139904, -1616, 14480, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2251, 36136, 58752, 139825, -1608, 14480, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2252, 36136, 58496, 139649, -1672, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2253, 36136, 58410, 139394, -1568, 14480, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2254, 36136, 58374, 139402, -1568, 14480, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2255, 36136, 58574, 139888, -1568, 46872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2256, 36136, 58607, 139881, -1568, 46872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2257, 36134, 59280, 140903, -1720, 58000, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2258, 36133, 59283, 140618, -1720, 9912, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2259, 36133, 59138, 140756, -1720, 2480, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2260, 36137, 57903, 139845, -1752, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2261, 36126, 57824, 140448, -1376, 34068, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2262, 36126, 57808, 140416, -1376, 33730, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2263, 36126, 58896, 141328, -1376, 64594, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (114, 2264, 36126, 58944, 141312, -1360, 64653, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2265, 36153, 11537, 95056, -2496, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2266, 36154, 11488, 95088, -2496, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2267, 36154, 11489, 94886, -2496, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2268, 36154, 11584, 95088, -2480, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2269, 36154, 11521, 94886, -2496, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2270, 36154, 11553, 94886, -2496, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2271, 36154, 11585, 94886, -2496, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2272, 36154, 11552, 95088, -2496, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2273, 36154, 11520, 95088, -2496, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2274, 36155, 11567, 95280, -2528, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2275, 36155, 11759, 95280, -2528, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2276, 36155, 11903, 94560, -2712, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2277, 36155, 10960, 95376, -3056, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2278, 36155, 11903, 94624, -2712, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2279, 36155, 11014, 94644, -2904, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2280, 36155, 11695, 95280, -2528, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2281, 36155, 11791, 95280, -2528, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2282, 36155, 10960, 95344, -3056, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2283, 36155, 11903, 94592, -2712, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2284, 36155, 11078, 94644, -2904, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2285, 36155, 11046, 94644, -2904, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2286, 36155, 10960, 95408, -3056, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2287, 36155, 11727, 95280, -2528, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2288, 36155, 11663, 95280, -2528, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2289, 36155, 11631, 95280, -2528, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2290, 36155, 11599, 95280, -2528, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2291, 36156, 12512, 93488, -3424, 39347, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2292, 36156, 12544, 93488, -3424, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2293, 36156, 11487, 94361, -3424, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2294, 36156, 11519, 95609, -3424, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2295, 36156, 11583, 94361, -3424, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2296, 36156, 12448, 93488, -3424, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2297, 36156, 12480, 93488, -3424, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2298, 36156, 11519, 94361, -3424, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2299, 36156, 11551, 94361, -3424, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2300, 36156, 10436, 96588, -3424, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2301, 36156, 10530, 96589, -3424, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2302, 36156, 11583, 95609, -3424, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2303, 36156, 11487, 95609, -3424, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2304, 36156, 10468, 96588, -3424, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2305, 36156, 11551, 95609, -3424, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2306, 36156, 10499, 96589, -3424, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2307, 36157, 12206, 93591, -3248, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2308, 36157, 13170, 93936, -3072, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2309, 36157, 12841, 93590, -3248, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2310, 36157, 12174, 93591, -3248, 57674, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2311, 36157, 8896, 94448, -3048, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2312, 36157, 13296, 93472, -3048, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2313, 36157, 13264, 93472, -3048, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2314, 36157, 11568, 93472, -3048, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2315, 36157, 10720, 93472, -3048, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2316, 36157, 9024, 93984, -3048, 40960, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2317, 36157, 8896, 95424, -3048, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2318, 36157, 8896, 95456, -3048, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2319, 36157, 9056, 93968, -3048, 40960, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2320, 36157, 14080, 95600, -3048, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2321, 36157, 14080, 94624, -3048, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2322, 36157, 14080, 94656, -3048, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2323, 36157, 13952, 94000, -3048, 57344, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2324, 36157, 13920, 93968, -3048, 57344, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2325, 36157, 12304, 94096, -3424, 54044, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2326, 36157, 12267, 94077, -3424, 54044, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2327, 36157, 10622, 95920, -3424, 20480, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2328, 36157, 10730, 95971, -3424, 20480, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2329, 36157, 12112, 93744, -2976, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2330, 36157, 12112, 93680, -2976, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2331, 36157, 12898, 93676, -2976, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2332, 36157, 12898, 93742, -2976, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2333, 36157, 12930, 93708, -2976, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2334, 36157, 11843, 93930, -3072, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2335, 36157, 12809, 93590, -3248, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2336, 36157, 12343, 94061, -3424, 54044, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2337, 36157, 11536, 93472, -3048, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2338, 36157, 9872, 93472, -3048, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2339, 36157, 12373, 94132, -3424, 54044, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2340, 36157, 12112, 93712, -2976, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2341, 36157, 10752, 93472, -3048, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2342, 36157, 9920, 93472, -3048, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2343, 36157, 12898, 93708, -2976, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2344, 36157, 12080, 93712, -2976, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2345, 36157, 13202, 93936, -3072, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2346, 36157, 12340, 94114, -3424, 54044, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2347, 36157, 11811, 93930, -3072, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2348, 36157, 9680, 96608, -3048, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2349, 36157, 11584, 96608, -3048, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2350, 36157, 10912, 96368, -2976, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2351, 36157, 10912, 96336, -2976, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2352, 36157, 10912, 96400, -2976, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2353, 36157, 10944, 96368, -2976, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2354, 36157, 10112, 96400, -2976, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2355, 36157, 10112, 96334, -2976, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2356, 36157, 10805, 96480, -3248, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2357, 36157, 11616, 96608, -3048, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2358, 36157, 10200, 96480, -3248, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2359, 36157, 10168, 96480, -3248, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2360, 36157, 9712, 96608, -3048, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2361, 36157, 12448, 96608, -3024, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2362, 36157, 10837, 96480, -3248, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2363, 36157, 10112, 96368, -2960, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2364, 36157, 10656, 95936, -3424, 20480, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2365, 36157, 10693, 95951, -3424, 20480, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2366, 36157, 10080, 96368, -2976, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2367, 36157, 11165, 96144, -3072, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2368, 36157, 9806, 96139, -3072, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2369, 36157, 9838, 96139, -3072, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2370, 36157, 11197, 96144, -3072, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2371, 36157, 10640, 95987, -3424, 20480, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2372, 36157, 14080, 95632, -3048, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2373, 36157, 12400, 96608, -3048, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2374, 36161, 9529, 94927, -3392, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2375, 36161, 9529, 95023, -3392, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2376, 36161, 9529, 94991, -3392, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2377, 36161, 9529, 95055, -3392, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2378, 36161, 9529, 94959, -3392, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2379, 36162, 9561, 95055, -3392, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2380, 36162, 9561, 95023, -3392, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2381, 36162, 9561, 94991, -3392, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2382, 36162, 9561, 94959, -3392, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2383, 36162, 9561, 94927, -3392, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2384, 36164, 12258, 93598, -3424, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2385, 36164, 12414, 93598, -3424, 59404, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2386, 36164, 12750, 93598, -3424, 32767, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2387, 36164, 12594, 93598, -3424, 38902, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2388, 36164, 9838, 96107, -3072, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2389, 36164, 11811, 93962, -3072, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2390, 36164, 12809, 93558, -3248, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2391, 36164, 13120, 96085, -3392, 27864, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2392, 36164, 12174, 93559, -3248, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2393, 36164, 12827, 95980, -3392, 16232, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2394, 36164, 13202, 93968, -3072, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2395, 36164, 11197, 96112, -3072, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2396, 36164, 12704, 95984, -3392, 10308, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2397, 36164, 12992, 96260, -3392, 35780, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2398, 36164, 10200, 96512, -3248, 59067, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2399, 36164, 10242, 96482, -3424, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2400, 36164, 10398, 96482, -3424, 6132, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2401, 36164, 10446, 96514, -3424, 17151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2402, 36164, 10837, 96512, -3248, 35725, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2403, 36164, 10492, 96609, -3424, 10835, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2404, 36164, 10578, 96482, -3424, 27931, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2405, 36164, 10514, 96514, -3424, 19632, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2406, 36165, 12592, 96096, -3392, 6296, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2407, 36165, 12206, 93559, -3248, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2408, 36165, 11843, 93962, -3072, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2409, 36165, 12841, 93558, -3248, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2410, 36165, 11165, 96112, -3072, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2411, 36165, 13170, 93968, -3072, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2412, 36165, 10805, 96512, -3248, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2413, 36165, 12928, 95968, -3392, 19600, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2414, 36165, 10168, 96512, -3248, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2415, 36165, 9806, 96107, -3072, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2416, 36167, 13119, 94688, -3240, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2417, 36167, 13447, 94764, -3344, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2418, 36167, 13447, 95116, -3344, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2419, 36167, 13216, 95200, -3240, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2420, 36167, 12927, 94758, -3344, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2421, 36167, 13248, 95200, -3240, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2422, 36167, 13151, 94688, -3240, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2423, 36167, 12928, 95112, -3344, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2424, 36167, 12986, 95168, -3344, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2425, 36167, 13380, 95167, -3344, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2426, 36167, 12988, 94714, -3344, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2427, 36167, 13184, 94944, -3344, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2428, 36167, 13388, 94712, -3344, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2429, 36168, 13894, 95136, -3424, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2430, 36168, 9086, 94588, -3424, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2431, 36168, 12330, 94991, -3424, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (115, 2432, 36168, 10675, 95036, -3424, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2433, 36188, 80164, 92755, -2880, 5012, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2434, 36188, 80179, 92726, -2880, 5012, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2435, 36188, 80194, 92696, -2880, 5012, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2436, 36188, 80209, 92667, -2880, 5012, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2437, 36189, 80720, 91728, -2504, 4916, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2438, 36189, 80736, 91696, -2504, 4916, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2439, 36189, 81104, 91008, -2504, 4916, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2440, 36189, 81120, 90976, -2504, 4916, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2441, 36189, 81488, 90272, -2504, 4916, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2442, 36189, 81504, 90240, -2504, 4916, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2443, 36189, 81760, 89488, -2512, 62536, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2444, 36189, 81744, 89456, -2512, 62536, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2445, 36189, 81632, 89008, -2512, 62536, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2446, 36189, 81616, 88976, -2512, 62536, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2447, 36189, 81120, 88576, -2504, 54360, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2448, 36189, 81088, 88560, -2504, 54360, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2449, 36189, 80528, 88256, -2504, 54360, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2450, 36189, 80496, 88240, -2504, 54360, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2451, 36206, 80247, 88389, -2880, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2452, 36189, 80144, 92288, -2440, 21316, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2453, 36189, 80157, 92261, -2440, 21316, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2454, 36189, 80169, 92301, -2440, 21316, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2455, 36188, 79814, 91293, -2880, 5012, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2456, 36188, 79798, 91325, -2880, 5012, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2457, 36200, 80041, 91903, -2520, 5204, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2458, 36201, 80027, 91928, -2528, 5204, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2459, 36189, 80063, 91914, -2528, 5204, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2460, 36189, 80049, 91939, -2528, 5204, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2461, 36189, 80229, 92406, -2704, 37100, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2462, 36188, 79766, 91389, -2880, 5012, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2463, 36188, 79782, 91357, -2880, 5012, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2464, 36189, 79680, 93696, -2504, 4916, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2465, 36189, 79408, 87840, -2512, 46132, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2466, 36189, 79440, 87824, -2512, 46132, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2467, 36189, 80218, 92432, -2704, 37100, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2468, 36201, 80241, 92443, -2704, 37100, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2469, 36200, 80253, 92417, -2704, 37100, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2470, 36200, 80002, 92905, -2696, 37568, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2471, 36189, 79980, 92894, -2704, 37568, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2472, 36201, 79989, 92931, -2704, 37568, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2473, 36189, 79966, 92920, -2704, 37568, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2474, 36189, 79664, 93712, -2504, 4916, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2475, 36189, 79904, 87936, -2504, 54360, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2476, 36189, 78928, 87968, -2512, 46132, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2477, 36189, 78960, 87968, -2512, 46132, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2478, 36189, 79936, 87952, -2504, 54360, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2479, 36189, 78848, 94192, -2512, 13736, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2480, 36189, 79648, 92192, -2880, 8328, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2481, 36206, 78912, 91925, -2880, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2482, 36200, 79914, 89779, -2704, 22244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2483, 36189, 79696, 92160, -2880, 8328, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2484, 36189, 79296, 94064, -2512, 13532, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2485, 36189, 79328, 94048, -2512, 13532, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2486, 36189, 79600, 92224, -2880, 8328, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2487, 36189, 79845, 92922, -2440, 54004, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2488, 36201, 79901, 89800, -2704, 22244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2489, 36189, 79889, 89764, -2704, 22244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2490, 36189, 79875, 89784, -2704, 22244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2491, 36200, 80877, 90674, -2856, 50196, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2492, 36200, 80651, 90653, -2856, 60240, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2493, 36201, 80655, 90503, -2856, 64396, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2494, 36200, 80744, 90436, -2856, 3800, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2495, 36200, 80752, 90336, -2856, 6872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2496, 36201, 81068, 90402, -2856, 26684, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2497, 36189, 79794, 92896, -2440, 54004, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2498, 36189, 79649, 92243, -2880, 8328, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2499, 36206, 79252, 90176, -2880, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2500, 36189, 78870, 92275, -2440, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2501, 36189, 79820, 92909, -2440, 54004, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2502, 36189, 79481, 93035, -2528, 54744, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2503, 36189, 79514, 89875, -2440, 35876, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2504, 36189, 79549, 89870, -2440, 35876, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2505, 36189, 79552, 92256, -2880, 8328, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2506, 36189, 79469, 93057, -2528, 54744, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2507, 36189, 79806, 92935, -2440, 54004, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2508, 36189, 79504, 89904, -2440, 35876, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2509, 36189, 79538, 89899, -2440, 35876, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2510, 36201, 79457, 93021, -2528, 54744, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2511, 36200, 79359, 89915, -2528, 5508, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2512, 36189, 78893, 92259, -2440, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2513, 36189, 78870, 92312, -2440, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2514, 36200, 79444, 93042, -2528, 54744, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2515, 36203, 79721, 88646, -2808, 53247, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2516, 36203, 79502, 88494, -2704, 20480, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2517, 36189, 79396, 89902, -2528, 5508, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2518, 36205, 80801, 89028, -2848, 21984, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2519, 36189, 79380, 89927, -2528, 5508, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2520, 36203, 79532, 88508, -2704, 20480, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2521, 36201, 79374, 89890, -2528, 5508, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2522, 36203, 79584, 89030, -2808, 5500, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2523, 36189, 80118, 92274, -2440, 21316, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2524, 36203, 79125, 88784, -2808, 38143, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2525, 36203, 79151, 88858, -2808, 20480, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2526, 36195, 79008, 93664, -2824, 54296, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2527, 36186, 79351, 91057, -1960, 5012, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2528, 36186, 79338, 91082, -1960, 5012, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2529, 36187, 79613, 90998, -1992, 5012, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2530, 36203, 79366, 88459, -2808, 53247, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2531, 36195, 78992, 93200, -2856, 54256, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2532, 36185, 79297, 91077, -1960, 5012, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2533, 36186, 79124, 91037, -1960, 37660, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2534, 36187, 79550, 91110, -1992, 5012, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2535, 36203, 79439, 88751, -2808, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2536, 36203, 79741, 88735, -2800, 5500, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2537, 36203, 79507, 89047, -2808, 20480, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2538, 36203, 79290, 88472, -2808, 38143, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2539, 36187, 79597, 91025, -1992, 5012, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2540, 36187, 79582, 91053, -1992, 5012, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2541, 36187, 79566, 91082, -1992, 5012, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2542, 36186, 79150, 90986, -1960, 37660, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2543, 36194, 79585, 93376, -2880, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2544, 36203, 79374, 89007, -2704, 53247, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2545, 36186, 79325, 91107, -1960, 5012, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2546, 36186, 79137, 91011, -1960, 37660, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2547, 36195, 78912, 93312, -2728, 28220, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2548, 36187, 79519, 91168, -1952, 5012, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2549, 36203, 79345, 88993, -2704, 53247, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2550, 36187, 79629, 90970, -1992, 5012, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2551, 36187, 79535, 91139, -1992, 5012, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2552, 36187, 79080, 90569, -2168, 22200, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2553, 36187, 79029, 90537, -2168, 22200, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2554, 36187, 79312, 91744, -2512, 20576, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2555, 36187, 79342, 91757, -2512, 20576, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2556, 36186, 79311, 91132, -1960, 5012, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2557, 36187, 79280, 91729, -2512, 20576, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2558, 36189, 78894, 92293, -2440, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2559, 36186, 79164, 90960, -1960, 37660, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2560, 36192, 79137, 92935, -2880, 54492, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2561, 36190, 78915, 93374, -2728, 13024, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2562, 36193, 79248, 93680, -2824, 38128, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2563, 36191, 78978, 93899, -2880, 13396, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2564, 36187, 79055, 90553, -2168, 22200, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2565, 36191, 79279, 93337, -2880, 62180, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2566, 36189, 78099, 89743, -2440, 54000, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2567, 36189, 78285, 89106, -2704, 5816, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2568, 36200, 78249, 89119, -2704, 5816, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2569, 36189, 78270, 89131, -2704, 5816, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2570, 36201, 78264, 89095, -2704, 5816, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2571, 36189, 78764, 88989, -2528, 37492, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2572, 36189, 78778, 88963, -2528, 37492, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2573, 36200, 78800, 88975, -2520, 37492, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2574, 36201, 78786, 89001, -2528, 37492, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2575, 36189, 78020, 89602, -2704, 5388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2576, 36189, 78034, 89577, -2704, 5388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2577, 36201, 77999, 89590, -2704, 5388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2578, 36200, 78012, 89566, -2704, 5388, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2579, 36189, 78203, 90067, -2528, 37536, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2580, 36189, 78191, 90092, -2528, 37536, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2581, 36201, 78225, 90077, -2528, 37536, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2582, 36200, 78212, 90103, -2528, 37536, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2583, 36189, 78438, 89097, -2440, 21948, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2584, 36189, 78449, 89135, -2440, 21948, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2585, 36189, 78400, 89106, -2440, 21948, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2586, 36189, 78424, 89120, -2424, 21948, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2587, 36189, 78085, 89705, -2440, 54000, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2588, 36189, 78138, 89731, -2440, 54000, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2589, 36189, 78111, 89718, -2440, 54000, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2590, 36189, 78768, 89840, -2880, 42084, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2591, 36189, 78576, 89936, -2880, 42084, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2592, 36189, 78704, 89872, -2880, 42084, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2593, 36189, 78640, 89840, -2880, 42084, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2594, 36189, 78640, 89904, -2880, 42084, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2595, 36189, 78544, 88432, -2504, 38660, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2596, 36189, 78560, 88400, -2504, 38660, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2597, 36188, 78049, 89354, -2880, 37920, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2598, 36188, 78064, 89325, -2880, 37920, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2599, 36188, 78079, 89296, -2880, 37920, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2600, 36188, 78095, 89267, -2880, 37920, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2601, 36187, 78692, 91346, -2360, 5536, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2602, 36187, 78708, 91320, -2360, 5536, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2603, 36187, 78724, 91294, -2360, 5536, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2604, 36189, 78634, 92136, -2704, 21324, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2605, 36189, 78609, 92123, -2704, 21324, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2606, 36201, 78645, 92115, -2704, 21324, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2607, 36200, 78620, 92101, -2704, 21324, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2608, 36188, 78664, 90798, -2880, 37660, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2609, 36188, 78680, 90767, -2880, 37660, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2610, 36188, 78696, 90737, -2880, 37660, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2611, 36188, 78711, 90707, -2880, 37660, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2612, 36191, 78418, 93601, -2880, 29984, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2613, 36191, 78715, 93037, -2880, 46336, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2614, 36193, 78448, 93248, -2760, 5940, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2615, 36193, 78624, 93872, -2792, 54360, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2616, 36194, 78721, 92784, -2880, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2617, 36194, 78145, 93228, -2880, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2618, 36194, 78721, 92858, -2880, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2619, 36194, 78817, 92932, -2880, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2620, 36194, 78625, 92858, -2880, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2621, 36195, 78656, 93648, -2792, 3972, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2622, 36189, 78757, 92614, -2528, 37756, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2623, 36201, 78780, 92626, -2528, 37756, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2624, 36189, 78743, 92640, -2528, 37756, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2625, 36200, 78766, 92652, -2528, 37756, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2626, 36206, 78023, 93737, -2880, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2627, 36189, 78816, 94192, -2512, 13736, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2628, 36189, 78208, 94016, -2504, 22340, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2629, 36189, 78176, 94000, -2504, 22340, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2630, 36198, 77399, 91689, -2856, 36863, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2631, 36198, 77383, 91721, -2856, 36863, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2632, 36198, 77367, 91753, -2856, 36863, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2633, 36198, 77351, 91785, -2856, 36863, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2634, 36198, 77335, 91817, -2856, 36863, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2635, 36197, 77351, 91673, -2856, 36863, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2636, 36197, 77335, 91705, -2856, 36863, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2637, 36197, 77319, 91737, -2856, 36863, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2638, 36197, 77303, 91769, -2856, 36863, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2639, 36197, 77287, 91801, -2856, 36863, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2640, 36189, 76752, 91776, -2504, 38340, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2641, 36189, 76768, 91744, -2504, 38340, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2642, 36189, 77136, 91056, -2504, 38340, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2643, 36189, 77152, 91024, -2504, 38340, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2644, 36189, 77520, 90320, -2504, 38660, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2645, 36189, 77536, 90304, -2504, 38660, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2646, 36189, 77600, 93696, -2504, 22340, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2647, 36189, 77568, 93680, -2504, 22340, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2648, 36189, 77024, 93392, -2504, 22340, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2649, 36189, 76992, 93376, -2504, 22340, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2650, 36189, 76656, 93040, -2512, 29668, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2651, 36189, 76640, 93008, -2512, 29668, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2652, 36189, 76496, 92560, -2512, 29668, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (116, 2653, 36189, 76480, 92528, -2512, 29668, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2654, 36223, 111366, -15077, -72, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2655, 36224, 111324, -15042, -72, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2656, 36224, 111352, -15041, -72, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2657, 36224, 111380, -15041, -72, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2658, 36224, 111416, -15252, -72, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2659, 36225, 111397, -14848, -96, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2660, 36225, 111461, -14848, -96, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2661, 36225, 111429, -14848, -96, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2662, 36225, 111493, -14848, -96, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2663, 36225, 111525, -14848, -96, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2664, 36225, 111557, -14848, -96, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2665, 36225, 111589, -14848, -96, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2666, 36225, 111621, -14848, -96, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2667, 36225, 110772, -14761, -624, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2668, 36225, 110772, -14793, -624, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2669, 36225, 110772, -14729, -624, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2670, 36225, 111720, -15576, -280, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2671, 36225, 111720, -15512, -280, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2672, 36225, 110912, -15488, -432, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2673, 36225, 110848, -15488, -472, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2674, 36225, 110880, -15488, -472, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2675, 36226, 110299, -13524, -992, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2676, 36226, 110363, -13524, -992, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2677, 36226, 110395, -13524, -992, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2678, 36226, 111319, -15773, -992, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2679, 36226, 111320, -14526, -992, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2680, 36226, 111351, -15773, -992, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2681, 36226, 111352, -14526, -992, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2682, 36226, 111383, -15773, -992, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2683, 36226, 111384, -14526, -992, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2684, 36226, 111415, -15773, -992, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2685, 36226, 111416, -14526, -992, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2686, 36227, 108736, -16864, -616, 41508, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2687, 36227, 108752, -16880, -616, 41508, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2688, 36227, 109552, -17008, -616, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2689, 36227, 109584, -17008, -616, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2690, 36227, 109727, -14847, -640, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2691, 36227, 109759, -14847, -640, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2692, 36227, 110000, -13792, -552, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2693, 36227, 110000, -13760, -552, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2694, 36227, 110100, -14904, -552, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2695, 36227, 110107, -15194, -816, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2696, 36227, 110107, -15164, -816, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2697, 36227, 110116, -14872, -552, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2698, 36227, 110148, -14904, -552, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2699, 36227, 110368, -17008, -616, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2700, 36227, 110368, -14224, -992, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2701, 36227, 110400, -17008, -616, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2702, 36227, 110432, -14177, -992, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2703, 36227, 110705, -13766, -552, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2704, 36227, 111200, -17008, -616, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2705, 36227, 111232, -17008, -616, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2706, 36227, 111504, -13520, -616, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2707, 36227, 111715, -16527, -640, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2708, 36227, 111741, -16527, -640, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2709, 36227, 111968, -16768, -552, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2710, 36227, 112000, -16768, -552, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2711, 36227, 112070, -16895, -816, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2712, 36227, 112102, -16895, -816, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2713, 36227, 112112, -16080, -992, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2714, 36227, 112160, -16080, -992, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2715, 36227, 112192, -16144, -992, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2716, 36227, 112208, -16080, -992, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2717, 36227, 112256, -16080, -992, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2718, 36227, 112288, -13520, -616, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2719, 36227, 112320, -13520, -616, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2720, 36227, 112421, -15550, -640, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2721, 36227, 112449, -15550, -640, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2722, 36227, 112496, -15456, -552, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2723, 36227, 112510, -15432, -552, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2724, 36227, 112528, -15456, -552, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2725, 36227, 112542, -15432, -552, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2726, 36227, 112597, -16895, -816, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2727, 36227, 112629, -16895, -816, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2728, 36227, 112691, -16775, -552, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2729, 36227, 112691, -16807, -552, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2730, 36227, 112691, -16743, -552, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2731, 36227, 112723, -16775, -552, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2732, 36227, 112781, -15187, -816, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2733, 36227, 112813, -15187, -816, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2734, 36227, 112960, -16532, -640, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2735, 36227, 112988, -16533, -640, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2736, 36227, 113104, -13536, -616, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2737, 36227, 113344, -17008, -616, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2738, 36227, 113376, -17008, -616, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2739, 36227, 113936, -16880, -616, 56016, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2740, 36227, 113968, -16848, -616, 56016, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2741, 36227, 114288, -14016, -616, 8876, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2742, 36227, 114288, -16512, -616, 56016, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2743, 36227, 114320, -16480, -616, 56016, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2744, 36227, 114320, -14032, -616, 8876, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2745, 36227, 114432, -15344, -616, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2746, 36227, 114448, -15376, -616, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2747, 36227, 114448, -14688, -616, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2748, 36227, 114448, -14656, -616, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2749, 36228, 109146, -14351, -832, 24928, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2750, 36229, 109366, -14677, -992, 57636, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2751, 36229, 108734, -14683, -992, 40688, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2752, 36230, 109641, -14345, -992, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2753, 36231, 108608, -14352, -896, 1888, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2754, 36231, 109056, -14800, -864, 19140, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2755, 36232, 108690, -14981, -992, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2756, 36232, 109586, -14831, -992, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2757, 36232, 109522, -15056, -992, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2758, 36232, 109522, -15056, -992, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2759, 36232, 109266, -15056, -992, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2760, 36232, 109394, -15056, -992, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2761, 36233, 108816, -14448, -896, 15956, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2762, 36233, 109216, -14368, -832, 40824, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2763, 36235, 109808, -16560, -968, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2764, 36235, 109840, -16560, -968, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2765, 36235, 109872, -16560, -968, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2766, 36235, 109904, -16560, -968, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2767, 36235, 109936, -16560, -968, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2768, 36236, 109808, -16528, -968, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2769, 36236, 109936, -16528, -968, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2770, 36236, 109840, -16528, -968, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2771, 36236, 109872, -16528, -968, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2772, 36236, 109904, -16528, -968, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2773, 36238, 109727, -14812, -624, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2774, 36238, 110144, -15194, -816, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2775, 36238, 111714, -16502, -640, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2776, 36238, 112102, -16927, -816, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2777, 36238, 112302, -16914, -992, 51212, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2778, 36238, 112302, -16914, -992, 49999, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2779, 36238, 112302, -16914, -992, 49999, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2780, 36238, 112302, -16914, -992, 52710, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2781, 36238, 112302, -16914, -992, 55980, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2782, 36238, 112421, -15574, -640, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2783, 36238, 112597, -16927, -816, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2784, 36238, 112813, -15155, -816, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2785, 36238, 112987, -16508, -640, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2786, 36239, 109759, -14812, -640, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2787, 36239, 110144, -15164, -816, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2788, 36239, 111742, -16502, -640, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2789, 36239, 112070, -16927, -816, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2790, 36239, 112449, -15574, -640, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2791, 36239, 112629, -16927, -816, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2792, 36239, 112781, -15155, -816, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2793, 36239, 112959, -16508, -640, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2794, 36241, 113229, -15995, -808, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2795, 36241, 113229, -16027, -808, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2796, 36241, 113257, -15839, -920, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2797, 36241, 113260, -16272, -920, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2798, 36241, 113311, -16317, -920, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2799, 36241, 113663, -16316, -920, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2800, 36241, 113663, -15798, -920, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2801, 36241, 113713, -16273, -912, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2802, 36241, 113713, -15840, -912, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2803, 36241, 113746, -16121, -808, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2804, 36241, 113746, -16089, -808, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2805, 36243, 113929, -14705, -960, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2806, 36244, 108546, -16253, -992, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2807, 36244, 110422, -15180, -992, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2808, 36244, 112241, -15030, -992, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (117, 2809, 36244, 114254, -15503, -992, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2810, 36279, 123001, 94183, -2056, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2811, 36279, 123056, 94144, -2056, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2812, 36279, 123407, 94143, -2056, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2813, 36279, 123455, 94184, -2056, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2814, 36265, 124567, 93601, -1960, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2815, 36265, 124535, 93601, -1960, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2816, 36277, 124567, 93569, -1960, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2817, 36276, 124535, 93569, -1960, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2818, 36265, 124896, 93968, -1784, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2819, 36276, 124896, 94000, -1784, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2820, 36265, 123916, 93605, -1952, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2821, 36265, 123884, 93605, -1952, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2822, 36277, 123916, 93573, -1952, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2823, 36276, 123884, 93573, -1952, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2824, 36265, 123558, 93967, -1776, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2825, 36265, 123526, 93967, -1776, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2826, 36277, 123558, 93999, -1776, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2827, 36276, 123526, 93999, -1776, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2828, 36265, 124658, 93731, -1688, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2829, 36265, 124626, 93763, -1688, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2830, 36265, 124626, 93699, -1688, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2831, 36265, 124626, 93731, -1688, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2832, 36265, 123791, 93730, -1688, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2833, 36265, 123823, 93698, -1688, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2834, 36265, 123823, 93762, -1688, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2835, 36265, 123823, 93730, -1688, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2836, 36265, 124378, 94188, -2144, 45055, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2837, 36265, 124420, 94170, -2144, 45055, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2838, 36265, 124339, 94157, -2144, 45055, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2839, 36265, 123528, 93442, -1760, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2840, 36265, 123493, 93444, -1760, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2841, 36264, 124165, 93471, -2144, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2842, 36264, 124197, 93471, -2144, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2843, 36264, 124229, 93471, -2144, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2844, 36264, 124261, 93471, -2144, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2845, 36270, 126803, 93911, -2144, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2846, 36265, 124928, 93968, -1784, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2847, 36277, 124928, 94000, -1768, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2848, 36265, 125072, 93440, -1760, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2849, 36265, 125104, 93440, -1760, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2850, 36265, 126384, 93456, -1760, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2851, 36265, 126416, 93456, -1760, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2852, 36267, 127184, 93923, -2144, 41572, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2853, 36267, 127819, 93930, -2144, 58004, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2854, 36269, 127504, 93792, -2080, 16788, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2855, 36270, 127091, 93838, -2144, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2856, 36271, 127584, 94000, -2080, 31244, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2857, 36263, 124726, 94814, -1616, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2858, 36263, 124758, 94814, -1616, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2859, 36263, 124790, 94814, -1616, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2860, 36263, 124655, 95570, -1768, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2861, 36263, 124655, 95506, -1768, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2862, 36263, 124655, 95538, -1768, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2863, 36279, 123001, 94615, -2056, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2864, 36279, 123457, 94614, -2048, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2865, 36279, 123405, 94657, -2056, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2866, 36279, 123053, 94657, -2056, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2867, 36279, 123487, 94371, -1952, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2868, 36279, 123487, 94339, -1952, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2869, 36279, 122980, 94443, -1952, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2870, 36279, 122980, 94472, -1952, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2871, 36279, 123232, 94416, -2056, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2872, 36265, 123858, 95189, -1960, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2873, 36265, 123826, 95189, -1960, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2874, 36277, 123858, 95221, -1960, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2875, 36276, 123826, 95221, -1960, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2876, 36265, 124187, 94821, -1784, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2877, 36265, 124219, 94821, -1784, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2878, 36277, 124187, 94792, -1784, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2879, 36276, 124219, 94792, -1784, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2880, 36265, 124079, 94943, -1688, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2881, 36265, 124123, 94943, -1688, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2882, 36265, 124101, 94912, -1688, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2883, 36265, 124144, 94912, -1688, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2884, 36282, 124362, 95188, -2144, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2885, 36265, 124293, 94226, -2144, 45055, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2886, 36265, 124336, 94208, -2144, 45055, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2887, 36264, 125262, 94509, -2144, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2888, 36268, 126864, 94248, -2144, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2889, 36262, 125263, 95047, -1216, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2890, 36263, 125600, 94720, -1424, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2891, 36263, 125600, 94784, -1424, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2892, 36263, 125600, 94752, -1424, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2893, 36263, 125501, 95453, -1248, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2894, 36263, 125469, 95453, -1248, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2895, 36263, 125437, 95453, -1248, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2896, 36263, 125341, 95453, -1248, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2897, 36263, 125405, 95453, -1248, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2898, 36263, 125373, 95453, -1248, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2899, 36263, 125308, 95453, -1248, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2900, 36263, 125276, 95453, -1248, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2901, 36262, 125199, 95047, -1216, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2902, 36262, 125231, 95047, -1216, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2903, 36262, 125295, 95047, -1216, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2904, 36262, 125293, 95249, -1216, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2905, 36262, 125261, 95249, -1216, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2906, 36262, 125229, 95249, -1216, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2907, 36262, 125197, 95249, -1192, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2908, 36261, 125246, 95204, -1216, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2909, 36270, 126875, 94495, -2144, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2910, 36270, 126947, 94860, -2144, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2911, 36265, 126614, 95022, -1960, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2912, 36265, 126646, 95022, -1960, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2913, 36277, 126614, 94990, -1960, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2914, 36276, 126646, 94990, -1960, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2915, 36265, 126285, 95385, -1784, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2916, 36265, 126253, 95385, -1784, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2917, 36277, 126285, 95417, -1784, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2918, 36276, 126253, 95417, -1784, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2919, 36265, 126368, 95272, -1688, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2920, 36265, 126336, 95272, -1688, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2921, 36265, 126352, 95296, -1688, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2922, 36265, 126320, 95296, -1688, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2923, 36282, 126092, 94780, -2144, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2924, 36265, 125991, 96178, -2144, 12288, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2925, 36265, 125955, 96192, -2144, 12288, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2926, 36265, 125920, 96208, -2144, 12288, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2927, 36265, 125883, 96221, -2144, 12288, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2928, 36265, 125957, 96243, -2144, 12288, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2929, 36264, 125200, 95760, -2144, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2930, 36264, 125232, 95760, -2144, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2931, 36264, 125264, 95760, -2144, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2932, 36264, 125296, 95760, -2144, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2933, 36264, 125198, 94509, -2144, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2934, 36264, 125230, 94509, -2144, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2935, 36264, 125294, 94509, -2144, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2936, 36267, 127181, 94569, -2144, 24824, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2937, 36267, 127818, 94572, -2144, 8220, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2938, 36269, 127488, 94704, -2016, 49764, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2939, 36269, 127952, 94256, -2048, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2940, 36266, 127398, 94229, -1984, 57488, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2941, 36270, 127955, 94933, -2144, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2942, 36270, 127955, 94641, -2144, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2943, 36271, 127328, 94256, -1984, 10416, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2944, 36271, 127744, 94336, -2048, 47164, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2945, 36271, 127200, 94240, -2112, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2946, 36282, 128035, 94889, -2144, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2947, 36265, 128272, 94336, -1760, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2948, 36265, 128272, 94384, -1760, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2949, 36265, 128272, 95008, -1760, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2950, 36265, 128272, 95040, -1760, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2951, 36265, 128288, 96000, -1760, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2952, 36265, 128288, 96048, -1744, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2953, 36264, 126145, 96921, -2144, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2954, 36265, 125861, 96825, -1960, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2955, 36265, 125893, 96825, -1960, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2956, 36277, 125861, 96857, -1960, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2957, 36276, 125893, 96857, -1960, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2958, 36265, 125530, 96463, -1784, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2959, 36265, 125498, 96463, -1784, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2960, 36277, 125530, 96432, -1784, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2961, 36276, 125498, 96432, -1784, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2962, 36265, 126544, 96824, -1952, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2963, 36265, 126516, 96825, -1952, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2964, 36277, 126544, 96856, -1952, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2965, 36276, 126516, 96857, -1952, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2966, 36265, 126880, 96466, -1776, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2967, 36265, 126912, 96466, -1776, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2968, 36277, 126880, 96434, -1776, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2969, 36276, 126912, 96434, -1776, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2970, 36265, 125759, 96697, -1688, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2971, 36265, 125791, 96665, -1688, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2972, 36265, 125791, 96729, -1688, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2973, 36265, 126640, 96704, -1688, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2974, 36265, 125791, 96697, -1688, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2975, 36265, 126608, 96736, -1688, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2976, 36265, 126608, 96672, -1688, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2977, 36265, 126608, 96704, -1688, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2978, 36265, 125344, 96944, -1760, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2979, 36265, 125312, 96944, -1760, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2980, 36264, 126177, 96921, -2144, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2981, 36264, 126241, 96921, -2144, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2982, 36264, 126209, 96921, -2144, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2983, 36281, 127584, 96288, -2096, 40892, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2984, 36265, 128112, 96496, -1744, 7848, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2985, 36265, 128080, 96512, -1760, 7848, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2986, 36265, 127584, 96944, -1744, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2987, 36265, 127552, 96944, -1760, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2988, 36265, 127088, 96944, -1744, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2989, 36265, 127056, 96944, -1760, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2990, 36265, 122831, 93439, -1736, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2991, 36265, 122864, 93440, -1760, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2992, 36265, 122336, 93904, -1760, 40364, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2993, 36265, 122368, 93872, -1760, 40364, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2994, 36274, 122768, 95696, -2112, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2995, 36274, 122768, 95760, -2112, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2996, 36274, 122768, 95728, -2112, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2997, 36274, 122768, 95792, -2112, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2998, 36274, 122768, 95824, -2112, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 2999, 36273, 122735, 95727, -2112, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 3000, 36273, 122736, 95824, -2112, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 3001, 36273, 122736, 95696, -2112, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 3002, 36273, 122736, 95792, -2112, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 3003, 36273, 122736, 95760, -2112, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 3004, 36282, 122416, 94913, -2144, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 3005, 36265, 122128, 96048, -1760, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 3006, 36265, 122144, 96016, -1760, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 3007, 36265, 122144, 95040, -1760, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 3008, 36265, 122144, 95008, -1760, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 3009, 36265, 122144, 94384, -1760, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 3010, 36265, 122144, 94352, -1760, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 3011, 36277, 124128, 96576, -2104, 62952, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 3012, 36276, 124084, 96348, -2104, 5676, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 3013, 36276, 124189, 96308, -2104, 11132, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 3014, 36277, 124253, 96348, -2104, 13384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 3015, 36276, 124351, 96340, -2104, 18220, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 3016, 36276, 124593, 96397, -2104, 26972, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 3017, 36265, 123536, 96944, -1744, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (118, 3018, 36265, 123504, 96944, -1760, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3019, 36302, 73127, 187231, -2584, 16848, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3020, 36302, 72368, 187424, -2200, 23132, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3021, 36302, 72336, 187408, -2200, 23132, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3022, 36310, 71688, 186473, -2552, 37880, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3023, 36302, 72802, 187576, -2400, 55620, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3024, 36302, 72828, 187594, -2400, 55620, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3025, 36310, 72786, 187597, -2400, 55620, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3026, 36309, 72813, 187617, -2400, 55620, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3027, 36302, 72704, 187084, -2224, 22296, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3028, 36302, 72732, 187100, -2224, 22296, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3029, 36309, 72744, 187079, -2224, 22296, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3030, 36310, 72717, 187063, -2224, 22296, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3031, 36302, 73332, 187931, -2400, 55612, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3032, 36302, 73358, 187948, -2400, 55612, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3033, 36310, 73316, 187954, -2400, 55612, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3034, 36309, 73342, 187973, -2400, 55612, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3035, 36302, 72781, 187428, -2136, 5528, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3036, 36302, 72827, 187418, -2136, 5528, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3037, 36302, 72793, 187474, -2136, 5528, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3038, 36302, 72810, 187445, -2136, 5528, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3039, 36302, 73504, 187902, -2136, 38232, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3040, 36302, 73455, 187913, -2136, 38236, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3041, 36302, 73491, 187855, -2136, 38232, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3042, 36302, 73473, 187883, -2136, 38232, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3043, 36302, 73198, 187170, -2584, 16848, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3044, 36302, 73056, 187167, -2584, 16848, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3045, 36302, 73151, 187168, -2584, 16848, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3046, 36302, 73104, 187168, -2584, 16848, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3047, 36302, 73680, 188304, -2200, 23132, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3048, 36302, 73648, 188288, -2200, 23132, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3049, 36301, 72814, 186536, -2584, 22248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3050, 36301, 72782, 186515, -2584, 22248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3051, 36301, 72750, 186494, -2584, 22248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3052, 36301, 72719, 186474, -2584, 22248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3053, 36301, 73042, 187862, -2584, 22248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3054, 36301, 73070, 187881, -2584, 22248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3055, 36301, 73013, 187843, -2584, 22248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3056, 36301, 72985, 187824, -2584, 22248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3057, 36312, 74386, 186682, -2400, 22180, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3058, 36312, 74359, 186665, -2400, 22180, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3059, 36312, 74157, 187142, -2400, 55552, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3060, 36312, 74183, 187161, -2400, 55552, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3061, 36312, 74562, 186834, -2504, 55552, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3062, 36312, 74584, 186906, -2504, 6016, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3063, 36312, 74388, 187201, -2504, 6016, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3064, 36312, 74310, 187212, -2504, 22180, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3065, 36312, 73979, 186992, -2448, 22180, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3066, 36312, 73959, 186913, -2504, 39396, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3067, 36312, 74154, 186624, -2504, 39396, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3068, 36312, 74232, 186613, -2504, 55552, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3069, 36312, 74272, 186912, -2504, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3070, 36302, 73821, 187845, -2224, 22196, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3071, 36302, 73849, 187863, -2224, 22196, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3072, 36310, 73836, 187822, -2224, 22200, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3073, 36309, 73866, 187839, -2224, 22200, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3074, 36313, 75424, 186515, -2584, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3075, 36302, 75664, 186496, -2200, 63880, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3076, 36302, 75424, 187088, -2200, 6752, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3077, 36302, 75408, 187120, -2200, 6752, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3078, 36302, 74896, 187904, -2200, 6752, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3079, 36302, 74880, 187936, -2200, 6752, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3080, 36302, 75664, 186464, -2200, 63880, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3081, 36302, 71552, 186880, -2200, 23132, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3082, 36302, 71520, 186864, -2200, 23132, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3083, 36302, 70864, 186432, -2200, 23132, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3084, 36302, 70832, 186400, -2200, 23132, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3085, 36307, 71534, 184716, -2552, 38592, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3086, 36307, 71514, 184748, -2552, 38592, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3087, 36307, 71492, 184781, -2544, 38592, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3088, 36307, 71470, 184813, -2544, 38592, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3089, 36307, 71447, 184846, -2552, 38592, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3090, 36306, 71393, 184812, -2552, 38592, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3091, 36306, 71479, 184681, -2552, 38592, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3092, 36306, 71458, 184714, -2552, 38592, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3093, 36306, 71416, 184779, -2552, 38592, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3094, 36306, 71437, 184747, -2552, 38592, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3095, 36309, 71671, 186192, -2552, 23024, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3096, 36310, 71520, 186178, -2552, 14836, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3097, 36309, 71389, 186131, -2552, 11224, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3098, 36309, 71397, 186364, -2552, 2152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3099, 36313, 70726, 186034, -2584, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3100, 36302, 70656, 184912, -2200, 38980, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3101, 36302, 70672, 184880, -2200, 38980, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3102, 36300, 72869, 185413, -2056, 22656, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3103, 36300, 72895, 185430, -2056, 22656, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3104, 36300, 72921, 185447, -2056, 22656, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3105, 36300, 73648, 185828, -1864, 38960, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3106, 36300, 73611, 185882, -1864, 38960, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3107, 36300, 73629, 185854, -1864, 38960, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3108, 36300, 72384, 186007, -2208, 38872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3109, 36300, 72423, 185950, -2208, 38872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3110, 36300, 72404, 185978, -2208, 38872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3111, 36300, 73084, 186312, -1688, 22248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3112, 36300, 73169, 186365, -1688, 22248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3113, 36300, 73141, 186348, -1688, 22248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3114, 36300, 73112, 186330, -1688, 22248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3115, 36300, 73054, 186293, -1688, 22248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3116, 36300, 73026, 186275, -1688, 22248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3117, 36300, 72996, 186255, -1688, 22248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3118, 36300, 72968, 186237, -1688, 22248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3119, 36299, 73212, 185926, -1656, 54844, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3120, 36299, 73183, 185908, -1656, 54844, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3121, 36299, 73154, 185891, -1656, 54844, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3122, 36299, 73126, 185873, -1656, 54844, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3123, 36299, 73099, 186100, -1656, 22248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3124, 36299, 73071, 186082, -1656, 22248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3125, 36299, 73043, 186064, -1656, 22248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3126, 36299, 73014, 186046, -1656, 22248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3127, 36298, 73070, 186048, -1656, 22248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3128, 36309, 71781, 186270, -2552, 26852, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3129, 36302, 73297, 184432, -2400, 22448, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3130, 36302, 73272, 184416, -2400, 22448, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3131, 36310, 73311, 184409, -2400, 22448, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3132, 36309, 73286, 184392, -2400, 22448, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3133, 36302, 73401, 184921, -2224, 56004, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3134, 36302, 73375, 184901, -2224, 56004, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3135, 36310, 73386, 184940, -2224, 56004, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3136, 36309, 73361, 184920, -2224, 56004, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3137, 36302, 73307, 184581, -2136, 39088, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3138, 36302, 73298, 184532, -2136, 39088, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3139, 36302, 73258, 184588, -2136, 39088, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3140, 36302, 73278, 184560, -2136, 39088, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3141, 36313, 72244, 185588, -2584, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3142, 36302, 72818, 184751, -2584, 50940, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3143, 36302, 72955, 184775, -2584, 50940, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3144, 36302, 72912, 184768, -2584, 50940, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3145, 36302, 72865, 184759, -2584, 50940, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3146, 36302, 72896, 184720, -2584, 50940, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3147, 36301, 73415, 185440, -2576, 54844, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3148, 36301, 73443, 185459, -2576, 54844, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3149, 36301, 73472, 185478, -2584, 54844, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3150, 36301, 73501, 185497, -2576, 54844, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3151, 36313, 73995, 186114, -2584, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3152, 36302, 73856, 184672, -2200, 55096, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3153, 36302, 73888, 184688, -2200, 55096, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3154, 36302, 74544, 185136, -2200, 55096, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3155, 36302, 74576, 185152, -2200, 55096, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3156, 36302, 75232, 185584, -2200, 55096, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3157, 36302, 75264, 185600, -2184, 55096, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3158, 36302, 71184, 184096, -2200, 38980, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3159, 36302, 71216, 184080, -2200, 38980, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3160, 36302, 71584, 183776, -2200, 47036, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3161, 36302, 71632, 183760, -2200, 47036, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3162, 36302, 72768, 184072, -2400, 22560, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3163, 36302, 72741, 184054, -2400, 22560, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3164, 36310, 72781, 184052, -2400, 22560, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3165, 36309, 72755, 184035, -2400, 22560, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3166, 36302, 72279, 184160, -2224, 55092, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3167, 36302, 72251, 184143, -2224, 55092, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3168, 36310, 72266, 184183, -2224, 55092, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3169, 36309, 72237, 184166, -2224, 55092, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3170, 36302, 72595, 184110, -2136, 5160, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3171, 36302, 72636, 184093, -2136, 5160, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3172, 36302, 72602, 184152, -2136, 5160, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3173, 36302, 72619, 184123, -2136, 5160, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3174, 36302, 72416, 183712, -2200, 55096, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3175, 36302, 72448, 183728, -2200, 55096, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3176, 36301, 73026, 184130, -2584, 54844, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3177, 36301, 73056, 184147, -2584, 54844, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3178, 36301, 73085, 184165, -2584, 54844, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (119, 3179, 36301, 73114, 184183, -2584, 54844, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3180, 36342, 100758, -57376, -616, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3181, 36342, 100624, -57376, -616, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3182, 36342, 100722, -57375, -616, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3183, 36342, 100656, -57376, -616, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3184, 36342, 100688, -57376, -616, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3185, 36334, 101744, -57792, -264, 57224, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3186, 36334, 101712, -57824, -264, 57224, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3187, 36334, 101216, -57952, -264, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3188, 36334, 101264, -57952, -264, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3189, 36332, 101055, -55840, -120, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3190, 36332, 101055, -55808, -120, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3191, 36332, 101055, -55776, -80, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3192, 36332, 100360, -55911, -272, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3193, 36331, 100820, -55303, 272, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3194, 36331, 100820, -55335, 272, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3195, 36331, 100820, -55367, 272, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3196, 36331, 100614, -55302, 272, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3197, 36331, 100614, -55334, 272, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3198, 36331, 100614, -55366, 272, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3199, 36330, 100645, -55318, 272, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3200, 36343, 100758, -57343, -616, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3201, 36343, 100722, -57343, -616, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3202, 36343, 100688, -57344, -616, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3203, 36343, 100656, -57344, -616, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3204, 36343, 100623, -57343, -616, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3205, 36351, 100681, -56214, -640, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3206, 36334, 102224, -55312, -264, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3207, 36334, 102224, -56112, -264, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3208, 36334, 102224, -56144, -264, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3209, 36334, 102224, -56944, -264, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3210, 36334, 102224, -56976, -264, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3211, 36333, 101342, -55309, -640, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3212, 36333, 101342, -55341, -640, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3213, 36333, 101342, -55373, -640, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3214, 36334, 101961, -53952, -200, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3215, 36334, 101992, -54783, -200, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3216, 36332, 101144, -54964, 64, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3217, 36332, 101080, -54964, 64, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3218, 36332, 101112, -54964, 64, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3219, 36332, 100414, -55128, 240, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3220, 36332, 100414, -55064, 240, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3221, 36332, 100414, -55096, 240, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3222, 36332, 100414, -55160, 240, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3223, 36332, 100414, -55192, 240, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3224, 36332, 100414, -55224, 240, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3225, 36332, 100414, -55256, 240, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3226, 36332, 100414, -55288, 240, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3227, 36331, 100820, -55271, 272, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3228, 36331, 100614, -55270, 272, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3229, 36348, 100752, -53680, -568, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3230, 36348, 100919, -53409, -568, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3231, 36348, 100601, -53412, -568, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3232, 36348, 100532, -53467, -568, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3233, 36348, 100532, -53868, -568, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3234, 36348, 100599, -53924, -568, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3235, 36348, 100925, -53926, -568, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3236, 36348, 100991, -53470, -568, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3237, 36348, 100989, -53867, -568, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3238, 36348, 100501, -53638, -464, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3239, 36348, 100501, -53606, -464, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3240, 36348, 101024, -53728, -464, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3241, 36348, 101024, -53696, -464, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3242, 36334, 102113, -54014, -464, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3243, 36334, 102113, -54046, -464, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3244, 36346, 102145, -54014, -464, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3245, 36334, 101772, -53684, -288, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3246, 36345, 102145, -54046, -464, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3247, 36346, 101740, -53684, -288, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3248, 36334, 101772, -53652, -288, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3249, 36345, 101740, -53652, -288, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3250, 36334, 102109, -54684, -464, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3251, 36334, 102110, -54652, -464, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3252, 36346, 102142, -54684, -464, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3253, 36345, 102142, -54652, -464, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3254, 36334, 101767, -55011, -288, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3255, 36334, 101767, -55043, -288, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3256, 36346, 101735, -55011, -288, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3257, 36345, 101735, -55043, -288, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3258, 36334, 101993, -53920, -200, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3259, 36334, 102025, -53952, -200, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3260, 36334, 101993, -53952, -200, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3261, 36334, 102024, -54751, -200, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3262, 36334, 101960, -54751, -200, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3263, 36334, 101992, -54751, -200, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3264, 36334, 101648, -54480, -640, 2796, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3265, 36334, 101664, -54528, -640, 2796, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3266, 36351, 100715, -54512, -640, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3267, 36334, 101613, -54374, -640, 2796, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3268, 36334, 101629, -54424, -640, 2796, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3269, 36334, 101680, -54432, -640, 2796, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3270, 36334, 102224, -53568, -264, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3271, 36334, 102224, -53600, -264, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3272, 36334, 102224, -55280, -264, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3273, 36333, 101342, -55277, -640, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3274, 36333, 102216, -54305, -640, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3275, 36333, 102216, -54337, -640, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3276, 36333, 102216, -54369, -640, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3277, 36333, 102216, -54401, -640, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3278, 36351, 100007, -57770, -648, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3279, 36334, 100240, -57952, -264, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3280, 36334, 100288, -57952, -264, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3281, 36334, 99304, -56751, -200, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3282, 36332, 100296, -55911, -272, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3283, 36332, 100328, -55911, -272, 49152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3284, 36334, 99222, -56686, -464, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3285, 36334, 99222, -56654, -464, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3286, 36346, 99190, -56686, -464, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3287, 36345, 99190, -56654, -464, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3288, 36334, 99563, -57017, -288, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3289, 36334, 99563, -57049, -288, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3290, 36346, 99595, -57017, -288, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3291, 36345, 99595, -57049, -288, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3292, 36334, 99222, -56019, -464, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3293, 36334, 99222, -56051, -464, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3294, 36346, 99190, -56019, -464, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3295, 36345, 99190, -56051, -464, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3296, 36334, 99560, -55688, -288, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3297, 36334, 99560, -55656, -288, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3298, 36346, 99592, -55688, -288, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3299, 36345, 99592, -55656, -288, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3300, 36334, 99336, -56783, -200, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3301, 36334, 99371, -56751, -200, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3302, 36333, 100094, -55305, -640, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3303, 36334, 99336, -56751, -200, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3304, 36334, 99336, -55926, -200, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3305, 36334, 99304, -55958, -200, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3306, 36334, 99368, -55958, -200, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3307, 36334, 99336, -55958, -200, 49151, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3308, 36334, 99776, -56224, -640, 37988, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3309, 36334, 99680, -56080, -640, 37988, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3310, 36334, 99744, -56176, -640, 37988, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3311, 36334, 99712, -56128, -640, 37988, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3312, 36334, 99680, -56176, -640, 37988, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3313, 36334, 99104, -57168, -264, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3314, 36334, 99104, -57136, -264, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3315, 36333, 100094, -55369, -640, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3316, 36333, 100094, -55337, -640, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3317, 36333, 99107, -56322, -640, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3318, 36333, 99107, -56418, -640, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3319, 36333, 99107, -56354, -640, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3320, 36333, 99107, -56386, -640, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3321, 36346, 99440, -53876, -616, 52868, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3322, 36345, 99608, -53789, -616, 44316, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3323, 36346, 99712, -54134, -616, 27680, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3324, 36345, 99676, -53977, -616, 34940, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3325, 36345, 99671, -54236, -616, 24092, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3326, 36345, 99427, -54218, -616, 12368, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3327, 36334, 99104, -55280, -264, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3328, 36334, 99104, -55248, -264, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3329, 36334, 99104, -54448, -264, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3330, 36334, 99104, -54416, -264, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3331, 36333, 100095, -55273, -640, 32768, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3332, 36334, 100064, -52768, -264, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3333, 36334, 100112, -52768, -264, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3334, 36351, 100968, -52973, -640, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3335, 36334, 101056, -52784, -264, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3336, 36334, 101088, -52784, -264, 16384, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3337, 36334, 101712, -52912, -264, 8556, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (120, 3338, 36334, 101728, -52928, -264, 8556, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3339, 36384, 71489, -92828, -1248, 45600, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3340, 36372, 71480, -92852, -1248, 45600, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3341, 36371, 71822, -92889, -1424, 12456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3342, 36371, 71758, -92864, -1431, 12456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3343, 36371, 71854, -92902, -1424, 12456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3344, 36371, 71790, -92876, -1424, 12456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3345, 36372, 71072, -92560, -1048, 12304, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3346, 36372, 71104, -92576, -1048, 12304, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3347, 36372, 71372, -92913, -984, 61424, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3348, 36381, 70249, -94036, -1400, 28812, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3349, 36381, 70263, -94003, -1400, 28812, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3350, 36381, 70276, -93970, -1400, 28812, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3351, 36381, 70290, -93936, -1400, 28812, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3352, 36381, 70302, -93903, -1400, 28812, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3353, 36380, 70266, -93889, -1400, 28812, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3354, 36380, 70210, -94023, -1400, 28812, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3355, 36380, 70252, -93922, -1400, 28812, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3356, 36380, 70225, -93988, -1400, 28812, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3357, 36380, 70238, -93955, -1400, 28812, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3358, 36372, 71507, -92862, -1248, 45600, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3359, 36383, 71516, -92837, -1248, 45600, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3360, 36372, 71035, -93057, -1072, 12600, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3361, 36372, 71006, -93045, -1072, 12600, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3362, 36384, 71025, -93081, -1072, 12600, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3363, 36383, 70996, -93070, -1072, 12600, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3364, 36372, 71331, -92932, -984, 61424, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3365, 36372, 71348, -92973, -984, 61424, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3366, 36372, 71360, -92944, -984, 61424, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3367, 36372, 69888, -93360, -1048, 28820, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3368, 36372, 69904, -93321, -1048, 28820, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3369, 36370, 71771, -94143, -1056, 28812, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3370, 36370, 71757, -94176, -1056, 28812, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3371, 36370, 71743, -94208, -1056, 28812, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3372, 36384, 73623, -94208, -1400, 4688, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3373, 36383, 73556, -94135, -1400, 1184, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3374, 36383, 73717, -94018, -1400, 58180, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3375, 36372, 71765, -93634, -1424, 17048, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3376, 36384, 72112, -93079, -1248, 45104, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3377, 36372, 72101, -93103, -1248, 45104, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3378, 36372, 72297, -93580, -1072, 12248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3379, 36372, 72073, -93091, -1248, 45104, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3380, 36383, 72084, -93067, -1248, 45104, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3381, 36384, 72259, -93593, -1072, 12248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3382, 36372, 72268, -93569, -1072, 12248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3383, 36383, 72286, -93604, -1072, 12248, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3384, 36372, 72138, -93256, -984, 29160, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3385, 36372, 72124, -93215, -984, 29160, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3386, 36372, 72099, -93280, -984, 29160, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3387, 36372, 72112, -93248, -984, 29160, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3388, 36372, 71893, -93625, -1424, 17048, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3389, 36372, 71849, -93629, -1424, 17048, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3390, 36372, 71807, -93632, -1424, 17048, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3391, 36372, 71825, -93586, -1424, 17048, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3392, 36372, 73584, -93600, -1048, 12304, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3393, 36372, 73616, -93616, -1048, 12304, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3394, 36372, 72848, -93296, -1048, 12304, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3395, 36372, 72816, -93280, -1048, 12304, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3396, 36371, 72423, -94197, -1424, 12456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3397, 36371, 72387, -94182, -1424, 12456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3398, 36371, 72353, -94169, -1424, 12456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3399, 36372, 69472, -94736, -1048, 36416, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3400, 36372, 69488, -94768, -1048, 36416, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3401, 36372, 69536, -94224, -1048, 28820, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3402, 36389, 72939, -95085, -1424, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3403, 36371, 72458, -94212, -1424, 12456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3404, 36372, 69520, -94256, -1048, 28820, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3405, 36370, 71555, -94880, -904, 12272, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3406, 36370, 71585, -94892, -904, 12272, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3407, 36370, 71614, -94904, -904, 12272, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3408, 36389, 69741, -94242, -1424, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3409, 36389, 71327, -94354, -1424, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3410, 36372, 70864, -95856, -1048, 44884, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3411, 36372, 71632, -96176, -1048, 44884, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3412, 36372, 71600, -96160, -1048, 44884, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3413, 36372, 70832, -95840, -1048, 44884, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3414, 36372, 70048, -95520, -1048, 44884, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3415, 36372, 70096, -95536, -1048, 44884, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3416, 36383, 72032, -95812, -1072, 45336, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3417, 36370, 72354, -95235, -712, 28812, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3418, 36370, 72330, -95294, -712, 28812, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3419, 36370, 72342, -95265, -712, 28812, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3420, 36370, 72493, -94582, -536, 12456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3421, 36370, 72525, -94594, -536, 12456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3422, 36370, 72461, -94568, -536, 12456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3423, 36370, 72429, -94556, -536, 12456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3424, 36370, 72365, -94532, -536, 12456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3425, 36370, 72397, -94544, -536, 12456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3426, 36370, 72333, -94519, -536, 12456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3427, 36370, 72300, -94506, -536, 12456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3428, 36369, 72177, -94880, -504, 45152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3429, 36369, 72146, -94868, -504, 45152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3430, 36369, 72115, -94856, -504, 45152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3431, 36369, 72254, -94692, -504, 12456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3432, 36369, 72084, -94844, -504, 45152, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3433, 36369, 72221, -94679, -504, 12456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3434, 36369, 72187, -94666, -504, 12456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3435, 36369, 72154, -94653, -504, 12456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3436, 36368, 72195, -94701, -504, 12456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3437, 36386, 73587, -95156, -1352, 12456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3438, 36386, 73496, -95194, -1344, 28812, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3439, 36386, 73373, -95502, -1344, 28812, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3440, 36386, 73415, -95576, -1352, 44872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3441, 36386, 73664, -95440, -1352, 0, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3442, 36386, 73549, -95662, -1240, 12456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3443, 36386, 73517, -95650, -1240, 12456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3444, 36383, 73647, -94295, -1400, 8212, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3445, 36372, 72052, -95858, -1072, 45336, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3446, 36372, 72019, -95844, -1072, 45336, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3447, 36384, 72064, -95826, -1072, 45336, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3448, 36372, 72186, -96154, -984, 61072, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3449, 36372, 72199, -96196, -984, 61072, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3450, 36372, 72225, -96137, -984, 61072, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3451, 36372, 72213, -96166, -984, 61072, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3452, 36372, 72679, -95988, -1424, 48408, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3453, 36372, 72612, -96024, -1424, 48408, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3454, 36372, 72635, -95986, -1424, 48408, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3455, 36372, 72548, -95982, -1424, 48408, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3456, 36372, 72592, -95984, -1424, 48408, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3457, 36371, 71880, -95321, -1424, 44872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3458, 36371, 71912, -95334, -1424, 44872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3459, 36371, 71945, -95348, -1424, 44872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3460, 36371, 71977, -95361, -1424, 44872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3461, 36386, 73801, -95215, -1240, 44872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3462, 36386, 73770, -95720, -1352, 44872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3463, 36386, 73834, -95229, -1240, 44872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3464, 36386, 73855, -95686, -1352, 61404, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3465, 36386, 73979, -95392, -1344, 61404, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3466, 36384, 73987, -94125, -1400, 34024, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3467, 36372, 74384, -96048, -1048, 61356, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3468, 36372, 74368, -96080, -1048, 61356, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3469, 36389, 74346, -95685, -1424, 0, 0, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3470, 36383, 73813, -94313, -1400, 15520, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3471, 36386, 73937, -95304, -1352, 12456, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3472, 36372, 74768, -95152, -1048, 61356, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3473, 36372, 74752, -95184, -1048, 61356, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3474, 36371, 72466, -96510, -1424, 44872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3475, 36371, 72499, -96524, -1424, 44872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3476, 36372, 73184, -96816, -1048, 44884, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3477, 36372, 73984, -96624, -1048, 53408, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3478, 36372, 74016, -96608, -1048, 53408, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3479, 36371, 72530, -96537, -1424, 44872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3480, 36371, 72435, -96496, -1424, 44872, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3481, 36372, 73216, -96832, -1048, 44884, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3482, 36372, 72929, -96499, -984, 28696, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3483, 36372, 72942, -96468, -984, 28696, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3484, 36372, 72975, -96481, -984, 28696, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3485, 36372, 72246, -96313, -1248, 12200, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3486, 36372, 72955, -96437, -984, 28696, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3487, 36372, 73277, -96353, -1072, 44848, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3488, 36372, 72218, -96300, -1248, 12200, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3489, 36372, 73305, -96364, -1072, 44848, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3490, 36384, 73286, -96329, -1072, 44848, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3491, 36383, 73315, -96341, -1072, 44848, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3492, 36372, 72834, -96557, -1248, 12304, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3493, 36372, 72806, -96547, -1248, 12304, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3494, 36384, 72796, -96571, -1248, 12304, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3495, 36383, 72824, -96582, -1248, 12304, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3496, 36384, 72236, -96339, -1248, 12200, 600, 0);
INSERT INTO `fort_siege_guards` VALUES (121, 3497, 36383, 72207, -96327, -1248, 12200, 600, 0);

-- ----------------------------
-- Table structure for fort_spawnlist
-- ----------------------------
DROP TABLE IF EXISTS `fort_spawnlist`;
CREATE TABLE `fort_spawnlist`  (
  `fortId` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `id` smallint(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  `npcId` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `x` mediumint(6) NOT NULL DEFAULT 0,
  `y` mediumint(6) NOT NULL DEFAULT 0,
  `z` mediumint(6) NOT NULL DEFAULT 0,
  `heading` mediumint(6) NOT NULL DEFAULT 0,
  `spawnType` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `castleId` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`fortId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 351 CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fort_spawnlist
-- ----------------------------
INSERT INTO `fort_spawnlist` VALUES (101, 1, 35658, -53273, 156650, -1896, 62000, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (101, 2, 35659, -58672, 154703, -2688, 0, 2, 0);
INSERT INTO `fort_spawnlist` VALUES (101, 3, 35660, -52128, 157752, -2024, 29864, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (101, 4, 35661, -52435, 155188, -1768, 20000, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (101, 5, 35662, -53944, 155433, -2024, 7304, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (101, 6, 35664, -51269, 157584, -2048, 39999, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (101, 7, 35666, -53422, 158079, -2055, 51999, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (101, 8, 35667, -50640, 156000, -2056, 63088, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (101, 9, 35667, -50938, 155810, -2056, 30136, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (101, 10, 35668, -54608, 157216, -2048, 62984, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (101, 11, 35668, -54896, 157008, -2048, 29696, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (101, 12, 35669, -53351, 156814, -2048, 30248, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (101, 13, 35669, -52160, 156176, -2048, 62376, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (101, 14, 35669, -52272, 156208, -2048, 29344, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (101, 15, 35669, -53240, 156729, -2048, 62712, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (101, 16, 36457, -53768, 158042, -2048, 62264, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (101, 17, 36393, -52680, 156525, -2051, 30000, 3, 1);
INSERT INTO `fort_spawnlist` VALUES (102, 18, 35689, -22256, 219808, -3072, 32904, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (102, 19, 35690, -28169, 216864, -3544, 0, 2, 0);
INSERT INTO `fort_spawnlist` VALUES (102, 20, 35691, -22992, 218160, -3208, 0, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (102, 21, 35692, -21328, 218864, -2952, 0, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (102, 22, 35694, -21520, 221504, -3208, 45328, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (102, 23, 35696, -24640, 220960, -3232, 60060, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (102, 24, 35698, -24128, 221488, -3232, 54428, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (102, 25, 35699, -20116, 219724, -3232, 0, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (102, 26, 35699, -20327, 220028, -3232, 33316, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (102, 27, 35700, -25038, 219733, -3232, 0, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (102, 28, 35700, -25246, 220033, -3240, 32608, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (102, 29, 35701, -23248, 219696, -3232, 0, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (102, 30, 35701, -23360, 219904, -3232, 32612, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (102, 31, 35701, -22176, 219907, -3232, 33500, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (102, 32, 35701, -22048, 219696, -3232, 0, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (102, 33, 36458, -23885, 221728, -3232, 32672, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (102, 34, 36394, -22368, 219776, -3080, 0, 3, 1);
INSERT INTO `fort_spawnlist` VALUES (103, 35, 35727, 16885, 188473, -2760, 42916, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (103, 36, 35728, 19408, 189422, -3136, 0, 2, 0);
INSERT INTO `fort_spawnlist` VALUES (103, 37, 35729, 17984, 187536, -2896, 45056, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (103, 38, 35730, 15152, 188128, -2640, 0, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (103, 39, 35731, 16016, 189520, -2888, 0, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (103, 40, 35733, 17008, 186240, -2920, 16384, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (103, 41, 35735, 18304, 188604, -2920, 36864, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (103, 42, 35736, 18048, 189792, -2920, 10324, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (103, 43, 35736, 17632, 189760, -2920, 45348, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (103, 44, 35737, 15282, 186259, -2920, 43140, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (103, 45, 35737, 15728, 186352, -2920, 12288, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (103, 46, 35738, 16784, 188544, -2920, 43884, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (103, 47, 35738, 17060, 188551, -2920, 11484, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (103, 48, 35738, 16080, 187568, -2920, 42884, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (103, 49, 35738, 16368, 187568, -2920, 10432, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (103, 50, 36459, 18397, 188339, -2920, 42948, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (103, 51, 36395, 16772, 188253, -2768, 10232, 3, 2);
INSERT INTO `fort_spawnlist` VALUES (104, 52, 35758, 126080, 123808, -2424, 48972, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (104, 53, 35759, 123383, 121093, -2864, 0, 2, 0);
INSERT INTO `fort_spawnlist` VALUES (104, 54, 35760, 124299, 123614, -2552, 49192, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (104, 55, 35761, 124768, 121856, -2296, 0, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (104, 56, 35763, 124768, 124640, -2552, 54480, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (104, 57, 35765, 127920, 124384, -2584, 36616, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (104, 58, 35767, 128106, 122635, -2588, 33036, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (104, 59, 35768, 126208, 120768, -2584, 16384, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (104, 60, 35768, 125904, 120544, -2584, 49024, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (104, 61, 35769, 125920, 125483, -2584, 49024, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (104, 62, 35769, 126208, 125680, -2584, 16384, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (104, 63, 35770, 126186, 122800, -2584, 16384, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (104, 64, 35770, 125974, 122689, -2584, 49024, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (104, 65, 35770, 125974, 123879, -2584, 49024, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (104, 66, 35770, 126177, 124007, -2584, 16384, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (104, 67, 36460, 128133, 122310, -2584, 48972, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (104, 68, 36396, 126111, 123738, -2432, 16248, 3, 3);
INSERT INTO `fort_spawnlist` VALUES (105, 69, 35796, 72544, 4608, -2888, 56456, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (105, 70, 35797, 75280, 1387, -3268, 0, 2, 0);
INSERT INTO `fort_spawnlist` VALUES (105, 71, 35798, 73788, 5479, -3016, 55136, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (105, 72, 35799, 72400, 2896, -2760, 0, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (105, 73, 35800, 71264, 4144, -3008, 0, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (105, 74, 35802, 74736, 4160, -3040, 34596, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (105, 75, 35804, 73119, 6121, -3047, 46480, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (105, 76, 35805, 71536, 5808, -3040, 56456, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (105, 77, 35805, 71634, 6146, -3040, 23840, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (105, 78, 35806, 74256, 2960, -3040, 23657, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (105, 79, 35806, 74164, 2606, -3040, 56453, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (105, 80, 35807, 73281, 3925, -3040, 23840, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (105, 81, 35807, 73194, 3703, -3040, 56456, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (105, 82, 35807, 72430, 4624, -3040, 56456, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (105, 83, 35807, 72532, 4853, -3040, 23840, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (105, 84, 36461, 73470, 6019, -3040, 56456, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (105, 85, 36397, 72619, 4569, -2889, 23840, 3, 4);
INSERT INTO `fort_spawnlist` VALUES (106, 86, 35827, 154544, 55600, -3096, 58368, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (106, 87, 35828, 159377, 52403, -3312, 0, 2, 0);
INSERT INTO `fort_spawnlist` VALUES (106, 88, 35829, 155576, 56592, -3224, 59224, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (106, 89, 35830, 154704, 53856, -2968, 0, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (106, 90, 35831, 153328, 54848, -3216, 5512, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (106, 91, 35833, 156768, 55552, -3256, 32252, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (106, 92, 35835, 154800, 57146, -3257, 49096, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (106, 93, 35836, 153312, 56544, -3256, 58368, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (106, 94, 35836, 153328, 56896, -3256, 25416, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (106, 95, 35837, 156496, 53920, -3256, 58368, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (106, 96, 35837, 156528, 54272, -3256, 25416, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (106, 97, 35838, 155385, 55045, -3248, 25416, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (106, 98, 35838, 155328, 54800, -3256, 58368, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (106, 99, 35838, 154407, 55563, -3248, 58368, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (106, 100, 35838, 154468, 55805, -3256, 25416, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (106, 101, 36462, 155166, 57115, -3256, 58368, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (106, 102, 36398, 154592, 55527, -3098, 25416, 3, 5);
INSERT INTO `fort_spawnlist` VALUES (107, 103, 35858, 189968, 40224, -3248, 0, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (107, 104, 35859, 190423, 43540, -3656, 0, 2, 0);
INSERT INTO `fort_spawnlist` VALUES (107, 105, 35860, 188160, 39920, -3376, 49284, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (107, 106, 35861, 188624, 38240, -3128, 0, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (107, 107, 35863, 188626, 41066, -3376, 57140, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (107, 108, 35865, 191760, 40752, -3408, 39112, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (107, 109, 35867, 190992, 41376, -3412, 45180, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (107, 110, 35868, 189776, 41872, -3408, 49148, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (107, 111, 35868, 190048, 42064, -3408, 16316, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (107, 112, 35869, 189776, 36960, -3408, 49148, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (107, 113, 35869, 190048, 37152, -3408, 16316, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (107, 114, 35870, 189812, 39071, -3408, 49148, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (107, 115, 35870, 190044, 39197, -3408, 16316, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (107, 116, 35870, 189825, 40269, -3408, 49148, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (107, 117, 35870, 190048, 40400, -3408, 16316, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (107, 118, 36463, 190798, 41513, -3408, 49148, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (107, 119, 36399, 189984, 40112, -3254, 0, 3, 5);
INSERT INTO `fort_spawnlist` VALUES (108, 120, 35896, 118827, 205186, -3176, 38352, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (108, 121, 35897, 114436, 202528, -3408, 0, 2, 0);
INSERT INTO `fort_spawnlist` VALUES (108, 122, 35898, 118880, 203568, -3304, 5396, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (108, 123, 35899, 117216, 205648, -3048, 0, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (108, 124, 35900, 118560, 206560, -3304, 48872, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (108, 125, 35902, 120160, 204256, -3336, 30272, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (108, 126, 35904, 118138, 203228, -3336, 17176, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (108, 127, 35905, 120113, 205939, -3336, 38352, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (108, 128, 35905, 120407, 205831, -3336, 5396, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (108, 129, 35906, 116741, 203878, -3336, 5396, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (108, 130, 35906, 116460, 203986, -3336, 38352, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (108, 131, 35907, 117785, 204712, -3336, 38352, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (108, 132, 35907, 117980, 204551, -3328, 5396, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (108, 133, 35907, 118832, 205280, -3328, 38352, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (108, 134, 35907, 119040, 205120, -3336, 5396, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (108, 135, 36464, 117889, 203183, -3336, 38352, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (108, 136, 36400, 118785, 205138, -3177, 5396, 3, 6);
INSERT INTO `fort_spawnlist` VALUES (109, 137, 35927, 158720, -70032, -2704, 59020, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (109, 138, 35928, 161876, -73407, -2984, 0, 2, 0);
INSERT INTO `fort_spawnlist` VALUES (109, 139, 35929, 157968, -71659, -2832, 59020, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (109, 140, 35930, 159664, -72224, -2584, 0, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (109, 141, 35932, 157312, -70640, -2832, 0, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (109, 142, 35934, 159312, -68240, -2864, 49028, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (109, 143, 35936, 160832, -69056, -2866, 42144, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (109, 144, 35937, 157293, -69255, -2864, 59020, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (109, 145, 35937, 157280, -68912, -2864, 27244, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (109, 146, 35938, 161373, -71636, -2864, 27244, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (109, 147, 35938, 161371, -71992, -2864, 59020, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (109, 148, 35939, 158672, -69856, -2864, 27244, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (109, 149, 35939, 158635, -70096, -2864, 59020, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (109, 150, 35939, 159632, -70761, -2864, 59020, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (109, 151, 35939, 159670, -70518, -2864, 27244, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (109, 152, 36465, 161130, -69197, -2864, 59020, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (109, 153, 36401, 158776, -70042, -2708, 27244, 3, 7);
INSERT INTO `fort_spawnlist` VALUES (110, 154, 35965, 70062, -60958, -2624, 45292, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (110, 155, 35966, 71436, -58182, -2904, 0, 2, 0);
INSERT INTO `fort_spawnlist` VALUES (110, 156, 35967, 71248, -62352, -2752, 12388, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (110, 157, 35968, 71264, -60512, -2504, 0, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (110, 158, 35970, 68688, -59648, -2752, 56012, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (110, 159, 35972, 70144, -63584, -2784, 18252, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (110, 160, 35974, 70944, -63168, -2784, 25448, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (110, 161, 35975, 68995, -63605, -2784, 12388, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (110, 162, 35975, 68668, -63690, -2784, 45292, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (110, 163, 35976, 70884, -59059, -2784, 12388, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (110, 164, 35976, 70535, -59147, -2784, 45292, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (110, 165, 35977, 70194, -60871, -2784, 12388, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (110, 166, 35977, 69936, -60882, -2784, 45292, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (110, 167, 35977, 69736, -61986, -2784, 12388, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (110, 168, 35977, 69472, -61984, -2784, 45292, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (110, 169, 36466, 71273, -62968, -2784, 45292, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (110, 170, 36433, 70058, -61012, -2630, 12388, 3, 8);
INSERT INTO `fort_spawnlist` VALUES (111, 171, 36003, 109024, -141072, -2800, 62612, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (111, 172, 36004, 105447, -139845, -3120, 0, 2, 0);
INSERT INTO `fort_spawnlist` VALUES (111, 173, 36005, 109600, -139735, -2928, 62612, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (111, 174, 36006, 109856, -142640, -2672, 0, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (111, 175, 36007, 108223, -142209, -2920, 8524, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (111, 176, 36009, 108544, -139488, -2952, 55116, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (111, 177, 36011, 110859, -139960, -2952, 40492, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (111, 178, 36012, 111383, -141559, -2960, 29804, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (111, 179, 36012, 111494, -141882, -2952, 62612, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (111, 180, 36013, 107424, -140362, -2960, 29804, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (111, 181, 36013, 107538, -140682, -2960, 62612, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (111, 182, 36014, 110078, -141517, -2952, 62612, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (111, 183, 36014, 108896, -140928, -2952, 29804, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (111, 184, 36014, 108931, -141177, -2952, 62612, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (111, 185, 36014, 110048, -141271, -2952, 29804, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (111, 186, 36467, 111163, -140542, -2952, 62612, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (111, 187, 36434, 109080, -141070, -2801, 29804, 3, 9);
INSERT INTO `fort_spawnlist` VALUES (112, 188, 36034, 5136, 149728, -2728, 0, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (112, 189, 36035, 14186, 149947, -3352, 0, 2, 0);
INSERT INTO `fort_spawnlist` VALUES (112, 190, 36036, 7006, 148242, -2856, 32768, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (112, 191, 36037, 6528, 151872, -2608, 0, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (112, 192, 36039, 4384, 150992, -2856, 0, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (112, 193, 36041, 5968, 146864, -2888, 19216, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (112, 194, 36043, 4320, 150032, -2892, 0, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (112, 195, 36044, 7345, 150866, -2888, 32768, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (112, 196, 36044, 7552, 150601, -2888, 0, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (112, 197, 36045, 3905, 148865, -2888, 32768, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (112, 198, 36045, 4101, 148594, -2888, 0, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (112, 199, 36046, 6257, 149635, -2888, 0, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (112, 200, 36046, 6165, 149868, -2888, 32768, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (112, 201, 36046, 5065, 149635, -2888, 0, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (112, 202, 36046, 4962, 149869, -2888, 32768, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (112, 203, 36468, 4326, 149651, -2888, 0, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (112, 204, 36435, 5217, 149697, -2736, 32768, 3, 1);
INSERT INTO `fort_spawnlist` VALUES (112, 205, 36436, 5217, 149754, -2736, 32768, 3, 2);
INSERT INTO `fort_spawnlist` VALUES (114, 206, 36110, 60379, 139950, -1592, 46872, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (114, 207, 36111, 58314, 136319, -2000, 0, 2, 0);
INSERT INTO `fort_spawnlist` VALUES (114, 208, 36112, 61864, 139257, -1728, 46896, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (114, 209, 36113, 58480, 139648, -1464, 0, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (114, 210, 36114, 59436, 140834, -1720, 47296, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (114, 211, 36116, 60576, 138064, -1752, 16532, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (114, 212, 36118, 60400, 140688, -1757, 48196, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (114, 213, 36119, 61696, 140832, -1752, 14120, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (114, 214, 36119, 61395, 140689, -1752, 46936, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (114, 215, 36120, 58828, 138054, -1752, 46872, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (114, 216, 36120, 59137, 138189, -1752, 14120, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (114, 217, 36121, 60265, 139991, -1752, 46872, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (114, 218, 36121, 60522, 140048, -1752, 14480, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (114, 219, 36121, 60042, 138817, -1752, 46872, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (114, 220, 36121, 60285, 138872, -1752, 14480, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (114, 221, 36470, 60145, 140737, -1752, 46872, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (114, 222, 36439, 60391, 139884, -1600, 14480, 3, 2);
INSERT INTO `fort_spawnlist` VALUES (114, 223, 36440, 60343, 139892, -1600, 14480, 3, 3);
INSERT INTO `fort_spawnlist` VALUES (115, 224, 36141, 11537, 95509, -3264, 49151, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (115, 225, 36142, 9318, 92253, -3536, 0, 2, 0);
INSERT INTO `fort_spawnlist` VALUES (115, 226, 36143, 9472, 94992, -3392, 0, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (115, 227, 36144, 13184, 94928, -3144, 0, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (115, 228, 36145, 12829, 96214, -3392, 49152, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (115, 229, 36147, 10112, 93760, -3424, 16384, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (115, 230, 36149, 9485, 96089, -3424, 57220, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (115, 231, 36150, 12633, 93599, -3424, 16384, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (115, 232, 36150, 12365, 93398, -3424, 49151, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (115, 233, 36151, 10615, 96684, -3424, 16384, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (115, 234, 36151, 10344, 96478, -3424, 49151, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (115, 235, 36152, 11654, 95634, -3424, 16384, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (115, 236, 36152, 11422, 95531, -3424, 49151, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (115, 237, 36152, 11660, 94437, -3424, 16384, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (115, 238, 36152, 11420, 94333, -3424, 49151, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (115, 239, 36471, 9203, 95842, -3424, 49151, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (115, 240, 36441, 11549, 95447, -3270, 16384, 3, 2);
INSERT INTO `fort_spawnlist` VALUES (115, 241, 36442, 11517, 95447, -3270, 16384, 3, 4);
INSERT INTO `fort_spawnlist` VALUES (116, 242, 36172, 79686, 91280, -2720, 37660, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (116, 243, 36173, 74810, 90814, -3344, 0, 2, 0);
INSERT INTO `fort_spawnlist` VALUES (116, 244, 36174, 77262, 91704, -2856, 5112, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (116, 245, 36175, 79440, 88752, -2600, 0, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (116, 246, 36177, 80929, 90510, -2856, 40192, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (116, 247, 36179, 77600, 93440, -2880, 57688, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (116, 248, 36181, 76848, 92624, -2880, 62456, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (116, 249, 36182, 80031, 92773, -2880, 37568, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (116, 250, 36182, 80329, 92637, -2880, 5012, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (116, 251, 36183, 78231, 89249, -2880, 5012, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (116, 252, 36183, 77927, 89390, -2880, 37920, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (116, 253, 36184, 78812, 90685, -2880, 5012, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (116, 254, 36184, 79666, 91408, -2880, 37660, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (116, 255, 36184, 78611, 90849, -2880, 37660, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (116, 256, 36184, 79865, 91249, -2880, 5012, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (116, 257, 36472, 76880, 92931, -2880, 37660, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (116, 258, 36443, 79618, 91276, -2728, 5012, 3, 4);
INSERT INTO `fort_spawnlist` VALUES (116, 259, 36444, 79641, 91231, -2728, 5012, 3, 3);
INSERT INTO `fort_spawnlist` VALUES (117, 260, 36210, 111368, -14624, -832, 49151, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (117, 261, 36211, 114221, -18762, -1768, 0, 2, 0);
INSERT INTO `fort_spawnlist` VALUES (117, 262, 36212, 109872, -16624, -968, 16384, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (117, 263, 36213, 113481, -16058, -712, 0, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (117, 264, 36215, 112601, -13933, -960, 49152, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (117, 265, 36217, 108496, -15504, -992, 0, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (117, 266, 36219, 108880, -16492, -992, 8356, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (117, 267, 36220, 110219, -13636, -992, 49151, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (117, 268, 36220, 110478, -13435, -992, 16384, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (117, 269, 36221, 112216, -17087, -992, 49151, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (117, 270, 36221, 112482, -16883, -992, 16384, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (117, 271, 36222, 111248, -15800, -992, 49151, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (117, 272, 36222, 111487, -15701, -992, 16384, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (117, 273, 36222, 111253, -14604, -992, 49151, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (117, 274, 36222, 111486, -14503, -992, 16384, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (117, 275, 36473, 108614, -16342, -992, 49151, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (117, 276, 36445, 111323, -14680, -839, 16384, 3, 5);
INSERT INTO `fort_spawnlist` VALUES (117, 277, 36446, 111368, -14680, -839, 16384, 3, 4);
INSERT INTO `fort_spawnlist` VALUES (117, 278, 36447, 111412, -14681, -839, 16384, 3, 7);
INSERT INTO `fort_spawnlist` VALUES (118, 279, 36248, 125246, 95621, -1976, 49151, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (118, 280, 36249, 121072, 93215, -2736, 0, 2, 0);
INSERT INTO `fort_spawnlist` VALUES (118, 281, 36250, 122688, 95760, -2112, 0, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (118, 282, 36251, 123232, 94400, -1856, 0, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (118, 283, 36253, 124305, 96528, -2104, 49151, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (118, 284, 36255, 126384, 93728, -2144, 16384, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (118, 285, 36257, 127968, 95328, -2144, 32768, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (118, 286, 36258, 124357, 93571, -2144, 16384, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (118, 287, 36258, 124080, 93379, -2144, 49151, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (118, 288, 36259, 126328, 97008, -2144, 16384, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (118, 289, 36259, 126064, 96813, -2144, 49151, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (118, 290, 36260, 125128, 94482, -2144, 49151, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (118, 291, 36260, 125364, 95782, -2144, 16384, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (118, 292, 36260, 125131, 95677, -2136, 49151, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (118, 293, 36260, 125365, 94582, -2136, 16384, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (118, 294, 36474, 128023, 94941, -2144, 49151, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (118, 295, 36448, 125266, 95558, -1984, 16384, 3, 5);
INSERT INTO `fort_spawnlist` VALUES (118, 296, 36449, 125226, 95559, -1984, 16384, 3, 3);
INSERT INTO `fort_spawnlist` VALUES (119, 297, 36286, 72834, 186402, -2424, 54844, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (119, 298, 36287, 71692, 188004, -2616, 0, 2, 0);
INSERT INTO `fort_spawnlist` VALUES (119, 299, 36288, 71392, 184720, -2552, 5528, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (119, 300, 36289, 74288, 186912, -2296, 0, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (119, 301, 36290, 71542, 186410, -2552, 55088, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (119, 302, 36292, 74832, 185648, -2584, 24516, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (119, 303, 36294, 70768, 185632, -2584, 63668, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (119, 304, 36295, 73081, 188000, -2584, 22248, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (119, 305, 36295, 72974, 187690, -2584, 54844, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (119, 306, 36296, 73127, 184321, -2584, 22248, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (119, 307, 36296, 73008, 184000, -2584, 54844, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (119, 308, 36297, 73523, 185589, -2576, 22248, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (119, 309, 36297, 73376, 185380, -2584, 54844, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (119, 310, 36297, 72713, 186369, -2576, 54844, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (119, 311, 36297, 72851, 186593, -2584, 22248, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (119, 312, 36475, 70720, 185261, -2584, 54844, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (119, 313, 36450, 72880, 186364, -2425, 22248, 3, 6);
INSERT INTO `fort_spawnlist` VALUES (119, 314, 36451, 72850, 186346, -2425, 22248, 3, 3);
INSERT INTO `fort_spawnlist` VALUES (120, 315, 36317, 100213, -55318, -488, 0, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (120, 316, 36318, 104686, -57581, -944, 0, 2, 0);
INSERT INTO `fort_spawnlist` VALUES (120, 317, 36319, 100688, -57440, -616, 16384, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (120, 318, 36320, 100752, -53664, -360, 0, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (120, 319, 36322, 99484, -54027, -616, 0, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (120, 320, 36324, 101952, -56752, -640, 32768, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (120, 321, 36326, 99600, -57360, -648, 8476, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (120, 322, 36327, 102103, -54225, -640, 32768, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (120, 323, 36327, 102308, -54490, -640, 0, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (120, 324, 36328, 99016, -56242, -632, 32768, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (120, 325, 36328, 99229, -56507, -640, 0, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (120, 326, 36329, 101363, -55435, -640, 0, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (120, 327, 36329, 101268, -55199, -640, 32768, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (120, 328, 36329, 100168, -55434, -640, 0, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (120, 329, 36329, 100064, -55200, -640, 32768, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (120, 330, 36476, 99834, -57649, -648, 0, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (120, 331, 36452, 100280, -55302, -489, 32768, 3, 8);
INSERT INTO `fort_spawnlist` VALUES (120, 332, 36453, 100280, -55334, -489, 32768, 3, 7);
INSERT INTO `fort_spawnlist` VALUES (121, 333, 36355, 72365, -94294, -1264, 44872, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (121, 334, 36356, 69553, -91746, -1488, 0, 2, 0);
INSERT INTO `fort_spawnlist` VALUES (121, 335, 36357, 70189, -93935, -1400, 61576, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (121, 336, 36358, 73680, -95456, -1144, 0, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (121, 337, 36360, 73831, -94119, -1400, 45536, 1, 0);
INSERT INTO `fort_spawnlist` VALUES (121, 338, 36362, 70384, -95360, -1424, 11308, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (121, 339, 36364, 70704, -92960, -1424, 53872, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (121, 340, 36365, 71641, -92931, -1424, 44872, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (121, 341, 36365, 71971, -92846, -1424, 12456, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (121, 342, 36366, 72323, -96557, -1424, 44872, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (121, 343, 36366, 72653, -96469, -1424, 12456, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (121, 344, 36367, 72264, -94213, -1424, 44872, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (121, 345, 36367, 72066, -95317, -1424, 12456, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (121, 346, 36367, 71810, -95321, -1424, 44872, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (121, 347, 36367, 72526, -94209, -1424, 12456, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (121, 348, 36477, 70350, -93054, -1424, 44872, 0, 0);
INSERT INTO `fort_spawnlist` VALUES (121, 349, 36454, 72358, -94360, -1272, 12456, 3, 8);
INSERT INTO `fort_spawnlist` VALUES (121, 350, 36455, 72324, -94346, -1272, 12456, 3, 9);

-- ----------------------------
-- Table structure for fortsiege_clans
-- ----------------------------
DROP TABLE IF EXISTS `fortsiege_clans`;
CREATE TABLE `fortsiege_clans`  (
  `fort_id` int(1) NOT NULL DEFAULT 0,
  `clan_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`clan_id`, `fort_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fortsiege_clans
-- ----------------------------

-- ----------------------------
-- Table structure for forums
-- ----------------------------
DROP TABLE IF EXISTS `forums`;
CREATE TABLE `forums`  (
  `forum_id` int(8) NOT NULL DEFAULT 0,
  `forum_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `forum_parent` int(8) NOT NULL DEFAULT 0,
  `forum_post` int(8) NOT NULL DEFAULT 0,
  `forum_type` int(8) NOT NULL DEFAULT 0,
  `forum_perm` int(8) NOT NULL DEFAULT 0,
  `forum_owner_id` int(8) NOT NULL DEFAULT 0,
  PRIMARY KEY (`forum_id`) USING BTREE,
  INDEX `forum_owner_id`(`forum_owner_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forums
-- ----------------------------
INSERT INTO `forums` VALUES (1, 'NormalRoot', 0, 0, 0, 1, 0);
INSERT INTO `forums` VALUES (2, 'ClanRoot', 0, 0, 0, 0, 0);
INSERT INTO `forums` VALUES (3, 'MemoRoot', 0, 0, 0, 0, 0);
INSERT INTO `forums` VALUES (4, 'MailRoot', 0, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for gameservers
-- ----------------------------
DROP TABLE IF EXISTS `gameservers`;
CREATE TABLE `gameservers`  (
  `server_id` int(11) NOT NULL DEFAULT 0,
  `hexid` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `host` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`server_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gameservers
-- ----------------------------
INSERT INTO `gameservers` VALUES (2, '-2ad66b3f483c22be097019f55c8abdf0', '');

-- ----------------------------
-- Table structure for global_tasks
-- ----------------------------
DROP TABLE IF EXISTS `global_tasks`;
CREATE TABLE `global_tasks`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `last_activation` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  `param1` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `param2` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `param3` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of global_tasks
-- ----------------------------
INSERT INTO `global_tasks` VALUES (1, 'birthday', 'TYPE_GLOBAL_TASK', 1744324200758, '1', '06:30:00', '');
INSERT INTO `global_tasks` VALUES (2, 'recommendations', 'TYPE_GLOBAL_TASK', 1744324200754, '1', '06:30:00', '');

-- ----------------------------
-- Table structure for global_variables
-- ----------------------------
DROP TABLE IF EXISTS `global_variables`;
CREATE TABLE `global_variables`  (
  `var` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`var`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of global_variables
-- ----------------------------
INSERT INTO `global_variables` VALUES ('Core_Attacked', 'false');
INSERT INTO `global_variables` VALUES ('DAILY_TASK_RESET', '1744324200753');
INSERT INTO `global_variables` VALUES ('Fafurion_Stage', '2');
INSERT INTO `global_variables` VALUES ('QueenShyeedRespawn', '1744377244590');
INSERT INTO `global_variables` VALUES ('SeedBuffsList', '0');
INSERT INTO `global_variables` VALUES ('SeedNextStatusChange', '1744606800495');
INSERT INTO `global_variables` VALUES ('SoDLSCDate', '1743502374061');
INSERT INTO `global_variables` VALUES ('SoDState', '1');
INSERT INTO `global_variables` VALUES ('SoDTiatKilled', '0');
INSERT INTO `global_variables` VALUES ('UC_START_TIME', '1744376400000');
INSERT INTO `global_variables` VALUES ('UC_STOP_TIME', '1744383600000');
INSERT INTO `global_variables` VALUES ('VenomStatus', '0');

-- ----------------------------
-- Table structure for grandboss_data
-- ----------------------------
DROP TABLE IF EXISTS `grandboss_data`;
CREATE TABLE `grandboss_data`  (
  `boss_id` smallint(5) UNSIGNED NOT NULL,
  `loc_x` mediumint(6) NOT NULL,
  `loc_y` mediumint(6) NOT NULL,
  `loc_z` mediumint(6) NOT NULL,
  `heading` mediumint(6) NOT NULL DEFAULT 0,
  `respawn_time` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  `currentHP` decimal(30, 15) NOT NULL,
  `currentMP` decimal(30, 15) NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`boss_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of grandboss_data
-- ----------------------------
INSERT INTO `grandboss_data` VALUES (19740, -126920, -234182, -15563, 0, 1744346503698, 620220318.000000000000000, 201454.000000000000000, 0);
INSERT INTO `grandboss_data` VALUES (26124, 0, 0, 0, 0, 0, 20949082.101690000000000, 83501.371000000000000, 0);
INSERT INTO `grandboss_data` VALUES (29001, -21610, 181594, -5734, 0, 0, 95760030.000000000000000, 600.000000000000000, 0);
INSERT INTO `grandboss_data` VALUES (29006, 17726, 108915, -6480, 0, 0, 622752.000000000000000, 3420.000000000000000, 0);
INSERT INTO `grandboss_data` VALUES (29020, 116033, 17447, 10107, -25348, 0, 53342293.000000000000000, 18000.000000000000000, 0);
INSERT INTO `grandboss_data` VALUES (29028, 220963, -104895, -1611, 0, 0, 1405123149.240539600000000, 1256451.972052097300000, 0);
INSERT INTO `grandboss_data` VALUES (29068, 185708, 114298, -8221, 0, 0, 1405124273.142273000000000, 1256459.172051906600000, 0);
INSERT INTO `grandboss_data` VALUES (29118, 0, 0, 0, 0, 0, 4109288.000000000000000, 1220547.000000000000000, 0);
INSERT INTO `grandboss_data` VALUES (29197, 81208, -182095, -9895, 0, 0, 549579599.714790000000000, 22800.000000000000000, 0);
INSERT INTO `grandboss_data` VALUES (29240, -126920, -234182, -15563, 0, 0, 498728877.000000000000000, 94294.000000000000000, 0);
INSERT INTO `grandboss_data` VALUES (29305, -126920, -234182, -15563, 0, 0, 589355365.000000000000000, 103496.000000000000000, 0);
INSERT INTO `grandboss_data` VALUES (29325, 43400, 16504, -4395, 0, 0, 247117958.000000000000000, 177258.000000000000000, 0);
INSERT INTO `grandboss_data` VALUES (29336, -126920, -234182, -15563, 0, 0, 351044378.000000000000000, 182301.000000000000000, 0);
INSERT INTO `grandboss_data` VALUES (29348, -126920, -234182, -15563, 0, 0, 351044378.000000000000000, 182301.000000000000000, 0);

-- ----------------------------
-- Table structure for heroes
-- ----------------------------
DROP TABLE IF EXISTS `heroes`;
CREATE TABLE `heroes`  (
  `charId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `class_id` decimal(3, 0) NOT NULL DEFAULT 0,
  `count` decimal(3, 0) NOT NULL DEFAULT 0,
  `played` decimal(1, 0) NOT NULL DEFAULT 0,
  `claimed` enum('true','false') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'false',
  `message` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`charId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of heroes
-- ----------------------------

-- ----------------------------
-- Table structure for heroes_diary
-- ----------------------------
DROP TABLE IF EXISTS `heroes_diary`;
CREATE TABLE `heroes_diary`  (
  `charId` int(10) UNSIGNED NOT NULL,
  `time` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  `action` tinyint(2) UNSIGNED NOT NULL DEFAULT 0,
  `param` int(11) UNSIGNED NOT NULL DEFAULT 0,
  INDEX `charId`(`charId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of heroes_diary
-- ----------------------------

-- ----------------------------
-- Table structure for item_auction
-- ----------------------------
DROP TABLE IF EXISTS `item_auction`;
CREATE TABLE `item_auction`  (
  `auctionId` int(11) NOT NULL,
  `instanceId` int(11) NOT NULL,
  `auctionItemId` int(11) NOT NULL,
  `startingTime` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  `endingTime` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  `auctionStateId` tinyint(1) NOT NULL,
  PRIMARY KEY (`auctionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item_auction
-- ----------------------------
INSERT INTO `item_auction` VALUES (1, 34328, 1, 1743843600000, 1743847200000, 2);
INSERT INTO `item_auction` VALUES (2, 34328, 10, 1744448400000, 1744452000000, 0);

-- ----------------------------
-- Table structure for item_auction_bid
-- ----------------------------
DROP TABLE IF EXISTS `item_auction_bid`;
CREATE TABLE `item_auction_bid`  (
  `auctionId` int(11) NOT NULL,
  `playerObjId` int(11) NOT NULL,
  `playerBid` bigint(20) NOT NULL,
  PRIMARY KEY (`auctionId`, `playerObjId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item_auction_bid
-- ----------------------------

-- ----------------------------
-- Table structure for item_elementals
-- ----------------------------
DROP TABLE IF EXISTS `item_elementals`;
CREATE TABLE `item_elementals`  (
  `itemId` int(11) NOT NULL DEFAULT 0,
  `elemType` tinyint(1) NOT NULL DEFAULT -1,
  `elemValue` int(11) NOT NULL DEFAULT -1,
  PRIMARY KEY (`itemId`, `elemType`) USING BTREE,
  INDEX `idx_itemId_elemType`(`itemId`, `elemType`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item_elementals
-- ----------------------------

-- ----------------------------
-- Table structure for item_special_abilities
-- ----------------------------
DROP TABLE IF EXISTS `item_special_abilities`;
CREATE TABLE `item_special_abilities`  (
  `objectId` int(10) UNSIGNED NOT NULL,
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `optionId` int(10) UNSIGNED NOT NULL,
  `position` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`objectId`, `optionId`) USING BTREE,
  INDEX `idx_objectId`(`objectId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item_special_abilities
-- ----------------------------

-- ----------------------------
-- Table structure for item_variables
-- ----------------------------
DROP TABLE IF EXISTS `item_variables`;
CREATE TABLE `item_variables`  (
  `id` int(10) UNSIGNED NOT NULL,
  `var` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `val` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  INDEX `charId`(`id`) USING BTREE,
  INDEX `idx_id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item_variables
-- ----------------------------

-- ----------------------------
-- Table structure for item_variations
-- ----------------------------
DROP TABLE IF EXISTS `item_variations`;
CREATE TABLE `item_variations`  (
  `itemId` int(11) NOT NULL,
  `mineralId` int(11) NOT NULL DEFAULT 0,
  `option1` int(11) NOT NULL,
  `option2` int(11) NOT NULL,
  PRIMARY KEY (`itemId`) USING BTREE,
  INDEX `idx_itemId`(`itemId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item_variations
-- ----------------------------
INSERT INTO `item_variations` VALUES (268609679, 22634, 50000, 51829);

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items`  (
  `owner_id` int(11) NULL DEFAULT NULL,
  `object_id` int(11) NOT NULL DEFAULT 0,
  `item_id` int(11) NULL DEFAULT NULL,
  `count` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `enchant_level` int(11) NULL DEFAULT NULL,
  `loc` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `loc_data` int(11) NULL DEFAULT NULL,
  `time_of_use` int(11) NULL DEFAULT NULL,
  `custom_type1` int(11) NULL DEFAULT 0,
  `custom_type2` int(11) NULL DEFAULT 0,
  `mana_left` decimal(5, 0) NOT NULL DEFAULT -1,
  `time` decimal(13, 0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`object_id`) USING BTREE,
  INDEX `owner_id`(`owner_id`) USING BTREE,
  INDEX `item_id`(`item_id`) USING BTREE,
  INDEX `loc`(`loc`) USING BTREE,
  INDEX `time_of_use`(`time_of_use`) USING BTREE,
  INDEX `idx_item_id`(`item_id`) USING BTREE,
  INDEX `idx_object_id`(`object_id`) USING BTREE,
  INDEX `idx_owner_id`(`owner_id`) USING BTREE,
  INDEX `idx_owner_id_loc`(`owner_id`, `loc`) USING BTREE,
  INDEX `idx_owner_id_item_id`(`owner_id`, `item_id`) USING BTREE,
  INDEX `idx_owner_id_loc_locdata`(`owner_id`, `loc`, `loc_data`) USING BTREE,
  INDEX `idx_owner_id_loc_locdata_enchant`(`owner_id`, `loc`, `loc_data`, `enchant_level`, `item_id`, `object_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES (268491433, 268491434, 2368, 1, 0, 'INVENTORY', 1, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268491433, 268491435, 1146, 1, 0, 'PAPERDOLL', 6, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268491433, 268491436, 1147, 1, 0, 'PAPERDOLL', 11, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268491433, 268491437, 33801, 1, 0, 'INVENTORY', 2, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268492103, 268492104, 2369, 1, 0, 'INVENTORY', 3, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268492103, 268492105, 1146, 1, 0, 'PAPERDOLL', 6, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268492103, 268492106, 1147, 1, 0, 'PAPERDOLL', 11, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268492103, 268492107, 33801, 1, 0, 'INVENTORY', 0, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268492103, 268492108, 10, 1, 0, 'INVENTORY', 2, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268491433, 268492193, 22634, 998, 0, 'INVENTORY', 3, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268492103, 268492344, 80086, 1, 0, 'PAPERDOLL', 5, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268492456, 268492457, 2369, 1, 0, 'PAPERDOLL', 5, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268492456, 268492458, 1146, 1, 0, 'PAPERDOLL', 6, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268492456, 268492459, 1147, 1, 0, 'PAPERDOLL', 11, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268492456, 268492460, 33801, 1, 0, 'INVENTORY', 21, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268492456, 268492461, 10, 1, 0, 'INVENTORY', 5, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268492456, 268493011, 80322, 1, 0, 'INVENTORY', 25, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268492103, 268493355, 57, 40, 0, 'INVENTORY', 1, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268492456, 268494032, 1538, 2, 0, 'INVENTORY', 22, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268492456, 268494192, 80089, 1, 0, 'INVENTORY', 2, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268492456, 268494218, 46479, 1, 0, 'INVENTORY', 24, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268492456, 268494219, 80120, 1, 0, 'INVENTORY', 9, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268492456, 268494220, 80120, 1, 0, 'INVENTORY', 8, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268492456, 268494221, 80109, 1, 0, 'INVENTORY', 7, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268492456, 268494222, 80109, 1, 0, 'INVENTORY', 6, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268492456, 268494223, 80119, 1, 0, 'INVENTORY', 10, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268492456, 268494224, 46510, 1, 0, 'INVENTORY', 18, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268492456, 268494225, 46450, 1, 0, 'INVENTORY', 19, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268492456, 268494226, 46509, 1, 0, 'INVENTORY', 17, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268534748, 268497500, 4355, 10000, 0, 'INVENTORY', 4, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268534748, 268497508, 5575, 10000, 0, 'INVENTORY', 5, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268534748, 268497513, 6673, 10000, 0, 'INVENTORY', 6, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268492456, 268497587, 57, 1926041, 0, 'INVENTORY', 0, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268492456, 268498331, 17725, 1, 0, 'INVENTORY', 20, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268534748, 268534749, 2369, 9, 0, 'INVENTORY', 0, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268534748, 268534750, 1146, 10, 0, 'PAPERDOLL', 6, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268534748, 268534751, 1147, 10, 0, 'PAPERDOLL', 11, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268534748, 268534752, 33801, 10, 0, 'INVENTORY', 1, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268534748, 268534753, 57, 10100035, 0, 'PAPERDOLL', 5, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268492456, 268535833, 80194, 1, 0, 'INVENTORY', 12, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268492456, 268592862, 3031, 49825, 0, 'INVENTORY', 23, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268492456, 268598964, 80438, 6, 0, 'INVENTORY', 14, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268492456, 268598966, 80439, 4, 0, 'INVENTORY', 16, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268492456, 268598967, 80440, 4, 0, 'INVENTORY', 15, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268492456, 268598980, 80061, 1, 0, 'INVENTORY', 13, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268491433, 268609679, 35206, 1, 100, 'PAPERDOLL', 5, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268491433, 268609699, 2133, 99882, 0, 'INVENTORY', 0, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268492456, 268615745, 48135, 1, 0, 'INVENTORY', 11, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268492456, 268615813, 8679, 1, 0, 'INVENTORY', 1, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268492456, 268615978, 9332, 1, 0, 'INVENTORY', 3, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268492456, 268617230, 37873, 1, 0, 'INVENTORY', 4, NULL, 0, 0, -1, 1745004780089);
INSERT INTO `items` VALUES (268534748, 268757677, 17725, 1, 0, 'INVENTORY', 2, NULL, 0, 0, -1, -1);
INSERT INTO `items` VALUES (268534748, 268757726, 5789, 100, 0, 'INVENTORY', 3, NULL, 0, 0, -1, -1);

-- ----------------------------
-- Table structure for itemsonground
-- ----------------------------
DROP TABLE IF EXISTS `itemsonground`;
CREATE TABLE `itemsonground`  (
  `object_id` int(11) NOT NULL DEFAULT 0,
  `item_id` int(11) NULL DEFAULT NULL,
  `count` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `enchant_level` int(11) NULL DEFAULT NULL,
  `x` int(11) NULL DEFAULT NULL,
  `y` int(11) NULL DEFAULT NULL,
  `z` int(11) NULL DEFAULT NULL,
  `drop_time` bigint(13) NOT NULL DEFAULT 0,
  `equipable` int(1) NULL DEFAULT 0,
  PRIMARY KEY (`object_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of itemsonground
-- ----------------------------

-- ----------------------------
-- Table structure for mdt_bets
-- ----------------------------
DROP TABLE IF EXISTS `mdt_bets`;
CREATE TABLE `mdt_bets`  (
  `lane_id` int(1) NOT NULL DEFAULT 0,
  `bet` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`lane_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mdt_bets
-- ----------------------------
INSERT INTO `mdt_bets` VALUES (1, 0);
INSERT INTO `mdt_bets` VALUES (2, 0);
INSERT INTO `mdt_bets` VALUES (3, 0);
INSERT INTO `mdt_bets` VALUES (4, 0);
INSERT INTO `mdt_bets` VALUES (5, 0);
INSERT INTO `mdt_bets` VALUES (6, 0);
INSERT INTO `mdt_bets` VALUES (7, 0);
INSERT INTO `mdt_bets` VALUES (8, 0);

-- ----------------------------
-- Table structure for mdt_history
-- ----------------------------
DROP TABLE IF EXISTS `mdt_history`;
CREATE TABLE `mdt_history`  (
  `race_id` mediumint(9) NOT NULL DEFAULT 0,
  `first` int(1) NULL DEFAULT 0,
  `second` int(1) NULL DEFAULT 0,
  `odd_rate` double(10, 2) NULL DEFAULT 0.00,
  PRIMARY KEY (`race_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mdt_history
-- ----------------------------

-- ----------------------------
-- Table structure for merchant_lease
-- ----------------------------
DROP TABLE IF EXISTS `merchant_lease`;
CREATE TABLE `merchant_lease`  (
  `merchant_id` int(11) NOT NULL DEFAULT 0,
  `player_id` int(11) NOT NULL DEFAULT 0,
  `bid` int(11) NULL DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `player_name` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`merchant_id`, `player_id`, `type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of merchant_lease
-- ----------------------------

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages`  (
  `messageId` int(11) NOT NULL DEFAULT 0,
  `senderId` int(11) NOT NULL DEFAULT 0,
  `receiverId` int(11) NOT NULL DEFAULT 0,
  `subject` tinytext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL,
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `expiration` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  `reqAdena` bigint(20) NOT NULL DEFAULT 0,
  `hasAttachments` enum('true','false') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'false',
  `isUnread` enum('true','false') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'true',
  `isDeletedBySender` enum('true','false') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'false',
  `isDeletedByReceiver` enum('true','false') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'false',
  `isLocked` enum('true','false') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'false',
  `sendBySystem` tinyint(1) NOT NULL DEFAULT 0,
  `isReturned` enum('true','false') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'false',
  `itemId` int(11) NOT NULL DEFAULT 0,
  `enchantLvl` int(3) NOT NULL DEFAULT 0,
  `elementals` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`messageId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of messages
-- ----------------------------

-- ----------------------------
-- Table structure for npc_respawns
-- ----------------------------
DROP TABLE IF EXISTS `npc_respawns`;
CREATE TABLE `npc_respawns`  (
  `id` int(10) NOT NULL,
  `x` int(10) NOT NULL,
  `y` int(10) NOT NULL,
  `z` int(10) NOT NULL,
  `heading` int(10) NOT NULL,
  `respawnTime` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `currentHp` double UNSIGNED NOT NULL,
  `currentMp` double UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of npc_respawns
-- ----------------------------
INSERT INTO `npc_respawns` VALUES (3473, 199526, 84696, -203, 0, 0, 84429153, 89801);
INSERT INTO `npc_respawns` VALUES (3477, 207218, 80172, 592, 0, 0, 45812342, 78174);
INSERT INTO `npc_respawns` VALUES (3479, 217564, 83921, 966, 0, 0, 50853010, 83923);
INSERT INTO `npc_respawns` VALUES (3481, 205923, 113567, -1793, 0, 0, 37488724, 86846);
INSERT INTO `npc_respawns` VALUES (25004, -94476, 100261, -3464, -1, 0, 336874, 658);
INSERT INTO `npc_respawns` VALUES (25007, 124093, 75651, -2672, -1, 0, 218894, 1064);
INSERT INTO `npc_respawns` VALUES (25016, 76856, 245313, -10376, -1, 0, 482634, 2075);
INSERT INTO `npc_respawns` VALUES (25019, 7968, 169075, -3544, -1, 0, 136139, 518);
INSERT INTO `npc_respawns` VALUES (25020, 89935, 125273, -2104, -1, 0, 103387, 774);
INSERT INTO `npc_respawns` VALUES (25023, 28472, 101849, -3680, -1, 0, 137348, 774);
INSERT INTO `npc_respawns` VALUES (25026, 93226, 7455, -3896, -1, 0, 232696, 1441);
INSERT INTO `npc_respawns` VALUES (25032, 89480, 245110, -10376, -1, 0, 455801, 1955);
INSERT INTO `npc_respawns` VALUES (25038, -57421, 186283, -4808, -1, 0, 76975, 600);
INSERT INTO `npc_respawns` VALUES (25041, 10035, 126830, -3656, -1, 0, 109136, 804);
INSERT INTO `npc_respawns` VALUES (25044, 108853, 27831, -3480, -1, 0, 211150, 1331);
INSERT INTO `npc_respawns` VALUES (25047, 116829, 27991, -3312, -1, 0, 232696, 1441);
INSERT INTO `npc_respawns` VALUES (25050, 125519, 27188, -3624, -1, 0, 509299, 1551);
INSERT INTO `npc_respawns` VALUES (25051, 117548, -9249, -3256, -1, 0, 819302, 2379);
INSERT INTO `npc_respawns` VALUES (25057, 107285, 168690, -3416, -1, 0, 190432, 1221);
INSERT INTO `npc_respawns` VALUES (25060, -60278, 188215, -4512, -1, 0, 65609, 490);
INSERT INTO `npc_respawns` VALUES (25063, -90864, 116291, -3456, -1, 0, 218273, 804);
INSERT INTO `npc_respawns` VALUES (25064, 96905, 94509, -3688, -1, 0, 144474, 956);
INSERT INTO `npc_respawns` VALUES (25067, 95050, -22094, -2048, -1, 0, 366215, 1609);
INSERT INTO `npc_respawns` VALUES (25076, -61531, 126921, -2856, -1, 0, 68069, 518);
INSERT INTO `npc_respawns` VALUES (25079, 54198, 102824, -1056, -1, 0, 111167, 658);
INSERT INTO `npc_respawns` VALUES (25082, 88538, 140996, -3424, -1, 0, 136515, 926);
INSERT INTO `npc_respawns` VALUES (25085, 67134, 66882, -3672, -1, 0, 245439, 1169);
INSERT INTO `npc_respawns` VALUES (25088, 91221, 15840, -5288, -1, 0, 463790, 1115);
INSERT INTO `npc_respawns` VALUES (25089, 165146, 84244, -2008, -1, 0, 338191, 2017);
INSERT INTO `npc_respawns` VALUES (25092, 115543, 16506, 1944, -1, 0, 889033, 2693);
INSERT INTO `npc_respawns` VALUES (25095, -37521, 198153, -2720, -1, 0, 80514, 630);
INSERT INTO `npc_respawns` VALUES (25098, 124153, 133257, -3560, -1, 0, 218273, 804);
INSERT INTO `npc_respawns` VALUES (25102, 113486, 84385, -2464, -1, 0, 380868, 1221);
INSERT INTO `npc_respawns` VALUES (25103, 135427, 94365, -3704, -1, 0, 298041, 1779);
INSERT INTO `npc_respawns` VALUES (25106, 173894, -11234, -2872, -1, 0, 347449, 2075);
INSERT INTO `npc_respawns` VALUES (25112, 116531, 139671, -3632, -1, 0, 84370, 658);
INSERT INTO `npc_respawns` VALUES (25115, 126067, 208043, -3656, -1, 0, 194681, 956);
INSERT INTO `npc_respawns` VALUES (25122, 86417, -8289, -3032, -1, 0, 308488, 1837);
INSERT INTO `npc_respawns` VALUES (25125, 164617, 80209, -2368, -1, 0, 1638607, 2379);
INSERT INTO `npc_respawns` VALUES (25127, -47644, 219673, -2400, -1, 0, 131219, 490);
INSERT INTO `npc_respawns` VALUES (25128, 17324, 179072, -3512, -1, 0, 98054, 744);
INSERT INTO `npc_respawns` VALUES (25131, 75142, -9310, -2768, -1, 0, 243647, 1495);
INSERT INTO `npc_respawns` VALUES (25134, 95101, 81212, -3656, -1, 0, 144474, 956);
INSERT INTO `npc_respawns` VALUES (25143, 112634, 16741, 6992, -1, 0, 977638, 3218);
INSERT INTO `npc_respawns` VALUES (25146, -13678, 213770, -3720, -1, 0, 59536, 410);
INSERT INTO `npc_respawns` VALUES (25149, -28203, 145208, -3416, -1, 0, 68069, 518);
INSERT INTO `npc_respawns` VALUES (25152, 44317, 123791, -3104, -1, 0, 109136, 804);
INSERT INTO `npc_respawns` VALUES (25155, 73164, 67144, -3688, -1, 0, 194681, 956);
INSERT INTO `npc_respawns` VALUES (25158, 77463, 5324, -3096, -1, 0, 607976, 1385);
INSERT INTO `npc_respawns` VALUES (25163, 130608, 58931, 3552, -1, 0, 1778065, 2693);
INSERT INTO `npc_respawns` VALUES (25166, -29797, 132470, -3664, 0, 0, 89014, 518);
INSERT INTO `npc_respawns` VALUES (25170, 26912, 121915, -3728, -1, 0, 128997, 894);
INSERT INTO `npc_respawns` VALUES (25173, 79808, 104096, -3384, -1, 0, 190432, 1221);
INSERT INTO `npc_respawns` VALUES (25179, 167073, 53064, -4200, -1, 0, 347449, 2075);
INSERT INTO `npc_respawns` VALUES (25185, 100279, 204388, -3720, -1, 0, 109136, 804);
INSERT INTO `npc_respawns` VALUES (25188, 127722, 215676, -2888, -1, 0, 168742, 658);
INSERT INTO `npc_respawns` VALUES (25189, 128097, 200900, -3544, -1, 0, 103387, 774);
INSERT INTO `npc_respawns` VALUES (25192, 125444, 190458, -3288, -1, 0, 170911, 1115);
INSERT INTO `npc_respawns` VALUES (25208, 110267, 213947, -3560, -1, 0, 144474, 956);
INSERT INTO `npc_respawns` VALUES (25211, 113561, 198194, -3632, -1, 0, 115314, 834);
INSERT INTO `npc_respawns` VALUES (25214, 111438, 209915, -3576, -1, 0, 144474, 956);
INSERT INTO `npc_respawns` VALUES (25226, 104333, -4089, -3392, -1, 0, 768860, 2197);
INSERT INTO `npc_respawns` VALUES (25230, 66513, 46325, -3912, -1, 0, 318683, 1897);
INSERT INTO `npc_respawns` VALUES (25233, 185821, -26565, -2120, -1, 0, 1257198, 2630);
INSERT INTO `npc_respawns` VALUES (25235, 117216, -62741, -3304, -1, 0, 913016, 2822);
INSERT INTO `npc_respawns` VALUES (25238, 154923, 85493, -3480, -1, 0, 338191, 2017);
INSERT INTO `npc_respawns` VALUES (25241, 165787, 88651, -2368, -1, 0, 412317, 1779);
INSERT INTO `npc_respawns` VALUES (25248, 127873, -13313, -3728, -1, 0, 1826035, 2822);
INSERT INTO `npc_respawns` VALUES (25252, 184244, 20318, -3168, 33382, 0, 889033, 2693);
INSERT INTO `npc_respawns` VALUES (25255, 170056, -25026, -3448, -1, 0, 1638607, 2379);
INSERT INTO `npc_respawns` VALUES (25256, 170433, 42654, -4824, -1, 0, 347449, 2075);
INSERT INTO `npc_respawns` VALUES (25260, 93139, 20089, -3592, -1, 0, 259479, 1221);
INSERT INTO `npc_respawns` VALUES (25269, 123701, -23632, -3472, -1, 0, 889033, 2693);
INSERT INTO `npc_respawns` VALUES (25272, 49112, 127849, -3544, -1, 0, 153951, 600);
INSERT INTO `npc_respawns` VALUES (25273, 23902, 119392, -8976, -1, 0, 334947, 1495);
INSERT INTO `npc_respawns` VALUES (25293, 134588, -115271, -1192, -1, 0, 977638, 3218);
INSERT INTO `npc_respawns` VALUES (25299, 148097, -73975, -4904, -1, 0, 715079, 3351);
INSERT INTO `npc_respawns` VALUES (25309, 116388, -39179, -2408, -1, 0, 715079, 3351);
INSERT INTO `npc_respawns` VALUES (25319, 186519, -106234, -6304, -1, 0, 1101457, 3882);
INSERT INTO `npc_respawns` VALUES (25322, 93458, -74722, -1800, -1, 0, 834581, 2441);
INSERT INTO `npc_respawns` VALUES (25325, 90723, -85261, -2728, -1, 0, 889033, 2693);
INSERT INTO `npc_respawns` VALUES (25357, -3700, 112707, -3400, -1, 0, 59536, 410);
INSERT INTO `npc_respawns` VALUES (25360, 28993, 179588, -3608, -1, 0, 70771, 546);
INSERT INTO `npc_respawns` VALUES (25362, -56171, 187541, -3352, -1, 0, 63376, 462);
INSERT INTO `npc_respawns` VALUES (25365, -61646, 190534, -3272, -1, 0, 141543, 546);
INSERT INTO `npc_respawns` VALUES (25366, -62218, 179562, -3560, -1, 0, 63376, 462);
INSERT INTO `npc_respawns` VALUES (25369, -44606, 123068, -2712, -1, 0, 68069, 518);
INSERT INTO `npc_respawns` VALUES (25372, 47843, 243499, -6608, -1, 0, 115808, 384);
INSERT INTO `npc_respawns` VALUES (25373, 9444, 76712, -3808, -1, 0, 59536, 410);
INSERT INTO `npc_respawns` VALUES (25375, 22479, 80605, -3192, -1, 0, 57904, 384);
INSERT INTO `npc_respawns` VALUES (25388, 40129, 102048, -1232, 8192, 0, 109136, 804);
INSERT INTO `npc_respawns` VALUES (25391, 45274, 120611, -2400, -1, 0, 196112, 744);
INSERT INTO `npc_respawns` VALUES (25392, 29535, 106909, -3688, -1, 0, 93120, 716);
INSERT INTO `npc_respawns` VALUES (25394, 129035, 219546, -3560, -1, 0, 257999, 894);
INSERT INTO `npc_respawns` VALUES (25395, 14939, 118973, -12088, -1, 0, 190432, 1221);
INSERT INTO `npc_respawns` VALUES (25398, 4865, 188782, -3592, -1, 0, 109136, 804);
INSERT INTO `npc_respawns` VALUES (25404, 35859, 190988, -3088, -1, 0, 98054, 744);
INSERT INTO `npc_respawns` VALUES (25410, 72402, 125669, -3640, -1, 0, 144474, 956);
INSERT INTO `npc_respawns` VALUES (25415, 128479, 138174, -3400, -1, 0, 144474, 956);
INSERT INTO `npc_respawns` VALUES (25426, -18768, -100329, -2120, -1, 0, 68069, 518);
INSERT INTO `npc_respawns` VALUES (25429, 172579, -214082, -3552, -1, 0, 68069, 518);
INSERT INTO `npc_respawns` VALUES (25431, 79186, 18047, -5136, -1, 0, 180504, 1169);
INSERT INTO `npc_respawns` VALUES (25434, 104019, -17488, -1856, -1, 0, 298041, 1779);
INSERT INTO `npc_respawns` VALUES (25437, 67056, 64529, -3688, -1, 0, 380868, 1221);
INSERT INTO `npc_respawns` VALUES (25438, 106535, 91913, -2168, -1, 0, 180504, 1169);
INSERT INTO `npc_respawns` VALUES (25441, 111600, 83487, -2904, -1, 0, 190432, 1221);
INSERT INTO `npc_respawns` VALUES (25444, 113282, 17772, -4376, -1, 0, 588384, 2379);
INSERT INTO `npc_respawns` VALUES (25447, 113465, 17493, -1408, -1, 0, 646225, 2757);
INSERT INTO `npc_respawns` VALUES (25450, 113634, 15388, 9560, -1, 0, 987884, 3285);
INSERT INTO `npc_respawns` VALUES (25456, 133855, 87103, -3608, -1, 0, 232696, 1441);
INSERT INTO `npc_respawns` VALUES (25460, 150924, 67820, -3624, -1, 0, 254647, 1551);
INSERT INTO `npc_respawns` VALUES (25463, 166441, 67979, -3256, -1, 0, 308488, 1837);
INSERT INTO `npc_respawns` VALUES (25478, 167831, 28776, -3592, -1, 0, 588384, 2379);
INSERT INTO `npc_respawns` VALUES (25493, 82107, 251878, -10592, -1, 0, 298041, 1779);
INSERT INTO `npc_respawns` VALUES (25496, 87730, 258106, -10376, -1, 0, 265642, 1609);
INSERT INTO `npc_respawns` VALUES (25498, 126347, 173876, -3024, -1, 0, 190432, 1221);
INSERT INTO `npc_respawns` VALUES (25501, 48575, -106191, -1568, -14680, 0, 84370, 658);
INSERT INTO `npc_respawns` VALUES (25523, 169058, -59451, -3864, -1, 0, 1848821, 2886);
INSERT INTO `npc_respawns` VALUES (25527, 5202, -11331, -3650, 0, 0, 1609228, 406);
INSERT INTO `npc_respawns` VALUES (25674, 86622, 217031, -3560, -1, 0, 736746, 3558);
INSERT INTO `npc_respawns` VALUES (25677, 82677, 182892, -3640, -1, 0, 744112, 3627);
INSERT INTO `npc_respawns` VALUES (25696, -180132, 175211, -10263, 16723, 0, 1798554, 36562);
INSERT INTO `npc_respawns` VALUES (25697, -174768, 186600, -15130, 51311, 0, 14864086, 36562);
INSERT INTO `npc_respawns` VALUES (25698, -213006, 175614, -11953, 16141, 0, 1486407, 36562);
INSERT INTO `npc_respawns` VALUES (25725, 148482, 117859, -3712, 36584, 0, 6185159, 27241);
INSERT INTO `npc_respawns` VALUES (25726, 145734, 120031, -3912, 15243, 0, 6185159, 27241);
INSERT INTO `npc_respawns` VALUES (25775, 213715, 115261, -856, 0, 0, 4111532, 45645);
INSERT INTO `npc_respawns` VALUES (25875, -17793, 12536, -3296, 7324, 0, 3042199, 45645);
INSERT INTO `npc_respawns` VALUES (25886, 48986, 145825, -3592, 0, 0, 3533884, 45645);
INSERT INTO `npc_respawns` VALUES (25887, 43883, 145950, -3696, 0, 0, 3533884, 45645);
INSERT INTO `npc_respawns` VALUES (25892, 44961, 155943, -1052, 0, 0, 9264413, 45645);
INSERT INTO `npc_respawns` VALUES (25902, -103672, 48392, -1498, 13361, 0, 3248142, 34542);
INSERT INTO `npc_respawns` VALUES (25922, 17819, -149959, -64, 0, 0, 23023279, 94294);
INSERT INTO `npc_respawns` VALUES (25928, 16278, -119509, -880, 25269, 0, 5116284, 94294);
INSERT INTO `npc_respawns` VALUES (25929, 16125, -119266, -872, 50450, 0, 5116284, 94294);
INSERT INTO `npc_respawns` VALUES (25930, 16086, -119455, -880, 7324, 0, 5116284, 94294);
INSERT INTO `npc_respawns` VALUES (25931, 16037, -119436, -880, 38391, 0, 5116284, 94294);
INSERT INTO `npc_respawns` VALUES (25932, -13255, 46299, -3648, 0, 0, 41235565, 75347);
INSERT INTO `npc_respawns` VALUES (25933, 206842, 108263, -2125, 0, 0, 48998763, 85382);
INSERT INTO `npc_respawns` VALUES (25937, -84084, 59598, -2608, 0, 0, 54247281, 88320);
INSERT INTO `npc_respawns` VALUES (25945, -23912, -91528, -3617, 0, 0, 56685420, 139183);
INSERT INTO `npc_respawns` VALUES (25946, -40696, -116632, -1924, 0, 0, 48182606, 139183);
INSERT INTO `npc_respawns` VALUES (25947, -14683, -96518, -2215, 0, 0, 48182606, 139183);
INSERT INTO `npc_respawns` VALUES (25948, -16185, -80297, -3408, 0, 0, 48182606, 139183);
INSERT INTO `npc_respawns` VALUES (25949, 296, -104472, -2536, 0, 0, 48182606, 139183);
INSERT INTO `npc_respawns` VALUES (25950, -2787, -72803, -3690, 0, 0, 48182606, 139183);
INSERT INTO `npc_respawns` VALUES (25956, -124702, 51903, -560, 0, 0, 56685420, 139183);
INSERT INTO `npc_respawns` VALUES (25957, -121987, 63234, -2513, 0, 0, 48182606, 139183);
INSERT INTO `npc_respawns` VALUES (25958, -122520, 89411, -3690, 0, 0, 48182606, 139183);
INSERT INTO `npc_respawns` VALUES (25959, -107880, 79368, -3283, 0, 0, 48182606, 139183);
INSERT INTO `npc_respawns` VALUES (25960, -113110, 62908, -2656, 0, 0, 48182606, 139183);
INSERT INTO `npc_respawns` VALUES (25961, -100696, 60376, -3480, 0, 0, 48182606, 139183);
INSERT INTO `npc_respawns` VALUES (25967, 84181, 126004, -2605, 0, 0, 52069755, 136936);
INSERT INTO `npc_respawns` VALUES (25968, 77803, 128084, -3460, 0, 0, 44259292, 136936);
INSERT INTO `npc_respawns` VALUES (25969, 123743, 137792, -3344, 0, 0, 44259292, 136936);
INSERT INTO `npc_respawns` VALUES (25970, 108856, 131159, -3216, 0, 0, 44259292, 136936);
INSERT INTO `npc_respawns` VALUES (25971, 99085, 133654, -3558, 0, 0, 44259292, 136936);
INSERT INTO `npc_respawns` VALUES (25972, 92712, 132733, -3668, 0, 0, 44259292, 136936);
INSERT INTO `npc_respawns` VALUES (25978, 28221, 106046, -3664, 0, 0, 52069755, 136936);
INSERT INTO `npc_respawns` VALUES (25979, 4166, 119041, -3696, 0, 0, 44259292, 136936);
INSERT INTO `npc_respawns` VALUES (25980, 5714, 107488, -3631, 0, 0, 44259292, 136936);
INSERT INTO `npc_respawns` VALUES (25981, 18266, 100841, -3662, 0, 0, 44259292, 136936);
INSERT INTO `npc_respawns` VALUES (25982, 30603, 116129, -3656, 0, 0, 44259292, 136936);
INSERT INTO `npc_respawns` VALUES (25983, 22439, 128099, -3531, 0, 0, 44259292, 136936);
INSERT INTO `npc_respawns` VALUES (25989, 20072, 39784, -3542, 0, 0, 43557442, 128072);
INSERT INTO `npc_respawns` VALUES (25990, 31390, 47554, -3708, 0, 0, 30490210, 128072);
INSERT INTO `npc_respawns` VALUES (25991, 36040, 61416, -3634, 0, 0, 30490210, 128072);
INSERT INTO `npc_respawns` VALUES (25992, 31946, 56184, -3536, 0, 0, 30490210, 128072);
INSERT INTO `npc_respawns` VALUES (25993, 30859, 40926, -2992, 0, 0, 30490210, 128072);
INSERT INTO `npc_respawns` VALUES (25994, 22536, 62904, -3266, 0, 0, 30490210, 128072);
INSERT INTO `npc_respawns` VALUES (26000, -96712, 109912, -3479, 0, 0, 43746874, 125886);
INSERT INTO `npc_respawns` VALUES (26001, -98930, 115921, -3296, 0, 0, 30622812, 125886);
INSERT INTO `npc_respawns` VALUES (26002, -101496, 110216, -3227, 0, 0, 30622812, 125886);
INSERT INTO `npc_respawns` VALUES (26003, -99016, 101784, -3509, 0, 0, 30622812, 125886);
INSERT INTO `npc_respawns` VALUES (26004, -90648, 96856, -3607, 0, 0, 30622812, 125886);
INSERT INTO `npc_respawns` VALUES (26005, -86216, 100152, -3470, 0, 0, 30622812, 125886);
INSERT INTO `npc_respawns` VALUES (26011, -28174, 48100, -3685, 0, 0, 38196049, 117262);
INSERT INTO `npc_respawns` VALUES (26012, -28305, 18075, -3605, 0, 0, 26737235, 117262);
INSERT INTO `npc_respawns` VALUES (26013, -8171, 18964, -3247, 0, 0, 26737235, 117262);
INSERT INTO `npc_respawns` VALUES (26014, -7611, 36017, -3643, 0, 0, 26737235, 117262);
INSERT INTO `npc_respawns` VALUES (26015, -30528, 32318, -3346, 0, 0, 26737235, 117262);
INSERT INTO `npc_respawns` VALUES (26016, -11966, 54128, -3652, 0, 0, 26737235, 117262);
INSERT INTO `npc_respawns` VALUES (26022, 187456, 7840, -2730, 0, 0, 56685420, 139183);
INSERT INTO `npc_respawns` VALUES (26023, 185844, 29433, -3633, 0, 0, 48182606, 139183);
INSERT INTO `npc_respawns` VALUES (26024, 176223, 30609, -3828, 0, 0, 48182606, 139183);
INSERT INTO `npc_respawns` VALUES (26025, 163040, 23307, -3699, 0, 0, 48182606, 139183);
INSERT INTO `npc_respawns` VALUES (26026, 168792, 5011, -2743, 0, 0, 48182606, 139183);
INSERT INTO `npc_respawns` VALUES (26027, 176458, 6064, -2731, 0, 0, 48182606, 139183);
INSERT INTO `npc_respawns` VALUES (26033, 94712, -84407, -3750, 0, 0, 56685420, 139183);
INSERT INTO `npc_respawns` VALUES (26034, 69109, -87204, -2878, 0, 0, 48182606, 139183);
INSERT INTO `npc_respawns` VALUES (26035, 77305, -92857, -3342, 0, 0, 48182606, 139183);
INSERT INTO `npc_respawns` VALUES (26036, 92226, -79863, -3654, 0, 0, 48182606, 139183);
INSERT INTO `npc_respawns` VALUES (26037, 87812, -76106, -3430, 0, 0, 48182606, 139183);
INSERT INTO `npc_respawns` VALUES (26038, 74443, -71152, -3606, 0, 0, 48182606, 139183);
INSERT INTO `npc_respawns` VALUES (26044, 93024, 168839, -3663, 0, 0, 57437772, 151054);
INSERT INTO `npc_respawns` VALUES (26045, 96205, 223933, -3288, 0, 0, 48822106, 151054);
INSERT INTO `npc_respawns` VALUES (26046, 94606, 203650, -3418, 0, 0, 48822106, 151054);
INSERT INTO `npc_respawns` VALUES (26047, 81059, 196464, -3100, 0, 0, 48822106, 151054);
INSERT INTO `npc_respawns` VALUES (26048, 72080, 211021, -3288, 0, 0, 48822106, 151054);
INSERT INTO `npc_respawns` VALUES (26049, 93819, 183224, -3682, 0, 0, 48822106, 151054);
INSERT INTO `npc_respawns` VALUES (26055, 205950, 79733, 474, 0, 0, 43557442, 128072);
INSERT INTO `npc_respawns` VALUES (26056, 205859, 72285, 834, 0, 0, 30490210, 128072);
INSERT INTO `npc_respawns` VALUES (26057, 210732, 77108, 850, 0, 0, 30490210, 128072);
INSERT INTO `npc_respawns` VALUES (26058, 219266, 79060, 1018, 0, 0, 30490210, 128072);
INSERT INTO `npc_respawns` VALUES (26059, 215061, 73433, 1018, 0, 0, 30490210, 128072);
INSERT INTO `npc_respawns` VALUES (26060, 222295, 73705, 1290, 0, 0, 30490210, 128072);
INSERT INTO `npc_respawns` VALUES (26066, 137486, -54520, -3254, 0, 0, 48349966, 130271);
INSERT INTO `npc_respawns` VALUES (26067, 143854, -63062, -3414, 0, 0, 33844976, 130271);
INSERT INTO `npc_respawns` VALUES (26068, 157761, -56929, -3146, 0, 0, 33844976, 130271);
INSERT INTO `npc_respawns` VALUES (26069, 154887, -44396, -3711, 0, 0, 33844976, 130271);
INSERT INTO `npc_respawns` VALUES (26070, 147983, -38919, -2280, 0, 0, 33844976, 130271);
INSERT INTO `npc_respawns` VALUES (26071, 137683, -49225, -3296, 0, 0, 33844976, 130271);
INSERT INTO `npc_respawns` VALUES (26077, -26276, 118990, -3721, 0, 0, 38196049, 117262);
INSERT INTO `npc_respawns` VALUES (26078, -27523, 108214, -3726, 0, 0, 26737235, 117262);
INSERT INTO `npc_respawns` VALUES (26079, -28698, 95381, -3604, 0, 0, 26737235, 117262);
INSERT INTO `npc_respawns` VALUES (26080, -38715, 97425, -3681, 0, 0, 26737235, 117262);
INSERT INTO `npc_respawns` VALUES (26081, -48092, 103434, -2983, 0, 0, 26737235, 117262);
INSERT INTO `npc_respawns` VALUES (26082, -51325, 97679, -3726, 0, 0, 26737235, 117262);
INSERT INTO `npc_respawns` VALUES (26131, -50592, 83219, -5129, 0, 0, 20010584, 100220);
INSERT INTO `npc_respawns` VALUES (26137, 191869, 56112, -7626, 34264, 0, 33901549, 98859);
INSERT INTO `npc_respawns` VALUES (26162, 140047, 183193, -3680, 0, 0, 63818704, 145722);
INSERT INTO `npc_respawns` VALUES (26163, 147954, 189880, -3720, 0, 0, 54245899, 145722);
INSERT INTO `npc_respawns` VALUES (26164, 160156, 181936, -3624, 0, 0, 54245899, 145722);
INSERT INTO `npc_respawns` VALUES (26165, 156105, 190695, -3712, 0, 0, 54245899, 145722);
INSERT INTO `npc_respawns` VALUES (26170, 137801, 162885, -2840, 0, 0, 63818704, 145722);
INSERT INTO `npc_respawns` VALUES (26171, 136250, 177036, -3360, 0, 0, 54245899, 145722);
INSERT INTO `npc_respawns` VALUES (26172, 144655, 161851, -2496, 0, 0, 54245899, 145722);
INSERT INTO `npc_respawns` VALUES (26173, 157277, 169834, -3504, 0, 0, 54245899, 145722);
INSERT INTO `npc_respawns` VALUES (26178, -34495, 38072, -3328, 0, 0, 52039390, 153020);
INSERT INTO `npc_respawns` VALUES (26179, -34434, 48018, -2832, 0, 0, 44233482, 153020);
INSERT INTO `npc_respawns` VALUES (26180, -37071, 55891, -2728, 0, 0, 44233482, 153020);
INSERT INTO `npc_respawns` VALUES (26181, -39351, 60750, -3376, 0, 0, 44233482, 153020);
INSERT INTO `npc_respawns` VALUES (26186, -57560, 66816, -3336, 0, 0, 52039390, 153020);
INSERT INTO `npc_respawns` VALUES (26187, -64939, 81990, -3376, 0, 0, 44233482, 153020);
INSERT INTO `npc_respawns` VALUES (26188, -64076, 73510, -3312, 0, 0, 44233482, 153020);
INSERT INTO `npc_respawns` VALUES (26189, -57562, 86979, -3600, 0, 0, 44233482, 153020);
INSERT INTO `npc_respawns` VALUES (26277, -24826, 203633, -3664, 44136, 0, 95869008, 238963);
INSERT INTO `npc_respawns` VALUES (26278, -26640, 196289, -3920, 44136, 0, 81488656, 238963);
INSERT INTO `npc_respawns` VALUES (26279, -43187, 188704, -3632, 44136, 0, 81488656, 238963);
INSERT INTO `npc_respawns` VALUES (26280, -35199, 175211, -4264, 48247, 0, 81488656, 238963);
INSERT INTO `npc_respawns` VALUES (26285, -29304, 168824, -3856, 30190, 0, 95869008, 238963);
INSERT INTO `npc_respawns` VALUES (26286, -15909, 183768, -3872, 40959, 0, 81488656, 238963);
INSERT INTO `npc_respawns` VALUES (26287, -7109, 187914, -3664, 34435, 0, 81488656, 238963);
INSERT INTO `npc_respawns` VALUES (26288, -6162, 196265, -3608, 37878, 0, 81488656, 238963);
INSERT INTO `npc_respawns` VALUES (26293, 51823, -44516, -3088, 54396, 0, 61481477, 253341);
INSERT INTO `npc_respawns` VALUES (26294, 56539, -59032, -3664, 34849, 0, 52259255, 253341);
INSERT INTO `npc_respawns` VALUES (26295, 59833, -51040, -2856, 41966, 0, 52259255, 253341);
INSERT INTO `npc_respawns` VALUES (26296, 55141, -43819, -2896, 46249, 0, 52259255, 253341);
INSERT INTO `npc_respawns` VALUES (26301, 70996, -39400, -3152, 47854, 0, 61481477, 253341);
INSERT INTO `npc_respawns` VALUES (26302, 83554, -43810, -3088, 0, 0, 52259255, 253341);
INSERT INTO `npc_respawns` VALUES (26303, 93257, -57418, -2936, 0, 0, 52259255, 253341);
INSERT INTO `npc_respawns` VALUES (26304, 83929, -64631, -1944, 0, 0, 52259255, 253341);
INSERT INTO `npc_respawns` VALUES (26372, 40071, 22668, -3856, 0, 0, 64965279, 279306);
INSERT INTO `npc_respawns` VALUES (26373, 51144, 8148, -4312, 0, 0, 64965279, 279306);
INSERT INTO `npc_respawns` VALUES (26374, 63931, 16466, -3632, 0, 0, 64965279, 279306);
INSERT INTO `npc_respawns` VALUES (26375, 56132, 27675, -5072, 0, 0, 64965279, 279306);
INSERT INTO `npc_respawns` VALUES (26380, 42137, 32305, -3712, 0, 0, 64965279, 279306);
INSERT INTO `npc_respawns` VALUES (26381, 58585, 52418, -3600, 0, 0, 64965279, 279306);
INSERT INTO `npc_respawns` VALUES (26382, 40509, 56767, -3208, 0, 0, 64965279, 279306);
INSERT INTO `npc_respawns` VALUES (26383, 39273, 41983, -3352, 0, 0, 64965279, 279306);
INSERT INTO `npc_respawns` VALUES (29062, -16387, -51955, -10600, 16384, 0, 36816713, 94294);
INSERT INTO `npc_respawns` VALUES (29095, 147408, -43552, -2328, 0, 0, 2289998, 4106);
INSERT INTO `npc_respawns` VALUES (29374, 185158, 252209, -3384, 0, 0, 324795321, 196555);

-- ----------------------------
-- Table structure for olympiad_data
-- ----------------------------
DROP TABLE IF EXISTS `olympiad_data`;
CREATE TABLE `olympiad_data`  (
  `id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `current_cycle` mediumint(8) UNSIGNED NOT NULL DEFAULT 1,
  `period` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `olympiad_end` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  `validation_end` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  `next_weekly_change` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of olympiad_data
-- ----------------------------
INSERT INTO `olympiad_data` VALUES (0, 1, 0, 1745985600944, 0, 1744711967952);

-- ----------------------------
-- Table structure for olympiad_fights
-- ----------------------------
DROP TABLE IF EXISTS `olympiad_fights`;
CREATE TABLE `olympiad_fights`  (
  `charOneId` int(10) UNSIGNED NOT NULL,
  `charTwoId` int(10) UNSIGNED NOT NULL,
  `charOneClass` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `charTwoClass` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `winner` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `start` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  `time` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  `classed` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  INDEX `charOneId`(`charOneId`) USING BTREE,
  INDEX `charTwoId`(`charTwoId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of olympiad_fights
-- ----------------------------

-- ----------------------------
-- Table structure for olympiad_nobles
-- ----------------------------
DROP TABLE IF EXISTS `olympiad_nobles`;
CREATE TABLE `olympiad_nobles`  (
  `charId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `class_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `olympiad_points` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `competitions_done` smallint(3) UNSIGNED NOT NULL DEFAULT 0,
  `competitions_won` smallint(3) UNSIGNED NOT NULL DEFAULT 0,
  `competitions_lost` smallint(3) UNSIGNED NOT NULL DEFAULT 0,
  `competitions_drawn` smallint(3) UNSIGNED NOT NULL DEFAULT 0,
  `competitions_done_week` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`charId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of olympiad_nobles
-- ----------------------------

-- ----------------------------
-- Table structure for olympiad_nobles_eom
-- ----------------------------
DROP TABLE IF EXISTS `olympiad_nobles_eom`;
CREATE TABLE `olympiad_nobles_eom`  (
  `charId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `class_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `olympiad_points` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `competitions_done` smallint(3) UNSIGNED NOT NULL DEFAULT 0,
  `competitions_won` smallint(3) UNSIGNED NOT NULL DEFAULT 0,
  `competitions_lost` smallint(3) UNSIGNED NOT NULL DEFAULT 0,
  `competitions_drawn` smallint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`charId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of olympiad_nobles_eom
-- ----------------------------

-- ----------------------------
-- Table structure for party_matching_history
-- ----------------------------
DROP TABLE IF EXISTS `party_matching_history`;
CREATE TABLE `party_matching_history`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(21) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `leader` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of party_matching_history
-- ----------------------------

-- ----------------------------
-- Table structure for petition_feedback
-- ----------------------------
DROP TABLE IF EXISTS `petition_feedback`;
CREATE TABLE `petition_feedback`  (
  `charName` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `gmName` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `rate` tinyint(1) UNSIGNED NOT NULL DEFAULT 2,
  `message` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `date` bigint(13) UNSIGNED NOT NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of petition_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for pets
-- ----------------------------
DROP TABLE IF EXISTS `pets`;
CREATE TABLE `pets`  (
  `item_obj_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `level` smallint(2) UNSIGNED NOT NULL,
  `curHp` int(9) UNSIGNED NULL DEFAULT 0,
  `curMp` int(9) UNSIGNED NULL DEFAULT 0,
  `exp` bigint(20) UNSIGNED NULL DEFAULT 0,
  `sp` bigint(10) UNSIGNED NULL DEFAULT 0,
  `fed` int(10) UNSIGNED NULL DEFAULT 0,
  `ownerId` int(10) NOT NULL DEFAULT 0,
  `restore` enum('true','false') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'false',
  PRIMARY KEY (`item_obj_id`) USING BTREE,
  INDEX `ownerId`(`ownerId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pets
-- ----------------------------

-- ----------------------------
-- Table structure for pledge_applicant
-- ----------------------------
DROP TABLE IF EXISTS `pledge_applicant`;
CREATE TABLE `pledge_applicant`  (
  `charId` int(10) NOT NULL,
  `clanId` int(10) NOT NULL,
  `karma` tinyint(1) NOT NULL,
  `message` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`charId`, `clanId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pledge_applicant
-- ----------------------------

-- ----------------------------
-- Table structure for pledge_recruit
-- ----------------------------
DROP TABLE IF EXISTS `pledge_recruit`;
CREATE TABLE `pledge_recruit`  (
  `clan_id` int(10) NOT NULL,
  `karma` tinyint(1) NOT NULL,
  `information` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `detailed_information` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `application_type` tinyint(1) NOT NULL,
  `recruit_type` tinyint(1) NOT NULL,
  PRIMARY KEY (`clan_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pledge_recruit
-- ----------------------------

-- ----------------------------
-- Table structure for pledge_waiting_list
-- ----------------------------
DROP TABLE IF EXISTS `pledge_waiting_list`;
CREATE TABLE `pledge_waiting_list`  (
  `char_id` int(10) NOT NULL,
  `karma` tinyint(1) NOT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pledge_waiting_list
-- ----------------------------

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts`  (
  `post_id` int(8) NOT NULL DEFAULT 0,
  `post_owner_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `post_ownerid` int(8) NOT NULL DEFAULT 0,
  `post_date` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  `post_topic_id` int(8) NOT NULL DEFAULT 0,
  `post_forum_id` int(8) NOT NULL DEFAULT 0,
  `post_txt` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  INDEX `post_forum_id`(`post_forum_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of posts
-- ----------------------------

-- ----------------------------
-- Table structure for punishments
-- ----------------------------
DROP TABLE IF EXISTS `punishments`;
CREATE TABLE `punishments`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `affect` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `expiration` bigint(20) NOT NULL,
  `reason` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `punishedBy` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of punishments
-- ----------------------------

-- ----------------------------
-- Table structure for residence_functions
-- ----------------------------
DROP TABLE IF EXISTS `residence_functions`;
CREATE TABLE `residence_functions`  (
  `id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `expiration` bigint(20) NOT NULL,
  `residenceId` int(11) NOT NULL,
  PRIMARY KEY (`id`, `level`, `residenceId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of residence_functions
-- ----------------------------

-- ----------------------------
-- Table structure for siege_clans
-- ----------------------------
DROP TABLE IF EXISTS `siege_clans`;
CREATE TABLE `siege_clans`  (
  `castle_id` int(1) NOT NULL DEFAULT 0,
  `clan_id` int(11) NOT NULL DEFAULT 0,
  `type` int(1) NULL DEFAULT NULL,
  `castle_owner` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`clan_id`, `castle_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of siege_clans
-- ----------------------------

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic`  (
  `topic_id` int(8) NOT NULL DEFAULT 0,
  `topic_forum_id` int(8) NOT NULL DEFAULT 0,
  `topic_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `topic_date` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  `topic_ownername` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `topic_ownerid` int(8) NOT NULL DEFAULT 0,
  `topic_type` int(8) NOT NULL DEFAULT 0,
  `topic_reply` int(8) NOT NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of topic
-- ----------------------------

-- ----------------------------
-- Table structure for underground_coliseum
-- ----------------------------
DROP TABLE IF EXISTS `underground_coliseum`;
CREATE TABLE `underground_coliseum`  (
  `arenaId` int(1) UNSIGNED NOT NULL,
  `leader` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `wins` int(5) NOT NULL DEFAULT 0,
  PRIMARY KEY (`arenaId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of underground_coliseum
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
