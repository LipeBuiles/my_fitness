-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: my_fitness_mysql
-- Generation Time: Jul 03, 2025 at 02:31 AM
-- Server version: 8.4.5
-- PHP Version: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_fitness_db`
--

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

--
-- Dumping data for table `audith_objetives_day`
--

INSERT INTO `audith_objetives_day` (`id`, `action`, `id_objetives_day`, `old_date`, `new_date`, `old_obj_calories`, `new_obj_calories`, `old_obj_steps`, `new_obj_steps`, `old_obj_moviment`, `new_obj_moviment`, `old_obj_dream`, `new_obj_dream`, `old_id_user_create`, `new_id_user_create`, `old_create_date`, `new_create_date`, `old_id_user_update`, `new_id_user_update`, `old_update_date`, `new_update_date`, `audit_date`) VALUES
(1, 'INSERT', 1, NULL, '2025-04-24', NULL, 500, NULL, 5000, NULL, 30, NULL, 7.00, NULL, 1, NULL, '2025-04-25 02:43:42', NULL, 1, NULL, '2025-04-25 02:43:42', '2025-04-25 02:43:42'),
(2, 'UPDATE', 1, '2025-04-24', '2025-04-24', 500, 1000, 5000, 5000, 30, 30, 7.00, 7.00, 1, 1, '2025-04-25 02:43:42', '2025-04-25 02:43:42', 1, 1, '2025-04-25 02:43:42', '2025-04-28 18:59:18', '2025-04-28 18:59:18');

-- --------------------------------------------------------

--
-- Table structure for table `cadence`
--

CREATE TABLE `cadence` (
  `id` int NOT NULL,
  `id_training` int DEFAULT NULL,
  `cadence_AVG` int DEFAULT NULL,
  `cadence_max` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cadence`
--

