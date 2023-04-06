-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 26. Mrz 2023 um 18:34
-- Server-Version: 10.4.27-MariaDB
-- PHP-Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `restaurant_balfisot`
--
CREATE DATABASE IF NOT EXISTS `restaurant_balfisot` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `restaurant_balfisot`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Appetizers'),
(2, 'Main course'),
(3, 'Desserts'),
(4, 'Breakfast'),
(5, 'Snacks'),
(6, 'Drinks');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `dish`
--

DROP TABLE IF EXISTS `dish`;
CREATE TABLE IF NOT EXISTS `dish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `price` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_957D8CB812469DE2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `dish`
--

INSERT INTO `dish` (`id`, `category_id`, `name`, `description`, `price`) VALUES
(1, 1, 'Lentil soup', 'Lentil soup is soup made from lentils.\r\nChoice from chili oil, sumac, onions or parsley as topping.', '€3,00'),
(2, 1, 'Beyran', 'Soup made of sheep meat and sheep cheeks. Served with bread and lemon.', '€3,50'),
(3, 1, 'Water gourd', 'Cooked water gourd in tomato paste with chick peas and sheep meat.\r\nServed with or without rice.', '€3,00'),
(4, 1, 'Yuvalama', 'Yoghurt soup with chickpeas, sheep meat and mint oil.', '€3,00'),
(5, 1, 'Söğürme', 'Yoghurt soup with chickpeas, sheep meat and mint oil.', '€3,00'),
(6, 2, 'Eggplant kebab', 'Kebab with baked eggplant. Choice of variant with ground meat or chicken\r\n\r\n\r\n', '€10,00\r\n'),
(7, 2, 'Chickpea wrap', 'Wrap with cooked chickpeas with vegetables and sumac.\r\nChoice of different ingredients.\r\n', '€3,00'),
(8, 2, 'Cooked okra', 'Cooked okra and chickpeas in tomato paste.\r\nServed with or without rice.\r\n', '€3,00 '),
(9, 2, 'Lahmacun', 'Flatbread with grounded meat and\r\ndifferent vegetables.\r\nChoice of different ingredients for \r\nthe lahmacun.\r\n\r\n', '€3,00'),
(10, 2, 'Çiğköfte', 'Bulgur balls with ground meat, tomato paste and Urfa pepper.\r\nServed with lemon and lettuce.\r\n', '€3,00'),
(11, 3, 'Şıllık', 'Layered crepes filled with ground\r\nwalnuts and topped with syprup\r\nand chopped pistachio.\r\n\r\n\r\n ', '€3,00'),
(12, 3, 'Antep kattama', 'Fried layered bread filled with kaymak and topped with pistachios.\r\n\r\n', '€4,00'),
(13, 3, 'Cheese halva', 'Halva made of semolina and cheese.\r\n', '€3,00'),
(14, 3, 'Şöbiyet', 'Made of thin Turkish noodles with sweeteners.\r\n', 'Plate: €3,00  Box: €8,00'),
(15, 3, 'Kadayıf with cheese\n', 'Made of thin Turkish noodles with sweeteners.', 'Plate: €3,00  Box: €8,00'),
(16, 4, 'Sucuk omelette', 'Omelette with sucuk\r\nServed with bread.\r\n\r\n', '€3,00'),
(17, 4, 'Breakfast Menu', 'Everything you need for a awesome \nTurkish breakfast such as börek, \nolives, vegetables bread and some \nspreadable stuff.', '€8,00'),
(18, 4, 'Cooked chickpeas', 'Freshly cooked chick pea served with Turkish flatbread, sumac and chili powder.\r\n\r\n', '€5,00'),
(19, 4, 'Börek', 'Turkish pastry with cheese\r\nServed on a plate or in a box for takeaway.\r\n', 'Plate: €5,00   Box: €8,00'),
(20, 4, 'Tahini halva', 'A delicacy made of sesame paste and tahini with pistachio nuts op the top.\r\nSuits very well for breakfast.\r\n', 'Plate: €5,00  Box: €8,00'),
(21, 5, 'Kibbeh', 'Fried bulgur balls filled with walnuts and spices.\r\n', 'Plate: €3,00  Box: €8,00'),
(22, 5, 'Sarma', 'Wine leaves filled with rice and then marinated in tomato paste.\r\n', 'Plate: €2,00  Box: €3,00'),
(23, 5, 'Pistachio bars', 'Bars made of pureed pistachio nuts.   \r\n\r\n', 'Bar: €0,50 Box: €5,00'),
(24, 5, 'Flower cookies', 'Cookies made of flower topped with various nuts.\r\nSold per box.\r\n', '€5,00'),
(25, 5, 'Tahini cookies', 'Cookies filled with tahini inside. Sold per box.\r\n\r\n', '€5,00'),
(26, 6, 'Ayran', 'Drink made of yoghurt, water and salt.', '€2,00'),
(27, 6, 'Sharbat', 'Drink made of cherries and plums.', '€2,00'),
(28, 6, 'Water', 'We offer water from Jana\r\nOffered in bottles or in cups for free at every visit.', '\r\nBottle: Free  Cup: Free'),
(29, 6, 'Tea', 'Sold in cups or in a cartboard cup for takeaway.', 'Cup: €1,00 Cardboard cup: €1,50'),
(30, 6, 'Terebinth coffee', 'Coffee made of roasted terebinth.', '€2,00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230315125027', '2023-03-15 13:50:35', 124),
('DoctrineMigrations\\Version20230323140719', '2023-03-23 15:07:39', 186),
('DoctrineMigrations\\Version20230323141129', '2023-03-23 15:11:50', 17);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `items` longtext NOT NULL,
  `total_price` varchar(255) NOT NULL,
  `customer` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `dish`
--
ALTER TABLE `dish`
  ADD CONSTRAINT `FK_957D8CB812469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
