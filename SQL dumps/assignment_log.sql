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
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `no.` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `datetime` datetime NOT NULL,
  `role` varchar(45) NOT NULL,
  `action` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`no.`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,'root','2017-05-19 11:15:03','adm',NULL),(55,'root','2017-07-28 15:21:57','adm','login'),(56,'<b>IMPORTANT BOLD VIP</b>','2017-07-28 15:24:17','mem','login'),(57,'<b>IMPORTANT BOLD VIP</b>','2017-07-28 15:24:46','mem','logout'),(58,'root','2017-07-28 15:25:05','adm','login'),(59,'root','2017-07-28 15:27:57','adm','login'),(60,'student','2017-07-28 21:13:52','mem','login'),(61,'root','2017-07-29 09:23:56','adm','login'),(62,'root','2017-07-29 10:12:00','adm','logout'),(63,'root','2017-07-29 10:12:03','adm','login'),(64,'root','2017-07-29 11:15:21','adm','login'),(65,'root','2017-07-31 20:40:38','adm','login'),(66,'root','2017-07-31 20:57:22','adm','logout'),(67,'student','2017-07-31 20:57:32','mem','login'),(68,'student','2017-07-31 21:13:25','mem','login'),(69,'student','2017-07-31 21:26:22','mem','logout'),(70,'root','2017-07-31 21:27:59','adm','login'),(71,'root','2017-08-01 11:10:22','adm','login'),(72,'root','2017-08-01 21:33:29','adm','login'),(73,'root','2017-08-02 23:16:15','adm','login'),(74,'student','2017-08-03 21:26:43','mem','login'),(75,'root','2017-08-04 14:17:04','adm','login'),(76,'root','2017-08-04 16:24:47','adm','login'),(77,'root','2017-08-04 17:22:30','adm','login'),(78,'root','2017-08-05 09:09:50','adm','login'),(79,'student','2017-08-05 13:26:20','mem','login'),(80,'root','2017-08-05 16:13:54','adm','login'),(81,'root','2017-08-05 16:15:50','adm','login'),(82,'root','2017-08-05 20:29:20','adm','login'),(83,'root','2017-08-05 22:04:41','adm','login'),(84,'root','2017-08-05 22:46:49','adm','login'),(85,'root','2017-08-05 22:51:31','adm','login'),(86,'root','2017-08-06 08:03:50','adm','login'),(87,'root','2017-08-06 08:10:04','adm','login'),(88,'root','2017-08-06 08:52:40','adm','login'),(89,'root','2017-08-06 10:03:15','adm','login'),(90,'root','2017-08-06 11:07:37','adm','login'),(91,'root','2017-08-06 11:59:10','adm','login'),(92,'root','2017-08-06 13:33:05','adm','login'),(93,'root','2017-08-06 13:52:50','adm','login'),(94,'root','2017-08-06 14:04:51','adm','logout'),(95,'qwertQWERT','2017-08-06 14:05:04','adm','login'),(96,'root','2017-08-06 14:44:05','adm','login'),(97,'root','2017-08-06 14:57:16','adm','login'),(98,'root','2017-08-06 16:48:21','adm','logout'),(99,'TRUMP','2017-08-06 16:49:19','mem','login'),(100,'TRUMP','2017-08-06 16:55:52','mem','logout'),(101,'WEIRD','2017-08-06 16:56:20','mem','login'),(102,'WEIRD','2017-08-06 17:06:52','mem','logout'),(103,'root','2017-08-06 17:06:56','adm','login'),(104,'root','2017-08-06 17:07:00','adm','logout'),(105,'student','2017-08-06 17:07:04','mem','login'),(106,'student','2017-08-06 17:07:38','mem','logout'),(107,'trump','2017-08-06 17:08:11','mem','login'),(108,'student','2017-08-06 18:31:59','mem','login'),(109,'student','2017-08-06 19:57:17','mem','login'),(110,'student','2017-08-06 20:02:44','mem','login'),(111,'student','2017-08-06 20:10:59','mem','login'),(112,'root','2017-08-06 20:31:05','adm','login'),(113,'root','2017-08-06 20:39:40','adm','login'),(114,'root','2017-08-06 20:51:03','adm','login'),(115,'student','2017-08-06 20:57:59','mem','login'),(116,'root','2017-08-06 21:01:34','adm','login'),(117,'student','2017-08-06 21:06:17','mem','login'),(118,'student','2017-08-06 21:10:06','mem','login'),(119,'root','2017-08-06 21:37:54','adm','login'),(120,'root','2017-08-06 21:47:59','adm','login'),(121,'student','2017-08-06 21:57:38','mem','login'),(122,'root','2017-08-06 22:01:10','adm','login'),(123,'root','2017-08-06 22:13:34','adm','login'),(124,'root','2017-08-06 22:50:10','adm','logout'),(125,'student','2017-08-06 22:50:14','mem','login'),(126,'student','2017-08-06 23:38:20','mem','login'),(127,'student','2017-08-06 23:43:38','mem','logout'),(128,'student','2017-08-06 23:43:45','mem','login'),(129,'student','2017-08-06 23:58:19','mem','logout'),(130,'root','2017-08-06 23:58:24','adm','login'),(131,'root','2017-08-07 00:06:17','adm','login'),(132,'root','2017-08-07 00:35:54','adm','logout'),(133,'root','2017-08-07 00:36:05','adm','login'),(134,'root','2017-08-07 00:36:17','adm','logout'),(135,'root','2017-08-07 00:37:31','adm','login'),(136,'root','2017-08-07 00:39:46','adm','logout');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
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