INSERT INTO `cadence` (`id`, `id_training`, `cadence_AVG`, `cadence_max`) VALUES
(1, 1, 102, 146),
(2, 2, 0, 0),
(3, 3, 0, 0),
(5, 5, 0, 0),
(6, 6, 0, 0),
(7, 7, 0, 0),
(8, 8, 157, 175),
(9, 9, 111, 139),
(10, 10, 156, 167),
(11, 11, 109, 124);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dream`
--

INSERT INTO `dream` (`id`, `ligth`, `deep`, `REM`, `awake`, `heart_rate`, `total_dream`, `id_health`) VALUES
(1, '00:03:09', '02:28:00', '01:09:00', 5, 59, '06:46:00', 32),
(2, '02:06:00', '01:01:00', '00:43:00', 1, 61, '03:50:00', 33),
(3, '02:44:00', '02:24:00', '01:55:00', 1, 61, '07:03:00', 34);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `health`
--

INSERT INTO `health` (`id`, `date`, `calories`, `steps`, `distance`, `moviment`, `in_training`, `id_user_create`, `create_date`, `id_user_update`, `update_date`) VALUES
(1, '2025-04-07', 992, 2978, 1.95, 8, '0', 1, '2025-04-09 02:28:16', 1, '2025-04-09 02:55:03'),
(2, '2025-04-08', 995, 3172, 2.07, 8, '0', 1, '2025-04-11 04:59:01', 1, '2025-04-11 04:59:01'),
(3, '2025-04-09', 1061, 2831, 1.85, 6, '0', 1, '2025-04-11 05:02:41', 1, '2025-04-11 05:05:54'),
(4, '2025-04-21', 1039, 4081, 2.67, 15, '0', 1, '2025-04-23 00:45:41', 1, '2025-04-23 00:45:41'),
(5, '2025-04-23', 869, 1909, 1.25, 6, '0', 2, '2025-04-25 02:32:28', 2, '2025-04-25 02:32:28'),
(6, '2025-04-27', 527, 2925, 1.92, 18, '0', 1, '2025-04-28 18:41:32', 1, '2025-04-29 01:32:08'),
(7, '2025-04-26', 852, 3216, 2.11, 26, '0', 1, '2025-04-28 18:43:15', 1, '2025-04-28 18:43:15'),
(8, '2025-04-25', 885, 2471, 1.61, 7, '0', 1, '2025-04-28 18:46:28', 1, '2025-04-28 18:48:22'),
(9, '2025-04-24', 1433, 11927, 8.68, 92, '1', 1, '2025-04-28 18:51:04', 1, '2025-04-28 22:21:14'),
(10, '2025-04-22', 1012, 2907, 1.90, 10, '0', 1, '2025-04-28 22:23:09', 1, '2025-04-28 22:29:11'),
(11, '2025-04-20', 1391, 6166, 1.87, 32, '1', 1, '2025-04-28 22:30:49', 1, '2025-04-28 22:30:49'),
(12, '2025-04-19', 1055, 11617, 7.60, 88, '0', 1, '2025-04-28 22:43:27', 1, '2025-04-28 22:43:27'),
(13, '2025-04-18', 868, 8435, 1.94, 55, '1', 1, '2025-04-29 01:12:54', 1, '2025-04-29 01:12:54'),
(14, '2025-04-17', 585, 1684, 1.08, 8, '0', 1, '2025-04-29 01:21:44', 1, '2025-04-29 01:26:31'),
(17, '2025-04-30', 1424, 6303, 2.70, 27, '1', 1, '2025-05-03 02:06:32', 1, '2025-05-03 02:27:28'),
(18, '2025-04-29', 1660, 7381, 2.50, 27, '1', 1, '2025-05-03 02:13:00', 1, '2025-05-03 02:13:00'),
(19, '2025-04-28', 1239, 6089, 2.50, 27, '1', 1, '2025-05-03 02:19:15', 1, '2025-05-03 02:19:15'),
(30, '2025-04-16', 1726, 15686, 12.25, 87, '1', 1, '2025-05-10 03:32:08', 1, '2025-05-10 03:32:08'),
(31, '2025-05-15', 1323, 9557, 6.72, 77, '1', 1, '2025-05-24 03:24:42', 1, '2025-05-24 03:24:42'),
(32, '2025-06-29', 1749, 19669, 16.16, 143, '1', 1, '2025-07-01 05:53:12', 1, '2025-07-01 05:53:12'),
(33, '2025-07-01', 1006, 3196, 2.09, 2, '0', 1, '2025-07-02 23:59:59', 1, '2025-07-02 23:59:59'),
(34, '2025-06-30', 985, 7222, 4.73, 36, '0', 1, '2025-07-03 00:41:04', 1, '2025-07-03 00:41:04'),
(35, '2025-06-28', 794, 4567, 2.99, 25, '0', 1, '2025-07-03 01:12:38', 1, '2025-07-03 01:12:38'),
(36, '2025-06-27', 914, 4264, 2.79, 13, '0', 1, '2025-07-03 01:13:18', 1, '2025-07-03 01:13:18'),
(37, '2025-06-26', 1550, 12172, 9.76, 28, '1', 1, '2025-07-03 01:14:26', 1, '2025-07-03 01:14:26'),
(38, '2025-06-25', 1305, 3520, 2.30, 10, '0', 1, '2025-07-03 01:19:53', 1, '2025-07-03 01:19:53'),
(39, '2025-06-24', 776, 2370, 1.55, 13, '0', 1, '2025-07-03 01:20:35', 1, '2025-07-03 01:20:35'),
(40, '2025-06-23', 553, 1458, 0.95, 4, '0', 1, '2025-07-03 01:21:11', 1, '2025-07-03 01:21:11'),
(41, '2025-06-22', 723, 2866, 1.87, 10, '0', 1, '2025-07-03 01:21:56', 1, '2025-07-03 01:21:56'),
(42, '2025-06-21', 753, 4343, 2.84, 22, '0', 1, '2025-07-03 01:23:02', 1, '2025-07-03 01:23:02'),
(43, '2025-06-20', 727, 2604, 1.71, 9, '0', 1, '2025-07-03 01:23:44', 1, '2025-07-03 01:23:44'),
(44, '2025-06-19', 1112, 4657, 2.98, 24, '0', 1, '2025-07-03 01:24:53', 1, '2025-07-03 01:29:55'),
(45, '2025-06-17', 824, 2798, 1.83, 16, '0', 1, '2025-07-03 01:28:40', 1, '2025-07-03 01:46:01'),
(46, '2025-06-18', 1280, 4454, 2.92, 18, '0', 1, '2025-07-03 01:30:19', 1, '2025-07-03 01:46:01'),
(47, '2025-06-16', 1071, 4685, 3.07, 17, '0', 1, '2025-07-03 01:31:14', 1, '2025-07-03 01:46:01'),
(49, '2025-06-15', 591, 2288, 1.50, 10, '0', 1, '2025-07-03 01:32:10', 1, '2025-07-03 01:46:01'),
(50, '2025-06-14', 653, 1959, 1.28, 7, '0', 1, '2025-07-03 01:32:44', 1, '2025-07-03 01:46:01'),
(51, '2025-06-13', 1153, 4075, 2.67, 12, '0', 1, '2025-07-03 01:33:10', 1, '2025-07-03 01:46:01'),
(52, '2025-06-12', 833, 8477, 5.54, 45, '0', 1, '2025-07-03 01:33:45', 1, '2025-07-03 01:46:01'),
(53, '2025-06-11', 1114, 3155, 2.07, 16, '0', 1, '2025-07-03 01:34:12', 1, '2025-07-03 01:46:01'),
(54, '2025-06-10', 1116, 3549, 2.33, 12, '0', 1, '2025-07-03 01:34:40', 1, '2025-07-03 01:46:01'),
(55, '2025-06-09', 1047, 2931, 1.91, 4, '0', 1, '2025-07-03 01:35:09', 1, '2025-07-03 01:46:01'),
(57, '2025-06-08', 795, 4624, 3.01, 29, '0', 1, '2025-07-03 01:37:31', 1, '2025-07-03 01:46:01'),
(58, '2025-06-07', 857, 10309, 6.75, 80, '0', 1, '2025-07-03 01:39:16', 1, '2025-07-03 01:46:01'),
(59, '2025-06-06', 970, 2738, 1.79, 9, '0', 1, '2025-07-03 01:39:47', 1, '2025-07-03 01:46:01'),
(60, '2025-06-05', 1074, 8972, 5.87, 67, '0', 1, '2025-07-03 01:40:15', 1, '2025-07-03 02:28:07'),
(61, '2025-06-04', 887, 2534, 1.66, 11, '0', 1, '2025-07-03 01:41:04', 1, '2025-07-03 01:46:01'),
(62, '2025-06-03', 563, 1728, 1.13, 2, '0', 1, '2025-07-03 01:41:29', 1, '2025-07-03 01:46:01'),
(63, '2025-06-02', 0, 0, 0.00, 0, '0', 1, '2025-07-03 01:41:48', 1, '2025-07-03 01:41:48'),
(64, '2025-06-01', 0, 0, 0.00, 0, '0', 1, '2025-07-03 01:42:14', 1, '2025-07-03 01:46:01');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `heart_rate`
--

INSERT INTO `heart_rate` (`id`, `id_training`, `heart_rate_AVG`, `heart_rate_max`, `ligth_pace`, `intensive_pace`, `aerobic_pace`, `anaerobic_pace`, `vo2_max`) VALUES
(1, 1, 107, 145, '00:56:09', '00:24:27', '00:01:56', '00:00:00', '00:00:00'),
(2, 2, 97, 131, '00:43:09', '00:01:53', '00:00:01', '00:00:00', '00:00:00'),
(3, 3, 111, 172, '00:39:09', '00:11:54', '00:06:00', '00:00:51', '00:00:15'),
(5, 5, 92, 142, '00:19:47', '00:03:07', '00:00:49', '00:00:00', '00:00:00'),
(6, 6, 98, 133, '00:59:00', '00:02:08', '00:00:05', '00:00:00', '00:00:00'),
(7, 7, 102, 163, '00:24:02', '00:03:50', '00:06:44', '00:01:29', '00:00:00'),
(8, 8, 131, 153, '00:12:39', '00:08:02', '00:37:20', '00:01:38', '00:00:00'),
(9, 9, 114, 137, '00:23:21', '00:23:40', '00:02:09', '00:00:00', '00:00:00'),
(10, 10, 168, 179, '00:00:00', '00:00:21', '00:01:13', '00:24:05', '00:40:50'),
(11, 11, 115, 137, '00:26:25', '00:45:06', '00:02:42', '00:00:00', '00:00:00');

-- --------------------------------------------------------

--
-- Stand-in structure for view `monthly_training_health_summary`
-- (See below for the actual view)
--
CREATE TABLE `monthly_training_health_summary` (
`month` varchar(7)
,`training_type` varchar(50)
,`trainings_count_per_day` decimal(42,0)
,`total_km_distance` double(19,2)
,`avg_km_distance` double(27,10)
,`total_kcal_active` decimal(54,0)
,`avg_kcal_active` decimal(18,8)
,`total_kcal_total` decimal(54,0)
,`avg_kcal_total` decimal(18,8)
,`avg_pace` time(6)
,`total_training_steps` decimal(54,0)
,`avg_training_steps` decimal(18,8)
,`avg_heart_rate` decimal(18,8)
,`total_health_calories` decimal(54,0)
,`total_health_steps` decimal(54,0)
,`total_health_distance` double(19,2)
,`avg_moviment` decimal(18,8)
);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `objetives_day`
--

INSERT INTO `objetives_day` (`id`, `date`, `obj_calories`, `obj_steps`, `obj_moviment`, `obj_dream`, `id_user_create`, `create_date`, `id_user_update`, `update_date`) VALUES
(1, '2025-04-24', 1000, 5000, 30, 7.00, 1, '2025-04-25 02:43:42', 1, '2025-04-28 18:59:18');

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

--
-- Dumping data for table `pace`
--

INSERT INTO `pace` (`id`, `id_training`, `pace`, `pace_max`) VALUES
(1, 1, '00:13:00', '00:10:30'),
(2, 2, '00:00:00', '00:00:00'),
(3, 3, '00:00:00', '00:00:00'),
(5, 5, '00:00:00', '00:00:00'),
(6, 6, '00:00:00', '00:00:00'),
(7, 7, '00:00:00', '00:00:00'),
(8, 8, '00:07:19', '00:06:14'),
(9, 9, '00:12:03', '00:07:23'),
(10, 10, '00:06:33', '00:04:07'),
(11, 11, '00:10:19', '00:06:35');

-- --------------------------------------------------------

--
-- Table structure for table `pace_for_km`
--

CREATE TABLE `pace_for_km` (
  `id` int NOT NULL,
  `id_training` int DEFAULT NULL,
  `km` int DEFAULT NULL,
  `pace` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pace_for_km`
