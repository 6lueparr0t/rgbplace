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
  `upload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '{"history": []}',
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
INSERT INTO `admin_info` VALUES (1,'admin','daihyun99','JDJ5JDEyJGp6d2doM2REWnkxNlVTRWNsN3pGLnVwUUd4NDF4MjZhS1JYdTFQbGQ1aWJ3R2dhRTduQnFx',0,'2018-11-02 14:26:45','JDJ5JDEwJDlDUklYMFRLQnhQdXRhVG91ZWV1VU9OREtRTk92TzdmY1dFTUtmb1pPMnZjYS4yNmRTZ2d1','2018-11-03 02:26:45','{\"history\": [{\"file_name\": \"61a1d1cb52edf07d87c465ac94b0cd4a.png\", \"file_type\": \"image/png\", \"client_name\": \"burn.png\", \"file_size\": \"19.55\"}, {\"file_name\": \"a3bdbb2d0b95d0027a4fa54b01215abe.png\", \"file_type\": \"image/png\", \"client_name\": \"burn.png\", \"file_size\": \"19.55\"}, {\"file_name\": \"db453e29257c9179f437d448f787e1e2.gif\", \"file_type\": \"image/gif\", \"client_name\": \"20fa3ed7f09a0054bbf1aa49c923e136.gif\", \"file_size\": \"106.28\"}, {\"file_name\": \"7df285d9a900830a713939ee400e79af.png\", \"file_type\": \"image/png\", \"client_name\": \"25176044.png\", \"file_size\": \"43.2\"}, {\"file_name\": \"697924dc94de86f7996cfc42cb275de0.jpeg\", \"file_type\": \"image/jpeg\", \"client_name\": \"일산 호수공원.jpeg\", \"file_size\": \"775.36\"}]}');
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
  `no` int(20) NOT NULL,
  `native` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '로컬 표기 주소',
  `global` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '영문 표기 주소',
  `ctim` datetime NOT NULL DEFAULT current_timestamp(),
  `utim` datetime DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'Admin',
  `keyword` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` double NOT NULL COMMENT '위도',
  `longitude` double NOT NULL COMMENT '경도',
  PRIMARY KEY (`code`,`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='장소(Code) 정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_code`
--

LOCK TABLES `map_code` WRITE;
/*!40000 ALTER TABLE `map_code` DISABLE KEYS */;
INSERT INTO `map_code` VALUES ('대한민국|South Korea','kr',1,'{\"address\": [\"괴안동\",\"소사구\",\"부천시\",\"경기도\",\"대한민국\"]}','{\"address\": [\"Goean-dong\",\"Sosa-gu\",\"Bucheon-si\",\"Gyeonggi-do\",\"South Korea\"]}','2018-11-02 23:54:51',NULL,'','Admin','한국',37.4802442,126.81021279999999);
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
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('post','reply') COLLATE utf8mb4_unicode_ci NOT NULL,
  `relation` int(11) NOT NULL,
  `post` int(11) NOT NULL,
  `ctim` datetime NOT NULL DEFAULT current_timestamp(),
  `utim` datetime DEFAULT NULL,
  `dtim` datetime DEFAULT NULL,
  `act` enum('up','down','view','n','report','') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_kr1_history`
--

LOCK TABLES `map_kr1_history` WRITE;
/*!40000 ALTER TABLE `map_kr1_history` DISABLE KEYS */;
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
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `up` int(11) NOT NULL DEFAULT 0,
  `down` int(11) NOT NULL DEFAULT 0,
  `post` int(11) NOT NULL,
  `mention` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `follow` int(11) DEFAULT NULL,
  `depth1` int(11) NOT NULL DEFAULT 0,
  `depth2` int(11) NOT NULL DEFAULT 0,
  `deprh3` int(11) NOT NULL DEFAULT 0,
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
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('post','reply') COLLATE utf8mb4_unicode_ci NOT NULL,
  `relation` int(11) NOT NULL,
  `post` int(11) DEFAULT NULL,
  `ctim` datetime DEFAULT current_timestamp(),
  `utim` datetime DEFAULT NULL,
  `dtim` datetime DEFAULT NULL,
  `act` enum('up','down','n','view','report','') COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_space_history`
--

LOCK TABLES `map_space_history` WRITE;
/*!40000 ALTER TABLE `map_space_history` DISABLE KEYS */;
INSERT INTO `map_space_history` VALUES (70,'admin@daihyun99','post',9,NULL,'2018-10-09 01:18:53',NULL,NULL,'view'),(71,'admin@daihyun99','post',9,NULL,'2018-10-09 01:18:55',NULL,NULL,'up'),(72,'admin@daihyun99','post',30,NULL,'2018-10-20 16:46:30',NULL,NULL,'view'),(73,'admin@daihyun99','post',1,NULL,'2018-10-26 23:17:47',NULL,NULL,'view'),(74,'admin@daihyun99','post',12,NULL,'2018-10-26 23:27:06',NULL,NULL,'view'),(75,'admin@daihyun99','post',10,NULL,'2018-10-27 00:53:52',NULL,NULL,'view'),(76,'admin@daihyun99','post',5,NULL,'2018-10-27 01:05:37',NULL,NULL,'view'),(77,'admin@daihyun99','post',38,NULL,'2018-10-29 00:58:22',NULL,NULL,'view'),(78,'admin@daihyun99','post',38,NULL,'2018-11-02 00:07:42','2018-11-02 00:07:42',NULL,'n'),(79,'admin@daihyun99','post',30,NULL,'2018-11-01 02:58:05',NULL,NULL,'up'),(80,'admin@daihyun99','post',30,NULL,'2018-11-01 02:58:05',NULL,NULL,'up'),(81,'admin@daihyun99','post',30,NULL,'2018-11-01 02:58:05',NULL,NULL,'up'),(82,'admin@daihyun99','post',30,NULL,'2018-11-01 02:58:05',NULL,NULL,'up'),(83,'admin@daihyun99','post',30,NULL,'2018-11-01 02:58:05',NULL,NULL,'up'),(84,'admin@daihyun99','post',30,NULL,'2018-11-01 02:58:05',NULL,NULL,'up'),(85,'admin@daihyun99','post',30,NULL,'2018-11-01 02:58:05',NULL,NULL,'up'),(86,'admin@daihyun99','post',30,NULL,'2018-11-01 02:58:05',NULL,NULL,'up'),(87,'admin@daihyun99','post',30,NULL,'2018-11-01 02:58:05',NULL,NULL,'up'),(88,'admin@daihyun99','post',30,NULL,'2018-11-01 02:58:05',NULL,NULL,'up'),(89,'admin@daihyun99','post',30,NULL,'2018-11-01 02:58:05',NULL,NULL,'up'),(90,'admin@daihyun99','post',30,NULL,'2018-11-01 02:58:05',NULL,NULL,'up'),(91,'admin@daihyun99','post',30,NULL,'2018-11-01 02:58:05',NULL,NULL,'up'),(92,'admin@daihyun99','post',30,NULL,'2018-11-01 02:58:05',NULL,NULL,'up'),(93,'admin@daihyun99','post',30,NULL,'2018-11-01 02:58:05',NULL,NULL,'up'),(94,'admin@daihyun99','post',30,NULL,'2018-11-01 02:58:05',NULL,NULL,'up'),(95,'admin@daihyun99','post',30,NULL,'2018-11-01 02:58:05',NULL,NULL,'up'),(96,'admin@daihyun99','post',0,NULL,'2018-11-01 02:05:55',NULL,NULL,'down'),(97,'admin@daihyun99','post',0,NULL,'2018-11-01 02:05:55',NULL,NULL,'down'),(98,'admin@daihyun99','post',0,NULL,'2018-11-01 02:05:55',NULL,NULL,'down'),(99,'admin@daihyun99','post',0,NULL,'2018-11-01 02:05:55',NULL,NULL,'down'),(100,'admin@daihyun99','post',0,NULL,'2018-11-01 02:05:55',NULL,NULL,'down'),(101,'admin@daihyun99','post',0,NULL,'2018-11-01 01:55:13',NULL,NULL,'up'),(102,'admin@daihyun99','post',0,NULL,'2018-11-01 01:57:24',NULL,NULL,'up'),(103,'admin@daihyun99','post',0,NULL,'2018-11-01 01:57:52',NULL,NULL,'up'),(104,'admin@daihyun99','post',0,NULL,'2018-11-01 01:58:28',NULL,NULL,'up'),(105,'admin@daihyun99','post',0,NULL,'2018-11-01 02:01:32',NULL,NULL,'up'),(106,'admin@daihyun99','post',0,NULL,'2018-11-01 02:01:47',NULL,NULL,'up'),(107,'admin@daihyun99','post',0,NULL,'2018-11-01 02:02:01',NULL,NULL,'up'),(108,'admin@daihyun99','post',0,NULL,'2018-11-01 02:02:04',NULL,NULL,'up'),(109,'admin@daihyun99','post',73,NULL,'2018-11-01 02:41:00',NULL,NULL,'up'),(110,'admin@daihyun99','post',73,NULL,'2018-11-01 02:42:40',NULL,NULL,'up'),(111,'admin@daihyun99','post',73,NULL,'2018-11-01 02:45:17',NULL,NULL,'up'),(112,'admin@daihyun99','post',73,NULL,'2018-11-01 02:46:36',NULL,NULL,'up'),(113,'admin@daihyun99','post',73,NULL,'2018-11-01 02:47:17',NULL,NULL,'up'),(114,'admin@daihyun99','post',73,NULL,'2018-11-01 02:48:29',NULL,NULL,'up'),(115,'admin@daihyun99','post',73,NULL,'2018-11-01 02:48:39',NULL,NULL,'up'),(116,'admin@daihyun99','post',73,NULL,'2018-11-01 02:51:35',NULL,NULL,'up'),(117,'admin@daihyun99','post',73,NULL,'2018-11-01 02:52:01',NULL,NULL,'up'),(118,'admin@daihyun99','post',73,NULL,'2018-11-01 02:52:16',NULL,NULL,'down'),(119,'admin@daihyun99','post',73,NULL,'2018-11-01 02:52:24',NULL,NULL,'down'),(120,'admin@daihyun99','post',73,NULL,'2018-11-01 02:52:27',NULL,NULL,'down'),(121,'admin@daihyun99','reply',73,NULL,'2018-11-01 02:58:13',NULL,NULL,'down'),(122,'admin@daihyun99','reply',74,30,'2018-11-01 22:35:39','2018-11-01 22:35:40',NULL,'n');
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
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_space_post`
--

LOCK TABLES `map_space_post` WRITE;
/*!40000 ALTER TABLE `map_space_post` DISABLE KEYS */;
INSERT INTO `map_space_post` VALUES (1,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Hello, World!','test&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;testset&lt;/div&gt;&lt;div&gt;set&lt;/div&gt;&lt;div&gt;set&lt;/div&gt;&lt;div&gt;se&lt;/div&gt;&lt;div&gt;tse&lt;/div&gt;&lt;div&gt;ts&lt;/div&gt;&lt;div&gt;ets&lt;/div&gt;&lt;div&gt;etse&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;',2,0,0,36,'best','first',''),(2,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Hello, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',1,0,0,3,'best','first',''),(3,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Hello, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',1,0,0,2,'best','first',''),(4,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Hello, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',0,0,0,0,'best','first',''),(5,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Hello, 한글!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',1,0,0,0,'best','first',''),(6,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Test, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',1,0,0,0,'best','first',''),(7,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Test, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',0,0,0,0,'best','first',''),(8,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Test, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',0,0,0,0,'best','first',''),(9,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Test, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',5,41,0,0,'best','first',''),(10,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Test, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',1,0,0,0,'best','first',''),(11,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Test, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',1,1,0,0,'best','first',''),(12,'test01','테스트','2018-08-26 16:21:10','0000-00-00 00:00:00','0000-00-00 00:00:00','Hello, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',2,1,0,0,'best','first',''),(13,'admin@daihyun99','daihyun99','2018-08-26 18:49:13',NULL,NULL,'test','\n#test1&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;#test1&lt;br&gt;&lt;/div&gt;&lt;div&gt;#test1&lt;br&gt;&lt;/div&gt;&lt;div&gt;#test1#test1#test6&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;#마지막으로 #한글 #테스트&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;#RGBplace&lt;/div&gt;',2,1,0,3,'free','','test1|test1|test1|test1|test1|test6|마지막으로|한글|테스트|RGBplace'),(16,'admin@daihyun99','daihyun99','2018-08-30 01:11:15',NULL,NULL,'[test] 리다이렉트 실험 (최초)','\n최초였음',1,0,0,0,'free','test',''),(17,'admin@daihyun99','daihyun99','2018-09-01 17:04:20',NULL,NULL,'리다이렉트 실험1','실험한다',0,0,0,0,'free','',''),(18,'admin@daihyun99','daihyun99','2018-09-01 17:09:24',NULL,NULL,'리다이렉트 실험2','실험 또 한다',0,0,0,0,'free','',''),(19,'admin@daihyun99','daihyun99','2018-09-01 17:09:45',NULL,NULL,'리다이렉트 실험2','실험 또 한다',0,0,0,0,'free','',''),(20,'admin@daihyun99','daihyun99','2018-09-01 17:12:12',NULL,NULL,'[test] 리다이렉트 실험3','ㅇㅇ',0,0,0,0,'free','test',''),(21,'admin@daihyun99','daihyun99','2018-09-01 20:37:12',NULL,NULL,'[test] 리다이렉트 실험 4','\n\n\n\n&lt;div&gt;--- 수정 테스트2 ---&lt;br&gt;&lt;/div&gt;&lt;img src=&quot;&quot; width=&quot;400px&quot; height=&quot;400px&quot;&gt;&lt;div&gt;&amp;lt;script&amp;gt;alert(\'test\');&amp;lt;/script&amp;gt;&lt;/div&gt;',2,0,0,0,'free','test',''),(29,'admin@daihyun99','daihyun99','2018-09-06 20:48:04',NULL,NULL,'댓글삭제하는데 왜 글이 삭제되지','\nㅅㅂㅋㅋㅋg',5,1,0,5,'dev','',''),(30,'admin@daihyun99','daihyun99','2018-09-14 22:09:56',NULL,NULL,'[upload] 업로드 테스트','\n\n\n\n\n\n&lt;img src=&quot;/upload/436c0cd8bd370338dd8c6197cdc6d858.png&quot;&gt;&lt;img src=&quot;/upload/901720d2967edb50aadbd6bce571fcdb.png&quot;&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;ㅇㅇ&lt;br&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;/div&gt;&lt;video src=&quot;/upload/ba7c5e2ffcf1f089d2b20c7792b3817c.mp3&quot; controls=&quot;controls&quot;&gt;&lt;/video&gt;&lt;br&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;df&lt;/div&gt;&lt;div&gt;df&lt;/div&gt;&lt;div&gt;df&lt;/div&gt;&lt;div&gt;df&lt;/div&gt;&lt;div&gt;df&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;img src=&quot;/upload/f98ba964ec9de86a84343917a377dde4.jpg&quot; alt=&quot;alps_mountains_snow_vertex_110211_4752x3168.jpg&quot;&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;img src=&quot;/upload/c359ce1c8cae198c83d099420847de80.png&quot; alt=&quot;25176044.png&quot;&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;/div&gt;&lt;br&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;img src=&quot;/upload/f1f73b8fbd0bf90cf135c2dca4aaa0e1.png&quot; alt=&quot;burn.png&quot;&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;br&gt;&lt;/div&gt;&lt;img src=&quot;/upload/cfcafa2c379856220ab6c81d659af0d9.png&quot; alt=&quot;Big_dipper.png&quot; style=&quot;max-width: 100%;&quot;&gt;&lt;br&gt;&lt;br&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;img src=&quot;/upload/477a8a7d3de483d2891fac3c91d882d0.png&quot; alt=&quot;burn.png&quot; style=&quot;max-width: 100%;&quot;&gt;&lt;br&gt;&lt;br&gt;\n\n&lt;script&gt;alert(\\\'test\\\');&lt;/script&gt;',23,21,-9,8,'best','upload',''),(34,'admin@daihyun99','daihyun99','2018-09-15 01:19:01',NULL,NULL,'test','\n\n\ntset&lt;img src=&quot;/upload/1304bd4f03c74e4f5f7542e7d2c9e99a.png&quot; alt=&quot;25176044.png&quot;&gt;&lt;br&gt;&lt;br&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;img src=&quot;/upload/1d7c5871161197ea94d4a7f32395a4d3.gif&quot; alt=&quot;20fa3ed7f09a0054bbf1aa49c923e136.gif&quot;&gt;&lt;br&gt;&lt;br&gt;&lt;img src=&quot;/upload/fc06b1bada6ffd0585cb6f2b0aae9e7f.png&quot; alt=&quot;6lueparr0t.png&quot;&gt;&lt;br&gt;&lt;br&gt;&lt;img src=&quot;/upload/a87940502eb1ff291a3037512b209df2.png&quot; alt=&quot;burn.png&quot;&gt;&lt;br&gt;&lt;br&gt;',2,1,0,0,'dev','',''),(35,'admin@daihyun99','daihyun99','2018-09-15 01:50:21',NULL,NULL,'test2','\ntest2&lt;img src=&quot;/upload/8d0c45b304eddc565fbcd0b653f79aaa.png&quot; alt=&quot;burn.png&quot;&gt;&lt;br&gt;&lt;br&gt;&lt;img src=&quot;/upload/da7e074b3aad4de241daaec08946acbb.png&quot; alt=&quot;Big_dipper.png&quot;&gt;&lt;br&gt;&lt;br&gt;',1,0,0,0,'dev','',''),(36,'admin@daihyun99','daihyun99','2018-09-19 06:16:43',NULL,NULL,'[upload] test2','\n\n\n&lt;div&gt;&lt;img src=&quot;http://127.0.0.1/upload/99f1baf64a8d16e60304e9b88eb4028a.png&quot; alt=&quot;burn.png&quot; style=&quot;max-width: 100%;&quot;&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;img src=&quot;http://127.0.0.1/upload/99f1baf64a8d16e60304e9b88eb4028a.png&quot; alt=&quot;burn.png&quot; style=&quot;max-width: 100%;&quot;&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;img src=&quot;/upload/cd59dbb412d75375993cc21020a3694c.jpg&quot; alt=&quot;chess_pieces_2-wallpaper-1920x1080.jpg&quot; style=&quot;max-width: 100%;&quot;&gt;&lt;br&gt;&lt;br&gt;&lt;img src=&quot;/upload/0914c199b5c330e298190af792b91b0b.png&quot; alt=&quot;burn.png&quot; style=&quot;max-width: 100%;&quot;&gt;&lt;br&gt;&lt;br&gt;&lt;img src=&quot;/upload/15444d5c55c66bd73721a260302d5024.jpg&quot; alt=&quot;chess_pieces_2-wallpaper-1920x1080.jpg&quot; style=&quot;max-width: 100%;&quot;&gt;&lt;br&gt;&lt;br&gt;&lt;img src=&quot;/upload/61a1d1cb52edf07d87c465ac94b0cd4a.png&quot; alt=&quot;burn.png&quot; style=&quot;max-width: 100%;&quot;&gt;&lt;br&gt;&lt;br&gt;&lt;img src=&quot;/upload/a3bdbb2d0b95d0027a4fa54b01215abe.png&quot; alt=&quot;burn.png&quot; style=&quot;max-width: 100%;&quot;&gt;&lt;br&gt;&lt;br&gt;',2,0,1,0,'dev','upload',''),(37,'test01','테스트','2018-09-19 22:14:47',NULL,NULL,'[upload] 일반 계정 업로드 테스트','&lt;img src=&quot;/upload/42df1f969e57f277b068dc0c39558ee5.png&quot; alt=&quot;burn.png&quot; style=&quot;max-width: 100%;&quot;&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;버닝버닝 핫 오션월D~&lt;br&gt;&lt;br&gt;&lt;/div&gt;',3,1,0,0,'dev','upload',''),(38,'admin@daihyun99','daihyun99','2018-10-29 00:58:21',NULL,NULL,'[사진] 메인 사진 변경하기','\n&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;img src=&quot;http://127.0.0.1/upload/697924dc94de86f7996cfc42cb275de0.jpeg&quot; alt=&quot;일산 호수공원.jpeg&quot; style=&quot;max-width: 100%;&quot;&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;\nㅇㅇㅇ&lt;br&gt;&lt;br&gt;&lt;div&gt;\n&lt;iframe width=&quot;560&quot; height=&quot;315&quot; src=&quot;https://www.youtube.com/embed/D3ZFtSoWtRc&quot; frameborder=&quot;0&quot; allow=&quot;autoplay; encrypted-media&quot; allowfullscreen=&quot;&quot;&gt;&lt;/iframe&gt;&lt;/div&gt;&lt;br&gt;\n\n&lt;script&gt;alert(\\\'test\\\');&lt;/script&gt;test',1,20,0,0,'best','사진','');
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
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_space_reply`
--

LOCK TABLES `map_space_reply` WRITE;
/*!40000 ALTER TABLE `map_space_reply` DISABLE KEYS */;
INSERT INTO `map_space_reply` VALUES (1,'admin@daihyun99','daihyun99','2018-07-07 15:46:48',NULL,NULL,'테스트 댓글 답니다',0,0,1,'',NULL,0,1,0,0,0,0,0,0,0,0,0),(2,'admin@daihyun99','daihyun99','2018-07-07 15:46:56',NULL,NULL,'우앙!',0,0,1,'daihyun99',1,1,1,1,0,0,0,0,0,0,0,0),(3,'admin@daihyun99','daihyun99','2018-07-07 15:47:11',NULL,NULL,'2등',0,0,1,'',NULL,0,2,0,0,0,0,0,0,0,0,0),(4,'admin@daihyun99','daihyun99','2018-07-07 15:47:18',NULL,NULL,'ㄴㄴ 님 3등',0,0,1,'daihyun99',3,3,2,1,0,0,0,0,0,0,0,0),(5,'admin@daihyun99','daihyun99','2018-07-07 15:47:36',NULL,NULL,'귀척 ㄴㄴ',0,0,1,'daihyun99',1,2,1,1,1,0,0,0,0,0,0,0),(6,'admin@daihyun99','daihyun99','2018-07-07 15:47:56',NULL,NULL,'십.노.잼',0,0,1,'daihyun99',1,1,1,2,0,0,0,0,0,0,0,0),(7,'admin@daihyun99','daihyun99','2018-07-07 15:48:14',NULL,NULL,'이분 이제 5등이랍니다 글 내려주세요',0,0,1,'daihyun99',3,4,2,1,1,0,0,0,0,0,0,0),(8,'admin@daihyun99','daihyun99','2018-07-07 15:50:43',NULL,NULL,'ㅇㅈ',0,0,1,'daihyun99',1,5,1,1,1,1,0,0,0,0,0,0),(9,'admin@daihyun99','daihyun99','2018-07-07 17:28:22',NULL,NULL,'wow',0,0,1,'',NULL,0,3,0,0,0,0,0,0,0,0,0),(10,'admin@daihyun99','daihyun99','2018-07-13 00:12:00',NULL,NULL,'test1',0,0,2,'',NULL,0,4,0,0,0,0,0,0,0,0,0),(11,'admin@daihyun99','daihyun99','2018-07-24 23:41:37',NULL,NULL,'7월 24일 npm 업데이트 하고 난 후의 테스트',0,0,1,'daihyun99',9,9,3,1,0,0,0,0,0,0,0,0),(12,'test01','테스트','2018-08-12 00:36:55',NULL,NULL,'map -&gt; api 로 request 처리 옮김.',0,0,1,'',NULL,0,5,0,0,0,0,0,0,0,0,0),(13,'admin@daihyun99','daihyun99','2018-08-18 09:28:56',NULL,NULL,'reply -&gt; reply-addon 으로 클래스 변경',0,0,1,'',NULL,0,6,0,0,0,0,0,0,0,0,0),(14,'admin@daihyun99','daihyun99','2018-08-18 09:29:11',NULL,NULL,'대댓글도 잘 되는지 확인',0,0,1,'daihyun99',13,13,6,1,0,0,0,0,0,0,0,0),(15,'admin@daihyun99','daihyun99','2018-08-18 09:29:21',NULL,NULL,'나도 확인',0,0,1,'daihyun99',13,14,6,1,1,0,0,0,0,0,0,0),(16,'admin@daihyun99','daihyun99','2018-08-18 09:29:58',NULL,NULL,'2등 (새치기당함)',0,0,1,'daihyun99',13,13,6,2,0,0,0,0,0,0,0,0),(17,'admin@daihyun99','daihyun99','2018-08-20 22:56:15',NULL,NULL,'\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nTEST',0,0,2,'daihyun99',10,10,4,1,0,0,0,0,0,0,0,0),(18,'admin@daihyun99','daihyun99','2018-08-20 22:56:39',NULL,NULL,'띄\n어\n쓰\n끼',0,0,2,'daihyun99',10,10,4,2,0,0,0,0,0,0,0,0),(19,'admin@daihyun99','daihyun99','2018-08-22 23:53:00',NULL,NULL,'댓글 확인?\n띄어쓰기 확인\n확\n\n인',0,0,3,'',NULL,0,7,0,0,0,0,0,0,0,0,0),(20,'admin@daihyun99','daihyun99','2018-08-22 23:53:12',NULL,NULL,'대댓글 확.인.',0,0,3,'daihyun99',19,19,7,1,0,0,0,0,0,0,0,0),(21,'admin@daihyun99','daihyun99','2018-08-29 01:17:12',NULL,NULL,'테스트 첫 댓글',0,0,13,'',NULL,0,8,0,0,0,0,0,0,0,0,0),(22,'admin@daihyun99','daihyun99','2018-08-29 01:28:12',NULL,NULL,'테스트 첫 대댓글',0,0,13,'daihyun99',21,21,8,1,0,0,0,0,0,0,0,0),(23,'admin@daihyun99','daihyun99','2018-09-05 22:42:54',NULL,NULL,'댓글 수정1',0,0,27,'',NULL,0,9,0,0,0,0,0,0,0,0,0),(28,'admin@daihyun99','daihyun99','2018-09-06 20:50:13',NULL,NULL,'test',0,0,29,'',NULL,0,10,0,0,0,0,0,0,0,0,0),(29,'admin@daihyun99','daihyun99','2018-09-06 21:02:10',NULL,NULL,'test23',0,0,29,'',NULL,0,11,0,0,0,0,0,0,0,0,0),(30,'admin@daihyun99','daihyun99','2018-09-06 21:02:16',NULL,NULL,'test3 댓글 수정함2',160,0,29,'daihyun99',29,29,11,1,0,0,0,0,0,0,0,0),(32,'admin@daihyun99','daihyun99','2018-09-06 22:15:30',NULL,NULL,'test4 대댓글 닮 // 대댓글 다는척 하면서 수정함',0,0,29,'daihyun99',29,30,11,1,1,0,0,0,0,0,0,0),(34,'admin@daihyun99','daihyun99','2018-09-07 23:14:08',NULL,NULL,'18',0,0,1,'',NULL,0,12,0,0,0,0,0,0,0,0,0),(35,'admin@daihyun99','daihyun99','2018-09-07 23:19:24',NULL,NULL,'19',0,0,1,'',NULL,0,13,0,0,0,0,0,0,0,0,0),(36,'admin@daihyun99','daihyun99','2018-09-07 23:19:31',NULL,NULL,'18-1',0,0,1,'daihyun99',34,34,12,1,0,0,0,0,0,0,0,0),(37,'admin@daihyun99','daihyun99','2018-09-07 23:19:47',NULL,NULL,'18-1-1',0,0,1,'daihyun99',34,36,12,1,1,0,0,0,0,0,0,0),(38,'admin@daihyun99','daihyun99','2018-09-07 23:19:56',NULL,NULL,'18-2',0,0,1,'daihyun99',34,34,12,2,0,0,0,0,0,0,0,0),(42,'admin@daihyun99','daihyun99','2018-09-07 23:45:24',NULL,NULL,'20',0,0,1,'',NULL,0,14,0,0,0,0,0,0,0,0,0),(43,'admin@daihyun99','daihyun99','2018-09-07 23:49:43',NULL,NULL,'18-3',0,0,1,'daihyun99',34,34,12,3,0,0,0,0,0,0,0,0),(44,'admin@daihyun99','daihyun99','2018-09-08 00:37:28',NULL,NULL,'개.꿀.잼',0,0,1,'daihyun99',1,1,1,3,0,0,0,0,0,0,0,0),(45,'admin@daihyun99','daihyun99','2018-09-08 00:39:40',NULL,NULL,'test',0,0,1,'daihyun99',42,42,14,1,0,0,0,0,0,0,0,0),(46,'admin@daihyun99','daihyun99','2018-09-08 00:41:10',NULL,NULL,'test2',0,0,1,'daihyun99',42,42,14,2,0,0,0,0,0,0,0,0),(47,'admin@daihyun99','daihyun99','2018-09-08 00:42:38',NULL,NULL,'test3',0,0,1,'daihyun99',42,42,14,3,0,0,0,0,0,0,0,0),(48,'admin@daihyun99','daihyun99','2018-09-08 00:42:59',NULL,NULL,'ㅇㅈ',0,0,1,'daihyun99',1,44,1,3,1,0,0,0,0,0,0,0),(49,'admin@daihyun99','daihyun99','2018-09-08 01:02:36',NULL,NULL,'다음 페이지로 넘어가는지 확인',0,0,1,'daihyun99',34,34,12,4,0,0,0,0,0,0,0,0),(50,'admin@daihyun99','daihyun99','2018-09-08 01:03:23',NULL,NULL,'이건 넘어감',0,0,1,'daihyun99',34,37,12,1,1,1,0,0,0,0,0,0),(51,'admin@daihyun99','daihyun99','2018-09-08 15:52:07',NULL,NULL,'test4',0,0,1,'daihyun99',42,42,14,4,0,0,0,0,0,0,0,0),(52,'admin@daihyun99','daihyun99','2018-09-08 15:53:37',NULL,NULL,'test5',0,0,1,'daihyun99',42,42,14,5,0,0,0,0,0,0,0,0),(53,'admin@daihyun99','daihyun99','2018-09-08 15:53:54',NULL,NULL,'2페이지 넘어가기',0,0,1,'daihyun99',34,34,12,5,0,0,0,0,0,0,0,0),(73,'admin@daihyun99','daihyun99','2018-09-25 17:30:19',NULL,NULL,'|￣￣￣￣￣￣￣￣￣￣|\n| 저어어어어어어어장 \n|＿＿＿＿＿＿＿＿＿＿|   \n / )__/ )  || \n(•ㅅ•)  || \n/. . . . . . づ',90,40,30,'',NULL,0,15,0,0,0,0,0,0,0,0,0),(74,'admin@daihyun99','daihyun99','2018-09-25 17:32:47',NULL,NULL,'(˃̣̣̥᷄⌓˂̣̣̥᷅)',0,0,30,'',NULL,0,16,0,0,0,0,0,0,0,0,0),(75,'admin@daihyun99','daihyun99','2018-09-25 17:33:05',NULL,NULL,'|￣￣￣￣￣￣￣|&nbsp;| 여기 있어...|＿＿＿＿＿＿＿|&nbsp;(\\__/) ||&nbsp;(•ㅅ•)..||&nbsp;/ . . . .づ',0,0,30,'',NULL,0,17,0,0,0,0,0,0,0,0,0),(76,'admin@daihyun99','daihyun99','2018-09-25 17:34:01',NULL,NULL,'&lt;span style=&quot;font-family: Verdana, Arial, Gulim; font-size: 12px; font-weight: 400; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;(˃̣̣̥᷄⌓˂̣̣̥᷅)&lt;/span&gt;',0,0,30,'',NULL,0,18,0,0,0,0,0,0,0,0,0),(77,'admin@daihyun99','daihyun99','2018-09-25 17:34:30',NULL,NULL,'&lt;font face=&quot;Verdana, Arial, Gulim&quot;&gt;&lt;span style=&quot;font-size: 12px; font-weight: 400; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;(˃̣̣̥᷄⌓˂̣̣̥᷅)&lt;/span&gt;&lt;/font&gt;&lt;br&gt;',0,0,30,'',NULL,0,19,0,0,0,0,0,0,0,0,0),(79,'admin@daihyun99','daihyun99','2018-09-25 17:42:30',NULL,NULL,'|￣￣￣￣￣￣￣￣￣￣|\n| 저어어어어어어어장 \n|＿＿＿＿＿＿＿＿＿＿|   \n / )__/ )  || \n(•ㅅ•)  || \n/. . . . . . づ',0,0,30,'',NULL,0,20,0,0,0,0,0,0,0,0,0),(80,'admin@daihyun99','daihyun99','2018-09-25 17:43:19',NULL,NULL,'ʕ っ•ᴥ•`ʔづ ⌒ ㅊㅊ',0,0,30,'',NULL,0,21,0,0,0,0,0,0,0,0,0),(81,'admin@daihyun99','daihyun99','2018-09-25 17:44:05',NULL,NULL,'ㅡㅡヽ、_ノㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅤ\nㅤㅤㅤ \\\'ｰ \\\' \nㅤㅤㅤㅤㅤＯ\nㅤㅤㅤㅤㅤㅤo\nㅤㅤㅤㅤㅤㅤ 。 ,.-ｰ冖\\\'⌒\\\'ｰ-､\nㅤㅤㅤㅤㅤㅤㅤ ,ノ ㅤㅤㅤㅤㅤㅤ＼\nㅤㅤㅤㅤㅤㅤㅤ/ㅤ,r‐へへく⌒\\\'￢ㅤ､ ヽ\nㅤㅤㅤㅤㅤㅤㅤ{ノ へ.._、 ,,／~`ㅤ〉｝ㅤㅤㅤ\nㅤㅤㅤㅤㅤㅤ／プ￣`y\\\'¨Y´￣ヽ-}j=くㅤㅤㅤ\nㅤㅤㅤㅤㅤノ/レ\\\'&gt;-〈＿ｭ`ー‐\\\'ㅤㅤﾘ,ｲ} ㅤㅤ\nㅤㅤㅤㅤ/_勺 ｲ;；∵r;==､､∴\\\'∵;ㅤシ ㅤㅤ\nㅤㅤㅤ /└\\\' ノ ＼ ㅤㅤこ¨｀ ㅤㅤノ\nㅤㅤㅤ人＿_/ー┬ 个-､＿_,,.. ‐\\\'´ 〃`ァーｧー＼\nㅤ ㅤ/|／ ㅤ|::::::|､ㅤㅤㅤㅤㅤㅤㅤ〃/:::::/ ヽ\nㅤ /｜ ㅤㅤ|::::::|＼､_________／ /:::::/',0,0,30,'',NULL,0,22,0,0,0,0,0,0,0,0,0),(85,'admin@daihyun99','daihyun99','2018-09-29 18:54:33',NULL,NULL,'test',0,0,13,'daihyun99',21,22,8,1,1,0,0,0,0,0,0,0);
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
INSERT INTO `user_conf` VALUES ('test01',1,0,0,0,0,NULL,0,NULL,NULL,NULL),('test02',1,0,0,0,0,NULL,0,NULL,NULL,NULL),('test03',1,0,0,0,0,NULL,0,NULL,NULL,NULL),('test04',1,0,0,0,0,NULL,0,NULL,NULL,NULL),('test05',1,0,0,0,0,NULL,0,NULL,NULL,NULL),('test06',1,0,0,0,0,NULL,0,NULL,NULL,NULL);
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
  `level` int(11) NOT NULL DEFAULT 1,
  `score` int(11) NOT NULL DEFAULT 0,
  `map` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fail` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '로그인 20회 실패시 차단, 성공시 초기화',
  `ctim` datetime NOT NULL DEFAULT current_timestamp(),
  `atim` datetime DEFAULT NULL,
  `utim` datetime DEFAULT NULL,
  `btim` datetime DEFAULT NULL,
  `upload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '{"history": []}',
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
INSERT INTO `user_info` VALUES ('test01','테스트',NULL,'JDJ5JDEyJFY1dUc2dzdWdG9YWHpqRjJ5L3Zad2VwYWlmNDM0N0JSREpHYnRqaGd3aUJacEFFWVhaUjlH',1,20,'kr1',0,'2017-02-16 18:53:33','2018-09-23 14:24:50',NULL,NULL,'{\"history\": [{\"file_name\": \"42df1f969e57f277b068dc0c39558ee5.png\", \"file_type\": \"image/png\", \"client_name\": \"burn.png\", \"file_size\": \"19.55\"}]}',''),('test02','삭제테스트',NULL,'JDJ5JDEyJEgxcmE5bWc4Nk5kZy9vYWU2MjdWeGV0VEUxLnlkUTRMNEppSnNtYUh5VXlFMlhRdC9YejN5',1,0,NULL,0,'2017-03-23 02:24:00','2017-12-30 18:04:59',NULL,NULL,'{\"history\": []}',''),('test03','ajax테스트',NULL,'JDJ5JDEyJFBqS3dUTi5CR1F5TWFFUTN1eUo2THVwUEJRaHpTTlJBWmFucVQzNGhUUE9LMTdac0hSb3Y2',1,0,NULL,0,'2017-03-23 15:30:42','2018-01-20 18:37:57',NULL,NULL,'{\"history\": []}',''),('test04','테스트04',NULL,'JDJ5JDEyJE1HOWU2bkcxZGE1ZU9pRFlvb3hoVU9ZUWJCdUd1VjlkQTBFa2ZHWHFrSUhkejVpTkN3U2M2',1,0,NULL,0,'2018-10-03 01:14:10',NULL,NULL,NULL,'{\"history\": []}',''),('test05','잇힝',NULL,'JDJ5JDEyJEJwd1VJcTZKZkhKekkwb2pkRmRBUnVCZ1ZBZE9rNWNzZ1RodTRnRWNrUU54SGNuNnAzWW5P',1,0,NULL,0,'2018-10-03 01:23:29',NULL,NULL,NULL,'{\"history\": []}',''),('test06','테스트06',NULL,'JDJ5JDEyJHpWQTJNMXdydmd4RkxlU0Q1ckJpcE94eHNJZnEvb1RBVUhQeVBZcGFDQXU3YndSalZPSm5l',1,0,NULL,0,'2018-11-01 22:46:21',NULL,NULL,NULL,'{\"history\": []}','');
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
INSERT INTO `user_session` VALUES ('02mjvkmo38mu5n10o84cht9p2a28rfc4','127.0.0.1',1541006232,'__ci_last_regenerate|i:1541006232;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('0dov331l4slb7pmk71l2vggfa1b38dob','127.0.0.1',1541171203,'__ci_last_regenerate|i:1541171203;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('0o3v3cpjtajfm1qt1fj6ob7r7k7k2fh0','127.0.0.1',1541171616,'__ci_last_regenerate|i:1541171616;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('10kklgll33v1ns4eqn5q62av5qdikgl9','127.0.0.1',1541007510,'__ci_last_regenerate|i:1541007510;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('25raj6u069713o2lo09b653b6bn1om7a','127.0.0.1',1541079277,'__ci_last_regenerate|i:1541079277;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('2j884cjbd8i07eqagm19isrb25iqa12s','127.0.0.1',1541084096,'__ci_last_regenerate|i:1541084096;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('3a08tucb1mlr77k3s45ame89qajkvevc','127.0.0.1',1541088097,'__ci_last_regenerate|i:1541088097;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('3fdsjbv5l1njb3c13ip7p8aau684rl9p','127.0.0.1',1541079913,'__ci_last_regenerate|i:1541079913;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('3k865lb0bcs9icfr9aocpiog0gsec0n2','127.0.0.1',1541078294,'__ci_last_regenerate|i:1541078294;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('45lqg6mjsqck0forqng72ggjmv6h27ub','127.0.0.1',1541004793,'__ci_last_regenerate|i:1541004793;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('4rhkv5tgv0v03m51ecqtha4hs86qvdgr','127.0.0.1',1541089682,'__ci_last_regenerate|i:1541089682;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('5louf7c7toatc0r8o44otv9p11k18a4t','127.0.0.1',1541089070,'__ci_last_regenerate|i:1541089070;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('6fgcjijdelt4mf9cv39s6of9i4ifsgle','127.0.0.1',1541082867,'__ci_last_regenerate|i:1541082867;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('6gse9m3l6caqla2nsjakt8tcb06e69a1','127.0.0.1',1541008699,'__ci_last_regenerate|i:1541008655;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('7729lf8julquojkcgfm0pu5ntuqfp91g','127.0.0.1',1541005783,'__ci_last_regenerate|i:1541005783;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('7o2shgie3bsl4greatmr9vkc3vfaec8h','127.0.0.1',1541088727,'__ci_last_regenerate|i:1541088727;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('7rqj1cilqurap9k6vars0nleg1v7ap6p','127.0.0.1',1541083714,'__ci_last_regenerate|i:1541083714;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('7vrdacc7qs1l7fi48l9qen73h7qpbpo2','127.0.0.1',1541008294,'__ci_last_regenerate|i:1541008294;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('8p9llo5mpaq8rg1iqo48d9rt6l4j385u','127.0.0.1',1541078671,'__ci_last_regenerate|i:1541078671;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('8r7i07svjio19os2go7fq9kkg8s31n81','127.0.0.1',1541078976,'__ci_last_regenerate|i:1541078976;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('9b5cufjmrlc8id0ptugp3oeplar72kkc','127.0.0.1',1541087776,'__ci_last_regenerate|i:1541087776;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('9u5p9qeqlhda2umgci2c2b1ppals556r','127.0.0.1',1541170214,'__ci_last_regenerate|i:1541170214;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('a5vgm3eansj13dtnp2qn1onsir1ssf6l','127.0.0.1',1541006903,'__ci_last_regenerate|i:1541006903;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('a9d1a5o1in5t3pso5f0i13oq7os3r2kr','127.0.0.1',1541007208,'__ci_last_regenerate|i:1541007208;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('ad4r4n914jjs6u36liqmge04v2niph9j','127.0.0.1',1541080982,'__ci_last_regenerate|i:1541080982;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('bobu3cq88mld9hgqktalchfu369k374n','127.0.0.1',1541005108,'__ci_last_regenerate|i:1541005108;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('e6viu1igho4rq3c24ptd96untq1lnuek','127.0.0.1',1541081597,'__ci_last_regenerate|i:1541081597;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('ek5blka7umfiq2f3i0972i4hc584ebq8','127.0.0.1',1541089371,'__ci_last_regenerate|i:1541089371;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('flpo50i909en8k6koo6o0ja8rtlgipp9','127.0.0.1',1541082437,'__ci_last_regenerate|i:1541082437;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('fne6kbtlr9as26g7ekcfm0iv2vmv8fti','127.0.0.1',1541006564,'__ci_last_regenerate|i:1541006564;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('g24qm9mk0djtq85mjs9tt63m56tp5bub','127.0.0.1',1541084401,'__ci_last_regenerate|i:1541084401;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('g4e7g5aa5ojkd5stk5ei1rh7i5ou3d8t','127.0.0.1',1541004476,'__ci_last_regenerate|i:1541004476;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('gfohilb9ihv5f6mgm0jd1ljtdh32tv7e','127.0.0.1',1541169115,'__ci_last_regenerate|i:1541169115;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('h0hkh8lsdj7ugui33h26mio5kluamj92','127.0.0.1',1541171620,'__ci_last_regenerate|i:1541171616;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('hds9dpo2s6vcqm0uaqlfkdvv9qcq8mk3','127.0.0.1',1541168805,'__ci_last_regenerate|i:1541168805;'),('i211iuch3ccllaqirv2dv7rkh95fmok5','127.0.0.1',1541084734,'__ci_last_regenerate|i:1541084734;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('k8ssv3ammo3bn9f3alcoo93niqbs2q51','127.0.0.1',1541082083,'__ci_last_regenerate|i:1541082083;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('ldapqp38mo61ld95r1ks3bi1lc0e2fs0','127.0.0.1',1541084893,'__ci_last_regenerate|i:1541084734;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('ocpv6hi85i6t2gs92af0vc80vkdgurln','127.0.0.1',1541089682,'__ci_last_regenerate|i:1541089682;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('p53n8singj0pqrik83l0uuia7409qsc1','127.0.0.1',1541005427,'__ci_last_regenerate|i:1541005427;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('qrav7ermm7nlonadupae971b0ccojrdl','127.0.0.1',1541169906,'__ci_last_regenerate|i:1541169906;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('rqpf88qarao9epitqlbcckqj47c3qsc4','127.0.0.1',1541081296,'__ci_last_regenerate|i:1541081296;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('snus3396b3oc51vu4qik35v500i4642g','127.0.0.1',1541007911,'__ci_last_regenerate|i:1541007911;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('so7s5mo0bin8k22hgj48krdotbafimek','127.0.0.1',1541080671,'__ci_last_regenerate|i:1541080671;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('u893ubs6tp8tnov627dk642ff35aurrg','127.0.0.1',1541088407,'__ci_last_regenerate|i:1541088407;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('ug5vkd1jf1r6rht6sccfe1r52tbfs7ke','127.0.0.1',1541008655,'__ci_last_regenerate|i:1541008655;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('uoahnlnr8cbiavgenggmtbfgkcmn9a7r','127.0.0.1',1541083206,'__ci_last_regenerate|i:1541083206;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('v72ev1or2v9to7p17mi10ah8oq3gj7so','127.0.0.1',1541087302,'__ci_last_regenerate|i:1541087302;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;');
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
/*!50003 DROP PROCEDURE IF EXISTS `createMap` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createMap`(IN `in_country` VARCHAR(100), IN `in_code` CHAR(2), IN `in_native` LONGTEXT, IN `in_global` LONGTEXT, IN `in_description` TEXT, IN `in_keyword` TEXT, IN `in_latitude` DOUBLE, IN `in_longitude` DOUBLE)
BEGIN

DECLARE in_no int default 0;
SELECT count(no) into in_no FROM map_code WHERE code = in_code;
SET in_no = in_no + 1;



INSERT INTO map_code (country, code, no, native, global, description, keyword, latitude, longitude) values(in_country, in_code, in_no, concat('{"address": ', in_native,'}'), concat('{"address": ', in_global,'}'), in_description, in_keyword, in_latitude, in_longitude );
SET @post = CONCAT('CREATE TABLE map_', in_code, in_no, '_post (\n\tno      int not null auto_increment,\n\tuid     varchar(100) not null,\n\tcountry    varchar(100) not null,\n\tctim    datetime not null default current_timestamp,\n\tutim    datetime,\n\tdtim    datetime,\n\ttitle   varchar(1000) not null,\n\tcontent text not null,\n\treply int not null default 0,\n\thit int not null default 0,\n\tup int not null default 0,\n\tdown int not null default 0,\n\ttype    varchar(20) not null,\n\ttag     varchar(20) not null,\n\tkeyword varchar(400) not null,\n\tPRIMARY KEY (no)\n)');

PREPARE stmt1 FROM @post;
EXECUTE stmt1;

SET @reply = CONCAT('CREATE TABLE map_', in_code,  in_no, '_reply(\n\tno\t\tint\t\t\tnot null auto_increment,\n\tuid\t\tvarchar(100)\tnot null,\n\tname\tvarchar(100)\tnot null,\n\tctim\tdatetime\t\tnot null default current_timestamp,\n\tutim\tdatetime,\n\tdtim\tdatetime,\n\tcontent\tvarchar(2000)\tnot null,\nup int not null default 0,\ndown int not null default 0,\n\tpost\tint not null,\n\tmention\tvarchar(100) default null,\n\tfollow\tint null default null,\n\tdepth1 int not null default 0\r\n, \n\tdepth2 int not null default 0\r\n, \n\tdeprh3 int not null default 0\r\n, \n\tdepth4 int not null default 0\r\n, \n\tdepth5 int not null default 0\r\n, \n\tdepth6 int not null default 0\r\n, \n\tdepth7 int not null default 0\r\n, \n\tdepth8 int not null default 0\r\n, \n\tdepth9 int not null default 0\r\n, \n\tdepth10 int not null default 0\r\n, \n\tPRIMARY KEY (no)\n)');

PREPARE stmt2 FROM @reply;
EXECUTE stmt2;

SET @history = CONCAT('CREATE TABLE map_', in_code,  in_no, '_history( \n\tno      int not null auto_increment, \n\tuid     varchar(100) not null, \n\ttype    enum("post", "reply") not null, \n\trelation int not null, \n\tpost int not null, \n\tctim    datetime not null default current_timestamp, \n\tutim    datetime, \n\tdtim    datetime, \n\tact    enum("up", "down", "view", "n","report","") not null default "", \n\tPRIMARY KEY (no)\n)');

PREPARE stmt3 FROM @history;
EXECUTE stmt3;

DEALLOCATE PREPARE stmt1;
DEALLOCATE PREPARE stmt2;
DEALLOCATE PREPARE stmt3;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `destroyMap` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `destroyMap`(IN `in_code` CHAR(2), IN `in_no` INT)
BEGIN

DELETE FROM map_code WHERE code = in_code AND no = in_no;

SET @post = CONCAT('DROP TABLE map_', in_code, in_no, '_post');
PREPARE stmt1 FROM @post;
EXECUTE stmt1;

SET @reply= CONCAT('DROP TABLE map_', in_code, in_no, '_reply');
PREPARE stmt2 FROM @reply;
EXECUTE stmt2;

SET @history= CONCAT('DROP TABLE map_', in_code, in_no, '_history');
PREPARE stmt3 FROM @history;
EXECUTE stmt3;

DEALLOCATE PREPARE stmt1;
DEALLOCATE PREPARE stmt2;
DEALLOCATE PREPARE stmt3;
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

-- Dump completed on 2018-11-03  0:13:45
