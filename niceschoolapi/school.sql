/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 8.0.19 : Database - school
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`school` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `school`;

/*Table structure for table `classinfo` */

DROP TABLE IF EXISTS `classinfo`;

CREATE TABLE `classinfo` (
  `classid` int NOT NULL AUTO_INCREMENT,
  `classname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `begintime` date DEFAULT NULL,
  `endtime` date DEFAULT NULL,
  `ccount` int NOT NULL DEFAULT '0',
  `gid` int NOT NULL,
  `is_del` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`classid`),
  KEY `gid` (`gid`) USING BTREE,
  CONSTRAINT `classinfo_ibfk_1` FOREIGN KEY (`gid`) REFERENCES `grade` (`gid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

/*Data for the table `classinfo` */

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `cname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ccredit` decimal(9,2) NOT NULL,
  `cperiod` decimal(9,2) NOT NULL,
  `cstate` int NOT NULL DEFAULT '0',
  `cselcount` int NOT NULL DEFAULT '0',
  `cmaxcount` int NOT NULL DEFAULT '0',
  `studytype` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ctid` int NOT NULL,
  `mid` int NOT NULL,
  `is_del` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `ctid` (`ctid`) USING BTREE,
  KEY `mid` (`mid`) USING BTREE,
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`ctid`) REFERENCES `course_type` (`ctid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `course_ibfk_2` FOREIGN KEY (`mid`) REFERENCES `major` (`mid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `course` */

/*Table structure for table `course_type` */

DROP TABLE IF EXISTS `course_type`;

CREATE TABLE `course_type` (
  `ctid` int NOT NULL AUTO_INCREMENT,
  `ctname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ctid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `course_type` */

insert  into `course_type`(`ctid`,`ctname`) values (1,'专业基础课'),(2,'公共课'),(3,'任选课');

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `did` int NOT NULL AUTO_INCREMENT,
  `dname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dcount` int NOT NULL DEFAULT '0',
  `is_del` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `department` */

/*Table structure for table `dropout` */

DROP TABLE IF EXISTS `dropout`;

CREATE TABLE `dropout` (
  `drid` int NOT NULL AUTO_INCREMENT,
  `drreason` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sid` int DEFAULT NULL,
  PRIMARY KEY (`drid`),
  KEY `sid` (`sid`) USING BTREE,
  CONSTRAINT `dropout_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `dropout` */

/*Table structure for table `evaluate_list` */

DROP TABLE IF EXISTS `evaluate_list`;

CREATE TABLE `evaluate_list` (
  `elid` int NOT NULL AUTO_INCREMENT,
  `elcontent` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`elid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `evaluate_list` */

insert  into `evaluate_list`(`elid`,`elcontent`) values (1,'讲师是否能坚持进行随堂测试，及时激励和督促学生的学习'),(2,'讲师是否能提前五分钟入班并准时上课？'),(3,'讲师的授课内容是否条理清晰、表达准确、操作熟练、逻辑性强？'),(4,'课堂气氛是否活跃，你对所学知识是否感兴趣并能积极参与？'),(5,'在做练习或项目时讲师是否保持在班内巡视，随时监督学生进度并及时发现和解决问题？'),(6,'讲师是否能在课程结束时及时总结，便于我对知识点的理解和掌握？'),(7,'讲师是否能对作业或练习中的问题进行集中讲解或单个点评？'),(8,'讲师是否能够严格要求学生并积极耐心的解答学生疑问？'),(9,'讲师是否能够诚实讲授知识，从不诱导我为其授课结果虚高打分？'),(10,'讲师是否能对学生认真负责，责任心强？');

/*Table structure for table `evaluate_record` */

DROP TABLE IF EXISTS `evaluate_record`;

CREATE TABLE `evaluate_record` (
  `erid` int NOT NULL AUTO_INCREMENT,
  `stuid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tchid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `erexam` int NOT NULL,
  `is_del` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`erid`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Data for the table `evaluate_record` */

/*Table structure for table `grade` */

DROP TABLE IF EXISTS `grade`;

CREATE TABLE `grade` (
  `gid` int NOT NULL AUTO_INCREMENT,
  `gname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gcount` int(5) unsigned zerofill NOT NULL DEFAULT '00000',
  `mid` int NOT NULL,
  `is_del` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`gid`),
  KEY `mid` (`mid`) USING BTREE,
  CONSTRAINT `grade_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `major` (`mid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Data for the table `grade` */

/*Table structure for table `major` */

DROP TABLE IF EXISTS `major`;

CREATE TABLE `major` (
  `mid` int NOT NULL AUTO_INCREMENT,
  `mname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mcount` int NOT NULL DEFAULT '0',
  `did` int NOT NULL,
  `is_del` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`mid`),
  KEY `did` (`did`) USING BTREE,
  CONSTRAINT `major_ibfk_1` FOREIGN KEY (`did`) REFERENCES `department` (`did`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `major` */

/*Table structure for table `newsinfo` */

DROP TABLE IF EXISTS `newsinfo`;

CREATE TABLE `newsinfo` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `ntitle` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ncontent` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nauthor` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ntime` datetime DEFAULT CURRENT_TIMESTAMP,
  `nimg` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'http://projects.whn946.cn/images/niceschool/default.jpg',
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `newsinfo` */

/*Table structure for table `politics_type` */

DROP TABLE IF EXISTS `politics_type`;

CREATE TABLE `politics_type` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `pname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `politics_type` */

insert  into `politics_type`(`pid`,`pname`) values (1,'中共党员'),(2,'中共预备党员'),(3,'共青团员'),(4,'民革党员'),(5,'民盟盟员'),(6,'民建会员'),(7,'民进会员'),(8,'农工党党员'),(9,'致公党会员'),(10,'九三学社社员'),(11,'台盟盟员'),(12,'无党派人士'),(13,'群众');

/*Table structure for table `schedule` */

DROP TABLE IF EXISTS `schedule`;

CREATE TABLE `schedule` (
  `schid` int NOT NULL AUTO_INCREMENT,
  `timeinterval` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `schname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `summer` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `winter` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`schid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `schedule` */

insert  into `schedule`(`schid`,`timeinterval`,`schname`,`summer`,`winter`) values (1,'早上','起床','6:00','6:30'),(2,'早上','早操','6:10-7:00','6:40-7:00'),(3,'早上','早饭','7:10','7:10'),(4,'上午','预备','8:00','8:00'),(5,'上午','第一节','8:10-8:55','8:10-8:55'),(6,'上午','第二节','9:05-9:50','9:05-9:50'),(7,'上午','课间操','9:50-10:10','9:50-10:10'),(8,'上午','第三节','10:10-10:55','10:10-10:55'),(9,'上午','第四节','11:05-11:50','11:05-11:50'),(10,'中午','午饭','12:00','12:00'),(11,'下午','预备','14:30','14:00'),(12,'下午','第五节','14:40-15:25','14:10-14:55'),(13,'下午','第六节','15:35-16:20','15:05-15:50'),(14,'下午','课外活动','16:30-18:00','16:00-17:30');

/*Table structure for table `stu_course` */

DROP TABLE IF EXISTS `stu_course`;

CREATE TABLE `stu_course` (
  `scid` int NOT NULL AUTO_INCREMENT,
  `sid` int NOT NULL,
  `cid` int NOT NULL,
  `is_del` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`scid`),
  KEY `sid` (`sid`) USING BTREE,
  KEY `cid` (`cid`) USING BTREE,
  CONSTRAINT `stu_course_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `stu_course_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=483 DEFAULT CHARSET=utf8;

/*Data for the table `stu_course` */

/*Table structure for table `stu_exam` */

DROP TABLE IF EXISTS `stu_exam`;

CREATE TABLE `stu_exam` (
  `seid` int NOT NULL AUTO_INCREMENT,
  `sid` int NOT NULL,
  `scid` int NOT NULL,
  `normalexam` decimal(9,2) DEFAULT NULL,
  `testexam` decimal(9,2) DEFAULT NULL,
  `sumexam` decimal(9,2) DEFAULT NULL,
  `stime` int NOT NULL,
  `studynature` int NOT NULL,
  `is_del` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`seid`),
  KEY `sid` (`sid`) USING BTREE,
  KEY `scid` (`scid`) USING BTREE,
  CONSTRAINT `stu_exam_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `stu_exam_ibfk_2` FOREIGN KEY (`scid`) REFERENCES `stu_course` (`scid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

/*Data for the table `stu_exam` */

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `sid` int NOT NULL AUTO_INCREMENT,
  `stuid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sgender` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sbirthday` date NOT NULL,
  `pid` int NOT NULL,
  `snation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `scardid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sphone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `saddress` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entertime` date NOT NULL,
  `leavetime` date DEFAULT NULL,
  `stustate` int NOT NULL DEFAULT '0',
  `classid` int NOT NULL,
  `is_del` int NOT NULL DEFAULT '0',
  `mim` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '111111',
  PRIMARY KEY (`sid`),
  KEY `pid` (`pid`) USING BTREE,
  KEY `classid` (`classid`) USING BTREE,
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `politics_type` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`classid`) REFERENCES `classinfo` (`classid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=20197844 DEFAULT CHARSET=utf8;

/*Data for the table `student` */

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单名称',
  `parent_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父菜单',
  `level` bigint DEFAULT NULL COMMENT '菜单层级',
  `parent_ids` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父菜单联集',
  `sort` smallint DEFAULT NULL COMMENT '排序',
  `href` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '链接地址',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '打开方式',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单图标',
  `bg_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '显示背景色',
  `is_show` tinyint DEFAULT NULL COMMENT '是否显示',
  `permission` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `del_flag` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`id`,`name`,`parent_id`,`level`,`parent_ids`,`sort`,`href`,`target`,`icon`,`bg_color`,`is_show`,`permission`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('0127fd90587d43c2846f0b6aa563f35c','教师授课管理','832e289e4a4d49a68eea3441979ff703',2,'832e289e4a4d49a68eea3441979ff703,0127fd90587d43c2846f0b6aa563f35c,',4,'/tchcoursemanage/tchcoursemanage',NULL,NULL,'',1,'','054a2cd6369c48d8a52d62e0084d4527','2019-11-07 11:18:28','054a2cd6369c48d8a52d62e0084d4527','2019-11-07 11:18:28',NULL,0),('0516eff241b7418a9ead2111187f9d75','退学信息','346bee7d3f7741b58e01ee062c3aba73',2,'346bee7d3f7741b58e01ee062c3aba73,0516eff241b7418a9ead2111187f9d75,',4,'/dropoutPage',NULL,NULL,'',1,'','054a2cd6369c48d8a52d62e0084d4527','2019-11-20 16:45:52','054a2cd6369c48d8a52d62e0084d4527','2019-11-20 16:45:52',NULL,0),('0ad281e996484506b0064e647bfb1e1c','成绩查询','32e652d6788d471196683ca53b948c63',2,'32e652d6788d471196683ca53b948c63,0ad281e996484506b0064e647bfb1e1c,',1,'/selectGrade',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-04 15:15:53','0684935cb2ae4cd5994155a32603d195','2019-11-06 19:16:56',NULL,0),('118126c2a71141858ec667c104d7cd3d','发布新闻','bb86050a4b4b498b977f93cccd5b2bec',2,'bb86050a4b4b498b977f93cccd5b2bec,118126c2a71141858ec667c104d7cd3d,',1,'/news/addnews',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-04 01:22:30','0684935cb2ae4cd5994155a32603d195','2019-11-04 01:22:30',NULL,0),('16da2b1c1fa14182816f05850515bdce','课表查询','42ff87aec13c409da75b6c7b5ee333ec',2,'42ff87aec13c409da75b6c7b5ee333ec,16da2b1c1fa14182816f05850515bdce,',1,'',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-04 15:17:02','054a2cd6369c48d8a52d62e0084d4527','2019-11-20 17:17:13',NULL,1),('19c96fa92510436196066c4d529ddd65','课目管理','42ff87aec13c409da75b6c7b5ee333ec',2,'42ff87aec13c409da75b6c7b5ee333ec,19c96fa92510436196066c4d529ddd65,',3,'/selCou',NULL,'','',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-07 08:20:03','054a2cd6369c48d8a52d62e0084d4527','2019-11-07 13:00:38',NULL,0),('1b84b70acfbd4b12ac3bad1fee892330','选课管理',NULL,1,'1b84b70acfbd4b12ac3bad1fee892330,',13,'',NULL,'','',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-07 08:22:51','0684935cb2ae4cd5994155a32603d195','2019-11-07 08:22:51',NULL,0),('32e652d6788d471196683ca53b948c63','成绩管理',NULL,1,'32e652d6788d471196683ca53b948c63,',4,'',NULL,'','',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-04 15:15:10','0684935cb2ae4cd5994155a32603d195','2019-11-05 15:30:17',NULL,0),('346bee7d3f7741b58e01ee062c3aba73','学生管理',NULL,1,'346bee7d3f7741b58e01ee062c3aba73,',7,'',NULL,'','',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-04 15:23:25','0684935cb2ae4cd5994155a32603d195','2019-11-05 15:32:03',NULL,0),('3b54e2a2-9adb-11e8-aebe-1368d4ec24eb','用户管理','7d1020ee-9ad9-11e8-aebe-1368d4ec24eb',2,'7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b54e2a2-9adb-11e8-aebe-1368d4ec24eb,',9,'/admin/system/user/list',NULL,'','#47e69c',1,'sys:user:list','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-01-16 11:31:18','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-01-20 05:59:20',NULL,0),('3b58e01e-9adb-11e8-aebe-1368d4ec24eb','角色管理','7d1020ee-9ad9-11e8-aebe-1368d4ec24eb',2,'7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b58e01e-9adb-11e8-aebe-1368d4ec24eb,',10,'/admin/system/role/list',NULL,'','#c23ab9',1,'sys:role:list','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-01-16 11:32:33','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-01-20 05:58:58',NULL,0),('3b5cb607-9adb-11e8-aebe-1368d4ec24eb','权限管理','7d1020ee-9ad9-11e8-aebe-1368d4ec24eb',2,'7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b5cb607-9adb-11e8-aebe-1368d4ec24eb,',20,'/admin/system/menu/list',NULL,'','#d4573b',1,'sys:menu:list','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-01-16 11:33:19','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 09:49:28',NULL,0),('3d2bbd52a26344e59c2b25d615614d44','班级管理','d04edab30f5b4df4af28254e375c2ff6',2,'d04edab30f5b4df4af28254e375c2ff6,3d2bbd52a26344e59c2b25d615614d44,',4,'/schoolmanage/classmanage',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-05 09:28:18','0684935cb2ae4cd5994155a32603d195','2019-11-05 09:28:19',NULL,0),('3e0b86a3-9adc-11e8-aebe-1368d4ec24eb','新增用户','3b54e2a2-9adb-11e8-aebe-1368d4ec24eb',3,'7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b54e2a2-9adb-11e8-aebe-1368d4ec24eb,3e0b86a3-9adc-11e8-aebe-1368d4ec24eb,',0,'',NULL,NULL,NULL,0,'sys:user:add','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 10:10:32','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 10:10:32',NULL,0),('3e2fa8b6-9adc-11e8-aebe-1368d4ec24eb','编辑用户','3b54e2a2-9adb-11e8-aebe-1368d4ec24eb',3,'7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b54e2a2-9adb-11e8-aebe-1368d4ec24eb,3e2fa8b6-9adc-11e8-aebe-1368d4ec24eb,',10,'',NULL,NULL,NULL,0,'sys:user:edit','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 10:11:49','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 10:11:49',NULL,0),('3e36cf2f-9adc-11e8-aebe-1368d4ec24eb','删除用户','3b54e2a2-9adb-11e8-aebe-1368d4ec24eb',3,'7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b54e2a2-9adb-11e8-aebe-1368d4ec24eb,3e36cf2f-9adc-11e8-aebe-1368d4ec24eb,',20,'',NULL,NULL,NULL,0,'sys:user:delete','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 10:12:43','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 10:12:43',NULL,0),('42ff87aec13c409da75b6c7b5ee333ec','课程管理',NULL,1,'42ff87aec13c409da75b6c7b5ee333ec,',5,'',NULL,'','',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-04 15:16:44','0684935cb2ae4cd5994155a32603d195','2019-11-05 15:30:30',NULL,0),('45076bf2dbb5443db49c062994d0fb4b','专业管理','d04edab30f5b4df4af28254e375c2ff6',2,'d04edab30f5b4df4af28254e375c2ff6,45076bf2dbb5443db49c062994d0fb4b,',2,'/schoolmanage/majormanage',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-05 09:27:19','0684935cb2ae4cd5994155a32603d195','2019-11-05 09:27:19',NULL,0),('4d457c31f4fc4e0595c5c6448fe7630a','新闻管理','bb86050a4b4b498b977f93cccd5b2bec',2,'bb86050a4b4b498b977f93cccd5b2bec,4d457c31f4fc4e0595c5c6448fe7630a,',3,'/news/newscontrol',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-04 15:18:13','0684935cb2ae4cd5994155a32603d195','2019-11-04 15:18:13',NULL,0),('4e833c1bd3e8485ab12d4d19269de739','系部管理','d04edab30f5b4df4af28254e375c2ff6',2,'d04edab30f5b4df4af28254e375c2ff6,4e833c1bd3e8485ab12d4d19269de739,',1,'/schoolmanage/dpmmanage',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-05 09:26:32','0684935cb2ae4cd5994155a32603d195','2019-11-05 09:26:33',NULL,0),('4f1451598a344744b0d225790f52aa19','退课','4f8ead47ab25421f85f27af3db60a84e',2,'4f8ead47ab25421f85f27af3db60a84e,4f1451598a344744b0d225790f52aa19,',2,'/seledCourse',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-07 14:12:55','0684935cb2ae4cd5994155a32603d195','2019-11-07 14:12:55',NULL,0),('4f8ead47ab25421f85f27af3db60a84e','网上选课',NULL,1,'4f8ead47ab25421f85f27af3db60a84e,',11,'/',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-06 19:16:04','0684935cb2ae4cd5994155a32603d195','2019-11-07 14:12:07',NULL,0),('5178554598814a239475716ed4fef474','查询学生','832e289e4a4d49a68eea3441979ff703',2,'832e289e4a4d49a68eea3441979ff703,5178554598814a239475716ed4fef474,',5,'/selAllStudent',NULL,NULL,'',1,'','054a2cd6369c48d8a52d62e0084d4527','2019-11-22 13:43:20','054a2cd6369c48d8a52d62e0084d4527','2019-11-22 13:51:08',NULL,0),('54b74a2152674cbdbdf63c32daf840c5','网上教评',NULL,1,'54b74a2152674cbdbdf63c32daf840c5,',6,'/appraise/seltch',NULL,'','',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-04 15:18:47','0684935cb2ae4cd5994155a32603d195','2019-11-05 15:31:12',NULL,0),('5940b85334e54463a557f9d7b57f883f','教师信息修改','832e289e4a4d49a68eea3441979ff703',2,'832e289e4a4d49a68eea3441979ff703,5940b85334e54463a557f9d7b57f883f,',2,'',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-04 15:34:24','054a2cd6369c48d8a52d62e0084d4527','2019-11-11 09:48:39',NULL,1),('69b1c803b1a14a8989cf79c4465c0c7e','录入教师','832e289e4a4d49a68eea3441979ff703',2,'832e289e4a4d49a68eea3441979ff703,69b1c803b1a14a8989cf79c4465c0c7e,',3,'/addTeacherPage',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-04 15:34:37','0684935cb2ae4cd5994155a32603d195','2019-11-06 20:01:58',NULL,0),('72cfb92b47584cf499624dba63cc553a','教师成绩查询','32e652d6788d471196683ca53b948c63',2,'32e652d6788d471196683ca53b948c63,72cfb92b47584cf499624dba63cc553a,',4,'/tchExam',NULL,'','',1,'','054a2cd6369c48d8a52d62e0084d4527','2019-11-14 17:35:29','054a2cd6369c48d8a52d62e0084d4527','2019-11-14 17:35:29',NULL,0),('7a3b765260f5422c8d0a22e8d5ea8d05','教师信息查询','832e289e4a4d49a68eea3441979ff703',2,'832e289e4a4d49a68eea3441979ff703,7a3b765260f5422c8d0a22e8d5ea8d05,',1,'/selectTeacher',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-04 15:33:54','0684935cb2ae4cd5994155a32603d195','2019-11-06 19:25:38',NULL,0),('7ab4c00ce86f4ef8808a16a25625919d','学生选课管理','1b84b70acfbd4b12ac3bad1fee892330',2,'1b84b70acfbd4b12ac3bad1fee892330,7ab4c00ce86f4ef8808a16a25625919d,',1,'/selCourses',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-07 08:27:04','054a2cd6369c48d8a52d62e0084d4527','2019-11-07 13:01:45',NULL,0),('7d1020ee-9ad9-11e8-aebe-1368d4ec24eb','系统管理',NULL,1,'7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,',1,'',NULL,'',NULL,1,'','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-01-16 11:29:46','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-01-20 03:09:26',NULL,0),('832e289e4a4d49a68eea3441979ff703','教师管理',NULL,1,'832e289e4a4d49a68eea3441979ff703,',8,'',NULL,'','',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-04 15:23:46','0684935cb2ae4cd5994155a32603d195','2019-11-05 15:32:13',NULL,0),('894cc49337bf49cb83b91f859e471349','新闻查询','bb86050a4b4b498b977f93cccd5b2bec',2,'bb86050a4b4b498b977f93cccd5b2bec,894cc49337bf49cb83b91f859e471349,',2,'',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-04 15:11:00','0684935cb2ae4cd5994155a32603d195','2019-11-05 09:29:06',NULL,1),('8c4743e9a38446e7b13f7e0b6b97a28e','年级管理','d04edab30f5b4df4af28254e375c2ff6',2,'d04edab30f5b4df4af28254e375c2ff6,8c4743e9a38446e7b13f7e0b6b97a28e,',3,'/schoolmanage/grademanage',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-05 09:27:52','0684935cb2ae4cd5994155a32603d195','2019-11-05 09:27:52',NULL,0),('93979ed945b94fee9a53dbdc184a8eee','教评问题管理','c457ebb1ad6f47afa69ccc32d6b73b1a',2,'c457ebb1ad6f47afa69ccc32d6b73b1a,93979ed945b94fee9a53dbdc184a8eee,',1,'/appraise/evlistcontrol',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-05 13:58:29','0684935cb2ae4cd5994155a32603d195','2019-11-05 13:58:29',NULL,0),('95273203460543e8942174ec460a6f12','正选','4f8ead47ab25421f85f27af3db60a84e',2,'4f8ead47ab25421f85f27af3db60a84e,95273203460543e8942174ec460a6f12,',1,'/course/sel',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-07 14:11:26','0684935cb2ae4cd5994155a32603d195','2019-11-07 14:11:26',NULL,0),('96fd6a5a-9adb-11e8-aebe-1368d4ec24eb','新增权限','3b5cb607-9adb-11e8-aebe-1368d4ec24eb',3,'7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b5cb607-9adb-11e8-aebe-1368d4ec24eb,96fd6a5a-9adb-11e8-aebe-1368d4ec24eb,',0,'',NULL,NULL,NULL,0,'sys:menu:add','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 09:49:15','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 09:49:38',NULL,0),('9703ccf2-9adb-11e8-aebe-1368d4ec24eb','编辑权限','3b5cb607-9adb-11e8-aebe-1368d4ec24eb',3,'7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b5cb607-9adb-11e8-aebe-1368d4ec24eb,9703ccf2-9adb-11e8-aebe-1368d4ec24eb,',10,'',NULL,NULL,NULL,0,'sys:menu:edit','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 09:50:16','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 09:50:25',NULL,0),('9707cf58-9adb-11e8-aebe-1368d4ec24eb','删除权限','3b5cb607-9adb-11e8-aebe-1368d4ec24eb',3,'7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b5cb607-9adb-11e8-aebe-1368d4ec24eb,9707cf58-9adb-11e8-aebe-1368d4ec24eb,',20,'',NULL,NULL,NULL,0,'sys:menu:delete','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 09:51:53','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 09:53:42',NULL,0),('ad13ddd195e147b7a7e8c3bd20f05cea','录入学生','346bee7d3f7741b58e01ee062c3aba73',2,'346bee7d3f7741b58e01ee062c3aba73,ad13ddd195e147b7a7e8c3bd20f05cea,',3,'/addStudentPage',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-04 15:33:38','0684935cb2ae4cd5994155a32603d195','2019-11-05 15:20:28',NULL,0),('b85b2b42c1cd4281b6e3884cc1a53327','成绩录入','32e652d6788d471196683ca53b948c63',2,'32e652d6788d471196683ca53b948c63,b85b2b42c1cd4281b6e3884cc1a53327,',2,'/selstudentExam',NULL,'','',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-04 15:16:14','0684935cb2ae4cd5994155a32603d195','2019-11-17 19:18:42',NULL,0),('bb86050a4b4b498b977f93cccd5b2bec','校园新闻',NULL,1,'bb86050a4b4b498b977f93cccd5b2bec,',2,'',NULL,'','',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-03 20:15:53','0684935cb2ae4cd5994155a32603d195','2019-11-05 15:29:54',NULL,0),('c0ae0cc7e86c45b7a7d6c276a4400a80','选课管理',NULL,1,'c0ae0cc7e86c45b7a7d6c276a4400a80,',12,'',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-07 08:22:09','0684935cb2ae4cd5994155a32603d195','2019-11-07 08:22:18',NULL,1),('c457ebb1ad6f47afa69ccc32d6b73b1a','教评管理',NULL,1,'c457ebb1ad6f47afa69ccc32d6b73b1a,',10,'',NULL,'','',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-05 13:58:00','0684935cb2ae4cd5994155a32603d195','2019-11-05 15:33:59',NULL,0),('c6d5768068f1401bad9f24a5a5b33a92','学生成绩','346bee7d3f7741b58e01ee062c3aba73',2,'346bee7d3f7741b58e01ee062c3aba73,c6d5768068f1401bad9f24a5a5b33a92,',2,'/tchSelExam',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-04 15:33:25','054a2cd6369c48d8a52d62e0084d4527','2019-11-11 09:27:53',NULL,0),('d024c4836bc941208ae2f2ad00bf630e','调换课程','42ff87aec13c409da75b6c7b5ee333ec',2,'42ff87aec13c409da75b6c7b5ee333ec,d024c4836bc941208ae2f2ad00bf630e,',2,'',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-04 15:17:24','054a2cd6369c48d8a52d62e0084d4527','2019-11-20 17:17:19',NULL,1),('d04edab30f5b4df4af28254e375c2ff6','校建管理',NULL,1,'d04edab30f5b4df4af28254e375c2ff6,',9,'',NULL,'','',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-05 09:24:09','0684935cb2ae4cd5994155a32603d195','2019-11-05 15:33:34',NULL,0),('dadca40757374e38a46c9901876febb9','学生成绩查询','32e652d6788d471196683ca53b948c63',2,'32e652d6788d471196683ca53b948c63,dadca40757374e38a46c9901876febb9,',3,'/selStuAllExam',NULL,'','',1,'','054a2cd6369c48d8a52d62e0084d4527','2019-11-14 10:23:04','054a2cd6369c48d8a52d62e0084d4527','2019-11-14 10:23:04',NULL,0),('ed63866b30cf46bfb6797a1d31ae930c','锁定用户','3b54e2a2-9adb-11e8-aebe-1368d4ec24eb',3,'7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b54e2a2-9adb-11e8-aebe-1368d4ec24eb,ed63866b30cf46bfb6797a1d31ae930c,',21,'',NULL,NULL,'',0,'sys:user:lock','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-08-21 17:44:05','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-08-21 17:44:05',NULL,0),('fd3b5d6130dc496fadbb33cca4737863','学生信息查询','346bee7d3f7741b58e01ee062c3aba73',2,'346bee7d3f7741b58e01ee062c3aba73,fd3b5d6130dc496fadbb33cca4737863,',1,'/selectStudent',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-04 15:33:08','0684935cb2ae4cd5994155a32603d195','2019-11-06 19:20:41',NULL,0),('ff619e04-9adb-11e8-aebe-1368d4ec24eb','新增角色','3b58e01e-9adb-11e8-aebe-1368d4ec24eb',3,'7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b58e01e-9adb-11e8-aebe-1368d4ec24eb,ff619e04-9adb-11e8-aebe-1368d4ec24eb,',0,'',NULL,NULL,NULL,0,'sys:role:add','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 09:58:11','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 09:58:11',NULL,0),('ff9477c9-9adb-11e8-aebe-1368d4ec24eb','编辑权限','3b58e01e-9adb-11e8-aebe-1368d4ec24eb',3,'7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b58e01e-9adb-11e8-aebe-1368d4ec24eb,ff9477c9-9adb-11e8-aebe-1368d4ec24eb,',10,'',NULL,NULL,NULL,0,'sys:role:edit','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 09:59:01','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 09:59:01',NULL,0),('ff9ad846-9adb-11e8-aebe-1368d4ec24eb','删除角色','3b58e01e-9adb-11e8-aebe-1368d4ec24eb',3,'7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b58e01e-9adb-11e8-aebe-1368d4ec24eb,ff9ad846-9adb-11e8-aebe-1368d4ec24eb,',20,'',NULL,NULL,NULL,0,'sys:role:delete','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 09:59:56','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 09:59:56',NULL,0);

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色名称',
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `del_flag` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`name`,`create_date`,`create_by`,`update_date`,`update_by`,`remarks`,`del_flag`) values ('1893c63a307b44709c643d60324ed3de','教师','2019-11-27 23:18:13','054a2cd6369c48d8a52d62e0084d4527','2019-11-27 23:18:13','054a2cd6369c48d8a52d62e0084d4527','教师',0),('4212d47f61944d3e9f797598102ea67b','学生','2019-11-27 23:17:37','054a2cd6369c48d8a52d62e0084d4527','2019-11-27 23:17:37','054a2cd6369c48d8a52d62e0084d4527','学生',0),('6619c0ed9452430e9ea23a6542d884a2','管理员','2019-11-27 23:09:05','054a2cd6369c48d8a52d62e0084d4527','2019-11-27 23:09:05','054a2cd6369c48d8a52d62e0084d4527','管理员',0);

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `menu_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`role_id`,`menu_id`) values ('1893c63a307b44709c643d60324ed3de','32e652d6788d471196683ca53b948c63'),('1893c63a307b44709c643d60324ed3de','346bee7d3f7741b58e01ee062c3aba73'),('1893c63a307b44709c643d60324ed3de','b85b2b42c1cd4281b6e3884cc1a53327'),('1893c63a307b44709c643d60324ed3de','c6d5768068f1401bad9f24a5a5b33a92'),('4212d47f61944d3e9f797598102ea67b','0ad281e996484506b0064e647bfb1e1c'),('4212d47f61944d3e9f797598102ea67b','32e652d6788d471196683ca53b948c63'),('4212d47f61944d3e9f797598102ea67b','4f1451598a344744b0d225790f52aa19'),('4212d47f61944d3e9f797598102ea67b','4f8ead47ab25421f85f27af3db60a84e'),('4212d47f61944d3e9f797598102ea67b','54b74a2152674cbdbdf63c32daf840c5'),('4212d47f61944d3e9f797598102ea67b','95273203460543e8942174ec460a6f12'),('6619c0ed9452430e9ea23a6542d884a2','0127fd90587d43c2846f0b6aa563f35c'),('6619c0ed9452430e9ea23a6542d884a2','0516eff241b7418a9ead2111187f9d75'),('6619c0ed9452430e9ea23a6542d884a2','118126c2a71141858ec667c104d7cd3d'),('6619c0ed9452430e9ea23a6542d884a2','19c96fa92510436196066c4d529ddd65'),('6619c0ed9452430e9ea23a6542d884a2','1b84b70acfbd4b12ac3bad1fee892330'),('6619c0ed9452430e9ea23a6542d884a2','32e652d6788d471196683ca53b948c63'),('6619c0ed9452430e9ea23a6542d884a2','346bee7d3f7741b58e01ee062c3aba73'),('6619c0ed9452430e9ea23a6542d884a2','3b54e2a2-9adb-11e8-aebe-1368d4ec24eb'),('6619c0ed9452430e9ea23a6542d884a2','3b58e01e-9adb-11e8-aebe-1368d4ec24eb'),('6619c0ed9452430e9ea23a6542d884a2','3b5cb607-9adb-11e8-aebe-1368d4ec24eb'),('6619c0ed9452430e9ea23a6542d884a2','3d2bbd52a26344e59c2b25d615614d44'),('6619c0ed9452430e9ea23a6542d884a2','3e0b86a3-9adc-11e8-aebe-1368d4ec24eb'),('6619c0ed9452430e9ea23a6542d884a2','3e2fa8b6-9adc-11e8-aebe-1368d4ec24eb'),('6619c0ed9452430e9ea23a6542d884a2','3e36cf2f-9adc-11e8-aebe-1368d4ec24eb'),('6619c0ed9452430e9ea23a6542d884a2','42ff87aec13c409da75b6c7b5ee333ec'),('6619c0ed9452430e9ea23a6542d884a2','45076bf2dbb5443db49c062994d0fb4b'),('6619c0ed9452430e9ea23a6542d884a2','4d457c31f4fc4e0595c5c6448fe7630a'),('6619c0ed9452430e9ea23a6542d884a2','4e833c1bd3e8485ab12d4d19269de739'),('6619c0ed9452430e9ea23a6542d884a2','69b1c803b1a14a8989cf79c4465c0c7e'),('6619c0ed9452430e9ea23a6542d884a2','72cfb92b47584cf499624dba63cc553a'),('6619c0ed9452430e9ea23a6542d884a2','7a3b765260f5422c8d0a22e8d5ea8d05'),('6619c0ed9452430e9ea23a6542d884a2','7ab4c00ce86f4ef8808a16a25625919d'),('6619c0ed9452430e9ea23a6542d884a2','7d1020ee-9ad9-11e8-aebe-1368d4ec24eb'),('6619c0ed9452430e9ea23a6542d884a2','832e289e4a4d49a68eea3441979ff703'),('6619c0ed9452430e9ea23a6542d884a2','8c4743e9a38446e7b13f7e0b6b97a28e'),('6619c0ed9452430e9ea23a6542d884a2','93979ed945b94fee9a53dbdc184a8eee'),('6619c0ed9452430e9ea23a6542d884a2','96fd6a5a-9adb-11e8-aebe-1368d4ec24eb'),('6619c0ed9452430e9ea23a6542d884a2','9703ccf2-9adb-11e8-aebe-1368d4ec24eb'),('6619c0ed9452430e9ea23a6542d884a2','9707cf58-9adb-11e8-aebe-1368d4ec24eb'),('6619c0ed9452430e9ea23a6542d884a2','ad13ddd195e147b7a7e8c3bd20f05cea'),('6619c0ed9452430e9ea23a6542d884a2','bb86050a4b4b498b977f93cccd5b2bec'),('6619c0ed9452430e9ea23a6542d884a2','c457ebb1ad6f47afa69ccc32d6b73b1a'),('6619c0ed9452430e9ea23a6542d884a2','d04edab30f5b4df4af28254e375c2ff6'),('6619c0ed9452430e9ea23a6542d884a2','dadca40757374e38a46c9901876febb9'),('6619c0ed9452430e9ea23a6542d884a2','ed63866b30cf46bfb6797a1d31ae930c'),('6619c0ed9452430e9ea23a6542d884a2','fd3b5d6130dc496fadbb33cca4737863'),('6619c0ed9452430e9ea23a6542d884a2','ff619e04-9adb-11e8-aebe-1368d4ec24eb'),('6619c0ed9452430e9ea23a6542d884a2','ff9477c9-9adb-11e8-aebe-1368d4ec24eb'),('6619c0ed9452430e9ea23a6542d884a2','ff9ad846-9adb-11e8-aebe-1368d4ec24eb');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `login_name` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '登录名',
  `nick_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '昵称',
  `icon` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `salt` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'shiro加密盐',
  `tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号码',
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱地址',
  `locked` tinyint DEFAULT NULL COMMENT '是否锁定',
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `del_flag` tinyint NOT NULL,
  `is_admin` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`login_name`,`nick_name`,`icon`,`password`,`salt`,`tel`,`email`,`locked`,`create_date`,`create_by`,`update_date`,`update_by`,`remarks`,`del_flag`,`is_admin`) values ('054a2cd6369c48d8a52d62e0084d4527','admin','管理员',NULL,'ab44fda09e0872c39d6feb181a79b3840ba541b6','b5d007f4b2f7542e','10101010101','gly@gly.com',0,'2019-11-06 17:42:56','0684935cb2ae4cd5994155a32603d195','2019-11-27 23:16:15','054a2cd6369c48d8a52d62e0084d4527',NULL,0,1);

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values ('054a2cd6369c48d8a52d62e0084d4527','6619c0ed9452430e9ea23a6542d884a2');

/*Table structure for table `tch_class` */

DROP TABLE IF EXISTS `tch_class`;

CREATE TABLE `tch_class` (
  `tcsid` int NOT NULL AUTO_INCREMENT,
  `tid` int NOT NULL,
  `classid` int NOT NULL,
  `tcid` int NOT NULL,
  `is_del` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`tcsid`),
  KEY `tid` (`tid`) USING BTREE,
  KEY `classid` (`classid`) USING BTREE,
  KEY `tch_class_ibfk_3` (`tcid`) USING BTREE,
  CONSTRAINT `tch_class_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tch_class_ibfk_2` FOREIGN KEY (`classid`) REFERENCES `classinfo` (`classid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tch_class_ibfk_3` FOREIGN KEY (`tcid`) REFERENCES `tch_course` (`tcid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

/*Data for the table `tch_class` */

/*Table structure for table `tch_course` */

DROP TABLE IF EXISTS `tch_course`;

CREATE TABLE `tch_course` (
  `tcid` int NOT NULL AUTO_INCREMENT,
  `tid` int NOT NULL,
  `cid` int NOT NULL,
  `wid` int NOT NULL,
  `schid` int NOT NULL,
  `gid` int NOT NULL,
  `is_del` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`tcid`),
  KEY `tid` (`tid`) USING BTREE,
  KEY `cid` (`cid`) USING BTREE,
  KEY `wid` (`wid`) USING BTREE,
  KEY `schid` (`schid`) USING BTREE,
  KEY `gid` (`gid`) USING BTREE,
  CONSTRAINT `tch_course_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tch_course_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tch_course_ibfk_3` FOREIGN KEY (`wid`) REFERENCES `weeks` (`wid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tch_course_ibfk_4` FOREIGN KEY (`schid`) REFERENCES `schedule` (`schid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tch_course_ibfk_5` FOREIGN KEY (`gid`) REFERENCES `grade` (`gid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

/*Data for the table `tch_course` */

/*Table structure for table `tch_exam` */

DROP TABLE IF EXISTS `tch_exam`;

CREATE TABLE `tch_exam` (
  `teid` int NOT NULL AUTO_INCREMENT,
  `tid` int NOT NULL,
  `exam` decimal(9,2) DEFAULT NULL,
  `pcount` int DEFAULT NULL,
  `tetime` date NOT NULL,
  `semester` int NOT NULL,
  `is_del` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`teid`),
  KEY `tid` (`tid`) USING BTREE,
  CONSTRAINT `tch_exam_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Data for the table `tch_exam` */

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `tid` int NOT NULL AUTO_INCREMENT,
  `tchid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tgender` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tbirthday` date NOT NULL,
  `pid` int NOT NULL,
  `tnation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tcardid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tphone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `taddress` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entertime` date NOT NULL,
  `leavetime` date DEFAULT NULL,
  `tchstate` int NOT NULL DEFAULT '0',
  `is_del` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`),
  KEY `pid` (`pid`) USING BTREE,
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `politics_type` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=20190030 DEFAULT CHARSET=utf8;

/*Data for the table `teacher` */

/*Table structure for table `weeks` */

DROP TABLE IF EXISTS `weeks`;

CREATE TABLE `weeks` (
  `wid` int NOT NULL AUTO_INCREMENT,
  `wname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `walias` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`wid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `weeks` */

insert  into `weeks`(`wid`,`wname`,`walias`) values (1,'星期一','周一'),(2,'星期二','周二'),(3,'星期三','周三'),(4,'星期四','周四'),(5,'星期五','周五'),(6,'星期六','周六'),(7,'星期日','周日');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
