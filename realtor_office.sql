-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2024 at 02:02 PM
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
-- Database: `realtor_office`
--
CREATE DATABASE IF NOT EXISTS `realtor_office` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `realtor_office`;

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

--
-- Dumping data for table `ro_chats`
--

INSERT INTO `ro_chats` (`id`, `estate_id`, `buyer_id`, `realtor_id`) VALUES
(1, 11, 2, 1),
(2, 5, 4, NULL),
(8, 5, 1, NULL),
(9, 1, 5, 1),
(10, 6, 2, 1),
(11, 6, 4, 1),
(12, 14, 6, 1),
(13, 8, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ro_estates`
--

CREATE TABLE `ro_estates` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `title` mediumtext NOT NULL,
  `cost` double NOT NULL,
  `type` int(11) NOT NULL,
  `locality` int(11) NOT NULL,
  `city` int(11) NOT NULL,
  `area` double NOT NULL,
  `bedrooms` int(11) NOT NULL,
  `floors` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `views` int(11) DEFAULT 0,
  `archived` int(1) DEFAULT 0,
  `sold` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ro_estates`
--

INSERT INTO `ro_estates` (`id`, `seller_id`, `title`, `cost`, `type`, `locality`, `city`, `area`, `bedrooms`, `floors`, `created`, `views`, `archived`, `sold`) VALUES
(1, 7, '3-х комнатная квартира', 25000, 2, 2, 2, 120, 3, 1, '2023-11-30 09:11:08', 0, 1, 1),
(2, 4, '3-х комнатная квартира', 35000, 1, 2, 10, 170, 3, 1, '2024-02-12 10:24:21', 0, 1, 0),
(3, 2, '2-х этажный дом', 106000, 2, 1, 14, 440, 6, 2, '2024-03-13 16:54:57', 0, 0, 0),
(4, 2, 'Прекрасный дом в тихом районе', 250000, 1, 2, 5, 180.5, 3, 2, '2024-04-02 10:29:55', 0, 0, 0),
(5, 7, 'Просторный дом с садом', 350000, 3, 3, 10, 300, 4, 1, '2024-04-21 08:53:00', 1, 0, 0),
(6, 7, 'Студия в новом жилом комплексе', 80000, 1, 1, 8, 50, 1, 10, '2024-04-22 12:00:00', 0, 1, 1),
(7, 5, 'Двухэтажная квартира с видом на море', 420000, 2, 2, 18, 160, 3, 2, '2024-04-22 14:20:00', 0, 0, 0),
(8, 4, 'Уютная квартира в центре города', 120000, 2, 1, 15, 80, 2, 5, '2024-05-04 15:45:00', 0, 1, 1),
(9, 6, 'Пентхаус с Террасой и Видом на Город', 95000, 1, 2, 16, 220, 2, 2, '2024-05-11 20:02:38', 0, 0, 0),
(10, 5, 'Арендуемый Офис в Центре Города', 30000, 2, 1, 11, 140, 1, 5, '2024-08-02 14:04:19', 0, 0, 0),
(11, 1, '2-х комнатная квартира', 25000, 2, 2, 2, 120, 2, 1, '2024-08-05 22:49:55', 0, 1, 1),
(12, 7, 'Уютное Жилище с Видом на Парк', 60000, 1, 1, 1, 80, 2, 1, '2024-08-06 13:55:56', 0, 0, 0),
(13, 5, 'Студия с Панорамным Окном', 45000, 2, 1, 2, 55, 1, 1, '2024-09-04 13:55:56', 0, 0, 0),
(14, 4, 'Домик на Озере', 12500, 1, 2, 15, 380, 3, 2, '2024-12-07 13:57:35', 0, 1, 1),
(15, 5, 'Квартира в Историческом Квартале', 120000, 2, 1, 18, 98, 3, 2, '2024-12-10 14:20:00', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ro_history_view`
--

CREATE TABLE `ro_history_view` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `estate_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ro_history_view`
--

INSERT INTO `ro_history_view` (`id`, `user_id`, `estate_id`, `created`) VALUES
(25, 1, 11, '2024-05-04 08:09:06'),
(26, 2, 11, '2024-05-04 08:16:58'),
(27, 1, 5, '2024-05-05 10:31:34');

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

--
-- Dumping data for table `ro_logs`
--

INSERT INTO `ro_logs` (`id`, `text`, `link`, `type`, `date`, `user_id`, `estate_id`) VALUES
(1, 'Balance change from 125000 to 97500', '?p=chats&id=9', 'Transaction', '2023-12-30 22:11:08', 5, NULL),
(2, 'Balance change from 25000 to 27500', '?p=chats&id=9', 'Transaction', '2023-12-30 22:11:08', 3, NULL),
(3, 'Balance change from 0 to 25000', '?p=chats&id=9', 'Transaction', '2023-12-30 22:11:08', 7, NULL),
(4, 'Sale of estate', '?p=chats&id=9', 'Sale', '2023-12-30 22:11:08', 5, 1),
(5, 'Balance change from 565249 to 537749', '?p=chats&id=1', 'Transaction', '2024-02-05 15:51:01', 2, NULL),
(6, 'Balance change from 25000 to 27500', '?p=chats&id=1', 'Transaction', '2024-02-05 15:51:01', 3, NULL),
(7, 'Balance change from 25000 to 50000', '?p=chats&id=1', 'Transaction', '2024-02-05 15:51:01', 1, NULL),
(8, 'Sale of estate', '?p=chats&id=1', 'Sale', '2024-02-05 15:51:01', 2, 11),
(9, 'Balance change from 173000 to 85000', '?p=chats&id=11', 'Transaction', '2024-05-07 19:40:25', 4, NULL),
(10, 'Balance change from 25000 to 33000', '?p=chats&id=11', 'Transaction', '2024-05-07 19:40:25', 3, NULL),
(11, 'Balance change from 25000 to 105000', '?p=chats&id=11', 'Transaction', '2024-05-07 19:40:25', 7, NULL),
(12, 'Sale of estate', '?p=chats&id=11', 'Sale', '2024-05-07 19:40:25', 4, 6),
(13, 'Balance change from 25000 to 11250', '?p=chats&id=12', 'Transaction', '2024-05-09 01:48:46', 6, NULL),
(14, 'Balance change from 25000 to 26250', '?p=chats&id=12', 'Transaction', '2024-05-09 01:48:46', 3, NULL),
(15, 'Balance change from 85000 to 97500', '?p=chats&id=12', 'Transaction', '2024-05-09 01:48:46', 4, NULL),
(16, 'Sale of estate', '?p=chats&id=12', 'Sale', '2024-05-09 01:48:46', 6, 14),
(17, 'Balance change from 140000 to 8000', '?p=chats&id=13', 'Transaction', '2024-05-09 01:56:18', 3, NULL),
(18, 'Balance change from 25000 to 37000', '?p=chats&id=13', 'Transaction', '2024-05-09 01:56:18', 3, NULL),
(19, 'Balance change from 12500 to 132500', '?p=chats&id=13', 'Transaction', '2024-05-09 01:56:18', 4, NULL),
(20, 'Sale of estate', '?p=chats&id=13', 'Sale', '2024-05-09 01:56:18', 3, 8);

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

--
-- Dumping data for table `ro_messages`
--

INSERT INTO `ro_messages` (`id`, `user_id`, `chat_id`, `text`, `date`) VALUES
(1, 2, 1, 'ghbdtn', '2023-11-16 00:00:00'),
(3, 1, 8, 'hello', '2024-04-29 00:00:00'),
(5, 1, 8, 'my name kostya brbrbrbrbrbrbrbrbrbrbrbr', '2024-04-29 04:00:00'),
(6, 7, 8, '?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????', '2024-04-29 05:00:03'),
(7, 7, 8, 'ВЫ МНЕ ЧТО ПРОДАЛИ', '2024-04-29 05:05:01'),
(8, 1, 8, 'bye', '2024-04-29 14:43:07'),
(9, 1, 8, 'bye', '2024-04-29 14:43:07'),
(10, 1, 8, 'bye', '2024-04-29 14:43:07'),
(11, 1, 8, 'bye', '2024-04-29 14:43:07'),
(12, 1, 1, 'hi', '2024-04-29 22:41:29'),
(13, 1, 1, 'hi', '2024-04-29 22:47:33'),
(14, 3, 8, 'hi', '2024-04-29 22:48:23'),
(16, 5, 9, 'покупаю', '2024-05-07 10:05:13');

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
(1, 3, 10, '2021-11-06');

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
  `created` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ro_users`
--

INSERT INTO `ro_users` (`id`, `name`, `mail`, `password`, `birthday`, `PID`, `balance`, `created`) VALUES
(1, 'Юшко Константин Вячеславович', 'test', 'test', '2004-02-06', 133714488, 25000, '2022-12-21 11:54:04'),
(2, 'Вика', 'vika2003@gmail.com', '9afaif43f32', '2003-10-30', 140772131, 537749, '2023-10-27 11:13:09'),
(3, 'Коля', 'apostol@gmail.com', '1930fi93ifp2if3', '2004-07-10', 142103784, 8000, '2023-10-29 15:09:00'),
(4, 'Никита Кузнецов Викторовна', 'nikitka2012@gmail.com', 'af9i45ig3g3a', '2012-12-31', 231356351, 120000, '2023-10-26 05:10:06'),
(5, 'Даша', 'daria@gmail.com', '13u8t123ioas', '2004-04-16', 141941665, 97500, '2023-10-31 07:09:08'),
(6, 'Даня Мозжухин Олеговна', 'danyalox123@gmail.com', '1432gds4qw1', '2004-04-16', 141941664, 11250, '2023-10-31 15:21:49'),
(7, 'Катя', 'katya@gmail.com', 'a93iuoga3', '2004-04-16', 141941663, 80000, '2023-12-10 07:11:08'),
(8, 'admin', 'admin', 'admin', '2004-02-06', 133714488, 0, '2024-04-30 15:17:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `list_cities`
--
ALTER TABLE `list_cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `list_localities`
--
ALTER TABLE `list_localities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `list_types`
--
ALTER TABLE `list_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ro_chats`
--
ALTER TABLE `ro_chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estate_id` (`estate_id`),
  ADD KEY `buyer_id` (`buyer_id`),
  ADD KEY `rieltor_id` (`realtor_id`) USING BTREE;

--
-- Indexes for table `ro_estates`
--
ALTER TABLE `ro_estates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seller_id` (`seller_id`),
  ADD KEY `type` (`type`),
  ADD KEY `locality` (`locality`),
  ADD KEY `city` (`city`);

--
-- Indexes for table `ro_history_view`
--
ALTER TABLE `ro_history_view`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `estate_id` (`estate_id`);

--
-- Indexes for table `ro_logs`
--
ALTER TABLE `ro_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ro_logs_ro_users` (`user_id`),
  ADD KEY `FK_ro_logs_ro_estates` (`estate_id`);

--
-- Indexes for table `ro_messages`
--
ALTER TABLE `ro_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `deal_id` (`chat_id`) USING BTREE;

--
-- Indexes for table `ro_realtors`
--
ALTER TABLE `ro_realtors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ro_users`
--
ALTER TABLE `ro_users`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `ro_estates`
--
ALTER TABLE `ro_estates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `ro_history_view`
--
ALTER TABLE `ro_history_view`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `ro_logs`
--
ALTER TABLE `ro_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `ro_messages`
--
ALTER TABLE `ro_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `ro_realtors`
--
ALTER TABLE `ro_realtors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ro_users`
--
ALTER TABLE `ro_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
