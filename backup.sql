-- MySQL dump 10.13  Distrib 5.7.17, for osx10.12 (x86_64)
--
-- Host: localhost    Database: jczj
-- ------------------------------------------------------
-- Server version	5.7.17

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
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_type` varchar(255) NOT NULL,
  `action_option` varchar(255) DEFAULT NULL,
  `target_type` varchar(255) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_actions_on_user_type_and_user_id_and_action_type` (`user_type`,`user_id`,`action_type`),
  KEY `index_actions_on_target_type_and_target_id_and_action_type` (`target_type`,`target_id`,`action_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
INSERT INTO `actions` VALUES (2,'praise',NULL,'Topic',24,'User',1,'2017-12-04 21:36:48','2017-12-04 21:36:48'),(3,'follow',NULL,'User',1,'User',2,'2017-12-06 00:06:18','2017-12-06 00:06:18'),(4,'praise',NULL,'Topic',25,'User',2,'2017-12-06 00:06:35','2017-12-06 00:06:35');
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2017-12-01 14:57:03','2017-12-01 14:57:03');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `reply_id` int(11) NOT NULL,
  `target_nickname` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'I\'m a member!',2,22,NULL,'2017-12-06 00:06:47','2017-12-06 00:06:47');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedbacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body` varchar(255) NOT NULL,
  `contact_info` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kindeditor_assets`
--

DROP TABLE IF EXISTS `kindeditor_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kindeditor_assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset` varchar(255) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `owner_type` varchar(255) DEFAULT NULL,
  `asset_type` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kindeditor_assets`
--

LOCK TABLES `kindeditor_assets` WRITE;
/*!40000 ALTER TABLE `kindeditor_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `kindeditor_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nodes`
--

DROP TABLE IF EXISTS `nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `topics_count` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nodes`
--

LOCK TABLES `nodes` WRITE;
/*!40000 ALTER TABLE `nodes` DISABLE KEYS */;
INSERT INTO `nodes` VALUES (1,'test',16,'2017-12-01 17:30:07','2017-12-01 17:30:07'),(2,'study',7,'2017-12-03 20:39:41','2017-12-03 20:39:41');
/*!40000 ALTER TABLE `nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `actor_id` int(11) DEFAULT NULL,
  `notify_type` varchar(255) NOT NULL,
  `target_type` varchar(255) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `second_target_type` varchar(255) DEFAULT NULL,
  `second_target_id` int(11) DEFAULT NULL,
  `third_target_type` varchar(255) DEFAULT NULL,
  `third_target_id` int(11) DEFAULT NULL,
  `read_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_notifications_on_user_id_and_notify_type` (`user_id`,`notify_type`),
  KEY `index_notifications_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,1,1,'reply','Reply',1,NULL,NULL,NULL,NULL,'2017-12-03 20:07:37','2017-12-03 20:03:31','2017-12-03 20:03:31'),(2,1,1,'reply','Reply',2,NULL,NULL,NULL,NULL,'2017-12-03 20:07:37','2017-12-03 20:06:11','2017-12-03 20:06:11'),(3,1,1,'reply','Reply',3,NULL,NULL,NULL,NULL,'2017-12-03 20:11:21','2017-12-03 20:10:39','2017-12-03 20:10:39'),(4,1,1,'reply','Reply',4,NULL,NULL,NULL,NULL,'2017-12-03 20:12:57','2017-12-03 20:12:37','2017-12-03 20:12:37'),(5,1,1,'reply','Reply',5,NULL,NULL,NULL,NULL,'2017-12-03 20:26:55','2017-12-03 20:25:22','2017-12-03 20:25:22'),(6,1,1,'reply','Reply',6,NULL,NULL,NULL,NULL,'2017-12-03 20:36:50','2017-12-03 20:36:03','2017-12-03 20:36:03'),(7,1,1,'reply','Reply',7,NULL,NULL,NULL,NULL,'2017-12-03 20:41:41','2017-12-03 20:39:57','2017-12-03 20:39:57'),(8,1,1,'reply','Reply',8,NULL,NULL,NULL,NULL,'2017-12-03 22:42:58','2017-12-03 20:44:51','2017-12-03 20:44:51'),(9,1,1,'reply','Reply',9,NULL,NULL,NULL,NULL,'2017-12-03 23:47:01','2017-12-03 23:43:04','2017-12-03 23:43:04'),(10,1,1,'reply','Reply',10,NULL,NULL,NULL,NULL,'2017-12-03 23:50:24','2017-12-03 23:50:01','2017-12-03 23:50:01'),(11,1,1,'reply','Reply',11,NULL,NULL,NULL,NULL,'2017-12-04 21:21:47','2017-12-04 21:21:28','2017-12-04 21:21:28'),(12,1,1,'reply','Reply',12,NULL,NULL,NULL,NULL,'2017-12-04 21:30:50','2017-12-04 21:24:58','2017-12-04 21:24:58'),(13,1,1,'reply','Reply',13,NULL,NULL,NULL,NULL,'2017-12-04 21:30:50','2017-12-04 21:25:40','2017-12-04 21:25:40'),(14,1,2,'reply','Reply',20,NULL,NULL,NULL,NULL,'2017-12-06 00:13:31','2017-12-06 00:05:39','2017-12-06 00:05:39'),(15,1,2,'reply','Reply',21,NULL,NULL,NULL,NULL,'2017-12-06 00:13:31','2017-12-06 00:05:49','2017-12-06 00:05:49'),(16,1,2,'follow',NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-06 00:13:31','2017-12-06 00:06:18','2017-12-06 00:06:18'),(17,1,2,'reply','Reply',22,NULL,NULL,NULL,NULL,'2017-12-06 00:13:31','2017-12-06 00:06:39','2017-12-06 00:06:39'),(18,2,1,'follow',NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-06 00:14:34','2017-12-06 00:13:51','2017-12-06 00:13:51');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replies`
--

DROP TABLE IF EXISTS `replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `replies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `reply_to_id` int(11) DEFAULT NULL,
  `target_id` varchar(255) DEFAULT NULL,
  `target_type` varchar(255) DEFAULT NULL,
  `mentioned_users_id` int(11) DEFAULT NULL,
  `body` text NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `praises_count` int(11) DEFAULT '0',
  `comments_count` int(11) DEFAULT '0',
  `action` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replies`
--

LOCK TABLES `replies` WRITE;
/*!40000 ALTER TABLE `replies` DISABLE KEYS */;
INSERT INTO `replies` VALUES (11,1,24,NULL,NULL,NULL,NULL,NULL,'',NULL,0,0,'excellent','2017-12-04 21:21:28','2017-12-04 21:21:28'),(12,1,24,NULL,NULL,NULL,NULL,NULL,'aasd',NULL,0,0,NULL,'2017-12-04 21:24:58','2017-12-04 21:24:58'),(13,1,24,NULL,NULL,NULL,NULL,NULL,'',NULL,0,0,'cancel_excellent','2017-12-04 21:25:40','2017-12-04 21:25:40'),(14,1,24,NULL,NULL,NULL,NULL,NULL,'',NULL,0,0,'excellent','2017-12-04 21:31:01','2017-12-04 21:31:01'),(15,1,24,NULL,NULL,NULL,NULL,NULL,'asdf',NULL,0,0,NULL,'2017-12-04 21:31:22','2017-12-04 21:31:22'),(16,1,24,NULL,NULL,NULL,NULL,NULL,'',NULL,0,0,'cancel_excellent','2017-12-05 23:12:29','2017-12-05 23:12:29'),(17,1,24,NULL,NULL,NULL,NULL,NULL,'',NULL,0,0,'top','2017-12-05 23:12:33','2017-12-05 23:12:33'),(18,1,27,NULL,NULL,NULL,NULL,NULL,'',NULL,0,0,'excellent','2017-12-05 23:41:21','2017-12-05 23:41:21'),(19,1,25,NULL,NULL,NULL,NULL,NULL,'',NULL,0,0,'top','2017-12-05 23:41:27','2017-12-05 23:41:27'),(20,2,27,NULL,NULL,NULL,NULL,NULL,'dsf',NULL,0,0,NULL,'2017-12-06 00:05:39','2017-12-06 00:05:39'),(21,2,27,NULL,NULL,NULL,NULL,NULL,'as',NULL,0,0,NULL,'2017-12-06 00:05:49','2017-12-06 00:05:49'),(22,2,25,NULL,NULL,NULL,NULL,NULL,'test1',NULL,0,1,NULL,'2017-12-06 00:06:39','2017-12-06 00:06:39'),(23,2,28,NULL,NULL,NULL,NULL,NULL,'This is my replysdf',NULL,0,0,NULL,'2017-12-06 00:07:13','2017-12-06 00:08:45'),(24,2,28,NULL,NULL,NULL,NULL,NULL,'aa','2017-12-06 00:08:53',0,0,NULL,'2017-12-06 00:08:50','2017-12-06 00:08:53');
/*!40000 ALTER TABLE `replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `lost_or_found` varchar(255) NOT NULL,
  `res_type` varchar(255) NOT NULL,
  `date` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `closed_at` datetime DEFAULT NULL,
  `last_reply_at` datetime DEFAULT NULL,
  `replies_count` int(11) DEFAULT '0',
  `last_reply_username` varchar(255) DEFAULT NULL,
  `last_reply_nickname` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources`
--

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
INSERT INTO `resources` VALUES (1,1,26,'lost','物品','2017-12-05 00:00:00','asdf','sdf',NULL,NULL,0,NULL,NULL,'2017-12-05 23:37:24','2017-12-05 23:37:24'),(3,2,30,'found','物品','2017-12-06 00:00:00','wo shi le','sdf',NULL,NULL,0,NULL,NULL,'2017-12-06 00:09:24','2017-12-06 00:09:24'),(4,2,32,'found','物品','2018-01-07 00:00:00','asdfdf','<p>\r\n	这还少的福利卡金士顿发\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	网闪电发货速冻啊与我联系\r\n</p>\r\n<p>\r\n	<br />\r\n</p>',NULL,NULL,0,NULL,NULL,'2018-01-07 19:43:47','2018-01-07 19:43:47');
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20160906114544'),('20170428073712'),('20170804135247'),('20170808120007'),('20170809124413'),('20170809143522'),('20170819054605'),('20170823024049'),('20170830022011'),('20171031081459'),('20171107042320'),('20171120075623'),('20171130125705');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `node_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `last_reply_user_id` int(11) DEFAULT NULL,
  `last_reply_user_nickname` varchar(255) DEFAULT NULL,
  `last_reply_user_username` varchar(255) DEFAULT NULL,
  `last_reply_at` datetime DEFAULT NULL,
  `praises_count` int(11) DEFAULT '0',
  `replies_count` int(11) NOT NULL DEFAULT '0',
  `status` int(11) DEFAULT NULL,
  `is_excellent` tinyint(1) DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` varchar(255) DEFAULT NULL,
  `closed_at` datetime DEFAULT NULL,
  `topped_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_topics_on_deleted_at` (`deleted_at`),
  KEY `index_topics_on_praises_count` (`praises_count`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics`
--

LOCK TABLES `topics` WRITE;
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
INSERT INTO `topics` VALUES (24,1,2,'asdf','adsf',1,'ren','ren','2017-12-04 21:31:22',1,2,NULL,0,'2017-12-05 23:12:43','ren',NULL,'2017-12-05 23:12:33','2017-12-04 19:54:34','2017-12-05 23:12:43'),(25,1,2,'adf','asdf',2,'member','member','2017-12-06 00:06:39',1,1,NULL,0,NULL,NULL,NULL,'2017-12-05 23:41:27','2017-12-05 23:13:02','2017-12-06 00:06:39'),(26,1,1,'asdf','body',NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,'2017-12-05 23:37:24','2017-12-05 23:37:24'),(27,1,2,'jinghua','sdf',2,'member','member','2017-12-06 00:05:49',0,2,NULL,1,NULL,NULL,NULL,NULL,'2017-12-05 23:41:18','2017-12-06 00:05:49'),(28,2,2,'adf','hahaha This is my topic<br />',2,'member','member','2017-12-06 00:08:50',0,2,NULL,0,NULL,NULL,NULL,NULL,'2017-12-06 00:06:56','2017-12-06 00:08:50'),(30,2,1,'wo shi le','body',NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,'2017-12-06 00:09:24','2017-12-06 00:09:24'),(31,2,2,'I can destroy','asdfdf',NULL,NULL,NULL,NULL,0,0,NULL,0,'2017-12-06 00:10:04','member',NULL,NULL,'2017-12-06 00:10:02','2017-12-06 00:10:04'),(32,2,1,'asdfdf','body',NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,'2018-01-07 19:43:45','2018-01-07 19:43:45');
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `wechat` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `school` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `major` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT 'member',
  `level` int(11) DEFAULT '1',
  `topics_count` int(11) NOT NULL DEFAULT '0',
  `replies_count` int(11) NOT NULL DEFAULT '0',
  `comments_count` int(11) DEFAULT '0',
  `followers_count` int(11) NOT NULL DEFAULT '0',
  `following_count` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `email` varchar(255) DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `avatar_file_name` varchar(255) DEFAULT NULL,
  `avatar_content_type` varchar(255) DEFAULT NULL,
  `avatar_file_size` int(11) DEFAULT NULL,
  `avatar_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_username` (`username`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ren','ren',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'root',1,19,4,1,1,0,'2017-12-01 17:27:24','2018-03-08 21:00:10','rennyallen@hotmail.com','$2a$11$zN0ZJjpc3GOIAMLyIqFtm.3cS1DjozLM4ovKPXBTTpWqbl1/GfTWy',NULL,NULL,NULL,7,'2018-03-08 21:00:10','2017-12-06 00:13:29','127.0.0.1','::1',NULL,NULL,NULL,NULL),(2,'member','member',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'member',1,5,5,1,0,1,'2017-12-01 17:31:43','2017-12-06 00:14:32','267286753@qq.com','$2a$11$75hFItEC0wpnu.AWWLNfP.e2T7XOHED9npNCJlLI2HwBaZtqolN/u',NULL,NULL,NULL,4,'2017-12-06 00:14:32','2017-12-06 00:05:30','::1','::1',NULL,NULL,NULL,NULL),(3,'allen','allen',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'member',1,0,0,0,0,0,'2018-04-13 15:52:30','2018-04-13 15:52:31','test@qq.com','$2a$11$ikX5L311XTIEptqKRkMecuyOLXnKcVOkHOKrT87DU.2tHSkYViLCu',NULL,NULL,NULL,1,'2018-04-13 15:52:31','2018-04-13 15:52:31','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-13 16:15:15
