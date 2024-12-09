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
-- Table structure for table `audith_objetives_day`
--

DROP TABLE IF EXISTS `audith_objetives_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audith_objetives_day` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action` enum('INSERT','UPDATE') COLLATE utf8mb4_spanish2_ci NOT NULL,
  `id_objetives_day` int NOT NULL,
  `old_date` date DEFAULT NULL,
  `new_date` date DEFAULT NULL,
  `old_obj_calories` int DEFAULT NULL,
  `new_obj_calories` int DEFAULT NULL,
  `old_obj_steps` int DEFAULT NULL,
  `new_obj_steps` int DEFAULT NULL,
  `old_obj_moviment` int DEFAULT NULL,
  `new_obj_moviment` int DEFAULT NULL,
  `old_obj_dream` float(5,2) DEFAULT NULL,
  `new_obj_dream` float(5,2) DEFAULT NULL,
  `old_id_user_create` int DEFAULT NULL,
  `new_id_user_create` int DEFAULT NULL,
  `old_create_date` timestamp NULL DEFAULT NULL,
  `new_create_date` timestamp NULL DEFAULT NULL,
  `old_id_user_update` int DEFAULT NULL,
  `new_id_user_update` int DEFAULT NULL,
  `old_update_date` timestamp NULL DEFAULT NULL,
  `new_update_date` timestamp NULL DEFAULT NULL,
  `audit_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_id_objetives_day` (`id_objetives_day`),
  CONSTRAINT `audith_objetives_day_fk_1` FOREIGN KEY (`id_objetives_day`) REFERENCES `objetives_day` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audith_objetives_day`
--

LOCK TABLES `audith_objetives_day` WRITE;
/*!40000 ALTER TABLE `audith_objetives_day` DISABLE KEYS */;
INSERT INTO `audith_objetives_day` VALUES (1,'INSERT',1,NULL,'2024-11-26',NULL,2000,NULL,10000,NULL,150,NULL,7.50,NULL,1,NULL,'2024-11-27 02:16:11',NULL,NULL,NULL,'2024-11-27 02:16:11','2024-11-27 02:16:11'),(2,'UPDATE',1,'2024-11-26','2024-11-26',2000,2200,10000,12000,150,150,7.50,7.50,1,1,'2024-11-27 02:16:11','2024-11-27 02:16:11',NULL,NULL,'2024-11-27 02:16:11','2024-11-27 02:17:05','2024-11-27 02:17:05'),(3,'INSERT',2,NULL,'2024-12-26',NULL,500,NULL,5000,NULL,30,NULL,7.00,NULL,2,NULL,'2024-11-27 02:58:42',NULL,2,NULL,'2024-11-27 02:58:42','2024-11-27 02:58:42'),(4,'UPDATE',2,'2024-12-26','2024-12-26',500,500,5000,5000,30,30,7.00,8.00,2,2,'2024-11-27 02:58:42','2024-11-27 02:58:42',2,1,'2024-11-27 02:58:42','2024-12-06 23:23:04','2024-12-06 23:23:04'),(5,'UPDATE',2,'2024-12-26','2024-12-26',500,500,5000,5000,30,30,8.00,8.00,2,2,'2024-11-27 02:58:42','2024-11-27 02:58:42',1,1,'2024-12-06 23:23:04','2024-12-06 23:23:04','2024-12-07 02:57:38'),(6,'UPDATE',2,'2024-12-26','2024-12-26',500,501,5000,5001,30,31,8.00,7.00,2,2,'2024-11-27 02:58:42','2024-11-27 02:58:42',1,1,'2024-12-06 23:23:04','2024-12-07 02:58:55','2024-12-07 02:58:55'),(7,'UPDATE',2,'2024-12-26','2024-12-26',501,501,5001,5001,31,31,7.00,7.00,2,2,'2024-11-27 02:58:42','2024-11-27 02:58:42',1,1,'2024-12-07 02:58:55','2024-12-07 02:58:55','2024-12-07 02:59:18'),(8,'UPDATE',2,'2024-12-26','2024-12-26',501,500,5001,5000,31,30,7.00,7.00,2,2,'2024-11-27 02:58:42','2024-11-27 02:58:42',1,1,'2024-12-07 02:58:55','2024-12-07 02:59:47','2024-12-07 02:59:47'),(9,'UPDATE',2,'2024-12-26','2024-12-26',500,500,5000,5000,30,30,7.00,7.00,2,2,'2024-11-27 02:58:42','2024-11-27 02:58:42',1,1,'2024-12-07 02:59:47','2024-12-07 02:59:47','2024-12-07 03:07:49');
/*!40000 ALTER TABLE `audith_objetives_day` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cadence`
--

LOCK TABLES `cadence` WRITE;
/*!40000 ALTER TABLE `cadence` DISABLE KEYS */;
INSERT INTO `cadence` VALUES (1,1,112,124);
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
  `REM` time DEFAULT NULL,
  `awake` int DEFAULT NULL,
  `heart_rate` int DEFAULT NULL,
  `total_dream` time DEFAULT NULL,
  `id_health` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dream_health_id_fk` (`id_health`),
  CONSTRAINT `dream_health_id_fk` FOREIGN KEY (`id_health`) REFERENCES `health` (`id`),
  CONSTRAINT `dream_chk_1` CHECK ((`awake` <= 24)),
  CONSTRAINT `dream_chk_2` CHECK ((`heart_rate` <= 300))
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dream`
--

