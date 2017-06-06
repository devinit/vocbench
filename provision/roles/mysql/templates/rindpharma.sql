-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2017 at 06:16 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `rindpharma`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
`id` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `profile_pic` varchar(200) NOT NULL DEFAULT 'admins/default_admin.png',
  `email` varchar(100) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `previledge` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
`id` int(11) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telephone` varchar(50) DEFAULT NULL,
  `last_interaction` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
`id` int(11) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `image_url` varchar(100) NOT NULL DEFAULT 'items/default_item.png',
  `item_description` varchar(500) NOT NULL,
  `category` varchar(50) NOT NULL,
  `buying_price` int(11) NOT NULL,
  `selling_price` int(11) NOT NULL,
  `added_by` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prescriptionaccess`
--

CREATE TABLE IF NOT EXISTS `prescriptionaccess` (
`id` int(11) NOT NULL,
  `access_code` varchar(100) NOT NULL,
  `prescription_no` int(11) NOT NULL,
  `seen_status` tinyint(4) NOT NULL DEFAULT '0',
  `last_seen` datetime NOT NULL,
  `active_status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prescriptions`
--

CREATE TABLE IF NOT EXISTS `prescriptions` (
`id` int(11) NOT NULL,
  `client` int(11) NOT NULL,
  `results_url` varchar(100) NOT NULL,
  `prescription` text NOT NULL,
  `date_submited` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `prescribed_by` int(11) DEFAULT NULL,
  `prescription_status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
`id` int(11) NOT NULL,
  `client` int(11) NOT NULL,
  `question` mediumtext NOT NULL,
  `date_posted` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `answer` text NOT NULL,
  `date_answered` datetime NOT NULL,
  `answered_by` int(11) DEFAULT NULL,
  `answered` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE IF NOT EXISTS `quotations` (
`id` int(11) NOT NULL,
  `client` int(11) NOT NULL,
  `organization` varchar(100) NOT NULL,
  `date_of_quotation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `processed` tinyint(4) NOT NULL DEFAULT '0',
  `date_processed` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `quotes`
--

CREATE TABLE IF NOT EXISTS `quotes` (
`id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quotation_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resptokens`
--

CREATE TABLE IF NOT EXISTS `resptokens` (
`id` int(11) NOT NULL,
  `access_token` varchar(100) NOT NULL,
  `query_no` int(11) NOT NULL,
  `seen_status` tinyint(4) NOT NULL,
  `active_status` tinyint(4) NOT NULL,
  `last_seen` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tips`
--

CREATE TABLE IF NOT EXISTS `tips` (
`id` int(11) NOT NULL,
  `tip` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `email` (`email`,`telephone`), ADD KEY `first_name` (`first_name`,`last_name`,`password`), ADD KEY `profile_pic` (`profile_pic`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `telephone` (`telephone`), ADD UNIQUE KEY `email` (`email`), ADD KEY `first_name` (`first_name`,`last_name`,`email`,`telephone`,`last_interaction`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
 ADD PRIMARY KEY (`id`), ADD KEY `item_name` (`item_name`,`item_description`,`selling_price`), ADD KEY `category` (`category`), ADD KEY `added_by` (`added_by`), ADD KEY `date_added` (`date_added`), ADD KEY `last_update` (`last_update`);

--
-- Indexes for table `prescriptionaccess`
--
ALTER TABLE `prescriptionaccess`
 ADD PRIMARY KEY (`id`), ADD KEY `access_code` (`access_code`,`prescription_no`), ADD KEY `prescription_no` (`prescription_no`);

--
-- Indexes for table `prescriptions`
--
ALTER TABLE `prescriptions`
 ADD PRIMARY KEY (`id`), ADD KEY `client_email` (`results_url`,`prescribed_by`), ADD KEY `prescribed_by` (`prescribed_by`), ADD KEY `client` (`client`), ADD KEY `date_submited` (`date_submited`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
 ADD PRIMARY KEY (`id`), ADD KEY `date_answered` (`date_answered`), ADD KEY `answered_by` (`answered_by`), ADD KEY `client` (`client`);

--
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
 ADD PRIMARY KEY (`id`), ADD KEY `customer_name` (`client`,`date_of_quotation`), ADD KEY `client` (`client`), ADD KEY `organization` (`organization`), ADD KEY `date_processed` (`date_processed`);

--
-- Indexes for table `quotes`
--
ALTER TABLE `quotes`
 ADD PRIMARY KEY (`id`), ADD KEY `item_id` (`item_id`), ADD KEY `quotation-id` (`quotation_id`);

--
-- Indexes for table `resptokens`
--
ALTER TABLE `resptokens`
 ADD PRIMARY KEY (`id`), ADD KEY `access_token` (`access_token`,`query_no`,`last_seen`), ADD KEY `query_no` (`query_no`);

--
-- Indexes for table `tips`
--
ALTER TABLE `tips`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `prescriptionaccess`
--
ALTER TABLE `prescriptionaccess`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `prescriptions`
--
ALTER TABLE `prescriptions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `quotes`
--
ALTER TABLE `quotes`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `resptokens`
--
ALTER TABLE `resptokens`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tips`
--
ALTER TABLE `tips`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `prescriptionaccess`
--
ALTER TABLE `prescriptionaccess`
ADD CONSTRAINT `prescriptionaccess_ibfk_1` FOREIGN KEY (`prescription_no`) REFERENCES `prescriptions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prescriptions`
--
ALTER TABLE `prescriptions`
ADD CONSTRAINT `prescriptions_ibfk_1` FOREIGN KEY (`prescribed_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `prescriptions_ibfk_2` FOREIGN KEY (`client`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`answered_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`client`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quotations`
--
ALTER TABLE `quotations`
ADD CONSTRAINT `quotations_ibfk_1` FOREIGN KEY (`client`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quotes`
--
ALTER TABLE `quotes`
ADD CONSTRAINT `quotes_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `resptokens`
--
ALTER TABLE `resptokens`
ADD CONSTRAINT `resptokens_ibfk_1` FOREIGN KEY (`query_no`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
