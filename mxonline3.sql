-- MySQL dump 10.13  Distrib 5.7.19, for macos10.12 (x86_64)
--
-- Host: localhost    Database: mxonline3
-- ------------------------------------------------------
-- Server version	5.7.19

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add 用户信息',6,'add_userprofile'),(17,'Can change 用户信息',6,'change_userprofile'),(18,'Can delete 用户信息',6,'delete_userprofile'),(19,'Can add 轮播图',7,'add_banner'),(20,'Can change 轮播图',7,'change_banner'),(21,'Can delete 轮播图',7,'delete_banner'),(22,'Can add 邮箱验证码',8,'add_emailverifyrecord'),(23,'Can change 邮箱验证码',8,'change_emailverifyrecord'),(24,'Can delete 邮箱验证码',8,'delete_emailverifyrecord'),(25,'Can add 章节',9,'add_lesson'),(26,'Can change 章节',9,'change_lesson'),(27,'Can delete 章节',9,'delete_lesson'),(28,'Can add 课程资源',10,'add_courseresource'),(29,'Can change 课程资源',10,'change_courseresource'),(30,'Can delete 课程资源',10,'delete_courseresource'),(31,'Can add 视频',11,'add_video'),(32,'Can change 视频',11,'change_video'),(33,'Can delete 视频',11,'delete_video'),(34,'Can add 课程',12,'add_course'),(35,'Can change 课程',12,'change_course'),(36,'Can delete 课程',12,'delete_course'),(37,'Can add 教师',13,'add_teacher'),(38,'Can change 教师',13,'change_teacher'),(39,'Can delete 教师',13,'delete_teacher'),(40,'Can add 城市',14,'add_citydict'),(41,'Can change 城市',14,'change_citydict'),(42,'Can delete 城市',14,'delete_citydict'),(43,'Can add 课程机构',15,'add_courseorg'),(44,'Can change 课程机构',15,'change_courseorg'),(45,'Can delete 课程机构',15,'delete_courseorg'),(46,'Can add 用户咨询',16,'add_userask'),(47,'Can change 用户咨询',16,'change_userask'),(48,'Can delete 用户咨询',16,'delete_userask'),(49,'Can add 用户收藏',17,'add_userfavorite'),(50,'Can change 用户收藏',17,'change_userfavorite'),(51,'Can delete 用户收藏',17,'delete_userfavorite'),(52,'Can add 课程评论',18,'add_coursecomments'),(53,'Can change 课程评论',18,'change_coursecomments'),(54,'Can delete 课程评论',18,'delete_coursecomments'),(55,'Can add 用户课程',19,'add_usercourse'),(56,'Can change 用户课程',19,'change_usercourse'),(57,'Can delete 用户课程',19,'delete_usercourse'),(58,'Can add 用户消息',20,'add_usermessage'),(59,'Can change 用户消息',20,'change_usermessage'),(60,'Can delete 用户消息',20,'delete_usermessage'),(61,'Can view log entry',1,'view_logentry'),(62,'Can view group',3,'view_group'),(63,'Can view permission',2,'view_permission'),(64,'Can view content type',4,'view_contenttype'),(65,'Can view 课程',12,'view_course'),(66,'Can view 课程资源',10,'view_courseresource'),(67,'Can view 章节',9,'view_lesson'),(68,'Can view 视频',11,'view_video'),(69,'Can view 课程评论',18,'view_coursecomments'),(70,'Can view 用户咨询',16,'view_userask'),(71,'Can view 用户课程',19,'view_usercourse'),(72,'Can view 用户收藏',17,'view_userfavorite'),(73,'Can view 用户消息',20,'view_usermessage'),(74,'Can view 城市',14,'view_citydict'),(75,'Can view 课程机构',15,'view_courseorg'),(76,'Can view 教师',13,'view_teacher'),(77,'Can view session',5,'view_session'),(78,'Can view 轮播图',7,'view_banner'),(79,'Can view 邮箱验证码',8,'view_emailverifyrecord'),(80,'Can view 用户信息',6,'view_userprofile'),(81,'Can add Bookmark',21,'add_bookmark'),(82,'Can change Bookmark',21,'change_bookmark'),(83,'Can delete Bookmark',21,'delete_bookmark'),(84,'Can add User Setting',22,'add_usersettings'),(85,'Can change User Setting',22,'change_usersettings'),(86,'Can delete User Setting',22,'delete_usersettings'),(87,'Can add User Widget',23,'add_userwidget'),(88,'Can change User Widget',23,'change_userwidget'),(89,'Can delete User Widget',23,'delete_userwidget'),(90,'Can add log entry',24,'add_log'),(91,'Can change log entry',24,'change_log'),(92,'Can delete log entry',24,'delete_log'),(93,'Can view Bookmark',21,'view_bookmark'),(94,'Can view log entry',24,'view_log'),(95,'Can view User Setting',22,'view_usersettings'),(96,'Can view User Widget',23,'view_userwidget'),(97,'Can add captcha store',25,'add_captchastore'),(98,'Can change captcha store',25,'change_captchastore'),(99,'Can delete captcha store',25,'delete_captchastore'),(100,'Can view captcha store',25,'view_captchastore'),(101,'Can add 轮播课程',12,'add_bannercourse'),(102,'Can change 轮播课程',12,'change_bannercourse'),(103,'Can delete 轮播课程',12,'delete_bannercourse'),(104,'Can view 轮播课程',26,'view_bannercourse');
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
-- Table structure for table `captcha_captchastore`
--

DROP TABLE IF EXISTS `captcha_captchastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha_captchastore`
--

