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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (3,60,3,'nice task','2016-04-20 10:28:28'),(4,38,3,'too easy','2016-04-20 10:34:19'),(5,38,3,'nice nice','2016-04-20 10:47:30'),(6,41,6,'nice','2016-04-20 12:35:25'),(7,38,7,'well well','2016-04-20 12:41:44'),(8,38,4,'my','2016-04-20 12:51:07'),(9,38,8,'easy!!!','2016-04-20 15:17:58');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites_tasks`
--

LOCK TABLES `favorites_tasks` WRITE;
/*!40000 ALTER TABLE `favorites_tasks` DISABLE KEYS */;
INSERT INTO `favorites_tasks` VALUES (3,38,3),(4,66,4),(5,66,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (3,38,3),(4,66,4),(5,66,3);
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
INSERT INTO `sessions` VALUES ('1BVtT7bTjGPwIupNEFRaAgYjv3DcrbxQ',1461242917,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('1HAV3SpQ7SxlaPgC7DEON77YqgBIb0QG',1461184581,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"authorized\":true,\"userId\":50,\"currUserRole\":\"user\"}'),('41-7RXiD5ih7ixtra2J3y33UCBYbNEKK',1461230518,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('6GFNtQKaYwV6eisRhoA_vZOCM-zP_OI9',1461228697,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('8m92waWjrUjwZihOISdrt9Cdl4H38kG7',1461184443,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('A6L55i6HeXWchgPqtqM8tcM4C1RKmvkS',1461183649,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('GZAMBGrrOAsLAdtHz4blLF1sUUkNO5pp',1461223693,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('GfFvixYzUf6uJ_3TYB27kJtmTMwqg7AN',1461228547,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('Ig_VlUN5qih2BMtYRVmtDAFAAMoXnslF',1461180807,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('KgL7dJKOl_VzsVSs2k12zHVGTzIDZfei',1461185116,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"authorized\":true,\"userId\":76,\"currUserRole\":\"user\"}'),('LvCizxr2nCVzvubs9Une3ZnrqOZoxFc9',1461223999,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('MCXZEvzOUIov3A06rJtAkbj1wHcLn9hA',1461228378,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('N-eqQ0-rq_t3hlkXwS0GnJ_-8lPJo7on',1461245500,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"authorized\":true,\"userId\":38,\"currUserRole\":\"admin\"}'),('NylGe5mnaTCTXQhEQiEUn7DLFAJ_y364',1461231653,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('OiBhXXXeQsKiQZ1oojauMrNgwMZA_xXQ',1461228570,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('Poe6KUGPhaUtgSuma9hOAlNBPdBhT8Sq',1461234971,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('Q8rgC3dtmmdhcpvUhpKgQd9V5ISJiFeu',1461242917,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('WIZsBgVWTg5uT2NVJYu_EKw4SfNT0m2J',1461229574,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('_iEGcfHhD9vyGFzsqrATPj_odGyny20I',1461242464,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('bmn9bhtMvYr7IwGbbRKxbSRkIdD99w2b',1461241753,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('dISV6HV-mBlT8o0-elej4e8LfOb-TB4Y',1461242464,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('eCXwn7VkMNdz3_MPrJcyqdGDKq5MANWg',1461241365,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('f4AiAv82t2JfmbDtzk4gDBADO0mSxofd',1461183346,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"authorized\":true,\"userId\":73,\"currUserRole\":\"user\"}'),('kqCRAR8WLn8wpZPBuLDzkKg6WQpUCDmH',1461234474,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('loDG5Ms7PazyPIUZDFDVNxidGpVRE7fG',1461242918,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('mCFg3yKBdPPfnmcPu_8FTPYE8qvmTtQD',1461244421,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('pL3hhh3LLd6tUard6ZLQsJyXbi3mLNj2',1461229574,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('pWA-Cu2KdxpOarkrLlcE63HyTfsvOhfP',1461241824,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('rWiwISLiS1BdXQtavNpnBooAempCDZZs',1461228547,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('rw3Lvnao9kpXmPlopXaCBDMQEQVwkydI',1461230518,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('skfDXexvrH01IiSMR-l1kaTlXKa-PpZh',1461230232,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('ssdP45TkrH-meogT0T1Cg6vUymat4MQw',1461231288,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('tDIuYNe29r8QSr1CR3VuocB6Y-H0OU1d',1461228570,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('uvMSy8_cx6kEbfub8TFFqH4mq6IB_ysP',1461183649,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('wFexdvPyjTirwBPMOGC8f-XX82j149df',1461228378,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('yNyJWBHqBPPPmEm5fYCpVf1B76_cRmNu',1461245506,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"authorized\":true,\"userId\":54,\"currUserRole\":\"user\"}'),('zEnEp_in5K7elMx-imevgynCeV2MVdYm',1461228647,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}');
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solutions`
--

