-- MySQL dump 10.13  Distrib 5.5.62, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: LoginServer
-- ------------------------------------------------------
-- Server version	5.5.62-0ubuntu0.14.04.1

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
-- Table structure for table `SERVERLIST`
--

DROP TABLE IF EXISTS `SERVERLIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SERVERLIST` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TYPE` int(10) unsigned NOT NULL DEFAULT '0',
  `DYNAMIC` int(10) unsigned NOT NULL DEFAULT '0',
  `NAME` varchar(32) NOT NULL DEFAULT '',
  `IP` varchar(16) NOT NULL DEFAULT '127.0.0.1',
  `PORT` int(10) unsigned NOT NULL DEFAULT '0',
  `EXTIP` varchar(16) NOT NULL DEFAULT '127.0.0.1',
  `EXTPORT` int(10) unsigned NOT NULL DEFAULT '0',
  `NETTYPE` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2212 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SERVERLIST`
--

LOCK TABLES `SERVERLIST` WRITE;
/*!40000 ALTER TABLE `SERVERLIST` DISABLE KEYS */;
INSERT INTO `SERVERLIST` VALUES (21,21,0,'SceneServer','127.0.0.1',6016,'127.0.0.1',6016,0),(2206,22,0,'GatewayServer','127.0.0.1',6026,'127.0.0.1',6026,0),(2210,10,0,'LoginServer','127.0.0.1',7005,'127.0.0.1',7005,0),(2211,1,0,'SuperServer','127.0.0.1',10001,'127.0.0.1',10001,0),(2001,20,0,'SessionServer','127.0.0.1',6001,'127.0.0.1',6001,0),(22,21,1,'SceneServer','127.0.0.1',6017,'127.0.0.1',6017,0),(2205,22,0,'GatewayServer','127.0.0.1',6025,'127.0.0.1',6025,0),(1101,11,0,'RecordServer','127.0.0.1',7011,'127.0.0.1',7011,0),(1105,10,0,'LoginServer','127.0.0.1',7005,'127.0.0.1',7005,0),(1106,10,0,'LoginServer','127.0.0.1',7006,'127.0.0.1',7006,0),(1107,10,0,'LoginServer','127.0.0.1',7007,'127.0.0.1',7007,0);
/*!40000 ALTER TABLE `SERVERLIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accid` int(11) NOT NULL,
  `accname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apps`
--

DROP TABLE IF EXISTS `apps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `pay_notice_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `os_type_id` int(11) NOT NULL,
  `app_type_id` int(11) NOT NULL,
  `language_type_id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `developer_id` int(11) NOT NULL,
  `summary` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `simple_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `separate_zone_uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_apps_on_key` (`key`) USING BTREE,
  UNIQUE KEY `index_apps_on_name` (`name`) USING BTREE,
  KEY `index_apps_on_developer_id` (`developer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5002 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apps`
--

LOCK TABLES `apps` WRITE;
/*!40000 ALTER TABLE `apps` DISABLE KEYS */;
INSERT INTO `apps` VALUES (200,'e998b7d26b5fd00b36aef32579c537e61','39传奇','',1,1,1,1,1,2,'','','2020-01-13 20:00:58','2020-01-13 20:01:01','39cq',5,''),(5001,'e998b7d26b5fd00b36aef32579c537e6','传奇永恒','',1,1,1,1,1,2,'','','2019-07-15 11:41:57','2019-07-22 14:35:07','cqyh',5,'');
/*!40000 ALTER TABLE `apps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bind_accounts`
--

DROP TABLE IF EXISTS `bind_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bind_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `platid` int(11) NOT NULL,
  `plataccount` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bind_accounts`
--

LOCK TABLES `bind_accounts` WRITE;
/*!40000 ALTER TABLE `bind_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `bind_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_accounts`
--

DROP TABLE IF EXISTS `channel_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `platid` int(11) NOT NULL,
  `plataccount` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `gmlevel` int(11) NOT NULL DEFAULT '0',
  `phone_imei` varchar(256) COLLATE utf8_unicode_ci DEFAULT '',
  `channel_id` varchar(256) COLLATE utf8_unicode_ci DEFAULT '',
  `parent` int(20) DEFAULT '0',
  `inviterid` int(20) DEFAULT '0',
  `mobilenum` varchar(64) COLLATE utf8_unicode_ci DEFAULT '',
  `oldplatid` int(10) DEFAULT '0',
  `oldplataccount` varchar(256) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_channel_accounts_on_account` (`account`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_accounts`
--

LOCK TABLES `channel_accounts` WRITE;
/*!40000 ALTER TABLE `channel_accounts` DISABLE KEYS */;
INSERT INTO `channel_accounts` VALUES (1,'1::1152569|20',NULL,1,'1152569|20',NULL,NULL,0,'0','',0,0,'',0,''),(2,'1::|20',NULL,1,'|20',NULL,NULL,0,'0','',0,0,'',0,''),(3,'1::1152570|20',NULL,1,'1152570|20',NULL,NULL,0,'0','',0,0,'',0,''),(4,'1::1152571|20',NULL,1,'1152571|20',NULL,NULL,0,'0','',0,0,'',0,''),(5,'1::1152572|20',NULL,1,'1152572|20',NULL,NULL,0,'0','',0,0,'',0,''),(6,'1::1152573|20',NULL,1,'1152573|20',NULL,NULL,0,'C2C59916-1B4B-4E92-8ACE-618C1C282E34','',0,0,'',0,''),(7,'1::1152583|20',NULL,1,'1152583|20',NULL,NULL,0,'0','',0,0,'',0,''),(8,'1::1152588|20',NULL,1,'1152588|20',NULL,NULL,0,'0','',0,0,'',0,''),(9,'1::1152579|20',NULL,1,'1152579|20',NULL,NULL,0,'0','',0,0,'',0,''),(10,'1::1152589|20',NULL,1,'1152589|20',NULL,NULL,0,'0','',0,0,'',0,''),(11,'1::1152590|20',NULL,1,'1152590|20',NULL,NULL,0,'0','',0,0,'',0,''),(12,'1::1152599|20',NULL,1,'1152599|20',NULL,NULL,0,'0','',0,0,'',0,''),(13,'1::1152600|20',NULL,1,'1152600|20',NULL,NULL,0,'0','',0,0,'',0,''),(14,'1::1152601|20',NULL,1,'1152601|20',NULL,NULL,0,'0','',0,0,'',0,''),(15,'1::1152602|20',NULL,1,'1152602|20',NULL,NULL,0,'0','',0,0,'',0,''),(16,'1::1152603|20',NULL,1,'1152603|20',NULL,NULL,0,'0','',0,0,'',0,''),(17,'1::1152604|20',NULL,1,'1152604|20',NULL,NULL,0,'0','',0,0,'',0,''),(18,'1::1152605|20',NULL,1,'1152605|20',NULL,NULL,0,'0','',0,0,'',0,''),(19,'1::1152606|20',NULL,1,'1152606|20',NULL,NULL,0,'0','',0,0,'',0,''),(20,'1::1152607|20',NULL,1,'1152607|20',NULL,NULL,0,'0','',0,0,'',0,''),(21,'1::1152608|20',NULL,1,'1152608|20',NULL,NULL,0,'0','',0,0,'',0,''),(22,'1::1152609|20',NULL,1,'1152609|20',NULL,NULL,0,'0','',0,0,'',0,''),(23,'1::1152610|20',NULL,1,'1152610|20',NULL,NULL,0,'0','',0,0,'',0,''),(24,'1::1152612|20',NULL,1,'1152612|20',NULL,NULL,0,'0','',0,0,'',0,''),(25,'1::1152613|20',NULL,1,'1152613|20',NULL,NULL,0,'0','',0,0,'',0,''),(26,'1::1152625|20',NULL,1,'1152625|20',NULL,NULL,0,'0','',0,0,'',0,''),(27,'1::4390171613',NULL,1,'4390171613',NULL,NULL,0,'0','',0,0,'',0,''),(28,'1::123456789',NULL,1,'123456789',NULL,NULL,0,'0','',0,0,'',0,''),(29,'1::1156085',NULL,1,'1156085',NULL,NULL,0,'0','',0,0,'',0,''),(30,'1::1035074997',NULL,1,'1035074997',NULL,NULL,0,'0','',0,0,'',0,''),(31,'1::1152622|20',NULL,1,'1152622|20',NULL,NULL,0,'0','',0,0,'',0,''),(32,'1::1152618',NULL,1,'1152618',NULL,NULL,0,'0','',0,0,'',0,''),(33,'1::1152623',NULL,1,'1152623',NULL,NULL,0,'0','',0,0,'',0,''),(34,'1::1152619|20',NULL,1,'1152619|20',NULL,NULL,0,'06C32A54-C5D0-4291-862E-F44573FA0141','',0,0,'',0,''),(35,'1::3927083371',NULL,1,'3927083371',NULL,NULL,0,'0','',0,0,'',0,''),(36,'83::22596987|38',NULL,83,'22596987|38',NULL,NULL,0,'0','',0,0,'',0,''),(37,'83::22589853|38',NULL,83,'22589853|38',NULL,NULL,0,'0','',0,0,'',0,''),(38,'1::22589853|38',NULL,1,'22589853|38',NULL,NULL,0,'0','',0,0,'',0,''),(39,'1::22596987|38',NULL,1,'22596987|38',NULL,NULL,0,'0','',0,0,'',0,''),(40,'1::22627417|38',NULL,1,'22627417|38',NULL,NULL,0,'0','',0,0,'',0,''),(41,'1::22661790|38',NULL,1,'22661790|38',NULL,NULL,0,'0','',0,0,'',0,'');
/*!40000 ALTER TABLE `channel_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charnames`
--

DROP TABLE IF EXISTS `charnames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charnames` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zoneid` int(11) NOT NULL,
  `charid` int(11) NOT NULL,
  `gameid` int(11) NOT NULL,
  `accountid` int(11) NOT NULL,
  `accountname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `charname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charnames`
--

LOCK TABLES `charnames` WRITE;
/*!40000 ALTER TABLE `charnames` DISABLE KEYS */;
/*!40000 ALTER TABLE `charnames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gateway_types`
--

DROP TABLE IF EXISTS `gateway_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gateway_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_gateway_types_on_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gateway_types`
--

LOCK TABLES `gateway_types` WRITE;
/*!40000 ALTER TABLE `gateway_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `gateway_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gateways`
--

DROP TABLE IF EXISTS `gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gateways` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gateway_type_id` int(11) NOT NULL,
  `ip` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url_zone` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url_user` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `redis_server_id` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `url_user_unicom` varchar(256) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_gateways_on_name` (`name`) USING BTREE,
  UNIQUE KEY `index_gateways_on_ip_and_url_zone_and_url_user` (`ip`,`url_zone`,`url_user`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gateways`
--

LOCK TABLES `gateways` WRITE;
/*!40000 ALTER TABLE `gateways` DISABLE KEYS */;
INSERT INTO `gateways` VALUES (1,'FGCQ_Gate_01',1,'FGCQ_Gate_01','tcp://121.43.197.240:9000:121.43.197.240:49100','tcp://121.43.197.240:6026:121.43.197.240:46126',1,'复古传奇内网1号网关192.168.1.254','2017-03-07 20:38:44','2017-03-09 10:29:46','');
/*!40000 ALTER TABLE `gateways` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gateways_proxy`
--

DROP TABLE IF EXISTS `gateways_proxy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gateways_proxy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gateway_id` int(11) NOT NULL,
  `url_zone` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url_user` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url_user_unicom` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `isonline` tinyint(1) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_gateways_proxy_on_url_user` (`url_user`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gateways_proxy`
--

LOCK TABLES `gateways_proxy` WRITE;
/*!40000 ALTER TABLE `gateways_proxy` DISABLE KEYS */;
/*!40000 ALTER TABLE `gateways_proxy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_infos`
--

DROP TABLE IF EXISTS `server_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL,
  `zone_info_id` int(11) NOT NULL,
  `gateway_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_infos`
--

LOCK TABLES `server_infos` WRITE;
/*!40000 ALTER TABLE `server_infos` DISABLE KEYS */;
/*!40000 ALTER TABLE `server_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serverlists`
--

DROP TABLE IF EXISTS `serverlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serverlists` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TYPE` int(10) unsigned NOT NULL DEFAULT '0',
  `DYNAMIC` int(10) unsigned NOT NULL DEFAULT '0',
  `NAME` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `IP` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '127.0.0.1',
  `PORT` int(10) unsigned NOT NULL DEFAULT '0',
  `EXTIP` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '127.0.0.1',
  `EXTPORT` int(10) unsigned NOT NULL DEFAULT '0',
  `NETTYPE` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serverlists`
--

LOCK TABLES `serverlists` WRITE;
/*!40000 ALTER TABLE `serverlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `serverlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp_account`
--

DROP TABLE IF EXISTS `temp_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_account` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ACCOUNT` char(48) NOT NULL DEFAULT '',
  `LASTTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`ACCOUNT`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=76747 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp_account`
--

LOCK TABLES `temp_account` WRITE;
/*!40000 ALTER TABLE `temp_account` DISABLE KEYS */;
INSERT INTO `temp_account` VALUES (76682,'liangfanæ˜¾ç¤ºçš„','2019-11-19 03:12:57'),(76683,'aaa','2019-11-19 03:16:47'),(76684,'liwiesen','2019-11-19 03:17:36'),(76685,'liangfan','2019-11-19 03:19:53'),(76686,'zzz','2019-11-19 03:26:23'),(76687,'123456','2019-11-19 06:24:19'),(76688,'liangfanæ˜¯çš„','2019-11-19 09:47:12'),(76689,'神石','2019-11-22 02:15:12'),(76690,'把','2019-11-28 06:21:52'),(76691,'打打气','2019-11-28 06:24:48'),(76692,'liangfan1','2019-12-02 02:12:54'),(76693,'aaa1','2019-12-02 06:14:51'),(76694,'dqwdqddqwd','2019-12-03 07:39:02'),(76695,'胡说八道','2019-12-04 10:25:03'),(76696,'回电话','2019-12-04 10:26:11'),(76697,'冰箱保险','2019-12-04 10:32:38'),(76698,'刚才','2019-12-04 10:46:59'),(76699,'ffff','2019-12-05 09:45:47'),(76700,'心心念念','2019-12-05 11:18:38'),(76701,'呵呵','2019-12-13 09:25:01'),(76702,'宝宝','2019-12-13 10:07:13'),(76703,'Hhnj','2019-12-19 08:16:23'),(76704,'Tszguwschjb','2019-12-20 11:31:51'),(76705,'飞鱼服','2019-12-20 16:33:58'),(76706,'Guoxuefeng','2019-12-21 01:27:13'),(76707,'1321','2019-12-21 03:26:39'),(76708,'Zhang Zheyu.','2019-12-21 03:36:04'),(76709,'赵锦赫','2019-12-21 04:28:18'),(76710,'传奇54321','2019-12-21 04:40:02'),(76711,'hfhvdhv','2019-12-21 04:52:20'),(76712,'15959694119','2019-12-21 05:00:53'),(76713,'Mike','2019-12-21 06:51:00'),(76714,'云山居仕','2019-12-21 06:56:22'),(76715,'123885','2019-12-21 07:29:38'),(76716,'239736464878','2019-12-21 09:36:45'),(76717,'十恶&不赦','2019-12-21 11:37:09'),(76718,'momo','2019-12-22 03:28:46'),(76719,'手可摘星。','2019-12-22 05:41:39'),(76720,'ykl521','2019-12-22 05:51:45'),(76721,'uayduje','2019-12-22 07:51:38'),(76722,'泪殇不请自来','2019-12-22 08:11:47'),(76723,'12345678901472580369','2019-12-22 08:57:45'),(76724,'小月','2019-12-22 12:40:20'),(76725,'196632736','2019-12-22 14:01:06'),(76726,'20080310','2019-12-22 21:19:11'),(76727,'′13460448109','2019-12-23 05:26:56'),(76728,'Zxcvbnm','2019-12-23 05:41:59'),(76729,'3344645656','2019-12-23 07:08:17'),(76730,'凡帅锅','2019-12-23 10:15:33'),(76731,'12345678','2019-12-24 01:54:46'),(76732,'凡帅','2019-12-25 02:16:38'),(76733,'321132','2019-12-25 09:27:28'),(76734,'aaron6','2019-12-26 01:09:48'),(76735,'test02','2019-12-26 02:49:54'),(76736,'12345','2019-12-26 03:36:17'),(76737,'123','2019-12-26 03:36:25'),(76738,'111111','2019-12-26 03:36:33'),(76739,'888888','2019-12-27 15:46:49'),(76740,'1234','2019-12-27 15:47:06'),(76741,'1234567','2019-12-27 15:48:29'),(76742,'12233','2020-01-02 02:23:35'),(76743,'JH','2020-01-08 05:26:45'),(76744,'ffffff','2020-01-09 05:29:10'),(76745,'ff','2020-01-12 12:56:33'),(76746,'qwert','2020-01-15 09:22:31');
/*!40000 ALTER TABLE `temp_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `failed_attempts` int(11) DEFAULT '0',
  `locked_at` datetime DEFAULT NULL,
  `authentication_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `projects_limit` int(11) DEFAULT '10',
  `skype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `linkedin` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `twitter` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `theme_id` int(11) NOT NULL DEFAULT '1',
  `extern_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `can_create_group` tinyint(1) NOT NULL DEFAULT '1',
  `can_create_team` tinyint(1) NOT NULL DEFAULT '1',
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color_scheme_id` int(11) NOT NULL DEFAULT '1',
  `notification_level` int(11) NOT NULL DEFAULT '1',
  `password_expires_at` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `last_credential_check_at` datetime DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hide_no_ssh_key` tinyint(1) DEFAULT '0',
  `website_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `extern_username` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `real_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `string` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qq` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mobile` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tel` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_developer` tinyint(1) DEFAULT '0',
  `boolean` tinyint(1) DEFAULT '0',
  `approved` tinyint(1) DEFAULT '0',
  `developer_type` int(11) DEFAULT '0',
  `integer` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `guide_id` int(11) DEFAULT '1',
  `adv_code_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `active_code_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`) USING BTREE,
  UNIQUE KEY `index_users_on_extern_username` (`extern_username`) USING BTREE,
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`) USING BTREE,
  UNIQUE KEY `index_users_on_confirmation_token` (`confirmation_token`) USING BTREE,
  UNIQUE KEY `index_users_on_authentication_token` (`authentication_token`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zone_infos`
--

DROP TABLE IF EXISTS `zone_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zone_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_id` int(11) NOT NULL,
  `new_zone_id` int(11) NOT NULL DEFAULT '0',
  `gateway_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `show_order` int(11) NOT NULL DEFAULT '0',
  `mysql_server_id` int(11) NOT NULL DEFAULT '0',
  `redis_server_id` int(11) NOT NULL DEFAULT '0',
  `rethink_server_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_zone_id` int(11) NOT NULL,
  `mysql_database_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `redis_database_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `rethink_database_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `mongo_database_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `mongo_server_id` int(11) NOT NULL DEFAULT '0',
  `dbflag` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_key` varchar(256) COLLATE utf8_unicode_ci DEFAULT '',
  `lobby_server_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_zone_infos_on_name` (`name`) USING BTREE,
  UNIQUE KEY `index_zone_infos_on_app_id_and_name` (`app_id`,`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone_infos`
--

LOCK TABLES `zone_infos` WRITE;
/*!40000 ALTER TABLE `zone_infos` DISABLE KEYS */;
INSERT INTO `zone_infos` VALUES (1,'我是传奇_1',5001,0,'1',0,0,0,0,0,'2019-07-15 11:44:43','2019-07-15 11:46:18',1,'0','0','0','0',0,'','',0),(2,'我是传奇_2',5001,0,'1',0,0,0,0,0,'2019-12-28 17:49:49','2019-12-28 17:49:56',2,'0','0','0','0',0,NULL,'',0),(3,'39传奇_1',200,0,'0',0,0,0,0,0,'2020-01-13 20:04:24','2020-01-13 20:04:30',1,'0','0','0','0',0,NULL,'',0);
/*!40000 ALTER TABLE `zone_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zone_infos_gateways`
--

DROP TABLE IF EXISTS `zone_infos_gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zone_infos_gateways` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_info_id` int(11) NOT NULL,
  `gateway_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_zone_infos_gateways_on_zone_info_id_and_gateway_id` (`zone_info_id`,`gateway_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone_infos_gateways`
--

LOCK TABLES `zone_infos_gateways` WRITE;
/*!40000 ALTER TABLE `zone_infos_gateways` DISABLE KEYS */;
INSERT INTO `zone_infos_gateways` VALUES (1,1,1,'2017-03-07 20:39:11','2017-03-07 20:39:11'),(2,2,1,'2019-12-28 17:50:26','2019-12-28 17:50:28');
/*!40000 ALTER TABLE `zone_infos_gateways` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zone_whitelists`
--

DROP TABLE IF EXISTS `zone_whitelists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zone_whitelists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zone_info_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_zone_whitelists_on_zone_info_id` (`zone_info_id`) USING BTREE,
  KEY `index_zone_whitelists_on_ip` (`ip`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone_whitelists`
--

LOCK TABLES `zone_whitelists` WRITE;
/*!40000 ALTER TABLE `zone_whitelists` DISABLE KEYS */;
/*!40000 ALTER TABLE `zone_whitelists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-16 10:20:17
