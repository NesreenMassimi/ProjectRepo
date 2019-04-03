CREATE DATABASE  IF NOT EXISTS `test_med_sol_upgrade` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `test_med_sol_upgrade`;
-- MySQL dump 10.13  Distrib 8.0.15, for macos10.14 (x86_64)
--
-- Host: localhost    Database: test_med_sol_upgrade
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add user',3,'add_user'),(10,'Can change user',3,'change_user'),(11,'Can delete user',3,'delete_user'),(12,'Can view user',3,'view_user'),(13,'Can add group',4,'add_group'),(14,'Can change group',4,'change_group'),(15,'Can delete group',4,'delete_group'),(16,'Can view group',4,'view_group'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add post',7,'add_post'),(26,'Can change post',7,'change_post'),(27,'Can delete post',7,'delete_post'),(28,'Can view post',7,'view_post'),(29,'Can add speciality',8,'add_speciality'),(30,'Can change speciality',8,'change_speciality'),(31,'Can delete speciality',8,'delete_speciality'),(32,'Can view speciality',8,'view_speciality'),(33,'Can add user',9,'add_user'),(34,'Can change user',9,'change_user'),(35,'Can delete user',9,'delete_user'),(36,'Can view user',9,'view_user'),(37,'Can add user education',10,'add_usereducation'),(38,'Can change user education',10,'change_usereducation'),(39,'Can delete user education',10,'delete_usereducation'),(40,'Can view user education',10,'view_usereducation'),(41,'Can add user profile',11,'add_userprofile'),(42,'Can change user profile',11,'change_userprofile'),(43,'Can delete user profile',11,'delete_userprofile'),(44,'Can view user profile',11,'view_userprofile');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (1,'admin','logentry'),(4,'auth','group'),(2,'auth','permission'),(3,'auth','user'),(5,'contenttypes','contenttype'),(7,'main','post'),(8,'main','speciality'),(9,'main','user'),(10,'main','usereducation'),(11,'main','userprofile'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (1,'contenttypes','0001_initial','2019-03-24 07:17:16.978962'),(2,'auth','0001_initial','2019-03-24 07:17:17.656306'),(3,'admin','0001_initial','2019-03-24 07:17:17.760035'),(4,'admin','0002_logentry_remove_auto_add','2019-03-24 07:17:17.772244'),(5,'admin','0003_logentry_add_action_flag_choices','2019-03-24 07:17:17.783933'),(6,'contenttypes','0002_remove_content_type_name','2019-03-24 07:17:17.923678'),(7,'auth','0002_alter_permission_name_max_length','2019-03-24 07:17:17.982131'),(8,'auth','0003_alter_user_email_max_length','2019-03-24 07:17:18.053015'),(9,'auth','0004_alter_user_username_opts','2019-03-24 07:17:18.089357'),(10,'auth','0005_alter_user_last_login_null','2019-03-24 07:17:18.141619'),(11,'auth','0006_require_contenttypes_0002','2019-03-24 07:17:18.145142'),(12,'auth','0007_alter_validators_add_error_messages','2019-03-24 07:17:18.157045'),(13,'auth','0008_alter_user_username_max_length','2019-03-24 07:17:18.265802'),(14,'auth','0009_alter_user_last_name_max_length','2019-03-24 07:17:18.376066'),(15,'sessions','0001_initial','2019-03-24 07:17:18.419096'),(16,'main','0001_initial','2019-03-24 07:30:58.591472'),(17,'main','0002_auto_20190328_0822','2019-03-28 08:22:39.686512'),(18,'main','0003_auto_20190328_0940','2019-03-29 19:09:46.296748'),(19,'main','0004_auto_20190328_0946','2019-03-29 19:09:46.304659'),(20,'main','0005_auto_20190328_0952','2019-03-29 19:09:46.312077'),(21,'main','0006_auto_20190329_1933','2019-03-29 19:34:58.219283');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` tinytext NOT NULL,
  `created` date DEFAULT NULL,
  `updated` date DEFAULT NULL,
  `speciality_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_post_speciality1_idx` (`speciality_id`),
  CONSTRAINT `fk_post_speciality_speciality_id` FOREIGN KEY (`speciality_id`) REFERENCES `speciality` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `speciality`
--

DROP TABLE IF EXISTS `speciality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `speciality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) NOT NULL,
  `name` varchar(200) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `speciality`
--

LOCK TABLES `speciality` WRITE;
/*!40000 ALTER TABLE `speciality` DISABLE KEYS */;
INSERT INTO `speciality` (`id`, `code`, `name`, `created`, `updated`) VALUES (1,'allergy-and-immunology','Allergy and Immunology','2016-08-12 10:34:00','2016-08-12 10:34:00'),(2,'anesthesiology','Anesthesiology','2016-08-12 10:34:01','2016-08-12 10:38:34'),(3,'colon-and-rectal-surgery','Colon and Rectal Surgery','2016-08-12 10:34:01','2016-08-12 10:38:34'),(4,'dermatology','Dermatology','2016-08-12 10:34:01','2016-08-12 10:38:35'),(5,'emergency-medicine','Emergency Medicine','2016-08-12 10:34:02','2016-08-12 10:38:35'),(6,'family-medicine','Family Medicine','2016-08-12 10:34:02','2016-08-12 10:38:35'),(7,'internal-medicine','Internal Medicine','2016-08-12 10:34:02','2016-08-12 10:38:42'),(8,'medical-genetics-and-genomics','Medical Genetics and Genomics','2016-08-12 10:34:03','2016-08-12 10:38:44'),(9,'neurology','Neurology','2016-08-12 10:34:03','2016-08-12 10:38:48'),(10,'neurological-surgery','Neurological Surgery','2016-08-12 10:34:03','2016-08-12 10:38:53'),(11,'nuclear-medicine','Nuclear Medicine','2016-08-12 10:34:04','2016-08-12 10:38:55'),(12,'obstetrics-and-gynecology','Obstetrics and Gynecology','2016-08-12 10:34:04','2016-08-12 10:38:58'),(13,'ophthalmology','Ophthalmology','2016-08-12 10:34:05','2016-08-12 10:39:00'),(14,'orthopaedic-surgery','Orthopaedic Surgery','2016-08-12 10:34:05','2016-08-12 10:39:01'),(15,'otolaryngology','Otolaryngology','2016-08-12 10:34:05','2016-08-12 10:39:03'),(16,'pathology','Pathology','2016-08-12 10:34:06','2016-08-12 10:39:04'),(17,'pediatrics','Pediatrics','2016-08-12 10:34:06','2016-08-12 10:39:05'),(18,'physical-medicine-and-rehabilitation','Physical Medicine and Rehabilitation','2016-08-12 10:34:06','2016-08-12 10:39:06'),(19,'plastic-surgery','Plastic Surgery','2016-08-12 10:34:07','2016-08-12 10:39:07'),(20,'preventive-medicine','Preventive Medicine','2016-08-12 10:34:07','2016-08-12 10:39:08'),(21,'psychiatry','Psychiatry','2016-08-12 10:34:07','2016-08-12 10:39:09'),(22,'radiology','Radiology','2016-08-12 10:34:08','2016-08-12 10:39:11'),(23,'surgery','Surgery','2016-08-12 10:34:08','2016-08-12 10:39:12'),(24,'thoracic-surgery','Thoracic Surgery','2016-08-12 10:34:08','2016-08-12 10:39:13'),(25,'urology','Urology','2016-08-12 10:34:09','2016-08-12 10:39:14'),(26,'cardiology','Cardiology','2016-08-12 10:47:06','2016-08-12 10:47:06'),(27,'critical-care-medicine','Critical Care Medicine','2016-08-12 10:47:06','2016-08-12 10:47:06'),(28,'endocrinology-diabetes-and-metabolism','Endocrinology, Diabetes and Metabolism','2016-08-12 10:47:07','2016-08-12 10:47:07'),(29,'gastroenterology','Gastroenterology','2016-08-12 10:47:07','2016-08-12 10:47:07'),(30,'geriatric-medicine','Geriatric Medicine','2016-08-12 10:47:07','2016-08-12 10:47:07'),(31,'hematology','Hematology','2016-08-12 10:47:08','2016-08-12 10:47:08'),(32,'hospice-and-palliative-medicine','Hospice and Palliative Medicine','2016-08-12 10:47:08','2016-08-12 10:47:08'),(33,'infectious-disease','Infectious Disease','2016-08-12 10:47:09','2016-08-12 10:47:09'),(34,'medical-oncology','Medical Oncology','2016-08-12 10:47:09','2016-08-12 10:47:09'),(35,'nephrology','Nephrology','2016-08-12 10:47:09','2016-08-12 10:47:09'),(36,'pulmonary-disease','Pulmonary Disease','2016-08-12 10:47:10','2016-08-12 10:47:10'),(37,'rheumatology','Rheumatology','2016-08-12 10:47:10','2016-08-12 10:47:10'),(38,'sleep-medicine','Sleep Medicine','2016-08-12 10:47:10','2016-08-12 10:47:10'),(39,'sports-medicine','Sports Medicine','2016-08-12 10:47:11','2016-08-12 10:47:11'),(40,'transplant-hepatology','Transplant Hepatology','2016-08-12 10:47:11','2016-08-12 10:47:11'),(41,'adolescent-medicine','Adolescent Medicine','2016-08-12 10:50:05','2016-08-12 10:50:05'),(42,'child-abuse','Child Abuse','2016-08-12 10:50:06','2016-08-12 10:50:06'),(43,'developmental-behavioral-pediatrics','Developmental-Behavioral Pediatrics','2016-08-12 10:50:06','2016-08-12 10:50:06'),(44,'hospice-and-palliative-medicine-1','Hospice and Palliative Medicine','2016-08-12 10:56:47','2016-08-12 10:56:47'),(45,'medical-toxicology','Medical Toxicology','2016-08-12 10:56:47','2016-08-12 10:56:47'),(46,'neonatal-perinatal-medicine','Neonatal-Perinatal Medicine','2016-08-12 10:56:48','2016-08-12 10:56:48'),(47,'pediatric-cardiology','Pediatric Cardiology','2016-08-12 10:56:48','2016-08-12 10:56:48'),(48,'pediatric-critical-care-medicine','Pediatric Critical Care Medicine','2016-08-12 10:56:49','2016-08-12 10:56:49'),(49,'pediatric-emergency-medicine','Pediatric Emergency Medicine','2016-08-12 10:56:49','2016-08-12 10:56:49'),(50,'pediatric-endocrinology','Pediatric Endocrinology','2016-08-12 10:56:49','2016-08-12 10:56:49'),(51,'pediatric-gastroenterology','Pediatric Gastroenterology','2016-08-12 10:56:50','2016-08-12 10:56:50'),(52,'pediatric-hematology-oncology','Pediatric Hematology-Oncology','2016-08-12 10:56:50','2016-08-12 10:56:50'),(53,'pediatric-infectious-diseases','Pediatric Infectious Diseases','2016-08-12 10:56:51','2016-08-12 10:56:51'),(54,'pediatric-nephrology','Pediatric Nephrology','2016-08-12 10:56:51','2016-08-12 10:56:51'),(55,'pediatric-neurology','Pediatric Neurology','2016-08-12 10:56:51','2016-08-12 10:56:51'),(56,'pediatric-pulmonology','Pediatric Pulmonology','2016-08-12 10:56:52','2016-08-12 10:56:52'),(57,'pediatric-rheumatology','Pediatric Rheumatology','2016-08-12 10:56:52','2016-08-12 10:56:52'),(58,'pediatric-surgery','Pediatric Surgery','2016-08-12 10:56:52','2016-08-12 10:56:52'),(59,'pediatric-transplant-hepatology','Pediatric Transplant Hepatology','2016-08-12 10:56:53','2016-08-12 10:56:53'),(60,'sleep-medicine-1','Sleep Medicine','2016-08-12 10:56:53','2016-08-12 10:56:53'),(61,'sports-medicine-1','Sports Medicine','2016-08-12 10:56:54','2016-08-12 10:56:54'),(62,'dentistry','Dentistry','2017-03-04 09:09:55','2017-03-04 09:09:55'),(63,'oral-maxillofacial-surgery','Oral and Maxillofacial Surgery','2017-03-04 09:10:22','2017-03-04 09:10:42'),(65,'nursing','nursing','2018-03-27 11:45:42','2018-03-27 11:45:42');
/*!40000 ALTER TABLE `speciality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(128) NOT NULL,
  `user_type` varchar(45) NOT NULL,
  `created` date DEFAULT NULL,
  `updated` date DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `profile_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `Email_UNIQUE` (`email`),
  UNIQUE KEY `user_profile_id_9c2a73e9_uniq` (`profile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `password`, `user_type`, `created`, `updated`, `last_login`, `profile_id`) VALUES (1,'\"nesreen\"','\"massimi\"','\"n@gmail.com\"','\"1234\"','\"student\"','2019-03-01','2019-03-24',NULL,NULL),(2,'\"nesreen2\"','\"massimi2\"','\"n2@gmail.com\"','\"324\"','\"sty\"','2019-02-05','2019-10-02',NULL,NULL),(3,'',NULL,'','','',NULL,NULL,NULL,NULL),(9,'adam','massimi','am2@gmail.com','332445','s','2019-03-04','2019-07-06',NULL,NULL),(10,'ada','massimi','a2@gmail.com','332445','s','2019-03-04','2019-07-06',NULL,NULL),(11,'ad','massi','a2212@gmail.com','3332e','s','2019-03-04','2019-07-06',NULL,NULL),(13,'ad','massi','mmm@gmail.com','3332e','s','2019-03-04','2019-07-06',NULL,NULL),(14,'mai','aziz','mai3@gmail.com','pbkdf2_sha256$120000$wNM2o7BB3Jf6$140+g1KyTWmBCUFsYdfE+cZcCmq6aIPzfZdyM8sggZ4=','s','2019-03-04','2019-07-06',NULL,NULL),(15,'am','ma','maam@gmail.com','pbkdf2_sha256$120000$UWCrVz8j916F$36eYGl6jf5gc28Ev/FleHPNKcqTDeFMTCYSOFqwEbyA=','s','2019-03-04','2019-07-06',NULL,NULL),(17,'ansam','awwad','ansam@gmail.com','pbkdf2_sha256$120000$WmpgDosqaNCQ$ARunhTyEW05peqKq74ILtJUaQubtFN7UyGEkplsYDpE=','s','2019-03-04','2019-07-06',NULL,NULL),(18,'ansam22','awwad22','ansam22@gmail.com','pbkdf2_sha256$120000$TvFNDRamVAg0$KoEXy8gdoFJaR5/CckU9ggqFv2dUwe5bzVmCVMQ2QnM=','s','2019-03-04','2019-07-06',NULL,NULL),(19,'m','d','md@gmail.com','pbkdf2_sha256$120000$nRTxwFispujs$UEJvwFUx61jY2kT44pOy7gcmYMFmp2VYN/e3BPEII+A=','s','2019-03-04','2019-07-06',NULL,NULL),(20,'tala','tal','tala@gmail.com','pbkdf2_sha256$120000$dSoETRbJvHpb$n3VuRDB6EVWf5gLbFOykM8IB/mqgEhxjx2ohu5uZ69U=','s','2019-03-04','2019-07-06',NULL,NULL),(21,'waed','waw','www@gmail.com','pbkdf2_sha256$120000$8yuHaLuRL2BI$3FlTJ51dUtxJILVqVftc1wPuelq+5u3MokkAskbnFvM=','s','2018-03-02','2018-07-04',NULL,NULL),(22,'ad3','ma33','lool20@gmail.com','pbkdf2_sha256$120000$2oChsPKqQrve$MJVljtETj1D7l/NbADGWnQfgcWGuOePpi+MQCzi7ol4=','s','2019-03-04','2019-07-06',NULL,NULL),(23,'aaa','aaaa','aoao20@gmail.com','pbkdf2_sha256$120000$EpQrC7J44i6z$NpTQE4l7WCjLNXbeN+umfmdiIycYvx8INgGUlGvIeVs=','s','2019-03-04','2019-07-06',NULL,NULL),(24,'aadd3','mad33','loool2@gmail.com','pbkdf2_sha256$120000$UTODOdeotoQW$oyX+Cdw4aXiGqIosdQh1ExOakdiBDKkH1pFvJqqAJE4=','s','2019-03-04','2019-07-06',NULL,NULL),(25,'a','b','a@gmail.com','pbkdf2_sha256$120000$6u8t4LlBdO2h$2gi2vfC5ZK8Vrm99L/Yqig2/TOHKlWsOXgGFTmjP9U8=','s','2019-03-04','2019-07-06',NULL,NULL),(26,'b','c','absd@gmail.com','pbkdf2_sha256$120000$2tTo6Byh3Q0A$AjDMaEej0SiZT0x4lWT7wXiGP10+hbRkzv6Ntvym3HM=','s','2019-03-04','2019-07-06',NULL,NULL),(27,'nour','n','nournana@gmail.com','pbkdf2_sha256$120000$ASFjuIZhunUn$yu6QVCrb/PgLoxNQUHSZ11NsoyJS48ZJy2U74ZqmENw=','s','2019-03-04','2019-07-06',NULL,NULL),(28,'nor','n','nou22a@gmail.com','pbkdf2_sha256$120000$3rmWjONpSQVn$7PK7oaXWvHEqNw64VuD4ENY0KWBkYItVBe3FhWprUpA=','s','2019-03-04','2019-07-06',NULL,NULL),(29,'no','n','abcdf@gmail.com','pbkdf2_sha256$120000$uFu35CtACVun$m4lVR0M9vOwa9A3KyTkohNwjhZo58hxCF7EO9m4MS+o=','s','2019-03-04','2019-07-06',NULL,NULL),(30,'abcdef','n','abcdefghi@gmail.com','pbkdf2_sha256$120000$7BBbTMWpNhVZ$CVa+gpIZtCGzOO18oYCU9nByre7hDxlXE4GZXfIu6Ts=','s','2019-03-04','2019-07-06',NULL,NULL),(31,'test','testing','test@gmail.com','pbkdf2_sha256$120000$tMsN4hEcjKOG$ktHa8el3ZZbWRf2sKOEsQAsudo9Fm9pRsRr/8Ycam6k=','s','2019-03-04','2019-07-06',NULL,NULL),(32,'test2','testing2','test2@gmail.com','pbkdf2_sha256$120000$RZhEJeZBkd7H$UYKtO82kmtidjg27QifRjVLoP+ES3/BqMcM0AoHblsk=','s','2019-03-04','2019-07-06',NULL,NULL),(33,'test3','testing3','test3@gmail.com','pbkdf2_sha256$120000$S6p8c6eQDWdC$KAm0wG4+WWXlRHddioO8A2bCAYff42cbf95EakZ47Oc=','s','2019-03-04','2019-07-06',NULL,NULL),(34,'test4','testing4','test4@gmail.com','pbkdf2_sha256$120000$wqPMheM0fXeZ$bjf53jdRd1tG2p3hEQ1rc6C8dAwmF2bC3FAEbxxqDO8=','s','2019-03-04','2019-07-06',NULL,NULL),(35,'test5','test5','test5@gmail.com','pbkdf2_sha256$120000$ZDHZ88ylr4y2$r89b6ET0LFUlt5BXEsjJ7oLPWCMv1ZrDcc0XP6gTujI=','stu','2018-03-06','2019-03-06',NULL,NULL),(36,'test6','testing6','test6@gmail.com','pbkdf2_sha256$120000$df6SFY1gXJTn$T7DVBQQCYn5fbwGGnBZdnfYcSL6Pkgz8GDsbXIAKkBk=','ss','2018-02-03','2019-03-25',NULL,NULL),(37,'test6','testing6','test7@gmail.com','pbkdf2_sha256$120000$M9r3cDzDSMqK$ZkFlvMOKB5i+c4PW0rs0I9f9p2GUoHUJSkdWD+eg1NM=','ss','2018-02-03','2019-03-25',NULL,NULL),(38,'test6','testing6','test8@gmail.com','pbkdf2_sha256$120000$CBMzk5AixeD8$K+Kuq5qYaQnvOZ+iiIou0RFrEeaZR0FQFAFaUlmjYMA=','ss','2018-02-03','2019-03-25',NULL,NULL),(39,'test6','testing6','test9@gmail.com','pbkdf2_sha256$120000$5QlwdV4tgmWg$Cx27bVX48aF8xDLRSjTso3T8xjcJ3OQdM39jjRhEa/U=','ss','2018-02-03','2019-03-25',NULL,NULL),(40,'test6','testing6','test10@gmail.com','pbkdf2_sha256$120000$CEdEcPCbAwLf$KciKMn8ArYktsUQ1JffXz1vuXudV/3TNt8E589NkRDg=','ss','2018-02-03','2019-03-25',NULL,NULL),(41,'test11','testing11','test11@gmail.com','pbkdf2_sha256$120000$AzWemKO0nopv$clMD1lDPKxlp7Nzi2EZ5beCazJRNlOa7/0k6PTAkMec=','stu','2018-03-02','2019-03-30',NULL,NULL),(43,'test12','testing12','test12@gmail.com','pbkdf2_sha256$120000$b0hHzpZYixsl$gs80u5wuR7VeGfBwe8fgETzIeZ3uaADsXwsgvx22Cvc=','stu','2018-03-02','2019-03-30',NULL,NULL),(44,'test13','testing13','test13@gmail.com','pbkdf2_sha256$120000$VnUyQn3PqX5p$UMBas0j1iMR/nV+ruRv7LvbRVB+jaft1F69Zv9RPcWA=','stu','2018-02-25','2019-03-29',NULL,NULL),(46,'test14','testing14','test14@gmail.com','pbkdf2_sha256$120000$CZ4ARrnmP6s0$5V3yRwwORDYCISL9QTL55A1Bhi0FPhiDMu6FouznFdM=','stu','2002-02-02','2003-03-03',NULL,NULL),(47,'test16','testing16','test16@gmail.com','pbkdf2_sha256$120000$St2fPQqbtba9$up7137omfSBA3gPzcfEHNVNgcz2effBrun/Hninybas=','stu','2009-09-08','2018-07-08',NULL,NULL),(48,'test17','testing17','test17@gmail.com','pbkdf2_sha256$120000$CzhSK8APgeGU$UwsSkLXlocK89GitrnMbo0/GNBM7ustidkwaACHBIC4=','stu','2018-03-04','2019-03-20',NULL,NULL),(51,'test18','testing18','test18@gmail.com','pbkdf2_sha256$120000$6AyVchZ49k24$YUqxK1kSyKufLMgu3KqLmaePU42QAmi+AeiryQqZ00o=','stu','2018-02-03','2019-03-29',NULL,NULL),(52,'test','testing','test20@gmail.com','pbkdf2_sha256$120000$tNo370G4Xtfv$cmSvhWU2s1xS6mkUnqIRBIJ0WrpSAyZfHm9zne59+V0=','stu','2018-05-04','2019-04-03',NULL,NULL),(54,'test2','testng6','test22@gmail.com','pbkdf2_sha256$120000$VNdYSyDXYyiG$1ZTayG56SZFsDyUJ4IFtYFmSWFQ8zW7yztjOdiL9zuo=','ss','2018-02-03','2019-03-25',NULL,NULL),(55,'test2','testng6','test23@gmail.com','pbkdf2_sha256$120000$NztOWI9Mz60y$Ler1k/KMSab1VcwS4mh684ldIg/gZUhZczGnmpzQA/Y=','ss','2018-02-03','2019-03-25',NULL,NULL),(56,'test2','testng6','test24@gmail.com','pbkdf2_sha256$120000$QvddBN6uv95K$p9VPkapGVGsFYr+gQTnFM4ErsWdLFcTKj/oE5IZ/M9E=','ss','2018-02-03','2019-03-25',NULL,NULL),(57,'test2','testng6','test25@gmail.com','pbkdf2_sha256$120000$GKE8715ZR6ZZ$TtXWRioWUGUkKF5s7MYeLFVETary8su9LWW6snQmgDs=','ss','2018-02-03','2019-03-25',NULL,NULL),(58,'test2','testng6','test26@gmail.com','pbkdf2_sha256$120000$SOiemxO9CEgU$CkTUF90tz5+e320BCSsXR3U2qhGRNWXboB/Up/9RcH0=','ss','2018-02-03','2019-03-25',NULL,NULL),(59,'test2','testng6','test27@gmail.com','pbkdf2_sha256$120000$LDaDJMJraT7M$INR+R1v9EalY/EdbQS0pokX5jgexj94q9YKjazAwR6A=','ss','2018-02-03','2019-03-25',NULL,NULL),(61,'test2','testng6','test30@gmail.com','pbkdf2_sha256$120000$ioJnzNYLbsaQ$X9bnfA9pYnMLRSfQGnQlUyrSPeQltcw9L29ugkLyF4Q=','ss','2018-02-03','2019-03-25',NULL,NULL),(64,'test2','testng6','test33@gmail.com','pbkdf2_sha256$120000$UHOjwkOZwqZP$B1lJ4NlcEaFHohK0MkEqvVh40C8oWfGe3rER3iJ9zB4=','ss','2018-02-03','2019-03-25',NULL,NULL),(65,'test2','testng6','test34@gmail.com','pbkdf2_sha256$120000$IenExT3j5zfB$yaGTG/ZhWj0h4mecs1ZBirZVYBvxE8joSP/TwPUTYfY=','ss','2018-02-03','2019-03-25',NULL,NULL),(66,'test2','testng6','test35@gmail.com','pbkdf2_sha256$120000$mRoL9rXVH0D3$U0cU6DmpcoKz8GJsgTZ6sc5MoAP/jseyzuS2eK8+AMw=','ss','2018-02-03','2019-03-25',NULL,NULL),(67,'test2','testng6','test38@gmail.com','pbkdf2_sha256$120000$8hVWfyCacWo0$9Zv2MAf2ws/VB5zEiFM96F9KgGfynDIwAMRjZxpqjiY=','ss','2018-02-03','2019-03-25',NULL,NULL),(68,'test2','testng6','test39@gmail.com','pbkdf2_sha256$120000$nZ3jZo6jvXwe$HNtWyDNEkKXvMzyfu2weBU31fJ1KoMUdOQexrHPZ/MU=','ss','2018-02-03','2019-03-25',NULL,NULL),(69,'test2','testng6','test50@gmail.com','pbkdf2_sha256$120000$bc7iyA5n7yx6$088qiUrCuvaoTxhyuukyXot/lFU92+a4QyFZ51CobBI=','ss','2018-02-03','2019-03-25',NULL,NULL),(70,'test2','testng6','test52@gmail.com','pbkdf2_sha256$120000$f8HlEqPs8q6Y$xOnByE5DD8xpW7RebdBV8F/iW6c8t4CFHn64rLl4sNQ=','ss','2018-02-03','2019-03-25',NULL,NULL),(71,'test2','testng6','test56@gmail.com','pbkdf2_sha256$120000$iBGxO8mCj7Hw$POrnun3ElX3uVVvigQEW2FOIgCLmo4hImjikXvms/ZE=','ss','2018-02-03','2019-03-25',NULL,NULL),(73,'test2','testng6','test57@gmail.com','pbkdf2_sha256$120000$ResycrF6rXod$9T8fqA+4p12jAdeVordrvUDtd5xqHD8rgSYIZBR/2SM=','ss','2018-02-03','2019-03-25',NULL,NULL),(74,'test2','testng6','test58@gmail.com','pbkdf2_sha256$120000$pwMONpn0MpHH$OKhIUSH0iMyxuiHLlSzWCEeuhoxi7XJp5N0B5fHD5uc=','ss','2018-02-03','2019-03-25',NULL,NULL),(75,'test2','testng6','test59@gmail.com','pbkdf2_sha256$120000$Cc5nmglF6kUD$ucobcqEGf8DY7rdvkT3XXTPk0XMc2fjLC2yEB8ADRAI=','ss','2018-02-03','2019-03-25',NULL,NULL),(76,'test2','testng6','test60@gmail.com','pbkdf2_sha256$120000$nuM2lRwYuArG$0Uy7HmOeJx0I8AcCsFejitedw3W4JXZ6HjDxyW2rIj0=','ss','2018-02-03','2019-03-25',NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_education`
--

DROP TABLE IF EXISTS `user_education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_education` (
  `institution_name` varchar(45) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created` date NOT NULL,
  `updated` date NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_education_user1_idx` (`user_id`),
  CONSTRAINT `fk_user_education_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_education`
--

LOCK TABLES `user_education` WRITE;
/*!40000 ALTER TABLE `user_education` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_profile` (
  `weight` float NOT NULL,
  `height` float NOT NULL,
  `about` tinytext,
  `license_number` int(11) NOT NULL,
  `created` date DEFAULT NULL,
  `updated` date DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `License_number_UNIQUE` (`license_number`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_user_profile_user1_idx` (`users_id`),
  CONSTRAINT `fk_user_user_profile_user_id` FOREIGN KEY (`users_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` (`weight`, `height`, `about`, `license_number`, `created`, `updated`, `id`, `users_id`) VALUES (51,159,'\"about text\"',19001800,'2019-10-03','2019-02-05',1,1),(60.7,160.3,'\"about about\"',331170,'2019-03-02','2019-02-03',2,2),(60.4,159.8,'test',15645,'2019-02-02','2019-03-04',3,48),(60.4,159.8,'test',33290,'2019-02-02','2019-03-04',4,48),(60.4,159.8,'test',12290,'2019-02-02','2019-03-04',5,48),(60.4,159.8,'test',1890,'2019-02-02','2019-03-04',6,71),(60.4,159.8,'test',188190,'2019-02-02','2019-03-04',7,71),(60.4,159.8,'test',18821190,'2019-02-02','2019-03-04',8,75);
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'test_med_sol_upgrade'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-03 10:20:08
