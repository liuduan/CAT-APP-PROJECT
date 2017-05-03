-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: catapp
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `assaynames`
--

DROP TABLE IF EXISTS `assaynames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assaynames` (
  `entity_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `tag` varchar(20) DEFAULT NULL,
  `dsc` varchar(100) DEFAULT NULL,
  `logged_date` datetime DEFAULT NULL,
  `logged_by` bigint(20) DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  `last_updated_by` bigint(20) DEFAULT NULL,
  `is_active` varchar(1) DEFAULT NULL,
  `rowstate` int(11) DEFAULT NULL,
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assaynames`
--

LOCK TABLES `assaynames` WRITE;
/*!40000 ALTER TABLE `assaynames` DISABLE KEYS */;
INSERT INTO `assaynames` VALUES (1,'Cell membrane integrity','CMFDA',NULL,NULL,NULL,NULL,NULL,'Y',1),(2,'Reactive Oxygen Species','ROS',NULL,NULL,NULL,NULL,NULL,'Y',1),(3,'Apoptosis','CASP',NULL,NULL,NULL,NULL,NULL,'Y',1),(4,'Protein synthesis inhibition','PROT',NULL,NULL,NULL,NULL,NULL,'Y',1),(5,'ATP Quantitation Assay','ATP',NULL,NULL,NULL,NULL,NULL,'Y',1);
/*!40000 ALTER TABLE `assaynames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celllines`
--

DROP TABLE IF EXISTS `celllines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `celllines` (
  `entity_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `tag` varchar(100) DEFAULT NULL,
  `dsc` varchar(100) DEFAULT NULL,
  `logged_date` datetime DEFAULT NULL,
  `logged_by` bigint(20) DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  `last_updated_by` bigint(20) DEFAULT NULL,
  `is_active` varchar(1) DEFAULT NULL,
  `rowstate` int(11) DEFAULT NULL,
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celllines`
--

LOCK TABLES `celllines` WRITE;
/*!40000 ALTER TABLE `celllines` DISABLE KEYS */;
INSERT INTO `celllines` VALUES (1,'iHepatocytes 2.0','iHep',NULL,NULL,NULL,NULL,NULL,'Y',1),(2,'iCardiomyocytes','iCar',NULL,NULL,NULL,NULL,NULL,'Y',1),(3,'iEndothelial cells','iEndo',NULL,NULL,NULL,NULL,NULL,'Y',1),(4,'iNeurons','iNeu',NULL,NULL,NULL,NULL,NULL,'Y',1),(5,'iMacrophages prototype','iMac',NULL,NULL,NULL,NULL,NULL,'Y',1),(6,'iSkeletal myoblasts prototype','iSke',NULL,NULL,NULL,NULL,NULL,'Y',1),(7,'A-375 Skin Melanoma','A-375',NULL,NULL,NULL,NULL,NULL,'Y',1),(8,'A549 Lung Carcinoma','A549',NULL,NULL,NULL,NULL,NULL,'Y',1),(9,'HepG2 Hepatocyte Carcinoma','HepG2',NULL,NULL,NULL,NULL,NULL,'Y',1),(10,'HepaRG Hepatocyte Carcinoma','HepaRG',NULL,NULL,NULL,NULL,NULL,'Y',1),(11,'MCF7 Breast Adenocarcinoma','MCF7',NULL,NULL,NULL,NULL,NULL,'Y',1),(12,'HT-29 Colon Adenocarcinoma','HT-29',NULL,NULL,NULL,NULL,NULL,'Y',1),(13,'LN-229 Glioblastoma','LN-229',NULL,NULL,NULL,NULL,NULL,'Y',1),(14,'HEK10205f Human Epidermal Keratinocytes; Foetal','HEK10205f',NULL,NULL,NULL,NULL,NULL,'Y',1),(15,'HLMVEC Human Lung Microvascular Endothelial Cells','HLMVEC ',NULL,NULL,NULL,NULL,NULL,'Y',1),(16,'HMePC Human Mammary Epithelial Cell','HMePC',NULL,NULL,NULL,NULL,NULL,'Y',1),(17,'SH-SY5Y Neuroblastoma','SH-SY5Y',NULL,NULL,NULL,NULL,NULL,'Y',1);
/*!40000 ALTER TABLE `celllines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_info`
--

DROP TABLE IF EXISTS `file_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_info` (
  `entity_id` bigint(19) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(200) DEFAULT NULL,
  `file_path` varchar(300) DEFAULT NULL,
  `cell_line_id` bigint(20) DEFAULT NULL,
  `phenotype_id` bigint(20) DEFAULT NULL,
  `assay_type` bigint(20) DEFAULT NULL,
  `file_type` varchar(100) DEFAULT NULL,
  `logged_date` datetime DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  `last_updated_by` bigint(20) DEFAULT NULL,
  `is_active` varchar(1) DEFAULT NULL,
  `rowstate` int(11) DEFAULT NULL,
  `logged_by` bigint(20) DEFAULT NULL,
  `plate_id` bigint(19) DEFAULT NULL,
  `Original_name` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_info`
--

LOCK TABLES `file_info` WRITE;
/*!40000 ALTER TABLE `file_info` DISABLE KEYS */;
INSERT INTO `file_info` VALUES (1,'2_CM_Ca2+_15 min_PF','C:/Users/CATAPP/serverfiles',2,1,1,'pdf','2017-02-23 17:22:06',NULL,NULL,'Y',1,1,1,NULL,NULL),(2,'2_CM_Hoechst_30 min_PF','C:/Users/CATAPP/serverfiles',2,1,2,'pdf','2017-02-23 17:29:22',NULL,NULL,'Y',1,1,1,NULL,NULL),(3,'2_CM_Ca2+_30 min_PA','C:/Users/CATAPP/serverfiles',2,4,1,'pdf','2017-02-23 17:30:12',NULL,NULL,'Y',1,1,2,NULL,NULL),(4,'2_CM_Ca2+_15 min_PF','C:/Users/CATAPP/serverfiles',2,1,1,'pdf','2017-02-24 08:22:57',NULL,NULL,'Y',1,1,1,NULL,NULL),(5,'2_CM_Ca2+_90 min_posMT','C:/Users/CATAPP/serverfiles',2,9,1,'pdf','2017-02-24 08:29:25',NULL,NULL,'Y',1,1,3,NULL,NULL),(6,'2_CM_MitoTracker_30 min_PF','C:/Users/CATAPP/serverfiles',2,1,3,'pdf','2017-02-24 08:40:18',NULL,NULL,'Y',1,1,1,NULL,NULL),(7,'2_CM_Hoechst_15 min_PF','C:/Users/CATAPP/serverfiles',2,1,2,'pdf','2017-02-27 12:25:24',NULL,NULL,'Y',1,1,2,NULL,NULL),(8,'iCar_CMFDA_15 min_PF','C:/Users/CATAPP/serverfiles',2,1,1,'xlsx','2017-04-11 13:40:02',NULL,NULL,'Y',1,3,1,NULL,'pi'),(9,'iCar_CMFDA_15 min_PF','C:/Users/CATAPP/serverfiles',2,1,1,'xlsx','2017-04-13 10:50:02',NULL,NULL,'Y',1,6,1,NULL,'6');
/*!40000 ALTER TABLE `file_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phenotypes`
--

DROP TABLE IF EXISTS `phenotypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phenotypes` (
  `entity_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `tag` varchar(10) DEFAULT NULL,
  `dsc` varchar(100) DEFAULT NULL,
  `logged_date` datetime DEFAULT NULL,
  `logged_by` bigint(20) DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  `last_updated_by` bigint(20) DEFAULT NULL,
  `is_active` varchar(1) DEFAULT NULL,
  `rowstate` int(11) DEFAULT NULL,
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phenotypes`
--

LOCK TABLES `phenotypes` WRITE;
/*!40000 ALTER TABLE `phenotypes` DISABLE KEYS */;
INSERT INTO `phenotypes` VALUES (1,'Peak Frequency','PF',NULL,NULL,NULL,NULL,NULL,'Y',1),(2,'Peak Hight',NULL,NULL,NULL,NULL,NULL,NULL,'Y',1);
/*!40000 ALTER TABLE `phenotypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security_questions`
--

DROP TABLE IF EXISTS `security_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_questions` (
  `entity_id` bigint(20) NOT NULL,
  `security_question` varchar(100) DEFAULT NULL,
  `logged_date` datetime DEFAULT NULL,
  `logged_by` bigint(20) DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  `last_updated_by` bigint(20) DEFAULT NULL,
  `is_active` varchar(1) DEFAULT NULL,
  `rowstate` int(11) DEFAULT NULL,
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_questions`
--

LOCK TABLES `security_questions` WRITE;
/*!40000 ALTER TABLE `security_questions` DISABLE KEYS */;
INSERT INTO `security_questions` VALUES (1,'What is the name of your first school?','2017-02-22 00:00:00',1,NULL,NULL,'Y',1),(2,'What is the name of your first pet?','2017-02-22 00:00:00',1,NULL,NULL,'Y',1),(3,'Who is your first teacher?','2017-02-22 00:00:00',1,NULL,NULL,'Y',1),(4,'What was your childhood nickname?',NULL,NULL,NULL,NULL,'Y',1),(5,'What is mother\'s maiden name?',NULL,NULL,NULL,NULL,'Y',1),(6,'Who was your favorite teach in elementary school?',NULL,NULL,NULL,NULL,'Y',1),(7,'In what city or town did your mother and father meet?',NULL,NULL,NULL,NULL,'Y',1),(8,'What is your favorite team?',NULL,NULL,NULL,NULL,'Y',1),(9,'What was your favorite sport in high school?',NULL,NULL,NULL,NULL,'Y',1),(10,'What was your favorite food as a child?',NULL,NULL,NULL,NULL,'Y',1),(11,'What is the name of the boy/girl that you first kissed?',NULL,NULL,NULL,NULL,'Y',1),(12,'What was the make and model or your first car?',NULL,NULL,NULL,NULL,'Y',1),(13,'What was the name of the hospital where you were born?',NULL,NULL,NULL,NULL,'Y',1),(14,'Who is your childhood sports hero?',NULL,NULL,NULL,NULL,'Y',1),(15,'What school did you attend for sixth grade?',NULL,NULL,NULL,NULL,'Y',1),(16,'What was the last name of your third grade teacher?',NULL,NULL,NULL,NULL,'Y',1),(17,'In what town was your first job?',NULL,NULL,NULL,NULL,'Y',1),(18,'What was the name of the company of your first job?',NULL,NULL,NULL,NULL,'Y',1),(19,'What is your favorite food?',NULL,NULL,NULL,NULL,'Y',1),(20,'Where is you meet your spouse?',NULL,NULL,NULL,NULL,'Y',1),(21,'Where did you go to college?',NULL,NULL,NULL,NULL,'Y',1);
/*!40000 ALTER TABLE `security_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security_questions_answers`
--

DROP TABLE IF EXISTS `security_questions_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_questions_answers` (
  `entity_id` bigint(20) NOT NULL,
  `question_id` bigint(20) DEFAULT NULL,
  `answer` varchar(50) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `logged_date` datetime DEFAULT NULL,
  `logged_by` bigint(20) DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  `last_updated_by` bigint(20) DEFAULT NULL,
  `is_active` varchar(1) DEFAULT NULL,
  `rowstate` int(11) DEFAULT NULL,
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_questions_answers`
--

LOCK TABLES `security_questions_answers` WRITE;
/*!40000 ALTER TABLE `security_questions_answers` DISABLE KEYS */;
INSERT INTO `security_questions_answers` VALUES (1,1,'BBS',7,'2017-02-22 00:00:00',1,NULL,NULL,'Y',1),(2,2,'CAT',7,'2017-02-22 00:00:00',1,NULL,NULL,'Y',1),(3,3,'Smith',7,'2017-02-22 00:00:00',1,NULL,NULL,'Y',1),(4,1,'Hongqi',1,NULL,NULL,NULL,NULL,NULL,NULL),(5,8,'Rocket',1,NULL,NULL,NULL,NULL,NULL,NULL),(6,15,'Dongfanghong',1,NULL,NULL,NULL,NULL,NULL,NULL),(7,2,'Huahua',2,NULL,NULL,NULL,NULL,NULL,NULL),(8,9,'Soccer',2,NULL,NULL,NULL,NULL,NULL,NULL),(9,16,'Chen',2,NULL,NULL,NULL,NULL,NULL,NULL),(10,3,'Huiling Lin',3,NULL,NULL,NULL,NULL,NULL,NULL),(11,17,'Chengdu',3,NULL,NULL,NULL,NULL,NULL,NULL),(12,10,'Large meat ball',3,NULL,NULL,NULL,NULL,NULL,NULL),(13,4,'Jianjiang',4,NULL,NULL,NULL,NULL,NULL,NULL),(14,11,'Weibo',4,NULL,NULL,NULL,NULL,NULL,NULL),(15,18,'Academy of Sciences',4,NULL,NULL,NULL,NULL,NULL,NULL),(16,5,'Chen',5,NULL,NULL,NULL,NULL,NULL,NULL),(17,12,'Mazda',5,NULL,NULL,NULL,NULL,NULL,NULL),(18,20,'Houston',5,NULL,NULL,NULL,NULL,NULL,NULL),(19,7,'Hongkong',6,NULL,NULL,NULL,NULL,NULL,NULL),(20,14,'Mike Joran',6,NULL,NULL,NULL,NULL,NULL,NULL),(21,21,'Austin',6,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `security_questions_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_name` varchar(20) DEFAULT '',
  `first_name` varchar(20) DEFAULT '',
  `last_name` varchar(20) DEFAULT '',
  `institution` varchar(100) DEFAULT '',
  `phone_number` varchar(40) DEFAULT '',
  `email` varchar(50) DEFAULT '',
  `supervisor_name` varchar(50) DEFAULT '',
  `supervisor_phone` varchar(20) DEFAULT '',
  `supervisor_email` varchar(40) DEFAULT '',
  `last_login_time` datetime DEFAULT '0000-00-00 00:00:00',
  `is_admin` varchar(10) DEFAULT 'N',
  `entity_id` bigint(19) NOT NULL AUTO_INCREMENT,
  `Password` varchar(200) DEFAULT '',
  `approved` varchar(10) DEFAULT 'N',
  `logged_date` datetime DEFAULT NULL,
  `logged_by` bigint(20) DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  `last_updated_by` bigint(20) DEFAULT NULL,
  `is_active` varchar(10) DEFAULT 'N',
  `rowstate` int(11) DEFAULT '0',
  PRIMARY KEY (`entity_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('Test-ID-1','John','Williams','Texas A&M University','979-845-1234','test_user1@tamu.edu','Ivan Rusyn','979-845-super','Supervisor_Email@tamu.edu','2017-03-07 09:27:29','N',1,'882c57dbdb6cf3c9223ed9a31c087f99ddda0a16','Y',NULL,NULL,NULL,NULL,'Y',1),('Test-ID-2','Isabella ','Jones	','Texas A&M University','979-845-5678','test_user2@tamu.edu','Ivan Rusyn','979-845-super','Supervisor_Email@tamu.edu','2017-03-07 09:27:29','N',2,'b4ddb2b28e26de238bc0ce9e57c403acc17f56ca','Y',NULL,NULL,NULL,NULL,'Y',1),('Supervisor-1','Super','Leader','Texas A&M University','979-845-super','Supervisor_Email@tamu.edu','Ivan Rusyn','979-845-super','Supervisor_Email@tamu.edu','2017-03-07 09:27:29','N',3,'SuperVisor_Email','Y',NULL,NULL,NULL,NULL,'Y',1),('Test-ID-3','Divaid','Wilson','Public Health England','+44 (0) 1235-123456','test_user3@phe.gov.uk','Timothy Gant','+44 (0) 1235 825139','supervisor-2@he.gov.uk','2017-03-07 09:27:29','N',4,'3fd812bba9cea0b71904bae3ce8b8a3f049f1021','Y',NULL,NULL,NULL,NULL,'Y',1),('supervisor-2','Supervisor-2','Boss-2','Public Health England','+44 (0) 1235 825139','supervisor-2@he.gov.uk','Timothy Gant','+44 (0) 1235 825139','supervisor-2@he.gov.uk','2017-03-07 09:27:29','N',5,'supervisor-2','Y',NULL,NULL,NULL,NULL,'Y',1),('admin','Robert','Taylor (Admin)','Texas A&M University','979-123-6666','admin@test.com','Ivan Rusyn','979-845-super','Supervisor_Email@tamu.edu','2017-03-07 09:27:29','Y',6,'882c57dbdb6cf3c9223ed9a31c087f99ddda0a16','Y',NULL,NULL,NULL,NULL,'Y',1),('Test-ID-4','Emily','White','Public Health England','+44 (0) 1235 7890','Test_user4@phe.gov.uk','Timothy Gant','+44 (0) 1235 825139','supervisor-2@he.gov.uk','2017-03-07 09:27:29','N',7,'87451df36b7ccf0e6f3dc3f7aa746f8ed18b6dc2','Y',NULL,NULL,NULL,NULL,'Y',1),(NULL,'Duan','Liu','Texas A&M University','9796918525','liuduan@test.com','Ivan Rusyn','9796918525','1234@yahoo.com','2017-03-07 09:27:29','N',14,'31d01e58afdaae8bfabc0156c0ba64cc590b37a6','Y','2017-03-07 09:27:29',1,NULL,NULL,'Y',1),(NULL,'Duan',NULL,'Texas A&M University','9796918525','admin9@test.com','Ivan Rusyn','9796918525','1234@yahoo.com',NULL,NULL,19,'31d01e58afdaae8bfabc0156c0ba64cc590b37a6',NULL,'2017-04-05 15:36:00',1,NULL,NULL,'Y',1),(NULL,'Kevin',NULL,'','','kevin@kev.com','Duan','0002233123','duan@gmail.com',NULL,NULL,20,'e01dceaeb80843f435011965efae606185c49e85',NULL,'2017-04-14 14:14:19',1,NULL,NULL,'Y',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-03 13:53:11
