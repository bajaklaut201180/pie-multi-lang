-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 24, 2018 at 06:07 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `deliverpie`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `unique_id` int(11) NOT NULL,
  `privileges_id` int(11) NOT NULL,
  `admin_name` int(11) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_phone` varchar(50) NOT NULL,
  `admin_username` varchar(50) NOT NULL,
  `admin_password` varchar(50) NOT NULL,
  `flag` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `unique_id`, `privileges_id`, `admin_name`, `admin_email`, `admin_phone`, `admin_username`, `admin_password`, `flag`) VALUES
(1, 1, 1, 0, '', '', 'superadmin', '889a3a791b3875cfae413574b53da4bb8a90d53e', 1),
(2, 2, 2, 0, '', '', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 1),
(3, 3, 3, 0, '', '', 'special', 'ba36b97a41e7faf742ab09bf88405ac04f99599a', 1);

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `article_id` int(11) NOT NULL,
  `unique_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `article_name` varchar(50) NOT NULL,
  `article_head` varchar(50) NOT NULL,
  `seo_url` varchar(50) NOT NULL,
  `article_section` int(11) NOT NULL,
  `article_content` text NOT NULL,
  `article_image` varchar(50) NOT NULL,
  `flag` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`article_id`, `unique_id`, `language_id`, `article_name`, `article_head`, `seo_url`, `article_section`, `article_content`, `article_image`, `flag`) VALUES
(1, 1, 1, 'artikel bahasa indonesia', '', '', 0, '', '', 1),
(2, 1, 2, 'english article', '', '', 0, '', '', 1),
(3, 2, 1, 'artike 2 bahasa', '', '', 0, '', '', 1),
(4, 2, 2, 'english 2 article', '', '', 0, '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `banner_id` int(11) NOT NULL,
  `unique_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_name` varchar(50) NOT NULL,
  `banner_caption` varchar(50) NOT NULL,
  `banner_image` varchar(255) NOT NULL,
  `banner_description` text NOT NULL,
  `url` varchar(255) NOT NULL,
  `flag` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`banner_id`, `unique_id`, `language_id`, `banner_name`, `banner_caption`, `banner_image`, `banner_description`, `url`, `flag`) VALUES
