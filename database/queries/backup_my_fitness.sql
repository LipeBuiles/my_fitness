-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mySQL
-- Generation Time: Apr 23, 2025 at 02:13 AM
-- Server version: 9.1.0
-- PHP Version: 8.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_fitness`
--
CREATE DATABASE IF NOT EXISTS `my_fitness` DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci;
USE `my_fitness`;

-- --------------------------------------------------------

--
-- Table structure for table `audith_objetives_day`
--

CREATE TABLE `audith_objetives_day` (
  `id` int NOT NULL,
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
  `audit_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cadence`
--

CREATE TABLE `cadence` (
  `id` int NOT NULL,
  `id_training` int DEFAULT NULL,
  `cadence_AVG` int DEFAULT NULL,
  `cadence_max` int DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `dream`
--

CREATE TABLE `dream` (
  `id` int NOT NULL,
  `ligth` time DEFAULT NULL,
  `deep` time DEFAULT NULL,
  `REM` time DEFAULT NULL,
  `awake` int DEFAULT NULL,
  `heart_rate` int DEFAULT NULL,
  `total_dream` time DEFAULT NULL,
  `id_health` int DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `health`
--

CREATE TABLE `health` (
  `id` int NOT NULL,
  `date` date DEFAULT NULL,
  `calories` int DEFAULT NULL,
  `steps` int DEFAULT NULL,
  `distance` float(5,2) DEFAULT NULL,
  `moviment` int DEFAULT NULL,
  `in_training` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `id_user_create` int DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_user_update` int DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ;

--
-- Dumping data for table `health`
--

INSERT INTO `health` (`id`, `date`, `calories`, `steps`, `distance`, `moviment`, `in_training`, `id_user_create`, `create_date`, `id_user_update`, `update_date`) VALUES
(1, '2025-04-07', 992, 2978, 1.95, 8, '0', 1, '2025-04-09 02:28:16', 1, '2025-04-09 02:55:03'),
(2, '2025-04-08', 995, 3172, 2.07, 8, '0', 1, '2025-04-11 04:59:01', 1, '2025-04-11 04:59:01'),
(3, '2025-04-09', 1061, 2831, 1.85, 6, '0', 1, '2025-04-11 05:02:41', 1, '2025-04-11 05:05:54'),
(4, '2025-04-21', 1039, 4081, 2.67, 15, '0', 1, '2025-04-23 00:45:41', 1, '2025-04-23 00:45:41');

-- --------------------------------------------------------

--
-- Table structure for table `heart_rate`
--

