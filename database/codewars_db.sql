CREATE DATABASE  IF NOT EXISTS `codewars_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `codewars_db`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: codewars_db
-- ------------------------------------------------------
-- Server version	5.7.11-log

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `comment` varchar(1024) NOT NULL,
  `add_date` datetime NOT NULL,
  PRIMARY KEY (`comment_id`,`user_id`,`task_id`),
  UNIQUE KEY `comment_id_UNIQUE` (`comment_id`),
  KEY `fk_users_has_tasks_tasks2_idx` (`task_id`),
  KEY `fk_users_has_tasks_users1_idx` (`user_id`),
  CONSTRAINT `fk_users_has_tasks_tasks2` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_users_has_tasks_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=266 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (85,41,57,'gfs','2016-03-18 15:00:50'),(86,41,57,'fag','2016-03-18 15:01:05'),(87,41,57,'hadg','2016-03-18 15:01:19'),(88,41,57,'hadgghda','2016-03-18 15:01:22'),(89,41,57,'hadgghda1','2016-03-18 15:01:24'),(90,41,57,'agf','2016-03-18 15:01:36'),(91,41,57,'agf','2016-03-18 15:01:39'),(92,41,57,'agf','2016-03-18 15:01:42'),(93,41,57,'f','2016-03-18 15:02:45'),(94,41,57,'fghad','2016-03-18 15:02:47'),(95,41,57,'fghad','2016-03-18 15:02:48'),(96,41,57,'fghad','2016-03-18 15:02:48'),(97,41,57,'123','2016-03-18 15:02:53'),(98,41,57,'jfg','2016-03-18 15:07:16'),(99,41,57,'jfghg','2016-03-18 15:07:20'),(100,41,57,'123','2016-03-18 15:07:26'),(101,41,57,'gfsg','2016-03-18 15:11:28'),(102,38,57,'123','2016-03-18 15:11:42'),(103,38,57,'gf','2016-03-18 15:11:44'),(104,41,57,'cc','2016-03-18 15:11:46'),(105,41,57,'dfa','2016-03-18 15:14:14'),(106,41,3,'123','2016-03-18 15:32:58'),(107,41,3,'1235','2016-03-18 15:33:01'),(186,41,55,'d','2016-03-18 16:25:50'),(203,38,3,'fdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafdafda','2016-03-21 13:07:32'),(243,38,11,'k','2016-03-25 10:21:15'),(250,38,108,'agsf','2016-03-29 16:13:17'),(251,38,108,'agfgsg','2016-03-29 16:13:28'),(252,38,108,'hadg','2016-03-29 16:19:44'),(253,38,108,'h','2016-03-29 16:19:45');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites_tasks`
--

