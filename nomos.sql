-- MySQL dump 10.13  Distrib 5.5.37, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: nomos
-- ------------------------------------------------------
-- Server version	5.5.37-0ubuntu0.12.04.1-log

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
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `src` varchar(255) NOT NULL,
  `flag` int(11) NOT NULL,
  `marks` varchar(255) NOT NULL,
  `total` int(11) NOT NULL,
  `intime` datetime NOT NULL,
  `utime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (49,'upload/55a71fda62ea1.jpg',2,'21,22,23,20',86,'2015-07-16 11:06:54','2015-07-16 11:07:06'),(50,'upload/55a72077806c3.jpg',2,'24,20,25,24',93,'2015-07-16 11:09:26','2015-07-16 11:09:43');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `same_getlog`
--

DROP TABLE IF EXISTS `same_getlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `same_getlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `openid` varchar(100) DEFAULT NULL,
  `msgtype` varchar(20) DEFAULT NULL,
  `event` varchar(20) DEFAULT NULL,
  `eventkey` varchar(50) DEFAULT NULL,
  `createtim` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `timeint` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `timeint` (`timeint`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `same_getlog`
--

LOCK TABLES `same_getlog` WRITE;
/*!40000 ALTER TABLE `same_getlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `same_getlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `same_qrcode`
--

DROP TABLE IF EXISTS `same_qrcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `same_qrcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bak` varchar(50) NOT NULL,
  `scene_id` int(11) NOT NULL,
  `ticket` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='二维码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `same_qrcode`
--

