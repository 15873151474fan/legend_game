-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: RecordServer_ZW06bak
-- ------------------------------------------------------
-- Server version	5.1.73

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
-- Table structure for table `ACCOUNT_LEVEL_PRESENT`
--
CREATE DATABASE IF NOT EXISTS `RecordServer_Test`;
USE `RecordServer_Test`;

DROP TABLE IF EXISTS `ACCOUNT_LEVEL_PRESENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACCOUNT_LEVEL_PRESENT` (
  `ACCID` int(10) unsigned NOT NULL DEFAULT '0',
  `LEVEL` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ACCID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ACTCODE`
--

DROP TABLE IF EXISTS `ACTCODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACTCODE` (
  `CARDID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `KEYSTRING` varchar(128) NOT NULL DEFAULT '',
  `CREATETIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`CARDID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ARMY`
--

DROP TABLE IF EXISTS `ARMY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ARMY` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `COUNTRY` int(10) unsigned NOT NULL DEFAULT '0',
  `LEVEL` smallint(5) unsigned NOT NULL DEFAULT '1',
  `NAME` varchar(33) NOT NULL DEFAULT '',
  `LEADER` int(10) unsigned NOT NULL DEFAULT '0',
  `CREATOR` int(10) unsigned NOT NULL DEFAULT '0',
  `CREATETIME` int(10) unsigned NOT NULL DEFAULT '0',
  `ALLBINARY` blob,
  `MONEY` int(10) unsigned NOT NULL DEFAULT '0',
  `GRADE` int(10) unsigned NOT NULL DEFAULT '0',
  `MASK` int(10) unsigned NOT NULL DEFAULT '0',
  `CORDER` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `NAME` (`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AUCTION`
--

DROP TABLE IF EXISTS `AUCTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUCTION` (
  `AUCTIONID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OWNERID` int(10) unsigned NOT NULL DEFAULT '0',
  `NAME` varchar(256) NOT NULL DEFAULT '',
  `ITEMTYPE` tinyint(3) NOT NULL DEFAULT '0',
  `ITEMPREFIX` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ITEMCOLOR` tinyint(3) NOT NULL DEFAULT '0',
  `ITEMFIVE` tinyint(3) NOT NULL DEFAULT '0',
  `ITEMSOULID` smallint(5) NOT NULL DEFAULT '0',
  `ITEMSTONEID` smallint(5) NOT NULL DEFAULT '0',
  `NEEDLEVEL` smallint(5) NOT NULL DEFAULT '0',
  `PRICE` int(10) unsigned NOT NULL DEFAULT '0',
  `CREATETIME` int(10) unsigned NOT NULL DEFAULT '0',
  `ITEM` blob NOT NULL,
  `OCCUPYID` int(10) unsigned NOT NULL DEFAULT '0',
  `OWNERNAME` varchar(256) NOT NULL DEFAULT '',
  `UNITPRICE` int(10) unsigned NOT NULL DEFAULT '0',
  `NUMBER` int(10) unsigned NOT NULL DEFAULT '0',
  `ITEMLEVEL` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`AUCTIONID`),
  KEY `PREFIX` (`ITEMPREFIX`),
  KEY `COLOR` (`ITEMCOLOR`),
  KEY `LEVEL` (`NEEDLEVEL`),
  KEY `CREATETIME` (`CREATETIME`),
  KEY `TYPE` (`ITEMTYPE`),
  KEY `NAME` (`ITEMTYPE`,`ITEMCOLOR`),
  KEY `ITEMLEVEL` (`ITEMLEVEL`),
  KEY `ITEMLEVEL_2` (`ITEMLEVEL`),
  KEY `ITEMLEVEL_3` (`ITEMLEVEL`)
) ENGINE=MyISAM AUTO_INCREMENT=294481 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AUCTION_GOLD_TRADE`
--

DROP TABLE IF EXISTS `AUCTION_GOLD_TRADE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUCTION_GOLD_TRADE` (
  `AUCTIONID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OWNERID` int(10) unsigned NOT NULL DEFAULT '0',
  `NUM` int(10) unsigned NOT NULL DEFAULT '0',
  `PRICE` int(10) unsigned NOT NULL DEFAULT '0',
  `OWNERNAME` varchar(256) NOT NULL DEFAULT '',
  PRIMARY KEY (`AUCTIONID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AUCTION_MONEY`
--

DROP TABLE IF EXISTS `AUCTION_MONEY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUCTION_MONEY` (
  `UID` int(10) unsigned NOT NULL DEFAULT '0',
  `MONEY` int(10) unsigned NOT NULL DEFAULT '0',
  `GOLDCARD` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`UID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BALANCE`
--

DROP TABLE IF EXISTS `BALANCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BALANCE` (
  `CHARID` int(10) unsigned NOT NULL DEFAULT '0',
  `GOLD` int(10) unsigned NOT NULL DEFAULT '0',
  `MONEY` int(10) unsigned NOT NULL DEFAULT '0',
  `ALLGOLDIN` int(10) unsigned NOT NULL DEFAULT '0',
  `ALLMONEYIN` int(10) unsigned NOT NULL DEFAULT '0',
  `ALLGOLDOUT` int(10) unsigned NOT NULL DEFAULT '0',
  `ALLMONEYOUT` int(10) unsigned NOT NULL DEFAULT '0',
  `GOLDTAX` int(10) unsigned NOT NULL DEFAULT '0',
  `MONEYTAX` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`CHARID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BLACKLIST`
--

DROP TABLE IF EXISTS `BLACKLIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLACKLIST` (
  `CHARID` int(10) unsigned NOT NULL DEFAULT '0',
  `BLACKID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`CHARID`,`BLACKID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BUYCOMMISSION`
--

