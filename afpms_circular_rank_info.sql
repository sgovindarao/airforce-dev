-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2014 at 03:32 AM
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
