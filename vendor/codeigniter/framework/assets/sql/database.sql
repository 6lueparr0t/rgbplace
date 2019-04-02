DROP DATABASE IF EXISTS `home`;
-- MySQL dump 10.17  Distrib 10.3.12-MariaDB, for osx10.14 (x86_64)
--
-- Host: localhost    Database: home
-- ------------------------------------------------------
-- Server version	10.3.12-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
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
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pswd` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fail` tinyint(4) NOT NULL DEFAULT 0,
  `atim` datetime DEFAULT NULL,
  `apikey` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exp` datetime DEFAULT NULL,
  `msg` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '{"total":[]}',
  PRIMARY KEY (`sn`),
  KEY `no` (`sn`),
  KEY `name` (`name`),
  KEY `no_2` (`sn`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='관리자 정보 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_info`
--

LOCK TABLES `admin_info` WRITE;
/*!40000 ALTER TABLE `admin_info` DISABLE KEYS */;
INSERT INTO `admin_info` VALUES (1,'admin','root','JDJ5JDEyJHplS21IV2Q4bXVlWGNJYU8wZEQ3RU9hZXNuYWtrLy5FUXRSU29TUDkuS3FSWjAvbG5NbktH',0,'2019-02-21 17:38:18','JDJ5JDEwJHl6N3ZmRFhnNTEzY2JtSy9sYXVuZHUzY2NqYW12azIzZjJFaGtWclViRTI1WXFsNlVqdFRP','2019-02-22 05:38:18','{\"total\": []}');
/*!40000 ALTER TABLE `admin_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_code`
--

DROP TABLE IF EXISTS `map_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_code` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` char(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Country Code',
  `num` int(11) DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Country Name',
  `native` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '로컬 표기 주소',
  `global` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '영문 표기 주소',
  `ctim` datetime NOT NULL DEFAULT current_timestamp(),
  `utim` datetime DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'Admin',
  `keyword` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` double NOT NULL COMMENT '위도',
  `longitude` double NOT NULL COMMENT '경도',
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='장소(Code) 정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_code`
--

LOCK TABLES `map_code` WRITE;
/*!40000 ALTER TABLE `map_code` DISABLE KEYS */;
INSERT INTO `map_code` VALUES (9,'kr1','kr',1,'대한민국|South Korea','{\"address\": [\"괴안동\",\"소사구\",\"부천시\",\"경기도\",\"대한민국\"]}','{\"address\": [\"Goean-dong\",\"Sosa-gu\",\"Bucheon-si\",\"Gyeonggi-do\",\"South Korea\"]}','2019-02-02 14:58:17',NULL,'','Admin','한국',37.47581767319603,126.80552121712878),(11,'kr2','kr',2,'대한민국|South Korea','{\"address\": [\"부개1동\",\"부평구\",\"인천광역시\",\"대한민국\"]}','{\"address\": [\"Bugae 1(il)-dong\",\"Bupyeong-gu\",\"Incheon\",\"South Korea\"]}','2019-02-02 15:48:34',NULL,'','Admin','대한민국',37.4881662387444,126.73341323880845);
/*!40000 ALTER TABLE `map_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_kr1_history`
--

DROP TABLE IF EXISTS `map_kr1_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_kr1_history` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `sn` int(11) DEFAULT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('post','reply') COLLATE utf8mb4_unicode_ci NOT NULL,
  `relation` int(11) NOT NULL,
  `post` int(11) NOT NULL,
  `ctim` datetime NOT NULL DEFAULT current_timestamp(),
  `utim` datetime DEFAULT NULL,
  `dtim` datetime DEFAULT NULL,
  `act` enum('up','down','view','n','report','') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`no`),
  KEY `no` (`no`),
  KEY `relation` (`relation`),
  KEY `post` (`post`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_kr1_history`
--

LOCK TABLES `map_kr1_history` WRITE;
/*!40000 ALTER TABLE `map_kr1_history` DISABLE KEYS */;
INSERT INTO `map_kr1_history` VALUES (1,1,'admin@root','post',1,0,'2019-02-02 14:58:36',NULL,NULL,'view'),(2,1,'admin@root','post',1,1,'2019-02-08 16:50:26',NULL,NULL,'up');
/*!40000 ALTER TABLE `map_kr1_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_kr1_post`
--

DROP TABLE IF EXISTS `map_kr1_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_kr1_post` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `sn` int(11) DEFAULT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ctim` datetime NOT NULL DEFAULT current_timestamp(),
  `utim` datetime DEFAULT NULL,
  `dtim` datetime DEFAULT NULL,
  `title` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply` int(11) NOT NULL DEFAULT 0,
  `hit` int(11) NOT NULL DEFAULT 0,
  `up` int(11) NOT NULL DEFAULT 0,
  `down` int(11) NOT NULL DEFAULT 0,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyword` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`no`),
  KEY `no` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_kr1_post`
--

LOCK TABLES `map_kr1_post` WRITE;
/*!40000 ALTER TABLE `map_kr1_post` DISABLE KEYS */;
INSERT INTO `map_kr1_post` VALUES (1,1,'admin@root','root','2019-02-02 14:58:36',NULL,NULL,'ㅇㅇ','ㅇㅇ<img src=\\\"/upload/23c927d09aecbed1c528d7b81d43acf3.png\\\" alt=\\\"블루파프리카.png\\\" style=\\\"max-width: 100%;\\\"><br><br>',2,1,10,0,'free','','');
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
  `sn` int(11) DEFAULT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ctim` datetime NOT NULL DEFAULT current_timestamp(),
  `utim` datetime DEFAULT NULL,
  `dtim` datetime DEFAULT NULL,
  `content` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `up` int(11) NOT NULL DEFAULT 0,
  `down` int(11) NOT NULL DEFAULT 0,
  `post` int(11) NOT NULL,
  `mention` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relation` int(11) DEFAULT NULL,
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
  PRIMARY KEY (`no`),
  KEY `no` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_kr1_reply`
--

LOCK TABLES `map_kr1_reply` WRITE;
/*!40000 ALTER TABLE `map_kr1_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `map_kr1_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_kr2_history`
--

DROP TABLE IF EXISTS `map_kr2_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_kr2_history` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `sn` int(11) DEFAULT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('post','reply') COLLATE utf8mb4_unicode_ci NOT NULL,
  `relation` int(11) NOT NULL,
  `post` int(11) NOT NULL,
  `ctim` datetime NOT NULL DEFAULT current_timestamp(),
  `utim` datetime DEFAULT NULL,
  `dtim` datetime DEFAULT NULL,
  `act` enum('up','down','view','n','report','') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`no`),
  KEY `no` (`no`),
  KEY `relation` (`relation`),
  KEY `post` (`post`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_kr2_history`
--

LOCK TABLES `map_kr2_history` WRITE;
/*!40000 ALTER TABLE `map_kr2_history` DISABLE KEYS */;
INSERT INTO `map_kr2_history` VALUES (1,1,'admin@root','post',1,0,'2019-02-02 15:48:51',NULL,NULL,'view');
/*!40000 ALTER TABLE `map_kr2_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_kr2_post`
--

DROP TABLE IF EXISTS `map_kr2_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_kr2_post` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `sn` int(11) DEFAULT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ctim` datetime NOT NULL DEFAULT current_timestamp(),
  `utim` datetime DEFAULT NULL,
  `dtim` datetime DEFAULT NULL,
  `title` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply` int(11) NOT NULL DEFAULT 0,
  `hit` int(11) NOT NULL DEFAULT 0,
  `up` int(11) NOT NULL DEFAULT 0,
  `down` int(11) NOT NULL DEFAULT 0,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyword` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`no`),
  KEY `no` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_kr2_post`
--

LOCK TABLES `map_kr2_post` WRITE;
/*!40000 ALTER TABLE `map_kr2_post` DISABLE KEYS */;
INSERT INTO `map_kr2_post` VALUES (1,1,'admin@root','root','2019-02-02 15:48:51',NULL,NULL,'읭','옹',0,1,0,0,'free','','');
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
  `sn` int(11) DEFAULT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ctim` datetime NOT NULL DEFAULT current_timestamp(),
  `utim` datetime DEFAULT NULL,
  `dtim` datetime DEFAULT NULL,
  `content` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `up` int(11) NOT NULL DEFAULT 0,
  `down` int(11) NOT NULL DEFAULT 0,
  `post` int(11) NOT NULL,
  `mention` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `follow` int(11) DEFAULT NULL,
  `relation` int(11) DEFAULT NULL,
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
  PRIMARY KEY (`no`),
  KEY `no` (`no`)
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
-- Table structure for table `map_space_history`
--

