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
  `action` enum('INSERT','UPDATE') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audith_objetives_day`
--

LOCK TABLES `audith_objetives_day` WRITE;
/*!40000 ALTER TABLE `audith_objetives_day` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cadence`
--

LOCK TABLES `cadence` WRITE;
/*!40000 ALTER TABLE `cadence` DISABLE KEYS */;
INSERT INTO `cadence` VALUES (1,1,166,171),(2,2,158,175);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `health`
--

LOCK TABLES `health` WRITE;
/*!40000 ALTER TABLE `health` DISABLE KEYS */;
INSERT INTO `health` VALUES (1,'2024-02-10',1464,11566,9.51,64,'1',1,'2025-02-12 02:22:17',1,'2025-02-12 02:22:17'),(2,'2024-02-02',1592,17864,14.01,114,'1',1,'2025-02-12 02:38:23',1,'2025-02-12 02:41:42');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heart_rate`
--

LOCK TABLES `heart_rate` WRITE;
/*!40000 ALTER TABLE `heart_rate` DISABLE KEYS */;
INSERT INTO `heart_rate` VALUES (1,1,150,177,'00:01:38','00:04:38','00:03:51','00:09:28','00:08:19'),(2,2,162,173,'00:00:00','00:00:37','00:01:06','00:29:21','00:04:14');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pace`
--

LOCK TABLES `pace` WRITE;
/*!40000 ALTER TABLE `pace` DISABLE KEYS */;
INSERT INTO `pace` VALUES (1,1,'00:05:38','00:05:34'),(2,2,'00:05:55','00:02:19');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pace_for_km`
--

LOCK TABLES `pace_for_km` WRITE;
/*!40000 ALTER TABLE `pace_for_km` DISABLE KEYS */;
INSERT INTO `pace_for_km` VALUES (1,1,1,'00:05:31'),(2,1,2,'00:05:36'),(3,1,3,'00:05:29'),(4,1,4,'00:05:45'),(5,1,5,'00:05:48'),(6,2,1,'00:05:48'),(7,2,2,'00:06:00'),(8,2,3,'00:05:59'),(9,2,4,'00:05:57'),(10,2,5,'00:05:49'),(11,2,6,'00:05:53');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stride_cm`
--

LOCK TABLES `stride_cm` WRITE;
/*!40000 ALTER TABLE `stride_cm` DISABLE KEYS */;
INSERT INTO `stride_cm` VALUES (1,1,106,190),(2,2,158,175);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training`
--

LOCK TABLES `training` WRITE;
/*!40000 ALTER TABLE `training` DISABLE KEYS */;
INSERT INTO `training` VALUES (1,1,1,5.00,360,414,'00:05:38',4695,150),(2,2,1,6.00,523,592,'00:05:55',5650,162);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_training`
--

LOCK TABLES `type_training` WRITE;
/*!40000 ALTER TABLE `type_training` DISABLE KEYS */;
INSERT INTO `type_training` VALUES (1,'Correr al aire libre');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Juan Builes','Builes','juan_builes@hotmail.com','$2b$12$XX6m6l9ikXyZlwTeFP70/.HmIvkvcUkYLoGOPnqvyMdTz/jLTxvCS','1'),(2,'Administrador','Admin','juan_builes@hotmail.com','$2b$12$O49PN6.ZKA1GoatHxy.s2OGz4kpCHn2IcvtWwDgpuljY0A8NiDicS','1'),(3,'Jaun','buileS','elpinchepastel@gmail.com','$2b$12$0mUXnkvhXBY..yvZ11G83OfWQ8Mlv8uLXcGmJADvl8x8KhO4YzaBG','2'),(4,'111111','dododjdopjdpdd','dijdopijd','$2b$12$gdCuAxq5n2mhmOFjrWNz/OxLkLDszaqMVPqd2cWbn.L9usQvW0omS','3'),(5,'klcjkldfj','djniod','niodhjd','$2b$12$.jc3Vg/LXDXfbC0muYW64O3oPNotELOU2jfSJaWLyrrRkHwi2n2be','3'),(6,'ddddddd','dddddd','juan_builes@hotmail.com','$2b$12$vF8vQv6785WzTyYMB4I85O/2.Up6ElTliD1JAgCRuBg3n6W1GPoCS','3'),(7,'Erick Alarcon','Erick','erick@gmail.com','$2b$12$AK2.w81BWw.8Op/WuqbzDeeHTF1Vxnaz05vsHKlKZk2PzZnzv9AS2','0'),(8,'Borrame','borrame@gmail.com','borrame@gmail.com','$2b$12$48FjJclsb6IZr4.q0z.kMupO93Lnbz9jHQPlPb6rS0Rz14hXnnbO.','0'),(9,'dddd','ddd','dddd@gmail.com','$2b$12$c/PAIkVTdNJ4MEuRcC58Aedvpi9MyRqoU1DM9eGqPt.Z7dR0eu6U2','0');
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

-- Dump completed on 2025-02-24 19:04:42