--

INSERT INTO `pace_for_km` (`id`, `id_training`, `km`, `pace`) VALUES
(1, 1, 1, '00:13:58'),
(2, 1, 2, '00:11:50'),
(3, 1, 3, '00:12:55'),
(4, 1, 4, '00:11:28'),
(5, 1, 5, '00:11:54'),
(6, 1, 6, '00:11:47'),
(7, 1, 7, '00:17:14'),
(9, 8, 1, '00:06:28'),
(10, 8, 2, '00:06:15'),
(11, 8, 3, '00:06:27'),
(12, 8, 4, '00:06:59'),
(13, 8, 5, '00:08:07'),
(14, 8, 6, '00:07:54'),
(15, 8, 7, '00:08:07'),
(16, 8, 8, '00:07:59'),
(17, 9, 1, '00:12:33'),
(18, 9, 2, '00:12:26'),
(19, 9, 3, '00:11:38'),
(20, 9, 4, '00:11:28'),
(21, 10, 1, '00:05:40'),
(22, 10, 2, '00:06:00'),
(23, 10, 3, '00:07:06'),
(24, 10, 4, '00:06:42'),
(25, 10, 5, '00:06:26'),
(26, 10, 6, '00:06:18'),
(27, 10, 7, '00:06:31'),
(28, 10, 8, '00:06:31'),
(29, 10, 9, '00:07:07'),
(30, 10, 10, '00:07:07'),
(31, 11, 1, '00:11:29'),
(32, 11, 2, '00:10:39'),
(33, 11, 3, '00:11:31'),
(34, 11, 4, '00:10:51'),
(35, 11, 5, '00:09:11'),
(36, 11, 6, '00:07:23'),
(37, 11, 7, '00:11:02');

