-- Database configuration and collation
CREATE DATABASE IF NOT EXISTS my_fitness CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci;

USE my_fitness;

-- User table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    user_name VARCHAR(20),
    email VARCHAR(100),
    password VARCHAR(64),
    state ENUM('0', '1', '2') NOT NULL,
    CONSTRAINT chk_state CHECK (state IN ('0', '1', '2'))
) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci;

-- Training type table
CREATE TABLE type_training (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci;

-- Health table
CREATE TABLE health (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE,
    calories INT CHECK (calories <= 3000),
    steps INT CHECK (steps <= 100000),
    distance FLOAT(5, 2) CHECK (distance <= 999.99),
    moviment INT CHECK (moviment <= 300),
    in_training ENUM('0', '1') NOT NULL,
    id_user_create INT,
    create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_user_update INT,
    update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_user_create) REFERENCES users (id),
    FOREIGN KEY (id_user_update) REFERENCES users (id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci;

-- Training table
CREATE TABLE training (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_health INT,
    id_type_training INT,
    km_distance FLOAT(5, 2) CHECK (km_distance <= 999.99),
    kcal_active INT CHECK (kcal_active <= 3000),
    kcal_total INT CHECK (kcal_total <= 3000),
    pace TIME,
    steps INT CHECK (steps <= 100000),
    heart_rate_AVG INT CHECK (heart_rate_AVG <= 500),
    FOREIGN KEY (id_health) REFERENCES health (id),
    FOREIGN KEY (id_type_training) REFERENCES type_training (id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci;

-- Daily Goals Table
CREATE TABLE objetives_day (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE,
    obj_calories INT CHECK (obj_calories <= 3000),
    obj_steps INT CHECK (obj_steps <= 100000),
    obj_moviment INT CHECK (obj_moviment <= 300),
    obj_dream FLOAT(5, 2) CHECK (obj_dream <= 24.00),
    user_create INT,
    create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_update INT,
    update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_create) REFERENCES users (id),
    FOREIGN KEY (user_update) REFERENCES users (id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci;

-- Heart rate chart during training
CREATE TABLE heart_rate_training (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_training INT,
    heart_rate INT CHECK (heart_rate <= 500),
    heart_rate_max INT CHECK (heart_rate_max <= 500),
    ligth_pace TIME,
    intensive_pace TIME,
    aerobic_pace TIME,
    anaerobic_pace TIME,
    vo2_max TIME,
) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci;

-- Dream table
CREATE TABLE dream (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ligth TIME,
    deep TIME,
    awake INT CHECK (awake <= 24),
    heart_rate INT CHECK (heart_rate <= 300),
    total_dream TIME,
    id_health INT,
) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci;

-- Table rhythm for training
CREATE TABLE rhythm (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_training INT,
    rhythm TIME,
    rhythm_max TIME,
    FOREIGN KEY (id_training) REFERENCES training (id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci;

-- Table rhythm for km
CREATE TABLE rhythm_for_km (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_training INT,
  km INT CHECK (km <= 200),
  rhythm TIME,
  FOREIGN KEY (id_training) REFERENCES training(id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci;

-- Table cadence for training
CREATE TABLE cadence (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_training INT,
    cadence_AVG INT CHECK (cadence_AVG <= 300),
    cadence_max INT CHECK (cadence_max <= 300),
    FOREIGN KEY (id_training) REFERENCES training (id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci;

-- Table rhythm in cm
CREATE TABLE stride_cm (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_training INT,
    stride_AVG INT CHECK (stride_AVG <= 300),
    stride_max INT CHECK (stride_max <= 300),
    FOREIGN KEY (id_training) REFERENCES training (id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci;

