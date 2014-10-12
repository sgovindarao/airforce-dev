-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2014 at 04:31 AM
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

--
-- Dumping data for table `afpms_circular_amount_info`
--

INSERT INTO `afpms_circular_amount_info` (`id`, `afpms_circular_info_id`, `afpms_circular_categorization_info_id`, `amount`) VALUES
(1, 1, 1, 10000),
(2, 1, 2, 10101),
(3, 1, 5, 20000),
(4, 1, 10, 24100);

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
  UNIQUE KEY `rank` (`rank`,`group_id`,`service_period`,`service_type`),
  UNIQUE KEY `rank_2` (`rank`,`group_id`,`service_period`,`service_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `afpms_circular_info`
--

INSERT INTO `afpms_circular_info` (`id`, `circular_no`, `circular_issue_date`, `circular_effective_date`, `circular_status`) VALUES
(1, 502, '2013-10-09 00:00:00', '2013-10-23 00:00:00', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `afpms_circular_info_all_view`
--
CREATE TABLE IF NOT EXISTS `afpms_circular_info_all_view` (
`CircularID` bigint(19) unsigned
,`CategorizationID` bigint(19) unsigned
,`circular_no` bigint(19) unsigned
,`circular_issue_date` datetime
,`circular_effective_date` datetime
,`amount` bigint(19) unsigned
,`circular_status` tinyint(1)
,`rank` varchar(20)
,`group_id` int(10)
,`service_period` float unsigned
,`service_type` enum('1','2')
,`group_name` varchar(49)
);
-- --------------------------------------------------------

--
-- Table structure for table `afpms_circular_rank_info`
--

CREATE TABLE IF NOT EXISTS `afpms_circular_rank_info` (
  `rank_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rank` varchar(20) NOT NULL,
  PRIMARY KEY (`rank_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `afpms_circular_rank_info`
--

INSERT INTO `afpms_circular_rank_info` (`rank_id`, `rank`) VALUES
(1, 'AIR MSHL'),
(2, 'AVM'),
(3, 'AIR CMDE'),
(4, 'GP CAPT'),
(5, 'WG CDR'),
(6, 'SQL LDR'),
(7, 'FLT LT'),
(8, 'FG OFFR'),
(9, 'PLT OFFR'),
(10, 'HFL'),
(11, 'HFO'),
(12, 'MWO'),
(13, 'WO'),
(14, 'JWO'),
(15, 'SGT'),
(16, 'CPL'),
(17, 'LAC'),
(18, 'AC'),
(19, 'AC II'),
(20, 'NC(E)');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `afpms_personal_info`
--

INSERT INTO `afpms_personal_info` (`id`, `first_name`, `last_name`, `address1`, `address2`, `street`, `city`, `state`, `pincode`, `email`, `date_of_birth`, `date_of_expiry`) VALUES
(1, 'Varaprasad', 'Killampalli', 'address1', 'address2', 'address3', 'city', 'state', 601201, 'email@email.com', '2014-10-01 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `afpms_personal_info_all_view`
--
CREATE TABLE IF NOT EXISTS `afpms_personal_info_all_view` (
`id` bigint(19) unsigned
,`first_name` varchar(32)
,`last_name` varchar(32)
,`address1` varchar(32)
,`address2` varchar(32)
,`street` varchar(32)
,`city` varchar(45)
,`state` varchar(32)
,`pincode` mediumint(8) unsigned
,`email` varchar(50)
,`date_of_birth` datetime
,`date_of_expiry` datetime
,`service_no` int(11)
,`membership_no` int(11)
,`awards` varchar(45)
,`tn_membership_no` bigint(19) unsigned
,`trade` varchar(20)
,`CategorizationID` bigint(19) unsigned
);
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `afpms_personal_service_identity_info`
--

INSERT INTO `afpms_personal_service_identity_info` (`id`, `afpms_personal_info_id`, `service_no`, `membership_no`) VALUES
(1, 1, 502, 1231213);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `afpms_personal_service_info`
--

INSERT INTO `afpms_personal_service_info` (`id`, `afpms_personal_info_id`, `afpms_circular_categorization_info_id`, `awards`, `tn_membership_no`, `trade`) VALUES
(1, 1, 1, 'TN,AP,KL', 12121, 'TN');

-- --------------------------------------------------------

--
-- Structure for view `afpms_circular_info_all_view`
--
DROP TABLE IF EXISTS `afpms_circular_info_all_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `afpms_circular_info_all_view` AS select `a`.`afpms_circular_info_id` AS `CircularID`,`a`.`afpms_circular_categorization_info_id` AS `CategorizationID`,`b`.`circular_no` AS `circular_no`,`b`.`circular_issue_date` AS `circular_issue_date`,`b`.`circular_effective_date` AS `circular_effective_date`,`a`.`amount` AS `amount`,`b`.`circular_status` AS `circular_status`,`c`.`rank` AS `rank`,`c`.`group_id` AS `group_id`,`c`.`service_period` AS `service_period`,`c`.`service_type` AS `service_type`,`d`.`group_name` AS `group_name` from (((`afpms_circular_amount_info` `a` join `afpms_circular_info` `b`) join `afpms_circular_categorization_info` `c`) join `afpms_circular_group_info` `d`) where ((`a`.`afpms_circular_info_id` = `b`.`id`) and (`a`.`afpms_circular_categorization_info_id` = `c`.`id`) and (`c`.`group_id` = `d`.`id`));

-- --------------------------------------------------------

--
-- Structure for view `afpms_personal_info_all_view`
--
DROP TABLE IF EXISTS `afpms_personal_info_all_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `afpms_personal_info_all_view` AS select `a`.`id` AS `id`,`a`.`first_name` AS `first_name`,`a`.`last_name` AS `last_name`,`a`.`address1` AS `address1`,`a`.`address2` AS `address2`,`a`.`street` AS `street`,`a`.`city` AS `city`,`a`.`state` AS `state`,`a`.`pincode` AS `pincode`,`a`.`email` AS `email`,`a`.`date_of_birth` AS `date_of_birth`,`a`.`date_of_expiry` AS `date_of_expiry`,`b`.`service_no` AS `service_no`,`b`.`membership_no` AS `membership_no`,`c`.`awards` AS `awards`,`c`.`tn_membership_no` AS `tn_membership_no`,`c`.`trade` AS `trade`,`c`.`afpms_circular_categorization_info_id` AS `CategorizationID` from ((`afpms_personal_info` `a` join `afpms_personal_service_identity_info` `b`) join `afpms_personal_service_info` `c`) where ((`a`.`id` = `b`.`afpms_personal_info_id`) and (`a`.`id` = `c`.`afpms_personal_info_id`));

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
