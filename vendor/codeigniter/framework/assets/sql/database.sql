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
INSERT INTO `admin_info` VALUES (1,'admin','daihyun99','JDJ5JDEyJGp6d2doM2REWnkxNlVTRWNsN3pGLnVwUUd4NDF4MjZhS1JYdTFQbGQ1aWJ3R2dhRTduQnFx',0,'2018-08-26 16:13:09','JDJ5JDEwJDVRdEZVREZRRU5NOXguM3poT2ZaQmV6WXBWNy80aE92NkNUWUMvMnU4VnQya25ZdGFoUkll','2018-08-26 18:47:41');
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
INSERT INTO `map_code` VALUES ('대한민국|Republic of Korea','kr',1,'locality:서울특별시|Seoul&political1:동작구|Dongjak-gu&political2:흑석동|Heukseok-dong','2017-05-06 00:16:38',NULL,NULL,'','','한국'),('경기도|Gyeonggi-do','kr',2,'locality:부천시|Bucheon&political1:소사구|Sosa-gu&political2:괴안동|Goean-dong','2018-07-07 15:45:37',NULL,NULL,'','','한국');
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
  `utim` datetime DEFAULT NULL,
  `dtim` datetime DEFAULT NULL,
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
  `utim` datetime DEFAULT NULL,
  `dtim` datetime DEFAULT NULL,
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
  `utim` datetime DEFAULT NULL,
  `dtim` datetime DEFAULT NULL,
  `title` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hit` int(11) NOT NULL DEFAULT 0,
  `vote` int(11) NOT NULL DEFAULT 0,
  `reply` int(11) NOT NULL DEFAULT 0,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyword` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_space_post`
--

LOCK TABLES `map_space_post` WRITE;
/*!40000 ALTER TABLE `map_space_post` DISABLE KEYS */;
INSERT INTO `map_space_post` VALUES (1,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Hello, World!','test&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;testset&lt;/div&gt;&lt;div&gt;set&lt;/div&gt;&lt;div&gt;set&lt;/div&gt;&lt;div&gt;se&lt;/div&gt;&lt;div&gt;tse&lt;/div&gt;&lt;div&gt;ts&lt;/div&gt;&lt;div&gt;ets&lt;/div&gt;&lt;div&gt;etse&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;',0,0,16,'best','first',''),(2,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Hello, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',0,0,3,'best','first',''),(3,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Hello, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',0,0,2,'best','first',''),(4,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Hello, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',0,0,0,'best','first',''),(5,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Hello, 한글!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',0,0,0,'best','first',''),(6,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Test, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',0,0,0,'best','first',''),(7,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Test, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',0,0,0,'best','first',''),(8,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Test, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',0,0,0,'best','first',''),(9,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Test, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',0,0,0,'best','first',''),(10,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Test, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',0,0,0,'best','first',''),(11,'test01','테스트','2017-08-13 17:58:14','0000-00-00 00:00:00','0000-00-00 00:00:00','Test, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',0,0,0,'best','first',''),(12,'test01','테스트','2018-08-26 16:21:10','0000-00-00 00:00:00','0000-00-00 00:00:00','Hello, World!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus massa at accumsan sagittis. In hac habitasse platea dictumst.',0,0,0,'best','first',''),(13,'admin@daihyun99','daihyun99','2018-08-26 18:49:13',NULL,NULL,'test','#test1&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;#test1&lt;br&gt;&lt;/div&gt;&lt;div&gt;#test1&lt;br&gt;&lt;/div&gt;&lt;div&gt;#test1#test1#test6&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;#마지막으로 #한글 #테스트&lt;/div&gt;',0,0,0,'free','','test1|test1|test1|test1|test1|test6|마지막으로|한글|테스트');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_space_reply`
--