LOCK TABLES `dream` WRITE;
/*!40000 ALTER TABLE `dream` DISABLE KEYS */;
INSERT INTO `dream` VALUES (1,'05:45:00','03:39:00','01:56:00',2,61,'11:20:00',1),(2,'01:59:00','01:25:00','01:08:00',0,60,'04:32:00',3),(3,'03:06:00','01:58:00','01:08:00',0,61,'06:12:00',4),(4,'02:30:00','01:59:00','01:40:00',1,61,'06:09:00',5),(5,'00:00:00','00:00:00','00:00:00',0,0,'00:00:00',6),(6,'03:19:00','02:22:00','01:43:00',2,63,'07:24:00',7),(7,'00:00:00','00:00:00','00:00:00',0,0,'00:00:00',8),(8,'00:00:00','00:00:00','00:00:00',0,0,'00:00:00',2),(9,'03:09:00','01:50:00','01:51:00',1,62,'06:50:00',9),(10,'00:00:00','00:00:00','00:00:00',0,0,'02:17:00',10),(11,'03:37:00','02:13:00','00:51:00',1,61,'06:41:00',11),(13,'00:00:00','00:00:00','00:00:00',0,0,'00:00:00',12),(14,'01:39:00','01:03:00','00:33:00',0,60,'03:15:00',13),(15,'03:17:00','02:38:00','01:36:00',0,59,'07:31:00',14),(16,'02:34:00','02:12:00','01:18:00',3,62,'06:04:00',15);
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
  `in_training` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `health`
--

LOCK TABLES `health` WRITE;
/*!40000 ALTER TABLE `health` DISABLE KEYS */;
INSERT INTO `health` VALUES (1,'2024-11-23',759,6835,4.47,57,'0',1,'2024-11-24 05:39:48',1,'2024-11-24 05:39:48'),(2,'2024-11-24',1024,6083,3.99,36,'0',2,'2024-11-25 05:52:13',2,'2024-11-25 05:52:13'),(3,'2024-11-25',1499,12814,8.39,94,'0',1,'2024-11-26 03:56:41',1,'2024-11-26 03:56:41'),(4,'2024-11-26',1333,4399,2.88,23,'0',1,'2024-12-02 03:13:39',1,'2024-12-02 03:13:39'),(5,'2024-11-27',1321,8985,5.89,61,'0',1,'2024-12-02 03:14:44',1,'2024-12-05 03:25:38'),(6,'2024-11-28',1266,4198,2.75,8,'0',1,'2024-12-02 03:16:32',1,'2024-12-02 03:16:32'),(7,'2024-11-29',507,2321,1.51,8,'0',1,'2024-12-02 03:18:20',1,'2024-12-02 03:18:20'),(8,'2024-11-30',914,9969,6.53,62,'0',1,'2024-12-02 03:18:58',1,'2024-12-02 03:18:58'),(9,'2024-12-01',587,884,0.58,3,'0',1,'2024-12-05 03:06:35',1,'2024-12-05 03:06:35'),(10,'2024-12-02',1557,14294,9.36,95,'0',1,'2024-12-05 03:07:26',1,'2024-12-05 03:07:26'),(11,'2024-12-03',1363,9250,6.06,57,'0',1,'2024-12-05 03:08:17',1,'2024-12-05 03:08:17'),(12,'2024-12-04',796,2886,1.89,12,'0',1,'2024-12-09 01:44:25',1,'2024-12-09 01:44:25'),(13,'2024-12-05',1381,5180,3.39,27,'0',1,'2024-12-09 01:45:12',1,'2024-12-09 01:45:12'),(14,'2024-12-06',1325,4383,2.87,31,'0',1,'2024-12-09 01:45:56',1,'2024-12-09 01:45:56'),(15,'2024-12-07',1668,16236,13.76,145,'1',1,'2024-12-09 01:46:49',1,'2024-12-09 01:46:49');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heart_rate`
--

LOCK TABLES `heart_rate` WRITE;
/*!40000 ALTER TABLE `heart_rate` DISABLE KEYS */;
INSERT INTO `heart_rate` VALUES (1,1,114,139,'00:47:42','01:12:40','00:02:46','00:00:00','00:00:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objetives_day`
--

