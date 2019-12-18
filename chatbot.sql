-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2019 at 06:57 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chatbot`
--

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` int(11) NOT NULL,
  `user` longtext NOT NULL,
  `chatbot` longtext NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `user`, `chatbot`, `date`) VALUES
(52, 'tes', 'Maaf, kami tidak menemukan masalah yang anda cari. Silahkan coba kata lain', '2019-12-11 11:02:24'),
(53, 'tes', 'Maaf, kami tidak menemukan masalah yang anda cari. Silahkan coba kata lain', '2019-12-11 11:04:06'),
(54, 'bagaimana cara saya untuk order?', 'Maaf, kami tidak menemukan masalah yang anda cari. Silahkan coba kata lain', '2019-12-11 11:06:45'),
(55, 'bagaimana cara ordernya?', 'Maaf, kami tidak menemukan masalah yang anda cari. Silahkan coba kata lain', '2019-12-11 11:07:04'),
(56, 'bagaimana cara order disini?', 'Maaf, kami tidak menemukan masalah yang anda cari. Silahkan coba kata lain', '2019-12-11 11:07:18'),
(57, 'order lain', 'Silahkan kembali dari menu Order > Pilih produk yang ingin anda cari', '2019-12-11 11:08:22'),
(58, 'cara order', 'Silahkan klik ke menu Produk > Pilih Produk yang anda cari > Klik tombol Order', '2019-12-11 12:29:00');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `question` longtext NOT NULL,
  `answer` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `question`, `answer`) VALUES
(4, 'Jimmy', 'Arek 3G iku se?'),
(5, 'cara order', 'Silahkan klik ke menu Produk > Pilih Produk yang anda cari > Klik tombol Order'),
(6, 'order lain', 'Silahkan kembali dari menu Order > Pilih produk yang ingin anda cari');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
