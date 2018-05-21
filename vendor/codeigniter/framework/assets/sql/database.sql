DROP DATABASE IF EXISTS `home`;
-- MySQL dump 10.16  Distrib 10.2.14-MariaDB, for osx10.13 (x86_64)
--
-- Host: localhost    Database: home
-- ------------------------------------------------------
-- Server version	10.2.14-MariaDB

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
-- Current Database: `home`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `home` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `home`;

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
  `fail` tinyint(4) NOT NULL DEFAULT 0,
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
INSERT INTO `admin_info` VALUES (1,'admin','daihyun99','JDJ5JDEyJGp6d2doM2REWnkxNlVTRWNsN3pGLnVwUUd4NDF4MjZhS1JYdTFQbGQ1aWJ3R2dhRTduQnFx',0,'2018-04-22 16:39:27','JDJ5JDEwJE5peEhIYlNudXhWdlAzRFV6WS5GTGUyTHBsemhjN2IvcG5yZkZRTVJrM1BQLlp1c01hTHlt','2018-04-23 04:39:27');
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
  `ctim` datetime NOT NULL DEFAULT current_timestamp(),
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
  `ctim` datetime NOT NULL DEFAULT current_timestamp(),
  `utim` datetime NOT NULL,
  `dtim` datetime NOT NULL,
  `title` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply` int(11) NOT NULL DEFAULT 0,
  `hit` int(11) NOT NULL DEFAULT 0,
  `vote` int(11) NOT NULL DEFAULT 0,
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
  `ctim` datetime NOT NULL DEFAULT current_timestamp(),
  `utim` datetime DEFAULT NULL,
  `dtim` datetime DEFAULT NULL,
  `content` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vote` int(11) NOT NULL DEFAULT 0,
  `post` int(11) DEFAULT NULL,
  `mention` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상대방 아이디',
  `follow` int(11) DEFAULT NULL,
  `depth1` int(11) NOT NULL DEFAULT 0,
  `depth2` int(11) NOT NULL DEFAULT 0,
  `depth3` int(11) NOT NULL DEFAULT 0,
  `depth4` int(11) NOT NULL DEFAULT 0,
  `depth5` int(11) NOT NULL DEFAULT 0,
  `depth6` int(11) NOT NULL DEFAULT 0,
  `depth7` int(11) NOT NULL DEFAULT 0,
  `depth8` int(11) NOT NULL DEFAULT 0,
  `depth9` int(11) NOT NULL DEFAULT 0,
  `depth10` int(11) NOT NULL DEFAULT 0,
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
  `ctim` datetime NOT NULL DEFAULT current_timestamp(),
  `utim` datetime NOT NULL,
  `dtim` datetime NOT NULL,
  `title` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply` int(11) NOT NULL DEFAULT 0,
  `hit` int(11) NOT NULL DEFAULT 0,
  `vote` int(11) NOT NULL DEFAULT 0,
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
  `ctim` datetime NOT NULL DEFAULT current_timestamp(),
  `utim` datetime DEFAULT NULL,
  `dtim` datetime DEFAULT NULL,
  `content` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vote` int(11) NOT NULL DEFAULT 0,
  `post` int(11) DEFAULT NULL,
  `mention` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상대방 아이디',
  `follow` int(11) DEFAULT NULL,
  `depth1` int(11) NOT NULL DEFAULT 0,
  `depth2` int(11) NOT NULL DEFAULT 0,
  `depth3` int(11) NOT NULL DEFAULT 0,
  `depth4` int(11) NOT NULL DEFAULT 0,
  `depth5` int(11) NOT NULL DEFAULT 0,
  `depth6` int(11) NOT NULL DEFAULT 0,
  `depth7` int(11) NOT NULL DEFAULT 0,
  `depth8` int(11) NOT NULL DEFAULT 0,
  `depth9` int(11) NOT NULL DEFAULT 0,
  `depth10` int(11) NOT NULL DEFAULT 0,
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
  `ctim` datetime NOT NULL DEFAULT current_timestamp(),
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
  `ctim` datetime NOT NULL DEFAULT current_timestamp(),
  `utim` datetime NOT NULL,
  `dtim` datetime NOT NULL,
  `title` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hit` int(11) NOT NULL DEFAULT 0,
  `vote` int(11) NOT NULL DEFAULT 0,
  `reply` int(11) NOT NULL DEFAULT 0,
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
  `ctim` datetime NOT NULL DEFAULT current_timestamp(),
  `utim` datetime DEFAULT NULL,
  `dtim` datetime DEFAULT NULL,
  `content` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vote` int(11) NOT NULL DEFAULT 0,
  `post` int(11) DEFAULT NULL,
  `mention` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상대방 아이디',
  `follow` int(11) DEFAULT NULL,
  `depth1` int(11) NOT NULL DEFAULT 0,
  `depth2` int(11) NOT NULL DEFAULT 0,
  `depth3` int(11) NOT NULL DEFAULT 0,
  `depth4` int(11) NOT NULL DEFAULT 0,
  `depth5` int(11) NOT NULL DEFAULT 0,
  `depth6` int(11) NOT NULL DEFAULT 0,
  `depth7` int(11) NOT NULL DEFAULT 0,
  `depth8` int(11) NOT NULL DEFAULT 0,
  `depth9` int(11) NOT NULL DEFAULT 0,
  `depth10` int(11) NOT NULL DEFAULT 0,
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
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ctim` datetime NOT NULL DEFAULT current_timestamp(),
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
  `ctim` datetime NOT NULL DEFAULT current_timestamp(),
  `utim` datetime DEFAULT NULL,
  `title` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply` bigint(20) NOT NULL DEFAULT 0,
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
  `sticky_sw` tinyint(1) NOT NULL DEFAULT 1,
  `map_sw` tinyint(1) NOT NULL DEFAULT 0,
  `notice_sw` tinyint(1) NOT NULL DEFAULT 0,
  `sound_sw` tinyint(1) NOT NULL DEFAULT 0,
  `tag_sw` tinyint(1) NOT NULL DEFAULT 0,
  `tag` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filter_sw` tinyint(1) NOT NULL DEFAULT 0,
  `filter` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `white_list` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `black_list` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `score` int(11) NOT NULL DEFAULT 0,
  `map` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fail` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '로그인 20회 실패시 차단, 성공시 초기화',
  `ctim` datetime NOT NULL DEFAULT current_timestamp(),
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
INSERT INTO `user_info` VALUES ('test01','테스트',NULL,'JDJ5JDEyJFY1dUc2dzdWdG9YWHpqRjJ5L3Zad2VwYWlmNDM0N0JSREpHYnRqaGd3aUJacEFFWVhaUjlH',0,'kr1',0,'2017-02-16 18:53:33','2018-04-22 16:30:32',NULL,NULL,''),('test02','삭제테스트',NULL,'JDJ5JDEyJEgxcmE5bWc4Nk5kZy9vYWU2MjdWeGV0VEUxLnlkUTRMNEppSnNtYUh5VXlFMlhRdC9YejN5',0,NULL,0,'2017-03-23 02:24:00','2017-12-30 18:04:59',NULL,NULL,''),('test03','ajax테스트',NULL,'JDJ5JDEyJFBqS3dUTi5CR1F5TWFFUTN1eUo2THVwUEJRaHpTTlJBWmFucVQzNGhUUE9LMTdac0hSb3Y2',0,NULL,0,'2017-03-23 15:30:42','2018-01-20 18:37:57',NULL,NULL,'');
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
  `ctim` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록 일자(create)',
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
  `timestamp` int(10) unsigned NOT NULL DEFAULT 0,
  `data` blob NOT NULL,
  PRIMARY KEY (`id`,`ip_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_session`
--

LOCK TABLES `user_session` WRITE;
/*!40000 ALTER TABLE `user_session` DISABLE KEYS */;
INSERT INTO `user_session` VALUES ('01pg31l7oe79d2glv892pmie9cfmrmo8','127.0.0.1',1523784258,'__ci_last_regenerate|i:1523784258;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('0270jol1d98v94q5susmvhdlb8g9coht','127.0.0.1',1518961898,'__ci_last_regenerate|i:1518961898;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('03ca6fdkgm466vafosbstttb4t3d9no9','127.0.0.1',1521853992,'__ci_last_regenerate|i:1521853992;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('0e7ip29no7d04jcsn2p09q4u0jrm3klk','127.0.0.1',1518873400,'__ci_last_regenerate|i:1518873400;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('0hh6kehkmtc2rav4e67v5ql02uqjucu0','127.0.0.1',1523070881,'__ci_last_regenerate|i:1523070881;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('0nsckooamqnqt71qr4g1t9lg33idpvpu','127.0.0.1',1523782803,'__ci_last_regenerate|i:1523782803;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('0ntvtl1fa0o4k83gin2jlo6cagndl4bg','127.0.0.1',1521859351,'__ci_last_regenerate|i:1521859351;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('1soq9licqm3m5ug3gf44uoarklko3vs1','127.0.0.1',1525503017,'__ci_last_regenerate|i:1525503017;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('23sd2163eeeke95vdlgsnbpe2l5mkau8','127.0.0.1',1526571793,'__ci_last_regenerate|i:1526571793;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('27eaqe3a0pp32tpt5rg6937tudhp9ka8','127.0.0.1',1518960893,'__ci_last_regenerate|i:1518960893;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('296qnj10853uafgaplico44gbmlla5bb','127.0.0.1',1525496025,'__ci_last_regenerate|i:1525496025;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('2a0mc5qg8sr9rq814cnosnllloplbbgg','127.0.0.1',1518699337,'__ci_last_regenerate|i:1518699337;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('2dfmn2bh96eabbbi60fljr07kmjsv7d4','127.0.0.1',1523068761,'__ci_last_regenerate|i:1523068761;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('2f3huh69c35pgfqv2bp8g07nl5nliea1','127.0.0.1',1524236107,'__ci_last_regenerate|i:1524236107;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('2vkr3etqsh5mg6msmr2jqrmahs69b35u','127.0.0.1',1524287320,'__ci_last_regenerate|i:1524287320;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('32b4u9fhhjasv6dg49pqleclao1pdh14','127.0.0.1',1523071657,'__ci_last_regenerate|i:1523071657;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('32m4juhv3iera2vjs6hj83e4qdhrvgv9','127.0.0.1',1518959345,'__ci_last_regenerate|i:1518959345;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('3a9mdkjieovo9svpr9chio006rb05iv3','127.0.0.1',1521737427,'__ci_last_regenerate|i:1521737427;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('3bpat6een1ouao97g7od5re9ts7dehcj','127.0.0.1',1524284940,'__ci_last_regenerate|i:1524284940;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('3f46glm62v5o6olcnlpgn1rjeop0ldg7','127.0.0.1',1525491475,'__ci_last_regenerate|i:1525491475;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('3na3gtfunmu281pco71sgib1v5dtkujq','127.0.0.1',1525492706,'__ci_last_regenerate|i:1525492706;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('3qo1apk0hbk7c6cip6o1osncuup1iu2t','127.0.0.1',1521854327,'__ci_last_regenerate|i:1521854327;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('47uqhj9n2hmvtq7dv78k1uf1bif29c1h','127.0.0.1',1524289101,'__ci_last_regenerate|i:1524289101;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('4870dnifonnkpbgc9q5k9g98l1rbr38s','127.0.0.1',1518702235,'__ci_last_regenerate|i:1518702235;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('4ftanh6qltnh6s85vn3fp6greto2n56p','127.0.0.1',1525504702,'__ci_last_regenerate|i:1525504702;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('4ta2r87k42ulpulng9hoankk425mf2ah','127.0.0.1',1518703022,'__ci_last_regenerate|i:1518703022;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('535ebo3lu99qvteq4u7rgk3hmn3pcqtr','127.0.0.1',1524414223,'__ci_last_regenerate|i:1524414223;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('5al43sgmrdri8slpt8pq2u807ss8g5bj','127.0.0.1',1518957209,'__ci_last_regenerate|i:1518957209;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('5b36g77q1e8urlo354ao6i78g58quhbu','127.0.0.1',1524234833,'__ci_last_regenerate|i:1524234833;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('5d8ollvktqqu5os0uetdhvnt92nlafr5','127.0.0.1',1523269580,'__ci_last_regenerate|i:1523269580;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('5kbk5ana0bfea37rma8ekebq0i4rj58n','127.0.0.1',1524288787,'__ci_last_regenerate|i:1524288787;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('5m022tju81a7n30hjq1et1lii3o8uqmt','127.0.0.1',1523072271,'__ci_last_regenerate|i:1523072271;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('5p7t7rdkj00096di1u75ngimjmlo8fcg','127.0.0.1',1525509348,'__ci_last_regenerate|i:1525509348;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('62vl6e55smm6cki86e64svub4h5rmvq7','127.0.0.1',1521734919,'__ci_last_regenerate|i:1521734919;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('63e6nkc6hgkptmoha6h4if8fcbm3n40n','127.0.0.1',1525490786,'__ci_last_regenerate|i:1525490786;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('65k02pknh266g5jp83obc2f21pqolna6','127.0.0.1',1526907905,'__ci_last_regenerate|i:1526907905;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('664oemvi94bgnk7jadtgivn9p4bbmvee','127.0.0.1',1523072806,'__ci_last_regenerate|i:1523072806;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('6gndg6rdv0s059t969gtbfuio7jd1b91','127.0.0.1',1518872934,'__ci_last_regenerate|i:1518872934;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('6ncsb5ku0m43g48vlu2b4201c8m7fjsd','127.0.0.1',1518869881,'__ci_last_regenerate|i:1518869881;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('6s7qq7sqi7p8gjc09oelr9pjpsnttgeh','127.0.0.1',1525509697,'__ci_last_regenerate|i:1525509697;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('6u6fehkb5ghvgtv85f4tbjvkrqltr65r','127.0.0.1',1524285263,'__ci_last_regenerate|i:1524285263;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('6uau3ttjdb3u4de07bqfe1vct6b7f6el','127.0.0.1',1523070534,'__ci_last_regenerate|i:1523070534;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('738nge4pa36ktfo94d0pl108u05lhflh','127.0.0.1',1524294635,'__ci_last_regenerate|i:1524294635;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('74ulmfmact2unrlhg9pbc13io43tn4af','127.0.0.1',1518700020,'__ci_last_regenerate|i:1518700020;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('79gcc0bf0imbbs3vsavoforourmqt3oe','127.0.0.1',1525187833,'__ci_last_regenerate|i:1525187833;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('7cddjru8j7942v9l8nr523o1afk48c6n','127.0.0.1',1524414628,'__ci_last_regenerate|i:1524414628;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('80k37imbqi7i7ag8o5tia1gtlh370il8','127.0.0.1',1525508183,'__ci_last_regenerate|i:1525508183;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('817gqhd7osq4sitsnoll4plrevmqphc3','127.0.0.1',1521852130,'__ci_last_regenerate|i:1521852130;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('82p0o2toler6fnspub8k8kcjt71m7em6','127.0.0.1',1519995305,'__ci_last_regenerate|i:1519995305;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('855bdhe4jlp7r0htgpiebteejdkobte6','127.0.0.1',1525493914,'__ci_last_regenerate|i:1525493914;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('86e4d1fl23gq8gmbmahjcsk9mkln0c2r','127.0.0.1',1525507785,'__ci_last_regenerate|i:1525507785;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('8bj33ntueqo3nn6mr7t1pvjku7bjvg4l','127.0.0.1',1518962201,'__ci_last_regenerate|i:1518962201;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('8h87puh89e3bc60joo3vbuehranfjl9g','127.0.0.1',1518702721,'__ci_last_regenerate|i:1518702721;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('8o4vqpl3f8bmp20nne0sjnib73kplc5u','127.0.0.1',1518960540,'__ci_last_regenerate|i:1518960540;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('8vomndi3g0i2i5isn73a3114uk462d90','127.0.0.1',1518870678,'__ci_last_regenerate|i:1518870678;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('95qma3tub7b29hmu5983frnmmqpmgbdi','127.0.0.1',1518787381,'__ci_last_regenerate|i:1518787381;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('98p3s5o9f2mvdhio688pt3vt2a6abfn7','127.0.0.1',1524294970,'__ci_last_regenerate|i:1524294970;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('9disk29n3165dndumh120tkjm0qhb2um','127.0.0.1',1524415808,'__ci_last_regenerate|i:1524415808;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('9l2lcpspbmq016fdgv6pfbhdlqtde0tm','127.0.0.1',1518956906,'__ci_last_regenerate|i:1518956906;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('adunmva2lb8hjff6urqd87dhu2erj300','127.0.0.1',1523783114,'__ci_last_regenerate|i:1523783114;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('ae541bm14itjrklutqvjcaoijpci7jvo','127.0.0.1',1525507310,'__ci_last_regenerate|i:1525507310;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('ahid52tl15e382gjs4ivkd679b0h288h','127.0.0.1',1521735355,'__ci_last_regenerate|i:1521735355;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('ajkh80okp9bku8hi0m4fvhor880md64g','127.0.0.1',1524293108,'__ci_last_regenerate|i:1524293108;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('alg4t9a5a8nufrcpf1af4im2n2fetfh9','127.0.0.1',1521853089,'__ci_last_regenerate|i:1521853089;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('arvmj8bk2gbf74prpk0346mvvbc1uj3t','127.0.0.1',1523781812,'__ci_last_regenerate|i:1523781812;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('b188slcilc4mfj3hi2hrmrnbkg8qhnf8','127.0.0.1',1518700401,'__ci_last_regenerate|i:1518700401;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('b5efclgkdla10rr05p1nfd8fcqlp0jo8','127.0.0.1',1521735710,'__ci_last_regenerate|i:1521735710;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('b940fnlvi9csusljtlk9qjetllr7kbq6','127.0.0.1',1524286188,'__ci_last_regenerate|i:1524286188;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('bfkq4ieqvg87tfl67av05v6ckvhu55cg','127.0.0.1',1521737071,'__ci_last_regenerate|i:1521737071;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('c1gntn38iql73u7h14an4lvsemvu4pvf','127.0.0.1',1524287889,'__ci_last_regenerate|i:1524287889;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('c8q9efgpib29jfda2o0dv80v7o1k9bah','127.0.0.1',1525493183,'__ci_last_regenerate|i:1525493183;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('cc06ks9disp09prdtd57hvblompancv1','127.0.0.1',1523074927,'__ci_last_regenerate|i:1523074927;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('ceshtu4n1st006f08lmoar49urqga4fd','127.0.0.1',1525497133,'__ci_last_regenerate|i:1525497133;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('cp02c9amrnfvq9cbm7878niogn3iktah','127.0.0.1',1523777955,'__ci_last_regenerate|i:1523777955;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('cr9l4sd5oa1gngnnh3v7r02als9q7vvv','127.0.0.1',1521738790,'__ci_last_regenerate|i:1521738790;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('d44gkmtlarc9sq2j7pao0apqh7uick5b','127.0.0.1',1523071295,'__ci_last_regenerate|i:1523071295;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('d48ela4r6p6ogdiv4qolqe6kah2v0ca4','127.0.0.1',1526572578,'__ci_last_regenerate|i:1526572578;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('df2le3tr3v86foanpglpgr5jh36650rt','127.0.0.1',1518698342,'__ci_last_regenerate|i:1518698342;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('dk8bhp819cgvv1g17hv53q64dpjmsftf','127.0.0.1',1521736042,'__ci_last_regenerate|i:1521736042;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('dl3mmqc2sqcoakrebb6gl088h8lqt4m2','127.0.0.1',1525509026,'__ci_last_regenerate|i:1525509026;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('eb76k2sl4fqoovd5f5t1h5cp67p8davh','127.0.0.1',1524405094,'__ci_last_regenerate|i:1524405094;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('ef94soiin0viekh291kkg3ivgqf2qr1k','127.0.0.1',1523786698,'__ci_last_regenerate|i:1523786698;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('ei4f5d9v3d0ntsb033b8ddl12psrtla3','127.0.0.1',1518785709,'__ci_last_regenerate|i:1518785709;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('eqb9ptkgvfcl7d1vkqea5nbihupvbaa6','127.0.0.1',1521852667,'__ci_last_regenerate|i:1521852667;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('f2amqdtmj77p8ue4gvh0lo4oni65s8vr','127.0.0.1',1526572240,'__ci_last_regenerate|i:1526572240;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('f4gtsau1tm1khedaagngkdsubqao71it','127.0.0.1',1526904470,'__ci_last_regenerate|i:1526904470;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('famdnmnn211d3aemqg4rghgf22v34qil','127.0.0.1',1521854982,'__ci_last_regenerate|i:1521854982;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('fvbl7l6ivuqlckofpsqaso132s5heiq9','127.0.0.1',1518701117,'__ci_last_regenerate|i:1518701117;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('gt4gj7cs8jskin59l1sid3up4aok1lg9','127.0.0.1',1525505103,'__ci_last_regenerate|i:1525505103;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('gur5sll086dufu26ch8jn4dnc07cu8rs','127.0.0.1',1525493550,'__ci_last_regenerate|i:1525493550;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('hbrdc1er4tb8cfiv055vvgg6cbquvh5d','127.0.0.1',1521859655,'__ci_last_regenerate|i:1521859655;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('hgrl99lls7pldpidfujfragfo7binv2g','127.0.0.1',1524235526,'__ci_last_regenerate|i:1524235526;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('hv6r1vf7tc8m1ll4q4cec1u61hs2h59m','127.0.0.1',1518787041,'__ci_last_regenerate|i:1518787041;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('i18fdhmfm7ecum5ppppef1c48hletovm','127.0.0.1',1525505450,'__ci_last_regenerate|i:1525505450;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('ie97ue5ue0vk45fj3m4prkte8e1rv359','127.0.0.1',1525491875,'__ci_last_regenerate|i:1525491875;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('iigd21uq0kl6kfpkqndes3337lr2fisu','127.0.0.1',1525495238,'__ci_last_regenerate|i:1525495238;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('j3pq20c3v2vk8hucc6cg5s9sj7n4m6qb','127.0.0.1',1526903802,'__ci_last_regenerate|i:1526903802;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('jbmrvgf3dbclg87v0omo0nqdsapeukp4','127.0.0.1',1521854673,'__ci_last_regenerate|i:1521854673;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('jil92li85j67gmadtn2jv8rf91h7rl08','127.0.0.1',1521855368,'__ci_last_regenerate|i:1521855368;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('jmk74n5dt4hr5puo74qds9k5ibad3h8m','127.0.0.1',1518957684,'__ci_last_regenerate|i:1518957684;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('k0c7ocu354hrdcht82ffemai0g4bgbqg','127.0.0.1',1519745709,'__ci_last_regenerate|i:1519745709;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('kbdtiegohvnsvbkpb6c11sqpmboea90t','127.0.0.1',1524295339,'__ci_last_regenerate|i:1524295339;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('kitci09rnb2ss20hdjlcplgaiva8k9g2','127.0.0.1',1526570085,'__ci_last_regenerate|i:1526570085;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('kk2140co4l3avii9v4kcmgakim2sgi19','127.0.0.1',1521860373,'__ci_last_regenerate|i:1521860373;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('km6okpvj3oafgr6tu3n1goinpgo18arh','127.0.0.1',1519745036,'__ci_last_regenerate|i:1519745036;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('kmd90c4casgb58r885q2u3v15ea2gfhh','127.0.0.1',1518695814,'__ci_last_regenerate|i:1518695814;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('kpgb23lt7kqj9pmelcs2ukgv181git62','127.0.0.1',1521737763,'__ci_last_regenerate|i:1521737763;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('ktf9icnk6d9sd9dktgeeqvupactjn6p6','127.0.0.1',1521738426,'__ci_last_regenerate|i:1521738426;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('l1nu54qid9c94m598n4o08f4ud80h89u','127.0.0.1',1518701704,'__ci_last_regenerate|i:1518701704;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('l22a7dvvac2s9ejgr19r6i9utert4a9j','127.0.0.1',1518963049,'__ci_last_regenerate|i:1518963049;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('l8hrgjtqrpel9gelapgjj972hlvecnh1','127.0.0.1',1518703327,'__ci_last_regenerate|i:1518703327;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('lkbd11t5omvem9afhs4p46ula0p3uab9','127.0.0.1',1526909071,'__ci_last_regenerate|i:1526909071;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('lm31t1mkidu50nlqi9p0gc2rlesobp68','127.0.0.1',1523783855,'__ci_last_regenerate|i:1523783855;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('lsdtpf64pfb3e84jcj51o39annh6f34p','127.0.0.1',1525508499,'__ci_last_regenerate|i:1525508499;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('lsn0k43r3vefjimv1hqq948of8erah5t','127.0.0.1',1523783554,'__ci_last_regenerate|i:1523783554;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('m8kotpvg7h827edkmhv4g6gpqfqas3rq','127.0.0.1',1523782446,'__ci_last_regenerate|i:1523782446;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('m9a43cjv5oq9nc76k46kib6se03busgb','127.0.0.1',1518699641,'__ci_last_regenerate|i:1518699641;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('mjbcc7rnc2hfdb6nutpdrc4p5b9ar4dn','127.0.0.1',1521859971,'__ci_last_regenerate|i:1521859971;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('mtaa25987a5g80ghus61jjl4c8lmmjl1','127.0.0.1',1526573233,'__ci_last_regenerate|i:1526573233;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('n2dklslr9e9j28g5f32pobsdb3clvkme','127.0.0.1',1521736743,'__ci_last_regenerate|i:1521736743;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('n8kkh2ve5hp24sb0vcskcjcjk2dllosn','127.0.0.1',1518786371,'__ci_last_regenerate|i:1518786371;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('nhcgrccl01ishu8vjp92s4fkd7paq1i8','127.0.0.1',1519745369,'__ci_last_regenerate|i:1519745369;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('njidtteo90n4qvrjuhl862alrvtum501','127.0.0.1',1518872438,'__ci_last_regenerate|i:1518872438;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('nqtgvo98870ng3nondne8m1idl7c8f6p','127.0.0.1',1524234509,'__ci_last_regenerate|i:1524234509;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('okjrk62o2tbpt8kpu2512pe3agglbi6m','127.0.0.1',1518874341,'__ci_last_regenerate|i:1518874341;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('ongbm716hv36s3bjbbrsluhn8i11np7a','127.0.0.1',1521736439,'__ci_last_regenerate|i:1521736439;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('ot4bb2sp9a5n5ce9sfot4g8qbeim5nh2','127.0.0.1',1523781410,'__ci_last_regenerate|i:1523781410;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('otiici1jnmo4oh9s6h61m3m7uvv6afvq','127.0.0.1',1518700787,'__ci_last_regenerate|i:1518700787;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('p2ctvaoma1gkhrqgdtinf8upaclh4mm4','127.0.0.1',1525495575,'__ci_last_regenerate|i:1525495575;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('po90ul9mn2g8q97rfpt96iso2miqan2b','127.0.0.1',1521738071,'__ci_last_regenerate|i:1521738071;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('pr3aac4bh0neadtfvblonndenet9mcc2','127.0.0.1',1518870357,'__ci_last_regenerate|i:1518870357;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('pv3gc2dmun0g95s7q2th4mc0rd4jajlk','127.0.0.1',1526909293,'__ci_last_regenerate|i:1526909071;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('qdvulfgs88p3efuqjg7odi3c12ful8is','127.0.0.1',1518874822,'__ci_last_regenerate|i:1518874822;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('qhpstgdpda4een9e0f9sk7a886s7tv5h','127.0.0.1',1524414980,'__ci_last_regenerate|i:1524414980;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:0;uid|s:6:\"test01\";name|s:9:\"테스트\";signed_in|b:1;'),('qu254arlpoci1d4kll0c18qo59a9npok','127.0.0.1',1519746018,'__ci_last_regenerate|i:1519746018;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('rek439724tc9m931i4km3lt27o0pfp45','127.0.0.1',1518870990,'__ci_last_regenerate|i:1518870990;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('riam4749qoo7pi0v5ngakdkb2tkdd85j','127.0.0.1',1518961217,'__ci_last_regenerate|i:1518961217;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('rni3pk0qsj95ocu1qpin980766u0o66h','127.0.0.1',1524235148,'__ci_last_regenerate|i:1524235148;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('roqpt26s3h70us1aidoo3470l5vb9me9','127.0.0.1',1525492404,'__ci_last_regenerate|i:1525492404;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('rtu8ro1d9np28csdre7cpefrd2tpabfc','127.0.0.1',1523780777,'__ci_last_regenerate|i:1523780777;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('s4hnbo553h13s86poepsiai096i61jut','127.0.0.1',1518696679,'__ci_last_regenerate|i:1518696679;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('s6ccj5jqlp4l0bdokd01i3fqco89bm4v','127.0.0.1',1521360579,'__ci_last_regenerate|i:1521360579;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('sdo75o3s93k62nfel43ut65qni2q89rn','127.0.0.1',1525494576,'__ci_last_regenerate|i:1525494576;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('t0fcck4ffnccti30c61rfms91a3p7ll9','127.0.0.1',1519746363,'__ci_last_regenerate|i:1519746363;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('tbv6on0ctpo9ps8kn4pa8m56gud5dq7f','127.0.0.1',1526908249,'__ci_last_regenerate|i:1526908249;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('tgpbvof6pkslmh4m8dvarafdi6f55b2m','127.0.0.1',1518697158,'__ci_last_regenerate|i:1518697158;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('tidnf8h438d7l8id2la5rva25ktcg8gp','127.0.0.1',1518696365,'__ci_last_regenerate|i:1518696365;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('tlnoldsf3vtm9mkokbad6upk2jec3f25','127.0.0.1',1518786045,'__ci_last_regenerate|i:1518786045;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('trksfksjgf5g4v7qdm17r2r2spdk9hku','127.0.0.1',1525491091,'__ci_last_regenerate|i:1525491091;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('ukbvltfok3sjiet6iagsuld8r3sss09o','127.0.0.1',1525494270,'__ci_last_regenerate|i:1525494270;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('uso65ffdprke2p33vdicmnrsa2mm8mj9','127.0.0.1',1518786716,'__ci_last_regenerate|i:1518786716;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('usrea3vq01p80u4co6f1ft8or8c1eklk','127.0.0.1',1521853410,'__ci_last_regenerate|i:1521853410;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('v1shff4j9f04pmdi9v99l77q41f6tlps','127.0.0.1',1523073182,'__ci_last_regenerate|i:1523073182;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('vglushak5pvofiimn50tfvklh2j7csjd','127.0.0.1',1518960210,'__ci_last_regenerate|i:1518960210;score|s:1:\"0\";map|s:3:\"kr1\";admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;');
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
-- Dumping routines for database 'home'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-21 22:29:28