DROP TABLE IF EXISTS `BUYCOMMISSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BUYCOMMISSION` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `USERID` int(10) unsigned NOT NULL DEFAULT '0',
  `TYPE` tinyint(3) NOT NULL DEFAULT '0',
  `SUBTYPE` int(10) unsigned NOT NULL DEFAULT '0',
  `BUYID` int(10) unsigned NOT NULL DEFAULT '0',
  `LEVEL` int(10) unsigned NOT NULL DEFAULT '0',
  `QUALITY` tinyint(3) NOT NULL DEFAULT '0',
  `CREATETIME` int(10) unsigned NOT NULL DEFAULT '0',
  `PERPRICE` int(10) unsigned NOT NULL DEFAULT '0',
  `BUYNUM` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`,`CREATETIME`),
  KEY `BUYID` (`BUYID`,`CREATETIME`),
  KEY `USERID` (`USERID`),
  KEY `TYPE` (`TYPE`,`SUBTYPE`,`LEVEL`,`QUALITY`,`CREATETIME`),
  KEY `ID_2` (`ID`,`CREATETIME`),
  KEY `BUYID_2` (`BUYID`,`CREATETIME`),
  KEY `USERID_2` (`USERID`),
  KEY `TYPE_2` (`TYPE`,`SUBTYPE`,`LEVEL`,`QUALITY`,`CREATETIME`),
  KEY `ID_3` (`ID`,`CREATETIME`),
  KEY `BUYID_3` (`BUYID`,`CREATETIME`),
  KEY `USERID_3` (`USERID`),
  KEY `TYPE_3` (`TYPE`,`SUBTYPE`,`LEVEL`,`QUALITY`,`CREATETIME`)
) ENGINE=MyISAM AUTO_INCREMENT=22333 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CHANGECOUNTRYWAR`
--

