CREATE DATABASE  IF NOT EXISTS `iskconmy_folk` /*!40100 DEFAULT CHARACTER SET utf32 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `iskconmy_folk`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: iskconmy_folk
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `calendar`
--

DROP TABLE IF EXISTS `calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar` (
  `date` date NOT NULL,
  `program` varchar(45) DEFAULT NULL,
  `eventId` varchar(45) NOT NULL,
  `eventName` varchar(45) DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  `online` tinyint DEFAULT NULL,
  `speaker` varchar(45) DEFAULT NULL,
  `venue` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`eventId`),
  KEY `program_idx` (`program`),
  CONSTRAINT `program` FOREIGN KEY (`program`) REFERENCES `programs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar`
--

LOCK TABLES `calendar` WRITE;
/*!40000 ALTER TABLE `calendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category` varchar(20) NOT NULL,
  PRIMARY KEY (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participation`
--

DROP TABLE IF EXISTS `participation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participation` (
  `phone` varchar(20) DEFAULT NULL,
  `eventId` varchar(45) DEFAULT NULL,
  `caller` varchar(45) DEFAULT NULL,
  `response` varchar(45) DEFAULT NULL,
  `remarks` varchar(45) DEFAULT NULL,
  `attendance` tinyint DEFAULT NULL,
  KEY `participant_idx` (`phone`),
  CONSTRAINT `participant` FOREIGN KEY (`phone`) REFERENCES `people` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participation`
--

LOCK TABLES `participation` WRITE;
/*!40000 ALTER TABLE `participation` DISABLE KEYS */;
/*!40000 ALTER TABLE `participation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `people` (
  `phone` varchar(15) NOT NULL,
  `isWAPhone` tinyint DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `vocativeName` varchar(45) DEFAULT NULL,
  `tag` varchar(45) DEFAULT NULL,
  `secondaryPhone` varchar(15) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` mediumtext,
  `isStudent` tinyint DEFAULT NULL,
  `institution` varchar(45) DEFAULT NULL,
  `course` varchar(45) DEFAULT NULL,
  `semester` int DEFAULT NULL,
  `company` varchar(45) DEFAULT NULL,
  `designation` varchar(45) DEFAULT NULL,
  `highestQualification` varchar(45) DEFAULT NULL,
  `workExperience` varchar(45) DEFAULT NULL,
  `homeTown` varchar(45) DEFAULT NULL,
  `skills` varchar(45) DEFAULT NULL,
  `japaRounds` int DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `source` varchar(45) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`phone`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  UNIQUE KEY `secondaryPhone_UNIQUE` (`secondaryPhone`),
  KEY `source_idx` (`source`),
  KEY `category_idx` (`category`),
  KEY `role_idx` (`role`),
  CONSTRAINT `category` FOREIGN KEY (`category`) REFERENCES `categories` (`category`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `roleId` FOREIGN KEY (`role`) REFERENCES `roles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `source` FOREIGN KEY (`source`) REFERENCES `sources` (`source`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES ('1',NULL,'Pavanprana',NULL,NULL,NULL,NULL,'admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'c4ca4238a0b923820dcc509a6f75849b',NULL,NULL);
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programs`
--

DROP TABLE IF EXISTS `programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programs` (
  `id` varchar(20) NOT NULL,
  `name` varchar(45) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  `cost` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type_idx` (`type`),
  CONSTRAINT `type` FOREIGN KEY (`type`) REFERENCES `programtypes` (`type`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programs`
--

LOCK TABLES `programs` WRITE;
/*!40000 ALTER TABLE `programs` DISABLE KEYS */;
/*!40000 ALTER TABLE `programs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programtypes`
--

DROP TABLE IF EXISTS `programtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programtypes` (
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programtypes`
--

LOCK TABLES `programtypes` WRITE;
/*!40000 ALTER TABLE `programtypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `programtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrations`
--

DROP TABLE IF EXISTS `registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registrations` (
  `date` date NOT NULL,
  `program` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  KEY `program_idx` (`program`),
  KEY `phone_idx` (`phone`),
  CONSTRAINT `phone` FOREIGN KEY (`phone`) REFERENCES `people` (`phone`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `programid` FOREIGN KEY (`program`) REFERENCES `programs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrations`
--

LOCK TABLES `registrations` WRITE;
/*!40000 ALTER TABLE `registrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `registrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `roleId` varchar(10) NOT NULL,
  `roleName` varchar(20) NOT NULL,
  `roleLevel` int NOT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('ac','Acountant',4),('admin','Admin',0),('core','Core Member',2),('cv','Calling Volunteer',3),('default','Default',5),('exec','FOLK Executive',1);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sources`
--

DROP TABLE IF EXISTS `sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sources` (
  `source` varchar(20) NOT NULL,
  PRIMARY KEY (`source`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sources`
--

LOCK TABLES `sources` WRITE;
/*!40000 ALTER TABLE `sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `sources` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-29 15:25:40
