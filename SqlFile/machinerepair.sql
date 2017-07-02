/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : machine

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-07-01 14:13:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for machinerepair
-- ----------------------------
DROP TABLE IF EXISTS `machinerepair`;
CREATE TABLE `machinerepair` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `location` varchar(10) DEFAULT NULL,
  `classroom` int(10) DEFAULT NULL,
  `machnumb` varchar(10) DEFAULT NULL,
  `errortype` varchar(10) DEFAULT NULL,
  `errorcause` varchar(10) DEFAULT NULL,
  `repairstate` varchar(10) DEFAULT NULL,
  `repairtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
