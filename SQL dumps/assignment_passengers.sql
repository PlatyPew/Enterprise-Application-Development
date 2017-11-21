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
-- Table structure for table `passengers`
--

DROP TABLE IF EXISTS `passengers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passengers` (
  `passengerid` int(11) NOT NULL AUTO_INCREMENT,
  `bookingid` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`passengerid`),
  KEY `bookingids_idx` (`bookingid`),
  CONSTRAINT `bookingids` FOREIGN KEY (`bookingid`) REFERENCES `booking` (`bookingID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1050 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passengers`
--

LOCK TABLES `passengers` WRITE;
/*!40000 ALTER TABLE `passengers` DISABLE KEYS */;
INSERT INTO `passengers` VALUES (119,60,'aaa aaa'),(120,60,'bbb bbb'),(121,60,'ccc ccc'),(913,365,'sdfghjk dfghjk'),(914,366,'asdjh haskjdhkasdh'),(915,366,'aksdjhkashd asjdhkasjd'),(916,367,'asdjh haskjdhkasdh'),(917,367,'aksdjhkashd asjdhkasjd'),(918,368,'asdkj asdj'),(919,368,'kasdjh skajd'),(920,369,'asdt asdj'),(921,369,'asdjh asdj'),(922,370,'askdjh asdkjh'),(923,370,'askdjh kasdj'),(924,370,'asdkjh asdkjh'),(925,371,'askdjh asdkjh'),(926,371,'askdjh kasdj'),(927,371,'asdkjh asdkjh'),(928,372,'asd asdlk'),(929,372,'asdlkj asdlkj'),(930,373,'asd asdlk'),(931,373,'asdlkj asdlkj'),(942,374,'asd askjdh'),(943,374,'asdkjh asdkjh'),(944,374,'asd asdljk'),(945,375,'asd askjdh'),(946,375,'asdkjh asdkjh'),(947,375,'asd asdljk'),(948,376,'asd aksd'),(949,376,'asdkjh asdkjh'),(950,376,'kjsad askdjh`'),(951,377,'asd aksd'),(952,377,'asdkjh asdkjh'),(953,377,'kjsad askdjh`'),(954,378,'aksdjh ASDJH'),(955,378,'asdjk asdkjh'),(956,379,'aksdjh ASDJH'),(957,379,'asdjk asdkjh'),(958,380,'aksdjh ASDJH'),(959,380,'asdjk asdkjh'),(960,381,'aksdjh ASDJH'),(961,381,'asdjk asdkjh'),(962,382,'aksdjh ASDJH'),(963,382,'asdjk asdkjh'),(964,383,'aksdjh ASDJH'),(965,383,'asdjk asdkjh'),(966,384,'aksdjh ASDJH'),(967,384,'asdjk asdkjh'),(968,385,'aksdjh ASDJH'),(969,385,'asdjk asdkjh'),(970,386,'aksdjh ASDJH'),(971,386,'asdjk asdkjh'),(972,387,'aksdjh ASDJH'),(973,387,'asdjk asdkjh'),(974,388,'aksdjh ASDJH'),(975,388,'asdjk asdkjh'),(976,389,'aksdjh ASDJH'),(977,389,'asdjk asdkjh'),(978,390,'aksdjh ASDJH'),(979,390,'asdjk asdkjh'),(980,391,'aksdjh ASDJH'),(981,391,'asdjk asdkjh'),(982,392,'aksdjh ASDJH'),(983,392,'asdjk asdkjh'),(984,393,'aksdjh ASDJH'),(985,393,'asdjk asdkjh'),(986,394,'aksdjh ASDJH'),(987,394,'asdjk asdkjh'),(988,395,'aksdjh ASDJH'),(989,395,'asdjk asdkjh'),(990,396,'aksdjh ASDJH'),(991,396,'asdjk asdkjh'),(992,397,'aksdjh ASDJH'),(993,397,'asdjk asdkjh'),(994,398,'aksdjh ASDJH'),(995,398,'asdjk asdkjh'),(996,399,'aksdjh ASDJH'),(997,399,'asdjk asdkjh'),(998,400,'aksdjh ASDJH'),(999,400,'asdjk asdkjh'),(1000,401,'aksdjh ASDJH'),(1001,401,'asdjk asdkjh'),(1002,402,'aksdjh ASDJH'),(1003,402,'asdjk asdkjh'),(1004,403,'aksdjh ASDJH'),(1005,403,'asdjk asdkjh'),(1006,404,'aksdjh ASDJH'),(1007,404,'asdjk asdkjh'),(1008,405,'aksdjh ASDJH'),(1009,405,'asdjk asdkjh'),(1010,406,'aksdjh ASDJH'),(1011,406,'asdjk asdkjh'),(1012,407,'aksdjh ASDJH'),(1013,407,'asdjk asdkjh'),(1014,408,'aksdjh ASDJH'),(1015,408,'asdjk asdkjh'),(1016,409,'aksdjh ASDJH'),(1017,409,'asdjk asdkjh'),(1018,410,'aksdjh ASDJH'),(1019,410,'asdjk asdkjh'),(1020,411,'aksdjh ASDJH'),(1021,411,'asdjk asdkjh'),(1022,412,'aksdjh ASDJH'),(1023,412,'asdjk asdkjh'),(1024,413,'aksdjh ASDJH'),(1025,413,'asdjk asdkjh'),(1026,414,'aksdjh ASDJH'),(1027,414,'asdjk asdkjh'),(1028,415,'aksdjh ASDJH'),(1029,415,'asdjk asdkjh'),(1030,416,'aksdjh ASDJH'),(1031,416,'asdjk asdkjh'),(1032,417,'aksdjh ASDJH'),(1033,417,'asdjk asdkjh'),(1034,418,'aksdjh ASDJH'),(1035,418,'asdjk asdkjh'),(1036,419,'aksdjh ASDJH'),(1037,419,'asdjk asdkjh'),(1038,420,'aksdjh ASDJH'),(1039,420,'asdjk asdkjh'),(1040,421,'aksdjh ASDJH'),(1041,421,'asdjk asdkjh'),(1042,422,'aksdjh ASDJH'),(1043,422,'asdjk asdkjh'),(1044,423,'aksdjh ASDJH'),(1045,423,'asdjk asdkjh'),(1046,424,'aksdjh ASDJH'),(1047,424,'asdjk asdkjh'),(1048,425,'aksdjh ASDJH'),(1049,425,'asdjk asdkjh');
/*!40000 ALTER TABLE `passengers` ENABLE KEYS */;
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
