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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites_tasks`
--

LOCK TABLES `favorites_tasks` WRITE;
/*!40000 ALTER TABLE `favorites_tasks` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `later_tasks`
--

LOCK TABLES `later_tasks` WRITE;
/*!40000 ALTER TABLE `later_tasks` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
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
INSERT INTO `sessions` VALUES ('1HAV3SpQ7SxlaPgC7DEON77YqgBIb0QG',1461184581,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"authorized\":true,\"userId\":50,\"currUserRole\":\"user\"}'),('8m92waWjrUjwZihOISdrt9Cdl4H38kG7',1461184443,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('A6L55i6HeXWchgPqtqM8tcM4C1RKmvkS',1461183649,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('Ig_VlUN5qih2BMtYRVmtDAFAAMoXnslF',1461180807,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('KgL7dJKOl_VzsVSs2k12zHVGTzIDZfei',1461185116,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"authorized\":true,\"userId\":76,\"currUserRole\":\"user\"}'),('f4AiAv82t2JfmbDtzk4gDBADO0mSxofd',1461183346,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"authorized\":true,\"userId\":73,\"currUserRole\":\"user\"}'),('uvMSy8_cx6kEbfub8TFFqH4mq6IB_ysP',1461183649,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solutions`
--

LOCK TABLES `solutions` WRITE;
/*!40000 ALTER TABLE `solutions` DISABLE KEYS */;
INSERT INTO `solutions` VALUES (3,38,3,'function sum() {\n	return Array.prototype.reduce.call(arguments, function(value, item){\n      return value + (item || 0);\n    })\n}','2016-04-19 22:28:06'),(4,50,3,'function sum() {\n  	var res = 0;\n	for (var i=0; i < arguments.length; i++) {  \n      if ((typeof arguments[i]) == \"number\") {\n           res += arguments[i];\n      }      \n    }\n  return res;\n}','2016-04-19 22:35:42'),(5,76,3,'function sum() {\n 	return Array.prototype.reduce.call(arguments, function(value, item) {\n		if(!item) {\n          item = 0;\n        }\n        return value + item;\n     })\n }','2016-04-19 22:44:31');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (3,39,'Function params sum',3,'<p>Function must return sum of params</p>\n<p><span style=\"color: #ff0000;\">for example :&nbsp;</span></p>\n<ol>\n<li>sum(1,2,3) = 6</li>\n<li>sum(undefined, 2, 5) = 7</li>\n<li>sum(0,0,2.5) = 2.5</li>\n</ol>\n<p>&nbsp;</p>',1,'2016-04-19 22:20:42','sum');
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
INSERT INTO `tasks_types` VALUES (73,3),(77,3),(78,3),(81,3),(95,3),(105,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
INSERT INTO `tests` VALUES (16,3,'[{\"value\":\"1\"},{\"value\":\"2\"},{\"value\":\"3\"}]','6'),(17,3,'[{\"value\":\"2\"},{\"value\":\"2\"},{\"value\":\"2\"}]','6'),(18,3,'[{\"value\":\"0\"},{\"value\":\"0\"},{\"value\":\"0\"},{\"value\":\"0\"},{\"value\":\"1\"}]','1'),(19,3,'[{\"value\":\"1\"},{\"value\":\"0\"},{\"value\":\"1\"},{\"value\":\"0\"},{\"value\":\"1\"}]','3'),(20,3,'[{\"value\":\"0\"},{\"value\":\"7\"}]','7'),(21,3,'[{\"value\":\"9\"},{\"value\":\"9\"},{\"value\":\"1\"}]','19'),(22,3,'[{\"value\":\"2.5\"},{\"value\":\"3\"},{\"value\":\"1.5\"}]','7'),(23,3,'[{\"value\":\"5\"},{\"value\":\"5\"},{\"value\":\"0\"}]','10'),(24,3,'[{\"value\":\"0\"},{\"value\":\"0\"},{\"value\":\"0\"},{\"value\":\"0\"},{\"value\":\"undefined\"}]','0');
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
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (86,'Advanced Language Features'),(105,'Algebra'),(73,'Algorithms'),(95,'Arithmetic'),(78,'Arrays'),(111,'Babel'),(80,'Basic Language Features'),(100,'Binary'),(115,'Bits'),(91,'Bugs'),(96,'Classes'),(82,'Control Flow'),(122,'Cryptography'),(84,'Data Structures'),(74,'Data Types'),(107,'Dates/Time'),(83,'Declarative Programming'),(120,'Design Patterns'),(117,'Design Principles'),(104,'Formatting'),(93,'Functional Programming'),(88,'Functions'),(72,'Fundamentals'),(94,'Games'),(114,'Geometry'),(121,'Graphs'),(113,'Hacking Holidays'),(103,'Integers'),(119,'Linked Lists'),(92,'Lists'),(75,'Logic'),(98,'Loops'),(81,'Mathematics'),(77,'Numbers'),(85,'Object-oriented Programming'),(101,'Objects'),(97,'Parsing'),(79,'Programming Paradigms'),(106,'Prototypes'),(87,'Puzzles'),(89,'Regular Expressions'),(118,'Rules'),(108,'Security'),(110,'Sequences'),(109,'Sorting'),(76,'Strings'),(116,'Theoretical Computer Science'),(90,'Utilities'),(112,'Validation');
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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (38,'admin','artur','b656d0c7320385473d2e8b4b62fc1127',30,'bsuirkjg','hHf3YPYmKRMML51yCILBCuJo'),(39,'user','gural','25d55ad283aa400af464c76d713c07ad',5,'Business','yE0DWuZucG4DCtZdswpbdSOg'),(40,'user','ilya','25d55ad283aa400af464c76d713c07ad',0,'Business','eeENdmBvjU4u2XiBbqxYPlwx'),(41,'user','denis','25d55ad283aa400af464c76d713c07ad',0,'Business','yi7YCI9NH7TU1cbp5RLWGFRL'),(42,'user','sergey','25d55ad283aa400af464c76d713c07ad',0,'Business','k5UYHCpPaZoGwARFW8mQli4U'),(43,'user','alex','25d55ad283aa400af464c76d713c07ad',0,'Business','QnFfzjuXQffRcFjrVJeVu_Jd'),(44,'user','misha','25d55ad283aa400af464c76d713c07ad',0,'BSUIR','yG_Qslv3mHrO4F8KR30dMZFF'),(45,'user','petia','25d55ad283aa400af464c76d713c07ad',0,'BSUIR','Xbgpi3NBmD_d8qYJ48tuv2Sc'),(46,'user','dmitro','25d55ad283aa400af464c76d713c07ad',0,'BSUIR','n-Ih9mS6ISExSJaGZqNNpkgo'),(47,'user','fanat','25d55ad283aa400af464c76d713c07ad',0,'BSUIR','KY79ZNmCwtKCZJi5In71kP6t'),(48,'user','serega','25d55ad283aa400af464c76d713c07ad',0,'BSUIR','TlMzESnWKfRC-04y6jNmgDMz'),(49,'user','sergio','25d55ad283aa400af464c76d713c07ad',0,'BSUIR',NULL),(50,'user','cos','25d55ad283aa400af464c76d713c07ad',30,'BSUIR','EbDDtkZZLg3b9jsc8wc6CdsY'),(51,'user','ogre','25d55ad283aa400af464c76d713c07ad',0,'BSUIR','CEGD38uF-yjm_AWNfTpgn3Oo'),(52,'user','nikita','25d55ad283aa400af464c76d713c07ad',0,'BSUIR','nr5FoMc82sOt0QikfCZ0CzxG'),(53,'user','dmitrovka','25d55ad283aa400af464c76d713c07ad',0,'BSUIR','R51XTCc4DASajNbvzLukVdf9'),(54,'user','gemba','25d55ad283aa400af464c76d713c07ad',0,'BSUIR','fAXGmnDQiwdb4tLYwjZQL8bU'),(55,'user','sada','25d55ad283aa400af464c76d713c07ad',0,'BSU','4AQYajwWpeGlwt_rzi8Pae3G'),(56,'user','osip','25d55ad283aa400af464c76d713c07ad',0,'BSU','PtZV86XCNMmEA6lItK0qt0Co'),(57,'user','kostya','25d55ad283aa400af464c76d713c07ad',0,'BSU','dSRuLZ-iFquX8RK0KOpaF3xz'),(58,'user','andrey','25d55ad283aa400af464c76d713c07ad',0,'BSU','6V2Mn8cedu7xdoZY3n3UQ40p'),(59,'user','dasha','25d55ad283aa400af464c76d713c07ad',0,'BSU','NTWBK4Bc0ni-2MkfmyCHV8US'),(60,'user','sveta','25d55ad283aa400af464c76d713c07ad',0,'BSU',NULL),(61,'user','sasha','25d55ad283aa400af464c76d713c07ad',0,'BSU','REobhoVR4od0rHO7XF11h51x'),(62,'user','kris','25d55ad283aa400af464c76d713c07ad',0,'BSU','pLTtiKGQgDmh5UinCFJgvMIt'),(63,'user','ugu','25d55ad283aa400af464c76d713c07ad',0,'BSU',NULL),(64,'user','petroff','25d55ad283aa400af464c76d713c07ad',0,'CODERS','DFzH42YyuiB6F9pVKy0NiyGP'),(65,'user','barcelona','25d55ad283aa400af464c76d713c07ad',0,'CODERS','rDDjSLKTOWsiHKRfdpgIe5JO'),(66,'user','coca','25d55ad283aa400af464c76d713c07ad',0,'CODERS','uzOoz016Rm4wbFfbaTWgH71M'),(67,'user','cola','25d55ad283aa400af464c76d713c07ad',0,'CODERS','R1-knxlem5AUtb2jbp5eT8eZ'),(68,'user','dimoka','25d55ad283aa400af464c76d713c07ad',0,'CODERS','zBl-sYFKUABOPgNOEjk0zRiV'),(69,'user','phone','25d55ad283aa400af464c76d713c07ad',0,'CODERS',NULL),(70,'user','coder','25d55ad283aa400af464c76d713c07ad',0,'CODERS','igYBSKGmzl-PEpMd_qL0P0MP'),(71,'user','jser','25d55ad283aa400af464c76d713c07ad',0,'CODERS','cKfI-XssWq7OG_3rBEGMsOeQ'),(72,'user','better','25d55ad283aa400af464c76d713c07ad',0,'CODERS','9FepcqliqATvL7qBjOlEei8p'),(73,'user','vitalyi','25d55ad283aa400af464c76d713c07ad',0,'CODERS','3kA7gvjY8DPTBWdwVf3M6ghM'),(74,'user','kira','25d55ad283aa400af464c76d713c07ad',0,'CODERS','Mt4dMx1pggJvZU_ZczsAgb4E'),(75,'user','tanya','25d55ad283aa400af464c76d713c07ad',0,'DILLS','8lmG5Kiq66CgOGvUayORW_an'),(76,'user','katya','25d55ad283aa400af464c76d713c07ad',30,'CODERS','55e2Kbqn3x6LrisDhUD9vgyy'),(77,'user','vika','25d55ad283aa400af464c76d713c07ad',0,'DILLS',NULL),(78,'user','nastya','25d55ad283aa400af464c76d713c07ad',0,'CODERS','7EBg_b-M4JIb-zCkyKe4uPUP'),(79,'user','varya','25d55ad283aa400af464c76d713c07ad',0,'CODERS','UdMx8yHKK4ZL6KMuKiIgRbQ1'),(80,'user','rita','25d55ad283aa400af464c76d713c07ad',0,'DILLS','xWEQIWysPDzeEKBXKjn08ltp');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchings`
--

LOCK TABLES `watchings` WRITE;
/*!40000 ALTER TABLE `watchings` DISABLE KEYS */;
INSERT INTO `watchings` VALUES (13,38,3),(15,50,3),(19,76,3);
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

-- Dump completed on 2016-04-19 23:47:26