CREATE TABLE `heart_rate` (
  `id` int NOT NULL,
  `id_training` int DEFAULT NULL,
  `heart_rate_AVG` int DEFAULT NULL,
  `heart_rate_max` int DEFAULT NULL,
  `ligth_pace` time DEFAULT NULL,
  `intensive_pace` time DEFAULT NULL,
  `aerobic_pace` time DEFAULT NULL,
  `anaerobic_pace` time DEFAULT NULL,
  `vo2_max` time DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `objetives_day`
--

CREATE TABLE `objetives_day` (
  `id` int NOT NULL,
  `date` date DEFAULT NULL,
  `obj_calories` int DEFAULT NULL,
  `obj_steps` int DEFAULT NULL,
  `obj_moviment` int DEFAULT NULL,
  `obj_dream` float(5,2) DEFAULT NULL,
  `id_user_create` int DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_user_update` int DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ;

--
-- Triggers `objetives_day`
--
DELIMITER $$
CREATE TRIGGER `trg_audit_insert_objetives_day` AFTER INSERT ON `objetives_day` FOR EACH ROW BEGIN
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
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_audit_update_objetives_day` AFTER UPDATE ON `objetives_day` FOR EACH ROW BEGIN
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
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pace`
--

CREATE TABLE `pace` (
  `id` int NOT NULL,
  `id_training` int DEFAULT NULL,
  `pace` time DEFAULT NULL,
  `pace_max` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pace_for_km`
--

CREATE TABLE `pace_for_km` (
  `id` int NOT NULL,
  `id_training` int DEFAULT NULL,
  `km` int DEFAULT NULL,
  `pace` time DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `stride_cm`
--

CREATE TABLE `stride_cm` (
  `id` int NOT NULL,
  `id_training` int DEFAULT NULL,
  `stride_AVG` int DEFAULT NULL,
  `stride_max` int DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `training`
--

CREATE TABLE `training` (
  `id` int NOT NULL,
  `id_health` int DEFAULT NULL,
  `id_type_training` int DEFAULT NULL,
  `km_distance` float(5,2) DEFAULT NULL,
  `kcal_active` int DEFAULT NULL,
  `kcal_total` int DEFAULT NULL,
  `pace` time DEFAULT NULL,
  `steps` int DEFAULT NULL,
  `heart_rate_AVG` int DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `type_training`
--

CREATE TABLE `type_training` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `state` enum('0','1','2','3') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL
) ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `user_name`, `email`, `password`, `state`) VALUES
(1, 'Juan Builes', 'Builes', 'juan_builes@hotmail.com', '$2b$12$XX6m6l9ikXyZlwTeFP70/.HmIvkvcUkYLoGOPnqvyMdTz/jLTxvCS', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audith_objetives_day`
--
ALTER TABLE `audith_objetives_day`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_objetives_day` (`id_objetives_day`);

--
-- Indexes for table `cadence`
--
ALTER TABLE `cadence`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cadence_ibfk_1` (`id_training`);

--
-- Indexes for table `dream`
--
ALTER TABLE `dream`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dream_health_id_fk` (`id_health`);

--
-- Indexes for table `health`
--
ALTER TABLE `health`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user_create` (`id_user_create`),
  ADD KEY `id_user_update` (`id_user_update`);

--
-- Indexes for table `heart_rate`
--
ALTER TABLE `heart_rate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `heart_rate_training_training_id_fk` (`id_training`);

--
-- Indexes for table `objetives_day`
--
ALTER TABLE `objetives_day`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_create` (`id_user_create`),
  ADD KEY `user_update` (`id_user_update`);

--
-- Indexes for table `pace`
--
ALTER TABLE `pace`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_training` (`id_training`);

--
-- Indexes for table `pace_for_km`
--
ALTER TABLE `pace_for_km`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_training` (`id_training`);

--
-- Indexes for table `stride_cm`
--
ALTER TABLE `stride_cm`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_training` (`id_training`);

--
-- Indexes for table `training`
--
ALTER TABLE `training`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_health` (`id_health`),
  ADD KEY `id_type_training` (`id_type_training`);

--
-- Indexes for table `type_training`
--
ALTER TABLE `type_training`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audith_objetives_day`
--
ALTER TABLE `audith_objetives_day`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cadence`
--
ALTER TABLE `cadence`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dream`
--
ALTER TABLE `dream`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `health`
--
ALTER TABLE `health`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `heart_rate`
--
ALTER TABLE `heart_rate`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `objetives_day`
--
ALTER TABLE `objetives_day`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pace`
--
ALTER TABLE `pace`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pace_for_km`
--
ALTER TABLE `pace_for_km`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stride_cm`
--
ALTER TABLE `stride_cm`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `training`
--
ALTER TABLE `training`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `type_training`
--
ALTER TABLE `type_training`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `audith_objetives_day`
--
ALTER TABLE `audith_objetives_day`
  ADD CONSTRAINT `audith_objetives_day_fk_1` FOREIGN KEY (`id_objetives_day`) REFERENCES `objetives_day` (`id`);

--
-- Constraints for table `cadence`
--
ALTER TABLE `cadence`
  ADD CONSTRAINT `cadence_ibfk_1` FOREIGN KEY (`id_training`) REFERENCES `training` (`id`);

--
-- Constraints for table `dream`
--
ALTER TABLE `dream`
  ADD CONSTRAINT `dream_health_id_fk` FOREIGN KEY (`id_health`) REFERENCES `health` (`id`);

--
-- Constraints for table `health`
--
ALTER TABLE `health`
  ADD CONSTRAINT `health_ibfk_1` FOREIGN KEY (`id_user_create`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `health_ibfk_2` FOREIGN KEY (`id_user_update`) REFERENCES `users` (`id`);

--
-- Constraints for table `heart_rate`
--
ALTER TABLE `heart_rate`
  ADD CONSTRAINT `heart_rate_training_training_id_fk` FOREIGN KEY (`id_training`) REFERENCES `training` (`id`);

--
-- Constraints for table `objetives_day`
--
ALTER TABLE `objetives_day`
  ADD CONSTRAINT `objetives_day_ibfk_1` FOREIGN KEY (`id_user_create`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `objetives_day_ibfk_2` FOREIGN KEY (`id_user_update`) REFERENCES `users` (`id`);

--
-- Constraints for table `pace`
--
ALTER TABLE `pace`
  ADD CONSTRAINT `pace_ibfk_1` FOREIGN KEY (`id_training`) REFERENCES `training` (`id`);

--
-- Constraints for table `pace_for_km`
--
ALTER TABLE `pace_for_km`
  ADD CONSTRAINT `pace_for_km_ibfk_1` FOREIGN KEY (`id_training`) REFERENCES `training` (`id`);

--
-- Constraints for table `stride_cm`
--
ALTER TABLE `stride_cm`
  ADD CONSTRAINT `stride_cm_ibfk_1` FOREIGN KEY (`id_training`) REFERENCES `training` (`id`);

--
-- Constraints for table `training`
--
ALTER TABLE `training`
  ADD CONSTRAINT `training_ibfk_1` FOREIGN KEY (`id_health`) REFERENCES `health` (`id`),
  ADD CONSTRAINT `training_ibfk_2` FOREIGN KEY (`id_type_training`) REFERENCES `type_training` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