DROP TABLE IF EXISTS `CHANGECOUNTRYWAR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CHANGECOUNTRYWAR` (
  `WEEK` int(10) unsigned NOT NULL DEFAULT '0',
  `ZONEID` int(10) unsigned NOT NULL DEFAULT '0',
  `ATTACKCOUNTRY` int(10) unsigned NOT NULL DEFAULT '0',
  `DEFENSECOUNTRY` int(10) unsigned NOT NULL DEFAULT '0',
  `STARTDAY` int(10) unsigned NOT NULL DEFAULT '0',
  `WORLDLEVEL` int(10) unsigned NOT NULL DEFAULT '0',
  `BETATTACK` int(10) unsigned NOT NULL DEFAULT '0',
  `BETDEFENSE` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`WEEK`,`ZONEID`,`ATTACKCOUNTRY`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CHARBASE`
--

DROP TABLE IF EXISTS `CHARBASE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CHARBASE` (
  `CHARID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ACCID` int(10) unsigned NOT NULL DEFAULT '0',
  `NAME` varchar(33) NOT NULL DEFAULT '',
  `LEVEL` smallint(5) unsigned NOT NULL DEFAULT '1',
  `FACE` smallint(5) unsigned NOT NULL DEFAULT '1',
  `HAIR` smallint(5) unsigned NOT NULL DEFAULT '1',
  `WEAPON` int(10) unsigned NOT NULL DEFAULT '0',
  `SUITE` int(10) unsigned NOT NULL DEFAULT '0',
  `EQUIPSFX` smallint(5) unsigned NOT NULL DEFAULT '0',
  `GMLEVEL` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ENERGY` int(10) unsigned NOT NULL DEFAULT '0',
  `NYCJ` int(10) unsigned NOT NULL DEFAULT '0',
  `JSCJ` int(10) unsigned NOT NULL DEFAULT '0',
  `YSZZ` int(10) unsigned NOT NULL DEFAULT '0',
  `YQZZ` int(10) unsigned NOT NULL DEFAULT '0',
  `TYPE` smallint(5) unsigned NOT NULL DEFAULT '0',
  `AREA` int(10) unsigned NOT NULL DEFAULT '0',
  `HP` int(10) unsigned NOT NULL DEFAULT '0',
  `SP` int(10) unsigned NOT NULL DEFAULT '0',
  `EXP` bigint(20) unsigned NOT NULL DEFAULT '0',
  `X` int(10) unsigned NOT NULL DEFAULT '0',
  `Y` int(10) unsigned NOT NULL DEFAULT '0',
  `MAPID` int(10) unsigned NOT NULL DEFAULT '0',
  `COUNTRYID` int(10) unsigned NOT NULL DEFAULT '0',
  `HOMELAND` int(10) unsigned NOT NULL DEFAULT '0',
  `BITMASK` int(10) unsigned NOT NULL DEFAULT '0',
  `CREATETIME` int(10) unsigned NOT NULL DEFAULT '0',
  `IMGERRLOCK` bigint(20) unsigned NOT NULL DEFAULT '0',
  `GOODNESS` int(10) unsigned NOT NULL DEFAULT '0',
  `MINJIE` smallint(5) unsigned NOT NULL DEFAULT '0',
  `TIZHI` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ZHILI` smallint(5) unsigned NOT NULL DEFAULT '0',
  `JINGSHEN` smallint(5) unsigned NOT NULL DEFAULT '0',
  `LILIANG` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DEMONPWD` varchar(9) NOT NULL DEFAULT '',
  `STOREPWD` varchar(9) NOT NULL DEFAULT '',
  `ALLBINARY` blob,
  `LASTOFFTIME` int(10) unsigned NOT NULL DEFAULT '0',
  `MILIRANK` int(10) unsigned NOT NULL DEFAULT '0',
  `PRESTIGE` int(10) unsigned NOT NULL DEFAULT '0',
  `CONTRI` int(10) unsigned NOT NULL DEFAULT '0',
  `ALLMONEYIN` int(10) unsigned NOT NULL DEFAULT '0',
  `ALLMONEYTICKETIN` int(10) unsigned NOT NULL DEFAULT '0',
  `ALLGOLDIN` int(10) unsigned NOT NULL DEFAULT '0',
  `ALLGOLDTICKETIN` int(10) unsigned NOT NULL DEFAULT '0',
  `ALLMONEYOUT` int(10) unsigned NOT NULL DEFAULT '0',
  `ALLMONEYTICKETOUT` int(10) unsigned NOT NULL DEFAULT '0',
  `ALLGOLDOUT` int(10) unsigned NOT NULL DEFAULT '0',
  `ALLGOLDTICKETOUT` int(10) unsigned NOT NULL DEFAULT '0',
  `CLEARDAY` int(10) unsigned NOT NULL DEFAULT '0',
  `TOTALCONTRI` int(10) unsigned NOT NULL DEFAULT '0',
  `TOTALPRESTIGE` int(10) unsigned NOT NULL DEFAULT '0',
  `EQUIPSET` int(10) unsigned NOT NULL DEFAULT '0',
  `HAIRCOLOR` int(10) unsigned NOT NULL DEFAULT '0',
  `MONEY` int(10) unsigned NOT NULL DEFAULT '0',
  `MONEYTICKET` int(10) unsigned NOT NULL DEFAULT '0',
  `GOLD` int(10) unsigned NOT NULL DEFAULT '0',
  `GOLDTICKET` int(10) unsigned NOT NULL DEFAULT '0',
  `GROWTHMEDAL` int(10) unsigned NOT NULL DEFAULT '0',
  `EXPMEDAL` int(10) unsigned NOT NULL DEFAULT '0',
  `WARMEDAL` int(10) unsigned NOT NULL DEFAULT '0',
  `DEMONJOIN` int(10) unsigned NOT NULL DEFAULT '0',
  `WEAPONLEVEL` int(10) unsigned NOT NULL DEFAULT '0',
  `SUITELEVEL` int(10) unsigned NOT NULL DEFAULT '0',
  `WING` int(10) unsigned NOT NULL DEFAULT '0',
  `TILEDPOINT` int(10) unsigned NOT NULL DEFAULT '0',
  `DAYINCOMING` int(10) unsigned NOT NULL DEFAULT '0',
  `LASTONLINEIP` int(10) unsigned NOT NULL DEFAULT '0',
  `ONLINETIME` int(10) unsigned NOT NULL DEFAULT '0',
  `PKMODE` int(10) unsigned NOT NULL DEFAULT '1',
  `CREATEIP` int(10) unsigned NOT NULL DEFAULT '0',
  `CHANNEL` int(10) unsigned NOT NULL DEFAULT '0',
  `CREATENETBAR` int(10) unsigned NOT NULL DEFAULT '0',
  `CREATEMARKET` varchar(32) NOT NULL DEFAULT '',
  `SAFECITY` int(10) unsigned NOT NULL DEFAULT '0',
  `LASTCITY` int(10) unsigned NOT NULL DEFAULT '0',
  `LASTCITYTIME` int(10) unsigned NOT NULL DEFAULT '0',
  `LASTLOGINMAC` bigint(20) unsigned NOT NULL DEFAULT '0',
  `VIPLEVEL` int(10) unsigned NOT NULL DEFAULT '0',
  `BACKDATA` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SAFEAREA1` int(10) unsigned NOT NULL DEFAULT '0',
  `SAFEAREA2` int(10) unsigned NOT NULL DEFAULT '0',
  `POWER` int(10) unsigned NOT NULL DEFAULT '0',
  `WINGLEVEL` int(10) unsigned NOT NULL DEFAULT '0',
  `PRECREATETIME` int(10) unsigned NOT NULL DEFAULT '0',
  `OLDZONEID` int(10) unsigned NOT NULL DEFAULT '0',
  `WORLDLVEXP` int(10) unsigned NOT NULL DEFAULT '0',
  `GODVALUE` int(10) unsigned NOT NULL DEFAULT '0',
  `EVILVALUE` int(10) unsigned NOT NULL DEFAULT '0',
  `PT_NAME` varchar(8) NOT NULL DEFAULT '',
  `PT_ACCID` int(10) unsigned NOT NULL DEFAULT '0',
  `VERSION` int(11) NOT NULL DEFAULT '0',
  `INCLEVEL` smallint(5) unsigned NOT NULL default '1',
  `INCEXP` bigint(20) unsigned NOT NULL default '0',
  `INCHP` bigint(20) unsigned NOT NULL default '0',
  PRIMARY KEY (`CHARID`),
  KEY `NAME` (`NAME`),
  KEY `ACCID` (`ACCID`),
  KEY `HOMELAND` (`HOMELAND`),
  KEY `HOMELAND_2` (`HOMELAND`),
  KEY `HOMELAND_3` (`HOMELAND`)
) ENGINE=MyISAM AUTO_INCREMENT=18791647 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CITY_NAME`
--

DROP TABLE IF EXISTS `CITY_NAME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CITY_NAME` (
  `CID` int(10) unsigned NOT NULL,
  `PID` int(10) unsigned NOT NULL,
  `NAME` varchar(64) NOT NULL,
  PRIMARY KEY (`CID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CONSIGNGOLD`
--

DROP TABLE IF EXISTS `CONSIGNGOLD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CONSIGNGOLD` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CHARID` int(10) unsigned NOT NULL DEFAULT '0',
  `NUM` int(10) unsigned NOT NULL DEFAULT '0',
  `PRICE` int(10) unsigned NOT NULL DEFAULT '0',
  `TIME` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CONSIGNGOLDHISTORY`
--

DROP TABLE IF EXISTS `CONSIGNGOLDHISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CONSIGNGOLDHISTORY` (
  `JNUM` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `CHARID` int(10) unsigned NOT NULL DEFAULT '0',
  `NUM` int(10) unsigned NOT NULL DEFAULT '0',
  `COMMITPRICE` int(10) unsigned NOT NULL DEFAULT '0',
  `PRICE` int(10) unsigned NOT NULL DEFAULT '0',
  `COMMITTIME` int(10) unsigned NOT NULL DEFAULT '0',
  `OKTIME` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`JNUM`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CONSIGNMONEY`
--

DROP TABLE IF EXISTS `CONSIGNMONEY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CONSIGNMONEY` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CHARID` int(10) unsigned NOT NULL DEFAULT '0',
  `NUM` int(10) unsigned NOT NULL DEFAULT '0',
  `PRICE` int(10) unsigned NOT NULL DEFAULT '0',
  `TIME` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CONSIGNMONEYHISTORY`
--

DROP TABLE IF EXISTS `CONSIGNMONEYHISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CONSIGNMONEYHISTORY` (
  `JNUM` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `CHARID` int(10) unsigned NOT NULL DEFAULT '0',
  `NUM` int(10) unsigned NOT NULL DEFAULT '0',
  `COMMITPRICE` int(10) unsigned NOT NULL DEFAULT '0',
  `PRICE` int(10) unsigned NOT NULL DEFAULT '0',
  `COMMITTIME` int(10) unsigned NOT NULL DEFAULT '0',
  `OKTIME` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`JNUM`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CORPS`
--

DROP TABLE IF EXISTS `CORPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CORPS` (
  `CORPSID` int(10) unsigned NOT NULL DEFAULT '0',
  `COUNTRY` int(10) unsigned NOT NULL DEFAULT '0',
  `ARMY` int(10) unsigned NOT NULL DEFAULT '0',
  `LEVEL` smallint(5) unsigned NOT NULL DEFAULT '1',
  `NAME` varchar(33) NOT NULL DEFAULT '',
  `LEADER` int(10) unsigned NOT NULL DEFAULT '0',
  `CREATOR` int(10) unsigned NOT NULL DEFAULT '0',
  `CREATETIME` int(10) unsigned NOT NULL DEFAULT '0',
  `MONEY` int(10) unsigned NOT NULL DEFAULT '0',
  `GLORY` int(10) unsigned NOT NULL DEFAULT '0',
  `RESOURCE` int(10) unsigned NOT NULL DEFAULT '0',
  `POPULARITY` int(10) unsigned NOT NULL DEFAULT '0',
  `MAGICMATERIALS` int(10) unsigned NOT NULL DEFAULT '0',
  `ALLBINARY` blob,
  PRIMARY KEY (`CORPSID`),
  KEY `NAME` (`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `COUNTRY`
--

DROP TABLE IF EXISTS `COUNTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COUNTRY` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `NAME` varchar(256) NOT NULL DEFAULT '',
  `ALIAS` varchar(16) NOT NULL DEFAULT '',
  `CREATETIME` int(10) unsigned NOT NULL DEFAULT '0',
  `ALLY1` int(10) unsigned NOT NULL DEFAULT '0',
  `ALLY2` int(10) unsigned NOT NULL DEFAULT '0',
  `ALLBINARY` blob,
  `MONEY` int(10) unsigned NOT NULL DEFAULT '0',
  `POWER` int(10) unsigned NOT NULL DEFAULT '0',
  `STATE` int(10) unsigned NOT NULL DEFAULT '0',
  `PRESTIGE` int(10) unsigned NOT NULL DEFAULT '0',
  `ALLGOLDIN` int(10) unsigned NOT NULL DEFAULT '0',
  `VERSION` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `NAME` (`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEMONTRADE`
--

DROP TABLE IF EXISTS `DEMONTRADE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEMONTRADE` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OWNERID` int(10) unsigned NOT NULL DEFAULT '0',
  `LEVEL` int(10) unsigned NOT NULL DEFAULT '0',
  `GROWTH` int(10) unsigned NOT NULL DEFAULT '0',
  `BASEID` int(10) unsigned NOT NULL DEFAULT '0',
  `PRICE` int(10) unsigned NOT NULL DEFAULT '0',
  `FOLLOWRATE` int(10) unsigned NOT NULL DEFAULT '0',
  `TYPE` int(10) unsigned NOT NULL DEFAULT '0',
  `NAME` varchar(256) NOT NULL DEFAULT '',
  `OWNERNAME` varchar(256) NOT NULL DEFAULT '',
  `ITEM` blob,
  `COLOR` int(10) unsigned NOT NULL DEFAULT '0',
  `RELIVE` int(10) unsigned NOT NULL DEFAULT '0',
  `CREATETIME` int(10) unsigned NOT NULL DEFAULT '0',
  `NEEDLEVEL` int(10) unsigned NOT NULL DEFAULT '0',
  `GENERATION` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=10227 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EMPERORLOG`
--

DROP TABLE IF EXISTS `EMPERORLOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EMPERORLOG` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TERM` int(10) unsigned NOT NULL DEFAULT '0',
  `COUNTRY` int(10) unsigned NOT NULL DEFAULT '0',
  `KINGID` int(10) unsigned NOT NULL DEFAULT '0',
  `KINGTIME` int(10) unsigned NOT NULL DEFAULT '0',
  `OUTTIME` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ENEMY`
--

DROP TABLE IF EXISTS `ENEMY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ENEMY` (
  `CHARID` int(10) unsigned NOT NULL DEFAULT '0',
  `ENEMYID` int(10) unsigned NOT NULL DEFAULT '0',
  `TIME` int(10) unsigned NOT NULL DEFAULT '0',
  `SAVE` smallint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`CHARID`,`ENEMYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EQUIP_ORDER`
--

DROP TABLE IF EXISTS `EQUIP_ORDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EQUIP_ORDER` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OWNERID` int(10) unsigned NOT NULL DEFAULT '0',
  `POWER` int(10) unsigned NOT NULL DEFAULT '0',
  `TYPE` int(10) unsigned NOT NULL DEFAULT '0',
  `CREATETIME` int(11) unsigned NOT NULL DEFAULT '0',
  `ITEM` blob NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `OWNERID` (`OWNERID`),
  KEY `TYPE` (`TYPE`),
  KEY `POWER` (`POWER`)
) ENGINE=MyISAM AUTO_INCREMENT=4289786696 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EURO_2012`
--

DROP TABLE IF EXISTS `EURO_2012`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EURO_2012` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `COUNTRY_MASTER` int(10) unsigned NOT NULL DEFAULT '0',
  `COUNTRY_MASTER_NAME` varchar(256) NOT NULL DEFAULT '',
  `COUNTRY_SLAVER` int(10) unsigned NOT NULL DEFAULT '0',
  `COUNTRY_SLAVER_NAME` varchar(256) NOT NULL DEFAULT '',
  `BET_STATE` int(10) unsigned NOT NULL DEFAULT '3',
  `BET_0` int(10) unsigned NOT NULL DEFAULT '0',
  `BET_1` int(10) unsigned NOT NULL DEFAULT '0',
  `BET_2` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FIGHTTEAM`
--

DROP TABLE IF EXISTS `FIGHTTEAM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FIGHTTEAM` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `COUNTRY` int(10) unsigned NOT NULL DEFAULT '0',
  `NAME` varchar(33) NOT NULL DEFAULT '',
  `LEADER` int(10) unsigned NOT NULL DEFAULT '0',
  `CREATOR` int(10) unsigned NOT NULL DEFAULT '0',
  `CREATTIME` int(10) unsigned NOT NULL DEFAULT '0',
  `POINT` int(10) unsigned NOT NULL DEFAULT '0',
  `ALLBINARY` blob,
  PRIMARY KEY (`ID`),
  KEY `NAME` (`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FIGHTTEAMCHAMPION`
--

DROP TABLE IF EXISTS `FIGHTTEAMCHAMPION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FIGHTTEAMCHAMPION` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TIME` int(10) unsigned NOT NULL DEFAULT '0',
  `NAME` varchar(33) NOT NULL DEFAULT '',
  `LEADER` int(10) unsigned NOT NULL DEFAULT '0',
  `MEMBER1` int(10) unsigned NOT NULL DEFAULT '0',
  `MEMBER2` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FORBIDACC`
--

DROP TABLE IF EXISTS `FORBIDACC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FORBIDACC` (
  `ACCID` int(10) unsigned NOT NULL DEFAULT '0',
  `ACCOUNT` varchar(48) NOT NULL DEFAULT '',
  `BEGTIME` int(10) unsigned NOT NULL DEFAULT '0',
  `ENDTIME` int(10) unsigned NOT NULL DEFAULT '0',
  `CONTENT` varchar(255) DEFAULT '',
  PRIMARY KEY (`ACCID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FRIEND`
--

DROP TABLE IF EXISTS `FRIEND`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FRIEND` (
  `CHARID` int(10) unsigned NOT NULL DEFAULT '0',
  `FRIENDID` int(11) NOT NULL DEFAULT '0',
  `TYPE` smallint(5) unsigned NOT NULL DEFAULT '0',
  `FGROUP` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DEGREE` int(10) unsigned NOT NULL DEFAULT '1',
  `TIME` int(10) unsigned NOT NULL DEFAULT '0',
  `DAYTEAM` int(10) unsigned NOT NULL DEFAULT '0',
  `DAYCHAT` int(10) unsigned NOT NULL DEFAULT '0',
  `ALLCHAT` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`CHARID`,`FRIENDID`),
  KEY `FRIENDID` (`FRIENDID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GOLD_CHILD`
--

DROP TABLE IF EXISTS `GOLD_CHILD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GOLD_CHILD` (
  `charid` int(11) unsigned NOT NULL DEFAULT '0',
  `childid` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`charid`,`childid`),
  KEY `TIME` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LEVELUPREWARD`
--

DROP TABLE IF EXISTS `LEVELUPREWARD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LEVELUPREWARD` (
  `CHARID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`CHARID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LITTLETHING`
--

DROP TABLE IF EXISTS `LITTLETHING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LITTLETHING` (
  `ID` int(10) NOT NULL DEFAULT '0',
  `ALLBINARY` mediumblob,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LOGFILENAME`
--

DROP TABLE IF EXISTS `LOGFILENAME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LOGFILENAME` (
  `FILENAME` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`FILENAME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LOTTERY`
--

DROP TABLE IF EXISTS `LOTTERY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LOTTERY` (
  `LOTTERYID` int(10) unsigned NOT NULL DEFAULT '0',
  `LTYPE` int(10) unsigned NOT NULL DEFAULT '0',
  `MULTINUM` int(10) unsigned NOT NULL DEFAULT '0',
  `SPECNUM` int(10) unsigned NOT NULL DEFAULT '0',
  `OWNERID` int(10) unsigned NOT NULL DEFAULT '0',
  `AMOUNT` int(10) unsigned NOT NULL DEFAULT '0',
  `DAYNUM` int(10) unsigned NOT NULL DEFAULT '0',
  `EXPIRY` int(10) unsigned NOT NULL DEFAULT '0',
  `LEVEL` int(10) unsigned NOT NULL DEFAULT '0',
  `BGET` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`LOTTERYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LOVER`
--

DROP TABLE IF EXISTS `LOVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LOVER` (
  `CHARID` int(10) unsigned NOT NULL DEFAULT '0',
  `LOVERID` int(10) unsigned NOT NULL DEFAULT '0',
  `CREATETIME` int(10) unsigned NOT NULL DEFAULT '0',
  `RELATIONTYPE` int(10) unsigned NOT NULL DEFAULT '1',
  `MODE` int(10) unsigned NOT NULL DEFAULT '0',
  `TIMES` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`CHARID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MAIL`
--

DROP TABLE IF EXISTS `MAIL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MAIL` (
  `MAILID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TOID` int(10) unsigned NOT NULL DEFAULT '0',
  `FROMID` int(10) unsigned NOT NULL DEFAULT '0',
  `CREATETIME` int(10) unsigned NOT NULL DEFAULT '0',
  `TYPE` smallint(3) unsigned NOT NULL DEFAULT '0',
  `STATE` smallint(3) unsigned NOT NULL DEFAULT '0',
  `ACCESSORY` smallint(3) unsigned NOT NULL DEFAULT '0',
  `SENDMONEY` int(10) unsigned NOT NULL DEFAULT '0',
  `RECVMONEY` int(10) unsigned NOT NULL DEFAULT '0',
  `TEXT` varchar(255) DEFAULT '0',
  `FROMNAME` varchar(128) NOT NULL DEFAULT '0',
  `SUBJECT` varchar(128) NOT NULL DEFAULT '0',
  `ITEM` blob,
  PRIMARY KEY (`MAILID`),
  KEY `TOID` (`TOID`),
  KEY `CREATETIME` (`CREATETIME`),
  KEY `STATE` (`STATE`)
) ENGINE=MyISAM AUTO_INCREMENT=4650810 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NETBAR_IPS`
--

DROP TABLE IF EXISTS `NETBAR_IPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NETBAR_IPS` (
  `ID` int(11) unsigned NOT NULL,
  `IP` int(12) unsigned NOT NULL,
  `PID` int(11) NOT NULL,
  `CID` int(11) NOT NULL,
  PRIMARY KEY (`IP`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NETBAR_MASTER`
--

DROP TABLE IF EXISTS `NETBAR_MASTER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NETBAR_MASTER` (
  `netbarid` int(11) unsigned NOT NULL DEFAULT '0',
  `charid` int(11) unsigned NOT NULL DEFAULT '0',
  `moneyall` int(11) unsigned NOT NULL DEFAULT '0',
  `ACCID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`netbarid`),
  KEY `CHARID` (`charid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NETBAR_NAMES`
--

DROP TABLE IF EXISTS `NETBAR_NAMES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NETBAR_NAMES` (
  `ID` int(11) unsigned NOT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NETBAR_PRESENT`
--

DROP TABLE IF EXISTS `NETBAR_PRESENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NETBAR_PRESENT` (
  `netbarid` int(11) unsigned NOT NULL DEFAULT '0',
  `charid` int(11) unsigned NOT NULL DEFAULT '0',
  `moneyall` int(11) unsigned NOT NULL DEFAULT '0',
  `moneyweeklast` int(11) unsigned NOT NULL DEFAULT '0',
  `moneyweek` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`netbarid`,`charid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NEWBEECARD`
--

DROP TABLE IF EXISTS `NEWBEECARD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NEWBEECARD` (
  `CARDID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TYPE` int(10) unsigned NOT NULL DEFAULT '0',
  `KEYSTRING` varchar(128) NOT NULL DEFAULT '',
  `CREATETIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`CARDID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NEW_USER_CARD`
--

DROP TABLE IF EXISTS `NEW_USER_CARD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NEW_USER_CARD` (
  `KEYSTRING` char(17) NOT NULL DEFAULT '',
  `CHANNELTYPE` int(10) unsigned NOT NULL DEFAULT '0',
  `TYPE` int(10) unsigned NOT NULL DEFAULT '0',
  `TIMES` int(10) unsigned NOT NULL DEFAULT '0',
  `STATE` int(10) unsigned NOT NULL DEFAULT '0',
  `CHANNEL` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`KEYSTRING`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NEW_USER_CARD_BACK`
--

DROP TABLE IF EXISTS `NEW_USER_CARD_BACK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NEW_USER_CARD_BACK` (
  `KEYSTRING` char(17) NOT NULL DEFAULT '',
  PRIMARY KEY (`KEYSTRING`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OFFLINE_TRADE_MONEY`
--

DROP TABLE IF EXISTS `OFFLINE_TRADE_MONEY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OFFLINE_TRADE_MONEY` (
  `TID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `CHARID` int(11) unsigned NOT NULL DEFAULT '0',
  `ACCID` int(11) unsigned NOT NULL DEFAULT '0',
  `NAME` varchar(256) NOT NULL DEFAULT '',
  `MONEY` int(11) unsigned NOT NULL DEFAULT '0',
  `RMB` int(11) unsigned NOT NULL DEFAULT '0',
  `STATE` int(10) unsigned NOT NULL DEFAULT '0',
  `CREATETIME` int(11) unsigned NOT NULL DEFAULT '0',
  `POWER` int(10) unsigned NOT NULL DEFAULT '0',
  `LEVEL` int(10) unsigned NOT NULL DEFAULT '0',
  `PROFESSION` int(10) unsigned NOT NULL DEFAULT '0',
  `TYPE` int(10) unsigned NOT NULL DEFAULT '0',
  `COUNTRY` int(10) unsigned NOT NULL DEFAULT '0',
  `CREDITLEVEL` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`TID`),
  KEY `ACCID_INDEX` (`ACCID`),
  KEY `NAME_INDEX` (`NAME`),
  KEY `CHAR_INDEX` (`CHARID`),
  KEY `MONEY` (`MONEY`),
  KEY `TYPE` (`TYPE`),
  KEY `PROFESSION` (`PROFESSION`),
  KEY `MONEY_2` (`MONEY`),
  KEY `TYPE_2` (`TYPE`),
  KEY `PROFESSION_2` (`PROFESSION`),
  KEY `MONEY_3` (`MONEY`),
  KEY `TYPE_3` (`TYPE`),
  KEY `PROFESSION_3` (`PROFESSION`)
) ENGINE=MyISAM AUTO_INCREMENT=99007493 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OLDUSER`
--

DROP TABLE IF EXISTS `OLDUSER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OLDUSER` (
  `ACCID` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `ACCID` (`ACCID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OLD_PLAYER_PRESENT`
--

DROP TABLE IF EXISTS `OLD_PLAYER_PRESENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OLD_PLAYER_PRESENT` (
  `accid` int(11) unsigned NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `TIMES` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`accid`,`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PRESENT`
--

DROP TABLE IF EXISTS `PRESENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRESENT` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CHARID` int(10) NOT NULL DEFAULT '0',
  `NAME` varchar(256) NOT NULL DEFAULT '',
  `EVENT` smallint(5) unsigned NOT NULL DEFAULT '0',
  `TYPE` smallint(5) unsigned NOT NULL DEFAULT '0',
  `NUMBER` int(10) NOT NULL DEFAULT '0',
  `ITEM` varchar(128) NOT NULL DEFAULT '',
  `STARTTIME` int(10) NOT NULL DEFAULT '0',
  `ENDTIME` int(10) NOT NULL DEFAULT '0',
  `ACCID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PROVINCE_NAME`
--

DROP TABLE IF EXISTS `PROVINCE_NAME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROVINCE_NAME` (
  `PID` int(10) unsigned NOT NULL,
  `RID` int(10) unsigned NOT NULL,
  `NAME` varchar(256) NOT NULL,
  PRIMARY KEY (`PID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `QUESTION`
--

DROP TABLE IF EXISTS `QUESTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QUESTION` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(256) DEFAULT NULL,
  `descp` varchar(161) DEFAULT NULL,
  `choose1` varchar(256) DEFAULT NULL,
  `choose2` varchar(256) DEFAULT NULL,
  `choose3` varchar(256) DEFAULT NULL,
  `choose4` varchar(256) DEFAULT NULL,
  `choose5` varchar(256) DEFAULT NULL,
  `choose6` varchar(256) DEFAULT NULL,
  `choose7` varchar(256) DEFAULT NULL,
  `choose8` varchar(256) DEFAULT NULL,
  `answer` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3159 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `REGION_NAME`
--

DROP TABLE IF EXISTS `REGION_NAME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REGION_NAME` (
  `RID` int(10) unsigned NOT NULL,
  `NAME` varchar(256) NOT NULL,
  PRIMARY KEY (`RID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RELATION`
--

DROP TABLE IF EXISTS `RELATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RELATION` (
  `CHARID` int(10) unsigned NOT NULL DEFAULT '0',
  `NAME` varchar(256) NOT NULL DEFAULT '',
  `LEVEL` int(10) unsigned NOT NULL DEFAULT '0',
  `COUNTRY` int(10) unsigned NOT NULL DEFAULT '0',
  `CORPS` int(10) unsigned NOT NULL DEFAULT '0',
  `ARMY` int(10) unsigned NOT NULL DEFAULT '0',
  `FACE` int(5) unsigned NOT NULL DEFAULT '0',
  `AREA` int(10) unsigned NOT NULL DEFAULT '0',
  `SUPPORT` int(10) unsigned NOT NULL DEFAULT '0',
  `SUPPORTTODAY` int(10) unsigned NOT NULL DEFAULT '0',
  `SUPPORTLAST` int(10) unsigned NOT NULL DEFAULT '0',
  `ONLINETODO` int(10) unsigned NOT NULL DEFAULT '0',
  `BITMASK` int(10) unsigned NOT NULL DEFAULT '0',
  `TITLE` int(10) unsigned NOT NULL DEFAULT '0',
  `CLEARTIME` bigint(20) unsigned NOT NULL DEFAULT '0',
  `CLEARBITS` int(10) unsigned NOT NULL DEFAULT '0',
  `ONLINETIME` int(10) unsigned NOT NULL DEFAULT '0',
  `OFFLINETIME` int(10) unsigned NOT NULL DEFAULT '0',
  `JOINCORPSTIME` int(10) unsigned NOT NULL DEFAULT '0',
  `LEAVECORPSTIME` int(10) unsigned NOT NULL DEFAULT '0',
  `CORPSCONTRIBUTION` int(10) unsigned NOT NULL DEFAULT '0',
  `ALLBINARY` blob,
  `PROFESSION` int(5) unsigned NOT NULL DEFAULT '0',
  `PRESTIGE` int(10) unsigned NOT NULL DEFAULT '0',
  `MILIRANK` int(5) unsigned NOT NULL DEFAULT '0',
  `ALLONLINETIME` int(10) unsigned NOT NULL DEFAULT '0',
  `CHANNEL` int(10) unsigned NOT NULL DEFAULT '0',
  `CREATENETBAR` int(10) unsigned NOT NULL DEFAULT '0',
  `CREATEMARKET` varchar(32) NOT NULL DEFAULT '',
  `VIPLEVEL` int(10) unsigned NOT NULL DEFAULT '0',
  `MOBILE` bigint(13) unsigned NOT NULL DEFAULT '0',
  `QQ` bigint(13) unsigned NOT NULL DEFAULT '0',
  `MOBILE_TIME` bigint(13) unsigned NOT NULL DEFAULT '0',
  `TODAY_KILL_NUM` int(10) unsigned NOT NULL DEFAULT '0',
  `TODAY_KILL_FOREIGN` int(10) unsigned NOT NULL DEFAULT '0',
  `QQ_CALL_BACK_USER` int(10) unsigned NOT NULL DEFAULT '0',
  `QQ_CALL_BACK_TIMES` int(10) unsigned NOT NULL DEFAULT '0',
  `TEACHER_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `REWARD_SCORE` int(10) unsigned NOT NULL DEFAULT '0',
  `YY` int(10) unsigned NOT NULL DEFAULT '0',
  `GOLD_FATHER` int(10) unsigned NOT NULL DEFAULT '0',
  `GOLD_CHILD_NUM_1` int(10) unsigned NOT NULL DEFAULT '0',
  `GOLD_CHILD_NUM_2` int(10) unsigned NOT NULL DEFAULT '0',
  `OLDZONEID` int(10) unsigned NOT NULL DEFAULT '0',
  `FIGHTTEAMID` int(10) unsigned NOT NULL DEFAULT '0',
  `VERSION` int(11) unsigned NOT NULL DEFAULT '0',
  `CLANS` int(11) unsigned NOT NULL DEFAULT '0',
  `BROTHERS` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`CHARID`),
  UNIQUE KEY `NAME` (`NAME`),
  KEY `LEVEL` (`LEVEL`),
  KEY `OFFLINETIME` (`OFFLINETIME`),
  KEY `LEVEL_2` (`LEVEL`),
  KEY `OFFLINETIME_2` (`OFFLINETIME`),
  KEY `LEVEL_3` (`LEVEL`),
  KEY `OFFLINETIME_3` (`OFFLINETIME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CLANS`
--

DROP TABLE IF EXISTS `CLANS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLANS` (
	`CLANID` int(10) unsigned NOT NULL default '0',
	`NAME` varchar(33) NOT NULL default '',
	`LEVEL` smallint(5) unsigned NOT NULL default '1',
	`LEADER` int(10) unsigned NOT NULL default '0',
	`LEADERNAME` varchar(33) NOT NULL default '',
	`FUNDS` int(10) unsigned NOT NULL default '0',
	`DONATELEVEL` int(10) unsigned NOT NULL default '0',
	`CREATETIME` int(10) unsigned NOT NULL default '0',
	`ALLBINARY` blob,
	PRIMARY KEY  (`CLANID`),
	KEY `NAME` (`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Table structure for table `CLANS`
--
--
-- Table structure for table `BROTHERS`
--
DROP TABLE IF EXISTS `BROTHERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BROTHERS` (
	`BROID` int(10) unsigned NOT NULL default '0',
	`NAME` varchar(33) NOT NULL default '',
	`LEVEL` smallint(5) unsigned NOT NULL default '1',
	`LEADER` int(10) unsigned NOT NULL default '0',
	`LEADERNAME` varchar(33) NOT NULL default '',
	`MONEYS` int(10) unsigned NOT NULL default '0',
	`CREATETIME` int(10) unsigned NOT NULL default '0',
	`ALLBINARY` blob,
	PRIMARY KEY  (`BROID`),
	KEY `NAME` (`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `COMMERCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMMERCE` (
	`ITEMID` int(10) unsigned NOT NULL default '0',
	`BASEID` int(10) unsigned NOT NULL default '0',
	`USERID` int(10) unsigned NOT NULL default '0',
	`PRICE` int(10) unsigned NOT NULL default '0',
	`NUM` int(10) unsigned NOT NULL default '0',
	`TMBEGIN` int(10) unsigned NOT NULL default '0',
	`TMTYPE` int(10) unsigned NOT NULL default '0',
	`STATE` int(10) unsigned NOT NULL default '0',
	`ALLBINARY` blob,
	PRIMARY KEY  (`ITEMID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `MTREWARD`
--

DROP TABLE IF EXISTS `MTREWARD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MTREWARD` (
	`MTID` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`GAMEID` int(10) unsigned NOT NULL default '0',
	`ZONEID` int(10) unsigned NOT NULL default '0',
	`SUBJECT` varchar(128) NOT NULL default '',
	`CONTENT` varchar(255) NOT NULL default '',
	`MTTIME` int(10) unsigned NOT NULL default '0',
	`MINLEVEL` int(10) unsigned NOT NULL default '0',
	`MAXLEVEL` int(10) unsigned NOT NULL default '0',
	`MINVIP` int(10) unsigned NOT NULL default '0',
	`MAXVIP` int(10) unsigned NOT NULL default '0',
	`MINLOGIN` int(10) unsigned NOT NULL default '0',
	`MAXLOGIN` int(10) unsigned NOT NULL default '0',
	`ONLINE` int(10) unsigned NOT NULL default '0',
	`TYPE` int(10) unsigned NOT NULL default '0',
	`USERS` blob,
	`ITEMS` blob,
	PRIMARY KEY (`MTID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `STOCK_BANK`
--

DROP TABLE IF EXISTS `STOCK_BANK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STOCK_BANK` (
  `CHARID` int(10) unsigned NOT NULL DEFAULT '0',
  `GOLD` int(10) unsigned NOT NULL DEFAULT '0',
  `MONEY` int(10) unsigned NOT NULL DEFAULT '0',
  `ALLGOLDIN` int(10) unsigned NOT NULL DEFAULT '0',
  `ALLMONEYIN` int(10) unsigned NOT NULL DEFAULT '0',
  `ALLGOLDOUT` int(10) unsigned NOT NULL DEFAULT '0',
  `ALLMONEYOUT` int(10) unsigned NOT NULL DEFAULT '0',
  `GOLDTAX` int(10) unsigned NOT NULL DEFAULT '0',
  `MONEYTAX` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`CHARID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `STOCK_GOLD`
--

DROP TABLE IF EXISTS `STOCK_GOLD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STOCK_GOLD` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CHARID` int(10) unsigned NOT NULL DEFAULT '0',
  `NUM` int(10) unsigned NOT NULL DEFAULT '0',
  `PRICE` int(10) unsigned NOT NULL DEFAULT '0',
  `TIME` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3499 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `STOCK_GOLDHISTORY`
--

DROP TABLE IF EXISTS `STOCK_GOLDHISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STOCK_GOLDHISTORY` (
  `JNUM` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `CHARID` int(10) unsigned NOT NULL DEFAULT '0',
  `NUM` int(10) unsigned NOT NULL DEFAULT '0',
  `COMMITPRICE` int(10) unsigned NOT NULL DEFAULT '0',
  `PRICE` int(10) unsigned NOT NULL DEFAULT '0',
  `COMMITTIME` int(10) unsigned NOT NULL DEFAULT '0',
  `OKTIME` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`JNUM`)
) ENGINE=MyISAM AUTO_INCREMENT=4669 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `STOCK_MONEY`
--

DROP TABLE IF EXISTS `STOCK_MONEY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STOCK_MONEY` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CHARID` int(10) unsigned NOT NULL DEFAULT '0',
  `NUM` int(10) unsigned NOT NULL DEFAULT '0',
  `PRICE` int(10) unsigned NOT NULL DEFAULT '0',
  `TIME` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=5014 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `STOCK_MONEYHISTORY`
--

DROP TABLE IF EXISTS `STOCK_MONEYHISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STOCK_MONEYHISTORY` (
  `JNUM` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `CHARID` int(10) unsigned NOT NULL DEFAULT '0',
  `NUM` int(10) unsigned NOT NULL DEFAULT '0',
  `COMMITPRICE` int(10) unsigned NOT NULL DEFAULT '0',
  `PRICE` int(10) unsigned NOT NULL DEFAULT '0',
  `COMMITTIME` int(10) unsigned NOT NULL DEFAULT '0',
  `OKTIME` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`JNUM`)
) ENGINE=MyISAM AUTO_INCREMENT=4988 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `STUDENT`
--

DROP TABLE IF EXISTS `STUDENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STUDENT` (
  `charid` int(11) unsigned NOT NULL DEFAULT '0',
  `studentid` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `score` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`charid`,`studentid`),
  KEY `TIME` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WORD_LEVEL`
--

DROP TABLE IF EXISTS `WORD_LEVEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WORD_LEVEL` (
  `LEVEL` int(10) unsigned NOT NULL DEFAULT '0',
  `LAST_LEVEL_TIME` int(10) unsigned NOT NULL DEFAULT '0',
  `LEVEL_UP_FLAG` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`LEVEL`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WORLD_LEVEL`
--

DROP TABLE IF EXISTS `WORLD_LEVEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WORLD_LEVEL` (
  `LEVEL` int(10) unsigned NOT NULL DEFAULT '0',
  `LAST_LEVEL_TIME` int(10) unsigned NOT NULL DEFAULT '0',
  `LEVEL_UP_FLAG` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`LEVEL`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

DROP TABLE IF EXISTS `ORDERS`;
CREATE TABLE `ORDERS` (
  -- `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `my_order_id` varchar(128) NOT NULL DEFAULT '内部订单流水号',
  `charid` int(10) unsigned NOT NULL,
  `platformid` int(11) NOT NULL COMMENT '三方平台ID',
  `goodsid` int(10) unsigned NOT NULL DEFAULT '0',
  `goodscount` int(10) unsigned DEFAULT '0',
  `state` int(11) DEFAULT NULL,
  `other_order_id` varchar(128) NOT NULL DEFAULT '' COMMENT '三方平台回馈的订单流水号',
  `money` float(11,0) NOT NULL COMMENT '玩家实际支付的RMB',
  `ordermoney` float NOT NULL COMMENT '实际支付的代币',
  `platordermoney` float NOT NULL DEFAULT '0' COMMENT '三方平台回馈的代币数',
  `createtime` varchar(50) NOT NULL DEFAULT '创建时间',
  PRIMARY KEY (`my_order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1558 DEFAULT CHARSET=utf8;
-- Dump completed on 2015-08-06 14:01:56