LOCK TABLES `map_space_reply` WRITE;
/*!40000 ALTER TABLE `map_space_reply` DISABLE KEYS */;
INSERT INTO `map_space_reply` VALUES (1,'admin@daihyun99','daihyun99','2018-07-07 15:46:48',NULL,NULL,'테스트 댓글 답니다',0,1,'',NULL,0,1,0,0,0,0,0,0,0,0,0),(2,'admin@daihyun99','daihyun99','2018-07-07 15:46:56',NULL,NULL,'우앙!',0,1,'daihyun99',1,1,1,1,0,0,0,0,0,0,0,0),(3,'admin@daihyun99','daihyun99','2018-07-07 15:47:11',NULL,NULL,'2등',0,1,'',NULL,0,2,0,0,0,0,0,0,0,0,0),(4,'admin@daihyun99','daihyun99','2018-07-07 15:47:18',NULL,NULL,'ㄴㄴ 님 3등',0,1,'daihyun99',3,3,2,1,0,0,0,0,0,0,0,0),(5,'admin@daihyun99','daihyun99','2018-07-07 15:47:36',NULL,NULL,'귀척 ㄴㄴ',0,1,'daihyun99',1,2,1,1,1,0,0,0,0,0,0,0),(6,'admin@daihyun99','daihyun99','2018-07-07 15:47:56',NULL,NULL,'십.노.잼',0,1,'daihyun99',1,1,1,2,0,0,0,0,0,0,0,0),(7,'admin@daihyun99','daihyun99','2018-07-07 15:48:14',NULL,NULL,'이분 이제 5등이랍니다 글 내려주세요',0,1,'daihyun99',3,4,2,1,1,0,0,0,0,0,0,0),(8,'admin@daihyun99','daihyun99','2018-07-07 15:50:43',NULL,NULL,'ㅇㅈ',0,1,'daihyun99',1,5,1,1,1,1,0,0,0,0,0,0),(9,'admin@daihyun99','daihyun99','2018-07-07 17:28:22',NULL,NULL,'wow',0,1,'',NULL,0,3,0,0,0,0,0,0,0,0,0),(10,'admin@daihyun99','daihyun99','2018-07-13 00:12:00',NULL,NULL,'test1',0,2,'',NULL,0,4,0,0,0,0,0,0,0,0,0),(11,'admin@daihyun99','daihyun99','2018-07-24 23:41:37',NULL,NULL,'7월 24일 npm 업데이트 하고 난 후의 테스트',0,1,'daihyun99',9,9,3,1,0,0,0,0,0,0,0,0),(12,'test01','테스트','2018-08-12 00:36:55',NULL,NULL,'map -&gt; api 로 request 처리 옮김.',0,1,'',NULL,0,5,0,0,0,0,0,0,0,0,0),(13,'admin@daihyun99','daihyun99','2018-08-18 09:28:56',NULL,NULL,'reply -&gt; reply-addon 으로 클래스 변경',0,1,'',NULL,0,6,0,0,0,0,0,0,0,0,0),(14,'admin@daihyun99','daihyun99','2018-08-18 09:29:11',NULL,NULL,'대댓글도 잘 되는지 확인',0,1,'daihyun99',13,13,6,1,0,0,0,0,0,0,0,0),(15,'admin@daihyun99','daihyun99','2018-08-18 09:29:21',NULL,NULL,'나도 확인',0,1,'daihyun99',13,14,6,1,1,0,0,0,0,0,0,0),(16,'admin@daihyun99','daihyun99','2018-08-18 09:29:58',NULL,NULL,'2등 (새치기당함)',0,1,'daihyun99',13,13,6,2,0,0,0,0,0,0,0,0),(17,'admin@daihyun99','daihyun99','2018-08-20 22:56:15',NULL,NULL,'\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nTEST',0,2,'daihyun99',10,10,4,1,0,0,0,0,0,0,0,0),(18,'admin@daihyun99','daihyun99','2018-08-20 22:56:39',NULL,NULL,'띄\n어\n쓰\n끼',0,2,'daihyun99',10,10,4,2,0,0,0,0,0,0,0,0),(19,'admin@daihyun99','daihyun99','2018-08-22 23:53:00',NULL,NULL,'댓글 확인?\n띄어쓰기 확인\n확\n\n인',0,3,'',NULL,0,7,0,0,0,0,0,0,0,0,0),(20,'admin@daihyun99','daihyun99','2018-08-22 23:53:12',NULL,NULL,'대댓글 확.인.',0,3,'daihyun99',19,19,7,1,0,0,0,0,0,0,0,0);
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
INSERT INTO `user_info` VALUES ('test01','테스트',NULL,'JDJ5JDEyJFY1dUc2dzdWdG9YWHpqRjJ5L3Zad2VwYWlmNDM0N0JSREpHYnRqaGd3aUJacEFFWVhaUjlH',0,'kr1',0,'2017-02-16 18:53:33','2018-08-11 15:27:52',NULL,NULL,''),('test02','삭제테스트',NULL,'JDJ5JDEyJEgxcmE5bWc4Nk5kZy9vYWU2MjdWeGV0VEUxLnlkUTRMNEppSnNtYUh5VXlFMlhRdC9YejN5',0,NULL,0,'2017-03-23 02:24:00','2017-12-30 18:04:59',NULL,NULL,''),('test03','ajax테스트',NULL,'JDJ5JDEyJFBqS3dUTi5CR1F5TWFFUTN1eUo2THVwUEJRaHpTTlJBWmFucVQzNGhUUE9LMTdac0hSb3Y2',0,NULL,0,'2017-03-23 15:30:42','2018-01-20 18:37:57',NULL,NULL,'');
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
INSERT INTO `user_session` VALUES ('0d8ksfe0bdqd73tccnbia959ha952vem','127.0.0.1',1534943842,'__ci_last_regenerate|i:1534943842;'),('16pq19uuban1i1bmc85gqs6g1il26kec','127.0.0.1',1534852326,'__ci_last_regenerate|i:1534852326;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('18k4a0n5p3d6l4pv23btm5binrhed1gl','127.0.0.1',1535276264,'__ci_last_regenerate|i:1535276264;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('21tn91ke8ldkjg18ol48f6831v57101k','127.0.0.1',1534950031,'__ci_last_regenerate|i:1534950031;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('2ov4lb4d85lqlp2iq7nsu0h1pk660q1f','127.0.0.1',1535277561,'__ci_last_regenerate|i:1535277561;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('39klotstmd2c5rnrhjj735ednk0vvegm','127.0.0.1',1535299992,'__ci_last_regenerate|i:1535299883;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('4sfri7sndhqcdti4qbqchrbr1asbbat6','127.0.0.1',1535279579,'__ci_last_regenerate|i:1535279579;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('60cdr80oe3eibe7j41oq18s9maaq78lg','127.0.0.1',1535266436,'__ci_last_regenerate|i:1535266436;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('63am0bl4h10kdr2fled7qknsommddpfv','127.0.0.1',1534855638,'__ci_last_regenerate|i:1534855638;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('6mdt71k81b7ved07oaohpsmcf2944lg4','127.0.0.1',1535279845,'__ci_last_regenerate|i:1535279579;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('8ifsp74fne18tnq9q83emdhdcoiduidg','127.0.0.1',1535299883,'__ci_last_regenerate|i:1535299883;'),('ahovo127tqtc22e1tho1ppcoqsvran9o','127.0.0.1',1534853784,'__ci_last_regenerate|i:1534853784;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('au39br9g8keuemk2ohp23j3nftqjjmj4','127.0.0.1',1534854684,'__ci_last_regenerate|i:1534854684;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('b6s9rhhpq0ca464pcaasraak3t100de6','127.0.0.1',1534855759,'__ci_last_regenerate|i:1534855638;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('brk002ss3s7sgbm8iai0a7r1mbsh7t52','127.0.0.1',1535277886,'__ci_last_regenerate|i:1535277886;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('bvhtt1qesj3fm1nsv0fdtv63jpd686un','127.0.0.1',1534950040,'__ci_last_regenerate|i:1534950031;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('cdv5ik1pm83shthjs4dh8cmhf38dfddl','127.0.0.1',1534851272,'__ci_last_regenerate|i:1534851272;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('cr8njf9ijvubsav9e9d6p0kuq1g9fn2p','127.0.0.1',1534851721,'__ci_last_regenerate|i:1534851721;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('dg2iq4adobsfkl8jimkvma56fvd6kmp6','127.0.0.1',1535279276,'__ci_last_regenerate|i:1535279276;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('dq5537psl323f4q1tghftr3mo3qk6pqq','127.0.0.1',1535270556,'__ci_last_regenerate|i:1535270556;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('ds8hm9fltrhbb40kn3ks0s9pblkl0t2k','127.0.0.1',1535277248,'__ci_last_regenerate|i:1535277248;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('e1of08940fjeggibu2fjhg5aja2qqk0p','127.0.0.1',1534949205,'__ci_last_regenerate|i:1534949205;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('etpsu1848tkh4r0s82sbid5ij0qu69el','127.0.0.1',1535273985,'__ci_last_regenerate|i:1535273985;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('fh44c96hruoh7jmsj5jnqj4v20ejvsej','127.0.0.1',1535273510,'__ci_last_regenerate|i:1535273510;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('fsif3jjfqbhi7l8s7melfun2aqnsrmh6','127.0.0.1',1535278201,'__ci_last_regenerate|i:1535278201;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('h66a92lfo85eglv37lkiqn4pifu1omds','127.0.0.1',1535274298,'__ci_last_regenerate|i:1535274298;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('hvhaogl4oro6gs71769c0dv1m32ohhns','127.0.0.1',1534855009,'__ci_last_regenerate|i:1534855009;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('jhbgr05nqf65vo25c51gfdgqldrvn510','127.0.0.1',1535276762,'__ci_last_regenerate|i:1535276762;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('krr1fgg1scujbk390h7memvlfqiu1kfr','127.0.0.1',1535270255,'__ci_last_regenerate|i:1535270255;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('mbhcb81v5j6adlc51k82km2ov23fmuif','127.0.0.1',1535278960,'__ci_last_regenerate|i:1535278960;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('no4q05vjnrmbi6sja4b848eb2auh79q1','127.0.0.1',1534949563,'__ci_last_regenerate|i:1534949563;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('nrv27t9jj7ihu97bemrfdsmapn3rer4f','127.0.0.1',1534853469,'__ci_last_regenerate|i:1534853469;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('o1nnlr52h6mkhbdb4qkjpuprcvjk181a','127.0.0.1',1534852722,'__ci_last_regenerate|i:1534852722;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('o4kcootfqf682if5rfq1v5j4lgf2ed99','127.0.0.1',1535278646,'__ci_last_regenerate|i:1535278646;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('p971f023ls4ritb0ljo7hre4huodlga1','127.0.0.1',1534855320,'__ci_last_regenerate|i:1534855320;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('r347u0v4062eq8d2duaqjvbfvaqldpk3','127.0.0.1',1534853150,'__ci_last_regenerate|i:1534853150;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('rg3glm1f42icskoas03tij5s7l4olopv','127.0.0.1',1534850935,'__ci_last_regenerate|i:1534850935;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('rj18ib2m6v0rj38p98u2bkju1l5sccts','127.0.0.1',1535269906,'__ci_last_regenerate|i:1535269906;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('s0vfcu1h3ed1k09n3u4ki4p431hh2lpg','127.0.0.1',1534854211,'__ci_last_regenerate|i:1534854211;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('tosr3ijkm9hmbuhchn345ip55gue3ogs','127.0.0.1',1535275306,'__ci_last_regenerate|i:1535275306;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;'),('tt1c47o6prmr3hsdisb4bkjqnmg0gtab','127.0.0.1',1535267155,'__ci_last_regenerate|i:1535267155;admin|b:1;uid|s:15:\"admin@daihyun99\";name|s:9:\"daihyun99\";signed_in|b:1;');
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
/*!50003 DROP PROCEDURE IF EXISTS `create_map` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_map`(IN `in_country` VARCHAR(100), IN `in_code` CHAR(2), IN `in_local` VARCHAR(200), IN `in_pol1` VARCHAR(400), IN `in_pol2` VARCHAR(400))
BEGIN

DECLARE in_no int default 0;
SELECT count(no) into in_no FROM map_code WHERE code = in_code;
SET in_no = in_no + 1;



INSERT INTO map_code (country, code, no, place) values(in_country, in_code, in_no, concat("locality:", in_local, "&political1:", in_pol1, "&political2:", in_pol2));
SET @post = CONCAT('CREATE TABLE map_', in_code, in_no, '_post (\n\tno      int not null auto_increment,\n\tuid     varchar(100) not null,\n\tcountry    varchar(100) not null,\n\tctim    datetime not null default current_timestamp,\n\tutim    datetime,\n\tdtim    datetime,\n\ttitle   varchar(1000) not null,\n\tcontent text not null,\n\treply int not null default 0,\n\thit int not null default 0,\n\tvote int not null default 0,\n\ttype    varchar(20) not null,\n\ttag     varchar(20) not null,\n\tkeyword varchar(400) not null,\n\tPRIMARY KEY (no)\n)');

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
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
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

-- Dump completed on 2018-08-27  1:13:14
