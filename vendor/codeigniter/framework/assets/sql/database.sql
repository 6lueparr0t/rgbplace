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
  `post` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '{"history": []}',
  `upload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '{"history": []}',
  `reply` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '{"history": []}',
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
INSERT INTO `admin_info` VALUES (1,'admin','root','JDJ5JDEyJExOTDBSQ1hVc05jdTV3RDZnZ1cucy5KNXk3SjJvZmM5YlV6YzhNL1BUVndMTkJIcC85aHRt',0,'2018-12-31 17:59:20','JDJ5JDEwJGF5LlZ1Qng0akxCWkw1bTNTTmR0dmVzVHgwRU5kaEVaSlBZRUdEUlF0WEhRMXpuN3hxZ0Qu','2019-01-01 05:59:20','{\"history\":[]}','{\"history\": [{\"file_name\": \"61a1d1cb52edf07d87c465ac94b0cd4a.png\", \"file_type\": \"image/png\", \"client_name\": \"burn.png\", \"file_size\": \"19.55\"}, {\"file_name\": \"a3bdbb2d0b95d0027a4fa54b01215abe.png\", \"file_type\": \"image/png\", \"client_name\": \"burn.png\", \"file_size\": \"19.55\"}, {\"file_name\": \"db453e29257c9179f437d448f787e1e2.gif\", \"file_type\": \"image/gif\", \"client_name\": \"20fa3ed7f09a0054bbf1aa49c923e136.gif\", \"file_size\": \"106.28\"}, {\"file_name\": \"7df285d9a900830a713939ee400e79af.png\", \"file_type\": \"image/png\", \"client_name\": \"25176044.png\", \"file_size\": \"43.2\"}, {\"file_name\": \"697924dc94de86f7996cfc42cb275de0.jpeg\", \"file_type\": \"image/jpeg\", \"client_name\": \"일산 호수공원.jpeg\", \"file_size\": \"775.36\"}, {\"file_name\": \"1bddbc9d49081ea41c8c926c33023a4a.jpg\", \"file_type\": \"image/jpeg\", \"client_name\": \"alps_mountains_snow_vertex_110211_4752x3168.jpg\", \"file_size\": \"4065.88\"}, {\"file_name\": \"7fd870553b86bcdd8c5448babfa38446.png\", \"file_type\": \"image/png\", \"client_name\": \"burn.png\", \"file_size\": \"19.55\"}, {\"file_name\": \"5d0c71ffa045fe4cdccfe5503c6caf0d.png\", \"file_type\": \"image/png\", \"client_name\": \"burn.png\", \"file_size\": \"19.55\"}, {\"file_name\": \"e8c6e2277988d7f4b470ad9dc780138b.png\", \"file_type\": \"image/png\", \"client_name\": \"6lueparr0t.png\", \"file_size\": \"42.01\"}, {\"file_name\": \"4c73340e9d2c2a5c5dc2f3a08a1a1873.png\", \"file_type\": \"image/png\", \"client_name\": \"25176044.png\", \"file_size\": \"43.2\"}, {\"file_name\": \"a277f817730d8bad262326cdd504411c.jpeg\", \"file_type\": \"image/jpeg\", \"client_name\": \"난강하니까.jpeg\", \"file_size\": \"179\"}, {\"file_name\": \"6ba76689c226054e75df9767ded5066f.png\", \"file_type\": \"image/png\", \"client_name\": \"Big_dipper.png\", \"file_size\": \"28.97\", \"date\": \"2018-12-08 13:49:22\"}, {\"file_name\": \"dae3277a38ebee01acae1f112cc11e5a.png\", \"file_type\": \"image/png\", \"client_name\": \"burn.png\", \"file_size\": \"19.55\", \"date\": \"2018-12-13 00:39:30\"}]}','{\"history\": [{\"post\": \"56\", \"map\": \"space\", \"no\": \"164\", \"content\": \"test2\", \"date\": \"2018-12-11 22:02:22\"}, {\"post\": \"58\", \"map\": \"space\", \"no\": \"165\", \"content\": \"댓글 기록 ㅇㅇ\", \"date\": \"2018-12-29 00:40:38\"}, {\"post\": \"58\", \"map\": \"space\", \"no\": \"166\", \"content\": \"2018년도 끝나는구나\", \"date\": \"2018-12-29 00:41:20\"}]}');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='장소(Code) 정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_code`
--