-- --------------------------------------------------------

--
-- Table structure for table `stride_cm`
--

CREATE TABLE `stride_cm` (
  `id` int NOT NULL,
  `id_training` int DEFAULT NULL,
  `stride_AVG` int DEFAULT NULL,
  `stride_max` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `stride_cm`
--

INSERT INTO `stride_cm` (`id`, `id_training`, `stride_AVG`, `stride_max`) VALUES
(1, 1, 74, 103),
(2, 2, 0, 0),
(3, 3, 0, 0),
(5, 5, 0, 0),
(6, 6, 0, 0),
(7, 7, 0, 0),
(8, 8, 157, 175),
(9, 9, 74, 124),
(10, 10, 97, 190),
(11, 11, 88, 129);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `training`
--

INSERT INTO `training` (`id`, `id_health`, `id_type_training`, `km_distance`, `kcal_active`, `kcal_total`, `pace`, `steps`, `heart_rate_AVG`) VALUES
(1, 9, 1, 7.01, 692, 866, '00:13:00', 9370, 107),
(2, 11, 2, 0.00, 0, 638, '01:00:06', 0, 97),
(3, 13, 2, 0.00, 0, 485, '01:00:00', 0, 111),
(5, 17, 2, 0.00, 0, 527, '00:00:00', 0, 92),
(6, 18, 2, 0.00, 0, 504, '01:10:00', 0, 98),
(7, 19, 2, 0.00, 0, 385, '01:00:09', 0, 102),
(8, 30, 3, 8.19, 547, 662, '00:07:19', 9418, 131),
(9, 31, 1, 4.00, 379, 471, '00:48:16', 5373, 114),
(10, 32, 3, 10.00, 1017, 1143, '00:06:33', 10259, 168),
(11, 37, 1, 7.00, 542, 681, '00:10:19', 7937, 115);

-- --------------------------------------------------------

--
-- Table structure for table `type_training`
--

CREATE TABLE `type_training` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `type_training`
--

INSERT INTO `type_training` (`id`, `name`) VALUES
(1, 'Walking'),
(2, 'Indoor cycling'),
(3, 'Outdoor running'),
(4, 'Treadmill'),
(5, 'Freestyle');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `user_name`, `email`, `password`, `state`) VALUES
(1, 'Juan Builes', 'Builes', 'juan_builes@hotmail.com', '$2b$12$ox.l.4aKOdWD0tDUcXdkp.M.q/jaA7FRLXuURsa816wUaEPb/WAG6', '1'),
(2, 'Admin', 'Admin', 'lipebuiles@icloud.com', '$2b$12$AZdsq7Z1i0KZfQyTOvYuauz9y7d2ZGT0CXswQB4e84KpJnLWi7j6.', '1'),
(3, 'Respaldo', 'Respaldo', 'lipebuiles@gmail.com', '$2b$12$2as49k9BZDmX.g0z/uqbd.pXxCd2011YQVgEV3KMenDCo.4S6tDSa', '1'),
(4, 'SuperAdmin', 'root', 'juanfelipe.builes@movilbox.net', '$2b$12$qO6JYn5BF32txYQpq1AMAOk/4oxTtvfXY2KkHElGqtUZ3OvF1uqMu', '1'),
(5, 'Builes', 'Builes1', 'elpinchepastel@gmail.com', '$2b$12$OhPePiHqfOmsVhdq56CiOeSLlx.16YWb9.yG40ce0/OEBQQirXXAa', '1');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cadence`
--
ALTER TABLE `cadence`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `dream`
--
ALTER TABLE `dream`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `health`
--
ALTER TABLE `health`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `heart_rate`
--
ALTER TABLE `heart_rate`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `objetives_day`
--
ALTER TABLE `objetives_day`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pace`
--
ALTER TABLE `pace`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pace_for_km`
--
ALTER TABLE `pace_for_km`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `stride_cm`
--
ALTER TABLE `stride_cm`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `training`
--
ALTER TABLE `training`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `type_training`
--
ALTER TABLE `type_training`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

-- --------------------------------------------------------

--
-- Structure for view `monthly_training_health_summary`
--
DROP TABLE IF EXISTS `monthly_training_health_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `monthly_training_health_summary`  AS SELECT `daily_summary`.`month` AS `month`, `daily_summary`.`training_type` AS `training_type`, sum(`daily_summary`.`trainings_per_day`) AS `trainings_count_per_day`, sum(`daily_summary`.`total_km_distance`) AS `total_km_distance`, avg(`daily_summary`.`avg_km_distance`) AS `avg_km_distance`, sum(`daily_summary`.`total_kcal_active`) AS `total_kcal_active`, avg(`daily_summary`.`avg_kcal_active`) AS `avg_kcal_active`, sum(`daily_summary`.`total_kcal_total`) AS `total_kcal_total`, avg(`daily_summary`.`avg_kcal_total`) AS `avg_kcal_total`, sec_to_time(avg(`daily_summary`.`avg_pace_seconds`)) AS `avg_pace`, sum(`daily_summary`.`total_training_steps`) AS `total_training_steps`, avg(`daily_summary`.`avg_training_steps`) AS `avg_training_steps`, avg(`daily_summary`.`avg_heart_rate`) AS `avg_heart_rate`, sum(`daily_summary`.`total_health_calories`) AS `total_health_calories`, sum(`daily_summary`.`total_health_steps`) AS `total_health_steps`, sum(`daily_summary`.`total_health_distance`) AS `total_health_distance`, avg(`daily_summary`.`avg_moviment`) AS `avg_moviment` FROM (select date_format(`h`.`date`,'%Y-%m') AS `month`,`tt`.`name` AS `training_type`,cast(`h`.`date` as date) AS `training_day`,count(0) AS `trainings_per_day`,sum(`t`.`km_distance`) AS `total_km_distance`,avg(`t`.`km_distance`) AS `avg_km_distance`,sum(`t`.`kcal_active`) AS `total_kcal_active`,avg(`t`.`kcal_active`) AS `avg_kcal_active`,sum(`t`.`kcal_total`) AS `total_kcal_total`,avg(`t`.`kcal_total`) AS `avg_kcal_total`,avg(time_to_sec(`t`.`pace`)) AS `avg_pace_seconds`,sum(`t`.`steps`) AS `total_training_steps`,avg(`t`.`steps`) AS `avg_training_steps`,avg(`t`.`heart_rate_AVG`) AS `avg_heart_rate`,sum(`h`.`calories`) AS `total_health_calories`,sum(`h`.`steps`) AS `total_health_steps`,sum(`h`.`distance`) AS `total_health_distance`,avg(`h`.`moviment`) AS `avg_moviment` from ((`training` `t` join `health` `h` on((`t`.`id_health` = `h`.`id`))) join `type_training` `tt` on((`t`.`id_type_training` = `tt`.`id`))) where (`h`.`in_training` = '1') group by `month`,`training_type`,`training_day`) AS `daily_summary` GROUP BY `daily_summary`.`month`, `daily_summary`.`training_type` ORDER BY `daily_summary`.`month` ASC, `daily_summary`.`training_type` ASC ;

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
