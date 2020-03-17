-- MariaDB dump 10.17  Distrib 10.4.10-MariaDB, for osx10.14 (x86_64)
--
-- Host: localhost    Database: home
-- ------------------------------------------------------
-- Server version	10.4.10-MariaDB

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

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `rgbplace` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `rgbplace`;

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
INSERT INTO `admin_info` VALUES (1,'admin','root','JDJ5JDEyJHplS21IV2Q4bXVlWGNJYU8wZEQ3RU9hZXNuYWtrLy5FUXRSU29TUDkuS3FSWjAvbG5NbktH',0,'2020-03-17 13:04:20','JDJ5JDEwJEJpRVRwYWtjdThRb0V0c29JVHdrRk93endPOC5ldXRsRU4uTUhwLi55bDBSb0pid0Fjc0h5','2020-03-18 01:04:20','{\"total\": [{\"type\": \"reply\", \"map\": \"space\", \"post\": \"99\", \"reply\": \"323\", \"content\": \"테스트\", \"date\": \"2019-05-03 00:06:43\"}]}');
/*!40000 ALTER TABLE `admin_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_log`
--

DROP TABLE IF EXISTS `mail_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_log` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `mail` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` int(11) NOT NULL,
  `ctim` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_log`
--

LOCK TABLES `mail_log` WRITE;
/*!40000 ALTER TABLE `mail_log` DISABLE KEYS */;
INSERT INTO `mail_log` VALUES (1,'daihyun99@gmail.com',521741,'2019-03-02 22:47:07'),(2,'test@gmail.com',925727,'2019-03-02 22:59:24'),(3,'test@gmail.com',825909,'2019-03-02 22:59:28'),(4,'test@gmail.com',242958,'2019-02-01 22:59:30'),(5,'test@gmail.com',585136,'2019-03-02 23:11:26'),(6,'test@gmail.com',498499,'2019-03-02 23:11:27'),(7,'daihyun99@gmail.com',136931,'2019-03-07 23:45:47'),(8,'6lueparr0t@gmail.com',194996,'2019-03-08 00:05:35'),(9,'6lueparr0t@gmail.com',909013,'2019-03-08 00:21:25'),(10,'6lueparr0t@gmail.com',674621,'2019-03-08 00:21:42'),(11,'5lueparr0t@gmail.com',798536,'2019-03-08 00:24:14'),(12,'scallop99@naver.com',708918,'2019-04-11 23:00:42'),(13,'scallop99@naver.com',242732,'2019-04-11 23:02:40'),(14,'6lueparr0t@gmail.com',748673,'2019-04-11 23:11:29'),(15,'6lueparr0t@gmail.com',393963,'2019-04-11 23:15:03'),(16,'6lueparr0t@gmail.com',388154,'2019-04-11 23:15:20'),(17,'6lueparr0t@gmail.com',583419,'2019-04-11 23:15:59'),(18,'6lueparr0t@gmail.com',997226,'2019-04-11 23:16:10'),(19,'6lueparr0t@gmail.com',409808,'2019-04-11 23:16:38'),(20,'6lueparr0t@gmail.com',144685,'2019-04-11 23:20:02'),(21,'scallop99@naver.com',697273,'2019-04-26 00:18:00'),(22,'scallop99@naver.com',560813,'2019-04-26 01:16:29'),(23,'scallop99@naver.com',280090,'2019-04-26 01:24:31');
/*!40000 ALTER TABLE `mail_log` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='장소(Code) 정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_code`
--

LOCK TABLES `map_code` WRITE;
/*!40000 ALTER TABLE `map_code` DISABLE KEYS */;
INSERT INTO `map_code` VALUES (9,'kr1','kr',1,'대한민국|South Korea','{\"address\": [\"괴안동\",\"소사구\",\"부천시\",\"경기도\",\"대한민국\"]}','{\"address\": [\"Goean-dong\",\"Sosa-gu\",\"Bucheon-si\",\"Gyeonggi-do\",\"South Korea\"]}','2019-02-02 14:58:17',NULL,'','Admin','한국',37.47581767319603,126.80552121712878),(11,'kr2','kr',2,'대한민국|South Korea','{\"address\": [\"부개1동\",\"부평구\",\"인천광역시\",\"대한민국\"]}','{\"address\": [\"Bugae 1(il)-dong\",\"Bupyeong-gu\",\"Incheon\",\"South Korea\"]}','2019-02-02 15:48:34',NULL,'','Admin','대한민국',37.4881662387444,126.73341323880845),(12,'kr3','kr',3,'대한민국|South Korea','{\"address\": [\"흑석동\",\"동작구\",\"서울특별시\",\"대한민국\"]}','{\"address\": [\"Heukseok-dong\",\"Dongjak-gu\",\"Seoul\",\"South Korea\"]}','2019-03-15 22:39:25',NULL,'','Admin','',37.502876357378604,126.96327662675435);
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
  `act` enum('up','down','view','-','n','report','') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
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
  `upload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '{"total":[]}',
  PRIMARY KEY (`no`),
  KEY `no` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_kr1_post`
--

LOCK TABLES `map_kr1_post` WRITE;
/*!40000 ALTER TABLE `map_kr1_post` DISABLE KEYS */;
INSERT INTO `map_kr1_post` VALUES (1,1,'admin@root','root','2019-02-02 14:58:36',NULL,NULL,'ㅇㅇ','ㅇㅇ<img src=\\\"/upload/23c927d09aecbed1c528d7b81d43acf3.png\\\" alt=\\\"블루파프리카.png\\\" style=\\\"max-width: 100%;\\\"><br><br>',2,1,10,0,'free','','','{\"total\":[]}');
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
  `act` enum('up','down','view','-','report','') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
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
  `upload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '{"total":[]}',
  PRIMARY KEY (`no`),
  KEY `no` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_kr2_post`
--

LOCK TABLES `map_kr2_post` WRITE;
/*!40000 ALTER TABLE `map_kr2_post` DISABLE KEYS */;
INSERT INTO `map_kr2_post` VALUES (1,1,'admin@root','root','2019-02-02 15:48:51',NULL,NULL,'읭','옹',0,1,0,0,'free','','','{\"total\":[]}');
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
-- Table structure for table `map_kr3_history`
--