LOCK TABLES `objetives_day` WRITE;
/*!40000 ALTER TABLE `objetives_day` DISABLE KEYS */;
INSERT INTO `objetives_day` VALUES (1,'2024-11-26',2200,12000,150,7.50,1,'2024-11-27 02:16:11',NULL,'2024-11-27 02:17:05'),(2,'2024-12-26',500,5000,30,7.00,2,'2024-11-27 02:58:42',1,'2024-12-07 02:59:47');
/*!40000 ALTER TABLE `objetives_day` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trg_audit_insert_objetives_day` AFTER INSERT ON `objetives_day` FOR EACH ROW BEGIN
  INSERT INTO `audith_objetives_day` (
    `action`, `id_objetives_day`,
    `old_date`, `new_date`,
    `old_obj_calories`, `new_obj_calories`,
    `old_obj_steps`, `new_obj_steps`,
    `old_obj_moviment`, `new_obj_moviment`,
    `old_obj_dream`, `new_obj_dream`,
    `old_id_user_create`, `new_id_user_create`,
    `old_create_date`, `new_create_date`,
    `old_id_user_update`, `new_id_user_update`,
    `old_update_date`, `new_update_date`
  )
  VALUES (
    'INSERT', NEW.id,
    NULL, NEW.date,
    NULL, NEW.obj_calories,
    NULL, NEW.obj_steps,
    NULL, NEW.obj_moviment,
    NULL, NEW.obj_dream,
    NULL, NEW.id_user_create,
    NULL, NEW.create_date,
    NULL, NEW.id_user_update,
    NULL, NEW.update_date
  );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trg_audit_update_objetives_day` AFTER UPDATE ON `objetives_day` FOR EACH ROW BEGIN
  INSERT INTO `audith_objetives_day` (
    `action`, `id_objetives_day`,
    `old_date`, `new_date`,
    `old_obj_calories`, `new_obj_calories`,
    `old_obj_steps`, `new_obj_steps`,
    `old_obj_moviment`, `new_obj_moviment`,
    `old_obj_dream`, `new_obj_dream`,
    `old_id_user_create`, `new_id_user_create`,
    `old_create_date`, `new_create_date`,
    `old_id_user_update`, `new_id_user_update`,
    `old_update_date`, `new_update_date`
  )
  VALUES (
    'UPDATE', OLD.id,
    OLD.date, NEW.date,
    OLD.obj_calories, NEW.obj_calories,
    OLD.obj_steps, NEW.obj_steps,
    OLD.obj_moviment, NEW.obj_moviment,
    OLD.obj_dream, NEW.obj_dream,
    OLD.id_user_create, NEW.id_user_create,
    OLD.create_date, NEW.create_date,
    OLD.id_user_update, NEW.id_user_update,
    OLD.update_date, NEW.update_date
  );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pace`
--

LOCK TABLES `pace` WRITE;
/*!40000 ALTER TABLE `pace` DISABLE KEYS */;
INSERT INTO `pace` VALUES (1,1,'02:03:13','00:07:28');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pace_for_km`
--

LOCK TABLES `pace_for_km` WRITE;
/*!40000 ALTER TABLE `pace_for_km` DISABLE KEYS */;
INSERT INTO `pace_for_km` VALUES (1,1,1,'00:10:15'),(2,1,2,'00:09:54'),(3,1,3,'00:09:50'),(4,1,4,'00:09:57'),(5,1,5,'00:09:27'),(6,1,6,'00:09:55'),(7,1,7,'00:10:41'),(8,1,8,'00:09:16'),(9,1,9,'00:10:27'),(10,1,10,'00:10:06'),(11,1,11,'00:10:17'),(12,1,12,'00:10:53');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stride_cm`
--

LOCK TABLES `stride_cm` WRITE;
/*!40000 ALTER TABLE `stride_cm` DISABLE KEYS */;
INSERT INTO `stride_cm` VALUES (1,1,88,126);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training`
--

LOCK TABLES `training` WRITE;
/*!40000 ALTER TABLE `training` DISABLE KEYS */;
INSERT INTO `training` VALUES (1,15,2,12.81,989,1225,'10:06:00',13813,114);
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
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
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
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `state` enum('0','1','2','3') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `chk_state` CHECK ((`state` in (_utf8mb4'0',_utf8mb4'1',_utf8mb4'2',_utf8mb4'3')))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Juan Builes','Builes','juan_builes@hotmail.com','$2a$12$n.3M/nuf82ClpN80YqYgTOBNU7lwBRDmIBWNIeOn9bpq1As.o5NGG','1'),(2,'admin','Admin','juan_builes@hotmail.com','$2b$12$O49PN6.ZKA1GoatHxy.s2OGz4kpCHn2IcvtWwDgpuljY0A8NiDicS','1'),(3,'Jaun','buileS','elpinchepastel@gmail.com','$2b$12$0mUXnkvhXBY..yvZ11G83OfWQ8Mlv8uLXcGmJADvl8x8KhO4YzaBG','3');
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

-- Dump completed on 2024-12-09  2:16:18
