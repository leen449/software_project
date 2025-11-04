-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 04, 2025 at 04:24 PM
-- Server version: 5.7.24
-- PHP Version: 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movieshelfdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminID` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminID`, `username`, `email`, `password`) VALUES
(1, 'admin_lina', 'lina.admin@example.com', 'hashed_pass_1'),
(2, 'admin_sara', 'sara.admin@example.com', 'hashed_pass_2'),
(3, 'admin_fares', 'fares.admin@example.com', 'hashed_pass_3');

-- --------------------------------------------------------

--
-- Table structure for table `adminmanagesmovie`
--

CREATE TABLE `adminmanagesmovie` (
  `adminID` int(11) NOT NULL,
  `movieID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `adminmanagesmovie`
--

INSERT INTO `adminmanagesmovie` (`adminID`, `movieID`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `adminmanagesuser`
--

CREATE TABLE `adminmanagesuser` (
  `adminID` int(11) NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `adminmanagesuser`
--

INSERT INTO `adminmanagesuser` (`adminID`, `userID`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `movieID` int(11) NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `genre` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `posterURL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `releaseDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`movieID`, `title`, `genre`, `duration`, `description`, `posterURL`, `releaseDate`) VALUES
(1, 'Inception', 'Sci-Fi', 148, 'Dream within a dream', 'https://img.example.com/inc.jpg', '2010-07-16'),
(2, 'Spirited Away', 'Fantasy', 125, 'A girl in a spirit world', 'https://img.example.com/spirited.jpg', '2001-07-20'),
(3, 'The Dark Knight', 'Action', 152, 'Batman vs Joker', 'https://img.example.com/tdk.jpg', '2008-07-18');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `ratingID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `movieID` int(11) NOT NULL,
  `score` tinyint(4) NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`ratingID`, `userID`, `movieID`, `score`, `type`, `createdAt`) VALUES
(1, 1, 1, 5, 'star', '2025-11-04 19:22:31'),
(2, 2, 3, 4, 'star', '2025-11-04 19:22:31'),
(3, 3, 2, 5, 'star', '2025-11-04 19:22:31');

-- --------------------------------------------------------

--
-- Table structure for table `shelf`
--

CREATE TABLE `shelf` (
  `shelfID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `moviesList` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shelf`
--

INSERT INTO `shelf` (`shelfID`, `userID`, `moviesList`) VALUES
(1, 1, NULL),
(2, 2, NULL),
(3, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shelfmovie`
--

CREATE TABLE `shelfmovie` (
  `shelfID` int(11) NOT NULL,
  `movieID` int(11) NOT NULL,
  `addedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shelfmovie`
--

INSERT INTO `shelfmovie` (`shelfID`, `movieID`, `addedAt`) VALUES
(1, 1, '2025-11-04 19:22:31'),
(1, 2, '2025-11-04 19:22:31'),
(2, 3, '2025-11-04 19:22:31');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `username`, `email`, `password`) VALUES
(1, 'aryam', 'aryam@example.com', 'hashed_pw_aryam'),
(2, 'noura', 'noura@example.com', 'hashed_pw_noura'),
(3, 'mohannad', 'mohannad@example.com', 'hashed_pw_moh');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminID`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `adminmanagesmovie`
--
ALTER TABLE `adminmanagesmovie`
  ADD PRIMARY KEY (`adminID`,`movieID`),
  ADD KEY `fk_AMM_movie` (`movieID`);

--
-- Indexes for table `adminmanagesuser`
--
ALTER TABLE `adminmanagesuser`
  ADD PRIMARY KEY (`adminID`,`userID`),
  ADD KEY `fk_AMU_user` (`userID`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`movieID`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`ratingID`),
  ADD UNIQUE KEY `uq_Rating_user_movie_type` (`userID`,`movieID`,`type`),
  ADD KEY `fk_Rating_movie` (`movieID`);

--
-- Indexes for table `shelf`
--
ALTER TABLE `shelf`
  ADD PRIMARY KEY (`shelfID`),
  ADD UNIQUE KEY `uq_Shelf_user` (`userID`);

--
-- Indexes for table `shelfmovie`
--
ALTER TABLE `shelfmovie`
  ADD PRIMARY KEY (`shelfID`,`movieID`),
  ADD KEY `fk_SM_movie` (`movieID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `movie`
--
ALTER TABLE `movie`
  MODIFY `movieID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `ratingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shelf`
--
ALTER TABLE `shelf`
  MODIFY `shelfID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adminmanagesmovie`
--
ALTER TABLE `adminmanagesmovie`
  ADD CONSTRAINT `fk_AMM_admin` FOREIGN KEY (`adminID`) REFERENCES `admin` (`adminID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_AMM_movie` FOREIGN KEY (`movieID`) REFERENCES `movie` (`movieID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `adminmanagesuser`
--
ALTER TABLE `adminmanagesuser`
  ADD CONSTRAINT `fk_AMU_admin` FOREIGN KEY (`adminID`) REFERENCES `admin` (`adminID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_AMU_user` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `fk_Rating_movie` FOREIGN KEY (`movieID`) REFERENCES `movie` (`movieID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Rating_user` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shelf`
--
ALTER TABLE `shelf`
  ADD CONSTRAINT `fk_Shelf_user` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shelfmovie`
--
ALTER TABLE `shelfmovie`
  ADD CONSTRAINT `fk_SM_movie` FOREIGN KEY (`movieID`) REFERENCES `movie` (`movieID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_SM_shelf` FOREIGN KEY (`shelfID`) REFERENCES `shelf` (`shelfID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
