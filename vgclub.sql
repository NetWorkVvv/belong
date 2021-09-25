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
INSERT INTO `comment` VALUES (1, 'TypeScript是JavaScript的超集', 1, 4, NULL, '2021-06-16 20:49:49', '2021-06-16 20:51:37');
INSERT INTO `comment` VALUES (2, 'Vue/React都很重要', 1, 4, NULL, '2021-06-16 20:49:49', '2021-06-19 10:46:53');
INSERT INTO `comment` VALUES (3, '微信小程序/uniapp', 2, 5, 2, '2021-06-16 20:49:49', '2021-06-19 13:31:58');
INSERT INTO `comment` VALUES (4, '数据结构/算法书', 2, 5, NULL, '2021-06-16 20:49:49', '2021-06-19 10:47:09');
INSERT INTO `comment` VALUES (5, 'AJAX/JQuery', 3, 6, 1, '2021-06-16 20:49:49', '2021-06-19 10:47:10');
INSERT INTO `comment` VALUES (6, 'Less/stylus', 3, 7, 5, '2021-06-16 20:49:49', '2021-06-16 20:51:48');
INSERT INTO `comment` VALUES (7, 'TypeScript非常的Nice!`', 4, 8, NULL, '2021-06-17 15:40:44', '2021-06-19 10:47:54');

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
INSERT INTO `label` VALUES (9, '编程', '2021-06-17 22:21:11', '2021-06-17 22:21:11');
INSERT INTO `label` VALUES (10, '前端', '2021-06-17 22:21:11', '2021-06-17 22:21:11');
INSERT INTO `label` VALUES (11, '后端', '2021-06-17 22:21:11', '2021-06-17 22:26:36');
INSERT INTO `label` VALUES (12, '解构', '2021-06-17 22:33:45', '2021-06-17 22:33:45');
INSERT INTO `label` VALUES (13, '测试', '2021-06-17 22:33:59', '2021-06-17 22:33:59');
INSERT INTO `label` VALUES (14, '数据结构', '2021-06-18 10:08:55', '2021-06-18 10:09:30');

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
INSERT INTO `moment` VALUES (1, 'JavaScript世界上最好的语言', 7, '2021-06-14 00:05:01', '2021-06-14 00:05:01');
INSERT INTO `moment` VALUES (2, '暑假学习计划', 8, '2021-06-14 00:05:09', '2021-06-16 20:52:14');
INSERT INTO `moment` VALUES (3, '黄国威是全世界最帅的男人', 9, '2021-06-14 00:07:39', '2021-06-14 00:07:39');
INSERT INTO `moment` VALUES (4, '戴晴是黄国威的老婆哈哈哈哈哈', 2, '2021-06-14 00:08:18', '2021-06-14 16:21:21');
INSERT INTO `moment` VALUES (5, '窗前明月光', 1, '2021-06-14 00:10:56', '2021-06-14 16:21:24');
INSERT INTO `moment` VALUES (6, '疑是地上霜', 1, '2021-06-14 11:34:39', '2021-06-14 16:21:25');
INSERT INTO `moment` VALUES (7, '举头望明月', 1, '2021-06-14 11:36:07', '2021-06-14 16:21:29');
INSERT INTO `moment` VALUES (8, '低头思故乡', 1, '2021-06-14 14:41:29', '2021-06-14 16:45:00');
INSERT INTO `moment` VALUES (9, '底层语言的重要性', 3, '2021-06-14 14:47:50', '2021-06-16 20:52:29');
INSERT INTO `moment` VALUES (10, '空山新雨后，天气晚来秋。', 5, '2021-06-14 14:52:06', '2021-06-14 16:45:12');
INSERT INTO `moment` VALUES (11, '明月松间照，清泉石上流。', 5, '2021-06-14 14:52:16', '2021-06-14 16:45:15');
INSERT INTO `moment` VALUES (12, '竹喧归浣女，莲动下渔舟。', 5, '2021-06-14 16:34:21', '2021-06-14 16:45:20');
INSERT INTO `moment` VALUES (13, '随意春芳歇，王孙自可留。', 5, '2021-06-14 16:34:58', '2021-06-14 16:45:22');
INSERT INTO `moment` VALUES (14, '君不见黄河之水天上来，奔流到海不复回。', 6, '2021-06-14 16:38:18', '2021-06-14 16:38:18');
INSERT INTO `moment` VALUES (15, '君不见高堂明镜悲白发，朝如青丝暮成雪。', 6, '2021-06-14 16:38:19', '2021-06-14 16:38:19');
INSERT INTO `moment` VALUES (16, '人生得意须尽欢，莫使金樽空对月。', 6, '2021-06-14 16:38:19', '2021-06-14 16:38:19');
INSERT INTO `moment` VALUES (17, '天生我材必有用，千金散尽还复来。', 6, '2021-06-14 16:38:19', '2021-06-14 16:38:19');
INSERT INTO `moment` VALUES (18, '烹羊宰牛且为乐，会须一饮三百杯。', 7, '2021-06-14 16:38:19', '2021-06-14 16:38:19');
INSERT INTO `moment` VALUES (19, '岑夫子，丹丘生，将进酒，杯莫停。', 7, '2021-06-14 16:38:19', '2021-06-14 16:38:19');
INSERT INTO `moment` VALUES (20, '与君歌一曲，请君为我倾耳听。', 7, '2021-06-14 16:38:20', '2021-06-14 16:38:20');
INSERT INTO `moment` VALUES (21, '钟鼓馔玉不足贵，但愿长醉不附醒。', 7, '2021-06-14 16:38:20', '2021-06-15 15:23:24');
INSERT INTO `moment` VALUES (22, '古来圣贤皆寂寞，惟有饮者留其名。', 8, '2021-06-14 16:43:14', '2021-06-14 16:43:14');
INSERT INTO `moment` VALUES (23, '陈王昔时宴平乐，斗酒十千恣欢谑。', 8, '2021-06-14 16:43:14', '2021-06-14 16:43:14');
INSERT INTO `moment` VALUES (24, '主人何为言少钱，径须沽取对君酌。', 8, '2021-06-14 16:43:14', '2021-06-14 16:43:14');
INSERT INTO `moment` VALUES (25, '五花马、千金裘，呼儿将出换美酒，与尔同销万古愁。', 8, '2021-06-14 16:43:14', '2021-06-14 16:43:14');
INSERT INTO `moment` VALUES (26, '汉皇重色思倾国，御宇多年求不得。', 9, '2021-06-14 16:43:14', '2021-06-14 16:43:14');
INSERT INTO `moment` VALUES (27, '杨家有女初长成，养在深闺人未识。', 9, '2021-06-14 16:43:14', '2021-06-14 16:43:14');
INSERT INTO `moment` VALUES (28, '天生丽质难自弃，一朝选在君王侧。', 9, '2021-06-14 16:43:14', '2021-06-14 16:43:14');
INSERT INTO `moment` VALUES (29, '回眸一笑百媚生，六宫粉黛无颜色。', 9, '2021-06-14 16:43:15', '2021-06-14 16:43:15');
INSERT INTO `moment` VALUES (30, '春寒赐浴华清池，温泉水滑洗凝脂。', 1, '2021-06-14 16:43:15', '2021-06-14 16:43:15');
INSERT INTO `moment` VALUES (31, '侍儿扶起娇无力，始是新承恩泽时。', 1, '2021-06-14 16:43:15', '2021-06-14 16:43:15');
INSERT INTO `moment` VALUES (32, '云鬓花颜金步摇，芙蓉帐暖度春宵。', 1, '2021-06-14 16:43:15', '2021-06-14 16:43:15');
INSERT INTO `moment` VALUES (33, '春宵苦短日高起，从此君王不早朝。', 1, '2021-06-14 16:43:15', '2021-06-14 16:43:15');
INSERT INTO `moment` VALUES (34, '承欢侍宴无闲暇，春从春游夜专夜。', 2, '2021-06-14 16:43:15', '2021-06-14 16:43:15');
INSERT INTO `moment` VALUES (35, '后宫佳丽三千人，三千宠爱在一身。', 2, '2021-06-14 16:43:15', '2021-06-14 16:43:15');
INSERT INTO `moment` VALUES (36, '金屋妆成娇侍夜，玉楼宴罢醉和春。', 2, '2021-06-14 16:43:16', '2021-06-14 16:43:16');
INSERT INTO `moment` VALUES (37, '姊妹弟兄皆列土，可怜光彩生门户。', 2, '2021-06-14 16:43:16', '2021-06-14 16:43:16');
INSERT INTO `moment` VALUES (38, '汉皇重色思倾国，御宇多年求不得。', 3, '2021-06-14 16:43:16', '2021-06-14 16:43:16');
INSERT INTO `moment` VALUES (39, '骊宫高处入青云，仙乐风飘处处闻。', 3, '2021-06-14 16:43:16', '2021-06-14 16:43:16');
INSERT INTO `moment` VALUES (40, '缓歌慢舞凝丝竹，尽日君王看不足。', 3, '2021-06-14 16:43:16', '2021-06-14 16:43:16');
INSERT INTO `moment` VALUES (41, '忽闻海上有仙山，山在虚无缥缈间。', 3, '2021-06-14 16:43:16', '2021-06-14 16:43:16');
INSERT INTO `moment` VALUES (42, '葡萄美酒夜光杯，欲饮琵琶马上催。', 4, '2021-06-14 16:47:32', '2021-06-14 16:47:32');
INSERT INTO `moment` VALUES (43, '醉卧沙场君莫笑，古来征战几人回？', 4, '2021-06-14 16:47:33', '2021-06-14 16:47:33');
INSERT INTO `moment` VALUES (44, '功盖三分国，名成八阵图。', 4, '2021-06-14 16:47:33', '2021-06-14 16:47:33');
INSERT INTO `moment` VALUES (45, 'Update JavaScript是世界上最好的语言 ', 4, '2021-06-14 16:47:33', '2021-06-15 20:53:21');
INSERT INTO `moment` VALUES (49, '江流石不转，遗恨失吞吴。', 4, '2021-06-17 15:55:34', '2021-06-17 15:55:34');

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
INSERT INTO `users` VALUES (2, '黄国威', 'd04efd061f57bf74ddb88689849678fa', '2021-06-12 14:39:24', '2021-06-14 17:02:25', NULL);
INSERT INTO `users` VALUES (3, '戴晴', '808ac266f01bf2d8645cb0d0d3996160', '2021-06-12 14:39:38', '2021-06-14 17:02:29', NULL);
INSERT INTO `users` VALUES (4, 'TextMd5Pwd', 'af85dd7195bf4b999bfe2597429b1740', '2021-06-12 14:40:09', '2021-06-14 17:02:36', NULL);
INSERT INTO `users` VALUES (5, '大老婆', 'af85dd7195bf4b999bfe2597429b1740', '2021-06-12 14:46:33', '2021-07-03 11:24:47', 'http://localhost:7777/users/5/avatar');
INSERT INTO `users` VALUES (6, '大美女', 'af85dd7195bf4b999bfe2597429b1740', '2021-06-12 14:46:55', '2021-07-03 11:25:03', 'http://localhost:7777/users/6/avatar');
INSERT INTO `users` VALUES (7, '大富豪', 'af85dd7195bf4b999bfe2597429b1740', '2021-06-12 14:52:50', '2021-07-03 11:25:25', 'http://localhost:7777/users/7/avatar');
INSERT INTO `users` VALUES (8, '大帅哥', 'b973bc7199daf2133283a09de45867be', '2021-06-13 17:53:50', '2021-06-14 17:02:48', NULL);
INSERT INTO `users` VALUES (9, 'NetWork', '12bbaa86aad48ce7cb687f8da47383ed', '2021-06-14 00:06:41', '2021-06-14 00:06:41', NULL);
INSERT INTO `users` VALUES (10, 'Vg', '12bbaa86aad48ce7cb687f8da47383ed', '2021-06-14 16:58:36', '2021-07-03 11:22:27', 'http://localhost:7777/users/10/avatar');

SET FOREIGN_KEY_CHECKS = 1;
