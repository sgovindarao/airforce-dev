-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2014 at 08:07 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `afpms`
--

-- --------------------------------------------------------

--
-- Table structure for table `afpms_circular_amount_info`
--

CREATE TABLE IF NOT EXISTS `afpms_circular_amount_info` (
  `id` bigint(19) unsigned NOT NULL,
  `afpms_circular_info_id` bigint(19) unsigned NOT NULL,
  `afpms_circular_categorization_info_id` bigint(19) unsigned NOT NULL,
  `amount` bigint(19) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `afpms_circular_categorization_info`
--

CREATE TABLE IF NOT EXISTS `afpms_circular_categorization_info` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT,
  `rank` varchar(20) NOT NULL,
  `group_id` int(10) NOT NULL,
  `service_period` float unsigned NOT NULL,
  `service_type` enum('1','2') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `rank` (`rank`,`group_id`,`service_period`,`service_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `afpms_circular_categorization_info`
--

INSERT INTO `afpms_circular_categorization_info` (`id`, `rank`, `group_id`, `service_period`, `service_type`) VALUES
(17, 'AIR CMDE', 1, 11, '1'),
(18, 'AIR CMDE', 1, 11, '2'),
(19, 'AIR CMDE', 2, 11, '1'),
(20, 'AIR CMDE', 2, 11, '2'),
(1, 'AIR MSHL', 1, 10, '1'),
(5, 'AIR MSHL', 1, 10, '2'),
(2, 'AIR MSHL', 2, 10, '1'),
(6, 'AIR MSHL', 2, 10, '2'),
(3, 'AIR MSHL', 3, 10, '1'),
(7, 'AIR MSHL', 3, 10, '2'),
(4, 'AIR MSHL', 4, 10, '1'),
(8, 'AIR MSHL', 4, 10, '2'),
(9, 'AVM', 1, 10.5, '1'),
(10, 'AVM', 1, 10.5, '2'),
(11, 'AVM', 2, 10.5, '1'),
(12, 'AVM', 2, 10.5, '2'),
(13, 'AVM', 3, 10.5, '1'),
(14, 'AVM', 3, 10.5, '2'),
(15, 'AVM', 4, 10.5, '1'),
(16, 'AVM', 4, 10.5, '2'),
(23, 'GP CAPT', 1, 11.5, '1'),
(24, 'GP CAPT', 1, 11.5, '2'),
(25, 'GP CAPT', 2, 11.5, '1');

-- --------------------------------------------------------

--
-- Table structure for table `afpms_circular_group_info`
--

CREATE TABLE IF NOT EXISTS `afpms_circular_group_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `group_name` varchar(49) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `afpms_circular_group_info`
--

INSERT INTO `afpms_circular_group_info` (`id`, `group_id`, `group_name`) VALUES
(1, 1, 'OTHER THAN AMC/ADC/RVC/TA/MNS'),
(2, 2, 'FROM AMC/ADC/RVC OTHER'),
(3, 3, 'OFFICERS OF TERRITORIAL ARMY'),
(4, 4, 'OFFICERS OF MILITARY NURSING SERVICE');

-- --------------------------------------------------------

--
-- Table structure for table `afpms_circular_info`
--

CREATE TABLE IF NOT EXISTS `afpms_circular_info` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT,
  `circular_no` bigint(19) unsigned NOT NULL,
  `circular_issue_date` datetime DEFAULT NULL,
  `circular_effective_date` datetime NOT NULL,
  `circular_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `circular_no_UNIQUE` (`circular_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `afpms_personal_info`
--

CREATE TABLE IF NOT EXISTS `afpms_personal_info` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(32) DEFAULT NULL,
  `last_name` varchar(32) DEFAULT NULL,
  `address1` varchar(32) DEFAULT NULL,
  `address2` varchar(32) DEFAULT NULL,
  `street` varchar(32) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(32) DEFAULT NULL,
  `pincode` mediumint(8) unsigned DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `date_of_expiry` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `afpms_personal_phone_info`
--

CREATE TABLE IF NOT EXISTS `afpms_personal_phone_info` (
  `afpms_personal_info_id` bigint(19) unsigned NOT NULL,
  `number` bigint(19) unsigned DEFAULT NULL,
  `type` enum('OFC','HMC','OFLL','HMLL','MOB') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `afpms_personal_service_duration_info`
--

CREATE TABLE IF NOT EXISTS `afpms_personal_service_duration_info` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT,
  `afpms_personal_info_id` bigint(19) unsigned NOT NULL,
  `date_of_discharge` datetime NOT NULL,
  `date_of_enrollment` datetime NOT NULL,
  `service_period` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `afpms_personal_service_identity_info`
--

CREATE TABLE IF NOT EXISTS `afpms_personal_service_identity_info` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT,
  `afpms_personal_info_id` bigint(19) unsigned NOT NULL,
  `service_no` int(11) NOT NULL,
  `membership_no` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `afpms_personal_service_info`
--

CREATE TABLE IF NOT EXISTS `afpms_personal_service_info` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT,
  `afpms_personal_info_id` bigint(19) unsigned NOT NULL,
  `afpms_circular_categorization_info_id` bigint(19) unsigned NOT NULL,
  `awards` varchar(45) DEFAULT NULL,
  `tn_membership_no` bigint(19) unsigned DEFAULT NULL,
  `trade` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
