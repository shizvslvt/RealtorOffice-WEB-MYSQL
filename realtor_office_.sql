-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2024 at 12:18 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `realtor_office_`
--
CREATE DATABASE IF NOT EXISTS `realtor_office_` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `realtor_office_`;

-- --------------------------------------------------------

--
-- Table structure for table `list_cities`
--

CREATE TABLE `list_cities` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `list_cities`
--

INSERT INTO `list_cities` (`id`, `name`) VALUES
(1, 'Київ'),
(2, 'Львів'),
(3, 'Харків'),
(4, 'Одеса'),
(5, 'Дніпро'),
(6, 'Запоріжжя'),
(7, 'Вінниця'),
(8, 'Черкаси'),
(9, 'Чернігів'),
(10, 'Житомир'),
(11, 'Івано-Франківськ'),
(12, 'Кропивницький'),
(13, 'Луцьк'),
(14, 'Миколаїв'),
(15, 'Полтава'),
(16, 'Рівне'),
(17, 'Суми'),
(18, 'Тернопіль'),
(19, 'Ужгород'),
(20, 'Херсон'),
(21, 'Хмельницький'),
(22, 'Чернівці');

-- --------------------------------------------------------

--
-- Table structure for table `list_localities`
--

CREATE TABLE `list_localities` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `list_localities`
--

INSERT INTO `list_localities` (`id`, `name`) VALUES
(1, 'Центр'),
(2, 'Пригород'),
(3, 'Селище');

-- --------------------------------------------------------

--
-- Table structure for table `list_types`
--

CREATE TABLE `list_types` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `list_types`
--

INSERT INTO `list_types` (`id`, `name`) VALUES
(1, 'Дом'),
(2, 'Квартира'),
(3, 'Земля');

-- --------------------------------------------------------

--
-- Table structure for table `ro_chats`
--

