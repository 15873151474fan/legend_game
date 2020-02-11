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
-- Current Database: `LoginServer`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `LoginServer` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `LoginServer`;

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

--
-- Current Database: `NameServer`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `NameServer` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `NameServer`;

--
-- Table structure for table `ARMYNAME`
--

DROP TABLE IF EXISTS `ARMYNAME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ARMYNAME` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` char(32) NOT NULL DEFAULT '',
  `CREATETIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ZONE` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10002434 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ARMYNAME`
--

LOCK TABLES `ARMYNAME` WRITE;
/*!40000 ALTER TABLE `ARMYNAME` DISABLE KEYS */;
/*!40000 ALTER TABLE `ARMYNAME` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CHARNAME`
--

DROP TABLE IF EXISTS `CHARNAME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CHARNAME` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` char(32) NOT NULL DEFAULT '',
  `ACCID` int(10) unsigned NOT NULL DEFAULT '0',
  `ACCOUNT` char(48) NOT NULL DEFAULT '',
  `CREATETIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ZONE` int(10) unsigned NOT NULL DEFAULT '0',
  `CREATEIP` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ZONE_NAME` (`ZONE`,`NAME`) USING BTREE,
  KEY `ACCID` (`ACCID`) USING BTREE,
  KEY `ACCOUNT` (`ACCOUNT`) USING BTREE,
  KEY `NAME` (`NAME`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=18904711 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CHARNAME`
--

LOCK TABLES `CHARNAME` WRITE;
/*!40000 ALTER TABLE `CHARNAME` DISABLE KEYS */;
INSERT INTO `CHARNAME` VALUES (18904538,'ç‹¬èˆžä¼¤å¤',76685,'ç‹¬èˆžä¼¤å¤','2019-11-19 03:22:54',327745538,3895757175),(18904527,'èˆ’ä¹¦åŒ',76683,'èˆ’ä¹¦åŒ','2019-11-19 03:17:47',327745537,3895757175),(18904531,'çŸ³ç¿ å²š',76682,'çŸ³ç¿ å²š','2019-11-19 03:19:00',327745538,3895757175),(18904542,'é‚¹æ€€æ›¼',76685,'é‚¹æ€€æ›¼','2019-11-19 03:25:06',327745538,3895757175),(18904543,'æ²ˆä¹¦èŠ¹',76685,'æ²ˆä¹¦èŠ¹','2019-11-19 03:25:22',327745538,3895757175),(18904544,'å‚²ä¹‹çŒŽé©¬äºº',76684,'å‚²ä¹‹çŒŽé©¬äºº','2019-11-19 03:25:51',327745537,3895757175),(18904545,'å½’æµ·å‡Œç‘¶',76685,'å½’æµ·å‡Œç‘¶','2019-11-19 03:27:37',327745537,3895757175),(18904546,'ä¹”å­¤æ™´',76685,'ä¹”å­¤æ™´','2019-11-19 03:27:50',327745537,3895757175),(18904547,'点一下玩一年',76683,'å”é›ªçƒŸ','2019-11-22 06:48:29',327745537,3895757175),(18904549,'å¤ªå”å‹çµ',76686,'å¤ªå”å‹çµ','2019-11-19 03:29:37',327745537,3895757175),(18904552,'ç¥–å®‰çŠ¶å…ƒ',76684,'ç¥–å®‰çŠ¶å…ƒ','2019-11-19 05:53:59',327745537,3895757175),(18904551,'ä¸œæ–¹ç›¼å¤',7,'ä¸œæ–¹ç›¼å¤','2019-11-19 03:37:22',327745537,3895757175),(18904553,'铜锣湾陈浩南',76683,'ç§¦ä¸¹å·§','2019-11-22 06:42:57',327745537,3895757175),(18904554,'æ±ŸåŠ è‚–',76686,'æ±ŸåŠ è‚–','2019-11-19 06:13:52',327745537,3895757175),(18904556,'è–›ç§‹ç™½',76687,'è–›ç§‹ç™½','2019-11-19 06:25:01',327745537,3895757175),(18904557,'è§æ— å£°',76687,'è§æ— å£°','2019-11-19 08:48:07',327745537,3895757175),(18904558,'ç¬¦é‡‡æ³¢',8,'ç¬¦é‡‡æ³¢','2019-11-19 08:55:30',327745538,981794973),(18904559,'å…³æ˜¥æ¢…',76688,'å…³æ˜¥æ¢…','2019-11-19 10:31:24',327745538,3895757175),(18904560,'å«é™èŠ™',76688,'å«é™èŠ™','2019-11-19 10:46:36',327745538,3895757175),(18904561,'é•¿å­™å¯„çœŸ',76688,'é•¿å­™å¯„çœŸ','2019-11-20 02:24:18',327745537,3895757175),(18904562,'é™†å­¤å…°',76686,'é™†å­¤å…°','2019-11-20 02:36:34',327745537,3895757175),(18904563,'é’Ÿç¦»å¤©ç¿',10,'é’Ÿç¦»å¤©ç¿','2019-11-20 09:19:40',327745538,723901917),(18904564,'ç™¾é‡Œå®‰æ¾œ',7,'ç™¾é‡Œå®‰æ¾œ','2019-11-20 10:51:47',327745538,723901917),(18904565,'å¸ç©ºæ˜ å¯’',11,'å¸ç©ºæ˜ å¯’','2019-11-21 02:26:18',327745538,343498354),(18904566,'我不想奋斗了',76683,'å¤™å¯’æ²™','2019-11-25 08:58:26',327745538,3728116087),(18904567,'åº·æµ·èŽ²',76684,'åº·æµ·èŽ²','2019-11-21 09:02:38',327745537,3728116087),(18904568,'é’Ÿç¦»é—®æž«',76684,'é’Ÿç¦»é—®æž«','2019-11-21 09:43:12',327745537,3728116087),(18904569,'ä¹æ­£è¿Žæ³¢',9,'ä¹æ­£è¿Žæ³¢','2019-11-22 01:57:30',327745537,3728116087),(18904570,'韧韧脚',76686,'韧韧脚','2019-11-22 08:36:24',327745538,3728116087),(18904571,'傲之猎马人',76684,'傲之猎马人','2019-11-25 07:05:21',327745538,1848936823),(18904572,'史蒂夫',76686,'史蒂夫','2019-11-26 06:47:14',327745538,1848936823),(18904573,'凡帅锅',76685,'凡帅锅','2019-11-26 09:28:50',327745539,1848936823),(18904574,'一二',12,'一二','2019-11-26 10:11:40',327745539,1848936823),(18904575,'铞鎯裆',13,'铞鎯裆','2019-11-26 10:30:22',327745537,1848936823),(18904576,'井幻竹',14,'井幻竹','2019-11-26 11:09:59',327745538,1848936823),(18904577,'舒沛春',9,'舒沛春','2019-11-27 02:02:26',327745538,1848936823),(18904578,'符孤兰',76684,'符孤兰','2019-11-27 02:48:24',327745538,1848936823),(18904579,'阮凡桃',15,'阮凡桃','2019-11-27 03:33:20',327745538,1848936823),(18904580,'章秋珊',16,'章秋珊','2019-11-27 05:56:52',327745537,271878519),(18904581,'诸寄瑶',17,'诸寄瑶','2019-11-27 06:27:15',327745538,271878519),(18904582,'帆小帆',12,'帆小帆','2019-11-27 06:28:59',327745539,271878519),(18904583,'花寒荷',9,'花寒荷','2019-11-27 06:50:04',327745539,271878519),(18904584,'秦半晴',18,'秦半晴','2019-11-27 06:54:55',327745538,271878519),(18904585,'莫夜云',76687,'莫夜云','2019-11-27 07:08:51',327745538,271878519),(18904586,'房妞妞',12,'房妞妞','2019-11-27 08:48:03',327745539,271878519),(18904631,'邓雁桃',76684,'邓雁桃','2019-12-03 06:32:32',327745538,607553911),(18904588,'孙和泰',76687,'孙和泰','2019-11-28 06:22:12',327745539,605756942),(18904589,'伊冰海',76691,'伊冰海','2019-11-28 06:32:20',327745539,3056109685),(18904590,'张泉析',22,'张泉析','2019-11-28 06:47:41',327745539,271878519),(18904591,'花颜醉',21,'花颜醉','2019-11-28 07:02:54',327745539,271878519),(18904592,'呼延凝蕊',24,'呼延凝蕊','2019-11-28 07:30:16',327745539,605756942),(18904615,'羊舌丹蓝',12,'羊舌丹蓝','2019-11-29 10:52:35',327745539,3610610039),(18904616,'百里傲泪',76685,'百里傲泪','2019-11-29 10:58:50',327745539,3610610039),(18904617,'乐正初夏',25,'乐正初夏','2019-11-29 12:16:03',327745539,1014721125),(18904618,'凡帅锅1',76685,'凡帅锅1','2019-12-02 02:00:15',327745539,506956151),(18904619,'韩飞官',76692,'韩飞官','2019-12-02 02:12:57',327745539,506956151),(18904620,'凡帅锅2',76692,'凡帅锅2','2019-12-02 02:14:13',327745539,506956151),(18904621,'梦成空',76683,'梦成空','2019-12-02 03:02:52',327745539,506956151),(18904622,'傅靖雁',76693,'傅靖雁','2019-12-02 06:14:54',327745539,506956151),(18904623,'项宏爽',76686,'项宏爽','2019-12-02 06:59:03',327745539,506956151),(18904624,'酔红颜',76683,'酔红颜','2019-12-02 07:33:49',327745538,506956151),(18904625,'公良海露',76693,'公良海露','2019-12-02 10:42:39',327745538,506956151),(18904626,'庄星语',76692,'庄星语','2019-12-03 05:45:02',327745538,607553911),(18904627,'公孙妆妍',76692,'公孙妆妍','2019-12-03 05:46:16',327745538,607553911),(18904628,'莫映阳',76683,'莫映阳','2019-12-03 05:47:14',327745539,607553911),(18904629,'蒋春雁',76692,'蒋春雁','2019-12-03 05:53:27',327745538,607553911),(18904632,'东郭寒凡',76694,'东郭寒凡','2019-12-03 07:39:07',327745537,454954679),(18904633,'方代萱',76695,'方代萱','2019-12-04 10:25:12',327745537,485718634),(18904634,'公西盈芳',76696,'公西盈芳','2019-12-04 10:26:13',327745537,485718634),(18904635,'东郭寻绿',76697,'东郭寻绿','2019-12-04 10:32:41',327745537,485718634),(18904636,'燕芷文',76698,'燕芷文','2019-12-04 10:47:02',327745537,485718634),(18904637,'范修德',25,'范修德','2019-12-04 12:29:01',327745537,2675468901),(18904638,'第一绮兰',76699,'第一绮兰','2019-12-05 09:45:55',327745537,112398263),(18904639,'鲁丰羽',76700,'鲁丰羽','2019-12-05 11:18:46',327745537,2042554807),(18904640,'怀红莲',26,'怀红莲','2019-12-09 06:48:40',327745537,2194941048),(18904641,'林紫青',27,'林紫青','2019-12-09 06:49:09',327745537,2194941048),(18904642,'夏侯丹甄',28,'夏侯丹甄','2019-12-10 02:22:54',327745537,2194941048),(18904643,'屈紫菱',29,'屈紫菱','2019-12-10 03:18:45',327745537,2194941048),(18904644,'司马弘致',30,'司马弘致','2019-12-10 06:56:11',327745537,4131491133),(18904645,'司空思山',76701,'司空思山','2019-12-13 09:25:05',327745537,603159146),(18904646,'欧纱菱',31,'欧纱菱','2019-12-16 07:21:18',327745537,603159146),(18904647,'席馨芳',32,'席馨芳','2019-12-16 07:23:15',327745537,3863344012),(18904648,'繁花院络',34,'繁花院络','2019-12-17 07:49:47',327745537,603159146),(18904649,'李璞玉',35,'李璞玉','2019-12-17 11:58:54',327745537,2152695925),(18904650,'龙青文',76703,'龙青文','2019-12-19 08:16:29',327745537,1713866869),(18904651,'吴凝竹',76704,'吴凝竹','2019-12-20 11:32:06',327745537,116047655),(18904652,'高承允',76705,'高承允','2019-12-20 16:34:44',327745537,2568747118),(18904653,'彭浩天',76705,'彭浩天','2019-12-20 18:07:15',327745537,2568747118),(18904654,'燕凡儿',76706,'燕凡儿','2019-12-21 01:27:20',327745537,137828719),(18904655,'龙水鹰',76687,'龙水鹰','2019-12-21 02:21:07',327745537,348806111),(18904656,'章孤丝',76707,'章孤丝','2019-12-21 03:26:49',327745537,352564597),(18904657,'况涵意',76708,'况涵意','2019-12-21 03:36:16',327745537,3666911012),(18904658,'卫沛槐',76709,'卫沛槐','2019-12-21 04:28:45',327745537,1518228993),(18904659,'闻诗蕾',76710,'闻诗蕾','2019-12-21 04:40:24',327745537,1667262687),(18904660,'花泰平',76711,'花泰平','2019-12-21 04:52:40',327745537,1156798943),(18904661,'狐狸女王。',76712,'狐狸女王。','2019-12-21 05:01:52',327745537,3321756855),(18904662,'钟离康裕',76713,'钟离康裕','2019-12-21 06:51:56',327745537,3507290224),(18904663,'东门绮山',76714,'东门绮山','2019-12-21 06:56:28',327745537,101567159),(18904664,'万盼仪',76715,'万盼仪','2019-12-21 07:29:49',327745537,1910934708),(18904665,'柳靖仪',76715,'柳靖仪','2019-12-21 07:31:05',327745537,1910934708),(18904666,'绝版货',76716,'绝版货','2019-12-21 09:37:08',327745537,1629597404),(18904667,'舒哲皓',76717,'舒哲皓','2019-12-21 11:40:04',327745537,1533210234),(18904668,'师建树',76709,'师建树','2019-12-21 11:58:30',327745537,3682489857),(18904669,'东皇永乙',76718,'东皇永乙','2019-12-22 03:29:01',327745537,444501877),(18904670,'司马听筠',76719,'司马听筠','2019-12-22 05:41:56',327745537,4120084519),(18904671,'韩语蓉',76720,'韩语蓉','2019-12-22 05:52:25',327745537,1639974506),(18904672,'拓跋明刚',76721,'拓跋明刚','2019-12-22 07:52:09',327745537,2455987569),(18904673,'梁丘德辉',76722,'梁丘德辉','2019-12-22 08:12:11',327745537,724898671),(18904674,'呼延鹏海',76723,'呼延鹏海','2019-12-22 08:58:20',327745537,4171608175),(18904675,'莫尐绮',76724,'莫尐绮','2019-12-22 12:40:38',327745537,3999469168),(18904676,'林雪瑶',76725,'林雪瑶','2019-12-22 14:01:43',327745537,2298964191),(18904677,'梦之泪伤',76726,'梦之泪伤','2019-12-22 21:20:07',327745537,3728794488),(18904678,'霍海菡',76727,'霍海菡','2019-12-23 05:27:10',327745537,2409864667),(18904679,'步听筠',76728,'步听筠','2019-12-23 05:42:07',327745537,738595642),(18904680,'唐易真',76729,'唐易真','2019-12-23 07:08:26',327745537,2370492126),(18904681,'齐希儿',76730,'齐希儿','2019-12-23 10:15:36',327745537,3223195319),(18904682,'巫马念寒',76731,'巫马念寒','2019-12-24 01:54:55',327745537,4100897909),(18904683,'叶天玉',76730,'叶天玉','2019-12-24 11:34:46',327745537,3223195319),(18904684,'孔梦玉',76687,'孔梦玉','2019-12-24 11:35:51',327745537,46753905),(18904685,'蒋听安',76732,'蒋听安','2019-12-25 02:16:40',327745537,1619267255),(18904686,'司空寄云',76733,'司空寄云','2019-12-25 09:27:33',327745537,389319131),(18904687,'闾丘书南',76687,'闾丘书南','2019-12-25 09:33:25',327745537,1150114673),(18904688,'宗烁亭',76687,'宗烁亭','2019-12-25 09:49:47',327745537,1150114673),(18904691,'沈高超',76687,'沈高超','2019-12-25 09:53:16',327745537,1150114673),(18904690,'碎碎念',76687,'碎碎念','2019-12-25 09:50:56',327745537,1150114673),(18904692,'龙傲天',76734,'龙傲天','2019-12-26 01:10:25',327745537,389319131),(18904693,'陈天晴',76735,'陈天晴','2019-12-26 02:49:58',327745537,3058973557),(18904694,'闻俊楚',76738,'闻俊楚','2019-12-26 03:36:39',327745537,3140782555),(18904695,'阳阳',76730,'阳阳','2019-12-28 08:36:51',327745537,2876795493),(18904696,'厉天蓝',76730,'厉天蓝','2019-12-28 10:24:15',327745538,2876795493),(18904697,'蓝寻芹',76730,'蓝寻芹','2019-12-28 10:26:24',327745537,2876795493),(18904698,'南门绿兰',76742,'南门绿兰','2020-01-02 02:23:51',327745537,1588832692),(18904699,'狄千万',76743,'狄千万','2020-01-08 05:27:08',327745537,1588832692),(18904700,'闻人灵寒',76744,'闻人灵寒','2020-01-09 05:29:13',327745537,565186487),(18904701,'庄以蓝',76743,'庄以蓝','2020-01-09 09:44:42',327745537,1588832692),(18904702,'伍映寒',37,'伍映寒','2020-01-09 14:19:14',327745537,829839217),(18904703,'司马凌香',38,'司马凌香','2020-01-09 15:06:45',13107201,829839217),(18904704,'乔冷菱',39,'乔冷菱','2020-01-09 16:20:48',13107201,2876795493),(18904705,'凡帅锅锅',39,'凡帅锅锅','2020-01-10 04:05:54',13107201,2105287995),(18904706,'梁叶灵',40,'梁叶灵','2020-01-10 15:54:19',13107201,3669956980),(18904707,'景世程',39,'景世程','2020-01-11 17:52:50',13107201,3669956980),(18904708,'天帝',41,'天帝','2020-01-12 03:07:49',13107201,1588832692),(18904709,'羊舌秋蝶',76745,'羊舌秋蝶','2020-01-12 12:56:38',327745537,2876795493),(18904710,'段紫雪',76746,'段紫雪','2020-01-15 09:22:33',327745537,3682095066);
/*!40000 ALTER TABLE `CHARNAME` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CHARNAME_0909`
--

DROP TABLE IF EXISTS `CHARNAME_0909`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CHARNAME_0909` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` char(32) NOT NULL DEFAULT '',
  `ACCID` int(10) unsigned NOT NULL DEFAULT '0',
  `ACCOUNT` char(48) NOT NULL DEFAULT '',
  `CREATETIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ZONE` int(10) unsigned NOT NULL DEFAULT '0',
  `CREATEIP` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ZONE_NAME` (`ZONE`,`NAME`) USING BTREE,
  KEY `ACCID` (`ACCID`) USING BTREE,
  KEY `ACCOUNT` (`ACCOUNT`) USING BTREE,
  KEY `NAME` (`NAME`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CHARNAME_0909`
--

LOCK TABLES `CHARNAME_0909` WRITE;
/*!40000 ALTER TABLE `CHARNAME_0909` DISABLE KEYS */;
/*!40000 ALTER TABLE `CHARNAME_0909` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CHARNAME_7330`
--

DROP TABLE IF EXISTS `CHARNAME_7330`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CHARNAME_7330` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` char(32) NOT NULL DEFAULT '',
  `ACCID` int(10) unsigned NOT NULL DEFAULT '0',
  `ACCOUNT` char(48) NOT NULL DEFAULT '',
  `CREATETIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ZONE` int(10) unsigned NOT NULL DEFAULT '0',
  `CREATEIP` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ZONE_NAME` (`ZONE`,`NAME`) USING BTREE,
  KEY `ACCID` (`ACCID`) USING BTREE,
  KEY `ACCOUNT` (`ACCOUNT`) USING BTREE,
  KEY `NAME` (`NAME`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=14996278 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CHARNAME_7330`
--

LOCK TABLES `CHARNAME_7330` WRITE;
/*!40000 ALTER TABLE `CHARNAME_7330` DISABLE KEYS */;
/*!40000 ALTER TABLE `CHARNAME_7330` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CHONGMING`
--

DROP TABLE IF EXISTS `CHONGMING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CHONGMING` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `NAME` char(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CHONGMING`
--

LOCK TABLES `CHONGMING` WRITE;
/*!40000 ALTER TABLE `CHONGMING` DISABLE KEYS */;
/*!40000 ALTER TABLE `CHONGMING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CHONGMING_DEL_BAK`
--

DROP TABLE IF EXISTS `CHONGMING_DEL_BAK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CHONGMING_DEL_BAK` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` char(32) NOT NULL DEFAULT '',
  `ACCID` int(10) unsigned NOT NULL DEFAULT '0',
  `ACCOUNT` char(48) NOT NULL DEFAULT '',
  `CREATETIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ZONE` int(10) unsigned NOT NULL DEFAULT '0',
  `CREATEIP` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ZONE_NAME` (`ZONE`,`NAME`) USING BTREE,
  KEY `ACCID` (`ACCID`) USING BTREE,
  KEY `ACCOUNT` (`ACCOUNT`) USING BTREE,
  KEY `NAME` (`NAME`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=17724617 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CHONGMING_DEL_BAK`
--

LOCK TABLES `CHONGMING_DEL_BAK` WRITE;
/*!40000 ALTER TABLE `CHONGMING_DEL_BAK` DISABLE KEYS */;
/*!40000 ALTER TABLE `CHONGMING_DEL_BAK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CHONGMING_UPDATE_BAK`
--

DROP TABLE IF EXISTS `CHONGMING_UPDATE_BAK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CHONGMING_UPDATE_BAK` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` char(32) NOT NULL DEFAULT '',
  `ACCID` int(10) unsigned NOT NULL DEFAULT '0',
  `ACCOUNT` char(48) NOT NULL DEFAULT '',
  `CREATETIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ZONE` int(10) unsigned NOT NULL DEFAULT '0',
  `CREATEIP` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ZONE_NAME` (`ZONE`,`NAME`) USING BTREE,
  KEY `ACCID` (`ACCID`) USING BTREE,
  KEY `ACCOUNT` (`ACCOUNT`) USING BTREE,
  KEY `NAME` (`NAME`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=17722994 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CHONGMING_UPDATE_BAK`
--

LOCK TABLES `CHONGMING_UPDATE_BAK` WRITE;
/*!40000 ALTER TABLE `CHONGMING_UPDATE_BAK` DISABLE KEYS */;
/*!40000 ALTER TABLE `CHONGMING_UPDATE_BAK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CHONGMING_UPDATE_BAK_bak`
--

DROP TABLE IF EXISTS `CHONGMING_UPDATE_BAK_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CHONGMING_UPDATE_BAK_bak` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` char(32) NOT NULL DEFAULT '',
  `ACCID` int(10) unsigned NOT NULL DEFAULT '0',
  `ACCOUNT` char(48) NOT NULL DEFAULT '',
  `CREATETIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ZONE` int(10) unsigned NOT NULL DEFAULT '0',
  `CREATEIP` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ZONE_NAME` (`ZONE`,`NAME`) USING BTREE,
  KEY `ACCID` (`ACCID`) USING BTREE,
  KEY `ACCOUNT` (`ACCOUNT`) USING BTREE,
  KEY `NAME` (`NAME`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=16409852 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CHONGMING_UPDATE_BAK_bak`
--

LOCK TABLES `CHONGMING_UPDATE_BAK_bak` WRITE;
/*!40000 ALTER TABLE `CHONGMING_UPDATE_BAK_bak` DISABLE KEYS */;
/*!40000 ALTER TABLE `CHONGMING_UPDATE_BAK_bak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CORPSNAME`
--

DROP TABLE IF EXISTS `CORPSNAME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CORPSNAME` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` char(32) NOT NULL DEFAULT '',
  `CREATETIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ZONE` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10051038 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CORPSNAME`
--

LOCK TABLES `CORPSNAME` WRITE;
/*!40000 ALTER TABLE `CORPSNAME` DISABLE KEYS */;
/*!40000 ALTER TABLE `CORPSNAME` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FIGHTTEAMNAME`
--

DROP TABLE IF EXISTS `FIGHTTEAMNAME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FIGHTTEAMNAME` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` char(32) NOT NULL DEFAULT '',
  `CREATETIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ZONE` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10000400 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FIGHTTEAMNAME`
--

LOCK TABLES `FIGHTTEAMNAME` WRITE;
/*!40000 ALTER TABLE `FIGHTTEAMNAME` DISABLE KEYS */;
/*!40000 ALTER TABLE `FIGHTTEAMNAME` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STATISTICS`
--

DROP TABLE IF EXISTS `STATISTICS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STATISTICS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE` varchar(100) NOT NULL DEFAULT '',
  `ZONE` int(11) NOT NULL DEFAULT '0',
  `COUNT` int(11) NOT NULL DEFAULT '0',
  `ZONENAME` varchar(100) NOT NULL DEFAULT '',
  `LASTUPDATETIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ZONE_DATE` (`ZONE`,`DATE`) USING BTREE,
  KEY `DATE` (`DATE`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STATISTICS`
--

LOCK TABLES `STATISTICS` WRITE;
/*!40000 ALTER TABLE `STATISTICS` DISABLE KEYS */;
/*!40000 ALTER TABLE `STATISTICS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WORLD_ORDER`
--

DROP TABLE IF EXISTS `WORLD_ORDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WORLD_ORDER` (
  `charid` int(11) unsigned NOT NULL DEFAULT '0',
  `charname` varchar(32) NOT NULL DEFAULT '',
  `type` int(11) unsigned NOT NULL DEFAULT '0',
  `area` int(11) unsigned NOT NULL DEFAULT '0',
  `country` int(11) unsigned NOT NULL DEFAULT '0',
  `profession` int(11) unsigned NOT NULL DEFAULT '0',
  `value` int(11) unsigned NOT NULL DEFAULT '0',
  `zoneid` int(11) unsigned NOT NULL DEFAULT '0',
  `zonename` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`charid`,`type`),
  KEY `index_value` (`value`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORLD_ORDER`
--

LOCK TABLES `WORLD_ORDER` WRITE;
/*!40000 ALTER TABLE `WORLD_ORDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `WORLD_ORDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `name_2_200`
--

DROP TABLE IF EXISTS `name_2_200`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `name_2_200` (
  `insertid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `zoneid` int(10) unsigned NOT NULL DEFAULT '0',
  `ownerid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `ownername` varchar(64) NOT NULL DEFAULT '',
  `insertname` varchar(64) NOT NULL DEFAULT '',
  `createip` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`insertid`),
  UNIQUE KEY `insertname` (`insertname`,`zoneid`)
) ENGINE=MyISAM AUTO_INCREMENT=1000001 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `name_2_200`
--

LOCK TABLES `name_2_200` WRITE;
/*!40000 ALTER TABLE `name_2_200` DISABLE KEYS */;
INSERT INTO `name_2_200` VALUES (1000000,13107201,18904706,'梁叶灵','137137',0);
/*!40000 ALTER TABLE `name_2_200` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `name_2_5001`
--

DROP TABLE IF EXISTS `name_2_5001`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `name_2_5001` (
  `insertid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `zoneid` int(10) unsigned NOT NULL DEFAULT '0',
  `ownerid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `ownername` varchar(64) NOT NULL DEFAULT '',
  `insertname` varchar(64) NOT NULL DEFAULT '',
  `createip` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`insertid`),
  UNIQUE KEY `insertname` (`insertname`,`zoneid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1000018 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `name_2_5001`
--

LOCK TABLES `name_2_5001` WRITE;
/*!40000 ALTER TABLE `name_2_5001` DISABLE KEYS */;
INSERT INTO `name_2_5001` VALUES (1000000,327745537,18904390,'天天向上','请输入帮会名',0),(1000001,327745537,18904386,'比麒城主','比麒城内阁',0),(1000002,327745538,18904407,'公冶含巧','我，比麒城主',0),(1000003,327745538,18904413,'是不是有毒','帮会[电脑]',0),(1000004,327745538,18904414,'南宫南霜','李维森',0),(1000005,327745538,18904414,'南宫南霜','111',0),(1000006,327745537,18904552,'ç¥–å®‰çŠ¶å…ƒ','æ¬¢è¿Žæ¥åˆ°ç¥–å®‰',0),(1000007,327745537,18904549,'å¤ªå”å‹çµ','è‚¥å®…å¿«ä¹å¸®',0),(1000008,327745537,18904553,'秦丹巧','洪·兴·社',0),(1000009,327745537,18904549,'太叔友灵','单挑',0),(1000010,327745538,18904566,'我不想奋斗了','等待富婆领养',0),(1000011,327745539,18904582,'帆小帆','睡够365',0),(1000012,327745538,18904570,'韧韧脚','电饭煲的',0),(1000013,327745539,18904618,'凡帅锅1','天下第一',0),(1000014,327745539,18904620,'凡帅锅2','天下第二',0),(1000015,327745539,18904621,'梦成空','请输入帮会名',0),(1000016,327745537,18904688,'宗烁亭','职业玩家',0),(1000017,327745537,18904699,'狄千万','撒大声地',0);
/*!40000 ALTER TABLE `name_2_5001` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `SDKServer`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `SDKServer` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `SDKServer`;

--
-- Table structure for table `app_types`
--

DROP TABLE IF EXISTS `app_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_types`
--

LOCK TABLES `app_types` WRITE;
/*!40000 ALTER TABLE `app_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apps`
--

DROP TABLE IF EXISTS `apps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `pay_notice_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `os_type_id` int(11) NOT NULL,
  `app_type_id` int(11) NOT NULL,
  `language_type_id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `summary` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `simple_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `login_url` varchar(128) COLLATE utf8_unicode_ci DEFAULT '',
  `imei_blacklist` varchar(19999) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_apps_on_key` (`key`) USING BTREE,
  UNIQUE KEY `index_apps_on_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5003 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apps`
--

LOCK TABLES `apps` WRITE;
/*!40000 ALTER TABLE `apps` DISABLE KEYS */;
INSERT INTO `apps` VALUES (200,2,'95f2b9c76d7ec82bc08e78503c15a556','复古传奇','xx_pay_notice',1,1,1,1,1,'','','fgcq',4,'2019-09-25 16:30:35','2019-09-26 10:25:58','','xx_pay_notice');
/*!40000 ALTER TABLE `apps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creater_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_companies_on_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creating_orders`
--

DROP TABLE IF EXISTS `creating_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creating_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `platform_id` int(11) DEFAULT NULL,
  `my_order_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `server_id` int(11) DEFAULT NULL,
  `game_account_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `item_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `real_price` decimal(10,2) NOT NULL,
  `ideal_price` decimal(10,2) NOT NULL,
  `role_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `ext` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notify_url_id` int(11) NOT NULL,
  `status` int(11) DEFAULT '1',
  `pay_platid` int(11) DEFAULT '0',
  `account` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_creating_orders_on_app_id_and_my_order_id` (`app_id`,`my_order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2067 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creating_orders`
--

LOCK TABLES `creating_orders` WRITE;
/*!40000 ALTER TABLE `creating_orders` DISABLE KEYS */;
INSERT INTO `creating_orders` VALUES (1867,5001,2,1,'2019103017324218671572427962',327745538,1,18904437,'1',600.00,600.00,'欧伟宗','2019-10-30 17:32:42',NULL,'',423,1,1,NULL),(1868,5001,2,1,'2019103017324618681572427966',327745538,1,18904437,'1',600.00,600.00,'欧伟宗','2019-10-30 17:32:46',NULL,'',423,1,1,NULL),(1869,5001,2,1,'2019103017325518691572427975',327745538,1,18904437,'1',600.00,600.00,'欧伟宗','2019-10-30 17:32:55',NULL,'',423,1,1,NULL),(1870,5001,2,1,'2019103017515118701572429111',327745538,2,18904438,'1',600.00,600.00,'骆香薇','2019-10-30 17:51:51',NULL,'',423,1,1,NULL),(1871,5001,2,1,'2019110615382418711573025904',327745538,2,18904438,'1',600.00,600.00,'骆香薇','2019-11-06 15:38:24',NULL,'',423,1,1,NULL),(1872,5001,2,1,'2019110615384018721573025920',327745538,2,18904438,'1',600.00,600.00,'骆香薇','2019-11-06 15:38:40',NULL,'',423,1,1,NULL),(1873,5001,2,1,'2019110715523018731573113150',327745538,1,18904437,'1',600.00,600.00,'欧伟宗','2019-11-07 15:52:30',NULL,'',423,1,1,NULL),(1874,5001,2,1,'2019110715531018741573113190',327745538,1,18904437,'2',3000.00,3000.00,'欧伟宗','2019-11-07 15:53:10',NULL,'',423,1,1,NULL),(1875,5001,2,1,'2019110715541218751573113252',327745538,1,18904437,'1',600.00,600.00,'欧伟宗','2019-11-07 15:54:12',NULL,'',423,1,1,NULL),(1876,5001,2,1,'2019111110072318761573438043',327745538,5,18904481,'5',32800.00,32800.00,'任芷蝶','2019-11-11 10:07:23',NULL,'',423,1,1,NULL),(1877,5001,2,1,'2019111214154018771573539340',327745538,6,18904513,'1',600.00,600.00,'詹天路','2019-11-12 14:15:40',NULL,'',423,1,1,NULL),(1878,5001,2,1,'2019111214390918781573540749',327745538,6,18904513,'1',600.00,600.00,'詹天路','2019-11-12 14:39:09',NULL,'',423,1,1,NULL),(1879,5001,2,1,'2019112017222818791574241748',327745538,10,18904563,'9',589800.00,589800.00,'钟离天睿','2019-11-20 17:22:28',NULL,'',423,1,1,NULL),(1880,5001,2,1,'2019112110264918801574303209',327745538,11,18904565,'9',589800.00,589800.00,'司空映寒','2019-11-21 10:26:49',NULL,'',423,1,1,NULL),(1881,5001,2,1,'2019112111304318811574307043',327745538,11,18904565,'9',589800.00,589800.00,'司空映寒','2019-11-21 11:30:43',NULL,'',423,1,1,NULL),(1882,5001,2,1,'2019112618305918821574764259',327745537,13,18904575,'2',3000.00,3000.00,'铞鎯裆','2019-11-26 18:30:59',NULL,'',423,1,1,NULL),(1883,5001,2,1,'2019112618320918831574764329',327745537,13,18904575,'2',3000.00,3000.00,'铞鎯裆','2019-11-26 18:32:09',NULL,'',423,1,1,NULL),(1884,5001,2,1,'2019112618323818841574764358',327745537,13,18904575,'3',9800.00,9800.00,'铞鎯裆','2019-11-26 18:32:38',NULL,'',423,1,1,NULL),(1885,5001,2,1,'2019112619100918851574766609',327745538,14,18904576,'2',3000.00,3000.00,'井幻竹','2019-11-26 19:10:09',NULL,'',423,1,1,NULL),(1886,5001,2,1,'2019112710024318861574820163',327745538,9,18904577,'1',600.00,600.00,'舒沛春','2019-11-27 10:02:43',NULL,'',423,1,1,NULL),(1887,5001,2,1,'2019112710030318871574820183',327745538,9,18904577,'1',600.00,600.00,'舒沛春','2019-11-27 10:03:03',NULL,'',423,1,1,NULL),(1888,5001,2,1,'2019112710393518881574822375',327745538,9,18904577,'1',600.00,600.00,'舒沛春','2019-11-27 10:39:35',NULL,'',423,1,1,NULL),(1889,5001,2,1,'2019112710442318891574822663',327745538,9,18904577,'1',600.00,600.00,'舒沛春','2019-11-27 10:44:23',NULL,'',423,1,1,NULL),(1890,5001,2,1,'2019112711323918901574825559',327745538,9,18904577,'1',600.00,600.00,'舒沛春','2019-11-27 11:32:39',NULL,'',423,1,1,NULL),(1891,5001,2,1,'2019112711332918911574825609',327745538,15,18904579,'1',600.00,600.00,'阮凡桃','2019-11-27 11:33:29',NULL,'',423,1,1,NULL),(1892,5001,2,1,'2019112711333118921574825611',327745538,15,18904579,'1',600.00,600.00,'阮凡桃','2019-11-27 11:33:31',NULL,'',423,1,1,NULL),(1893,5001,2,1,'2019112711333318931574825613',327745538,15,18904579,'1',600.00,600.00,'阮凡桃','2019-11-27 11:33:33',NULL,'',423,1,1,NULL),(1894,5001,2,1,'2019112711333418941574825614',327745538,15,18904579,'1',600.00,600.00,'阮凡桃','2019-11-27 11:33:34',NULL,'',423,1,1,NULL),(1895,5001,2,1,'2019112711333518951574825615',327745538,15,18904579,'1',600.00,600.00,'阮凡桃','2019-11-27 11:33:35',NULL,'',423,1,1,NULL),(1896,5001,2,1,'2019112711333718961574825617',327745538,15,18904579,'6',64800.00,64800.00,'阮凡桃','2019-11-27 11:33:37',NULL,'',423,1,1,NULL),(1897,5001,2,1,'2019112711334118971574825621',327745538,15,18904579,'1',600.00,600.00,'阮凡桃','2019-11-27 11:33:41',NULL,'',423,1,1,NULL),(1898,5001,2,1,'2019112711334218981574825622',327745538,15,18904579,'1',600.00,600.00,'阮凡桃','2019-11-27 11:33:42',NULL,'',423,1,1,NULL),(1899,5001,2,1,'2019112711334218991574825622',327745538,15,18904579,'1',600.00,600.00,'阮凡桃','2019-11-27 11:33:42',NULL,'',423,1,1,NULL),(1900,5001,2,1,'2019112711334319001574825623',327745538,15,18904579,'2',3000.00,3000.00,'阮凡桃','2019-11-27 11:33:43',NULL,'',423,1,1,NULL),(1901,5001,2,1,'2019112711334319011574825623',327745538,15,18904579,'2',3000.00,3000.00,'阮凡桃','2019-11-27 11:33:43',NULL,'',423,1,1,NULL),(1902,5001,2,1,'2019112711334419021574825624',327745538,15,18904579,'1',600.00,600.00,'阮凡桃','2019-11-27 11:33:44',NULL,'',423,1,1,NULL),(1903,5001,2,1,'2019112711335219031574825632',327745538,15,18904579,'1',600.00,600.00,'阮凡桃','2019-11-27 11:33:52',NULL,'',423,1,1,NULL),(1904,5001,2,1,'2019112711335819041574825638',327745538,15,18904579,'1',600.00,600.00,'阮凡桃','2019-11-27 11:33:58',NULL,'',423,1,1,NULL),(1905,5001,2,1,'2019112711395819051574825998',327745538,15,18904579,'1',600.00,600.00,'阮凡桃','2019-11-27 11:39:58',NULL,'',423,1,1,NULL),(1906,5001,2,1,'2019112711445019061574826290',327745538,15,18904579,'1',600.00,600.00,'阮凡桃','2019-11-27 11:44:50',NULL,'',423,1,1,NULL),(1907,5001,2,1,'2019112711445319071574826293',327745538,15,18904579,'1',600.00,600.00,'阮凡桃','2019-11-27 11:44:53',NULL,'',423,1,1,NULL),(1908,5001,2,1,'2019112711445419081574826294',327745538,15,18904579,'1',600.00,600.00,'阮凡桃','2019-11-27 11:44:54',NULL,'',423,1,1,NULL),(1909,5001,2,1,'2019112711445519091574826295',327745538,15,18904579,'1',600.00,600.00,'阮凡桃','2019-11-27 11:44:55',NULL,'',423,1,1,NULL),(1910,5001,2,1,'2019112711445619101574826296',327745538,15,18904579,'1',600.00,600.00,'阮凡桃','2019-11-27 11:44:56',NULL,'',423,1,1,NULL),(1911,5001,2,1,'2019112712264519111574828805',327745538,9,18904577,'1',600.00,600.00,'舒沛春','2019-11-27 12:26:45',NULL,'',423,1,1,NULL),(1912,5001,2,1,'2019112712342719121574829267',327745538,9,18904577,'1',600.00,600.00,'舒沛春','2019-11-27 12:34:27',NULL,'',423,1,1,NULL),(1913,5001,2,1,'2019112713570119131574834221',327745537,16,18904580,'1',600.00,600.00,'章秋珊','2019-11-27 13:57:01',NULL,'',423,1,1,NULL),(1914,5001,2,1,'2019112714272719141574836047',327745538,17,18904581,'1',600.00,600.00,'诸寄瑶','2019-11-27 14:27:27',NULL,'',423,1,1,NULL),(1915,5001,2,1,'2019112714272919151574836049',327745538,17,18904581,'1',600.00,600.00,'诸寄瑶','2019-11-27 14:27:29',NULL,'',423,1,1,NULL),(1916,5001,2,1,'2019112714274219161574836062',327745538,17,18904581,'3',9800.00,9800.00,'诸寄瑶','2019-11-27 14:27:42',NULL,'',423,1,1,NULL),(1917,5001,2,1,'2019112714275219171574836072',327745538,17,18904581,'1',600.00,600.00,'诸寄瑶','2019-11-27 14:27:52',NULL,'',423,1,1,NULL),(1918,5001,2,1,'2019112714280419181574836084',327745538,17,18904581,'1',600.00,600.00,'诸寄瑶','2019-11-27 14:28:04',NULL,'',423,1,1,NULL),(1919,5001,2,1,'2019112714280519191574836085',327745538,17,18904581,'2',3000.00,3000.00,'诸寄瑶','2019-11-27 14:28:05',NULL,'',423,1,1,NULL),(1920,5001,2,1,'2019112714280619201574836086',327745538,17,18904581,'2',3000.00,3000.00,'诸寄瑶','2019-11-27 14:28:06',NULL,'',423,1,1,NULL),(1921,5001,2,1,'2019112714294919211574836189',327745538,17,18904581,'1',600.00,600.00,'诸寄瑶','2019-11-27 14:29:49',NULL,'',423,1,1,NULL),(1922,5001,2,1,'2019112714295219221574836192',327745538,17,18904581,'1',600.00,600.00,'诸寄瑶','2019-11-27 14:29:52',NULL,'',423,1,1,NULL),(1923,5001,2,1,'2019112714303019231574836230',327745538,17,18904581,'1',600.00,600.00,'诸寄瑶','2019-11-27 14:30:30',NULL,'',423,1,1,NULL),(1924,5001,2,1,'2019112714303119241574836231',327745538,17,18904581,'2',3000.00,3000.00,'诸寄瑶','2019-11-27 14:30:31',NULL,'',423,1,1,NULL),(1925,5001,2,1,'2019112714303219251574836232',327745538,17,18904581,'1',600.00,600.00,'诸寄瑶','2019-11-27 14:30:32',NULL,'',423,1,1,NULL),(1926,5001,2,1,'2019112714335519261574836435',327745538,17,18904581,'1',600.00,600.00,'诸寄瑶','2019-11-27 14:33:55',NULL,'',423,1,1,NULL),(1927,5001,2,1,'2019112714362919271574836589',327745538,17,18904581,'1',600.00,600.00,'诸寄瑶','2019-11-27 14:36:29',NULL,'',423,1,1,NULL),(1928,5001,2,1,'2019112714365419281574836614',327745538,17,18904581,'1',600.00,600.00,'诸寄瑶','2019-11-27 14:36:54',NULL,'',423,1,1,NULL),(1929,5001,2,1,'2019112714370319291574836623',327745538,17,18904581,'1',600.00,600.00,'诸寄瑶','2019-11-27 14:37:03',NULL,'',423,1,1,NULL),(1930,5001,2,1,'2019112714501619301574837416',327745539,9,18904583,'6',64800.00,64800.00,'花寒荷','2019-11-27 14:50:16',NULL,'',423,1,1,NULL),(1931,5001,2,1,'2019112714502419311574837424',327745539,9,18904583,'1',600.00,600.00,'花寒荷','2019-11-27 14:50:24',NULL,'',423,1,1,NULL),(1932,5001,2,1,'2019112714550819321574837708',327745538,18,18904584,'1',600.00,600.00,'秦半晴','2019-11-27 14:55:08',NULL,'',423,1,1,NULL),(1933,5001,2,1,'2019112715011919331574838079',327745538,9,18904577,'1',600.00,600.00,'舒沛春','2019-11-27 15:01:19',NULL,'',423,1,1,NULL),(1934,5001,2,1,'2019112715540819341574841248',327745538,18,18904584,'1',600.00,600.00,'秦半晴','2019-11-27 15:54:08',NULL,'',423,1,1,NULL),(1935,5001,2,1,'2019112715544119351574841281',327745538,18,18904584,'3',1.00,1.00,'秦半晴','2019-11-27 15:54:41',NULL,'',423,1,1,NULL),(1936,5001,2,1,'2019112716215019361574842910',327745538,9,18904577,'1',600.00,600.00,'舒沛春','2019-11-27 16:21:50',NULL,'',423,1,1,NULL),(1937,5001,2,1,'2019112716215119371574842911',327745538,9,18904577,'1',600.00,600.00,'舒沛春','2019-11-27 16:21:51',NULL,'',423,1,1,NULL),(1938,5001,2,1,'2019112716215719381574842917',327745538,9,18904577,'1',600.00,600.00,'舒沛春','2019-11-27 16:21:57',NULL,'',423,1,1,NULL),(1939,5001,2,1,'2019112716215919391574842919',327745538,9,18904577,'1',600.00,600.00,'舒沛春','2019-11-27 16:21:59',NULL,'',423,1,1,NULL),(1940,5001,2,1,'2019112719000119401574852401',327745539,12,18904574,'5',32800.00,32800.00,'一二','2019-11-27 19:00:01',NULL,'',423,1,1,NULL),(1941,5001,2,1,'2019112719022719411574852547',327745539,12,18904574,'3',9800.00,9800.00,'一二','2019-11-27 19:02:27',NULL,'',423,1,1,NULL),(1942,5001,2,1,'2019112719022819421574852548',327745539,12,18904574,'6',64800.00,64800.00,'一二','2019-11-27 19:02:28',NULL,'',423,1,1,NULL),(1943,5001,2,1,'2019112719022819431574852548',327745539,12,18904574,'6',64800.00,64800.00,'一二','2019-11-27 19:02:28',NULL,'',423,1,1,NULL),(1944,5001,2,1,'2019112719022919441574852549',327745539,12,18904574,'8',259800.00,259800.00,'一二','2019-11-27 19:02:29',NULL,'',423,1,1,NULL),(1945,5001,2,1,'2019112719023019451574852550',327745539,12,18904574,'7',129800.00,129800.00,'一二','2019-11-27 19:02:30',NULL,'',423,1,1,NULL),(1946,5001,2,1,'2019112719023019461574852550',327745539,12,18904574,'4',19800.00,19800.00,'一二','2019-11-27 19:02:30',NULL,'',423,1,1,NULL),(1947,5001,2,1,'2019112719023119471574852551',327745539,12,18904574,'6',64800.00,64800.00,'一二','2019-11-27 19:02:31',NULL,'',423,1,1,NULL),(1948,5001,2,1,'2019112813425219481574919772',327745539,12,18904574,'3',9800.00,9800.00,'一二','2019-11-28 13:42:52',NULL,'',423,1,1,NULL),(1949,5001,2,1,'2019112814482319491574923703',327745539,22,18904590,'1',600.00,600.00,'张泉析','2019-11-28 14:48:23',NULL,'',423,1,1,NULL),(1950,5001,2,1,'2019120914484919501575874129',327745537,26,18904640,'1',600.00,600.00,'怀红莲','2019-12-09 14:48:49',NULL,'',423,1,1,NULL),(1951,5001,2,1,'2019121010230719511575944587',327745537,28,18904642,'1',600.00,600.00,'夏侯丹甄','2019-12-10 10:23:07',NULL,'',423,1,1,NULL),(1952,5001,2,1,'2019121010231219521575944592',327745537,28,18904642,'1',600.00,600.00,'夏侯丹甄','2019-12-10 10:23:12',NULL,'',423,1,1,NULL),(1953,5001,2,1,'2019121010231519531575944595',327745537,28,18904642,'1',600.00,600.00,'夏侯丹甄','2019-12-10 10:23:15',NULL,'',423,1,1,NULL),(1954,5001,2,1,'2019121010232819541575944608',327745537,28,18904642,'1',600.00,600.00,'夏侯丹甄','2019-12-10 10:23:28',NULL,'',423,1,1,NULL),(1955,5001,2,1,'2019121010233519551575944615',327745537,28,18904642,'1',600.00,600.00,'夏侯丹甄','2019-12-10 10:23:35',NULL,'',423,1,1,NULL),(1956,5001,2,1,'2019121010233719561575944617',327745537,28,18904642,'1',600.00,600.00,'夏侯丹甄','2019-12-10 10:23:37',NULL,'',423,1,1,NULL),(1957,5001,2,1,'2019121010280619571575944886',327745537,28,18904642,'1',600.00,600.00,'夏侯丹甄','2019-12-10 10:28:06',NULL,'',423,1,1,NULL),(1958,5001,2,1,'2019121010281719581575944897',327745537,28,18904642,'1',600.00,600.00,'夏侯丹甄','2019-12-10 10:28:17',NULL,'',423,1,1,NULL),(1959,5001,2,1,'2019121010281819591575944898',327745537,28,18904642,'1',600.00,600.00,'夏侯丹甄','2019-12-10 10:28:18',NULL,'',423,1,1,NULL),(1960,5001,2,1,'2019121010281919601575944899',327745537,28,18904642,'1',600.00,600.00,'夏侯丹甄','2019-12-10 10:28:19',NULL,'',423,1,1,NULL),(1961,5001,2,1,'2019121010294219611575944982',327745537,28,18904642,'2',3000.00,3000.00,'夏侯丹甄','2019-12-10 10:29:42',NULL,'',423,1,1,NULL),(1962,5001,2,1,'2019121011185119621575947931',327745537,29,18904643,'1',600.00,600.00,'屈紫菱','2019-12-10 11:18:51',NULL,'',423,1,1,NULL),(1963,5001,2,1,'2019121014563519631575960995',327745537,30,18904644,'2',3000.00,3000.00,'司马弘致','2019-12-10 14:56:35',NULL,'',423,1,1,NULL),(1964,5001,2,1,'2019121014564019641575961000',327745537,30,18904644,'2',3000.00,3000.00,'司马弘致','2019-12-10 14:56:40',NULL,'',423,1,1,NULL),(1965,5001,2,1,'2019121014564519651575961005',327745537,30,18904644,'1',600.00,600.00,'司马弘致','2019-12-10 14:56:45',NULL,'',423,1,1,NULL),(1966,5001,2,1,'2019121014564619661575961006',327745537,30,18904644,'1',600.00,600.00,'司马弘致','2019-12-10 14:56:46',NULL,'',423,1,1,NULL),(1967,5001,2,1,'2019121014564719671575961007',327745537,30,18904644,'1',600.00,600.00,'司马弘致','2019-12-10 14:56:47',NULL,'',423,1,1,NULL),(1968,5001,2,1,'2019121014564719681575961007',327745537,30,18904644,'1',600.00,600.00,'司马弘致','2019-12-10 14:56:47',NULL,'',423,1,1,NULL),(1969,5001,2,1,'2019121014564819691575961008',327745537,30,18904644,'4',19800.00,19800.00,'司马弘致','2019-12-10 14:56:48',NULL,'',423,1,1,NULL),(1970,5001,2,1,'2019121014564819701575961008',327745537,30,18904644,'5',32800.00,32800.00,'司马弘致','2019-12-10 14:56:48',NULL,'',423,1,1,NULL),(1971,5001,2,1,'2019121014564919711575961009',327745537,30,18904644,'6',64800.00,64800.00,'司马弘致','2019-12-10 14:56:49',NULL,'',423,1,1,NULL),(1972,5001,2,1,'2019121014564919721575961009',327745537,30,18904644,'6',64800.00,64800.00,'司马弘致','2019-12-10 14:56:49',NULL,'',423,1,1,NULL),(1973,5001,2,1,'2019121014565019731575961010',327745537,30,18904644,'6',64800.00,64800.00,'司马弘致','2019-12-10 14:56:50',NULL,'',423,1,1,NULL),(1974,5001,2,1,'2019121014572019741575961040',327745537,30,18904644,'6',64800.00,64800.00,'司马弘致','2019-12-10 14:57:20',NULL,'',423,1,1,NULL),(1975,5001,2,1,'2019121014572219751575961042',327745537,30,18904644,'3',9800.00,9800.00,'司马弘致','2019-12-10 14:57:22',NULL,'',423,1,1,NULL),(1976,5001,2,1,'2019121014572319761575961043',327745537,30,18904644,'3',9800.00,9800.00,'司马弘致','2019-12-10 14:57:23',NULL,'',423,1,1,NULL),(1977,5001,2,1,'2019121014572319771575961043',327745537,30,18904644,'3',9800.00,9800.00,'司马弘致','2019-12-10 14:57:23',NULL,'',423,1,1,NULL),(1978,5001,2,1,'2019121014572419781575961044',327745537,30,18904644,'3',9800.00,9800.00,'司马弘致','2019-12-10 14:57:24',NULL,'',423,1,1,NULL),(1979,5001,2,1,'2019121014572419791575961044',327745537,30,18904644,'3',9800.00,9800.00,'司马弘致','2019-12-10 14:57:24',NULL,'',423,1,1,NULL),(1980,5001,2,1,'2019121014572519801575961045',327745537,30,18904644,'6',64800.00,64800.00,'司马弘致','2019-12-10 14:57:25',NULL,'',423,1,1,NULL),(1981,5001,2,1,'2019121014572719811575961047',327745537,30,18904644,'3',9800.00,9800.00,'司马弘致','2019-12-10 14:57:27',NULL,'',423,1,1,NULL),(1982,5001,2,1,'2019121014574319821575961063',327745537,30,18904644,'1',600.00,600.00,'司马弘致','2019-12-10 14:57:43',NULL,'',423,1,1,NULL),(1983,5001,2,1,'2019121014574419831575961064',327745537,30,18904644,'1',600.00,600.00,'司马弘致','2019-12-10 14:57:44',NULL,'',423,1,1,NULL),(1984,5001,2,1,'2019121014574419841575961064',327745537,30,18904644,'1',600.00,600.00,'司马弘致','2019-12-10 14:57:44',NULL,'',423,1,1,NULL),(1985,5001,2,1,'2019121014583119851575961111',327745537,30,18904644,'1',600.00,600.00,'司马弘致','2019-12-10 14:58:31',NULL,'',423,1,1,NULL),(1986,5001,2,1,'2019121014583219861575961112',327745537,30,18904644,'4',19800.00,19800.00,'司马弘致','2019-12-10 14:58:32',NULL,'',423,1,1,NULL),(1987,5001,2,1,'2019121014583219871575961112',327745537,30,18904644,'5',32800.00,32800.00,'司马弘致','2019-12-10 14:58:32',NULL,'',423,1,1,NULL),(1988,5001,2,1,'2019121014583319881575961113',327745537,30,18904644,'3',9800.00,9800.00,'司马弘致','2019-12-10 14:58:33',NULL,'',423,1,1,NULL),(1989,5001,2,1,'2019121014583919891575961119',327745537,30,18904644,'3',9800.00,9800.00,'司马弘致','2019-12-10 14:58:39',NULL,'',423,1,1,NULL),(1990,5001,2,1,'2019121014591919901575961159',327745537,30,18904644,'3',9800.00,9800.00,'司马弘致','2019-12-10 14:59:19',NULL,'',423,1,1,NULL),(1991,5001,2,1,'2019121014592019911575961160',327745537,30,18904644,'3',9800.00,9800.00,'司马弘致','2019-12-10 14:59:20',NULL,'',423,1,1,NULL),(1992,5001,2,1,'2019121015072719921575961647',327745537,30,18904644,'1',600.00,600.00,'司马弘致','2019-12-10 15:07:27',NULL,'',423,1,1,NULL),(1993,5001,2,1,'2019121015072719931575961647',327745537,30,18904644,'1',600.00,600.00,'司马弘致','2019-12-10 15:07:27',NULL,'',423,1,1,NULL),(1994,5001,2,1,'2019121015072819941575961648',327745537,30,18904644,'1',600.00,600.00,'司马弘致','2019-12-10 15:07:28',NULL,'',423,1,1,NULL),(1995,5001,2,1,'2019121015073119951575961651',327745537,30,18904644,'3',9800.00,9800.00,'司马弘致','2019-12-10 15:07:31',NULL,'',423,1,1,NULL),(1996,5001,2,1,'2019121015073119961575961651',327745537,30,18904644,'3',9800.00,9800.00,'司马弘致','2019-12-10 15:07:31',NULL,'',423,1,1,NULL),(1997,5001,2,1,'2019121015073319971575961653',327745537,30,18904644,'3',9800.00,9800.00,'司马弘致','2019-12-10 15:07:33',NULL,'',423,1,1,NULL),(1998,5001,2,1,'2019121015073419981575961654',327745537,30,18904644,'2',3000.00,3000.00,'司马弘致','2019-12-10 15:07:34',NULL,'',423,1,1,NULL),(1999,5001,2,1,'2019121015073419991575961654',327745537,30,18904644,'5',32800.00,32800.00,'司马弘致','2019-12-10 15:07:34',NULL,'',423,1,1,NULL),(2000,5001,2,1,'2019121015073520001575961655',327745537,30,18904644,'5',32800.00,32800.00,'司马弘致','2019-12-10 15:07:35',NULL,'',423,1,1,NULL),(2001,5001,2,1,'2019121015073520011575961655',327745537,30,18904644,'5',32800.00,32800.00,'司马弘致','2019-12-10 15:07:35',NULL,'',423,1,1,NULL),(2002,5001,2,1,'2019121015073620021575961656',327745537,30,18904644,'6',64800.00,64800.00,'司马弘致','2019-12-10 15:07:36',NULL,'',423,1,1,NULL),(2003,5001,2,1,'2019121015073620031575961656',327745537,30,18904644,'6',64800.00,64800.00,'司马弘致','2019-12-10 15:07:36',NULL,'',423,1,1,NULL),(2004,5001,2,1,'2019121018044720041575972287',327745537,27,18904641,'6',64800.00,64800.00,'林紫青','2019-12-10 18:04:47',NULL,'',423,1,1,NULL),(2005,5001,2,1,'2019121018044920051575972289',327745537,27,18904641,'6',64800.00,64800.00,'林紫青','2019-12-10 18:04:49',NULL,'',423,1,1,NULL),(2006,5001,2,1,'2019121018045020061575972290',327745537,27,18904641,'4',19800.00,19800.00,'林紫青','2019-12-10 18:04:50',NULL,'',423,1,1,NULL),(2007,5001,2,1,'2019121018045020071575972290',327745537,27,18904641,'3',9800.00,9800.00,'林紫青','2019-12-10 18:04:50',NULL,'',423,1,1,NULL),(2008,5001,2,1,'2019121615232720081576481007',327745537,32,18904647,'1',600.00,600.00,'席馨芳','2019-12-16 15:23:27',NULL,'',423,1,1,NULL),(2009,5001,2,1,'2019121615583320091576483113',327745537,32,18904647,'1',600.00,600.00,'席馨芳','2019-12-16 15:58:33',NULL,'',423,1,1,NULL),(2010,5001,2,1,'2019121615590620101576483146',327745537,32,18904647,'1',600.00,600.00,'席馨芳','2019-12-16 15:59:06',NULL,'',423,1,1,NULL),(2011,5001,2,1,'2019121615595120111576483191',327745537,32,18904647,'1',600.00,600.00,'席馨芳','2019-12-16 15:59:51',NULL,'',423,1,1,NULL),(2012,5001,2,1,'2019121616184720121576484327',327745537,32,18904647,'1',600.00,600.00,'席馨芳','2019-12-16 16:18:47',NULL,'',423,1,1,NULL),(2013,5001,2,1,'2019121616185520131576484335',327745537,32,18904647,'1',600.00,600.00,'席馨芳','2019-12-16 16:18:55',NULL,'',423,1,1,NULL),(2014,5001,2,1,'2019121616220020141576484520',327745537,32,18904647,'1',600.00,600.00,'席馨芳','2019-12-16 16:22:00',NULL,'',423,1,1,NULL),(2015,5001,2,1,'2019121617315920151576488719',327745537,32,18904647,'1',600.00,600.00,'席馨芳','2019-12-16 17:31:59',NULL,'',423,1,1,NULL),(2016,5001,2,1,'2019121618110720161576491067',327745537,32,18904647,'1',600.00,600.00,'席馨芳','2019-12-16 18:11:07',NULL,'',423,1,1,NULL),(2017,5001,2,1,'2019121618111620171576491076',327745537,32,18904647,'1',600.00,600.00,'席馨芳','2019-12-16 18:11:16',NULL,'',423,1,1,NULL),(2018,5001,2,1,'2019121715502920181576569029',327745537,34,18904648,'1',600.00,600.00,'繁花院络','2019-12-17 15:50:29',NULL,'',423,1,1,NULL),(2019,5001,2,1,'2019121715524820191576569168',327745537,34,18904648,'1',600.00,600.00,'繁花院络','2019-12-17 15:52:48',NULL,'',423,1,1,NULL),(2020,5001,2,1,'2019121715530020201576569180',327745537,34,18904648,'1',600.00,600.00,'繁花院络','2019-12-17 15:53:00',NULL,'',423,1,1,NULL),(2021,5001,2,1,'2019121715531020211576569190',327745537,34,18904648,'2',3000.00,3000.00,'繁花院络','2019-12-17 15:53:10',NULL,'',423,1,1,NULL),(2022,5001,2,1,'2019121715555220221576569352',327745537,34,18904648,'1',600.00,600.00,'繁花院络','2019-12-17 15:55:52',NULL,'',423,1,1,NULL),(2023,5001,2,1,'2019121715573020231576569450',327745537,34,18904648,'2',3000.00,3000.00,'繁花院络','2019-12-17 15:57:30',NULL,'',423,1,1,NULL),(2024,5001,2,1,'2019121715575220241576569472',327745537,34,18904648,'1',600.00,600.00,'繁花院络','2019-12-17 15:57:52',NULL,'',423,1,1,NULL),(2025,5001,2,1,'2019121715594420251576569584',327745537,34,18904648,'1',600.00,600.00,'繁花院络','2019-12-17 15:59:44',NULL,'',423,1,1,NULL),(2026,5001,2,1,'2019121716040120261576569841',327745537,34,18904648,'1',600.00,600.00,'繁花院络','2019-12-17 16:04:01',NULL,'',423,1,1,NULL),(2027,5001,2,1,'2019121716103320271576570233',327745537,34,18904648,'1',600.00,600.00,'繁花院络','2019-12-17 16:10:33',NULL,'',423,1,1,NULL),(2028,5001,2,1,'2019121716144020281576570480',327745537,34,18904648,'1',600.00,600.00,'繁花院络','2019-12-17 16:14:40',NULL,'',423,1,1,NULL),(2029,5001,2,1,'2019121716285520291576571335',327745537,34,18904648,'1',600.00,600.00,'繁花院络','2019-12-17 16:28:55',NULL,'',423,1,1,NULL),(2030,5001,2,1,'2019121716354920301576571749',327745537,34,18904648,'1',600.00,600.00,'繁花院络','2019-12-17 16:35:49',NULL,'',423,1,1,NULL),(2031,5001,2,1,'2019121716360220311576571762',327745537,34,18904648,'1',600.00,600.00,'繁花院络','2019-12-17 16:36:02',NULL,'',423,1,1,NULL),(2032,5001,2,1,'2019121716423220321576572152',327745537,34,18904648,'1',600.00,600.00,'繁花院络','2019-12-17 16:42:32',NULL,'',423,1,1,NULL),(2033,5001,2,1,'2019121716442220331576572262',327745537,34,18904648,'1',600.00,600.00,'繁花院络','2019-12-17 16:44:22',NULL,'',423,1,1,NULL),(2034,5001,2,1,'2019121716480720341576572487',327745537,34,18904648,'1',600.00,600.00,'繁花院络','2019-12-17 16:48:07',NULL,'',423,1,1,NULL),(2035,5001,2,1,'2019121716495420351576572594',327745537,34,18904648,'1',600.00,600.00,'繁花院络','2019-12-17 16:49:54',NULL,'',423,1,1,NULL),(2036,5001,2,1,'2019121717043620361576573476',327745537,34,18904648,'1',600.00,600.00,'繁花院络','2019-12-17 17:04:36',NULL,'',423,1,1,NULL),(2037,5001,2,1,'2019121717044320371576573483',327745537,34,18904648,'1',600.00,600.00,'繁花院络','2019-12-17 17:04:43',NULL,'',423,1,1,NULL),(2038,5001,2,1,'2019121717063420381576573594',327745537,34,18904648,'1',600.00,600.00,'繁花院络','2019-12-17 17:06:34',NULL,'',423,1,1,NULL),(2039,5001,2,1,'2019121717102620391576573826',327745537,34,18904648,'1',600.00,600.00,'繁花院络','2019-12-17 17:10:26',NULL,'',423,1,1,NULL),(2040,5001,2,1,'2019121717141220401576574052',327745537,34,18904648,'1',600.00,600.00,'繁花院络','2019-12-17 17:14:12',NULL,'',423,1,1,NULL),(2041,5001,2,1,'2019121717203220411576574432',327745537,34,18904648,'1',600.00,600.00,'繁花院络','2019-12-17 17:20:32',NULL,'',423,1,1,NULL),(2042,5001,2,1,'2019121717273520421576574855',327745537,34,18904648,'1',600.00,600.00,'繁花院络','2019-12-17 17:27:35',NULL,'',423,1,1,NULL),(2043,5001,2,1,'2019121717322220431576575142',327745537,34,18904648,'1',600.00,600.00,'繁花院络','2019-12-17 17:32:22',NULL,'',423,1,1,NULL),(2044,5001,2,1,'2019121717375320441576575473',327745537,34,18904648,'1',600.00,600.00,'繁花院络','2019-12-17 17:37:53',NULL,'',423,1,1,NULL),(2045,5001,2,1,'2019121717413420451576575694',327745537,34,18904648,'1',600.00,600.00,'繁花院络','2019-12-17 17:41:34',NULL,'',423,1,1,NULL),(2046,5001,2,1,'2019121717474320461576576063',327745537,34,18904648,'1',600.00,600.00,'繁花院络','2019-12-17 17:47:43',NULL,'',423,1,1,NULL),(2047,5001,2,1,'2019121717474520471576576065',327745537,34,18904648,'1',600.00,600.00,'繁花院络','2019-12-17 17:47:45',NULL,'',423,1,1,NULL),(2048,5001,2,1,'2019121717474820481576576068',327745537,34,18904648,'1',600.00,600.00,'繁花院络','2019-12-17 17:47:48',NULL,'',423,1,1,NULL),(2049,5001,2,1,'2019121717482520491576576105',327745537,34,18904648,'1',600.00,600.00,'繁花院络','2019-12-17 17:48:25',NULL,'',423,1,1,NULL),(2050,5001,2,1,'2019121717563720501576576597',327745537,34,18904648,'1',600.00,600.00,'繁花院络','2019-12-17 17:56:37',NULL,'',423,1,1,NULL),(2051,5001,2,1,'2019121718001220511576576812',327745537,34,18904648,'1',600.00,600.00,'繁花院络','2019-12-17 18:00:12',NULL,'',423,1,1,NULL),(2052,5001,2,1,'2019121718045320521576577093',327745537,34,18904648,'1',600.00,600.00,'繁花院络','2019-12-17 18:04:53',NULL,'',423,1,1,NULL),(2053,5001,2,1,'2019121718075220531576577272',327745537,34,18904648,'1',600.00,600.00,'繁花院络','2019-12-17 18:07:52',NULL,'',423,1,1,NULL),(2054,5001,2,1,'2019121718104620541576577446',327745537,34,18904648,'1',600.00,600.00,'繁花院络','2019-12-17 18:10:46',NULL,'',423,1,1,NULL),(2055,5001,2,1,'2019121718161620551576577776',327745537,34,18904648,'1',600.00,600.00,'繁花院络','2019-12-17 18:16:16',NULL,'',423,1,1,NULL),(2056,5001,2,1,'2019121718163520561576577795',327745537,34,18904648,'1',600.00,600.00,'繁花院络','2019-12-17 18:16:35',NULL,'',423,1,1,NULL),(2057,5001,2,1,'2019121719595420571576583994',327745537,35,18904649,'1',600.00,600.00,'李璞玉','2019-12-17 19:59:54',NULL,'',423,1,1,NULL),(2058,5001,2,1,'2019122315180920581577085489',327745537,32,18904647,'1',600.00,600.00,'席馨芳','2019-12-23 15:18:09',NULL,'',423,1,1,NULL),(2059,5001,2,1,'2019122315185520591577085535',327745537,32,18904647,'1',600.00,600.00,'席馨芳','2019-12-23 15:18:55',NULL,'',423,1,1,NULL),(2060,200,2,1,'2020010923070920601578582429',13107201,38,18904703,'1',600.00,600.00,'司马凌香','2020-01-09 23:07:09',NULL,'',602,1,1,NULL),(2061,200,2,1,'2020010923071520611578582435',13107201,38,18904703,'6',64800.00,64800.00,'司马凌香','2020-01-09 23:07:15',NULL,'',602,1,1,NULL),(2062,200,2,1,'2020010923075720621578582477',13107201,38,18904703,'1',600.00,600.00,'司马凌香','2020-01-09 23:07:57',NULL,'',602,1,1,NULL),(2063,200,2,1,'2020010923091420631578582554',13107201,38,18904703,'1',600.00,600.00,'司马凌香','2020-01-09 23:09:14',NULL,'',602,1,1,NULL),(2064,200,2,1,'2020010923094820641578582588',13107201,38,18904703,'2',3000.00,3000.00,'司马凌香','2020-01-09 23:09:48',NULL,'',602,1,1,NULL),(2065,200,2,1,'2020011000210920651578586869',13107201,39,18904704,'1',600.00,600.00,'乔冷菱','2020-01-10 00:21:09',NULL,'',602,1,1,NULL),(2066,200,2,1,'2020011000211320661578586873',13107201,39,18904704,'1',600.00,600.00,'乔冷菱','2020-01-10 00:21:13',NULL,'',602,1,1,NULL);
/*!40000 ALTER TABLE `creating_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distribution_infos`
--

DROP TABLE IF EXISTS `distribution_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distribution_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL,
  `distributor_id` int(11) NOT NULL,
  `dist_app_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `dist_app_key` varchar(64) COLLATE utf8_unicode_ci DEFAULT '',
  `dist_app_secret` varchar(64) COLLATE utf8_unicode_ci DEFAULT '',
  `dist_app_vendor` varchar(64) COLLATE utf8_unicode_ci DEFAULT '',
  `dist_app_public_key` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `dist_app_private_key` text COLLATE utf8_unicode_ci,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_distribution_infos_unique` (`app_id`,`distributor_id`,`dist_app_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distribution_infos`
--

LOCK TABLES `distribution_infos` WRITE;
/*!40000 ALTER TABLE `distribution_infos` DISABLE KEYS */;
INSERT INTO `distribution_infos` VALUES (1,200,1,'200','3506','23181bf43caf93ba9064061838dcc4d7','','','[]','2019-08-28 10:55:17','2019-09-02 18:50:18',NULL,0);
/*!40000 ALTER TABLE `distribution_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distributors`
--

DROP TABLE IF EXISTS `distributors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distributors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `abbrev` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `verify_session_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `verify_order_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_distributors_on_abbrev` (`abbrev`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distributors`
--

LOCK TABLES `distributors` WRITE;
/*!40000 ALTER TABLE `distributors` DISABLE KEYS */;
INSERT INTO `distributors` VALUES (1,'QuickSdk','quick','http://checkuser.sdk.skymoons.net/v2/checkUserInfo','','2017-03-11 14:56:23','2017-03-11 14:56:23');
/*!40000 ALTER TABLE `distributors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_emails_on_email` (`email`) USING BTREE,
  KEY `index_emails_on_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails`
--

LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_types`
--

DROP TABLE IF EXISTS `language_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_types`
--

LOCK TABLES `language_types` WRITE;
/*!40000 ALTER TABLE `language_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `language_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_infos`
--

DROP TABLE IF EXISTS `login_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL,
  `uid` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `account` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nickname` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `refresh_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expire_in` int(11) DEFAULT NULL,
  `extdata` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_login_infos_on_app_id_and_uid` (`app_id`,`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_infos`
--

LOCK TABLES `login_infos` WRITE;
/*!40000 ALTER TABLE `login_infos` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `namespaces`
--

DROP TABLE IF EXISTS `namespaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `namespaces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `owner_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `company_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_namespaces_on_name` (`name`) USING BTREE,
  KEY `index_namespaces_on_owner_id` (`owner_id`) USING BTREE,
  KEY `index_namespaces_on_path` (`path`) USING BTREE,
  KEY `index_namespaces_on_type` (`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `namespaces`
--

LOCK TABLES `namespaces` WRITE;
/*!40000 ALTER TABLE `namespaces` DISABLE KEYS */;
/*!40000 ALTER TABLE `namespaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notify_urls`
--

DROP TABLE IF EXISTS `notify_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notify_urls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `md5` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `url` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_notify_urls_on_app_id_and_md5` (`app_id`,`md5`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=609 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notify_urls`
--

LOCK TABLES `notify_urls` WRITE;
/*!40000 ALTER TABLE `notify_urls` DISABLE KEYS */;
INSERT INTO `notify_urls` VALUES (423,5001,2,'d41d8cd98f00b204e9800998ecf8427e','','2019-10-30 17:32:42','2019-10-30 17:32:42',193),(602,200,2,'d41d8cd98f00b204e9800998ecf8427e','','2020-01-09 23:07:09','2020-01-09 23:07:09',7);
/*!40000 ALTER TABLE `notify_urls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_notifications`
--

DROP TABLE IF EXISTS `order_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL,
  `my_order_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `theirs_order_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `notifying_status` int(11) NOT NULL DEFAULT '1',
  `notifying_count` int(11) NOT NULL DEFAULT '1',
  `next_time` datetime NOT NULL DEFAULT '2014-03-13 19:55:39',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `params` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_order_notifications_on_app_id_and_my_order_id` (`app_id`,`my_order_id`) USING BTREE,
  KEY `notify_condition` (`notifying_status`,`notifying_count`,`next_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_notifications`
--

LOCK TABLES `order_notifications` WRITE;
/*!40000 ALTER TABLE `order_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL,
  `user_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `my_order_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `theirs_order_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `real_price` decimal(10,2) NOT NULL,
  `ideal_price` decimal(10,2) NOT NULL,
  `order_status` int(11) NOT NULL DEFAULT '1',
  `notifying_status` int(11) NOT NULL DEFAULT '1',
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `os_type_id` int(11) DEFAULT '1',
  `platform_id` int(11) DEFAULT '0',
  `times` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_orders_on_app_id_and_my_order_id` (`app_id`,`my_order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,5001,'18904579','2019112711333418941574825614','ZZYFZFB20191127113418133878',1.00,1.00,1,1,1,1,'2019-11-27 14:34:08','2019-11-27 14:34:08',1,1,1),(2,5001,'18904584','2019112715544119351574841281','ZZYFZFB20191127155508734421',1.00,1.00,1,1,1,1,'2019-11-27 15:55:23','2019-11-27 15:55:23',1,1,1),(3,5001,'18904648','2019121718075220531576577272','WZYFWX20191217180755142479',600.00,600.00,1,4,1,0,'2019-12-17 18:10:57',NULL,1,1,1),(4,5001,'18904648','2019121718104620541576577446','WZYFWX20191217181049819007',600.00,600.00,1,4,1,0,'2019-12-17 18:11:01',NULL,1,1,1),(5,5001,'18904648','2019121718163520561576577795','WZYFWX20191217181637590027',600.00,600.00,1,1,1,1,'2019-12-17 18:16:51','2019-12-17 18:16:51',1,1,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `os_types`
--

DROP TABLE IF EXISTS `os_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `os_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `os_types`
--

LOCK TABLES `os_types` WRITE;
/*!40000 ALTER TABLE `os_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `os_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_extensions`
--

DROP TABLE IF EXISTS `payment_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_extensions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `creating_order_id` int(11) NOT NULL,
  `diamond_count` int(11) NOT NULL,
  `ext` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_payment_extensions_on_order_id` (`order_id`) USING BTREE,
  UNIQUE KEY `index_payment_extensions_on_creating_order_id` (`creating_order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_extensions`
--

LOCK TABLES `payment_extensions` WRITE;
/*!40000 ALTER TABLE `payment_extensions` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `issues_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `wall_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `merge_requests_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `wiki_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `namespace_id` int(11) DEFAULT NULL,
  `issues_tracker` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'xuyu',
  `issues_tracker_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `snippets_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `last_activity_at` datetime DEFAULT NULL,
  `import_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visibility_level` int(11) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `import_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_projects_on_user_id` (`user_id`) USING BTREE,
  KEY `index_projects_on_last_activity_at` (`last_activity_at`) USING BTREE,
  KEY `index_projects_on_namespace_id` (`namespace_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secret_key_infos`
--

DROP TABLE IF EXISTS `secret_key_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `secret_key_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `distribution_info_id` int(11) NOT NULL,
  `secret_key_info` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `app_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secret_key_infos`
--

LOCK TABLES `secret_key_infos` WRITE;
/*!40000 ALTER TABLE `secret_key_infos` DISABLE KEYS */;
/*!40000 ALTER TABLE `secret_key_infos` ENABLE KEYS */;
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
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qq` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mobile` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tel` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_developer` tinyint(1) DEFAULT '0',
  `approved` tinyint(1) DEFAULT '0',
  `developer_type` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
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
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_access` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `notification_level` int(11) NOT NULL DEFAULT '3',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_projects`
--

DROP TABLE IF EXISTS `users_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `project_access` int(11) NOT NULL DEFAULT '0',
  `notification_level` int(11) NOT NULL DEFAULT '3',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_projects`
--

LOCK TABLES `users_projects` WRITE;
/*!40000 ALTER TABLE `users_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_hooks`
--

DROP TABLE IF EXISTS `web_hooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_hooks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_hooks`
--

LOCK TABLES `web_hooks` WRITE;
/*!40000 ALTER TABLE `web_hooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_hooks` ENABLE KEYS */;
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
  `mysql_server_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `redis_server_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `rethink_server_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `user_zone_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_zone_infos_on_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone_infos`
--

LOCK TABLES `zone_infos` WRITE;
/*!40000 ALTER TABLE `zone_infos` DISABLE KEYS */;
/*!40000 ALTER TABLE `zone_infos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-16 10:30:34