DROP TABLE IF EXISTS `map_space_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_space_history` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `sn` int(11) DEFAULT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('post','reply') COLLATE utf8mb4_unicode_ci NOT NULL,
  `relation` int(11) NOT NULL,
  `post` int(11) DEFAULT NULL,
  `ctim` datetime DEFAULT current_timestamp(),
  `utim` datetime DEFAULT NULL,
  `dtim` datetime DEFAULT NULL,
  `act` enum('up','down','n','view','report','') COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`no`),
  KEY `no` (`no`),
  KEY `relation` (`relation`),
  KEY `post` (`post`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_space_history`
--

LOCK TABLES `map_space_history` WRITE;
/*!40000 ALTER TABLE `map_space_history` DISABLE KEYS */;
INSERT INTO `map_space_history` VALUES (70,NULL,'admin@daihyun99','post',9,NULL,'2018-10-09 01:18:53',NULL,NULL,'view'),(71,NULL,'admin@daihyun99','post',9,NULL,'2018-10-09 01:18:55',NULL,NULL,'up'),(72,NULL,'admin@daihyun99','post',30,NULL,'2018-10-20 16:46:30',NULL,NULL,'view'),(73,NULL,'admin@daihyun99','post',1,NULL,'2018-10-26 23:17:47',NULL,NULL,'view'),(74,NULL,'admin@daihyun99','post',12,NULL,'2018-10-26 23:27:06',NULL,NULL,'view'),(75,NULL,'admin@daihyun99','post',10,NULL,'2018-10-27 00:53:52',NULL,NULL,'view'),(76,NULL,'admin@daihyun99','post',5,NULL,'2018-10-27 01:05:37',NULL,NULL,'view'),(77,NULL,'admin@daihyun99','post',38,NULL,'2018-10-29 00:58:22',NULL,NULL,'view'),(78,NULL,'admin@daihyun99','post',38,NULL,'2018-11-02 00:07:42','2018-11-02 00:07:42',NULL,'n'),(79,NULL,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(80,NULL,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(81,NULL,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(82,NULL,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(83,NULL,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(84,NULL,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(85,NULL,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(86,NULL,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(87,NULL,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(88,NULL,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(89,NULL,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(90,NULL,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(91,NULL,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(92,NULL,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(93,NULL,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(94,NULL,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(95,NULL,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(96,NULL,'admin@daihyun99','post',0,NULL,'2018-11-01 02:05:55',NULL,NULL,'down'),(97,NULL,'admin@daihyun99','post',0,NULL,'2018-11-01 02:05:55',NULL,NULL,'down'),(98,NULL,'admin@daihyun99','post',0,NULL,'2018-11-01 02:05:55',NULL,NULL,'down'),(99,NULL,'admin@daihyun99','post',0,NULL,'2018-11-01 02:05:55',NULL,NULL,'down'),(100,NULL,'admin@daihyun99','post',0,NULL,'2018-11-01 02:05:55',NULL,NULL,'down'),(101,NULL,'admin@daihyun99','post',0,NULL,'2018-11-01 01:55:13',NULL,NULL,'up'),(102,NULL,'admin@daihyun99','post',0,NULL,'2018-11-01 01:57:24',NULL,NULL,'up'),(103,NULL,'admin@daihyun99','post',0,NULL,'2018-11-01 01:57:52',NULL,NULL,'up'),(104,NULL,'admin@daihyun99','post',0,NULL,'2018-11-01 01:58:28',NULL,NULL,'up'),(105,NULL,'admin@daihyun99','post',0,NULL,'2018-11-01 02:01:32',NULL,NULL,'up'),(106,NULL,'admin@daihyun99','post',0,NULL,'2018-11-01 02:01:47',NULL,NULL,'up'),(107,NULL,'admin@daihyun99','post',0,NULL,'2018-11-01 02:02:01',NULL,NULL,'up'),(108,NULL,'admin@daihyun99','post',0,NULL,'2018-11-01 02:02:04',NULL,NULL,'up'),(109,NULL,'admin@daihyun99','post',73,NULL,'2018-11-01 02:41:00',NULL,NULL,'up'),(110,NULL,'admin@daihyun99','post',73,NULL,'2018-11-01 02:42:40',NULL,NULL,'up'),(111,NULL,'admin@daihyun99','post',73,NULL,'2018-11-01 02:45:17',NULL,NULL,'up'),(112,NULL,'admin@daihyun99','post',73,NULL,'2018-11-01 02:46:36',NULL,NULL,'up'),(113,NULL,'admin@daihyun99','post',73,NULL,'2018-11-01 02:47:17',NULL,NULL,'up'),(114,NULL,'admin@daihyun99','post',73,NULL,'2018-11-01 02:48:29',NULL,NULL,'up'),(115,NULL,'admin@daihyun99','post',73,NULL,'2018-11-01 02:48:39',NULL,NULL,'up'),(116,NULL,'admin@daihyun99','post',73,NULL,'2018-11-01 02:51:35',NULL,NULL,'up'),(117,NULL,'admin@daihyun99','post',73,NULL,'2018-11-01 02:52:01',NULL,NULL,'up'),(118,NULL,'admin@daihyun99','post',73,NULL,'2018-11-01 02:52:16',NULL,NULL,'down'),(119,NULL,'admin@daihyun99','post',73,NULL,'2018-11-01 02:52:24',NULL,NULL,'down'),(120,NULL,'admin@daihyun99','post',73,NULL,'2018-11-01 02:52:27',NULL,NULL,'down'),(121,NULL,'admin@daihyun99','reply',73,NULL,'2018-11-01 02:58:13',NULL,NULL,'down'),(122,NULL,'admin@daihyun99','reply',74,30,'2018-11-01 22:35:39','2018-11-01 22:35:40',NULL,'n'),(123,NULL,'admin@daihyun99','post',37,NULL,'2018-11-03 11:46:50',NULL,NULL,'view'),(124,NULL,'admin@daihyun99','post',39,NULL,'2018-11-03 11:47:32',NULL,NULL,'view'),(125,NULL,'admin@daihyun99','post',39,NULL,'2018-11-03 22:12:08','2018-11-03 22:12:09',NULL,'n'),(126,NULL,'admin@daihyun99','post',21,NULL,'2018-11-03 20:46:05',NULL,NULL,'view'),(127,NULL,'admin@daihyun99','post',29,NULL,'2018-11-03 20:47:56',NULL,NULL,'view'),(128,NULL,'admin@daihyun99','post',34,NULL,'2018-11-03 21:55:50',NULL,NULL,'view'),(129,NULL,'admin@daihyun99','post',35,NULL,'2018-11-03 21:56:58',NULL,NULL,'view'),(130,NULL,'admin@daihyun99','reply',89,39,'2018-11-03 22:12:09','2018-11-03 22:12:10',NULL,'n'),(131,NULL,'admin@daihyun99','reply',28,29,'2018-11-03 22:20:37',NULL,NULL,'report'),(132,NULL,'test05','post',30,NULL,'2018-11-04 00:14:54',NULL,NULL,'view'),(133,NULL,'test05','post',13,NULL,'2018-11-04 00:23:36',NULL,NULL,'view'),(134,NULL,'test05','post',12,NULL,'2018-11-04 00:23:54',NULL,NULL,'view'),(139,NULL,'admin@daihyun99','reply',73,30,'2018-11-04 03:23:47',NULL,NULL,'report'),(140,NULL,'test01','post',30,NULL,'2018-11-04 03:24:28',NULL,NULL,'view'),(141,NULL,'test01','reply',73,30,'2018-11-04 03:25:18',NULL,NULL,'report'),(142,NULL,'admin@daihyun99','post',20,NULL,'2018-11-06 00:53:41',NULL,NULL,'view'),(143,NULL,'admin@daihyun99','post',40,NULL,'2018-11-06 01:06:04',NULL,NULL,'view'),(144,NULL,'admin@daihyun99','post',41,NULL,'2018-11-11 18:00:43',NULL,NULL,'view'),(145,NULL,'admin@daihyun99','post',42,NULL,'2018-11-16 01:03:44',NULL,NULL,'view'),(146,NULL,'admin@daihyun99','post',43,NULL,'2018-11-17 11:53:05',NULL,NULL,'view'),(147,NULL,'admin@daihyun99','post',44,NULL,'2018-11-19 21:36:10',NULL,NULL,'view'),(148,NULL,'admin@daihyun99','post',36,NULL,'2018-11-26 22:53:33',NULL,NULL,'view'),(149,NULL,'admin@daihyun99','post',2,NULL,'2018-11-26 23:31:39',NULL,NULL,'view'),(150,NULL,'admin@root','post',38,NULL,'2018-12-02 23:05:37',NULL,NULL,'view'),(151,NULL,'admin@root','post',45,NULL,'2018-12-02 23:06:06',NULL,NULL,'view'),(152,NULL,'admin@root','reply',155,45,'2018-12-02 23:06:11','2018-12-02 23:06:13',NULL,'n'),(153,NULL,'test01','post',45,NULL,'2018-12-02 23:06:21',NULL,NULL,'view'),(154,NULL,'test01','reply',156,45,'2018-12-02 23:39:11','2018-12-02 23:39:11',NULL,'n'),(156,NULL,'test01','reply',155,45,'2018-12-02 23:39:13','2018-12-02 23:39:13',NULL,'n'),(157,NULL,'admin@root','reply',157,45,'2018-12-07 18:25:49','2018-12-07 18:25:50',NULL,'n'),(158,NULL,'admin@root','post',43,NULL,'2018-12-07 18:25:53',NULL,NULL,'view'),(159,NULL,'admin@root','post',46,NULL,'2018-12-07 18:35:13',NULL,NULL,'view'),(160,NULL,'admin@root','post',47,NULL,'2018-12-07 19:07:39',NULL,NULL,'view'),(161,NULL,'admin@root','post',48,NULL,'2018-12-08 23:02:47',NULL,NULL,'view'),(162,NULL,'admin@root','post',49,NULL,'2018-12-08 23:47:37',NULL,NULL,'view'),(163,NULL,'admin@root','post',50,NULL,'2018-12-09 00:44:13',NULL,NULL,'view'),(164,NULL,'admin@root','post',51,NULL,'2018-12-09 00:51:22',NULL,NULL,'view'),(165,NULL,'admin@root','post',52,NULL,'2018-12-09 00:55:21',NULL,NULL,'view'),(166,NULL,'admin@root','post',53,NULL,'2018-12-09 01:58:14',NULL,NULL,'view'),(167,NULL,'admin@root','post',54,NULL,'2018-12-09 01:59:37',NULL,NULL,'view'),(168,NULL,'admin@root','post',55,NULL,'2018-12-09 02:21:26',NULL,NULL,'view'),(169,NULL,'admin@root','post',56,NULL,'2018-12-09 23:05:26',NULL,NULL,'view'),(170,NULL,'admin@root','post',40,NULL,'2018-12-12 23:54:35',NULL,NULL,'view'),(171,NULL,'admin@root','post',57,NULL,'2018-12-13 00:14:39',NULL,NULL,'view'),(172,NULL,'admin@root','post',58,NULL,'2018-12-13 00:39:32',NULL,NULL,'view'),(173,NULL,'admin@root','post',59,NULL,'2018-12-28 23:21:02',NULL,NULL,'view'),(174,NULL,'admin@root','post',60,NULL,'2018-12-31 18:54:48',NULL,NULL,'view'),(175,NULL,'admin@root','post',61,NULL,'2018-12-31 20:07:08',NULL,NULL,'view'),(176,NULL,'admin@root','post',62,NULL,'2018-12-31 20:07:51',NULL,NULL,'view'),(177,NULL,'admin@root','post',63,NULL,'2019-01-01 16:06:55',NULL,NULL,'view'),(178,NULL,'admin@root','post',64,NULL,'2019-01-05 12:01:52',NULL,NULL,'view'),(179,NULL,'admin@root','post',13,NULL,'2019-01-05 12:24:39',NULL,NULL,'view'),(180,NULL,'admin@root','post',16,NULL,'2019-01-05 12:24:50',NULL,NULL,'view'),(181,NULL,'admin@root','post',65,NULL,'2019-01-05 12:40:28',NULL,NULL,'view'),(182,NULL,'admin@root','post',30,NULL,'2019-01-07 23:22:51',NULL,NULL,'view'),(183,NULL,'admin@root','reply',75,30,'2019-01-07 23:27:55','2019-01-07 23:27:55',NULL,'n'),(184,NULL,'admin@root','reply',73,30,'2019-01-07 23:28:10','2019-01-07 23:28:12',NULL,'n'),(185,NULL,'admin@root','post',66,NULL,'2019-01-09 00:29:16',NULL,NULL,'view'),(186,NULL,'test01','post',67,NULL,'2019-01-09 01:04:36',NULL,NULL,'view'),(187,NULL,'test01','post',69,NULL,'2019-01-09 01:17:55',NULL,NULL,'view'),(188,NULL,'test01','post',66,NULL,'2019-01-09 01:18:05',NULL,NULL,'view'),(189,NULL,'admin@root','post',70,NULL,'2019-01-09 01:18:28',NULL,NULL,'view'),(190,NULL,'admin@root','post',69,NULL,'2019-01-09 01:25:55',NULL,NULL,'view'),(191,NULL,'admin@root','reply',164,56,'2019-01-09 01:26:06',NULL,NULL,'up'),(192,NULL,'test01','post',56,NULL,'2019-01-09 01:26:22',NULL,NULL,'view'),(193,NULL,'test01','reply',175,56,'2019-01-09 01:30:16','2019-01-09 01:30:19',NULL,'n'),(194,NULL,'test01','post',68,NULL,'2019-01-09 21:57:11',NULL,NULL,'view'),(195,NULL,'admin@root','post',68,NULL,'2019-01-09 21:57:20',NULL,NULL,'view'),(196,NULL,'admin@root','post',41,NULL,'2019-01-09 22:08:36',NULL,NULL,'view'),(197,NULL,'test01','post',38,NULL,'2019-01-10 00:47:45',NULL,NULL,'view'),(198,NULL,'admin@root','post',1,NULL,'2019-01-13 09:05:35',NULL,NULL,'view'),(199,NULL,'admin@root','reply',116,43,'2019-01-13 09:18:10','2019-01-13 09:18:11',NULL,'n'),(200,NULL,'test01','post',43,NULL,'2019-01-13 09:22:14',NULL,NULL,'view'),(201,NULL,'test01','post',64,NULL,'2019-01-13 09:42:04',NULL,NULL,'view'),(202,NULL,'admin@root','post',39,NULL,'2019-01-21 22:07:14',NULL,NULL,'view'),(203,NULL,'admin@root','post',29,NULL,'2019-01-21 22:57:38',NULL,NULL,'view'),(204,NULL,'admin@root','post',36,NULL,'2019-01-21 22:57:43',NULL,NULL,'view'),(205,NULL,'admin@root','post',37,NULL,'2019-01-21 22:57:46',NULL,NULL,'view'),(206,NULL,'admin@root','post',42,NULL,'2019-01-25 22:12:07',NULL,NULL,'view'),(207,NULL,'test02','post',64,NULL,'2019-01-27 09:58:56',NULL,NULL,'view'),(208,NULL,'admin@root','post',71,NULL,'2019-01-27 12:09:48',NULL,NULL,'view'),(209,NULL,'admin@root','post',72,NULL,'2019-01-27 12:15:15',NULL,NULL,'view'),(210,NULL,'admin@root','post',73,NULL,'2019-01-27 12:15:36',NULL,NULL,'view'),(211,NULL,'admin@root','post',74,NULL,'2019-01-27 12:17:03',NULL,NULL,'view'),(212,NULL,'admin@root','post',75,NULL,'2019-01-27 12:17:15',NULL,NULL,'view'),(213,NULL,'delete_me','post',64,NULL,'2019-02-01 20:58:16',NULL,NULL,'view'),(214,1,'admin@root','post',76,NULL,'2019-02-02 14:43:15',NULL,NULL,'view'),(215,1,'admin@root','post',77,NULL,'2019-02-02 14:50:27',NULL,NULL,'view'),(216,1,'admin@root','post',17,NULL,'2019-02-02 17:37:19',NULL,NULL,'view'),(217,1,'admin@root','post',78,NULL,'2019-02-05 16:12:53',NULL,NULL,'view'),(218,1,'test01','post',79,NULL,'2019-02-06 11:09:52',NULL,NULL,'view'),(219,1,'test01','post',17,NULL,'2019-02-06 11:14:59',NULL,NULL,'view'),(220,1,'admin@root','post',18,NULL,'2019-02-06 12:15:36',NULL,NULL,'view'),(221,1,'admin@root','post',19,NULL,'2019-02-06 12:15:43',NULL,NULL,'view'),(222,1,'admin@root','post',6,NULL,'2019-02-06 12:57:38',NULL,NULL,'view'),(223,1,'admin@root','post',2,NULL,'2019-02-06 12:57:57',NULL,NULL,'view'),(224,1,'admin@root','post',3,NULL,'2019-02-06 12:58:07',NULL,NULL,'view'),(225,13,'6lueparr0t@gmail.com','post',37,NULL,'2019-02-08 11:47:19',NULL,NULL,'view');
/*!40000 ALTER TABLE `map_space_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_space_post`
--

DROP TABLE IF EXISTS `map_space_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_space_post` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `sn` int(11) DEFAULT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ctim` datetime NOT NULL DEFAULT current_timestamp(),
  `utim` datetime DEFAULT NULL,
  `dtim` datetime DEFAULT NULL,
  `title` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hit` int(11) NOT NULL DEFAULT 0,
  `up` int(11) NOT NULL DEFAULT 0,
  `down` int(11) NOT NULL DEFAULT 0,
  `reply` int(11) NOT NULL DEFAULT 0,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyword` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_space_post`
--

LOCK TABLES `map_space_post` WRITE;
/*!40000 ALTER TABLE `map_space_post` DISABLE KEYS */;
INSERT INTO `map_space_post` VALUES (3,NULL,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Hello, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',2,0,0,2,'best','first',''),(4,NULL,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Hello, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',0,0,0,0,'best','first',''),(5,NULL,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Hello, 한글!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',1,0,0,0,'best','first',''),(7,NULL,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Test, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',0,0,0,0,'best','first',''),(8,NULL,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Test, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',0,0,0,0,'best','first',''),(9,NULL,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Test, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',5,41,0,0,'best','first',''),(10,NULL,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Test, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',1,0,0,0,'best','first',''),(11,NULL,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Test, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',1,1,0,0,'best','first',''),(12,NULL,'test01','테스트','2018-08-26 16:21:10','0000-00-00 00:00:00','0000-00-00 00:00:00','Hello, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',3,1,0,0,'best','first',''),(20,NULL,'admin@daihyun99','daihyun99','2018-09-01 17:12:12',NULL,NULL,'[test] 리다이렉트 실험3','ㅇㅇ',1,0,0,0,'free','test',''),(21,NULL,'admin@daihyun99','daihyun99','2018-09-01 20:37:12',NULL,NULL,'[test] 리다이렉트 실험4','\n\n\n\n&lt;div&gt;--- 수정 테스트2 ---&lt;br&gt;&lt;/div&gt;&lt;img src=&quot;&quot; width=&quot;400px&quot; height=&quot;400px&quot;&gt;&lt;div&gt;&lt;script&gt;alert(\\\'test\\\');&lt;/script&gt;&lt;/div&gt;',3,0,0,0,'free','test',''),(30,NULL,'admin@daihyun99','daihyun99','2018-09-14 22:09:56',NULL,NULL,'[upload] 업로드 테스트','\n\n\n\n\n\n&lt;img src=&quot;/upload/436c0cd8bd370338dd8c6197cdc6d858.png&quot;&gt;&lt;img src=&quot;/upload/901720d2967edb50aadbd6bce571fcdb.png&quot;&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;ㅇㅇ&lt;br&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;/div&gt;&lt;video src=&quot;/upload/ba7c5e2ffcf1f089d2b20c7792b3817c.mp3&quot; controls=&quot;controls&quot;&gt;&lt;/video&gt;&lt;br&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;df&lt;/div&gt;&lt;div&gt;df&lt;/div&gt;&lt;div&gt;df&lt;/div&gt;&lt;div&gt;df&lt;/div&gt;&lt;div&gt;df&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;img src=&quot;/upload/f98ba964ec9de86a84343917a377dde4.jpg&quot; alt=&quot;alps_mountains_snow_vertex_110211_4752x3168.jpg&quot;&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;img src=&quot;/upload/c359ce1c8cae198c83d099420847de80.png&quot; alt=&quot;25176044.png&quot;&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;/div&gt;&lt;br&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;img src=&quot;/upload/f1f73b8fbd0bf90cf135c2dca4aaa0e1.png&quot; alt=&quot;burn.png&quot;&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;br&gt;&lt;/div&gt;&lt;img src=&quot;/upload/cfcafa2c379856220ab6c81d659af0d9.png&quot; alt=&quot;Big_dipper.png&quot; style=&quot;max-width: 100%;&quot;&gt;&lt;br&gt;&lt;br&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;img src=&quot;/upload/477a8a7d3de483d2891fac3c91d882d0.png&quot; alt=&quot;burn.png&quot; style=&quot;max-width: 100%;&quot;&gt;&lt;br&gt;&lt;br&gt;',26,21,-9,8,'best','upload',''),(38,NULL,'admin@daihyun99','daihyun99','2018-10-29 00:58:21',NULL,NULL,'[사진] 메인 사진 변경하기','<div><br></div><div><img src=\\\"http://127.0.0.1/upload/697924dc94de86f7996cfc42cb275de0.jpeg\\\" alt=\\\"일산 호수공원.jpeg\\\" style=\\\"max-width: 100%;\\\"><br></div><div><br></div> ㅇㅇㅇ<br><br><div> <iframe width=\\\"560\\\" height=\\\"315\\\" src=\\\"https://www.youtube.com/embed/D3ZFtSoWtRc\\\" frameborder=\\\"0\\\" allow=\\\"autoplay; encrypted-media\\\" allowfullscreen=\\\"\\\"></iframe></div><div><br></div><div>&lt;script&gt;alert(\\\'test\\\');&lt;/script&gt;</div><br><div><script>alert(\\\'test\\\');</script></div><script>alert(\\\'test\\\');</script>',3,20,0,0,'best','사진',''),(39,NULL,'admin@daihyun99','daihyun99','2018-11-03 11:47:31',NULL,NULL,'[개발] 남은 기능','<div>수정해야될 기능</div><div>&nbsp;</div><div>map_code 에 신청한 longitude, latitude 컬럼(double 타입) 추가하기 (이게 있어야 world 에 구글 지도 추가했을때 보일듯)</div><div><span style=\\\"font-size: 1rem;\\\">map_total 테이블 삭제? 추천 1000건 이상 베스트 게시글에 대해?</span></div><div>free, info 타입 글만 추천 넘겼을때 bset 이동하게 만들기</div><div>&nbsp;</div><div>문의 -&gt; 메일로 받기 -&gt; footer 영역 수정하고 메일 넣기</div><div>&nbsp;</div><div><span style=\\\"font-size: 1rem;\\\">- 신고 기능&nbsp;</span></div><div><span style=\\\"font-size: 1rem;\\\">report - 기존 history 테이블 사용</span></div><div><span style=\\\"font-size: 1rem;\\\">post도 신고기능 추가</span></div><div>&nbsp;</div><div>- 회원정보 확인 및 수정 페이지</div><div>&nbsp;<span style=\\\"font-size: 1rem;\\\">/profile</span></div><div>&nbsp;<span style=\\\"font-size: 1rem;\\\">/profile/edit</span></div><div>​</div><div>- IP 차단 기능 =&gt; 사용자 차단 기능</div><div>&nbsp;<span style=\\\"font-size: 1rem;\\\">로직 자체는 있으니 이 기능을 만들자</span></div><div>방문자 테이블 수정 후 접속한 IP 전부 남게끔. 서버에 기능을 추가하자. ( 사용자 차단 기능 만들기? 패스워드 실패에 대해 )</div><div>&nbsp;</div><div>- 패스워드 초기화 테스트해보기</div><div>&nbsp;<span style=\\\"font-size: 1rem;\\\">이후 Admin 쪽에 기능 추가 (IP BAN)</span></div><div><br></div><div>​---------------------------------------</div><div>- 맵 전체 목록 (나중)</div><div>&nbsp;</div><div>돋보기 버튼 눌렀을때 이동 &lt;- 나중에</div><div>&nbsp;</div><div>world/list 추가</div><div>​---------------------------------------</div><div>​</div><div>- JSON 방식으로 세션 만들어 댓글 추천했는지 표시하기</div><div>굳이 안만들어도 될듯하지만서도.. 우선 세션만 추가하게끔 해볼까 생각 중.</div>',2,19,0,4,'dev','개발',''),(41,NULL,'admin@daihyun99','daihyun99','2018-11-11 18:00:42',NULL,NULL,'[test] upload 테스트','&lt;img src=&quot;/upload/5d0c71ffa045fe4cdccfe5503c6caf0d.png&quot; alt=&quot;burn.png&quot; style=&quot;max-width: 100%;&quot;&gt;&lt;br&gt;&lt;br&gt;&lt;div&gt;수정 테스트&lt;/div&gt;',2,0,0,0,'free','test',''),(43,NULL,'admin@daihyun99','daihyun99','2018-11-17 11:53:04',NULL,NULL,'[개발] 댓글 이동 테스트','댓글 많이 다삼',3,0,0,38,'dev','개발',''),(44,NULL,'admin@daihyun99','daihyun99','2018-11-19 21:36:07',NULL,NULL,'[개발] 링크 복사 기능','ㅇㅇ',1,0,0,0,'dev','개발',''),(45,NULL,'admin@root','root','2018-12-02 23:06:06',NULL,NULL,'[개발] 자추 자신 테스트','ㅇㅇ',2,0,0,3,'dev','개발',''),(46,NULL,'admin@root','root','2018-12-07 18:35:12',NULL,NULL,'[개발] 업로드 리스트를 위한 파일 업로드','\\nㅇㅇ&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;img src=\\&quot;http://127.0.0.1/upload/e8c6e2277988d7f4b470ad9dc780138b.png\\&quot; alt=\\&quot;6lueparr0t.png\\&quot;&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;img src=\\&quot;/upload/4c73340e9d2c2a5c5dc2f3a08a1a1873.png\\&quot; alt=\\&quot;25176044.png\\&quot; style=\\&quot;max-width: 100%;\\&quot;&gt;&lt;br&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;img src=\\&quot;/upload/a277f817730d8bad262326cdd504411c.jpeg\\&quot; alt=\\&quot;난강하니까.jpeg\\&quot; style=\\&quot;max-width: 100%;\\&quot;&gt;&lt;div&gt;&lt;br&gt;&lt;br&gt;&lt;/div&gt;&lt;img src=\\&quot;/upload/6ba76689c226054e75df9767ded5066f.png\\&quot; alt=\\&quot;Big_dipper.png\\&quot; style=\\&quot;max-width: 100%;\\&quot;&gt;&lt;br&gt;&lt;br&gt;',1,0,0,0,'dev','개발',''),(56,NULL,'admin@root','root','2018-12-09 23:05:26',NULL,NULL,'[개발] 프로필 - 자기가 쓴 글 리스트 보기2','\\nㅇㅇ',2,0,0,2,'dev','개발',''),(64,NULL,'admin@root','root','2019-01-05 12:01:52',NULL,NULL,'[추억] 노량진 푸드코트의 추억','<div>돈은 없고 푸짐하게 먹고싶을 때 가서 먹었던 푸드코트.</div><div><br></div><div><img src=\\\"http://127.0.0.1/upload/0c0713229354ae0dbb767c21af0f1056.jpg\\\" alt=\\\"노량진 푸드코트_1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></div><div><br></div><div>6천원 정도 였었던거 같다.</div><div><br></div><div>삼겹살 쌈밥 정식 하.. 저 된장찌개 ㄹㅇ 맛있었는데</div><div><br></div><div><br></div><img src=\\\"/upload/59610a07e3bef36b5a849ae419e96dd7.jpg\\\" alt=\\\"노량진 푸드코드_2.jpg\\\" style=\\\"max-width: 100%;\\\"><br><br>쌈싸먹으라고 물티슈도 같이 나옴<div><br></div><div>손 닦고 쌈쌈~~<br><br><br><img src=\\\"/upload/5a00cff1fa2f5cab597e870c0be39d4d.jpg\\\" alt=\\\"노량진 푸드코드_3.jpg\\\" style=\\\"max-width: 100%;\\\"><div><br></div></div><br>하 땡기누..\\n',4,0,0,1,'food','추억','');
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
  `sn` int(11) DEFAULT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ctim` datetime NOT NULL DEFAULT current_timestamp(),
  `utim` datetime DEFAULT NULL,
  `dtim` datetime DEFAULT NULL,
  `content` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `up` int(11) NOT NULL DEFAULT 0,
  `down` int(11) NOT NULL DEFAULT 0,
  `post` int(11) DEFAULT NULL,
  `mention` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상대방 아이디',
  `follow` int(11) DEFAULT NULL,
  `relation` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_space_reply`
--

LOCK TABLES `map_space_reply` WRITE;
/*!40000 ALTER TABLE `map_space_reply` DISABLE KEYS */;
INSERT INTO `map_space_reply` VALUES (19,NULL,'admin@daihyun99','daihyun99','2018-08-22 23:53:00',NULL,NULL,'댓글 확인?\n띄어쓰기 확인\n확\n\n인',0,0,3,'',NULL,0,7,0,0,0,0,0,0,0,0,0),(20,NULL,'admin@daihyun99','daihyun99','2018-08-22 23:53:12',NULL,NULL,'대댓글 확.인.',0,0,3,'daihyun99',19,19,7,1,0,0,0,0,0,0,0,0),(21,NULL,'admin@daihyun99','daihyun99','2018-08-29 01:17:12',NULL,NULL,'테스트 첫 댓글',0,0,13,'',NULL,0,8,0,0,0,0,0,0,0,0,0),(22,NULL,'admin@daihyun99','daihyun99','2018-08-29 01:28:12',NULL,NULL,'테스트 첫 대댓글',0,0,13,'daihyun99',21,21,8,1,0,0,0,0,0,0,0,0),(23,NULL,'admin@daihyun99','daihyun99','2018-09-05 22:42:54',NULL,NULL,'댓글 수정1',0,0,27,'',NULL,0,9,0,0,0,0,0,0,0,0,0),(73,NULL,'admin@daihyun99','daihyun99','2018-09-25 17:30:19',NULL,NULL,'|￣￣￣￣￣￣￣￣￣￣|\n| 저어어어어어어어장 \n|＿＿＿＿＿＿＿＿＿＿|   \n / )__/ )  || \n(•ㅅ•)  || \n/. . . . . . づ',90,40,30,'',NULL,0,15,0,0,0,0,0,0,0,0,0),(74,NULL,'admin@daihyun99','daihyun99','2018-09-25 17:32:47',NULL,NULL,'(˃̣̣̥᷄⌓˂̣̣̥᷅)',0,0,30,'',NULL,0,16,0,0,0,0,0,0,0,0,0),(75,NULL,'admin@daihyun99','daihyun99','2018-09-25 17:33:05',NULL,NULL,'|￣￣￣￣￣￣￣|&nbsp;| 여기 있어...|＿＿＿＿＿＿＿|&nbsp;(\\__/) ||&nbsp;(•ㅅ•)..||&nbsp;/ . . . .づ',0,0,30,'',NULL,0,17,0,0,0,0,0,0,0,0,0),(76,NULL,'admin@daihyun99','daihyun99','2018-09-25 17:34:01',NULL,NULL,'&lt;span style=&quot;font-family: Verdana, Arial, Gulim; font-size: 12px; font-weight: 400; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;(˃̣̣̥᷄⌓˂̣̣̥᷅)&lt;/span&gt;',0,0,30,'',NULL,0,18,0,0,0,0,0,0,0,0,0),(77,NULL,'admin@daihyun99','daihyun99','2018-09-25 17:34:30',NULL,NULL,'&lt;font face=&quot;Verdana, Arial, Gulim&quot;&gt;&lt;span style=&quot;font-size: 12px; font-weight: 400; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;(˃̣̣̥᷄⌓˂̣̣̥᷅)&lt;/span&gt;&lt;/font&gt;&lt;br&gt;',0,0,30,'',NULL,0,19,0,0,0,0,0,0,0,0,0),(79,NULL,'admin@daihyun99','daihyun99','2018-09-25 17:42:30',NULL,NULL,'|￣￣￣￣￣￣￣￣￣￣|\n| 저어어어어어어어장 \n|＿＿＿＿＿＿＿＿＿＿|   \n / )__/ )  || \n(•ㅅ•)  || \n/. . . . . . づ',0,0,30,'',NULL,0,20,0,0,0,0,0,0,0,0,0),(80,NULL,'admin@daihyun99','daihyun99','2018-09-25 17:43:19',NULL,NULL,'ʕ っ•ᴥ•`ʔづ ⌒ ㅊㅊ',0,0,30,'',NULL,0,21,0,0,0,0,0,0,0,0,0),(81,NULL,'admin@daihyun99','daihyun99','2018-09-25 17:44:05',NULL,NULL,'ㅡㅡヽ、_ノㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅤ\nㅤㅤㅤ \\\'ｰ \\\' \nㅤㅤㅤㅤㅤＯ\nㅤㅤㅤㅤㅤㅤo\nㅤㅤㅤㅤㅤㅤ 。 ,.-ｰ冖\\\'⌒\\\'ｰ-､\nㅤㅤㅤㅤㅤㅤㅤ ,ノ ㅤㅤㅤㅤㅤㅤ＼\nㅤㅤㅤㅤㅤㅤㅤ/ㅤ,r‐へへく⌒\\\'￢ㅤ､ ヽ\nㅤㅤㅤㅤㅤㅤㅤ{ノ へ.._、 ,,／~`ㅤ〉｝ㅤㅤㅤ\nㅤㅤㅤㅤㅤㅤ／プ￣`y\\\'¨Y´￣ヽ-}j=くㅤㅤㅤ\nㅤㅤㅤㅤㅤノ/レ\\\'&gt;-〈＿ｭ`ー‐\\\'ㅤㅤﾘ,ｲ} ㅤㅤ\nㅤㅤㅤㅤ/_勺 ｲ;；∵r;==､､∴\\\'∵;ㅤシ ㅤㅤ\nㅤㅤㅤ /└\\\' ノ ＼ ㅤㅤこ¨｀ ㅤㅤノ\nㅤㅤㅤ人＿_/ー┬ 个-､＿_,,.. ‐\\\'´ 〃`ァーｧー＼\nㅤ ㅤ/|／ ㅤ|::::::|､ㅤㅤㅤㅤㅤㅤㅤ〃/:::::/ ヽ\nㅤ /｜ ㅤㅤ|::::::|＼､_________／ /:::::/',0,0,30,'',NULL,0,22,0,0,0,0,0,0,0,0,0),(85,NULL,'admin@daihyun99','daihyun99','2018-09-29 18:54:33',NULL,NULL,'test',0,0,13,'daihyun99',21,22,8,1,1,0,0,0,0,0,0,0),(89,NULL,'admin@daihyun99','daihyun99','2018-11-03 20:47:40',NULL,NULL,'신고해봐야딩-😜',0,0,39,'',NULL,0,23,0,0,0,0,0,0,0,0,0),(90,NULL,'admin@daihyun99','daihyun99','2018-11-03 21:53:15',NULL,NULL,'대댓글!',0,0,39,'daihyun99',89,89,23,1,0,0,0,0,0,0,0,0),(92,NULL,'admin@daihyun99','daihyun99','2018-11-03 21:53:32',NULL,NULL,'대댓글!!',0,0,39,'daihyun99',89,89,23,2,0,0,0,0,0,0,0,0),(96,NULL,'admin@daihyun99','daihyun99','2018-11-17 11:53:12',NULL,NULL,'댓글1',0,0,43,'',NULL,0,26,0,0,0,0,0,0,0,0,0),(97,NULL,'admin@daihyun99','daihyun99','2018-11-17 11:53:15',NULL,NULL,'댓글2',0,0,43,'',NULL,0,27,0,0,0,0,0,0,0,0,0),(98,NULL,'admin@daihyun99','daihyun99','2018-11-17 11:53:19',NULL,NULL,'댓글3',0,0,43,'',NULL,0,28,0,0,0,0,0,0,0,0,0),(99,NULL,'admin@daihyun99','daihyun99','2018-11-17 11:53:22',NULL,NULL,'댓글4',0,0,43,'',NULL,0,29,0,0,0,0,0,0,0,0,0),(100,NULL,'admin@daihyun99','daihyun99','2018-11-17 11:53:26',NULL,NULL,'댓글5',0,0,43,'',NULL,0,30,0,0,0,0,0,0,0,0,0),(101,NULL,'admin@daihyun99','daihyun99','2018-11-17 11:53:29',NULL,NULL,'댓글6',0,0,43,'',NULL,0,31,0,0,0,0,0,0,0,0,0),(102,NULL,'admin@daihyun99','daihyun99','2018-11-17 11:53:33',NULL,NULL,'댓글7',0,0,43,'',NULL,0,32,0,0,0,0,0,0,0,0,0),(103,NULL,'admin@daihyun99','daihyun99','2018-11-17 11:53:36',NULL,NULL,'댓글8',0,0,43,'',NULL,0,33,0,0,0,0,0,0,0,0,0),(104,NULL,'admin@daihyun99','daihyun99','2018-11-17 11:53:39',NULL,NULL,'댓글9',0,0,43,'',NULL,0,34,0,0,0,0,0,0,0,0,0),(105,NULL,'admin@daihyun99','daihyun99','2018-11-17 11:53:43',NULL,NULL,'댓글10',0,0,43,'',NULL,0,35,0,0,0,0,0,0,0,0,0),(106,NULL,'admin@daihyun99','daihyun99','2018-11-17 11:53:48',NULL,NULL,'댓글11',0,0,43,'',NULL,0,36,0,0,0,0,0,0,0,0,0),(107,NULL,'admin@daihyun99','daihyun99','2018-11-17 11:53:51',NULL,NULL,'댓글12',0,0,43,'',NULL,0,37,0,0,0,0,0,0,0,0,0),(108,NULL,'admin@daihyun99','daihyun99','2018-11-17 11:53:54',NULL,NULL,'댓글13',0,0,43,'',NULL,0,38,0,0,0,0,0,0,0,0,0),(109,NULL,'admin@daihyun99','daihyun99','2018-11-17 11:53:59',NULL,NULL,'댓글14',0,0,43,'',NULL,0,39,0,0,0,0,0,0,0,0,0),(110,NULL,'admin@daihyun99','daihyun99','2018-11-17 11:54:01',NULL,NULL,'댓글15',0,0,43,'',NULL,0,40,0,0,0,0,0,0,0,0,0),(111,NULL,'admin@daihyun99','daihyun99','2018-11-17 11:54:05',NULL,NULL,'댓글16',0,0,43,'',NULL,0,41,0,0,0,0,0,0,0,0,0),(112,NULL,'admin@daihyun99','daihyun99','2018-11-17 11:54:08',NULL,NULL,'댓글17',0,0,43,'',NULL,0,42,0,0,0,0,0,0,0,0,0),(113,NULL,'admin@daihyun99','daihyun99','2018-11-17 11:54:11',NULL,NULL,'댓글18',0,0,43,'',NULL,0,43,0,0,0,0,0,0,0,0,0),(114,NULL,'admin@daihyun99','daihyun99','2018-11-17 11:54:15',NULL,NULL,'댓글19',0,0,43,'',NULL,0,44,0,0,0,0,0,0,0,0,0),(115,NULL,'admin@daihyun99','daihyun99','2018-11-17 11:54:18',NULL,NULL,'댓글20 수정',0,0,43,'',NULL,0,45,0,0,0,0,0,0,0,0,0),(116,NULL,'admin@daihyun99','daihyun99','2018-11-17 11:54:21',NULL,NULL,'댓글21 수정',0,0,43,'',NULL,0,46,0,0,0,0,0,0,0,0,0),(117,NULL,'admin@daihyun99','daihyun99','2018-11-17 11:54:29',NULL,NULL,'댓글22',0,0,43,'',NULL,0,47,0,0,0,0,0,0,0,0,0),(118,NULL,'admin@daihyun99','daihyun99','2018-11-17 11:59:08',NULL,NULL,'댓글22-1',0,0,43,'daihyun99',117,117,47,1,0,0,0,0,0,0,0,0),(119,NULL,'admin@daihyun99','daihyun99','2018-11-17 12:01:15',NULL,NULL,'댓글22-2',0,0,43,'daihyun99',117,118,47,1,1,0,0,0,0,0,0,0),(120,NULL,'admin@daihyun99','daihyun99','2018-11-17 12:06:36',NULL,NULL,'댓글22-3',0,0,43,'daihyun99',117,119,47,1,1,1,0,0,0,0,0,0),(122,NULL,'admin@daihyun99','daihyun99','2018-11-17 12:17:44',NULL,NULL,'댓글22-4',0,0,43,'daihyun99',117,120,47,1,1,1,1,0,0,0,0,0),(123,NULL,'admin@daihyun99','daihyun99','2018-11-17 12:19:49',NULL,NULL,'22-5',0,0,43,'daihyun99',117,122,47,1,1,1,1,1,0,0,0,0),(124,NULL,'admin@daihyun99','daihyun99','2018-11-17 12:21:48',NULL,NULL,'22-6',0,0,43,'daihyun99',117,123,47,1,1,1,1,1,1,0,0,0),(125,NULL,'admin@daihyun99','daihyun99','2018-11-17 12:23:53',NULL,NULL,'22-7',0,0,43,'daihyun99',117,124,47,1,1,1,1,1,1,1,0,0),(126,NULL,'admin@daihyun99','daihyun99','2018-11-17 12:24:17',NULL,NULL,'22-8',0,0,43,'daihyun99',117,125,47,1,1,1,1,1,1,1,1,0),(127,NULL,'admin@daihyun99','daihyun99','2018-11-17 12:25:41',NULL,NULL,'22-9',0,0,43,'daihyun99',117,126,47,1,1,1,1,1,1,1,1,1),(128,NULL,'admin@daihyun99','daihyun99','2018-11-17 12:26:13',NULL,NULL,'22-10',0,0,43,'daihyun99',117,127,47,1,1,1,1,1,1,1,1,1),(139,NULL,'admin@daihyun99','daihyun99','2018-11-24 22:52:29',NULL,NULL,'댓글23',0,0,43,'',NULL,0,49,0,0,0,0,0,0,0,0,0),(140,NULL,'admin@daihyun99','daihyun99','2018-11-24 22:52:33',NULL,NULL,'댓글24',0,0,43,'',NULL,0,50,0,0,0,0,0,0,0,0,0),(146,NULL,'admin@daihyun99','daihyun99','2018-11-24 23:10:54',NULL,NULL,'댓글 삭제 성공?',0,0,39,'',NULL,0,51,0,0,0,0,0,0,0,0,0),(155,NULL,'admin@root','root','2018-12-02 23:06:10',NULL,NULL,'ㅇㅇ',0,0,45,'',NULL,0,53,0,0,0,0,0,0,0,0,0),(156,NULL,'test01','테스트','2018-12-02 23:06:26',NULL,NULL,'테스트로 테스트2',0,0,45,'',NULL,0,54,0,0,0,0,0,0,0,0,0),(157,NULL,'test01','테스트','2018-12-02 23:39:19',NULL,NULL,'대댓',0,0,45,'테스트',156,156,54,1,0,0,0,0,0,0,0,0),(164,NULL,'admin@root','root','2018-12-11 21:58:58',NULL,NULL,'test2',10,0,56,'',NULL,0,55,0,0,0,0,0,0,0,0,0),(175,NULL,'test01','테스트','2019-01-09 01:26:26',NULL,NULL,'test',0,0,56,'',NULL,0,56,0,0,0,0,0,0,0,0,0),(176,NULL,'test01','테스트','2019-01-13 09:42:20',NULL,NULL,'지리구연',0,0,64,'',NULL,0,57,0,0,0,0,0,0,0,0,0);
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
-- Table structure for table `total_post`
--

