-- MySQL dump 10.13  Distrib 5.5.62, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: GMServer
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
-- Table structure for table `gm_account_games`
--

DROP TABLE IF EXISTS `gm_account_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_account_games` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `accid` int(10) unsigned NOT NULL DEFAULT '0',
  `gameid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_gameid_accid` (`accid`,`gameid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gm_account_games`
--

LOCK TABLES `gm_account_games` WRITE;
/*!40000 ALTER TABLE `gm_account_games` DISABLE KEYS */;
INSERT INTO `gm_account_games` VALUES (1,1001,200),(2,1001,5001);
/*!40000 ALTER TABLE `gm_account_games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gm_act_control`
--

DROP TABLE IF EXISTS `gm_act_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_act_control` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gameid` int(10) unsigned NOT NULL DEFAULT '0',
  `packid` int(10) unsigned NOT NULL DEFAULT '0',
  `platid` int(10) unsigned NOT NULL DEFAULT '0',
  `actid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `actname` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `state` int(10) unsigned NOT NULL DEFAULT '0',
  `stime` int(10) unsigned NOT NULL DEFAULT '0',
  `etime` int(10) unsigned NOT NULL DEFAULT '0',
  `gmid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `gameid` (`gameid`) USING BTREE,
  KEY `packid_platid` (`packid`,`platid`) USING BTREE,
  KEY `stime` (`stime`) USING BTREE,
  KEY `etime` (`etime`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gm_act_control`
--

LOCK TABLES `gm_act_control` WRITE;
/*!40000 ALTER TABLE `gm_act_control` DISABLE KEYS */;
/*!40000 ALTER TABLE `gm_act_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gm_blackwhitelist`
--

DROP TABLE IF EXISTS `gm_blackwhitelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_blackwhitelist` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gameid` int(10) unsigned NOT NULL DEFAULT '0',
  `zoneid` int(10) unsigned NOT NULL DEFAULT '0',
  `subgameid` int(10) unsigned NOT NULL DEFAULT '0',
  `charid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `charname` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gmid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `state` int(10) unsigned NOT NULL DEFAULT '0',
  `winrate` int(10) unsigned NOT NULL DEFAULT '0',
  `setchips` int(10) unsigned NOT NULL DEFAULT '0',
  `curchips` int(10) unsigned NOT NULL DEFAULT '0',
  `settimes` int(10) unsigned NOT NULL DEFAULT '0',
  `curtimes` int(10) unsigned NOT NULL DEFAULT '0',
  `itimes` int(10) unsigned NOT NULL DEFAULT '0',
  `recordtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `game_zone_charid` (`gameid`,`zoneid`,`charid`) USING BTREE,
  KEY `subgameid` (`subgameid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gm_blackwhitelist`
--

LOCK TABLES `gm_blackwhitelist` WRITE;
/*!40000 ALTER TABLE `gm_blackwhitelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `gm_blackwhitelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gm_broadcast`
--

DROP TABLE IF EXISTS `gm_broadcast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_broadcast` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gameid` int(10) unsigned NOT NULL DEFAULT '0',
  `zoneid` int(10) unsigned NOT NULL DEFAULT '0',
  `gmid` int(10) unsigned NOT NULL DEFAULT '0',
  `countryid` int(10) unsigned NOT NULL DEFAULT '0',
  `sceneid` int(10) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `nexttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `intervaltime` int(10) unsigned NOT NULL DEFAULT '0',
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint(2) NOT NULL DEFAULT '0',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_game` (`gameid`) USING BTREE,
  KEY `index_zone` (`zoneid`) USING BTREE,
  KEY `index_starttime` (`starttime`) USING BTREE,
  KEY `index_nexttime` (`nexttime`) USING BTREE,
  KEY `index_state` (`state`) USING BTREE,
  KEY `index_endtime` (`endtime`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gm_broadcast`
--

LOCK TABLES `gm_broadcast` WRITE;
/*!40000 ALTER TABLE `gm_broadcast` DISABLE KEYS */;
INSERT INTO `gm_broadcast` VALUES (1,5001,0,1001,0,0,1572941544,1572941604,1572941738,60,1,'测试一下','测试一下GM',0,1572941770),(2,5001,0,1001,0,0,1572941544,1572941604,1572941738,60,1,'测试一下','测试一下GM',0,1572941780),(3,5001,0,1001,0,0,1572941544,1573028124,1573028138,60,1,'测试一下','测试一下GM',0,1572941787),(4,5001,0,1001,0,0,1572941544,1573028124,1573028138,60,1,'测试一下','测试一下GM',0,1572941801),(5,5001,0,1001,0,0,1572941544,1573028124,1573028138,60,1,'测试一下','测试一下GM',0,1572941805);
/*!40000 ALTER TABLE `gm_broadcast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gm_chat_5001_2_20191106`
--

DROP TABLE IF EXISTS `gm_chat_5001_2_20191106`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_chat_5001_2_20191106` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cpid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `platid` int(10) unsigned NOT NULL DEFAULT '0',
  `accid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `charid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `charname` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `otherid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `othername` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_cpid` (`cpid`) USING BTREE,
  KEY `index_platid` (`platid`) USING BTREE,
  KEY `index_accid` (`accid`) USING BTREE,
  KEY `index_charid` (`charid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gm_chat_5001_2_20191106`
--

LOCK TABLES `gm_chat_5001_2_20191106` WRITE;
/*!40000 ALTER TABLE `gm_chat_5001_2_20191106` DISABLE KEYS */;
INSERT INTO `gm_chat_5001_2_20191106` VALUES (1,0,0,76665,18904452,'贼森777[vip0]',7,0,'','hello',1573018507),(2,0,0,76665,18904452,'贼森777[vip0]',7,0,'','[#211]',1573018854),(3,0,0,76665,18904452,'贼森777[vip0]',2,0,'','[#213]',1573018910),(4,0,0,76665,18904452,'贼森777[vip0]',2,0,'','打字 测试 ',1573018930),(5,0,0,76655,18904407,'打钱[vip11]',7,0,'','兄弟今晚攻城战不见不散，是兄弟就来砍我！',1573021888);
/*!40000 ALTER TABLE `gm_chat_5001_2_20191106` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gm_chat_5001_2_20191202`
--

DROP TABLE IF EXISTS `gm_chat_5001_2_20191202`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_chat_5001_2_20191202` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cpid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `platid` int(10) unsigned NOT NULL DEFAULT '0',
  `accid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `charid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `charname` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `otherid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `othername` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_cpid` (`cpid`) USING BTREE,
  KEY `index_platid` (`platid`) USING BTREE,
  KEY `index_accid` (`accid`) USING BTREE,
  KEY `index_charid` (`charid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gm_chat_5001_2_20191202`
--

LOCK TABLES `gm_chat_5001_2_20191202` WRITE;
/*!40000 ALTER TABLE `gm_chat_5001_2_20191202` DISABLE KEYS */;
INSERT INTO `gm_chat_5001_2_20191202` VALUES (1,0,0,76686,18904570,'韧韧脚[vip3]',7,0,'','sehfjnfg',1575279165);
/*!40000 ALTER TABLE `gm_chat_5001_2_20191202` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gm_chat_5001_2_20191203`
--

DROP TABLE IF EXISTS `gm_chat_5001_2_20191203`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_chat_5001_2_20191203` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cpid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `platid` int(10) unsigned NOT NULL DEFAULT '0',
  `accid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `charid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `charname` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `otherid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `othername` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_cpid` (`cpid`) USING BTREE,
  KEY `index_platid` (`platid`) USING BTREE,
  KEY `index_accid` (`accid`) USING BTREE,
  KEY `index_charid` (`charid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gm_chat_5001_2_20191203`
--

LOCK TABLES `gm_chat_5001_2_20191203` WRITE;
/*!40000 ALTER TABLE `gm_chat_5001_2_20191203` DISABLE KEYS */;
INSERT INTO `gm_chat_5001_2_20191203` VALUES (1,0,0,76683,18904624,'酔红颜[vip0]',6,0,'','dfff',1575341691),(2,0,0,76683,18904624,'酔红颜[vip0]',6,0,'','发发发',1575341916),(3,0,0,76684,18904571,'傲之猎马人[vip6]',6,0,'','iiii i',1575342502),(4,0,0,76683,18904624,'酔红颜[vip0]',6,0,'','aaa',1575343133),(5,0,0,76686,18904570,'韧韧脚[vip3]',7,0,'','的这种*直',1575352371),(6,0,0,76683,18904624,'酔红颜[vip0]',7,0,'','[#211]',1575352522),(7,0,0,76686,18904570,'韧韧脚[vip3]',7,0,'','[#204]',1575352536),(8,0,0,76683,18904624,'酔红颜[vip0]',7,0,'','[#202]',1575352567),(9,0,0,76683,18904624,'酔红颜[vip0]',7,0,'','[#215]',1575352571),(10,0,0,76683,18904624,'酔红颜[vip0]',7,0,'','[#283]',1575352579),(11,0,0,76686,18904570,'韧韧脚[vip3]',7,0,'','[#238]',1575352900),(12,0,0,76683,18904566,'我不想奋斗了[vip12]',7,0,'','[#206]',1575353152),(13,0,0,76686,18904570,'韧韧脚[vip3]',6,0,'','[#10158,0][#10147,0][#238]',1575354061),(14,0,0,76683,18904566,'我不想奋斗了[vip12]',2,0,'','菜',1575354078),(15,0,0,76686,18904570,'韧韧脚[vip3]',2,0,'','laji',1575354643),(16,0,0,76686,18904570,'韧韧脚[vip3]',2,0,'','[#271]',1575354657);
/*!40000 ALTER TABLE `gm_chat_5001_2_20191203` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gm_chat_5001_3_20191111`
--

DROP TABLE IF EXISTS `gm_chat_5001_3_20191111`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_chat_5001_3_20191111` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cpid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `platid` int(10) unsigned NOT NULL DEFAULT '0',
  `accid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `charid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `charname` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `otherid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `othername` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_cpid` (`cpid`) USING BTREE,
  KEY `index_platid` (`platid`) USING BTREE,
  KEY `index_accid` (`accid`) USING BTREE,
  KEY `index_charid` (`charid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gm_chat_5001_3_20191111`
--

LOCK TABLES `gm_chat_5001_3_20191111` WRITE;
/*!40000 ALTER TABLE `gm_chat_5001_3_20191111` DISABLE KEYS */;
INSERT INTO `gm_chat_5001_3_20191111` VALUES (1,0,0,76653,18904490,'凡帅锅2[vip0]',2,0,'','习近平',1573458531),(2,0,0,76653,18904490,'凡帅锅2[vip0]',1,18904490,'','习近平',1573458569),(3,0,0,76653,18904490,'凡帅锅2[vip0]',1,18904490,'','***',1573458577),(4,0,0,76653,18904490,'凡帅锅2[vip0]',1,18904490,'','***',1573459167);
/*!40000 ALTER TABLE `gm_chat_5001_3_20191111` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gm_chat_5001_3_20191203`
--

DROP TABLE IF EXISTS `gm_chat_5001_3_20191203`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_chat_5001_3_20191203` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cpid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `platid` int(10) unsigned NOT NULL DEFAULT '0',
  `accid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `charid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `charname` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `otherid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `othername` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_cpid` (`cpid`) USING BTREE,
  KEY `index_platid` (`platid`) USING BTREE,
  KEY `index_accid` (`accid`) USING BTREE,
  KEY `index_charid` (`charid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gm_chat_5001_3_20191203`
--

LOCK TABLES `gm_chat_5001_3_20191203` WRITE;
/*!40000 ALTER TABLE `gm_chat_5001_3_20191203` DISABLE KEYS */;
INSERT INTO `gm_chat_5001_3_20191203` VALUES (1,0,0,76686,18904623,'项宏爽[vip0]',7,0,'','drhfjf',1575352220);
/*!40000 ALTER TABLE `gm_chat_5001_3_20191203` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gm_cpay`
--

DROP TABLE IF EXISTS `gm_cpay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_cpay` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gameid` int(10) unsigned NOT NULL DEFAULT '0',
  `gmid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `packid` int(20) unsigned NOT NULL DEFAULT '0',
  `platid` int(10) unsigned NOT NULL DEFAULT '0',
  `payplatid` int(10) unsigned NOT NULL DEFAULT '0',
  `minlevel` int(10) unsigned NOT NULL DEFAULT '0',
  `maxlevel` int(10) unsigned NOT NULL DEFAULT '0',
  `minmoney` int(10) unsigned NOT NULL DEFAULT '0',
  `maxmoney` int(10) unsigned NOT NULL DEFAULT '0',
  `stime` int(10) unsigned NOT NULL DEFAULT '0',
  `etime` int(10) unsigned NOT NULL DEFAULT '0',
  `state` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `gameid` (`gameid`) USING BTREE,
  KEY `packid` (`packid`) USING BTREE,
  KEY `platid` (`platid`) USING BTREE,
  KEY `state` (`state`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gm_cpay`
--

LOCK TABLES `gm_cpay` WRITE;
/*!40000 ALTER TABLE `gm_cpay` DISABLE KEYS */;
/*!40000 ALTER TABLE `gm_cpay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gm_feedback`
--

DROP TABLE IF EXISTS `gm_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_feedback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gameid` int(10) unsigned NOT NULL DEFAULT '0',
  `zoneid` int(10) unsigned NOT NULL DEFAULT '0',
  `platid` int(10) unsigned NOT NULL DEFAULT '0',
  `charid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `charname` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userlevel` int(10) unsigned NOT NULL DEFAULT '0',
  `viplevel` int(10) unsigned NOT NULL DEFAULT '0',
  `feedbackid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `star` int(10) unsigned NOT NULL DEFAULT '0',
  `recordtime` int(10) unsigned NOT NULL DEFAULT '0',
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `action` int(10) unsigned NOT NULL DEFAULT '1',
  `reply` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phonenum` varchar(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `gamezone` (`gameid`,`zoneid`,`platid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gm_feedback`
--

LOCK TABLES `gm_feedback` WRITE;
/*!40000 ALTER TABLE `gm_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `gm_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gm_games`
--

DROP TABLE IF EXISTS `gm_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_games` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gameid` int(10) unsigned NOT NULL DEFAULT '0',
  `gamename` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gamelink` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gmlink` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gamekey` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gametype` int(10) unsigned NOT NULL DEFAULT '1',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_gameid_name` (`gameid`,`gamename`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gm_games`
--

LOCK TABLES `gm_games` WRITE;
/*!40000 ALTER TABLE `gm_games` DISABLE KEYS */;
/*!40000 ALTER TABLE `gm_games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gm_mail`
--

DROP TABLE IF EXISTS `gm_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_mail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gameid` int(10) unsigned NOT NULL DEFAULT '0',
  `zoneid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `gmid` int(10) unsigned NOT NULL DEFAULT '0',
  `charid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `attachment` varchar(300) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gold` int(10) unsigned NOT NULL DEFAULT '0',
  `goldbind` int(10) unsigned NOT NULL DEFAULT '0',
  `money` int(10) unsigned NOT NULL DEFAULT '0',
  `state` int(10) unsigned NOT NULL DEFAULT '0',
  `recordtime` int(10) unsigned NOT NULL DEFAULT '0',
  `ext` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `game_zone_charid` (`gameid`,`zoneid`,`charid`) USING BTREE,
  KEY `gmid` (`gmid`) USING BTREE,
  KEY `recordtime` (`recordtime`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1032 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gm_mail`
--

LOCK TABLES `gm_mail` WRITE;
/*!40000 ALTER TABLE `gm_mail` DISABLE KEYS */;
INSERT INTO `gm_mail` VALUES (1001,5001,1,0,1001,76730,'福利礼拜-元宝','1000000元宝','',0,0,0,0,1577523367,NULL),(1002,5001,1,0,1001,76730,'福利礼拜-元宝','1000000元宝','',0,0,0,0,1577523462,NULL),(1003,5001,1,0,1001,76730,'福利礼拜-元宝','1000000元宝','',0,0,0,0,1577523538,NULL),(1004,5001,1,0,1001,76730,'福利礼拜-元宝','1000000元宝','',0,0,0,0,1577523558,NULL),(1005,5001,1,0,1001,76730,'福利礼拜-元宝','1000000元宝','',0,0,0,0,1577523581,NULL),(1006,5001,1,0,1001,76730,'福利礼拜-元宝','1000000元宝','2*19004*1',0,0,0,0,1577523603,NULL),(1007,5001,1,0,1001,76730,'福利礼拜-元宝','1000000元宝','2*19004*100',0,0,0,0,1577523645,NULL),(1008,5001,1,0,1001,18904695,'福利礼拜-元宝','1000000元宝','2*19004*100',0,0,0,0,1577523672,NULL),(1009,5001,1,0,1001,18904695,'福利礼拜-元宝','1000000元宝','2*19004*100',0,0,0,0,1577523752,NULL),(1010,5001,1,0,1001,18904695,'福利礼拜-元宝','1000000元宝','2*19004*100',0,0,0,0,1577523794,NULL),(1011,5001,1,0,1001,18904695,'福利礼拜-元宝','1000000元宝','2*19004*100',0,0,0,0,1577523938,NULL),(1012,5001,1,0,1001,18904688,'福利礼拜-元宝','1000000元宝','2*19004*1000000',0,0,0,0,1577524059,NULL),(1013,5001,1,0,1001,18904688,'福利礼拜-元宝','1000000元宝','2*19004*1000000',0,0,0,0,1577524074,NULL),(1014,5001,1,0,1001,18904695,'福利礼拜-元宝','1000000元宝','2*19004*1000000',0,0,0,0,1577524167,NULL),(1015,5001,1,0,1001,18904695,'福利礼拜-元宝','1000000元宝','2*19004*1000000',0,0,0,0,1577524185,NULL),(1016,5001,1,0,1001,123456,'GM','vip','3*1619*1',0,0,0,0,1577546918,NULL),(1017,5001,1,0,1001,18904688,'GM','vip','3*1619*1',0,0,0,0,1577547034,NULL),(1018,5001,1,0,1001,18904688,'Gm','福利','3*1619*100',0,0,0,0,1577626094,NULL),(1019,5001,1,0,1001,18904688,'GM','福利','3*1613*1,3*1614*1',0,0,0,0,1577703626,NULL),(1020,5001,1,0,1,18904695,'一个亿元宝','一个亿元宝','2*19004*100000000',0,0,0,0,1577753421,NULL),(1021,5001,1,2,1,18904699,'GM修改玩家属性','内部福利','50000',0,0,0,0,1578539832,'0'),(1022,5001,1,2,1,18904699,'GM修改玩家属性','增加元宝','100000',0,0,0,0,1578539908,'0'),(1023,5001,1,2,1,18904699,'GM修改玩家属性','修改vip','12',0,0,0,0,1578539974,'0'),(1024,5001,1,2,1,18904699,'GM修改玩家属性','增加元宝','1000000',0,0,0,0,1578540009,'0'),(1025,5001,1,2,1,18904699,'GM修改玩家属性','增加元宝','2500000',0,0,0,0,1578540109,'0'),(1026,200,1,0,1001,18904706,'一亿元宝','一亿个元宝','2*19004*100000000',0,0,0,0,1578757815,NULL),(1027,200,1,0,1001,18904705,'一亿元宝','一亿个元宝','2*19004*100000000',0,0,0,0,1578757841,NULL),(1028,200,0,0,1001,18904706,'一亿绑定','一亿绑定元宝','',0,0,0,0,1578761044,NULL),(1029,200,1,0,1001,18904707,'一亿元宝','一亿个伤心的时候','2*19004*100000000',0,0,0,0,1578765988,NULL),(1030,200,1,2,1,18904708,'GM修改玩家属性','增加元宝','10000000',0,0,0,0,1578798849,'0'),(1031,200,1,0,1001,18904712,'一个亿','一个亿','2*19004*100000000',0,0,0,0,1578919453,NULL);
/*!40000 ALTER TABLE `gm_mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gm_mail_ext`
--

DROP TABLE IF EXISTS `gm_mail_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_mail_ext` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mailid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `gameid` int(10) unsigned NOT NULL DEFAULT '0',
  `zoneid` int(10) unsigned NOT NULL DEFAULT '0',
  `charid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `state` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_mailid` (`mailid`) USING BTREE,
  KEY `game_zone_charid` (`gameid`,`zoneid`,`charid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gm_mail_ext`
--

LOCK TABLES `gm_mail_ext` WRITE;
/*!40000 ALTER TABLE `gm_mail_ext` DISABLE KEYS */;
/*!40000 ALTER TABLE `gm_mail_ext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gm_packcode_0`
--

DROP TABLE IF EXISTS `gm_packcode_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_packcode_0` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `recordid` int(10) unsigned NOT NULL DEFAULT '0',
  `gameid` int(10) unsigned NOT NULL DEFAULT '0',
  `code` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uzoneid` int(10) unsigned NOT NULL DEFAULT '0',
  `uuid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `utime` int(10) unsigned NOT NULL DEFAULT '0',
  `state` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_code` (`gameid`,`code`) USING BTREE,
  KEY `recordid` (`recordid`) USING BTREE,
  KEY `uuid` (`uuid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gm_packcode_0`
--

LOCK TABLES `gm_packcode_0` WRITE;
/*!40000 ALTER TABLE `gm_packcode_0` DISABLE KEYS */;
/*!40000 ALTER TABLE `gm_packcode_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gm_packcode_1`
--

DROP TABLE IF EXISTS `gm_packcode_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_packcode_1` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `recordid` int(10) unsigned NOT NULL DEFAULT '0',
  `gameid` int(10) unsigned NOT NULL DEFAULT '0',
  `code` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uzoneid` int(10) unsigned NOT NULL DEFAULT '0',
  `uuid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `utime` int(10) unsigned NOT NULL DEFAULT '0',
  `state` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_code` (`gameid`,`code`) USING BTREE,
  KEY `recordid` (`recordid`) USING BTREE,
  KEY `uuid` (`uuid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gm_packcode_1`
--

LOCK TABLES `gm_packcode_1` WRITE;
/*!40000 ALTER TABLE `gm_packcode_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `gm_packcode_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gm_packcode_2`
--

DROP TABLE IF EXISTS `gm_packcode_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_packcode_2` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `recordid` int(10) unsigned NOT NULL DEFAULT '0',
  `gameid` int(10) unsigned NOT NULL DEFAULT '0',
  `code` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uzoneid` int(10) unsigned NOT NULL DEFAULT '0',
  `uuid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `utime` int(10) unsigned NOT NULL DEFAULT '0',
  `state` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_code` (`gameid`,`code`) USING BTREE,
  KEY `recordid` (`recordid`) USING BTREE,
  KEY `uuid` (`uuid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gm_packcode_2`
--

LOCK TABLES `gm_packcode_2` WRITE;
/*!40000 ALTER TABLE `gm_packcode_2` DISABLE KEYS */;
/*!40000 ALTER TABLE `gm_packcode_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gm_packcode_3`
--

DROP TABLE IF EXISTS `gm_packcode_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_packcode_3` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `recordid` int(10) unsigned NOT NULL DEFAULT '0',
  `gameid` int(10) unsigned NOT NULL DEFAULT '0',
  `code` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uzoneid` int(10) unsigned NOT NULL DEFAULT '0',
  `uuid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `utime` int(10) unsigned NOT NULL DEFAULT '0',
  `state` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_code` (`gameid`,`code`) USING BTREE,
  KEY `recordid` (`recordid`) USING BTREE,
  KEY `uuid` (`uuid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gm_packcode_3`
--

LOCK TABLES `gm_packcode_3` WRITE;
/*!40000 ALTER TABLE `gm_packcode_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `gm_packcode_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gm_packcode_4`
--

DROP TABLE IF EXISTS `gm_packcode_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_packcode_4` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `recordid` int(10) unsigned NOT NULL DEFAULT '0',
  `gameid` int(10) unsigned NOT NULL DEFAULT '0',
  `code` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uzoneid` int(10) unsigned NOT NULL DEFAULT '0',
  `uuid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `utime` int(10) unsigned NOT NULL DEFAULT '0',
  `state` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_code` (`gameid`,`code`) USING BTREE,
  KEY `recordid` (`recordid`) USING BTREE,
  KEY `uuid` (`uuid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gm_packcode_4`
--

LOCK TABLES `gm_packcode_4` WRITE;
/*!40000 ALTER TABLE `gm_packcode_4` DISABLE KEYS */;
/*!40000 ALTER TABLE `gm_packcode_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gm_packcode_5`
--

DROP TABLE IF EXISTS `gm_packcode_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_packcode_5` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `recordid` int(10) unsigned NOT NULL DEFAULT '0',
  `gameid` int(10) unsigned NOT NULL DEFAULT '0',
  `code` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uzoneid` int(10) unsigned NOT NULL DEFAULT '0',
  `uuid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `utime` int(10) unsigned NOT NULL DEFAULT '0',
  `state` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_code` (`gameid`,`code`) USING BTREE,
  KEY `recordid` (`recordid`) USING BTREE,
  KEY `uuid` (`uuid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gm_packcode_5`
--

LOCK TABLES `gm_packcode_5` WRITE;
/*!40000 ALTER TABLE `gm_packcode_5` DISABLE KEYS */;
/*!40000 ALTER TABLE `gm_packcode_5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gm_packcode_6`
--

DROP TABLE IF EXISTS `gm_packcode_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_packcode_6` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `recordid` int(10) unsigned NOT NULL DEFAULT '0',
  `gameid` int(10) unsigned NOT NULL DEFAULT '0',
  `code` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uzoneid` int(10) unsigned NOT NULL DEFAULT '0',
  `uuid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `utime` int(10) unsigned NOT NULL DEFAULT '0',
  `state` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_code` (`gameid`,`code`) USING BTREE,
  KEY `recordid` (`recordid`) USING BTREE,
  KEY `uuid` (`uuid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gm_packcode_6`
--

LOCK TABLES `gm_packcode_6` WRITE;
/*!40000 ALTER TABLE `gm_packcode_6` DISABLE KEYS */;
/*!40000 ALTER TABLE `gm_packcode_6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gm_packcode_7`
--

DROP TABLE IF EXISTS `gm_packcode_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_packcode_7` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `recordid` int(10) unsigned NOT NULL DEFAULT '0',
  `gameid` int(10) unsigned NOT NULL DEFAULT '0',
  `code` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uzoneid` int(10) unsigned NOT NULL DEFAULT '0',
  `uuid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `utime` int(10) unsigned NOT NULL DEFAULT '0',
  `state` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_code` (`gameid`,`code`) USING BTREE,
  KEY `recordid` (`recordid`) USING BTREE,
  KEY `uuid` (`uuid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gm_packcode_7`
--

LOCK TABLES `gm_packcode_7` WRITE;
/*!40000 ALTER TABLE `gm_packcode_7` DISABLE KEYS */;
/*!40000 ALTER TABLE `gm_packcode_7` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gm_packcode_8`
--

DROP TABLE IF EXISTS `gm_packcode_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_packcode_8` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `recordid` int(10) unsigned NOT NULL DEFAULT '0',
  `gameid` int(10) unsigned NOT NULL DEFAULT '0',
  `code` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uzoneid` int(10) unsigned NOT NULL DEFAULT '0',
  `uuid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `utime` int(10) unsigned NOT NULL DEFAULT '0',
  `state` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_code` (`gameid`,`code`) USING BTREE,
  KEY `recordid` (`recordid`) USING BTREE,
  KEY `uuid` (`uuid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gm_packcode_8`
--

LOCK TABLES `gm_packcode_8` WRITE;
/*!40000 ALTER TABLE `gm_packcode_8` DISABLE KEYS */;
/*!40000 ALTER TABLE `gm_packcode_8` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gm_packcode_9`
--

DROP TABLE IF EXISTS `gm_packcode_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_packcode_9` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `recordid` int(10) unsigned NOT NULL DEFAULT '0',
  `gameid` int(10) unsigned NOT NULL DEFAULT '0',
  `code` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uzoneid` int(10) unsigned NOT NULL DEFAULT '0',
  `uuid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `utime` int(10) unsigned NOT NULL DEFAULT '0',
  `state` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_code` (`gameid`,`code`) USING BTREE,
  KEY `recordid` (`recordid`) USING BTREE,
  KEY `uuid` (`uuid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gm_packcode_9`
--

LOCK TABLES `gm_packcode_9` WRITE;
/*!40000 ALTER TABLE `gm_packcode_9` DISABLE KEYS */;
/*!40000 ALTER TABLE `gm_packcode_9` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gm_packcode_record`
--

DROP TABLE IF EXISTS `gm_packcode_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_packcode_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gameid` int(10) unsigned NOT NULL DEFAULT '0',
  `zoneidmax` int(10) unsigned NOT NULL DEFAULT '0',
  `zoneidmin` int(10) unsigned NOT NULL DEFAULT '0',
  `ctype` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cnum` int(10) unsigned NOT NULL DEFAULT '0',
  `packid` int(20) unsigned NOT NULL DEFAULT '0',
  `platid` int(10) unsigned NOT NULL DEFAULT '0',
  `cdesc` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filename` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `stime` int(10) unsigned NOT NULL DEFAULT '0',
  `etime` int(10) unsigned NOT NULL DEFAULT '0',
  `climit` int(10) unsigned NOT NULL DEFAULT '0',
  `gmid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `state` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `gameid` (`gameid`) USING BTREE,
  KEY `packid` (`packid`) USING BTREE,
  KEY `platid` (`platid`) USING BTREE,
  KEY `ctype` (`ctype`) USING BTREE,
  KEY `state` (`state`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gm_packcode_record`
--

LOCK TABLES `gm_packcode_record` WRITE;
/*!40000 ALTER TABLE `gm_packcode_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `gm_packcode_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gm_packcode_type`
--

DROP TABLE IF EXISTS `gm_packcode_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_packcode_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gameid` int(10) unsigned NOT NULL DEFAULT '0',
  `content` varchar(384) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gmid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `gameid` (`gameid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gm_packcode_type`
--

LOCK TABLES `gm_packcode_type` WRITE;
/*!40000 ALTER TABLE `gm_packcode_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `gm_packcode_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gm_primenu`
--

DROP TABLE IF EXISTS `gm_primenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_primenu` (
  `accid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `menuid` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `index_accid_menuid` (`accid`,`menuid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gm_primenu`
--

LOCK TABLES `gm_primenu` WRITE;
/*!40000 ALTER TABLE `gm_primenu` DISABLE KEYS */;
/*!40000 ALTER TABLE `gm_primenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gm_punish`
--

DROP TABLE IF EXISTS `gm_punish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_punish` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gameid` int(10) unsigned NOT NULL DEFAULT '0',
  `zoneid` int(10) unsigned NOT NULL DEFAULT '0',
  `charid` int(20) unsigned NOT NULL DEFAULT '0',
  `charname` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ip` int(10) unsigned NOT NULL DEFAULT '0',
  `gmid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `reason` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `state` tinyint(2) NOT NULL DEFAULT '0',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gm_punish`
--

LOCK TABLES `gm_punish` WRITE;
/*!40000 ALTER TABLE `gm_punish` DISABLE KEYS */;
INSERT INTO `gm_punish` VALUES (1,5001,2,76659,'',0,1001,6,'测试',1573007745,1573094148,0,1573007754,0),(2,5001,2,76659,'',0,1001,6,'测试',1573007745,1573094148,0,1573007774,0),(3,5001,2,18904427,'',0,1001,6,'测试封号',1573007745,1573094148,0,1573007817,0);
/*!40000 ALTER TABLE `gm_punish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gm_user`
--

DROP TABLE IF EXISTS `gm_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bindip` int(10) unsigned NOT NULL DEFAULT '0',
  `gameid` int(10) unsigned NOT NULL DEFAULT '0',
  `zoneid` int(10) unsigned NOT NULL DEFAULT '0',
  `priviliege` bigint(20) NOT NULL DEFAULT '0',
  `qmaxnum` int(10) unsigned NOT NULL DEFAULT '0',
  `autorecv` int(10) unsigned NOT NULL DEFAULT '0',
  `workstate` int(10) unsigned NOT NULL DEFAULT '0',
  `winnum` int(10) unsigned NOT NULL DEFAULT '0',
  `config` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_account` (`username`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gm_user`
--

LOCK TABLES `gm_user` WRITE;
/*!40000 ALTER TABLE `gm_user` DISABLE KEYS */;
INSERT INTO `gm_user` VALUES (1001,'root','a75aade7126a12cdbb9d63719a846a39',0,0,0,0,0,0,0,0,''),(1,'wscq','99fdd6811a3f3dbc5d073d2ba7ffbef4',0,200,0,0,0,0,0,0,'');
/*!40000 ALTER TABLE `gm_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gm_zones`
--

DROP TABLE IF EXISTS `gm_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_zones` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gameid` int(10) unsigned NOT NULL DEFAULT '0',
  `zoneid` int(10) unsigned NOT NULL DEFAULT '0',
  `zonename` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gmlink` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_gameid_zoneid` (`gameid`,`zoneid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gm_zones`
--

LOCK TABLES `gm_zones` WRITE;
/*!40000 ALTER TABLE `gm_zones` DISABLE KEYS */;
/*!40000 ALTER TABLE `gm_zones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-16 10:24:33
