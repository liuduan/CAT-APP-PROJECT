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
-- Table structure for table `file_info`
--

DROP TABLE IF EXISTS `file_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_info` (
<<<<<<< HEAD
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
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
=======
  `File_name` varchar(200) DEFAULT NULL,
  `File_path` varchar(300) DEFAULT NULL,
  `Cell_line` varchar(50) DEFAULT NULL,
  `Phenotype` varchar(100) DEFAULT NULL,
  `File_type` varchar(100) DEFAULT NULL,
  `File_owner_ID` varchar(20) DEFAULT NULL,
  `Supervisor_owner_ID` varchar(20) DEFAULT NULL,
  `Row_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Row_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
>>>>>>> SS-Master/master
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_info`
--

LOCK TABLES `file_info` WRITE;
/*!40000 ALTER TABLE `file_info` DISABLE KEYS */;
<<<<<<< HEAD
INSERT INTO `file_info` VALUES (1,'2_CM_Ca2+_15 min_PF','C:/7-5-Database_project-data/Semi-Temp-Storage-2017',2,1,1,'pdf','2017-02-23 17:22:06',NULL,NULL,'Y',1,1,1),(2,'2_CM_Hoechst_30 min_PF','C:/7-5-Database_project-data/Semi-Temp-Storage-2017',2,1,2,'pdf','2017-02-23 17:29:22',NULL,NULL,'Y',1,1,1),(3,'2_CM_Ca2+_30 min_PA','C:/7-5-Database_project-data/Semi-Temp-Storage-2017',2,4,1,'pdf','2017-02-23 17:30:12',NULL,NULL,'Y',1,1,2),(4,'2_CM_Ca2+_15 min_PF','C:/7-5-Database_project-data/Semi-Temp-Storage-2017',2,1,1,'pdf','2017-02-24 08:22:57',NULL,NULL,'Y',1,1,1),(5,'2_CM_Ca2+_90 min_posMT','C:/7-5-Database_project-data/Semi-Temp-Storage-2017',2,9,1,'pdf','2017-02-24 08:29:25',NULL,NULL,'Y',1,1,3),(6,'2_CM_MitoTracker_30 min_PF','C:/7-5-Database_project-data/Semi-Temp-Storage-2017',2,1,3,'pdf','2017-02-24 08:40:18',NULL,NULL,'Y',1,1,1),(7,'2_CM_Hoechst_15 min_PF','C:/7-5-Database_project-data/Semi-Temp-Storage-2017',2,1,2,'pdf','2017-02-27 12:25:24',NULL,NULL,'Y',1,1,2);
=======
>>>>>>> SS-Master/master
/*!40000 ALTER TABLE `file_info` ENABLE KEYS */;
UNLOCK TABLES;

--
<<<<<<< HEAD
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
INSERT INTO `security_questions` VALUES (1,'What is the name of your first school?','2017-02-22 00:00:00',1,NULL,NULL,'Y',1),(2,'What is the name of your first pet?','2017-02-22 00:00:00',1,NULL,NULL,'Y',1),(3,'Who is your first teacher?','2017-02-22 00:00:00',1,NULL,NULL,'Y',1),(4,'What was your childhood nickname?',NULL,NULL,NULL,NULL,NULL,NULL),(5,'What is mother\'s maiden name?',NULL,NULL,NULL,NULL,NULL,NULL),(6,'Who was your favorite teach in elementary school?',NULL,NULL,NULL,NULL,NULL,NULL),(7,'In what city or town did your mother and father meet?',NULL,NULL,NULL,NULL,NULL,NULL),(8,'What is your favorite team?',NULL,NULL,NULL,NULL,NULL,NULL),(9,'What was your favorite sport in high school?',NULL,NULL,NULL,NULL,NULL,NULL),(10,'What was your favorite food as a child?',NULL,NULL,NULL,NULL,NULL,NULL),(11,'What is the name of the boy/girl that you first kissed?',NULL,NULL,NULL,NULL,NULL,NULL),(12,'What was the make and model or your first car?',NULL,NULL,NULL,NULL,NULL,NULL),(13,'What was the name of the hospital where you were born?',NULL,NULL,NULL,NULL,NULL,NULL),(14,'Who is your childhood sports hero?',NULL,NULL,NULL,NULL,NULL,NULL),(15,'What school did you attend for sixth grade?',NULL,NULL,NULL,NULL,NULL,NULL),(16,'What was the last name of your third grade teacher?',NULL,NULL,NULL,NULL,NULL,NULL),(17,'In what town was your first job?',NULL,NULL,NULL,NULL,NULL,NULL),(18,'What was the name of the company of your first job?',NULL,NULL,NULL,NULL,NULL,NULL),(19,'What is your favorite food?',NULL,NULL,NULL,NULL,NULL,NULL),(20,'Where is you meet your spouse?',NULL,NULL,NULL,NULL,NULL,NULL),(21,'Where did you go to college?',NULL,NULL,NULL,NULL,NULL,NULL);
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
=======
>>>>>>> SS-Master/master
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
<<<<<<< HEAD
  `user_name` varchar(20) DEFAULT NULL,
=======
  `User_ID` varchar(20) DEFAULT NULL,
>>>>>>> SS-Master/master
  `First_Name` varchar(20) DEFAULT NULL,
  `Last_Name` varchar(20) DEFAULT NULL,
  `Institution` varchar(100) DEFAULT NULL,
  `Phone_Number` varchar(40) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Supervisor_ID` varchar(20) DEFAULT NULL,
<<<<<<< HEAD
  `supervisor_name` varchar(50) DEFAULT NULL,
  `supervisor_phone` varchar(50) DEFAULT NULL,
  `Supervisor_Email` varchar(50) DEFAULT NULL,
  `Last_login_time` datetime DEFAULT NULL,
  `is_admin` varchar(3) DEFAULT NULL,
  `entity_id` bigint(19) NOT NULL AUTO_INCREMENT,
  `Password` varchar(200) DEFAULT NULL,
  `Approved` varchar(10) DEFAULT NULL,
  `Supervisor_row_ID` int(10) unsigned DEFAULT NULL,
  `logged_date` datetime DEFAULT NULL,
  `logged_by` bigint(20) DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  `last_updated_by` bigint(20) DEFAULT NULL,
  `is_active` varchar(1) DEFAULT NULL,
  `rowstate` int(11) DEFAULT NULL,
  PRIMARY KEY (`entity_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
=======
  `Supervisor_First_Name` varchar(20) DEFAULT NULL,
  `Supervisor_Last_Name` varchar(20) DEFAULT NULL,
  `Supervisor_Phone_Number` varchar(40) DEFAULT NULL,
  `Supervisor_Email` varchar(50) DEFAULT NULL,
  `Last_login_time` datetime DEFAULT NULL,
  `Admin_or_not` varchar(3) DEFAULT NULL,
  `Row_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Row_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
>>>>>>> SS-Master/master
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
<<<<<<< HEAD
INSERT INTO `users` VALUES ('Test-ID-1','John','Williams','Texas A&M University','979-845-1234','test_user1@tamu.edu','Supervisor-1','Ivan Rusyn','979-845-super','Supervisor_Email@tamu.edu',NULL,NULL,1,'882c57dbdb6cf3c9223ed9a31c087f99ddda0a16','Y',NULL,NULL,NULL,NULL,NULL,'Y',1),('Test-ID-2','Isabella ','Jones	','Texas A&M University','979-845-5678','test_user2@tamu.edu','Supervisor-1','Ivan Rusyn','979-845-super','Supervisor_Email@tamu.edu',NULL,NULL,2,'450e291724efc9476cea3f695a0198b3b8aaad80','Yes',NULL,NULL,NULL,NULL,NULL,'Y',1),('Supervisor-1','Super','Leader','Texas A&M University','979-845-super','Supervisor_Email@tamu.edu','Supervisor-1','Ivan Rusyn','979-845-super','Supervisor_Email@tamu.edu',NULL,NULL,3,'SuperVisor_Email','Yes',NULL,NULL,NULL,NULL,NULL,'Y',1),('Test-ID-3','Divaid','Wilson','Public Health England','+44 (0) 1235-123456','Test_user3@phe.gov.uk','Supervisor-2','Isaac Newton','+44 (0) 1235 825139','supervisor-2@he.gov.uk',NULL,NULL,4,'Test-ID-3','No',NULL,NULL,NULL,NULL,NULL,'Y',1),('supervisor-2','Supervisor-2','Boss-2','Public Health England','+44 (0) 1235 825139','supervisor-2@he.gov.uk','Supervisor-2','Isaac Newton','+44 (0) 1235 825139','supervisor-2@he.gov.uk',NULL,NULL,5,'supervisor-2','Yes',NULL,NULL,NULL,NULL,NULL,'Y',1),('admin','Robert','Taylor (Admin)','Texas A&M University','979-123-4567','admin@test.com','Supervisor-1','Ivan Rusyn','979-845-super','Supervisor_Email@tamu.edu',NULL,'Y',6,'882c57dbdb6cf3c9223ed9a31c087f99ddda0a16','Yes',NULL,NULL,NULL,NULL,NULL,'Y',1),('Test-ID-4','Emily','White','Public Health England','+44 (0) 1235 7890','Test_user4@phe.gov.uk','Supervisor-2','Isaac Newton','+44 (0) 1235 825139','supervisor-2@he.gov.uk',NULL,NULL,7,'Test-ID-4','Yes',NULL,NULL,NULL,NULL,NULL,'Y',1),(NULL,'Duan',NULL,'Texas A&M University','9796918525','test2@tamu.edu',NULL,'Ivan Rusyn','9796918525','1234@yahoo.com',NULL,NULL,13,'31d01e58afdaae8bfabc0156c0ba64cc590b37a6','Yes',NULL,'2017-03-05 01:10:24',1,NULL,NULL,'Y',1),(NULL,'Duan',NULL,'Texas A&M University','9796918525','test_user2@tamu.edu',NULL,'Ivan Rusyn','9796918525','liuduan77843@aliyun.com',NULL,NULL,11,'31d01e58afdaae8bfabc0156c0ba64cc590b37a6',NULL,NULL,'2017-03-04 16:39:25',1,NULL,NULL,'Y',1);
=======
INSERT INTO `users` VALUES ('test-user-1','User-1','test','TAMU','979-123-4567','test_user1@test.com','Supervisor-1','Supervisor-1','Boss-1','979-123-super','Supervisor_Email@test.com',NULL,'no',1,'test-user-1'),('test-user-2','User-2','test','TAMU','979-123-4567','test_user2@test.com','Supervisor-1','Supervisor-1','Boss-1','979-123-super','Supervisor_Email@test.com',NULL,'no',2,'test-user-2'),('test-user-3','User-3','test','TAMU','979-123-4567','test_user2@test.com','supervisor-2','Supervisor-1','Boss-1','979-123-super','Supervisor_Email@test.com',NULL,'no',3,'test-user-3'),('supervisor-1','Supervisor-1','Boss-1','TAMU','979-123-4567','supervisor-1@test.com','Supervisor-1','Supervisor-1','Boss-1','979-123-super','Supervisor_Email@test.com',NULL,'no',4,'supervisor-1'),('supervisor-2','Supervisor-2','Boss-2','TAMU','979-123-4567','supervisor-2@test.com','Supervisor-2','Supervisor-2','Boss-2','979-123-super','Supervisor2_Email@test.com',NULL,'no',5,'supervisor-2'),('admin','admin','admin','TAMU','979-123-4567','admin@test.com','admin','admin','admin','979-123-admin','admin_Email@test.com',NULL,'yes',6,'admin');
>>>>>>> SS-Master/master
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

<<<<<<< HEAD
-- Dump completed on 2017-03-06 14:17:34
=======
-- Dump completed on 2017-01-24 12:39:49
>>>>>>> SS-Master/master
