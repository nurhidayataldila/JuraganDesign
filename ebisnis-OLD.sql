-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 17, 2019 at 12:37 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ebisnis`
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
(82, 'pembayaran', 'Pembayaran bisa dilakukan dengan membayar lewat rekening, lalu foto bukti pembayaran dan upload agar pesanan segera diproses', '2019-12-12 10:01:50');

-- --------------------------------------------------------

--
-- Table structure for table `galeri2`
--

CREATE TABLE `galeri2` (
  `id_gambar` int(100) NOT NULL,
  `kategori` int(11) NOT NULL,
  `file_gambar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `galeri2`
--

INSERT INTO `galeri2` (`id_gambar`, `kategori`, `file_gambar`) VALUES
(18, 1, 'contoh2.jpg'),
(19, 1, 'contoh3.jpg'),
(20, 1, 'contoh4.jpg'),
(21, 2, 'landscape-01-01.jpg'),
(23, 2, 'landscape-01.jpg'),
(24, 2, '1-01.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `paket`
--

CREATE TABLE `paket` (
  `id_paket` int(11) NOT NULL,
  `nama_paket` varchar(45) DEFAULT NULL,
  `harga` longtext DEFAULT NULL,
  `dekorasi` varchar(255) DEFAULT NULL,
  `rias_baju` varchar(255) DEFAULT NULL,
  `dokumentasi` varchar(255) DEFAULT NULL,
  `mc` varchar(45) DEFAULT NULL,
  `free` varchar(255) DEFAULT NULL,
  `biaya_pelihara` longtext NOT NULL,
  `foto` varchar(255) NOT NULL,
  `lama` int(255) NOT NULL,
  `Detail` longtext NOT NULL,
  `Jenis` varchar(255) NOT NULL,
  `level` tinyint(2) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paket`
--

INSERT INTO `paket` (`id_paket`, `nama_paket`, `harga`, `dekorasi`, `rias_baju`, `dokumentasi`, `mc`, `free`, `biaya_pelihara`, `foto`, `lama`, `Detail`, `Jenis`, `level`) VALUES
(20, 'Smudge Painting', '25000', NULL, NULL, NULL, NULL, NULL, '', 'desain1.jpg', 7, 'Ini smudge painting untuk ini itu dan anu', '', 1),
(21, 'Silet', '30000', '', NULL, NULL, NULL, NULL, '', 'download.png', 9, 'fghfghfgh', '', 2),
(22, 'Siluet Art', '15000', NULL, NULL, NULL, NULL, NULL, '', 'produk1.jpg', 5, 'Ini siluet wajah untuk wisuda', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--

CREATE TABLE `pemesanan` (
  `id_pemesanan` int(255) NOT NULL,
  `catatan` varchar(255) DEFAULT NULL,
  `id_paket` int(11) NOT NULL,
  `tgl_pesan` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Waiting',
  `lokasi` varchar(255) NOT NULL,
  `bukti_pembayaran` varchar(255) DEFAULT NULL,
  `testimoni` longtext DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `jenis` varchar(255) NOT NULL,
  `referensi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemesanan`
--

INSERT INTO `pemesanan` (`id_pemesanan`, `catatan`, `id_paket`, `tgl_pesan`, `tgl_kembali`, `status`, `lokasi`, `bukti_pembayaran`, `testimoni`, `user_id`, `jenis`, `referensi`) VALUES
(29, 'asczczxc', 20, '2019-12-11', '0000-00-00', 'Waiting', '', NULL, NULL, 3, 'softfile', 'gal8.png'),
(30, 'asacdscsdvsvdsc', 21, '2019-12-11', '0000-00-00', 'Waiting', '', NULL, NULL, 8, 'hardfile', 'g6.png'),
(31, 'Pesanan baru iki ', 21, '2019-12-11', '0000-00-00', 'Waiting', '', NULL, NULL, 3, 'hardfile+pigura', 'g4.png'),
(32, 'rambutnya mohawk', 22, '2019-12-12', '0000-00-00', 'Waiting', '', NULL, NULL, 3, 'hardfile', 'emaill.png'),
(33, 'asd', 22, '2019-12-12', '0000-00-00', 'Waiting', '', NULL, NULL, 9, 'hardfile+pigura', '1.jpg'),
(34, 'Testing', 20, '2019-12-12', '0000-00-00', 'Waiting', '', NULL, NULL, 8, 'softfile', 'WOWOWO.jpg');

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
(6, 'order lain', 'Silahkan kembali dari menu Order > Pilih produk yang ingin anda cari'),
(7, 'pembayaran', 'Pembayaran bisa dilakukan dengan membayar lewat rekening, lalu foto bukti pembayaran dan upload agar pesanan segera diproses'),
(8, 'pengiriman', 'Setelah pesanan selesai, file akan dikirim sesuai jenis misalnya :\r\n- HardFile (melalui ekspedisi)\r\n- SoftFile (melalui e-mail)'),
(9, 'harga', 'Harga masih terjangkau kok, jadi sans lurd!!'),
(10, 'kualitas', 'Kualitas bisa dijamin enjoy aman, yang penting jadi beli langsung gaskeunn!!');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `type` enum('admin','customer') NOT NULL DEFAULT 'customer',
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_telp` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `type`, `username`, `password`, `nama`, `alamat`, `no_telp`, `email`) VALUES
(3, 'admin', 'admin', 'admin', 'admin', NULL, NULL, NULL),
(6, 'customer', 'user', 'user', 'User', 'Malang', '085123456789', 'user@gmail.com'),
(7, 'customer', 'dasdasdasd', '123', 'asdas', 'adas', '12312312', 'asdad@gmail.com'),
(8, 'customer', 'asep', '12345', 'Asep', 'Jl kedungkandang', '089918283122', 'asep@gmail.com'),
(9, 'customer', 'jimmyy', '123', 'jimmy', 'lamongan', '089227772272', 'jimmy123@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `galeri2`
--
ALTER TABLE `galeri2`
  ADD PRIMARY KEY (`id_gambar`);

--
-- Indexes for table `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`id_paket`);

--
-- Indexes for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`id_pemesanan`,`id_paket`,`user_id`),
  ADD KEY `fk_pemesanan_paket1_idx` (`id_paket`),
  ADD KEY `fk_pemesanan_user1_idx` (`user_id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `galeri2`
--
ALTER TABLE `galeri2`
  MODIFY `id_gambar` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `paket`
--
ALTER TABLE `paket`
  MODIFY `id_paket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `pemesanan`
--
ALTER TABLE `pemesanan`
  MODIFY `id_pemesanan` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD CONSTRAINT `fk_pemesanan_paket1` FOREIGN KEY (`id_paket`) REFERENCES `paket` (`id_paket`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pemesanan_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
