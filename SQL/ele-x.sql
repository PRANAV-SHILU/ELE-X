-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 14, 2025 at 11:38 AM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ele-x`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE IF NOT EXISTS `admin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(20) DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `role`, `created_at`) VALUES
(1, 'admin_pranav', 'admin_hashed_1', 'superadmin', NULL),
(2, 'support_admin', 'admin_hashed_2', 'moderator', NULL),
(3, 'catalog_admin', 'admin_hashed_3', 'editor', NULL),
(4, 'order_admin', 'admin_hashed_4', 'manager', NULL),
(5, 'faq_admin', 'admin_hashed_5', 'support', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE IF NOT EXISTS `cart_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `user_id`, `product_id`, `quantity`, `created_at`) VALUES
(1, 1, 1, 1, '2025-06-14 11:35:44'),
(2, 2, 3, 2, '2025-06-14 11:35:44'),
(3, 3, 2, 1, '2025-06-14 11:35:44'),
(4, 4, 5, 3, '2025-06-14 11:35:44'),
(5, 5, 4, 2, '2025-06-14 11:35:44');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

DROP TABLE IF EXISTS `contact_messages`;
CREATE TABLE IF NOT EXISTS `contact_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `subject` varchar(150) DEFAULT NULL,
  `message` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `subject`, `message`, `created_at`) VALUES