CREATE TABLE `ro_chats` (
  `id` int(11) NOT NULL,
  `estate_id` int(11) NOT NULL DEFAULT 0,
  `buyer_id` int(11) NOT NULL DEFAULT 0,
  `realtor_id` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ro_estates`
--

CREATE TABLE `ro_estates` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `cost` double NOT NULL,
  `type` int(1) NOT NULL,
  `locality` int(1) NOT NULL,
  `city` int(1) NOT NULL,
  `area` double NOT NULL,
  `bedrooms` int(5) NOT NULL,
  `floors` int(5) NOT NULL,
  `created` datetime NOT NULL,
  `views` int(11) DEFAULT 0,
  `archived` int(1) DEFAULT 0,
  `sold` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ro_estates`
--

INSERT INTO `ro_estates` (`id`, `seller_id`, `title`, `cost`, `type`, `locality`, `city`, `area`, `bedrooms`, `floors`, `created`, `views`, `archived`, `sold`) VALUES
(1, 3, 'Трехкомнатная квартира в центре города', 27000, 2, 2, 10, 120, 3, 1, '2021-09-16 13:45:22', 0, 0, 0),
(2, 6, 'Двухэтажный дом с панорамным видом', 95000, 2, 1, 14, 440, 6, 2, '2022-01-23 14:50:35', 0, 0, 0),
(3, 3, 'Дом в живописном районе с большим участком', 240000, 1, 2, 10, 180.5, 3, 2, '2022-01-26 09:45:22', 0, 0, 0),
(4, 6, 'Квартира с видом на море в жилом комплексе', 380000, 2, 2, 14, 160, 3, 2, '2022-02-11 06:35:27', 0, 0, 0),
(5, 9, 'Уютная квартира с дизайнерским ремонтом', 115000, 2, 1, 12, 80, 2, 5, '2022-04-02 16:14:40', 0, 0, 0),
(6, 14, 'Современный пентхаус с видом на город', 90000, 1, 2, 13, 220, 2, 2, '2022-07-22 03:52:22', 0, 0, 0),
(7, 3, 'Студия с панорамными окнами в центре', 45000, 2, 1, 10, 140, 1, 5, '2022-07-29 09:45:22', 0, 0, 0),
(8, 6, 'Домик на озере с садом и пирсом', 13500, 1, 2, 14, 380, 3, 2, '2022-08-05 05:35:27', 0, 0, 0),
(9, 15, 'Квартира в историческом центре города', 125000, 2, 1, 17, 98, 3, 2, '2022-08-17 01:15:36', 0, 0, 0),
(10, 14, 'Большая квартира с террасой и видом на парк', 60000, 2, 1, 13, 120, 2, 1, '2022-08-26 01:52:22', 0, 0, 0),
(11, 6, 'Элитный загородный дом с бассейном', 500000, 1, 2, 14, 350, 5, 2, '2022-09-13 11:35:27', 0, 0, 0),
(12, 9, 'Лофт с панорамными окнами и видом на реку', 75000, 2, 1, 12, 110, 1, 3, '2022-10-07 06:14:40', 0, 0, 0),
(13, 18, 'Новый дом с большим участком земли', 150000, 1, 2, 4, 300, 4, 1, '2023-03-09 06:06:27', 0, 0, 0),
(14, 9, 'Квартира в жилом комплексе с бассейном', 95000, 2, 1, 12, 100, 2, 4, '2023-03-31 23:14:40', 0, 0, 0),
(15, 14, 'Новый современный дом в престижном районе', 350000, 1, 2, 13, 250, 3, 2, '2023-07-24 13:52:22', 0, 0, 0),
(16, 3, 'Пентхаус с видом на море и город', 80000, 1, 2, 10, 180, 3, 1, '2023-09-22 23:45:22', 0, 0, 0),
(17, 15, 'Роскошная квартира с видом на залив', 120000, 2, 1, 17, 100, 3, 1, '2023-10-15 12:15:36', 0, 0, 0),
(18, 6, 'Просторный дом с зимним садом', 210000, 1, 2, 14, 350, 5, 2, '2024-03-17 03:35:27', 0, 0, 0),
(19, 18, 'Уютная квартира с террасой', 45000, 2, 1, 4, 75, 2, 5, '2024-04-09 04:06:27', 0, 0, 0),
(20, 6, 'Большой загородный дом в лесу', 220000, 1, 2, 14, 400, 5, 2, '2024-06-16 17:35:27', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ro_history_view`
--

CREATE TABLE `ro_history_view` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `estate_id` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ro_logs`
--

CREATE TABLE `ro_logs` (
  `id` int(11) NOT NULL,
  `text` text DEFAULT NULL,
  `link` text DEFAULT NULL,
  `type` text DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `estate_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ro_messages`
--

CREATE TABLE `ro_messages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `chat_id` int(11) NOT NULL,
  `text` text NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ro_realtors`
--

CREATE TABLE `ro_realtors` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `percent` int(2) NOT NULL DEFAULT 0,
  `experience` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ro_realtors`
--

INSERT INTO `ro_realtors` (`id`, `user_id`, `percent`, `experience`) VALUES
(1, 7, 5, '2022-02-10'),
(2, 19, 5, '2021-04-15'),
(3, 20, 5, '2022-10-29');

-- --------------------------------------------------------

--
-- Table structure for table `ro_users`
--

CREATE TABLE `ro_users` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `mail` text DEFAULT NULL,
  `password` text DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `PID` int(9) DEFAULT NULL,
  `balance` double DEFAULT 0,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ro_users`
--

INSERT INTO `ro_users` (`id`, `name`, `mail`, `password`, `birthday`, `PID`, `balance`, `created`) VALUES
(1, 'admin', 'admin', 'admin', '2000-01-01', 200001019, 0, '2021-01-01 00:00:00'),
(2, 'Іван Авраменко', 'ivan.avramenko@gmail.com', 'password', '2002-07-21', 200207217, 0, '2021-09-01 08:12:34'),
(3, 'Анастасія Анайко', 'anastasia.anaiko@gmail.com', 'password', '2001-08-13', 200108134, 0, '2021-09-15 13:45:22'),
(4, 'Катерина Вербицька', 'kateryna.verbytska@gmail.com', 'password', '2002-03-03', 200203035, 0, '2021-10-07 14:25:33'),
(5, 'Данило Глаголєв', 'danylo.hlaholev@gmail.com', 'password', '2001-11-29', 200111297, 0, '2021-10-22 16:20:18'),
(6, 'Костянтин Юшко', 'kostiantyn.yushko@gmail.com', 'password', '2004-02-06', 200402061, 0, '2022-01-15 09:35:27'),
(7, 'Даніїл Мозжухін', 'daniil.mozzhukhin@gmail.com', 'password', '2002-10-10', 200210105, 0, '2022-02-13 11:12:34'),
(8, 'Марія Тюрдєєва', 'maria.tyurdeeva@gmail.com', 'password', '2002-04-22', 200204226, 0, '2022-03-05 13:18:22'),
(9, 'Антон Ржевський', 'anton.rzhevskyi@gmail.com', 'password', '2001-12-01', 200112019, 0, '2022-03-25 15:14:40'),
(10, 'Дар’я Черепіна', 'daria.cherepina@gmail.com', 'password', '2002-07-15', 200207157, 0, '2022-04-18 12:55:28'),
(11, 'Катерина Шафранюк', 'kateryna.shafranyuk@gmail.com', 'password', '2002-06-11', 200206119, 0, '2022-05-03 10:14:56'),
(12, 'Леонардо Пендус', 'leonardo.pendus@gmail.com', 'password', '2001-02-20', 200102202, 0, '2022-06-10 14:20:01'),
(13, 'Андрій Скрипка', 'andriy.skrypka@gmail.com', 'password', '2002-03-29', 200203293, 0, '2022-07-02 09:18:44'),
(14, 'Валентин Нетовканий', 'valentyn.netovkanyi@gmail.com', 'password', '2001-09-09', 200109095, 0, '2022-07-20 13:52:22'),
(15, 'Ігор Єрощенков', 'ihor.yeroshenkov@gmail.com', 'password', '2001-06-03', 200106039, 0, '2022-08-13 11:15:36'),
(16, 'Богдан Трофименко', 'bogdan.trofymenko@gmail.com', 'password', '2002-12-24', 200212243, 0, '2023-01-05 14:58:10'),
(17, 'Наталія Тимофєєва', 'nataliya.tymofeeva@gmail.com', 'password', '2001-11-17', 200111177, 0, '2023-02-01 17:22:03'),
(18, 'Данило Садовий', 'danylo.sadovyi@gmail.com', 'password', '2002-08-09', 200208091, 0, '2023-03-07 16:06:27'),
(19, 'Микита Кузнецов', 'mykyta.kuznetsov@gmail.com', 'password', '2002-04-15', 200204152, 0, '2023-06-21 14:31:44'),
(20, 'Володимир Гнатуша', 'volodymyr.hnatusha@gmail.com', 'password', '2002-05-02', 200205028, 0, '2024-01-12 09:17:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `list_cities`
--
ALTER TABLE `list_cities`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `list_localities`
--
ALTER TABLE `list_localities`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `list_types`
--
ALTER TABLE `list_types`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ro_chats`
--
ALTER TABLE `ro_chats`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `estate_id` (`estate_id`) USING BTREE,
  ADD KEY `buyer_id` (`buyer_id`) USING BTREE,
  ADD KEY `rieltor_id` (`realtor_id`) USING BTREE;

--
-- Indexes for table `ro_estates`
--
ALTER TABLE `ro_estates`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `seller_id` (`seller_id`) USING BTREE,
  ADD KEY `type` (`type`) USING BTREE,
  ADD KEY `locality` (`locality`) USING BTREE,
  ADD KEY `city` (`city`) USING BTREE;

--
-- Indexes for table `ro_history_view`
--
ALTER TABLE `ro_history_view`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `estate_id` (`estate_id`) USING BTREE;

--
-- Indexes for table `ro_logs`
--
ALTER TABLE `ro_logs`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `FK_ro_logs_ro_users` (`user_id`) USING BTREE,
  ADD KEY `FK_ro_logs_ro_estates` (`estate_id`) USING BTREE;

--
-- Indexes for table `ro_messages`
--
ALTER TABLE `ro_messages`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `deal_id` (`chat_id`) USING BTREE;

--
-- Indexes for table `ro_realtors`
--
ALTER TABLE `ro_realtors`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `ro_users`
--
ALTER TABLE `ro_users`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `list_cities`
--
ALTER TABLE `list_cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `list_localities`
--
ALTER TABLE `list_localities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `list_types`
--
ALTER TABLE `list_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ro_chats`
--
ALTER TABLE `ro_chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ro_estates`
--
ALTER TABLE `ro_estates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `ro_history_view`
--
ALTER TABLE `ro_history_view`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ro_logs`
--
ALTER TABLE `ro_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ro_messages`
--
ALTER TABLE `ro_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ro_realtors`
--
ALTER TABLE `ro_realtors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ro_users`
--
ALTER TABLE `ro_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ro_chats`
--
ALTER TABLE `ro_chats`
  ADD CONSTRAINT `FK_ro_deals_ro_estates` FOREIGN KEY (`estate_id`) REFERENCES `ro_estates` (`id`),
  ADD CONSTRAINT `FK_ro_deals_ro_realtors` FOREIGN KEY (`realtor_id`) REFERENCES `ro_realtors` (`id`),
  ADD CONSTRAINT `FK_ro_deals_ro_users` FOREIGN KEY (`buyer_id`) REFERENCES `ro_users` (`id`);

--
-- Constraints for table `ro_estates`
--
ALTER TABLE `ro_estates`
  ADD CONSTRAINT `FK_estates_users` FOREIGN KEY (`seller_id`) REFERENCES `ro_users` (`id`),
  ADD CONSTRAINT `FK_ro_estates_cities` FOREIGN KEY (`city`) REFERENCES `list_cities` (`id`),
  ADD CONSTRAINT `FK_ro_estates_localities` FOREIGN KEY (`locality`) REFERENCES `list_localities` (`id`),
  ADD CONSTRAINT `FK_ro_estates_types` FOREIGN KEY (`type`) REFERENCES `list_types` (`id`);

--
-- Constraints for table `ro_history_view`
--
ALTER TABLE `ro_history_view`
  ADD CONSTRAINT `ro_history_view_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `ro_users` (`id`),
  ADD CONSTRAINT `ro_history_view_ibfk_2` FOREIGN KEY (`estate_id`) REFERENCES `ro_estates` (`id`);

--
-- Constraints for table `ro_logs`
--
ALTER TABLE `ro_logs`
  ADD CONSTRAINT `FK_ro_logs_ro_estates` FOREIGN KEY (`estate_id`) REFERENCES `ro_estates` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ro_logs_ro_users` FOREIGN KEY (`user_id`) REFERENCES `ro_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ro_messages`
--
ALTER TABLE `ro_messages`
  ADD CONSTRAINT `FK_ro_chat_ro_deals` FOREIGN KEY (`chat_id`) REFERENCES `ro_chats` (`id`),
  ADD CONSTRAINT `FK_ro_chat_ro_users` FOREIGN KEY (`user_id`) REFERENCES `ro_users` (`id`);

--
-- Constraints for table `ro_realtors`
--
ALTER TABLE `ro_realtors`
  ADD CONSTRAINT `FK_ro_realtors_ro_users` FOREIGN KEY (`user_id`) REFERENCES `ro_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
