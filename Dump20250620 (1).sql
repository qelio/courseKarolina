-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: virtualpet
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.24.04.1

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
-- Table structure for table `achievements`
--

DROP TABLE IF EXISTS `achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `achievements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `description` text,
  `experience_num` int NOT NULL,
  `icon_url` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievements`
--

LOCK TABLES `achievements` WRITE;
/*!40000 ALTER TABLE `achievements` DISABLE KEYS */;
INSERT INTO `achievements` VALUES (1,'Достижение 1','10',10,''),(2,'12','12',12,''),(3,'Лучший рыбак','Достижение для лучшего в мире рыбака',15,'');
/*!40000 ALTER TABLE `achievements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experience_counter`
--

DROP TABLE IF EXISTS `experience_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experience_counter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_date` datetime NOT NULL,
  `experience_adding_tasks_id` int DEFAULT NULL,
  `experience_subtraction_pets_id` int DEFAULT NULL,
  `users_id` int NOT NULL,
  `total_points` int DEFAULT NULL,
  `action_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_experience_counter_users1_idx` (`users_id`),
  KEY `fk_experience_counter_pets1_idx` (`experience_subtraction_pets_id`),
  KEY `fk_experience_counter_tasks1_idx` (`experience_adding_tasks_id`),
  CONSTRAINT `fk_experience_counter_pets1` FOREIGN KEY (`experience_subtraction_pets_id`) REFERENCES `pets` (`id`),
  CONSTRAINT `fk_experience_counter_tasks1` FOREIGN KEY (`experience_adding_tasks_id`) REFERENCES `tasks` (`id`),
  CONSTRAINT `fk_experience_counter_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experience_counter`
--

LOCK TABLES `experience_counter` WRITE;
/*!40000 ALTER TABLE `experience_counter` DISABLE KEYS */;
INSERT INTO `experience_counter` VALUES (9,'2025-06-19 19:02:27',10,NULL,13,100,'adding'),(10,'2025-06-19 19:25:00',11,NULL,13,123,'adding'),(11,'2025-06-19 19:25:01',12,NULL,13,123,'adding'),(12,'2025-06-19 19:25:02',13,NULL,13,123,'adding'),(13,'2025-06-19 19:25:03',14,NULL,13,123,'adding'),(14,'2025-06-19 19:25:04',15,NULL,13,123,'adding'),(15,'2025-06-19 19:25:04',16,NULL,13,123,'adding'),(16,'2025-06-19 19:25:05',17,NULL,13,123,'adding'),(17,'2025-06-19 19:25:06',18,NULL,13,123,'adding'),(18,'2025-06-19 19:25:07',19,NULL,13,123,'adding'),(19,'2025-06-19 21:02:41',21,NULL,13,10,'adding'),(20,'2025-06-20 00:30:35',22,NULL,13,123,'adding'),(21,'2025-06-20 12:48:01',24,NULL,13,100,'adding'),(22,'2025-06-20 12:48:32',26,NULL,13,123,'adding'),(23,'2025-06-20 15:34:38',25,NULL,13,123,'adding'),(24,'2025-06-20 16:04:07',30,NULL,14,10,'adding');
/*!40000 ALTER TABLE `experience_counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `levels`
--

DROP TABLE IF EXISTS `levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `levels` (
  `level_num` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `experience_num` int NOT NULL,
  PRIMARY KEY (`level_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `levels`
--

