CREATE DATABASE  IF NOT EXISTS `afpms` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `afpms`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: afpms
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `afpms_circular_amount_info`
--

DROP TABLE IF EXISTS `afpms_circular_amount_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `afpms_circular_amount_info` (
  `id` bigint(19) unsigned NOT NULL,
  `afpms_circular_info_id` bigint(19) unsigned NOT NULL,
  `afpms_circular_categorization_info_id` bigint(19) unsigned NOT NULL,
  `amount` bigint(19) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `afpms_circular_amount_info`
--

LOCK TABLES `afpms_circular_amount_info` WRITE;
/*!40000 ALTER TABLE `afpms_circular_amount_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `afpms_circular_amount_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `afpms_circular_categorization_info`
--

DROP TABLE IF EXISTS `afpms_circular_categorization_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `afpms_circular_categorization_info` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT,
  `rank` varchar(20) NOT NULL,
  `group_id` int(10) NOT NULL,
  `service_period` float unsigned NOT NULL,
  `service_type` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `afpms_circular_categorization_info`
--

LOCK TABLES `afpms_circular_categorization_info` WRITE;
/*!40000 ALTER TABLE `afpms_circular_categorization_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `afpms_circular_categorization_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `afpms_circular_group_info`
--

DROP TABLE IF EXISTS `afpms_circular_group_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `afpms_circular_group_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `group_name` varchar(49) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `afpms_circular_group_info`
--

LOCK TABLES `afpms_circular_group_info` WRITE;
/*!40000 ALTER TABLE `afpms_circular_group_info` DISABLE KEYS */;
INSERT INTO `afpms_circular_group_info` VALUES (1,1,'OTHER THAN AMC/ADC/RVC/TA/MNS'),(2,2,'FROM AMC/ADC/RVC OTHER'),(3,3,'OFFICERS OF TERRITORIAL ARMY'),(4,4,'OFFICERS OF MILITARY NURSING SERVICE');
/*!40000 ALTER TABLE `afpms_circular_group_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `afpms_circular_info`
--

DROP TABLE IF EXISTS `afpms_circular_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `afpms_circular_info` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT,
  `circular_no` bigint(19) unsigned NOT NULL,
  `circular_issue_date` datetime DEFAULT NULL,
  `circular_effective_date` datetime NOT NULL,
  `circular_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `circular_no_UNIQUE` (`circular_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `afpms_circular_info`
--

LOCK TABLES `afpms_circular_info` WRITE;
/*!40000 ALTER TABLE `afpms_circular_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `afpms_circular_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `afpms_personal_info`
--

DROP TABLE IF EXISTS `afpms_personal_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `afpms_personal_info` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(32) DEFAULT NULL,
  `last_name` varchar(32) DEFAULT NULL,
  `address1` varchar(32) DEFAULT NULL,
  `address2` varchar(32) DEFAULT NULL,
  `street` varchar(32) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(32) DEFAULT NULL,
  `pincode` mediumint(8) unsigned DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `date_of_expiry` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `afpms_personal_info`
--

LOCK TABLES `afpms_personal_info` WRITE;
/*!40000 ALTER TABLE `afpms_personal_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `afpms_personal_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `afpms_personal_phone_info`
--

DROP TABLE IF EXISTS `afpms_personal_phone_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `afpms_personal_phone_info` (
  `afpms_personal_info_id` bigint(19) unsigned NOT NULL,
  `number` bigint(19) unsigned DEFAULT NULL,
  `type` enum('OFC','HMC','OFLL','HMLL','MOB') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `afpms_personal_phone_info`
--

LOCK TABLES `afpms_personal_phone_info` WRITE;
/*!40000 ALTER TABLE `afpms_personal_phone_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `afpms_personal_phone_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `afpms_personal_service_duration_info`
--

DROP TABLE IF EXISTS `afpms_personal_service_duration_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `afpms_personal_service_duration_info` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT,
  `afpms_personal_info_id` bigint(19) unsigned NOT NULL,
  `date_of_discharge` datetime NOT NULL,
  `date_of_enrollment` datetime NOT NULL,
  `service_period` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `afpms_personal_service_duration_info`
--

LOCK TABLES `afpms_personal_service_duration_info` WRITE;
/*!40000 ALTER TABLE `afpms_personal_service_duration_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `afpms_personal_service_duration_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `afpms_personal_service_identity_info`
--

DROP TABLE IF EXISTS `afpms_personal_service_identity_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `afpms_personal_service_identity_info` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT,
  `afpms_personal_info_id` bigint(19) unsigned NOT NULL,
  `service_no` int(11) NOT NULL,
  `membership_no` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `afpms_personal_service_identity_info`
--

LOCK TABLES `afpms_personal_service_identity_info` WRITE;
/*!40000 ALTER TABLE `afpms_personal_service_identity_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `afpms_personal_service_identity_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `afpms_personal_service_info`
--

DROP TABLE IF EXISTS `afpms_personal_service_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `afpms_personal_service_info` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT,
  `afpms_personal_info_id` bigint(19) unsigned NOT NULL,
  `afpms_circular_categorization_info_id` bigint(19) unsigned NOT NULL,
  `awards` varchar(45) DEFAULT NULL,
  `tn_membership_no` bigint(19) unsigned DEFAULT NULL,
  `trade` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `afpms_personal_service_info`
--

LOCK TABLES `afpms_personal_service_info` WRITE;
/*!40000 ALTER TABLE `afpms_personal_service_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `afpms_personal_service_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-10-11 22:37:20
