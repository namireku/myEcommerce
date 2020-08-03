-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 03, 2020 at 02:51 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `niksclothing`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `brand` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `brand`) VALUES
(1, 'Levis'),
(2, 'Nike'),
(3, 'Polo'),
(5, 'Sketchers'),
(6, 'Calvin Klein'),
(7, 'Charter Klub'),
(8, 'Chiffon'),
(9, 'Helly Hanson'),
(10, 'Tommy Hilfinger'),
(11, 'Vince Camuto');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `items` text COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime NOT NULL,
  `paid` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `items`, `expire_date`, `paid`) VALUES
(1, '[{\"id\":\"35\",\"size\":\"extra-large\",\"quantity\":\"1\"}]', '2018-09-28 13:10:41', 1),
(2, '[{\"id\":\"44\",\"size\":\"small\",\"quantity\":\"2\"}]', '2018-09-28 13:30:30', 1),
(4, '[{\"id\":\"53\",\"size\":\"45\",\"quantity\":2}]', '2018-10-03 20:43:03', 1),
(5, '[{\"id\":\"42\",\"size\":\"34\",\"quantity\":\"1\"}]', '2018-10-26 15:49:12', 1),
(6, '[{\"id\":\"34\",\"size\":\"small \",\"quantity\":\"1\"}]', '2018-11-04 01:40:38', 1),
(7, '[{\"id\":\"33\",\"size\":\"large\",\"quantity\":\"1\"}]', '2019-02-27 14:05:25', 1),
(8, '[{\"id\":\"33\",\"size\":\"large\",\"quantity\":\"2\"}]', '2019-03-02 19:46:24', 1),
(9, '[{\"id\":\"35\",\"size\":\"extra-large\",\"quantity\":\"1\"}]', '2019-03-07 16:02:40', 1),
(10, '[{\"id\":\"52\",\"size\":\"small\",\"quantity\":1}]', '2019-03-07 16:03:58', 1),
(12, '[{\"id\":\"34\",\"size\":\"small \",\"quantity\":\"1\"}]', '2019-03-09 00:03:41', 1),
(13, '[{\"id\":\"47\",\"size\":\"small\",\"quantity\":\"2\"}]', '2019-03-19 16:27:18', 1),
(14, '[{\"id\":\"53\",\"size\":\"45\",\"quantity\":2}]', '2019-03-19 21:17:04', 1),
(15, '[{\"id\":\"40\",\"size\":\"small\",\"quantity\":\"1\"}]', '2019-05-16 10:23:54', 1),
(16, '[{\"id\":\"33\",\"size\":\"large\",\"quantity\":1}]', '2019-06-02 22:27:32', 1),
(17, '[{\"id\":\"33\",\"size\":\"large\",\"quantity\":\"1\"}]', '2019-06-02 22:49:00', 1),
(18, '[{\"id\":\"34\",\"size\":\"small \",\"quantity\":\"1\"}]', '2019-06-02 22:55:28', 1),
(19, '[{\"id\":\"47\",\"size\":\"small\",\"quantity\":\"2\"}]', '2019-06-02 23:21:43', 1),
(20, '[{\"id\":\"41\",\"size\":\"small\",\"quantity\":\"3\"},{\"id\":\"42\",\"size\":\"34\",\"quantity\":\"1\"}]', '2019-06-22 14:46:27', 0),
(21, '[{\"id\":\"33\",\"size\":\"large\",\"quantity\":\"1\"}]', '2020-09-02 11:00:41', 1),
(22, '[{\"id\":\"47\",\"size\":\"small\",\"quantity\":\"2\"},{\"id\":\"53\",\"size\":\"45\",\"quantity\":2}]', '2020-09-02 14:41:40', 0);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `parent`) VALUES
(1, 'Men', 0),
(2, 'Women', 0),
(3, 'Boys', 0),
(4, 'Girls', 0),
(5, 'Shirts', 1),
(6, 'Pants', 1),
(7, 'Shoes', 1),
(8, 'Accessories', 1),
(9, 'Shirts', 2),
(10, 'Pants', 2),
(11, 'Shoes', 2),
(12, 'Dresses', 2),
(13, 'Shirts', 3),
(14, 'Pants', 3),
(15, 'Dresses', 4),
(16, 'Shoes', 4),
(17, 'Accessories', 2),
(24, 'Gifts', 0),
(26, 'Home Decor', 24),
(29, 'Shoes', 3),
(30, 'Pants', 4);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `list_price` decimal(10,2) NOT NULL,
  `brand` int(11) NOT NULL,
  `categories` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `featured` tinyint(4) NOT NULL DEFAULT '0',
  `sizes` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `deleted`, `title`, `price`, `list_price`, `brand`, `categories`, `image`, `description`, `featured`, `sizes`) VALUES