DROP TABLE IF EXISTS `map_kr3_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_kr3_history` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `sn` int(11) DEFAULT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('post','reply') COLLATE utf8mb4_unicode_ci NOT NULL,
  `relation` int(11) NOT NULL,
  `post` int(11) NOT NULL,
  `ctim` datetime NOT NULL DEFAULT current_timestamp(),
  `utim` datetime DEFAULT NULL,
  `dtim` datetime DEFAULT NULL,
  `act` enum('up','down','view','-','report','') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`no`),
  KEY `no` (`no`),
  KEY `relation` (`relation`),
  KEY `post` (`post`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_kr3_history`
--

LOCK TABLES `map_kr3_history` WRITE;
/*!40000 ALTER TABLE `map_kr3_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `map_kr3_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_kr3_post`
--

DROP TABLE IF EXISTS `map_kr3_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_kr3_post` (
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
  `upload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '{"total":[]}',
  PRIMARY KEY (`no`),
  KEY `no` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_kr3_post`
--

LOCK TABLES `map_kr3_post` WRITE;
/*!40000 ALTER TABLE `map_kr3_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `map_kr3_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_kr3_reply`
--

DROP TABLE IF EXISTS `map_kr3_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_kr3_reply` (
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
-- Dumping data for table `map_kr3_reply`
--

LOCK TABLES `map_kr3_reply` WRITE;
/*!40000 ALTER TABLE `map_kr3_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `map_kr3_reply` ENABLE KEYS */;
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
  `act` enum('up','down','-','view','report','') COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`no`),
  KEY `no` (`no`),
  KEY `relation` (`relation`),
  KEY `post` (`post`)
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_space_history`
--

LOCK TABLES `map_space_history` WRITE;
/*!40000 ALTER TABLE `map_space_history` DISABLE KEYS */;
INSERT INTO `map_space_history` VALUES (70,NULL,'admin@daihyun99','post',9,NULL,'2018-10-09 01:18:53',NULL,NULL,'view'),(71,NULL,'admin@daihyun99','post',9,NULL,'2018-10-09 01:18:55',NULL,NULL,'up'),(72,NULL,'admin@daihyun99','post',30,NULL,'2018-10-20 16:46:30',NULL,NULL,'view'),(73,NULL,'admin@daihyun99','post',1,NULL,'2018-10-26 23:17:47',NULL,NULL,'view'),(74,NULL,'admin@daihyun99','post',12,NULL,'2018-10-26 23:27:06',NULL,NULL,'view'),(75,NULL,'admin@daihyun99','post',10,NULL,'2018-10-27 00:53:52',NULL,NULL,'view'),(76,NULL,'admin@daihyun99','post',5,NULL,'2018-10-27 01:05:37',NULL,NULL,'view'),(77,NULL,'admin@daihyun99','post',38,NULL,'2018-10-29 00:58:22',NULL,NULL,'view'),(78,NULL,'admin@daihyun99','post',38,NULL,'2018-11-02 00:07:42','2018-11-02 00:07:42',NULL,'-'),(79,NULL,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(80,NULL,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(81,NULL,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(82,NULL,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(83,NULL,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(84,NULL,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(85,NULL,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(86,NULL,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(87,NULL,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(88,NULL,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(89,NULL,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(90,NULL,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(91,NULL,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(92,NULL,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(93,NULL,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(94,NULL,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(95,NULL,'admin@daihyun99','post',30,NULL,'2018-11-04 12:19:03',NULL,NULL,'up'),(96,NULL,'admin@daihyun99','post',0,NULL,'2018-11-01 02:05:55',NULL,NULL,'down'),(97,NULL,'admin@daihyun99','post',0,NULL,'2018-11-01 02:05:55',NULL,NULL,'down'),(98,NULL,'admin@daihyun99','post',0,NULL,'2018-11-01 02:05:55',NULL,NULL,'down'),(99,NULL,'admin@daihyun99','post',0,NULL,'2018-11-01 02:05:55',NULL,NULL,'down'),(100,NULL,'admin@daihyun99','post',0,NULL,'2018-11-01 02:05:55',NULL,NULL,'down'),(101,NULL,'admin@daihyun99','post',0,NULL,'2018-11-01 01:55:13',NULL,NULL,'up'),(102,NULL,'admin@daihyun99','post',0,NULL,'2018-11-01 01:57:24',NULL,NULL,'up'),(103,NULL,'admin@daihyun99','post',0,NULL,'2018-11-01 01:57:52',NULL,NULL,'up'),(104,NULL,'admin@daihyun99','post',0,NULL,'2018-11-01 01:58:28',NULL,NULL,'up'),(105,NULL,'admin@daihyun99','post',0,NULL,'2018-11-01 02:01:32',NULL,NULL,'up'),(106,NULL,'admin@daihyun99','post',0,NULL,'2018-11-01 02:01:47',NULL,NULL,'up'),(107,NULL,'admin@daihyun99','post',0,NULL,'2018-11-01 02:02:01',NULL,NULL,'up'),(108,NULL,'admin@daihyun99','post',0,NULL,'2018-11-01 02:02:04',NULL,NULL,'up'),(109,NULL,'admin@daihyun99','post',73,NULL,'2018-11-01 02:41:00',NULL,NULL,'up'),(110,NULL,'admin@daihyun99','post',73,NULL,'2018-11-01 02:42:40',NULL,NULL,'up'),(111,NULL,'admin@daihyun99','post',73,NULL,'2018-11-01 02:45:17',NULL,NULL,'up'),(112,NULL,'admin@daihyun99','post',73,NULL,'2018-11-01 02:46:36',NULL,NULL,'up'),(113,NULL,'admin@daihyun99','post',73,NULL,'2018-11-01 02:47:17',NULL,NULL,'up'),(114,NULL,'admin@daihyun99','post',73,NULL,'2018-11-01 02:48:29',NULL,NULL,'up'),(115,NULL,'admin@daihyun99','post',73,NULL,'2018-11-01 02:48:39',NULL,NULL,'up'),(116,NULL,'admin@daihyun99','post',73,NULL,'2018-11-01 02:51:35',NULL,NULL,'up'),(117,NULL,'admin@daihyun99','post',73,NULL,'2018-11-01 02:52:01',NULL,NULL,'up'),(118,NULL,'admin@daihyun99','post',73,NULL,'2018-11-01 02:52:16',NULL,NULL,'down'),(119,NULL,'admin@daihyun99','post',73,NULL,'2018-11-01 02:52:24',NULL,NULL,'down'),(120,NULL,'admin@daihyun99','post',73,NULL,'2018-11-01 02:52:27',NULL,NULL,'down'),(121,NULL,'admin@daihyun99','reply',73,NULL,'2018-11-01 02:58:13',NULL,NULL,'down'),(122,NULL,'admin@daihyun99','reply',74,30,'2018-11-01 22:35:39','2018-11-01 22:35:40',NULL,'-'),(123,NULL,'admin@daihyun99','post',37,NULL,'2018-11-03 11:46:50',NULL,NULL,'view'),(124,NULL,'admin@daihyun99','post',39,NULL,'2018-11-03 11:47:32',NULL,NULL,'view'),(125,NULL,'admin@daihyun99','post',39,NULL,'2018-11-03 22:12:08','2018-11-03 22:12:09',NULL,'-'),(126,NULL,'admin@daihyun99','post',21,NULL,'2018-11-03 20:46:05',NULL,NULL,'view'),(127,NULL,'admin@daihyun99','post',29,NULL,'2018-11-03 20:47:56',NULL,NULL,'view'),(128,NULL,'admin@daihyun99','post',34,NULL,'2018-11-03 21:55:50',NULL,NULL,'view'),(129,NULL,'admin@daihyun99','post',35,NULL,'2018-11-03 21:56:58',NULL,NULL,'view'),(130,NULL,'admin@daihyun99','reply',89,39,'2018-11-03 22:12:09','2018-11-03 22:12:10',NULL,'-'),(131,NULL,'admin@daihyun99','reply',28,29,'2018-11-03 22:20:37',NULL,NULL,'report'),(132,NULL,'test05','post',30,NULL,'2018-11-04 00:14:54',NULL,NULL,'view'),(133,NULL,'test05','post',13,NULL,'2018-11-04 00:23:36',NULL,NULL,'view'),(134,NULL,'test05','post',12,NULL,'2018-11-04 00:23:54',NULL,NULL,'view'),(139,NULL,'admin@daihyun99','reply',73,30,'2018-11-04 03:23:47',NULL,NULL,'report'),(140,NULL,'test01','post',30,NULL,'2018-11-04 03:24:28',NULL,NULL,'view'),(141,NULL,'test01','reply',73,30,'2018-11-04 03:25:18',NULL,NULL,'report'),(142,NULL,'admin@daihyun99','post',20,NULL,'2018-11-06 00:53:41',NULL,NULL,'view'),(143,NULL,'admin@daihyun99','post',40,NULL,'2018-11-06 01:06:04',NULL,NULL,'view'),(144,NULL,'admin@daihyun99','post',41,NULL,'2018-11-11 18:00:43',NULL,NULL,'view'),(145,NULL,'admin@daihyun99','post',42,NULL,'2018-11-16 01:03:44',NULL,NULL,'view'),(146,NULL,'admin@daihyun99','post',43,NULL,'2018-11-17 11:53:05',NULL,NULL,'view'),(147,NULL,'admin@daihyun99','post',44,NULL,'2018-11-19 21:36:10',NULL,NULL,'view'),(148,NULL,'admin@daihyun99','post',36,NULL,'2018-11-26 22:53:33',NULL,NULL,'view'),(149,NULL,'admin@daihyun99','post',2,NULL,'2018-11-26 23:31:39',NULL,NULL,'view'),(150,NULL,'admin@root','post',38,NULL,'2018-12-02 23:05:37',NULL,NULL,'view'),(151,NULL,'admin@root','post',45,NULL,'2018-12-02 23:06:06',NULL,NULL,'view'),(152,NULL,'admin@root','reply',155,45,'2018-12-02 23:06:11','2018-12-02 23:06:13',NULL,'-'),(153,NULL,'test01','post',45,NULL,'2018-12-02 23:06:21',NULL,NULL,'view'),(154,NULL,'test01','reply',156,45,'2018-12-02 23:39:11','2018-12-02 23:39:11',NULL,'-'),(156,NULL,'test01','reply',155,45,'2018-12-02 23:39:13','2018-12-02 23:39:13',NULL,'-'),(157,NULL,'admin@root','reply',157,45,'2018-12-07 18:25:49','2018-12-07 18:25:50',NULL,'-'),(158,NULL,'admin@root','post',43,NULL,'2018-12-07 18:25:53',NULL,NULL,'view'),(159,NULL,'admin@root','post',46,NULL,'2018-12-07 18:35:13',NULL,NULL,'view'),(160,NULL,'admin@root','post',47,NULL,'2018-12-07 19:07:39',NULL,NULL,'view'),(161,NULL,'admin@root','post',48,NULL,'2018-12-08 23:02:47',NULL,NULL,'view'),(162,NULL,'admin@root','post',49,NULL,'2018-12-08 23:47:37',NULL,NULL,'view'),(163,NULL,'admin@root','post',50,NULL,'2018-12-09 00:44:13',NULL,NULL,'view'),(164,NULL,'admin@root','post',51,NULL,'2018-12-09 00:51:22',NULL,NULL,'view'),(165,NULL,'admin@root','post',52,NULL,'2018-12-09 00:55:21',NULL,NULL,'view'),(166,NULL,'admin@root','post',53,NULL,'2018-12-09 01:58:14',NULL,NULL,'view'),(167,NULL,'admin@root','post',54,NULL,'2018-12-09 01:59:37',NULL,NULL,'view'),(168,NULL,'admin@root','post',55,NULL,'2018-12-09 02:21:26',NULL,NULL,'view'),(169,NULL,'admin@root','post',56,NULL,'2018-12-09 23:05:26',NULL,NULL,'view'),(170,NULL,'admin@root','post',40,NULL,'2018-12-12 23:54:35',NULL,NULL,'view'),(171,NULL,'admin@root','post',57,NULL,'2018-12-13 00:14:39',NULL,NULL,'view'),(172,NULL,'admin@root','post',58,NULL,'2018-12-13 00:39:32',NULL,NULL,'view'),(173,NULL,'admin@root','post',59,NULL,'2018-12-28 23:21:02',NULL,NULL,'view'),(174,NULL,'admin@root','post',60,NULL,'2018-12-31 18:54:48',NULL,NULL,'view'),(175,NULL,'admin@root','post',61,NULL,'2018-12-31 20:07:08',NULL,NULL,'view'),(176,NULL,'admin@root','post',62,NULL,'2018-12-31 20:07:51',NULL,NULL,'view'),(177,NULL,'admin@root','post',63,NULL,'2019-01-01 16:06:55',NULL,NULL,'view'),(178,NULL,'admin@root','post',64,NULL,'2019-01-05 12:01:52',NULL,NULL,'view'),(179,NULL,'admin@root','post',13,NULL,'2019-01-05 12:24:39',NULL,NULL,'view'),(180,NULL,'admin@root','post',16,NULL,'2019-01-05 12:24:50',NULL,NULL,'view'),(181,NULL,'admin@root','post',65,NULL,'2019-01-05 12:40:28',NULL,NULL,'view'),(182,NULL,'admin@root','post',30,NULL,'2019-01-07 23:22:51',NULL,NULL,'view'),(183,NULL,'admin@root','reply',75,30,'2019-01-07 23:27:55','2019-01-07 23:27:55',NULL,'-'),(184,NULL,'admin@root','reply',73,30,'2019-01-07 23:28:10','2019-01-07 23:28:12',NULL,'-'),(185,NULL,'admin@root','post',66,NULL,'2019-01-09 00:29:16',NULL,NULL,'view'),(186,NULL,'test01','post',67,NULL,'2019-01-09 01:04:36',NULL,NULL,'view'),(187,NULL,'test01','post',69,NULL,'2019-01-09 01:17:55',NULL,NULL,'view'),(188,NULL,'test01','post',66,NULL,'2019-01-09 01:18:05',NULL,NULL,'view'),(189,NULL,'admin@root','post',70,NULL,'2019-01-09 01:18:28',NULL,NULL,'view'),(190,NULL,'admin@root','post',69,NULL,'2019-01-09 01:25:55',NULL,NULL,'view'),(191,NULL,'admin@root','reply',164,56,'2019-01-09 01:26:06',NULL,NULL,'up'),(192,NULL,'test01','post',56,NULL,'2019-01-09 01:26:22',NULL,NULL,'view'),(193,NULL,'test01','reply',175,56,'2019-01-09 01:30:16','2019-01-09 01:30:19',NULL,'-'),(194,NULL,'test01','post',68,NULL,'2019-01-09 21:57:11',NULL,NULL,'view'),(195,NULL,'admin@root','post',68,NULL,'2019-01-09 21:57:20',NULL,NULL,'view'),(196,NULL,'admin@root','post',41,NULL,'2019-01-09 22:08:36',NULL,NULL,'view'),(197,NULL,'test01','post',38,NULL,'2019-01-10 00:47:45',NULL,NULL,'view'),(198,NULL,'admin@root','post',1,NULL,'2019-01-13 09:05:35',NULL,NULL,'view'),(199,NULL,'admin@root','reply',116,43,'2019-01-13 09:18:10','2019-01-13 09:18:11',NULL,'-'),(200,NULL,'test01','post',43,NULL,'2019-01-13 09:22:14',NULL,NULL,'view'),(201,NULL,'test01','post',64,NULL,'2019-01-13 09:42:04',NULL,NULL,'view'),(202,NULL,'admin@root','post',39,NULL,'2019-01-21 22:07:14',NULL,NULL,'view'),(203,NULL,'admin@root','post',29,NULL,'2019-01-21 22:57:38',NULL,NULL,'view'),(204,NULL,'admin@root','post',36,NULL,'2019-01-21 22:57:43',NULL,NULL,'view'),(205,NULL,'admin@root','post',37,NULL,'2019-01-21 22:57:46',NULL,NULL,'view'),(206,NULL,'admin@root','post',42,NULL,'2019-01-25 22:12:07',NULL,NULL,'view'),(207,NULL,'test02','post',64,NULL,'2019-01-27 09:58:56',NULL,NULL,'view'),(208,NULL,'admin@root','post',71,NULL,'2019-01-27 12:09:48',NULL,NULL,'view'),(209,NULL,'admin@root','post',72,NULL,'2019-01-27 12:15:15',NULL,NULL,'view'),(210,NULL,'admin@root','post',73,NULL,'2019-01-27 12:15:36',NULL,NULL,'view'),(211,NULL,'admin@root','post',74,NULL,'2019-01-27 12:17:03',NULL,NULL,'view'),(212,NULL,'admin@root','post',75,NULL,'2019-01-27 12:17:15',NULL,NULL,'view'),(213,NULL,'delete_me','post',64,NULL,'2019-02-01 20:58:16',NULL,NULL,'view'),(214,1,'admin@root','post',76,NULL,'2019-02-02 14:43:15',NULL,NULL,'view'),(215,1,'admin@root','post',77,NULL,'2019-02-02 14:50:27',NULL,NULL,'view'),(216,1,'admin@root','post',17,NULL,'2019-02-02 17:37:19',NULL,NULL,'view'),(217,1,'admin@root','post',78,NULL,'2019-02-05 16:12:53',NULL,NULL,'view'),(218,1,'test01','post',79,NULL,'2019-02-06 11:09:52',NULL,NULL,'view'),(219,1,'test01','post',17,NULL,'2019-02-06 11:14:59',NULL,NULL,'view'),(220,1,'admin@root','post',18,NULL,'2019-02-06 12:15:36',NULL,NULL,'view'),(221,1,'admin@root','post',19,NULL,'2019-02-06 12:15:43',NULL,NULL,'view'),(222,1,'admin@root','post',6,NULL,'2019-02-06 12:57:38',NULL,NULL,'view'),(223,1,'admin@root','post',2,NULL,'2019-02-06 12:57:57',NULL,NULL,'view'),(224,1,'admin@root','post',3,NULL,'2019-02-06 12:58:07',NULL,NULL,'view'),(225,13,'6lueparr0t@gmail.com','post',37,NULL,'2019-02-08 11:47:19',NULL,NULL,'view'),(226,1,'admin@root','post',12,NULL,'2019-02-25 22:44:35',NULL,NULL,'view'),(227,1,'admin@root','post',4,NULL,'2019-02-25 22:44:50',NULL,NULL,'view'),(228,1,'admin@root','post',80,NULL,'2019-02-28 00:42:26',NULL,NULL,'view'),(229,1,'admin@root','post',41,41,'2019-02-28 21:29:46','2019-02-28 21:29:50',NULL,'-'),(230,1,'admin@root','post',38,38,'2019-03-29 22:57:12','2019-03-29 22:57:13',NULL,'-'),(231,1,'test01','post',89,89,'2019-04-11 22:01:29','2019-04-11 22:01:30',NULL,'-'),(232,1,'admin@root','post',97,97,'2020-02-27 10:41:21','2020-02-27 10:41:21',NULL,'-');
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
  `upload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '{"total":[]}',
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_space_post`
--

LOCK TABLES `map_space_post` WRITE;
/*!40000 ALTER TABLE `map_space_post` DISABLE KEYS */;
INSERT INTO `map_space_post` VALUES (5,NULL,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Hello, 한글!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',4,0,0,0,'best','first','','{\"total\":[]}'),(7,NULL,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Test, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',1,0,0,0,'best','first','','{\"total\":[]}'),(8,NULL,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Test, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',2,0,0,0,'best','first','','{\"total\":[]}'),(9,NULL,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Test, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',7,41,0,0,'best','first','','{\"total\":[]}'),(10,NULL,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Test, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',2,0,0,0,'best','first','','{\"total\":[]}'),(11,NULL,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Test, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',5,1,0,0,'best','first','','{\"total\":[]}'),(30,NULL,'admin@daihyun99','daihyun99','2018-09-14 22:09:56',NULL,NULL,'[upload] 업로드 테스트','<img src=\\\"/upload/436c0cd8bd370338dd8c6197cdc6d858.png\\\"><img src=\\\"/upload/901720d2967edb50aadbd6bce571fcdb.png\\\">\nㅇㅇ\n\n\n<video src=\\\"/upload/ba7c5e2ffcf1f089d2b20c7792b3817c.mp3\\\" controls=\\\"controls\\\"></video>\n\n\ndfdfdfdfdf\n<img src=\\\"/upload/f98ba964ec9de86a84343917a377dde4.jpg\\\" alt=\\\"alps_mountains_snow_vertex_110211_4752x3168.jpg\\\">\n\n\n<img src=\\\"/upload/c359ce1c8cae198c83d099420847de80.png\\\" alt=\\\"25176044.png\\\">\n\n\n\n\n\n\n<img src=\\\"/upload/f1f73b8fbd0bf90cf135c2dca4aaa0e1.png\\\" alt=\\\"burn.png\\\">\n\n\n<img src=\\\"/upload/cfcafa2c379856220ab6c81d659af0d9.png\\\" alt=\\\"Big_dipper.png\\\" style=\\\"max-width: 100%;\\\">\n\n\n<img src=\\\"/upload/477a8a7d3de483d2891fac3c91d882d0.png\\\" alt=\\\"burn.png\\\" style=\\\"max-width: 100%;\\\">\n\n',49,21,-9,5,'best','upload','','{\"total\":[]}'),(38,NULL,'admin@daihyun99','daihyun99','2018-10-29 00:58:21',NULL,NULL,'[사진] 메인 사진 변경하기','<div><br></div><div><img src=\\\"http://127.0.0.1/upload/697924dc94de86f7996cfc42cb275de0.jpeg\\\" alt=\\\"일산 호수공원.jpeg\\\" style=\\\"max-width: 100%;\\\"><br></div><div><br></div> ㅇㅇㅇ<br><br><div> <iframe width=\\\"560\\\" height=\\\"315\\\" src=\\\"https://www.youtube.com/embed/D3ZFtSoWtRc\\\" frameborder=\\\"0\\\" allow=\\\"autoplay; encrypted-media\\\" allowfullscreen=\\\"\\\"></iframe></div><br><div>alert(\\\'test\\\');</div>alert(\\\'test\\\');<br><br>![favicon_red.png](/upload/a1c0f2e55f6678a7129718a93b77e0df.png)',43,20,0,0,'best','사진','','{\"total\":[{\"file_name\":\"a1c0f2e55f6678a7129718a93b77e0df.png\",\"file_type\":\"image\\/png\",\"file_path\":null,\"full_path\":null,\"raw_name\":\"a1c0f2e55f6678a7129718a93b77e0df\",\"orig_name\":\"favicon_red.png\",\"client_name\":\"favicon_red.png\",\"file_ext\":\".png\",\"file_size\":2.42,\"is_image\":true,\"image_width\":32,\"image_height\":32,\"image_type\":\"png\",\"image_size_str\":\"width=\\\"32\\\" height=\\\"32\\\"\",\"default_path\":\"\\/upload\\/\",\"datetime\":\"2019-04-15 01:35:06\"}]}'),(64,NULL,'admin@root','root','2019-01-05 12:01:52',NULL,NULL,'[추억] 노량진 푸드코트의 추억','<div style=\\\"text-align:center\\\">돈은 없고 푸짐하게 먹고싶을 때 가서 먹었던 푸드코트.\n\n\n\n\n\n<img src=\\\"http://127.0.0.1/upload/0c0713229354ae0dbb767c21af0f1056.jpg\\\" alt=\\\"노량진 푸드코트_1.jpg\\\" style=\\\"max-width: 100%;\\\">\n\n\n\n\n\n6천원 정도 였었던거 같다.\n\n\n\n\n삼겹살 쌈밥 정식 하.. 저 된장찌개 ㄹㅇ 맛있었는데\n\n\n\n\n\n\n\n<img src=\\\"/upload/59610a07e3bef36b5a849ae419e96dd7.jpg\\\" alt=\\\"노량진 푸드코드_2.jpg\\\" style=\\\"max-width: 100%;\\\">\n\n쌈싸먹으라고 물티슈도 같이 나옴\n\n\n\n손 닦고 쌈쌈~~\n\n\n\n<img src=\\\"/upload/5a00cff1fa2f5cab597e870c0be39d4d.jpg\\\" alt=\\\"노량진 푸드코드_3.jpg\\\" style=\\\"max-width: 100%;\\\">\n\n\n\n\n하 땡기누..\n',22,0,0,2,'food','추억','','{\"total\":[]}'),(82,1,'test01','테스트1','2019-03-07 23:10:58',NULL,NULL,'2019/03/07 테스트','![img](/upload/e9b611b977264709c44a82d91a4a82fc.png)',25,0,0,0,'free','','','{\"total\":[]}'),(84,1,'admin@root','root','2019-03-16 09:17:13',NULL,NULL,'테스트용 공지 최대한 길게 작성해서 CSS 깨지는지 확인해보장','ㅇㅇ\n\nhttps://naver.com',10,0,0,0,'notice','','','{\"total\":[]}'),(89,NULL,'admin@root','root','2019-04-03 02:41:06',NULL,NULL,'공지 테스트','#notice #no_reply<br>\n\n# 테스트',15,0,0,0,'free','','notice|no_reply\\n\\n','{\"total\":[]}'),(96,NULL,'admin@root','root','2019-04-17 23:24:57',NULL,NULL,'테스트 글','<div>오늘 업데이트 내용</div><div><br></div><div>1. 상대방의 정보를 볼 수 있는 Profile 페이지 개선이 이루어졌습니다.</div><div>로그인 한 상태에서만 보이며, 개인정보(ID) 가 나오지 않게 수정했습니다.</div><div><br></div><div>2. Profile 페이지에  cancel 버튼을 없애고, reset 버튼을 추가했습니다.</div><div>또, 메일 변경에 대한 처리 안내를 좀 더 직관적이게 바꿨습니다.</div><div><br></div><div>3. 추천/반대 기능의 버그를 수정했습니다.</div><div>추천 30이 넘으면 BEST 로 넘어가고, FREE 타입은 BEST 로 넘어가지 않습니다.</div><div><br></div><div>=========================================================</div><div><br></div><div>앞으로의 업데이트</div><div><br></div>1. <span style=\\\"text-decoration:line-through\\\">마크다운 에디터 적용</span> => 그냥 view 개선 작업 까지만,, 스크롤 싱크 필요.<div><br></div><div>2. <span style=\\\"text-decoration-line: line-through;\\\">타입별 공지사항</span> => 완료<br></div><div><br></div><div>3. <span style=\\\"font-size: 1rem;\\\">상단 로그인 박스 개선 & 댓글 알림</span></div><div><br></div><div>4. <span style=\\\"font-size: 1rem;\\\">네이버, 카카오 로그인 기능 추가</span></div><div><br></div><div>5. <span style=\\\"font-size: 1rem;\\\">댓글에 GIF 이미지를 넣을 수 있는 GIPHY API 적용</span></div><div><span style=\\\"font-size: 1rem;\\\"><br></span></div><div>=========================================================<br></div><div><br></div><div>올해 목표</div><div><br></div><div>1. 사이트의 완성도를 좀 더 높이고 컨텐츠를 쌓는다. 열심히 놀 예정.</div><div><br></div><div>2. vueJS 학습과 <a href=\\\"//about.rgbplace.com\\\" target=\\\"_blank\\\">about.rgbplace.com</a> 페이지의 완성</div><div><br></div><div>3. 파이썬 학습과 보안 & 테스팅 툴 (Locust) 익히기</div>',6,0,0,1,'free','','',NULL),(97,1,'admin@root','root','2019-04-20 19:13:58',NULL,NULL,'마크다운 테스트','#no_reply\n\n# Intro\nGo ahead, play around with the editor! Be sure to check out **bold** and *italic* styling, or even [links](https://google.com). You can type the Markdown syntax, use the toolbar, or use shortcuts like `cmd-b` or `ctrl-b`.\n\n## Lists\nUnordered lists can be started using the toolbar or by typing `* `, `- `, or `+ `. Ordered lists can be started by typing `1. `.\n\n#### Unordered\n* Lists are a piece of cake\n* They even auto continue as you type\n* A double enter will end them\n* Tabs and shift-tabs work too\n\n#### Ordered\n1. Numbered lists...\n2. ...work too!\n\n## What about images?\n![Yes](https://i.imgur.com/sZlktY7.png)',6,0,0,0,'dev','','no_reply',NULL),(98,1,'admin@root','root','2019-04-28 22:16:08',NULL,NULL,'sn확인','ㅇㅇ',3,0,0,0,'free','','',NULL),(99,1,'test01','테스트1','2019-04-28 22:18:09',NULL,NULL,'알람 테스트','상단 알람 테스트',7,0,0,1,'free','','',NULL),(100,1,'admin@root','root','2019-04-29 23:38:24',NULL,NULL,'개인정보 취급 방침','#notice #no_reply #no_vote\n\n1. 개인정보의 처리 목적 (‘https://rgbplace.com’이하 ‘RGB place’) 은(는) 다음의 목적을 위하여 개인정보를 처리하고 있으며, 다음의 목적 이외의 용도로는 이용하지 않습니다.\n- 고객 가입의사 확인, 고객에 대한 서비스 제공에 따른 본인 식별.인증, 회원자격 유지.관리, 물품 또는 서비스 공급에 따른 금액 결제, 물품 또는 서비스의 공급.배송 등\n\n\n2. 개인정보의 처리 및 보유 기간\n\n ① (‘https://rgbplace.com’이하 ‘RGB place’) 은(는) 정보주체로부터 개인정보를 수집할 때 동의 받은 개인정보 보유․이용기간 또는 법령에 따른 개인정보 보유․이용기간 내에서 개인정보를 처리․보유합니다.\n\n ② 구체적인 개인정보 처리 및 보유 기간은 다음과 같습니다.\n\n ☞ 아래 예시를 참고하여 개인정보 처리업무와 개인정보 처리업무에 대한 보유기간 및 관련 법령, 근거 등을 기재합니다.\n(예시)- 고객 가입 및 관리 : 서비스 이용계약 또는 회원가입 해지시까지, 다만 채권․채무관계 잔존시에는 해당 채권․채무관계 정산시까지\n- 전자상거래에서의 계약․청약철회, 대금결제, 재화 등 공급기록 : 5년\n\n3. 개인정보의 제3자 제공에 관한 사항\n\n ① (\\\'https://rgbplace.com\\\'이하 \\\'RGB place\\\')은(는) 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.\n\n\n4. 개인정보처리 위탁\n\n ① (\\\'RGB place\\\')은(는) 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.\n\n ② (\\\'https://rgbplace.com\\\'이하 \\\'RGB place\\\')은(는) 위탁계약 체결시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.\n\n ③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.\n\n5. 정보주체와 법정대리인의 권리·의무 및 그 행사방법 이용자는 개인정보주체로써 다음과 같은 권리를 행사할 수 있습니다.\n\n ① 정보주체는 RGB place(‘https://rgbplace.com’이하 ‘RGB place) 에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.\n  1. 개인정보 열람요구\n  2. 오류 등이 있을 경우 정정 요구\n  3. 삭제요구\n  4. 처리정지 요구\n\n6. 처리하는 개인정보의 항목 작성 \n\n ① (\\\'https://rgbplace.com\\\'이하 \\\'RGB place\\\')은(는) 다음의 개인정보 항목을 처리하고 있습니다.\n\n \n  - 필수항목 : 이메일, 비밀번호, 로그인ID, 서비스 이용 기록, 접속 로그, 쿠키, 접속 IP 정보\n  - 선택항목 : 이름\n\n7. 개인정보의 파기(\\\'RGB place\\\')은(는) 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및 방법은 다음과 같습니다.\n\n - 파기절차\n \n 이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.\n\n - 파기기한\n \n 이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.\n\n\n\n8. 개인정보 자동 수집 장치의 설치•운영 및 거부에 관한 사항\n\n ① RGB place 은 개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 ‘쿠기(cookie)’를 사용합니다. ② 쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자들의 PC 컴퓨터내의 하드디스크에 저장되기도 합니다. 가. 쿠키의 사용 목적 : 이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기 검색어, 보안접속 여부, 등을 파악하여 이용자에게 최적화된 정보 제공을 위해 사용됩니다. 나. 쿠키의 설치•운영 및 거부 : 웹브라우저 상단의 도구>인터넷 옵션>개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부 할 수 있습니다. 다. 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.\n\n\n9. 개인정보 보호책임자 작성\n\n ① RGB place(‘https://rgbplace.com’이하 ‘RGB place) 은(는) 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.\n\n ▶ 개인정보 보호책임자 <br/>\n 성명 :임대현 <br/>\n 직책 :대표자 <br/>\n 직급 :대표 <br/>\n 연락처 :01044668429, admin@rgbplace.com, <br/>\n ※ 개인정보 보호 담당부서로 연결됩니다.\n\n ▶ 개인정보 보호 담당부서 <br/>\n 부서명 : <br/>\n 담당자 :임대현 <br/>\n 연락처 :01044668429, admin@rgbplace.com,  <br/>\n\n ② 정보주체께서는 RGB place(‘https://rgbplace.com’이하 ‘RGB place) 의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. RGB place(‘https://rgbplace.com’이하 ‘RGB place) 은(는) 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.\n\n\n\n10. 개인정보 처리방침 변경\n\n ① 이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.\n\n\n\n11. 개인정보의 안전성 확보 조치 (\\\'RGB place\\\')은(는) 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.\n\n 1. 정기적인 자체 감사 실시\n개인정보 취급 관련 안정성 확보를 위해 정기적(분기 1회)으로 자체 감사를 실시하고 있습니다.\n\n 2. 내부관리계획의 수립 및 시행\n개인정보의 안전한 처리를 위하여 내부관리계획을 수립하고 시행하고 있습니다.\n\n 3. 해킹 등에 대비한 기술적 대책\n(\\\'RGB place\\\')은 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신·점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고 있습니다.\n\n 4. 접속기록의 보관 및 위변조 방지\n개인정보처리시스템에 접속한 기록을 최소 6개월 이상 보관, 관리하고 있으며, 접속 기록이 위변조 및 도난, 분실되지 않도록 보안기능 사용하고 있습니다.\n\n 5. 개인정보에 대한 접근 제한\n개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.',2,0,0,0,'notice','','notice|no_reply|no_vote',NULL),(101,1,'admin@root','root','2020-01-08 21:56:32',NULL,NULL,'test','<iframe width=\\\"560\\\" height=\\\"315\\\" src=\\\"https://www.youtube.com/embed/tvVG0_0jzjk\\\" frameborder=\\\"0\\\" allow=\\\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\\\" allowfullscreen></iframe>\n\n방패 타기 기술 지림..\n\n본인 <= 25시간 걸렸는데 신수 하나도 못깸 ㅠㅠㅋㅋ',1,0,0,0,'play','','',NULL),(102,1,'admin@root','root','2020-02-24 21:48:00',NULL,NULL,'test','# test\n# test\n## test\n## test\n\ndhkd]\n- test\n- test\n- test\ntest\nd\n\nd\n\n\nd\n\n\nd\n\nd\nd\nd',1,0,0,0,'best','','',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=325 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_space_reply`
--

LOCK TABLES `map_space_reply` WRITE;
/*!40000 ALTER TABLE `map_space_reply` DISABLE KEYS */;
INSERT INTO `map_space_reply` VALUES (21,NULL,'admin@daihyun99','daihyun99','2018-08-29 01:17:12',NULL,NULL,'테스트 첫 댓글',0,0,13,'',NULL,0,8,0,0,0,0,0,0,0,0,0),(22,NULL,'admin@daihyun99','daihyun99','2018-08-29 01:28:12',NULL,NULL,'테스트 첫 대댓글',0,0,13,'daihyun99',21,21,8,1,0,0,0,0,0,0,0,0),(23,NULL,'admin@daihyun99','daihyun99','2018-09-05 22:42:54',NULL,NULL,'댓글 수정1',0,0,27,'',NULL,0,9,0,0,0,0,0,0,0,0,0),(73,NULL,'admin@daihyun99','daihyun99','2018-09-25 17:30:19',NULL,NULL,'|￣￣￣￣￣￣￣￣￣￣|\\n| 저어어어어어어어장 \\n|＿＿＿＿＿＿＿＿＿＿|   \\n / )__/ )  || \\n(•ㅅ•)  || \\n/. . . . . . づ',90,40,30,'',NULL,0,15,0,0,0,0,0,0,0,0,0),(79,NULL,'admin@daihyun99','daihyun99','2018-09-25 17:42:30',NULL,NULL,'|￣￣￣￣￣￣￣￣￣￣|\n| 저어어어어어어어장 \n|＿＿＿＿＿＿＿＿＿＿|   \n / )__/ )  || \n(•ㅅ•)  || \n/. . . . . . づ',0,0,30,'',NULL,0,20,0,0,0,0,0,0,0,0,0),(80,NULL,'admin@daihyun99','daihyun99','2018-09-25 17:43:19',NULL,NULL,'ʕ っ•ᴥ•`ʔづ ⌒ ㅊㅊ',0,0,30,'',NULL,0,21,0,0,0,0,0,0,0,0,0),(81,NULL,'admin@daihyun99','daihyun99','2018-09-25 17:44:05',NULL,NULL,'ㅡㅡヽ、_ノㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅤ\nㅤㅤㅤ \\\'ｰ \\\' \nㅤㅤㅤㅤㅤＯ\nㅤㅤㅤㅤㅤㅤo\nㅤㅤㅤㅤㅤㅤ 。 ,.-ｰ冖\\\'⌒\\\'ｰ-､\nㅤㅤㅤㅤㅤㅤㅤ ,ノ ㅤㅤㅤㅤㅤㅤ＼\nㅤㅤㅤㅤㅤㅤㅤ/ㅤ,r‐へへく⌒\\\'￢ㅤ､ ヽ\nㅤㅤㅤㅤㅤㅤㅤ{ノ へ.._、 ,,／~`ㅤ〉｝ㅤㅤㅤ\nㅤㅤㅤㅤㅤㅤ／プ￣`y\\\'¨Y´￣ヽ-}j=くㅤㅤㅤ\nㅤㅤㅤㅤㅤノ/レ\\\'&gt;-〈＿ｭ`ー‐\\\'ㅤㅤﾘ,ｲ} ㅤㅤ\nㅤㅤㅤㅤ/_勺 ｲ;；∵r;==､､∴\\\'∵;ㅤシ ㅤㅤ\nㅤㅤㅤ /└\\\' ノ ＼ ㅤㅤこ¨｀ ㅤㅤノ\nㅤㅤㅤ人＿_/ー┬ 个-､＿_,,.. ‐\\\'´ 〃`ァーｧー＼\nㅤ ㅤ/|／ ㅤ|::::::|､ㅤㅤㅤㅤㅤㅤㅤ〃/:::::/ ヽ\nㅤ /｜ ㅤㅤ|::::::|＼､_________／ /:::::/',0,0,30,'',NULL,0,22,0,0,0,0,0,0,0,0,0),(85,NULL,'admin@daihyun99','daihyun99','2018-09-29 18:54:33',NULL,NULL,'test',0,0,13,'daihyun99',21,22,8,1,1,0,0,0,0,0,0,0),(176,NULL,'test01','테스트','2019-01-13 09:42:20',NULL,NULL,'지리구연',0,0,64,'',NULL,0,57,0,0,0,0,0,0,0,0,0),(268,1,'admin@root','root','2019-02-25 22:45:31',NULL,NULL,'테스트 \\nhttp://naver.com\\nhttp://naver.com',0,0,64,'',NULL,0,42,0,0,0,0,0,0,0,0,0),(273,1,'admin@root','root','2019-03-28 20:49:49',NULL,NULL,'http://naver.com ㅇㅇ',0,0,30,'',NULL,0,9,0,0,0,0,0,0,0,0,0),(320,1,'admin@root','root','2019-04-21 22:00:50',NULL,NULL,'구로디지털단지 근처 맵 생성했습니다. ( map search 박스에 \\\'구로\\\' 검색 )\\nhttps://rgbplace.com/kr1',0,0,96,'',NULL,0,1,0,0,0,0,0,0,0,0,0),(321,1,'admin@root','root','2019-05-02 21:16:09',NULL,NULL,'ㅇㅇ',0,0,99,'',NULL,0,1,0,0,0,0,0,0,0,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `total_post`
--

LOCK TABLES `total_post` WRITE;
/*!40000 ALTER TABLE `total_post` DISABLE KEYS */;
INSERT INTO `total_post` VALUES (1,NULL,'admin','root',64,'space','[추억] 노량진 푸드코트의 추억','2019-01-26 18:17:28'),(3,NULL,'admin','root',66,'space','테스트','2019-01-09 00:29:15'),(4,NULL,'test01','테스트',67,'space','test','2019-01-09 01:04:36'),(6,NULL,'test01','테스트',69,'space','test','2019-01-09 01:17:54'),(7,NULL,'admin','root',70,'space','test','2019-01-09 01:18:27'),(8,NULL,'test02','test02',70,'space','test','2019-01-15 19:27:40'),(9,NULL,'test02','test02',70,'space','test1','2019-01-15 19:30:04'),(10,NULL,'test02','test02',70,'space','test2','2019-01-15 19:30:04'),(11,NULL,'test02','test02',70,'space','test3','2019-01-15 19:30:04'),(12,NULL,'test02','test02',70,'space','test4','2019-01-15 19:30:04'),(13,NULL,'test02','test02',70,'space','test5','2019-01-15 19:30:04'),(14,NULL,'test02','test02',70,'space','test6','2019-01-15 19:30:04'),(15,NULL,'test02','test02',70,'space','test7','2019-01-15 19:30:04'),(16,NULL,'test02','test02',70,'space','test8','2019-01-15 19:30:04'),(17,NULL,'test02','test02',70,'space','test9','2019-01-15 19:30:04'),(18,NULL,'test02','test02',70,'space','test10','2019-01-15 19:30:04'),(19,NULL,'test02','test02',70,'space','test11','2019-01-15 19:30:04'),(20,NULL,'test02','test02',70,'space','test12','2019-01-15 19:30:04'),(21,NULL,'test02','test02',70,'space','test13','2019-01-15 19:30:04'),(22,NULL,'test02','test02',70,'space','test14','2019-01-15 19:30:04'),(23,NULL,'test02','test02',70,'space','test15','2019-01-15 19:30:04'),(24,NULL,'test02','test02',70,'space','test16','2019-01-15 19:30:04'),(25,NULL,'test02','test02',70,'space','test17','2019-01-15 19:30:04'),(26,NULL,'test02','test02',70,'space','test18','2019-01-15 19:30:04'),(27,NULL,'test02','test02',70,'space','test19','2019-01-15 19:30:04'),(28,NULL,'test02','test02',70,'space','test20','2019-01-15 19:30:04'),(29,NULL,'test02','test02',70,'space','test21','2019-01-15 19:30:04'),(30,NULL,'test02','test02',70,'space','test22','2019-01-15 19:30:04'),(31,NULL,'test02','test02',70,'space','test23','2019-01-15 19:30:04'),(32,NULL,'test02','test02',70,'space','test24','2019-01-15 19:30:04'),(33,NULL,'test02','test02',70,'space','test25','2019-01-15 19:30:04'),(34,NULL,'test02','test02',70,'space','test26','2019-01-15 19:30:04'),(35,NULL,'test02','test02',70,'space','test27','2019-01-15 19:30:04'),(36,NULL,'test02','test02',70,'space','test28','2019-01-15 19:30:04'),(37,NULL,'test02','test02',70,'space','test29','2019-01-15 19:30:04'),(38,NULL,'test02','test02',70,'space','test30','2019-01-15 19:30:04'),(39,NULL,'test02','test02',70,'space','test31','2019-01-15 19:30:04'),(40,NULL,'test02','test02',70,'space','test32','2019-01-15 19:30:04'),(41,NULL,'test02','test02',70,'space','test33','2019-01-15 19:30:04'),(42,NULL,'test02','test02',70,'space','test34','2019-01-15 19:30:04'),(43,NULL,'test02','test02',70,'space','test35','2019-01-15 19:30:04'),(44,NULL,'test02','test02',70,'space','test36','2019-01-15 19:30:04'),(45,NULL,'test02','test02',70,'space','test37','2019-01-15 19:30:04'),(46,NULL,'test02','test02',70,'space','test38','2019-01-15 19:30:04'),(47,NULL,'test02','test02',70,'space','test39','2019-01-15 19:30:04'),(48,NULL,'test02','test02',70,'space','test40','2019-01-15 19:30:04'),(49,NULL,'test02','test02',70,'space','test41','2019-01-15 19:30:04'),(50,NULL,'test02','test02',70,'space','test42','2019-01-15 19:30:04'),(51,NULL,'test02','test02',70,'space','test43','2019-01-15 19:30:04'),(52,NULL,'test02','test02',70,'space','test44','2019-01-15 19:30:04'),(53,NULL,'test02','test02',70,'space','test45','2019-01-15 19:30:04'),(54,NULL,'test02','test02',70,'space','test46','2019-01-15 19:30:04'),(55,NULL,'test02','test02',70,'space','test47','2019-01-15 19:30:04'),(56,NULL,'test02','test02',70,'space','test48','2019-01-15 19:30:04'),(57,NULL,'test02','test02',70,'space','test49','2019-01-15 19:30:04'),(58,NULL,'test02','test02',70,'space','test50','2019-01-15 19:30:04'),(59,NULL,'test02','test02',70,'space','test51','2019-01-15 19:30:04'),(60,NULL,'test02','test02',70,'space','test52','2019-01-15 19:30:04'),(61,NULL,'test02','test02',70,'space','test53','2019-01-15 19:30:04'),(62,NULL,'test02','test02',70,'space','test54','2019-01-15 19:30:04'),(63,NULL,'test02','test02',70,'space','test55','2019-01-15 19:30:04'),(64,NULL,'test02','test02',70,'space','test56','2019-01-15 19:30:04'),(65,NULL,'test02','test02',70,'space','test57','2019-01-15 19:30:04'),(66,NULL,'test02','test02',70,'space','test58','2019-01-15 19:30:04'),(67,NULL,'test02','test02',70,'space','test59','2019-01-15 19:30:04'),(68,NULL,'test02','test02',70,'space','test60','2019-01-15 19:30:04'),(69,NULL,'admin','root',71,'space','테스트','2019-01-27 12:09:48'),(70,NULL,'admin','root',72,'space','테스트','2019-01-27 12:15:15'),(71,NULL,'admin','root',73,'space','테스트','2019-01-27 12:15:36'),(76,1,'admin','root',1,'kr1','ㅇㅇ','2019-02-02 15:39:57'),(77,1,'admin','root',1,'kr2','읭','2019-02-02 15:48:51'),(82,1,'test01','테스트1',82,'space','2019/03/07 테스트','2019-03-29 12:49:31'),(84,1,'admin','root',84,'space','테스트용 공지 최대한 길게 작성해서 CSS 깨지는지 확인해보장','2019-04-26 01:37:54'),(86,1,'admin','root',86,'space','test','2019-04-02 02:14:31'),(87,1,'admin','root',87,'space','test','2019-04-03 01:23:32'),(88,1,'admin','root',88,'space','test','2019-04-03 02:05:52'),(89,1,'admin','root',89,'space','마크다운 최종 테스트','2019-04-03 02:41:06'),(90,1,'admin','root',90,'space','dsasdf','2019-04-06 18:43:21'),(91,1,'admin','root',91,'space','dd','2019-04-06 19:48:56'),(92,1,'admin','root',92,'space','테스트','2019-04-09 00:35:14'),(93,1,'admin','root',93,'space','div 테스트','2019-04-09 02:10:52'),(94,1,'admin','root',94,'space','Promise 설명','2019-04-17 22:19:03'),(95,1,'admin','root',95,'space','엑셀로 변환해서 다운로드','2019-04-17 22:33:46'),(96,1,'admin','root',96,'space','테스트 글싸기','2019-04-17 23:24:57'),(97,1,'admin','root',97,'space','마크다운 테스트','2020-02-27 01:36:59'),(98,1,'admin','root',98,'space','sn확인','2019-04-28 22:16:08'),(99,1,'test01','테스트1',99,'space','알람 테스트','2019-05-02 21:16:05'),(100,1,'admin','root',100,'space','개인정보 취급 방침','2019-04-30 00:36:57'),(101,1,'admin','root',101,'space','test','2020-01-08 21:56:32'),(102,1,'admin','root',102,'space','test','2020-02-24 12:54:36');
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
) ENGINE=InnoDB AUTO_INCREMENT=340 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `total_reply`
--

LOCK TABLES `total_reply` WRITE;
/*!40000 ALTER TABLE `total_reply` DISABLE KEYS */;
INSERT INTO `total_reply` VALUES (9,NULL,'test01','테스트',64,176,'space','지리구연','2019-01-26 19:03:18'),(10,NULL,'admin','root',64,177,'space','오지구연','2019-01-15 01:50:24'),(40,NULL,'admin','root',64,207,'space','test1<br/>1test','2019-01-24 21:41:50'),(41,NULL,'admin','root',64,208,'space','test\\\\ntest','2019-01-24 21:53:51'),(42,NULL,'admin','root',64,209,'space','test\\ntest\\ntest','2019-01-24 21:54:14'),(43,NULL,'admin','root',64,210,'space','test\\\\ntest','2019-01-24 21:55:42'),(44,NULL,'admin','root',64,211,'space','구로디지털단지 근처 맵 생성했습니다. 많은 이용 부탁드립니다. (어차피 볼 사람 없겠지?ㅎㅎ)\\nhttps://rgbplace.com/kr1/1','2019-01-24 22:17:46'),(45,NULL,'admin','root',64,212,'space','<script>alert(\\\'test\\\')</script>','2019-01-24 22:20:14'),(46,NULL,'admin','root',64,213,'space','&lt;script&gt;alert(\\\'test\\\')\\n&lt;/script&gt;','2019-01-24 22:21:44'),(47,NULL,'admin','root',64,214,'space','<script>alert(\\\'test\\\');\\n</script>','2019-01-24 22:26:24'),(49,NULL,'admin','root',64,216,'space','t\\ne\\ns\\nt','2019-01-26 19:20:30'),(50,NULL,'admin','root',64,217,'space','t\\ne\\ns\\nt','2019-01-26 19:20:56'),(57,NULL,'admin','root',64,224,'space','대댓글 삭제 테스트','2019-01-27 09:36:04'),(58,NULL,'admin','root',64,225,'space','대댓글 삭제 테스트','2019-01-27 09:36:11'),(59,NULL,'admin','root',64,226,'space','대댓글 삭제 테스트','2019-01-27 09:36:18'),(248,NULL,'admin','root',64,227,'space','test','2019-01-27 10:53:18'),(264,NULL,'delete_me','삭제고고',64,252,'space','삭제해보삼','2019-02-01 20:58:22'),(265,NULL,'delete_me','삭제용',64,253,'space','삭제 고고','2019-02-01 21:01:36'),(283,1,'admin','root',64,268,'space','테스트 \\nhttp://naver.com\\nhttp://naver.com','2019-04-18 00:06:20'),(288,1,'admin','root',30,273,'space','http://naver.com ㅇㅇ','2019-03-28 20:53:08'),(335,1,'admin','root',96,320,'space','구로디지털단지 근처 맵 생성했습니다. ( map search 박스에 \\\'구로\\\' 검색 )\\nhttps://rgbplace.com/kr1','2019-04-21 22:00:50'),(336,1,'admin','root',99,321,'space','ㅇㅇ','2019-05-02 21:16:09');
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
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `total_upload`
--

LOCK TABLES `total_upload` WRITE;
/*!40000 ALTER TABLE `total_upload` DISABLE KEYS */;
INSERT INTO `total_upload` VALUES (3,1,'admin','root','노량진 푸드코드_2.jpg','59610a07e3bef36b5a849ae419e96dd7.jpg','image/jpeg',328,'2019-01-05 11:59:22'),(4,1,'admin','root','노량진 푸드코드_3.jpg','5a00cff1fa2f5cab597e870c0be39d4d.jpg','image/jpeg',332,'2019-01-05 11:59:22'),(5,1,'admin','root','노량진 푸드코트_1.jpg','0c0713229354ae0dbb767c21af0f1056.jpg','image/jpeg',380,'2019-01-05 11:59:22'),(34,1,'admin','root','블루파프리카.png','49fc028bbc5a12d78f589c8d4be65f3a.png','image/png',43.66,'2019-02-28 22:10:25'),(45,1,'admin','root','6lueparr0t.png','7a03169337243da0f05c8af0e7b67429.png','image/png',42.01,'2019-03-03 18:24:37'),(46,1,'test01','테스트1','6lueparr0t.png','9f64d2a541d18eda57cae284ce6ddb45.png','image/png',42.01,'2019-03-07 23:09:05'),(47,1,'test01','테스트1','6lueparr0t.png','2bb48a598eb7411f8ee4ceb4570642fe.png','image/png',42.01,'2019-03-07 23:09:27'),(48,1,'test01','테스트1','6lueparr0t.png','e9b611b977264709c44a82d91a4a82fc.png','image/png',42.01,'2019-03-07 23:10:02'),(50,1,'admin','root','난강하니까.jpeg','68fb83a796ee0a0a70fa38e49f80c77f.jpeg','image/jpeg',179,'2019-03-16 18:38:41'),(51,1,'admin','root','난강하니까.jpeg','9dc9b398d70414ec2fc24e17762e479c.jpeg','image/jpeg',179,'2019-03-16 19:05:26'),(52,1,'admin','root','난강하니까.jpeg','0abc05eea51ccaa380b056422541928a.jpeg','image/jpeg',179,'2019-03-16 19:07:10'),(53,1,'admin','root','카페.png','e0234d87215429ef328be9c3a38f338b.png','image/png',1064.17,'2019-03-21 20:07:16'),(54,1,'admin','root','카페.png','8be1f1a7984471224e8d078852c7ab86.png','image/png',1064.17,'2019-03-21 20:08:24'),(55,1,'admin','root','6lueparr0t.png','806350d6d6ebd8ab5e6fdf56c9fc1c63.png','image/png',42.01,'2019-04-02 01:50:54'),(56,1,'admin','root','난강하니까.jpeg','bed441c1c877deafc3b498c071f5bb67.jpeg','image/jpeg',179,'2019-04-02 01:50:54'),(57,1,'admin','root','6lueparr0t.png','7baada745ee0158b04352cdec0fa850e.png','image/png',42.01,'2019-04-02 01:52:18'),(58,1,'admin','root','난강하니까.jpeg','7eb3e08a4795f9911824924f4ff4f605.jpeg','image/jpeg',179,'2019-04-02 01:52:18'),(65,1,'admin','root','6lueparr0t.png','15b9d69a9c886ddb460cfe536cecd02a.png','image/png',42.01,'2019-04-02 01:59:38'),(66,1,'admin','root','난강하니까.jpeg','c17a6f9c9d8957a6ece7b1574ebef5d8.jpeg','image/jpeg',179,'2019-04-02 01:59:38'),(69,1,'admin','root','6lueparr0t.png','e7f665dfa1e678a953c6775a6058dd93.png','image/png',42.01,'2019-04-02 02:00:40'),(70,1,'admin','root','난강하니까.jpeg','0f6efad66d3e1d31c83b25e3b80bc76b.jpeg','image/jpeg',179,'2019-04-02 02:00:40'),(71,1,'admin','root','6lueparr0t.png','1fba328194a5cc03ba698025f72438fd.png','image/png',42.01,'2019-04-02 02:03:22'),(72,1,'admin','root','6lueparr0t.png','0726792178d4efc3eb01989165c986a3.png','image/png',42.01,'2019-04-02 02:04:09'),(93,1,'admin','root','6lueparr0t.png','da33a984e33429c6a14013f777cbd1f8.png','image/png',42.01,'2019-04-02 02:14:28'),(94,1,'admin','root','난강하니까.jpeg','051dd4571301a89e9f87ced0c660d409.jpeg','image/jpeg',179,'2019-04-02 02:14:28'),(109,1,'admin','root','일산 호수공원.jpeg','db4187a452198c1680dec55307512a3d.jpeg','image/jpeg',775.36,'2019-04-02 23:30:10'),(112,1,'admin','root','burn.png','e3451b34c69e8dbf11971212281a252e.png','image/png',19.55,'2019-04-02 23:42:51'),(114,1,'admin','root','burn.png','d55df2612848c084d6daa0eb314badb9.png','image/png',19.55,'2019-04-02 23:50:25'),(127,1,'admin','root','burn.png','7c1ac634b8baa94b7d847ae0bf622e2a.png','image/png',19.55,'2019-04-08 23:33:17'),(130,1,'admin','root','burn.png','738b77a1094acff204686d180642df5a.png','image/png',19.55,'2019-04-08 23:41:02'),(133,1,'admin','root','burn.png','c4e191ce0e052ec5d4a2c64c055b8bba.png','image/png',19.55,'2019-04-08 23:47:40'),(135,1,'admin','root','burn.png','aefd9abce151124f838d1f0c30087272.png','image/png',19.55,'2019-04-08 23:50:05'),(136,1,'admin','root','burn.png','1438bdeadfb34c46ba54a9c4dda707ad.png','image/png',19.55,'2019-04-08 23:51:01'),(137,1,'admin','root','burn.png','24034b4456b7a6e93c547b96da4429a1.png','image/png',19.55,'2019-04-08 23:51:29'),(138,1,'admin','root','burn.png','e8b72de725ae0552ce5ccca1a2b10f32.png','image/png',19.55,'2019-04-08 23:54:00'),(140,1,'admin','root','burn.png','bbdef7d2d31bf78d8ede78567f09c13d.png','image/png',19.55,'2019-04-08 23:57:40'),(141,1,'admin','root','burn.png','68687a53bce6c2c15ca3b2969166d902.png','image/png',19.55,'2019-04-08 23:58:16'),(143,1,'admin','root','burn.png','224ae7d41f6a8a3917f52a8fa16a6037.png','image/png',19.55,'2019-04-09 00:16:45'),(148,1,'admin','root','burn.png','506ce2957e7e58c533374dbc25ce4c2a.png','image/png',19.55,'2019-04-09 00:18:19'),(153,1,'admin','root','favicon_red.png','bc895a0cda96c2f8d7f5e209016a783b.png','image/png',2.42,'2019-04-15 01:08:02'),(154,1,'admin','root','favicon_red.png','f5983d67393f12c42f91d774d97efaeb.png','image/png',2.42,'2019-04-15 01:09:26'),(158,1,'admin','root','favicon_red.png','a1c0f2e55f6678a7129718a93b77e0df.png','image/png',2.42,'2019-04-15 01:35:06'),(160,1,'admin','root','6lueparr0t.png','0ac75b60b033b2ec584f0860dd825694.png','image/png',42.01,'2019-04-20 19:06:48'),(161,1,'admin','root','6lueparr0t.png','8b91ee148f3e293e257164ebb3e42201.png','image/png',42.01,'2019-04-20 19:07:47');
/*!40000 ALTER TABLE `total_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_conf`
--

DROP TABLE IF EXISTS `user_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_conf` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dark_sw` tinyint(1) NOT NULL DEFAULT 0,
  `map_sw` tinyint(1) NOT NULL DEFAULT 0,
  `notice_sw` tinyint(1) NOT NULL DEFAULT 0,
  `sound_sw` tinyint(1) NOT NULL DEFAULT 0,
  `tag_sw` tinyint(1) NOT NULL DEFAULT 0,
  `tag` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='유저 계정 설정';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_conf`
--

LOCK TABLES `user_conf` WRITE;
/*!40000 ALTER TABLE `user_conf` DISABLE KEYS */;
INSERT INTO `user_conf` VALUES (1,'6lueparr0t@gmail.com',0,0,0,0,0,NULL),(2,'test01',1,0,0,0,0,NULL),(3,'test02',0,0,0,0,0,NULL),(4,'test03',0,0,0,0,0,NULL),(5,'1072750866',0,0,0,0,0,NULL),(6,'1072766106',0,0,0,0,0,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='유저 계정 정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES (1,'test01','테스트1','6lueparr0t@gmail.com','JDJ5JDEyJFIyejdJT2lZUlQuNy9YSVJkL01BWHVRUkNSU0t2THBPcWttMXNTcXJhdHVNTU9sZ2c5bEpt',1,21,'kr2',0,'2017-02-16 18:53:33','2019-04-28 22:17:59','2019-04-11 23:22:09',NULL,'{\"total\": [{\"type\": \"reply\", \"map\": \"space\", \"post\": \"17\", \"reply\": \"267\", \"content\": \"대댓글 삭제 테스트2\", \"date\": \"2019-02-06 11:15:42\"}]}',''),(2,'test02','test02',NULL,'JDJ5JDEyJFBxTHdWQlJEZ3dmV3RIeU1MLzdpby5iWE5yaWRQTUNUSG5Rc3o3QkUwZ2oxenY4OG9NTDZX',1,0,NULL,0,'2019-01-08 22:44:49','2019-02-01 19:04:14',NULL,NULL,'{\"total\":[]}',''),(13,'6lueparr0t@gmail.com','잇힝','6lueparr0t2@gmail.com','google',1,0,NULL,0,'2019-02-08 11:11:35','2019-05-04 12:26:31','2019-02-08 11:45:15',NULL,'{\"total\":[]}',''),(14,'test03','메일인증테스트','daihyun99@gmail.com','JDJ5JDEyJGV0eTl0UzVXUmdwQ2xOWnBwM2xqbk85ZDlzeUNsM2FMb1RybEdSM0k0SW1VREl1OHBZLm82',1,0,NULL,0,'2019-03-02 22:02:57','2019-03-02 22:03:07',NULL,NULL,'{\"total\":[]}',''),(16,'1072750866','대현',NULL,'kakao',1,0,NULL,0,'2019-04-27 14:02:45','2019-04-27 14:04:54','2019-04-27 14:05:12',NULL,'{\"total\":[]}',''),(17,'1072766106','대현',NULL,'kakao',1,0,NULL,0,'2019-04-27 14:41:05',NULL,NULL,NULL,'{\"total\":[]}','');
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
INSERT INTO `user_session` VALUES ('05fqjm3l6l9qlgbd72s19539dlhj5jnp','127.0.0.1',1579015917,'__ci_last_regenerate|i:1579015664;map|s:5:\"space\";map_detail|s:0:\"\";http_referer|s:22:\"http://127.0.0.1/space\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;post_uid|s:15:\"admin@daihyun99\";view|a:2:{s:8:\"space_38\";b:1;s:8:\"space_30\";b:1;}__ci_vars|a:1:{s:4:\"view\";i:1579102174;}'),('0984cev7nf0o302svjnnoh943vicooeb','127.0.0.1',1584451819,'__ci_last_regenerate|i:1584451813;map|s:5:\"admin\";map_detail|s:0:\"\";http_referer|s:22:\"http://127.0.0.1/space\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('09ki4doh005vt5c5mhv0fbhs6prt098g','127.0.0.1',1579015045,'__ci_last_regenerate|i:1579015045;map|s:5:\"space\";map_detail|s:0:\"\";'),('2ml690skqb23sm35losef4etnkhoi1rs','127.0.0.1',1579015346,'__ci_last_regenerate|i:1579015346;map|s:5:\"space\";map_detail|s:0:\"\";http_referer|s:22:\"http://127.0.0.1/space\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('70jq9pincne16gr42gmon4onrq1ekdka','127.0.0.1',1579083378,'__ci_last_regenerate|i:1579083378;map|s:5:\"space\";map_detail|s:0:\"\";'),('7r6h7qc62iung3h1a0fp8uho5shp3v65','127.0.0.1',1579083378,'__ci_last_regenerate|i:1579083378;map|s:5:\"space\";map_detail|s:0:\"\";'),('8frst7tgbisu2mq4ctchm247acbrltsh','127.0.0.1',1582548970,'__ci_last_regenerate|i:1582548743;map|s:5:\"space\";map_detail|s:0:\"\";post_uid|s:10:\"admin@root\";view|a:3:{s:8:\"space_30\";b:1;s:8:\"space_38\";b:1;s:9:\"space_102\";b:1;}__ci_vars|a:1:{s:4:\"view\";i:1582634881;}http_referer|s:30:\"http://127.0.0.1/space/best/38\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;mode|s:3:\"put\";upload|N;'),('a4uq7f625gopl2mncld3hftlcgdf6a9h','127.0.0.1',1578489359,'__ci_last_regenerate|i:1578489140;map|s:5:\"space\";map_detail|s:0:\"\";http_referer|s:22:\"http://127.0.0.1/space\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;post_uid|s:10:\"admin@root\";view|a:4:{s:9:\"space_101\";b:1;s:8:\"space_38\";b:1;s:7:\"space_9\";b:1;s:8:\"space_64\";b:1;}__ci_vars|a:1:{s:4:\"view\";i:1578574745;}'),('a98m6tg1ugi9qjd361r079vt5dl4md00','127.0.0.1',1579076851,'__ci_last_regenerate|i:1579076851;map|s:5:\"space\";map_detail|s:0:\"\";'),('dkedtb775utq4709dm12r2dggqom5a9c','127.0.0.1',1582109088,'__ci_last_regenerate|i:1582109088;map|s:5:\"space\";map_detail|s:0:\"\";http_referer|s:22:\"http://127.0.0.1/space\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;mode|s:4:\"post\";post_uid|s:6:\"test01\";view|a:7:{s:8:\"space_82\";b:1;s:8:\"space_99\";b:1;s:8:\"space_98\";b:1;s:8:\"space_96\";b:1;s:8:\"space_38\";b:1;s:8:\"space_30\";b:1;s:7:\"space_8\";b:1;}__ci_vars|a:1:{s:4:\"view\";i:1582194736;}'),('dpp791eqb6u8pag5h7cium5khr8ngt3h','127.0.0.1',1582767684,'__ci_last_regenerate|i:1582767394;map|s:5:\"space\";map_detail|s:0:\"\";http_referer|s:22:\"http://127.0.0.1/space\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;post_uid|s:10:\"admin@root\";view|a:1:{s:8:\"space_97\";b:1;}__ci_vars|a:1:{s:4:\"view\";i:1582853803;}'),('fac8l4bn2s2ahtvbiaa0lvokrjqbta46','127.0.0.1',1579015664,'__ci_last_regenerate|i:1579015664;map|s:4:\"sign\";map_detail|s:0:\"\";http_referer|s:22:\"http://127.0.0.1/space\";'),('hlqe2mnvb30ft8ngm3cff9t2a96n56e3','127.0.0.1',1577871198,'__ci_last_regenerate|i:1577871198;map|s:7:\"profile\";map_detail|s:0:\"\";http_referer|s:22:\"http://127.0.0.1/space\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('ioikob8sc6ajuudb734p6mo0mp7qf0hh','127.0.0.1',1579078999,'__ci_last_regenerate|i:1579078999;map|s:5:\"space\";map_detail|s:0:\"\";http_referer|s:22:\"http://127.0.0.1/space\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('islmlj2sl20808lnsupnumc71fosnv0q','127.0.0.1',1578489140,'__ci_last_regenerate|i:1578489140;map|s:5:\"space\";map_detail|s:0:\"\";http_referer|s:22:\"http://127.0.0.1/space\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;post_uid|s:10:\"admin@root\";view|a:4:{s:9:\"space_101\";b:1;s:8:\"space_38\";b:1;s:7:\"space_9\";b:1;s:8:\"space_64\";b:1;}__ci_vars|a:1:{s:4:\"view\";i:1578574745;}'),('jmv3sr2sdq6lcva0phdbq7bsgsnfjief','127.0.0.1',1578805553,'__ci_last_regenerate|i:1578805545;map|s:5:\"space\";map_detail|s:0:\"\";'),('k8s4otef20og8j8jtccgr6hr3ah8tpbf','127.0.0.1',1582108329,'__ci_last_regenerate|i:1582108329;map|s:5:\"space\";map_detail|s:0:\"\";http_referer|s:22:\"http://127.0.0.1/space\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;mode|s:4:\"post\";post_uid|s:15:\"admin@daihyun99\";view|a:5:{s:8:\"space_82\";b:1;s:8:\"space_99\";b:1;s:8:\"space_98\";b:1;s:8:\"space_96\";b:1;s:8:\"space_38\";b:1;}__ci_vars|a:1:{s:4:\"view\";i:1582194721;}'),('l16fpc93hce9sm70nlvseqju6ndmluof','127.0.0.1',1582108708,'__ci_last_regenerate|i:1582108708;map|s:5:\"space\";map_detail|s:0:\"\";http_referer|s:22:\"http://127.0.0.1/space\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;mode|s:4:\"post\";post_uid|s:6:\"test01\";view|a:7:{s:8:\"space_82\";b:1;s:8:\"space_99\";b:1;s:8:\"space_98\";b:1;s:8:\"space_96\";b:1;s:8:\"space_38\";b:1;s:8:\"space_30\";b:1;s:7:\"space_8\";b:1;}__ci_vars|a:1:{s:4:\"view\";i:1582194736;}'),('lmtavfmgg9cj3jf5sns0t1r0i7nm5bf2','127.0.0.1',1577959981,'__ci_last_regenerate|i:1577959980;map|s:5:\"space\";map_detail|s:0:\"\";'),('m42bfllvv7tugh9aukbgralm8q2j7lvs','127.0.0.1',1579079074,'__ci_last_regenerate|i:1579078999;map|s:5:\"space\";map_detail|s:0:\"\";http_referer|s:22:\"http://127.0.0.1/space\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;post_uid|s:15:\"admin@daihyun99\";view|a:1:{s:8:\"space_38\";b:1;}__ci_vars|a:1:{s:4:\"view\";i:1579165474;}'),('mh9pa8edklsaaccjs9ambojue07ga8vs','127.0.0.1',1584451813,'__ci_last_regenerate|i:1584451813;map|s:5:\"admin\";map_detail|s:0:\"\";http_referer|s:22:\"http://127.0.0.1/space\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('n1unvvpje2hh3vlv7tq81k1gkf8ivtqk','127.0.0.1',1577872799,'__ci_last_regenerate|i:1577872759;map|s:5:\"space\";map_detail|s:0:\"\";http_referer|s:32:\"http://127.0.0.1/space/notice/84\";post_uid|s:10:\"admin@root\";view|a:1:{s:8:\"space_84\";b:1;}__ci_vars|a:1:{s:4:\"view\";i:1577958007;}admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;stage|s:5:\"space\";'),('o68qr9uofmr4uqfhfjbe7e5rbih0bfta','127.0.0.1',1577872029,'__ci_last_regenerate|i:1577872029;map|s:5:\"space\";map_detail|s:0:\"\";http_referer|s:32:\"http://127.0.0.1/space/notice/84\";post_uid|s:10:\"admin@root\";view|a:1:{s:8:\"space_84\";b:1;}__ci_vars|a:1:{s:4:\"view\";i:1577958007;}admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('oano1ipcmhk4m43dhre044fjj8ma2im1','127.0.0.1',1578488345,'__ci_last_regenerate|i:1578488345;map|s:5:\"space\";map_detail|s:0:\"\";http_referer|s:22:\"http://127.0.0.1/space\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;post_uid|s:10:\"admin@root\";view|a:4:{s:9:\"space_101\";b:1;s:8:\"space_38\";b:1;s:7:\"space_9\";b:1;s:8:\"space_64\";b:1;}__ci_vars|a:1:{s:4:\"view\";i:1578574745;}'),('q3076e15gv265k27shdl27tdi6kbfidu','127.0.0.1',1577872340,'__ci_last_regenerate|i:1577872340;map|s:5:\"space\";map_detail|s:0:\"\";http_referer|s:32:\"http://127.0.0.1/space/notice/84\";post_uid|s:10:\"admin@root\";view|a:1:{s:8:\"space_84\";b:1;}__ci_vars|a:1:{s:4:\"view\";i:1577958007;}admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('rsrcljgl9uaitsgoj3217td5ha33e3mc','127.0.0.1',1577871538,'__ci_last_regenerate|i:1577871538;map|s:7:\"profile\";map_detail|s:0:\"\";http_referer|s:22:\"http://127.0.0.1/space\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;'),('s1b79puk13j0hppl63k5djsup3hbc0du','127.0.0.1',1578661735,'__ci_last_regenerate|i:1578661735;map|s:5:\"space\";map_detail|s:0:\"\";'),('ssff906jisg5phv62sivdi52vcj783ma','127.0.0.1',1582109298,'__ci_last_regenerate|i:1582109088;map|s:5:\"space\";map_detail|s:0:\"\";http_referer|s:22:\"http://127.0.0.1/space\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;mode|s:4:\"post\";post_uid|s:6:\"test01\";view|a:7:{s:8:\"space_82\";b:1;s:8:\"space_99\";b:1;s:8:\"space_98\";b:1;s:8:\"space_96\";b:1;s:8:\"space_38\";b:1;s:8:\"space_30\";b:1;s:7:\"space_8\";b:1;}__ci_vars|a:1:{s:4:\"view\";i:1582194736;}'),('vfggi7inqes611mhaskvi8cjsubm9nm9','127.0.0.1',1577872759,'__ci_last_regenerate|i:1577872759;map|s:7:\"profile\";map_detail|s:0:\"\";http_referer|s:32:\"http://127.0.0.1/space/notice/84\";post_uid|s:10:\"admin@root\";view|a:1:{s:8:\"space_84\";b:1;}__ci_vars|a:1:{s:4:\"view\";i:1577958007;}admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;stage|s:7:\"profile\";darkmode|s:2:\"on\";'),('vsfq6drdd3o6kqt6oupt87m6bi5ib6bj','127.0.0.1',1582548743,'__ci_last_regenerate|i:1582548743;map|s:5:\"space\";map_detail|s:0:\"\";post_uid|s:10:\"admin@root\";view|a:3:{s:8:\"space_30\";b:1;s:8:\"space_38\";b:1;s:9:\"space_102\";b:1;}__ci_vars|a:1:{s:4:\"view\";i:1582634881;}http_referer|s:30:\"http://127.0.0.1/space/best/38\";admin|b:1;sn|s:1:\"1\";uid|s:10:\"admin@root\";name|s:4:\"root\";signed_in|b:1;');
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

SET @post = CONCAT('CREATE TABLE map_', in_name, '_post (\n\tno      int not null auto_increment,\n\tsn INT NULL, \n\tuid     varchar(100) not null,\n\tname\tvarchar(20)\tnot null,\n\tctim    datetime not null default current_timestamp,\n\tutim    datetime,\n\tdtim    datetime,\n\ttitle   varchar(1000) not null,\n\tcontent text not null,\n\treply int not null default 0,\n\thit int not null default 0,\n\tup int not null default 0,\n\tdown int not null default 0,\n\ttype    varchar(20) not null,\n\ttag     varchar(20) not null,\n\tkeyword varchar(400) not null,\n\tupload json null default ''{"total":[]}'',\n\tPRIMARY KEY (no), \n\tINDEX (no)\n)');

PREPARE stmt1 FROM @post;
EXECUTE stmt1;

SET @reply = CONCAT('CREATE TABLE map_', in_name, '_reply(\n\tno\t\tint\t\t\tnot null auto_increment,\n\tsn INT NULL, \n\tuid\t\tvarchar(100)\tnot null,\n\tname\tvarchar(20)\tnot null,\n\tctim\tdatetime\t\tnot null default current_timestamp,\n\tutim\tdatetime,\n\tdtim\tdatetime,\n\tcontent\tvarchar(2000)\tnot null,\nup int not null default 0,\ndown int not null default 0,\n\tpost\tint not null,\n\tmention\tvarchar(100) default null,\n\tfollow\tint null default null,relation int(11) default null,\n\tdepth1 int not null default 0\r\n, \n\tdepth2 int not null default 0\r\n, \n\tdepth3 int not null default 0\r\n, \n\tdepth4 int not null default 0\r\n, \n\tdepth5 int not null default 0\r\n, \n\tdepth6 int not null default 0\r\n, \n\tdepth7 int not null default 0\r\n, \n\tdepth8 int not null default 0\r\n, \n\tdepth9 int not null default 0\r\n, \n\tdepth10 int not null default 0\r\n, \n\tPRIMARY KEY (no), \n\tINDEX (no)\n)');

PREPARE stmt2 FROM @reply;
EXECUTE stmt2;

SET @history = CONCAT('CREATE TABLE map_', in_name, '_history( \n\tno      int not null auto_increment,\n\tsn INT NULL, \n\tuid     varchar(100) not null, \n\ttype    enum("post", "reply") not null, \n\trelation int not null, \n\tpost int not null, \n\tctim    datetime not null default current_timestamp, \n\tutim    datetime, \n\tdtim    datetime, \n\tact    enum("up", "down", "-", "view", "report","") not null default "", \n\tPRIMARY KEY (no), \n\tINDEX (no), \n\tINDEX (relation), \n\tINDEX (post)\n)');

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
/*!50003 DROP PROCEDURE IF EXISTS `drop_map` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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

-- Dump completed on 2020-03-17 22:30:33
