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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking` (
  `bookingID` int(11) NOT NULL AUTO_INCREMENT,
  `flightID` int(11) NOT NULL,
  `cabinClass` varchar(45) NOT NULL,
  `numPassengers` varchar(45) NOT NULL,
  `bookerID` varchar(45) NOT NULL,
  `creditCard` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`bookingID`),
  KEY `flightID_idx` (`flightID`),
  KEY `bookingID_idx` (`bookerID`),
  CONSTRAINT `bookingID` FOREIGN KEY (`bookerID`) REFERENCES `member` (`usr`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `flightID` FOREIGN KEY (`flightID`) REFERENCES `flightschedule` (`flightid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=426 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (60,1,'first','2','root','234567890','asdasdasdas@sad.asd'),(365,4,'first','1','root','23456','1@1.16'),(366,3,'bus','2','root','1234','1@1.1'),(367,4,'bus','2','root','1234','1@1.1'),(368,3,'first','2','root','1234','1@1.1'),(369,3,'bus','2','root','234','1@1.1'),(370,3,'bus','3','root','12345','1@1.1'),(371,3,'bus','3','root','12345','1@1.1'),(372,3,'bus','2','student','34','1@1.1'),(373,4,'bus','2','student','34','1@1.1'),(374,3,'bus','3','student','124','1@1.1'),(375,3,'bus','3','student','124','1@1.1'),(376,3,'first','3','student','1234','1@1.1'),(377,3,'first','3','student','1234','1@1.1'),(378,3,'first','2','student','1234','1@1.1'),(379,3,'first','2','student','1234','1@1.1'),(380,3,'first','2','student','1234','1@1.1'),(381,3,'first','2','student','1234','1@1.1'),(382,3,'first','2','student','1234','1@1.1'),(383,3,'first','2','student','1234','1@1.1'),(384,3,'first','2','student','1234','1@1.1'),(385,3,'first','2','student','1234','1@1.1'),(386,3,'first','2','student','1234','1@1.1'),(387,3,'first','2','student','1234','1@1.1'),(388,3,'first','2','student','1234','1@1.1'),(389,3,'first','2','student','1234','1@1.1'),(390,3,'first','2','student','1234','1@1.1'),(391,3,'first','2','student','1234','1@1.1'),(392,3,'first','2','student','1234','1@1.1'),(393,3,'first','2','student','1234','1@1.1'),(394,3,'first','2','student','1234','1@1.1'),(395,3,'first','2','student','1234','1@1.1'),(396,3,'first','2','student','1234','1@1.1'),(397,3,'first','2','student','1234','1@1.1'),(398,3,'first','2','student','1234','1@1.1'),(399,3,'first','2','student','1234','1@1.1'),(400,3,'first','2','student','1234','1@1.1'),(401,3,'first','2','student','1234','1@1.1'),(402,3,'first','2','student','1234','1@1.1'),(403,3,'first','2','student','1234','1@1.1'),(404,3,'first','2','student','1234','1@1.1'),(405,3,'first','2','student','1234','1@1.1'),(406,3,'first','2','student','1234','1@1.1'),(407,3,'first','2','student','1234','1@1.1'),(408,3,'first','2','student','1234','1@1.1'),(409,3,'first','2','student','1234','1@1.1'),(410,3,'first','2','student','1234','1@1.1'),(411,3,'first','2','student','1234','1@1.1'),(412,3,'first','2','student','1234','1@1.1'),(413,3,'first','2','student','1234','1@1.1'),(414,3,'first','2','student','1234','1@1.1'),(415,3,'first','2','student','1234','1@1.1'),(416,3,'first','2','student','1234','1@1.1'),(417,3,'first','2','student','1234','1@1.1'),(418,3,'first','2','student','1234','1@1.1'),(419,3,'first','2','student','1234','1@1.1'),(420,3,'first','2','student','1234','1@1.1'),(421,3,'first','2','student','1234','1@1.1'),(422,3,'first','2','student','1234','1@1.1'),(423,3,'first','2','student','1234','1@1.1'),(424,3,'first','2','student','1234','1@1.1'),(425,3,'first','2','student','1234','1@1.1');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
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
