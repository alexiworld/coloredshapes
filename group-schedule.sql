-- MySQL dump 10.13  Distrib 5.5.24, for Win64 (x86)
--
-- Host: localhost    Database: group-schedule
-- ------------------------------------------------------
-- Server version	5.5.24-log

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
-- Table structure for table `org_employees`
--

DROP TABLE IF EXISTS `org_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_employees` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `create_user` varchar(64) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `update_user` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `connected` tinyint(1) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `per_day` double DEFAULT NULL,
  `per_week` double DEFAULT NULL,
  `member_key` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `short_name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `unit_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK46A4BEAE4045F3A` (`unit_id`),
  CONSTRAINT `FK46A4BEAE4045F3A` FOREIGN KEY (`unit_id`) REFERENCES `org_units` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_employees`
--

LOCK TABLES `org_employees` WRITE;
/*!40000 ALTER TABLE `org_employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_groups`
--

DROP TABLE IF EXISTS `org_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `create_user` varchar(64) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `update_user` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `budget` double DEFAULT NULL,
  `short_name` varchar(255) DEFAULT NULL,
  `per_day` double DEFAULT NULL,
  `per_week` double DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `unit_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK15985F8FE4045F3A` (`unit_id`),
  CONSTRAINT `FK15985F8FE4045F3A` FOREIGN KEY (`unit_id`) REFERENCES `org_units` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_groups`
--

LOCK TABLES `org_groups` WRITE;
/*!40000 ALTER TABLE `org_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_organizations`
--

DROP TABLE IF EXISTS `org_organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_organizations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `create_user` varchar(64) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `update_user` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `day_of_week` int(11) DEFAULT NULL,
  `logo` tinyblob,
  `logo_file_ext` varchar(255) DEFAULT NULL,
  `business_name` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `office_phone1` varchar(255) DEFAULT NULL,
  `office_phone2` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `short_name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_organizations`
--

LOCK TABLES `org_organizations` WRITE;
/*!40000 ALTER TABLE `org_organizations` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_units`
--

DROP TABLE IF EXISTS `org_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_units` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `create_user` varchar(64) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `update_user` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `per_day` double DEFAULT NULL,
  `per_week` double DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `office_phone1` varchar(255) DEFAULT NULL,
  `office_phone2` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `short_name` varchar(255) DEFAULT NULL,
  `organization_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7D54AE5485EB0CDA` (`organization_id`),
  CONSTRAINT `FK7D54AE5485EB0CDA` FOREIGN KEY (`organization_id`) REFERENCES `org_organizations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_units`
--

LOCK TABLES `org_units` WRITE;
/*!40000 ALTER TABLE `org_units` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_users`
--

DROP TABLE IF EXISTS `org_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `create_user` varchar(64) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `update_user` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_key` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `organization_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7D56E4ED85EB0CDA` (`organization_id`),
  CONSTRAINT `FK7D56E4ED85EB0CDA` FOREIGN KEY (`organization_id`) REFERENCES `org_organizations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_users`
--

LOCK TABLES `org_users` WRITE;
/*!40000 ALTER TABLE `org_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `create_user` varchar(64) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `update_user` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `end_time` datetime NOT NULL,
  `note` longtext,
  `notification_sent` tinyint(1) DEFAULT NULL,
  `schedule_key` bigint(20) DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `unit_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`start_time`,`end_time`),
  KEY `FKD6669297CB5F615A` (`group_id`),
  KEY `FKD6669297E4045F3A` (`unit_id`),
  CONSTRAINT `FKD6669297CB5F615A` FOREIGN KEY (`group_id`) REFERENCES `org_groups` (`id`),
  CONSTRAINT `FKD6669297E4045F3A` FOREIGN KEY (`unit_id`) REFERENCES `org_units` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduleepositions`
--

DROP TABLE IF EXISTS `scheduleepositions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduleepositions` (
  `position` varchar(255) NOT NULL,
  `schedulee_key` varchar(255) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `per_day` double DEFAULT NULL,
  `per_week` double DEFAULT NULL,
  `rate` double DEFAULT NULL,
  PRIMARY KEY (`position`,`schedulee_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduleepositions`
--

LOCK TABLES `scheduleepositions` WRITE;
/*!40000 ALTER TABLE `scheduleepositions` DISABLE KEYS */;
/*!40000 ALTER TABLE `scheduleepositions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduleeshift`
--

DROP TABLE IF EXISTS `scheduleeshift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduleeshift` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `create_user` varchar(64) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `update_user` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `ext_key` bigint(20) DEFAULT NULL,
  `end_time` datetime NOT NULL,
  `position` varchar(255) NOT NULL,
  `schedulee_key` varchar(255) DEFAULT NULL,
  `sfr_key` varchar(255) DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `schedule_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ext_key` (`ext_key`),
  KEY `FK265CE8943220625A` (`schedule_id`),
  CONSTRAINT `FK265CE8943220625A` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduleeshift`
--

LOCK TABLES `scheduleeshift` WRITE;
/*!40000 ALTER TABLE `scheduleeshift` DISABLE KEYS */;
/*!40000 ALTER TABLE `scheduleeshift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedulorpermissions`
--

DROP TABLE IF EXISTS `schedulorpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedulorpermissions` (
  `group_key` varchar(255) NOT NULL,
  `organization_key` varchar(255) NOT NULL,
  `schedulor_key` varchar(255) NOT NULL,
  `unit_key` varchar(255) NOT NULL,
  PRIMARY KEY (`group_key`,`organization_key`,`schedulor_key`,`unit_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedulorpermissions`
--

LOCK TABLES `schedulorpermissions` WRITE;
/*!40000 ALTER TABLE `schedulorpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedulorpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sfr`
--

DROP TABLE IF EXISTS `sfr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sfr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `create_user` varchar(64) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `update_user` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `accepted_time` datetime DEFAULT NULL,
  `end_time` datetime NOT NULL,
  `sfr_key` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `schedule_key` bigint(20) DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `taken_by_member` bigint(20) DEFAULT NULL,
  `unit_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sfr_key` (`sfr_key`),
  KEY `FK1BC7FB14A3AB8` (`taken_by_member`),
  KEY `FK1BC7FCB5F615A` (`group_id`),
  KEY `FK1BC7FE4045F3A` (`unit_id`),
  CONSTRAINT `FK1BC7FB14A3AB8` FOREIGN KEY (`taken_by_member`) REFERENCES `org_employees` (`id`),
  CONSTRAINT `FK1BC7FCB5F615A` FOREIGN KEY (`group_id`) REFERENCES `org_groups` (`id`),
  CONSTRAINT `FK1BC7FE4045F3A` FOREIGN KEY (`unit_id`) REFERENCES `org_units` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sfr`
--

LOCK TABLES `sfr` WRITE;
/*!40000 ALTER TABLE `sfr` DISABLE KEYS */;
/*!40000 ALTER TABLE `sfr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sfr_schedulee_shift`
--

DROP TABLE IF EXISTS `sfr_schedulee_shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sfr_schedulee_shift` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `create_user` varchar(64) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `update_user` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `ext_key` bigint(20) DEFAULT NULL,
  `end_time` datetime NOT NULL,
  `position` varchar(255) NOT NULL,
  `rejected` tinyint(1) NOT NULL,
  `schedulee_key` varchar(255) DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `sfr_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ext_key` (`ext_key`),
  KEY `FKDA2A09F12CCE9D5A` (`sfr_id`),
  CONSTRAINT `FKDA2A09F12CCE9D5A` FOREIGN KEY (`sfr_id`) REFERENCES `sfr` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sfr_schedulee_shift`
--

LOCK TABLES `sfr_schedulee_shift` WRITE;
/*!40000 ALTER TABLE `sfr_schedulee_shift` DISABLE KEYS */;
/*!40000 ALTER TABLE `sfr_schedulee_shift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template`
--

DROP TABLE IF EXISTS `template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `create_user` varchar(64) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `update_user` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB13ACC7ACB5F615A` (`group_id`),
  CONSTRAINT `FKB13ACC7ACB5F615A` FOREIGN KEY (`group_id`) REFERENCES `org_groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template`
--

LOCK TABLES `template` WRITE;
/*!40000 ALTER TABLE `template` DISABLE KEYS */;
/*!40000 ALTER TABLE `template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_schedulee_shift`
--

DROP TABLE IF EXISTS `template_schedulee_shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_schedulee_shift` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `create_user` varchar(64) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `update_user` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `endTime` datetime NOT NULL,
  `position` varchar(255) NOT NULL,
  `scheduleeKey` varchar(255) DEFAULT NULL,
  `startTime` datetime NOT NULL,
  `template_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3F1C3EC6BF0F37A` (`template_id`),
  CONSTRAINT `FK3F1C3EC6BF0F37A` FOREIGN KEY (`template_id`) REFERENCES `template` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_schedulee_shift`
--

LOCK TABLES `template_schedulee_shift` WRITE;
/*!40000 ALTER TABLE `template_schedulee_shift` DISABLE KEYS */;
/*!40000 ALTER TABLE `template_schedulee_shift` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-01 13:50:55