(1, 'Aditya Roy', 'aditya@mail.com', 'Order Delay', 'My order is delayed for 4 days. Please help.', '2025-06-14 11:36:49'),
(2, 'Sneha Pillai', 'sneha@elex.com', 'Product Inquiry', 'Is the smartwatch waterproof?', '2025-06-14 11:36:49'),
(3, 'Vikram Desai', 'vikram@xyz.com', 'Refund Request', 'I want a refund for a damaged product.', '2025-06-14 11:36:49'),
(4, 'Sonal Yadav', 'sonal@elex.com', 'Login Issue', 'I forgot my password and cannot log in.', '2025-06-14 11:36:49'),
(5, 'Rohit Singh', 'rohit@elex.com', 'Review Problem', 'My review is not showing on the product page.', '2025-06-14 11:36:49');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT 'Pending',
  `order_status` varchar(20) DEFAULT 'Processing',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_amount`, `payment_status`, `order_status`, `created_at`) VALUES
(1, 1, '79999.00', 'Paid', 'Delivered', '2025-06-14 11:35:59'),
(2, 2, '8998.00', 'Paid', 'Shipped', '2025-06-14 11:35:59'),
(3, 3, '1499.00', 'Pending', 'Processing', '2025-06-14 11:35:59'),
(4, 4, '1798.00', 'Paid', 'Out for Delivery', '2025-06-14 11:35:59'),
(5, 5, '2999.00', 'Failed', 'Cancelled', '2025-06-14 11:35:59');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price_at_purchase` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price_at_purchase`, `created_at`) VALUES
(1, 1, 1, 1, '79999.00', '2025-06-14 11:36:10'),
(2, 2, 5, 2, '899.00', '2025-06-14 11:36:10'),
(3, 3, 2, 1, '1499.00', '2025-06-14 11:36:10'),
(4, 4, 5, 2, '899.00', '2025-06-14 11:36:10'),
(5, 5, 4, 1, '2999.00', '2025-06-14 11:36:10');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `short_description` varchar(255) DEFAULT NULL,
  `long_description` text,
  `price` decimal(10,2) NOT NULL,
  `discount_price` decimal(10,2) DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `thumbnail_url` varchar(255) DEFAULT NULL,
  `image_gallery` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `short_description`, `long_description`, `price`, `discount_price`, `stock`, `category`, `brand`, `thumbnail_url`, `image_gallery`, `created_at`) VALUES
(1, 'Samsung Galaxy S25 Edge 5G', 'Flagship smartphone', 'Latest Galaxy with AI camera and curved display', '84999.00', '79999.00', 50, 'Smartphones', 'Samsung', '../images/s25edge.jpg', 's25_1.jpg,s25_2.jpg', '2025-06-14 11:35:33'),
(2, 'Bluetooth Speaker', 'Portable speaker', 'Compact wireless speaker with deep bass and 12-hour playtime.', '2299.00', '1499.00', 100, 'Audio', 'boAt', '../images/Bluetooth_Speaker.jpg', 'spk1.jpg,spk2.jpg', '2025-06-14 11:35:33'),
(3, 'External Hard Drive 1TB', 'Fast storage', 'External HDD USB 3.0 compatible with all OS.', '5499.00', '4499.00', 70, 'Storage', 'Seagate', '../images/external-hard-drive-1tb.jpg', 'hdd1.jpg,hdd2.jpg', '2025-06-14 11:35:33'),
(4, 'NoiseFit Smartwatch', 'Fitness Tracker', 'Bluetooth smartwatch with heart-rate monitoring and 7-day battery', '3999.00', '2999.00', 120, 'Wearables', 'Noise', '../images/noisefit.jpg', 'watch1.jpg,watch2.jpg', '2025-06-14 11:35:33'),
(5, 'HP Wireless Mouse', '2.4GHz Wireless Mouse', 'Ergonomic design with fast response and long battery life.', '1299.00', '899.00', 200, 'Accessories', 'HP', '../images/mouse.jpg', 'mouse1.jpg,mouse2.jpg', '2025-06-14 11:35:33');

-- --------------------------------------------------------

--
-- Table structure for table `product_faqs`
--

DROP TABLE IF EXISTS `product_faqs`;
CREATE TABLE IF NOT EXISTS `product_faqs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `question` text NOT NULL,
  `answer` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_faqs`
--

INSERT INTO `product_faqs` (`id`, `product_id`, `question`, `answer`, `created_at`) VALUES
(1, 1, 'Does the Galaxy S25 support wireless charging?', 'Yes, it supports 50W wireless charging.', '2025-06-14 11:36:35'),
(2, 2, 'Is it waterproof?', 'No, it is splash resistant only.', '2025-06-14 11:36:35'),
(3, 3, 'Can it be connected to Mac?', 'Yes, it supports macOS via USB 3.0.', '2025-06-14 11:36:35'),
(4, 4, 'Is this smartwatch compatible with iPhone?', 'Yes, via the NoiseFit app.', '2025-06-14 11:36:35'),
(5, 5, 'Does the mouse work with Windows 11?', 'Yes, fully compatible.', '2025-06-14 11:36:35');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

DROP TABLE IF EXISTS `product_reviews`;
CREATE TABLE IF NOT EXISTS `product_reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `comment` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `product_id`, `user_id`, `rating`, `comment`, `created_at`) VALUES
(1, 1, 1, 5, 'Outstanding device, loved the camera!', '2025-06-14 11:36:23'),
(2, 2, 3, 4, 'Good bass but volume could be louder.', '2025-06-14 11:36:23'),
(3, 3, 2, 5, 'Fast transfer speed and compact design.', '2025-06-14 11:36:23'),
(4, 5, 4, 3, 'Decent but battery life is short.', '2025-06-14 11:36:23'),
(5, 4, 5, 5, 'Very accurate tracking and responsive display.', '2025-06-14 11:36:23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `phone`, `address`, `created_at`) VALUES
(1, 'Pranav Sharma', 'pranav@elex.com', 'hashed_pwd1', '9876543210', 'Pune, Maharashtra', '2025-06-14 11:34:57'),
(2, 'Riya Mehta', 'riya@elex.com', 'hashed_pwd2', '9123456789', 'Delhi, India', '2025-06-14 11:34:57'),
(3, 'Aman Verma', 'aman@elex.com', 'hashed_pwd3', '9012345678', 'Lucknow, UP', '2025-06-14 11:34:57'),
(4, 'Neha Joshi', 'neha@elex.com', 'hashed_pwd4', '9988776655', 'Bangalore, KA', '2025-06-14 11:34:57'),
(5, 'Rahul Khanna', 'rahul@elex.com', 'hashed_pwd5', '9001122334', 'Mumbai, MH', '2025-06-14 11:34:57');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
