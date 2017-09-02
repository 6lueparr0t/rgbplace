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
INSERT INTO `admin_info` VALUES (1,'admin','daihyun99','JDJ5JDEyJGp6d2doM2REWnkxNlVTRWNsN3pGLnVwUUd4NDF4MjZhS1JYdTFQbGQ1aWJ3R2dhRTduQnFx',0,'2017-09-02 23:10:41','JDJ5JDEwJG1QTHVNamZ6N0d3ajZyVFdvSDdpY3VsSnN5VkJ4ek9DSGFTdG11amx4S3RTTklLcDlFOEdD','2017-09-03 01:59:24');
/*!40000 ALTER TABLE `admin_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_code`
--

DROP TABLE IF EXISTS `map_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_code` (
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Country Name',
  `code` char(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Country Code',
  `no` bigint(20) NOT NULL,
  `place` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ctim` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utim` datetime DEFAULT NULL,
  `btim` datetime DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `editor` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyword` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`code`,`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='장소(Code) 정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_code`
--

LOCK TABLES `map_code` WRITE;
/*!40000 ALTER TABLE `map_code` DISABLE KEYS */;
INSERT INTO `map_code` VALUES ('대한민국|Republic of Korea','kr',1,'locality:서울특별시|Seoul&political1:동작구|Dongjak-gu&political2:흑석동|Heukseok-dong','2017-05-06 00:16:38',NULL,NULL,'','','한국'),('대한민국|Republic of Korea','kr',2,'locality:서울특별시|Seoul&political1:동작구|Dongjak-gu&political2:상도동|Sangdo-dong','2017-08-16 23:24:23',NULL,NULL,'','',NULL);
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
  `utim` datetime NOT NULL,
  `dtim` datetime NOT NULL,
  `title` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply` bigint(20) NOT NULL DEFAULT '0',
  `hits` bigint(20) NOT NULL DEFAULT '0',
  `vote` bigint(20) NOT NULL DEFAULT '0',
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
  `vote` bigint(20) NOT NULL DEFAULT '0',
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
-- Table structure for table `map_kr2_post`
--

DROP TABLE IF EXISTS `map_kr2_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_kr2_post` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ctim` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utim` datetime NOT NULL,
  `dtim` datetime NOT NULL,
  `title` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply` bigint(20) NOT NULL DEFAULT '0',
  `hits` bigint(20) NOT NULL DEFAULT '0',
  `vote` bigint(20) NOT NULL DEFAULT '0',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyword` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_kr2_post`
--