DROP TABLE IF EXISTS `total_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `total_post` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `sn` int(11) DEFAULT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post` int(11) NOT NULL,
  `map` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`no`),
  KEY `uid` (`uid`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `total_post`
--

LOCK TABLES `total_post` WRITE;
/*!40000 ALTER TABLE `total_post` DISABLE KEYS */;
INSERT INTO `total_post` VALUES (1,NULL,'admin','root',64,'space','[추억] 노량진 푸드코트의 추억','2019-01-26 18:17:28'),(3,NULL,'admin','root',66,'space','테스트','2019-01-09 00:29:15'),(4,NULL,'test01','테스트',67,'space','test','2019-01-09 01:04:36'),(6,NULL,'test01','테스트',69,'space','test','2019-01-09 01:17:54'),(7,NULL,'admin','root',70,'space','test','2019-01-09 01:18:27'),(8,NULL,'test02','test02',70,'space','test','2019-01-15 19:27:40'),(9,NULL,'test02','test02',70,'space','test1','2019-01-15 19:30:04'),(10,NULL,'test02','test02',70,'space','test2','2019-01-15 19:30:04'),(11,NULL,'test02','test02',70,'space','test3','2019-01-15 19:30:04'),(12,NULL,'test02','test02',70,'space','test4','2019-01-15 19:30:04'),(13,NULL,'test02','test02',70,'space','test5','2019-01-15 19:30:04'),(14,NULL,'test02','test02',70,'space','test6','2019-01-15 19:30:04'),(15,NULL,'test02','test02',70,'space','test7','2019-01-15 19:30:04'),(16,NULL,'test02','test02',70,'space','test8','2019-01-15 19:30:04'),(17,NULL,'test02','test02',70,'space','test9','2019-01-15 19:30:04'),(18,NULL,'test02','test02',70,'space','test10','2019-01-15 19:30:04'),(19,NULL,'test02','test02',70,'space','test11','2019-01-15 19:30:04'),(20,NULL,'test02','test02',70,'space','test12','2019-01-15 19:30:04'),(21,NULL,'test02','test02',70,'space','test13','2019-01-15 19:30:04'),(22,NULL,'test02','test02',70,'space','test14','2019-01-15 19:30:04'),(23,NULL,'test02','test02',70,'space','test15','2019-01-15 19:30:04'),(24,NULL,'test02','test02',70,'space','test16','2019-01-15 19:30:04'),(25,NULL,'test02','test02',70,'space','test17','2019-01-15 19:30:04'),(26,NULL,'test02','test02',70,'space','test18','2019-01-15 19:30:04'),(27,NULL,'test02','test02',70,'space','test19','2019-01-15 19:30:04'),(28,NULL,'test02','test02',70,'space','test20','2019-01-15 19:30:04'),(29,NULL,'test02','test02',70,'space','test21','2019-01-15 19:30:04'),(30,NULL,'test02','test02',70,'space','test22','2019-01-15 19:30:04'),(31,NULL,'test02','test02',70,'space','test23','2019-01-15 19:30:04'),(32,NULL,'test02','test02',70,'space','test24','2019-01-15 19:30:04'),(33,NULL,'test02','test02',70,'space','test25','2019-01-15 19:30:04'),(34,NULL,'test02','test02',70,'space','test26','2019-01-15 19:30:04'),(35,NULL,'test02','test02',70,'space','test27','2019-01-15 19:30:04'),(36,NULL,'test02','test02',70,'space','test28','2019-01-15 19:30:04'),(37,NULL,'test02','test02',70,'space','test29','2019-01-15 19:30:04'),(38,NULL,'test02','test02',70,'space','test30','2019-01-15 19:30:04'),(39,NULL,'test02','test02',70,'space','test31','2019-01-15 19:30:04'),(40,NULL,'test02','test02',70,'space','test32','2019-01-15 19:30:04'),(41,NULL,'test02','test02',70,'space','test33','2019-01-15 19:30:04'),(42,NULL,'test02','test02',70,'space','test34','2019-01-15 19:30:04'),(43,NULL,'test02','test02',70,'space','test35','2019-01-15 19:30:04'),(44,NULL,'test02','test02',70,'space','test36','2019-01-15 19:30:04'),(45,NULL,'test02','test02',70,'space','test37','2019-01-15 19:30:04'),(46,NULL,'test02','test02',70,'space','test38','2019-01-15 19:30:04'),(47,NULL,'test02','test02',70,'space','test39','2019-01-15 19:30:04'),(48,NULL,'test02','test02',70,'space','test40','2019-01-15 19:30:04'),(49,NULL,'test02','test02',70,'space','test41','2019-01-15 19:30:04'),(50,NULL,'test02','test02',70,'space','test42','2019-01-15 19:30:04'),(51,NULL,'test02','test02',70,'space','test43','2019-01-15 19:30:04'),(52,NULL,'test02','test02',70,'space','test44','2019-01-15 19:30:04'),(53,NULL,'test02','test02',70,'space','test45','2019-01-15 19:30:04'),(54,NULL,'test02','test02',70,'space','test46','2019-01-15 19:30:04'),(55,NULL,'test02','test02',70,'space','test47','2019-01-15 19:30:04'),(56,NULL,'test02','test02',70,'space','test48','2019-01-15 19:30:04'),(57,NULL,'test02','test02',70,'space','test49','2019-01-15 19:30:04'),(58,NULL,'test02','test02',70,'space','test50','2019-01-15 19:30:04'),(59,NULL,'test02','test02',70,'space','test51','2019-01-15 19:30:04'),(60,NULL,'test02','test02',70,'space','test52','2019-01-15 19:30:04'),(61,NULL,'test02','test02',70,'space','test53','2019-01-15 19:30:04'),(62,NULL,'test02','test02',70,'space','test54','2019-01-15 19:30:04'),(63,NULL,'test02','test02',70,'space','test55','2019-01-15 19:30:04'),(64,NULL,'test02','test02',70,'space','test56','2019-01-15 19:30:04'),(65,NULL,'test02','test02',70,'space','test57','2019-01-15 19:30:04'),(66,NULL,'test02','test02',70,'space','test58','2019-01-15 19:30:04'),(67,NULL,'test02','test02',70,'space','test59','2019-01-15 19:30:04'),(68,NULL,'test02','test02',70,'space','test60','2019-01-15 19:30:04'),(69,NULL,'admin','root',71,'space','테스트','2019-01-27 12:09:48'),(70,NULL,'admin','root',72,'space','테스트','2019-01-27 12:15:15'),(71,NULL,'admin','root',73,'space','테스트','2019-01-27 12:15:36'),(76,1,'admin','root',1,'kr1','ㅇㅇ','2019-02-02 15:39:57'),(77,1,'admin','root',1,'kr2','읭','2019-02-02 15:48:51');
/*!40000 ALTER TABLE `total_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `total_reply`
--

DROP TABLE IF EXISTS `total_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `total_reply` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `sn` int(11) DEFAULT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post` int(11) NOT NULL,
  `reply` int(11) NOT NULL,
  `map` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`no`),
  KEY `uid` (`uid`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=283 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `total_reply`
--

LOCK TABLES `total_reply` WRITE;
/*!40000 ALTER TABLE `total_reply` DISABLE KEYS */;
INSERT INTO `total_reply` VALUES (9,NULL,'test01','테스트',64,176,'space','지리구연','2019-01-26 19:03:18'),(10,NULL,'admin','root',64,177,'space','오지구연','2019-01-15 01:50:24'),(40,NULL,'admin','root',64,207,'space','test1<br/>1test','2019-01-24 21:41:50'),(41,NULL,'admin','root',64,208,'space','test\\\\ntest','2019-01-24 21:53:51'),(42,NULL,'admin','root',64,209,'space','test\\ntest\\ntest','2019-01-24 21:54:14'),(43,NULL,'admin','root',64,210,'space','test\\\\ntest','2019-01-24 21:55:42'),(44,NULL,'admin','root',64,211,'space','구로디지털단지 근처 맵 생성했습니다. 많은 이용 부탁드립니다. (어차피 볼 사람 없겠지?ㅎㅎ)\\nhttps://rgbplace.com/kr1/1','2019-01-24 22:17:46'),(45,NULL,'admin','root',64,212,'space','<script>alert(\\\'test\\\')</script>','2019-01-24 22:20:14'),(46,NULL,'admin','root',64,213,'space','&lt;script&gt;alert(\\\'test\\\')\\n&lt;/script&gt;','2019-01-24 22:21:44'),(47,NULL,'admin','root',64,214,'space','<script>alert(\\\'test\\\');\\n</script>','2019-01-24 22:26:24'),(49,NULL,'admin','root',64,216,'space','t\\ne\\ns\\nt','2019-01-26 19:20:30'),(50,NULL,'admin','root',64,217,'space','t\\ne\\ns\\nt','2019-01-26 19:20:56'),(57,NULL,'admin','root',64,224,'space','대댓글 삭제 테스트','2019-01-27 09:36:04'),(58,NULL,'admin','root',64,225,'space','대댓글 삭제 테스트','2019-01-27 09:36:11'),(59,NULL,'admin','root',64,226,'space','대댓글 삭제 테스트','2019-01-27 09:36:18'),(248,NULL,'admin','root',64,227,'space','test','2019-01-27 10:53:18'),(264,NULL,'delete_me','삭제고고',64,252,'space','삭제해보삼','2019-02-01 20:58:22'),(265,NULL,'delete_me','삭제용',64,253,'space','삭제 고고','2019-02-01 21:01:36');
/*!40000 ALTER TABLE `total_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `total_upload`
--

DROP TABLE IF EXISTS `total_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `total_upload` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `sn` int(11) DEFAULT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` float NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`no`),
  KEY `uid` (`uid`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `total_upload`
--

LOCK TABLES `total_upload` WRITE;
/*!40000 ALTER TABLE `total_upload` DISABLE KEYS */;
INSERT INTO `total_upload` VALUES (1,NULL,'admin','root','space-RGB-01.png','f098a90b3b07e59f4f3c23b1f24c662f.png','image/png',317.82,'2018-12-31 20:07:48'),(3,NULL,'admin','root','노량진 푸드코드_2.jpg','59610a07e3bef36b5a849ae419e96dd7.jpg','image/jpeg',328,'2019-01-05 11:59:22'),(4,NULL,'admin','root','노량진 푸드코드_3.jpg','5a00cff1fa2f5cab597e870c0be39d4d.jpg','image/jpeg',332,'2019-01-05 11:59:22'),(5,NULL,'admin','root','노량진 푸드코트_1.jpg','0c0713229354ae0dbb767c21af0f1056.jpg','image/jpeg',380,'2019-01-05 11:59:22');
/*!40000 ALTER TABLE `total_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_conf`
--

DROP TABLE IF EXISTS `user_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_conf` (
  `uid` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dark_sw` tinyint(1) NOT NULL DEFAULT 0,
  `map_sw` tinyint(1) NOT NULL DEFAULT 0,
  `notice_sw` tinyint(1) NOT NULL DEFAULT 0,
  `sound_sw` tinyint(1) NOT NULL DEFAULT 0,
  `tag_sw` tinyint(1) NOT NULL DEFAULT 0,
  `tag` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='유저 계정 설정';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_conf`
--

LOCK TABLES `user_conf` WRITE;
/*!40000 ALTER TABLE `user_conf` DISABLE KEYS */;
INSERT INTO `user_conf` VALUES ('6lueparr0t@gmail.com',0,0,0,0,0,NULL),('test01',0,0,0,0,0,NULL),('test02',0,0,0,0,0,NULL);
/*!40000 ALTER TABLE `user_conf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_info` (
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이메일',
  `pswd` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` int(11) NOT NULL DEFAULT 1,
  `score` int(11) NOT NULL DEFAULT 0,
  `map` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fail` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '로그인 20회 실패시 차단, 성공시 초기화',
  `ctim` datetime NOT NULL DEFAULT current_timestamp(),
  `atim` datetime DEFAULT NULL,
  `utim` datetime DEFAULT NULL,
  `btim` datetime DEFAULT NULL,
  `msg` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '{"total":[]}',
  `note` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '비고',
  PRIMARY KEY (`sn`),
  KEY `no` (`sn`,`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='유저 계정 정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES (1,'test01','테스트1','daihyun99@gmail.com','JDJ5JDEyJFIyejdJT2lZUlQuNy9YSVJkL01BWHVRUkNSU0t2THBPcWttMXNTcXJhdHVNTU9sZ2c5bEpt',1,21,'kr2',0,'2017-02-16 18:53:33','2019-02-08 12:27:26','2019-02-08 12:28:49',NULL,'{\"total\": [{\"type\": \"reply\", \"map\": \"space\", \"post\": \"17\", \"reply\": \"267\", \"content\": \"대댓글 삭제 테스트2\", \"date\": \"2019-02-06 11:15:42\"}]}',''),(2,'test02','test02',NULL,'JDJ5JDEyJFBxTHdWQlJEZ3dmV3RIeU1MLzdpby5iWE5yaWRQTUNUSG5Rc3o3QkUwZ2oxenY4OG9NTDZX',1,0,NULL,0,'2019-01-08 22:44:49','2019-02-01 19:04:14',NULL,NULL,'{\"total\":[]}',''),(13,'6lueparr0t@gmail.com','잇힝','6lueparr0t@gmail.com','google',1,0,NULL,0,'2019-02-08 11:11:35','2019-02-08 11:45:20','2019-02-08 11:45:15',NULL,'{\"total\":[]}','');
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
INSERT INTO `user_session` VALUES ('55gaevpc76hg3im6irculgo0i4vb1h7m','127.0.0.1',1550502839,'__ci_last_regenerate|i:1550502839;map|s:5:\"admin\";map_detail|s:0:\"\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('5ft30l54bs084veg51sdu76cu4mj0a18','127.0.0.1',1550501192,'__ci_last_regenerate|i:1550501192;map|s:5:\"admin\";map_detail|s:0:\"\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('5lif2l8pqvo8u1gll59ojs4ffcskcla8','127.0.0.1',1550500077,'__ci_last_regenerate|i:1550500077;map|s:5:\"admin\";map_detail|s:0:\"\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('63bqbvvo7e6smt85hd6p9tpj1ebqdlon','127.0.0.1',1550587981,'__ci_last_regenerate|i:1550587981;map|s:5:\"space\";map_detail|s:0:\"\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('6d298oloiblkkkj9osc8rb3q88p7qk7n','127.0.0.1',1550590069,'__ci_last_regenerate|i:1550590053;map|s:5:\"admin\";map_detail|s:0:\"\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('7s5cer4dc8r0rt86rf9k9nmgnipi1lqb','127.0.0.1',1550500932,'__ci_last_regenerate|i:1550500932;map|s:5:\"admin\";map_detail|s:0:\"\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('8stj0ecs7909400mcplecuagbd4hficl','127.0.0.1',1550589419,'__ci_last_regenerate|i:1550589419;map|s:5:\"admin\";map_detail|s:0:\"\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('amdpqhf65et88mludpe1mp0960leg3kj','127.0.0.1',1550504532,'__ci_last_regenerate|i:1550504532;map|s:5:\"admin\";map_detail|s:0:\"\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('cuor5vc7b7t5c2fs6c9omiej7hlp0c1m','127.0.0.1',1550504014,'__ci_last_regenerate|i:1550504014;map|s:5:\"admin\";map_detail|s:0:\"\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('d0fjb345k1kl4mc90i1bhv5fj5f2vthv','127.0.0.1',1550503690,'__ci_last_regenerate|i:1550503690;map|s:5:\"admin\";map_detail|s:0:\"\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('dl8ejr92a82a016lio9n80ds934ljhjb','127.0.0.1',1550503051,'__ci_last_regenerate|i:1550503051;map|s:5:\"admin\";map_detail|s:0:\"\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('epbbejtpjr776g5acohs65svs7f54qdp','127.0.0.1',1550501895,'__ci_last_regenerate|i:1550501895;map|s:5:\"admin\";map_detail|s:0:\"\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('errjbf7i7tk9rriti9g7vtcaj8hvsfo3','127.0.0.1',1550502892,'__ci_last_regenerate|i:1550502839;map|s:5:\"admin\";map_detail|s:0:\"\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('errt48vbhc30n4djseiprc8f4f4r7v0m','127.0.0.1',1550500634,'__ci_last_regenerate|i:1550500634;map|s:5:\"admin\";map_detail|s:0:\"\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('g2g3tkdqq6fm7iluki0a8ep97jra70nj','127.0.0.1',1550590053,'__ci_last_regenerate|i:1550590053;map|s:5:\"admin\";map_detail|s:0:\"\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('g4g1ffj3uerv8kndto9dgjkf03p7aone','127.0.0.1',1550739169,'__ci_last_regenerate|i:1550739169;map|s:5:\"admin\";map_detail|s:0:\"\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;post_uid|s:10:\"admin@root\";'),('gaj6qss9n2obimbmo3mu3o3gp43lb4g6','127.0.0.1',1550500527,'__ci_last_regenerate|i:1550500527;map|s:5:\"admin\";map_detail|s:0:\"\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('iaolse28jc9bvuda1offt0bb4q58l6g7','127.0.0.1',1550501555,'__ci_last_regenerate|i:1550501555;map|s:5:\"admin\";map_detail|s:0:\"\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('isrl0t8eq97g5khehgnvmt2nqjg6diir','127.0.0.1',1550587459,'__ci_last_regenerate|i:1550587459;map|s:5:\"admin\";map_detail|s:0:\"\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('ktn5kjq886oj51s3e4edfb0illd5b9sf','127.0.0.1',1550499946,'__ci_last_regenerate|i:1550499946;map|s:5:\"admin\";map_detail|s:0:\"\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('l6mjr0qdtit1p5dpjkjloh6o6t13jiis','127.0.0.1',1550588803,'__ci_last_regenerate|i:1550588803;map|s:5:\"space\";map_detail|s:0:\"\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('lasr7lu35raigp6i1vd2lg057un3t55j','127.0.0.1',1550499244,'__ci_last_regenerate|i:1550499244;map|s:5:\"admin\";map_detail|s:0:\"\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('nf5hpq3oc6vlgtnphcjdg0tc1sb49b17','127.0.0.1',1550499597,'__ci_last_regenerate|i:1550499597;map|s:5:\"admin\";map_detail|s:0:\"\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('pmlsf25nbi8c1eqis0p21n57u9i44ce1','127.0.0.1',1550501582,'__ci_last_regenerate|i:1550501582;map|s:5:\"admin\";map_detail|s:0:\"\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('qb67t8m9d1r2ppcb3o6ml3fsdalaajre','127.0.0.1',1550501273,'__ci_last_regenerate|i:1550501273;map|s:5:\"admin\";map_detail|s:0:\"\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('qsgamhmdms31ee9r60ghjt5dmd4r13oj','127.0.0.1',1550503377,'__ci_last_regenerate|i:1550503377;map|s:5:\"admin\";map_detail|s:0:\"\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('sus198unm6l76v0d0n77dtddhn32bh55','127.0.0.1',1550502424,'__ci_last_regenerate|i:1550502424;map|s:5:\"admin\";map_detail|s:0:\"\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('timmrplth1fisu6ugf5vd3gfme2t2c7o','127.0.0.1',1550738868,'__ci_last_regenerate|i:1550738868;map|s:5:\"admin\";map_detail|s:0:\"\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;post_uid|s:10:\"admin@root\";'),('udeqq335jf1hs3s0vs1r5rfui5jfq8q1','127.0.0.1',1550504775,'__ci_last_regenerate|i:1550504532;map|s:5:\"admin\";map_detail|s:0:\"\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('uk4cf2qt1vuqti61264qpnu29j8pdn7r','127.0.0.1',1550589731,'__ci_last_regenerate|i:1550589731;map|s:5:\"admin\";map_detail|s:0:\"\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('ukkg264njf5dea1id8bv8ie46k0amei9','127.0.0.1',1550502418,'__ci_last_regenerate|i:1550502418;map|s:5:\"admin\";map_detail|s:0:\"\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;');
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
