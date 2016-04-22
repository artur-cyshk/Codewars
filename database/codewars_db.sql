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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (3,60,3,'nice task','2016-04-20 10:28:28'),(4,38,3,'too easy','2016-04-20 10:34:19'),(5,38,3,'nice nice','2016-04-20 10:47:30'),(6,41,6,'nice','2016-04-20 12:35:25'),(7,38,7,'well well','2016-04-20 12:41:44'),(8,38,4,'my','2016-04-20 12:51:07'),(10,38,11,'nice','2016-04-22 13:21:32');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites_tasks`
--

LOCK TABLES `favorites_tasks` WRITE;
/*!40000 ALTER TABLE `favorites_tasks` DISABLE KEYS */;
INSERT INTO `favorites_tasks` VALUES (3,38,3),(4,66,4),(5,66,3),(6,38,11),(7,47,12),(8,38,13);
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
INSERT INTO `later_tasks` VALUES (1,38,11),(2,38,13);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (3,38,3),(4,66,4),(5,66,3),(6,38,11),(7,47,12),(8,38,13);
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
INSERT INTO `sessions` VALUES ('-yyofK0WedYmsXqY1lNerXBq6avO-Jlc',1461413841,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('0X6IShWL7y31YBMsLDt1PQCl-BlxsmJ7',1461414579,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('2nDcj8I1a90mf6AoZ88YSnrDqUR9G1ru',1461414558,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('2swlMYz9ZlOjFWYp_HsHPOef7PuHdVR2',1461417414,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('8kJLO1ApqoHBBV9fZQoohoV8Gxg0o8Tu',1461405592,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('AKUYh56MvqQbgUMrGEoUEzt7Nu_AZL3U',1461418166,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('BgDc99hfTw4xE2h550HhVhUmp8bDopqH',1461417824,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('C7yYj0SDndN9J94PlTcsv7QXMVnK5pa2',1461417414,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('Cj33VIEGpclosIMY5aO9XwDJ6ig7XtyR',1461418166,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('EbUb3P23keuyuUuUT-pF6_O_zYUmNpMg',1461418181,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"authorized\":true,\"userId\":40,\"currUserRole\":\"user\"}'),('HxOA4C86ECAtC_Fu-UF1BKLVlN_OjJ_I',1461414668,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('J2Fmxi_FN0QNxViTLdX6KWs6M4JOCniT',1461414543,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('LUWr60KhL6BPG4qkxK6ng1GW5cz-BlgQ',1461417824,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('MiYWYjSHaEmkn4I188wuDdhD-fBwEUPw',1461414558,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('PGIgf6f1SLOLWljNb1Tg_hZtyM5i8AFw',1461418166,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('SKOCecSFg0qiIoLuiGEoreA9EjYJ_HZM',1461414579,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('SXqEDif-ZhOyVXWkAOkZPUHx5hXN2uI0',1461414579,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('SutqDpq8OjGfdg82lh5swEiv3uFJTi2g',1461414558,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('ebttKTa-BfNdYs-l17wbHa_dQ_WWA6TY',1461414543,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('fZ29jGlQAZvefF4ZbUkLBQriL2oDm0Dw',1461406295,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('j0sJAKoo3Mo82_jCSmBW-gWxmUEYgW-i',1461406768,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"authorized\":true,\"userId\":70,\"currUserRole\":\"user\"}'),('mQi6dP1l4sp8KGDstopOjBEAs6CO_OLe',1461418156,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('nn_uJ652-kP1_v_xdG1j1RpSgrj-LsWf',1461414668,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('sblnF2OxWqZuiZWzbXctfWmnQEG-Vrag',1461416176,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('uNCdYfDFgEHwKRJHoKRxWJDzQgp0LBY9',1461414668,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('x9324jWcDH-en2seotfJfBblVD3wmrUa',1461418156,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}');
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solutions`
--

