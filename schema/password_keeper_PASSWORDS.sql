CREATE DATABASE  IF NOT EXISTS `password_keeper` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `password_keeper`;
-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: password_keeper
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

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
-- Table structure for table `PASSWORDS`
--

DROP TABLE IF EXISTS `PASSWORDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PASSWORDS` (
  `password_id` int(5) NOT NULL AUTO_INCREMENT,
  `user_id` int(5) DEFAULT NULL,
  `password` varchar(105) DEFAULT NULL,
  `websites` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`password_id`),
  KEY `fk_pass` (`user_id`),
  CONSTRAINT `fk_pass` FOREIGN KEY (`user_id`) REFERENCES `USERS` (`user_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PASSWORDS`
--

LOCK TABLES `PASSWORDS` WRITE;
/*!40000 ALTER TABLE `PASSWORDS` DISABLE KEYS */;
INSERT INTO `PASSWORDS` VALUES (2,3,'desr','facebook'),(4,3,'sns985','ujjwal'),(5,10,'gAAAAABfFoqP-Eqs4A5sPyGVHNu6ZVwtqStJ1QvK7PKU5j1Ulx4kAhg93kQiapkni_SswB3ENPatOqlFGqmFpdhfayTt8oj-6g==','google'),(6,11,'gAAAAABfFouh0D0q7VklhxEr21yDaCFT0CszPwYLRbyWY-om4MkrGSLdcvfk6uMy6OrkJjyHgTvHEshlkVxQQjoIVJzqlTm4SQ==','orkut');
/*!40000 ALTER TABLE `PASSWORDS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-21 12:14:42
