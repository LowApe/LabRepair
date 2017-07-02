/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : machine

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-07-01 14:13:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for machineinfo
-- ----------------------------
DROP TABLE IF EXISTS `machineinfo`;
CREATE TABLE `machineinfo` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `location` varchar(10) DEFAULT NULL,
  `classroom` varchar(10) DEFAULT NULL,
  `machnumb` varchar(10) DEFAULT NULL,
  `errortype` varchar(10) DEFAULT NULL,
  `errorcause` varchar(10) DEFAULT NULL,
  `repairstate` varchar(10) DEFAULT NULL,
  `reprotdesc` varchar(20) DEFAULT NULL,
  `reporttime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