LOCK TABLES `same_qrcode` WRITE;
/*!40000 ALTER TABLE `same_qrcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `same_qrcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `same_store`
--

DROP TABLE IF EXISTS `same_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `same_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `telphone` varchar(50) NOT NULL,
  `open` varchar(255) NOT NULL,
  `lat` double NOT NULL COMMENT '经度',
  `lng` double NOT NULL COMMENT '纬度',
  `picUrl` varchar(255) NOT NULL,
  `mapUrl` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lat` (`lat`,`lng`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='门店信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `same_store`
--

LOCK TABLES `same_store` WRITE;
/*!40000 ALTER TABLE `same_store` DISABLE KEYS */;
INSERT INTO `same_store` VALUES (1,'','','北京WEMPE','北京市朝阳区东大桥路9号侨福芳草地大厦2层L2-10','010-56907123','http://mo.amap.com/navi/?start=0&dest=116.448873,39.919535&destName=%E5%8C%97%E4%BA%ACWEMPE&key=fa1558612205af8e78f67e16f97df54e',116.448873,39.919535,'/upload/img/20150722/113839-764.jpg','/upload/img/20150722/113845-834.png'),(2,'','','北京翠微百货店','北京市海淀区复兴路33号','010-68282228','http://mo.amap.com/navi/?start=0&dest=116.303909,39.908238&destName=北京翠微百货店&key=fa1558612205af8e78f67e16f97df54e',116.303909,39.908238,'/upload/img/20150722/113818-914.jpg','/upload/img/20150722/113827-298.png'),(3,'','','上海太子珠宝钟表店','上海市南京西路1053号','021-32558860','http://mo.amap.com/navi/?start=0&dest=121.457665,31.228146&destName=上海太子珠宝钟表店&key=fa1558612205af8e78f67e16f97df54e',121.457665,31.228146,'/upload/img/20150722/113802-853.jpg','/upload/img/20150722/113807-420.png'),(4,'','','上海新中安名表城','上海市南京西路1117-1127号','021-52133656','http://mo.amap.com/navi/?start=0&dest=121.456537,31.228009&destName=上海新中安名表城&key=fa1558612205af8e78f67e16f97df54e',121.456537,31.228009,'/upload/img/20150722/113745-910.jpg','/upload/img/20150722/113751-220.png'),(5,'','','杭州万象城','杭州市江干区富春路701号万象城一层名表区','0571-89705710','http://mo.amap.com/navi/?start=0&dest=120.215533,30.251857&destName=%E6%9D%AD%E5%B7%9E%E4%B8%87%E8%B1%A1%E5%9F%8E&key=fa1558612205af8e78f67e16f97df54e',120.215533,30.251857,'/upload/img/20150722/113711-948.jpg','/upload/img/20150722/113718-665.png'),(6,'','','鞍山慧通瑞士表店','鞍山市铁东区二一九路47甲-1号','0412-5541999','http://mo.amap.com/navi/?start=0&dest=123.002504,41.106977&destName=%E9%9E%8D%E5%B1%B1%E6%85%A7%E9%80%9A%E7%91%9E%E5%A3%AB%E8%A1%A8%E5%BA%97&key=fa1558612205af8e78f67e16f97df54e',123.002504,41.106977,'/upload/img/20150722/113122-387.jpg','/upload/img/20150722/113131-153.png'),(7,'','','沈阳1928','沈阳市和平区南京北街312号1928大厦','024-23838239','http://mo.amap.com/navi/?start=0&dest=123.405322,41.790483&destName=%E6%B2%88%E9%98%B31928&key=fa1558612205af8e78f67e16f97df54e',123.405322,41.790483,'/upload/img/20150722/113428-254.jpg','/upload/img/20150722/113434-252.png'),(8,'','','长春卓展购物中心店','长春市重庆路1799号','0431-88486691','http://mo.amap.com/navi/?start=0&dest=125.320085,43.889649&destName=%E9%95%BF%E6%98%A5%E5%8D%93%E5%B1%95%E8%B4%AD%E7%89%A9%E4%B8%AD%E5%BF%83%E5%BA%97&key=fa1558612205af8e78f67e16f97df54e',125.320085,43.889649,'/upload/img/20150722/113612-695.jpg','/upload/img/20150722/113619-696.png'),(9,'','','成都金牛百货店','成都市人民北路与一环路交叉口','028-82876207','http://mo.amap.com/navi/?start=0&dest=104.073084,30.685896&destName=%E6%88%90%E9%83%BD%E9%87%91%E7%89%9B%E7%99%BE%E8%B4%A7%E5%BA%97&key=fa1558612205af8e78f67e16f97df54e',104.073084,30.685896,'/upload/img/20150722/113634-543.jpg','/upload/img/20150722/113641-507.png'),(10,'','','昆明金格白塔店','昆明市白塔路90号','0871-63127466','http://mo.amap.com/navi/?start=0&dest=102.725094,25.036799&destName=%E6%98%86%E6%98%8E%E9%87%91%E6%A0%BC%E7%99%BD%E5%A1%94%E5%BA%97&key=fa1558612205af8e78f67e16f97df54e',102.725094,25.036799,'/upload/img/20150722/113654-221.jpg','/upload/img/20150722/113701-320.png'),(11,'','','NOMOS指定维修中心 - 捷成钟表','上海市黄浦区延安东路618号东海商业中心12楼','021-60323989','http://mo.amap.com/navi/?start=0&dest=121.480508,31.2303449&destName=NOMOS指定维修中心&key=fa1558612205af8e78f67e16f97df54e',121.480508,31.230344,'','/upload/img/20150722/113934-743.png'),(12,'','','NOMOS特约维修中心','北京市朝阳区东大桥路9号侨福芳草地大厦2层L2-10','010-56907123','http://mo.amap.com/navi/?start=0&dest=116.448873,39.919535&destName=NOMOS%E7%89%B9%E7%BA%A6%E7%BB%B4%E4%BF%AE%E4%B8%AD%E5%BF%83&key=fa1558612205af8e78f67e16f97df54e',116.448873,39.919535,'','/upload/img/20150722/113948-592.png');
/*!40000 ALTER TABLE `same_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `same_sys_menu`
--

DROP TABLE IF EXISTS `same_sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `same_sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(100) NOT NULL,
  `sort` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='系统菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `same_sys_menu`
--

LOCK TABLES `same_sys_menu` WRITE;
/*!40000 ALTER TABLE `same_sys_menu` DISABLE KEYS */;
INSERT INTO `same_sys_menu` VALUES (1,'','后台管理系统','',1,0,'','2013-04-25 17:53:43'),(58,'54','门店管理','wmenu/store',20,1,'admin','2015-02-04 08:18:16'),(52,'0','系统管理','',1000,0,'','2014-07-03 00:54:57'),(53,'52','系统菜单管理','menu',1000,0,'','2014-07-03 00:55:32'),(54,'1','微信管理','',20,1,'trioadmin','2014-07-03 00:57:27'),(55,'54','微信菜单列表','wmenu/index',5,1,'trioadmin','2014-07-03 00:58:31'),(56,'54','生成微信菜单','wmenu/create',10,1,'trioadmin','2014-07-03 00:58:50'),(57,'54','微信事件列表','wmenu/event',15,1,'trioadmin','2014-07-03 01:08:11');
/*!40000 ALTER TABLE `same_sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `same_sys_permissions`
--

DROP TABLE IF EXISTS `same_sys_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `same_sys_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rname` varchar(20) NOT NULL,
  `role` text NOT NULL,
  `uid` int(11) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='权限控制表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `same_sys_permissions`
--

LOCK TABLES `same_sys_permissions` WRITE;
/*!40000 ALTER TABLE `same_sys_permissions` DISABLE KEYS */;
INSERT INTO `same_sys_permissions` VALUES (1,'普通用户','0,14,15,1,12',0,'','2013-04-24 10:49:38'),(2,'管理员','0,14,15,1,11,13,12,2',0,'','2013-04-24 17:03:21'),(3,'超级管理员','0,1,31,32,48',1,'test','2013-04-25 09:08:29');
/*!40000 ALTER TABLE `same_sys_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `same_sys_user`
--

DROP TABLE IF EXISTS `same_sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `same_sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `rname` varchar(10) NOT NULL COMMENT '真实名字',
  `did` int(11) NOT NULL COMMENT '部门id',
  `dname` varchar(50) NOT NULL,
  `pid` int(11) NOT NULL COMMENT '权限id',
  `pname` varchar(50) NOT NULL,
  `status` enum('激活','锁定') NOT NULL DEFAULT '激活' COMMENT '用户状态，1激活，0锁定',
  `ouid` int(11) NOT NULL,
  `ouname` varchar(20) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uname` (`uname`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='系统用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `same_sys_user`
--

LOCK TABLES `same_sys_user` WRITE;
/*!40000 ALTER TABLE `same_sys_user` DISABLE KEYS */;
INSERT INTO `same_sys_user` VALUES (1,'admin','0b4e7a0e5fe84ad35fb5f95b9ceeac79','admin',2,'管理部',3,'超级管理员','激活',1,'test','2015-06-21 03:18:10');
/*!40000 ALTER TABLE `same_sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `same_sys_user_login_log`
--

DROP TABLE IF EXISTS `same_sys_user_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `same_sys_user_login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='后台管理用户登录日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `same_sys_user_login_log`
--

LOCK TABLES `same_sys_user_login_log` WRITE;
/*!40000 ALTER TABLE `same_sys_user_login_log` DISABLE KEYS */;
INSERT INTO `same_sys_user_login_log` VALUES (1,1,'admin','101.81.28.152','2015-07-10 02:39:54'),(2,1,'admin','10.0.2.2','2015-07-16 04:17:05'),(3,1,'admin','10.0.2.2','2015-07-16 06:49:40'),(4,1,'admin','10.0.2.2','2015-07-16 09:40:24'),(5,1,'admin','10.0.2.2','2015-07-16 10:40:06'),(6,1,'admin','10.0.2.2','2015-07-17 06:58:19'),(7,1,'admin','10.0.2.2','2015-07-17 08:56:50'),(8,1,'admin','10.0.2.2','2015-07-22 03:15:56');
/*!40000 ALTER TABLE `same_sys_user_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `same_wmenu`
--

DROP TABLE IF EXISTS `same_wmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `same_wmenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `event` varchar(20) NOT NULL,
  `eventkey` varchar(50) NOT NULL,
  `eventurl` varchar(255) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='微信菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `same_wmenu`
--

LOCK TABLES `same_wmenu` WRITE;
/*!40000 ALTER TABLE `same_wmenu` DISABLE KEYS */;
INSERT INTO `same_wmenu` VALUES (1,0,'微表柜','click','','','2015-07-16 07:21:11'),(2,0,'微表情','click','','','2015-07-16 07:23:02'),(3,0,'微客服','click','','','2015-07-16 07:25:15'),(4,1,'腕间留影','view','','/','2015-07-16 07:26:25'),(5,2,'爱简约','click','B1','','2015-07-16 07:54:02'),(6,2,'NOMOS臻品','click','B2','','2015-07-16 07:54:33'),(7,2,'咨询播报','click','B3','','2015-07-16 07:54:48'),(8,3,'自助服务','click','C1','','2015-07-16 07:55:05'),(9,3,'呼叫客服','click','C2','','2015-07-16 07:55:30'),(10,3,'实体店','click','C3','','2015-07-16 07:57:14');
/*!40000 ALTER TABLE `same_wmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `same_wmenu_event`
--

DROP TABLE IF EXISTS `same_wmenu_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `same_wmenu_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL,
  `event` varchar(20) NOT NULL,
  `msgtype` varchar(20) NOT NULL,
  `keyword` varchar(50) DEFAULT NULL,
  `mohu` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `picUrl` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=158 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `same_wmenu_event`
--

LOCK TABLES `same_wmenu_event` WRITE;
/*!40000 ALTER TABLE `same_wmenu_event` DISABLE KEYS */;
INSERT INTO `same_wmenu_event` VALUES (1,7,'click','news','',0,'','更多“金”彩——全新Lambda深蓝色白金腕表','更多“金”彩——全新Lambda深蓝色白金腕表','/upload/img/20150716/162850-883.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201709071&idx=1&sn=8f1816fa3b151ab8b253055060543329#rd','2015-07-16 08:28:52'),(2,7,'click','news','',0,'','NOMOS 全新Lux女士腕表，尽显色彩之美','NOMOS 全新Lux女士腕表，尽显色彩之美','/upload/img/20150716/162923-946.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201709071&idx=2&sn=c31b7b075f69a1c175ac8fbe1a3cdb4c#rd','2015-07-16 08:29:34'),(3,7,'click','news','',0,'','全新苏黎世系列正蓝色世界时腕表正式发表！','全新苏黎世系列正蓝色世界时腕表正式发表！','/upload/img/20150716/163009-393.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201709071&idx=3&sn=5283bd412344369b2e851b5313989593#rd','2015-07-16 08:30:11'),(4,6,'click','news','',0,'','NOMOS，为每一款腕表骄傲！','NOMOS，为每一款腕表骄傲！','/upload/img/20150716/163445-932.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201620693&idx=1&sn=d3e6d8d8e3db7012dd1f00ddc1fd0d87#rd','2015-07-16 08:34:54'),(5,6,'click','news','',0,'','NOMOS经典系列——Tangente、Tangomat','NOMOS经典系列——Tangente、Tangomat','/upload/img/20150716/163519-682.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201620693&idx=2&sn=c6582f3370030f4c63babc042e329d3a#rd','2015-07-16 08:35:26'),(6,6,'click','news','',0,'','情迷拉丁——Ludwig系列','情迷拉丁——Ludwig系列','/upload/img/20150716/163608-664.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201620693&idx=3&sn=84391a245a9d9bc489ac1f1c1a0d984b#rd','2015-07-16 08:36:10'),(7,6,'click','news','',0,'','全世界的Zürich系列','全世界的Zürich系列','/upload/img/20150716/163637-383.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201620693&idx=4&sn=e1f88cd69859b0048c3622e77875931c#rd','2015-07-16 08:36:38'),(8,6,'click','news','',0,'','NOMOS家族中优雅内敛之面——Orion系列','NOMOS家族中优雅内敛之面——Orion系列','/upload/img/20150716/163701-543.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201620693&idx=5&sn=bdffa2abaaae65d049d3f35ad45072c4#rd','2015-07-16 08:37:03'),(9,6,'click','news','',0,'','活力充沛、运动感十足的Club系列','活力充沛、运动感十足的Club系列','/upload/img/20150716/163726-396.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201620693&idx=6&sn=42dda88aa6619792513fb7c190118ae6#rd','2015-07-16 08:37:28'),(10,6,'click','news','',0,'','Tetra系列的方形之美','Tetra系列的方形之美','/upload/img/20150716/163751-595.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201620693&idx=7&sn=5546a010bc8217ef140442ab3cb54574#rd','2015-07-16 08:37:53'),(11,5,'click','news','',0,'','爱简约，爱NOMOS','爱简约，爱NOMOS','/upload/img/20150716/163848-756.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625855&idx=1&sn=20ffbb587843f616a5914cc7008bbd69#rd','2015-07-16 08:38:49'),(12,10,'click','news','',0,'','NOMOS中国官方店铺','NOMOS中国官方店铺','/upload/img/20150716/174044-352.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201620274&idx=1&sn=45099b7e834c7500dbdb324274e9c47e#rd','2015-07-16 08:55:40'),(13,8,'click','text','',0,'感谢关注NOMOS腕表！在此，您可以了解到我们的系列产品，知晓我们的品牌故事，在第一时间获取最新资讯。我们将与您一起感受NOMOS简约却不简单的包豪斯风格，一起体验时间艺术之本味！\n现在，您可以回复以下数字，开启指尖上的NOMOS腕表之旅： \n1. 品牌故事 \n2. 经典腕表系列介绍 \n3. 全新腕表系列介绍 \n4. 经典机芯技术 \n5. 高端机芯技术 \n6. 高级马皮表带 \n7. 保养须知\n8. NOMOS中国官方店铺 \n9. 服务热线\n\n如果您想再次获得这份菜单，回复【菜单】即可。','','','','','2015-07-16 09:03:37'),(14,0,'text','news','1',0,'','品牌故事','品牌故事','/upload/img/20150716/184917-826.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201620010&idx=1&sn=dccea8025569a2398bc5d7b4f1e04940#rd','2015-07-16 10:49:19'),(15,0,'text','news','2',0,'','NOMOS，为每一款腕表骄傲！','NOMOS，为每一款腕表骄傲！','/upload/img/20150716/184948-972.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201620693&idx=1&sn=d3e6d8d8e3db7012dd1f00ddc1fd0d87#rd','2015-07-16 10:49:49'),(16,0,'text','news','2',0,'','NOMOS经典系列——Tangente、Tangomat','NOMOS经典系列——Tangente、Tangomat','/upload/img/20150716/185049-819.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201620693&idx=2&sn=c6582f3370030f4c63babc042e329d3a#rd','2015-07-16 10:50:51'),(17,0,'text','news','2',0,'','情迷拉丁——Ludwig系列','情迷拉丁——Ludwig系列','/upload/img/20150716/185122-548.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201620693&idx=3&sn=84391a245a9d9bc489ac1f1c1a0d984b#rd','2015-07-16 10:51:23'),(18,0,'text','news','2',0,'','全世界的Zürich系列','全世界的Zürich系列','/upload/img/20150716/185156-770.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201620693&idx=4&sn=e1f88cd69859b0048c3622e77875931c#rd','2015-07-16 10:51:57'),(19,0,'text','news','2',0,'','NOMOS家族中优雅内敛之面——Orion系列','NOMOS家族中优雅内敛之面——Orion系列','/upload/img/20150716/185227-693.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201620693&idx=5&sn=bdffa2abaaae65d049d3f35ad45072c4#rd','2015-07-16 10:52:28'),(20,0,'text','news','2',0,'','活力充沛、运动感十足的Club系列','活力充沛、运动感十足的Club系列','/upload/img/20150716/185245-499.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201620693&idx=6&sn=42dda88aa6619792513fb7c190118ae6#rd','2015-07-16 10:52:52'),(21,0,'text','news','2',0,'','Tetra系列的方形之美','Tetra系列的方形之美','/upload/img/20150716/185311-380.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201620693&idx=7&sn=5546a010bc8217ef140442ab3cb54574#rd','2015-07-16 10:53:19'),(22,0,'text','news','3',0,'','全新NOMOS系列，不一样的腕间体验！','全新NOMOS系列，不一样的腕间体验！','/upload/img/20150716/185407-971.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201620807&idx=1&sn=bfe163eb66fa6876c80e023ac89518d0#rd','2015-07-16 10:54:17'),(23,0,'text','news','3',0,'','泳池季节的福音——Ahoi系列','泳池季节的福音——Ahoi系列','/upload/img/20150716/185440-930.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201620807&idx=2&sn=0d4f357ece55ec2de4e44b9183d43dfb#rd','2015-07-16 10:54:51'),(24,0,'text','news','3',0,'','名副其实的金表——Lux与Lambda','名副其实的金表——Lux与Lambda','/upload/img/20150716/185527-976.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201620807&idx=3&sn=90d6b660676160d1b4e745649d5e9330#rd','2015-07-16 10:55:36'),(25,0,'text','news','3',0,'','来自格拉苏蒂的翩然摆动——Metro','来自格拉苏蒂的翩然摆动——Metro','/upload/img/20150716/185553-162.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201620807&idx=4&sn=580c8091da1a6cc5c105913590fd9e36#rd','2015-07-16 10:56:01'),(26,0,'text','news','4',0,'','NOMOS经典机芯技术','NOMOS经典机芯技术','/upload/img/20150716/185701-894.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201620455&idx=1&sn=533d34ac3e2c83ec06ea91c0a10bd0db#rd','2015-07-16 10:57:12'),(27,0,'text','news','4',0,'','NOMOS手动上链机芯ALPHA','NOMOS手动上链机芯ALPHA','/upload/img/20150716/185735-369.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201620455&idx=2&sn=ba254b0f688e76aca935b945b2183d6f#rd','2015-07-16 10:57:46'),(28,0,'text','news','4',0,'','NOMOS手动上链机芯BETA','NOMOS手动上链机芯BETA','/upload/img/20150716/185853-915.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201620455&idx=3&sn=f5b18830ae5698f077a9995263288393#rd','2015-07-16 10:59:03'),(29,0,'text','news','4',0,'','NOMOS手动上链机芯GAMMA','NOMOS手动上链机芯GAMMA','/upload/img/20150716/185930-330.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201620455&idx=4&sn=902a5ce926fc01ffa8d6127a9dafe9ba#rd','2015-07-16 10:59:41'),(30,0,'text','news','4',0,'','NOMOS手动上链机芯DELTA','NOMOS手动上链机芯DELTA','/upload/img/20150716/190019-901.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201620455&idx=5&sn=f11c28544429b2d787637224f81474e6#rd','2015-07-16 11:00:20'),(31,0,'text','news','4',0,'','NOMOS自动上链机芯EPSILON','NOMOS自动上链机芯EPSILON','/upload/img/20150716/190052-454.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201620455&idx=6&sn=1be1d5f4d22314fed4af546280df70c5#rd','2015-07-16 11:00:53'),(32,0,'text','news','4',0,'','NOMOS自动上链机芯ZETA','NOMOS自动上链机芯ZETA','/upload/img/20150716/190115-769.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201620455&idx=7&sn=72a327e81cd9b5d5764f6d4614ea7e00#rd','2015-07-16 11:01:23'),(33,0,'text','news','4',0,'','NOMOS自动上弦机芯XI','NOMOS自动上弦机芯XI','/upload/img/20150716/190148-533.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201620455&idx=8&sn=da5554b8d4285747142be2950bd406a7#rd','2015-07-16 11:01:49'),(34,0,'text','news','5',0,'','NOMOS高端机芯技术','NOMOS高端机芯技术','/upload/img/20150716/190226-883.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201620331&idx=1&sn=6e93989ff8874fa4962f6d1747a4ed05#rd','2015-07-16 11:02:28'),(35,0,'text','news','5',0,'','DUW1001与DUW2002——无与伦比的制表技艺！','DUW1001与DUW2002——无与伦比的制表技艺！','/upload/img/20150716/190249-181.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201620331&idx=2&sn=e134f03758b7ecdf910d78ec9a95908b#rd','2015-07-16 11:02:59'),(36,0,'text','news','5',0,'','DUW 4301与DUW4401——全新擒纵结构给你好看！','DUW 4301与DUW4401——全新擒纵结构给你好看！','/upload/img/20150716/190318-978.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201620331&idx=3&sn=76b5141b48b99c4f242f3c17361f6a4c#rd','2015-07-16 11:03:27'),(37,0,'text','news','6',0,'','NOMOS高级马皮表带','NOMOS高级马皮表带','/upload/img/20150716/190346-189.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201620095&idx=1&sn=c3d8b436b2e298ac8861bfaa66f62312#rd','2015-07-16 11:03:57'),(38,0,'text','news','7',0,'','NOMOS腕表保养须知','NOMOS腕表保养须知','/upload/img/20150716/190434-648.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201620172&idx=1&sn=35eb342c27530ab856aa306338890e7d#rd','2015-07-16 11:04:35'),(39,0,'text','news','8',0,'','NOMOS中国官方店铺','NOMOS中国官方店铺','/upload/img/20150716/190504-359.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201620274&idx=1&sn=45099b7e834c7500dbdb324274e9c47e#rd','2015-07-16 11:05:05'),(40,0,'text','text','9',0,'咨询腕表购买或维修详情，欢迎拨打服务热线021-60323989','','','','','2015-07-16 11:05:23'),(41,0,'text','news','Zurich',0,'','周游列国的Zürich系列','周游列国的Zürich系列','/upload/img/20150716/190939-510.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625778&idx=1&sn=f13f753bd9c27f3e9c31f397ef3e9dac#rd','2015-07-16 11:09:40'),(42,0,'text','news','Zurich',0,'','Zürich Weltzeitnachtblau（型号：807）','Zürich Weltzeitnachtblau（型号：807）','/upload/img/20150716/191033-827.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625778&idx=2&sn=ea6ffbaefbe4acc9ebe8ac6656e30c1a#rd','2015-07-16 11:10:34'),(43,0,'text','news','807',0,'','Zürich Weltzeitnachtblau（型号：807）','Zürich Weltzeitnachtblau（型号：807）','/upload/img/20150716/191033-827.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625778&idx=2&sn=ea6ffbaefbe4acc9ebe8ac6656e30c1a#rd','2015-07-16 11:11:32'),(44,0,'text','news','Zurich',0,'','Zürich（型号：801）','Zürich（型号：801）','/upload/img/20150716/191527-298.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625778&idx=3&sn=9a03f101cbadcd8237ed65d0ae1844d8#rd','2015-07-16 11:15:29'),(45,0,'text','news','801',0,'','Zürich（型号：801）','Zürich（型号：801）','/upload/img/20150716/191527-298.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625778&idx=3&sn=9a03f101cbadcd8237ed65d0ae1844d8#rd','2015-07-16 11:15:29'),(46,0,'text','news','Zurich',0,'','Zürich Datum（型号：802）','Zürich Datum（型号：802）','/upload/img/20150716/191657-524.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625778&idx=4&sn=0e48e39b4b45612ad8ab417697189ed6#rd','2015-07-16 11:17:08'),(47,0,'text','news','802',0,'','Zürich Datum（型号：802）','Zürich Datum（型号：802）','/upload/img/20150716/191657-524.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625778&idx=4&sn=0e48e39b4b45612ad8ab417697189ed6#rd','2015-07-16 11:17:08'),(48,0,'text','news','Zurich',0,'','Zürich Weltzeit（型号：805）','Zürich Weltzeit（型号：805）','/upload/img/20150716/191815-246.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625778&idx=5&sn=a01a7404da65768474272b33aaf95221#rd','2015-07-16 11:18:16'),(49,0,'text','news','805',0,'','Zürich Weltzeit（型号：805）','Zürich Weltzeit（型号：805）','/upload/img/20150716/191815-246.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625778&idx=5&sn=a01a7404da65768474272b33aaf95221#rd','2015-07-16 11:18:16'),(50,0,'text','news','Zurich',0,'','Zürich blaugold（型号：822）','Zürich blaugold（型号：822）','/upload/img/20150716/191917-537.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625778&idx=6&sn=9a2fe8ba19e829262d5af3e35e4f3784#rd','2015-07-16 11:19:18'),(51,0,'text','news','822',0,'','Zürich blaugold（型号：822）','Zürich blaugold（型号：822）','/upload/img/20150716/191917-537.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625778&idx=6&sn=9a2fe8ba19e829262d5af3e35e4f3784#rd','2015-07-16 11:19:18'),(52,0,'text','news','Zurich',0,'','Zürich braungold（型号：823）','Zürich braungold（型号：823）','/upload/img/20150716/192004-327.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625778&idx=7&sn=ac0c4819924e5fee00254d6158091a20#rd','2015-07-16 11:20:12'),(53,0,'text','news','823',0,'','Zürich braungold（型号：823）','Zürich braungold（型号：823）','/upload/img/20150716/192004-327.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625778&idx=7&sn=ac0c4819924e5fee00254d6158091a20#rd','2015-07-16 11:20:12'),(54,0,'text','news','Tetra',0,'','Tetra系列，方寸之间定义别样优美','Tetra系列，方寸之间定义别样优美','/upload/img/20150717/103330-260.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625656&idx=1&sn=2c93b953fd0141b5dcdfcdad8f3f7bde#rd','2015-07-17 02:33:31'),(55,0,'text','news','Tetra',0,'','Tetra Clärchen（型号：489）','Tetra Clärchen（型号：489）','/upload/img/20150717/103519-827.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625656&idx=2&sn=1586b8ee20645adbe5acef420a106e06#rd','2015-07-17 02:33:31'),(56,0,'text','news','489',0,'','Tetra Clärchen（型号：489）','Tetra Clärchen（型号：489）','/upload/img/20150717/103519-827.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625656&idx=2&sn=1586b8ee20645adbe5acef420a106e06#rd','2015-07-17 02:33:31'),(57,0,'text','news','Tetra',0,'','Nachtijall（型号：490）','Nachtijall（型号：490）','/upload/img/20150717/103643-440.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625656&idx=3&sn=4a141a81025948f8e0d7a1fabb139623#rd','2015-07-17 02:36:45'),(58,0,'text','news','490',0,'','Nachtijall（型号：490）','Nachtijall（型号：490）','/upload/img/20150717/103643-440.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625656&idx=3&sn=4a141a81025948f8e0d7a1fabb139623#rd','2015-07-17 02:36:45'),(59,0,'text','news','Tetra',0,'','Goldelse（型号：491）','Goldelse（型号：491）','/upload/img/20150717/103733-348.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625656&idx=4&sn=4d7402e3e6adadc76c9f842a1339ff2a#rd','2015-07-17 02:37:44'),(60,0,'text','news','491',0,'','Goldelse（型号：491）','Goldelse（型号：491）','/upload/img/20150717/103733-348.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625656&idx=4&sn=4d7402e3e6adadc76c9f842a1339ff2a#rd','2015-07-17 02:37:44'),(61,0,'text','news','Tetra',0,'','Kleene（型号：492）','Kleene（型号：492）','/upload/img/20150717/103859-346.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625656&idx=5&sn=4d4769182567acb6e033d9d0761fa8f8#rd','2015-07-17 02:39:00'),(62,0,'text','news','492',0,'','Kleene（型号：492）','Kleene（型号：492）','/upload/img/20150717/103859-346.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625656&idx=5&sn=4d4769182567acb6e033d9d0761fa8f8#rd','2015-07-17 02:39:00'),(63,0,'text','news','Tetra',0,'','Tetra（型号：401）','Tetra（型号：401）','/upload/img/20150717/104025-468.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625656&idx=6&sn=e2b24420b60837388ea89811b0018090#rd','2015-07-17 02:40:27'),(64,0,'text','news','401',0,'','Tetra（型号：401）','Tetra（型号：401）','/upload/img/20150717/104025-468.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625656&idx=6&sn=e2b24420b60837388ea89811b0018090#rd','2015-07-17 02:40:27'),(65,0,'text','news','Tetra',0,'','Tetra Gross（型号：408、406）','Tetra Gross（型号：408、406）','/upload/img/20150717/104129-819.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625656&idx=7&sn=c96c2b89530c63db3bf02abd632cd8be#rd','2015-07-17 02:41:32'),(66,0,'text','news','408',0,'','Tetra Gross（型号：408、406）','Tetra Gross（型号：408、406）','/upload/img/20150717/104129-819.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625656&idx=7&sn=c96c2b89530c63db3bf02abd632cd8be#rd','2015-07-17 02:41:32'),(67,0,'text','news','406',0,'','Tetra Gross（型号：408、406）','Tetra Gross（型号：408、406）','/upload/img/20150717/104129-819.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625656&idx=7&sn=c96c2b89530c63db3bf02abd632cd8be#rd','2015-07-17 02:41:32'),(68,0,'text','news','Tetra',0,'','Tetra Karat（型号：472）','Tetra Karat（型号：472）','/upload/img/20150717/104224-903.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625656&idx=8&sn=bf2fa9c8a5f640c5d0a60d652150a02a#rd','2015-07-17 02:42:25'),(69,0,'text','news','472',0,'','Tetra Karat（型号：472）','Tetra Karat（型号：472）','/upload/img/20150717/104224-903.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625656&idx=8&sn=bf2fa9c8a5f640c5d0a60d652150a02a#rd','2015-07-17 02:42:25'),(70,0,'text','news','Tangomat',0,'','Tangomat，NOMOS首款自动腕表','Tangomat，NOMOS首款自动腕表','/upload/img/20150717/105952-964.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625502&idx=1&sn=3e8a3a453b54cdb7cbec49ce897131b0#rd','2015-07-17 02:59:53'),(71,0,'text','news','Tangomat',0,'','Tangomat（型号：601）','Tangomat（型号：601）','/upload/img/20150717/110053-326.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625502&idx=2&sn=58072d4b255d9fae8081c9976fc2453f#rd','2015-07-17 03:00:55'),(72,0,'text','news','601',0,'','Tangomat（型号：601）','Tangomat（型号：601）','/upload/img/20150717/110053-326.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625502&idx=2&sn=58072d4b255d9fae8081c9976fc2453f#rd','2015-07-17 03:00:55'),(73,0,'text','news','Tangomat',0,'','Tangomat Datum（型号：602）','Tangomat Datum（型号：602）','/upload/img/20150717/110146-541.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625502&idx=3&sn=f931070e317ff78abf718c85a8152904#rd','2015-07-17 03:01:54'),(74,0,'text','news','602',0,'','Tangomat Datum（型号：602）','Tangomat Datum（型号：602）','/upload/img/20150717/110146-541.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625502&idx=3&sn=f931070e317ff78abf718c85a8152904#rd','2015-07-17 03:01:54'),(75,0,'text','news','Tangomat',0,'','Tangomat Ruthenium（型号：603）','Tangomat Ruthenium（型号：603）','/upload/img/20150717/110234-985.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625502&idx=4&sn=6db6a17d62b3c53bc034908233f77623#rd','2015-07-17 03:02:43'),(76,0,'text','news','603',0,'','Tangomat Ruthenium（型号：603）','Tangomat Ruthenium（型号：603）','/upload/img/20150717/110234-985.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625502&idx=4&sn=6db6a17d62b3c53bc034908233f77623#rd','2015-07-17 03:02:43'),(77,0,'text','news','Tangomat',0,'','Tangomat Ruthenium Datum（型号：604）','Tangomat Ruthenium Datum（型号：604）','/upload/img/20150717/110318-613.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625502&idx=5&sn=9cf8443e96d90ec6911263f762a2e006#rd','2015-07-17 03:03:27'),(78,0,'text','news','604',0,'','Tangomat Ruthenium Datum（型号：604）','Tangomat Ruthenium Datum（型号：604）','/upload/img/20150717/110318-613.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625502&idx=5&sn=9cf8443e96d90ec6911263f762a2e006#rd','2015-07-17 03:03:27'),(79,0,'text','news','Tangomat',0,'','Tangomat GMT（型号：635）','Tangomat GMT（型号：635）','/upload/img/20150717/110411-255.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625502&idx=6&sn=cba43fd89d31abc760d01cf61ed395a3#rd','2015-07-17 03:04:21'),(80,0,'text','news','635',0,'','Tangomat GMT（型号：635）','Tangomat GMT（型号：635）','/upload/img/20150717/110411-255.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625502&idx=6&sn=cba43fd89d31abc760d01cf61ed395a3#rd','2015-07-17 03:04:21'),(81,0,'text','news','Tangente',0,'','Tangente，享誉全球的腕表系列','Tangente，享誉全球的腕表系列','/upload/img/20150717/113243-327.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625295&idx=1&sn=834b7249824873d01d8eb16ff0b656ea#rd','2015-07-17 03:32:44'),(82,0,'text','news','Tangente',0,'','Tangente 33（型号：122、123）','Tangente 33（型号：122、123）','/upload/img/20150717/113317-693.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625295&idx=2&sn=b195db282b44feb477c99bf583d743c4#rd','2015-07-17 03:33:31'),(83,0,'text','news','122',0,'','Tangente 33（型号：122、123）','Tangente 33（型号：122、123）','/upload/img/20150717/113317-693.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625295&idx=2&sn=b195db282b44feb477c99bf583d743c4#rd','2015-07-17 03:33:31'),(84,0,'text','news','123',0,'','Tangente 33（型号：122、123）','Tangente 33（型号：122、123）','/upload/img/20150717/113317-693.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625295&idx=2&sn=b195db282b44feb477c99bf583d743c4#rd','2015-07-17 03:33:31'),(85,0,'text','news','Tangente',0,'','Tangente 33 Grau（型号：124、125）','Tangente 33 Grau（型号：124、125）','/upload/img/20150717/113533-506.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625295&idx=3&sn=8629983dad62f0c9cbd13a2b5ddb3e98#rd','2015-07-17 03:35:42'),(86,0,'text','news','124',0,'','Tangente 33 Grau（型号：124、125）','Tangente 33 Grau（型号：124、125）','/upload/img/20150717/113533-506.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625295&idx=3&sn=8629983dad62f0c9cbd13a2b5ddb3e98#rd','2015-07-17 03:35:42'),(87,0,'text','news','125',0,'','Tangente 33 Grau（型号：124、125）','Tangente 33 Grau（型号：124、125）','/upload/img/20150717/113533-506.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625295&idx=3&sn=8629983dad62f0c9cbd13a2b5ddb3e98#rd','2015-07-17 03:35:42'),(88,0,'text','news','Tangente',0,'','Tangente Datum（型号：130）','Tangente Datum（型号：130）','/upload/img/20150717/113627-883.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625295&idx=4&sn=867e5423f86a65c48f13ff1ece777b69#rd','2015-07-17 03:36:40'),(89,0,'text','news','130',0,'','Tangente Datum（型号：130）','Tangente Datum（型号：130）','/upload/img/20150717/113627-883.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625295&idx=4&sn=867e5423f86a65c48f13ff1ece777b69#rd','2015-07-17 03:36:40'),(90,0,'text','news','Tangente',0,'','Tangente Datum Gangreserve（型号：131）','Tangente Datum Gangreserve（型号：131）','/upload/img/20150717/113925-437.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625295&idx=5&sn=f91a5d1a9ec2180e3316acc738292d0f#rd','2015-07-17 03:39:36'),(91,0,'text','news','131',0,'','Tangente Datum Gangreserve（型号：131）','Tangente Datum Gangreserve（型号：131）','/upload/img/20150717/113925-437.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625295&idx=5&sn=f91a5d1a9ec2180e3316acc738292d0f#rd','2015-07-17 03:39:36'),(92,0,'text','news','Tangente',0,'','Tangente（型号：101、139）','Tangente（型号：101、139）','/upload/img/20150717/114111-307.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625295&idx=6&sn=aacb3c4b1f692d32478acdc4096b1f7d#rd','2015-07-17 03:41:24'),(93,0,'text','news','101',0,'','Tangente（型号：101、139）','Tangente（型号：101、139）','/upload/img/20150717/114111-307.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625295&idx=6&sn=aacb3c4b1f692d32478acdc4096b1f7d#rd','2015-07-17 03:41:24'),(94,0,'text','news','139',0,'','Tangente（型号：101、139）','Tangente（型号：101、139）','/upload/img/20150717/114111-307.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625295&idx=6&sn=aacb3c4b1f692d32478acdc4096b1f7d#rd','2015-07-17 03:41:24'),(95,0,'text','news','Tangente',0,'','Tangente 38（型号：164）','Tangente 38（型号：164）','/upload/img/20150717/114322-137.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625295&idx=7&sn=ce6cd8bb6d0616f3acc9ae78baa14522#rd','2015-07-17 03:43:34'),(96,0,'text','news','164',0,'','Tangente 38（型号：164）','Tangente 38（型号：164）','/upload/img/20150717/114322-137.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625295&idx=7&sn=ce6cd8bb6d0616f3acc9ae78baa14522#rd','2015-07-17 03:43:34'),(97,0,'text','news','Tangente',0,'','Tangente Gangreserve（型号：172）','Tangente Gangreserve（型号：172）','/upload/img/20150717/114658-308.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625295&idx=8&sn=db8047230724f7da3d2e33185d9da3c4#rd','2015-07-17 03:47:08'),(98,0,'text','news','172',0,'','Tangente Gangreserve（型号：172）','Tangente Gangreserve（型号：172）','/upload/img/20150717/114658-308.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201625295&idx=8&sn=db8047230724f7da3d2e33185d9da3c4#rd','2015-07-17 03:47:08'),(99,0,'text','news','Ludwig',0,'','LUDWIG系列的简约之韵与复古格调','LUDWIG系列的简约之韵与复古格调','/upload/img/20150717/115402-602.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201624475&idx=1&sn=914ef4796fdd7b7c27a6540d41ddd292#rd','2015-07-17 03:54:03'),(100,0,'text','news','Ludwig',0,'','Ludwig（型号：201、205）','Ludwig（型号：201、205）','/upload/img/20150717/115544-962.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201624475&idx=2&sn=1715cc2fbeb7b7f0879c0f9de0ff76ef#rd','2015-07-17 03:55:46'),(101,0,'text','news','201',0,'','Ludwig（型号：201、205）','Ludwig（型号：201、205）','/upload/img/20150717/115544-962.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201624475&idx=2&sn=1715cc2fbeb7b7f0879c0f9de0ff76ef#rd','2015-07-17 03:55:46'),(102,0,'text','news','205',0,'','Ludwig（型号：201、205）','Ludwig（型号：201、205）','/upload/img/20150717/115544-962.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201624475&idx=2&sn=1715cc2fbeb7b7f0879c0f9de0ff76ef#rd','2015-07-17 03:55:46'),(103,0,'text','news','Ludwig',0,'','Ludwig Datum（型号：231）','Ludwig Datum（型号：231）','/upload/img/20150717/115646-189.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201624475&idx=3&sn=6914a36780cda3539803caa7bb0fbe8d#rd','2015-07-17 03:56:55'),(104,0,'text','news','231',0,'','Ludwig Datum（型号：231）','Ludwig Datum（型号：231）','/upload/img/20150717/115646-189.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201624475&idx=3&sn=6914a36780cda3539803caa7bb0fbe8d#rd','2015-07-17 03:56:55'),(105,0,'text','news','Ludwig',0,'','Ludwig 38（型号：234）','Ludwig 38（型号：234）','/upload/img/20150717/115745-643.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201624475&idx=4&sn=3e46bca7f01ba9c4f35e5133aa099dc7#rd','2015-07-17 03:57:59'),(106,0,'text','news','234',0,'','Ludwig 38（型号：234）','Ludwig 38（型号：234）','/upload/img/20150717/115745-643.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201624475&idx=4&sn=3e46bca7f01ba9c4f35e5133aa099dc7#rd','2015-07-17 03:57:59'),(107,0,'text','news','Ludwig',0,'','Ludwig 33（型号：243、244）','Ludwig 33（型号：243、244）','/upload/img/20150717/115841-833.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201624475&idx=5&sn=93c99ae87e5de3691c9442d8e6df1dfa#rd','2015-07-17 03:58:50'),(108,0,'text','news','243',0,'','Ludwig 33（型号：243、244）','Ludwig 33（型号：243、244）','/upload/img/20150717/115841-833.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201624475&idx=5&sn=93c99ae87e5de3691c9442d8e6df1dfa#rd','2015-07-17 03:58:50'),(109,0,'text','news','244',0,'','Ludwig 33（型号：243、244）','Ludwig 33（型号：243、244）','/upload/img/20150717/115841-833.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201624475&idx=5&sn=93c99ae87e5de3691c9442d8e6df1dfa#rd','2015-07-17 03:58:50'),(110,0,'text','news','Ludwig',0,'','Ludwig Automatik （型号：251）','Ludwig Automatik （型号：251）','/upload/img/20150717/115932-986.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201624475&idx=6&sn=5f5457b0cc1618ae45c3ab3131aa1321#rd','2015-07-17 03:59:43'),(111,0,'text','news','251',0,'','Ludwig Automatik （型号：251）','Ludwig Automatik （型号：251）','/upload/img/20150717/115932-986.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201624475&idx=6&sn=5f5457b0cc1618ae45c3ab3131aa1321#rd','2015-07-17 03:59:43'),(112,0,'text','news','Ludwig',0,'','Ludwig Automatik Datum（型号：271）','Ludwig Automatik Datum（型号：271）','/upload/img/20150717/120616-894.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201624475&idx=7&sn=57f8775035b84536dce5dba9bba65ef9#rd','2015-07-17 04:06:28'),(113,0,'text','news','271',0,'','Ludwig Automatik Datum（型号：271）','Ludwig Automatik Datum（型号：271）','/upload/img/20150717/120616-894.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201624475&idx=7&sn=57f8775035b84536dce5dba9bba65ef9#rd','2015-07-17 04:06:28'),(114,0,'text','news','Lambda',0,'','GOLDEN COLLECTION，名副其实的高端时计！','GOLDEN COLLECTION，名副其实的高端时计！','/upload/img/20150717/121234-328.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201624330&idx=1&sn=f9607036c84073aa56d520ee3aa34f6e#rd','2015-07-17 04:12:43'),(115,0,'text','news','Lux',0,'','GOLDEN COLLECTION，名副其实的高端时计！','GOLDEN COLLECTION，名副其实的高端时计！','/upload/img/20150717/121234-328.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201624330&idx=1&sn=f9607036c84073aa56d520ee3aa34f6e#rd','2015-07-17 04:12:43'),(116,0,'text','news','Lambda',0,'','深蓝色Lambda（型号：935）','深蓝色Lambda（型号：935）','/upload/img/20150717/121346-687.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201624330&idx=2&sn=65603d58f9c9768f1296bd50e2e5d60a#rd','2015-07-17 04:13:56'),(117,0,'text','news','Lux',0,'','深蓝色Lambda（型号：935）','深蓝色Lambda（型号：935）','/upload/img/20150717/121346-687.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201624330&idx=2&sn=65603d58f9c9768f1296bd50e2e5d60a#rd','2015-07-17 04:13:56'),(118,0,'text','news','935',0,'','深蓝色Lambda（型号：935）','深蓝色Lambda（型号：935）','/upload/img/20150717/121346-687.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201624330&idx=2&sn=65603d58f9c9768f1296bd50e2e5d60a#rd','2015-07-17 04:13:56'),(119,0,'text','news','Lambda',0,'','Lux Ermine/Cicada/Sable（型号：940、941、942）','Lux Ermine/Cicada/Sable（型号：940、941、942）','/upload/img/20150717/121507-759.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201624330&idx=3&sn=166b42d5bf51276d0f0409f5c129e71d#rd','2015-07-17 04:15:16'),(120,0,'text','news','Lux',0,'','Lux Ermine/Cicada/Sable（型号：940、941、942）','Lux Ermine/Cicada/Sable（型号：940、941、942）','/upload/img/20150717/121507-759.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201624330&idx=3&sn=166b42d5bf51276d0f0409f5c129e71d#rd','2015-07-17 04:15:16'),(121,0,'text','news','940',0,'','Lux Ermine/Cicada/Sable（型号：940、941、942）','Lux Ermine/Cicada/Sable（型号：940、941、942）','/upload/img/20150717/121507-759.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201624330&idx=3&sn=166b42d5bf51276d0f0409f5c129e71d#rd','2015-07-17 04:15:16'),(122,0,'text','news','941',0,'','Lux Ermine/Cicada/Sable（型号：940、941、942）','Lux Ermine/Cicada/Sable（型号：940、941、942）','/upload/img/20150717/121507-759.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201624330&idx=3&sn=166b42d5bf51276d0f0409f5c129e71d#rd','2015-07-17 04:15:16'),(123,0,'text','news','942',0,'','Lux Ermine/Cicada/Sable（型号：940、941、942）','Lux Ermine/Cicada/Sable（型号：940、941、942）','/upload/img/20150717/121507-759.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201624330&idx=3&sn=166b42d5bf51276d0f0409f5c129e71d#rd','2015-07-17 04:15:16'),(124,0,'text','news','Lambda',0,'','Lambda Roségold（型号：930）','Lambda Roségold（型号：930）','/upload/img/20150717/121622-486.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201624330&idx=4&sn=37213872908049d3fd840ea541f523fd#rd','2015-07-17 04:16:32'),(125,0,'text','news','Lux',0,'','Lambda Roségold（型号：930）','Lambda Roségold（型号：930）','/upload/img/20150717/121622-486.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201624330&idx=4&sn=37213872908049d3fd840ea541f523fd#rd','2015-07-17 04:16:32'),(126,0,'text','news','930',0,'','Lambda Roségold（型号：930）','Lambda Roségold（型号：930）','/upload/img/20150717/121622-486.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201624330&idx=4&sn=37213872908049d3fd840ea541f523fd#rd','2015-07-17 04:16:32'),(127,0,'text','news','Lambda',0,'','Lambda Weißgold（型号：931）','Lambda Weißgold（型号：931）','/upload/img/20150717/121727-897.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201624330&idx=5&sn=664fc68cd544f925872fae940e611133#rd','2015-07-17 04:17:37'),(128,0,'text','news','Lux',0,'','Lambda Weißgold（型号：931）','Lambda Weißgold（型号：931）','/upload/img/20150717/121727-897.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201624330&idx=5&sn=664fc68cd544f925872fae940e611133#rd','2015-07-17 04:17:37'),(129,0,'text','news','931',0,'','Lambda Weißgold（型号：931）','Lambda Weißgold（型号：931）','/upload/img/20150717/121727-897.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201624330&idx=5&sn=664fc68cd544f925872fae940e611133#rd','2015-07-17 04:17:37'),(130,0,'text','news','Lambda',0,'','Lux Weißgold（型号：920）','Lux Weißgold（型号：920）','/upload/img/20150717/121901-152.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201624330&idx=6&sn=a6f12981a39e996e2c2cf2e62992378b#rd','2015-07-17 04:19:09'),(131,0,'text','news','Lux',0,'','Lux Weißgold（型号：920）','Lux Weißgold（型号：920）','/upload/img/20150717/121901-152.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201624330&idx=6&sn=a6f12981a39e996e2c2cf2e62992378b#rd','2015-07-17 04:19:09'),(132,0,'text','news','920',0,'','Lux Weißgold（型号：920）','Lux Weißgold（型号：920）','/upload/img/20150717/121901-152.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201624330&idx=6&sn=a6f12981a39e996e2c2cf2e62992378b#rd','2015-07-17 04:19:09'),(133,0,'text','news','Lambda',0,'','Lux Weißgold Hell（型号：921）','Lux Weißgold Hell（型号：921）','/upload/img/20150717/122007-302.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201624330&idx=7&sn=a4f8a37d90d0fa957584c62c203d0776#rd','2015-07-17 04:20:17'),(134,0,'text','news','Lux',0,'','Lux Weißgold Hell（型号：921）','Lux Weißgold Hell（型号：921）','/upload/img/20150717/122007-302.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201624330&idx=7&sn=a4f8a37d90d0fa957584c62c203d0776#rd','2015-07-17 04:20:17'),(135,0,'text','news','921',0,'','Lux Weißgold Hell（型号：921）','Lux Weißgold Hell（型号：921）','/upload/img/20150717/122007-302.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201624330&idx=7&sn=a4f8a37d90d0fa957584c62c203d0776#rd','2015-07-17 04:20:17'),(136,0,'text','news','Club',0,'','CLUB系列，活力充沛，与众不同','CLUB系列，活力充沛，与众不同','/upload/img/20150717/122113-192.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201621400&idx=1&sn=5ad983634aa94c76ab31c0dddd97a472#rd','2015-07-17 04:21:14'),(137,0,'text','news','Club',0,'','Club（型号：701、703）','Club（型号：701、703）','/upload/img/20150717/122136-313.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201621400&idx=2&sn=2241078214d111f2183b758bea71b93d#rd','2015-07-17 04:21:48'),(138,0,'text','news','701',0,'','Club（型号：701、703）','Club（型号：701、703）','/upload/img/20150717/122136-313.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201621400&idx=2&sn=2241078214d111f2183b758bea71b93d#rd','2015-07-17 04:21:48'),(139,0,'text','news','703',0,'','Club（型号：701、703）','Club（型号：701、703）','/upload/img/20150717/122136-313.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201621400&idx=2&sn=2241078214d111f2183b758bea71b93d#rd','2015-07-17 04:21:48'),(140,0,'text','news','Club',0,'','Club Datum（型号：731、733）','Club Datum（型号：731、733）','/upload/img/20150717/122250-130.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201621400&idx=3&sn=6fe85eec37b9c926f547bec109f71c59#rd','2015-07-17 04:23:03'),(141,0,'text','news','731',0,'','Club Datum（型号：731、733）','Club Datum（型号：731、733）','/upload/img/20150717/122250-130.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201621400&idx=3&sn=6fe85eec37b9c926f547bec109f71c59#rd','2015-07-17 04:23:03'),(142,0,'text','news','733',0,'','Club Datum（型号：731、733）','Club Datum（型号：731、733）','/upload/img/20150717/122250-130.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201621400&idx=3&sn=6fe85eec37b9c926f547bec109f71c59#rd','2015-07-17 04:23:03'),(143,0,'text','news','Club',0,'','Club Automat（型号：751、753）','Club Automat（型号：751、753）','/upload/img/20150717/122351-532.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201621400&idx=4&sn=c4b6fce6c55b95cd528d73974797b412#rd','2015-07-17 04:24:00'),(144,0,'text','news','751',0,'','Club Automat（型号：751、753）','Club Automat（型号：751、753）','/upload/img/20150717/122351-532.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201621400&idx=4&sn=c4b6fce6c55b95cd528d73974797b412#rd','2015-07-17 04:24:00'),(145,0,'text','news','753',0,'','Club Automat（型号：751、753）','Club Automat（型号：751、753）','/upload/img/20150717/122351-532.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201621400&idx=4&sn=c4b6fce6c55b95cd528d73974797b412#rd','2015-07-17 04:24:00'),(146,0,'text','news','Club',0,'','Club Automat Dunkel（型号：772、774）','Club Automat Dunkel（型号：772、774）','/upload/img/20150717/122436-561.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201621400&idx=5&sn=85ba7982c7df6390579fdc6efffd373a#rd','2015-07-17 04:24:48'),(147,0,'text','news','772',0,'','Club Automat Dunkel（型号：772、774）','Club Automat Dunkel（型号：772、774）','/upload/img/20150717/122436-561.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201621400&idx=5&sn=85ba7982c7df6390579fdc6efffd373a#rd','2015-07-17 04:24:48'),(148,0,'text','news','774',0,'','Club Automat Dunkel（型号：772、774）','Club Automat Dunkel（型号：772、774）','/upload/img/20150717/122436-561.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201621400&idx=5&sn=85ba7982c7df6390579fdc6efffd373a#rd','2015-07-17 04:24:48'),(149,0,'text','news','Ahoi',0,'','Ahoi系列，运动达人的手工打造腕表','Ahoi系列，运动达人的手工打造腕表','/upload/img/20150717/122551-376.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201621260&idx=1&sn=2267354b066a6b0dabf51d47573b5a50#rd','2015-07-17 04:25:52'),(150,0,'text','news','Ahoi',0,'','Ahoi Atlantik（型号：552）','Ahoi Atlantik（型号：552）','/upload/img/20150717/122640-901.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201621260&idx=2&sn=8976721d9198781977086da1fc46a22a#rd','2015-07-17 04:26:50'),(151,0,'text','news','552',0,'','Ahoi Atlantik（型号：552）','Ahoi Atlantik（型号：552）','/upload/img/20150717/122640-901.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201621260&idx=2&sn=8976721d9198781977086da1fc46a22a#rd','2015-07-17 04:26:50'),(152,0,'text','news','Ahoi',0,'','Ahoi Atlantik Datum（型号：553）','Ahoi Atlantik Datum（型号：553）','/upload/img/20150717/122732-381.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201621260&idx=3&sn=d34ac609150c2bfc57a33ce79bdbc484#rd','2015-07-17 04:27:51'),(153,0,'text','news','553',0,'','Ahoi Atlantik Datum（型号：553）','Ahoi Atlantik Datum（型号：553）','/upload/img/20150717/122732-381.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201621260&idx=3&sn=d34ac609150c2bfc57a33ce79bdbc484#rd','2015-07-17 04:27:51'),(154,0,'text','news','Ahoi',0,'','Ahoi（型号：550）','Ahoi（型号：550）','/upload/img/20150717/122826-280.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201621260&idx=4&sn=18d51af18d88f2466e38f086662049c7#rd','2015-07-17 04:28:38'),(155,0,'text','news','550',0,'','Ahoi（型号：550）','Ahoi（型号：550）','/upload/img/20150717/122826-280.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201621260&idx=4&sn=18d51af18d88f2466e38f086662049c7#rd','2015-07-17 04:28:38'),(156,0,'text','news','Ahoi',0,'','Ahoi Datum（型号：551）','Ahoi Datum（型号：551）','/upload/img/20150717/122909-229.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201621260&idx=5&sn=3a4690eb5b67b671c61cd4fb7893a1a6#rd','2015-07-17 04:29:19'),(157,0,'text','news','551',0,'','Ahoi Datum（型号：551）','Ahoi Datum（型号：551）','/upload/img/20150717/122909-229.jpg','http://mp.weixin.qq.com/s?__biz=MjM5MjQxNTA1Nw==&mid=201621260&idx=5&sn=3a4690eb5b67b671c61cd4fb7893a1a6#rd','2015-07-17 04:29:19');
/*!40000 ALTER TABLE `same_wmenu_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scenelog`
--

DROP TABLE IF EXISTS `scenelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scenelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timeint` int(11) NOT NULL,
  `openid` varchar(255) NOT NULL,
  `type` varchar(100) NOT NULL COMMENT '1为关注，2为扫描',
  `ticket` varchar(255) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='扫描二维码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scenelog`
--

LOCK TABLES `scenelog` WRITE;
/*!40000 ALTER TABLE `scenelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `scenelog` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-22  6:18:02