LOCK TABLES `captcha_captchastore` WRITE;
/*!40000 ALTER TABLE `captcha_captchastore` DISABLE KEYS */;
INSERT INTO `captcha_captchastore` VALUES (129,'HCCH','hcch','c2239aa21ea13c2d7ee5d81a01e8dd0dcd01ea60','2018-03-25 19:58:08.739162'),(130,'QNAJ','qnaj','71befb12afa9d5546ed97811a6ab4ddd4a924687','2018-03-25 19:58:18.591688');
/*!40000 ALTER TABLE `captcha_captchastore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_course`
--

DROP TABLE IF EXISTS `courses_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(300) NOT NULL,
  `detail` longtext NOT NULL,
  `degree` varchar(2) NOT NULL,
  `learn_times` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `click_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_org_id` int(11) DEFAULT NULL,
  `category` varchar(20) NOT NULL,
  `tag` varchar(15) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `teacher_tell` varchar(300) NOT NULL,
  `you_need_know` varchar(300) NOT NULL,
  `is_banner` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_course_course_org_id_4d2c4aab_fk_organizat` (`course_org_id`),
  KEY `courses_course_teacher_id_846fa526_fk_organization_teacher_id` (`teacher_id`),
  CONSTRAINT `courses_course_course_org_id_4d2c4aab_fk_organizat` FOREIGN KEY (`course_org_id`) REFERENCES `organization_courseorg` (`id`),
  CONSTRAINT `courses_course_teacher_id_846fa526_fk_organization_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `organization_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_course`
--

LOCK TABLES `courses_course` WRITE;
/*!40000 ALTER TABLE `courses_course` DISABLE KEYS */;
INSERT INTO `courses_course` VALUES (1,'Pyhton基础教程','Python从入门到精通-极客学院','入门Python全栈开发','cj',600,0,99,'courses/2018/03/540e57300001d6d906000338-240-135_MSIqfvw.jpg',78,'2018-02-28 18:09:00.000000',2,'免费课程','全栈',4,'按时交作业,不然叫家长','一颗勤学的心是本课程必要前提',0),(2,'Java','Java','Java','cj',600,0,0,'courses/2018/03/540e57300001d6d906000338-240-135_MSIqfvw.jpg',25,'2018-03-10 10:38:00.000000',7,'课程','Java',15,'按时交作业,不然叫家长','一颗勤学的心是本课程必要前提',0),(3,'Linux私房菜','Linux-实验楼','<p>&nbsp; &nbsp; 鸟哥的Linux私房菜</p>','cj',1200,1,1,'courses/2018/03/540e57300001d6d906000338-240-135_MSIqfvw.jpg',21,'2018-03-10 10:41:00.000000',3,'课程','Linux',2,'按时交作业,不然叫家长','一颗勤学的心是本课程必要前提',0),(4,'PHP基础教程','PHP','北京大学PHP教程','cj',1200,0,1,'courses/2018/03/540e57300001d6d906000338-240-135_MSIqfvw.jpg',7,'2018-03-10 10:43:00.000000',4,'课程','PHP',15,'按时交作业,不然叫家长','一颗勤学的心是本课程必要前提',0),(5,'C语言','C语言','清华大学C语言教学','cj',2400,0,1,'courses/2018/03/540e57300001d6d906000338-240-135_MSIqfvw.jpg',4,'2018-03-10 10:44:00.000000',5,'','',15,'按时交作业,不然叫家长','一颗勤学的心是本课程必要前提',0),(6,'Swift','Swift-南京大学','Swift','cj',1800,0,0,'courses/2018/03/540e57300001d6d906000338-240-135_MSIqfvw.jpg',0,'2018-03-10 11:09:00.000000',6,'','',15,'按时交作业,不然叫家长','一颗勤学的心是本课程必要前提',0),(7,'TensorFlow','TensorFlow-IMOOC','TensorFlow AI','zj',1800,0,1,'courses/2018/03/540e57300001d6d906000338-240-135_MSIqfvw.jpg',1,'2018-03-10 11:10:00.000000',7,'','',15,'按时交作业,不然叫家长','一颗勤学的心是本课程必要前提',0),(8,'Pyhton基础教程','Python从入门到精通-极客学院','入门Python全栈开发','cj',600,2,0,'courses/2018/03/540e57300001d6d906000338-240-135_MSIqfvw.jpg',3,'2018-02-28 18:09:00.000000',2,'','',15,'按时交作业,不然叫家长','一颗勤学的心是本课程必要前提',0),(9,'Java','Java-慕课网','Java','cj',600,0,0,'courses/2018/03/540e57300001d6d906000338-240-135_MSIqfvw.jpg',19,'2018-03-10 10:38:00.000000',1,'课程','java',15,'按时交作业,不然叫家长','一颗勤学的心是本课程必要前提',0),(10,'Linux','Linux-实验楼','鸟哥的Linux私房菜','cj',1200,0,0,'courses/2018/03/540e57300001d6d906000338-240-135_MSIqfvw.jpg',0,'2018-03-10 10:41:00.000000',3,'','',15,'按时交作业,不然叫家长','一颗勤学的心是本课程必要前提',0),(11,'PHP教程','PHP','北京大学PHP教程','cj',1200,0,0,'courses/2018/03/540e57300001d6d906000338-240-135_MSIqfvw.jpg',0,'2018-03-10 10:43:00.000000',4,'','',14,'按时交作业,不然叫家长','一颗勤学的心是本课程必要前提',0),(12,'C语言','C语言','清华大学C语言教学','cj',2400,0,0,'courses/2018/03/540e57300001d6d906000338-240-135_MSIqfvw.jpg',0,'2018-03-10 10:44:00.000000',5,'','',14,'按时交作业,不然叫家长','一颗勤学的心是本课程必要前提',0),(13,'Swift','Swift-南京大学','Swift','cj',1800,0,0,'courses/2018/03/540e57300001d6d906000338-240-135_MSIqfvw.jpg',0,'2018-03-10 11:09:00.000000',6,'','',14,'按时交作业,不然叫家长','一颗勤学的心是本课程必要前提',0),(14,'TensorFlow','TensorFlow-IMOOC','TensorFlow AI','zj',1800,0,0,'courses/2018/03/540e57300001d6d906000338-240-135_MSIqfvw.jpg',0,'2018-03-10 11:10:00.000000',7,'','',14,'按时交作业,不然叫家长','一颗勤学的心是本课程必要前提',0),(15,'Pyhton基础教程','Python从入门到精通-极客学院','入门Python全栈开发','cj',600,0,0,'courses/2018/03/540e57300001d6d906000338-240-135_MSIqfvw.jpg',1,'2018-02-28 18:09:00.000000',2,'','',14,'按时交作业,不然叫家长','一颗勤学的心是本课程必要前提',0),(16,'Java','Java-慕课网','Java','cj',600,3,0,'courses/2018/03/540e57300001d6d906000338-240-135_MSIqfvw.jpg',11,'2018-03-10 10:38:00.000000',1,'','',13,'按时交作业,不然叫家长','一颗勤学的心是本课程必要前提',0),(17,'Linux','Linux-实验楼','鸟哥的Linux私房菜','cj',1200,1,0,'courses/2018/03/540e57300001d6d906000338-240-135_MSIqfvw.jpg',0,'2018-03-10 10:41:00.000000',3,'','',13,'按时交作业,不然叫家长','一颗勤学的心是本课程必要前提',0),(18,'PHP教程','PHP','北京大学PHP教程','cj',1200,0,0,'courses/2018/03/540e57300001d6d906000338-240-135_MSIqfvw.jpg',0,'2018-03-10 10:43:00.000000',4,'','',13,'按时交作业,不然叫家长','一颗勤学的心是本课程必要前提',0),(19,'C语言','C语言','清华大学C语言教学','cj',2400,0,0,'courses/2018/03/540e57300001d6d906000338-240-135_MSIqfvw.jpg',0,'2018-03-10 10:44:00.000000',5,'','',13,'按时交作业,不然叫家长','一颗勤学的心是本课程必要前提',0),(20,'Swift','Swift-南京大学','Swift','cj',1800,0,0,'courses/2018/03/540e57300001d6d906000338-240-135_MSIqfvw.jpg',0,'2018-03-10 11:09:00.000000',6,'','',12,'按时交作业,不然叫家长','一颗勤学的心是本课程必要前提',0),(21,'TensorFlow','TensorFlow-IMOOC','TensorFlow AI','zj',3000,0,0,'courses/2018/03/540e57300001d6d906000338-240-135_MSIqfvw.jpg',0,'2018-03-10 11:10:00.000000',7,'','',12,'按时交作业,不然叫家长','一颗勤学的心是本课程必要前提',0),(22,'Pyhton基础教程','Python从入门到精通-极客学院','入门Python全栈开发','cj',600,0,0,'courses/2018/03/540e57300001d6d906000338-240-135_MSIqfvw.jpg',0,'2018-02-28 18:09:00.000000',2,'课程','Python入门',12,'按时交作业,不然叫家长','一颗勤学的心是本课程必要前提',0),(23,'Java','Java-慕课网','Java','cj',600,0,0,'courses/2018/03/Java_iILfXny.png',0,'2018-03-10 10:38:00.000000',1,'课程','后端',12,'按时交作业,不然叫家长','一颗勤学的心是本课程必要前提',1),(24,'Linux','Linux-实验楼','鸟哥的Linux私房菜','cj',1200,0,0,'courses/2018/03/540e57300001d6d906000338-240-135_MSIqfvw.jpg',0,'2018-03-10 10:41:00.000000',3,'','',11,'按时交作业,不然叫家长','一颗勤学的心是本课程必要前提',0),(25,'PHP教程','PHP','北京大学PHP教程','cj',1200,0,0,'courses/2018/03/540e57300001d6d906000338-240-135_MSIqfvw.jpg',0,'2018-03-10 10:43:00.000000',4,'课程','PHP',8,'按时交作业,不然叫家长','一颗勤学的心是本课程必要前提',0),(26,'C语言','C语言','清华大学C语言教学','cj',2400,0,0,'courses/2018/03/540e57300001d6d906000338-240-135_MSIqfvw.jpg',0,'2018-03-10 10:44:00.000000',5,'课程','C',10,'按时交作业,不然叫家长','一颗勤学的心是本课程必要前提',0),(27,'Swift教程','Swift-南京大学','Swift','cj',3000,0,0,'courses/2018/03/540e57300001d6d906000338-240-135_MSIqfvw.jpg',1,'2018-03-10 11:09:00.000000',6,'课程','Swift',11,'按时交作业,不然叫家长','一颗勤学的心是本课程必要前提',0),(28,'TensorFlow','TensorFlow-IMOOC','TensorFlow AI','zj',3000,0,0,'courses/2018/03/smallbanner1_Jcgvg53.png',5,'2018-03-10 11:10:00.000000',7,'实战','机器学习',13,'按时交作业,不然叫家长','一颗勤学的心是本课程必要前提',0),(29,'敏捷项目管理','项目管理','敏捷开发的Scrum模型','zj',480,21,0,'courses/2018/03/scrum_XbaXUiU.png',4,'2018-03-16 01:10:00.000000',1,'课程','敏捷',9,'按时交作业,不然叫家长','一颗勤学的心是本课程必要前提',1),(30,'Python机器学习','机器学习从入门到实战','机器学习从入门到实战','gj',2400,0,0,'courses/2018/03/TensorFlow_1OwXMqL.png',1,'2018-03-16 17:19:00.000000',7,'课程','机器学习',13,'按时交作业,不然叫家长','一颗勤学的心是本课程必要前提',0),(31,'Spring Cloud微服务实战','SpringBoot 2.x +SpringCloud，最潮的微服务实现方案','SpringBoot 2.x +SpringCloud，最潮的微服务实现方案\r\n\r\n覆盖SpringCloud核心组件，面向实际生产，专注于微服务实践\r\n\r\n服务发现（Eureka）\r\nEureka Server\r\nEureka Client\r\nEureka高可用（两节点，三节点演示）\r\n服务发现原理剖析\r\n分布式配置（Spring Cloud Config）\r\nConfig Server\r\nConfig Client\r\nGit和Refresh\r\n自动刷新\r\nSpringCloud Bus（配合RabbitMQ）\r\n服务通信\r\n通信机制剖析\r\nFeign\r\nRibbon（带领分析源码，了解底层）\r\nRestTemplate\r\n网关 （Zuul）\r\n动态路由\r\nZuul高可用\r\n异常网关统一处理\r\n验证与安全\r\n熔断 （Hystrix）\r\nHystrix Dashboar\r\n熔断机制\r\n目的和重要性','zj',1200,0,0,'courses/2018/03/SpringCloud.png',1,'2018-03-16 17:40:00.000000',1,'实战','微服务',5,'按时交作业,不然叫家长','一颗勤学的心是本课程必要前提',1),(32,'Python爬虫从入门到实战','Scrapy爬虫框架','Scrapy爬虫框架应用实战','zj',600,0,0,'courses/2018/03/TensorFlow.png',0,'2018-03-17 22:17:00.000000',1,'实战','Scrapy',6,'按时交作业,不然叫家长','一颗勤学的心是本课程必要前提',0),(35,'Django Xadmin+UEditor插件教程','Django进阶','<p>Xadmin插件开发</p><p><img src=\"/media/courses/ueditor/smallbanner1_20180320171653_555.png\" title=\"\" alt=\"smallbanner1.png\"/> </p><p>下面是文件：</p><p style=\"line-height: 16px;\"><img style=\"vertical-align: middle; margin-right: 2px;\" src=\"http://127.0.0.1:8000/static/ueditor/dialogs/attachment/fileTypeImages/icon_rar.gif\"/> <a style=\"font-size:12px; color:#0066cc;\" href=\"/media/courses/ueditor/font-awesome-4.7.0_20180320171722_486.zip\" title=\"font-awesome-4.7.0.zip\">font-awesome-4.7.0.zip</a></p><p><br/> </p>','zj',0,1,0,'courses/2018/03/smallbanner1_awKEbBd.png',5,'2018-03-20 17:16:00.000000',3,'课程','Django',1,'按时交作业,不然叫家长','一颗勤学的心是本课程必要前提',0);
/*!40000 ALTER TABLE `courses_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_courseresource`
--

DROP TABLE IF EXISTS `courses_courseresource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_courseresource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `download` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_courseresource_course_id_5eba1332_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_courseresource_course_id_5eba1332_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_courseresource`
--

LOCK TABLES `courses_courseresource` WRITE;
/*!40000 ALTER TABLE `courses_courseresource` DISABLE KEYS */;
INSERT INTO `courses_courseresource` VALUES (2,'前端资源','course/resource/2018/03/project.zip','2018-03-22 20:52:00.000000',3);
/*!40000 ALTER TABLE `courses_courseresource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_lesson`
--

DROP TABLE IF EXISTS `courses_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_lesson_course_id_16bc4882_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_lesson`
--

LOCK TABLES `courses_lesson` WRITE;
/*!40000 ALTER TABLE `courses_lesson` DISABLE KEYS */;
INSERT INTO `courses_lesson` VALUES (1,'1.Python基础语法','2018-02-28 18:10:00.000000',1),(2,'2.Pyhton教程','2018-03-11 15:06:00.000000',1),(3,'3.Pyhton教程','2018-03-11 15:06:00.000000',1),(4,'4.Pyhton教程','2018-03-11 15:06:00.000000',1),(5,'5.Pyhton教程','2018-03-11 15:06:00.000000',1),(6,'6.Pyhton教程','2018-03-11 15:06:00.000000',1),(7,'7.Pyhton教程','2018-03-11 15:07:00.000000',1),(8,'8.Pyhton教程','2018-03-11 15:07:00.000000',1),(9,'9.Pyhton教程','2018-03-11 15:07:00.000000',1),(10,'10.Pyhton教程','2018-03-11 15:07:00.000000',1),(11,'11.项目部署上线','2018-03-20 10:14:00.000000',1);
/*!40000 ALTER TABLE `courses_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_video`
--

DROP TABLE IF EXISTS `courses_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `learn_times` int(11) NOT NULL,
  `url` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` (`lesson_id`),
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_video`
--

LOCK TABLES `courses_video` WRITE;
/*!40000 ALTER TABLE `courses_video` DISABLE KEYS */;
INSERT INTO `courses_video` VALUES (1,'1','2018-03-11 21:19:00.000000',1,1,'http://blog.mtianyan.cn/'),(2,'2','2018-03-11 21:19:00.000000',1,2,'http://blog.mtianyan.cn/'),(3,'3','2018-03-11 21:19:00.000000',1,3,'http://blog.mtianyan.cn/'),(4,'1','2018-03-11 21:19:00.000000',2,1,'http://blog.mtianyan.cn/'),(5,'2','2018-03-11 21:19:00.000000',2,2,'http://blog.mtianyan.cn/'),(6,'1','2018-03-11 21:19:00.000000',3,1,'http://blog.mtianyan.cn/');
/*!40000 ALTER TABLE `courses_video` ENABLE KEYS */;
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
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-02-27 15:01:35.636606','2','SilentHz',1,'[{\"added\": {}}]',6,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(25,'captcha','captchastore'),(4,'contenttypes','contenttype'),(26,'courses','bannercourse'),(12,'courses','course'),(10,'courses','courseresource'),(9,'courses','lesson'),(11,'courses','video'),(18,'operation','coursecomments'),(16,'operation','userask'),(19,'operation','usercourse'),(17,'operation','userfavorite'),(20,'operation','usermessage'),(14,'organization','citydict'),(15,'organization','courseorg'),(13,'organization','teacher'),(5,'sessions','session'),(7,'users','banner'),(8,'users','emailverifyrecord'),(6,'users','userprofile'),(21,'xadmin','bookmark'),(24,'xadmin','log'),(22,'xadmin','usersettings'),(23,'xadmin','userwidget');
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-02-26 15:28:20.222142'),(2,'contenttypes','0002_remove_content_type_name','2018-02-26 15:28:20.271745'),(3,'auth','0001_initial','2018-02-26 15:28:20.452635'),(4,'auth','0002_alter_permission_name_max_length','2018-02-26 15:28:20.479308'),(5,'auth','0003_alter_user_email_max_length','2018-02-26 15:28:20.487046'),(6,'auth','0004_alter_user_username_opts','2018-02-26 15:28:20.495549'),(7,'auth','0005_alter_user_last_login_null','2018-02-26 15:28:20.503577'),(8,'auth','0006_require_contenttypes_0002','2018-02-26 15:28:20.505839'),(9,'auth','0007_alter_validators_add_error_messages','2018-02-26 15:28:20.515067'),(10,'auth','0008_alter_user_username_max_length','2018-02-26 15:28:20.522341'),(11,'auth','0009_alter_user_last_name_max_length','2018-02-26 15:28:20.530274'),(12,'users','0001_initial','2018-02-26 15:28:20.730599'),(13,'admin','0001_initial','2018-02-26 15:28:20.810580'),(14,'admin','0002_logentry_remove_auto_add','2018-02-26 15:28:20.822606'),(15,'sessions','0001_initial','2018-02-26 15:28:20.866005'),(16,'courses','0001_initial','2018-02-27 06:32:49.019426'),(17,'operation','0001_initial','2018-02-27 06:32:49.282653'),(18,'organization','0001_initial','2018-02-27 06:32:49.403804'),(19,'users','0002_banner_emailverifyrecord','2018-02-27 06:32:49.452270'),(20,'users','0003_auto_20180227_0650','2018-02-27 06:50:36.486008'),(21,'xadmin','0001_initial','2018-02-28 10:17:52.831710'),(22,'xadmin','0002_log','2018-02-28 10:17:52.941268'),(23,'xadmin','0003_auto_20160715_0100','2018-02-28 10:17:52.984507'),(24,'captcha','0001_initial','2018-03-01 23:58:00.149628'),(25,'users','0004_auto_20180301_2357','2018-03-01 23:58:00.157926'),(26,'organization','0002_courseorg_category','2018-03-05 18:02:22.453417'),(27,'organization','0003_auto_20180306_1450','2018-03-06 14:51:05.205175'),(28,'courses','0002_course_course_org','2018-03-09 11:16:44.622725'),(29,'courses','0003_auto_20180310_1054','2018-03-10 10:54:19.919296'),(30,'courses','0004_auto_20180310_1055','2018-03-10 10:55:34.146794'),(31,'courses','0003_auto_20180310_1106','2018-03-10 11:06:29.692149'),(32,'courses','0003_auto_20180310_1121','2018-03-10 11:21:51.254359'),(33,'courses','0003_auto_20180310_1122','2018-03-10 11:22:57.939729'),(34,'organization','0004_teacher_image','2018-03-10 12:31:01.668992'),(35,'courses','0004_course_category','2018-03-10 23:14:24.108881'),(36,'courses','0005_course_tag','2018-03-11 13:32:15.366679'),(37,'courses','0006_auto_20180311_1457','2018-03-11 14:57:24.067520'),(38,'organization','0005_teacher_age','2018-03-11 22:51:00.235924'),(39,'users','0005_auto_20180313_0015','2018-03-13 00:15:53.483257'),(40,'organization','0006_remove_courseorg_course_nums','2018-03-16 00:56:29.309343'),(41,'organization','0007_auto_20180316_0104','2018-03-16 01:04:30.831917'),(42,'courses','0007_course_is_banner','2018-03-16 15:24:23.262308'),(43,'courses','0008_auto_20180316_1740','2018-03-16 17:40:17.451944'),(44,'users','0006_auto_20180316_1822','2018-03-16 18:22:21.123199'),(45,'courses','0009_auto_20180321_1417','2018-03-21 14:17:57.288534'),(46,'organization','0008_auto_20180321_1417','2018-03-21 14:17:57.312879'),(47,'users','0007_auto_20180322_0014','2018-03-22 13:13:47.542281');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3cyxc9yoq4nyxewmuq9j5swp1kr9g30f','M2FkNDM1MWUzYjc0NmMxODk5YzAyMWE3YjU5NjJlNDJmODNkZDI0ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MWNmNDk1MTZkMGEyYzBhZDkyOGRlNTdjYmYwMjg1ZGU3MmU0Y2U0In0=','2018-03-16 15:29:46.026745'),('3ncwx38ve4oq438q3e98ovueu8fy73vg','MTZmMzAwNDViYzU5N2JlOGU4OWY0ZDFmZGFkYjY3YWMyNTE0MDI3MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImM4OTJlZTU1NDc2ZmU2ODZkMzRjZjQ5YzMwNGVkNmYyYjQ2MTEwOTUiLCJMSVNUX1FVRVJZIjpbWyJvcGVyYXRpb24iLCJ1c2VyZmF2b3JpdGUiXSwiIl19','2018-03-30 20:03:25.632156'),('4friw5h67sgj1nshzwzgvs5snl5iwsua','MGJlMGQwOGY5YTRhZDM1NWMyYWIyNDEyYmM2ZGNkM2VlOGFjNjRjYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImM5YTQyY2NiYWNlNDU4ZGU4ZGE4NWU3ODljM2M1MmU2NDhlNGZlMmQiLCJuYXZfbWVudSI6Ilt7XCJ0aXRsZVwiOiBcIlx1OGJmZVx1N2EwYlx1N2JhMVx1NzQwNlwiLCBcImljb25cIjogXCJmYSBmYS11bml2ZXJzaXR5XCIsIFwibWVudXNcIjogW3tcInRpdGxlXCI6IFwiXHU4YmZlXHU3YTBiXHU0ZmUxXHU2MDZmXCIsIFwiaWNvblwiOiBcImZhIGZhLWJvb2ttYXJrXCIsIFwidXJsXCI6IFwiL3hhZG1pbi9jb3Vyc2VzL2NvdXJzZS9cIn0sIHtcInRpdGxlXCI6IFwiXHU4ZjZlXHU2NGFkXHU4YmZlXHU3YTBiXCIsIFwiaWNvblwiOiBcImZhIGZhLWJvb2ttYXJrLW9cIiwgXCJ1cmxcIjogXCIveGFkbWluL2NvdXJzZXMvYmFubmVyY291cnNlL1wifSwge1widGl0bGVcIjogXCJcdTdhZTBcdTgyODJcdTRmZTFcdTYwNmZcIiwgXCJpY29uXCI6IFwiZmEgZmEtZmlyZVwiLCBcInVybFwiOiBcIi94YWRtaW4vY291cnNlcy9sZXNzb24vXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1ODljNlx1OTg5MVx1NGZlMVx1NjA2ZlwiLCBcImljb25cIjogXCJmYSBmYS12aWRlby1jYW1lcmFcIiwgXCJ1cmxcIjogXCIveGFkbWluL2NvdXJzZXMvdmlkZW8vXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1OGJmZVx1N2EwYlx1OGQ0NFx1NmU5MFwiLCBcImljb25cIjogXCJmYSBmYS1mb2xkZXJcIiwgXCJ1cmxcIjogXCIveGFkbWluL2NvdXJzZXMvY291cnNlcmVzb3VyY2UvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1OGJmZVx1N2EwYlx1OGJjNFx1OGJiYVwiLCBcImljb25cIjogXCJmYSBmYS1jb21tZW50c1wiLCBcInVybFwiOiBcIi94YWRtaW4vb3BlcmF0aW9uL2NvdXJzZWNvbW1lbnRzL1wifV19LCB7XCJ0aXRsZVwiOiBcIlx1NjczYVx1Njc4NFx1N2JhMVx1NzQwNlwiLCBcImljb25cIjogXCJmYSBmYS1idWlsZGluZ1wiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1NjczYVx1Njc4NFx1NGZlMVx1NjA2ZlwiLCBcImljb25cIjogXCJmYSBmYS1idWlsZGluZy1vXCIsIFwidXJsXCI6IFwiL3hhZG1pbi9vcmdhbml6YXRpb24vY291cnNlb3JnL1wifSwge1widGl0bGVcIjogXCJcdTY3M2FcdTY3ODRcdThiYjJcdTVlMDhcIiwgXCJpY29uXCI6IFwiZmEgZmEtdXNlci1jaXJjbGUtb1wiLCBcInVybFwiOiBcIi94YWRtaW4vb3JnYW5pemF0aW9uL3RlYWNoZXIvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1NjI0MFx1NTcyOFx1NTdjZVx1NWUwMlwiLCBcImljb25cIjogXCJmYSBmYS1sb2NhdGlvbi1hcnJvd1wiLCBcInVybFwiOiBcIi94YWRtaW4vb3JnYW5pemF0aW9uL2NpdHlkaWN0L1wifV19LCB7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1N2JhMVx1NzQwNlwiLCBcImljb25cIjogXCJmYSBmYS11c2VyXCIsIFwibWVudXNcIjogW3tcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU0ZmUxXHU2MDZmXCIsIFwiaWNvblwiOiBcImZhIGZhLXVzZXItb1wiLCBcInVybFwiOiBcIi94YWRtaW4vdXNlcnMvdXNlcnByb2ZpbGUvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1OWE4Y1x1OGJjMVwiLCBcImljb25cIjogXCJmYSBmYS1rZXlcIiwgXCJ1cmxcIjogXCIveGFkbWluL3VzZXJzL2VtYWlsdmVyaWZ5cmVjb3JkL1wifSwge1widGl0bGVcIjogXCJcdTc1MjhcdTYyMzdcdThiZmVcdTdhMGJcIiwgXCJpY29uXCI6IFwiZmEgZmEtZ3JhZHVhdGlvbi1jYXBcIiwgXCJ1cmxcIjogXCIveGFkbWluL29wZXJhdGlvbi91c2VyY291cnNlL1wifSwge1widGl0bGVcIjogXCJcdTc1MjhcdTYyMzdcdTY1MzZcdTg1Y2ZcIiwgXCJpY29uXCI6IFwiZmEgZmEtc3RhclwiLCBcInVybFwiOiBcIi94YWRtaW4vb3BlcmF0aW9uL3VzZXJmYXZvcml0ZS9cIn0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU2ZDg4XHU2MDZmXCIsIFwiaWNvblwiOiBcImZhIGZhLWNvbW1lbnRpbmdcIiwgXCJ1cmxcIjogXCIveGFkbWluL29wZXJhdGlvbi91c2VybWVzc2FnZS9cIn1dfSwge1widGl0bGVcIjogXCJcdTdjZmJcdTdlZGZcdTdiYTFcdTc0MDZcIiwgXCJpY29uXCI6IFwiZmEgZmEtY29nc1wiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NTRhOFx1OGJlMlwiLCBcImljb25cIjogXCJmYSBmYS1jb21tZW50LW9cIiwgXCJ1cmxcIjogXCIveGFkbWluL29wZXJhdGlvbi91c2VyYXNrL1wifSwge1widGl0bGVcIjogXCJcdTk5OTZcdTk4NzVcdThmNmVcdTY0YWRcIiwgXCJpY29uXCI6IFwiZmEgZmEtZXhjaGFuZ2VcIiwgXCJ1cmxcIjogXCIveGFkbWluL3VzZXJzL2Jhbm5lci9cIn0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU1MjA2XHU3ZWM0XCIsIFwiaWNvblwiOiBcImZhIGZhLWdyb3VwXCIsIFwidXJsXCI6IFwiL3hhZG1pbi9hdXRoL2dyb3VwL1wifSwge1widGl0bGVcIjogXCJcdTc1MjhcdTYyMzdcdTY3NDNcdTk2NTBcIiwgXCJpY29uXCI6IFwiZmEgZmEtY2VydGlmaWNhdGVcIiwgXCJ1cmxcIjogXCIveGFkbWluL2F1dGgvcGVybWlzc2lvbi9cIn0sIHtcInRpdGxlXCI6IFwiXHU2NWU1XHU1ZmQ3XHU4YmIwXHU1ZjU1XCIsIFwiaWNvblwiOiBcImZhIGZhLXRhc2tzXCIsIFwidXJsXCI6IFwiL3hhZG1pbi94YWRtaW4vbG9nL1wifV19XSIsIkxJU1RfUVVFUlkiOltbInVzZXJzIiwidXNlcnByb2ZpbGUiXSwiIl19','2018-04-08 19:53:33.271858'),('6nebla7xs835gscbiba5i0c1q80h116c','MTQ4ZTUwZWVhMjdlMDE5OTUwZDQ4YjYwMzNhYzNkM2MzMzdjZGViMDp7fQ==','2018-03-31 21:42:03.974621'),('b4xwxpr45vmtsqpzexl4wzmda5xarsm0','ZDdiZjNiMjU1N2U1M2NhZTc3YzYyOWU1MzlhNGRlNjFiMDZkMDcyZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImM5YTQyY2NiYWNlNDU4ZGU4ZGE4NWU3ODljM2M1MmU2NDhlNGZlMmQifQ==','2019-01-24 23:43:56.657515'),('euir13lmvmffmu26rcq03nmtgg1g55lq','MTQ4ZTUwZWVhMjdlMDE5OTUwZDQ4YjYwMzNhYzNkM2MzMzdjZGViMDp7fQ==','2018-03-31 21:43:55.045789'),('ftcd1v6tlg0rcgoya3dsj62d4jl4ja62','ZGE4MTQyYmFlYjFkNmEzMjMwMmM3OGU0YjFiN2FlNzgyNGZhMTcxNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImM5YTQyY2NiYWNlNDU4ZGU4ZGE4NWU3ODljM2M1MmU2NDhlNGZlMmQiLCJuYXZfbWVudSI6Ilt7XCJ0aXRsZVwiOiBcIlx1OGJmZVx1N2EwYlx1N2JhMVx1NzQwNlwiLCBcImljb25cIjogXCJmYSBmYS11bml2ZXJzaXR5XCIsIFwibWVudXNcIjogW3tcInRpdGxlXCI6IFwiXHU4YmZlXHU3YTBiXHU0ZmUxXHU2MDZmXCIsIFwiaWNvblwiOiBcImZhIGZhLWJvb2ttYXJrXCIsIFwidXJsXCI6IFwiL3hhZG1pbi9jb3Vyc2VzL2NvdXJzZS9cIn0sIHtcInRpdGxlXCI6IFwiXHU4ZjZlXHU2NGFkXHU4YmZlXHU3YTBiXCIsIFwiaWNvblwiOiBcImZhIGZhLWJvb2ttYXJrLW9cIiwgXCJ1cmxcIjogXCIveGFkbWluL2NvdXJzZXMvYmFubmVyY291cnNlL1wifSwge1widGl0bGVcIjogXCJcdTdhZTBcdTgyODJcdTRmZTFcdTYwNmZcIiwgXCJpY29uXCI6IFwiZmEgZmEtZmlyZVwiLCBcInVybFwiOiBcIi94YWRtaW4vY291cnNlcy9sZXNzb24vXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1ODljNlx1OTg5MVx1NGZlMVx1NjA2ZlwiLCBcImljb25cIjogXCJmYSBmYS12aWRlby1jYW1lcmFcIiwgXCJ1cmxcIjogXCIveGFkbWluL2NvdXJzZXMvdmlkZW8vXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1OGJmZVx1N2EwYlx1OGQ0NFx1NmU5MFwiLCBcImljb25cIjogXCJmYSBmYS1mb2xkZXJcIiwgXCJ1cmxcIjogXCIveGFkbWluL2NvdXJzZXMvY291cnNlcmVzb3VyY2UvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1OGJmZVx1N2EwYlx1OGJjNFx1OGJiYVwiLCBcImljb25cIjogXCJmYSBmYS1jb21tZW50c1wiLCBcInVybFwiOiBcIi94YWRtaW4vb3BlcmF0aW9uL2NvdXJzZWNvbW1lbnRzL1wifV19LCB7XCJ0aXRsZVwiOiBcIlx1NjczYVx1Njc4NFx1N2JhMVx1NzQwNlwiLCBcImljb25cIjogXCJmYSBmYS1idWlsZGluZ1wiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1NjczYVx1Njc4NFx1NGZlMVx1NjA2ZlwiLCBcImljb25cIjogXCJmYSBmYS1idWlsZGluZy1vXCIsIFwidXJsXCI6IFwiL3hhZG1pbi9vcmdhbml6YXRpb24vY291cnNlb3JnL1wifSwge1widGl0bGVcIjogXCJcdTY3M2FcdTY3ODRcdThiYjJcdTVlMDhcIiwgXCJpY29uXCI6IFwiZmEgZmEtdXNlci1jaXJjbGUtb1wiLCBcInVybFwiOiBcIi94YWRtaW4vb3JnYW5pemF0aW9uL3RlYWNoZXIvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1NjI0MFx1NTcyOFx1NTdjZVx1NWUwMlwiLCBcImljb25cIjogXCJmYSBmYS1sb2NhdGlvbi1hcnJvd1wiLCBcInVybFwiOiBcIi94YWRtaW4vb3JnYW5pemF0aW9uL2NpdHlkaWN0L1wifV19LCB7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1N2JhMVx1NzQwNlwiLCBcImljb25cIjogXCJmYSBmYS11c2VyXCIsIFwibWVudXNcIjogW3tcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU0ZmUxXHU2MDZmXCIsIFwiaWNvblwiOiBcImZhIGZhLXVzZXItb1wiLCBcInVybFwiOiBcIi94YWRtaW4vdXNlcnMvdXNlcnByb2ZpbGUvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1OWE4Y1x1OGJjMVwiLCBcImljb25cIjogXCJmYSBmYS1rZXlcIiwgXCJ1cmxcIjogXCIveGFkbWluL3VzZXJzL2VtYWlsdmVyaWZ5cmVjb3JkL1wifSwge1widGl0bGVcIjogXCJcdTc1MjhcdTYyMzdcdThiZmVcdTdhMGJcIiwgXCJpY29uXCI6IFwiZmEgZmEtZ3JhZHVhdGlvbi1jYXBcIiwgXCJ1cmxcIjogXCIveGFkbWluL29wZXJhdGlvbi91c2VyY291cnNlL1wifSwge1widGl0bGVcIjogXCJcdTc1MjhcdTYyMzdcdTY1MzZcdTg1Y2ZcIiwgXCJpY29uXCI6IFwiZmEgZmEtc3RhclwiLCBcInVybFwiOiBcIi94YWRtaW4vb3BlcmF0aW9uL3VzZXJmYXZvcml0ZS9cIn0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU2ZDg4XHU2MDZmXCIsIFwiaWNvblwiOiBcImZhIGZhLWNvbW1lbnRpbmdcIiwgXCJ1cmxcIjogXCIveGFkbWluL29wZXJhdGlvbi91c2VybWVzc2FnZS9cIn1dfSwge1widGl0bGVcIjogXCJcdTdjZmJcdTdlZGZcdTdiYTFcdTc0MDZcIiwgXCJpY29uXCI6IFwiZmEgZmEtY29nc1wiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NTRhOFx1OGJlMlwiLCBcImljb25cIjogXCJmYSBmYS1jb21tZW50LW9cIiwgXCJ1cmxcIjogXCIveGFkbWluL29wZXJhdGlvbi91c2VyYXNrL1wifSwge1widGl0bGVcIjogXCJcdTk5OTZcdTk4NzVcdThmNmVcdTY0YWRcIiwgXCJpY29uXCI6IFwiZmEgZmEtZXhjaGFuZ2VcIiwgXCJ1cmxcIjogXCIveGFkbWluL3VzZXJzL2Jhbm5lci9cIn0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU1MjA2XHU3ZWM0XCIsIFwiaWNvblwiOiBcImZhIGZhLWdyb3VwXCIsIFwidXJsXCI6IFwiL3hhZG1pbi9hdXRoL2dyb3VwL1wifSwge1widGl0bGVcIjogXCJcdTc1MjhcdTYyMzdcdTY3NDNcdTk2NTBcIiwgXCJpY29uXCI6IFwiZmEgZmEtY2VydGlmaWNhdGVcIiwgXCJ1cmxcIjogXCIveGFkbWluL2F1dGgvcGVybWlzc2lvbi9cIn0sIHtcInRpdGxlXCI6IFwiXHU2NWU1XHU1ZmQ3XHU4YmIwXHU1ZjU1XCIsIFwiaWNvblwiOiBcImZhIGZhLXRhc2tzXCIsIFwidXJsXCI6IFwiL3hhZG1pbi94YWRtaW4vbG9nL1wifV19XSJ9','2018-04-08 15:46:44.833223'),('gubttnj1ykwtqth1firs56vvn6hf70nb','NzQ4ZmMyMGQ5NGNkYzI4ZGJmZGFmNTk2NDc4MWJiN2ViNDNkZWU0NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImM5YTQyY2NiYWNlNDU4ZGU4ZGE4NWU3ODljM2M1MmU2NDhlNGZlMmQiLCJMSVNUX1FVRVJZIjpbWyJjb3Vyc2VzIiwiYmFubmVyY291cnNlIl0sIiJdfQ==','2018-04-07 15:11:16.256225'),('hx8egqddceppriauituz5ooq7h0olb1w','OTcyZDk0NmUyOWRmYzZlMjVjNzY0NTBkYjhmY2RmMGE3ODZlYjg4OTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImM5YTQyY2NiYWNlNDU4ZGU4ZGE4NWU3ODljM2M1MmU2NDhlNGZlMmQiLCJuYXZfbWVudSI6Ilt7XCJ0aXRsZVwiOiBcIlx1OGJmZVx1N2EwYlx1N2JhMVx1NzQwNlwiLCBcImljb25cIjogXCJmYSBmYS11bml2ZXJzaXR5XCIsIFwibWVudXNcIjogW3tcInRpdGxlXCI6IFwiXHU4YmZlXHU3YTBiXHU0ZmUxXHU2MDZmXCIsIFwiaWNvblwiOiBcImZhIGZhLWJvb2ttYXJrXCIsIFwidXJsXCI6IFwiL3hhZG1pbi9jb3Vyc2VzL2NvdXJzZS9cIn0sIHtcInRpdGxlXCI6IFwiXHU4ZjZlXHU2NGFkXHU4YmZlXHU3YTBiXCIsIFwiaWNvblwiOiBcImZhIGZhLWJvb2ttYXJrLW9cIiwgXCJ1cmxcIjogXCIveGFkbWluL2NvdXJzZXMvYmFubmVyY291cnNlL1wifSwge1widGl0bGVcIjogXCJcdTdhZTBcdTgyODJcdTRmZTFcdTYwNmZcIiwgXCJpY29uXCI6IFwiZmEgZmEtZmlyZVwiLCBcInVybFwiOiBcIi94YWRtaW4vY291cnNlcy9sZXNzb24vXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1ODljNlx1OTg5MVx1NGZlMVx1NjA2ZlwiLCBcImljb25cIjogXCJmYSBmYS12aWRlby1jYW1lcmFcIiwgXCJ1cmxcIjogXCIveGFkbWluL2NvdXJzZXMvdmlkZW8vXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1OGJmZVx1N2EwYlx1OGQ0NFx1NmU5MFwiLCBcImljb25cIjogXCJmYSBmYS1mb2xkZXJcIiwgXCJ1cmxcIjogXCIveGFkbWluL2NvdXJzZXMvY291cnNlcmVzb3VyY2UvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1OGJmZVx1N2EwYlx1OGJjNFx1OGJiYVwiLCBcImljb25cIjogXCJmYSBmYS1jb21tZW50c1wiLCBcInVybFwiOiBcIi94YWRtaW4vb3BlcmF0aW9uL2NvdXJzZWNvbW1lbnRzL1wifV19LCB7XCJ0aXRsZVwiOiBcIlx1NjczYVx1Njc4NFx1N2JhMVx1NzQwNlwiLCBcImljb25cIjogXCJmYSBmYS1idWlsZGluZ1wiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1NjczYVx1Njc4NFx1NGZlMVx1NjA2ZlwiLCBcImljb25cIjogXCJmYSBmYS1idWlsZGluZy1vXCIsIFwidXJsXCI6IFwiL3hhZG1pbi9vcmdhbml6YXRpb24vY291cnNlb3JnL1wifSwge1widGl0bGVcIjogXCJcdTY3M2FcdTY3ODRcdThiYjJcdTVlMDhcIiwgXCJpY29uXCI6IFwiZmEgZmEtdXNlci1jaXJjbGUtb1wiLCBcInVybFwiOiBcIi94YWRtaW4vb3JnYW5pemF0aW9uL3RlYWNoZXIvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1NjI0MFx1NTcyOFx1NTdjZVx1NWUwMlwiLCBcImljb25cIjogXCJmYSBmYS1sb2NhdGlvbi1hcnJvd1wiLCBcInVybFwiOiBcIi94YWRtaW4vb3JnYW5pemF0aW9uL2NpdHlkaWN0L1wifV19LCB7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1N2JhMVx1NzQwNlwiLCBcImljb25cIjogXCJmYSBmYS11c2VyXCIsIFwibWVudXNcIjogW3tcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU0ZmUxXHU2MDZmXCIsIFwiaWNvblwiOiBcImZhIGZhLXVzZXItb1wiLCBcInVybFwiOiBcIi94YWRtaW4vdXNlcnMvdXNlcnByb2ZpbGUvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1OWE4Y1x1OGJjMVwiLCBcImljb25cIjogXCJmYSBmYS1rZXlcIiwgXCJ1cmxcIjogXCIveGFkbWluL3VzZXJzL2VtYWlsdmVyaWZ5cmVjb3JkL1wifSwge1widGl0bGVcIjogXCJcdTc1MjhcdTYyMzdcdThiZmVcdTdhMGJcIiwgXCJpY29uXCI6IFwiZmEgZmEtZ3JhZHVhdGlvbi1jYXBcIiwgXCJ1cmxcIjogXCIveGFkbWluL29wZXJhdGlvbi91c2VyY291cnNlL1wifSwge1widGl0bGVcIjogXCJcdTc1MjhcdTYyMzdcdTY1MzZcdTg1Y2ZcIiwgXCJpY29uXCI6IFwiZmEgZmEtc3RhclwiLCBcInVybFwiOiBcIi94YWRtaW4vb3BlcmF0aW9uL3VzZXJmYXZvcml0ZS9cIn0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU2ZDg4XHU2MDZmXCIsIFwiaWNvblwiOiBcImZhIGZhLWNvbW1lbnRpbmdcIiwgXCJ1cmxcIjogXCIveGFkbWluL29wZXJhdGlvbi91c2VybWVzc2FnZS9cIn1dfSwge1widGl0bGVcIjogXCJcdTdjZmJcdTdlZGZcdTdiYTFcdTc0MDZcIiwgXCJpY29uXCI6IFwiZmEgZmEtY29nc1wiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NTRhOFx1OGJlMlwiLCBcImljb25cIjogXCJmYSBmYS1jb21tZW50LW9cIiwgXCJ1cmxcIjogXCIveGFkbWluL29wZXJhdGlvbi91c2VyYXNrL1wifSwge1widGl0bGVcIjogXCJcdTk5OTZcdTk4NzVcdThmNmVcdTY0YWRcIiwgXCJpY29uXCI6IFwiZmEgZmEtZXhjaGFuZ2VcIiwgXCJ1cmxcIjogXCIveGFkbWluL3VzZXJzL2Jhbm5lci9cIn0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU1MjA2XHU3ZWM0XCIsIFwiaWNvblwiOiBcImZhIGZhLWdyb3VwXCIsIFwidXJsXCI6IFwiL3hhZG1pbi9hdXRoL2dyb3VwL1wifSwge1widGl0bGVcIjogXCJcdTc1MjhcdTYyMzdcdTY3NDNcdTk2NTBcIiwgXCJpY29uXCI6IFwiZmEgZmEtY2VydGlmaWNhdGVcIiwgXCJ1cmxcIjogXCIveGFkbWluL2F1dGgvcGVybWlzc2lvbi9cIn0sIHtcInRpdGxlXCI6IFwiXHU2NWU1XHU1ZmQ3XHU4YmIwXHU1ZjU1XCIsIFwiaWNvblwiOiBcImZhIGZhLXRhc2tzXCIsIFwidXJsXCI6IFwiL3hhZG1pbi94YWRtaW4vbG9nL1wifV19XSIsIkxJU1RfUVVFUlkiOltbImNvdXJzZXMiLCJjb3Vyc2UiXSwiIl19','2018-04-08 15:13:36.986941'),('m22t38bsvwfznfscbjho3y9ywmwb43br','OGJjMWQ4MGViMjBmMWM4MTllMGQ4NzIwM2E0MTRjMDcyM2NkMmNmOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImM5YTQyY2NiYWNlNDU4ZGU4ZGE4NWU3ODljM2M1MmU2NDhlNGZlMmQiLCJMSVNUX1FVRVJZIjpbWyJjb3Vyc2VzIiwiY291cnNlIl0sIiJdfQ==','2018-04-07 15:09:36.729747'),('spyxeza41zq2kuheto4u9b4lh4gki292','NTg3YjkyYzNjYTY1YTBlNWVmZDE5ZjVmNmFlZjVjYjhkYTYzZTRlYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImM4OTJlZTU1NDc2ZmU2ODZkMzRjZjQ5YzMwNGVkNmYyYjQ2MTEwOTUiLCJMSVNUX1FVRVJZIjpbWyJjb3Vyc2VzIiwiY291cnNlIl0sIiJdfQ==','2018-03-31 01:06:41.205343'),('x9zt2ceapd36i6bx5oof35mv74bgsvkc','OGJjMWQ4MGViMjBmMWM4MTllMGQ4NzIwM2E0MTRjMDcyM2NkMmNmOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImM5YTQyY2NiYWNlNDU4ZGU4ZGE4NWU3ODljM2M1MmU2NDhlNGZlMmQiLCJMSVNUX1FVRVJZIjpbWyJjb3Vyc2VzIiwiY291cnNlIl0sIiJdfQ==','2018-04-02 15:04:41.447370'),('xdba0b2ckndrtxioqrxs8701cxf5o4s7','MjVkN2ZjZTk5NGFjMzFmNjhiOTFmZWQxMGM1OTRlMjZiZjI5MWNlMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImM4OTJlZTU1NDc2ZmU2ODZkMzRjZjQ5YzMwNGVkNmYyYjQ2MTEwOTUifQ==','2018-03-30 19:42:25.636858'),('xmq79o6qi7wpzdj3rwt5s6krcwx8uc2u','ZmQxMWIwOThiYTZmMmVjZWE1N2VjNzhiNzkwN2UyNmVhNjdiMGVmYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImM5YTQyY2NiYWNlNDU4ZGU4ZGE4NWU3ODljM2M1MmU2NDhlNGZlMmQiLCJMSVNUX1FVRVJZIjpbWyJhdXRoIiwicGVybWlzc2lvbiJdLCIiXX0=','2018-04-07 15:10:44.634421');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_coursecomments`
--

DROP TABLE IF EXISTS `operation_coursecomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_coursecomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(250) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` (`course_id`),
  KEY `operation_coursecomm_user_id_f5ff70b3_fk_users_use` (`user_id`),
  CONSTRAINT `operation_coursecomm_user_id_f5ff70b3_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_coursecomments`
--

LOCK TABLES `operation_coursecomments` WRITE;
/*!40000 ALTER TABLE `operation_coursecomments` DISABLE KEYS */;
INSERT INTO `operation_coursecomments` VALUES (1,'不错不错','2018-03-11 15:53:35.112945',1,1),(2,'要在学习Python的路上一去不复返啦','2018-03-11 16:04:38.819749',1,1),(3,'鸟叔的LInux私房菜，V587~~~','2018-03-22 21:01:15.680291',3,1),(4,'....','2018-03-25 19:55:01.982428',35,1),(5,'评论','2018-03-25 19:55:30.597341',35,1);
/*!40000 ALTER TABLE `operation_coursecomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_userask`
--

DROP TABLE IF EXISTS `operation_userask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_userask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_userask`
--

LOCK TABLES `operation_userask` WRITE;
/*!40000 ALTER TABLE `operation_userask` DISABLE KEYS */;
INSERT INTO `operation_userask` VALUES (31,'123','13302333340','321','2018-03-12 18:45:52.542714'),(32,'213','手机号码非法','321','2018-03-12 18:49:20.284466'),(33,'12','手机号码非法','3','2018-03-12 18:49:38.750938'),(34,'123','手机号码非法','123','2018-03-12 18:53:39.511460'),(35,'213','13302333340','12321','2018-03-13 00:51:06.891253');
/*!40000 ALTER TABLE `operation_userask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_usercourse`
--

DROP TABLE IF EXISTS `operation_usercourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_usercourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` (`course_id`),
  KEY `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_usercourse`
--

LOCK TABLES `operation_usercourse` WRITE;
/*!40000 ALTER TABLE `operation_usercourse` DISABLE KEYS */;
INSERT INTO `operation_usercourse` VALUES (1,'2018-03-10 23:36:00.000000',1,1),(2,'2018-03-10 23:36:00.000000',1,13),(3,'2018-03-10 23:36:00.000000',1,15),(4,'2018-03-10 23:36:00.000000',1,16),(5,'2018-03-10 23:36:00.000000',2,2),(6,'2018-03-10 23:36:00.000000',2,13),(7,'2018-03-10 23:36:00.000000',4,16),(8,'2018-03-10 23:36:00.000000',4,18),(9,'2018-03-10 23:37:00.000000',5,18),(10,'2018-03-10 23:37:00.000000',27,20),(11,'2018-03-10 23:37:00.000000',28,20),(12,'2018-03-10 23:37:00.000000',3,18),(13,'2018-03-10 23:37:00.000000',6,13),(14,'2018-03-10 23:37:00.000000',7,1),(21,'2018-03-10 23:36:00.000000',2,1),(22,'2018-03-10 23:36:00.000000',3,2),(23,'2018-03-10 23:36:00.000000',4,20),(24,'2018-03-10 23:36:00.000000',5,2),(25,'2018-03-10 23:36:00.000000',6,13),(26,'2018-03-10 23:36:00.000000',7,20),(27,'2018-03-10 23:36:00.000000',8,15),(28,'2018-03-10 23:36:00.000000',9,16),(29,'2018-03-10 23:37:00.000000',10,17),(30,'2018-03-10 23:37:00.000000',11,18),(31,'2018-03-10 23:37:00.000000',12,19),(32,'2018-03-10 23:37:00.000000',13,1),(33,'2018-03-10 23:37:00.000000',14,2),(34,'2018-03-10 23:37:00.000000',15,1),(35,'2018-03-10 23:37:00.000000',16,2),(36,'2018-03-16 15:55:32.666984',29,1),(37,'2018-03-22 20:53:26.988913',3,1),(38,'2018-03-25 19:54:50.157144',35,1);
/*!40000 ALTER TABLE `operation_usercourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_userfavorite`
--

DROP TABLE IF EXISTS `operation_userfavorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_userfavorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_userfavorite`
--

LOCK TABLES `operation_userfavorite` WRITE;
/*!40000 ALTER TABLE `operation_userfavorite` DISABLE KEYS */;
INSERT INTO `operation_userfavorite` VALUES (42,2,1,'2018-03-13 22:46:15.049887',1),(45,7,1,'2018-03-13 22:51:53.744516',1),(47,4,2,'2018-03-15 23:47:32.377278',1),(49,1,3,'2018-03-15 23:47:56.594057',1),(50,15,3,'2018-03-15 23:48:16.958193',1),(51,7,2,'2018-03-15 23:48:17.851762',1),(52,4,1,'2018-03-16 00:15:55.054934',1),(56,1,2,'2018-03-16 15:55:28.416718',1),(57,2,2,'2018-03-22 20:23:43.169303',1),(60,3,1,'2018-03-22 20:27:54.226764',1),(61,3,2,'2018-03-22 21:09:22.707760',1),(62,5,2,'2018-03-22 21:09:30.515515',1),(63,5,1,'2018-03-22 21:09:31.309811',1),(64,1,1,'2018-03-24 15:30:54.751726',1);
/*!40000 ALTER TABLE `operation_userfavorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_usermessage`
--

DROP TABLE IF EXISTS `operation_usermessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_usermessage`
--

LOCK TABLES `operation_usermessage` WRITE;
/*!40000 ALTER TABLE `operation_usermessage` DISABLE KEYS */;
INSERT INTO `operation_usermessage` VALUES (2,1,'欢迎注册玉汝于成网！！',1,'2018-03-22 00:22:00.000000');
/*!40000 ALTER TABLE `operation_usermessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_citydict`
--

DROP TABLE IF EXISTS `organization_citydict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_citydict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_citydict`
--

LOCK TABLES `organization_citydict` WRITE;
/*!40000 ALTER TABLE `organization_citydict` DISABLE KEYS */;
INSERT INTO `organization_citydict` VALUES (1,'昆明','四季如春','2018-03-05 17:14:00.000000'),(2,'广州','妖都，花城','2018-03-05 17:14:00.000000'),(3,'深圳','有位老人画了一个圈','2018-03-05 17:14:00.000000'),(4,'西安','十三朝古都','2018-03-05 17:15:00.000000'),(5,'杭州','素有“人间天堂”美誉','2018-03-05 17:16:00.000000'),(6,'上海','魔都，东方巴黎','2018-03-05 17:17:00.000000'),(7,'北京','帝都，历史文化名城','2018-03-05 17:18:00.000000'),(8,'河源','客家古邑，恐龙之乡','2018-03-05 17:21:00.000000'),(9,'南京','龙盘虎踞，六朝古都，十朝都会','2018-03-05 18:15:00.000000');
/*!40000 ALTER TABLE `organization_citydict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_courseorg`
--

DROP TABLE IF EXISTS `organization_courseorg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_courseorg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` longtext NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `city_id` int(11) NOT NULL,
  `category` varchar(20) NOT NULL,
  `students` int(11) NOT NULL,
  `course_nums` int(11) NOT NULL,
  `tag` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_courseo_city_id_4a842f85_fk_organizat` (`city_id`),
  CONSTRAINT `organization_courseo_city_id_4a842f85_fk_organizat` FOREIGN KEY (`city_id`) REFERENCES `organization_citydict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_courseorg`
--

LOCK TABLES `organization_courseorg` WRITE;
/*!40000 ALTER TABLE `organization_courseorg` DISABLE KEYS */;
INSERT INTO `organization_courseorg` VALUES (1,'慕课网','慕课网（IMOOC）是IT技能学习平台。慕课网(IMOOC)提供了丰富的移动端开发、php开发、web前端、android开发以及html5等视频教程资源公开课。并且富有交互性及趣味性，你还可以和朋友一起编程。',19,1,'org/2018/03/慕课网.jpeg','北京市朝阳区','2018-03-05 18:03:00.000000',7,'pxjg',0,6,'著名机构'),(2,'极客学院','极客学院作为中国专业IT职业在线教育平台,拥有海量高清IT职业课程,涵盖30+个技术领域,如Android,iOS ,Flash,Java,Python,HTML5,Swift,Cocos2dx等视频教程.根据IT在线学习特点,极客学院推出IT学习知识体系图,IT职业学习实战路径图,帮助IT学习者从零基础起步,结合IT实战案例演练,系统学习,助你快速成为IT优秀技术人才！',9,1,'org/2018/03/极客学院.jpg','上海市闵行区','2018-03-05 18:06:00.000000',6,'pxjg',1,4,'著名机构'),(3,'实验楼','实验楼是国内领先的IT在线编程及在线实训学习平台，专业导师提供精选的实践项目，创新的技术使得学习者无需配置繁琐的本地环境，随时在线流畅使用。以就业为导向，提供编程、运维、测试、云计算、大数据、数据库等全面的IT技术动手实践环境，提供Linux、Python、Java、C语言、Node.js、Hadoop、PHP、Docker、Git、R、SQL、MongoDB、Redis、Swift、Spark等千门热门课程。',4,1,'org/2018/03/实验楼.png','广州市越秀区','2018-03-05 18:09:00.000000',2,'pxjg',0,5,'著名机构'),(4,'北京大学','国内顶级学府',5,1,'org/2018/03/北京大学.jpg','北京市','2018-03-05 18:10:00.000000',7,'gx',2,4,'全国名校'),(5,'清华大学','国内顶级学府',0,1,'org/2018/03/清华大学.png','北京市','2018-03-05 18:14:00.000000',7,'gx',3,4,'全国名校'),(6,'南京大学','国内一流学府',3,0,'org/2018/03/南京大学.jpg','南京市','2018-03-05 18:14:00.000000',9,'gx',0,4,'全国名校'),(7,'IMOOC','IMOOC Online Study Platform',1,1,'org/2018/03/imooc.png','深圳市','2018-03-05 18:16:00.000000',3,'pxjg',0,6,'著名机构');
/*!40000 ALTER TABLE `organization_courseorg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_teacher`
--

DROP TABLE IF EXISTS `organization_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `work_years` int(11) NOT NULL,
  `work_company` varchar(50) NOT NULL,
  `work_position` varchar(50) NOT NULL,
  `points` varchar(50) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `org_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_teacher_org_id_cd000a1a_fk_organizat` (`org_id`),
  CONSTRAINT `organization_teacher_org_id_cd000a1a_fk_organizat` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_teacher`
--

LOCK TABLES `organization_teacher` WRITE;
/*!40000 ALTER TABLE `organization_teacher` DISABLE KEYS */;
INSERT INTO `organization_teacher` VALUES (1,'廖雪峰',1,'玉汝于成','资深讲师','由浅入深，循序渐进',0,1,'2018-03-10 11:13:00.000000',3,'teacher/2018/03/03514616.gif',18),(2,'马士兵',2,'玉汝于成','资深讲师','由浅入深，循序渐进',0,0,'2018-03-10 11:13:00.000000',3,'teacher/2018/03/03514616.gif',18),(3,'马士兵',3,'玉汝于成','资深讲师','由浅入深，循序渐进',0,0,'2018-03-10 11:13:00.000000',2,'teacher/2018/03/03514616.gif',18),(4,'廖雪峰',2,'玉汝于成','资深讲师','由浅入深，循序渐进',0,0,'2018-03-10 11:13:00.000000',2,'teacher/2018/03/03514616.gif',18),(5,'mtianyan',1,'玉汝于成','资深讲师','由浅入深，循序渐进',0,0,'2018-03-10 11:13:00.000000',1,'teacher/2018/03/03514616.gif',18),(6,'谷哥',1,'玉汝于成','资深讲师','由浅入深，循序渐进',123,0,'2018-03-10 11:13:00.000000',1,'teacher/2018/03/03514616.gif',18),(7,'Ms.Liu',2,'玉汝于成','资深讲师','由浅入深，循序渐进',321,0,'2018-03-10 11:13:00.000000',4,'teacher/2018/03/03514616.gif',18),(8,'纪姊姊',3,'玉汝于成','资深讲师','由浅入深，循序渐进',221,0,'2018-03-10 11:13:00.000000',4,'teacher/2018/03/03514616.gif',18),(9,'黄钰嫣',2,'玉汝于成','资深讲师','由浅入深，循序渐进',0,1,'2018-03-10 11:13:00.000000',5,'teacher/2018/03/03514616.gif',18),(10,'秦瑞',1,'玉汝于成','资深讲师','由浅入深，循序渐进',0,2,'2018-03-10 11:13:00.000000',5,'teacher/2018/03/03514616.gif',18),(11,'吴雨洁',1,'玉汝于成','资深讲师','由浅入深，循序渐进',0,3,'2018-03-10 11:13:00.000000',6,'teacher/2018/03/03514616.gif',18),(12,'草木心',2,'玉汝于成','资深讲师','由浅入深，循序渐进',0,0,'2018-03-10 11:13:00.000000',6,'teacher/2018/03/03514616.gif',18),(13,'安琪拉',2,'玉汝于成','资深讲师','由浅入深，循序渐进',12,0,'2018-03-10 11:13:00.000000',7,'teacher/2018/03/03514616.gif',18),(14,'夏晓秋',3,'玉汝于成','资深讲师','由浅入深，循序渐进',0,5,'2018-03-10 11:13:00.000000',7,'teacher/2018/03/03514616.gif',18),(15,'春絮香',3,'玉汝于成','资深讲师','由浅入深，循序渐进',1000,5,'2018-03-10 11:13:00.000000',7,'teacher/2018/03/03514616.gif',18);
/*!40000 ALTER TABLE `organization_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_banner`
--

DROP TABLE IF EXISTS `users_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_banner`
--

LOCK TABLES `users_banner` WRITE;
/*!40000 ALTER TABLE `users_banner` DISABLE KEYS */;
INSERT INTO `users_banner` VALUES (1,'TensorFlow课程','banner/2018/03/57aa86a0000145c512000460_nMwvoQD.jpg','http://192.168.0.102/course/detail/1/',2,'2018-03-16 17:27:00.000000'),(2,'Android','banner/2018/03/57a801860001c34b12000460_z4Vb8zl.jpg','http://192.168.0.102/course/detail/1/',100,'2018-03-16 17:49:00.000000');
/*!40000 ALTER TABLE `users_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_emailverifyrecord`
--

DROP TABLE IF EXISTS `users_emailverifyrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` varchar(10) NOT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_emailverifyrecord`
--

LOCK TABLES `users_emailverifyrecord` WRITE;
/*!40000 ALTER TABLE `users_emailverifyrecord` DISABLE KEYS */;
INSERT INTO `users_emailverifyrecord` VALUES (37,'ueJvmWr5oozQ3KXg','524617997@qq.com','register','2018-03-05 16:40:44.696146'),(38,'u4k2gVCFvBXDYk97','514175035@qq.com','update','2018-03-13 00:29:50.036920'),(39,'bGqUbynMEoKirHHd','jjh9401@qq.com','update','2018-03-13 00:34:15.207451'),(40,'SjLHxdaHYCV7KBUA','514175035@qq.com','update','2018-03-13 00:58:30.698553'),(41,'vvgi','514175035@qq.com','update','2018-03-13 00:59:56.652918'),(42,'M1E7','jjh9401@qq.com','update','2018-03-17 21:30:21.192260');
/*!40000 ALTER TABLE `users_emailverifyrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile`
--

DROP TABLE IF EXISTS `users_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile` (
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
  `nick_name` varchar(50) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(6) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile`
--

LOCK TABLES `users_userprofile` WRITE;
/*!40000 ALTER TABLE `users_userprofile` DISABLE KEYS */;
INSERT INTO `users_userprofile` VALUES (1,'pbkdf2_sha256$100000$wo5s2nwT9cDz$n84ZmU6gGxFkRIY+c1bQBnArgzL7nc5+ZgazoXXAtMM=','2019-01-10 23:43:56.650020',1,'Jiahe-J','','','jjh9401@qq.com',1,1,'2018-02-27 06:51:00.000000','江加河','1994-01-28','male','信华花园3栋','15625101336','image/2018/03/20051128153010219821687.gif'),(2,'123456','2018-02-27 14:58:00.000000',0,'SilentHz','嘉和','江','django@python.cn',0,1,'2018-02-27 14:57:00.000000','江小河','1994-01-28','female','河源','13302333340','image/2018/03/0351461_xuOsQ6G.gif'),(13,'pbkdf2_sha256$100000$kujCrRFlD0wd$LkXYD+aHcGjpltvsMU2EJvQo7ILz04vDTmpMxbT3uXg=','2018-03-25 14:26:00.800368',0,'Angela','','','524617998@qq.com',1,1,'2018-03-02 15:28:00.000000','江姐','2018-03-10','female','河源市',NULL,'image/2018/03/0351461_xuOsQ6G.gif'),(15,'123456',NULL,0,'黄钰嫣','钰嫣','黄','hyy@qq.com',0,1,'2018-03-02 15:28:59.844000','钰嫣',NULL,'female',NULL,NULL,'image/2018/03/0351461_xuOsQ6G.gif'),(16,'123456',NULL,0,'贺诗园','诗园','贺','hsy@qq.com',0,1,'2018-03-02 15:28:59.844559','诗园',NULL,'female',NULL,NULL,'image/2018/03/0351461_xuOsQ6G.gif'),(17,'123456',NULL,0,'吴钰','钰','吴','wy@qq.com',0,1,'2018-03-02 15:28:59.844559','钰',NULL,'female',NULL,NULL,'image/2018/03/0351461_xuOsQ6G.gif'),(18,'123456',NULL,0,'肖志康','志康','肖','xzk@qq.com',0,1,'2018-03-02 15:28:59.844559','志康',NULL,'male',NULL,NULL,'image/2018/03/0351461_xuOsQ6G.gif'),(19,'123456',NULL,0,'张小杰','小杰','张','zxj@qq.com',0,1,'2018-03-02 15:28:59.844559','小杰',NULL,'male',NULL,NULL,'image/2018/03/0351461_xuOsQ6G.gif'),(20,'123456',NULL,0,'吴倩莹','倩莹','吴','wqy@qq.com',0,1,'2018-03-02 15:28:59.844559','倩莹',NULL,'female',NULL,NULL,'image/2018/03/0351461_xuOsQ6G.gif');
/*!40000 ALTER TABLE `users_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_groups`
--

DROP TABLE IF EXISTS `users_userprofile_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_groups`
--

LOCK TABLES `users_userprofile_groups` WRITE;
/*!40000 ALTER TABLE `users_userprofile_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_userprofile_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_user_permissions`
--

DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_us_permission_id_393136b6_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_user_permissions`
--

LOCK TABLES `users_userprofile_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` DISABLE KEYS */;
INSERT INTO `users_userprofile_user_permissions` VALUES (2,2,16),(15,2,17),(1,2,46),(3,2,49),(4,2,50),(5,2,51),(6,2,52),(7,2,53),(8,2,54),(9,2,55),(10,2,56),(11,2,57),(12,2,58),(13,2,59),(14,2,60),(17,13,34),(18,13,35),(19,13,36),(16,13,65);
/*!40000 ALTER TABLE `users_userprofile_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_bookmark`
--

DROP TABLE IF EXISTS `xadmin_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_bookmark`
--

LOCK TABLES `xadmin_bookmark` WRITE;
/*!40000 ALTER TABLE `xadmin_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_log`
--

DROP TABLE IF EXISTS `xadmin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_log`
--

LOCK TABLES `xadmin_log` WRITE;
/*!40000 ALTER TABLE `xadmin_log` DISABLE KEYS */;
INSERT INTO `xadmin_log` VALUES (119,'2018-03-21 14:23:46.702839','127.0.0.1',NULL,'','delete','批量删除 110 个 日志记录',NULL,1),(120,'2018-03-21 16:45:11.352549','127.0.0.1','1','Jiahe-J','change','修改 last_login',6,1),(121,'2018-03-21 21:33:23.348673','127.0.0.1','1','Jiahe-J chart widget','delete','',23,1),(122,'2018-03-22 00:22:33.075065','127.0.0.1','2','用户(Jiahe-J)接收了欢迎注册玉汝于成网！！ ','create','已添加。',20,1),(123,'2018-03-22 21:06:49.208980','127.0.0.1','15','[IMOOC]的教师: 春絮香','change','修改 image',13,1);
/*!40000 ALTER TABLE `xadmin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_usersettings`
--

DROP TABLE IF EXISTS `xadmin_usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_usersettings`
--

LOCK TABLES `xadmin_usersettings` WRITE;
/*!40000 ALTER TABLE `xadmin_usersettings` DISABLE KEYS */;
INSERT INTO `xadmin_usersettings` VALUES (1,'dashboard:home:pos','',1),(2,'site-theme','https://bootswatch.com/3/lumen/bootstrap.min.css',1),(3,'dashboard:home:pos','',13),(4,'site-theme','https://bootswatch.com/3/lumen/bootstrap.min.css',13),(5,'courses_course_editform_portal','box-0,lesson_set-group,,,,,,,,,,,,,courseresource_set-group,',1);
/*!40000 ALTER TABLE `xadmin_usersettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_userwidget`
--

DROP TABLE IF EXISTS `xadmin_userwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_userwidget`
--

LOCK TABLES `xadmin_userwidget` WRITE;
/*!40000 ALTER TABLE `xadmin_userwidget` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_userwidget` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-10 23:51:12
