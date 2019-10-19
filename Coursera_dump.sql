-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: coursera
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `career`
--

DROP TABLE IF EXISTS `career`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `career` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `required_skills` varchar(255) DEFAULT NULL,
  `wish_professional` varchar(255) DEFAULT NULL,
  `employment_id` bigint(20) unsigned DEFAULT NULL,
  `wish_experience_id` bigint(20) unsigned DEFAULT NULL,
  `confidesion_id` bigint(20) unsigned DEFAULT '1',
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `career_employment_id_fk` (`employment_id`),
  KEY `career_wish_experience_id_fk` (`wish_experience_id`),
  KEY `career_work_confidesion_id_fk` (`confidesion_id`),
  CONSTRAINT `career_employment_id_fk` FOREIGN KEY (`employment_id`) REFERENCES `employment` (`id`) ON DELETE SET NULL,
  CONSTRAINT `career_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `career_wish_experience_id_fk` FOREIGN KEY (`wish_experience_id`) REFERENCES `experience` (`id`) ON DELETE SET NULL,
  CONSTRAINT `career_work_confidesion_id_fk` FOREIGN KEY (`confidesion_id`) REFERENCES `confidesion` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `career`
--

LOCK TABLES `career` WRITE;
/*!40000 ALTER TABLE `career` DISABLE KEYS */;
/*!40000 ALTER TABLE `career` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog`
--

DROP TABLE IF EXISTS `catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `catalog_id` bigint(20) unsigned DEFAULT NULL,
  `photo_id` bigint(20) unsigned DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `catalog_photo_id_fk` (`photo_id`),
  CONSTRAINT `catalog_photo_id_fk` FOREIGN KEY (`photo_id`) REFERENCES `photo` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog`
--