LOCK TABLES `map_kr2_post` WRITE;
/*!40000 ALTER TABLE `map_kr2_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `map_kr2_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_kr2_reply`
--

DROP TABLE IF EXISTS `map_kr2_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_kr2_reply` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ctim` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utim` datetime DEFAULT NULL,
  `dtim` datetime DEFAULT NULL,
  `content` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vote` bigint(20) NOT NULL DEFAULT '0',
  `parent` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_kr2_reply`
--

LOCK TABLES `map_kr2_reply` WRITE;
/*!40000 ALTER TABLE `map_kr2_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `map_kr2_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_notice`
--

DROP TABLE IF EXISTS `map_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_notice` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  PRIMARY KEY (`no`),
  KEY `no` (`no`),
  KEY `uid` (`uid`)
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
-- Table structure for table `map_space_post`
--

DROP TABLE IF EXISTS `map_space_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_space_post` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ctim` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utim` datetime NOT NULL,
  `dtim` datetime NOT NULL,
  `title` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hits` bigint(20) NOT NULL DEFAULT '0',
  `vote` bigint(20) NOT NULL DEFAULT '0',
  `reply` bigint(20) NOT NULL DEFAULT '0',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyword` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_space_post`
--

LOCK TABLES `map_space_post` WRITE;
/*!40000 ALTER TABLE `map_space_post` DISABLE KEYS */;
INSERT INTO `map_space_post` VALUES (1,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Hello, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',0,0,0,'best','first',''),(2,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Hello, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',0,0,0,'best','first',''),(3,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Hello, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',0,0,0,'best','first',''),(4,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Hello, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',0,0,0,'best','first',''),(5,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Hello, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',0,0,0,'best','first',''),(6,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Hello, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',0,0,0,'best','first','');
/*!40000 ALTER TABLE `map_space_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_space_reply`
--

DROP TABLE IF EXISTS `map_space_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_space_reply` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ctim` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utim` datetime DEFAULT NULL,
  `dtim` datetime DEFAULT NULL,
  `content` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vote` bigint(20) NOT NULL DEFAULT '0',
  `parent` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_space_reply`
--

LOCK TABLES `map_space_reply` WRITE;
/*!40000 ALTER TABLE `map_space_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `map_space_reply` ENABLE KEYS */;
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
  `link` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ctim` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utim` datetime DEFAULT NULL,
  `title` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply` bigint(20) NOT NULL DEFAULT '0',
  `tag` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyword` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`link`),
  KEY `link` (`link`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='전체 게시글 리스트';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_total`
--

LOCK TABLES `map_total` WRITE;
/*!40000 ALTER TABLE `map_total` DISABLE KEYS */;
INSERT INTO `map_total` VALUES ('space/1','test','2017-08-17 13:47:16',NULL,'Hello, World!',0,'test',NULL);
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
  `sticky_sw` tinyint(1) NOT NULL DEFAULT '1',
  `map_sw` tinyint(1) NOT NULL DEFAULT '0',
  `notice_sw` tinyint(1) NOT NULL DEFAULT '0',
  `sound_sw` tinyint(1) NOT NULL DEFAULT '0',
  `tag_sw` tinyint(1) NOT NULL DEFAULT '0',
  `tag` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filter_sw` tinyint(1) NOT NULL DEFAULT '0',
  `filter` text COLLATE utf8mb4_unicode_ci,
  `white_list` text COLLATE utf8mb4_unicode_ci,
  `black_list` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='유저 계정 설정';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_conf`
--

LOCK TABLES `user_conf` WRITE;
/*!40000 ALTER TABLE `user_conf` DISABLE KEYS */;
INSERT INTO `user_conf` VALUES ('test01',1,0,0,0,0,NULL,0,NULL,NULL,NULL),('test02',1,0,0,0,0,NULL,0,NULL,NULL,NULL),('test03',1,0,0,0,0,NULL,0,NULL,NULL,NULL);
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
  `map` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
INSERT INTO `user_info` VALUES ('test01','테스트',NULL,'JDJ5JDEyJFY1dUc2dzdWdG9YWHpqRjJ5L3Zad2VwYWlmNDM0N0JSREpHYnRqaGd3aUJacEFFWVhaUjlH',0,'kr1',0,'2017-02-16 18:53:33','2017-09-02 13:59:02',NULL,NULL,''),('test02','삭제테스트',NULL,'JDJ5JDEyJEgxcmE5bWc4Nk5kZy9vYWU2MjdWeGV0VEUxLnlkUTRMNEppSnNtYUh5VXlFMlhRdC9YejN5',0,NULL,0,'2017-03-23 02:24:00',NULL,NULL,NULL,''),('test03','ajax테스트',NULL,'JDJ5JDEyJFBqS3dUTi5CR1F5TWFFUTN1eUo2THVwUEJRaHpTTlJBWmFucVQzNGhUUE9LMTdac0hSb3Y2',0,NULL,0,'2017-03-23 15:30:42',NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_ipban`
--

DROP TABLE IF EXISTS `user_ipban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_ipban` (
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
-- Dumping data for table `user_ipban`
--

LOCK TABLES `user_ipban` WRITE;
/*!40000 ALTER TABLE `user_ipban` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_ipban` ENABLE KEYS */;
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
INSERT INTO `user_session` VALUES ('3fl4v75f464nk0p4oalncudeuifjh18p','192.168.219.104',1504328370,'__ci_last_regenerate|i:1504328237;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('4clpd3l9fukkolh3nbfpkuv8kv9m43vo','127.0.0.1',1504361446,'__ci_last_regenerate|i:1504361435;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;');
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
  `map` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ctim` datetime NOT NULL,
  PRIMARY KEY (`no`),
  KEY `code` (`map`),
  KEY `no` (`no`,`map`)
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
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_map`(IN `in_country` VARCHAR(100), IN `in_code` CHAR(2), IN `in_local` VARCHAR(200), IN `in_pol1` VARCHAR(400), IN `in_pol2` VARCHAR(400))
BEGIN

DECLARE in_no bigint default 0;
SELECT count(no) into in_no FROM map_code WHERE code = in_code;
SET in_no = in_no + 1;



INSERT INTO map_code (country, code, no, place) values(in_country, in_code, in_no, concat("locality:", in_local, "&political1:", in_pol1, "&political2:", in_pol2));
SET @post = CONCAT('CREATE TABLE map_', in_code, in_no, '_post (\n\tno      bigint not null auto_increment,\n\tuid     varchar(100) not null,\n\tcountry    varchar(100) not null,\n\tctim    datetime not null default current_timestamp,\n\tutim    datetime not null,\n\tdtim    datetime not null,\n\ttitle   varchar(1000) not null,\n\tcontent text not null,\n\treply bigint not null default 0,\n\thits bigint not null default 0,\n\tvote bigint not null default 0,\n\ttype    varchar(20) not null,\n\ttag     varchar(20) not null,\n\tkeyword varchar(400) not null,\n\tPRIMARY KEY (no)\n)');

PREPARE stmt1 FROM @post;
EXECUTE stmt1;

SET @reply = CONCAT('CREATE TABLE map_', in_code,  in_no, '_reply(\n\tno\t\tbigint\t\t\tnot null auto_increment,\n\tuid\t\tvarchar(100)\tnot null,\n\tcountry\tvarchar(100)\tnot null,\n\tctim\tdatetime\t\tnot null default current_timestamp,\n\tutim\tdatetime,\n\tdtim\tdatetime,\n\tcontent\tvarchar(2000)\tnot null,\nvote bigint not null default 0,\n\tparent\tbigint,\n\tPRIMARY KEY (no)\n)');

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
CREATE DEFINER=`root`@`localhost` PROCEDURE `drop_map`(IN in_code char(2), in_no bigint)
BEGIN

DELETE FROM map_code WHERE code = in_code AND no = in_no;

SET @post = CONCAT('DROP TABLE map_', in_code, in_no, '_post');
PREPARE stmt1 FROM @post;
EXECUTE stmt1;

SET @reply= CONCAT('DROP TABLE map_', in_code, in_no, '_reply');
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

-- Dump completed on 2017-09-02 23:10:53
