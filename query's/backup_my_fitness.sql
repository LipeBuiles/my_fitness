-- MySQL dump 10.13  Distrib 9.1.0, for Linux (x86_64)
--
-- Host: localhost    Database: my_fitness
-- ------------------------------------------------------
-- Server version	9.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cadence`
--

DROP TABLE IF EXISTS `cadence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cadence` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_training` int DEFAULT NULL,
  `cadence_AVG` int DEFAULT NULL,
  `cadence_max` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cadence_ibfk_1` (`id_training`),
  CONSTRAINT `cadence_ibfk_1` FOREIGN KEY (`id_training`) REFERENCES `training` (`id`),
  CONSTRAINT `cadence_chk_1` CHECK ((`cadence_AVG` <= 300)),
  CONSTRAINT `cadence_chk_2` CHECK ((`cadence_max` <= 300))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cadence`
--

LOCK TABLES `cadence` WRITE;
/*!40000 ALTER TABLE `cadence` DISABLE KEYS */;
/*!40000 ALTER TABLE `cadence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dream`
--

DROP TABLE IF EXISTS `dream`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dream` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ligth` time DEFAULT NULL,
  `deep` time DEFAULT NULL,
  `awake` int DEFAULT NULL,
  `heart_rate` int DEFAULT NULL,
  `total_dream` time DEFAULT NULL,
  `id_health` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dream_health_id_fk` (`id_health`),
  CONSTRAINT `dream_health_id_fk` FOREIGN KEY (`id_health`) REFERENCES `health` (`id`),
  CONSTRAINT `dream_chk_1` CHECK ((`awake` <= 24)),
  CONSTRAINT `dream_chk_2` CHECK ((`heart_rate` <= 300))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dream`
--

LOCK TABLES `dream` WRITE;
/*!40000 ALTER TABLE `dream` DISABLE KEYS */;
/*!40000 ALTER TABLE `dream` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `health`
--

DROP TABLE IF EXISTS `health`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `health` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `calories` int DEFAULT NULL,
  `steps` int DEFAULT NULL,
  `distance` float(5,2) DEFAULT NULL,
  `moviment` int DEFAULT NULL,
  `in_training` enum('0','1') COLLATE utf8mb4_spanish2_ci NOT NULL,
  `id_user_create` int DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_user_update` int DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_user_create` (`id_user_create`),
  KEY `id_user_update` (`id_user_update`),
  CONSTRAINT `health_ibfk_1` FOREIGN KEY (`id_user_create`) REFERENCES `users` (`id`),
  CONSTRAINT `health_ibfk_2` FOREIGN KEY (`id_user_update`) REFERENCES `users` (`id`),
  CONSTRAINT `health_chk_1` CHECK ((`calories` <= 3000)),
  CONSTRAINT `health_chk_2` CHECK ((`steps` <= 100000)),
  CONSTRAINT `health_chk_3` CHECK ((`distance` <= 999.99)),
  CONSTRAINT `health_chk_4` CHECK ((`moviment` <= 300))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `health`
--

LOCK TABLES `health` WRITE;
/*!40000 ALTER TABLE `health` DISABLE KEYS */;
/*!40000 ALTER TABLE `health` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heart_rate`
--

DROP TABLE IF EXISTS `heart_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `heart_rate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_training` int DEFAULT NULL,
  `heart_rate_AVG` int DEFAULT NULL,
  `heart_rate_max` int DEFAULT NULL,
  `ligth_pace` time DEFAULT NULL,
  `intensive_pace` time DEFAULT NULL,
  `aerobic_pace` time DEFAULT NULL,
  `anaerobic_pace` time DEFAULT NULL,
  `vo2_max` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `heart_rate_training_training_id_fk` (`id_training`),
  CONSTRAINT `heart_rate_training_training_id_fk` FOREIGN KEY (`id_training`) REFERENCES `training` (`id`),
  CONSTRAINT `heart_rate_chk_2` CHECK ((`heart_rate_max` <= 500))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heart_rate`
--

LOCK TABLES `heart_rate` WRITE;
/*!40000 ALTER TABLE `heart_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `heart_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objetives_day`
--

DROP TABLE IF EXISTS `objetives_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objetives_day` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `obj_calories` int DEFAULT NULL,
  `obj_steps` int DEFAULT NULL,
  `obj_moviment` int DEFAULT NULL,
  `obj_dream` float(5,2) DEFAULT NULL,
  `id_user_create` int DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_user_update` int DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_create` (`id_user_create`),
  KEY `user_update` (`id_user_update`),
  CONSTRAINT `objetives_day_ibfk_1` FOREIGN KEY (`id_user_create`) REFERENCES `users` (`id`),
  CONSTRAINT `objetives_day_ibfk_2` FOREIGN KEY (`id_user_update`) REFERENCES `users` (`id`),
  CONSTRAINT `objetives_day_chk_1` CHECK ((`obj_calories` <= 3000)),
  CONSTRAINT `objetives_day_chk_2` CHECK ((`obj_steps` <= 100000)),
  CONSTRAINT `objetives_day_chk_3` CHECK ((`obj_moviment` <= 300)),
  CONSTRAINT `objetives_day_chk_4` CHECK ((`obj_dream` <= 24.00))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objetives_day`
--

LOCK TABLES `objetives_day` WRITE;
/*!40000 ALTER TABLE `objetives_day` DISABLE KEYS */;
/*!40000 ALTER TABLE `objetives_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pace`
--

DROP TABLE IF EXISTS `pace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pace` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_training` int DEFAULT NULL,
  `pace` time DEFAULT NULL,
  `pace_max` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_training` (`id_training`),
  CONSTRAINT `pace_ibfk_1` FOREIGN KEY (`id_training`) REFERENCES `training` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pace`
--

LOCK TABLES `pace` WRITE;
/*!40000 ALTER TABLE `pace` DISABLE KEYS */;
/*!40000 ALTER TABLE `pace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pace_for_km`
--

DROP TABLE IF EXISTS `pace_for_km`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pace_for_km` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_training` int DEFAULT NULL,
  `km` int DEFAULT NULL,
  `pace` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_training` (`id_training`),
  CONSTRAINT `pace_for_km_ibfk_1` FOREIGN KEY (`id_training`) REFERENCES `training` (`id`),
  CONSTRAINT `pace_for_km_chk_1` CHECK ((`km` <= 200))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pace_for_km`
--

LOCK TABLES `pace_for_km` WRITE;
/*!40000 ALTER TABLE `pace_for_km` DISABLE KEYS */;
/*!40000 ALTER TABLE `pace_for_km` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stride_cm`
--

DROP TABLE IF EXISTS `stride_cm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stride_cm` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_training` int DEFAULT NULL,
  `stride_AVG` int DEFAULT NULL,
  `stride_max` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_training` (`id_training`),
  CONSTRAINT `stride_cm_ibfk_1` FOREIGN KEY (`id_training`) REFERENCES `training` (`id`),
  CONSTRAINT `stride_cm_chk_1` CHECK ((`stride_AVG` <= 300)),
  CONSTRAINT `stride_cm_chk_2` CHECK ((`stride_max` <= 300))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stride_cm`
--

LOCK TABLES `stride_cm` WRITE;
/*!40000 ALTER TABLE `stride_cm` DISABLE KEYS */;
/*!40000 ALTER TABLE `stride_cm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training`
--

DROP TABLE IF EXISTS `training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `training` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_health` int DEFAULT NULL,
  `id_type_training` int DEFAULT NULL,
  `km_distance` float(5,2) DEFAULT NULL,
  `kcal_active` int DEFAULT NULL,
  `kcal_total` int DEFAULT NULL,
  `pace` time DEFAULT NULL,
  `steps` int DEFAULT NULL,
  `heart_rate_AVG` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_health` (`id_health`),
  KEY `id_type_training` (`id_type_training`),
  CONSTRAINT `training_ibfk_1` FOREIGN KEY (`id_health`) REFERENCES `health` (`id`),
  CONSTRAINT `training_ibfk_2` FOREIGN KEY (`id_type_training`) REFERENCES `type_training` (`id`),
  CONSTRAINT `training_chk_1` CHECK ((`km_distance` <= 999.99)),
  CONSTRAINT `training_chk_2` CHECK ((`kcal_active` <= 3000)),
  CONSTRAINT `training_chk_3` CHECK ((`kcal_total` <= 3000)),
  CONSTRAINT `training_chk_4` CHECK ((`steps` <= 100000)),
  CONSTRAINT `training_chk_5` CHECK ((`heart_rate_AVG` <= 500))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training`
--

LOCK TABLES `training` WRITE;
/*!40000 ALTER TABLE `training` DISABLE KEYS */;
/*!40000 ALTER TABLE `training` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_training`
--

DROP TABLE IF EXISTS `type_training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_training` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_training`
--

LOCK TABLES `type_training` WRITE;
/*!40000 ALTER TABLE `type_training` DISABLE KEYS */;
INSERT INTO `type_training` VALUES (1,'Outdoor Running'),(2,'Walking');
/*!40000 ALTER TABLE `type_training` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `user_name` varchar(20) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `password` varchar(64) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `state` enum('0','1','2') COLLATE utf8mb4_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `chk_state` CHECK ((`state` in (_utf8mb4'0',_utf8mb4'1',_utf8mb4'2')))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Juan Felipe Builes','Builes','juan_builes@hotmail.com','$2a$12$n.3M/nuf82ClpN80YqYgTOBNU7lwBRDmIBWNIeOn9bpq1As.o5NGG','1'),(2,'Admin','Admin','juan_builes@hotmail.com','$2a$12$n.3M/nuf82ClpN80YqYgTOBNU7lwBRDmIBWNIeOn9bpq1As.o5NGG','1');
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

-- Dump completed on 2024-11-06 21:13:31
