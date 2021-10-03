-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 18, 2021 at 07:00 PM
-- Server version: 10.3.15-MariaDB
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `loginsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', '5c428d8875d2948607f3e3fe134d71b4');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(300) DEFAULT NULL,
  `contactno` varchar(11) DEFAULT NULL,
  `posting_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fname`, `lname`, `email`, `password`, `contactno`, `posting_date`) VALUES
(13, 'Anuj', 'Kumar', 'phpgurukulteam@gmail.com', 'Test@123', '1234567890', '2021-08-09 18:30:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
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
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 07, 2018 at 09:39 PM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `booking_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `fullname` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(40) DEFAULT NULL,
  `contact` varchar(30) DEFAULT NULL,
  `email` varchar(140) DEFAULT NULL,
  `username` varchar(70) DEFAULT NULL,
  `password` varchar(130) DEFAULT NULL,
  PRIMARY KEY (`fullname`),
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admins` (`fullname`, `id`, `contact`, `email`, `username`, `password`) VALUES
(1, '1', '090765453425', 'admin@yahoo.com', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `available_class`
--

CREATE TABLE IF NOT EXISTS `available_class` (
  `class_id` varchar(120) NOT NULL,
  `class_name` varchar(80) NOT NULL,
  `class_capacity` smallint(6) NOT NULL DEFAULT '0',
  `class_price` double NOT NULL DEFAULT '10',
  `description` longtext,
  PRIMARY KEY (`class_id`,`class_name`),
  UNIQUE KEY `class_name` (`class_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `available_class`
--


-- --------------------------------------------------------

--
-- Table structure for table `booking_details`
--

CREATE TABLE IF NOT EXISTS `booking_details` (
  `order_ref` varchar(255) NOT NULL,
  `fullname` varchar(120) NOT NULL,
  `contact` varchar(40) DEFAULT NULL,
  `gender` varchar(40) DEFAULT NULL,
  `class_reserved` varchar(255) NOT NULL,
  `destination` varchar(180) NOT NULL,
  `seats_reserved` varchar(50) NOT NULL DEFAULT '1',
  `date_reserved` varchar(50) DEFAULT NULL,
  `transaction_id` varchar(190) NOT NULL,
  `account` varchar(130) NOT NULL,
  `amount` varchar(50) NOT NULL,
  PRIMARY KEY (`order_ref`),
  KEY `available_classbooking_details` (`class_reserved`),
  KEY `transaction_id` (`transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booking_details`
--

INSERT INTO `booking_details` (`order_ref`, `fullname`, `contact`, `gender`, `class_reserved`, `destination`, `seats_reserved`, `date_reserved`, `transaction_id`, `account`, `amount`) VALUES
('RA84O43T53E', 'George Ben', '0705481696', 'MALE', 'Middle Class Travel', 'NEW YORK to GEORGIA', '1', 'November 30, 2017', '38329432422', 'INTER', '52.03'),
('BE19O27T62R', 'Samuel Ken', '0342423', 'MALE', 'Middle Class Travel', 'ACCRA to CAPE', '1', 'December 07, 2017', '807678678', 'KCD_BANK', '52.03'),
('TA59C71B27O', 'Jone Doe', '09032343223', 'MALE', 'Middle Class Travel', 'CAPE to GOLD COAST', '1', 'November 30, 2018', '76887888', 'EQUITY_BANK', '52.03');

-- --------------------------------------------------------

--
-- Table structure for table `tickets_generated`
--

CREATE TABLE IF NOT EXISTS `tickets_generated` (
  `ticket_ref` varchar(120) NOT NULL,
  `order_ref` varchar(120) NOT NULL,
  `travel_class` varchar(255) NOT NULL,
  `date_processed` datetime DEFAULT NULL,
  `destination` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`ticket_ref`),
  KEY `available_classtickets_generated` (`travel_class`),
  KEY `booking_detailstickets_generated` (`order_ref`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tickets_generated`
--


-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE IF NOT EXISTS `transactions` (
  `amount` double DEFAULT '0',
  `payment_via` varchar(180) DEFAULT NULL,
  `transaction_id` varchar(210) NOT NULL,
  `status` varchar(80) DEFAULT 'unused',
  PRIMARY KEY (`transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`amount`, `payment_via`, `transaction_id`, `status`) VALUES
(7500, 'INTER', 'LORSO93045KWE', 'used');
