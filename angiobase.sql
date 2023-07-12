-- MySQL dump 10.13  Distrib 5.7.40, for Linux (x86_64)
--
-- Host: localhost    Database: angiobase
-- ------------------------------------------------------
-- Server version	5.7.40-log

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
-- Table structure for table `AngioBaseA_userinfo`
--

DROP TABLE IF EXISTS `AngioBaseA_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AngioBaseA_userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `password` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AngioBaseA_userinfo`
--

LOCK TABLES `AngioBaseA_userinfo` WRITE;
/*!40000 ALTER TABLE `AngioBaseA_userinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `AngioBaseA_userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add user info',7,'add_userinfo'),(26,'Can change user info',7,'change_userinfo'),(27,'Can delete user info',7,'delete_userinfo'),(28,'Can view user info',7,'view_userinfo'),(29,'Can add notice',8,'add_notice'),(30,'Can change notice',8,'change_notice'),(31,'Can delete notice',8,'delete_notice'),(32,'Can view notice',8,'view_notice'),(33,'Can add views_count',9,'add_views_count'),(34,'Can change views_count',9,'change_views_count'),(35,'Can delete views_count',9,'delete_views_count'),(36,'Can view views_count',9,'view_views_count'),(37,'Can add userform',10,'add_userform'),(38,'Can change userform',10,'change_userform'),(39,'Can delete userform',10,'delete_userform'),(40,'Can view userform',10,'view_userform'),(41,'Can add leave_ message',11,'add_leave_message'),(42,'Can change leave_ message',11,'change_leave_message'),(43,'Can delete leave_ message',11,'delete_leave_message'),(44,'Can view leave_ message',11,'view_leave_message'),(45,'Can add comment',12,'add_comment'),(46,'Can change comment',12,'change_comment'),(47,'Can delete comment',12,'delete_comment'),(48,'Can view comment',12,'view_comment'),(49,'Can add img',13,'add_img'),(50,'Can change img',13,'change_img'),(51,'Can delete img',13,'delete_img'),(52,'Can view img',13,'view_img'),(53,'Can add question',14,'add_question'),(54,'Can change question',14,'change_question'),(55,'Can delete question',14,'delete_question'),(56,'Can view question',14,'view_question'),(57,'Can add answer table',15,'add_answertable'),(58,'Can change answer table',15,'change_answertable'),(59,'Can delete answer table',15,'delete_answertable'),(60,'Can view answer table',15,'view_answertable'),(61,'Can add examrecord',16,'add_examrecord'),(62,'Can change examrecord',16,'change_examrecord'),(63,'Can delete examrecord',16,'delete_examrecord'),(64,'Can view examrecord',16,'view_examrecord'),(65,'Can add questions',17,'add_questions'),(66,'Can change questions',17,'change_questions'),(67,'Can delete questions',17,'delete_questions'),(68,'Can view questions',17,'view_questions'),(69,'Can add questiongif',18,'add_questiongif'),(70,'Can change questiongif',18,'change_questiongif'),(71,'Can delete questiongif',18,'delete_questiongif'),(72,'Can view questiongif',18,'view_questiongif'),(73,'Can add questionex',19,'add_questionex'),(74,'Can change questionex',19,'change_questionex'),(75,'Can delete questionex',19,'delete_questionex'),(76,'Can view questionex',19,'view_questionex'),(77,'Can add pictureurl',20,'add_pictureurl'),(78,'Can change pictureurl',20,'change_pictureurl'),(79,'Can delete pictureurl',20,'delete_pictureurl'),(80,'Can view pictureurl',20,'view_pictureurl'),(81,'Can add picturnameandeurl',21,'add_picturnameandeurl'),(82,'Can change picturnameandeurl',21,'change_picturnameandeurl'),(83,'Can delete picturnameandeurl',21,'delete_picturnameandeurl'),(84,'Can view picturnameandeurl',21,'view_picturnameandeurl'),(85,'Can add betainfo',22,'add_betainfo'),(86,'Can change betainfo',22,'change_betainfo'),(87,'Can delete betainfo',22,'delete_betainfo'),(88,'Can view betainfo',22,'view_betainfo'),(89,'Can add case',23,'add_case'),(90,'Can change case',23,'change_case'),(91,'Can delete case',23,'delete_case'),(92,'Can view case',23,'view_case'),(93,'Can add clt case',24,'add_cltcase'),(94,'Can change clt case',24,'change_cltcase'),(95,'Can delete clt case',24,'delete_cltcase'),(96,'Can view clt case',24,'view_cltcase');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$cY9pAHqZoh99yNrbq67ho3$/TOlD4UVdb2L9GUfVdtow7b3eeGPRxfdU1BwPHZEXoI=','2023-02-28 02:09:29.724664',1,'admin','','','3021849674@qq.com',1,1,'2022-02-08 12:16:42.872633'),(2,'pbkdf2_sha256$180000$hGwgqvlycPBM$y2KYxWLCiwdbrxNG1z5jV/EtzLfPrs2e1Xo7D1TB+7w=','2022-02-09 09:36:13.315484',0,'dmh','','','',0,1,'2022-02-09 09:36:12.614357'),(3,'pbkdf2_sha256$180000$IaFrAMppG2Yh$bX99qeFkMh6fm6dBAVa6RpbgZW6RZTulRTze9zywVhs=','2022-02-09 09:42:55.291019',0,'test','','','',0,1,'2022-02-09 09:42:54.630756'),(4,'pbkdf2_sha256$260000$yquoZuveZMxTn4ym2Yxsz4$8zsHUUR6HEsvVahPudisgJuNviwXmYP8K9KULthqCg0=','2022-02-16 05:08:00.599148',0,'542007040208','','','ADMIN@qq.com',0,1,'2022-02-16 05:08:00.328154'),(5,'pbkdf2_sha256$260000$JruHuSounbjSnJ4D8JKPeK$K9m71JQmxNADLbUv33Cs3fqnyVWAPt0cH61KkaD4qFc=','2022-02-16 06:11:49.917366',0,'testfrimg','','','3021849674@qq.comd',0,1,'2022-02-16 06:11:49.598007'),(6,'pbkdf2_sha256$260000$594Hsk0IcirixQ4khXVNiU$AV/U/JgJGvRGIRxmawNyYH5VVobGDuj2KlTWoRCprg4=','2022-02-16 06:39:44.501506',0,'sdcfvgb','','','iwyou@qq.com',0,1,'2022-02-16 06:39:44.172507'),(7,'pbkdf2_sha256$260000$ubX8SuxByXIEg0o56KWb92$VT+8n8EAfntAflqzFQqfYFRP/aJ+IPujcHyyeldi1aM=','2022-02-16 07:03:22.883342',0,'3021849674','','','2779245846@qq.com',0,1,'2022-02-16 07:03:22.525528'),(8,'pbkdf2_sha256$260000$07itouDZNWlyHlvnMwNmJY$azNGSzt27AykhFfO77y1/3hNEPAJVYYmDHcQ0y9rDF4=','2022-02-16 07:07:03.455041',0,'pppp','','','542007040208@zzuli.edu.cn',0,1,'2022-02-16 07:07:03.186463'),(9,'pbkdf2_sha256$260000$SyjXswIfRke6XXHIK7eJ2m$cDXsyxW2jerAi3h2ODmKAg/AeZxUkFxh/TPy7Gf6jhw=','2022-02-16 08:36:43.367191',0,'sdfg','','','758657003@qq.com',0,1,'2022-02-16 08:36:43.092493'),(10,'pbkdf2_sha256$260000$POZPczmqWDjSAUw8xhmqid$6YsGeDtvdrpW9YQOGI+cz131vgW0K9YmVYro9SCEEbk=','2022-03-13 09:33:23.261788',0,'111','','','ADMIN@qq.com',0,1,'2022-03-13 09:33:22.833781'),(11,'pbkdf2_sha256$260000$KHW0IyLZDoHhOxnAaaQU0V$GKgi32FjU90+tBZMP5g61U15NQZEav22jAmqqQgk2gE=','2022-03-13 09:35:22.420831',0,'123v4v','','','iwyou@qq.com',0,1,'2022-03-13 09:35:22.079763'),(12,'pbkdf2_sha256$260000$xRx4yDulQaVhEpP8NOuExL$kRpkEk9YQ7Vj2qY2uW0jEorvHQHcJbweUCi36dheQ8Y=','2022-03-13 09:37:37.266853',0,'sun','','','ADMIN@qq.com',0,1,'2022-03-13 09:37:37.015427'),(13,'pbkdf2_sha256$260000$zWy68x4pdjjEVRpHsgGpmz$G2CI8eErrAMiYdF1rA4jfgTnZStmNxiHNPov9vRZJ4E=','2022-03-13 10:21:00.941538',0,'news','','','3021849674@qq.com',0,1,'2022-03-13 10:21:00.691385'),(14,'pbkdf2_sha256$260000$HcvilYOZSZUSZdr3lzC52D$Y5FHCYwnVwsfMIuWd37SxqcCatbACTN1J57G8Vz9Y2A=','2022-03-13 13:53:39.496552',0,'ful','','','758657003@qq.com',0,1,'2022-03-13 13:53:39.162670'),(15,'pbkdf2_sha256$260000$o0pIfkhjDOV9Q3LmwCKvpP$tDW26Q0XPlR9FdJYh37pr1x5j/06c4or3b49lVf2CcQ=','2022-03-13 13:54:47.844264',0,'dth','','','3021849674@qq.comd',0,1,'2022-03-13 13:54:47.595099'),(16,'pbkdf2_sha256$260000$fcdyITAtSBNYGEFeGO46iL$QSYtkQfjpo+bvzKZcscZC+Wa7a5MDEQDeDYgICcKZ5Q=','2022-03-14 12:37:38.673423',0,'dya','','','ADMIN@qq.com',0,1,'2022-03-14 12:37:38.390739'),(17,'pbkdf2_sha256$260000$69rMZfG4pNdpZql2nX6D9r$jW5GcXLIyN3ZWrCx4QYj5SnYKmuhxxN7gfBQDoTjzlo=','2022-03-14 12:39:07.526421',0,'ruj','','','iwyou@qq.com',0,1,'2022-03-14 12:39:07.270616'),(18,'pbkdf2_sha256$260000$YjbgdlKunWDPXTOwIO2XJT$gRae1cffWMQhdYRbcL9x/Y+KQQkuJSbHUhZa98C68Gg=','2022-03-17 13:52:39.317377',0,'sdfvgcsssxf','','','2779245846@qq.com',0,1,'2022-03-17 13:52:38.884121'),(19,'pbkdf2_sha256$260000$DlfOpgU9EBpSGb4PcYzKxd$AbcElPb5aPEGFA6J3Q35hChLArZWjsmDQnG9wUmvim8=','2022-03-17 13:55:48.869341',0,'test1sdfgh','','','758657003@qq.com',0,1,'2022-03-17 13:55:48.487135'),(20,'pbkdf2_sha256$260000$UpNpnHBb7JIJpDl2HJVtjN$P25fdFpw0jFog606CjZ3u7C/p0wc0Zl2DHg/9J/XU2I=','2022-05-11 06:48:01.485676',0,'lzz0925','','','3021849674@qq.com',0,1,'2022-05-11 06:48:01.056733'),(21,'pbkdf2_sha256$260000$fiqRGYj9D85GI76tBH1LYP$v0WV623UFIicAaKp+L7/Q3zBihdOJXNq+LzpzttnvdI=','2023-02-25 02:00:44.328295',0,'qgf','','','2394470381@qq.com',0,1,'2023-02-08 15:21:20.138533');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case`
--

DROP TABLE IF EXISTS `case`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `case` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `case` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case`
--

LOCK TABLES `case` WRITE;
/*!40000 ALTER TABLE `case` DISABLE KEYS */;
INSERT INTO `case` VALUES (1,'Case1'),(2,'Case2'),(3,'Case3'),(4,'Case4'),(5,'Case5'),(6,'Case6'),(7,'Case7'),(8,'Case8'),(9,'Case9'),(10,'Case10'),(11,'Case11'),(12,'Case12'),(13,'Case13'),(14,'Case14'),(15,'Case15'),(16,'Case16'),(17,'Case17'),(18,'Case18'),(19,'Case19'),(20,'Case20'),(21,'Case21'),(22,'Case22'),(23,'Case23');
/*!40000 ALTER TABLE `case` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cltcase`
--

DROP TABLE IF EXISTS `cltcase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cltcase` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `clt_relation_case_id` bigint(20) NOT NULL,
  `who_clt_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cltcase_clt_relation_case_id_97a3c4ed_fk_case_id` (`clt_relation_case_id`),
  KEY `cltcase_who_clt_id_3dd859a1_fk_user_userform_id` (`who_clt_id`),
  CONSTRAINT `cltcase_clt_relation_case_id_97a3c4ed_fk_case_id` FOREIGN KEY (`clt_relation_case_id`) REFERENCES `case` (`id`),
  CONSTRAINT `cltcase_who_clt_id_3dd859a1_fk_user_userform_id` FOREIGN KEY (`who_clt_id`) REFERENCES `user_userform` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cltcase`
--

LOCK TABLES `cltcase` WRITE;
/*!40000 ALTER TABLE `cltcase` DISABLE KEYS */;
INSERT INTO `cltcase` VALUES (16,12,21),(17,11,21),(18,13,21),(19,21,21),(20,22,21),(21,19,21),(23,1,21),(31,7,1);
/*!40000 ALTER TABLE `cltcase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-02-08 12:18:57.256516','1','Notice object (1)',1,'[{\"added\": {}}]',8,1),(2,'2022-02-08 12:19:11.733404','2','Notice object (2)',1,'[{\"added\": {}}]',8,1),(3,'2022-02-08 12:19:18.455382','3','Notice object (3)',1,'[{\"added\": {}}]',8,1),(4,'2022-02-08 12:19:23.618351','4','Notice object (4)',1,'[{\"added\": {}}]',8,1),(5,'2022-02-08 12:19:29.406311','5','Notice object (5)',1,'[{\"added\": {}}]',8,1),(6,'2022-02-08 12:19:34.207589','6','Notice object (6)',1,'[{\"added\": {}}]',8,1),(7,'2022-02-08 12:19:39.401170','7','Notice object (7)',1,'[{\"added\": {}}]',8,1),(8,'2022-02-09 05:26:07.049747','8','Notice object (8)',1,'[{\"added\": {}}]',8,1),(9,'2022-02-09 05:26:58.844888','8','Notice object (8)',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',8,1),(10,'2022-02-09 05:28:12.248170','8','Notice object (8)',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',8,1),(11,'2022-02-09 09:34:56.946621','1','Userform object (1)',2,'[{\"changed\": {\"fields\": [\"\\u6635\\u79f0\"]}}]',10,1),(12,'2022-02-16 08:21:17.407119','13','Img object (13)',3,'',13,1),(13,'2022-02-16 08:21:51.451071','12','Img object (12)',3,'',13,1),(14,'2022-02-16 08:21:51.457070','11','Img object (11)',3,'',13,1),(15,'2022-02-16 08:21:51.460070','10','Img object (10)',3,'',13,1),(16,'2022-02-16 08:21:51.464070','9','Img object (9)',3,'',13,1),(17,'2022-02-16 08:22:17.625705','8','Img object (8)',3,'',13,1),(18,'2022-02-16 08:22:17.631712','7','Img object (7)',3,'',13,1),(19,'2022-03-10 03:09:57.659073','1','AnswerTable object (1)',1,'[{\"added\": {}}]',14,1),(20,'2022-03-10 03:10:12.318803','2','AnswerTable object (2)',1,'[{\"added\": {}}]',14,1),(21,'2022-03-10 03:10:23.170968','3','AnswerTable object (3)',1,'[{\"added\": {}}]',14,1),(22,'2022-03-10 03:10:32.559647','4','AnswerTable object (4)',1,'[{\"added\": {}}]',14,1),(23,'2022-03-10 03:10:43.806634','5','AnswerTable object (5)',1,'[{\"added\": {}}]',14,1),(24,'2022-03-10 03:11:09.271420','6','AnswerTable object (6)',1,'[{\"added\": {}}]',14,1),(25,'2022-03-10 03:11:22.412062','7','AnswerTable object (7)',1,'[{\"added\": {}}]',14,1),(26,'2022-03-10 03:11:31.542645','8','AnswerTable object (8)',1,'[{\"added\": {}}]',14,1),(27,'2022-03-10 03:11:38.188680','9','AnswerTable object (9)',1,'[{\"added\": {}}]',14,1),(28,'2022-03-10 03:11:48.134176','10','AnswerTable object (10)',1,'[{\"added\": {}}]',14,1),(29,'2022-03-10 03:12:40.409773','11','AnswerTable object (11)',1,'[{\"added\": {}}]',14,1),(30,'2022-03-10 03:12:48.631451','12','AnswerTable object (12)',1,'[{\"added\": {}}]',14,1),(31,'2022-03-10 03:12:57.159919','13','AnswerTable object (13)',1,'[{\"added\": {}}]',14,1),(32,'2022-03-10 03:13:05.624201','14','AnswerTable object (14)',1,'[{\"added\": {}}]',14,1),(33,'2022-03-10 03:13:13.589478','15','AnswerTable object (15)',1,'[{\"added\": {}}]',14,1),(34,'2022-03-10 03:13:38.427269','14','AnswerTable object (14)',2,'[{\"changed\": {\"fields\": [\"Answerstate\"]}}]',14,1),(35,'2022-03-10 03:14:12.398374','8','AnswerTable object (8)',2,'[{\"changed\": {\"fields\": [\"Answerstate\"]}}]',14,1),(36,'2022-03-10 03:14:55.609192','2','AnswerTable object (2)',2,'[{\"changed\": {\"fields\": [\"Answerstate\"]}}]',14,1),(37,'2023-02-26 05:42:58.036268','2','How to Use AngioBase:',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',8,1),(38,'2023-02-26 05:45:07.239959','1','Introduction to Coronary Angiography:',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'AngioBaseA','userinfo'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(15,'user','answertable'),(22,'user','betainfo'),(23,'user','case'),(24,'user','cltcase'),(12,'user','comment'),(16,'user','examrecord'),(13,'user','img'),(11,'user','leave_message'),(8,'user','notice'),(20,'user','pictureurl'),(21,'user','picturnameandeurl'),(14,'user','question'),(19,'user','questionex'),(18,'user','questiongif'),(17,'user','questions'),(10,'user','userform'),(9,'user','views_count');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-02-08 12:12:47.967448'),(2,'auth','0001_initial','2022-02-08 12:12:47.995355'),(3,'AngioBaseA','0001_initial','2022-02-08 12:12:48.008314'),(4,'AngioBaseA','0002_auto_20211103_1556','2022-02-08 12:12:48.026251'),(5,'AngioBaseA','0003_userinfo','2022-02-08 12:12:48.032231'),(6,'AngioBaseA','0004_auto_20211103_2215','2022-02-08 12:12:48.048177'),(7,'AngioBaseA','0005_rename_passwpod_userinfo_password','2022-02-08 12:12:48.057147'),(8,'AngioBaseA','0006_delete_userinfo','2022-02-08 12:12:48.062131'),(9,'AngioBaseA','0007_userinfo','2022-02-08 12:12:48.069108'),(10,'admin','0001_initial','2022-02-08 12:12:48.085055'),(11,'admin','0002_logentry_remove_auto_add','2022-02-08 12:12:48.099008'),(12,'admin','0003_logentry_add_action_flag_choices','2022-02-08 12:12:48.112961'),(13,'contenttypes','0002_remove_content_type_name','2022-02-08 12:12:48.137999'),(14,'auth','0002_alter_permission_name_max_length','2022-02-08 12:12:48.151947'),(15,'auth','0003_alter_user_email_max_length','2022-02-08 12:12:48.165902'),(16,'auth','0004_alter_user_username_opts','2022-02-08 12:12:48.174870'),(17,'auth','0005_alter_user_last_login_null','2022-02-08 12:12:48.189820'),(18,'auth','0006_require_contenttypes_0002','2022-02-08 12:12:48.194804'),(19,'auth','0007_alter_validators_add_error_messages','2022-02-08 12:12:48.203773'),(20,'auth','0008_alter_user_username_max_length','2022-02-08 12:12:48.216739'),(21,'auth','0009_alter_user_last_name_max_length','2022-02-08 12:12:48.234670'),(22,'auth','0010_alter_group_name_max_length','2022-02-08 12:12:48.246630'),(23,'auth','0011_update_proxy_permissions','2022-02-08 12:12:48.278529'),(24,'auth','0012_alter_user_first_name_max_length','2022-02-08 12:12:48.293473'),(25,'sessions','0001_initial','2022-02-08 12:12:48.301449'),(26,'user','0001_initial','2022-02-08 12:12:48.347293'),(27,'user','0002_auto_20220208_2022','2022-02-08 12:22:18.552056'),(28,'user','0003_img','2022-02-16 05:42:26.497548'),(29,'user','0004_answertable_question','2022-03-10 02:52:28.833524'),(30,'user','0005_auto_20220311_2129','2022-03-11 13:29:40.373295'),(31,'user','0006_auto_20220311_2138','2022-03-11 13:38:51.709321'),(32,'user','0007_alter_questions_exam','2022-03-11 13:49:41.113494'),(33,'user','0008_auto_20220312_1930','2022-03-12 11:30:56.142740'),(34,'user','0009_auto_20220313_0112','2022-03-12 17:12:29.270866'),(35,'user','0010_auto_20220313_0115','2022-03-12 17:15:59.460161'),(36,'user','0011_alter_questions_qid','2022-03-13 10:17:27.791608'),(37,'user','0012_auto_20220425_1331','2022-04-25 05:34:04.400616'),(38,'user','0013_rename_gread_examrecord_grade','2022-04-27 14:50:23.079081'),(39,'user','0014_alter_examrecord_grade','2022-04-27 16:06:17.293159'),(40,'user','0015_questions_answer','2022-04-28 07:34:45.772777'),(41,'user','0016_question_state','2022-05-14 13:43:29.269078'),(42,'user','0017_pictureurl','2023-02-09 09:25:19.035421'),(43,'user','0017_picturnameandeurl','2023-02-09 10:04:43.190777'),(44,'user','0018_auto_20230222_1546','2023-02-22 07:46:27.542265'),(45,'user','0019_betainfo','2023-02-23 15:59:47.137473'),(46,'user','0020_alter_notice_title','2023-02-26 05:44:53.349887'),(47,'user','0021_alter_img_img','2023-02-26 12:01:47.138692'),(48,'user','0017_alter_img_name','2023-02-26 12:06:49.040093'),(49,'user','0020_case_cltcase','2023-02-27 03:31:38.751076'),(50,'user','0021_rename_clt_relation_novel_cltcase_clt_relation_case','2023-02-27 03:44:07.970479'),(51,'user','0022_auto_20230227_1640','2023-02-27 08:40:38.522449'),(52,'user','0023_auto_20230227_1642','2023-02-27 08:43:18.017495'),(53,'user','0024_remove_cltcase_clt_time','2023-02-27 09:29:39.402670');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0344nxv66fc8o0mh44368vej47m3paw8','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1oBWHr:mLiiwmwYaNhAlpvvs0CXyTydLDcuyEmaLS0oUIrEdKo','2022-07-27 06:55:55.797803'),('0gofuupgsw8e1u1r7sbkrhr9zl38adej','.eJxVjDsOwjAQBe_iGln-LfZS0ucM1q5j4wCypXwqxN0hUgpo38y8l4i0rTVuS57jNIqLMFqcfkem9MhtJ-Od2q3L1Ns6Tyx3RR50kUMf8_N6uH8HlZb6rT0gUs5oFJwT-qJdAl0wKLAlOes0lQDWesNYmIE4mwBOK2aNxQYr3h_xSDeE:1pUhdR:Sa1oN1EHt1j3l4PlEcBoeTRiyrULV6RJUNsOfZXiG8g','2023-03-08 05:25:45.273450'),('0l4pnsuww4igdvqz5rcfp8prel4jzsdl','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1nMVQR:0Yq9LPCTcVNc9DuzFtX8WdsGQoBHOC06faB74vzqVS8','2022-03-08 13:41:55.763813'),('167m03wu7irozsxnkosvr0xn0u17qetf','.eJxVjDsOwjAQBe_iGln-LfZS0ucM1q5j4wCypXwqxN0hUgpo38y8l4i0rTVuS57jNIqLMFqcfkem9MhtJ-Od2q3L1Ns6Tyx3RR50kUMf8_N6uH8HlZb6rT0gUs5oFJwT-qJdAl0wKLAlOes0lQDWesNYmIE4mwBOK2aNxQYr3h_xSDeE:1pUhdP:mMihS-9EbLyt5Sx0EFQps1MKbkwdx76o_0j27OQrltU','2023-03-08 05:25:43.800719'),('31ki7c1k8zr7ftvjbd93y8c3cdw2hwhu','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1ndVeE:L8mCQHF2fgRTKPAtLRXgPHipwvZgiN9VCPr0jiFUz6g','2022-04-24 11:22:26.058266'),('3jj9msouyqr740dwyjhmhuth267ygctz','.eJxVjMEOwiAQRP-FsyHQlgIevfcbyC67SNVAUtqT8d9tkx70NMm8N_MWAbY1h63xEmYSV6HF5bdDiE8uB6AHlHuVsZZ1mVEeijxpk1Mlft1O9-8gQ8v7OqI1YDkmr3wErVQ_OO1SQiJPo1ZaAbFD7pjNGCkpv6c1fTcgAfckPl8F6Djs:1pLyJH:I32LvluDIDSEjJFssbZHrxFzpnrYTRJqXjlSd6SD20o','2023-02-12 03:24:51.048587'),('438h44c85njof76jh4sldcd3vd1rq449','.eJxVjEEOgjAURO_StWnaT_spLt1zBvJpR4uaklBYGe-uJCx0O--9ealBtjUPW8UyTEmdlVWn322U-EDZQbpLuc06zmVdplHvij5o1f2c8Lwc7t9Blpq_tSBZOE4GwcMbF0DWjabjaCJzROuZCNemJZIU0PhAAtNKx5bYwaj3B-JqN2w:1pK9an:IZdJvUOGCh52YDkQ07vwGe119T-S5ZzbKEYF2w1D_TE','2023-02-07 03:03:25.403561'),('4jl45eaf4zj12pmbp2flq0gblrspoklo','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1nT2wX:W9Ew8N2YzSXqkczkNAi-vRxuGENuTjftrzfbQ2oMKWw','2022-03-26 14:42:05.329615'),('4namutns2c05i30bov1pmgr1yhnlbguu','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1nLlnR:GMbM-WqABLRcpEJ6oSpjOKP5v0o6XK4kmFKFEG8SxzA','2022-03-06 12:58:37.478815'),('4tq13pf8art3g05nza1a3u757dgnfutq','.eJxVjcsOwiAURP-FtSEgb5fu_QZyuVykaiAp7cr477ZJF7qdc2bmzSKsS43roDlOmV2YZKffLAE-qe0gP6DdO8felnlKfFf4QQe_9Uyv6-H-DVQYdWsrTMJYH0LWymvlzDkTeEwewWtwmoQpTgqfLbkgpSEspkiXyJbtxBn2-QLX3jgZ:1pVUW7:vZvlsTejisjVl0PZm5zfmIHWSTyy7Q6opSTBZZiXuw8','2023-03-10 09:37:27.555080'),('64yx566q3wc8alxqx9dg8ojdr6nowuk9','.eJxVjDkOwjAUBe_iGlmxFS-hpOcM1vdfcADZUpxUiLtDpBTQvpl5L5VgW0vaOi9pJnVWRp1-twz44LoDukO9NY2trsuc9a7og3Z9bcTPy-H-HRTo5VsLg4HsrITgR0BPKGPEgDxZFJSBoslOPOVgvbDjiTFGwRENM5MZ1PsDK1U59A:1pMicN:bYsLnjZAby8FGxuKnvlk0WRVANXxDZJiLLFKEajpvaw','2023-02-14 04:51:39.490952'),('6c7hgkeete4rixkdyyhy966lars86fa3','.eJxVjcsOwiAURP-FtSEgb5fu_QZyuVykaiAp7cr477ZJF7qdc2bmzSKsS43roDlOmV2YZKffLAE-qe0gP6DdO8felnlKfFf4QQe_9Uyv6-H-DVQYdWsrTMJYH0LWymvlzDkTeEwewWtwmoQpTgqfLbkgpSEspkiXyJbtxBn2-QLX3jgZ:1pPlNO:7Tp-D8pybI5OLwbesN7psYOZZJNbhEynOz7LZdUB0kQ','2023-02-22 14:24:46.405374'),('7ojk2ooev5i7u0zwft0gkhezd4kbaeda','.eJxVjDkOwjAUBe_iGlmxFS-hpOcM1vdfcADZUpxUiLtDpBTQvpl5L5VgW0vaOi9pJnVWRp1-twz44LoDukO9NY2trsuc9a7og3Z9bcTPy-H-HRTo5VsLg4HsrITgR0BPKGPEgDxZFJSBoslOPOVgvbDjiTFGwRENM5MZ1PsDK1U59A:1pMVWH:8qo6AS86dta5S_KdpevOIqoVUG1svhZz6-nWcopY7uA','2023-02-13 14:52:29.073914'),('7uaxk7pmefmobq0ltautbxqvcc7yg4n6','MzM2MDAzMGNiOWJiMTI3MTBkZjNjNjRmZDIxNjhiYTA0ZDQ1Y2FhNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMDA0ZGJkYjFjMWM2ZGIwNTkxYTE4ZGViZWJmNjg4MDkwNDNlYmM0In0=','2022-03-06 11:02:01.345772'),('7wj7ck1pewamsp9thtofbk1dbq8g25ps','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1nMTPa:exaB5_oQ6HfdMUBhzCizfzt5N7FMTmCDKZ5ie1-FOu4','2022-03-08 11:32:54.289585'),('7ytdlkyudupkrsgj19lnaqgv31qk6t76','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1nMTmG:2aCfUjww6PqH2uFK6pVH134Dc43-ba-ZWbdYr_gfTz4','2022-03-08 11:56:20.326920'),('80k61al795bj6byx5alttzka5a41u404','.eJxVjDsOwjAUBO_iGlmx408eJT1nsNZ-Ng6gRIqTCnF3iJQC2pnZfYmAba1ha3kJI4uzUOL0yyLSI0-74Dum2yzTPK3LGOWeyMM2eZ05Py9H-3dQ0eq-jpw0VIHPPffwDoZKSRYmkqcvoARtHDh3OvfQkWDJ2KF4pwbqOvH-ABhtOGY:1nKBkV:hJS7CsYr2wR6VrcgXGE9BrZSQA-N7NY-3AWYMsrYBn0','2022-03-02 04:17:03.263072'),('8155ypdacmpe3ijyn0cclulmxku6tje1','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1nLkTT:j2GwNdmtCC_VC-zbWpisj8EFQT5rVYnKBYv8k2QQCos','2022-03-06 11:33:55.182337'),('8kvml1a3ei1uw910lnknn3r86zh1pzas','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1nk6UG:NziJHdjs7m00-42qWcmBNEGhwohh7w6aUHwA4Sf-PCk','2022-05-12 15:55:24.752249'),('8wfbim8ng1bdhbyz1cekvg1gx0xbivef','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1nfm8h:k1ib8De0AWiFpWwVP_RJtweC_Z0iKuLdiacrk2KhQIk','2022-04-30 17:23:15.948049'),('9du2w3hdb2yyou685uoxwvupintl6vvp','.eJxVjcsOwiAURP-FtSEgb5fu_QZyuVykaiAp7cr477ZJF7qdc2bmzSKsS43roDlOmV2YZKffLAE-qe0gP6DdO8felnlKfFf4QQe_9Uyv6-H-DVQYdWsrTMJYH0LWymvlzDkTeEwewWtwmoQpTgqfLbkgpSEspkiXyJbtxBn2-QLX3jgZ:1pWCiO:TiQYVfaWJqro3NLe42RzxfHTC12_0fSxWmeBKc4mN-s','2023-03-12 08:49:04.198443'),('9tf4uy5yifq5kgb9nwq9r666lbkvuc89','.eJxVjL0OwyAQg9-FuUL8BAEdu_cZ0MEdJW0FUkimqO9eImVoZU_2Z-8swLaWsHVawozsyiS7_GYR0ovqUeAT6qPx1Oq6zJEfCD_bzu8N6X072b-DAr2M9UQkIg6Bd1lp6TNqY5JyWoJ1mGhYiqytV84IqbKiLKwmHQcvxcQ-XwWVOC8:1pWejT:nxvf83wyZDlxZVm1Ii2sHdqzK6cYE5OXelkVRbkTeYs','2023-03-13 14:44:03.272194'),('a5my7sxuyspxkf3qzbzq8ltypkt6ikcz','.eJxVjDsOwjAQBe_iGln-LfZS0ucM1q5j4wCypXwqxN0hUgpo38y8l4i0rTVuS57jNIqLMFqcfkem9MhtJ-Od2q3L1Ns6Tyx3RR50kUMf8_N6uH8HlZb6rT0gUs5oFJwT-qJdAl0wKLAlOes0lQDWesNYmIE4mwBOK2aNxQYr3h_xSDeE:1pVjfb:cl2kcPjJ_7fLoxWo_AyNY4lJ05fjCFBhLu_54tsa3Lo','2023-03-11 01:48:15.861975'),('ar42zua6dghpabcko98xdc9xvcvhgmee','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1oOJMk:AKsVASRP2cuoGwJ3o2F11Z61asAJ5WaaI0aK9731s7Q','2022-08-31 13:45:50.637798'),('ax2uj1zj9aquodddi609ni8uibvzscmq','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1nerdU:6RZHpnFOhTPvxe6XQZUc7E6Q-HS2JeAlueyKs_04jDY','2022-04-28 05:03:16.804532'),('b9372cr9q56mx3ziusy8ra3x2x150bw4','MzM2MDAzMGNiOWJiMTI3MTBkZjNjNjRmZDIxNjhiYTA0ZDQ1Y2FhNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMDA0ZGJkYjFjMWM2ZGIwNTkxYTE4ZGViZWJmNjg4MDkwNDNlYmM0In0=','2022-03-06 08:52:50.263578'),('b9hjw59masfzyna9n3pat0wv5otgmgmk','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1nMldH:4WIjTeeqI1ER3BvfJHMKsli91CgnNT1zxnUODdrK-Nk','2022-03-09 07:00:15.290289'),('blo5zp33x10pux51twwy0intor6994ri','.eJxVjDsOwjAQBe_iGln-LfZS0ucM1q5j4wCypXwqxN0hUgpo38y8l4i0rTVuS57jNIqLMFqcfkem9MhtJ-Od2q3L1Ns6Tyx3RR50kUMf8_N6uH8HlZb6rT0gUs5oFJwT-qJdAl0wKLAlOes0lQDWesNYmIE4mwBOK2aNxQYr3h_xSDeE:1pPmG8:Gcxiga2r8zWjGOzV9hhTIyLD8yX1q0tlPj5G2B3CAzs','2023-02-22 15:21:20.864003'),('bmyjtwnldn453dkqcjchbbzxkiu13k48','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1nRxVy:UJKOAUY_GW8521HXg9b9X0JZXGur2t55OjmxxnEZq_s','2022-03-23 14:42:10.154527'),('bv0a7qww6g5gql7dealeif6kouhuayzk','.eJxVjEEOgjAURO_StWnaT_spLt1zBvJpR4uaklBYGe-uJCx0O--9ealBtjUPW8UyTEmdlVWn322U-EDZQbpLuc06zmVdplHvij5o1f2c8Lwc7t9Blpq_tSBZOE4GwcMbF0DWjabjaCJzROuZCNemJZIU0PhAAtNKx5bYwaj3B-JqN2w:1pK9an:IZdJvUOGCh52YDkQ07vwGe119T-S5ZzbKEYF2w1D_TE','2023-02-07 03:03:25.571483'),('c8veluo4qiymk603qmw6quxjv9fk8w62','.eJxVjDsOwjAUBO_iGlmx408eJT1nsNZ-Ng6gRIqTCnF3iJQC2pnZfYmAba1ha3kJI4uzUOL0yyLSI0-74Dum2yzTPK3LGOWeyMM2eZ05Py9H-3dQ0eq-jpw0VIHPPffwDoZKSRYmkqcvoARtHDh3OvfQkWDJ2KF4pwbqOvH-ABhtOGY:1nL2PI:c9IaP5jTsdlJMHxjyD3TzKmSABDtIzMEcCDtVVI1zTM','2022-03-04 12:30:40.698210'),('chzfx9uusfvehd72l10zty3c97vt1zww','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1ooOcT:pLmGO-dNBvWsVlaYl6I4CDCyM3_nEvh2DsViyzHRRCs','2022-11-11 12:37:53.636760'),('cthgn5539xbjq2o1vnc11p327s7i3jms','.eJxVjcsOwiAURP-FtSEgb5fu_QZyuVykaiAp7cr477ZJF7qdc2bmzSKsS43roDlOmV2YZKffLAE-qe0gP6DdO8felnlKfFf4QQe_9Uyv6-H-DVQYdWsrTMJYH0LWymvlzDkTeEwewWtwmoQpTgqfLbkgpSEspkiXyJbtxBn2-QLX3jgZ:1pVUJZ:8I4_G-Lk0NuYJlLuM9pCvBzwkpg52IJ52VJVZu7Qjw0','2023-03-10 09:24:29.531729'),('dlf0l78ks0zd83x82uevpcs09fg82g28','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1nSePw:uhAMhvs_LQDkXFe74MDc8PbM4KsFfDg4UoxbO-0fQu8','2022-03-25 12:30:48.661022'),('e56dw409k4ok9luhguwqvy92yk6vmeja','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1nMVg1:VnPBtM7kkfeyYXhx_C0Lh3dEnrTriYmXUy6ykr9KG50','2022-03-08 13:58:01.429841'),('e5hrpwmljbyhvsqld9pnpb02d1s55dw2','.eJxVjDsOwjAQBe_iGln-LfZS0ucM1q5j4wCypXwqxN0hUgpo38y8l4i0rTVuS57jNIqLMFqcfkem9MhtJ-Od2q3L1Ns6Tyx3RR50kUMf8_N6uH8HlZb6rT0gUs5oFJwT-qJdAl0wKLAlOes0lQDWesNYmIE4mwBOK2aNxQYr3h_xSDeE:1pVjC3:GnEojAokQX4QNou8qqOdapXTYEw9smJVp_MRwShPVjM','2023-03-11 01:17:43.327746'),('ez8sm58s7dsi9t713w0c1vwzsnb4c2gz','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1nMm4G:zuWYjqtzH2a7hN8uzb0ZHQxuIVgdIrmokHYURZ_zB4c','2022-03-09 07:28:08.324802'),('f5sss4sd67h62foqearn316cdhvw0i5v','.eJxVjDkOwjAUBe_iGlmxFS-hpOcM1vdfcADZUpxUiLtDpBTQvpl5L5VgW0vaOi9pJnVWRp1-twz44LoDukO9NY2trsuc9a7og3Z9bcTPy-H-HRTo5VsLg4HsrITgR0BPKGPEgDxZFJSBoslOPOVgvbDjiTFGwRENM5MZ1PsDK1U59A:1pMUKH:iUTsjJ6q72XYKYC_39jkY-YP_ldkTajxum9jAhxElkU','2023-02-13 13:36:01.921320'),('fifdudvwm8ce2g38mkxavpn430vvj6a5','.eJxVjDsOwjAQBe_iGln-LfZS0ucM1q5j4wCypXwqxN0hUgpo38y8l4i0rTVuS57jNIqLMFqcfkem9MhtJ-Od2q3L1Ns6Tyx3RR50kUMf8_N6uH8HlZb6rT0gUs5oFJwT-qJdAl0wKLAlOes0lQDWesNYmIE4mwBOK2aNxQYr3h_xSDeE:1pVjC2:5K2gQqesEM1wJQPAkCk4yn5M_ilvXrWQXdbjddAdMys','2023-03-11 01:17:42.092001'),('frtqw086ecusk6f4ape54fq1jo8mlnw4','.eJxVjEEOgjAURO_StWnaT_spLt1zBvJpR4uaklBYGe-uJCx0O--9ealBtjUPW8UyTEmdlVWn322U-EDZQbpLuc06zmVdplHvij5o1f2c8Lwc7t9Blpq_tSBZOE4GwcMbF0DWjabjaCJzROuZCNemJZIU0PhAAtNKx5bYwaj3B-JqN2w:1pK9at:fO9vc7XyLY7iDTmQlGXaegns8rdMFsueq8nhpwKYtkE','2023-02-07 03:03:31.960434'),('fu7c4s98cgnp0crh36d4dh9xwg87tr9e','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1nMVma:-pFG-BxGMjolmGPHbCbOGUH8SyAXO1a9ov6isGM8QEQ','2022-03-08 14:04:48.403117'),('g31a14k0jahguzivhu1og036iraghjaf','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1nLkRd:ibI2lJbzFaG2Vxaf-yGOqNkxr0jS3isciWE_68NWy9Q','2022-03-06 11:32:01.965337'),('gg1rf184vzvik36ugskshgeew6t8hgve','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1oV0gp:ERzH8SN4AiQm9Uk3vm8bh8vBjmHD4fKAp77dFqj1JnY','2022-09-19 01:14:15.506780'),('gr10uy1jr3919ae3625azvggjid8nvpc','.eJxVjEEOwiAQRe_C2pCCAy0u3fcMZGYYbNVAUtqV8e7apAvd_vfef6mI2zrFrckS56QuyqjT70bIDyk7SHcst6q5lnWZSe-KPmjTY03yvB7u38GEbfrWYG22nTB1ziJ59jDwkF1vXO4dkDhKg88egveGDRpgpDMGAempo5DV-wPhEDgw:1pWpQn:bFqHn1kleR-rtMt7RW5qFdmSAwXxTrUoHHugl-XySFc','2023-03-14 02:09:29.749665'),('gw7ln0m43qzenkwdf98wq51x80j8gbcl','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1nWwXF:6OWy_8WbWbPr0wpfhuYLIQdNETxKMnKe-8xk2s2ir0k','2022-04-06 08:40:05.816123'),('h95pkjmo8b7gb2hbrfwp9dmsixkpaazk','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1oSewn:5Z_2jjgbxuvYQ9MxCC61DVCl2MX_5LGH9pFIdlyEsZM','2022-09-12 13:37:01.209944'),('hwwgpd5qzjz33wfa43rnhay4arbn500s','.eJxVjDkOwjAUBe_iGlmxFS-hpOcM1vdfcADZUpxUiLtDpBTQvpl5L5VgW0vaOi9pJnVWRp1-twz44LoDukO9NY2trsuc9a7og3Z9bcTPy-H-HRTo5VsLg4HsrITgR0BPKGPEgDxZFJSBoslOPOVgvbDjiTFGwRENM5MZ1PsDK1U59A:1pMVV2:cyx5oW2YEDX8VvhXZcEoRYEW1fuRjkhHrZhqKu-l_7w','2023-02-13 14:51:12.955208'),('i0x3g9kqpybm81zx4utxgr53twqvw78w','.eJxVjDkOwjAUBe_iGlmxFS-hpOcM1vdfcADZUpxUiLtDpBTQvpl5L5VgW0vaOi9pJnVWRp1-twz44LoDukO9NY2trsuc9a7og3Z9bcTPy-H-HRTo5VsLg4HsrITgR0BPKGPEgDxZFJSBoslOPOVgvbDjiTFGwRENM5MZ1PsDK1U59A:1pMnMl:PNrNDRTCFM1oaBJpU-8pAY5QBmtHqdcijQYniRjLLAg','2023-02-14 09:55:51.361167'),('ixjtt4wdwu46yd31yf3obmbkdj7udn32','.eJxVjcsOwiAURP-FtSEgb5fu_QZyuVykaiAp7cr477ZJF7qdc2bmzSKsS43roDlOmV2YZKffLAE-qe0gP6DdO8felnlKfFf4QQe_9Uyv6-H-DVQYdWsrTMJYH0LWymvlzDkTeEwewWtwmoQpTgqfLbkgpSEspkiXyJbtxBn2-QLX3jgZ:1pNEuW:aCrstFh34ziSrlPYnJcfoIdBDLYs9dA5nfqeP7B4wVg','2023-02-15 15:20:32.571543'),('j0t5cea6z1gh3vxgnexajauiezopyze7','.eJxVjcsOwiAURP-FtSEgb5fu_QZyuVykaiAp7cr477ZJF7qdc2bmzSKsS43roDlOmV2YZKffLAE-qe0gP6DdO8felnlKfFf4QQe_9Uyv6-H-DVQYdWsrTMJYH0LWymvlzDkTeEwewWtwmoQpTgqfLbkgpSEspkiXyJbtxBn2-QLX3jgZ:1pVvvV:rItO3amgsUgDsQRP39wBU3PFYZXMgx-9b8h5iGXdYI0','2023-03-11 14:53:29.507263'),('jbfmrs9ykmojwsc8zv4i69dtu1zm93zr','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1nMVgb:JlNjHBqfRx48FDCXUtjP0LCVqUJeTA27ZJGKTG2wzc4','2022-03-08 13:58:37.270344'),('jkx5c20597g0xwh324by4cx7qp6xl79i','.eJxVjDsOwjAQBe_iGln-LfZS0ucM1q5j4wCypXwqxN0hUgpo38y8l4i0rTVuS57jNIqLMFqcfkem9MhtJ-Od2q3L1Ns6Tyx3RR50kUMf8_N6uH8HlZb6rT0gUs5oFJwT-qJdAl0wKLAlOes0lQDWesNYmIE4mwBOK2aNxQYr3h_xSDeE:1pVUpC:FbWneOcKCBkEUrFVaibjWf-d0T7BFMiNHBn3Q6-ud7s','2023-03-10 09:57:10.048959'),('jndcjj8zharz2jcmzxrucikxu9qfelad','.eJxVjDsOwjAQRO_iGlkB_9aU9DmDtet1cADZUpxUiLvjSCmgnDdv5i0CbmsOW0tLmFlcxVmcfhlhfKayF_zAcq8y1rIuM8ldkUfb5Fg5vW6H-3eQseW-Tmx9ggGdmZxm1lMEOzB4imTRKyBvvIpaa3BIPYC5gCJWCagTheLzBfWLOC0:1nHPS2:fHerVabhCDnsRgY9VFW65VCKhoNNyB8OETZgGDYbfjY','2022-02-22 12:18:30.210086'),('k5kqxqumyteaj9p691acocn5u0yc3s2f','.eJxVjL0OwyAQg9-FuUL8BAEdu_cZ0MEdJW0FUkimqO9eImVoZU_2Z-8swLaWsHVawozsyiS7_GYR0ovqUeAT6qPx1Oq6zJEfCD_bzu8N6X072b-DAr2M9UQkIg6Bd1lp6TNqY5JyWoJ1mGhYiqytV84IqbKiLKwmHQcvxcQ-XwWVOC8:1pWem8:DPZ1oHn4IUdhYRGWUFLEt6XHfeE4I-nMWR28DF1ByDs','2023-03-13 14:46:48.426817'),('kjw4lygrenpz31bsh3sy6fezavad83zt','.eJxVjMEOwiAQRP-FsyHQlgIevfcbyC67SNVAUtqT8d9tkx70NMm8N_MWAbY1h63xEmYSV6HF5bdDiE8uB6AHlHuVsZZ1mVEeijxpk1Mlft1O9-8gQ8v7OqI1YDkmr3wErVQ_OO1SQiJPo1ZaAbFD7pjNGCkpv6c1fTcgAfckPl8F6Djs:1pLyJD:k8FoePdgA2pcxSzGIWI5HkFHaX2I4myBVUIbYLU9en4','2023-02-12 03:24:47.890056'),('kmdb8glww5fxn7c0hova741horw69nir','.eJxVjcsOwiAURP-FtSEgb5fu_QZyuVykaiAp7cr477ZJF7qdc2bmzSKsS43roDlOmV2YZKffLAE-qe0gP6DdO8felnlKfFf4QQe_9Uyv6-H-DVQYdWsrTMJYH0LWymvlzDkTeEwewWtwmoQpTgqfLbkgpSEspkiXyJbtxBn2-QLX3jgZ:1pNPOI:4s3A53B1tIVxDQO2m-i68f8t2ZBj2DBzeT5q-s1f9OQ','2023-02-16 02:31:58.098423'),('l6xg4jrgfcjqm7azs7z5wiaeid1ot7zx','.eJxVjEEOgjAURO_StWnaT_spLt1zBvJpR4uaklBYGe-uJCx0O--9ealBtjUPW8UyTEmdlVWn322U-EDZQbpLuc06zmVdplHvij5o1f2c8Lwc7t9Blpq_tSBZOE4GwcMbF0DWjabjaCJzROuZCNemJZIU0PhAAtNKx5bYwaj3B-JqN2w:1pK9ao:Z7n2cKTMY70dzDfIfNSSK_7rlDUOozw6A1xiOZ3caRE','2023-02-07 03:03:26.805337'),('ldwe8c0rk9z0wcbk9l3uw5x78ahnp0b2','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1nMW7M:hwlF2gL0EMCZq5isBA_TP7rxsWjvBCXwj1fFY6ZbCBw','2022-03-08 14:26:16.823098'),('lm3h38ba9s6ul16d66na0ap04abgkhzd','.eJxVjDsOwjAQBe_iGln-LfZS0ucM1q5j4wCypXwqxN0hUgpo38y8l4i0rTVuS57jNIqLMFqcfkem9MhtJ-Od2q3L1Ns6Tyx3RR50kUMf8_N6uH8HlZb6rT0gUs5oFJwT-qJdAl0wKLAlOes0lQDWesNYmIE4mwBOK2aNxQYr3h_xSDeE:1pVjrg:eLX3PubcBd8p0jcFaIicOTlRHeMARKuuy7fMJE9I3ZM','2023-03-11 02:00:44.379919'),('lnmy4172s2mnrkcgpxs39emmfgmhyaoo','.eJxVjcsOwiAURP-FtSEgb5fu_QZyuVykaiAp7cr477ZJF7qdc2bmzSKsS43roDlOmV2YZKffLAE-qe0gP6DdO8felnlKfFf4QQe_9Uyv6-H-DVQYdWsrTMJYH0LWymvlzDkTeEwewWtwmoQpTgqfLbkgpSEspkiXyJbtxBn2-QLX3jgZ:1pUMVt:GZKSQjN2zy9cxe6M1i4g3RcN07dNQtkOb0KErOBdqSs','2023-03-07 06:52:33.340023'),('ltipytmi21ejvmpv6ch31977dkuy9mov','MzM2MDAzMGNiOWJiMTI3MTBkZjNjNjRmZDIxNjhiYTA0ZDQ1Y2FhNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMDA0ZGJkYjFjMWM2ZGIwNTkxYTE4ZGViZWJmNjg4MDkwNDNlYmM0In0=','2022-03-06 11:21:10.968308'),('mfmpwrtk1psnk6j8ofrejju58pb6xgos','MzM2MDAzMGNiOWJiMTI3MTBkZjNjNjRmZDIxNjhiYTA0ZDQ1Y2FhNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMDA0ZGJkYjFjMWM2ZGIwNTkxYTE4ZGViZWJmNjg4MDkwNDNlYmM0In0=','2022-03-06 11:16:51.250999'),('moi3nz10c5ze0cfsl088nujk57gn6g5k','MzM2MDAzMGNiOWJiMTI3MTBkZjNjNjRmZDIxNjhiYTA0ZDQ1Y2FhNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMDA0ZGJkYjFjMWM2ZGIwNTkxYTE4ZGViZWJmNjg4MDkwNDNlYmM0In0=','2022-03-06 10:58:10.127699'),('mxqfkuo3uzedcs86ah3ykmvhnoz6a30a','.eJxVjcsOwiAURP-FtSEgb5fu_QZyuVykaiAp7cr477ZJF7qdc2bmzSKsS43roDlOmV2YZKffLAE-qe0gP6DdO8felnlKfFf4QQe_9Uyv6-H-DVQYdWsrTMJYH0LWymvlzDkTeEwewWtwmoQpTgqfLbkgpSEspkiXyJbtxBn2-QLX3jgZ:1pWCol:s1NfN6AYdkbECp6Ok5qjzhs3k1XmSod13ZvUjiHxizo','2023-03-12 08:55:39.549577'),('n2r02aub0t9ln2uhia7jufccnhysqbsp','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1oQMpd:2RkNZS2p0xLD7uGGY0OtWxd5-YwfsocvYzcZK8KJEq4','2022-09-06 05:52:09.282260'),('n5k7axw19w91rq7wofjfjnzg94zq7ljx','.eJxVjcsOwiAURP-FtSEgb5fu_QZyuVykaiAp7cr477ZJF7qdc2bmzSKsS43roDlOmV2YZKffLAE-qe0gP6DdO8felnlKfFf4QQe_9Uyv6-H-DVQYdWsrTMJYH0LWymvlzDkTeEwewWtwmoQpTgqfLbkgpSEspkiXyJbtxBn2-QLX3jgZ:1pVUUG:j_OrvOe7k_pE9YBG3_k9BqgCZTbVp3FZFBWtzkd0hBo','2023-03-10 09:35:32.708734'),('ota5mdepnuf0cuxbjneik831e4l7yocb','.eJxVjEEOgjAURO_StWnaT_spLt1zBvJpR4uaklBYGe-uJCx0O--9ealBtjUPW8UyTEmdlVWn322U-EDZQbpLuc06zmVdplHvij5o1f2c8Lwc7t9Blpq_tSBZOE4GwcMbF0DWjabjaCJzROuZCNemJZIU0PhAAtNKx5bYwaj3B-JqN2w:1pK9Yr:TjqAbpCBoDwnYk2NEkqTvM1nZHWJWi-Kl_3SJ16We3g','2023-02-07 03:01:25.789842'),('owoo413e6hdaijjjol87oma2np42w8gp','.eJxVjDsOwjAQBe_iGln-LfZS0ucM1q5j4wCypXwqxN0hUgpo38y8l4i0rTVuS57jNIqLMFqcfkem9MhtJ-Od2q3L1Ns6Tyx3RR50kUMf8_N6uH8HlZb6rT0gUs5oFJwT-qJdAl0wKLAlOes0lQDWesNYmIE4mwBOK2aNxQYr3h_xSDeE:1pUi2S:IWKeCVC6iGg8gM5QrK5dTK3Eur7KQv4pXXznhpuU4eY','2023-03-08 05:51:36.313381'),('p8nxm3syjlv2vm7lus4u8tv5dqqmsor4','NGU0M2ZjOTBhNDI1MDEzY2RlNDAwZDQwMGM5MzhmZDY5NzBkMjY3ZTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxY2ZiNzc3ZDQ0ZWZhZWVjMjljZjcwZTUzOTA1ZWI1ZjM1YTZhOTA4In0=','2022-02-23 09:42:55.407688'),('pffl8dz9xtzimho8mmpcsppn5u95jqd8','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1np8WG:npW1YOEfyzJDfvJ3UaATYdYr8wHaLCVsLZAaiAklO50','2022-05-26 13:06:16.480519'),('pw7266jrozlnmtqknnvd02hfgbr9ai23','.eJxVjDsOwjAQBe_iGln-LfZS0ucM1q5j4wCypXwqxN0hUgpo38y8l4i0rTVuS57jNIqLMFqcfkem9MhtJ-Od2q3L1Ns6Tyx3RR50kUMf8_N6uH8HlZb6rT0gUs5oFJwT-qJdAl0wKLAlOes0lQDWesNYmIE4mwBOK2aNxQYr3h_xSDeE:1pVjfd:tAX_jBItA8eAAk5e1wI8vf_xWU0l5xVLfsfAHunOMiU','2023-03-11 01:48:17.004010'),('q9w7ow717gf5w7ay4qmfa36gw9nr6rn0','.eJxVjDkOwjAUBe_iGlmxFS-hpOcM1vdfcADZUpxUiLtDpBTQvpl5L5VgW0vaOi9pJnVWRp1-twz44LoDukO9NY2trsuc9a7og3Z9bcTPy-H-HRTo5VsLg4HsrITgR0BPKGPEgDxZFJSBoslOPOVgvbDjiTFGwRENM5MZ1PsDK1U59A:1pMVXL:prA2sRkAsryNVZP7XRg5FQ8bl2UMFDsYUZeSFda1XZM','2023-02-13 14:53:35.601018'),('qh9fvvluju48pd8y51m6ggyunxa0w1rq','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1nMlVi:d9n0Ag4Qi572z5nbVDVAYs1tDh8mhWmIoFtwWmzw9w4','2022-03-09 06:52:26.676193'),('r2nz93bbimy7glky4ai1z5gobl195dpz','MzM2MDAzMGNiOWJiMTI3MTBkZjNjNjRmZDIxNjhiYTA0ZDQ1Y2FhNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMDA0ZGJkYjFjMWM2ZGIwNTkxYTE4ZGViZWJmNjg4MDkwNDNlYmM0In0=','2022-03-06 10:59:09.982161'),('rw3bqdtywj9z3gmmg1svoybed6qwcvwd','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1nq4V4:e2T7mOKKBBSmQOhaecKi_RQKayt6ba5InCzyBjLx5Io','2022-05-29 03:00:54.483026'),('skzj6cg7m4rnfqy9m9k33pr5b8yinz50','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1oP1tz:9GOIZPwkYAI69iUy6uP1rwP9rR5u5IajAbFCMZ_j9t8','2022-09-02 13:19:07.439465'),('td0s9qqj4asm9hcznec6jqrouqry8mvf','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1ngPAB:YOyW2ahG9UdMX7g1x6g-8ZJT4iBJauU7NQ3xcW07-jA','2022-05-02 11:03:23.242435'),('tfais6txzvhmnextsineeplphszm4e4h','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1oSYfT:PlVtbr2jgWpIOspWd2_Jo-pVHOX8tQEJu3sL06ByFNU','2022-09-12 06:54:43.138232'),('tpwom8iwyu3al3o31eoj5yng7q7nccet','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1nMVkz:KV48zKKzm1Xo5JST_mZgMbDy-MnuQA1sHCJbGV700uY','2022-03-08 14:03:09.267182'),('ua054mxa3fschp7wtfwthe8c692tp874','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1oRldj:ew3PtBrRnpHFlWYZkblkUFGNMHohfquLUd6I1xoVNtw','2022-09-10 02:33:39.779758'),('ueulxqs9sy45quq8v0jmeg3bead87hml','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1nhY66:qCKRj8SYH4CqruONb0wKZ7luvdb5Pl4rBsuGYl9C0kY','2022-05-05 14:47:54.652982'),('ui2k8qghigsnqldfjpwibszb59x408uj','.eJxVjcsOwiAURP-FtSEgb5fu_QZyuVykaiAp7cr477ZJF7qdc2bmzSKsS43roDlOmV2YZKffLAE-qe0gP6DdO8felnlKfFf4QQe_9Uyv6-H-DVQYdWsrTMJYH0LWymvlzDkTeEwewWtwmoQpTgqfLbkgpSEspkiXyJbtxBn2-QLX3jgZ:1pVUW6:e5YbeoidOhDq3Pnj8GMrjGzLUWbSz7-gt8UHiR6DTiU','2023-03-10 09:37:26.422673'),('uig73klv8k0d6riyjpqt1ycrsjf69eie','.eJxVjEEOgjAURO_StWnaT_spLt1zBvJpR4uaklBYGe-uJCx0O--9ealBtjUPW8UyTEmdlVWn322U-EDZQbpLuc06zmVdplHvij5o1f2c8Lwc7t9Blpq_tSBZOE4GwcMbF0DWjabjaCJzROuZCNemJZIU0PhAAtNKx5bYwaj3B-JqN2w:1pK9ao:Z7n2cKTMY70dzDfIfNSSK_7rlDUOozw6A1xiOZ3caRE','2023-02-07 03:03:26.784810'),('uonatrr08kikey3wpiv5mjk927dgj20v','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1nMWCS:L9OKf3pBN8j2lZZfeY5mcG03QFEvY6B8GO8le1JoZs4','2022-03-08 14:31:32.882763'),('v9jij5wdzvy90ohhcizrgei3hvohc9zj','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1nMUJc:iljDpBp1E0jxH_6Wh3uY2wuJgYaF-Nfe-Pmpoipdx-w','2022-03-08 12:30:48.733274'),('vap5pbd4xv002qb0unkupg0dkbohbdwh','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1nMUAt:re79aRf_gRDrY_uQ-JBLL9CJ8hwvqeccLDjIoUZtzGA','2022-03-08 12:21:47.136409'),('vifxm5jhz7nwtzss0mh9rnxk84cq2axm','.eJxVjMEOwiAQRP-FsyFAgBaP3v0GsssuUjWQlPbU-O-2SQ-auc17M5uIsC4lrp3nOJG4Ci0uvx1CenE9AD2hPppMrS7zhPJQ5Em7vDfi9-10_w4K9LKvnXaQiCGMaFXCgU1GzMEPSpMBrRwqa22AHPYoD5pHSsZjsuytNiw-XwCyOIQ:1pKhGZ:C_xZpYF9OSJ2JLsyWGV6K6rP0UEYZ5PPnHlvZoPA-MM','2023-02-08 15:00:47.582220'),('vsc0hsajeuap8u2y4unz4bwisso33mm0','MzM2MDAzMGNiOWJiMTI3MTBkZjNjNjRmZDIxNjhiYTA0ZDQ1Y2FhNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMDA0ZGJkYjFjMWM2ZGIwNTkxYTE4ZGViZWJmNjg4MDkwNDNlYmM0In0=','2022-03-06 09:23:33.526590'),('w8h3xljdcgu2by5pr23aqi2rummz63mm','.eJxVjDkOwjAUBe_iGlmxFS-hpOcM1vdfcADZUpxUiLtDpBTQvpl5L5VgW0vaOi9pJnVWRp1-twz44LoDukO9NY2trsuc9a7og3Z9bcTPy-H-HRTo5VsLg4HsrITgR0BPKGPEgDxZFJSBoslOPOVgvbDjiTFGwRENM5MZ1PsDK1U59A:1pMpiB:1zwd3eJRbkabmOt7RiXoTxnuySrSGaLQj2AMuH0tkxA','2023-02-14 12:26:07.453885'),('wim5ooq92bvp3hjq9ohybo8ethmn3j17','.eJxVjDsOwjAQRO_iGlkB_9aU9DmDtet1cADZUpxUiLvjSCmgnDdv5i0CbmsOW0tLmFlcxVmcfhlhfKayF_zAcq8y1rIuM8ldkUfb5Fg5vW6H-3eQseW-Tmx9ggGdmZxm1lMEOzB4imTRKyBvvIpaa3BIPYC5gCJWCagTheLzBfWLOC0:1nHR4h:Pxnx_z8CK04FMb1Z9QqWl2r7symchUZhAwQGxbpmFrc','2022-02-22 14:02:31.031083'),('x7bqb5fgdzxsqlymtme0lna324zhum6a','.eJxVjcsOwiAURP-FtSEgb5fu_QZyuVykaiAp7cr477ZJF7qdc2bmzSKsS43roDlOmV2YZKffLAE-qe0gP6DdO8felnlKfFf4QQe_9Uyv6-H-DVQYdWsrTMJYH0LWymvlzDkTeEwewWtwmoQpTgqfLbkgpSEspkiXyJbtxBn2-QLX3jgZ:1pWCjV:UceBk7P9FGJkJmKYQOQwJccMxYBaO_ycUv77pQXYRsc','2023-03-12 08:50:13.719055'),('xgny5u1z6706nn85u6o3z5ax0skkg17b','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1nUrC9:3r_Ay3ZDBkTEX2IfKS5cs4kKCvmOd8BJk098lgGeXm8','2022-03-31 14:33:41.013288'),('xhdvsb440tn8o64d469tuy2jyj4r7rqd','.eJxVjDsOwjAQBe_iGln-rD9Q0nMGa71ekwCKpTipEHdHllJA-2bmvUXCfZvS3nlNcxEXocXpd8tIT14GKA9c7k1SW7Z1znIo8qBd3lrh1_Vw_w4m7NOocwmKyHoTULMyXABzAGMZWQEgeGsIzrGiQ-9cICDnSzQ6VpurtuLzBfInN-8:1pWf1s:speyQYz92ydCZfEJ0ZOYRpIbH3OC1o4oexrhG8-mihA','2023-03-13 15:03:04.275263'),('ylunx5wwcikv7p30s5vuihc9t4rnnrec','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1nMW3h:2mV3WCZbwwm6KgDIvXA7J_EAYjr2ey6lpWry9aeRXA8','2022-03-08 14:22:29.809019'),('ypcvsflkguiexd5vtn8ierxgh8tka4ad','.eJxVjEEOwiAQRe_C2pABChSX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWSpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WZoQBnWdjy2gBIDgXgtVg0IUEQTsOaG1RSnsAbzRl74dE5AoWzobE-wOeWzbt:1nMlPI:OopMpyPgPIEubPMMJi7qiXxQuzBFkFtd_eFEKwmU2qs','2022-03-09 06:45:48.760878'),('z21z6ej684rou4vvv6xqojs3m0qd1yvn','.eJxVjEEOwiAQRe_C2pCCAy0u3fcMZGYYbNVAUtqV8e7apAvd_vfef6mI2zrFrckS56QuyqjT70bIDyk7SHcst6q5lnWZSe-KPmjTY03yvB7u38GEbfrWYG22nTB1ziJ59jDwkF1vXO4dkDhKg88egveGDRpgpDMGAempo5DV-wPhEDgw:1pWpFg:5BUiJTtrGccIqJwan86g3N_zBgoamNlWIycxppyGQuI','2023-03-14 01:58:00.767464');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_answertable`
--

DROP TABLE IF EXISTS `user_answertable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_answertable` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `answer` varchar(256) NOT NULL,
  `answerstate` varchar(10) NOT NULL,
  `qid_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_answertable_qid_id_c704ed84_fk_user_question_id` (`qid_id`),
  CONSTRAINT `user_answertable_qid_id_c704ed84_fk_user_question_id` FOREIGN KEY (`qid_id`) REFERENCES `user_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_answertable`
--

LOCK TABLES `user_answertable` WRITE;
/*!40000 ALTER TABLE `user_answertable` DISABLE KEYS */;
INSERT INTO `user_answertable` VALUES (1,'Myocardial bridge','0',1),(2,'Anomalous left coronary artery off of the pulmonary artery','1',1),(3,'Anomalous left coronary artery off of the descending thoracic aorta','0',1),(4,'Anomalous left coronary artery off of the bronchial artery','0',1),(5,'Hypertrophic cardiomyopathy','0',1),(6,'Left; LAD; AV nodal','0',2),(7,'Left; LAD; atrial','0',2),(8,'Left; LCx; AV nodal','1',2),(9,'Left; LCx; atrial','0',2),(10,'Right; RCA; AV nodal','0',2),(11,'Trabeculation; LAD','0',3),(12,'Trabeculation; LCx','0',3),(13,'Critical stenosis; LAD','0',3),(14,'Myocardial bridge; LAD','1',3),(15,'Myocardial bridge; LCx','0',3);
/*!40000 ALTER TABLE `user_answertable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_betainfo`
--

DROP TABLE IF EXISTS `user_betainfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_betainfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `ProgramName` varchar(256) NOT NULL,
  `TraineeStatus` varchar(256) NOT NULL,
  `Email` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_betainfo`
--

LOCK TABLES `user_betainfo` WRITE;
/*!40000 ALTER TABLE `user_betainfo` DISABLE KEYS */;
INSERT INTO `user_betainfo` VALUES (35,'qgfgggdddd','zzxz','Medical Student','2394470381@qq.com'),(36,'qgfgggdddd','aaa','Medical Student','2394470381@qq.com'),(37,'qgfggg','aaaaa','Subspecialty','6666666666@qq.com'),(38,'DMH','DMH','Medical Student','604608847@qq.com'),(39,'DMH','DMH','Medical Student','604608847@qq.com'),(40,'qgfggg','zzxz','Medical Student','6666666666@qq.com'),(41,'qgfggg','aaa','Medical Student','6666666666@qq.com'),(42,'qgfggg','qqq','Medical Student','6666666666@qq.com'),(43,'qgfggg','qqq','Medical Student','6666666666@qq.com'),(44,'DMH','DMH','Medical Student','604608847@qq.com'),(45,'qgfggg','qqqqqq','Medical Student','6666666666@qq.com');
/*!40000 ALTER TABLE `user_betainfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_comment`
--

DROP TABLE IF EXISTS `user_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(256) NOT NULL,
  `username` varchar(256) NOT NULL,
  `message_user_username` varchar(25) NOT NULL,
  `parent_user_username` varchar(25) NOT NULL,
  `flag` varchar(25) NOT NULL,
  `comment_level` varchar(10) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `message_id_id` bigint(20) DEFAULT NULL,
  `message_user_id_id` int(11) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `parent_user_id_id` int(11) DEFAULT NULL,
  `uid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_comment_message_id_id_c75bcffc_fk_user_leave_message_id` (`message_id_id`),
  KEY `user_comment_message_user_id_id_dbf3c03b_fk_auth_user_id` (`message_user_id_id`),
  KEY `user_comment_parent_id_4c974e07_fk_user_comment_id` (`parent_id`),
  KEY `user_comment_parent_user_id_id_2f5589c0_fk_auth_user_id` (`parent_user_id_id`),
  KEY `user_comment_uid_id_0b9eed14_fk_auth_user_id` (`uid_id`),
  CONSTRAINT `user_comment_message_id_id_c75bcffc_fk_user_leave_message_id` FOREIGN KEY (`message_id_id`) REFERENCES `user_leave_message` (`id`),
  CONSTRAINT `user_comment_message_user_id_id_dbf3c03b_fk_auth_user_id` FOREIGN KEY (`message_user_id_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `user_comment_parent_id_4c974e07_fk_user_comment_id` FOREIGN KEY (`parent_id`) REFERENCES `user_comment` (`id`),
  CONSTRAINT `user_comment_parent_user_id_id_2f5589c0_fk_auth_user_id` FOREIGN KEY (`parent_user_id_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `user_comment_uid_id_0b9eed14_fk_auth_user_id` FOREIGN KEY (`uid_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_comment`
--

LOCK TABLES `user_comment` WRITE;
/*!40000 ALTER TABLE `user_comment` DISABLE KEYS */;
INSERT INTO `user_comment` VALUES (1,'1','admin-1','admin-1','False','1','1','2023-02-26 12:11:38.878734',9,1,NULL,NULL,1),(2,'1','admin-1','admin-1','False','1','1','2023-02-26 12:11:49.481023',9,1,NULL,NULL,1);
/*!40000 ALTER TABLE `user_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_examrecord`
--

DROP TABLE IF EXISTS `user_examrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_examrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create` datetime(6) NOT NULL,
  `uid_id` int(11) NOT NULL,
  `grade` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_examrecord_uid_id_706a95b7_fk_auth_user_id` (`uid_id`),
  CONSTRAINT `user_examrecord_uid_id_706a95b7_fk_auth_user_id` FOREIGN KEY (`uid_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_examrecord`
--

LOCK TABLES `user_examrecord` WRITE;
/*!40000 ALTER TABLE `user_examrecord` DISABLE KEYS */;
INSERT INTO `user_examrecord` VALUES (8,'2022-03-11 14:02:04.332548',1,0),(9,'2022-03-13 09:33:27.690001',10,0),(17,'2022-03-13 10:20:13.946126',12,0),(19,'2022-03-13 10:22:52.908831',13,0),(20,'2022-03-13 13:53:43.970069',14,0),(21,'2022-03-13 13:54:52.704516',15,0),(22,'2022-03-14 12:37:41.660360',16,0),(30,'2022-03-14 12:53:36.239417',17,0),(34,'2022-03-17 13:58:44.712293',19,0),(35,'2022-03-18 13:08:12.775129',1,0),(36,'2022-03-18 13:08:34.360647',1,0),(37,'2022-03-18 13:08:35.278965',1,0),(38,'2022-03-18 13:08:37.626238',1,0),(39,'2022-03-18 13:08:38.060872',1,0),(40,'2022-03-18 13:08:41.703302',1,0),(41,'2022-03-18 13:13:06.388724',1,0),(42,'2022-03-18 13:15:15.347152',1,0),(43,'2022-03-18 13:15:22.613889',1,0),(44,'2022-03-18 13:15:46.316207',1,0),(45,'2022-03-18 13:15:50.955624',1,0),(46,'2022-03-18 13:17:45.487648',1,0),(47,'2022-03-18 13:18:44.083407',1,0),(48,'2022-03-18 13:18:58.538875',1,0),(49,'2022-03-18 13:19:17.553204',1,0),(50,'2022-03-18 13:20:40.351237',1,0),(51,'2022-03-18 13:21:58.126251',1,0),(52,'2022-03-18 13:24:39.175171',1,0),(53,'2022-03-18 13:25:52.177017',1,0),(54,'2022-03-18 13:26:00.199305',1,0),(55,'2022-03-18 13:56:07.354069',1,0),(56,'2022-03-19 07:10:50.683382',1,0),(57,'2022-03-19 07:11:10.894688',1,0),(58,'2022-03-19 07:54:36.345018',1,0),(59,'2022-03-19 07:54:38.479014',1,0),(60,'2022-03-19 07:54:45.358586',1,0),(61,'2022-03-19 07:55:50.780526',1,0),(62,'2022-03-19 07:58:09.932368',1,0),(63,'2022-03-19 07:58:24.290932',1,0),(64,'2022-03-19 07:58:27.671896',1,0),(65,'2022-03-19 07:58:29.111896',1,0),(66,'2022-03-19 08:00:24.914003',1,0),(67,'2022-03-19 08:01:52.574381',1,0),(68,'2022-03-19 08:04:04.034796',1,0),(69,'2022-03-19 08:51:38.843719',1,0),(70,'2022-03-20 02:53:09.699489',1,0),(71,'2022-03-20 02:53:59.746082',1,0),(72,'2022-03-20 03:01:06.903212',1,0),(73,'2022-03-23 08:40:36.506059',1,0),(74,'2022-03-23 12:26:30.199814',1,0),(75,'2022-03-23 12:46:14.370972',1,0),(76,'2022-03-23 12:46:20.924408',1,0),(77,'2022-03-23 12:46:35.697868',1,0),(78,'2022-03-23 12:46:54.954335',1,0),(79,'2022-04-10 11:22:40.867262',1,0),(80,'2022-04-10 20:48:26.144843',1,0),(81,'2022-04-10 20:48:32.903702',1,0),(82,'2022-04-10 20:59:18.015557',1,0),(83,'2022-04-10 20:59:25.305864',1,0),(84,'2022-04-10 21:00:26.088215',1,0),(85,'2022-04-10 21:00:30.277266',1,0),(86,'2022-04-11 12:21:47.681285',1,0),(87,'2022-04-12 02:14:14.573080',1,0),(88,'2022-04-12 02:15:30.780870',1,0),(106,'2022-04-21 14:55:47.569609',1,0),(107,'2022-04-21 14:56:04.006608',1,0),(108,'2022-04-21 14:57:05.903808',1,0),(109,'2022-04-21 14:57:18.573755',1,0),(110,'2022-04-21 14:57:32.596789',1,0),(111,'2022-04-24 15:23:20.008636',1,0),(112,'2022-04-25 05:35:31.830491',1,0),(113,'2022-04-25 15:46:02.504283',1,0),(114,'2022-04-27 14:44:18.075788',1,10),(115,'2022-04-28 15:38:31.992463',1,0),(116,'2022-04-28 15:48:55.152586',1,0),(117,'2022-04-28 15:49:04.454774',1,0),(118,'2022-04-28 15:55:28.999735',1,30),(119,'2022-04-30 09:05:13.437594',1,0),(120,'2022-04-30 09:05:13.572285',1,0),(121,'2022-04-30 15:59:57.160482',1,10),(122,'2022-04-30 16:05:17.926141',1,10),(123,'2022-04-30 16:09:27.103888',1,10),(124,'2022-04-30 16:10:04.115025',1,20),(125,'2022-04-30 16:25:05.659300',1,10),(126,'2022-05-01 04:50:47.741914',1,20),(127,'2022-05-01 05:19:57.628075',1,20),(128,'2022-05-01 05:21:17.781416',1,0),(129,'2022-05-01 05:21:28.177775',1,0),(130,'2022-05-01 05:21:37.213188',1,0),(131,'2022-05-01 05:21:44.915523',1,0),(132,'2022-05-01 05:21:51.933794',1,0),(133,'2022-05-01 05:21:59.310719',1,0),(134,'2022-05-01 05:22:20.069705',1,0),(135,'2022-05-01 05:56:51.276597',1,0),(136,'2022-05-08 14:45:04.390575',1,10),(137,'2022-05-08 14:56:46.223210',1,0),(138,'2022-05-09 15:06:51.245221',1,0),(139,'2022-05-09 15:09:35.180053',1,0),(140,'2022-05-09 15:09:41.402919',1,10),(141,'2022-05-09 15:12:29.166793',1,0),(142,'2022-05-09 15:12:38.512629',1,0),(143,'2022-05-11 06:33:22.826631',1,10),(144,'2022-05-11 06:37:21.598722',1,0),(145,'2022-05-11 06:37:36.514321',1,0),(146,'2022-05-11 06:37:43.468673',1,0),(147,'2022-05-11 06:49:13.836627',20,0),(148,'2022-05-14 12:58:58.032035',1,0),(149,'2022-05-14 13:21:56.906716',1,0),(150,'2022-05-14 13:44:08.563976',1,0),(151,'2022-05-14 13:45:09.572013',1,0),(152,'2022-05-14 13:45:24.268831',1,0),(153,'2022-05-14 13:45:52.501625',1,0),(154,'2022-05-15 03:23:40.868972',1,0),(155,'2022-05-15 03:55:25.762582',1,0),(156,'2022-05-15 06:40:47.823375',1,0),(157,'2022-05-15 06:43:30.049408',1,0),(158,'2022-09-02 20:06:01.457490',1,0),(159,'2022-09-02 20:07:32.811812',1,0),(160,'2022-09-02 20:07:58.372935',1,0),(161,'2022-09-02 20:09:26.160851',1,0),(162,'2022-09-02 20:09:41.475877',1,0),(163,'2022-09-02 20:09:53.251845',1,0),(164,'2022-09-02 20:10:00.223471',1,0),(165,'2022-09-02 20:10:06.001695',1,0),(166,'2022-09-02 20:13:54.708098',1,20),(167,'2022-09-02 20:16:48.736155',1,0),(168,'2022-09-02 20:32:17.928514',1,0),(169,'2022-09-05 02:49:25.107999',1,0),(170,'2023-01-25 15:01:12.693404',1,0),(171,'2023-02-01 15:38:11.583741',1,0),(172,'2023-02-06 01:31:50.761065',1,0),(173,'2023-02-07 07:55:09.399224',1,0),(174,'2023-02-07 07:55:28.752605',1,0),(175,'2023-02-08 13:49:57.725432',1,0),(176,'2023-02-08 14:06:42.974886',1,0),(177,'2023-02-22 07:51:46.681200',21,0),(178,'2023-02-27 11:13:56.553036',1,0),(179,'2023-02-27 11:18:55.827422',1,0),(180,'2023-02-27 11:20:43.220202',1,0),(181,'2023-02-27 12:01:01.150228',1,0),(182,'2023-02-27 12:06:06.025713',1,0),(183,'2023-02-27 12:06:42.486467',1,0),(184,'2023-02-27 12:08:27.931916',1,0),(185,'2023-02-27 12:10:35.752503',1,0),(186,'2023-02-27 12:14:55.217361',1,0),(187,'2023-02-27 12:16:52.179285',1,0),(188,'2023-02-27 14:07:46.898611',1,0),(189,'2023-02-27 14:44:55.851582',1,0),(190,'2023-02-27 14:46:55.410630',1,0),(191,'2023-02-27 14:50:59.788465',1,0),(192,'2023-02-27 15:03:14.525025',1,0),(193,'2023-02-28 02:00:32.406685',1,0),(194,'2023-02-28 02:03:43.152042',1,0),(195,'2023-02-28 02:04:53.604629',1,0),(196,'2023-02-28 02:06:03.775278',1,0),(197,'2023-02-28 02:09:38.292391',1,0),(198,'2023-02-28 02:11:09.548856',1,0);
/*!40000 ALTER TABLE `user_examrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_img`
--

DROP TABLE IF EXISTS `user_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_img` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `img` varchar(5000) DEFAULT NULL,
  `uid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_img_uid_id_e0070d0a_fk_auth_user_id` (`uid_id`),
  CONSTRAINT `user_img_uid_id_e0070d0a_fk_auth_user_id` FOREIGN KEY (`uid_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_img`
--

LOCK TABLES `user_img` WRITE;
/*!40000 ALTER TABLE `user_img` DISABLE KEYS */;
INSERT INTO `user_img` VALUES (14,'static/users/admin/uploads/164','static/users/admin/uploads',1),(15,'static/users/admin/uploads/164','static/users/admin/uploads',1),(16,'static/users/admin/uploads/164','static/users/admin/uploads',1),(17,'static/users/admin/uploads/164','static/users/admin/uploads',1),(18,'static/admin/uploads/164567228','static/users/admin/uploads',1),(19,'static/users/admin/uploads/165','static/users/admin/uploads',1),(20,'static/users/admin/uploads/165','static/users/admin/uploads',1),(21,'static/users/admin/uploads/166','static/users/admin/uploads',1),(22,'static/users/admin/uploads/1677486261.1069136.png','static/users/admin/uploads',1);
/*!40000 ALTER TABLE `user_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_leave_message`
--

DROP TABLE IF EXISTS `user_leave_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_leave_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `content` varchar(256) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `flag` varchar(25) NOT NULL,
  `uid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_leave_message_uid_id_b971a15f_fk_auth_user_id` (`uid_id`),
  CONSTRAINT `user_leave_message_uid_id_b971a15f_fk_auth_user_id` FOREIGN KEY (`uid_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_leave_message`
--

LOCK TABLES `user_leave_message` WRITE;
/*!40000 ALTER TABLE `user_leave_message` DISABLE KEYS */;
INSERT INTO `user_leave_message` VALUES (9,'this is title','this is content','2023-02-26 11:57:44.543104','2023-02-26 11:57:44.543104','1',1),(10,'1','1','2023-02-26 12:12:19.637026','2023-02-26 12:12:19.637026','1',1);
/*!40000 ALTER TABLE `user_leave_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_notice`
--

DROP TABLE IF EXISTS `user_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_notice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` longtext,
  `flag` varchar(25) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `views` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_notice`
--

LOCK TABLES `user_notice` WRITE;
/*!40000 ALTER TABLE `user_notice` DISABLE KEYS */;
INSERT INTO `user_notice` VALUES (1,'Introduction to Coronary Angiography:','AngioBase is a medical education platform to help users learn how to interpret coronary angiography. Coronary angiograms are X-ray videos of the heart – obtained by combining X-ray fluoroscopy and catheter-based angiography. Contrast dye, which is radio-opaque and thus visible during X-ray acquisition, is injected through a catheter and into the ostium of the coronary artery. Video is then captured as the dye courses through the epicardial coronary arteries and into the microvasculature – known as coronary angiography. \r\nThis website is designed to help users learn coronary anatomy through improved understanding of invasive coronary angiography. Users will learn projections of the left and right coronary systems. Projections are different views of the coronary arteries. The image intensifier (the “camera”) is positioned in various angulations, allowing the interventional cardiologist to capture standard views of the coronary arteries that are similar between patients.\r\nThere are 6 standard projections for coronary angiography, obtained by combining either a left anterior oblique (LAO) or a right anterior oblique (RAO) angulation (along the lateral axis) with either cranial, antero-posterior (AP), or caudal angulation (along the longitudinal axis). Thus, the 6 standard projections are LAO-Cranial, LAO-AP, LAO-Caudal, RAO-Cranial, RAO-AP, and RAO-Caudal.','1','2023-02-25 12:18:57.252517',2),(2,'How to Use AngioBase','This website is designed to be user friendly. On the top of the screen, you will see several tabs. Vessel identification has several tools that you can use to learn anatomy, including Vessel Name, Vessel Map, and Projections.\r\nVessel Name – click on an arterial segment and identify the correct label from a dropdown list.\r\nVessel Map – hover your mouse over an arterial segment and see the correct label appear.\r\nProjections – click on any projection and scroll through examples matched to a standard labelled key.\r\nThe Quiz Bank tab contains clinical-based questions regarding coronary arterial anatomy. Receive immediate feedback on your answer with explanations.','1','2023-02-25 12:19:11.729417',11);
/*!40000 ALTER TABLE `user_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_picturnameandeurl`
--

DROP TABLE IF EXISTS `user_picturnameandeurl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_picturnameandeurl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `patient_name` varchar(256) NOT NULL,
  `LAOpictureurl` varchar(256) NOT NULL,
  `RAOpictureurl` varchar(256) NOT NULL,
  `LAOjsurl` varchar(256) NOT NULL,
  `RAOjsurl` varchar(256) NOT NULL,
  `LAOabsolutelypictureurl` varchar(256) NOT NULL,
  `RAOabsolutelypictureurl` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_picturnameandeurl`
--

LOCK TABLES `user_picturnameandeurl` WRITE;
/*!40000 ALTER TABLE `user_picturnameandeurl` DISABLE KEYS */;
INSERT INTO `user_picturnameandeurl` VALUES (1,'Case1','../static/json/Case1/LAO.png','../static/json/Case1/RAO.png','static/json/Case1/LAO.json','static/json/Case1/RAO.json','D:/django project/AngioBase0207/AngioBase0207/static/json/Case1/LAO.png','D:/django project/AngioBase0207/AngioBase0207/static/json/Case1/RAO.png'),(2,'Case2','../static/json/Case2/LAO.png','../static/json/Case2/RAO.png','static/json/Case2/LAO.json','static/json/Case2/RAO.json','D:/django project/AngioBase0207/AngioBase0207/static/json/Case2/LAO.png','D:/django project/AngioBase0207/AngioBase0207/static/json/Case2/RAO.png'),(3,'Case3','../static/json/Case3/LAO.png','../static/json/Case3/RAO.png','static/json/Case3/LAO.json','static/json/Case3/RAO.json','D:/django project/AngioBase0207/AngioBase0207/static/json/Case3/LAO.png','D:/django project/AngioBase0207/AngioBase0207/static/json/Case3/RAO.png'),(4,'Case4','../static/json/Case4/LAO.png','../static/json/Case4/RAO.png','static/json/Case4/LAO.json','static/json/Case4/RAO.json','D:/django project/AngioBase0207/AngioBase0207/static/json/Case4/LAO.png','D:/django project/AngioBase0207/AngioBase0207/static/json/Case4/RAO.png'),(5,'Case5','../static/json/Case5/LAO.png','../static/json/Case5/RAO.png','static/json/Case5/LAO.json','static/json/Case5/RAO.json','D:/django project/AngioBase0207/AngioBase0207/static/json/Case5/LAO.png','D:/django project/AngioBase0207/AngioBase0207/static/json/Case5/RAO.png'),(6,'Case6','../static/json/Case6/LAO.png','../static/json/Case6/RAO.png','static/json/Case6/LAO.json','static/json/Case6/RAO.json','D:/django project/AngioBase0207/AngioBase0207/static/json/Case6/LAO.png','D:/django project/AngioBase0207/AngioBase0207/static/json/Case6/RAO.png'),(7,'Case7','../static/json/Case7/LAO.png','../static/json/Case7/RAO.png','static/json/Case7/LAO.json','static/json/Case7/RAO.json','D:/django project/AngioBase0207/AngioBase0207/static/json/Case7/LAO.png','D:/django project/AngioBase0207/AngioBase0207/static/json/Case7/RAO.png'),(8,'Case8','../static/json/Case8/LAO.png','../static/json/Case8/RAO.png','static/json/Case8/LAO.json','static/json/Case8/RAO.json','D:/django project/AngioBase0207/AngioBase0207/static/json/Case8/LAO.png','D:/django project/AngioBase0207/AngioBase0207/static/json/Case8/RAO.png'),(9,'Case9','../static/json/Case9/LAO.png','../static/json/Case9/RAO.png','static/json/Case9/LAO.json','static/json/Case9/RAO.json','D:/django project/AngioBase0207/AngioBase0207/static/json/Case9/LAO.png','D:/django project/AngioBase0207/AngioBase0207/static/json/Case9/RAO.png'),(10,'Case10','../static/json/Case10/LAO.png','../static/json/Case10/RAO.png','static/json/Case10/LAO.json','static/json/Case10/RAO.json','D:/django project/AngioBase0207/AngioBase0207/static/json/Case10/LAO.png','D:/django project/AngioBase0207/AngioBase0207/static/json/Case10/RAO.png'),(11,'Case11','../static/json/Case11/LAO.png','../static/json/Case11/RAO.png','static/json/Case11/LAO.json','static/json/Case11/RAO.json','D:/django project/AngioBase0207/AngioBase0207/static/json/Case11/LAO.png','D:/django project/AngioBase0207/AngioBase0207/static/json/Case11/RAO.png'),(12,'Case12','../static/json/Case12/LAO.png','../static/json/Case12/RAO.png','static/json/Case12/LAO.json','static/json/Case12/RAO.json','D:/django project/AngioBase0207/AngioBase0207/static/json/Case12/LAO.png','D:/django project/AngioBase0207/AngioBase0207/static/json/Case12/RAO.png'),(13,'Case13','../static/json/Case13/LAO.png','../static/json/Case13/RAO.png','static/json/Case13/LAO.json','static/json/Case13/RAO.json','D:/django project/AngioBase0207/AngioBase0207/static/json/Case13/LAO.png','D:/django project/AngioBase0207/AngioBase0207/static/json/Case13/RAO.png'),(14,'Case14','../static/json/Case14/LAO.png','../static/json/Case14/RAO.png','static/json/Case14/LAO.json','static/json/Case14/RAO.json','D:/django project/AngioBase0207/AngioBase0207/static/json/Case14/LAO.png','D:/django project/AngioBase0207/AngioBase0207/static/json/Case14/RAO.png'),(15,'Case15','../static/json/Case15/LAO.png','../static/json/Case15/RAO.png','static/json/Case15/LAO.json','static/json/Case15/RAO.json','D:/django project/AngioBase0207/AngioBase0207/static/json/Case15/LAO.png','D:/django project/AngioBase0207/AngioBase0207/static/json/Case15/RAO.png'),(16,'Case16','../static/json/Case16/LAO.png','../static/json/Case16/RAO.png','static/json/Case16/LAO.json','static/json/Case16/RAO.json','D:/django project/AngioBase0207/AngioBase0207/static/json/Case16/LAO.png','D:/django project/AngioBase0207/AngioBase0207/static/json/Case16/RAO.png'),(17,'Case17','../static/json/Case17/LAO.png','../static/json/Case17/RAO.png','static/json/Case17/LAO.json','static/json/Case17/RAO.json','D:/django project/AngioBase0207/AngioBase0207/static/json/Case17/LAO.png','D:/django project/AngioBase0207/AngioBase0207/static/json/Case17/RAO.png'),(18,'Case18','../static/json/Case18/LAO.png','../static/json/Case18/RAO.png','static/json/Case18/LAO.json','static/json/Case18/RAO.json','D:/django project/AngioBase0207/AngioBase0207/static/json/Case18/LAO.png','D:/django project/AngioBase0207/AngioBase0207/static/json/Case18/RAO.png'),(19,'Case19','../static/json/Case19/LAO.png','../static/json/Case19/RAO.png','static/json/Case19/LAO.json','static/json/Case19/RAO.json','D:/django project/AngioBase0207/AngioBase0207/static/json/Case19/LAO.png','D:/django project/AngioBase0207/AngioBase0207/static/json/Case19/RAO.png'),(20,'Case20','../static/json/Case20/LAO.png','../static/json/Case20/RAO.png','static/json/Case20/LAO.json','static/json/Case20/RAO.json','D:/django project/AngioBase0207/AngioBase0207/static/json/Case20/LAO.png','D:/django project/AngioBase0207/AngioBase0207/static/json/Case20/RAO.png'),(21,'Case21','../static/json/Case21/LAO.png','../static/json/Case21/RAO.png','static/json/Case21/LAO.json','static/json/Case21/RAO.json','D:/django project/AngioBase0207/AngioBase0207/static/json/Case21/LAO.png','D:/django project/AngioBase0207/AngioBase0207/static/json/Case21/RAO.png'),(22,'Case22','../static/json/Case22/LAO.png','../static/json/Case22/RAO.png','static/json/Case22/LAO.json','static/json/Case22/RAO.json','D:/django project/AngioBase0207/AngioBase0207/static/json/Case22/LAO.png','D:/django project/AngioBase0207/AngioBase0207/static/json/Case22/RAO.png'),(23,'Case23','../static/json/Case23/LAO.png','../static/json/Case23/RAO.png','static/json/Case23/LAO.json','static/json/Case23/RAO.json','D:/django project/AngioBase0207/AngioBase0207/static/json/Case23/LAO.png','D:/django project/AngioBase0207/AngioBase0207/static/json/Case23/RAO.png');
/*!40000 ALTER TABLE `user_picturnameandeurl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_question`
--

DROP TABLE IF EXISTS `user_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `qname` varchar(256) NOT NULL,
  `explanation` mediumtext NOT NULL,
  `references` varchar(256) DEFAULT NULL,
  `state` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_question`
--

LOCK TABLES `user_question` WRITE;
/*!40000 ALTER TABLE `user_question` DISABLE KEYS */;
INSERT INTO `user_question` VALUES (1,'57 year-old woman presents with shortness of breath. What is the diagnosis?','Anomalous left coronary from the pulmonary artery (ALCAPA), also known as Bland-White-Garland syndrome, is a rare congenital anomaly that affects less than 1% of live births. Most of these children do not survive to adulthood. These patients are at risk for myocardial ischemia, heart failure, and sudden cardiac death. Eventually, these patients develop large collateral vessels off of the right coronary artery in order to perfuse the left coronary tree. In the present case, an angiogram performed of the aortic root showed no origin of the left coronary artery (LCA). However, when the right coronary artery was injected with contrast, you can visualize retrograde filling of the LCA via right to left collaterals.','1. Angelini P, Velasco JA, Flamm S. Coronary anomalies: incidence, pathophysiology, and clinical relevance. Circulation. 2002 May 21;105(20):2449-54. 2. Parizek P, Haman L, Harrer J, Tauchman M, Rozsival V, Varvarovsky I, Pleskot M, Mestan M, Stasek J. Bl','1'),(2,'This coronary circulation is ___ dominant. You can tell because the ___  gives off the ___ artery.','Dominance is determined by which coronary (RCA vs LCx) gives rise to the posterior descending artery, which in turn gives off the AV nodal artery. In this case, the coronary tree is left-dominant. The AV nodal artery is highlighted, originating from the LCx.','1. Angelini P, Velasco JA, Flamm S. Coronary anomalies: incidence, pathophysiology, and clinical relevance. Circulation. 2002 May 21;105(20):2449-54. 2. Parizek P, Haman L, Harrer J, Tauchman M, Rozsival V, Varvarovsky I, Pleskot M, Mestan M, Stasek J. Bl','1'),(3,'This is an example of a ___ in the ___ artery.','A myocardial bridge, characterized by an intramyocardial segment of an epicardial coronary artery, is suggested here by the systolic compression of the  tunneled segment. In most cases, this anomaly remains clinically silent. ','1. Möhlenkamp S, Hort W, Ge J, Erbel R. Update on myocardial bridging. Circulation. 2002 Nov 12;106(20):2616-22. ','1');
/*!40000 ALTER TABLE `user_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_questionex`
--

DROP TABLE IF EXISTS `user_questionex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_questionex` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `e_url` varchar(256) DEFAULT NULL,
  `qid_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_questionex_qid_id_f97e6a41` (`qid_id`),
  CONSTRAINT `user_questionex_qid_id_f97e6a41_fk_user_question_id` FOREIGN KEY (`qid_id`) REFERENCES `user_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_questionex`
--

LOCK TABLES `user_questionex` WRITE;
/*!40000 ALTER TABLE `user_questionex` DISABLE KEYS */;
INSERT INTO `user_questionex` VALUES (1,'\\static\\question\\e\\2.png',2),(2,'\\static\\question\\e\\3.png',3);
/*!40000 ALTER TABLE `user_questionex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_questiongif`
--

DROP TABLE IF EXISTS `user_questiongif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_questiongif` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `q_url` varchar(256) DEFAULT NULL,
  `qid_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_questiongif_qid_id_02714467` (`qid_id`),
  CONSTRAINT `user_questiongif_qid_id_02714467_fk_user_question_id` FOREIGN KEY (`qid_id`) REFERENCES `user_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_questiongif`
--

LOCK TABLES `user_questiongif` WRITE;
/*!40000 ALTER TABLE `user_questiongif` DISABLE KEYS */;
INSERT INTO `user_questiongif` VALUES (1,'\\\\static\\\\question\\\\q\\\\QB1\\\\QB1_1.gif\n',1),(2,'\\static\\question\\q\\QB1\\QB1_2.gif',1),(3,'\\static\\question\\q\\QB1\\QB1_3.gif\n ',1),(6,'\\static\\question\\q\\QB2\\QB2_1.gif\n',2),(7,'\\static\\question\\q\\QB2\\QB2_2.gif',2),(8,'\\static\\question\\q\\QB2\\QB2_3.gif\n ',2),(11,'\\static\\question\\q\\QB3\\QB3_1.gif\n',3);
/*!40000 ALTER TABLE `user_questiongif` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_questions`
--

DROP TABLE IF EXISTS `user_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_questions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Exam_id` bigint(20) DEFAULT NULL,
  `qid_id` bigint(20) NOT NULL,
  `flag` varchar(256) NOT NULL,
  `answer_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_questions_Exam_id_ceaf5b96_fk_user_examrecord_id` (`Exam_id`),
  KEY `user_questions_qid_id_6ad29db4` (`qid_id`),
  KEY `user_questions_answer_id_53127bbc_fk_user_answertable_id` (`answer_id`),
  CONSTRAINT `user_questions_Exam_id_ceaf5b96_fk_user_examrecord_id` FOREIGN KEY (`Exam_id`) REFERENCES `user_examrecord` (`id`),
  CONSTRAINT `user_questions_answer_id_53127bbc_fk_user_answertable_id` FOREIGN KEY (`answer_id`) REFERENCES `user_answertable` (`id`),
  CONSTRAINT `user_questions_qid_id_6ad29db4_fk_user_question_id` FOREIGN KEY (`qid_id`) REFERENCES `user_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=286 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_questions`
--

LOCK TABLES `user_questions` WRITE;
/*!40000 ALTER TABLE `user_questions` DISABLE KEYS */;
INSERT INTO `user_questions` VALUES (11,8,2,'0',NULL),(15,17,1,'0',NULL),(16,17,2,'0',NULL),(19,19,1,'0',NULL),(20,19,2,'0',NULL),(21,20,3,'0',NULL),(22,20,2,'0',NULL),(23,21,2,'0',NULL),(24,21,3,'0',NULL),(25,112,1,'0',NULL),(26,112,2,'0',NULL),(27,112,3,'0',NULL),(29,113,2,'0',NULL),(30,113,3,'0',NULL),(31,114,2,'1',NULL),(33,114,3,'-1',13),(34,115,2,'-1',7),(35,115,3,'-1',13),(36,115,1,'-1',4),(37,116,2,'0',NULL),(38,116,1,'0',NULL),(39,116,3,'0',NULL),(42,117,1,'0',NULL),(43,118,1,'-1',2),(47,119,2,'0',NULL),(48,119,3,'0',NULL),(140,150,2,'0',NULL),(142,151,3,'0',NULL),(143,151,1,'0',NULL),(144,151,2,'0',NULL),(145,152,2,'0',NULL),(146,152,1,'0',NULL),(147,152,3,'0',NULL),(148,153,2,'0',NULL),(150,153,3,'0',NULL),(151,154,3,'0',NULL),(152,154,1,'0',NULL),(153,154,2,'0',NULL),(154,155,2,'0',NULL),(155,155,1,'0',NULL),(156,155,3,'0',NULL),(158,156,1,'-1',1),(159,156,3,'-1',12),(160,157,1,'0',NULL),(161,157,3,'0',NULL),(162,157,2,'0',NULL),(163,158,1,'0',NULL),(164,158,3,'0',NULL),(165,158,2,'0',NULL),(166,159,2,'0',NULL),(167,159,1,'0',NULL),(168,159,3,'0',NULL),(169,160,1,'0',NULL),(170,160,2,'0',NULL),(171,160,3,'0',NULL),(172,161,1,'0',NULL),(173,161,3,'0',NULL),(174,161,2,'0',NULL),(175,162,1,'0',NULL),(176,162,2,'0',NULL),(177,162,3,'0',NULL),(178,163,2,'0',NULL),(179,163,1,'0',NULL),(180,163,3,'0',NULL),(181,164,2,'0',NULL),(182,164,3,'0',NULL),(183,164,1,'0',NULL),(184,165,3,'0',NULL),(185,165,2,'0',NULL),(186,165,1,'0',NULL),(187,166,1,'-1',4),(188,166,3,'1',14),(189,166,2,'1',8),(190,167,2,'-1',7),(191,167,3,'-1',12),(192,167,1,'-1',5),(193,168,1,'-1',1),(194,168,2,'0',NULL),(195,168,3,'0',NULL),(196,169,3,'0',NULL),(197,169,2,'0',NULL),(198,169,1,'0',NULL),(199,170,2,'0',NULL),(200,170,1,'0',NULL),(201,170,3,'0',NULL),(202,171,1,'0',NULL),(203,171,2,'0',NULL),(204,171,3,'0',NULL),(205,172,3,'0',NULL),(206,172,2,'0',NULL),(207,172,1,'0',NULL),(208,173,1,'0',NULL),(209,173,3,'0',NULL),(210,173,2,'0',NULL),(211,174,1,'0',NULL),(212,174,2,'0',NULL),(213,174,3,'0',NULL),(214,175,3,'0',NULL),(215,175,1,'0',NULL),(216,175,2,'0',NULL),(217,176,3,'0',NULL),(218,176,2,'0',NULL),(219,176,1,'0',NULL),(220,177,2,'0',NULL),(221,177,3,'0',NULL),(222,177,1,'0',NULL),(223,178,2,'0',NULL),(224,178,3,'0',NULL),(225,178,1,'0',NULL),(226,179,2,'0',NULL),(227,179,1,'0',NULL),(228,179,3,'0',NULL),(229,180,3,'0',NULL),(230,180,2,'0',NULL),(231,180,1,'-1',5),(232,181,3,'-1',15),(233,181,2,'-1',10),(234,181,1,'-1',5),(235,182,3,'0',NULL),(236,182,2,'0',NULL),(237,182,1,'0',NULL),(238,183,1,'0',NULL),(239,183,3,'0',NULL),(240,183,2,'0',NULL),(241,184,3,'0',NULL),(242,184,2,'0',NULL),(243,184,1,'0',NULL),(244,185,3,'0',NULL),(245,185,2,'0',NULL),(246,185,1,'0',NULL),(247,186,1,'0',NULL),(248,186,2,'0',NULL),(249,186,3,'0',NULL),(250,187,2,'0',NULL),(251,187,1,'0',NULL),(252,187,3,'0',NULL),(253,188,2,'0',NULL),(254,188,1,'0',NULL),(255,188,3,'0',NULL),(256,189,3,'0',NULL),(257,189,2,'0',NULL),(258,189,1,'0',NULL),(259,190,1,'0',NULL),(260,190,3,'0',NULL),(261,190,2,'0',NULL),(262,191,2,'0',NULL),(263,191,3,'0',NULL),(264,191,1,'0',NULL),(265,192,2,'-1',7),(266,192,3,'0',NULL),(267,192,1,'0',NULL),(268,193,2,'0',NULL),(269,193,3,'0',NULL),(270,193,1,'0',NULL),(271,194,2,'0',NULL),(272,194,1,'0',NULL),(273,194,3,'0',NULL),(274,195,3,'0',NULL),(275,195,1,'0',NULL),(276,195,2,'0',NULL),(277,196,3,'0',NULL),(278,196,2,'0',NULL),(279,196,1,'0',NULL),(280,197,2,'0',NULL),(281,197,3,'0',NULL),(282,197,1,'0',NULL),(283,198,1,'0',NULL),(284,198,2,'0',NULL),(285,198,3,'-1',11);
/*!40000 ALTER TABLE `user_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_userform`
--

DROP TABLE IF EXISTS `user_userform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_userform` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(50) NOT NULL,
  `phonenumber` varchar(20) NOT NULL,
  `signature` varchar(50) NOT NULL,
  `img_url` varchar(150) DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `user_userform_user_id_d5c7d2a6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_userform`
--

LOCK TABLES `user_userform` WRITE;
/*!40000 ALTER TABLE `user_userform` DISABLE KEYS */;
INSERT INTO `user_userform` VALUES (1,'admin-1','null','null','null','1',1),(2,'ddd','True','True','True','1',2),(3,'ddd1','True','True','True','1',3),(4,'李振卓','True','True','True','1',4),(5,'lzz22','True','True','True','1',5),(6,'test','True','True','True','1',6),(7,'李振卓','True','True','True','1',7),(8,'lzz22','True','True','True','1',8),(9,'lzz22','True','True','True','1',9),(10,'2v','True','True','True','1',10),(11,'sdf','True','True','True','1',11),(12,'sdf','True','True','True','1',12),(13,'李振卓','True','True','True','1',13),(14,'李振卓','True','True','True','1',14),(15,'李振卓','True','True','True','1',15),(16,'李振卓','True','True','True','1',16),(17,'李振卓','True','True','True','1',17),(18,'test','True','True','True','1',18),(19,'test','True','True','True','1',19),(20,'lzz','True','True','True','1',20),(21,'qqq','True','True','True','1',21);
/*!40000 ALTER TABLE `user_userform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_views_count`
--

DROP TABLE IF EXISTS `user_views_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_views_count` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `last_view_time` datetime(6) NOT NULL,
  `nid_id` bigint(20) NOT NULL,
  `uid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_views_count_nid_id_fe4e6635` (`nid_id`),
  KEY `user_views_count_uid_id_452f5cd6` (`uid_id`),
  CONSTRAINT `user_views_count_nid_id_fe4e6635_fk_user_notice_id` FOREIGN KEY (`nid_id`) REFERENCES `user_notice` (`id`),
  CONSTRAINT `user_views_count_uid_id_452f5cd6_fk_auth_user_id` FOREIGN KEY (`uid_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_views_count`
--

LOCK TABLES `user_views_count` WRITE;
/*!40000 ALTER TABLE `user_views_count` DISABLE KEYS */;
INSERT INTO `user_views_count` VALUES (16,'2023-02-27 22:48:59.188577',2,1);
/*!40000 ALTER TABLE `user_views_count` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-28 10:25:32