LOCK TABLES `levels` WRITE;
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
/*!40000 ALTER TABLE `levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_action`
--

DROP TABLE IF EXISTS `log_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_action` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action` text,
  `data_action` datetime DEFAULT NULL,
  `users_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_log_action_users1_idx` (`users_id`),
  CONSTRAINT `fk_log_action_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_action`
--

LOCK TABLES `log_action` WRITE;
/*!40000 ALTER TABLE `log_action` DISABLE KEYS */;
INSERT INTO `log_action` VALUES (1,'Создание новой задачи','2025-06-19 23:37:52',13),(2,'Выполнение новой задачи','2025-06-20 00:30:35',13),(3,'Создание новой задачи','2025-06-20 01:58:52',13),(4,'Удаление задачи','2025-06-20 06:05:53',13),(5,'Создание нового питомца','2025-06-20 06:06:40',13),(6,'Создание новой задачи','2025-06-20 06:06:55',13),(7,'Создание нового питомца','2025-06-20 12:47:55',13),(8,'Выполнение новой задачи','2025-06-20 12:48:01',13),(9,'Создание новой задачи','2025-06-20 12:48:13',13),(10,'Создание новой задачи','2025-06-20 12:48:30',13),(11,'Выполнение новой задачи','2025-06-20 12:48:32',13),(12,'Выполнение новой задачи','2025-06-20 15:34:38',13),(13,'Создание новой задачи','2025-06-20 15:34:55',13),(14,'Создание новой задачи','2025-06-20 15:48:22',13),(15,'Создание новой задачи','2025-06-20 15:50:18',13),(16,'Создание нового питомца','2025-06-20 16:03:57',14),(17,'Создание новой задачи','2025-06-20 16:04:05',14),(18,'Выполнение новой задачи','2025-06-20 16:04:07',14);
/*!40000 ALTER TABLE `log_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_auth`
--

DROP TABLE IF EXISTS `log_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_auth` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data_auth` datetime DEFAULT NULL,
  `remember_me` tinyint DEFAULT NULL,
  `users_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_log_auth_users1_idx` (`users_id`),
  CONSTRAINT `fk_log_auth_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_auth`
--

LOCK TABLES `log_auth` WRITE;
/*!40000 ALTER TABLE `log_auth` DISABLE KEYS */;
INSERT INTO `log_auth` VALUES (1,'2025-06-19 23:30:15',0,13),(2,'2025-06-20 00:00:06',0,13),(3,'2025-06-20 12:47:42',0,13),(4,'2025-06-20 15:32:56',0,13),(5,'2025-06-20 16:00:30',0,14),(6,'2025-06-20 16:12:51',0,15);
/*!40000 ALTER TABLE `log_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` text,
  `created_at` datetime DEFAULT NULL,
  `is_read` tinyint DEFAULT NULL,
  `users_id` int NOT NULL,
  `icon_url` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_notifications_users1_idx` (`users_id`),
  CONSTRAINT `fk_notifications_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,'Поздравляю, вы получили новое достижение','2025-06-20 03:57:23',1,13,NULL),(2,'Поздравляю, вы получили новое достижение','2025-06-20 03:57:23',1,13,NULL),(3,'Поздравляю, вы получили новое достижение','2025-06-20 04:27:25',1,13,NULL),(4,'Поздравляю, вы получили новое достижение','2025-06-20 04:27:25',1,13,NULL),(5,'Поздравляю, вы получили новое достижение','2025-06-20 04:28:25',1,13,NULL),(6,'Поздравляю, вы получили новое достижение','2025-06-20 04:28:25',1,13,NULL),(7,'Поздравляю, вы получили новое достижение','2025-06-20 09:09:10',1,13,NULL),(8,'Поздравляю, вы получили новое достижение','2025-06-20 09:09:10',1,13,NULL),(9,'Поздравляю, вы получили новое достижение','2025-06-20 09:10:10',1,13,NULL),(10,'Поздравляю, вы получили новое достижение','2025-06-20 19:04:14',1,14,NULL);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet_mood_history`
--

DROP TABLE IF EXISTS `pet_mood_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet_mood_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `last_mood` enum('happy','sad','neutral') DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `changed_at` datetime DEFAULT NULL,
  `pets_id` int NOT NULL,
  `tasks_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pet_mood_history_pets1_idx` (`pets_id`),
  KEY `fk_pet_mood_history_tasks1_idx` (`tasks_id`),
  CONSTRAINT `fk_pet_mood_history_pets1` FOREIGN KEY (`pets_id`) REFERENCES `pets` (`id`),
  CONSTRAINT `fk_pet_mood_history_tasks1` FOREIGN KEY (`tasks_id`) REFERENCES `tasks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet_mood_history`
--

LOCK TABLES `pet_mood_history` WRITE;
/*!40000 ALTER TABLE `pet_mood_history` DISABLE KEYS */;
INSERT INTO `pet_mood_history` VALUES (2,'neutral','Добавление новой задачи','2025-06-19 18:20:28',8,NULL),(3,'neutral','Удаление задачи','2025-06-19 18:38:45',8,NULL),(4,'sad','Удаление задачи','2025-06-19 18:38:48',8,NULL),(5,'sad','Удаление задачи','2025-06-19 18:38:50',8,NULL),(6,'sad','Удаление задачи','2025-06-19 18:41:00',8,NULL),(7,'neutral','Удаление задачи','2025-06-19 18:41:38',8,NULL),(8,'sad','Выполнение задачи','2025-06-19 18:42:22',8,NULL),(9,'sad','Выполнение задачи','2025-06-19 18:43:38',8,NULL),(10,'sad','Выполнение задачи','2025-06-19 18:44:11',8,NULL),(11,'sad','Выполнение задачи','2025-06-19 18:44:26',8,NULL),(12,'sad','Добавление новой задачи','2025-06-19 18:45:25',8,NULL),(13,'neutral','Выполнение задачи','2025-06-19 18:46:14',8,NULL),(14,'neutral','Выполнение задачи','2025-06-19 18:53:05',8,NULL),(15,'neutral','Выполнение задачи','2025-06-19 18:53:43',8,NULL),(16,'neutral','Выполнение задачи','2025-06-19 18:54:08',8,NULL),(17,'happy','Добавление новой задачи','2025-06-19 18:59:45',8,NULL),(18,'neutral','Добавление новой задачи','2025-06-19 19:01:53',8,NULL),(19,'neutral','Выполнение задачи','2025-06-19 19:02:27',8,NULL),(20,'happy','Добавление новой задачи','2025-06-19 19:23:42',8,NULL),(21,'neutral','Добавление новой задачи','2025-06-19 19:23:59',8,NULL),(22,'neutral','Добавление новой задачи','2025-06-19 19:24:06',8,NULL),(23,'neutral','Добавление новой задачи','2025-06-19 19:24:12',8,NULL),(24,'neutral','Добавление новой задачи','2025-06-19 19:24:21',8,NULL),(25,'neutral','Добавление новой задачи','2025-06-19 19:24:31',8,NULL),(26,'neutral','Добавление новой задачи','2025-06-19 19:24:37',8,NULL),(27,'neutral','Добавление новой задачи','2025-06-19 19:24:44',8,NULL),(28,'neutral','Добавление новой задачи','2025-06-19 19:24:49',8,NULL),(29,'neutral','Добавление новой задачи','2025-06-19 19:24:57',8,NULL),(30,'neutral','Выполнение задачи','2025-06-19 19:25:00',8,NULL),(31,'happy','Выполнение задачи','2025-06-19 19:25:01',8,NULL),(32,'happy','Выполнение задачи','2025-06-19 19:25:02',8,NULL),(33,'happy','Выполнение задачи','2025-06-19 19:25:03',8,NULL),(34,'happy','Выполнение задачи','2025-06-19 19:25:04',8,NULL),(35,'happy','Выполнение задачи','2025-06-19 19:25:04',8,NULL),(36,'happy','Выполнение задачи','2025-06-19 19:25:05',8,NULL),(37,'happy','Выполнение задачи','2025-06-19 19:25:06',8,NULL),(38,'happy','Выполнение задачи','2025-06-19 19:25:07',8,NULL),(39,'happy','Удаление задачи','2025-06-19 19:27:18',8,NULL),(40,'sad','Добавление новой задачи','2025-06-19 21:02:37',8,NULL),(41,'neutral','Выполнение задачи','2025-06-19 21:02:41',8,NULL),(42,'happy','Добавление новой задачи','2025-06-19 23:37:52',8,NULL),(43,'happy','No interaction for more than 2 hours','2025-06-20 03:24:06',8,NULL),(44,'neutral','Выполнение задачи','2025-06-20 00:30:35',8,NULL),(45,'sad','Добавление новой задачи','2025-06-20 01:58:52',8,NULL),(46,'happy','Не было выполнения задач в течение 5 часов','2025-06-20 08:55:10',8,NULL),(47,'neutral','Добавление новой задачи','2025-06-20 06:06:55',9,NULL),(48,'neutral','Не было выполнения задач в течение 2 часов','2025-06-20 09:07:10',9,NULL),(49,'neutral','Не было выполнения задач в течение 5 часов','2025-06-20 15:46:45',9,NULL),(50,'neutral','Выполнение задачи','2025-06-20 12:48:01',10,NULL),(51,'happy','Добавление новой задачи','2025-06-20 12:48:13',10,NULL),(52,'neutral','Добавление новой задачи','2025-06-20 12:48:30',10,NULL),(53,'neutral','Выполнение задачи','2025-06-20 12:48:32',10,NULL),(54,'neutral','Не было выполнения задач в течение 2 часов','2025-06-20 15:48:45',10,NULL),(55,'neutral','Не было выполнения задач в течение 2 часов','2025-06-20 18:33:38',10,NULL),(56,'neutral','Выполнение задачи','2025-06-20 15:34:38',10,NULL),(57,'happy','Добавление новой задачи','2025-06-20 15:34:55',10,NULL),(58,'happy','Добавление новой задачи','2025-06-20 15:48:22',10,NULL),(59,'happy','Добавление новой задачи','2025-06-20 15:50:18',10,NULL),(60,'neutral','Добавление новой задачи','2025-06-20 16:04:05',11,NULL),(61,'neutral','Выполнение задачи','2025-06-20 16:04:07',11,NULL),(62,'neutral','Не было выполнения задач в течение 2 часов','2025-06-20 19:04:14',11,NULL);
/*!40000 ALTER TABLE `pet_mood_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pets`
--

DROP TABLE IF EXISTS `pets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `mood` enum('happy','sad','neutral') DEFAULT NULL,
  `picture_url` varchar(300) NOT NULL,
  `last_update` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `life_status` enum('alive','dead') NOT NULL,
  `users_id` int NOT NULL,
  `experience_dead` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pets_users_idx` (`users_id`),
  CONSTRAINT `fk_pets_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pets`
--

LOCK TABLES `pets` WRITE;
/*!40000 ALTER TABLE `pets` DISABLE KEYS */;
INSERT INTO `pets` VALUES (8,'Каролиночка ❤️?','sad','/images/pets/karolina/karolina-neutral.jpg','2025-06-20 08:55:10','2025-06-19 14:15:55','dead',13,50),(9,'Лиса','sad','/images/pets/fox/fox-neutral.jpg','2025-06-20 15:46:44','2025-06-20 06:06:40','dead',13,50),(10,'Каролина','happy','/images/pets/karolina/karolina-neutral.jpg','2025-06-20 18:34:37','2025-06-20 12:47:55','alive',13,50),(11,'123','neutral','/images/pets/karolina/karolina-neutral.jpg','2025-06-20 19:04:14','2025-06-20 16:03:57','alive',14,50);
/*!40000 ALTER TABLE `pets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Администратор с полными правами'),(2,'user','Обычный пользователь');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `description` varchar(500) NOT NULL,
  `is_completed` tinyint NOT NULL,
  `created_at` datetime NOT NULL,
  `completed_at` datetime DEFAULT NULL,
  `experience_num` int NOT NULL,
  `users_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_table3_users1_idx` (`users_id`),
  CONSTRAINT `fk_table3_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (10,'Познакомиться с Каролиной','Узнать ее номер телефона',1,'2025-06-19 19:01:53','2025-06-19 22:02:26',100,13),(11,'123','123',1,'2025-06-19 19:23:42','2025-06-19 22:24:59',123,13),(12,'123','123',1,'2025-06-19 19:23:59','2025-06-19 22:25:00',123,13),(13,'123','123',1,'2025-06-19 19:24:06','2025-06-19 22:25:01',123,13),(14,'123','123',1,'2025-06-19 19:24:12','2025-06-19 22:25:02',123,13),(15,'123','123',1,'2025-06-19 19:24:21','2025-06-19 22:25:03',123,13),(16,'123','123',1,'2025-06-19 19:24:31','2025-06-19 22:25:04',123,13),(17,'123','123',1,'2025-06-19 19:24:37','2025-06-19 22:25:05',123,13),(18,'123','123',1,'2025-06-19 19:24:44','2025-06-19 22:25:06',123,13),(19,'123','123',1,'2025-06-19 19:24:49','2025-06-19 22:25:07',123,13),(21,'Познакомиться с питомцем','Выбрать механику',1,'2025-06-19 21:02:37','2025-06-20 00:02:40',10,13),(22,'1323','123',1,'2025-06-19 23:37:52','2025-06-20 03:30:34',123,13),(24,'Сделать веб','сделать полностью веб',1,'2025-06-20 06:06:55','2025-06-20 15:48:01',100,13),(25,'123','123',1,'2025-06-20 12:48:13','2025-06-20 18:34:37',123,13),(26,'123','123',1,'2025-06-20 12:48:30','2025-06-20 15:48:31',123,13),(27,'Новая задача','Крутая задача',0,'2025-06-20 15:34:55',NULL,10,13),(28,'123','123',0,'2025-06-20 15:48:22',NULL,123,13),(29,'123','123',0,'2025-06-20 15:50:18',NULL,10,13),(30,'123','123',1,'2025-06-20 16:04:05','2025-06-20 19:04:06',10,14);
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(300) NOT NULL,
  `avatar` varchar(300) DEFAULT NULL,
  `roles_id` int NOT NULL,
  `сurrent_points` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `fk_users_roles1_idx` (`roles_id`),
  CONSTRAINT `fk_users_roles1` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (13,'admin','admin@mail.ru','pbkdf2:sha256:600000$UDx5in1OjjiZdJaO$0df982a32298c8cca549b1e180fcfb725d6264daf5709f2cc381f94ce3b0b9f1','/static/images/avatars/13/2.jpg',1,1686),(14,'testuser','testuser@mail.ru','pbkdf2:sha256:600000$HULr1o0kjQyTzaQn$32fbef0916d607858230b8c770db0d9042c5da50d5ea6f65435e80a7a0e40901','/static/images/avatars/14/photo_2025-06-17_02-22-09.jpg',2,10),(15,'testadmin','testadmin@mail.ru','pbkdf2:sha256:600000$aBND3Qt98X03TcCC$92ffef5c6e48cfb93e316675e4b22f076652e30cc3b5ff1955824b2134f16a9c','/static/images/avatars/15/photo_2025-06-17_02-22-09.jpg',1,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_has_achievements`
--

DROP TABLE IF EXISTS `users_has_achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_has_achievements` (
  `users_id` int NOT NULL,
  `achievements_id` int NOT NULL,
  `received_at` datetime NOT NULL,
  PRIMARY KEY (`users_id`,`achievements_id`),
  KEY `fk_users_has_achievements_achievements1_idx` (`achievements_id`),
  KEY `fk_users_has_achievements_users1_idx` (`users_id`),
  CONSTRAINT `fk_users_has_achievements_achievements1` FOREIGN KEY (`achievements_id`) REFERENCES `achievements` (`id`),
  CONSTRAINT `fk_users_has_achievements_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_has_achievements`
--

LOCK TABLES `users_has_achievements` WRITE;
/*!40000 ALTER TABLE `users_has_achievements` DISABLE KEYS */;
INSERT INTO `users_has_achievements` VALUES (13,1,'2025-06-20 09:09:10'),(13,2,'2025-06-20 09:09:10'),(13,3,'2025-06-20 09:10:10'),(14,1,'2025-06-20 19:04:14');
/*!40000 ALTER TABLE `users_has_achievements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_has_levels`
--

DROP TABLE IF EXISTS `users_has_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_has_levels` (
  `users_id` int NOT NULL,
  `levels_level_num` int NOT NULL,
  PRIMARY KEY (`users_id`,`levels_level_num`),
  KEY `fk_users_has_levels_levels1_idx` (`levels_level_num`),
  KEY `fk_users_has_levels_users1_idx` (`users_id`),
  CONSTRAINT `fk_users_has_levels_levels1` FOREIGN KEY (`levels_level_num`) REFERENCES `levels` (`level_num`),
  CONSTRAINT `fk_users_has_levels_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_has_levels`
--

LOCK TABLES `users_has_levels` WRITE;
/*!40000 ALTER TABLE `users_has_levels` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_has_levels` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-20 19:21:40
