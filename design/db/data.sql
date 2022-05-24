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
INSERT INTO `categories` VALUES ('Core'),('General'),('Non-Local'),('Non-Weekend'),('Probatory'),('Sticky');
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
  `date` date DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `addedBy` varchar(45) DEFAULT NULL,
  `batch` varchar(45) DEFAULT NULL,
  `comments` varchar(2000) DEFAULT NULL,
  `vocativeName` varchar(45) DEFAULT NULL,
  `userid` varchar(10) DEFAULT NULL,
  `secondaryPhone` varchar(15) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `isStudent` tinyint DEFAULT NULL,
  `college` varchar(100) DEFAULT NULL,
  `course` varchar(100) DEFAULT NULL,
  `year` varchar(100) DEFAULT NULL,
  `company` varchar(45) DEFAULT NULL,
  `designation` varchar(45) DEFAULT NULL,
  `workExperience` varchar(45) DEFAULT NULL,
  `highestQualification` varchar(45) DEFAULT NULL,
  `native` varchar(45) DEFAULT NULL,
  `skills` varchar(2000) DEFAULT NULL,
  `japaRounds` int DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `source` varchar(45) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `program` varchar(45) DEFAULT 'SOS',
  `snoozeDate` date DEFAULT NULL,
  `preacher` varchar(45) DEFAULT NULL,
  `buddy` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`phone`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  UNIQUE KEY `secondaryPhone_UNIQUE` (`secondaryPhone`),
  KEY `source_idx` (`source`),
  KEY `category_idx` (`category`),
  KEY `role_idx` (`role`),
  KEY `addedBy_idx` (`addedBy`),
  KEY `people.preacher_idx` (`preacher`),
  KEY `people.userid` (`userid`),
  KEY `people.buddy_idx` (`buddy`),
  CONSTRAINT `addedBy` FOREIGN KEY (`addedBy`) REFERENCES `people` (`phone`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `category` FOREIGN KEY (`category`) REFERENCES `categories` (`category`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `people.buddy` FOREIGN KEY (`buddy`) REFERENCES `people` (`userid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `people.preacher` FOREIGN KEY (`preacher`) REFERENCES `preachers` (`initials`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `roleId` FOREIGN KEY (`role`) REFERENCES `roles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `source` FOREIGN KEY (`source`) REFERENCES `sources` (`source`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES ('2022-03-06','Nishant Payan','6239771956',NULL,'','MHPD contact',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,NULL,'PVPD',NULL),('2022-01-30','Akhul R','6360125780',NULL,'','',NULL,NULL,NULL,'akhulr3@gmail.com',NULL,'1998-12-30',NULL,'Vidya Vikas Institute of Engineering',NULL,NULL,NULL,'BE/ECE',NULL,NULL,'Mysore','Reading Books, Playing outdor and indoor games, coding',NULL,NULL,'General Preaching','General',NULL,NULL,'PVPD',NULL),('2021-10-01','Srinivas Rao','6360307025',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,'2022-03-03','SKKD',NULL),('2022-05-08','Vamshi','6360376369',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Campus Outreach','Probatory',NULL,NULL,'PVPD',NULL),('2021-12-05','Praveen B M','6360486257',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,NULL,'PVPD',NULL),('2021-11-28','Krrish Garla','6361215506',NULL,'Vijaya Vittala','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,NULL,'PVPD',NULL),('2022-04-17','Naresh','6361393169',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,NULL,'PVPD',NULL),('2021-08-01','Rakshit U','6361594887',NULL,'','',NULL,NULL,NULL,'rakshith220505@gmail.com',NULL,'1899-12-30',NULL,'Kendriya Vidyalaya, MYSORE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'painting, debate, cooking, essay writing',NULL,NULL,'Carry Forward','General',NULL,NULL,'SKKD',NULL),('2021-12-31','Ganesh Achari','6361639180',NULL,'Sankalp - New Contact','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,NULL,'SKKD',NULL),('2021-11-28','Chetan T K','6362209471',NULL,'','',NULL,NULL,NULL,'chettanmurthy79@gmail.com',NULL,'2001-09-07',NULL,'Vidyavardhaka college of engineering',NULL,'5',NULL,'Student/EEE',NULL,'PUC/Pursuing BE','Mysuru','Singing , Public speaking , Acting,Dancing',NULL,NULL,'General Preaching','General',NULL,NULL,'SKKD',NULL),('2021-12-19','Pavan Vittal','6362777757',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','Sticky',NULL,NULL,'PVPD',NULL),('2022-04-24','Ananth P Moodabagil','6362823807',NULL,'','',NULL,NULL,NULL,'ananthmoodabaagil@gmail.com',NULL,'2001-05-24',1,'MMC','Medical','1',NULL,NULL,NULL,NULL,'Haveri ','Yoga',NULL,NULL,'General Preaching','General',NULL,NULL,NULL,NULL),('2021-11-21','Dhanush S','6363030914',NULL,'','',NULL,NULL,NULL,'gowdachandu@gmail.com',NULL,'2003-03-05',NULL,'Sheshadripuram degree college,Mysore',NULL,'1st',NULL,NULL,NULL,NULL,'Mysore','Event Organising',NULL,NULL,'General Preaching','General',NULL,NULL,'SKKD',NULL),('2021-08-01','Kushal','6363301467',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Carry Forward','General',NULL,'2022-04-13','PVPD',NULL),('2022-04-03','Ramaprasad','6363411510',NULL,'','',NULL,NULL,NULL,'ramprasad732019@gmail.com',NULL,'2000-07-26',NULL,'NIE first grade college Mysore',NULL,'Entering to 6th sem. Final year.',NULL,'BCA',NULL,NULL,'Mysore','Communication',NULL,NULL,'General Preaching','General',NULL,NULL,'PVPD',NULL),('2021-08-01','Jithendra R C','6363627109',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Carry Forward','Non-Local',NULL,NULL,'PVPD',NULL),('2021-08-01','Sudarshan','6363677592',NULL,'','',NULL,NULL,NULL,'sudarshan360bhat@gmail.com',NULL,'2000-06-10',NULL,'NIE,Mysore',NULL,'VII',NULL,NULL,NULL,'PUC','Yellapur , uttara kannada',NULL,NULL,NULL,'Carry Forward','General',NULL,'2022-04-23','SKKD',NULL),('2022-05-08','Kotisurya','6366221800',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Campus Outreach','Probatory',NULL,NULL,'PVPD',NULL),('2021-12-31','Srinivas Acharya','6366695063',NULL,'Sankalp - New Contact','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,'2022-05-03','SKKD',NULL),('2021-12-31','Hemanth','7000947530',NULL,'Sankalp - New Contact','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,'2022-03-23','SKKD',NULL),('2022-04-24','Likith J V','7019031351',NULL,'','',NULL,NULL,NULL,'likhithgv51881@gmail.com',NULL,'2000-10-14',1,'Vidyavardhaka College of Engineering','Mechanical Engineering','8',NULL,NULL,NULL,NULL,'Mysuru','Ansys and Solid Edge ',NULL,NULL,'General Preaching','General',NULL,NULL,NULL,NULL),('2022-02-06','Rohan R','7019141056',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,'2022-05-27','PVPD',NULL),('2022-02-13','Amruth R','7022134103',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Campus Outreach','General',NULL,NULL,'PVPD',NULL),('2021-08-01','Shivashankar R','7022488564',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Carry Forward','Core',NULL,NULL,'PVPD',NULL),('2021-08-01','Niranjan','7022598457',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Carry Forward','Non-Local',NULL,NULL,'SKKD',NULL),('2022-05-08','Amruth Raj','7022876178',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,NULL,'PVPD',NULL),('2021-11-25','Raju Reddy R','7026693114',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,'NIE Mysore',NULL,'2nd MCA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Hostel Preaching','General',NULL,'2022-05-03','PVPD',NULL),('2021-11-28','Akash V','7026887929',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','Non-Weekend',NULL,NULL,'SKKD',NULL),('2021-10-01','Gundayya','7204108526',NULL,'MMC','',NULL,NULL,NULL,'tiligundayya@gmail.com',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,'1st year',NULL,NULL,NULL,'learning new things, chanting mantras, yoga',NULL,NULL,'Campus Outreach','General',NULL,'2022-02-28','SKKD',NULL),('2021-08-01','Sumith','7204348432',NULL,'','',NULL,NULL,NULL,'abhimanyu.sumith@gmail.com',NULL,'1899-12-30',NULL,'S-VYASA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'yoga, sketching, mixed martial arts',NULL,NULL,'Carry Forward','General',NULL,'2022-01-30','PVPD',NULL),('2021-10-01','Parashuram S Heggannavar','7204811302',NULL,'MMC','',NULL,NULL,NULL,'parashuramsh01@gmail.com',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,'1st year',NULL,NULL,NULL,NULL,NULL,NULL,'Campus Outreach','General',NULL,'2022-03-20','SKKD',NULL),('2022-05-08','Shravan','7204880011',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Campus Outreach','Probatory',NULL,NULL,'PVPD',NULL),('2021-11-21','Shridhara E K','7259364201',NULL,'','',NULL,NULL,NULL,'shridhargowda2002@gmail.com',NULL,'2002-01-20',NULL,'Maharajas College,Mysore',NULL,NULL,NULL,'5th',NULL,NULL,'Mandya,Nagamangala','computer skills',NULL,NULL,'Temple Counter','General',NULL,'2022-04-09','SKKD',NULL),('2021-10-01','Gangappa','7259639605',NULL,'MMC','',NULL,NULL,NULL,'ggangappa25@gmail.com',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,'1st year',NULL,NULL,NULL,'singing, drama, playing cricket and koko',NULL,NULL,'Campus Outreach','General',NULL,'2022-03-15','SKKD',NULL),('2021-08-01','Siddhanth Achaiah','7259694640',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Carry Forward','General',NULL,'2022-05-15','SKKD',NULL),('2021-08-01','Manish','7278071075',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Carry Forward','General',NULL,'2022-05-15','SKKD',NULL),('2021-10-01','Ajay Stavaramath','7337646437',NULL,'MMC','',NULL,NULL,NULL,'ajaystavaramath@gmail.com',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,'1st year',NULL,NULL,NULL,'playing games',NULL,NULL,'Campus Outreach','General',NULL,'2022-03-20','SKKD',NULL),('2021-08-01','Revanth M','7337698732',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Carry Forward','Non-Local',NULL,NULL,'SKKD',NULL),('2022-04-10','Prajwal G','7338362430',NULL,'Rama Navami','',NULL,NULL,NULL,'prajwalg53@gmail.com',NULL,'1997-08-17',NULL,'Holo world',NULL,'2',NULL,'BE (Software Developer)',NULL,'BE','Mysuru','Unity 3D C# ,',NULL,NULL,'Temple Counter','General',NULL,NULL,'PVPD',NULL),('2021-12-19','Kushal K','7349403455',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Book Distribution','General',NULL,NULL,'PVPD',NULL),('2021-12-31','Abhimanyu Dwivedi','7355219726',NULL,'Sankalp - New Contact','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,'2022-08-01','SKKD',NULL),('2021-08-01','Suhas Ranjan','7406093121',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Carry Forward','Sticky',NULL,NULL,'SKKD',NULL),('2021-08-01','Sameer','7406491747',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Carry Forward','General',NULL,NULL,'PVPD',NULL),('2021-08-01','Sandeep Singh G','7411917353',NULL,'','',NULL,NULL,NULL,'sandy876singh@gmail.com',NULL,'1899-12-30',NULL,'MIT',NULL,NULL,NULL,'5th sem',NULL,NULL,NULL,'Designing, In web development, hard working and punctuality',NULL,NULL,'Carry Forward','General',NULL,NULL,'SKKD',NULL),('2021-09-01','Kishore Pandey','7483567366',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,NULL,'PVPD',NULL),('2021-10-17','Suprith P','7483883384',NULL,'','',NULL,NULL,NULL,'suprithp166@gmail.com',NULL,'2002-06-16',NULL,'SJCE',NULL,'3rd',NULL,'Engineering',NULL,NULL,NULL,'interseted in reading books,novels',NULL,NULL,'Carry Forward','General',NULL,'2022-04-01','PVPD',NULL),('2021-08-01','Suraj Gutte','7588397338',NULL,'','',NULL,NULL,NULL,'guttesuraj01@gmail.com',NULL,'1899-12-30',NULL,'MYRA school of business',NULL,NULL,NULL,'5th sem',NULL,NULL,NULL,'graphic desinging, video editing',NULL,NULL,'Carry Forward','Non-Weekend',NULL,NULL,'SKKD',NULL),('2021-11-14','Vinay N','7619491598',NULL,'','',NULL,NULL,NULL,'vinayn145@gmail.com',NULL,'1999-04-19',NULL,'Techsol Engineers',NULL,'1 year',NULL,'Project Engineer',NULL,'BE(Mechanical)','Mysore','Drawing,Meditation',NULL,NULL,'Book Distribution','General',NULL,NULL,'SKKD',NULL),('2021-08-01','Srihari','7676151287',NULL,'','',NULL,NULL,NULL,'shreehariyr1124@gmail.com',NULL,'1899-12-30',NULL,'NIE',NULL,NULL,NULL,'1st sem',NULL,NULL,NULL,NULL,NULL,NULL,'Carry Forward','General',NULL,'2022-03-19','SKKD',NULL),('2022-02-13','Madan','7676258620',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,NULL,'PVPD',NULL),('2021-08-30','Mahadev M','7702407621',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','Sticky',NULL,NULL,'SKKD',NULL),('2021-08-01','Jatin','7795038117',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Carry Forward','Non-Weekend',NULL,NULL,'PVPD',NULL),('2022-02-06','Rakshith J','7795212806',NULL,'','',NULL,NULL,NULL,'rakshihsj28903@gmail.com',NULL,'2003-09-28',NULL,'BGS First Grade College, Mysore',NULL,'I',NULL,'BCA',NULL,NULL,'Tumkur',NULL,NULL,NULL,'General Preaching','General',NULL,NULL,'PVPD',NULL),('2021-08-01','Anantha Keshava','7892852955',NULL,'','',NULL,NULL,NULL,'ananthakishavap@gmail.com ',NULL,'1899-12-30',NULL,'BASE PU college ',NULL,NULL,NULL,'PCMC',NULL,NULL,NULL,'Flute, Mridanga',NULL,NULL,'Carry Forward','General',NULL,NULL,'SKKD',NULL),('2022-04-10','Ratanraj Mandolikar','7892913522',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Campus Outreach','General',NULL,NULL,NULL,NULL),('2022-04-24','Vijay K','7892913580',NULL,'','',NULL,NULL,NULL,'vijaykumark634@gmail.com',NULL,'2019-01-19',0,NULL,NULL,NULL,'Setty Mech Engineers','Jr. Plumbing Engineer','1','B.E','Mysore','Self confident',NULL,NULL,'General Preaching','General',NULL,NULL,NULL,NULL),('2021-08-01','Sagar R Rajput','7899797408',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Carry Forward','Core',NULL,'2022-04-01','PVPD',NULL),('2021-08-01','Vishal Sangam','7899991991',NULL,'NIE','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,'II Sem',NULL,NULL,NULL,'Guitarist, Gym',NULL,NULL,'Carry Forward','General',NULL,'2022-03-31','SKKD',NULL),('2021-08-01','Pavan A','7975555301',NULL,'','',NULL,NULL,NULL,'pavanpavan3187@gmail.com',NULL,'1899-12-30',NULL,'VVCE',NULL,NULL,NULL,'Graduate',NULL,NULL,NULL,'writing articles, yoga and javeline throw',NULL,NULL,'Carry Forward','Non-Weekend',NULL,NULL,'PVPD',NULL),('2022-01-30','Manvith Y Shetty','7975703179',NULL,'','',NULL,NULL,NULL,'manvithshetty159@gmail.com',NULL,'2003-08-01',NULL,'SJCE',NULL,'1',NULL,'B E',NULL,'12th','Mangalore','Drawing,painting,speaking and teaching',NULL,NULL,'General Preaching','General',NULL,NULL,'SKKD',NULL),('2021-08-01','Madan Mohan','7975707349',NULL,'','',NULL,NULL,NULL,'madanmohan.m741@gmail.com',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Drawing',NULL,NULL,'Carry Forward','General',NULL,NULL,'SKKD',NULL),('2022-02-01','Sagar K','8073189256',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,NULL,'SKKD',NULL),('2022-01-20','Jeenesh','8073543938',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','Sticky',NULL,NULL,'PVPD',NULL),('2021-08-01','Parmesh G','8073802519',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Carry Forward','Non-Weekend',NULL,NULL,'PVPD',NULL),('2022-02-20','Yuvaraj M P','8088002414',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Campus Outreach','General',NULL,'2022-05-16','SKKD',NULL),('2022-05-08','Sagar','8088592730',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Campus Outreach','Probatory',NULL,NULL,'PVPD',NULL),('2021-08-01','Praajna P C','8088787288',NULL,'','',NULL,NULL,NULL,'praajnapc@gmail.com',NULL,'1899-12-30',NULL,'NPS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'programming, web design, drawing, video and image editing',NULL,NULL,'Carry Forward','General',NULL,'2022-05-01','PVPD',NULL),('2021-10-01','Pruthvi Raj M','8088870291',NULL,'','',NULL,NULL,NULL,'rajpruthvi370@gmail.com',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,'1st year MBBS',NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,NULL,'SKKD',NULL),('2021-08-01','Thilak K','8095206396',NULL,'','',NULL,NULL,NULL,'raghavthilak29@gmail.com ',NULL,'1899-12-30',NULL,'BGS First grade college ',NULL,NULL,NULL,'BSc [CBZ]',NULL,NULL,NULL,'Art& craft works, decorating, events management, anchoring, drawing, cooking ',NULL,NULL,'Carry Forward','Core',NULL,NULL,'PVPD',NULL),('2021-11-29','Darshan SJCE','8105669649',NULL,'SJCE','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','Sticky',NULL,NULL,'PVPD',NULL),('2022-03-27','Harsha','8123270903',NULL,'Ratha Yatra','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Temple Counter','General',NULL,NULL,'PVPD',NULL),('2022-04-17','Darshan','8123423118',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,NULL,'PVPD',NULL),('2022-03-27','Hanumanth','8123694445',NULL,'Ratha Yatra','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Temple Counter','General',NULL,NULL,'PVPD',NULL),('2022-03-06','Prince Tyagi','8171624023',NULL,'','MHPD contact',NULL,NULL,NULL,'princetyagi151@gmail.com',NULL,'1996-10-01',NULL,'Central GST Department',NULL,'3 months',NULL,'Tax Assistant',NULL,'B.sc(Maths)','Uttar pradesh',NULL,NULL,NULL,'General Preaching','General',NULL,NULL,'PVPD',NULL),('2022-02-06','Mohan Krishna S','8186010609',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,NULL,'SKKD',NULL),('2021-08-01','Hemanth Kumar','8197503170',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Carry Forward','General',NULL,NULL,'SKKD',NULL),('2021-08-01','Prajwal M ','8217641029',NULL,'','',NULL,NULL,NULL,'prajwalgowda814@gmail.com',NULL,'1899-12-30',NULL,'VVCE',NULL,NULL,NULL,'Graduate',NULL,NULL,NULL,'Programming, Problem solving',NULL,NULL,'Carry Forward','Core',NULL,NULL,'SKKD',NULL),('2021-08-01','Supreeth N','8217773872',NULL,'','',NULL,NULL,NULL,'supreethn.23@gmail.com',NULL,'1899-12-30',NULL,'Mindtree LTD',NULL,NULL,NULL,'Senior Engineer',NULL,NULL,NULL,NULL,NULL,NULL,'Carry Forward','General',NULL,NULL,'PVPD',NULL),('2022-02-11','Sandeep Paul','8235519968',NULL,'SJCE I year hostelites','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,NULL,'PVPD',NULL),('2022-04-24','Ajay','8277613129',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,NULL,NULL,NULL),('2021-11-14','Rachit Gupta','8377990045',NULL,'','',NULL,NULL,NULL,'rachitgupta35@gmail.com',NULL,'2000-10-30',NULL,'JSS Medical College',NULL,'1st',NULL,'MBBS',NULL,NULL,'Delhi',NULL,NULL,NULL,'Carry Forward','General',NULL,'2022-02-06','SKKD',NULL),('2022-05-08','Vaishal','8431048726',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Campus Outreach','Probatory',NULL,NULL,'PVPD',NULL),('2021-08-01','Bhaskar J','8431713150',NULL,'','',NULL,NULL,NULL,'bhaskarj2003@gmail.com ',NULL,'1899-12-30',NULL,'vijaya vittalla ',NULL,NULL,NULL,'2nd puc complete ',NULL,NULL,NULL,'communication, Web development',NULL,NULL,'Carry Forward','Core',NULL,NULL,'PVPD',NULL),('2022-05-08','Anil','8431915100',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Campus Outreach','Probatory',NULL,NULL,'PVPD',NULL),('2022-03-03','Avinash H P','8495046560',NULL,'','',NULL,NULL,NULL,'',NULL,'1998-04-26',NULL,'Yuvaraja College',NULL,NULL,NULL,'MSc Chemistry',NULL,NULL,'Mandya','Computer Skills, Photo & Video Editing',NULL,NULL,'General Preaching','General',NULL,NULL,'SKKD',NULL),('2022-04-10','Abhilash H S','8553226193',NULL,'Rama Navami','',NULL,NULL,NULL,'abhihs733@gmail.com',NULL,'1995-04-03',NULL,'Alcon consulting engineers (IPL)',NULL,'4 years',NULL,'Civil',NULL,'B E','Turuvekere',NULL,NULL,NULL,'Temple Counter','General',NULL,NULL,'PVPD',NULL),('2021-12-31','Keerthij','8553561375',NULL,'Sankalp - New Contact','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,NULL,'SKKD',NULL),('2021-08-01','Shyam Ayyappa B R','8618664210',NULL,'','',NULL,NULL,NULL,'shyamayappa04@gmail.com',NULL,'1899-12-30',NULL,'Sunrise system',NULL,NULL,NULL,'MBA(marketing)',NULL,NULL,NULL,NULL,NULL,NULL,'Carry Forward','General',NULL,NULL,'PVPD',NULL),('2022-03-20','Ravi Teja','8639763553',NULL,'','',NULL,NULL,NULL,'perumalla22p@gmail.com',NULL,'1999-07-22',NULL,'L&T TECHNOLOGY SERVICES ',NULL,NULL,NULL,'ASSOCIATE ENGINEER ',NULL,'B.TECH','PEDDA DORNAL ',NULL,NULL,NULL,'Reffered','General',NULL,NULL,'SKKD',NULL),('2022-04-03','Mahesh Kumar G K','8660567721',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Reffered','General',NULL,NULL,'PVPD',NULL),('2021-08-01','Damodar','8660823859',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Carry Forward','General',NULL,NULL,'SKKD',NULL),('2022-05-01','Gowrang Manjunath','8660933242',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,NULL,'PVPD',NULL),('2021-11-28','Srinidhi B V','8762139455',NULL,'','',NULL,NULL,NULL,'srinidhibv07@gmail.com',NULL,'2003-04-07',NULL,'sapient college',NULL,NULL,NULL,'BBA',NULL,NULL,'Mysore',NULL,NULL,NULL,'General Preaching','Sticky',NULL,NULL,'SKKD',NULL),('2022-02-06','Deepak Gerkombe Bhat','8762248433',NULL,'','',NULL,NULL,NULL,'bhatdeepak10@gmail.com',NULL,'2003-11-24',NULL,'Mahajana I grade college',NULL,'I',NULL,'BBA',NULL,NULL,'Yellapura (Uttara Kannada)',NULL,NULL,NULL,'General Preaching','General',NULL,NULL,'PVPD',NULL),('2021-12-26','Anubab Mondal','8777459970',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,'2022-04-19','PVPD',NULL),('2022-05-08','Prajwal','8792043594',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Campus Outreach','Probatory',NULL,NULL,'PVPD',NULL),('2021-08-01','Vivek M G','8792162934',NULL,'','',NULL,NULL,NULL,'vivekmggururaj@gmail.com',NULL,'1899-12-30',NULL,'Goa medical college',NULL,NULL,NULL,'3rd year',NULL,NULL,NULL,'reading books, singing',NULL,NULL,'Carry Forward','Non-Local',NULL,NULL,'SKKD',NULL),('2021-11-14','Pushkar Raj','8809856222',NULL,'','',NULL,NULL,NULL,'raj04.pushkar@gmail.com',NULL,'1998-10-02',NULL,'JSS Medical College',NULL,NULL,NULL,NULL,NULL,NULL,'Bihar','Singing',NULL,NULL,'Carry Forward','General',NULL,'2022-03-21','SKKD',NULL),('2021-10-01','Bharath Narayanan','8848879625',NULL,'Amrita College','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','Non-Weekend',NULL,NULL,'PVPD',NULL),('2021-10-17','Chetan Goral','8861712606',NULL,'','',NULL,NULL,NULL,'chetan18goral@gmail.com',NULL,'2001-08-10',NULL,'NIE',NULL,'5th',NULL,'ISE',NULL,NULL,'kaiga,karwa',NULL,NULL,NULL,'Carry Forward','General',NULL,'2022-03-21','SKKD',NULL),('2021-10-15','Chandan M K','8867044020',NULL,'MMC','',NULL,NULL,NULL,'Chandanchandu680@gmail.com',NULL,'1899-12-30',NULL,'MMC&RI',NULL,NULL,NULL,'1st year MBBS',NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,NULL,'SKKD',NULL),('2021-08-01','Mahesh N Seervi','8867473896',NULL,'','',NULL,NULL,NULL,'nmaheshseervi@gmail.com ',NULL,'1899-12-30',NULL,'Mahajanas First grade college ',NULL,NULL,NULL,'B Com ',NULL,NULL,NULL,NULL,NULL,NULL,'Carry Forward','Core',NULL,NULL,'SKKD',NULL),('2021-08-30','Sreejith','8867550994',NULL,'','',NULL,NULL,NULL,'sreejithskumar2002@gmail.com',NULL,'2002-07-19',1,'JSS college of arts commerce and science Ooty road mysuru','Bsc czbt','4',NULL,NULL,NULL,NULL,'Davangere Karnataka','Drama dance singing artist',NULL,NULL,'General Preaching','General',NULL,'2022-04-06','SKKD',NULL),('2021-08-01','Karthik Kaundinya','8867613543',NULL,'','',NULL,NULL,NULL,'karthik96koundinya@gmail.com',NULL,'1998-04-10',0,NULL,NULL,NULL,'Skanray Technologies','Design Engineer','2 years','BE','Mysore','Software Development',NULL,NULL,'Carry Forward','Non-Weekend',NULL,NULL,'PVPD',NULL),('2022-05-08','Karthik','8867778706',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,NULL,'PVPD',NULL),('2021-08-01','Adarsh G','8880114603',NULL,'','',NULL,NULL,NULL,'adarshg9720@gmail.com',NULL,'1899-12-30',NULL,'UPHC, Gandhinagar, Mysore',NULL,NULL,NULL,'Medical officer',NULL,NULL,NULL,'music, sports, cooking',NULL,NULL,'Carry Forward','General',NULL,NULL,'SKKD',NULL),('2021-11-21','Pradhyumna K','8904193097',NULL,'','',NULL,NULL,NULL,'pradhyumnapaddu@gmail.com',NULL,'1999-02-18',NULL,'cognizant',NULL,'3 months',NULL,'Engnieer',NULL,NULL,'Udupi','Cricket,Handball',NULL,NULL,'Carry Forward','General',NULL,NULL,'SKKD',NULL),('2022-05-08','Nithin','8904274755',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Campus Outreach','Probatory',NULL,NULL,'PVPD',NULL),('2021-08-01','Vishnu L','8904443677',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Carry Forward','Non-Local',NULL,'2022-05-14','SKKD',NULL),('2022-05-08','Likhith','8951121924',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Campus Outreach','Probatory',NULL,NULL,'PVPD',NULL),('2022-01-30','Vinay U','8951755314',NULL,'','',NULL,NULL,NULL,'vinaymj46@gmail.com',NULL,'1996-09-10',NULL,'OMEGA',NULL,NULL,NULL,NULL,NULL,'B com','Mysuru',NULL,NULL,NULL,'General Preaching','General',NULL,'2022-05-15','PVPD',NULL),('2022-02-13','Abhishek Sobarad','8971095046',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Campus Outreach','General',NULL,NULL,'PVPD',NULL),('2022-04-17','Murali Krishna','8971507079',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,NULL,'PVPD',NULL),('2021-08-01','Eshwar K S','8971679781',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Temple Counter','General',NULL,'2022-04-01','PVPD',NULL),('2021-10-17','Shreyas Heranjal','8971897046',NULL,'','',NULL,NULL,NULL,'Annapurneshwari Student hostel',NULL,'2001-05-03',NULL,'NIE',NULL,'5th',NULL,'ECE',NULL,NULL,'Kaiga,Karwar',NULL,NULL,NULL,'General Preaching','General',NULL,NULL,'SKKD',NULL),('2022-02-06','Bharath','9008262064',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,'2022-03-09','SKKD',NULL),('2021-11-21','Suhas R','9019571340',NULL,'','',NULL,NULL,NULL,'suhassuvvil19@gmail.com',NULL,'2001-04-19',NULL,'JSS College,Ooty Road,Mysore',NULL,'5th',NULL,'B.Voc (F.P&E)',NULL,NULL,'Mandya','dance,playing chess,learning guitar',NULL,NULL,'General Preaching','General',NULL,NULL,'SKKD',NULL),('2022-02-11','Kumar Subrato','9065619225',NULL,'SJCE I year hostelites','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,NULL,'PVPD',NULL),('2021-10-15','Karthik D G','9066535009',NULL,'','',NULL,NULL,NULL,'Karthikdg1989@gmail.com',NULL,'1899-12-30',NULL,'Accenture',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,NULL,'PVPD',NULL),('2021-11-25','Darshan G','9110289630',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,'NIE Mysore',NULL,NULL,NULL,'Final Year CS',NULL,NULL,NULL,NULL,NULL,NULL,'Hostel Preaching','General',NULL,'2022-03-06','SKKD',NULL),('2021-08-01','Tejas Gowda','9110611013',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Carry Forward','General',NULL,NULL,'SKKD',NULL),('2021-08-01','Ravindra G','9110825708',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Carry Forward','Non-Weekend',NULL,NULL,'PVPD',NULL),('2022-03-06','Shashank','9113060233',NULL,'','Deepak BMs brother',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Reffered','General',NULL,NULL,'PVPD',NULL),('2021-12-12','Vignesh Pramati K ','9113299323',NULL,'','',NULL,NULL,NULL,'vigneshn1710@gmail.com',NULL,'2001-10-17',NULL,'Maharaja college ',NULL,'5th Sem ',NULL,'BA',NULL,'BA','Mandya',NULL,NULL,NULL,'Book Distribution','General',NULL,NULL,'PVPD',NULL),('2022-05-08','Kirti Kumar','9113544533',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Campus Outreach','Probatory',NULL,NULL,'PVPD',NULL),('2021-11-21','Raghavendra K  P','9113631130',NULL,'','',NULL,NULL,NULL,'raghavendradhanush729@gmail.com',NULL,'2004-09-28',NULL,'Kendirya Vidyalaya',NULL,NULL,NULL,'class 12',NULL,NULL,'Myosre',NULL,NULL,NULL,'General Preaching','General',NULL,'2022-06-07','SKKD',NULL),('2021-11-24','Varun ','9148963869',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,'NIE Mysore',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Hostel Preaching','General',NULL,'2022-06-30','PVPD',NULL),('2021-08-01','Shreyas Aradhya','9164490878',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Temple Counter','Non-Weekend',NULL,'2022-06-01','PVPD',NULL),('2021-11-01','Raghavendra R','9242737303',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,NULL,'SKKD',NULL),('2021-08-01','Bhargav G','9353480635',NULL,'','',NULL,NULL,NULL,'bargauv1359@gmail.com',NULL,'1899-12-30',NULL,'BASE PU college',NULL,NULL,NULL,'1st Sem',NULL,NULL,NULL,NULL,NULL,NULL,'Carry Forward','General',NULL,NULL,'SKKD',NULL),('2022-02-06','Supreeth S R','9353724261',NULL,'','',NULL,NULL,NULL,'supreethsr45@gmail.com',NULL,'2003-04-26',NULL,'BGS First Grade College, Mysore',NULL,'I',NULL,'BCA',NULL,NULL,'Tumkur',NULL,NULL,NULL,'General Preaching','General',NULL,NULL,'PVPD',NULL),('2021-11-21','Sujay','9353738066',NULL,'MMC','',NULL,NULL,NULL,'sujayg201@gmail.com',NULL,'2002-06-10',NULL,'Maharajas College,Mysore',NULL,'5th',NULL,'B.Com',NULL,NULL,'kabboli village,channarayapatna,hassan','computer skill,reading books',NULL,NULL,'Temple Counter','General',NULL,'2022-03-23','SKKD',NULL),('2021-11-28','Suhas M','9380182332',NULL,'','',NULL,NULL,NULL,'suhasmkasyap@gmail.com',NULL,'2002-12-13',NULL,NULL,NULL,'1st',NULL,'BE',NULL,NULL,'Mysore',NULL,NULL,NULL,'General Preaching','General',NULL,NULL,'SKKD',NULL),('2022-04-01','Premsagar M','9380213130',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,NULL,NULL,NULL),('2022-02-20','Shashidhar H L','9380250852',NULL,'','',NULL,NULL,NULL,'astrohind2045@gmail.com',NULL,'2003-04-10',NULL,'NIE Mysore',NULL,'1',NULL,'EEE',NULL,NULL,'Hosakere',NULL,NULL,NULL,'General Preaching','General',NULL,NULL,'PVPD',NULL),('2021-10-14','Prajwal M B','9449727236',NULL,'','',NULL,NULL,NULL,'prajwaldeang.@gmail.com',NULL,'2001-05-29',NULL,'BGS Degree College',NULL,'5th',NULL,'Bsc',NULL,NULL,'Mysore','Drawing,Computer Skills,Gardning',NULL,NULL,'Book Distribution','General',NULL,'2022-03-31','PVPD',NULL),('2021-11-21','Lokranjan P','9480654816',NULL,'NIE','',NULL,NULL,NULL,'lokranjan03@gmail.com',NULL,'2003-04-04',NULL,'NIE',NULL,'2nd sem',NULL,NULL,NULL,NULL,'Mysore','leadership,ownership,reading,content creation',NULL,NULL,'General Preaching','General',NULL,NULL,'PVPD',NULL),('2021-08-01','Vaibhav','9480659348',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Carry Forward','Non-Local',NULL,NULL,'SKKD',NULL),('2021-08-01','Chethan S','9481310194',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Carry Forward','Non-Local',NULL,NULL,'PVPD',NULL),('2022-02-20','Adarsh','9481419182',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,NULL,'PVPD',NULL),('2021-08-01','Vinod J','9483294766',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Carry Forward','Core',NULL,NULL,'SKKD',NULL),('2021-08-01','Raja Yadav','9535303598',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Carry Forward','Non-Local',NULL,NULL,'SKKD',NULL),('2021-10-01','Gopi M','9535541105',NULL,'','',NULL,NULL,NULL,'gopi.m292@gmail.com',NULL,'1993-05-15',NULL,'BEML',NULL,NULL,NULL,'Machine Operator',NULL,'ITI','T.Narasipura','Driving',NULL,NULL,'General Preaching','Non-Weekend',NULL,NULL,'SKKD',NULL),('2022-01-30','Kiran Kumar','9538600726',NULL,'','',NULL,NULL,NULL,'kiranramesh12345@gmail.com',NULL,'1998-02-08',NULL,'Regional institute of education',NULL,'1',NULL,'B Ed',NULL,'Msc ','Bangalore','Mathematic skills',NULL,NULL,'General Preaching','General',NULL,NULL,'SKKD',NULL),('2020-10-20','Shivakumar B G','9538861908',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Carry Forward','Core',NULL,NULL,'PVPD',NULL),('2022-03-13','Abhishek D P','9591428238',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,NULL,'PVPD',NULL),('2022-03-27','Surik Mulya','9591673443',NULL,'Ratha Yatra','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Temple Counter','General',NULL,'2022-05-05','PVPD',NULL),('2022-05-15','Rahul Vyas','9606376028',NULL,'','',NULL,NULL,NULL,'vyasrahul7890@gmail.com',NULL,'1997-04-13',0,NULL,NULL,NULL,'PG Doctor','Doctor','1 year','MBBS','Hyderabad','Doctor',NULL,NULL,'General Preaching','General',NULL,NULL,'SKKD',NULL),('2022-04-17','Saron P','9611231186',NULL,'','',NULL,NULL,NULL,'saronpavitran@gmail.com',NULL,'1998-10-18',NULL,'Setty Mech Engineers Ltd P',NULL,'1 year',NULL,'Jr BIM Engineer',NULL,'B.E','Thalassery, Kerala',NULL,NULL,NULL,'General Preaching','General',NULL,NULL,'PVPD',NULL),('2022-02-03','Aditya Rao','9611661574',NULL,'','MBA in Mysore University  Hails from Udupi, settled in Mys  Chants and reads BG As It Is',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','Non-Weekend',NULL,NULL,'PVPD',NULL),('2021-11-25','Shivaraj S G','9620030799',NULL,'','',NULL,NULL,NULL,'shivarajsgalagali5@gmail.com',NULL,'2000-09-03',NULL,'NIE Mysore',NULL,'7',NULL,'CSE ',NULL,'B.E','Bijapur ','Adobe Photoshop , automation programming etc ',NULL,NULL,'Hostel Preaching','General',NULL,'2022-04-15','SKKD',NULL),('2022-05-08','Harish','9620333166',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Campus Outreach','Probatory',NULL,NULL,'PVPD',NULL),('2022-01-30','Karthik N','9620491970',NULL,'','',NULL,NULL,NULL,'karthiknmysore04@gmail.com',NULL,'2000-04-04',NULL,'DXC Technology, Bangalore',NULL,NULL,NULL,NULL,NULL,'BE/ECE','Mysore','Reading, Learning, Meditation',NULL,NULL,'General Preaching','General',NULL,NULL,'PVPD',NULL),('2021-08-01','Vinuthan','9620925616',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Carry Forward','Non-Weekend',NULL,NULL,'PVPD',NULL),('2021-08-01','Saikishore','9632818872',NULL,'','',NULL,NULL,NULL,'rvskis@gmail.com ',NULL,'1899-12-30',NULL,'Mahajana Degree college ',NULL,NULL,NULL,'BA-(CPS)',NULL,NULL,NULL,NULL,NULL,NULL,'Carry Forward','General',NULL,NULL,'SKKD',NULL),('2021-08-01','Abhishek R','9663318781',NULL,'','',NULL,NULL,NULL,'abhishek1995r@gmail.com',NULL,'1899-12-30',NULL,'TVS creadit service limited ',NULL,NULL,NULL,'Field officer ',NULL,NULL,NULL,'kho kho, Drawing Talking ,Discussion ',NULL,NULL,'Carry Forward','General',NULL,NULL,'PVPD',NULL),('2022-04-17','Madhushankar','9663601590',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,NULL,'PVPD',NULL),('2021-11-21','Manoj Kumar H R','9686367393',NULL,'Aryaka Networks','',NULL,NULL,NULL,'Gowdamanoj17@gmail.com',NULL,'1991-06-17',NULL,'Aryaka networks',NULL,'8+ Years',NULL,'Network Engineer',NULL,'B.E','Mysore','Can perform on stage,trouble shooting computer & networking',NULL,NULL,'Book Distribution','General',NULL,NULL,'SKKD',NULL),('2021-12-02','Adithya M','9686403163',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,'Degree student',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Book Distribution','General',NULL,'2022-06-15','SKKD',NULL),('2021-10-17','Varun S D','9686456746',NULL,'','',NULL,NULL,NULL,'Varunvar@gmail.com',NULL,'2000-06-03',NULL,'YCM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Reading books',NULL,NULL,'Carry Forward','General',NULL,'2022-05-05','SKKD',NULL),('2021-08-01','Rohan I R','9686984359',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Carry Forward','Core',NULL,NULL,'PVPD',NULL),('2022-01-30','Chandan J','9731167622',NULL,'','',NULL,NULL,NULL,'chanduchandan@gmail.com',NULL,'2002-08-29',NULL,'Sharada vilas college',NULL,'3',NULL,'Bsc( CBZ)',NULL,NULL,'Mysuru','Martial arts Swimming',NULL,NULL,'General Preaching','General',NULL,NULL,'SKKD',NULL),('2021-09-17','Tejas H B Badala','9731737007',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Campus Outreach','Non-Weekend',NULL,NULL,'PVPD',NULL),('2021-08-01','Ajay Lokhotia','9733045174',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Carry Forward','Non-Weekend',NULL,NULL,'SKKD',NULL),('2022-05-01','Gagan Ram','9738558430',NULL,'','',NULL,NULL,NULL,'gagantnp@gmail.com',NULL,'1990-02-12',0,NULL,NULL,NULL,'Theorems Mysore','Client Service Anylist','1','B Com','T Narasipura','Videography, Video Editing',NULL,NULL,'General Preaching','General',NULL,NULL,'PVPD',NULL),('2021-08-01','Himan','9739511686',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Carry Forward','Sticky',NULL,NULL,'SKKD',NULL),('2021-08-30','Shankar Narayan','9739558767',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','Non-Local',NULL,NULL,'SKKD',NULL),('2021-11-01','Chandrahas','9739999191',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Temple Counter','General',NULL,'2022-04-15','SKKD',NULL),('2021-11-21','Deepak B M','9740093880',NULL,'','',NULL,NULL,NULL,'deepu9432@gmail.com',NULL,'1990-11-21',NULL,'Regional Institute of Education',NULL,'2.5 Years',NULL,'PhD',NULL,NULL,'Bangalore','computer,teaching',NULL,NULL,'Book Distribution','General',NULL,NULL,'PVPD',NULL),('2022-04-10','Subhash Chandra','9740406107',NULL,'Rama Navami','',NULL,NULL,NULL,'lakshmanksubhash@gmail.com',NULL,'1993-04-17',NULL,'Digimedix',NULL,'Years',NULL,'Account receivable',NULL,'BE','Mysore',NULL,NULL,NULL,'Temple Counter','General',NULL,NULL,'PVPD',NULL),('2021-11-28','Prajwal R Bhat','9740782632',NULL,'','',NULL,NULL,NULL,'prajwalrbhat0417@gmail.com',NULL,'2000-04-17',NULL,'NIE',NULL,'7th',NULL,'BE(ECE)',NULL,NULL,'uttara kannada','Technical skills related to ECE,tabla',NULL,NULL,'General Preaching','General',NULL,'2022-05-31','SKKD',NULL),('2021-08-01','Lokesh M B','9741605491',NULL,'','',NULL,NULL,NULL,'lokeshmbmysuru@gmail.com',NULL,'1899-12-30',NULL,'PES college , Mandya',NULL,NULL,NULL,'3rd sem',NULL,NULL,NULL,'social media marketing and reading books',NULL,NULL,'Carry Forward','Core',NULL,NULL,'PVPD',NULL),('2021-12-03','Akash Gupta','9813832162',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Book Distribution','General',NULL,'2022-04-23','PVPD',NULL),('2022-05-08','Yuvaraj','9845260327',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Campus Outreach','Probatory',NULL,NULL,'PVPD',NULL),('2022-01-13','Abhijith Rathore C','9886552323',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,'2022-06-01','PVPD',NULL),('2022-03-05','Pradyumna Kalal','9886640744',NULL,'NIE IT','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,'NIE IT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,'2022-05-14','PVPD',NULL),('2022-02-11','Rudraksh Kumar ','9932470523',NULL,'SJCE I year hostelites','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,NULL,'PVPD',NULL),('2021-08-01','Dhanveer J Ashpal','9945097770',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Carry Forward','General',NULL,'2022-03-31','PVPD',NULL),('2021-11-28','Eshwar B N','9945614727',NULL,'','',NULL,NULL,NULL,'eshwarbn31@gmail.com',NULL,'1999-03-22',NULL,'VVCE',NULL,NULL,NULL,'MBA',NULL,NULL,'Mysore',NULL,NULL,NULL,'Carry Forward','General',NULL,'2022-05-11','PVPD',NULL),('2021-10-17','Prekshit Agarwal','9964780275',NULL,'','',NULL,NULL,NULL,'prekshithagarwal789@gmail.com',NULL,'2000-09-28',NULL,'VVCE',NULL,'8th',NULL,'Engineering',NULL,NULL,'jaito,punjab','Drama',NULL,NULL,'General Preaching','General',NULL,NULL,'SKKD',NULL),('2021-08-01','Charan','9964906120',NULL,'','',NULL,NULL,NULL,'charanshetty25595@gmail.com ',NULL,'1899-12-30',NULL,'Google ',NULL,NULL,NULL,'Software Engineer ',NULL,NULL,NULL,NULL,NULL,NULL,'Carry Forward','Non-Local',NULL,NULL,'SKKD',NULL),('2021-12-19','Darshan S','9972355535',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Book Distribution','General',NULL,NULL,'PVPD',NULL),('2021-08-30','Yashpal Singh','9972625117',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Temple Counter','Sticky',NULL,NULL,'PVPD',NULL),('2021-10-01','Vikas Chandakapure','9972865552',NULL,'NIE','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,'2022-05-03','PVPD',NULL),('2022-01-30','Jayasurya B R','9972942160',NULL,'','',NULL,NULL,NULL,'jayasuryabr@gmail.com',NULL,'2003-02-27',NULL,'JSS science and technology university',NULL,'1',NULL,'B E ( civil)',NULL,NULL,'Mysuru','Painting and Drama',NULL,NULL,'General Preaching','General',NULL,NULL,'PVPD',NULL),('2022-04-10','Rakshith M P','9986204279',NULL,'Rama Navami','',NULL,NULL,NULL,'rakshith2000223@gmail.com',NULL,'2000-03-22',NULL,'NIE',NULL,'8th sem',NULL,'BE',NULL,NULL,'Mysore',NULL,NULL,NULL,'Temple Counter','General',NULL,NULL,'PVPD',NULL),('2021-10-15','Bharathesh','9986878286',NULL,'','',NULL,NULL,NULL,'',NULL,'1899-12-30',NULL,'G I  P S Hosakoppalu.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'General Preaching','General',NULL,NULL,'SKKD',NULL),('2021-11-14','Vignesh M','9986990588',NULL,'','',NULL,NULL,NULL,'vigneshmsmg2000@gmail.com',NULL,'2000-01-27',NULL,'NIE',NULL,NULL,NULL,'7th',NULL,NULL,'shimoga','Software development',NULL,NULL,'General Preaching','General',NULL,NULL,'SKKD',NULL);
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preachers`
--

DROP TABLE IF EXISTS `preachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preachers` (
  `initials` varchar(10) NOT NULL,
  `honor` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `designation` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`initials`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preachers`
--

LOCK TABLES `preachers` WRITE;
/*!40000 ALTER TABLE `preachers` DISABLE KEYS */;
INSERT INTO `preachers` VALUES ('HRVD','His Grace','Hiranyavarna Dasa',''),('KSD','His Grace','Karunya Sagara Dasa','Vice President'),('PKJD','His Grace','Pankajanghri Dasa','General Manager'),('PVPD','His Grace','Pavanaprana Dasa',''),('SKKD','His Grace','Sanaka Kumara Dasa',''),('SKS','His Holiness','Stoka Krishna Swami','President'),('SMRD','His Grace','Saumyarupa Krishna Dasa',''),('VSCD','His Grace','Vishnu Charana Dasa','');
/*!40000 ALTER TABLE `preachers` ENABLE KEYS */;
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
INSERT INTO `sources` VALUES ('Book Distribution'),('Campus Outreach'),('Carry Forward'),('FOLK Executive'),('General Preaching'),('Hostel Preaching'),('Reffered'),('Temple Counter');
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

-- Dump completed on 2022-05-24 17:02:07