LOCK TABLES `catalog` WRITE;
/*!40000 ALTER TABLE `catalog` DISABLE KEYS */;
INSERT INTO `catalog` VALUES (1,'Гуманитарные науки и искусство',0,NULL),(2,'Бизнес',0,NULL),(3,'Компьютерные науки',0,NULL),(4,'Изучение языков',0,NULL),(5,'Финансы',2,NULL),(6,'Маркетинг',2,NULL),(7,'Предпринимательство',2,NULL),(8,'Разработка ПО',3,NULL),(9,'Алгоритмы',3,NULL),(10,'история',1,NULL),(11,'Философия',1,NULL),(12,'Изучение английского',3,NULL),(13,'Другие языки',3,NULL);
/*!40000 ALTER TABLE `catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `confidesion`
--

DROP TABLE IF EXISTS `confidesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `confidesion` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `confidesion`
--

LOCK TABLES `confidesion` WRITE;
/*!40000 ALTER TABLE `confidesion` DISABLE KEYS */;
INSERT INTO `confidesion` VALUES (3,'люди в internet'),(2,'сообщество Coursera'),(1,'только я');
/*!40000 ALTER TABLE `confidesion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `course_info`
--

DROP TABLE IF EXISTS `course_info`;
/*!50001 DROP VIEW IF EXISTS `course_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `course_info` AS SELECT 
 1 AS `name`,
 1 AS `photo`,
 1 AS `title`,
 1 AS `len_course`,
 1 AS `level`,
 1 AS `catalog_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `employment`
--

DROP TABLE IF EXISTS `employment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employment`
--

LOCK TABLES `employment` WRITE;
/*!40000 ALTER TABLE `employment` DISABLE KEYS */;
INSERT INTO `employment` VALUES (4,'Безработный'),(2,'Не полная занятость (менее 35 часов в неделю)'),(3,'Пенсионер'),(1,'Полная занятость (не менее 35 часов в неделю)');
/*!40000 ALTER TABLE `employment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experience`
--

DROP TABLE IF EXISTS `experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experience` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experience`
--

LOCK TABLES `experience` WRITE;
/*!40000 ALTER TABLE `experience` DISABLE KEYS */;
/*!40000 ALTER TABLE `experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,'Английский'),(4,'Испанский'),(5,'Китайский'),(6,'Корейский'),(2,'Русский'),(3,'Французский');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_learning`
--

DROP TABLE IF EXISTS `language_learning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_learning` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `learning_id` bigint(20) unsigned DEFAULT NULL,
  `language_id` bigint(20) unsigned DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `learning_id` (`learning_id`,`language_id`),
  KEY `learning_language_id_fk` (`language_id`),
  CONSTRAINT `learning_language_id_fk` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE,
  CONSTRAINT `learning_learning_id_fk` FOREIGN KEY (`learning_id`) REFERENCES `learning` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_learning`
--

LOCK TABLES `language_learning` WRITE;
/*!40000 ALTER TABLE `language_learning` DISABLE KEYS */;
INSERT INTO `language_learning` VALUES (14,5,1),(11,6,1),(12,6,5),(13,7,3),(8,8,1),(9,8,2),(10,8,3);
/*!40000 ALTER TABLE `language_learning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning`
--

DROP TABLE IF EXISTS `learning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `learning` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `catalog_id` bigint(20) unsigned DEFAULT NULL,
  `photo_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `level_id` bigint(20) unsigned DEFAULT NULL,
  `time_execute` varchar(255) DEFAULT NULL,
  `how_take` varchar(255) DEFAULT NULL,
  `len_course` int(10) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`),
  KEY `learning_catalog_id_fk` (`catalog_id`),
  KEY `learning_photo_id_fk` (`photo_id`),
  KEY `learning_level_id_fk` (`level_id`),
  KEY `learning_catalog_uq` (`id`,`catalog_id`),
  KEY `learning_photo_uq` (`id`,`photo_id`),
  CONSTRAINT `learning_catalog_id_fk` FOREIGN KEY (`catalog_id`) REFERENCES `catalog` (`id`) ON DELETE SET NULL,
  CONSTRAINT `learning_level_id_fk` FOREIGN KEY (`level_id`) REFERENCES `level_education` (`id`) ON DELETE SET NULL,
  CONSTRAINT `learning_photo_id_fk` FOREIGN KEY (`photo_id`) REFERENCES `photo` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning`
--

LOCK TABLES `learning` WRITE;
/*!40000 ALTER TABLE `learning` DISABLE KEYS */;
INSERT INTO `learning` VALUES (5,'Master of Computer Science in Data Science',3,5,'Deepen your knowledge and boost your career with a degree from a top-5 Computer Science graduate program in the U.S.',1,'3 месяца','Бесплатно',100,'2019-10-19 17:28:47','2019-10-19 17:28:47'),(6,'Python для всех',3,5,'Learn to Program and Analyze Data with Python. Develop programs to gather, clean, analyze, and visualize data',1,'3 месяца','Бесплатно',300,'2019-10-19 17:28:47','2019-10-19 17:28:47'),(7,'Online Master of Accounting (iMSA)',2,5,'analytics-minded professional',1,'18-36 months','Бесплатно',600,'2019-10-19 17:28:47','2019-10-19 17:28:47'),(8,'Java для всех',3,5,'Learn to Program and Analyze Data with Python. Develop programs to gather, clean, analyze, and visualize data',1,'18-36 months','Бесплатно',600,'2019-10-19 17:28:47','2019-10-19 17:28:47');
/*!40000 ALTER TABLE `learning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level`
--

DROP TABLE IF EXISTS `level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `level` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level`
--

LOCK TABLES `level` WRITE;
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
INSERT INTO `level` VALUES (3,'максимальный'),(1,'начальный'),(2,'средний');
/*!40000 ALTER TABLE `level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level_education`
--

DROP TABLE IF EXISTS `level_education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `level_education` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level_education`
--

LOCK TABLES `level_education` WRITE;
/*!40000 ALTER TABLE `level_education` DISABLE KEYS */;
INSERT INTO `level_education` VALUES (3,'Атестат о общем среднем образовании'),(4,'Атестат о средне специальном образовании'),(1,'Бакалавр'),(2,'Магистр'),(5,'Специалист');
/*!40000 ALTER TABLE `level_education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes_cours`
--

DROP TABLE IF EXISTS `likes_cours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes_cours` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `learning_id` bigint(20) unsigned NOT NULL,
  `rating` tinyint(1) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `learning_id` (`learning_id`,`user_id`),
  KEY `likes_cours_user_id_fk` (`user_id`),
  CONSTRAINT `likes_cours_learning_id_fk` FOREIGN KEY (`learning_id`) REFERENCES `learning` (`id`) ON DELETE CASCADE,
  CONSTRAINT `likes_cours_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes_cours`
--

LOCK TABLES `likes_cours` WRITE;
/*!40000 ALTER TABLE `likes_cours` DISABLE KEYS */;
INSERT INTO `likes_cours` VALUES (5,5,8,20,'2019-10-19 17:28:47'),(6,5,5,50,'2019-10-19 17:28:47'),(7,7,6,80,'2019-10-19 17:28:47'),(8,8,7,100,'2019-10-19 17:28:47');
/*!40000 ALTER TABLE `likes_cours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `learning_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`),
  KEY `Messages_user_id_fk` (`user_id`),
  KEY `Messages_learning_id_fk` (`learning_id`),
  CONSTRAINT `Messages_learning_id_fk` FOREIGN KEY (`learning_id`) REFERENCES `learning` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Messages_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (5,5,8,'Вопросы по курсу','не получается решение','2019-10-19 17:28:47'),(6,5,5,'Вопросы преподователю','не получается решение','2019-10-19 17:28:47'),(7,7,6,'Вопросы преподователю','не получается решение','2019-10-19 17:28:47'),(8,8,7,'Вопросы преподователю','не понятно','2019-10-19 17:28:47');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `target_id` bigint(20) unsigned NOT NULL,
  `filename` varchar(255) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo`
--

LOCK TABLES `photo` WRITE;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` VALUES (1,1,'//photo1'),(2,1,'//photo2'),(3,1,'//photo3'),(4,1,'//photo4'),(5,2,'//photo5');
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `profile_user`
--

DROP TABLE IF EXISTS `profile_user`;
/*!50001 DROP VIEW IF EXISTS `profile_user`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `profile_user` AS SELECT 
 1 AS `first_name`,
 1 AS `hometown`,
 1 AS `last_name`,
 1 AS `filename`,
 1 AS `profesional`,
 1 AS `level`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `photo_id` bigint(20) unsigned DEFAULT NULL,
  `sex_id` bigint(20) unsigned DEFAULT NULL,
  `hometown_id` bigint(20) unsigned DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `profiles_photo_id_fk` (`photo_id`),
  KEY `profiles_hometown_id_fk` (`hometown_id`),
  CONSTRAINT `profiles_hometown_id_fk` FOREIGN KEY (`hometown_id`) REFERENCES `town` (`id`) ON DELETE SET NULL,
  CONSTRAINT `profiles_photo_id_fk` FOREIGN KEY (`photo_id`) REFERENCES `photo` (`id`) ON DELETE SET NULL,
  CONSTRAINT `profiles_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sex`
--

DROP TABLE IF EXISTS `sex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sex` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sex`
--

LOCK TABLES `sex` WRITE;
/*!40000 ALTER TABLE `sex` DISABLE KEYS */;
INSERT INTO `sex` VALUES (2,'женский'),(1,'мужской');
/*!40000 ALTER TABLE `sex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_worker`
--

DROP TABLE IF EXISTS `status_worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_worker` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_worker`
--

LOCK TABLES `status_worker` WRITE;
/*!40000 ALTER TABLE `status_worker` DISABLE KEYS */;
INSERT INTO `status_worker` VALUES (1,'Бизнес'),(4,'Другое'),(2,'Компьютерные науки'),(3,'Финансы');
/*!40000 ALTER TABLE `status_worker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `target`
--

DROP TABLE IF EXISTS `target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `target` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `target`
--

LOCK TABLES `target` WRITE;
/*!40000 ALTER TABLE `target` DISABLE KEYS */;
INSERT INTO `target` VALUES (2,'catalog'),(3,'course'),(1,'user');
/*!40000 ALTER TABLE `target` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `learning_id` bigint(20) unsigned DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `learning_id` (`learning_id`,`user_id`),
  KEY `teachers_user_id_fk` (`user_id`),
  CONSTRAINT `teachers_learning_id_fk` FOREIGN KEY (`learning_id`) REFERENCES `learning` (`id`) ON DELETE CASCADE,
  CONSTRAINT `teachers_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `town`
--

DROP TABLE IF EXISTS `town`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `town` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `town`
--

LOCK TABLES `town` WRITE;
/*!40000 ALTER TABLE `town` DISABLE KEYS */;
INSERT INTO `town` VALUES (8,'Вена'),(3,'Владивосток'),(6,'Лондон'),(1,'Москва'),(7,'Париж'),(4,'Пекин'),(2,'Санкт_петербург'),(9,'Сеул'),(5,'Токио');
/*!40000 ALTER TABLE `town` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_status`
--

DROP TABLE IF EXISTS `user_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_status` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_status`
--

LOCK TABLES `user_status` WRITE;
/*!40000 ALTER TABLE `user_status` DISABLE KEYS */;
INSERT INTO `user_status` VALUES (3,'корпоративное обучение'),(2,'преподаватель'),(1,'студент');
/*!40000 ALTER TABLE `user_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` char(255) NOT NULL,
  `user_status_id` bigint(20) unsigned DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `login` (`login`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `users_email_uq` (`email`),
  UNIQUE KEY `users_login_uq` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (5,'Ivanov','ivanov@mail.ru','5f4dcc3b5aa765d61d8327deb882cf99',0,'2019-10-19 17:28:47','2019-10-19 17:28:47'),(6,'Main Read','read@google.com','43cca4b3de2097b9558efefd0ecc3588',0,'2019-10-19 17:28:47','2019-10-19 17:28:47'),(7,'Hartman','hartman@google.com','42a0e188f5033bc65bf8d78622277c4e',1,'2019-10-19 17:28:47','2019-10-19 17:28:47'),(8,'Kim','kim_s@google.com','42a0e188f5033bc65bf8d78622277c4e',1,'2019-10-19 17:28:47','2019-10-19 17:28:47');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_cours`
--

DROP TABLE IF EXISTS `users_cours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_cours` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `learning_id` bigint(20) unsigned NOT NULL,
  `progress` tinyint(4) DEFAULT '0',
  `date_began` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `learning_id` (`learning_id`,`user_id`),
  KEY `users_cours_learning_uq` (`user_id`,`learning_id`),
  CONSTRAINT `users_cours_learning_id_fk` FOREIGN KEY (`learning_id`) REFERENCES `learning` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_cours_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_cours`
--

LOCK TABLES `users_cours` WRITE;
/*!40000 ALTER TABLE `users_cours` DISABLE KEYS */;
INSERT INTO `users_cours` VALUES (6,5,6,0,'2019-10-19 17:28:47','2019-10-19 17:28:47','2019-10-19 17:28:47'),(7,5,8,10,'2019-01-01 00:00:00','2019-10-19 17:28:47','2019-10-19 17:28:47'),(8,5,5,20,'2019-09-10 00:00:00','2019-10-19 17:28:47','2019-10-19 17:28:47'),(9,7,6,0,'2019-10-19 17:28:47','2019-10-19 17:28:47','2019-10-19 17:28:47'),(10,8,7,0,'2019-10-19 17:28:47','2019-10-19 17:28:47','2019-10-19 17:28:47');
/*!40000 ALTER TABLE `users_cours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_education`
--

DROP TABLE IF EXISTS `work_education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_education` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `level_education_id` bigint(20) unsigned DEFAULT NULL,
  `university` varchar(255) DEFAULT NULL,
  `status_worker_id` bigint(20) unsigned DEFAULT NULL,
  `i_am_student` tinyint(1) DEFAULT NULL,
  `employment_id` bigint(20) unsigned DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `employer` varchar(255) DEFAULT NULL,
  `profession` varchar(255) DEFAULT NULL,
  `work_experience_id` bigint(20) unsigned DEFAULT NULL,
  `is_now_employer` tinyint(1) DEFAULT NULL,
  `confidesion_id` bigint(20) unsigned DEFAULT '1',
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `work_education_level_education_id_fk` (`level_education_id`),
  KEY `work_education_status_worker_id_fk` (`status_worker_id`),
  KEY `work_education_employment_id_fk` (`employment_id`),
  KEY `work_education_work_experience_id_fk` (`work_experience_id`),
  KEY `work_education_work_confidesion_id_fk` (`confidesion_id`),
  CONSTRAINT `work_education_employment_id_fk` FOREIGN KEY (`employment_id`) REFERENCES `employment` (`id`) ON DELETE SET NULL,
  CONSTRAINT `work_education_level_education_id_fk` FOREIGN KEY (`level_education_id`) REFERENCES `level_education` (`id`) ON DELETE SET NULL,
  CONSTRAINT `work_education_status_worker_id_fk` FOREIGN KEY (`status_worker_id`) REFERENCES `status_worker` (`id`) ON DELETE SET NULL,
  CONSTRAINT `work_education_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `work_education_work_confidesion_id_fk` FOREIGN KEY (`confidesion_id`) REFERENCES `confidesion` (`id`) ON DELETE SET NULL,
  CONSTRAINT `work_education_work_experience_id_fk` FOREIGN KEY (`work_experience_id`) REFERENCES `experience` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_education`
--

LOCK TABLES `work_education` WRITE;
/*!40000 ALTER TABLE `work_education` DISABLE KEYS */;
/*!40000 ALTER TABLE `work_education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `course_info`
--

/*!50001 DROP VIEW IF EXISTS `course_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `course_info` AS select `learning`.`name` AS `name`,`learning`.`photo_id` AS `photo`,`learning`.`title` AS `title`,`learning`.`len_course` AS `len_course`,`level`.`name` AS `level`,`catalog`.`name` AS `catalog_name` from ((`learning` join `catalog` on((`catalog`.`id` = `learning`.`catalog_id`))) join `level` on((`level`.`id` = `learning`.`level_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `profile_user`
--

/*!50001 DROP VIEW IF EXISTS `profile_user`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `profile_user` AS select `pr`.`first_name` AS `first_name`,`town`.`name` AS `hometown`,`pr`.`last_name` AS `last_name`,`photo`.`filename` AS `filename`,`w_e`.`profession` AS `profesional`,`l_e`.`name` AS `level` from ((((`profiles` `pr` left join `town` on((`town`.`id` = `pr`.`hometown_id`))) left join `photo` on((`photo`.`target_id` = `pr`.`user_id`))) left join `work_education` `w_e` on((`w_e`.`user_id` = `pr`.`user_id`))) left join `level_education` `l_e` on((`l_e`.`id` = `w_e`.`level_education_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-19 17:30:05