LOCK TABLES `solutions` WRITE;
/*!40000 ALTER TABLE `solutions` DISABLE KEYS */;
INSERT INTO `solutions` VALUES (7,38,3,'function sum() {\n  return Array.prototype.reduce.call (arguments, (sum, item) => sum + (item || 0) ) ;\n}','2016-04-20 10:33:49'),(15,38,5,'function add (a, b) {\n  var res = \'\', c = 0\n  a = a.split(\'\')\n  b = b.split(\'\')\n  while (a.length || b.length || c) {\n    c += ~~a.pop() + ~~b.pop()\n    res = c % 10 + res\n    c = c > 9\n  }\n  return res\n}','2016-04-20 12:14:22'),(17,38,6,'function isValidCoordinates(coordinates) {\n  return /^-?((90)|[0-8]\\d|\\d)(\\.\\d+)?,\\s-?((\\d\\d?)|(180)|[1][0-7]\\d)(\\.\\d+)?$/.test(coordinates);\n}','2016-04-20 12:33:14'),(19,38,7,'function rotate(array, n) {\n  n = n % array.length\n  return array.slice(-n).concat(array.slice(0, -n))\n}','2016-04-20 12:50:47'),(32,38,11,'function validSolution(board){\n  var n=board[0].length,start=0,end=3,startCol=0,endCol=3,i=0,j=0,allBoardsArray=[];\n  for(var k=0;k<n/3;k++){\n    for(var z=0;z<n/3;z++){\n      var oneBoard=[];\n      for(i=start;i<end;i++){\n        for(j=startCol;j<endCol;j++){\n            oneBoard.push(board[i][j]);\n        }\n      }\n      allBoardsArray.push(oneBoard);\n      startCol=j;\n      endCol=startCol+3;\n    }\n    startCol=0;\n    endCol=3;\n    start=i;\n    end=start+3;\n  }\n    \n    \n  for(var k=0;k<allBoardsArray[0].length;k++){\n    var numbers=\"123456789\";\n    for(var z=0;z<allBoardsArray[0].length;z++){\n      if(numbers.indexOf(allBoardsArray[k][z].toString())+1){\n        numbers=numbers.replace(allBoardsArray[k][z].toString(),\"\");\n      }\n    }\n    if(numbers.length!=0)\n      return false;\n  }\n  return true;\n}','2016-04-22 13:20:24'),(33,38,12,'function generateHashtag (str) {\n  return str.length > 140 || str === \'\' ? false :\n    \'#\' + str.split(\' \').map(capitalize).join(\'\');\n}\n\nfunction capitalize(str) {\n  return str.charAt(0).toUpperCase() + str.slice(1);\n}','2016-04-22 15:40:57'),(35,38,13,'function sumObj(sum,enumeratorFirst,enumeratorSecond) {\n  this.sum = sum;\n  this.first = enumeratorFirst;\n  this.second = enumeratorSecond;\n}\n\nvar maxZeroSequenceLength = function(arr) {\n  var lengthArray=[],max=0,first=0,second=0,finish=[];;\n  for(var i=0;i<arr.length;i++){\n    var sum=arr[i];\n    for(var j=i+1;j<arr.length;j++){\n      sum+=arr[j];\n      var myObj = new sumObj(sum,i,j);\n      lengthArray.push(myObj);\n    }\n  }\n  for(var i=0;i<lengthArray.length;i++){\n    if(lengthArray[i].sum==0){\n      if(max<=(lengthArray[i].second-lengthArray[i].first)){\n        max=lengthArray[i].second-lengthArray[i].first;\n        first=lengthArray[i].first;\n        second=lengthArray[i].second;\n      }\n    }\n  }\n  if(max==0)\n    return undefined;\n  for(var k=first;k<=second;k++){\n    finish.push(arr[k]);\n  }\n  return finish;\n}','2016-04-22 16:27:03'),(18,41,5,'function add (a, b) {\n  var length = Math.max(a.length, b.length);\n  var padding = [].concat.apply([], new Array(length)).map(function () { return \'0\'; }).join(\'\');\n\n  b = (padding + b).slice(-length).split(\'\');  \n  var result = (padding + a).slice(-length).split(\'\').reduceRight(function (acc, current, i) {\n    var sum = parseInt(current, 10) + parseInt(b[i], 10) + acc[1], digit = sum % 10;\n    return [digit + acc[0], (sum - digit) / 10];\n  }, [\'\', 0]);\n\n  return (result[1] || \'\') + result[0];\n}','2016-04-20 12:35:10'),(10,46,4,'function getInfo(n) {\n    return n.toString(2).match(/1/g).length % 2 ? \'It\\\'s Odious!\' : \'It\\\'s Evil!\';\n}','2016-04-20 11:49:27'),(27,47,3,'function sum() {\n  	return Array.prototype.reduce.call(arguments, function(value, item) {\n 		if(!item) {\n           item = 0;\n         }\n         return value + item;\n      })\n  }','2016-04-20 15:39:54'),(22,47,4,'getInfo = n => [\"It\'s Evil!\", \"It\'s Odious!\"][(n.toString(2).split(\"1\").length-1) & 1];','2016-04-20 15:34:00'),(26,47,5,'function add (a, b) {\n   var length = Math.max(a.length, b.length);\n   var padding = [].concat.apply([], new Array(length)).map(function () { return \'0\'; }).join(\'\');\n \n   b = (padding + b).slice(-length).split(\'\');  \n   var result = (padding + a).slice(-length).split(\'\').reduceRight(function (acc, current, i) {\n     var sum = parseInt(current, 10) + parseInt(b[i], 10) + acc[1], digit = sum % 10;\n     return [digit + acc[0], (sum - digit) / 10];\n   }, [\'\', 0]);\n \n   return (result[1] || \'\') + result[0];\n }','2016-04-20 15:36:10'),(25,47,6,'function isValidCoordinates(coordinates) {\n   return /^-?((90)|[0-8]\\d|\\d)(\\.\\d+)?,\\s-?((\\d\\d?)|(180)|[1][0-7]\\d)(\\.\\d+)?$/.test(coordinates);\n }','2016-04-20 15:35:55'),(24,47,7,'rotate = (array, n) => {\n  n = n% array.length;\n  return array.slice(-n).concat(array.slice(0, -n));\n}','2016-04-20 15:35:14'),(34,47,12,'function generateHashtag (str) {\n  if(str.length == 0)\n    return false;\n  str = str.split(\" \");\n  for(var i = 0; i < str.length; i++)\n    str[i] = str[i].charAt(0).toUpperCase() + 		str[i].slice(1).toLowerCase();\n  str.unshift(\"#\");\n  str = str.join(\"\");\n  if(str.length > 140)\n    return false;\n  return str;\n}','2016-04-22 15:57:36'),(4,50,3,'function sum() {\n  	var res = 0;\n	for (var i=0; i < arguments.length; i++) {  \n      if ((typeof arguments[i]) == \"number\") {\n           res += arguments[i];\n      }      \n    }\n  return res;\n}','2016-04-19 22:35:42'),(11,58,4,'\'use strict\'\nfunction getInfo(n) {\n  let k = 0;\n  for(;n > 0; n = n >> 1)\n    k += n & 1;\n  \n  return k % 2 === 1 ? \"It\'s Odious!\" : \"It\'s Evil!\"\n}','2016-04-20 11:50:25'),(6,60,3,'function sum(){\n  return Array.prototype.reduce.call(arguments, function(val, item){\n    return val + (item || 0);\n  })\n}\n','2016-04-20 10:32:31'),(12,65,4,'const getInfo = n => `It\'s ${n.toString(2).split(\"\").filter(bit => bit == \"1\").length % 2 ? \"Odious\" : \"Evil\"}!`;','2016-04-20 11:51:23'),(14,66,3,'function sum (){\n  return Array.prototype.reduce.call(arguments, (value, item) => value + (item || 0));\n}','2016-04-20 11:54:49'),(13,66,4,'function getInfo(n) {\n  number = n.toString(2);\n  count = 0;\n for(var i = 0; i<number.length; i++){\n   if(number[i]==\"1\") count++\n }\n \n \n   if(count%2==0)\n    return \"It\'s Evil!\"; \n   else \n    return \"It\'s Odious!\";\n}','2016-04-20 11:51:58'),(5,76,3,'function sum() {\n 	return Array.prototype.reduce.call(arguments, function(value, item) {\n		if(!item) {\n          item = 0;\n        }\n        return value + item;\n     })\n }','2016-04-19 22:44:31'),(9,79,4,'function getInfo(n) {\n   return (n.toString(2).split(\'\').filter( (item) => item == 1).length % 2) ? \"It\'s Odious!\" : \"It\'s Evil!\";\n }','2016-04-20 11:48:38');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (3,39,'Function params sum',3,'<p>Function must return sum of params</p>\n<p><span style=\"color: #ff0000;\">for example :&nbsp;</span></p>\n<ol>\n<li>sum(1,2,3) = 6</li>\n<li>sum(undefined, 2, 5) = 7</li>\n<li>sum(0,0,2.5) = 2.5</li>\n</ol>',1,'2016-04-22 13:07:56','sum'),(4,38,'Evil or Odious',2,'<p>The number n is <strong>Evil</strong> if it has an even number of 1\'s in its binary expansion.<br />First ten: 3, 5, 6, 9, 10, 12, 15, 17, 18, 20<br /><br />The number n is <strong>Odious</strong> if it has an odd number of 1\'s in its binary expansion.<br />First ten: 1, 2, 4, 7, 8, 11, 13, 14, 16, 19<br /><br />You have to write a function that determine if a number is Evil of Odious, function should return \"It\'s Evil!\" in case of evil number and \"It\'s Odious!\" in case of odious number.</p>\n<p>good luck :)</p>',1,'2016-04-22 13:03:41','getInfo'),(5,66,'Adding Big Numbers',6,'<p>We need to sum big numbers and we require your help.</p>\n<p>Write a function that returns the sum of two numbers. The input numbers are strings and the function must return a string.</p>\n<h2><strong>Example</strong></h2>\n<ul>\n<li>add(\"123\", \"321\"); -&gt; \"444\"</li>\n<li>add(\"11\", \"99\"); -&gt; \"110\"</li>\n</ul>\n<h2>Notes</h2>\n<ul>\n<li>The input numbers are <em>big</em>.</li>\n<li>The input is a string of only digits</li>\n<li>The numbers are positives</li>\n</ul>',1,'2016-04-22 13:07:40','add'),(6,50,'Coordinates Validator',7,'<p>You need to create a function that will validate if given parameters are valid geographical coordinates.</p>\n<p>Valid coordinates look like the following: <strong>\"23.32353342, -32.543534534\"</strong>. The return value should be either <strong>true</strong> or <strong>false</strong>.</p>\n<p>Latitude (which is first float) can be between 0 and 90, positive or negative. Longitude (which is second float) can be between 0 and 180, positive or negative.</p>\n<p>Coordinates can only contain digits, or one of the following symbols (including space after comma) <strong>-, .</strong></p>\n<p>There should be no space between the minus \"-\" sign and the digit after it.</p>\n<p>Here are some valid coordinates:</p>\n<ul>\n<li>-23, 25</li>\n<li>24.53525235, 23.45235</li>\n<li>04, -23.234235</li>\n<li>43.91343345, 143</li>\n<li>4, -3</li>\n</ul>\n<p>And some invalid ones:</p>\n<ul>\n<li>23.234, - 23.4234</li>\n<li>2342.43536, 34.324236</li>\n<li>N23.43345, E32.6457</li>\n<li>99.234, 12.324</li>\n<li>6.325624, 43.34345.345</li>\n<li>0, 1,2</li>\n<li>0.342q0832, 1.2324</li>\n</ul>',1,'2016-04-20 12:26:11','isValidCoordinates'),(7,41,'Rotate Array',4,'<p>Create a function named \"rotate\" that takes an array and returns a new one with the elements inside rotated n spaces.</p>\n<p>If n is greater than 0 it should rotate the array to the right. If n is less than 0 it should rotate the array to the left. If n is 0, then it should return the array unchanged.</p>\n<p><span style=\"color: #993300;\">Example:</span></p>\n<p>var data = [1, 2, 3, 4, 5];</p>\n<ul>\n<li>rotate(data, 0) // =&gt; [1, 2, 3, 4, 5]</li>\n<li>rotate(data, 5) // =&gt; [1, 2, 3, 4, 5]</li>\n<li>rotate(data, 4) // =&gt; [2, 3, 4, 5, 1]</li>\n<li>rotate(data, 3) // =&gt; [3, 4, 5, 1, 2]</li>\n<li>rotate(data, 2) // =&gt; [4, 5, 1, 2, 3]</li>\n<li>rotate(data, 1) // =&gt; [5, 1, 2, 3, 4]</li>\n<li>rotate(data, -1) // =&gt; [2, 3, 4, 5, 1]</li>\n<li>rotate(data, -2) // =&gt; [3, 4, 5, 1, 2]</li>\n<li>rotate(data, -3) // =&gt; [4, 5, 1, 2, 3]</li>\n<li>rotate(data, -4) // =&gt; [5, 1, 2, 3, 4]</li>\n<li>rotate(data, -5) // =&gt; [1, 2, 3, 4, 5]</li>\n</ul>\n<p>Furthermore the method should take ANY array of objects and perform this operation on them:</p>\n<ul>\n<li>rotate([\'a\', \'b\', \'c\'], 1) // =&gt; [\'c\', \'a\', \'b\']</li>\n<li>rotate([1.0, 2.0, 3.0], 1) // =&gt; [3.0, 1.0, 2.0]</li>\n<li>rotate([true, true, false], 1) // =&gt; [false, true, true]</li>\n</ul>\n<p>&nbsp;</p>\n<p>Finally the rotation shouldn\'t be limited by the indices available in the array. Meaning that if we exceed the indices of the array it keeps rotating.</p>\n<p><span style=\"color: #993300;\">Example:</span></p>\n<p>var data = [1, 2, 3, 4, 5]</p>\n<ul>\n<li>rotate(data, 7) // =&gt; [4, 5, 1, 2, 3]</li>\n<li>rotate(data, 11) // =&gt; [5, 1, 2, 3, 4]</li>\n<li>rotate(data, 12478) // =&gt; [3, 4, 5, 1, 2]</li>\n</ul>',1,'2016-04-22 13:06:11','rotate'),(11,70,'Sudoku Solution Validator',6,'<p>Description:</p>\n<p>Sudoku Background</p>\n<p>Sudoku is a game played on a 9x9 grid. The goal of the game is to fill all cells of the grid with digits from 1 to 9, so that each column, each row, and each of the nine 3x3 sub-grids (also known as blocks) contain all of the digits from 1 to 9. <br />(More info at: http://en.wikipedia.org/wiki/Sudoku)</p>\n<p>Sudoku Solution Validator</p>\n<p>Write a function validSolution that accepts a 2D array representing a Sudoku board, and returns true if it is a valid solution, or false otherwise. The cells of the sudoku board may also contain 0\'s, which will represent empty cells. Boards containing one or more zeroes are considered to be invalid solutions.</p>\n<p><span style=\"color: #993300;\">Examples:</span></p>\n<ul>\n<li>validSolution([[5, 3, 4, 6, 7, 8, 9, 1, 2], <br /> [6, 7, 2, 1, 9, 5, 3, 4, 8],<br /> [1, 9, 8, 3, 4, 2, 5, 6, 7],<br /> [8, 5, 9, 7, 6, 1, 4, 2, 3],<br /> [4, 2, 6, 8, 5, 3, 7, 9, 1],<br /> [7, 1, 3, 9, 2, 4, 8, 5, 6],<br /> [9, 6, 1, 5, 3, 7, 2, 8, 4],<br /> [2, 8, 7, 4, 1, 9, 6, 3, 5],<br /> [3, 4, 5, 2, 8, 6, 1, 7, 9]])</li>\n</ul>\n<p><span style=\"color: #993300;\">//Example 1 should return true</span></p>\n<ul>\n<li>validSolution([[5, 3, 4, 6, 7, 8, 9, 1, 2], <br /> [6, 7, 2, 1, 9, 0, 3, 4, 8],<br /> [1, 0, 0, 3, 4, 2, 5, 6, 0],<br /> [8, 5, 9, 7, 6, 1, 0, 2, 0],<br /> [4, 2, 6, 8, 5, 3, 7, 9, 1],<br /> [7, 1, 3, 9, 2, 4, 8, 5, 6],<br /> [9, 0, 1, 5, 3, 7, 2, 1, 4],<br /> [2, 8, 7, 4, 1, 9, 6, 3, 5],<br /> [3, 0, 0, 4, 8, 1, 1, 7, 9]])</li>\n</ul>\n<p><span style=\"color: #993300;\">//Example 2 should returns false</span></p>',1,'2016-04-22 13:19:27','validSolution'),(12,50,'The Hashtag Generator',4,'<h3 class=\"mtn\">Description:</h3>\n<div id=\"description\" class=\"markdown\">\n<p>The marketing team are spending way too much time typing in hashtags.<br />Let\'s help them with out own Hashtag Generator!</p>\n<p>Here\'s the deal:</p>\n<ul>\n<li>If the final result is longer than 140 chars it must return false.</li>\n<li>If the input is a empty string it must return false.</li>\n<li>It must start with a hashtag (#).</li>\n<li>All words must have their first letter capitalized.</li>\n</ul>\n<p>Example Input to Output:</p>\n<p>\" Hello there thanks for trying my Kata\" =&gt; \"#HelloThereThanksForTryingMyKata\"</p>\n<p>\" Hello World \" =&gt; \"#HelloWorld\"</p>\n</div>',1,'2016-04-22 15:40:52','generateHashtag'),(13,68,'Longest sequence with zero sum',4,'<p>Description:</p>\n<p>Write a method which takes an array of integers (positive and negative) and returns the longest contiguous sequence in this array, which total sum of elements equal 0.</p>\n<p>For example:<br />maxZeroSequenceLength([25, -35, 12, 6, 92, -115, 17, 2, 2, 2, -7, 2, -9, 16, 2, -11])</p>\n<p>Should return [92, -115, 17, 2, 2, 2], because this is the longest zero-sum sequence in the array.</p>',1,'2016-04-22 16:27:20','maxZeroSequenceLength');
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
INSERT INTO `tasks_types` VALUES (73,3),(77,3),(78,3),(81,3),(95,3),(105,3),(76,4),(95,4),(100,4),(73,5),(76,5),(77,5),(81,5),(95,5),(103,5),(105,5),(79,6),(89,6),(78,7),(73,11),(77,11),(78,11),(81,11),(94,11),(95,11),(104,11),(105,11),(76,12),(90,12),(73,13),(77,13),(78,13),(81,13),(92,13),(95,13);
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
) ENGINE=InnoDB AUTO_INCREMENT=824 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
INSERT INTO `tests` VALUES (128,6,'[{\"value\":\"\\\"-23, 25\\\"\"}]','true'),(129,6,'[{\"value\":\"\\\"4, -3\\\"\"}]','true'),(130,6,'[{\"value\":\"\\\"24.53525235, 23.45235\\\"\"}]','true'),(131,6,'[{\"value\":\"\\\"04, -23.234235\\\"\"}]','true'),(132,6,'[{\"value\":\"\\\"43.91343345, 143\\\"\"}]','true'),(133,6,'[{\"value\":\"\\\"23.234, - 23.4234\\\"\"}]','false'),(134,6,'[{\"value\":\"\\\"2342.43536, 34.324236\\\"\"}]','false'),(135,6,'[{\"value\":\"\\\"N23.43345, E32.6457\\\"\"}]','false'),(136,6,'[{\"value\":\"\\\"0.342q0832, 1.2324\\\"\"}]','false'),(649,4,'[{\"value\":\"1\"}]','\"It\'s Odious!\"'),(650,4,'[{\"value\":\"2\"}]','\"It\'s Odious!\"'),(651,4,'[{\"value\":\"3\"}]','\"It\'s Evil!\"'),(652,4,'[{\"value\":\"119\"}]','\"It\'s Evil!\"'),(653,4,'[{\"value\":\"160\"}]','\"It\'s Evil!\"'),(654,4,'[{\"value\":\"90\"}]','\"It\'s Evil!\"'),(655,4,'[{\"value\":\"54\"}]','\"It\'s Evil!\"'),(656,4,'[{\"value\":\"114\"}]','\"It\'s Evil!\"'),(657,4,'[{\"value\":\"78\"}]','\"It\'s Evil!\"'),(658,4,'[{\"value\":\"127\"}]','\"It\'s Odious!\"'),(659,4,'[{\"value\":\"148\"}]','\"It\'s Odious!\"'),(660,4,'[{\"value\":\"16\"}]','\"It\'s Odious!\"'),(661,4,'[{\"value\":\"127\"}]','\"It\'s Odious!\"'),(662,4,'[{\"value\":\"107\"}]','\"It\'s Odious!\"'),(679,7,'[{\"value\":\"[1, 2, 3, 4, 5]\"},{\"value\":\"1\"}]','[5, 1, 2, 3, 4]'),(680,7,'[{\"value\":\"[1, 2, 3, 4, 5]\"},{\"value\":\"2\"}]','[4, 5, 1, 2, 3]'),(681,7,'[{\"value\":\"[1, 2, 3, 4, 5]\"},{\"value\":\"3\"}]','[3, 4, 5, 1, 2]'),(682,7,'[{\"value\":\"[1, 2, 3, 4, 5]\"},{\"value\":\"4\"}]','[2, 3, 4, 5, 1]'),(683,7,'[{\"value\":\"[1, 2, 3, 4, 5]\"},{\"value\":\"5\"}]','[1, 2, 3, 4, 5]'),(684,7,'[{\"value\":\"[\\\"a\\\",\\\"b\\\",\\\"c\\\",\\\"d\\\",\\\"e\\\"]\"},{\"value\":\"4\"}]','[\"b\",\"c\",\"d\",\"e\",\"a\"]'),(685,7,'[{\"value\":\"[\\\"a\\\",\\\"b\\\",\\\"c\\\",\\\"d\\\",\\\"e\\\"]\"},{\"value\":\"-4\"}]','[\"e\",\"a\",\"b\",\"c\",\"d\"]'),(686,7,'[{\"value\":\"[\\\"a\\\",\\\"b\\\",\\\"c\\\",\\\"d\\\",\\\"e\\\"]\"},{\"value\":\"24\"}]','[\"b\",\"c\",\"d\",\"e\",\"a\"]'),(698,5,'[{\"value\":\"\\\"91\\\"\"},{\"value\":\"\\\"19\\\"\"}]','110'),(699,5,'[{\"value\":\"\\\"123456789\\\"\"},{\"value\":\"\\\"987654322\\\"\"}]','1111111111'),(700,5,'[{\"value\":\"\\\"999999999\\\"\"},{\"value\":\"\\\"1\\\"\"}]','1000000000'),(701,5,'[{\"value\":\"\\\"887450\\\"\"},{\"value\":\"\\\"54124\\\"\"}]','941574'),(702,5,'[{\"value\":\"\\\"50685\\\"\"},{\"value\":\"\\\"292067\\\"\"}]','342752'),(703,5,'[{\"value\":\"\\\"34431\\\"\"},{\"value\":\"\\\"968640\\\"\"}]','1003071'),(704,5,'[{\"value\":\"\\\"823094582094385190384102934810293481029348123094818923749817\\\"\"},{\"value\":\"\\\"234758927345982475298347523984572983472398457293847594193837\\\"\"}]','1057853509440367665682450458794866464501746580388666517943654'),(705,5,'[{\"value\":\"\\\"234859234758913759182357398457398474598237459823745928347538\\\"\"},{\"value\":\"\\\"987429134712934876249385134781395873198472398562384958739845\\\"\"}]','1222288369471848635431742533238794347796709858386130887087383'),(706,5,'[{\"value\":\"\\\"854694587458967459867923420398420394845873945734985374844444\\\"\"},{\"value\":\"\\\"333333333333439439483948394839834938493843948394839432322229\\\"\"}]','1188027920792406899351871815238255333339717894129824807166673'),(707,5,'[{\"value\":\"\\\"666666665656566666666565656666666656565666666665656566666666\\\"\"},{\"value\":\"\\\"464646464646464644646464646464646464646464646463463463463466\\\"\"}]','1131313130303031311313030303131313121212131313129120030130132'),(708,5,'[{\"value\":\"\\\"987429134712934876249385134781395873198472398562384958739845234859234758913759182357398457398474598237459823745928347538\\\"\"},{\"value\":\"\\\"835743829547328954732895474893754893753281957319857432958432548937859483265893274891378593187431583942678439217431924789\\\"\"}]','1823172964260263830982280609675150766951754355882242391698277783797094242179652457248777050585906182180138262963360272327'),(709,3,'[{\"value\":\"1\"},{\"value\":\"2\"},{\"value\":\"3\"}]','6'),(710,3,'[{\"value\":\"2\"},{\"value\":\"2\"},{\"value\":\"2\"}]','6'),(711,3,'[{\"value\":\"0\"},{\"value\":\"0\"},{\"value\":\"0\"},{\"value\":\"0\"},{\"value\":\"1\"}]','1'),(712,3,'[{\"value\":\"1\"},{\"value\":\"0\"},{\"value\":\"1\"},{\"value\":\"0\"},{\"value\":\"1\"}]','3'),(713,3,'[{\"value\":\"0\"},{\"value\":\"7\"}]','7'),(714,3,'[{\"value\":\"9\"},{\"value\":\"9\"},{\"value\":\"1\"}]','19'),(715,3,'[{\"value\":\"2.5\"},{\"value\":\"3\"},{\"value\":\"1.5\"}]','7'),(716,3,'[{\"value\":\"5\"},{\"value\":\"5\"},{\"value\":\"0\"}]','10'),(717,3,'[{\"value\":\"0\"},{\"value\":\"0\"},{\"value\":\"0\"},{\"value\":\"0\"},{\"value\":\"undefined\"}]','0'),(760,11,'[{\"value\":\"[[5, 3, 4, 6, 7, 8, 9, 1, 2],      [6, 7, 2, 1, 9, 5, 3, 4, 8],     [1, 9, 8, 3, 4, 2, 5, 6, 7],     [8, 5, 9, 7, 6, 1, 4, 2, 3],     [4, 2, 6, 8, 5, 3, 7, 9, 1],     [7, 1, 3, 9, 2, 4, 8, 5, 6],     [9, 6, 1, 5, 3, 7, 2, 8, 4],     [2, 8, 7, 4, 1, 9, 6, 3, 5],     [3, 4, 5, 2, 8, 6, 1, 7, 9]]\"}]','true'),(761,11,'[{\"value\":\"[[5, 3, 4, 6, 7, 8, 9, 1, 2],      [6, 7, 2, 1, 9, 0, 3, 4, 8],     [1, 0, 0, 3, 4, 2, 5, 6, 0],     [8, 5, 9, 7, 6, 1, 0, 2, 0],     [4, 2, 6, 8, 5, 3, 7, 9, 1],     [7, 1, 3, 9, 2, 4, 8, 5, 6],     [9, 0, 1, 5, 3, 7, 2, 1, 4],     [2, 8, 7, 4, 1, 9, 6, 3, 5],     [3, 0, 0, 4, 8, 1, 1, 7, 9]]\"}]','false'),(762,11,'[{\"value\":\"[[1, 2, 3, 4, 5, 6, 7, 8, 9],     [1, 2, 3, 4, 5, 6, 7, 8, 9],     [1, 2, 3, 4, 5, 6, 7, 8, 9],     [1, 2, 3, 4, 5, 6, 7, 8, 9],     [1, 2, 3, 4, 5, 6, 7, 8, 9],     [1, 2, 3, 4, 5, 6, 7, 8, 9],     [1, 2, 3, 4, 5, 6, 7, 8, 9],     [1, 2, 3, 4, 5, 6, 7, 8, 9],     [1, 2, 3, 4, 5, 6, 7, 8, 9]]\"}]','false'),(763,11,'[{\"value\":\"[[8, 2, 6, 3, 4, 7, 5, 9, 1],     [7, 3, 5, 8, 1, 9, 6, 4, 2],     [1, 9, 4, 2, 6, 5, 8, 7, 3],     [3, 1, 7, 5, 8, 4, 2, 6, 9],     [6, 5, 9, 1, 7, 2, 4, 3, 8],     [4, 8, 2, 9, 3, 6, 7, 1, 5],     [9, 4, 8, 7, 5, 1, 3, 2, 6],     [5, 6, 1, 4, 2, 3, 9, 8, 7],     [2, 7, 3, 6, 9, 8, 1, 5, 4]]\"}]','true'),(764,11,'[{\"value\":\"[[1, 2, 6, 3, 4, 7, 5, 9, 8],     [7, 3, 5, 8, 1, 9, 6, 4, 2],     [1, 9, 4, 2, 7, 5, 8, 6, 3],     [3, 1, 7, 5, 8, 4, 2, 6, 9],     [7, 5, 9, 1, 6, 2, 4, 3, 8],     [4, 8, 2, 9, 3, 6, 7, 1, 5],     [1, 4, 8, 7, 5, 9, 3, 2, 6],     [5, 6, 1, 4, 2, 3, 9, 8, 7],     [2, 7, 3, 6, 9, 1, 8, 5, 4]]\"}]','false'),(765,11,'[{\"value\":\"[[1, 2, 3, 4, 5, 6, 7, 8, 9],    [2, 3, 1, 5, 6, 4, 8, 9, 7],    [3, 1, 2, 6, 4, 5, 9, 7, 8],    [4, 5, 6, 7, 8, 9, 1, 2, 3],    [5, 6, 4, 8, 9, 7, 2, 3, 1],    [6, 4, 5, 9, 7, 8, 3, 1, 2],    [7, 8, 9, 1, 2, 3, 4, 5, 6],    [8, 9, 7, 2, 3, 1, 5, 6, 4],    [9, 7, 8, 3, 1, 2, 6, 4, 5]]\"}]','false'),(808,12,'[{\"value\":\"\\\"\\\"\"}]','false'),(809,12,'[{\"value\":\"\\\"Codewars      \\\"\"}]','\"#Codewars\"'),(810,12,'[{\"value\":\"\\\"Codewars\\\"\"}]','\"#Codewars\"'),(811,12,'[{\"value\":\"\\\"From Lovers To Lovers\\\"\"}]','\"#FromLoversToLovers\"'),(812,12,'[{\"value\":\"\\\"Codewars Is Nice\\\"\"}]','\"#CodewarsIsNice\"'),(813,12,'[{\"value\":\"\\\"Looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong Cat\\\"\"}]','false'),(819,13,'[{\"value\":\"[ 1, 2, -3, 7, 8, -16 ]\"}]','[ 1, 2, -3 ]'),(820,13,'[{\"value\":\"[ 25, -35, 12, 6, 92, -115, 17, 2, 2, 2, -7, 2, -9, 16, 2, -11 ]\"}]','[ 92, -115, 17, 2, 2, 2 ]'),(821,13,'[{\"value\":\"[ 49, -57, -70, -64, 56, 12, -76, -97, -88, 13, 49, -54, 37, -93, -21, 74, -78, 16, -3, -74, 50, 50, 87, 97, -98, 15, 6, -26, 95, -37, 86, -62, -49, 3, 98, 32, -90, 3, 18, 43, -39, -64, 12, 10, 49, -31, 28, -94, -12, -41, 90, 86, 75, 18, 15, -96, -4, -39, -50, 46, -2, 16, 89, 47, -12, 21, 52, 35, -68, 42, -100, 93, 4, -86, 26, -56, 73, 55, 36, -20, -40, -74, 78, -19, 79, 93, 51, -87, 97, -46, -63, -88, -57, 16, -78, -9, -78, 94, -72, 46, -20, 59, -89, -99, 6, -86, 3, -90, -25, 16, 31, -48, 87, 26, -69, -22, 23, 37, -47, -92, -59, -52, -36, -23, 74, -14, -83, -47, 56, 5, -8, 53, -55, 51, 58, -25, 10, 46, 88, -97, 46, -73, -5, 6, -22, 0, 65, 53, 90, 83, 7, 62, -92, 21, -27, -96, 89, -46, -64, 35, 23, 69, 83, -95, -95, 97, -84, -53, 48, -73, 11, -80, 67, -35, 1, 60, 83, -69, -45, -5, -46, 52, -65, 65, -86, -99, 57, 5, -51, -89, 8, 87, -39, -77, 20, 90, -55, -15, 3, 47, 13, -16, 65, 40, -39, -96, 98, 38, 78, -50, 42, -13, -40, -39, -35, 5, -46, 11, -3, 25, -100, -18, -86, 82, 28, -14, -88, 82, 57, 25, 1, -68, -50, 38, -65, -79, 42, -14, 97, 57, 74, 21, -11, 5, -63, 42, 61, -85, 27, 98, 16, 18, -97, 82, 77, -38, -75, -25, 41, -71, 68, 64, 69, 89, 84, -33, -43, -63, -65, 59, 49, -38, -41, -91, 45, 90, 22, 60, 63, -99, -20, 58, 80, -33, -67, -47, -97, -58, 29, 5, -38, -32, -22, 57, -38, 15, 48, 9, -23, 64, -94, -75, -20, 18, -99, -36, -27, -65, -55, 74, -27, 19, -75, -6, -77, -49, 32, 30, 53, -34, -19, 57, -24, -100, 8, -6, -72, -52, -16, -88, 66, -29, -42, 81, 28, -83, 58, -36, 11, 12, -97, 77, -79, 8, 86, -13, -35, -41, 11, -58, 23, 50, 41, -23, -1, 20, 39, -48, 94, -19, -38, -99, -63, 55, -21, 71, -59, 44, 72, 25, -38, -31, 38, -53, -40, 9, -21, -25, 87, -25, -49, 28, 20, 33, -87, 29, -27, 36, -62, -24, 85, 61, 43, 96, 90, 94, 85, 61, 20, -71, 9, -6, 39, 99, -35, -52, -85, -86, -53, -66, 16, -96, -94, 36, 85, -61, -5, 61, -47, 87, -76, -72, 77, 27, -22, 36, -51, -66, -98, -18, 6, 62, -26, 97, -13, 20, -82, 53, 82, 97, -96, -57, 87, 93, -62, -1, -40, 21, 63, 31, -53, 94, 21, -73, -47, -87, -27, 20, -80, -63, 71, -14, 98, 44, -47, 74, 42, -96, 5, 41, -57, 60, -82, 82, -32, -94, 78, -53, 51, 23, -67, -100, -57, -11, 92, -99, -35, 43, 21, -19, 62, 47, 0, 34, 25, 45, 0, 68, -44, -43, 5, -30, -56, -84, 49, 3, -5, 62, 95, -35, 92, -24, -38, 11, -38, 37, -18, -71, -64, -35, -39, -70, 43, -59, -86, -68, 55, -18, 67, 28, 23, -52, -14, 19, -20, -37, -84, 92, -82, -84, 74, -58, -77, -80, 1, -92, 14, -62, 92, -79, 88, 37, -43, -61, 76, -57, -64, 91, 75, -42, 15, -13, -4, -93, 69, -87, 38, 78, 84, -89, 82, 88, 17, 77, -23, 99, 97, -68, 23, 23, -27, -21, 94, 44, -17, -95, -58, -40, -51, 42, 75, 85, 90, 13, 60, -96, 75, -98, 33, 16, 10, 69, -14, 23, -46, 48, 92, 81, 2, 65, 82, -6, 26, 41, -2, -60, -95, 82, -16, -59, -100, -73, 1, -91, 50, 72, 59, 44, 33, 73, 41, -35, -43, 63, 1, -57, -97, -14, -10, 27, -7, -90, -81, 84, -19, -24, 57, -63, -17, -42, -90, 58, 18, -71, 32, -5, -6, -81, -84, -8, -68, -62, 99, -20, -18, -9, 56, -13, -29, -16, -15, -28, -74, -86, -16, 71, 79, -93, -47, 99, -34, -5, -18, 35, -44, -10, -30, -42, 87, 99, -53, -62, 43, 11, 62, -20, -100, 16, -80, -75, -82, 28, 82, -95, 70, 87, -59, 47, -70, -12, -11, 74, 14, -46, -19, 4, -83, 14, 36, -95, -88, 99, -91, -60, -47, -88, 61, 32, 3, -32, -28, -48, -29, 51, 29, 36, 82, 96, 32, 52, 31, -33, 60, -18, -17, -96, -10, -84, -27, -27, -25, -16, 80, -30, 71, 22, 87, -4, -13, -77, 98, 98, 81, -97, 95, 53, -90, -95, -40, -56, 15, 14, 55, -100, 13, 0, -88, -61, -13, 96, -4, -87, -15, 87, -17, -86, -55, -58, -78, 26, 53, 8, -62, -21, 69, -70, -4, 58, 19, -48, -7, -2, 68, 89, 5, -90, 58, 85, 17, -70, -76, 91, 73, 71, 77, -87, -64, -80, 3, 1, -84, 51, -70, -11, 55, -15, 98, 78, 2, 89, -20, 26, -96, -23, 11, -84, 6, 20, -74, -4, 99, 67, 71, 94, -51, -80, 78, -100, 42, 45, -6, -80, -25, -96, -29, 10, 98, 4, 92, -57, 75, -41, -55, 76, -20, 69, -76, -96, 79, -50, 68, -78, -81, 86, 51, -74, -72, -60, -34, -44, -30, -3, -22, 63, -71, 12, 87, -32, -65, 31, 95, -69, 89, 91, 89, -47, -91, -26, -37, 53, 69, -69, 88, 56, 12, 80, -14, -86, 45, 33, 1, -90, 51, 82, 1, 19, 38, -9, 28, 4, -52, -97, -45, 80, -58, 26, -20, 39, 79, -55, 7, -29, 3, -5, -91, -58, -59, -31, 88, 73, -38, -21, 22, -59, -57, 25, -75, -5, 34, 77, -34, -49, -67, -13, -13, 53, 17, 85, 83, 55, -21, 40, 59, 58, 61, -15, -13, 55, 55, 43, 25, 61, 29, -40, -29, -41, -87, -49, -88, 62, 31, -95, 51, 95, -63, 34, 3, 65, 20, -63, 29, 74, 92, -89, 62, 89, -53, 19, 25, 62 ]\"}]','[ -92, 14, -62, 92, -79, 88, 37, -43, -61, 76, -57, -64, 91, 75, -42, 15, -13, -4, -93, 69, -87, 38, 78, 84, -89, 82, 88, 17, 77, -23, 99, 97, -68, 23, 23, -27, -21, 94, 44, -17, -95, -58, -40, -51, 42, 75, 85, 90, 13, 60, -96, 75, -98, 33, 16, 10, 69, -14, 23, -46, 48, 92, 81, 2, 65, 82, -6, 26, 41, -2, -60, -95, 82, -16, -59, -100, -73, 1, -91, 50, 72, 59, 44, 33, 73, 41, -35, -43, 63, 1, -57, -97, -14, -10, 27, -7, -90, -81, 84, -19, -24, 57, -63, -17, -42, -90, 58, 18, -71, 32, -5, -6, -81, -84, -8, -68, -62, 99, -20, -18, -9, 56, -13, -29, -16, -15, -28, -74, -86, -16, 71, 79, -93, -47, 99, -34, -5, -18, 35, -44, -10, -30, -42, 87, 99, -53, -62, 43, 11, 62, -20, -100, 16, -80, -75, -82, 28, 82, -95, 70, 87, -59, 47, -70, -12, -11, 74, 14, -46, -19, 4, -83, 14, 36, -95, -88, 99, -91, -60, -47, -88, 61, 32, 3, -32, -28, -48, -29, 51, 29, 36, 82, 96, 32, 52, 31, -33, 60, -18, -17, -96, -10, -84, -27, -27, -25, -16, 80, -30, 71, 22, 87, -4, -13, -77, 98, 98, 81, -97, 95, 53, -90, -95, -40, -56, 15, 14, 55, -100, 13, 0, -88, -61, -13, 96, -4, -87, -15, 87, -17, -86, -55, -58, -78, 26, 53, 8, -62, -21, 69, -70, -4, 58, 19, -48, -7, -2, 68, 89, 5, -90, 58, 85, 17, -70, -76, 91, 73, 71, 77, -87, -64, -80, 3, 1, -84, 51, -70, -11, 55, -15, 98, 78, 2, 89, -20, 26, -96, -23, 11, -84, 6, 20, -74, -4, 99, 67, 71, 94, -51, -80, 78, -100, 42, 45, -6, -80, -25, -96, -29, 10, 98, 4, 92, -57, 75, -41, -55, 76, -20, 69, -76, -96, 79, -50, 68, -78, -81, 86, 51, -74, -72, -60, -34, -44, -30, -3, -22, 63, -71, 12, 87, -32, -65, 31, 95, -69, 89, 91, 89, -47, -91, -26, -37, 53, 69, -69, 88, 56, 12, 80, -14, -86, 45, 33, 1, -90, 51, 82, 1, 19, 38, -9, 28, 4, -52, -97, -45, 80, -58, 26, -20, 39, 79, -55, 7, -29, 3, -5, -91, -58, -59, -31, 88, 73, -38, -21, 22, -59, -57, 25, -75, -5, 34, 77, -34, -49, -67, -13, -13, 53, 17, 85, 83, 55, -21, 40, 59, 58, 61, -15, -13, 55, 55, 43, 25, 61, 29, -40, -29, -41, -87, -49, -88, 62, 31, -95, 51, 95, -63, 34, 3, 65, 20, -63, 29 ]'),(822,13,'[{\"value\":\"[ 1, 2, -3, 7, 8, -16 ]\"}]','[ 1, 2, -3 ]'),(823,13,'[{\"value\":\"[ 25, -35, 12, 6, 92, -115, 17, 2, 2, 2, -7, 2, -9, 16, 2, -11 ]\"}]','[ 92, -115, 17, 2, 2, 2 ]');
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
INSERT INTO `users` VALUES (38,'admin','artur','b656d0c7320385473d2e8b4b62fc1127',365,'bsuir','hHf3YPYmKRMML51yCILBCuJo'),(39,'user','gural','25d55ad283aa400af464c76d713c07ad',5,'Business','yE0DWuZucG4DCtZdswpbdSOg'),(40,'user','ilya','25d55ad283aa400af464c76d713c07ad',0,'Business','eeENdmBvjU4u2XiBbqxYPlwx'),(41,'user','denis','25d55ad283aa400af464c76d713c07ad',65,'Business','yi7YCI9NH7TU1cbp5RLWGFRL'),(42,'user','sergey','25d55ad283aa400af464c76d713c07ad',0,'Business','k5UYHCpPaZoGwARFW8mQli4U'),(43,'user','alex','25d55ad283aa400af464c76d713c07ad',0,'Business','QnFfzjuXQffRcFjrVJeVu_Jd'),(44,'user','misha','25d55ad283aa400af464c76d713c07ad',0,'BSUIR','yG_Qslv3mHrO4F8KR30dMZFF'),(45,'user','petia','25d55ad283aa400af464c76d713c07ad',0,'BSUIR','Xbgpi3NBmD_d8qYJ48tuv2Sc'),(46,'user','dmitro','25d55ad283aa400af464c76d713c07ad',20,'BSUIR','n-Ih9mS6ISExSJaGZqNNpkgo'),(47,'user','fanat','25d55ad283aa400af464c76d713c07ad',270,'bsuir','KY79ZNmCwtKCZJi5In71kP6t'),(48,'user','serega','25d55ad283aa400af464c76d713c07ad',0,'BSUIR','TlMzESnWKfRC-04y6jNmgDMz'),(49,'user','sergio','25d55ad283aa400af464c76d713c07ad',0,'BSUIR',NULL),(50,'user','cos','25d55ad283aa400af464c76d713c07ad',50,'BSUIR','EbDDtkZZLg3b9jsc8wc6CdsY'),(51,'user','ogre','25d55ad283aa400af464c76d713c07ad',0,'BSUIR','CEGD38uF-yjm_AWNfTpgn3Oo'),(52,'user','nikita','25d55ad283aa400af464c76d713c07ad',10,'BSUIR','nr5FoMc82sOt0QikfCZ0CzxG'),(53,'user','dmitrovka','25d55ad283aa400af464c76d713c07ad',10,'BSUIR','R51XTCc4DASajNbvzLukVdf9'),(54,'user','gemba','25d55ad283aa400af464c76d713c07ad',0,'BSUIR','fAXGmnDQiwdb4tLYwjZQL8bU'),(55,'user','sada','25d55ad283aa400af464c76d713c07ad',0,'BSU','4AQYajwWpeGlwt_rzi8Pae3G'),(56,'user','osip','25d55ad283aa400af464c76d713c07ad',0,'BSU','PtZV86XCNMmEA6lItK0qt0Co'),(57,'user','kostya','25d55ad283aa400af464c76d713c07ad',0,'BSU','dSRuLZ-iFquX8RK0KOpaF3xz'),(58,'user','andrey','25d55ad283aa400af464c76d713c07ad',20,'BSU','6V2Mn8cedu7xdoZY3n3UQ40p'),(59,'user','dasha','25d55ad283aa400af464c76d713c07ad',0,'BSU','NTWBK4Bc0ni-2MkfmyCHV8US'),(60,'user','sveta','25d55ad283aa400af464c76d713c07ad',30,'BSU',NULL),(61,'user','sasha','25d55ad283aa400af464c76d713c07ad',0,'BSU','REobhoVR4od0rHO7XF11h51x'),(62,'user','kris','25d55ad283aa400af464c76d713c07ad',0,'BSU','pLTtiKGQgDmh5UinCFJgvMIt'),(63,'user','ugu','25d55ad283aa400af464c76d713c07ad',0,'BSU',NULL),(64,'user','petroff','25d55ad283aa400af464c76d713c07ad',0,'CODERS','DFzH42YyuiB6F9pVKy0NiyGP'),(65,'user','barcelona','25d55ad283aa400af464c76d713c07ad',20,'CODERS','rDDjSLKTOWsiHKRfdpgIe5JO'),(66,'user','coca','25d55ad283aa400af464c76d713c07ad',55,'CODERS','uzOoz016Rm4wbFfbaTWgH71M'),(67,'user','cola','25d55ad283aa400af464c76d713c07ad',0,'CODERS','R1-knxlem5AUtb2jbp5eT8eZ'),(68,'user','dimoka','25d55ad283aa400af464c76d713c07ad',5,'CODERS','zBl-sYFKUABOPgNOEjk0zRiV'),(69,'user','phone','25d55ad283aa400af464c76d713c07ad',0,'CODERS',NULL),(70,'user','coder','25d55ad283aa400af464c76d713c07ad',5,'CODERS','igYBSKGmzl-PEpMd_qL0P0MP'),(71,'user','jser','25d55ad283aa400af464c76d713c07ad',0,'CODERS','cKfI-XssWq7OG_3rBEGMsOeQ'),(72,'user','better','25d55ad283aa400af464c76d713c07ad',10,'CODERS','9FepcqliqATvL7qBjOlEei8p'),(73,'user','vitalyi','25d55ad283aa400af464c76d713c07ad',0,'CODERS','3kA7gvjY8DPTBWdwVf3M6ghM'),(74,'user','kira','25d55ad283aa400af464c76d713c07ad',0,'CODERS','Mt4dMx1pggJvZU_ZczsAgb4E'),(75,'user','tanya','25d55ad283aa400af464c76d713c07ad',0,'DILLS','8lmG5Kiq66CgOGvUayORW_an'),(76,'user','katya','25d55ad283aa400af464c76d713c07ad',30,'CODERS','55e2Kbqn3x6LrisDhUD9vgyy'),(77,'user','vika','25d55ad283aa400af464c76d713c07ad',0,'DILLS',NULL),(78,'user','nastya','25d55ad283aa400af464c76d713c07ad',0,'CODERS','7EBg_b-M4JIb-zCkyKe4uPUP'),(79,'user','varya','25d55ad283aa400af464c76d713c07ad',40,'CODERS','UdMx8yHKK4ZL6KMuKiIgRbQ1'),(80,'user','rita','25d55ad283aa400af464c76d713c07ad',0,'DILLS','xWEQIWysPDzeEKBXKjn08ltp');
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
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchings`
--

LOCK TABLES `watchings` WRITE;
/*!40000 ALTER TABLE `watchings` DISABLE KEYS */;
INSERT INTO `watchings` VALUES (13,38,3),(15,50,3),(19,76,3),(24,60,3),(38,38,4),(39,79,4),(42,46,4),(43,58,4),(45,65,4),(47,66,4),(49,66,3),(54,38,5),(62,38,6),(73,41,5),(74,41,6),(77,38,7),(89,70,3),(138,47,4),(143,47,7),(145,47,6),(147,47,5),(148,47,3),(204,76,4),(225,70,4),(226,70,11),(234,38,11),(237,38,12),(246,47,12),(249,38,13);
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

-- Dump completed on 2016-04-22 16:32:16