(1, 1, 0, 'tess 1', 'test 1', '', '', 'test 1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `unique_id` int(11) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_email` varchar(255) DEFAULT NULL,
  `customer_username` varchar(255) DEFAULT NULL,
  `customer_password` varchar(255) DEFAULT NULL,
  `customer_phone` int(11) DEFAULT NULL,
  `customer_place_birth` varchar(100) DEFAULT NULL,
  `customer_date_birth` datetime DEFAULT NULL,
  `customer_agreement` tinyint(4) DEFAULT '0',
  `created_on` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_at` datetime DEFAULT NULL,
  `flag` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gallery_category`
--

CREATE TABLE `gallery_category` (
  `gallery_category_id` int(11) NOT NULL,
  `unique_id` int(11) NOT NULL,
  `gallery_category_name` varchar(50) NOT NULL,
  `seo_url` varchar(50) NOT NULL,
  `gallery_category_type` tinyint(4) NOT NULL,
  `gallery_category_parent` tinyint(4) NOT NULL,
  `flag` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `item_id` int(11) NOT NULL,
  `unique_id` int(11) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `item_name` varchar(50) NOT NULL,
  `seo_url` varchar(50) NOT NULL,
  `item_category` int(11) NOT NULL,
  `item_image` varchar(50) NOT NULL,
  `item_content` text NOT NULL,
  `flag` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `language_id` int(11) NOT NULL,
  `unique_id` int(11) NOT NULL,
  `language_name` varchar(50) NOT NULL,
  `lang_name` varchar(50) NOT NULL,
  `image_class` varchar(50) NOT NULL,
  `flag` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`language_id`, `unique_id`, `language_name`, `lang_name`, `image_class`, `flag`) VALUES
(1, 1, 'indonesia', 'id', 'flag-icon-id', 1),
(2, 2, 'english', 'en', 'flag-icon-gb', 1),
(3, 3, 'china', 'cn', 'flag-icon-cn', 1),
(4, 4, 'france', 'fr', '', 0),
(5, 5, 'spain', 'es', '', 0),
(6, 6, 'japan', 'jp', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `log_id` int(11) NOT NULL,
  `log_admin_id` int(11) NOT NULL,
  `log_action` varchar(250) NOT NULL,
  `log_db` varchar(250) NOT NULL,
  `log_value` int(11) NOT NULL,
  `log_name` varchar(250) NOT NULL,
  `log_desc` varchar(250) NOT NULL,
  `log_ip` varchar(20) NOT NULL,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`log_id`, `log_admin_id`, `log_action`, `log_db`, `log_value`, `log_name`, `log_desc`, `log_ip`, `log_date`) VALUES
(1, 1, 'ADD', 'section', 11, 'banners home', 'ADDED section ( banners home )', '::1', '2017-07-10 08:59:20'),
(2, 1, 'ADD', 'section', 12, 'banner homes', 'ADDED section ( banner homes )', '::1', '2017-07-10 09:02:41'),
(3, 1, 'UPDATED', 'section', 7, 'Users', 'MODIFY section ( Users )', '::1', '2017-07-10 09:59:44'),
(4, 1, 'UPDATED', 'section', 7, 'User', 'MODIFY section ( User )', '::1', '2017-07-10 09:59:53'),
(5, 1, 'UPDATED', 'section', 1, 'Settings', 'MODIFY section ( Settings )', '::1', '2017-07-10 10:00:00'),
(6, 1, 'UPDATED', 'section', 1, 'Setting', 'MODIFY section ( Setting )', '::1', '2017-07-10 10:00:09'),
(7, 1, 'UPDATED', 'section', 8, 'Banner', 'MODIFY section ( Banner )', '::1', '2017-07-10 10:06:47'),
(8, 1, 'UPDATED', 'section', 8, 'Banner', 'MODIFY section ( Banner )', '::1', '2017-07-10 10:10:06'),
(9, 1, 'UPDATED', 'section', 8, 'Banner', 'MODIFY section ( Banner )', '::1', '2017-07-10 10:10:25'),
(10, 1, 'UPDATED', 'section', 1, 'Setting', 'MODIFY section ( Setting )', '::1', '2017-07-10 10:27:14'),
(11, 1, 'UPDATED', 'section', 1, 'Setting', 'MODIFY section ( Setting )', '::1', '2017-07-10 10:27:23'),
(12, 1, 'ADD', 'section', 13, 'test', 'ADDED section ( test )', '::1', '2017-07-10 10:45:46'),
(13, 1, 'UPDATED', 'section', 13, 'test', 'MODIFY section ( test )', '::1', '2017-07-10 10:46:13'),
(14, 1, 'UPDATED', 'section', 13, 'Photo', 'MODIFY section ( Photo )', '::1', '2017-07-10 10:47:07'),
(15, 1, 'ADD', 'banner', 1, 'tess 1', 'ADDED banner ( tess 1 )', '::1', '2017-07-25 03:12:52'),
(16, 1, 'UPDATED', 'admin', 3, '0', 'MODIFY admin ( 0 )', '::1', '2017-08-13 17:34:39'),
(17, 1, 'UPDATED', 'admin', 3, '0', 'MODIFY admin ( 0 )', '::1', '2017-08-13 17:35:28'),
(18, 1, 'UPDATED', 'admin', 3, '0', 'MODIFY admin ( 0 )', '::1', '2017-08-14 04:27:19'),
(19, 1, 'UPDATED', 'admin', 3, '0', 'MODIFY admin ( 0 )', '::1', '2017-08-14 04:28:27'),
(20, 1, 'UPDATED', 'admin', 3, '0', 'MODIFY admin ( 0 )', '::1', '2017-08-14 08:46:26'),
(21, 1, 'UPDATED', 'admin', 3, '0', 'MODIFY admin ( 0 )', '::1', '2017-08-15 04:29:17'),
(22, 1, 'UPDATED', 'admin', 3, '0', 'MODIFY admin ( 0 )', '::1', '2017-08-15 04:29:50'),
(23, 1, 'UPDATED', 'admin', 3, '0', 'MODIFY admin ( 0 )', '::1', '2017-08-15 04:29:56'),
(24, 1, 'UPDATED', 'admin', 3, '0', 'MODIFY admin ( 0 )', '::1', '2017-08-15 04:30:06'),
(25, 1, 'UPDATED', 'admin', 3, '0', 'MODIFY admin ( 0 )', '::1', '2017-08-15 04:30:19'),
(26, 1, 'UPDATED', 'admin', 3, '0', 'MODIFY admin ( 0 )', '::1', '2017-08-15 04:30:28'),
(27, 1, 'UPDATED', 'admin', 3, '0', 'MODIFY admin ( 0 )', '::1', '2017-08-15 04:30:37'),
(28, 1, 'UPDATED', 'admin', 3, '0', 'MODIFY admin ( 0 )', '::1', '2017-08-15 04:34:33'),
(29, 1, 'UPDATED', 'admin', 3, '0', 'MODIFY admin ( 0 )', '::1', '2017-08-17 19:53:00'),
(30, 1, 'UPDATED', 'admin', 3, '0', 'MODIFY admin ( 0 )', '::1', '2017-08-17 19:53:09'),
(31, 1, 'UPDATED', 'admin', 3, '0', 'MODIFY admin ( 0 )', '::1', '2017-08-17 19:53:23'),
(32, 1, 'UPDATED', 'admin', 3, '0', 'MODIFY admin ( 0 )', '::1', '2017-08-17 19:54:05'),
(33, 1, 'UPDATED', 'admin', 3, '0', 'MODIFY admin ( 0 )', '::1', '2017-08-17 19:54:24'),
(34, 1, 'UPDATED', 'admin', 3, '0', 'MODIFY admin ( 0 )', '::1', '2017-08-17 19:54:34'),
(35, 1, 'UPDATED', 'admin', 3, '0', 'MODIFY admin ( 0 )', '::1', '2017-08-17 19:54:45'),
(36, 1, 'UPDATED', 'admin', 3, '0', 'MODIFY admin ( 0 )', '::1', '2017-08-17 19:57:45'),
(37, 1, 'UPDATED', 'admin', 3, '0', 'MODIFY admin ( 0 )', '::1', '2017-08-17 19:58:32'),
(38, 1, 'UPDATED', 'admin', 3, '0', 'MODIFY admin ( 0 )', '::1', '2017-08-17 19:59:00'),
(39, 1, 'UPDATED', 'admin', 3, '0', 'MODIFY admin ( 0 )', '::1', '2017-08-17 20:00:36'),
(40, 1, 'UPDATED', 'admin', 3, '0', 'MODIFY admin ( 0 )', '::1', '2017-08-17 20:00:53'),
(41, 1, 'ADD', 'section', 14, 'Article', 'ADDED section ( Article )', '::1', '2018-05-25 08:35:55'),
(42, 1, 'ADD', 'section', 15, 'Language', 'ADDED section ( Language )', '::1', '2018-05-25 08:58:34');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `message_id` int(11) NOT NULL,
  `message_name` varchar(250) NOT NULL,
  `message_address` text NOT NULL,
  `message_email` varchar(250) NOT NULL,
  `message_phone` varchar(250) NOT NULL,
  `message_company` varchar(250) NOT NULL,
  `message_subject` varchar(250) NOT NULL,
  `message_content` text NOT NULL,
  `message_reply` text NOT NULL,
  `message_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `flag` tinyint(4) NOT NULL DEFAULT '2',
  `replied` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `news_id` int(11) NOT NULL,
  `unique_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `news_name` varchar(50) NOT NULL,
  `seo_url` varchar(50) NOT NULL,
  `news_type` varchar(50) NOT NULL,
  `news_image` varchar(50) NOT NULL,
  `news_content` varchar(50) NOT NULL,
  `news_start` datetime NOT NULL,
  `news_end` datetime NOT NULL,
  `flag` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

CREATE TABLE `photo` (
  `photo_id` int(11) NOT NULL,
  `unique_id` int(11) NOT NULL,
  `photo_name` varchar(50) NOT NULL,
  `seo_url` varchar(50) NOT NULL,
  `photo_category` int(11) NOT NULL,
  `photo_image` varchar(50) NOT NULL,
  `flag` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `privileges`
--

CREATE TABLE `privileges` (
  `privileges_id` int(11) NOT NULL,
  `unique_id` int(11) NOT NULL,
  `privileges_name` varchar(50) NOT NULL,
  `flag` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `privileges`
--

INSERT INTO `privileges` (`privileges_id`, `unique_id`, `privileges_name`, `flag`) VALUES
(1, 1, 'Super Admin', 1),
(2, 2, 'Administrator', 1),
(3, 3, 'Special', 1);

-- --------------------------------------------------------

--
-- Table structure for table `privileges_status`
--

CREATE TABLE `privileges_status` (
  `privileges_status_id` int(11) NOT NULL,
  `unique_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `privileges_status_read` tinyint(4) NOT NULL,
  `privileges_status_update` tinyint(4) NOT NULL,
  `privileges_status_delete` tinyint(4) NOT NULL,
  `flag` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `privileges_status`
--

INSERT INTO `privileges_status` (`privileges_status_id`, `unique_id`, `admin_id`, `section_id`, `privileges_status_read`, `privileges_status_update`, `privileges_status_delete`, `flag`) VALUES
(1, 1, 1, 6, 0, 0, 1, 1),
(2, 2, 1, 7, 0, 0, 1, 1),
(3, 3, 1, 8, 0, 0, 1, 1),
(4, 4, 1, 10, 0, 0, 1, 1),
(5, 5, 1, 13, 0, 0, 1, 1),
(6, 6, 3, 6, 1, 0, 0, 1),
(7, 7, 3, 7, 1, 0, 0, 1),
(8, 8, 3, 8, 0, 0, 0, 1),
(9, 9, 3, 10, 0, 0, 0, 1),
(10, 10, 3, 13, 0, 0, 0, 1),
(11, 11, 2, 6, 0, 1, 0, 1),
(12, 12, 2, 7, 1, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `product_category_id` int(11) NOT NULL,
  `unique_id` int(11) NOT NULL,
  `product_category_name` varchar(50) NOT NULL,
  `seo_url` varchar(50) NOT NULL,
  `product_category_parent` int(11) NOT NULL,
  `flag` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `section_id` int(11) NOT NULL,
  `unique_id` int(11) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `section_name` varchar(50) NOT NULL,
  `section_parent` tinyint(4) NOT NULL,
  `flag` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`section_id`, `unique_id`, `language_id`, `section_name`, `section_parent`, `flag`) VALUES
(1, 1, NULL, 'Setting', 0, 1),
(2, 2, NULL, 'Content', 0, 1),
(3, 3, NULL, 'Media', 0, 1),
(4, 4, NULL, 'Gallery', 0, 1),
(5, 5, NULL, 'Documentation', 0, 1),
(6, 6, NULL, 'Section', 1, 1),
(7, 7, NULL, 'User', 1, 1),
(8, 8, NULL, 'Banner', 2, 1),
(9, 9, NULL, 'banner home', 2, 1),
(10, 10, NULL, 'log', 5, 1),
(11, 11, NULL, 'Gallery Category', 4, 1),
(12, 12, NULL, 'Video', 4, 1),
(13, 13, NULL, 'Photo', 4, 1),
(14, 14, NULL, 'Article', 2, 1),
(15, 15, NULL, 'Language', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `setting_id` int(11) NOT NULL,
  `setting_name` varchar(50) NOT NULL,
  `setting_address` varchar(50) NOT NULL,
  `setting_country` varchar(50) NOT NULL,
  `setting_city` varchar(50) NOT NULL,
  `setting_postcode` varchar(50) NOT NULL,
  `setting_phone` varchar(50) NOT NULL,
  `setting_mobile` varchar(50) NOT NULL,
  `setting_email` varchar(50) NOT NULL,
  `setting_facebook` varchar(50) NOT NULL,
  `setting_twitter` varchar(50) NOT NULL,
  `setting_google_map` varchar(50) NOT NULL,
  `setting_google_analytics` varchar(50) NOT NULL,
  `setting_web_title` varchar(50) NOT NULL,
  `setting_web_motto` varchar(50) NOT NULL,
  `setting_web_logo` varchar(50) NOT NULL,
  `setting_favicon` varchar(50) NOT NULL,
  `setting_meta_desc` varchar(50) NOT NULL,
  `setting_meta_key` varchar(50) NOT NULL,
  `flag` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`setting_id`, `setting_name`, `setting_address`, `setting_country`, `setting_city`, `setting_postcode`, `setting_phone`, `setting_mobile`, `setting_email`, `setting_facebook`, `setting_twitter`, `setting_google_map`, `setting_google_analytics`, `setting_web_title`, `setting_web_motto`, `setting_web_logo`, `setting_favicon`, `setting_meta_desc`, `setting_meta_key`, `flag`) VALUES
(1, 'ycms company', 'testing - testing', 'indonesia', 'bogor', '123456', '1234567890', '1234 5678 9', 'test@info.com', 'facebook accounts', 'twitter accounts', '', '', 'ycms', 'test', 'logo.png', 'Y-logo.ico', 'tets test tes', 'test tes', 1);

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE `video` (
  `video_id` int(11) NOT NULL,
  `unique_id` int(11) NOT NULL,
  `video_name` varchar(50) NOT NULL,
  `seo_url` varchar(50) NOT NULL,
  `video_category` int(11) NOT NULL,
  `video_link` varchar(50) NOT NULL,
  `flag` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`article_id`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `gallery_category`
--
ALTER TABLE `gallery_category`
  ADD PRIMARY KEY (`gallery_category_id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`language_id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`photo_id`);

--
-- Indexes for table `privileges`
--
ALTER TABLE `privileges`
  ADD PRIMARY KEY (`privileges_id`);

--
-- Indexes for table `privileges_status`
--
ALTER TABLE `privileges_status`
  ADD PRIMARY KEY (`privileges_status_id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`product_category_id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`section_id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`video_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gallery_category`
--
ALTER TABLE `gallery_category`
  MODIFY `gallery_category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `photo`
--
ALTER TABLE `photo`
  MODIFY `photo_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `privileges`
--
ALTER TABLE `privileges`
  MODIFY `privileges_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `privileges_status`
--
ALTER TABLE `privileges_status`
  MODIFY `privileges_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `product_category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `video_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
