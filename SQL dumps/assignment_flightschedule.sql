-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: assignment
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `flightschedule`
--

DROP TABLE IF EXISTS `flightschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flightschedule` (
  `flightid` int(11) NOT NULL AUTO_INCREMENT,
  `planeid` int(11) NOT NULL,
  `originap` varchar(45) NOT NULL,
  `destap` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `econ` float NOT NULL,
  `buss` float NOT NULL,
  `first` float NOT NULL,
  `dtdepart` datetime NOT NULL,
  `dtarrive` datetime NOT NULL,
  `flighttime` float NOT NULL,
  `availseats` int(11) DEFAULT NULL,
  `firsts` int(11) DEFAULT NULL,
  `busss` int(11) DEFAULT NULL,
  `econs` int(11) DEFAULT NULL,
  PRIMARY KEY (`flightid`),
  UNIQUE KEY `ID_UNIQUE` (`flightid`),
  KEY `id_idx` (`planeid`),
  CONSTRAINT `planeid` FOREIGN KEY (`planeid`) REFERENCES `airplanes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flightschedule`
--

LOCK TABLES `flightschedule` WRITE;
/*!40000 ALTER TABLE `flightschedule` DISABLE KEYS */;
INSERT INTO `flightschedule` VALUES (1,1,'Singapore Changi Airport','Heathrow Airport','Singapore',500,900,1200,'2017-07-29 09:38:00','2017-07-30 08:00:00',22.3667,180,30,50,100),(2,2,'Changi','Sentosa','Singapore',100,200,300,'2017-08-01 21:34:00','2017-08-02 09:34:00',12,250,50,80,120),(3,5,'China','China','China',1000,1000,1000,'1111-11-11 11:11:00','2222-02-22 14:22:00',9732390,184,-46,80,150),(4,7,'China','China','SP',200,200,200,'1111-11-11 11:11:00','2222-02-22 14:22:00',9732390,3,1,2,0);
/*!40000 ALTER TABLE `flightschedule` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-07  0:40:50