(33, 0, 'Summer dress', '20.99', '30.36', 5, '15', '/Proj/images/products/02697e4b88839fc5891242ce162388ce.jpg', 'Please try and get these dresses', 1, 'large:7'),
(34, 0, 'Average purse', '30.99', '40.99', 5, '17', '/Proj/images/products/55ad65afa6276e7048ff836b22352fc8.jpg', 'This purse will be a better to place to keep your money', 1, 'small :2,large:1'),
(35, 0, 'Jacket', '32.20', '40.99', 2, '8', '/Proj/images/products/69a67ae5a6a5301e52e54b08ea0a8a42.jpg', 'You wanna keep warm always', 1, 'extra-large:2,small:1'),
(40, 0, 'Watch', '12.00', '22.00', 11, '8', '/Proj/images/products/aa190ed9a466ffd5546659e64d1a1550.jpg', 'Use this to check your time!', 1, 'small:3,medium:3'),
(41, 0, 'Suit', '90.00', '190.00', 9, '5', '/Proj/images/products/41f3d5f30afa4e977601c8d22498e7ad.jpg', 'This suit will look very good on you.Try it!', 1, 'small:3,medium:2,large:1'),
(42, 0, 'Timberland', '45.00', '55.00', 11, '7', '/Proj/images/products/3fcbc39164f23db79bb3dcdcddcb99c1.jpg', 'Very good shoes', 1, '34:2,35:5,40:1'),
(44, 0, 'Bandana', '3.00', '4.00', 11, '8', '/Proj/images/products/f821accd32c8ee879f9948747139a2a1.jpg', 'Flex with this bandana', 1, 'small:2,medium:1'),
(45, 0, 'Necklace', '35.07', '45.00', 9, '17', '/Proj/images/products/90aa59c9f1c19905d4e72fef1c8e8288.jpg', 'This Necklace is going to look nice on you.So please try it!', 1, 'small:5'),
(46, 0, 'Sea blue shirt', '56.00', '67.00', 2, '15', '/Proj/images/products/b1ed5eab555848dc808ca0f9f09b9cdc.jpg', 'This shirt will look gorgeous on you.Try it!', 1, 'small:3,medium:1,large:2'),
(47, 0, 'Golden chain', '15.00', '25.00', 10, '8', '/Proj/images/products/6efd9d20bd25dda54bf3525778fd1856.jpg', 'This chain will look good on you', 1, 'small:3,medium:2'),
(48, 0, 'Fine Home Decor', '34.00', '44.00', 8, '26', '/Proj/images/products/6565185da81ac4dbcdd31d549b7eacf4.jpg', 'This will make your house look nice', 1, 'small:2'),
(49, 0, 'Flexible Pants', '23.00', '33.00', 9, '30', '/Proj/images/products/0dcb488e2523a8451f0f89f9c7114108.jpg', 'You will really enjoy this pants', 1, 'small:2,large:1'),
(50, 0, 'Hand Band', '5.00', '10.00', 6, '8', '/Proj/images/products/0a1eac15024a21b6d6a21ebe8c767f3f.jpg', 'This band will look gorgeous on you', 1, 'small:2,medium:1'),
(51, 0, 'Blue Cap', '23.00', '33.00', 6, '8', '/Proj/images/products/3cdbb4462689b154a599e28307a58ca8.jpg', 'This Cap will really look nice on you', 1, 'small:2,large:1'),
(52, 0, 'Necklace', '35.00', '45.00', 9, '17', '/Proj/images/products/92715acecc08ab1aaf12e5e9da3ea459.jpg', 'This Necklace is going to look nice on you yeah', 0, 'small:5'),
(53, 0, 'Body Builder syrup', '34.32', '44.32', 10, '13', '/Proj/images/products/f5434597b343b545260fad0c45fd57cd.jpg', 'This body building syrup will make you grow muscular.Try it!', 1, '45:3,36:4'),
(54, 0, 'Kingzkid', '34.00', '56.00', 2, '29', '/Proj/images/products/e5e6ef5a85d320ecc786f267be82fb12.jpg', 'fkndpkfsf', 1, '40:3,45:4');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(175) COLLATE utf8_unicode_ci NOT NULL,
  `street` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `street2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(175) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(175) COLLATE utf8_unicode_ci NOT NULL,
  `zip_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(175) COLLATE utf8_unicode_ci NOT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `tax` decimal(10,2) NOT NULL,
  `grand_total` decimal(10,2) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `txn_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `cart_id`, `full_name`, `email`, `street`, `street2`, `city`, `state`, `zip_code`, `country`, `sub_total`, `tax`, `grand_total`, `description`, `txn_date`) VALUES
(1, 1, 'Mireku Nicholas Asante', 'nicholasmireku100@gmail.com', 'P.O.Box AN 16969 Accra-North', '', '', 'Accra', '0010118456', 'Ghana', '32.20', '2.80', '35.00', '1 item from NIKs CLOTHING.', '2018-08-29 11:13:28'),
(2, 1, 'Mireku Nicholas Asante', 'nicholasmireku100@gmail.com', 'P.O.Box AN 16969 Accra-North', '', 'Akweteyman', 'Accra', '0010118456', 'Ghana', '32.20', '2.80', '35.00', '1 item from NIKs CLOTHING.', '2018-08-29 11:26:14'),
(3, 2, 'Ebo Martin Essilfie', 'ebomartin@yahoo.com', 'P.O.Box AN 134', '', 'Taifa', 'Accra', '304-29495-23', 'Ghana', '6.00', '0.52', '6.52', '2 items from NIKs CLOTHING.', '2018-08-29 11:41:45'),
(4, 4, 'Ebo Martin Essilfie', 'ebomartin@yahoo.com', 'P.O.Box AN 134', '', 'Taifa', 'Accra', '304-29495-23', 'Ghana', '68.64', '5.97', '74.61', '2 items from NIKs CLOTHING.', '2018-09-03 18:44:39'),
(5, 5, 'kjbojb', 'ebomartin@yahoo.com', 'P.O.Box AN 134', '', 'Taifa', 'Accra', '304-29495-23', 'Ghana', '45.00', '3.92', '48.92', '1 item from NIKs CLOTHING.', '2018-09-26 14:01:08'),
(6, 6, 'Ebo Martin Essilfie', 'ebomartin@yahoo.com', 'P.O.Box AN 134', '', 'Taifa', 'Accra', '304-29495-23', 'Ghana', '30.99', '2.70', '33.69', '1 item from NIKs CLOTHING.', '2018-10-04 23:40:58'),
(7, 7, 'eswds', 'dff@gmail.com', 'ffd', 'fdsf', 'sfd', 'dsfc', 'fsfdf', 'fsf', '20.99', '1.83', '22.82', '1 item from NIKs CLOTHING.', '2019-01-28 13:06:50'),
(8, 8, 'dsf', 'f@fd.cr', 'ds', 's', 's', 'd', 'f', 't', '41.98', '3.65', '45.63', '2 items from NIKs CLOTHING.', '2019-01-31 18:48:53'),
(9, 9, 'oibi', 'jdjs@ds.com', 'snfds', 'fdoisf', 'diusufd', 'nfid', 'bjsfs', 'jsf', '32.20', '2.80', '35.00', '1 item from NIKs CLOTHING.', '2019-02-05 15:03:37'),
(10, 10, 'lkmflew', 'dkfmd@kmfds.com', 'mfkd', 'nfj', 'ngid', 'kgf', 'kfn', 'rjn', '35.00', '3.05', '38.05', '1 item from NIKs CLOTHING.', '2019-02-05 15:04:32'),
(11, 12, 'd', 'mc@gmail.com', 'jf', 'ifj', 'jd', 'je', 'je', 'dj', '30.99', '2.70', '33.69', '1 item from NIKs CLOTHING.', '2019-02-06 23:04:47'),
(12, 13, 'pomjlo', 'qij@gm.com', 'yg', 'utq', 'ug', 'gf c', 'xfcg', 'fxf', '30.00', '2.61', '32.61', '2 items from NIKs CLOTHING.', '2019-02-17 15:28:27'),
(13, 14, 'fgf', 'ebomartin@yahoo.com', 'dsf', '', 'Taifa', 'Accra', '304-29495-23', 'Ghana', '68.64', '5.97', '74.61', '2 items from NIKs CLOTHING.', '2019-02-17 20:19:44'),
(14, 15, 'Ebo Martin Essilfie', 'ebomartin@yahoo.com', 'P.O.Box AN 134', 'P.O.Box AN 134', 'Taifa', 'Accra', '304-29495-23', 'Ghana', '12.00', '1.04', '13.04', '1 item from NIKs CLOTHING.', '2019-04-16 08:25:36'),
(15, 16, 'Ebo Martin Essilfie', 'ebomartin@yahoo.com', 'P.O.Box AN 134', 'P.O.Box AN 134', 'Taifa', 'Accra', '304-29495-23', 'Ghana', '20.99', '1.83', '22.82', '1 item from NIKs CLOTHING.', '2019-05-03 20:28:06'),
(16, 17, 'Ebo Martin Essilfie', 'ebomartin@yahoo.com', 'P.O.Box AN 134', 'P.O.Box AN 134', 'Taifa', 'Accra', '304-29495-23', 'Ghana', '20.99', '1.83', '22.82', '1 item from NIKs CLOTHING.', '2019-05-03 20:49:18'),
(17, 18, 'Ebo Martin Essilfie', 'ebomartin@yahoo.com', 'P.O.Box AN 134', 'P.O.Box AN 134', 'Taifa', 'Accra', '304-29495-23', 'Ghana', '30.99', '2.70', '33.69', '1 item from NIKs CLOTHING.', '2019-05-03 20:55:44'),
(18, 18, 'Ebo Martin Essilfie', 'ebomartin@yahoo.com', 'P.O.Box AN 134', 'P.O.Box AN 134', 'Taifa', 'Accra', '304-29495-23', 'Ghana', '30.99', '2.70', '33.69', '1 item from NIKs CLOTHING.', '2019-05-03 20:57:17'),
(19, 18, 'Ebo Martin Essilfie', 'ebomartin@yahoo.com', 'P.O.Box AN 134', 'P.O.Box AN 134', 'Taifa', 'Accra', '304-29495-23', 'Ghana', '30.99', '2.70', '33.69', '1 item from NIKs CLOTHING.', '2019-05-03 20:58:48'),
(20, 18, 'Ebo Martin Essilfie', 'ebomartin@yahoo.com', 'P.O.Box AN 134', 'P.O.Box AN 134', 'Taifa', 'Accra', '304-29495-23', 'Ghana', '30.99', '2.70', '33.69', '1 item from NIKs CLOTHING.', '2019-05-03 21:00:14'),
(21, 19, 'aw', 'ebomartin@yahoo.com', 'P.O.Box AN 134', 'P.O.Box AN 134', 'Taifa', 'Accra', '304-29495-23', 'Ghana', '30.00', '2.61', '32.61', '2 items from NIKs CLOTHING.', '2019-05-03 21:22:47'),
(22, 21, 'sfshipo', 'nicholasmireku100@gmail.com', 'dkjlols', 'mfdl', 'osngol', 'kdk', 'nk', 'kfg', '20.99', '1.83', '22.82', '1 item from NIKs CLOTHING.', '2020-08-03 09:02:22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(175) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `join_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` datetime NOT NULL,
  `permissions` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `join_date`, `last_login`, `permissions`) VALUES
(1, 'nicholas mireku', 'nicholasmireku100@gmail.com', 'namireku', '2018-05-17 15:32:10', '2020-08-03 12:58:30', 'admin,editor'),
(3, 'ebo martin', 'ebomartin@yahoo.com', 'ebocomputer', '2018-05-18 20:05:12', '2018-08-25 09:39:07', 'editor');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
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
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