DROP TABLE IF EXISTS `favorites_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorites_tasks` (
  `favorite_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`task_id`),
  UNIQUE KEY `favorite_id_UNIQUE` (`favorite_id`),
  KEY `fk_users_has_tasks_tasks1_idx` (`task_id`),
  KEY `fk_users_has_tasks_users_idx` (`user_id`),
  CONSTRAINT `fk_users_has_tasks_tasks1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_users_has_tasks_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites_tasks`
--

LOCK TABLES `favorites_tasks` WRITE;
/*!40000 ALTER TABLE `favorites_tasks` DISABLE KEYS */;
INSERT INTO `favorites_tasks` VALUES (2,38,47),(5,38,4),(12,38,11),(13,38,12),(14,38,13),(15,38,14),(16,38,15),(17,38,16),(19,38,18),(20,38,19),(21,38,20),(22,38,21),(23,38,44),(24,38,33),(25,38,51),(26,38,50),(47,41,57),(58,41,3),(88,38,3),(89,38,115);
/*!40000 ALTER TABLE `favorites_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`language_id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'js');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `later_tasks`
--

DROP TABLE IF EXISTS `later_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `later_tasks` (
  `later_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`task_id`),
  UNIQUE KEY `later_id_UNIQUE` (`later_id`),
  KEY `fk_users_has_tasks_tasks5_idx` (`task_id`),
  KEY `fk_users_has_tasks_users4_idx` (`user_id`),
  CONSTRAINT `fk_users_has_tasks_tasks5` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_users_has_tasks_users4` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `later_tasks`
--

LOCK TABLES `later_tasks` WRITE;
/*!40000 ALTER TABLE `later_tasks` DISABLE KEYS */;
INSERT INTO `later_tasks` VALUES (19,38,4),(46,41,55),(92,38,108),(93,38,115);
/*!40000 ALTER TABLE `later_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `like_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`task_id`),
  UNIQUE KEY `like_id_UNIQUE` (`like_id`),
  KEY `fk_users_has_tasks_tasks3_idx` (`task_id`),
  KEY `fk_users_has_tasks_users2_idx` (`user_id`),
  CONSTRAINT `fk_users_has_tasks_tasks3` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_users_has_tasks_users2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (165,41,3),(204,38,57),(209,38,3),(224,38,108);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `session_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` text COLLATE utf8_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('48vpUAGEn64GoO5Z7Fqv9h68fNXiJwjC',1459432086,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('5GTwqp0DRQPn9hZoQOClnr9kBH62t9BN',1459411462,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('7CApGHAUFbP6-6iX8HaxK4MhWvzO_TsB',1459431436,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('BbbI9Z_hYYvGxSI86ObJcoAYrl6tBs03',1459432107,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('Dxpqx-lLBy9lnv4gH82AyYn16I72ufnk',1459431505,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('Fdvq0p8YeiNSRyw2Iq0xLnsWpi83gR1X',1459431467,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('IhYXYesPQlvszIXBmTs57E5yHYoImzWr',1459432065,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('M72MGXqmklgm08a1-ZuX3LybUifD6rGo',1459432155,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('ciA5rg54pcyYD0GNn2PDFxtCn9HEXpow',1459434240,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('phwBGzn00VnVIYw3xaNUzgqDlrNjEjnw',1459432182,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('rTsfNP9H_o3lgnTvwFjB5dWXqnwYtYI2',1459432135,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solutions`
--

DROP TABLE IF EXISTS `solutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solutions` (
  `solution_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `solution_text` text NOT NULL,
  `add_date` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`task_id`),
  UNIQUE KEY `solution_id_UNIQUE` (`solution_id`),
  KEY `fk_users_has_tasks_tasks4_idx` (`task_id`),
  KEY `fk_users_has_tasks_users3_idx` (`user_id`),
  CONSTRAINT `fk_users_has_tasks_tasks4` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_users_has_tasks_users3` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solutions`
--

LOCK TABLES `solutions` WRITE;
/*!40000 ALTER TABLE `solutions` DISABLE KEYS */;
INSERT INTO `solutions` VALUES (1,38,3,'function func ()  { \r 	 console.log(123); \r }','2015-10-15 20:00:00'),(2,39,3,'function func () {\n	console.log(123);\n	console.log(123);\n	console.log(123);\n	console.log(123);\n	console.log(123);\n	console.log(123);\n	console.log(123);\n	console.log(123);\n	console.log(123);\n	console.log(123);\n	console.log(123);\n	console.log(123);\n	console.log(123);\n	console.log(123);\n}','2015-10-21 20:00:00'),(3,40,3,'function func () {\n	console.log(123);\n	console.log(123);\n	console.log(123);\n	console.log(123);\n	console.log(123);\n	console.log(123);\n	console.log(123);\n	console.log(123);\n	console.log(123);\n	console.log(123);\n	console.log(123);\n	console.log(123);\n	console.log(123);\n	console.log(123);\n}','2015-10-21 21:00:00');
/*!40000 ALTER TABLE `solutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `description` text NOT NULL,
  `language_id` int(11) NOT NULL,
  `add_date` datetime NOT NULL,
  `entry_point` varchar(512) NOT NULL,
  PRIMARY KEY (`task_id`,`user_id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_tasks_users1_idx` (`user_id`),
  KEY `fk_languages_name1_idx` (`language_id`),
  CONSTRAINT `fk_languages_name1` FOREIGN KEY (`language_id`) REFERENCES `languages` (`language_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tasks_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (3,38,'anton',NULL,'afgshjhjdgshsf',1,'2015-10-15 19:00:00','data'),(4,38,'rh',4,'afgshjhjdgshsf',1,'2015-10-15 18:00:00','data'),(11,38,'erirtu',3,'afgshjhjdgshsf',1,'2015-10-15 20:00:00','data'),(12,38,'lylp;pi',4,'afgshjhjdgshsf',1,'2015-10-15 20:00:00','data'),(13,38,'lkj',5,'afgshjhjdgshsf',1,'2015-10-15 20:00:00','data'),(14,38,'theyfjgku',6,'afgshjhjdgshsf',1,'2015-10-15 20:00:00','data'),(15,38,'hlio;',7,'afgshjhjdgshsf',1,'2015-10-15 20:00:00','data'),(16,38,'rw',8,'afgshjhjdgshsf',1,'2015-10-15 20:00:00','data'),(18,38,'g',2,'afgshjhjdgshsf',1,'2015-10-15 20:00:00','data'),(19,38,'tdkyf,l',3,'afgshjhjdgshsf',1,'2015-10-15 20:00:00','data'),(20,38,'g.',4,'afgshjhjdgshsf',1,'2015-10-15 20:00:00','data'),(21,38,'kedxk',5,'afgshjhjdgshsf',1,'2015-10-15 20:00:00','data'),(22,38,'yrft,l',6,'afgshjhjdgshsf',1,'2015-10-15 20:00:00','data'),(23,38,'kyrsxfklctgu',3,'afgshjhjdgshsf',1,'2015-10-15 20:00:00','data'),(24,38,'i',4,'afgshjhjdgshsf',1,'2015-10-15 20:00:00','data'),(25,38,'kydtk',1,'afgshjhjdgshsf',1,'2015-10-15 20:00:00','data'),(26,38,'cg;.ki',2,'afgshjhjdgshsf',1,'2015-10-15 20:00:00','data'),(27,38,'lkdyx',3,'afgshjhjdgshsf',1,'2015-10-15 20:00:00','data'),(28,38,'kyu',4,'afgshjhjdgshsf',1,'2015-10-15 20:00:00','data'),(29,39,'FdafFdafFdafFdaf',5,'<p>gfsghaaha</p>',1,'2016-03-30 15:38:18','lol'),(30,39,'jky',6,'gfsghaaha',1,'2015-10-15 20:00:00','lol'),(31,39,'ur',7,'gfsghaaha',1,'2015-10-15 20:00:00','lol'),(32,39,'k,l',1,'gfsghaaha',1,'2015-10-15 20:00:00','lol'),(33,39,'dtukj',2,'gfsghaaha',1,'2015-10-15 20:00:00','lol'),(34,39,'yutji',3,'gfsghaaha',1,'2015-10-15 20:00:00','lol'),(35,39,',lk',4,'gfsghaaha',1,'2015-10-15 20:00:00','lol'),(36,39,'ty',5,'gfsghaaha',1,'2015-10-15 20:00:00','lol'),(38,38,'uthhh',3,'<p>gfsghaaha</p>',1,'2016-03-30 15:30:37','lol'),(39,38,'ryurrrrrrrrrrrrrr',2,'<p>gfsghaaha</p>',1,'2016-03-30 15:30:14','lol'),(41,39,'ry',4,'gfsghaaha',1,'2015-10-15 20:00:00','lol'),(42,39,'dtuk',5,'gfsghaaha',1,'2015-10-15 20:00:00','lol'),(43,39,'reqtgshgdjj',5,'gfsghaaha',1,'2015-10-15 20:00:00','lol'),(44,39,',tu',3,'gfsghaaha',1,'2015-10-15 20:00:00','lol'),(45,39,'k',2,'gfsghaaha',1,'2015-10-15 20:00:00','lol'),(46,39,'rulu',1,'gfsghaaha',1,'2015-10-15 20:00:00','lol'),(47,39,'tikry',4,'gfsghaaha',1,'2015-10-15 20:00:00','lol'),(48,39,'hdghdghd',5,'gfsghaaha',1,'2015-10-15 20:00:00','lol'),(49,39,'kjsrk',6,'gfsghaaha',1,'2015-10-15 20:00:00','lol'),(50,39,',lt',4,'gfsghaaha',1,'2015-10-15 20:00:00','lol'),(51,39,'ukj',3,'gfsghaaha',1,'2015-10-15 20:00:00','lol'),(52,39,'zsr,ut',2,'gfsghaaha',1,'2015-10-15 20:00:00','lol'),(53,39,'rkjym',6,'gfsghaaha',1,'2015-10-15 20:00:00','lol'),(54,39,'hfmkj',7,'gfsghaaha',1,'2015-10-15 20:00:00','lol'),(55,39,'ydrg',3,'gfsghaaha',1,'2015-10-15 20:00:00','lol'),(56,39,'jezk',5,'gfsghaaha',1,'2015-10-15 20:00:00','lol'),(57,38,'dimka',NULL,'afdf',1,'2015-10-15 20:00:00','fadfda'),(80,38,'fsga',NULL,'<p>fsdfasd</p>',1,'2016-03-29 14:28:27','agfsgas'),(82,38,'fsgagsafg',NULL,'<p>fsdfasd</p>',1,'2016-03-29 14:29:23','agfsgasags'),(84,38,'gfs',NULL,'<p>пфаы</p>',1,'2016-03-29 14:36:20','авфыафвафв'),(86,38,'gfsfgs',NULL,'<p>пфаы</p>',1,'2016-03-29 14:37:50','авфыафвафв'),(87,38,'gfsfgsahg',NULL,'<p>пфаы</p>',1,'2016-03-29 14:38:08','авфыафвафв'),(88,38,'gfsfgsahghgda',NULL,'<p>пфаы</p>',1,'2016-03-29 14:38:25','авфыафвафв'),(89,38,'gfsfgsahghgdag',NULL,'<p>пфаы</p>',1,'2016-03-29 14:39:00','авфыафвафв'),(91,38,'gfsfgsahghgdaggfsa',NULL,'<p>пфаы</p>',1,'2016-03-29 14:43:07','авфыафвафв'),(92,38,'gfsfgsahghgdaggfsa11',NULL,'<p>пфаы</p>',1,'2016-03-29 14:45:23','авфыафвафв'),(93,38,'gfsfgsahghgdaggfsa11g',NULL,'<p>пфаы</p>',1,'2016-03-29 14:45:58','авфыафвафв'),(94,38,'gfsfgsahghgdaggfsa11ggfs',NULL,'<p>пфаы</p>',1,'2016-03-29 14:46:36','авфыафвафв'),(95,38,'dfsa',NULL,'<p>gfas</p>',1,'2016-03-29 14:56:36','gfsg'),(96,38,'dfsagfs',NULL,'<p>gfas</p>',1,'2016-03-29 14:56:52','gfsg'),(99,38,'dfsagfsgfsa',NULL,'<p>gfas</p>',1,'2016-03-29 14:58:50','gfsg'),(100,38,'Arturko',NULL,'<p>gfas</p>',1,'2016-03-29 14:59:11','gfs'),(101,38,'gasf',NULL,'<h1><i>HELLO</i></h1>',1,'2016-03-29 14:59:50','gfas'),(102,38,'fad',NULL,'<h1 style=\"text-align: right;\"><b>ARTUR</b></h1>',1,'2016-03-29 15:01:50','fda'),(108,38,'Arturko111gf',NULL,'<ol>\n<li>hdghdgh</li>\n</ol>',1,'2016-03-30 12:11:39','ARTURAAAAA1'),(110,38,'gfsgff',NULL,'<p><strong>ahfsahsf</strong></p>',1,'2016-03-30 12:29:15','dgfhf'),(111,38,'gafshjdgjdj',NULL,'<p>hadghdgh</p>',1,'2016-03-30 12:50:44','hadhdgah'),(112,38,'ghjk',NULL,'',1,'2016-03-30 12:51:06','ha'),(113,38,'1qtgr',NULL,'',1,'2016-03-30 12:52:01','hagh'),(114,38,'пфраопл',NULL,'<p>рвпфрвпфрchmgj</p>',1,'2016-03-30 13:19:32','пыапвр'),(115,38,'ARTUR',NULL,'<p>fsgfsgs<img src=\"bower_components/tinymce-dist/plugins/emoticons/img/smiley-cool.gif\" alt=\"cool\" /></p>\n<table style=\"width: 432px; height: 58px;\">\n<tbody>\n<tr>\n<td style=\"width: 100px;\">1</td>\n<td style=\"width: 193px;\">&nbsp;</td>\n<td style=\"width: 123px;\">2</td>\n</tr>\n<tr>\n<td style=\"width: 100px;\">1</td>\n<td style=\"width: 193px;\">2</td>\n<td style=\"width: 123px;\">2</td>\n</tr>\n<tr>\n<td style=\"width: 100px;\">1</td>\n<td style=\"width: 193px;\">2</td>\n<td style=\"width: 123px;\">11111111111111111111111111111</td>\n</tr>\n</tbody>\n</table>',1,'2016-03-30 13:38:22','AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'),(117,38,'ARTURvvvvvvv',NULL,'<p>145</p>',1,'2016-03-30 13:39:12','gfgsfag1111'),(118,38,'пфа',NULL,'<p>афып</p>',1,'2016-03-30 14:41:52','фапы'),(119,38,'gafs',NULL,'<p>gafsgasg</p>',1,'2016-03-30 15:33:48','gsfa');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks_types`
--

DROP TABLE IF EXISTS `tasks_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks_types` (
  `type_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  PRIMARY KEY (`type_id`,`task_id`),
  KEY `fk_tasks_types_has_tasks_tasks1_idx` (`task_id`),
  KEY `fk_tasks_types_has_tasks_tasks_types1_idx` (`type_id`),
  CONSTRAINT `fk_tasks_types_has_tasks_tasks1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tasks_types_has_tasks_tasks_types1` FOREIGN KEY (`type_id`) REFERENCES `types` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks_types`
--

LOCK TABLES `tasks_types` WRITE;
/*!40000 ALTER TABLE `tasks_types` DISABLE KEYS */;
INSERT INTO `tasks_types` VALUES (1,3),(2,3),(1,4),(4,29),(4,38),(4,39),(4,82),(4,84),(4,86),(4,87),(4,88),(4,89),(4,91),(4,92),(4,93),(4,94),(4,95),(4,96),(4,99),(4,100),(4,101),(4,102),(1,108),(2,108),(3,108),(4,108),(4,110),(4,111),(4,112),(4,113),(4,114),(1,115),(2,115),(3,115),(4,115),(5,115),(9,115),(10,115),(11,115),(12,115),(13,115),(14,115),(1,117),(2,117),(3,117),(5,117),(9,117),(10,117),(11,117),(12,117),(13,117),(4,118),(4,119);
/*!40000 ALTER TABLE `tasks_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tests` (
  `test_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `parameters` text,
  `answer` text NOT NULL,
  PRIMARY KEY (`test_id`,`task_id`),
  KEY `fk_tests_tasks1_idx` (`task_id`),
  CONSTRAINT `fk_tests_tasks1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=492 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
INSERT INTO `tests` VALUES (6,93,'','13'),(7,93,'','514'),(8,93,'1,31,3','541'),(9,93,'','541'),(10,93,'','451'),(11,94,'\'3\',\'artur\'','13'),(12,94,'','514'),(13,94,'1,31,3','541'),(14,94,'','541'),(15,94,'','451'),(16,95,'gfs','1'),(17,95,'','1'),(18,95,'','1'),(19,95,'','1'),(20,95,'[1,2,3],{1:1,2:2,3:3}','1'),(21,96,',','1'),(22,96,'','1'),(23,96,'','1'),(24,96,'','1'),(25,96,'[1,2,3],{1:1,2:2,3:3}','1'),(26,99,',','1'),(27,99,'','1'),(28,99,'','1'),(29,99,'','1'),(30,99,'[1,2,3],{1:1,2:2,3:3}','1'),(31,100,'gf','gsf'),(32,100,'','fasg'),(33,100,'','gfas'),(34,100,'','fsg'),(35,100,'','asgf'),(36,101,'sgf','g'),(37,101,'','g'),(38,101,'','sgf'),(39,101,'','fs'),(40,101,'','gfas'),(41,102,'','1'),(42,102,'','1'),(43,102,'','1'),(44,102,'','1'),(45,102,'','1'),(337,108,'[1,2,3],[1,5,6]','[2,3,7]'),(338,108,'','1'),(339,108,'','ag1fs'),(340,108,'','1'),(341,108,'1,1,1','gfa'),(342,110,'[1,2,3];{1:1,2:2,3:3}','6'),(343,110,'1;2;3','6'),(344,110,'\';\';\';\';1','1'),(345,110,'','0'),(346,110,'25','25'),(357,111,'[\"[1,2,3]\",\"[5,6,7]\"]','1'),(358,111,'[]','1'),(359,111,'[\"{1,2,3}\",\"\\\"ll:,!684697205\\\"\"]','1'),(360,111,'[]','1'),(361,111,'[]','1'),(362,112,'[]','1'),(363,112,'[]','1'),(364,112,'[]','1'),(365,112,'[]','1'),(366,112,'[]','1'),(367,113,'[]','1'),(368,113,'[]','3'),(369,113,'[]','5'),(370,113,'[]','4'),(371,113,'[]','6'),(372,114,'[]','4'),(373,114,'[]','4'),(374,114,'[]','6'),(375,114,'[]','5'),(376,114,'[]','5'),(402,115,'[\"1\",\"1\",\"1\",\"1\",\"1\"]','111111'),(403,115,'[\"\\\"ghdhdhdf\\\"\",\"\\\"1231323\\\"\",\"\\\"55555\\\"\"]','555'),(404,115,'[]','111'),(405,115,'[\"[1,2,3]\"]','4444'),(406,115,'[]','333'),(407,117,'[\"[1,2,3]\"]','1'),(408,117,'[]','1'),(409,117,'[]','1'),(410,117,'[]','1'),(411,117,'[]','1'),(412,118,'[]','1'),(413,118,'[]','1'),(414,118,'[]','1'),(415,118,'[]','1'),(416,118,'[]','1'),(423,39,'[]','1'),(424,39,'[]','1'),(425,39,'[]','1'),(426,39,'[]','1'),(427,39,'[]','1'),(428,39,'[]','1'),(429,38,'[]','1'),(430,38,'[]','1'),(431,38,'[]','1'),(432,38,'[]','1'),(433,38,'[]','1'),(434,38,'[]','1'),(441,119,'[]','1'),(442,119,'[]','1'),(443,119,'[]','1'),(444,119,'[]','1'),(445,119,'[]','1'),(446,29,'[]','1'),(447,29,'[]','1'),(448,29,'[]','1'),(449,29,'[]','1'),(450,29,'[]','1'),(451,29,'[]','1');
/*!40000 ALTER TABLE `tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `types` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `type_name_UNIQUE` (`type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (4,'arifmetics'),(5,'hgsd'),(9,'hgsdhag'),(10,'hgsdhagahg'),(12,'hgsdhagahgaghgfs'),(14,'hgsdhagahgaghgfsafs413'),(13,'hgsdhagahgaghgfsafsg'),(11,'hgsdhagahggfs'),(2,'logic'),(1,'math'),(3,'prog');
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `honor` int(11) NOT NULL,
  `clan` varchar(45) DEFAULT NULL,
  `avatar_url` text,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (38,'admin','artur','b656d0c7320385473d2e8b4b62fc1127',0,'bsuirkjg','OnbJUcgHO7sUtcEMrJZMh8Rb'),(39,'user','guralgfay','25d55ad283aa400af464c76d713c07ad',0,'gfaagfs1122j',''),(40,'user','kolia','25d55ad283aa400af464c76d713c07ad',0,NULL,''),(41,'user','dimka','25d55ad283aa400af464c76d713c07ad',0,'dasfa',''),(42,'user','dimok','25d55ad283aa400af464c76d713c07ad',0,'gg',''),(44,'user','dimoka','25d55ad283aa400af464c76d713c07ad',0,NULL,''),(45,'user','artiomka','eokfaofkdaofkdofkqewofk',0,'odkfoadkf',NULL),(46,'user','null','b656d0c7320385473d2e8b4b62fc1127',0,NULL,NULL),(47,'user','olol','25d55ad283aa400af464c76d713c07ad',0,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchings`
--

DROP TABLE IF EXISTS `watchings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watchings` (
  `watch_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`task_id`),
  UNIQUE KEY `watch_id_UNIQUE` (`watch_id`),
  KEY `fk_users_has_tasks_tasks6_idx` (`task_id`),
  KEY `fk_users_has_tasks_users5_idx` (`user_id`),
  CONSTRAINT `fk_users_has_tasks_tasks6` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_users_has_tasks_users5` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1341 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchings`
--

LOCK TABLES `watchings` WRITE;
/*!40000 ALTER TABLE `watchings` DISABLE KEYS */;
INSERT INTO `watchings` VALUES (332,38,22),(340,38,57),(363,41,57),(390,41,3),(391,41,4),(397,38,3),(433,41,55),(437,38,55),(650,38,4),(855,38,39),(939,38,11),(947,38,33),(1123,38,19),(1168,38,94),(1170,38,99),(1171,38,100),(1173,38,101),(1174,38,102),(1175,38,108),(1192,38,41),(1240,38,110),(1241,38,111),(1244,38,114),(1245,38,115),(1254,38,112),(1255,38,117),(1265,38,118),(1275,38,16),(1277,38,54),(1278,38,47),(1279,38,49),(1286,38,51),(1288,38,36),(1289,38,44),(1297,38,38),(1301,38,29),(1304,38,119),(1307,47,29),(1319,47,119),(1321,47,38),(1324,47,14);
/*!40000 ALTER TABLE `watchings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-30 17:35:49
