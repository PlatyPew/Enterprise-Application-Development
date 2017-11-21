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
-- Table structure for table `airplanes`
--

DROP TABLE IF EXISTS `airplanes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `airplanes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(100) NOT NULL,
  `flightnumber` varchar(10) NOT NULL,
  `passengercap` int(11) NOT NULL,
  `imageurl` varchar(150) NOT NULL,
  `first` int(11) DEFAULT NULL,
  `buss` int(11) DEFAULT NULL,
  `econ` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='--innodb_autoinc_lock_mode = 0';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airplanes`
--

LOCK TABLES `airplanes` WRITE;
/*!40000 ALTER TABLE `airplanes` DISABLE KEYS */;
INSERT INTO `airplanes` VALUES (1,'Bitter Spirit','N615TH',180,'C:\\Users\\Daryl Lim\\workspace\\Assignment\\WebContent\\images\\uploadedimages\\Seatingchart1.jpg',30,50,100),(2,'Vengeful Owl','N668Q',250,'C:\\Users\\Daryl Lim\\workspace\\Assignment\\WebContent\\images\\uploadedimages\\Seatingchart1.jpg',50,80,120),(3,'Roguerage','N475WP',80,'C:\\Users\\Daryl Lim\\workspace\\Assignment\\WebContent\\images\\uploadedimages\\Seatingchart1.jpg',10,20,50),(4,'Eager Crane','N480GK',160,'C:\\Users\\Daryl Lim\\workspace\\Assignment\\WebContent\\images\\uploadedimages\\Seatingchart1.jpg',30,50,80),(5,'Greyblast','N303HD',290,'C:\\Users\\Daryl Lim\\workspace\\Assignment\\WebContent\\images\\uploadedimages\\Seatingchart1.jpg',60,80,150),(6,'Cold Ducchess','N413S',80,'C:\\Users\\Daryl Lim\\workspace\\Assignment\\WebContent\\images\\uploadedimages\\Seatingchart1.jpg',10,20,50),(7,'Danielle Boeing','SPKYS',1,'default image',1,0,0);
/*!40000 ALTER TABLE `airplanes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-07  0:40:49
