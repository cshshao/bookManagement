/*
Navicat MySQL Data Transfer

Source Server         : db_mblog
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : ssmbookappoint

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-05-15 12:52:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `Admin_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Admin_id',
  `Admin_password` bigint(20) NOT NULL,
  PRIMARY KEY (`Admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('123', '123');

-- ----------------------------
-- Table structure for appointment
-- ----------------------------
DROP TABLE IF EXISTS `appointment`;
CREATE TABLE `appointment` (
  `book_id` bigint(20) NOT NULL COMMENT '图书ID',
  `student_id` bigint(20) NOT NULL COMMENT '学号',
  `appoint_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '预约时间',
  PRIMARY KEY (`book_id`,`student_id`),
  KEY `idx_appoint_time` (`appoint_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预约图书表';

-- ----------------------------
-- Records of appointment
-- ----------------------------
INSERT INTO `appointment` VALUES ('1000', '3211200801', '2018-04-12 11:48:30');

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `book_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '图书ID',
  `name` varchar(100) NOT NULL COMMENT '图书名称',
  `introd` varchar(1000) NOT NULL COMMENT '简介',
  `number` int(11) NOT NULL COMMENT '馆藏数量',
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1008 DEFAULT CHARSET=utf8 COMMENT='图书表';

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1000', 'Java程序设计', 'Java程序设计是一门balbal', '9');
INSERT INTO `book` VALUES ('1001', '数据结构', '数据结构是计算机存储、组织数据的方式。数据结构是指相互之间存在一种或多种特定关系的数据元素的集合。', '10');
INSERT INTO `book` VALUES ('1002', '设计模式', '设计模式（Design Pattern）是一套被反复使用、多数人知晓的、经过分类的、代码设计经验的总结。', '10');
INSERT INTO `book` VALUES ('1003', '编译原理', '编译原理是计算机专业的一门重要专业课，旨在介绍编译程序构造的一般原理和基本方法。', '10');
INSERT INTO `book` VALUES ('1004', '大学语文', '基于长期的教学实践和学科思考，我们编写了这本《大学语文》教材balbal', '10');
INSERT INTO `book` VALUES ('1005', '计算方法', '计算方法又称“数值分析”。是为各种数学问题的数值解答研究提供最有效的算法。', '10');
INSERT INTO `book` VALUES ('1006', '高等数学', '广义地说，初等数学之外的数学都是高等数学，也有将中学较深入的代数、几何以及简单的集合论初步balbal', '10');
INSERT INTO `book` VALUES ('1007', '666', '666', '6');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `student_id` bigint(20) NOT NULL COMMENT '学生ID',
  `password` bigint(20) NOT NULL COMMENT '密码',
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生统计表';

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('3211200801', '346543');
INSERT INTO `student` VALUES ('3211200802', '754323');
INSERT INTO `student` VALUES ('3211200803', '674554');
INSERT INTO `student` VALUES ('3211200804', '542344');
INSERT INTO `student` VALUES ('3211200805', '298383');
INSERT INTO `student` VALUES ('3211200806', '873973');
INSERT INTO `student` VALUES ('3211200807', '193737');
INSERT INTO `student` VALUES ('3211200808', '873092');
