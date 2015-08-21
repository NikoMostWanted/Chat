-- phpMyAdmin SQL Dump
-- version 4.2.12deb2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 21, 2015 at 04:04 PM
-- Server version: 5.6.25-0ubuntu0.15.04.1
-- PHP Version: 5.6.4-4ubuntu6.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `chat`
--

-- --------------------------------------------------------

--
-- Table structure for table `firstnames`
--

CREATE TABLE IF NOT EXISTS `firstnames` (
`id` int(11) NOT NULL,
  `firstname` char(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `firstnames`
--

INSERT INTO `firstnames` (`id`, `firstname`) VALUES
(3, 'Niko'),
(4, 'Sam');

-- --------------------------------------------------------

--
-- Table structure for table `lastnames`
--

CREATE TABLE IF NOT EXISTS `lastnames` (
`id` int(11) NOT NULL,
  `lastname` char(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `lastnames`
--

INSERT INTO `lastnames` (`id`, `lastname`) VALUES
(3, 'Fedorik'),
(4, 'Peterson');

-- --------------------------------------------------------

--
-- Table structure for table `speaking`
--

CREATE TABLE IF NOT EXISTS `speaking` (
`id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `text` char(255) COLLATE utf8_bin NOT NULL,
  `time` varchar(45) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `speaking`
--

INSERT INTO `speaking` (`id`, `id_user`, `text`, `time`) VALUES
(59, 3, 'Hello world!!!', '16:03:56');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) NOT NULL,
  `id_firstname` int(11) NOT NULL,
  `id_lastname` int(11) NOT NULL,
  `login` char(50) COLLATE utf8_bin NOT NULL,
  `password` char(40) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `id_firstname`, `id_lastname`, `login`, `password`) VALUES
(3, 3, 3, 'nikolunas95', '4a7d1ed414474e4033ac29ccb8653d9b'),
(4, 4, 4, 'Pete777', '4a7d1ed414474e4033ac29ccb8653d9b');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `firstnames`
--
ALTER TABLE `firstnames`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name_UNIQUE` (`firstname`);

--
-- Indexes for table `lastnames`
--
ALTER TABLE `lastnames`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `lastname_UNIQUE` (`lastname`);

--
-- Indexes for table `speaking`
--
ALTER TABLE `speaking`
 ADD PRIMARY KEY (`id`,`id_user`), ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`,`id_firstname`,`id_lastname`), ADD UNIQUE KEY `login_UNIQUE` (`login`), ADD KEY `id_lastname` (`id_lastname`), ADD KEY `users_ibfk_1` (`id_firstname`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `firstnames`
--
ALTER TABLE `firstnames`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `lastnames`
--
ALTER TABLE `lastnames`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `speaking`
--
ALTER TABLE `speaking`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=60;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `speaking`
--
ALTER TABLE `speaking`
ADD CONSTRAINT `speaking_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_firstname`) REFERENCES `firstnames` (`id`),
ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`id_lastname`) REFERENCES `lastnames` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
