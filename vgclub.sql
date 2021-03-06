/*
 Navicat Premium Data Transfer

 Source Server         : NetWorkVvv
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : vgclub

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 25/09/2021 13:09:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for avatar
-- ----------------------------
DROP TABLE IF EXISTS `avatar`;
CREATE TABLE `avatar`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mimetype` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `size` int(0) NULL DEFAULT NULL,
  `user_id` int(0) NULL DEFAULT NULL,
  `createAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updateAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `filename`(`filename`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `avatar_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of avatar
-- ----------------------------
INSERT INTO `avatar` VALUES (1, 'd18e42011ae241ec22c8cd84645d1fdd', 'image/jpeg', 3133706, 1, '2021-07-03 11:20:51', '2021-07-03 11:20:51');
INSERT INTO `avatar` VALUES (2, 'e1194eacd00bffb11e459d4797325509', 'image/jpeg', 3534736, 10, '2021-07-03 11:22:27', '2021-07-03 11:22:27');
INSERT INTO `avatar` VALUES (3, 'f4ce150a46ebd1c4949731c924001c1c', 'image/jpeg', 2188040, 5, '2021-07-03 11:24:47', '2021-07-03 11:24:47');
INSERT INTO `avatar` VALUES (4, 'c8f8b8b2b22e68d2fee255a789450379', 'image/jpeg', 4517012, 6, '2021-07-03 11:25:03', '2021-07-03 11:25:03');
INSERT INTO `avatar` VALUES (5, 'd5259aa36e18317e390340c3dabf00a2', 'image/jpeg', 4622503, 7, '2021-07-03 11:25:25', '2021-07-03 11:25:25');
INSERT INTO `avatar` VALUES (6, '6d691ff793423e3e25e15e41055d1d61', 'image/jpeg', 154441, 7, '2021-07-03 18:59:47', '2021-07-03 18:59:47');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `moment_id` int(0) NOT NULL,
  `user_id` int(0) NOT NULL,
  `comment_id` int(0) NULL DEFAULT NULL,
  `createAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updateAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `moment_id`(`moment_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `comment_id`(`comment_id`) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`moment_id`) REFERENCES `moment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 'TypeScript???JavaScript?????????', 1, 4, NULL, '2021-06-16 20:49:49', '2021-06-16 20:51:37');
INSERT INTO `comment` VALUES (2, 'Vue/React????????????', 1, 4, NULL, '2021-06-16 20:49:49', '2021-06-19 10:46:53');
INSERT INTO `comment` VALUES (3, '???????????????/uniapp', 2, 5, 2, '2021-06-16 20:49:49', '2021-06-19 13:31:58');
INSERT INTO `comment` VALUES (4, '????????????/?????????', 2, 5, NULL, '2021-06-16 20:49:49', '2021-06-19 10:47:09');
INSERT INTO `comment` VALUES (5, 'AJAX/JQuery', 3, 6, 1, '2021-06-16 20:49:49', '2021-06-19 10:47:10');
INSERT INTO `comment` VALUES (6, 'Less/stylus', 3, 7, 5, '2021-06-16 20:49:49', '2021-06-16 20:51:48');
INSERT INTO `comment` VALUES (7, 'TypeScript?????????Nice!`', 4, 8, NULL, '2021-06-17 15:40:44', '2021-06-19 10:47:54');

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mimetype` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `size` int(0) NULL DEFAULT NULL,
  `moment_id` int(0) NULL DEFAULT NULL,
  `user_id` int(0) NULL DEFAULT NULL,
  `createAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updateAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `filename`(`filename`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `moment_id`(`moment_id`) USING BTREE,
  CONSTRAINT `file_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `file_ibfk_2` FOREIGN KEY (`moment_id`) REFERENCES `moment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES (1, 'ac27eee48c99d8d96e513f40df611006', 'image/jpeg', 2294011, 1, 7, '2021-07-03 19:12:20', '2021-07-03 19:12:20');
INSERT INTO `file` VALUES (2, '68d45ac2ec1de60484d7e63de66d8642', 'image/jpeg', 1307453, 1, 7, '2021-07-03 19:12:20', '2021-07-03 19:12:20');

-- ----------------------------
-- Table structure for label
-- ----------------------------
DROP TABLE IF EXISTS `label`;
CREATE TABLE `label`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `createAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updateAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of label
-- ----------------------------
INSERT INTO `label` VALUES (1, 'JavaScript', '2021-06-17 16:12:01', '2021-06-17 16:12:01');
INSERT INTO `label` VALUES (2, 'TypeScript', '2021-06-17 16:12:08', '2021-06-17 16:12:08');
INSERT INTO `label` VALUES (3, 'NodeJS', '2021-06-17 16:12:23', '2021-06-17 16:12:23');
INSERT INTO `label` VALUES (4, 'Vue', '2021-06-17 16:12:28', '2021-06-17 16:12:28');
INSERT INTO `label` VALUES (5, 'React', '2021-06-17 16:12:32', '2021-06-17 16:12:32');
INSERT INTO `label` VALUES (6, 'ECMAScript', '2021-06-17 16:13:05', '2021-06-17 16:13:05');
INSERT INTO `label` VALUES (7, 'JQuery', '2021-06-17 16:14:08', '2021-06-17 16:14:08');
INSERT INTO `label` VALUES (8, 'UNIAPP', '2021-06-17 16:15:03', '2021-06-17 16:15:03');
INSERT INTO `label` VALUES (9, '??????', '2021-06-17 22:21:11', '2021-06-17 22:21:11');
INSERT INTO `label` VALUES (10, '??????', '2021-06-17 22:21:11', '2021-06-17 22:21:11');
INSERT INTO `label` VALUES (11, '??????', '2021-06-17 22:21:11', '2021-06-17 22:26:36');
INSERT INTO `label` VALUES (12, '??????', '2021-06-17 22:33:45', '2021-06-17 22:33:45');
INSERT INTO `label` VALUES (13, '??????', '2021-06-17 22:33:59', '2021-06-17 22:33:59');
INSERT INTO `label` VALUES (14, '????????????', '2021-06-18 10:08:55', '2021-06-18 10:09:30');

-- ----------------------------
-- Table structure for moment
-- ----------------------------
DROP TABLE IF EXISTS `moment`;
CREATE TABLE `moment`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` int(0) NOT NULL,
  `createAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updateAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `moment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of moment
-- ----------------------------
INSERT INTO `moment` VALUES (1, 'JavaScript????????????????????????', 7, '2021-06-14 00:05:01', '2021-06-14 00:05:01');
INSERT INTO `moment` VALUES (2, '??????????????????', 8, '2021-06-14 00:05:09', '2021-06-16 20:52:14');
INSERT INTO `moment` VALUES (3, '????????????????????????????????????', 9, '2021-06-14 00:07:39', '2021-06-14 00:07:39');
INSERT INTO `moment` VALUES (4, '??????????????????????????????????????????', 2, '2021-06-14 00:08:18', '2021-06-14 16:21:21');
INSERT INTO `moment` VALUES (5, '???????????????', 1, '2021-06-14 00:10:56', '2021-06-14 16:21:24');
INSERT INTO `moment` VALUES (6, '???????????????', 1, '2021-06-14 11:34:39', '2021-06-14 16:21:25');
INSERT INTO `moment` VALUES (7, '???????????????', 1, '2021-06-14 11:36:07', '2021-06-14 16:21:29');
INSERT INTO `moment` VALUES (8, '???????????????', 1, '2021-06-14 14:41:29', '2021-06-14 16:45:00');
INSERT INTO `moment` VALUES (9, '????????????????????????', 3, '2021-06-14 14:47:50', '2021-06-16 20:52:29');
INSERT INTO `moment` VALUES (10, '????????????????????????????????????', 5, '2021-06-14 14:52:06', '2021-06-14 16:45:12');
INSERT INTO `moment` VALUES (11, '????????????????????????????????????', 5, '2021-06-14 14:52:16', '2021-06-14 16:45:15');
INSERT INTO `moment` VALUES (12, '????????????????????????????????????', 5, '2021-06-14 16:34:21', '2021-06-14 16:45:20');
INSERT INTO `moment` VALUES (13, '????????????????????????????????????', 5, '2021-06-14 16:34:58', '2021-06-14 16:45:22');
INSERT INTO `moment` VALUES (14, '?????????????????????????????????????????????????????????', 6, '2021-06-14 16:38:18', '2021-06-14 16:38:18');
INSERT INTO `moment` VALUES (15, '?????????????????????????????????????????????????????????', 6, '2021-06-14 16:38:19', '2021-06-14 16:38:19');
INSERT INTO `moment` VALUES (16, '????????????????????????????????????????????????', 6, '2021-06-14 16:38:19', '2021-06-14 16:38:19');
INSERT INTO `moment` VALUES (17, '????????????????????????????????????????????????', 6, '2021-06-14 16:38:19', '2021-06-14 16:38:19');
INSERT INTO `moment` VALUES (18, '????????????????????????????????????????????????', 7, '2021-06-14 16:38:19', '2021-06-14 16:38:19');
INSERT INTO `moment` VALUES (19, '????????????????????????????????????????????????', 7, '2021-06-14 16:38:19', '2021-06-14 16:38:19');
INSERT INTO `moment` VALUES (20, '??????????????????????????????????????????', 7, '2021-06-14 16:38:20', '2021-06-14 16:38:20');
INSERT INTO `moment` VALUES (21, '????????????????????????????????????????????????', 7, '2021-06-14 16:38:20', '2021-06-15 15:23:24');
INSERT INTO `moment` VALUES (22, '????????????????????????????????????????????????', 8, '2021-06-14 16:43:14', '2021-06-14 16:43:14');
INSERT INTO `moment` VALUES (23, '????????????????????????????????????????????????', 8, '2021-06-14 16:43:14', '2021-06-14 16:43:14');
INSERT INTO `moment` VALUES (24, '????????????????????????????????????????????????', 8, '2021-06-14 16:43:14', '2021-06-14 16:43:14');
INSERT INTO `moment` VALUES (25, '????????????????????????????????????????????????????????????????????????', 8, '2021-06-14 16:43:14', '2021-06-14 16:43:14');
INSERT INTO `moment` VALUES (26, '????????????????????????????????????????????????', 9, '2021-06-14 16:43:14', '2021-06-14 16:43:14');
INSERT INTO `moment` VALUES (27, '????????????????????????????????????????????????', 9, '2021-06-14 16:43:14', '2021-06-14 16:43:14');
INSERT INTO `moment` VALUES (28, '????????????????????????????????????????????????', 9, '2021-06-14 16:43:14', '2021-06-14 16:43:14');
INSERT INTO `moment` VALUES (29, '????????????????????????????????????????????????', 9, '2021-06-14 16:43:15', '2021-06-14 16:43:15');
INSERT INTO `moment` VALUES (30, '????????????????????????????????????????????????', 1, '2021-06-14 16:43:15', '2021-06-14 16:43:15');
INSERT INTO `moment` VALUES (31, '????????????????????????????????????????????????', 1, '2021-06-14 16:43:15', '2021-06-14 16:43:15');
INSERT INTO `moment` VALUES (32, '????????????????????????????????????????????????', 1, '2021-06-14 16:43:15', '2021-06-14 16:43:15');
INSERT INTO `moment` VALUES (33, '????????????????????????????????????????????????', 1, '2021-06-14 16:43:15', '2021-06-14 16:43:15');
INSERT INTO `moment` VALUES (34, '????????????????????????????????????????????????', 2, '2021-06-14 16:43:15', '2021-06-14 16:43:15');
INSERT INTO `moment` VALUES (35, '????????????????????????????????????????????????', 2, '2021-06-14 16:43:15', '2021-06-14 16:43:15');
INSERT INTO `moment` VALUES (36, '????????????????????????????????????????????????', 2, '2021-06-14 16:43:16', '2021-06-14 16:43:16');
INSERT INTO `moment` VALUES (37, '????????????????????????????????????????????????', 2, '2021-06-14 16:43:16', '2021-06-14 16:43:16');
INSERT INTO `moment` VALUES (38, '????????????????????????????????????????????????', 3, '2021-06-14 16:43:16', '2021-06-14 16:43:16');
INSERT INTO `moment` VALUES (39, '????????????????????????????????????????????????', 3, '2021-06-14 16:43:16', '2021-06-14 16:43:16');
INSERT INTO `moment` VALUES (40, '????????????????????????????????????????????????', 3, '2021-06-14 16:43:16', '2021-06-14 16:43:16');
INSERT INTO `moment` VALUES (41, '????????????????????????????????????????????????', 3, '2021-06-14 16:43:16', '2021-06-14 16:43:16');
INSERT INTO `moment` VALUES (42, '????????????????????????????????????????????????', 4, '2021-06-14 16:47:32', '2021-06-14 16:47:32');
INSERT INTO `moment` VALUES (43, '????????????????????????????????????????????????', 4, '2021-06-14 16:47:33', '2021-06-14 16:47:33');
INSERT INTO `moment` VALUES (44, '????????????????????????????????????', 4, '2021-06-14 16:47:33', '2021-06-14 16:47:33');
INSERT INTO `moment` VALUES (45, 'Update JavaScript??????????????????????????? ', 4, '2021-06-14 16:47:33', '2021-06-15 20:53:21');
INSERT INTO `moment` VALUES (49, '????????????????????????????????????', 4, '2021-06-17 15:55:34', '2021-06-17 15:55:34');

-- ----------------------------
-- Table structure for moment_label
-- ----------------------------
DROP TABLE IF EXISTS `moment_label`;
CREATE TABLE `moment_label`  (
  `moment_id` int(0) NOT NULL,
  `label_id` int(0) NOT NULL,
  `createAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updateAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`moment_id`, `label_id`) USING BTREE,
  INDEX `label_id`(`label_id`) USING BTREE,
  CONSTRAINT `moment_label_ibfk_1` FOREIGN KEY (`moment_id`) REFERENCES `moment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `moment_label_ibfk_2` FOREIGN KEY (`label_id`) REFERENCES `label` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of moment_label
-- ----------------------------
INSERT INTO `moment_label` VALUES (18, 9, '2021-06-18 10:07:22', '2021-06-18 10:07:22');
INSERT INTO `moment_label` VALUES (18, 10, '2021-06-18 10:07:22', '2021-06-18 10:07:22');
INSERT INTO `moment_label` VALUES (18, 11, '2021-06-18 10:07:23', '2021-06-18 10:07:59');
INSERT INTO `moment_label` VALUES (18, 12, '2021-06-18 10:07:23', '2021-06-18 10:08:09');
INSERT INTO `moment_label` VALUES (19, 1, '2021-06-18 10:08:55', '2021-06-18 10:08:55');
INSERT INTO `moment_label` VALUES (19, 2, '2021-06-18 10:08:55', '2021-06-18 10:08:55');
INSERT INTO `moment_label` VALUES (19, 3, '2021-06-18 10:08:55', '2021-06-18 10:08:55');
INSERT INTO `moment_label` VALUES (19, 14, '2021-06-18 10:08:55', '2021-06-18 10:08:55');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `createAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updateAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `avatar_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'NetWorkVvv', '8a1148a74ba479fcaca5e34f5de73d45', '2021-06-12 14:39:06', '2021-07-03 11:19:43', 'http://localhost:7777/users/1/avatar');
INSERT INTO `users` VALUES (2, '?????????', 'd04efd061f57bf74ddb88689849678fa', '2021-06-12 14:39:24', '2021-06-14 17:02:25', NULL);
INSERT INTO `users` VALUES (3, '??????', '808ac266f01bf2d8645cb0d0d3996160', '2021-06-12 14:39:38', '2021-06-14 17:02:29', NULL);
INSERT INTO `users` VALUES (4, 'TextMd5Pwd', 'af85dd7195bf4b999bfe2597429b1740', '2021-06-12 14:40:09', '2021-06-14 17:02:36', NULL);
INSERT INTO `users` VALUES (5, '?????????', 'af85dd7195bf4b999bfe2597429b1740', '2021-06-12 14:46:33', '2021-07-03 11:24:47', 'http://localhost:7777/users/5/avatar');
INSERT INTO `users` VALUES (6, '?????????', 'af85dd7195bf4b999bfe2597429b1740', '2021-06-12 14:46:55', '2021-07-03 11:25:03', 'http://localhost:7777/users/6/avatar');
INSERT INTO `users` VALUES (7, '?????????', 'af85dd7195bf4b999bfe2597429b1740', '2021-06-12 14:52:50', '2021-07-03 11:25:25', 'http://localhost:7777/users/7/avatar');
INSERT INTO `users` VALUES (8, '?????????', 'b973bc7199daf2133283a09de45867be', '2021-06-13 17:53:50', '2021-06-14 17:02:48', NULL);
INSERT INTO `users` VALUES (9, 'NetWork', '12bbaa86aad48ce7cb687f8da47383ed', '2021-06-14 00:06:41', '2021-06-14 00:06:41', NULL);
INSERT INTO `users` VALUES (10, 'Vg', '12bbaa86aad48ce7cb687f8da47383ed', '2021-06-14 16:58:36', '2021-07-03 11:22:27', 'http://localhost:7777/users/10/avatar');

SET FOREIGN_KEY_CHECKS = 1;