LOCK TABLES `map_code` WRITE;
/*!40000 ALTER TABLE `map_code` DISABLE KEYS */;
INSERT INTO `map_code` VALUES (6,'kr1','kr',1,'대한민국|South Korea','{\"address\": [\"괴안동\",\"소사구\",\"부천시\",\"경기도\",\"대한민국\"]}','{\"address\": [\"Goean-dong\",\"Sosa-gu\",\"Bucheon-si\",\"Gyeonggi-do\",\"South Korea\"]}','2018-11-10 21:40:26',NULL,'','Admin','한국',37.4802114,126.81028229999998);
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
  PRIMARY KEY (`no`),
  KEY `no` (`no`),
  KEY `relation` (`relation`),
  KEY `post` (`post`)
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
  PRIMARY KEY (`no`),
  KEY `no` (`no`)
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
  PRIMARY KEY (`no`),
  KEY `no` (`no`)
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
  PRIMARY KEY (`no`),
  KEY `no` (`no`),
  KEY `relation` (`relation`),
  KEY `post` (`post`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_space_history`
--

LOCK TABLES `map_space_history` WRITE;
/*!40000 ALTER TABLE `map_space_history` DISABLE KEYS */;
INSERT INTO `map_space_history` VALUES (70,'admin@daihyun99','post',9,NULL,'2018-10-09 01:18:53',NULL,NULL,'view'),(71,'admin@daihyun99','post',9,NULL,'2018-10-09 01:18:55',NULL,NULL,'up'),(72,'admin@daihyun99','post',30,NULL,'2018-10-20 16:46:30',NULL,NULL,'view'),(73,'admin@daihyun99','post',1,NULL,'2018-10-26 23:17:47',NULL,NULL,'view'),(74,'admin@daihyun99','post',12,NULL,'2018-10-26 23:27:06',NULL,NULL,'view'),(75,'admin@daihyun99','post',10,NULL,'2018-10-27 00:53:52',NULL,NULL,'view'),(76,'admin@daihyun99','post',5,NULL,'2018-10-27 01:05:37',NULL,NULL,'view'),(77,'admin@daihyun99','post',38,NULL,'2018-10-29 00:58:22',NULL,NULL,'view'),(78,'admin@daihyun99','post',38,NULL,'2018-11-02 00:07:42','2018-11-02 00:07:42',NULL,'n'),(79,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(80,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(81,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(82,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(83,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(84,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(85,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(86,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(87,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(88,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(89,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(90,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(91,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(92,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(93,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(94,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(95,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(96,'admin@daihyun99','post',0,NULL,'2018-11-01 02:05:55',NULL,NULL,'down'),(97,'admin@daihyun99','post',0,NULL,'2018-11-01 02:05:55',NULL,NULL,'down'),(98,'admin@daihyun99','post',0,NULL,'2018-11-01 02:05:55',NULL,NULL,'down'),(99,'admin@daihyun99','post',0,NULL,'2018-11-01 02:05:55',NULL,NULL,'down'),(100,'admin@daihyun99','post',0,NULL,'2018-11-01 02:05:55',NULL,NULL,'down'),(101,'admin@daihyun99','post',0,NULL,'2018-11-01 01:55:13',NULL,NULL,'up'),(102,'admin@daihyun99','post',0,NULL,'2018-11-01 01:57:24',NULL,NULL,'up'),(103,'admin@daihyun99','post',0,NULL,'2018-11-01 01:57:52',NULL,NULL,'up'),(104,'admin@daihyun99','post',0,NULL,'2018-11-01 01:58:28',NULL,NULL,'up'),(105,'admin@daihyun99','post',0,NULL,'2018-11-01 02:01:32',NULL,NULL,'up'),(106,'admin@daihyun99','post',0,NULL,'2018-11-01 02:01:47',NULL,NULL,'up'),(107,'admin@daihyun99','post',0,NULL,'2018-11-01 02:02:01',NULL,NULL,'up'),(108,'admin@daihyun99','post',0,NULL,'2018-11-01 02:02:04',NULL,NULL,'up'),(109,'admin@daihyun99','post',73,NULL,'2018-11-01 02:41:00',NULL,NULL,'up'),(110,'admin@daihyun99','post',73,NULL,'2018-11-01 02:42:40',NULL,NULL,'up'),(111,'admin@daihyun99','post',73,NULL,'2018-11-01 02:45:17',NULL,NULL,'up'),(112,'admin@daihyun99','post',73,NULL,'2018-11-01 02:46:36',NULL,NULL,'up'),(113,'admin@daihyun99','post',73,NULL,'2018-11-01 02:47:17',NULL,NULL,'up'),(114,'admin@daihyun99','post',73,NULL,'2018-11-01 02:48:29',NULL,NULL,'up'),(115,'admin@daihyun99','post',73,NULL,'2018-11-01 02:48:39',NULL,NULL,'up'),(116,'admin@daihyun99','post',73,NULL,'2018-11-01 02:51:35',NULL,NULL,'up'),(117,'admin@daihyun99','post',73,NULL,'2018-11-01 02:52:01',NULL,NULL,'up'),(118,'admin@daihyun99','post',73,NULL,'2018-11-01 02:52:16',NULL,NULL,'down'),(119,'admin@daihyun99','post',73,NULL,'2018-11-01 02:52:24',NULL,NULL,'down'),(120,'admin@daihyun99','post',73,NULL,'2018-11-01 02:52:27',NULL,NULL,'down'),(121,'admin@daihyun99','reply',73,NULL,'2018-11-01 02:58:13',NULL,NULL,'down'),(122,'admin@daihyun99','reply',74,30,'2018-11-01 22:35:39','2018-11-01 22:35:40',NULL,'n'),(123,'admin@daihyun99','post',37,NULL,'2018-11-03 11:46:50',NULL,NULL,'view'),(124,'admin@daihyun99','post',39,NULL,'2018-11-03 11:47:32',NULL,NULL,'view'),(125,'admin@daihyun99','post',39,NULL,'2018-11-03 22:12:08','2018-11-03 22:12:09',NULL,'n'),(126,'admin@daihyun99','post',21,NULL,'2018-11-03 20:46:05',NULL,NULL,'view'),(127,'admin@daihyun99','post',29,NULL,'2018-11-03 20:47:56',NULL,NULL,'view'),(128,'admin@daihyun99','post',34,NULL,'2018-11-03 21:55:50',NULL,NULL,'view'),(129,'admin@daihyun99','post',35,NULL,'2018-11-03 21:56:58',NULL,NULL,'view'),(130,'admin@daihyun99','reply',89,39,'2018-11-03 22:12:09','2018-11-03 22:12:10',NULL,'n'),(131,'admin@daihyun99','reply',28,29,'2018-11-03 22:20:37',NULL,NULL,'report'),(132,'test05','post',30,NULL,'2018-11-04 00:14:54',NULL,NULL,'view'),(133,'test05','post',13,NULL,'2018-11-04 00:23:36',NULL,NULL,'view'),(134,'test05','post',12,NULL,'2018-11-04 00:23:54',NULL,NULL,'view'),(139,'admin@daihyun99','reply',73,30,'2018-11-04 03:23:47',NULL,NULL,'report'),(140,'test01','post',30,NULL,'2018-11-04 03:24:28',NULL,NULL,'view'),(141,'test01','reply',73,30,'2018-11-04 03:25:18',NULL,NULL,'report'),(142,'admin@daihyun99','post',20,NULL,'2018-11-06 00:53:41',NULL,NULL,'view'),(143,'admin@daihyun99','post',40,NULL,'2018-11-06 01:06:04',NULL,NULL,'view'),(144,'admin@daihyun99','post',41,NULL,'2018-11-11 18:00:43',NULL,NULL,'view'),(145,'admin@daihyun99','post',42,NULL,'2018-11-16 01:03:44',NULL,NULL,'view'),(146,'admin@daihyun99','post',43,NULL,'2018-11-17 11:53:05',NULL,NULL,'view'),(147,'admin@daihyun99','post',44,NULL,'2018-11-19 21:36:10',NULL,NULL,'view'),(148,'admin@daihyun99','post',36,NULL,'2018-11-26 22:53:33',NULL,NULL,'view'),(149,'admin@daihyun99','post',2,NULL,'2018-11-26 23:31:39',NULL,NULL,'view'),(150,'admin@root','post',38,NULL,'2018-12-02 23:05:37',NULL,NULL,'view'),(151,'admin@root','post',45,NULL,'2018-12-02 23:06:06',NULL,NULL,'view'),(152,'admin@root','reply',155,45,'2018-12-02 23:06:11','2018-12-02 23:06:13',NULL,'n'),(153,'test01','post',45,NULL,'2018-12-02 23:06:21',NULL,NULL,'view'),(154,'test01','reply',156,45,'2018-12-02 23:39:11','2018-12-02 23:39:11',NULL,'n'),(156,'test01','reply',155,45,'2018-12-02 23:39:13','2018-12-02 23:39:13',NULL,'n'),(157,'admin@root','reply',157,45,'2018-12-07 18:25:49','2018-12-07 18:25:50',NULL,'n'),(158,'admin@root','post',43,NULL,'2018-12-07 18:25:53',NULL,NULL,'view'),(159,'admin@root','post',46,NULL,'2018-12-07 18:35:13',NULL,NULL,'view'),(160,'admin@root','post',47,NULL,'2018-12-07 19:07:39',NULL,NULL,'view'),(161,'admin@root','post',48,NULL,'2018-12-08 23:02:47',NULL,NULL,'view'),(162,'admin@root','post',49,NULL,'2018-12-08 23:47:37',NULL,NULL,'view'),(163,'admin@root','post',50,NULL,'2018-12-09 00:44:13',NULL,NULL,'view'),(164,'admin@root','post',51,NULL,'2018-12-09 00:51:22',NULL,NULL,'view'),(165,'admin@root','post',52,NULL,'2018-12-09 00:55:21',NULL,NULL,'view'),(166,'admin@root','post',53,NULL,'2018-12-09 01:58:14',NULL,NULL,'view'),(167,'admin@root','post',54,NULL,'2018-12-09 01:59:37',NULL,NULL,'view'),(168,'admin@root','post',55,NULL,'2018-12-09 02:21:26',NULL,NULL,'view'),(169,'admin@root','post',56,NULL,'2018-12-09 23:05:26',NULL,NULL,'view'),(170,'admin@root','post',40,NULL,'2018-12-12 23:54:35',NULL,NULL,'view'),(171,'admin@root','post',57,NULL,'2018-12-13 00:14:39',NULL,NULL,'view'),(172,'admin@root','post',58,NULL,'2018-12-13 00:39:32',NULL,NULL,'view'),(173,'admin@root','post',59,NULL,'2018-12-28 23:21:02',NULL,NULL,'view');
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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_space_post`
--

LOCK TABLES `map_space_post` WRITE;
/*!40000 ALTER TABLE `map_space_post` DISABLE KEYS */;
INSERT INTO `map_space_post` VALUES (1,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Hello, World!','test&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;testset&lt;/div&gt;&lt;div&gt;set&lt;/div&gt;&lt;div&gt;set&lt;/div&gt;&lt;div&gt;se&lt;/div&gt;&lt;div&gt;tse&lt;/div&gt;&lt;div&gt;ts&lt;/div&gt;&lt;div&gt;ets&lt;/div&gt;&lt;div&gt;etse&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;',2,0,0,37,'best','first',''),(2,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Hello, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',2,0,0,8,'best','first',''),(3,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Hello, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',1,0,0,2,'best','first',''),(4,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Hello, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',0,0,0,0,'best','first',''),(5,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Hello, 한글!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',1,0,0,0,'best','first',''),(6,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Test, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',1,0,0,0,'best','first',''),(7,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Test, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',0,0,0,0,'best','first',''),(8,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Test, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',0,0,0,0,'best','first',''),(9,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Test, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',5,41,0,0,'best','first',''),(10,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Test, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',1,0,0,0,'best','first',''),(11,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Test, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',1,1,0,0,'best','first',''),(12,'test01','테스트','2018-08-26 16:21:10','0000-00-00 00:00:00','0000-00-00 00:00:00','Hello, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',3,1,0,0,'best','first',''),(13,'admin@daihyun99','daihyun99','2018-08-26 18:49:13',NULL,NULL,'test','\n#test1&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;#test1&lt;br&gt;&lt;/div&gt;&lt;div&gt;#test1&lt;br&gt;&lt;/div&gt;&lt;div&gt;#test1#test1#test6&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;#마지막으로 #한글 #테스트&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;#RGBplace&lt;/div&gt;',3,1,0,3,'free','','test1|test1|test1|test1|test1|test6|마지막으로|한글|테스트|RGBplace'),(16,'admin@daihyun99','daihyun99','2018-08-30 01:11:15',NULL,NULL,'[test] 리다이렉트 실험 (최초)','\n최초였음',1,0,0,0,'free','test',''),(17,'admin@daihyun99','daihyun99','2018-09-01 17:04:20',NULL,NULL,'리다이렉트 실험1','실험한다',0,0,0,0,'free','',''),(18,'admin@daihyun99','daihyun99','2018-09-01 17:09:24',NULL,NULL,'리다이렉트 실험2','실험 또 한다',0,0,0,0,'free','',''),(19,'admin@daihyun99','daihyun99','2018-09-01 17:09:45',NULL,NULL,'리다이렉트 실험2','실험 또 한다',0,0,0,0,'free','',''),(20,'admin@daihyun99','daihyun99','2018-09-01 17:12:12',NULL,NULL,'[test] 리다이렉트 실험3','ㅇㅇ',1,0,0,0,'free','test',''),(21,'admin@daihyun99','daihyun99','2018-09-01 20:37:12',NULL,NULL,'[test] 리다이렉트 실험4','\n\n\n\n&lt;div&gt;--- 수정 테스트2 ---&lt;br&gt;&lt;/div&gt;&lt;img src=&quot;&quot; width=&quot;400px&quot; height=&quot;400px&quot;&gt;&lt;div&gt;&lt;script&gt;alert(\\\'test\\\');&lt;/script&gt;&lt;/div&gt;',3,0,0,0,'free','test',''),(29,'admin@daihyun99','daihyun99','2018-09-06 20:48:04',NULL,NULL,'댓글삭제하는데 왜 글이 삭제되지','\nㅅㅂㅋㅋㅋg',6,1,0,6,'dev','',''),(30,'admin@daihyun99','daihyun99','2018-09-14 22:09:56',NULL,NULL,'[upload] 업로드 테스트','\n\n\n\n\n\n&lt;img src=&quot;/upload/436c0cd8bd370338dd8c6197cdc6d858.png&quot;&gt;&lt;img src=&quot;/upload/901720d2967edb50aadbd6bce571fcdb.png&quot;&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;ㅇㅇ&lt;br&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;/div&gt;&lt;video src=&quot;/upload/ba7c5e2ffcf1f089d2b20c7792b3817c.mp3&quot; controls=&quot;controls&quot;&gt;&lt;/video&gt;&lt;br&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;df&lt;/div&gt;&lt;div&gt;df&lt;/div&gt;&lt;div&gt;df&lt;/div&gt;&lt;div&gt;df&lt;/div&gt;&lt;div&gt;df&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;img src=&quot;/upload/f98ba964ec9de86a84343917a377dde4.jpg&quot; alt=&quot;alps_mountains_snow_vertex_110211_4752x3168.jpg&quot;&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;img src=&quot;/upload/c359ce1c8cae198c83d099420847de80.png&quot; alt=&quot;25176044.png&quot;&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;/div&gt;&lt;br&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;img src=&quot;/upload/f1f73b8fbd0bf90cf135c2dca4aaa0e1.png&quot; alt=&quot;burn.png&quot;&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;br&gt;&lt;/div&gt;&lt;img src=&quot;/upload/cfcafa2c379856220ab6c81d659af0d9.png&quot; alt=&quot;Big_dipper.png&quot; style=&quot;max-width: 100%;&quot;&gt;&lt;br&gt;&lt;br&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;img src=&quot;/upload/477a8a7d3de483d2891fac3c91d882d0.png&quot; alt=&quot;burn.png&quot; style=&quot;max-width: 100%;&quot;&gt;&lt;br&gt;&lt;br&gt;',25,21,-9,8,'best','upload',''),(36,'admin@daihyun99','daihyun99','2018-09-19 06:16:43',NULL,NULL,'[upload] test2','\n\n\n&lt;div&gt;&lt;img src=&quot;http://127.0.0.1/upload/99f1baf64a8d16e60304e9b88eb4028a.png&quot; alt=&quot;burn.png&quot; style=&quot;max-width: 100%;&quot;&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;img src=&quot;http://127.0.0.1/upload/99f1baf64a8d16e60304e9b88eb4028a.png&quot; alt=&quot;burn.png&quot; style=&quot;max-width: 100%;&quot;&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;img src=&quot;/upload/cd59dbb412d75375993cc21020a3694c.jpg&quot; alt=&quot;chess_pieces_2-wallpaper-1920x1080.jpg&quot; style=&quot;max-width: 100%;&quot;&gt;&lt;br&gt;&lt;br&gt;&lt;img src=&quot;/upload/0914c199b5c330e298190af792b91b0b.png&quot; alt=&quot;burn.png&quot; style=&quot;max-width: 100%;&quot;&gt;&lt;br&gt;&lt;br&gt;&lt;img src=&quot;/upload/15444d5c55c66bd73721a260302d5024.jpg&quot; alt=&quot;chess_pieces_2-wallpaper-1920x1080.jpg&quot; style=&quot;max-width: 100%;&quot;&gt;&lt;br&gt;&lt;br&gt;&lt;img src=&quot;/upload/61a1d1cb52edf07d87c465ac94b0cd4a.png&quot; alt=&quot;burn.png&quot; style=&quot;max-width: 100%;&quot;&gt;&lt;br&gt;&lt;br&gt;&lt;img src=&quot;/upload/a3bdbb2d0b95d0027a4fa54b01215abe.png&quot; alt=&quot;burn.png&quot; style=&quot;max-width: 100%;&quot;&gt;&lt;br&gt;&lt;br&gt;',3,0,1,1,'dev','upload',''),(37,'test01','테스트','2018-09-19 22:14:47',NULL,NULL,'[upload] 일반 계정 업로드 테스트','&lt;img src=&quot;/upload/42df1f969e57f277b068dc0c39558ee5.png&quot; alt=&quot;burn.png&quot; style=&quot;max-width: 100%;&quot;&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;버닝버닝 핫 오션월D~&lt;br&gt;&lt;br&gt;&lt;/div&gt;',4,1,0,0,'dev','upload',''),(38,'admin@daihyun99','daihyun99','2018-10-29 00:58:21',NULL,NULL,'[사진] 메인 사진 변경하기','\n&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;img src=&quot;http://127.0.0.1/upload/697924dc94de86f7996cfc42cb275de0.jpeg&quot; alt=&quot;일산 호수공원.jpeg&quot; style=&quot;max-width: 100%;&quot;&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;\nㅇㅇㅇ&lt;br&gt;&lt;br&gt;&lt;div&gt;\n&lt;iframe width=&quot;560&quot; height=&quot;315&quot; src=&quot;https://www.youtube.com/embed/D3ZFtSoWtRc&quot; frameborder=&quot;0&quot; allow=&quot;autoplay; encrypted-media&quot; allowfullscreen=&quot;&quot;&gt;&lt;/iframe&gt;&lt;/div&gt;&lt;br&gt;\n\n&lt;script&gt;alert(\\\'test\\\');&lt;/script&gt;test',2,20,0,0,'best','사진',''),(39,'admin@daihyun99','daihyun99','2018-11-03 11:47:31',NULL,NULL,'[개발] 남은 기능','&lt;div style=&quot;text-align: start; color: rgb(67, 67, 67); font-family: 돋움, Dotum, Helvetica, sans-serif, &quot; apple=&quot;&quot; sd=&quot;&quot; gothic=&quot;&quot; neo&quot;;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; background-color:=&quot;&quot; rgb(255,=&quot;&quot; 254,=&quot;&quot; 242);&quot;=&quot;&quot;&gt;수정해야될 기능&lt;/div&gt;&lt;div style=&quot;text-align: start; color: rgb(67, 67, 67); font-family: 돋움, Dotum, Helvetica, sans-serif, &quot; apple=&quot;&quot; sd=&quot;&quot; gothic=&quot;&quot; neo&quot;;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; background-color:=&quot;&quot; rgb(255,=&quot;&quot; 254,=&quot;&quot; 242);&quot;=&quot;&quot;&gt;&amp;nbsp;&lt;/div&gt;&lt;div style=&quot;text-align: start; color: rgb(67, 67, 67); font-family: 돋움, Dotum, Helvetica, sans-serif, &quot; apple=&quot;&quot; sd=&quot;&quot; gothic=&quot;&quot; neo&quot;;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; background-color:=&quot;&quot; rgb(255,=&quot;&quot; 254,=&quot;&quot; 242);&quot;=&quot;&quot;&gt;&lt;strike&gt;map_code 에 신청한 longitude, latitude 컬럼(double 타입) 추가하기 (이게 있어야 world 에 구글 지도 추가했을때 보일듯)&lt;/strike&gt;&lt;/div&gt;&lt;div style=&quot;text-align: start; color: rgb(67, 67, 67); font-family: 돋움, Dotum, Helvetica, sans-serif, &quot; apple=&quot;&quot; sd=&quot;&quot; gothic=&quot;&quot; neo&quot;;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; background-color:=&quot;&quot; rgb(255,=&quot;&quot; 254,=&quot;&quot; 242);&quot;=&quot;&quot;&gt;&amp;nbsp;&lt;/div&gt;&lt;div style=&quot;text-align: start; color: rgb(67, 67, 67); font-family: 돋움, Dotum, Helvetica, sans-serif, &quot; apple=&quot;&quot; sd=&quot;&quot; gothic=&quot;&quot; neo&quot;;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; background-color:=&quot;&quot; rgb(255,=&quot;&quot; 254,=&quot;&quot; 242);&quot;=&quot;&quot;&gt;&lt;strike&gt;map_total 테이블 삭제? 추천 1000건 이상 베스트 게시글에 대해?&lt;/strike&gt;&lt;/div&gt;&lt;div style=&quot;text-align: start; color: rgb(67, 67, 67); font-family: 돋움, Dotum, Helvetica, sans-serif, &quot; apple=&quot;&quot; sd=&quot;&quot; gothic=&quot;&quot; neo&quot;;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; background-color:=&quot;&quot; rgb(255,=&quot;&quot; 254,=&quot;&quot; 242);&quot;=&quot;&quot;&gt;&amp;nbsp;&lt;/div&gt;&lt;div style=&quot;text-align: start; color: rgb(67, 67, 67); font-family: 돋움, Dotum, Helvetica, sans-serif, &quot; apple=&quot;&quot; sd=&quot;&quot; gothic=&quot;&quot; neo&quot;;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; background-color:=&quot;&quot; rgb(255,=&quot;&quot; 254,=&quot;&quot; 242);&quot;=&quot;&quot;&gt;&lt;strike&gt;free, info 타입 글만 추천 넘겼을때 bset 이동하게 만들기&lt;/strike&gt;&lt;/div&gt;&lt;div style=&quot;text-align: start; color: rgb(67, 67, 67); font-family: 돋움, Dotum, Helvetica, sans-serif, &quot; apple=&quot;&quot; sd=&quot;&quot; gothic=&quot;&quot; neo&quot;;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; background-color:=&quot;&quot; rgb(255,=&quot;&quot; 254,=&quot;&quot; 242);&quot;=&quot;&quot;&gt;&amp;nbsp;&lt;/div&gt;&lt;div style=&quot;text-align: start; color: rgb(67, 67, 67); font-family: 돋움, Dotum, Helvetica, sans-serif, &quot; apple=&quot;&quot; sd=&quot;&quot; gothic=&quot;&quot; neo&quot;;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; background-color:=&quot;&quot; rgb(255,=&quot;&quot; 254,=&quot;&quot; 242);&quot;=&quot;&quot;&gt;&lt;strike&gt;문의 -&amp;gt; 메일로 받기 -&amp;gt; footer 영역 수정하고 메일 넣기&lt;/strike&gt;&lt;/div&gt;&lt;div style=&quot;text-align: start; color: rgb(67, 67, 67); font-family: 돋움, Dotum, Helvetica, sans-serif, &quot; apple=&quot;&quot; sd=&quot;&quot; gothic=&quot;&quot; neo&quot;;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; background-color:=&quot;&quot; rgb(255,=&quot;&quot; 254,=&quot;&quot; 242);&quot;=&quot;&quot;&gt;&amp;nbsp;&lt;/div&gt;&lt;div style=&quot;text-align: start; color: rgb(67, 67, 67); font-family: 돋움, Dotum, Helvetica, sans-serif, &quot; apple=&quot;&quot; sd=&quot;&quot; gothic=&quot;&quot; neo&quot;;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; background-color:=&quot;&quot; rgb(255,=&quot;&quot; 254,=&quot;&quot; 242);&quot;=&quot;&quot;&gt;- 신고 기능&amp;nbsp;&lt;/div&gt;&lt;div style=&quot;text-align: start; color: rgb(67, 67, 67); font-family: 돋움, Dotum, Helvetica, sans-serif, &quot; apple=&quot;&quot; sd=&quot;&quot; gothic=&quot;&quot; neo&quot;;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; background-color:=&quot;&quot; rgb(255,=&quot;&quot; 254,=&quot;&quot; 242);&quot;=&quot;&quot;&gt;&amp;nbsp;&lt;/div&gt;&lt;div style=&quot;text-align: start; color: rgb(67, 67, 67); font-family: 돋움, Dotum, Helvetica, sans-serif, &quot; apple=&quot;&quot; sd=&quot;&quot; gothic=&quot;&quot; neo&quot;;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; background-color:=&quot;&quot; rgb(255,=&quot;&quot; 254,=&quot;&quot; 242);&quot;=&quot;&quot;&gt;report - 기존 history 테이블 사용&lt;/div&gt;&lt;div style=&quot;text-align: start; color: rgb(67, 67, 67); font-family: 돋움, Dotum, Helvetica, sans-serif, &quot; apple=&quot;&quot; sd=&quot;&quot; gothic=&quot;&quot; neo&quot;;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; background-color:=&quot;&quot; rgb(255,=&quot;&quot; 254,=&quot;&quot; 242);&quot;=&quot;&quot;&gt;&amp;nbsp;&lt;/div&gt;&lt;div style=&quot;text-align: start; color: rgb(67, 67, 67); font-family: 돋움, Dotum, Helvetica, sans-serif, &quot; apple=&quot;&quot; sd=&quot;&quot; gothic=&quot;&quot; neo&quot;;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; background-color:=&quot;&quot; rgb(255,=&quot;&quot; 254,=&quot;&quot; 242);&quot;=&quot;&quot;&gt;post도 신고기능 추가&lt;/div&gt;&lt;div style=&quot;text-align: start; color: rgb(67, 67, 67); font-family: 돋움, Dotum, Helvetica, sans-serif, &quot; apple=&quot;&quot; sd=&quot;&quot; gothic=&quot;&quot; neo&quot;;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; background-color:=&quot;&quot; rgb(255,=&quot;&quot; 254,=&quot;&quot; 242);&quot;=&quot;&quot;&gt;&amp;nbsp;&lt;/div&gt;&lt;div style=&quot;text-align: start; color: rgb(67, 67, 67); font-family: 돋움, Dotum, Helvetica, sans-serif, &quot; apple=&quot;&quot; sd=&quot;&quot; gothic=&quot;&quot; neo&quot;;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; background-color:=&quot;&quot; rgb(255,=&quot;&quot; 254,=&quot;&quot; 242);&quot;=&quot;&quot;&gt;&lt;div&gt;- 회원정보 확인 및 수정 페이지&lt;/div&gt;&lt;div&gt;&amp;nbsp;&lt;/div&gt;&lt;div&gt;/profile&lt;/div&gt;&lt;div&gt;&amp;nbsp;&lt;/div&gt;&lt;div&gt;/profile/edit&lt;/div&gt;&lt;div&gt;​&lt;/div&gt;&lt;div&gt;- &lt;strike&gt;IP 차단 기능&lt;/strike&gt; =&amp;gt; 사용자 차단 기능&lt;/div&gt;&lt;div&gt;&amp;nbsp;&lt;/div&gt;\n로직 자체는 있으니 이 기능을 만들자\n&lt;div&gt;&lt;strike&gt;&lt;i&gt;방문자 테이블 수정 후 접속한 IP 전부 남게끔.&lt;/i&gt;&lt;/strike&gt;&amp;nbsp;&lt;strike&gt;서버에 기능을 추가하자. ( 사용자 차단 기능 만들기? 패스워드 실패에 대해 )&lt;/strike&gt;&lt;/div&gt;&lt;div&gt;&amp;nbsp;&lt;/div&gt;&lt;div&gt;&lt;strike&gt;- 패스워드 초기화 테스트해보기&lt;/strike&gt;&lt;/div&gt;&lt;div&gt;&amp;nbsp;&lt;/div&gt;&lt;div&gt;\n&lt;strike&gt;이후 Admin 쪽에 기능 추가 (IP BAN)&lt;/strike&gt;\n&lt;/div&gt;&lt;div&gt;&lt;div&gt;&lt;br&gt;다크모드 추가, 컬럼 수정&lt;/div&gt;&lt;div&gt;template 상단에 darkmode style sheet 만들기 -&amp;gt; 동적으로 추가&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;div style=&quot;text-align: start; color: rgb(67, 67, 67); font-family: 돋움, Dotum, Helvetica, sans-serif, &quot; apple=&quot;&quot; sd=&quot;&quot; gothic=&quot;&quot; neo&quot;;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; background-color:=&quot;&quot; rgb(255,=&quot;&quot; 254,=&quot;&quot; 242);&quot;=&quot;&quot;&gt;&amp;nbsp;&lt;/div&gt;&lt;div style=&quot;text-align: start; color: rgb(67, 67, 67); font-family: 돋움, Dotum, Helvetica, sans-serif, &quot; apple=&quot;&quot; sd=&quot;&quot; gothic=&quot;&quot; neo&quot;;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; background-color:=&quot;&quot; rgb(255,=&quot;&quot; 254,=&quot;&quot; 242);&quot;=&quot;&quot;&gt;​---------------------------------------&lt;/div&gt;&lt;div style=&quot;text-align: start; color: rgb(67, 67, 67); font-family: 돋움, Dotum, Helvetica, sans-serif, &quot; apple=&quot;&quot; sd=&quot;&quot; gothic=&quot;&quot; neo&quot;;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; background-color:=&quot;&quot; rgb(255,=&quot;&quot; 254,=&quot;&quot; 242);&quot;=&quot;&quot;&gt;- 맵 전체 목록 (나중)&lt;/div&gt;&lt;div style=&quot;text-align: start; color: rgb(67, 67, 67); font-family: 돋움, Dotum, Helvetica, sans-serif, &quot; apple=&quot;&quot; sd=&quot;&quot; gothic=&quot;&quot; neo&quot;;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; background-color:=&quot;&quot; rgb(255,=&quot;&quot; 254,=&quot;&quot; 242);&quot;=&quot;&quot;&gt;&amp;nbsp;&lt;/div&gt;&lt;div style=&quot;text-align: start; color: rgb(67, 67, 67); font-family: 돋움, Dotum, Helvetica, sans-serif, &quot; apple=&quot;&quot; sd=&quot;&quot; gothic=&quot;&quot; neo&quot;;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; background-color:=&quot;&quot; rgb(255,=&quot;&quot; 254,=&quot;&quot; 242);&quot;=&quot;&quot;&gt;돋보기 버튼 눌렀을때 이동 &amp;lt;- 나중에&lt;/div&gt;&lt;div style=&quot;text-align: start; color: rgb(67, 67, 67); font-family: 돋움, Dotum, Helvetica, sans-serif, &quot; apple=&quot;&quot; sd=&quot;&quot; gothic=&quot;&quot; neo&quot;;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; background-color:=&quot;&quot; rgb(255,=&quot;&quot; 254,=&quot;&quot; 242);&quot;=&quot;&quot;&gt;&amp;nbsp;&lt;/div&gt;&lt;div style=&quot;text-align: start; color: rgb(67, 67, 67); font-family: 돋움, Dotum, Helvetica, sans-serif, &quot; apple=&quot;&quot; sd=&quot;&quot; gothic=&quot;&quot; neo&quot;;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; background-color:=&quot;&quot; rgb(255,=&quot;&quot; 254,=&quot;&quot; 242);&quot;=&quot;&quot;&gt;world 컨트롤러 생성&lt;/div&gt;&lt;div style=&quot;text-align: start; color: rgb(67, 67, 67); font-family: 돋움, Dotum, Helvetica, sans-serif, &quot; apple=&quot;&quot; sd=&quot;&quot; gothic=&quot;&quot; neo&quot;;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; background-color:=&quot;&quot; rgb(255,=&quot;&quot; 254,=&quot;&quot; 242);&quot;=&quot;&quot;&gt;&amp;nbsp;&lt;/div&gt;&lt;div style=&quot;text-align: start; color: rgb(67, 67, 67); font-family: 돋움, Dotum, Helvetica, sans-serif, &quot; apple=&quot;&quot; sd=&quot;&quot; gothic=&quot;&quot; neo&quot;;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; background-color:=&quot;&quot; rgb(255,=&quot;&quot; 254,=&quot;&quot; 242);&quot;=&quot;&quot;&gt;world/map 추가 (구글 지도 API 연계해서 해당 위치에 Flag 세우기)&lt;/div&gt;&lt;div style=&quot;text-align: start; color: rgb(67, 67, 67); font-family: 돋움, Dotum, Helvetica, sans-serif, &quot; apple=&quot;&quot; sd=&quot;&quot; gothic=&quot;&quot; neo&quot;;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; background-color:=&quot;&quot; rgb(255,=&quot;&quot; 254,=&quot;&quot; 242);&quot;=&quot;&quot;&gt;=&amp;gt; Flag 클릭 시, 해당 맵으로 이동함&lt;/div&gt;&lt;div style=&quot;text-align: start; color: rgb(67, 67, 67); font-family: 돋움, Dotum, Helvetica, sans-serif, &quot; apple=&quot;&quot; sd=&quot;&quot; gothic=&quot;&quot; neo&quot;;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; background-color:=&quot;&quot; rgb(255,=&quot;&quot; 254,=&quot;&quot; 242);&quot;=&quot;&quot;&gt;&amp;nbsp;&lt;/div&gt;&lt;div style=&quot;text-align: start; color: rgb(67, 67, 67); font-family: 돋움, Dotum, Helvetica, sans-serif, &quot; apple=&quot;&quot; sd=&quot;&quot; gothic=&quot;&quot; neo&quot;;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; background-color:=&quot;&quot; rgb(255,=&quot;&quot; 254,=&quot;&quot; 242);&quot;=&quot;&quot;&gt;world/list 추가&lt;/div&gt;&lt;div style=&quot;text-align: start; color: rgb(67, 67, 67); font-family: 돋움, Dotum, Helvetica, sans-serif, &quot; apple=&quot;&quot; sd=&quot;&quot; gothic=&quot;&quot; neo&quot;;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; background-color:=&quot;&quot; rgb(255,=&quot;&quot; 254,=&quot;&quot; 242);&quot;=&quot;&quot;&gt;​---------------------------------------&lt;/div&gt;&lt;div style=&quot;text-align: start; color: rgb(67, 67, 67); font-family: 돋움, Dotum, Helvetica, sans-serif, &quot; apple=&quot;&quot; sd=&quot;&quot; gothic=&quot;&quot; neo&quot;;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; background-color:=&quot;&quot; rgb(255,=&quot;&quot; 254,=&quot;&quot; 242);&quot;=&quot;&quot;&gt;​&lt;/div&gt;&lt;div style=&quot;text-align: start; color: rgb(67, 67, 67); font-family: 돋움, Dotum, Helvetica, sans-serif, &quot; apple=&quot;&quot; sd=&quot;&quot; gothic=&quot;&quot; neo&quot;;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; background-color:=&quot;&quot; rgb(255,=&quot;&quot; 254,=&quot;&quot; 242);&quot;=&quot;&quot;&gt;- JSON 방식으로 세션 만들어 댓글 추천했는지 표시하기&lt;/div&gt;&lt;div style=&quot;text-align: start; color: rgb(67, 67, 67); font-family: 돋움, Dotum, Helvetica, sans-serif, &quot; apple=&quot;&quot; sd=&quot;&quot; gothic=&quot;&quot; neo&quot;;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; background-color:=&quot;&quot; rgb(255,=&quot;&quot; 254,=&quot;&quot; 242);&quot;=&quot;&quot;&gt;굳이 안만들어도 될듯하지만서도.. 우선 세션만 추가하게끔 해볼까 생각 중.&lt;/div&gt;',1,19,0,4,'dev','개발',''),(41,'admin@daihyun99','daihyun99','2018-11-11 18:00:42',NULL,NULL,'[test] upload 테스트','&lt;img src=&quot;/upload/5d0c71ffa045fe4cdccfe5503c6caf0d.png&quot; alt=&quot;burn.png&quot; style=&quot;max-width: 100%;&quot;&gt;&lt;br&gt;&lt;br&gt;&lt;div&gt;수정 테스트&lt;/div&gt;',1,0,0,0,'free','test',''),(42,'admin@daihyun99','daihyun99','2018-11-16 01:03:43',NULL,NULL,'따옴표 테스트&quot; \\\'\\\' &quot;&quot; \\\'\\\' \\\' &quot;\\\' \\\'&quot; \\\'\\\'','&quot;\\\'&quot;\\\'&quot;\\\'&quot;\\\'&quot;\\\'\\\'&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;\\\'\\\'',1,0,0,0,'dev','',''),(43,'admin@daihyun99','daihyun99','2018-11-17 11:53:04',NULL,NULL,'[개발] 댓글 이동 테스트','댓글 많이 다삼',2,0,0,38,'dev','개발',''),(44,'admin@daihyun99','daihyun99','2018-11-19 21:36:07',NULL,NULL,'[개발] 링크 복사 기능','ㅇㅇ',1,0,0,0,'dev','개발',''),(45,'admin@root','root','2018-12-02 23:06:06',NULL,NULL,'[개발] 자추 자신 테스트','ㅇㅇ',2,0,0,3,'dev','개발',''),(46,'admin@root','root','2018-12-07 18:35:12',NULL,NULL,'[개발] 업로드 리스트를 위한 파일 업로드','\\nㅇㅇ&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;img src=\\&quot;http://127.0.0.1/upload/e8c6e2277988d7f4b470ad9dc780138b.png\\&quot; alt=\\&quot;6lueparr0t.png\\&quot;&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;img src=\\&quot;/upload/4c73340e9d2c2a5c5dc2f3a08a1a1873.png\\&quot; alt=\\&quot;25176044.png\\&quot; style=\\&quot;max-width: 100%;\\&quot;&gt;&lt;br&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;img src=\\&quot;/upload/a277f817730d8bad262326cdd504411c.jpeg\\&quot; alt=\\&quot;난강하니까.jpeg\\&quot; style=\\&quot;max-width: 100%;\\&quot;&gt;&lt;div&gt;&lt;br&gt;&lt;br&gt;&lt;/div&gt;&lt;img src=\\&quot;/upload/6ba76689c226054e75df9767ded5066f.png\\&quot; alt=\\&quot;Big_dipper.png\\&quot; style=\\&quot;max-width: 100%;\\&quot;&gt;&lt;br&gt;&lt;br&gt;',1,0,0,0,'dev','개발',''),(56,'admin@root','root','2018-12-09 23:05:26',NULL,NULL,'[개발] 프로필 - 자기가 쓴 글 리스트 보기2','\\nㅇㅇ',1,0,0,1,'dev','개발',''),(58,'admin@root','root','2018-12-13 00:39:32',NULL,NULL,'\\\\n이 자꾸 생겨나는 문제','&lt;br&gt;&lt;img src=\\&quot;/upload/dae3277a38ebee01acae1f112cc11e5a.png\\&quot; alt=\\&quot;burn.png\\&quot; style=\\&quot;max-width: 100%;\\&quot;&gt;&lt;br&gt;&lt;br&gt;&lt;div&gt;띠바&lt;br&gt;&lt;/div&gt;',1,0,0,2,'public','','');
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
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_space_reply`
--

LOCK TABLES `map_space_reply` WRITE;
/*!40000 ALTER TABLE `map_space_reply` DISABLE KEYS */;
INSERT INTO `map_space_reply` VALUES (1,'admin@daihyun99','daihyun99','2018-07-07 15:46:48',NULL,NULL,'테스트 댓글 답니다',0,0,1,'',NULL,0,1,0,0,0,0,0,0,0,0,0),(2,'admin@daihyun99','daihyun99','2018-07-07 15:46:56',NULL,NULL,'우앙!',0,0,1,'daihyun99',1,1,1,1,0,0,0,0,0,0,0,0),(3,'admin@daihyun99','daihyun99','2018-07-07 15:47:11',NULL,NULL,'2등',0,0,1,'',NULL,0,2,0,0,0,0,0,0,0,0,0),(4,'admin@daihyun99','daihyun99','2018-07-07 15:47:18',NULL,NULL,'ㄴㄴ 님 3등',0,0,1,'daihyun99',3,3,2,1,0,0,0,0,0,0,0,0),(5,'admin@daihyun99','daihyun99','2018-07-07 15:47:36',NULL,NULL,'귀척 ㄴㄴ',0,0,1,'daihyun99',1,2,1,1,1,0,0,0,0,0,0,0),(6,'admin@daihyun99','daihyun99','2018-07-07 15:47:56',NULL,NULL,'십.노.잼',0,0,1,'daihyun99',1,1,1,2,0,0,0,0,0,0,0,0),(7,'admin@daihyun99','daihyun99','2018-07-07 15:48:14',NULL,NULL,'이분 이제 5등이랍니다 글 내려주세요',0,0,1,'daihyun99',3,4,2,1,1,0,0,0,0,0,0,0),(8,'admin@daihyun99','daihyun99','2018-07-07 15:50:43',NULL,NULL,'ㅇㅈ',0,0,1,'daihyun99',1,5,1,1,1,1,0,0,0,0,0,0),(9,'admin@daihyun99','daihyun99','2018-07-07 17:28:22',NULL,NULL,'wow',0,0,1,'',NULL,0,3,0,0,0,0,0,0,0,0,0),(10,'admin@daihyun99','daihyun99','2018-07-13 00:12:00',NULL,NULL,'test1',0,0,2,'',NULL,0,4,0,0,0,0,0,0,0,0,0),(11,'admin@daihyun99','daihyun99','2018-07-24 23:41:37',NULL,NULL,'7월 24일 npm 업데이트 하고 난 후의 테스트',0,0,1,'daihyun99',9,9,3,1,0,0,0,0,0,0,0,0),(12,'test01','테스트','2018-08-12 00:36:55',NULL,NULL,'map -&gt; api 로 request 처리 옮김.',0,0,1,'',NULL,0,5,0,0,0,0,0,0,0,0,0),(13,'admin@daihyun99','daihyun99','2018-08-18 09:28:56',NULL,NULL,'reply -&gt; reply-addon 으로 클래스 변경',0,0,1,'',NULL,0,6,0,0,0,0,0,0,0,0,0),(14,'admin@daihyun99','daihyun99','2018-08-18 09:29:11',NULL,NULL,'대댓글도 잘 되는지 확인',0,0,1,'daihyun99',13,13,6,1,0,0,0,0,0,0,0,0),(15,'admin@daihyun99','daihyun99','2018-08-18 09:29:21',NULL,NULL,'나도 확인',0,0,1,'daihyun99',13,14,6,1,1,0,0,0,0,0,0,0),(16,'admin@daihyun99','daihyun99','2018-08-18 09:29:58',NULL,NULL,'2등 (새치기당함)',0,0,1,'daihyun99',13,13,6,2,0,0,0,0,0,0,0,0),(17,'admin@daihyun99','daihyun99','2018-08-20 22:56:15',NULL,NULL,'\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nTEST',0,0,2,'daihyun99',10,10,4,1,0,0,0,0,0,0,0,0),(18,'admin@daihyun99','daihyun99','2018-08-20 22:56:39',NULL,NULL,'띄\n어\n쓰\n끼',0,0,2,'daihyun99',10,10,4,2,0,0,0,0,0,0,0,0),(19,'admin@daihyun99','daihyun99','2018-08-22 23:53:00',NULL,NULL,'댓글 확인?\n띄어쓰기 확인\n확\n\n인',0,0,3,'',NULL,0,7,0,0,0,0,0,0,0,0,0),(20,'admin@daihyun99','daihyun99','2018-08-22 23:53:12',NULL,NULL,'대댓글 확.인.',0,0,3,'daihyun99',19,19,7,1,0,0,0,0,0,0,0,0),(21,'admin@daihyun99','daihyun99','2018-08-29 01:17:12',NULL,NULL,'테스트 첫 댓글',0,0,13,'',NULL,0,8,0,0,0,0,0,0,0,0,0),(22,'admin@daihyun99','daihyun99','2018-08-29 01:28:12',NULL,NULL,'테스트 첫 대댓글',0,0,13,'daihyun99',21,21,8,1,0,0,0,0,0,0,0,0),(23,'admin@daihyun99','daihyun99','2018-09-05 22:42:54',NULL,NULL,'댓글 수정1',0,0,27,'',NULL,0,9,0,0,0,0,0,0,0,0,0),(28,'admin@daihyun99','daihyun99','2018-09-06 20:50:13',NULL,NULL,'test',0,0,29,'',NULL,0,10,0,0,0,0,0,0,0,0,0),(29,'admin@daihyun99','daihyun99','2018-09-06 21:02:10',NULL,NULL,'test23',0,0,29,'',NULL,0,11,0,0,0,0,0,0,0,0,0),(30,'admin@daihyun99','daihyun99','2018-09-06 21:02:16',NULL,NULL,'test3 댓글 수정함2',160,0,29,'daihyun99',29,29,11,1,0,0,0,0,0,0,0,0),(32,'admin@daihyun99','daihyun99','2018-09-06 22:15:30',NULL,NULL,'test4 대댓글 닮 // 대댓글 다는척 하면서 수정함',0,0,29,'daihyun99',29,30,11,1,1,0,0,0,0,0,0,0),(34,'admin@daihyun99','daihyun99','2018-09-07 23:14:08',NULL,NULL,'18',0,0,1,'',NULL,0,12,0,0,0,0,0,0,0,0,0),(35,'admin@daihyun99','daihyun99','2018-09-07 23:19:24',NULL,NULL,'19',0,0,1,'',NULL,0,13,0,0,0,0,0,0,0,0,0),(36,'admin@daihyun99','daihyun99','2018-09-07 23:19:31',NULL,NULL,'18-1',0,0,1,'daihyun99',34,34,12,1,0,0,0,0,0,0,0,0),(37,'admin@daihyun99','daihyun99','2018-09-07 23:19:47',NULL,NULL,'18-1-1',0,0,1,'daihyun99',34,36,12,1,1,0,0,0,0,0,0,0),(38,'admin@daihyun99','daihyun99','2018-09-07 23:19:56',NULL,NULL,'18-2',0,0,1,'daihyun99',34,34,12,2,0,0,0,0,0,0,0,0),(42,'admin@daihyun99','daihyun99','2018-09-07 23:45:24',NULL,NULL,'20',0,0,1,'',NULL,0,14,0,0,0,0,0,0,0,0,0),(43,'admin@daihyun99','daihyun99','2018-09-07 23:49:43',NULL,NULL,'18-3',0,0,1,'daihyun99',34,34,12,3,0,0,0,0,0,0,0,0),(44,'admin@daihyun99','daihyun99','2018-09-08 00:37:28',NULL,NULL,'개.꿀.잼',0,0,1,'daihyun99',1,1,1,3,0,0,0,0,0,0,0,0),(45,'admin@daihyun99','daihyun99','2018-09-08 00:39:40',NULL,NULL,'test',0,0,1,'daihyun99',42,42,14,1,0,0,0,0,0,0,0,0),(46,'admin@daihyun99','daihyun99','2018-09-08 00:41:10',NULL,NULL,'test2',0,0,1,'daihyun99',42,42,14,2,0,0,0,0,0,0,0,0),(47,'admin@daihyun99','daihyun99','2018-09-08 00:42:38',NULL,NULL,'test3',0,0,1,'daihyun99',42,42,14,3,0,0,0,0,0,0,0,0),(48,'admin@daihyun99','daihyun99','2018-09-08 00:42:59',NULL,NULL,'ㅇㅈ',0,0,1,'daihyun99',1,44,1,3,1,0,0,0,0,0,0,0),(49,'admin@daihyun99','daihyun99','2018-09-08 01:02:36',NULL,NULL,'다음 페이지로 넘어가는지 확인',0,0,1,'daihyun99',34,34,12,4,0,0,0,0,0,0,0,0),(50,'admin@daihyun99','daihyun99','2018-09-08 01:03:23',NULL,NULL,'이건 넘어감',0,0,1,'daihyun99',34,37,12,1,1,1,0,0,0,0,0,0),(51,'admin@daihyun99','daihyun99','2018-09-08 15:52:07',NULL,NULL,'test4',0,0,1,'daihyun99',42,42,14,4,0,0,0,0,0,0,0,0),(52,'admin@daihyun99','daihyun99','2018-09-08 15:53:37',NULL,NULL,'test5',0,0,1,'daihyun99',42,42,14,5,0,0,0,0,0,0,0,0),(53,'admin@daihyun99','daihyun99','2018-09-08 15:53:54',NULL,NULL,'2페이지 넘어가기',0,0,1,'daihyun99',34,34,12,5,0,0,0,0,0,0,0,0),(73,'admin@daihyun99','daihyun99','2018-09-25 17:30:19',NULL,NULL,'|￣￣￣￣￣￣￣￣￣￣|\n| 저어어어어어어어장 \n|＿＿＿＿＿＿＿＿＿＿|   \n / )__/ )  || \n(•ㅅ•)  || \n/. . . . . . づ',90,40,30,'',NULL,0,15,0,0,0,0,0,0,0,0,0),(74,'admin@daihyun99','daihyun99','2018-09-25 17:32:47',NULL,NULL,'(˃̣̣̥᷄⌓˂̣̣̥᷅)',0,0,30,'',NULL,0,16,0,0,0,0,0,0,0,0,0),(75,'admin@daihyun99','daihyun99','2018-09-25 17:33:05',NULL,NULL,'|￣￣￣￣￣￣￣|&nbsp;| 여기 있어...|＿＿＿＿＿＿＿|&nbsp;(\\__/) ||&nbsp;(•ㅅ•)..||&nbsp;/ . . . .づ',0,0,30,'',NULL,0,17,0,0,0,0,0,0,0,0,0),(76,'admin@daihyun99','daihyun99','2018-09-25 17:34:01',NULL,NULL,'&lt;span style=&quot;font-family: Verdana, Arial, Gulim; font-size: 12px; font-weight: 400; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;(˃̣̣̥᷄⌓˂̣̣̥᷅)&lt;/span&gt;',0,0,30,'',NULL,0,18,0,0,0,0,0,0,0,0,0),(77,'admin@daihyun99','daihyun99','2018-09-25 17:34:30',NULL,NULL,'&lt;font face=&quot;Verdana, Arial, Gulim&quot;&gt;&lt;span style=&quot;font-size: 12px; font-weight: 400; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;(˃̣̣̥᷄⌓˂̣̣̥᷅)&lt;/span&gt;&lt;/font&gt;&lt;br&gt;',0,0,30,'',NULL,0,19,0,0,0,0,0,0,0,0,0),(79,'admin@daihyun99','daihyun99','2018-09-25 17:42:30',NULL,NULL,'|￣￣￣￣￣￣￣￣￣￣|\n| 저어어어어어어어장 \n|＿＿＿＿＿＿＿＿＿＿|   \n / )__/ )  || \n(•ㅅ•)  || \n/. . . . . . づ',0,0,30,'',NULL,0,20,0,0,0,0,0,0,0,0,0),(80,'admin@daihyun99','daihyun99','2018-09-25 17:43:19',NULL,NULL,'ʕ っ•ᴥ•`ʔづ ⌒ ㅊㅊ',0,0,30,'',NULL,0,21,0,0,0,0,0,0,0,0,0),(81,'admin@daihyun99','daihyun99','2018-09-25 17:44:05',NULL,NULL,'ㅡㅡヽ、_ノㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅤ\nㅤㅤㅤ \\\'ｰ \\\' \nㅤㅤㅤㅤㅤＯ\nㅤㅤㅤㅤㅤㅤo\nㅤㅤㅤㅤㅤㅤ 。 ,.-ｰ冖\\\'⌒\\\'ｰ-､\nㅤㅤㅤㅤㅤㅤㅤ ,ノ ㅤㅤㅤㅤㅤㅤ＼\nㅤㅤㅤㅤㅤㅤㅤ/ㅤ,r‐へへく⌒\\\'￢ㅤ､ ヽ\nㅤㅤㅤㅤㅤㅤㅤ{ノ へ.._、 ,,／~`ㅤ〉｝ㅤㅤㅤ\nㅤㅤㅤㅤㅤㅤ／プ￣`y\\\'¨Y´￣ヽ-}j=くㅤㅤㅤ\nㅤㅤㅤㅤㅤノ/レ\\\'&gt;-〈＿ｭ`ー‐\\\'ㅤㅤﾘ,ｲ} ㅤㅤ\nㅤㅤㅤㅤ/_勺 ｲ;；∵r;==､､∴\\\'∵;ㅤシ ㅤㅤ\nㅤㅤㅤ /└\\\' ノ ＼ ㅤㅤこ¨｀ ㅤㅤノ\nㅤㅤㅤ人＿_/ー┬ 个-､＿_,,.. ‐\\\'´ 〃`ァーｧー＼\nㅤ ㅤ/|／ ㅤ|::::::|､ㅤㅤㅤㅤㅤㅤㅤ〃/:::::/ ヽ\nㅤ /｜ ㅤㅤ|::::::|＼､_________／ /:::::/',0,0,30,'',NULL,0,22,0,0,0,0,0,0,0,0,0),(85,'admin@daihyun99','daihyun99','2018-09-29 18:54:33',NULL,NULL,'test',0,0,13,'daihyun99',21,22,8,1,1,0,0,0,0,0,0,0),(89,'admin@daihyun99','daihyun99','2018-11-03 20:47:40',NULL,NULL,'신고해봐야딩-?',0,0,39,'',NULL,0,23,0,0,0,0,0,0,0,0,0),(90,'admin@daihyun99','daihyun99','2018-11-03 21:53:15',NULL,NULL,'대댓글!',0,0,39,'daihyun99',89,89,23,1,0,0,0,0,0,0,0,0),(92,'admin@daihyun99','daihyun99','2018-11-03 21:53:32',NULL,NULL,'대댓글!!',0,0,39,'daihyun99',89,89,23,2,0,0,0,0,0,0,0,0),(93,'admin@daihyun99','daihyun99','2018-11-09 23:46:21',NULL,NULL,'test',0,0,1,'',NULL,0,24,0,0,0,0,0,0,0,0,0),(96,'admin@daihyun99','daihyun99','2018-11-17 11:53:12',NULL,NULL,'댓글1',0,0,43,'',NULL,0,26,0,0,0,0,0,0,0,0,0),(97,'admin@daihyun99','daihyun99','2018-11-17 11:53:15',NULL,NULL,'댓글2',0,0,43,'',NULL,0,27,0,0,0,0,0,0,0,0,0),(98,'admin@daihyun99','daihyun99','2018-11-17 11:53:19',NULL,NULL,'댓글3',0,0,43,'',NULL,0,28,0,0,0,0,0,0,0,0,0),(99,'admin@daihyun99','daihyun99','2018-11-17 11:53:22',NULL,NULL,'댓글4',0,0,43,'',NULL,0,29,0,0,0,0,0,0,0,0,0),(100,'admin@daihyun99','daihyun99','2018-11-17 11:53:26',NULL,NULL,'댓글5',0,0,43,'',NULL,0,30,0,0,0,0,0,0,0,0,0),(101,'admin@daihyun99','daihyun99','2018-11-17 11:53:29',NULL,NULL,'댓글6',0,0,43,'',NULL,0,31,0,0,0,0,0,0,0,0,0),(102,'admin@daihyun99','daihyun99','2018-11-17 11:53:33',NULL,NULL,'댓글7',0,0,43,'',NULL,0,32,0,0,0,0,0,0,0,0,0),(103,'admin@daihyun99','daihyun99','2018-11-17 11:53:36',NULL,NULL,'댓글8',0,0,43,'',NULL,0,33,0,0,0,0,0,0,0,0,0),(104,'admin@daihyun99','daihyun99','2018-11-17 11:53:39',NULL,NULL,'댓글9',0,0,43,'',NULL,0,34,0,0,0,0,0,0,0,0,0),(105,'admin@daihyun99','daihyun99','2018-11-17 11:53:43',NULL,NULL,'댓글10',0,0,43,'',NULL,0,35,0,0,0,0,0,0,0,0,0),(106,'admin@daihyun99','daihyun99','2018-11-17 11:53:48',NULL,NULL,'댓글11',0,0,43,'',NULL,0,36,0,0,0,0,0,0,0,0,0),(107,'admin@daihyun99','daihyun99','2018-11-17 11:53:51',NULL,NULL,'댓글12',0,0,43,'',NULL,0,37,0,0,0,0,0,0,0,0,0),(108,'admin@daihyun99','daihyun99','2018-11-17 11:53:54',NULL,NULL,'댓글13',0,0,43,'',NULL,0,38,0,0,0,0,0,0,0,0,0),(109,'admin@daihyun99','daihyun99','2018-11-17 11:53:59',NULL,NULL,'댓글14',0,0,43,'',NULL,0,39,0,0,0,0,0,0,0,0,0),(110,'admin@daihyun99','daihyun99','2018-11-17 11:54:01',NULL,NULL,'댓글15',0,0,43,'',NULL,0,40,0,0,0,0,0,0,0,0,0),(111,'admin@daihyun99','daihyun99','2018-11-17 11:54:05',NULL,NULL,'댓글16',0,0,43,'',NULL,0,41,0,0,0,0,0,0,0,0,0),(112,'admin@daihyun99','daihyun99','2018-11-17 11:54:08',NULL,NULL,'댓글17',0,0,43,'',NULL,0,42,0,0,0,0,0,0,0,0,0),(113,'admin@daihyun99','daihyun99','2018-11-17 11:54:11',NULL,NULL,'댓글18',0,0,43,'',NULL,0,43,0,0,0,0,0,0,0,0,0),(114,'admin@daihyun99','daihyun99','2018-11-17 11:54:15',NULL,NULL,'댓글19',0,0,43,'',NULL,0,44,0,0,0,0,0,0,0,0,0),(115,'admin@daihyun99','daihyun99','2018-11-17 11:54:18',NULL,NULL,'댓글20 수정',0,0,43,'',NULL,0,45,0,0,0,0,0,0,0,0,0),(116,'admin@daihyun99','daihyun99','2018-11-17 11:54:21',NULL,NULL,'댓글21 수정',0,0,43,'',NULL,0,46,0,0,0,0,0,0,0,0,0),(117,'admin@daihyun99','daihyun99','2018-11-17 11:54:29',NULL,NULL,'댓글22',0,0,43,'',NULL,0,47,0,0,0,0,0,0,0,0,0),(118,'admin@daihyun99','daihyun99','2018-11-17 11:59:08',NULL,NULL,'댓글22-1',0,0,43,'daihyun99',117,117,47,1,0,0,0,0,0,0,0,0),(119,'admin@daihyun99','daihyun99','2018-11-17 12:01:15',NULL,NULL,'댓글22-2',0,0,43,'daihyun99',117,118,47,1,1,0,0,0,0,0,0,0),(120,'admin@daihyun99','daihyun99','2018-11-17 12:06:36',NULL,NULL,'댓글22-3',0,0,43,'daihyun99',117,119,47,1,1,1,0,0,0,0,0,0),(122,'admin@daihyun99','daihyun99','2018-11-17 12:17:44',NULL,NULL,'댓글22-4',0,0,43,'daihyun99',117,120,47,1,1,1,1,0,0,0,0,0),(123,'admin@daihyun99','daihyun99','2018-11-17 12:19:49',NULL,NULL,'22-5',0,0,43,'daihyun99',117,122,47,1,1,1,1,1,0,0,0,0),(124,'admin@daihyun99','daihyun99','2018-11-17 12:21:48',NULL,NULL,'22-6',0,0,43,'daihyun99',117,123,47,1,1,1,1,1,1,0,0,0),(125,'admin@daihyun99','daihyun99','2018-11-17 12:23:53',NULL,NULL,'22-7',0,0,43,'daihyun99',117,124,47,1,1,1,1,1,1,1,0,0),(126,'admin@daihyun99','daihyun99','2018-11-17 12:24:17',NULL,NULL,'22-8',0,0,43,'daihyun99',117,125,47,1,1,1,1,1,1,1,1,0),(127,'admin@daihyun99','daihyun99','2018-11-17 12:25:41',NULL,NULL,'22-9',0,0,43,'daihyun99',117,126,47,1,1,1,1,1,1,1,1,1),(128,'admin@daihyun99','daihyun99','2018-11-17 12:26:13',NULL,NULL,'22-10',0,0,43,'daihyun99',117,127,47,1,1,1,1,1,1,1,1,1),(132,'admin@daihyun99','daihyun99','2018-11-24 22:33:26',NULL,NULL,'댓글 없는데 5로 표시됨. 수정요망',0,0,29,'',NULL,0,51,0,0,0,0,0,0,0,0,0),(139,'admin@daihyun99','daihyun99','2018-11-24 22:52:29',NULL,NULL,'댓글23',0,0,43,'',NULL,0,49,0,0,0,0,0,0,0,0,0),(140,'admin@daihyun99','daihyun99','2018-11-24 22:52:33',NULL,NULL,'댓글24',0,0,43,'',NULL,0,50,0,0,0,0,0,0,0,0,0),(146,'admin@daihyun99','daihyun99','2018-11-24 23:10:54',NULL,NULL,'댓글 삭제 성공?',0,0,39,'',NULL,0,51,0,0,0,0,0,0,0,0,0),(149,'admin@daihyun99','daihyun99','2018-11-26 22:53:38',NULL,NULL,'테스트',0,0,36,'',NULL,0,51,0,0,0,0,0,0,0,0,0),(150,'admin@daihyun99','daihyun99','2018-11-26 23:31:45',NULL,NULL,'gg',0,0,2,'',NULL,0,52,0,0,0,0,0,0,0,0,0),(151,'admin@daihyun99','daihyun99','2018-11-26 23:31:48',NULL,NULL,'dd',0,0,2,'daihyun99',150,150,52,1,0,0,0,0,0,0,0,0),(152,'admin@daihyun99','daihyun99','2018-11-26 23:31:53',NULL,NULL,'dd2',0,0,2,'daihyun99',150,151,52,1,1,0,0,0,0,0,0,0),(153,'admin@daihyun99','daihyun99','2018-11-26 23:32:06',NULL,NULL,'gg1',0,0,2,'daihyun99',150,150,52,2,0,0,0,0,0,0,0,0),(154,'admin@daihyun99','daihyun99','2018-11-26 23:32:22',NULL,NULL,'gg2',0,0,2,'daihyun99',150,150,52,3,0,0,0,0,0,0,0,0),(155,'admin@root','root','2018-12-02 23:06:10',NULL,NULL,'ㅇㅇ',0,0,45,'',NULL,0,53,0,0,0,0,0,0,0,0,0),(156,'test01','테스트','2018-12-02 23:06:26',NULL,NULL,'테스트로 테스트2',0,0,45,'',NULL,0,54,0,0,0,0,0,0,0,0,0),(157,'test01','테스트','2018-12-02 23:39:19',NULL,NULL,'대댓',0,0,45,'테스트',156,156,54,1,0,0,0,0,0,0,0,0),(164,'admin@root','root','2018-12-11 21:58:58',NULL,NULL,'test2',0,0,56,'',NULL,0,55,0,0,0,0,0,0,0,0,0),(165,'admin@root','root','2018-12-29 00:40:38',NULL,NULL,'댓글 기록 ㅇㅇ',0,0,58,'',NULL,0,56,0,0,0,0,0,0,0,0,0),(166,'admin@root','root','2018-12-29 00:41:20',NULL,NULL,'2018년도 끝나는구나',0,0,58,'root',165,165,56,1,0,0,0,0,0,0,0,0);
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
  `email` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이메일',
  `pswd` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` int(11) NOT NULL DEFAULT 1,
  `score` int(11) NOT NULL DEFAULT 0,
  `map` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fail` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '로그인 20회 실패시 차단, 성공시 초기화',
  `ctim` datetime NOT NULL DEFAULT current_timestamp(),
  `atim` datetime DEFAULT NULL,
  `utim` datetime DEFAULT NULL,
  `btim` datetime DEFAULT NULL,
  `post` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '{"history": []}',
  `upload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '{"history": []}',
  `reply` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '{"history": []}',
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
INSERT INTO `user_info` VALUES ('test01','테스트','daihyun99@gmail.com','JDJ5JDEyJC5YMUZPME5QWVN3LnRpa0ZLMnpTRmVZTXRKTnhmWUVITVZENW5oSlJ1ajRMRXUyR0l3a0cu',1,20,'kr1',0,'2017-02-16 18:53:33','2018-12-09 23:01:48','2018-11-14 22:34:36',NULL,'{\"history\": []}','{\"history\": [{\"file_name\": \"42df1f969e57f277b068dc0c39558ee5.png\", \"file_type\": \"image/png\", \"client_name\": \"burn.png\", \"file_size\": \"19.55\"}]}','{\"history\": []}',''),('test02','삭제테스트',NULL,'JDJ5JDEyJEgxcmE5bWc4Nk5kZy9vYWU2MjdWeGV0VEUxLnlkUTRMNEppSnNtYUh5VXlFMlhRdC9YejN5',1,0,NULL,0,'2017-03-23 02:24:00','2017-12-30 18:04:59',NULL,NULL,'{\"history\": []}','{\"history\": []}','{\"history\": []}',''),('test03','ajax테스트',NULL,'JDJ5JDEyJFBqS3dUTi5CR1F5TWFFUTN1eUo2THVwUEJRaHpTTlJBWmFucVQzNGhUUE9LMTdac0hSb3Y2',1,0,NULL,0,'2017-03-23 15:30:42','2018-01-20 18:37:57',NULL,NULL,'{\"history\": []}','{\"history\": []}','{\"history\": []}',''),('test04','테스트04',NULL,'JDJ5JDEyJE1HOWU2bkcxZGE1ZU9pRFlvb3hoVU9ZUWJCdUd1VjlkQTBFa2ZHWHFrSUhkejVpTkN3U2M2',1,0,NULL,0,'2018-10-03 01:14:10',NULL,NULL,NULL,'{\"history\": []}','{\"history\": []}','{\"history\": []}',''),('test05','잇힝',NULL,'JDJ5JDEyJEJwd1VJcTZKZkhKekkwb2pkRmRBUnVCZ1ZBZE9rNWNzZ1RodTRnRWNrUU54SGNuNnAzWW5P',1,0,NULL,0,'2018-10-03 01:23:29','2018-11-03 15:37:50',NULL,'2018-11-05 00:15:50','{\"history\": []}','{\"history\": []}','{\"history\": []}',''),('test06','테스트06',NULL,'JDJ5JDEyJHpWQTJNMXdydmd4RkxlU0Q1ckJpcE94eHNJZnEvb1RBVUhQeVBZcGFDQXU3YndSalZPSm5l',1,0,NULL,0,'2018-11-01 22:46:21',NULL,NULL,NULL,'{\"history\": []}','{\"history\": []}','{\"history\": []}','');
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
INSERT INTO `user_session` VALUES ('2vi1i3pf258dtfgbg6hn60pmn6jhj1k0','127.0.0.1',1546065560,'__ci_last_regenerate|i:1546065560;admin|b:1;uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;map|s:5:\"space\";map_detail|a:2:{s:6:\"global\";a:1:{i:0;s:78:\"{\"address\": [\"Goean-dong\",\"Sosa-gu\",\"Bucheon-si\",\"Gyeonggi-do\",\"South Korea\"]}\";}s:6:\"native\";a:1:{i:0;s:77:\"{\"address\": [\"괴안동\",\"소사구\",\"부천시\",\"경기도\",\"대한민국\"]}\";}}'),('fmro8jfr487u9q9i1mfrtrj51v7s3mf4','127.0.0.1',1546065158,'__ci_last_regenerate|i:1546065158;admin|b:1;uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;map|s:5:\"admin\";'),('kmls6qdms62jl6ehv9u2df2cv0elkeu7','127.0.0.1',1546247210,'__ci_last_regenerate|i:1546247075;map|s:5:\"admin\";map_detail|s:0:\"\";admin|b:1;uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('odaiio4k35vcitmt6nvsfvm7bhrhiahg','127.0.0.1',1546065864,'__ci_last_regenerate|i:1546065864;admin|b:1;uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;map|s:5:\"space\";map_detail|s:0:\"\";'),('qf8dnn0c4eg81j7h0pb68n1od2kocltq','127.0.0.1',1546247075,'__ci_last_regenerate|i:1546247075;map|s:5:\"space\";map_detail|s:0:\"\";admin|b:1;uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('ubi7iar8dp5ia01hu7g4fhsundigv4qn','127.0.0.1',1546064856,'__ci_last_regenerate|i:1546064856;admin|b:1;uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;map|s:5:\"admin\";'),('umtgh107ib2rom9iieri1603141hitp0','127.0.0.1',1546065997,'__ci_last_regenerate|i:1546065864;admin|b:1;uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;map|s:5:\"space\";map_detail|s:0:\"\";');
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `createMap`(IN `in_country` VARCHAR(100), IN `in_code` CHAR(10), IN `in_native` LONGTEXT, IN `in_global` LONGTEXT, IN `in_description` TEXT, IN `in_keyword` TEXT, IN `in_latitude` DOUBLE, IN `in_longitude` DOUBLE)
BEGIN

DECLARE in_num int default 0;
DECLARE in_name char(20) default '';
SELECT count(num) into in_num FROM map_code WHERE code = in_code;
SET in_num = in_num + 1;
SET in_name = concat(in_code, in_num);



INSERT INTO map_code (country, name, code, num, native, global, description, keyword, latitude, longitude) values(in_country, in_name, in_code, in_num, concat('{"address": ', in_native,'}'), concat('{"address": ', in_global,'}'), in_description, in_keyword, in_latitude, in_longitude );

SET @post = CONCAT('CREATE TABLE map_', in_name, '_post (\n\tno      int not null auto_increment,\n\tuid     varchar(100) not null,\n\tcountry    varchar(100) not null,\n\tctim    datetime not null default current_timestamp,\n\tutim    datetime,\n\tdtim    datetime,\n\ttitle   varchar(1000) not null,\n\tcontent text not null,\n\treply int not null default 0,\n\thit int not null default 0,\n\tup int not null default 0,\n\tdown int not null default 0,\n\ttype    varchar(20) not null,\n\ttag     varchar(20) not null,\n\tkeyword varchar(400) not null,\n\tPRIMARY KEY (no), \n\tINDEX (no)\n)');

PREPARE stmt1 FROM @post;
EXECUTE stmt1;

SET @reply = CONCAT('CREATE TABLE map_', in_name, '_reply(\n\tno\t\tint\t\t\tnot null auto_increment,\n\tuid\t\tvarchar(100)\tnot null,\n\tname\tvarchar(100)\tnot null,\n\tctim\tdatetime\t\tnot null default current_timestamp,\n\tutim\tdatetime,\n\tdtim\tdatetime,\n\tcontent\tvarchar(2000)\tnot null,\nup int not null default 0,\ndown int not null default 0,\n\tpost\tint not null,\n\tmention\tvarchar(100) default null,\n\tfollow\tint null default null,\n\tdepth1 int not null default 0\r\n, \n\tdepth2 int not null default 0\r\n, \n\tdeprh3 int not null default 0\r\n, \n\tdepth4 int not null default 0\r\n, \n\tdepth5 int not null default 0\r\n, \n\tdepth6 int not null default 0\r\n, \n\tdepth7 int not null default 0\r\n, \n\tdepth8 int not null default 0\r\n, \n\tdepth9 int not null default 0\r\n, \n\tdepth10 int not null default 0\r\n, \n\tPRIMARY KEY (no), \n\tINDEX (no)\n)');

PREPARE stmt2 FROM @reply;
EXECUTE stmt2;

SET @history = CONCAT('CREATE TABLE map_', in_name, '_history( \n\tno      int not null auto_increment, \n\tuid     varchar(100) not null, \n\ttype    enum("post", "reply") not null, \n\trelation int not null, \n\tpost int not null, \n\tctim    datetime not null default current_timestamp, \n\tutim    datetime, \n\tdtim    datetime, \n\tact    enum("up", "down", "view", "n","report","") not null default "", \n\tPRIMARY KEY (no), \n\tINDEX (no), \n\tINDEX (relation), \n\tINDEX (post)\n)');

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
CREATE DEFINER=`root`@`localhost` PROCEDURE `destroyMap`(IN `in_code` CHAR(10), IN `in_num` INT)
BEGIN

DELETE FROM map_code WHERE code = in_code AND num = in_num;

SET @post = CONCAT('DROP TABLE map_', in_code, in_num, '_post');
PREPARE stmt1 FROM @post;
EXECUTE stmt1;

SET @reply= CONCAT('DROP TABLE map_', in_code, in_num, '_reply');
PREPARE stmt2 FROM @reply;
EXECUTE stmt2;

SET @history= CONCAT('DROP TABLE map_', in_code, in_num, '_history');
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

-- Dump completed on 2018-12-31 18:06:51
