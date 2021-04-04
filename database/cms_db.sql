-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2021 at 01:16 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` int(30) NOT NULL,
  `branch_code` varchar(50) NOT NULL,
  `street` text NOT NULL,
  `city` text NOT NULL,
  `state` text NOT NULL,
  `zip_code` varchar(50) NOT NULL,
  `country` text NOT NULL,
  `contact` varchar(100) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `branch_code`, `street`, `city`, `state`, `zip_code`, `country`, `contact`, `date_created`) VALUES
(1, 'AL 001', '2nd Avenue, House 6', 'Wuse', 'Abuja', '20334', 'Nigeria', '08138486922', '2020-11-26 11:21:41'),
(3, 'AL 002', '2, Along Dami Iyi St.', 'Maryland', 'Lagos', '10015', 'Nigeria', '07055985606', '2020-11-26 16:45:05'),
(4, 'AL 003', 'House 13, Azikel road', 'Otuoke', 'Bayelsa State', '12912', 'Nigeria', '09087654312', '2020-11-27 13:31:49'),
(5, 'AL 004', 'Opp. GTBank', 'Port Harcourt', 'Rivers State', '10007', 'Nigeria', '0809623551', '2020-12-11 03:56:41');

-- --------------------------------------------------------

--
-- Table structure for table `parcels`
--

CREATE TABLE `parcels` (
  `id` int(30) NOT NULL,
  `reference_number` varchar(100) NOT NULL,
  `sender_name` text NOT NULL,
  `sender_address` text NOT NULL,
  `sender_contact` text NOT NULL,
  `recipient_name` text NOT NULL,
  `recipient_address` text NOT NULL,
  `recipient_contact` text NOT NULL,
  `type` int(1) NOT NULL COMMENT '1 = Deliver, 2=Pickup',
  `from_branch_id` int(30) NOT NULL,
  `to_branch_id` int(30) NOT NULL,
  `weight` varchar(100) NOT NULL,
  `height` varchar(100) NOT NULL,
  `width` varchar(100) NOT NULL,
  `length` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `status` int(2) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parcels`
--

INSERT INTO `parcels` (`id`, `reference_number`, `sender_name`, `sender_address`, `sender_contact`, `recipient_name`, `recipient_address`, `recipient_contact`, `type`, `from_branch_id`, `to_branch_id`, `weight`, `height`, `width`, `length`, `price`, `status`, `date_created`) VALUES
(1, '201406231415', 'Femi Oni', 'Gwarinpa, Abuja', '090123431', 'Olumide Asa', 'Airport Road, Abuja', '0812534116', 1, 1, 0, '30kg', '12in', '12in', '15in', 3000, 7, '2020-11-26 16:15:46'),
(2, '117967400213', 'Deborah A.', 'Wuse 2, Abuja', '08034561189', 'Clara John', 'Maryland, Lagos', '07012415561', 2, 1, 3, '30kg', '12in', '12in', '15in', 2500, 4, '2020-11-26 16:46:03'),
(3, '983186540795', 'Otis Biobele ', 'Otuoke, Bayelsa State', '08033146183', 'Mark Oshone', 'Port Harcourt, Rivers State', '08099765112', 2, 4, 5, '5Kg', '10in', '10in', '10in', 800, 8, '2020-11-26 16:46:03'),
(4, '514912669061', 'Victoria Osihmen', 'Ikorodu, Lagos', '08012745678', 'Bukky Adio', 'Rumuokoro, Port Harcourt', '0901234567', 2, 4, 1, '23kg', '12in', '12in', '15in', 1900, 0, '2020-11-27 13:52:14'),
(5, '897856905844', 'Jade Sola', 'Port Harcourt', '08136762133', 'Kenny Taye', 'Otuoke', '08097612311', 2, 5, 4, '30kg', '10in', '10in', '10in', 1450, 3, '2020-11-27 13:52:14'),
(6, '505604168988', 'Bolu Oluwa', 'House 11, Lugbe, Abuja', '08076543442', 'Raro Abdul', 'Opp. NIMC, House 2, Wuse, Abuja', '08099760905', 1, 0, 0, '23kg', '12in', '12in', '15in', 2500, 1, '2020-11-27 14:06:42'),
(8, '001204912728', 'Moses Akpu', 'Otuoke, Bayelsa State', '123', 'Laurencia Poto', 'Rumuokoro, Port Harcourt', '456', 2, 4, 4, '5Kg', '17', '8', '9', 1500, 4, '2021-02-03 13:25:37');

-- --------------------------------------------------------

--
-- Table structure for table `parcel_tracks`
--

CREATE TABLE `parcel_tracks` (
  `id` int(30) NOT NULL,
  `parcel_id` int(30) NOT NULL,
  `status` int(2) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parcel_tracks`
--

INSERT INTO `parcel_tracks` (`id`, `parcel_id`, `status`, `date_created`) VALUES
(1, 2, 1, '2020-11-27 09:53:27'),
(2, 3, 1, '2020-11-27 09:55:17'),
(3, 1, 1, '2020-11-27 10:28:01'),
(4, 1, 2, '2020-11-27 10:28:10'),
(5, 1, 3, '2020-11-27 10:28:16'),
(6, 1, 4, '2020-11-27 11:05:03'),
(7, 1, 5, '2020-11-27 11:05:17'),
(8, 1, 7, '2020-11-27 11:05:26'),
(9, 3, 2, '2020-11-27 11:05:41'),
(10, 6, 1, '2020-11-27 14:06:57'),
(11, 2, 4, '2020-12-11 14:09:49'),
(12, 5, 3, '2020-12-11 14:10:12'),
(13, 3, 8, '2020-12-11 14:10:31'),
(14, 7, 1, '2021-01-10 22:43:49'),
(15, 8, 4, '2021-04-03 10:29:42');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `cover_img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `address`, `cover_img`) VALUES
(1, 'Adegbemile Logistics', 'adegbemile@gmail.com', '08123471990', '5th Avenue, Wuse, Abuja', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1 = admin, 2 = staff',
  `branch_id` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `type`, `branch_id`, `date_created`) VALUES
(1, 'Administrator', '', 'admin@admin.com', '0192023a7bbd73250516f069df18b500', 1, 0, '2020-11-26 10:57:04'),
(2, 'Moses', 'Sapele', 'mosalah@gmail.com', '52bd43d37ed62eb4c226e31841bc03dc', 2, 1, '2020-11-26 11:52:04'),
(3, 'Preye', 'Goodluck', 'preye@gmail.com', '1d59d7f5f33814aeafb86064319b2be1', 2, 4, '2020-11-27 13:32:12'),
(4, 'Valerie', 'Egona', 'valerie@gmail.com', '6818bab4da85a3a138cdfa35cfc7a64f', 2, 3, '2020-12-11 03:38:10'),
(5, 'Abigail', 'Clinton', 'abigail@gmail.com', '37f299007792a4e9dec1481bca604016', 2, 5, '2020-12-11 15:16:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parcels`
--
ALTER TABLE `parcels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parcel_tracks`
--
ALTER TABLE `parcel_tracks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
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
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `parcels`
--
ALTER TABLE `parcels`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `parcel_tracks`
--
ALTER TABLE `parcel_tracks`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
