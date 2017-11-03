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
INSERT INTO `admin_info` VALUES (1,'admin','daihyun99','JDJ5JDEyJGp6d2doM2REWnkxNlVTRWNsN3pGLnVwUUd4NDF4MjZhS1JYdTFQbGQ1aWJ3R2dhRTduQnFx',0,'2017-10-31 23:56:38','JDJ5JDEwJDhOcXovcE15OEZldm1VZnFRTm1Cc3VvRS5Rcm0yTlNqekcwOUFFc0tidVlLa01aT2dkVlFp','2017-11-01 11:56:38');
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
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ctim` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utim` datetime NOT NULL,
  `dtim` datetime NOT NULL,
  `title` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply` int(11) NOT NULL DEFAULT '0',
  `hit` int(11) NOT NULL DEFAULT '0',
  `vote` int(11) NOT NULL DEFAULT '0',
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
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ctim` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utim` datetime DEFAULT NULL,
  `dtim` datetime DEFAULT NULL,
  `content` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vote` int(11) NOT NULL DEFAULT '0',
  `post` int(11) DEFAULT NULL,
  `mention` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상대방 아이디',
  `follow` int(11) DEFAULT NULL,
  `depth1` int(11) NOT NULL DEFAULT '0',
  `depth2` int(11) NOT NULL DEFAULT '0',
  `depth3` int(11) NOT NULL DEFAULT '0',
  `depth4` int(11) NOT NULL DEFAULT '0',
  `depth5` int(11) NOT NULL DEFAULT '0',
  `depth6` int(11) NOT NULL DEFAULT '0',
  `depth7` int(11) NOT NULL DEFAULT '0',
  `depth8` int(11) NOT NULL DEFAULT '0',
  `depth9` int(11) NOT NULL DEFAULT '0',
  `depth10` int(11) NOT NULL DEFAULT '0',
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
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ctim` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utim` datetime NOT NULL,
  `dtim` datetime NOT NULL,
  `title` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply` int(11) NOT NULL DEFAULT '0',
  `hit` int(11) NOT NULL DEFAULT '0',
  `vote` int(11) NOT NULL DEFAULT '0',
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
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ctim` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utim` datetime DEFAULT NULL,
  `dtim` datetime DEFAULT NULL,
  `content` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vote` int(11) NOT NULL DEFAULT '0',
  `post` int(11) DEFAULT NULL,
  `mention` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상대방 아이디',
  `follow` int(11) DEFAULT NULL,
  `depth1` int(11) NOT NULL DEFAULT '0',
  `depth2` int(11) NOT NULL DEFAULT '0',
  `depth3` int(11) NOT NULL DEFAULT '0',
  `depth4` int(11) NOT NULL DEFAULT '0',
  `depth5` int(11) NOT NULL DEFAULT '0',
  `depth6` int(11) NOT NULL DEFAULT '0',
  `depth7` int(11) NOT NULL DEFAULT '0',
  `depth8` int(11) NOT NULL DEFAULT '0',
  `depth9` int(11) NOT NULL DEFAULT '0',
  `depth10` int(11) NOT NULL DEFAULT '0',
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
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ctim` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utim` datetime NOT NULL,
  `dtim` datetime NOT NULL,
  `title` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hit` int(11) NOT NULL DEFAULT '0',
  `vote` int(11) NOT NULL DEFAULT '0',
  `reply` int(11) NOT NULL DEFAULT '0',
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
INSERT INTO `map_space_post` VALUES (1,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Hello, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',0,0,5,'best','first',''),(2,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Hello, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',0,0,0,'best','first',''),(3,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Hello, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',0,0,0,'best','first',''),(4,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Hello, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',0,0,0,'best','first',''),(5,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Hello, 한글!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',0,0,0,'best','first',''),(6,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Test, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',0,0,0,'best','first','');
/*!40000 ALTER TABLE `map_space_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_space_reply`
--

DROP TABLE IF EXISTS `map_space_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_space_reply` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ctim` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utim` datetime DEFAULT NULL,
  `dtim` datetime DEFAULT NULL,
  `content` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vote` int(11) NOT NULL DEFAULT '0',
  `post` int(11) DEFAULT NULL,
  `mention` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상대방 아이디',
  `follow` int(11) DEFAULT NULL,
  `depth1` int(11) NOT NULL DEFAULT '0',
  `depth2` int(11) NOT NULL DEFAULT '0',
  `depth3` int(11) NOT NULL DEFAULT '0',
  `depth4` int(11) NOT NULL DEFAULT '0',
  `depth5` int(11) NOT NULL DEFAULT '0',
  `depth6` int(11) NOT NULL DEFAULT '0',
  `depth7` int(11) NOT NULL DEFAULT '0',
  `depth8` int(11) NOT NULL DEFAULT '0',
  `depth9` int(11) NOT NULL DEFAULT '0',
  `depth10` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_space_reply`
--

LOCK TABLES `map_space_reply` WRITE;
/*!40000 ALTER TABLE `map_space_reply` DISABLE KEYS */;
INSERT INTO `map_space_reply` VALUES (1,'test02','test02','2017-10-03 20:38:13',NULL,NULL,'1',0,1,'test01',NULL,0,0,0,0,0,0,0,0,0,0),(2,'test01','test01','2017-10-03 22:08:17',NULL,NULL,'1',0,1,'',1,0,0,0,0,0,0,0,0,0,0),(3,'test01','test01','2017-10-03 22:09:56',NULL,NULL,'2',0,1,'',NULL,0,0,0,0,0,0,0,0,0,0),(4,'test01','test01','2017-10-03 22:13:47',NULL,NULL,'4',0,1,'',1,1,0,0,0,0,0,0,0,0,0),(5,'test01','test01','2017-10-03 22:14:38',NULL,NULL,'5',0,1,'',1,2,0,0,0,0,0,0,0,0,0),(6,'test01','test01','2017-10-03 22:15:14',NULL,NULL,'6',0,1,'',1,1,1,0,0,0,0,0,0,0,0),(7,'test01','test01','2017-10-03 22:16:21',NULL,NULL,'7',0,1,'',1,1,1,1,0,0,0,0,0,0,0);
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
INSERT INTO `user_info` VALUES ('test01','테스트',NULL,'JDJ5JDEyJFY1dUc2dzdWdG9YWHpqRjJ5L3Zad2VwYWlmNDM0N0JSREpHYnRqaGd3aUJacEFFWVhaUjlH',0,'kr1',0,'2017-02-16 18:53:33','2017-10-24 18:20:32',NULL,NULL,''),('test02','삭제테스트',NULL,'JDJ5JDEyJEgxcmE5bWc4Nk5kZy9vYWU2MjdWeGV0VEUxLnlkUTRMNEppSnNtYUh5VXlFMlhRdC9YejN5',0,NULL,0,'2017-03-23 02:24:00',NULL,NULL,NULL,''),('test03','ajax테스트',NULL,'JDJ5JDEyJFBqS3dUTi5CR1F5TWFFUTN1eUo2THVwUEJRaHpTTlJBWmFucVQzNGhUUE9LMTdac0hSb3Y2',0,NULL,0,'2017-03-23 15:30:42',NULL,NULL,NULL,'');
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
INSERT INTO `user_session` VALUES ('02vi46hl3fbn1l9u8fkvdpvpqen6dcpl','127.0.0.1',1508840197,'__ci_last_regenerate|i:1508840197;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:0;uid|s:6:\"test01\";name|s:9:\"테스트\";signed_in|b:1;'),('0amvotrp9adol4p7440g4to1tdk4397g','127.0.0.1',1508681290,'__ci_last_regenerate|i:1508681290;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('1boohd73g0ltlm5hif3ofqqv70mm6ceo','127.0.0.1',1508835714,'__ci_last_regenerate|i:1508835714;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('1fdfs1svmts62htob3fnhobnri2dllsv','127.0.0.1',1508841617,'__ci_last_regenerate|i:1508841617;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:0;uid|s:6:\"test01\";name|s:9:\"테스트\";signed_in|b:1;'),('28hbi34lcul8pcr8n29t01lrhte8j857','127.0.0.1',1509461791,'__ci_last_regenerate|i:1509461791;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:0;uid|s:6:\"test01\";name|s:9:\"테스트\";signed_in|b:1;'),('2i0i6bkrge1a6vrhq79rihadrfj4s5uq','127.0.0.1',1508679430,'__ci_last_regenerate|i:1508679430;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('3p5gd27d3s5p92g565108iov74gavbuu','127.0.0.1',1508840878,'__ci_last_regenerate|i:1508840878;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:0;uid|s:6:\"test01\";name|s:9:\"테스트\";signed_in|b:1;'),('44hj8d9uo1d8qjcomfr5h87i0k8l7vkj','127.0.0.1',1508831103,'__ci_last_regenerate|i:1508831103;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('61b6thtvvk6dieq3r90mr3vuc9nh3qoh','127.0.0.1',1508680934,'__ci_last_regenerate|i:1508680934;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('6imibjqdju7ul61cpnc37sifa6o4got1','127.0.0.1',1509465539,'__ci_last_regenerate|i:1509465539;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('7g6s4aqb7rm3u7a84r26uqg42ctrdvk3','127.0.0.1',1508679127,'__ci_last_regenerate|i:1508679127;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('7tt14lse88sl3g73lt7nde4pvjhikr20','127.0.0.1',1508681612,'__ci_last_regenerate|i:1508681612;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('8mhrmiqa1fainog2o7ui8od443a638ig','127.0.0.1',1509130803,'__ci_last_regenerate|i:1509130803;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:0;uid|s:6:\"test01\";name|s:9:\"테스트\";signed_in|b:1;'),('9a8msna215i64e0tc72fg7o6211b38ie','127.0.0.1',1508680601,'__ci_last_regenerate|i:1508680601;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('c5tnj23c5d4l8qnp6fu6ii2mukdr749b','127.0.0.1',1508838277,'__ci_last_regenerate|i:1508838277;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:0;uid|s:6:\"test01\";name|s:9:\"테스트\";signed_in|b:1;'),('cb9ht8u6deq5d50usn3vhpgb4ici113e','127.0.0.1',1509465234,'__ci_last_regenerate|i:1509465234;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('cc10gct9fjrgfbij3oafj9vec2kbe6of','127.0.0.1',1508839697,'__ci_last_regenerate|i:1508839697;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:0;uid|s:6:\"test01\";name|s:9:\"테스트\";signed_in|b:1;'),('cgmn563a0cke92p1k16ipuhas3mq8022','127.0.0.1',1508676159,'__ci_last_regenerate|i:1508676159;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('chmr17oeed8j1t70f4fl5rb1uaeijhni','127.0.0.1',1508678825,'__ci_last_regenerate|i:1508678825;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('cs5l7nefje4d7q0i9fv42blfflc1cbos','127.0.0.1',1508675706,'__ci_last_regenerate|i:1508675706;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('e734josuefbqg0js15jip73r2nb39amp','127.0.0.1',1509466220,'__ci_last_regenerate|i:1509466210;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('elr9etrvcll0j5m95g8jqe4kcp8os2ie','127.0.0.1',1508831977,'__ci_last_regenerate|i:1508831977;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('fk3jto1qqsbg88v9rfm0bmar75ip9pfv','127.0.0.1',1508831526,'__ci_last_regenerate|i:1508831526;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('fk665eheme69vbbejqtc7ckc7pi555pm','127.0.0.1',1508841308,'__ci_last_regenerate|i:1508841308;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:0;uid|s:6:\"test01\";name|s:9:\"테스트\";signed_in|b:1;'),('gcapedmbnmtqhtoqi6khsfgnjg5k4mc6','127.0.0.1',1508835225,'__ci_last_regenerate|i:1508835225;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('h0d8igmu1lck3ncrdskmjoluj2dp04dd','127.0.0.1',1509460012,'__ci_last_regenerate|i:1509460012;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:0;uid|s:6:\"test01\";name|s:9:\"테스트\";signed_in|b:1;'),('i3bu9b0d01trudul2srnhqr9ejr7rqqf','127.0.0.1',1508839382,'__ci_last_regenerate|i:1508839382;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:0;uid|s:6:\"test01\";name|s:9:\"테스트\";signed_in|b:1;'),('igiddafkmpooud9dsh85l11ip5fs4m3d','127.0.0.1',1508676513,'__ci_last_regenerate|i:1508676513;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('ik28njl3j30dumu5kisu6jbvlsms3kft','127.0.0.1',1508836826,'__ci_last_regenerate|i:1508836826;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('klfl93eipt72rhh6cmrub1nrva19vi3t','127.0.0.1',1508679905,'__ci_last_regenerate|i:1508679905;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('l04binkp9q4djs9qmph9tvcb4p5gr207','127.0.0.1',1508840522,'__ci_last_regenerate|i:1508840522;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:0;uid|s:6:\"test01\";name|s:9:\"테스트\";signed_in|b:1;'),('m0it40irm6l8kltqmr3pbvs2re8ks9ud','127.0.0.1',1508674447,'__ci_last_regenerate|i:1508674447;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('m2ba4ijik411bjkc9q3gl3s7qp5rq5sb','127.0.0.1',1509135411,'__ci_last_regenerate|i:1509135411;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:0;uid|s:6:\"test01\";name|s:9:\"테스트\";signed_in|b:1;'),('n6a29t6al42mnku2pa226p0s9itf0pm1','127.0.0.1',1508678003,'__ci_last_regenerate|i:1508678003;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('neobi1l1815hlrri3704qkl7l81k9i2v','127.0.0.1',1508677649,'__ci_last_regenerate|i:1508677649;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('nr2p4fpjh6it679li97iqo3nbnk56rjq','127.0.0.1',1508839040,'__ci_last_regenerate|i:1508839040;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:0;uid|s:6:\"test01\";name|s:9:\"테스트\";signed_in|b:1;'),('nsm3oc81uvg9n20m4jftmufueam6e3tk','127.0.0.1',1508838580,'__ci_last_regenerate|i:1508838580;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:0;uid|s:6:\"test01\";name|s:9:\"테스트\";signed_in|b:1;'),('oldm00hi4kfgki8jguqev6obub1ds280','127.0.0.1',1508675056,'__ci_last_regenerate|i:1508675056;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('qbms3df7uh7gjuprfe33frpco3uqa382','127.0.0.1',1509465851,'__ci_last_regenerate|i:1509465851;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('qir62l7ktbnemaltp9mmkfhifv2es1mm','127.0.0.1',1508678434,'__ci_last_regenerate|i:1508678434;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('qr56h0cl38ji1rnafv2i2bm3339erafv','127.0.0.1',1508841922,'__ci_last_regenerate|i:1508841922;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:0;uid|s:6:\"test01\";name|s:9:\"테스트\";signed_in|b:1;'),('qtdbftos2mbiqtritt04n57snb7lm2d4','127.0.0.1',1508674749,'__ci_last_regenerate|i:1508674749;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('t5s2isluf94u92hk5rvattbapgmmgoft','127.0.0.1',1508724017,'__ci_last_regenerate|i:1508724017;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('ugjn66gftaepfka4h9b13vpaqr5uh5u6','127.0.0.1',1509466210,'__ci_last_regenerate|i:1509466210;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('uvqn8ol0c0fp1s6pni03fspm7itckraj','127.0.0.1',1508680294,'__ci_last_regenerate|i:1508680294;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;');
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

DECLARE in_no int default 0;
SELECT count(no) into in_no FROM map_code WHERE code = in_code;
SET in_no = in_no + 1;



INSERT INTO map_code (country, code, no, place) values(in_country, in_code, in_no, concat("locality:", in_local, "&political1:", in_pol1, "&political2:", in_pol2));
SET @post = CONCAT('CREATE TABLE map_', in_code, in_no, '_post (\n\tno      int not null auto_increment,\n\tuid     varchar(100) not null,\n\tcountry    varchar(100) not null,\n\tctim    datetime not null default current_timestamp,\n\tutim    datetime not null,\n\tdtim    datetime not null,\n\ttitle   varchar(1000) not null,\n\tcontent text not null,\n\treply int not null default 0,\n\thit int not null default 0,\n\tvote int not null default 0,\n\ttype    varchar(20) not null,\n\ttag     varchar(20) not null,\n\tkeyword varchar(400) not null,\n\tPRIMARY KEY (no)\n)');

PREPARE stmt1 FROM @post;
EXECUTE stmt1;

SET @reply = CONCAT('CREATE TABLE map_', in_code,  in_no, '_reply(\n\tno\t\tint\t\t\tnot null auto_increment,\n\tuid\t\tvarchar(100)\tnot null,\n\tname\tvarchar(100)\tnot null,\n\tctim\tdatetime\t\tnot null default current_timestamp,\n\tutim\tdatetime,\n\tdtim\tdatetime,\n\tcontent\tvarchar(2000)\tnot null,\nvote int not null default 0,\n\tpost\tint not null,\n\tmention\tvarchar(100) default null,\n\tfollow\tint null default null,\n\tdepth1 int not null default 0\r\n, \n\tdepth2 int not null default 0\r\n, \n\tdeprh3 int not null default 0\r\n, \n\tdepth4 int not null default 0\r\n, \n\tdepth5 int not null default 0\r\n, \n\tdepth6 int not null default 0\r\n, \n\tdepth7 int not null default 0\r\n, \n\tdepth8 int not null default 0\r\n, \n\tdepth9 int not null default 0\r\n, \n\tdepth10 int not null default 0\r\n, \n\tPRIMARY KEY (no)\n)');

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

-- Dump completed on 2017-11-01  1:10:43
