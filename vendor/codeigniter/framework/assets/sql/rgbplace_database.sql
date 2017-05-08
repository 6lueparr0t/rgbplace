DROP DATABASE IF EXISTS `RGBplace`;
-- MySQL dump 10.16  Distrib 10.1.19-MariaDB, for osx10.12 (x86_64)
--
-- Host: RGBplace    Database: RGBplace
-- ------------------------------------------------------
-- Server version	10.1.19-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `RGBplace`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `RGBplace` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `RGBplace`;

--
-- Table structure for table `admin_info`
--

DROP TABLE IF EXISTS `admin_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_info` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pswd` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fail` tinyint(4) NOT NULL DEFAULT '0',
  `atim` datetime DEFAULT NULL,
  `apikey` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exp` datetime DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `no` (`no`),
  KEY `name` (`name`(191)),
  KEY `no_2` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='관리자 정보 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_info`
--

LOCK TABLES `admin_info` WRITE;
/*!40000 ALTER TABLE `admin_info` DISABLE KEYS */;
INSERT INTO `admin_info` VALUES (1,'admin','daihyun99','JDJ5JDEyJGp6d2doM2REWnkxNlVTRWNsN3pGLnVwUUd4NDF4MjZhS1JYdTFQbGQ1aWJ3R2dhRTduQnFx',0,'2017-04-12 12:58:10','JDJ5JDEwJGo0Q3p6cC8vdnh4cDMwZmFnLkJCR2VBdXR5VXBLM28vcnVPSEVYSTJjQkdQSDJJVnkzaXFl','2017-04-13 00:58:10');
/*!40000 ALTER TABLE `admin_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_menu`
--

DROP TABLE IF EXISTS `common_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_menu` (
  `weight` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_menu`
--

LOCK TABLES `common_menu` WRITE;
/*!40000 ALTER TABLE `common_menu` DISABLE KEYS */;
INSERT INTO `common_menu` VALUES (11,'info','admin',''),(14,'generate_hash','exam',''),(15,'animation','exam',''),(16,'restful','exam','');
/*!40000 ALTER TABLE `common_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest_ipban`
--

DROP TABLE IF EXISTS `guest_ipban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guest_ipban` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `ipad` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'IP Address',
  `ctim` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록 일자(create)',
  `utim` datetime DEFAULT NULL COMMENT '수정 일자(update)',
  `btim` datetime NOT NULL COMMENT '차단 일자(banned)',
  `note` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '비고',
  PRIMARY KEY (`no`) USING BTREE,
  UNIQUE KEY `no` (`no`),
  KEY `ipad` (`ipad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='불법접근 IP 차단';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest_ipban`
--

LOCK TABLES `guest_ipban` WRITE;
/*!40000 ALTER TABLE `guest_ipban` DISABLE KEYS */;
/*!40000 ALTER TABLE `guest_ipban` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_code`
--

DROP TABLE IF EXISTS `map_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_code` (
  `country` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` bigint(20) NOT NULL,
  `place` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ctim` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utim` datetime DEFAULT NULL,
  `btim` datetime DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `editor` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyword` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`country`,`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='장소(Code) 정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_code`
--

LOCK TABLES `map_code` WRITE;
/*!40000 ALTER TABLE `map_code` DISABLE KEYS */;
INSERT INTO `map_code` VALUES ('kr',1,'locality:서울특별시|Seoul&political1:동작구|Dongjak-gu&political2:흑석동|Heukseok-dong','2017-04-16 01:39:44',NULL,NULL,'','',NULL);
/*!40000 ALTER TABLE `map_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_kr1_post`
--

DROP TABLE IF EXISTS `map_kr1_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_kr1_post` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ctim` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dtim` datetime NOT NULL,
  `utim` datetime NOT NULL,
  `title` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyword` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_kr1_post`
--

LOCK TABLES `map_kr1_post` WRITE;
/*!40000 ALTER TABLE `map_kr1_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `map_kr1_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_kr1_reply`
--

DROP TABLE IF EXISTS `map_kr1_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_kr1_reply` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ctim` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utim` datetime DEFAULT NULL,
  `dtim` datetime DEFAULT NULL,
  `content` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_kr1_reply`
--

LOCK TABLES `map_kr1_reply` WRITE;
/*!40000 ALTER TABLE `map_kr1_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `map_kr1_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_notice`
--

DROP TABLE IF EXISTS `map_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_notice` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ctim` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utim` datetime DEFAULT NULL,
  `dtim` datetime NOT NULL,
  `subject` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'free',
  `tag` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyword` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`no`),
  KEY `no` (`no`),
  KEY `uid` (`uid`),
  CONSTRAINT `fk_map_notice` FOREIGN KEY (`uid`) REFERENCES `user_info` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_notice`
--

LOCK TABLES `map_notice` WRITE;
/*!40000 ALTER TABLE `map_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `map_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_tag`
--

DROP TABLE IF EXISTS `map_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_tag` (
  `tag` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `ctim` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utim` datetime DEFAULT NULL,
  `dtim` datetime DEFAULT NULL,
  PRIMARY KEY (`tag`),
  KEY `tag` (`tag`),
  KEY `tag_2` (`tag`),
  KEY `tag_3` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='태그(Tag) 정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_tag`
--

LOCK TABLES `map_tag` WRITE;
/*!40000 ALTER TABLE `map_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `map_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_total`
--

DROP TABLE IF EXISTS `map_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_total` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `link` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ctim` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utim` datetime DEFAULT NULL,
  `subject` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyword` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`no`),
  KEY `link` (`link`(191)),
  KEY `no` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='전체 게시글 리스트';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_total`
--

LOCK TABLES `map_total` WRITE;
/*!40000 ALTER TABLE `map_total` DISABLE KEYS */;
/*!40000 ALTER TABLE `map_total` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_conf`
--

DROP TABLE IF EXISTS `user_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_conf` (
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_sw` tinyint(1) NOT NULL DEFAULT '0',
  `notice_sw` tinyint(1) NOT NULL DEFAULT '0',
  `sound_sw` tinyint(1) NOT NULL DEFAULT '0',
  `tag_sw` tinyint(1) NOT NULL DEFAULT '0',
  `tag` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filter_sw` tinyint(1) NOT NULL DEFAULT '0',
  `filter` text COLLATE utf8mb4_unicode_ci,
  `white_list` text COLLATE utf8mb4_unicode_ci,
  `black_list` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `uid` (`uid`),
  CONSTRAINT `fk_user_config` FOREIGN KEY (`uid`) REFERENCES `user_info` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='유저 계정 설정';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_conf`
--

LOCK TABLES `user_conf` WRITE;
/*!40000 ALTER TABLE `user_conf` DISABLE KEYS */;
INSERT INTO `user_conf` VALUES ('test01',0,0,0,0,NULL,0,NULL,NULL,NULL),('test02',0,0,0,0,NULL,0,NULL,NULL,NULL),('test03',0,0,0,0,NULL,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user_conf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_info` (
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이메일',
  `pswd` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` int(11) NOT NULL DEFAULT '0',
  `code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fail` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '로그인 20회 실패시 차단, 성공시 초기화',
  `ctim` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `atim` datetime DEFAULT NULL,
  `utim` datetime DEFAULT NULL,
  `btim` datetime DEFAULT NULL,
  `note` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '비고',
  PRIMARY KEY (`uid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='유저 계정 정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES ('test01','테스트',NULL,'JDJ5JDEyJFY1dUc2dzdWdG9YWHpqRjJ5L3Zad2VwYWlmNDM0N0JSREpHYnRqaGd3aUJacEFFWVhaUjlH',0,NULL,0,'2017-02-16 18:53:33','2017-04-02 01:40:17',NULL,NULL,''),('test02','삭제테스트',NULL,'JDJ5JDEyJEgxcmE5bWc4Nk5kZy9vYWU2MjdWeGV0VEUxLnlkUTRMNEppSnNtYUh5VXlFMlhRdC9YejN5',0,NULL,0,'2017-03-23 02:24:00',NULL,NULL,NULL,''),('test03','ajax테스트',NULL,'JDJ5JDEyJFBqS3dUTi5CR1F5TWFFUTN1eUo2THVwUEJRaHpTTlJBWmFucVQzNGhUUE9LMTdac0hSb3Y2',0,NULL,0,'2017-03-23 15:30:42',NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_session`
--

DROP TABLE IF EXISTS `user_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_session` (
  `id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`,`ip_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_session`
--

LOCK TABLES `user_session` WRITE;
/*!40000 ALTER TABLE `user_session` DISABLE KEYS */;
INSERT INTO `user_session` VALUES ('4ocuid6jpov9oout8kmq5a1avf4s1jg3','127.0.0.1',1490681068,'__ci_last_regenerate|i:1490681068;'),('6mtorej3cd79cjccck8hpthc1ru6p0vl','127.0.0.1',1491683821,'__ci_last_regenerate|i:1491683821;'),('c2537u64vso43d3rrn2tsf6qr0t25s2j','127.0.0.1',1491419492,'__ci_last_regenerate|i:1491419492;score|s:1:\"0\";code|N;'),('cfic30prn9pm0rqf100n6eql22htus8h','127.0.0.1',1492280756,'__ci_last_regenerate|i:1492280749;apikey|s:80:\"JDJ5JDEwJDk2WXc5c3J1eW1wd1hPN1BjYjh4YmVjNmRvQXB1RkE5bHFBLlpMOTF4T2dPUXRXeExSdU11\";exp|s:19:\"2017-04-10 00:42:38\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('j5ovgeopnhdga21jjbh4r9k2p3tlkbmk','127.0.0.1',1491684902,'__ci_last_regenerate|i:1491684892;'),('lds5j9k0d9m1b8tljdoc539mhb37nqke','127.0.0.1',1490681068,'__ci_last_regenerate|i:1490681068;'),('lefd1dnh4n37so3lb61rl1kp0lc50nt3','127.0.0.1',1491164281,'__ci_last_regenerate|i:1491164281;'),('lhghf164oadkvp1k2hscvf955v28bfm8','127.0.0.1',1490991986,'__ci_last_regenerate|i:1490991986;'),('qr65d239k23rvp39do1h5l0tq1432mo0','127.0.0.1',1491749279,'__ci_last_regenerate|i:1491749277;apikey|s:1:\"2\";exp|s:1:\"2\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('s75dptfs1iten4njr062nhvqlngtm0pj','127.0.0.1',1491596103,'__ci_last_regenerate|i:1491596103;'),('u8nti51v5udq7o6tno35jjcj3euabdus','127.0.0.1',1491207459,'__ci_last_regenerate|i:1491207405;');
/*!40000 ALTER TABLE `user_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_visit`
--

DROP TABLE IF EXISTS `user_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_visit` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ctim` datetime NOT NULL,
  PRIMARY KEY (`no`),
  KEY `code` (`code`),
  KEY `no` (`no`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='방문자 확인 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_visit`
--

LOCK TABLES `user_visit` WRITE;
/*!40000 ALTER TABLE `user_visit` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'RGBplace'
--
/*!50003 DROP PROCEDURE IF EXISTS `create_map` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_map`(IN in_country char(2), in_local varchar(200), in_pol1 varchar(400), in_pol2 varchar(400))
BEGIN

DECLARE in_number bigint default 0;
SELECT number into in_number FROM map_code WHERE country = in_country LIMIT 1;
SET in_number = in_number + 1;


INSERT INTO map_code (country, number, place) values(in_country, in_number, concat("locality:", in_local, "&political1:", in_pol1, "&political2:", in_pol2));
SET @post = CONCAT('CREATE TABLE map_', in_country, in_number, '_post (
	no      bigint not null auto_increment,
	uid     varchar(100) not null,
	name    varchar(100) not null,
	ctim    datetime not null default current_timestamp,
	dtim    datetime not null,
	utim    datetime not null,
	title   varchar(1000) not null,
	content text not null,
	type    varchar(20) not null,
	tag     varchar(20) not null,
	keyword varchar(400) not null,
	PRIMARY KEY (no)
)');

PREPARE stmt1 FROM @post;
EXECUTE stmt1;

SET @reply = CONCAT('CREATE TABLE map_', in_country,  in_number, '_reply(
	no		bigint			not null auto_increment,
	uid		varchar(100)	not null,
	name	varchar(100)	not null,
	ctim	datetime		not null default current_timestamp,
	utim	datetime,
	dtim	datetime,
	content	varchar(2000)	not null,
	parent	bigint,
	PRIMARY KEY (no)
)');

PREPARE stmt2 FROM @reply;
EXECUTE stmt2;

DEALLOCATE PREPARE stmt1;
DEALLOCATE PREPARE stmt2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `drop_map` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `drop_map`(IN in_country char(2), in_number bigint)
BEGIN

DELETE FROM map_code WHERE country = in_country AND number = in_number;

SET @post = CONCAT('DROP TABLE map_', in_country, in_number, '_post');
PREPARE stmt1 FROM @post;
EXECUTE stmt1;

SET @reply= CONCAT('DROP TABLE map_', in_country, in_number, '_reply');
PREPARE stmt2 FROM @reply;
EXECUTE stmt2;

DEALLOCATE PREPARE stmt1;
DEALLOCATE PREPARE stmt2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-17  3:05:34