LOCK TABLES `solutions` WRITE;
/*!40000 ALTER TABLE `solutions` DISABLE KEYS */;
INSERT INTO `solutions` VALUES (7,38,3,'function sum() {\n  return Array.prototype.reduce.call (arguments, (sum, item) => sum + (item || 0) ) ;\n}','2016-04-20 10:33:49'),(15,38,5,'function add (a, b) {\n  var res = \'\', c = 0\n  a = a.split(\'\')\n  b = b.split(\'\')\n  while (a.length || b.length || c) {\n    c += ~~a.pop() + ~~b.pop()\n    res = c % 10 + res\n    c = c > 9\n  }\n  return res\n}','2016-04-20 12:14:22'),(17,38,6,'function isValidCoordinates(coordinates) {\n  return /^-?((90)|[0-8]\\d|\\d)(\\.\\d+)?,\\s-?((\\d\\d?)|(180)|[1][0-7]\\d)(\\.\\d+)?$/.test(coordinates);\n}','2016-04-20 12:33:14'),(19,38,7,'function rotate(array, n) {\n  n = n % array.length\n  return array.slice(-n).concat(array.slice(0, -n))\n}','2016-04-20 12:50:47'),(20,38,8,'function get(value) {\n	return value\n}','2016-04-20 15:17:36'),(28,38,9,'function undefinedget(t) {\n	return t\n}','2016-04-20 15:46:45'),(18,41,5,'function add (a, b) {\n  var length = Math.max(a.length, b.length);\n  var padding = [].concat.apply([], new Array(length)).map(function () { return \'0\'; }).join(\'\');\n\n  b = (padding + b).slice(-length).split(\'\');  \n  var result = (padding + a).slice(-length).split(\'\').reduceRight(function (acc, current, i) {\n    var sum = parseInt(current, 10) + parseInt(b[i], 10) + acc[1], digit = sum % 10;\n    return [digit + acc[0], (sum - digit) / 10];\n  }, [\'\', 0]);\n\n  return (result[1] || \'\') + result[0];\n}','2016-04-20 12:35:10'),(10,46,4,'function getInfo(n) {\n    return n.toString(2).match(/1/g).length % 2 ? \'It\\\'s Odious!\' : \'It\\\'s Evil!\';\n}','2016-04-20 11:49:27'),(27,47,3,'function sum() {\n  	return Array.prototype.reduce.call(arguments, function(value, item) {\n 		if(!item) {\n           item = 0;\n         }\n         return value + item;\n      })\n  }','2016-04-20 15:39:54'),(22,47,4,'getInfo = n => [\"It\'s Evil!\", \"It\'s Odious!\"][(n.toString(2).split(\"1\").length-1) & 1];','2016-04-20 15:34:00'),(26,47,5,'function add (a, b) {\n   var length = Math.max(a.length, b.length);\n   var padding = [].concat.apply([], new Array(length)).map(function () { return \'0\'; }).join(\'\');\n \n   b = (padding + b).slice(-length).split(\'\');  \n   var result = (padding + a).slice(-length).split(\'\').reduceRight(function (acc, current, i) {\n     var sum = parseInt(current, 10) + parseInt(b[i], 10) + acc[1], digit = sum % 10;\n     return [digit + acc[0], (sum - digit) / 10];\n   }, [\'\', 0]);\n \n   return (result[1] || \'\') + result[0];\n }','2016-04-20 15:36:10'),(25,47,6,'function isValidCoordinates(coordinates) {\n   return /^-?((90)|[0-8]\\d|\\d)(\\.\\d+)?,\\s-?((\\d\\d?)|(180)|[1][0-7]\\d)(\\.\\d+)?$/.test(coordinates);\n }','2016-04-20 15:35:55'),(24,47,7,'rotate = (array, n) => {\n  n = n% array.length;\n  return array.slice(-n).concat(array.slice(0, -n));\n}','2016-04-20 15:35:14'),(23,47,8,'function get(a) {\n	return a\n}','2016-04-20 15:34:11'),(4,50,3,'function sum() {\n  	var res = 0;\n	for (var i=0; i < arguments.length; i++) {  \n      if ((typeof arguments[i]) == \"number\") {\n           res += arguments[i];\n      }      \n    }\n  return res;\n}','2016-04-19 22:35:42'),(21,50,8,'function get(item) {\n	return item\n}','2016-04-20 15:23:39'),(29,53,10,'function strhf(a) {\n	return a\n}','2016-04-20 16:13:10'),(11,58,4,'\'use strict\'\nfunction getInfo(n) {\n  let k = 0;\n  for(;n > 0; n = n >> 1)\n    k += n & 1;\n  \n  return k % 2 === 1 ? \"It\'s Odious!\" : \"It\'s Evil!\"\n}','2016-04-20 11:50:25'),(6,60,3,'function sum(){\n  return Array.prototype.reduce.call(arguments, function(val, item){\n    return val + (item || 0);\n  })\n}\n','2016-04-20 10:32:31'),(12,65,4,'const getInfo = n => `It\'s ${n.toString(2).split(\"\").filter(bit => bit == \"1\").length % 2 ? \"Odious\" : \"Evil\"}!`;','2016-04-20 11:51:23'),(14,66,3,'function sum (){\n  return Array.prototype.reduce.call(arguments, (value, item) => value + (item || 0));\n}','2016-04-20 11:54:49'),(13,66,4,'function getInfo(n) {\n  number = n.toString(2);\n  count = 0;\n for(var i = 0; i<number.length; i++){\n   if(number[i]==\"1\") count++\n }\n \n \n   if(count%2==0)\n    return \"It\'s Evil!\"; \n   else \n    return \"It\'s Odious!\";\n}','2016-04-20 11:51:58'),(5,76,3,'function sum() {\n 	return Array.prototype.reduce.call(arguments, function(value, item) {\n		if(!item) {\n          item = 0;\n        }\n        return value + item;\n     })\n }','2016-04-19 22:44:31'),(9,79,4,'function getInfo(n) {\n   return (n.toString(2).split(\'\').filter( (item) => item == 1).length % 2) ? \"It\'s Odious!\" : \"It\'s Evil!\";\n }','2016-04-20 11:48:38');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (3,39,'Function params sum',3,'<p>Function must return sum of params</p>\n<p><span style=\"color: #ff0000;\">for example :&nbsp;</span></p>\n<ol>\n<li>sum(1,2,3) = 6</li>\n<li>sum(undefined, 2, 5) = 7</li>\n<li>sum(0,0,2.5) = 2.5</li>\n</ol>',1,'2016-04-20 11:00:22','sum'),(4,38,'Evil or Odious',2,'<p>The number n is <strong>Evil</strong> if it has an even number of 1\'s in its binary expansion.<br />First ten: 3, 5, 6, 9, 10, 12, 15, 17, 18, 20<br /><br />The number n is <strong>Odious</strong> if it has an odd number of 1\'s in its binary expansion.<br />First ten: 1, 2, 4, 7, 8, 11, 13, 14, 16, 19<br /><br />You have to write a function that determine if a number is Evil of Odious, function should return \"It\'s Evil!\" in case of evil number and \"It\'s Odious!\" in case of odious number.</p>\n<p>good luck :)</p>',1,'2016-04-20 15:33:35','getInfo'),(5,66,'Adding Big Numbers',6,'<p>We need to sum big numbers and we require your help.</p>\n<p>Write a function that returns the sum of two numbers. The input numbers are strings and the function must return a string.</p>\n<h2>Example</h2>\n<ul>\n<li><code class=\"lang-javascript\"> add(<span class=\"hljs-string\">\"123\"</span>, <span class=\"hljs-string\">\"321\"</span>); -&gt; <span class=\"hljs-string\">\"444\"</span></code></li>\n<li><code class=\"lang-javascript\"> add(<span class=\"hljs-string\">\"11\"</span>, <span class=\"hljs-string\">\"99\"</span>); -&gt; <span class=\"hljs-string\">\"110\"</span></code></li>\n</ul>\n<h2>Notes</h2>\n<ul>\n<li>The input numbers are <em>big</em>.</li>\n<li>The input is a string of only digits</li>\n<li>The numbers are positives</li>\n</ul>',1,'2016-04-20 12:14:18','add'),(6,50,'Coordinates Validator',7,'<p>You need to create a function that will validate if given parameters are valid geographical coordinates.</p>\n<p>Valid coordinates look like the following: <strong>\"23.32353342, -32.543534534\"</strong>. The return value should be either <strong>true</strong> or <strong>false</strong>.</p>\n<p>Latitude (which is first float) can be between 0 and 90, positive or negative. Longitude (which is second float) can be between 0 and 180, positive or negative.</p>\n<p>Coordinates can only contain digits, or one of the following symbols (including space after comma) <strong>-, .</strong></p>\n<p>There should be no space between the minus \"-\" sign and the digit after it.</p>\n<p>Here are some valid coordinates:</p>\n<ul>\n<li>-23, 25</li>\n<li>24.53525235, 23.45235</li>\n<li>04, -23.234235</li>\n<li>43.91343345, 143</li>\n<li>4, -3</li>\n</ul>\n<p>And some invalid ones:</p>\n<ul>\n<li>23.234, - 23.4234</li>\n<li>2342.43536, 34.324236</li>\n<li>N23.43345, E32.6457</li>\n<li>99.234, 12.324</li>\n<li>6.325624, 43.34345.345</li>\n<li>0, 1,2</li>\n<li>0.342q0832, 1.2324</li>\n</ul>',1,'2016-04-20 12:26:11','isValidCoordinates'),(7,41,'Rotate Array',4,'<p>Create a function named \"rotate\" that takes an array and returns a new one with the elements inside rotated n spaces.</p>\n<p>If n is greater than 0 it should rotate the array to the right. If n is less than 0 it should rotate the array to the left. If n is 0, then it should return the array unchanged.</p>\n<p>Example:</p>\n<pre><code class=\"lang-javascript\"><span class=\"hljs-keyword\">var</span> data = [<span class=\"hljs-number\">1</span>, <span class=\"hljs-number\">2</span>, <span class=\"hljs-number\">3</span>, <span class=\"hljs-number\">4</span>, <span class=\"hljs-number\">5</span>];\n\nrotate(data, <span class=\"hljs-number\">1</span>) <span class=\"hljs-comment\">// =&gt; [5, 1, 2, 3, 4]</span>\nrotate(data, <span class=\"hljs-number\">2</span>) <span class=\"hljs-comment\">// =&gt; [4, 5, 1, 2, 3]</span>\nrotate(data, <span class=\"hljs-number\">3</span>) <span class=\"hljs-comment\">// =&gt; [3, 4, 5, 1, 2]</span>\nrotate(data, <span class=\"hljs-number\">4</span>) <span class=\"hljs-comment\">// =&gt; [2, 3, 4, 5, 1]</span>\nrotate(data, <span class=\"hljs-number\">5</span>) <span class=\"hljs-comment\">// =&gt; [1, 2, 3, 4, 5]</span>\n\nrotate(data, <span class=\"hljs-number\">0</span>) <span class=\"hljs-comment\">// =&gt; [1, 2, 3, 4, 5]</span>\n\nrotate(data, -<span class=\"hljs-number\">1</span>) <span class=\"hljs-comment\">// =&gt; [2, 3, 4, 5, 1]</span>\nrotate(data, -<span class=\"hljs-number\">2</span>) <span class=\"hljs-comment\">// =&gt; [3, 4, 5, 1, 2]</span>\nrotate(data, -<span class=\"hljs-number\">3</span>) <span class=\"hljs-comment\">// =&gt; [4, 5, 1, 2, 3]</span>\nrotate(data, -<span class=\"hljs-number\">4</span>) <span class=\"hljs-comment\">// =&gt; [5, 1, 2, 3, 4]</span>\nrotate(data, -<span class=\"hljs-number\">5</span>) <span class=\"hljs-comment\">// =&gt; [1, 2, 3, 4, 5]</span></code></pre>\n<p>Furthermore the method should take ANY array of objects and perform this operation on them:</p>\n<pre><code class=\"lang-javascript\">rotate([<span class=\"hljs-string\">\'a\'</span>, <span class=\"hljs-string\">\'b\'</span>, <span class=\"hljs-string\">\'c\'</span>], <span class=\"hljs-number\">1</span>)     <span class=\"hljs-comment\">// =&gt; [\'c\', \'a\', \'b\']</span>\nrotate([<span class=\"hljs-number\">1.0</span>, <span class=\"hljs-number\">2.0</span>, <span class=\"hljs-number\">3.0</span>], <span class=\"hljs-number\">1</span>)     <span class=\"hljs-comment\">// =&gt; [3.0, 1.0, 2.0]</span>\nrotate([<span class=\"hljs-literal\">true</span>, <span class=\"hljs-literal\">true</span>, <span class=\"hljs-literal\">false</span>], <span class=\"hljs-number\">1</span>) <span class=\"hljs-comment\">// =&gt; [false, true, true]</span></code></pre>\n<p>Finally the rotation shouldn\'t be limited by the indices available in the array. Meaning that if we exceed the indices of the array it keeps rotating.</p>\n<p><strong>Example:</strong></p>\n<ol>\n<li><code class=\"lang-javascript\"><span class=\"hljs-keyword\">var</span> data = [<span class=\"hljs-number\">1</span>, <span class=\"hljs-number\">2</span>, <span class=\"hljs-number\">3</span>, <span class=\"hljs-number\">4</span>, <span class=\"hljs-number\">5</span>]</code></li>\n<li><code class=\"lang-javascript\">rotate(data, <span class=\"hljs-number\">7</span>) <span class=\"hljs-comment\">// =&gt; [4, 5, 1, 2, 3]</span></code></li>\n<li><code class=\"lang-javascript\"> rotate(data, <span class=\"hljs-number\">11</span>) <span class=\"hljs-comment\">// =&gt; [5, 1, 2, 3, 4]</span> </code></li>\n<li><code class=\"lang-javascript\">rotate(data, <span class=\"hljs-number\">12478</span>) <span class=\"hljs-comment\">// =&gt; [3, 4, 5, 1, 2]</span></code></li>\n</ol>',1,'2016-04-20 12:47:57','rotate'),(8,70,'Return coming param',1,'<p>return what come</p>',1,'2016-04-20 15:22:41','get'),(9,47,'undefined',1,'<p>1vfs</p>',1,'2016-04-20 15:41:39','undefinedget'),(10,38,'return strings',1,'<p>adg</p>',1,'2016-04-20 16:31:39','strhf');
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
INSERT INTO `tasks_types` VALUES (73,3),(77,3),(78,3),(81,3),(95,3),(105,3),(76,4),(95,4),(100,4),(73,5),(76,5),(77,5),(81,5),(95,5),(103,5),(105,5),(79,6),(89,6),(78,7),(88,8),(91,9),(72,10),(73,10),(74,10),(75,10),(76,10),(77,10),(78,10),(79,10),(80,10),(81,10),(82,10),(83,10),(84,10),(85,10),(86,10),(87,10),(88,10),(89,10),(90,10),(91,10),(92,10),(93,10),(94,10),(95,10),(96,10),(97,10),(98,10),(100,10),(101,10),(103,10),(104,10),(105,10),(106,10),(107,10),(108,10),(109,10),(110,10),(111,10),(112,10),(113,10),(114,10),(115,10),(116,10),(117,10),(118,10),(119,10),(120,10),(121,10),(122,10);
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
) ENGINE=InnoDB AUTO_INCREMENT=347 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
INSERT INTO `tests` VALUES (25,3,'[{\"value\":\"1\"},{\"value\":\"2\"},{\"value\":\"3\"}]','6'),(26,3,'[{\"value\":\"2\"},{\"value\":\"2\"},{\"value\":\"2\"}]','6'),(27,3,'[{\"value\":\"0\"},{\"value\":\"0\"},{\"value\":\"0\"},{\"value\":\"0\"},{\"value\":\"1\"}]','1'),(28,3,'[{\"value\":\"1\"},{\"value\":\"0\"},{\"value\":\"1\"},{\"value\":\"0\"},{\"value\":\"1\"}]','3'),(29,3,'[{\"value\":\"0\"},{\"value\":\"7\"}]','7'),(30,3,'[{\"value\":\"9\"},{\"value\":\"9\"},{\"value\":\"1\"}]','19'),(31,3,'[{\"value\":\"2.5\"},{\"value\":\"3\"},{\"value\":\"1.5\"}]','7'),(32,3,'[{\"value\":\"5\"},{\"value\":\"5\"},{\"value\":\"0\"}]','10'),(33,3,'[{\"value\":\"0\"},{\"value\":\"0\"},{\"value\":\"0\"},{\"value\":\"0\"},{\"value\":\"undefined\"}]','0'),(81,5,'[{\"value\":\"\\\"91\\\"\"},{\"value\":\"\\\"19\\\"\"}]','110'),(82,5,'[{\"value\":\"\\\"123456789\\\"\"},{\"value\":\"\\\"987654322\\\"\"}]','1111111111'),(83,5,'[{\"value\":\"\\\"999999999\\\"\"},{\"value\":\"\\\"1\\\"\"}]','1000000000'),(84,5,'[{\"value\":\"\\\"887450\\\"\"},{\"value\":\"\\\"54124\\\"\"}]','941574'),(85,5,'[{\"value\":\"\\\"50685\\\"\"},{\"value\":\"\\\"292067\\\"\"}]','342752'),(86,5,'[{\"value\":\"\\\"34431\\\"\"},{\"value\":\"\\\"968640\\\"\"}]','1003071'),(87,5,'[{\"value\":\"\\\"823094582094385190384102934810293481029348123094818923749817\\\"\"},{\"value\":\"\\\"234758927345982475298347523984572983472398457293847594193837\\\"\"}]','1057853509440367665682450458794866464501746580388666517943654'),(88,5,'[{\"value\":\"\\\"234859234758913759182357398457398474598237459823745928347538\\\"\"},{\"value\":\"\\\"987429134712934876249385134781395873198472398562384958739845\\\"\"}]','1222288369471848635431742533238794347796709858386130887087383'),(89,5,'[{\"value\":\"\\\"854694587458967459867923420398420394845873945734985374844444\\\"\"},{\"value\":\"\\\"333333333333439439483948394839834938493843948394839432322229\\\"\"}]','1188027920792406899351871815238255333339717894129824807166673'),(90,5,'[{\"value\":\"\\\"666666665656566666666565656666666656565666666665656566666666\\\"\"},{\"value\":\"\\\"464646464646464644646464646464646464646464646463463463463466\\\"\"}]','1131313130303031311313030303131313121212131313129120030130132'),(91,5,'[{\"value\":\"\\\"987429134712934876249385134781395873198472398562384958739845234859234758913759182357398457398474598237459823745928347538\\\"\"},{\"value\":\"\\\"835743829547328954732895474893754893753281957319857432958432548937859483265893274891378593187431583942678439217431924789\\\"\"}]','1823172964260263830982280609675150766951754355882242391698277783797094242179652457248777050585906182180138262963360272327'),(128,6,'[{\"value\":\"\\\"-23, 25\\\"\"}]','true'),(129,6,'[{\"value\":\"\\\"4, -3\\\"\"}]','true'),(130,6,'[{\"value\":\"\\\"24.53525235, 23.45235\\\"\"}]','true'),(131,6,'[{\"value\":\"\\\"04, -23.234235\\\"\"}]','true'),(132,6,'[{\"value\":\"\\\"43.91343345, 143\\\"\"}]','true'),(133,6,'[{\"value\":\"\\\"23.234, - 23.4234\\\"\"}]','false'),(134,6,'[{\"value\":\"\\\"2342.43536, 34.324236\\\"\"}]','false'),(135,6,'[{\"value\":\"\\\"N23.43345, E32.6457\\\"\"}]','false'),(136,6,'[{\"value\":\"\\\"0.342q0832, 1.2324\\\"\"}]','false'),(145,7,'[{\"value\":\"[1, 2, 3, 4, 5]\"},{\"value\":\"1\"}]','[5, 1, 2, 3, 4]'),(146,7,'[{\"value\":\"[1, 2, 3, 4, 5]\"},{\"value\":\"2\"}]','[4, 5, 1, 2, 3]'),(147,7,'[{\"value\":\"[1, 2, 3, 4, 5]\"},{\"value\":\"3\"}]','[3, 4, 5, 1, 2]'),(148,7,'[{\"value\":\"[1, 2, 3, 4, 5]\"},{\"value\":\"4\"}]','[2, 3, 4, 5, 1]'),(149,7,'[{\"value\":\"[1, 2, 3, 4, 5]\"},{\"value\":\"5\"}]','[1, 2, 3, 4, 5]'),(150,7,'[{\"value\":\"[\\\"a\\\",\\\"b\\\",\\\"c\\\",\\\"d\\\",\\\"e\\\"]\"},{\"value\":\"4\"}]','[\"b\",\"c\",\"d\",\"e\",\"a\"]'),(151,7,'[{\"value\":\"[\\\"a\\\",\\\"b\\\",\\\"c\\\",\\\"d\\\",\\\"e\\\"]\"},{\"value\":\"-4\"}]','[\"e\",\"a\",\"b\",\"c\",\"d\"]'),(152,7,'[{\"value\":\"[\\\"a\\\",\\\"b\\\",\\\"c\\\",\\\"d\\\",\\\"e\\\"]\"},{\"value\":\"24\"}]','[\"b\",\"c\",\"d\",\"e\",\"a\"]'),(192,8,'[{\"value\":\"undefined\"}]','undefined'),(193,8,'[{\"value\":\"null\"}]','null'),(194,8,'[{\"value\":\"[1,2,3]\"}]','[1,2,3]'),(195,8,'[{\"value\":\"[\\\"1\\\",\\\"2\\\",\\\"3\\\"]\"}]','[\"1\",\"2\",\"3\"]'),(196,8,'[{\"value\":\"{\\\"name\\\":\\\"artur\\\"}\"}]','{\"name\":\"artur\"}'),(197,8,'[{\"value\":\"-1115.1\"}]','-1115.1'),(198,8,'[{\"value\":\"\\\"undefined\\\"\"}]','\"undefined\"'),(227,4,'[{\"value\":\"1\"}]','\"It\'s Odious!\"'),(228,4,'[{\"value\":\"2\"}]','\"It\'s Odious!\"'),(229,4,'[{\"value\":\"3\"}]','\"It\'s Evil!\"'),(230,4,'[{\"value\":\"119\"}]','\"It\'s Evil!\"'),(231,4,'[{\"value\":\"160\"}]','\"It\'s Evil!\"'),(232,4,'[{\"value\":\"90\"}]','\"It\'s Evil!\"'),(233,4,'[{\"value\":\"54\"}]','\"It\'s Evil!\"'),(234,4,'[{\"value\":\"114\"}]','\"It\'s Evil!\"'),(235,4,'[{\"value\":\"78\"}]','\"It\'s Evil!\"'),(236,4,'[{\"value\":\"127\"}]','\"It\'s Odious!\"'),(237,4,'[{\"value\":\"148\"}]','\"It\'s Odious!\"'),(238,4,'[{\"value\":\"16\"}]','\"It\'s Odious!\"'),(239,4,'[{\"value\":\"127\"}]','\"It\'s Odious!\"'),(240,4,'[{\"value\":\"107\"}]','\"It\'s Odious!\"'),(246,9,'[{\"value\":\"undefined\"}]','undefined'),(247,9,'[{\"value\":\"\\\"undefined\\\"\"}]','\"undefined\"'),(248,9,'[{\"value\":\"\\\"undefined\\\"\"}]','\"undefined\"'),(249,9,'[{\"value\":\"\\\"undefined\\\"\"}]','\"undefined\"'),(250,9,'[{\"value\":\"\\\"undefined\\\"\"}]','\"undefined\"'),(333,10,'[{\"value\":\"\\\"null\\\"\"}]','\"null\"'),(334,10,'[{\"value\":\"null\"}]','null'),(335,10,'[{\"value\":\"undefined\"}]','undefined'),(336,10,'[{\"value\":\"\\\"undefined\\\"\"}]','\"undefined\"'),(337,10,'[{\"value\":\"\\\"lal\\\"\"}]','\"lal\"'),(338,10,'[{\"value\":\"\\\"1\\\"\"}]','1'),(339,10,'[{\"value\":\"0.25555\"}]','0.25555'),(340,10,'[{\"value\":\"\\\"-1243\\\"\"}]','\"-1243\"'),(341,10,'[{\"value\":\"{\\\"name\\\" : \\\"artur\\\" }\"}]','{\"name\" : \"artur\" }'),(342,10,'[{\"value\":\"[1,2,\\\"3\\\",4,\\\"aff\\\"]\"}]','[\"1\",2,\"3\",4,\"aff\"]'),(343,10,'[{\"value\":\"1\"}]','1'),(344,10,'[{\"value\":\"\\\"5\\\"\"}]','5'),(345,10,'[{\"value\":\"5\"}]','5'),(346,10,'[{\"value\":\"5\"}]','5');
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
INSERT INTO `users` VALUES (38,'admin','artur','b656d0c7320385473d2e8b4b62fc1127',230,'bsuir','hHf3YPYmKRMML51yCILBCuJo'),(39,'user','gural','25d55ad283aa400af464c76d713c07ad',5,'Business','yE0DWuZucG4DCtZdswpbdSOg'),(40,'user','ilya','25d55ad283aa400af464c76d713c07ad',0,'Business','eeENdmBvjU4u2XiBbqxYPlwx'),(41,'user','denis','25d55ad283aa400af464c76d713c07ad',65,'Business','yi7YCI9NH7TU1cbp5RLWGFRL'),(42,'user','sergey','25d55ad283aa400af464c76d713c07ad',0,'Business','k5UYHCpPaZoGwARFW8mQli4U'),(43,'user','alex','25d55ad283aa400af464c76d713c07ad',0,'Business','QnFfzjuXQffRcFjrVJeVu_Jd'),(44,'user','misha','25d55ad283aa400af464c76d713c07ad',0,'BSUIR','yG_Qslv3mHrO4F8KR30dMZFF'),(45,'user','petia','25d55ad283aa400af464c76d713c07ad',0,'BSUIR','Xbgpi3NBmD_d8qYJ48tuv2Sc'),(46,'user','dmitro','25d55ad283aa400af464c76d713c07ad',20,'BSUIR','n-Ih9mS6ISExSJaGZqNNpkgo'),(47,'user','fanat','25d55ad283aa400af464c76d713c07ad',235,'BSUIR','KY79ZNmCwtKCZJi5In71kP6t'),(48,'user','serega','25d55ad283aa400af464c76d713c07ad',0,'BSUIR','TlMzESnWKfRC-04y6jNmgDMz'),(49,'user','sergio','25d55ad283aa400af464c76d713c07ad',0,'BSUIR',NULL),(50,'user','cos','25d55ad283aa400af464c76d713c07ad',45,'BSUIR','EbDDtkZZLg3b9jsc8wc6CdsY'),(51,'user','ogre','25d55ad283aa400af464c76d713c07ad',0,'BSUIR','CEGD38uF-yjm_AWNfTpgn3Oo'),(52,'user','nikita','25d55ad283aa400af464c76d713c07ad',0,'BSUIR','nr5FoMc82sOt0QikfCZ0CzxG'),(53,'user','dmitrovka','25d55ad283aa400af464c76d713c07ad',10,'BSUIR','R51XTCc4DASajNbvzLukVdf9'),(54,'user','gemba','25d55ad283aa400af464c76d713c07ad',0,'BSUIR','fAXGmnDQiwdb4tLYwjZQL8bU'),(55,'user','sada','25d55ad283aa400af464c76d713c07ad',0,'BSU','4AQYajwWpeGlwt_rzi8Pae3G'),(56,'user','osip','25d55ad283aa400af464c76d713c07ad',0,'BSU','PtZV86XCNMmEA6lItK0qt0Co'),(57,'user','kostya','25d55ad283aa400af464c76d713c07ad',0,'BSU','dSRuLZ-iFquX8RK0KOpaF3xz'),(58,'user','andrey','25d55ad283aa400af464c76d713c07ad',20,'BSU','6V2Mn8cedu7xdoZY3n3UQ40p'),(59,'user','dasha','25d55ad283aa400af464c76d713c07ad',0,'BSU','NTWBK4Bc0ni-2MkfmyCHV8US'),(60,'user','sveta','25d55ad283aa400af464c76d713c07ad',30,'BSU',NULL),(61,'user','sasha','25d55ad283aa400af464c76d713c07ad',0,'BSU','REobhoVR4od0rHO7XF11h51x'),(62,'user','kris','25d55ad283aa400af464c76d713c07ad',0,'BSU','pLTtiKGQgDmh5UinCFJgvMIt'),(63,'user','ugu','25d55ad283aa400af464c76d713c07ad',0,'BSU',NULL),(64,'user','petroff','25d55ad283aa400af464c76d713c07ad',0,'CODERS','DFzH42YyuiB6F9pVKy0NiyGP'),(65,'user','barcelona','25d55ad283aa400af464c76d713c07ad',20,'CODERS','rDDjSLKTOWsiHKRfdpgIe5JO'),(66,'user','coca','25d55ad283aa400af464c76d713c07ad',55,'CODERS','uzOoz016Rm4wbFfbaTWgH71M'),(67,'user','cola','25d55ad283aa400af464c76d713c07ad',0,'CODERS','R1-knxlem5AUtb2jbp5eT8eZ'),(68,'user','dimoka','25d55ad283aa400af464c76d713c07ad',0,'CODERS','zBl-sYFKUABOPgNOEjk0zRiV'),(69,'user','phone','25d55ad283aa400af464c76d713c07ad',0,'CODERS',NULL),(70,'user','coder','25d55ad283aa400af464c76d713c07ad',5,'CODERS','igYBSKGmzl-PEpMd_qL0P0MP'),(71,'user','jser','25d55ad283aa400af464c76d713c07ad',0,'CODERS','cKfI-XssWq7OG_3rBEGMsOeQ'),(72,'user','better','25d55ad283aa400af464c76d713c07ad',0,'CODERS','9FepcqliqATvL7qBjOlEei8p'),(73,'user','vitalyi','25d55ad283aa400af464c76d713c07ad',0,'CODERS','3kA7gvjY8DPTBWdwVf3M6ghM'),(74,'user','kira','25d55ad283aa400af464c76d713c07ad',0,'CODERS','Mt4dMx1pggJvZU_ZczsAgb4E'),(75,'user','tanya','25d55ad283aa400af464c76d713c07ad',0,'DILLS','8lmG5Kiq66CgOGvUayORW_an'),(76,'user','katya','25d55ad283aa400af464c76d713c07ad',30,'CODERS','55e2Kbqn3x6LrisDhUD9vgyy'),(77,'user','vika','25d55ad283aa400af464c76d713c07ad',0,'DILLS',NULL),(78,'user','nastya','25d55ad283aa400af464c76d713c07ad',0,'CODERS','7EBg_b-M4JIb-zCkyKe4uPUP'),(79,'user','varya','25d55ad283aa400af464c76d713c07ad',40,'CODERS','UdMx8yHKK4ZL6KMuKiIgRbQ1'),(80,'user','rita','25d55ad283aa400af464c76d713c07ad',0,'DILLS','xWEQIWysPDzeEKBXKjn08ltp');
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
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchings`
--

LOCK TABLES `watchings` WRITE;
/*!40000 ALTER TABLE `watchings` DISABLE KEYS */;
INSERT INTO `watchings` VALUES (13,38,3),(15,50,3),(19,76,3),(24,60,3),(38,38,4),(39,79,4),(42,46,4),(43,58,4),(45,65,4),(47,66,4),(49,66,3),(54,38,5),(62,38,6),(73,41,5),(74,41,6),(77,38,7),(89,70,3),(93,38,8),(123,50,8),(138,47,4),(142,47,8),(143,47,7),(145,47,6),(147,47,5),(148,47,3),(150,38,9),(155,53,10),(156,38,10),(171,54,10);
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

-- Dump completed on 2016-04-20 16:33:31
