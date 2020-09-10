-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 10, 2020 at 05:33 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db__skripsi`
--

-- --------------------------------------------------------

--
-- Table structure for table `freq_missed_lo`
--

CREATE TABLE `freq_missed_lo` (
  `id` int(11) NOT NULL,
  `soal_id` int(11) NOT NULL,
  `ujian_id` int(11) NOT NULL,
  `correct_answer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'guru', 'Pembuat Soal dan ujian'),
(3, 'siswa', 'Peserta Ujian');

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `id_guru` int(11) NOT NULL,
  `nip` char(12) NOT NULL,
  `nama_guru` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `mapel_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`id_guru`, `nip`, `nama_guru`, `email`, `mapel_id`) VALUES
(1, '12345678', 'Faradissa', 'dissa@gmail.com', 1),
(2, '22334455', 'aldo', 'aldo@gmail.com', 1),
(3, '33445566', 'Faradissa Nurul', 'faradissanurul@gmail.com', 1);

--
-- Triggers `guru`
--
DELIMITER $$
CREATE TRIGGER `edit_user_guru` BEFORE UPDATE ON `guru` FOR EACH ROW UPDATE `users` SET `email` = NEW.email, `username` = NEW.nip WHERE `users`.`username` = OLD.nip
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `hapus_user_guru` BEFORE DELETE ON `guru` FOR EACH ROW DELETE FROM `users` WHERE `users`.`username` = OLD.nip
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `hambatan_belajar`
--

CREATE TABLE `hambatan_belajar` (
  `id` int(11) NOT NULL,
  `lo` longtext CHARACTER SET utf8 NOT NULL,
  `link_media` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hambatan_belajar`
--

INSERT INTO `hambatan_belajar` (`id`, `lo`, `link_media`) VALUES
(3, 'Bentuk Umum Algoritma Pseudocode Percabangan If Then', ''),
(4, 'Bentuk Umum Algoritma Flowchart Percabangan If Then', ''),
(5, 'Pengaplikasian Percabangan If Then', 'https://drive.google.com/file/d/1YFhy3R3543v97EPHbP1IdBJEOjg-XDQj/view?usp=sharing'),
(6, 'Analisis Alur Kerja Percabangan If Then', ''),
(7, 'Konsep Dasar Percabangan If Then (Kondisi)', ''),
(8, 'Konsep Dasar Percabangan If Then (Aksi)', ''),
(9, 'Analisis Hasil Akhir (Output) Percabangan If Then', ''),
(10, 'Penyelesaian Masalah Menggunakan Percabangan If Then (Pseudocode)', ''),
(11, 'Penyelesaian Masalah Menggunakan Percabangan If Then (Flowchart)', ''),
(13, 'Bentuk Umum Algoritma Pseudocode Percabangan If Then Else', ''),
(14, 'Bentuk Umum Algoritma Flowchart Percabangan If Then Else', ''),
(15, 'Pengaplikasian Percabangan If Then Else', ''),
(16, 'Konsep Dasar Percabangan If Then Else (Kondisi)', ''),
(17, 'Konsep Dasar Percabangan If Then Else (Aksi)', ''),
(18, 'Perbedaan Percabangan If Then Dengan If Then Else Berdasarkan Pseudocode', 'l'),
(19, 'Perbedaan Percabangan If Then Dengan If Then Else Berdasarkan Flowchart', ''),
(20, 'Penyelesaian Masalah Menggunakan Percabangan If Then Else (Pseudocode)', ''),
(21, 'Penyelesaian Masalah Menggunakan Percabangan If Then Else (Flowchart)', ''),
(22, 'Pengertian Percabangan Nested If', 'ldjkaskda'),
(23, 'Bentuk Umum Algoritma Pseudocode Percabangan Nested If', ''),
(24, 'Bentuk Umum Algoritma Flowchart Percabangan Nested If', ''),
(25, 'Analisis Alur Kerja Percabangan Nested If', ''),
(26, 'Analisis Hasil Akhir (Output) Percabangan If Then Else', ''),
(27, 'Konsep Dasar Percabangan Nested If (Kondisi)', ''),
(28, 'Konsep Dasar Percabangan Nested If (Aksi)', ''),
(29, 'Implementasi Permasalahan Kedalam Percabangan Nested If', ''),
(30, 'Analisis Hasil Akhir (Output) Percabangan Nested If', ''),
(31, 'Penyelesaian Masalah Menggunakan Percabangan Nested If (Pseudocode)', ''),
(32, 'Penyelesaian Masalah Menggunakan Percabangan Nested If (Flowchart)', ''),
(33, 'Pengertian Percabangan Switch Case', 'rfgh'),
(34, 'Aturan Konsep Percabangan Switch Case (Pengertian Tipe Ordinal)', ''),
(35, 'Bentuk Umum Algoritma Pseudocode Percabangan Switch Case', ''),
(36, 'Pengaplikasian Percabangan Switch Case', ''),
(37, 'Analisis Alur Kerja Percabangan Switch Case', ''),
(38, 'Konsep Dasar Percabangan Switch Case (Kondisi)', ''),
(39, 'Konsep Dasar Percabangan Switch Case (Aksi)', ''),
(40, 'Penyelesaian Masalah Menggunakan Percabangan Switch Case (Pseudocode)', ''),
(41, 'Penyelesaian Masalah Menggunakan Percabangan Switch Case (Flowchart)', '');

-- --------------------------------------------------------

--
-- Table structure for table `h_ujian`
--

CREATE TABLE `h_ujian` (
  `id` int(11) NOT NULL,
  `ujian_id` int(11) NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `hambatan_siswa` longtext NOT NULL,
  `list_soal` longtext NOT NULL,
  `list_jawaban` longtext NOT NULL,
  `jml_benar` int(11) NOT NULL,
  `jml_salah` int(11) NOT NULL,
  `nilai` decimal(10,2) NOT NULL,
  `nilai_bobot` decimal(10,2) NOT NULL,
  `tgl_mulai` datetime NOT NULL,
  `tgl_selesai` datetime NOT NULL,
  `status` enum('Y','N') NOT NULL,
  `correct_answer` longtext NOT NULL,
  `most_obstacle` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `h_ujian`
--

INSERT INTO `h_ujian` (`id`, `ujian_id`, `siswa_id`, `hambatan_siswa`, `list_soal`, `list_jawaban`, `jml_benar`, `jml_salah`, `nilai`, `nilai_bobot`, `tgl_mulai`, `tgl_selesai`, `status`, `correct_answer`, `most_obstacle`) VALUES
(40, 4, 22, '44', '43,44,45,46,47', '43:A:N,44:C:N,45:C:N,46:D:N,47:E:N', 4, 1, '80.00', '100.00', '2020-08-26 14:34:36', '2020-08-26 15:34:36', 'N', '43,47', '3,5,23,26'),
(41, 4, 16, '', '43,44,45,46,47', '43:A:N,44:B:N,45:C:N,46:D:N,47:E:N', 5, 0, '100.00', '100.00', '2020-08-26 14:39:10', '2020-08-26 15:39:10', 'N', '44,47', '3,5,23,26'),
(44, 4, 20, '43,44', '43,44,45,46,47', '43:B:N,44:C:N,45:C:N,46:D:N,47:E:N', 3, 2, '60.00', '100.00', '2020-08-26 20:31:26', '2020-08-26 21:31:26', 'N', '45,46', '3,5,23,26'),
(46, 4, 23, '43,44,45,46,47', '43,44,45,46,47', '43:B:N,44:A:N,45:E:N,46:A:N,47:D:N', 0, 5, '0.00', '100.00', '2020-08-27 00:13:43', '2020-08-27 01:13:43', 'N', '', '3,5,23,26'),
(47, 3, 6, '3,5,11,15,18,19,21,22,23,24,31,33,34,35,41,42', '3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42', '3:A:N,4:C:N,5:C:N,6:D:N,7:C:N,8:B:N,9:A:N,10:A:N,11:A:N,12:E:N,13:C:N,14:A:N,15:E:N,16:A:N,17:C:N,18:B:N,19:A:N,20:C:N,21:E:N,22:E:N,23:A:N,24:A:N,25:B:N,26:D:N,27:E:N,28:A:N,29:C:N,30:E:N,31:C:N,32:A:N,33:E:N,34:C:N,35:C:N,36:B:N,37:A:N,38:E:N,39:D:N,40:E:N,41:B:N,42:E:N', 24, 16, '60.00', '100.00', '2020-08-27 14:49:26', '2020-08-27 16:49:26', 'N', '4,6,7,8,9,10,12,13,14,16,17,20,25,26,27,28,29,30,32,36,37,38,39,40', '5,18,22,31,33,34,35'),
(49, 3, 4, '5,8,33,34,36', '3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42', '3:B:N,4:C:N,5:D:N,6:D:N,7:C:N,8:A:N,9:A:N,10:A:N,11:D:N,12:E:N,13:C:N,14:A:N,15:B:N,16:A:N,17:C:N,18:D:N,19:D:N,20:C:N,21:A:N,22:A:N,23:D:N,24:D:N,25:B:N,26:D:N,27:E:N,28:A:N,29:C:N,30:E:N,31:B:N,32:A:N,33:A:N,34:C:N,35:E:N,36:E:N,37:A:N,38:E:N,39:D:N,40:E:N,41:D:N,42:A:N', 35, 5, '87.00', '100.00', '2020-08-27 15:01:54', '2020-08-27 17:01:54', 'N', '3,4,6,7,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,35,37,38,39,40,41,42', '5,18,22,31,33,34,35'),
(50, 3, 3, '5,8,9,35', '3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42', '3:B:N,4:C:N,5:D:N,6:D:N,7:C:N,8:A:N,9:C:N,10:A:N,11:D:N,12:E:N,13:C:N,14:A:N,15:B:N,16:A:N,17:C:N,18:D:N,19:D:N,20:C:N,21:A:N,22:A:N,23:D:N,24:D:N,25:B:N,26:D:N,27:E:N,28:A:N,29:C:N,30:E:N,31:B:N,32:A:N,33:C:N,34:A:N,35:C:N,36:B:N,37:A:N,38:E:N,39:D:N,40:E:N,41:D:N,42:A:N', 36, 4, '90.00', '100.00', '2020-08-27 15:07:30', '2020-08-27 17:07:30', 'N', '3,4,6,7,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,36,37,38,39,40,41,42', '5,18,22,31,33,34,35'),
(51, 3, 16, '3,5,8,10,11,12,13,14,16,18,30,31,33,34,36,38,41', '3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42', '3:D:N,4:C:N,5:D:N,6:D:N,7:C:N,8:C:N,9:A:N,10:C:N,11:A:N,12:B:N,13:A:N,14:C:N,15:B:N,16:C:N,17:C:N,18:A:N,19:D:N,20:C:N,21:A:N,22:A:N,23:D:N,24:D:N,25:B:N,26:D:N,27:E:N,28:A:N,29:C:N,30:D:N,31:A:N,32:A:N,33:A:N,34:E:N,35:E:N,36:E:N,37:A:N,38:D:N,39:D:N,40:E:N,41:A:N,42:A:N', 23, 17, '57.00', '100.00', '2020-08-27 15:11:56', '2020-08-27 17:11:56', 'N', '4,6,7,9,15,17,19,20,21,22,23,24,25,26,27,28,29,32,35,37,39,40,42', '5,18,22,31,33,34,35'),
(52, 3, 22, '3,4,5,8,10,13,14,18,21,22,23,25,31,32,33,34,35,36,37,41,42', '3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42', '3:D:N,4:B:N,5:B:N,6:D:N,7:C:N,8:C:N,9:A:N,10:E:N,11:D:N,12:E:N,13:D:N,14:C:N,15:B:N,16:A:N,17:C:N,18:A:N,19:D:N,20:C:N,21:E:N,22:E:N,23:C:N,24:D:N,25:C:N,26:D:N,27:E:N,28:A:N,29:C:N,30:E:N,31:C:N,32:C:N,33:A:N,34:B:N,35:C:N,36:C:N,37:E:N,38:E:N,39:D:N,40:E:N,41:B:N,42:D:N', 19, 21, '47.00', '100.00', '2020-08-27 15:17:24', '2020-08-27 17:17:24', 'N', '6,7,9,11,12,15,16,17,19,20,24,26,27,28,29,30,38,39,40', '5,18,22,31,33,34,35'),
(53, 3, 5, '5,13,14,18,20,21,22,23,33,34,35', '3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42', '3:B:N,4:C:N,5:D:N,6:D:N,7:C:N,8:B:N,9:A:N,10:A:N,11:D:N,12:E:N,13:D:N,14:C:N,15:B:N,16:A:N,17:C:N,18:C:N,19:D:N,20:D:N,21:E:N,22:E:N,23:A:N,24:D:N,25:B:N,26:D:N,27:E:N,28:A:N,29:C:N,30:E:N,31:B:N,32:A:N,33:D:N,34:E:N,35:C:N,36:B:N,37:A:N,38:E:N,39:D:N,40:E:N,41:D:N,42:A:N', 29, 11, '72.00', '100.00', '2020-08-27 15:22:17', '2020-08-27 17:22:17', 'N', '3,4,6,7,8,9,10,11,12,15,16,17,19,24,25,26,27,28,29,30,31,32,36,37,38,39,40,41,42', '5,18,22,31,33,34,35'),
(54, 3, 10, '5,13,21,22,23,24,29,31,32,33,34,41,42', '3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42', '3:B:N,4:C:N,5:B:N,6:D:N,7:C:N,8:B:N,9:A:N,10:A:N,11:D:N,12:E:N,13:D:N,14:A:N,15:B:N,16:A:N,17:C:N,18:D:N,19:D:N,20:C:N,21:E:N,22:E:N,23:A:N,24:C:N,25:B:N,26:D:N,27:E:N,28:A:N,29:D:N,30:E:N,31:D:N,32:B:N,33:E:N,34:C:N,35:E:N,36:B:N,37:A:N,38:E:N,39:D:N,40:E:N,41:B:N,42:E:N', 27, 13, '67.00', '100.00', '2020-08-27 15:26:56', '2020-08-27 17:26:56', 'N', '3,4,6,7,8,9,10,11,12,14,15,16,17,18,19,20,25,26,27,28,30,35,36,37,38,39,40', '5,18,22,31,33,34,35'),
(55, 3, 19, '5,13,15,19,21,22,24,31,35', '3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42', '3:B:N,4:C:N,5:D:N,6:D:N,7:C:N,8:B:N,9:A:N,10:A:N,11:D:N,12:E:N,13:D:N,14:A:N,15:D:N,16:A:N,17:C:N,18:D:N,19:B:N,20:C:N,21:E:N,22:E:N,23:D:N,24:C:N,25:B:N,26:D:N,27:E:N,28:A:N,29:C:N,30:E:N,31:C:N,32:A:N,33:C:N,34:A:N,35:C:N,36:B:N,37:A:N,38:E:N,39:D:N,40:E:N,41:D:N,42:A:N', 31, 9, '77.00', '100.00', '2020-08-27 15:31:41', '2020-08-27 17:31:41', 'N', '3,4,6,7,8,9,10,11,12,14,16,17,18,20,23,25,26,27,28,29,30,32,33,34,36,37,38,39,40,41,42', '5,18,22,31,33,34,35'),
(56, 3, 26, '5,7,8,9,18,23,29,31,32,33,35,40', '3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42', '3:B:N,4:C:N,5:D:N,6:D:N,7:E:N,8:A:N,9:B:N,10:A:N,11:D:N,12:E:N,13:C:N,14:A:N,15:B:N,16:A:N,17:C:N,18:A:N,19:D:N,20:C:N,21:A:N,22:A:N,23:B:N,24:D:N,25:B:N,26:D:N,27:E:N,28:A:N,29:A:N,30:E:N,31:E:N,32:C:N,33:E:N,34:A:N,35:C:N,36:B:N,37:A:N,38:E:N,39:D:N,40:A:N,41:D:N,42:A:N', 28, 12, '70.00', '100.00', '2020-08-27 15:36:15', '2020-08-27 17:36:15', 'N', '3,4,6,10,11,12,13,14,15,16,17,19,20,21,22,24,25,26,27,28,30,34,36,37,38,39,41,42', '5,18,22,31,33,34,35'),
(57, 3, 9, '5,13,15,29,31', '3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42', '3:B:N,4:C:N,5:E:N,6:D:N,7:C:N,8:B:N,9:A:N,10:A:N,11:D:N,12:E:N,13:D:N,14:A:N,15:E:N,16:A:N,17:C:N,18:D:N,19:D:N,20:C:N,21:A:N,22:A:N,23:D:N,24:D:N,25:B:N,26:D:N,27:E:N,28:A:N,29:D:N,30:E:N,31:A:N,32:A:N,33:C:N,34:A:N,35:E:N,36:B:N,37:A:N,38:E:N,39:D:N,40:E:N,41:D:N,42:A:N', 35, 5, '87.00', '100.00', '2020-08-27 15:53:21', '2020-08-27 17:53:21', 'N', '3,4,6,7,8,9,10,11,12,14,16,17,18,19,20,21,22,23,24,25,26,27,28,30,32,33,34,35,36,37,38,39,40,41,42', '5,18,22,31,33,34,35'),
(58, 3, 14, '5,7,8,9,18,23,29,31,32,33,35,40,41,42', '3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42', '3:B:N,4:C:N,5:B:N,6:D:N,7:D:N,8:A:N,9:B:N,10:A:N,11:D:N,12:E:N,13:C:N,14:A:N,15:B:N,16:A:N,17:C:N,18:A:N,19:D:N,20:C:N,21:A:N,22:A:N,23:B:N,24:D:N,25:B:N,26:D:N,27:E:N,28:A:N,29:A:N,30:E:N,31:D:N,32:C:N,33:E:N,34:A:N,35:C:N,36:B:N,37:A:N,38:E:N,39:D:N,40:A:N,41:B:N,42:B:N', 26, 14, '65.00', '100.00', '2020-08-27 15:57:36', '2020-08-27 17:57:36', 'N', '3,4,6,10,11,12,13,14,15,16,17,19,20,21,22,24,25,26,27,28,30,34,36,37,38,39', '5,18,22,31,33,34,35'),
(59, 3, 20, '21,34,35', '3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42', '3:B:N,4:C:N,5:A:N,6:D:N,7:C:N,8:B:N,9:A:N,10:A:N,11:D:N,12:E:N,13:C:N,14:A:N,15:B:N,16:A:N,17:C:N,18:D:N,19:D:N,20:C:N,21:E:N,22:A:N,23:D:N,24:D:N,25:B:N,26:D:N,27:E:N,28:A:N,29:C:N,30:E:N,31:B:N,32:A:N,33:C:N,34:C:N,35:C:N,36:B:N,37:A:N,38:E:N,39:D:N,40:E:N,41:D:N,42:A:N', 37, 3, '92.00', '100.00', '2020-08-27 16:01:37', '2020-08-27 18:01:37', 'N', '3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,22,23,24,25,26,27,28,29,30,31,32,33,36,37,38,39,40,41,42', '5,18,22,31,33,34,35'),
(61, 3, 17, '21,22,24,33,34,41,42', '3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42', '3:B:N,4:C:N,5:A:N,6:D:N,7:C:N,8:B:N,9:A:N,10:A:N,11:D:N,12:E:N,13:C:N,14:A:N,15:B:N,16:A:N,17:C:N,18:D:N,19:D:N,20:C:N,21:E:N,22:E:N,23:D:N,24:C:N,25:B:N,26:D:N,27:E:N,28:A:N,29:C:N,30:E:N,31:B:N,32:A:N,33:D:N,34:E:N,35:E:N,36:B:N,37:A:N,38:E:N,39:D:N,40:E:N,41:E:N,42:E:N', 33, 7, '82.00', '100.00', '2020-08-27 16:14:54', '2020-08-27 18:14:54', 'N', '3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,23,25,26,27,28,29,30,31,32,35,36,37,38,39,40', '5,18,22,31,33,34,35'),
(62, 3, 21, '8,19,29,33', '3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42', '3:B:N,4:C:N,5:A:N,6:D:N,7:C:N,8:C:N,9:A:N,10:A:N,11:D:N,12:E:N,13:C:N,14:A:N,15:B:N,16:A:N,17:C:N,18:D:N,19:A:N,20:C:N,21:A:N,22:A:N,23:D:N,24:D:N,25:B:N,26:D:N,27:E:N,28:A:N,29:B:N,30:E:N,31:B:N,32:A:N,33:A:N,34:A:N,35:E:N,36:B:N,37:A:N,38:E:N,39:D:N,40:E:N,41:D:N,42:A:N', 36, 4, '90.00', '100.00', '2020-08-27 16:20:16', '2020-08-27 18:20:16', 'N', '3,4,5,6,7,9,10,11,12,13,14,15,16,17,18,20,21,22,23,24,25,26,27,28,30,31,32,34,35,36,37,38,39,40,41,42', '5,18,22,31,33,34,35'),
(63, 3, 18, '9,15,21,22,23,29,30,32,33,34,35,36,42', '3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42', '3:B:N,4:C:N,5:A:N,6:D:N,7:C:N,8:B:N,9:E:N,10:A:N,11:D:N,12:E:N,13:C:N,14:A:N,15:A:N,16:A:N,17:C:N,18:D:N,19:D:N,20:C:N,21:E:N,22:E:N,23:C:N,24:D:N,25:B:N,26:D:N,27:E:N,28:A:N,29:B:N,30:D:N,31:B:N,32:B:N,33:D:N,34:B:N,35:C:N,36:C:N,37:A:N,38:E:N,39:D:N,40:E:N,41:D:N,42:E:N', 27, 13, '67.00', '100.00', '2020-08-27 16:25:13', '2020-08-27 18:25:13', 'N', '3,4,5,6,7,8,10,11,12,13,14,16,17,18,19,20,24,25,26,27,28,31,37,38,39,40,41', '5,18,22,31,33,34,35'),
(64, 3, 25, '5,9,15,21,22,24,29,31,34', '3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42', '3:B:N,4:C:N,5:D:N,6:D:N,7:C:N,8:B:N,9:E:N,10:A:N,11:D:N,12:E:N,13:C:N,14:A:N,15:A:N,16:A:N,17:C:N,18:D:N,19:D:N,20:C:N,21:E:N,22:E:N,23:D:N,24:C:N,25:B:N,26:D:N,27:E:N,28:A:N,29:D:N,30:E:N,31:D:N,32:A:N,33:C:N,34:C:N,35:E:N,36:B:N,37:A:N,38:E:N,39:D:N,40:E:N,41:D:N,42:A:N', 31, 9, '77.00', '100.00', '2020-08-27 16:30:17', '2020-08-27 18:30:17', 'N', '3,4,6,7,8,10,11,12,13,14,16,17,18,19,20,23,25,26,27,28,30,32,33,35,36,37,38,39,40,41,42', '5,18,22,31,33,34,35'),
(65, 3, 8, '5,7,9,18,19,21,23,30,33,35', '3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42', '3:B:N,4:C:N,5:D:N,6:D:N,7:E:N,8:B:N,9:B:N,10:A:N,11:D:N,12:E:N,13:C:N,14:A:N,15:B:N,16:A:N,17:C:N,18:B:N,19:B:N,20:C:N,21:B:N,22:A:N,23:A:N,24:D:N,25:B:N,26:D:N,27:E:N,28:A:N,29:C:N,30:A:N,31:B:N,32:A:N,33:B:N,34:A:N,35:C:N,36:B:N,37:A:N,38:E:N,39:D:N,40:E:N,41:D:N,42:A:N', 30, 10, '75.00', '100.00', '2020-08-27 16:35:14', '2020-08-27 18:35:14', 'N', '3,4,6,8,10,11,12,13,14,15,16,17,20,22,24,25,26,27,28,29,31,32,34,36,37,38,39,40,41,42', '5,18,22,31,33,34,35'),
(66, 3, 23, '5,7,9,13,18,19,23,24,25,26,27,29,30,31,33,35,36,38,39,40,41', '3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42', '3:B:N,4:C:N,5:E:N,6:D:N,7:B:N,8:B:N,9:B:N,10:A:N,11:D:N,12:E:N,13:B:N,14:A:N,15:B:N,16:A:N,17:C:N,18:A:N,19:A:N,20:C:N,21:A:N,22:A:N,23:A:N,24:A:N,25:A:N,26:A:N,27:A:N,28:A:N,29:A:N,30:A:N,31:A:N,32:A:N,33:A:N,34:A:N,35:A:N,36:A:N,37:A:N,38:A:N,39:A:N,40:A:N,41:A:N,42:A:N', 19, 21, '47.00', '100.00', '2020-08-27 16:39:38', '2020-08-27 18:39:38', 'N', '3,4,6,8,10,11,12,14,15,16,17,20,21,22,28,32,34,37,42', '5,18,22,31,33,34,35'),
(67, 3, 13, '3,5,9,11,12,13,14,18,19,21,22,23,24,25,28,29,31,32,33,34,35,36,37,38', '3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42', '3:A:N,4:C:N,5:B:N,6:D:N,7:C:N,8:B:N,9:B:N,10:A:N,11:C:N,12:C:N,13:A:N,14:C:N,15:B:N,16:A:N,17:C:N,18:B:N,19:C:N,20:C:N,21:E:N,22:D:N,23:C:N,24:A:N,25:A:N,26:D:N,27:E:N,28:E:N,29:D:N,30:E:N,31:E:N,32:C:N,33:E:N,34:C:N,35:C:N,36:C:N,37:C:N,38:A:N,39:D:N,40:E:N,41:D:N,42:A:N', 16, 24, '40.00', '100.00', '2020-08-27 16:43:01', '2020-08-27 18:43:01', 'N', '4,6,7,8,10,15,16,17,20,26,27,30,39,40,41,42', '5,18,22,31,33,34,35'),
(68, 3, 11, '3,4,5,7,9,10,11,12,13,15,18,19,23,24,29,31,32,33,34,35', '3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42', '3:D:N,4:E:N,5:C:N,6:D:N,7:A:N,8:B:N,9:D:N,10:C:N,11:B:N,12:C:N,13:D:N,14:A:N,15:A:N,16:A:N,17:C:N,18:C:N,19:B:N,20:C:N,21:A:N,22:A:N,23:B:N,24:C:N,25:B:N,26:D:N,27:E:N,28:A:N,29:D:N,30:E:N,31:A:N,32:B:N,33:D:N,34:C:N,35:C:N,36:B:N,37:A:N,38:E:N,39:D:N,40:E:N,41:D:N,42:A:N', 20, 20, '50.00', '100.00', '2020-08-27 16:57:16', '2020-08-27 18:57:16', 'N', '6,8,14,16,17,20,21,22,25,26,27,28,30,36,37,38,39,40,41,42', '5,18,22,31,33,34,35'),
(69, 3, 7, '14,15,29,33,34,35', '3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42', '3:B:N,4:C:N,5:A:N,6:D:N,7:C:N,8:B:N,9:A:N,10:A:N,11:D:N,12:E:N,13:C:N,14:C:N,15:E:N,16:A:N,17:C:N,18:D:N,19:D:N,20:C:N,21:A:N,22:A:N,23:D:N,24:D:N,25:B:N,26:D:N,27:E:N,28:A:N,29:B:N,30:E:N,31:B:N,32:A:N,33:D:N,34:E:N,35:C:N,36:B:N,37:A:N,38:E:N,39:D:N,40:E:N,41:D:N,42:A:N', 34, 6, '85.00', '100.00', '2020-08-27 17:03:49', '2020-08-27 19:03:49', 'N', '3,4,5,6,7,8,9,10,11,12,13,16,17,18,19,20,21,22,23,24,25,26,27,28,30,31,32,36,37,38,39,40,41,42', '5,18,22,31,33,34,35'),
(70, 3, 24, '8,20,29,42', '3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42', '3:B:N,4:C:N,5:A:N,6:D:N,7:C:N,8:A:N,9:A:N,10:A:N,11:D:N,12:E:N,13:C:N,14:A:N,15:B:N,16:A:N,17:C:N,18:D:N,19:D:N,20:E:N,21:A:N,22:A:N,23:D:N,24:D:N,25:B:N,26:D:N,27:E:N,28:A:N,29:D:N,30:E:N,31:B:N,32:A:N,33:C:N,34:A:N,35:E:N,36:B:N,37:A:N,38:E:N,39:D:N,40:E:N,41:D:N,42:C:N', 36, 4, '90.00', '100.00', '2020-08-27 17:07:55', '2020-08-27 19:07:55', 'N', '3,4,5,6,7,9,10,11,12,13,14,15,16,17,18,19,21,22,23,24,25,26,27,28,30,31,32,33,34,35,36,37,38,39,40,41', '5,18,22,31,33,34,35'),
(71, 3, 28, '11,18,23,29,31,32,33,35,40,41,42', '3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42', '3:B:N,4:C:N,5:A:N,6:D:N,7:C:N,8:B:N,9:A:N,10:A:N,11:C:N,12:E:N,13:C:N,14:A:N,15:B:N,16:A:N,17:C:N,18:E:N,19:D:N,20:C:N,21:A:N,22:A:N,23:C:N,24:D:N,25:B:N,26:D:N,27:E:N,28:A:N,29:D:N,30:E:N,31:A:N,32:B:N,33:B:N,34:A:N,35:D:N,36:B:N,37:A:N,38:E:N,39:D:N,40:A:N,41:B:N,42:C:N', 29, 11, '72.00', '100.00', '2020-08-27 17:11:54', '2020-08-27 19:11:54', 'N', '3,4,5,6,7,8,9,10,12,13,14,15,16,17,19,20,21,22,24,25,26,27,28,30,34,36,37,38,39', '5,18,22,31,33,34,35'),
(72, 3, 27, '3,4,5,6,7,9,10,11,12,13,15,16,17,18,19,20,21,22,23,24,25,26,27,28,30,31,32,33,34,36,37,38,39,40,41', '3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42', '3:A:N,4:B:N,5:B:N,6:A:N,7:D:N,8:B:N,9:D:N,10:B:N,11:A:N,12:B:N,13:B:N,14:A:N,15:C:N,16:E:N,17:B:N,18:C:N,19:E:N,20:A:N,21:E:N,22:D:N,23:A:N,24:C:N,25:E:N,26:B:N,27:A:N,28:E:N,29:C:N,30:A:N,31:A:N,32:E:N,33:D:N,34:B:N,35:E:N,36:D:N,37:E:N,38:D:N,39:A:N,40:D:N,41:B:N,42:A:N', 5, 35, '12.00', '100.00', '2020-08-27 17:16:02', '2020-08-27 19:16:02', 'N', '8,14,29,35,42', '5,18,22,31,33,34,35'),
(73, 3, 15, '5,11,12,13,14,18,23,24,32,33,34,36,41,42', '3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42', '3:B:N,4:C:N,5:B:N,6:D:N,7:C:N,8:B:N,9:A:N,10:A:N,11:A:N,12:C:N,13:B:N,14:C:N,15:B:N,16:A:N,17:C:N,18:C:N,19:D:N,20:C:N,21:A:N,22:A:N,23:C:N,24:C:N,25:B:N,26:D:N,27:E:N,28:A:N,29:C:N,30:E:N,31:B:N,32:B:N,33:D:N,34:D:N,35:E:N,36:C:N,37:A:N,38:E:N,39:D:N,40:E:N,41:E:N,42:B:N', 26, 14, '65.00', '100.00', '2020-08-27 17:19:46', '2020-08-27 19:19:46', 'N', '3,4,6,7,8,9,10,15,16,17,19,20,21,22,25,26,27,28,29,30,31,35,37,38,39,40', '5,18,22,31,33,34,35'),
(74, 3, 12, '11,12,18,19,21,22,24,31,32,34,35,41,42', '3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42', '3:B:N,4:C:N,5:A:N,6:D:N,7:C:N,8:B:N,9:A:N,10:A:N,11:A:N,12:C:N,13:C:N,14:A:N,15:B:N,16:A:N,17:C:N,18:E:N,19:B:N,20:C:N,21:E:N,22:E:N,23:D:N,24:C:N,25:B:N,26:D:N,27:E:N,28:A:N,29:C:N,30:E:N,31:A:N,32:E:N,33:C:N,34:E:N,35:C:N,36:B:N,37:A:N,38:E:N,39:D:N,40:E:N,41:B:N,42:B:N', 27, 13, '67.00', '100.00', '2020-08-27 17:23:07', '2020-08-27 19:23:07', 'N', '3,4,5,6,7,8,9,10,13,14,15,16,17,20,23,25,26,27,28,29,30,33,36,37,38,39,40', '5,18,22,31,33,34,35'),
(76, 4, 6, '45,47', '43,44,45,46,47', '43:A:N,44:B:N,45:A:N,46:D:N,47:C:N', 3, 2, '60.00', '100.00', '2020-09-02 21:16:53', '2020-09-02 22:16:53', 'N', '43,44,46', '');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `id_jurusan` int(11) NOT NULL,
  `nama_jurusan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`id_jurusan`, `nama_jurusan`) VALUES
(1, 'TKI');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan_mapel`
--

CREATE TABLE `jurusan_mapel` (
  `id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `jurusan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jurusan_mapel`
--

INSERT INTO `jurusan_mapel` (`id`, `mapel_id`, `jurusan_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(30) NOT NULL,
  `jurusan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `nama_kelas`, `jurusan_id`) VALUES
(1, 'RPL 1', 1),
(2, 'TKJ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kelas_guru`
--

CREATE TABLE `kelas_guru` (
  `id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `guru_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kelas_guru`
--

INSERT INTO `kelas_guru` (`id`, `kelas_id`, `guru_id`) VALUES
(3, 1, 2),
(4, 2, 2),
(5, 1, 3),
(6, 2, 3),
(9, 1, 1),
(10, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

CREATE TABLE `mapel` (
  `id_mapel` int(11) NOT NULL,
  `nama_mapel` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mapel`
--

INSERT INTO `mapel` (`id_mapel`, `nama_mapel`) VALUES
(1, 'Pemrograman Dasar');

-- --------------------------------------------------------

--
-- Table structure for table `m_ujian`
--

CREATE TABLE `m_ujian` (
  `id_ujian` int(11) NOT NULL,
  `guru_id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `nama_ujian` varchar(200) NOT NULL,
  `jumlah_soal` int(11) NOT NULL,
  `waktu` int(11) NOT NULL,
  `jenis` enum('acak','urut') NOT NULL,
  `tgl_mulai` datetime NOT NULL,
  `terlambat` datetime NOT NULL,
  `token` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `m_ujian`
--

INSERT INTO `m_ujian` (`id_ujian`, `guru_id`, `mapel_id`, `nama_ujian`, `jumlah_soal`, `waktu`, `jenis`, `tgl_mulai`, `terlambat`, `token`) VALUES
(3, 1, 1, 'Pretest Materi Percabangan', 40, 120, 'urut', '2020-08-22 11:54:30', '2020-09-01 11:54:34', 'GMVHF'),
(4, 2, 1, 'Coba Ujian', 5, 60, 'urut', '2020-08-25 00:55:06', '2020-09-05 00:55:10', 'OVJEE'),
(5, 3, 1, 'Postest Materi Percabangan', 40, 120, 'urut', '2020-08-31 08:18:19', '2020-09-19 08:18:22', 'DZEDY');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nomor_induk` char(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `kelas_id` int(11) NOT NULL COMMENT 'kelas&jurusan'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `nama`, `nomor_induk`, `email`, `jenis_kelamin`, `kelas_id`) VALUES
(1, 'fara', '08121422', 'fara@gmail.com', 'P', 1),
(2, 'Nurul', '11223344', 'nurul@gmail.com', 'P', 1),
(3, 'MUHAMMAD HANIF ABDILLAH', '1906610091', 'muhammadhanifa23@gmail.com', 'L', 2),
(4, 'ICHSAN PRAMUDIKA FIRDIANSYAH', '1906610086', 'Ichsan.p.firdiansyah@gmail.com', 'L', 2),
(5, 'ASRI HUSNUL ROSADI', '1906610077', 'asrihusnulrosadi@gmail.com', 'P', 2),
(6, 'NAZUA MARCELLINO', '1906610096', 'Nazuamarcellino@gmail.com', 'L', 2),
(7, 'DAFFA MUHAMAD RIZKI ANSORI', '1906610079', 'Daffamuhamadra@gmail.com', 'L', 2),
(8, 'NADZILA KAISYA NURASTRIAN', '1906610095', 'nadzilapertiwi@gmail.com', 'P', 2),
(9, 'MUHAMMAD KEMAL ARDHIKA DIPUTRA', '1906610092', 'm.kemal.ardhika@gmail.com', 'P', 2),
(10, 'SYEHAN AHMAD ZAIN', '1906610103', 'syehanahmad01@gmail.com', 'P', 2),
(11, 'WAFA SALSABILA', '1906610104', 'wafasalsabila246@gmail.com', 'P', 2),
(12, 'HANDOKO RAFFLI', '1906610084', 'handokoraffli6005@gmail.com', 'L', 2),
(13, 'AULIA RINJANI', '1906610078', 'auliahh5@gmail.com', 'P', 2),
(14, 'RAFLY ANDIKA PERMANA', '1906610097', 'raflyandika444@gmail.com', 'P', 2),
(15, 'FEBRYAN ADI PUTRA', '1906610082', 'febryanadiputra@gmail.com', 'L', 2),
(16, 'SULASTRI', '1906610102', 'sulastrisulastri40476@gmail.com', 'P', 2),
(17, 'MUHAMMAD  SULAEMAN', '1906610088', 'muhammadsulaeman9f20@gmail.com', 'P', 2),
(18, 'FITRIANI DWI AZZAHRA', '1906610083', 'fitrianiiazzahra0@gmail.com', 'P', 2),
(19, 'ANDY MAS PUTRA', '1906610075', '123andymasputragp@gmail.com', 'L', 2),
(20, 'RIFALDI ADI PAMUNGKAS', '1906610099', 'rifaldiadi88@gmail.com', 'L', 2),
(21, 'MUHAMMAD FARHAN GINANJAR', '1906610090', 'Fginanjar45@gmail.com', 'L', 2),
(22, 'YOGA AKBAR FIRDAUS', '1906610105', 'yoga.akbar2015@gmail.com', 'L', 2),
(23, 'DINAR HAMDANI', '1906610080', 'dinarhamdani03@gmail.com', 'L', 2),
(24, 'MARSELLA PUTRI TOMMY AMANDA', '1906610087', 'Sellamarsella123455@gmail.com', 'P', 2),
(25, 'SHALFA ALMIRA DEANA', '1906610101', 'shalfa.almira2003@gmail.com', 'P', 2),
(26, 'SEPTIAN RIZKI NUGRAHA', '1906610100', 'srizki245@gmail.com', 'L', 2),
(27, 'RAKA AKBARUL FILMAN', '1906610098', 'rakaakbarulfilman23@gmail.com', 'L', 2),
(28, 'MUHAMMAD SYAMSUL RIZAL', '1906610093', 'rizalsyamsulr1@gmail.com', 'L', 2),
(29, 'dissa pacar laup', '01010101', 'laup@gmail.com', 'P', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_soal`
--

CREATE TABLE `tb_soal` (
  `id_soal` int(11) NOT NULL,
  `guru_id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `bobot` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `tipe_file` varchar(50) NOT NULL,
  `id_hambatan` int(11) NOT NULL,
  `soal` longtext NOT NULL,
  `opsi_a` longtext NOT NULL,
  `opsi_b` longtext NOT NULL,
  `opsi_c` longtext NOT NULL,
  `opsi_d` longtext NOT NULL,
  `opsi_e` longtext NOT NULL,
  `file_a` varchar(255) NOT NULL,
  `file_b` varchar(255) NOT NULL,
  `file_c` varchar(255) NOT NULL,
  `file_d` varchar(255) NOT NULL,
  `file_e` varchar(255) NOT NULL,
  `jawaban` varchar(5) NOT NULL,
  `created_on` int(11) NOT NULL,
  `updated_on` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_soal`
--

INSERT INTO `tb_soal` (`id_soal`, `guru_id`, `mapel_id`, `bobot`, `file`, `tipe_file`, `id_hambatan`, `soal`, `opsi_a`, `opsi_b`, `opsi_c`, `opsi_d`, `opsi_e`, `file_a`, `file_b`, `file_c`, `file_d`, `file_e`, `jawaban`, `created_on`, `updated_on`) VALUES
(3, 1, 1, 1, '', '', 3, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>Notasi pseudocode yang tepat untuk pernyataan</p><p><strong>“jika kondisi tidak terpenuhi maka tidak dilakukan apa-apa, dan jika kondisi terpenuhi ada aksi yang dilakukan”</strong></p><p>adalah …</p></td></tr></tbody></table>', '', '', '', '', '', '55cab60968faa1a956ca57a9104e1945.png', 'cfd53772c4f9baa72a09619a43f7c1b3.png', '6d784c07e28b58a48dfca87b3df7fc99.png', 'c137db6282fd3cb477f18d7f12781892.png', '031bfd09eea06388c8d791cb2ae971f2.png', 'B', 1598007520, 1598007520),
(4, 1, 1, 1, '', '', 4, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p><strong>“jika kondisi terpenuhi maka aksi dilakukan dan jika kondisi tidak terpenuhi maka tidak ada aksi yang dikerjakan”</strong></p><p>Berdasarkan pernyataan di atas, notasi flowchart nya adalah …</p></td></tr></tbody></table>', '', '', '', '', '', '1cacf4c2cde017fd6cff3a366400c515.png', '152e8e1e60c71153a05c62a7b5b22166.png', 'b7789297d2a89faea6391e0aff3cd866.png', 'a7da560c22887809d2cf09272be372c7.png', 'dc151cc3069a4fc3a5545b135e0bd444.png', 'C', 1598007747, 1598007747),
(5, 1, 1, 1, '', '', 5, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>Waktu yang tepat dalam menggunakan percabangan If-Then adalah …</p></td></tr></tbody></table>', '<p>Saat hanya satu kasus</p>', '<p>Saat dua kasus atau lebih</p>', '<p>Saat ada aksi yang berulang</p>', '<p>Saat ada kondisi dan aksi</p>', '<p>Saat memiliki aksi alternatif</p>', '', '', '', '', '', 'A', 1598007921, 1598007921),
(6, 1, 1, 1, 'e215cee7732b5634952c02f008186d85.png', 'image/png', 6, '<p>Uraian alur kerja algoritma di atas adalah …</p>', '<p>Jika nilai variabel a lebih kecil dari atau sama dengan variabel b maka dicetak “a lebih besar dari b”</p>', '<p>Jika nilai variabel a lebih besar dari atau sama dengan variabel b maka dicetak “a lebih besar dari b”</p>', '<p>Jika nilai variabel a lebih besar dari atau sama dengan variabel b maka tidak dicetak “a lebih besar dari b”</p>', '<p>Jika nilai variabel a lebih besar dari variabel b maka dicetak “a lebih besar dari b” </p>', '<p>Jika nilai variabel a sama dengan variabel b maka dicetak “a lebih besar dari b” </p>', '', '', '', '', '', 'D', 1598008152, 1598008152),
(7, 1, 1, 1, '71f707125c2fd40137215a9738db51c5.png', 'image/png', 7, '<p>Berdasarkan algoritma di bawah, kalimat “bilangan kelipatan 5” dicetak saat ….</p>', '<p>Saat aksi “READ x” terpenuhi</p>', '<p>Saat kondisi “x mod 5 == 0” tidak terpenuhi</p>', '<p>Saat kondisi “x mod 5 == 0” terpenuhi</p>', '<p>Saat aksi “WRITE x” terpenuhi </p>', '<div aria-label=\"question options\">Saat “ENDIF” terpenuhi</div>', '', '', '', '', '', 'C', 1598008415, 1598008415),
(8, 1, 1, 1, '085295ba4a5822d3980739eaf9f53ec1.png', 'image/png', 8, '<p>Berdasarkan algoritma di atas, yang terjadi saat nilai x = 5  adalah ….</p>', '<p>Muncul kalimat “WRITE x, “bilangan kelipatan 5” ” </p>', '<p>Muncul kalimat “ 5 bilangan kelipatan 5”</p>', '<p>Tidak terjadi apa-apa </p>', '<p>Muncul “5” saja </p>', '<p>Muncul kalimat “x mod 5 = = 0” </p>', '', '', '', '', '', 'B', 1598011916, 1598011916),
(9, 1, 1, 1, 'ac51c56a3c3f9dc667e94d91568fd3e3.png', 'image/png', 8, '<p>Berdasarkan algoritma di bawah, yang terjadi jika nilai a = 5 dan b = 8 adalah …</p>', '<p>Tidak terjadi apa-apa </p>', '<p>Dicetak kalimat “a lebih besar dari b” </p>', '<p>Dicetak kalimat “WRITE “a lebih besar dari b” ” </p>', '<p>Dicetak “a = 5 b= 8” </p>', '<p>Dicetak “5” dan “8” saja </p>', '', '', '', '', '', 'A', 1598012071, 1598012071),
(10, 1, 1, 1, 'a799eaeaf14c84019f3a7ee95881cfa4.png', 'image/png', 9, '<p>Perhatikan algoritma pada gambar yang dilampirkan. Apabila nilai variabel membeliProduk = 8, maka output yang dihasilkan adalah ….</p>', '<p>Tidak terjadi apa-apa </p>', '<p>Dicetak “Anda mendapatkan payung” </p>', '<p>Dicetak “membeliProduk < 10>', '<p>Dicetak “WRITE “Anda mendapatkan payung” ” </p>', '<p>Dicetak “membeliProduk = 8” </p>', '', '', '', '', '', 'A', 1598012212, 1598012212),
(11, 1, 1, 1, '0f21d89891f6885baa4febae0fca71c7.png', 'image/png', 10, '<p>Berdasarkan pernyataan pada gambar yang dilampirkan, notasi pseudocode percabangan If-Then yang tepat adalah …</p>', '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>if (suhu >= 50) then</p><p>alarmBunyi = true</p><p>endIf</p></td></tr></tbody></table>', '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>if (suhu < 50><p>alarmBunyi = true</p><p>endIf</p></td></tr></tbody></table>', '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>if (suhu > 50) then</p><p>alarmBunyi = false</p><p>endIf</p></td></tr></tbody></table>', '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>if (suhu > 50) then</p><p>alarmBunyi = true</p><p>endIf</p></td></tr></tbody></table><p><br></p><p><br></p>', '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>if (suhu &lt;= 50) then</p><p>alarmBunyi = false</p><p>endIf</p></td></tr></tbody></table><p><br></p>', '', '', '', '', '', 'D', 1598012459, 1598012459),
(12, 1, 1, 1, '6f340845cd6ad9e2a02d8fe9c63676af.png', 'image/png', 11, '<p>Berdasarkan pernyataan pada gambar yang dilampirkan, notasi flowchart percabangan If-Then yang tepat adalah …</p>', '', '', '', '', '', '0c7402e0c42a7b9c82cabde7831372cf.png', '78d07ef639fe77b0578b3fb634d03e52.png', '65a661aef8a4c1f22bd721df81190b90.png', '2ef0da8b865453f9a3bb57a87302772f.png', 'a7c37d7a23ceb11b046d65169fc9bef5.png', 'E', 1598012731, 1598012731),
(13, 1, 1, 1, '', '', 13, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p><strong>“jika kondisi terpenuhi maka aksi dilakukan dan jika kondisi tidak terpenuhi maka alternatif aksi dilakukan”</strong></p><p>Berdasarkan pernyataan di atas, notasi pseudocode nya adalah …</p></td></tr></tbody></table>', '', '', '', '', '', 'd60468867c7bcca01d69b8c4a97a70e7.png', 'fd8169c045951df1651ad2698aa4dfe7.png', '864e45ca6434381c1bb77e448311e4fd.png', '1a4e37137bc254dc512b8275ce39a86d.png', 'c740fd2726cf836a9cdf3376e90d74e2.png', 'C', 1598031068, 1598031068),
(14, 1, 1, 1, '', '', 14, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p><strong>“jika kondisi terpenuhi maka aksi dilakukan dan jika kondisi tidak terpenuhi maka alternatif aksi dilakukan”</strong></p><p>Berdasarkan pernyataan di atas, notasi flowchart nya adalah …</p></td></tr></tbody></table>', '', '', '', '', '', '3f4b8dddc20c8f19d17907ffe74ad17b.png', '6478affd856eb6b494d2a5735854552d.png', '664f53587a01f77b0e8958061c630dda.png', '072fb203e5724e6693f17ef6508a30a3.png', 'cce0ca88d392bc6f1443f65d613fad26.png', 'A', 1598031346, 1598031346),
(15, 1, 1, 1, '', '', 15, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>Waktu yang tepat dalam menggunakan percabangan If-Then-Else adalah …</p></td></tr></tbody></table>', '<p>Saat ada kondisi dan aksi</p>', '<p>Saat memiliki aksi alternatif</p>', '<p>Saat hanya satu kasus</p>', '<p>Saat ada aksi yang berulang</p>', '<p>Saat tiga kasus atau lebih</p>', '', '', '', '', '', 'B', 1598031472, 1598031472),
(16, 1, 1, 1, 'a0919428fe3f6b20b5e110fa82b7ae2e.png', 'image/png', 16, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>Berdasarkan algoritma di atas, kalimat “<strong>Bilangan Positif</strong>” dicetak saat ….</p></td></tr></tbody></table>', '<p>Saat kondisi “nilai > 0” terpenuhi</p>', '<p>Saat kondisi “nilai >= 0” terpenuhi</p>', '<p>Saat aksi “READ nilai” terpenuhi</p>', '<p>Saat “ENDIF” terpenuhi</p>', '<p>Saat kondisi “ELSE” terpenuhi</p>', '', '', '', '', '', 'A', 1598031855, 1598031855),
(17, 1, 1, 1, 'bf0235afb06f69eae5a7ead66aae9c09.png', 'image/png', 17, '<p>Berdasarkan algoritma pada gambar yang dilampirkan, yang terjadi nilai = 8 adalah ….</p>', '<p>Dicetak kalimat “nilai > 0”</p>', '<p>Dicetak kalimat “Bilangan Negatif”</p>', '<p>Dicetak kalimat “Bilangan Positif”</p>', '<p>Tidak terjadi apa-apa</p>', '<p>Dicetak kalimat “nilai < 0>', '', '', '', '', '', 'C', 1598031986, 1598031986),
(18, 1, 1, 1, 'a06b6e8cdbe2a30eecfc2ef943ac7000.png', 'image/png', 18, '<p>Perbedaan antara kedua notasi pseudocode di bawah ini adalah …</p>', '<p>Pada percabangan <strong>If-Then</strong> terdapat satu kondisi yang jika terpenuhi maka akan dilakukan tiga aksi/pernyataan. Pada percabangan <strong>If-Then-Else</strong> terdapat satu kondisi yang jika terpenuhi maka akan dilakukan dua aksi/pernyataan atau lebih dan jika kondisi tidak terpenuhi maka tidak ada alternatif aksi yang akan dilakukan.</p>', '<p>Pada percabangan <strong>If-Then</strong> terdapat satu kondisi yang jika terpenuhi maka tidak akan melakukan aksi apa-apa. Pada percabangan<strong> If-Then-Else</strong> terdapat satu kondisi yang jika terpenuhi maka akan dilakukan dua aksi/pernyataan atau lebih dan jika kondisi tidak terpenuhi maka akan ada alternatif aksi yang akan dilakukan.</p>', '<p>Pada percabangan <strong>If-Then </strong>terdapat dua kondisi yang jika terpenuhi maka akan dilakukan tiga aksi/pernyataan. Pada percabangan <strong>If-Then-Else</strong> terdapat satu kondisi yang jika terpenuhi maka akan dilakukan dua aksi/pernyataan atau lebih dan jika kondisi tidak terpenuhi maka akan ada alternatif aksi yang akan dilakukan.</p>', '<p>Pada percabangan <strong>If-Then</strong> terdapat satu kondisi yang jika terpenuhi maka akan dilakukan tiga aksi/pernyataan. Pada percabangan<strong> If-Then-Else</strong> terdapat satu kondisi yang jika terpenuhi maka akan dilakukan dua aksi/pernyataan atau lebih dan jika kondisi tidak terpenuhi maka akan ada alternatif aksi yang akan dilakukan.</p>', '<p>Pada percabangan <strong>If-Then</strong> terdapat satu kondisi yang jika terpenuhi maka akan dilakukan dua aksi/pernyataan atau lebih dan jika kondisi tidak terpenuhi maka akan ada alternatif aksi yang akan dilakukan. Pada percabangan <strong>If-Then-Else</strong> terdapat satu kondisi yang jika terpenuhi maka akan dilakukan tiga aksi/pernyataan.</p>', '', '', '', '', '', 'D', 1598032356, 1598032356),
(19, 1, 1, 1, '1913345ba21a8226537f0c38824ed940.png', 'image/png', 19, '<p>Perbedaan antara kedua notasi flowchart di bawah ini adalah …</p>', '<p>Pada percabangan <strong>If-Then</strong> terdapat satu kondisi yang jika terpenuhi maka akan dilakukan aksi/pernyataan. Pada percabangan<strong> If-Then-Else</strong> terdapat satu kondisi yang jika terpenuhi maka akan dilakukan aksi/pernyataan dan jika kondisi tidak terpenuhi maka tidak ada alternatif aksi yang akan dilakukan.</p>', '<p>Pada percabangan<strong> If-Then</strong> terdapat satu kondisi yang jika terpenuhi maka tidak akan melakukan aksi apa-apa. Pada percabangan <strong>If-Then-Else</strong> terdapat satu kondisi yang jika terpenuhi maka akan dilakukan aksi/pernyataan dan jika kondisi tidak terpenuhi maka akan ada alternatif aksi yang akan dilakukan.</p>', '<p>Pada percabangan<strong> If-Then</strong> terdapat dua kondisi yang jika terpenuhi maka akan dilakukan aksi/pernyataan. Pada percabangan<strong> If-Then-Else</strong> terdapat satu kondisi yang jika terpenuhi maka akan dilakukan aksi/pernyataan dan jika kondisi tidak terpenuhi maka akan tidak ada alternatif aksi yang akan dilakukan.</p>', '<p>Pada percabangan<strong> If-Then</strong> terdapat satu kondisi yang jika terpenuhi maka akan dilakukan aksi/pernyataan. Pada percabangan <strong>If-Then-Else</strong> terdapat satu kondisi yang jika terpenuhi maka akan dilakukan aksi/pernyataan atau lebih dan jika kondisi tidak terpenuhi maka akan ada alternatif aksi yang akan dilakukan.</p>', '<p>Pada percabangan <strong>If-Then</strong> terdapat satu kondisi yang jika terpenuhi maka akan dilakukan dua aksi/pernyataan dan jika kondisi tidak terpenuhi maka akan ada alternatif aksi yang akan dilakukan. Pada percabangan <strong>If-Then-Else</strong> terdapat satu kondisi yang jika terpenuhi maka akan dilakukan aksi/pernyataan.</p>', '', '', '', '', '', 'D', 1598032734, 1598032734),
(20, 1, 1, 1, 'b8c3248b17691793acf9155b365d7c22.png', 'image/png', 26, '<p>Berdasarkan algoritma pada gambar yang dilampirkan, jika nilai bilangan adalah bilangan = 298, maka output yang dihasilkan adalah …</p>', '<p>Bilangan 298</p>', '<p>Bilangan = 298</p>', '<p>Bilangan Genap</p>', '<p>Bilangan Ganjil</p>', '<p>WRITE Bilangan Genap Bilangan Ganjil</p>', '', '', '', '', '', 'C', 1598032917, 1598032917),
(21, 1, 1, 1, '5907386d1cd4feb9cf0735cf00a74f5e.png', 'image/png', 20, '<p>Berdasarkan narasi pada gambar yang dilampirkan, algoritma pseudocode percabangan If-Then-Else yang tepat adalah …</p>', '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>if (nilai < 78><p>   WRITE ”Remedial”</p><p>else</p><p>    WRITE nilai</p><p>end if</p></td></tr></tbody></table>', '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>if (nilai > 78) then</p><p>   WRITE ”Remedial”</p><p>else</p><p>    WRITE nilai</p><p>end if</p></td></tr></tbody></table>', '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>if (nilai == 78) then</p><p>   WRITE ”Remedial”</p><p>else</p><p>    WRITE nilai</p><p>end if</p></td></tr></tbody></table>', '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>if (nilai < 78><p>   WRITE Remedial</p><p>else</p><p>    WRITE nilai</p><p>end if</p></td></tr></tbody></table>', '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>if (nilai >= 78) then</p><p>   WRITE ” nilai”</p><p>else</p><p>    WRITE ”Remedial”</p><p>end if</p></td></tr></tbody></table><p><br></p><p><br></p>', '', '', '', '', '', 'A', 1598033178, 1598033178),
(22, 1, 1, 1, 'eb3d51e2f5335dfc882a6a4c144a983b.png', 'image/png', 21, '<p>Berdasarkan narasi pada gambar yang dilampirkan, algoritma flowchart percabangan If-Then-Else yang tepat adalah …</p>', '', '', '', '', '', '418662e35c1fe32b76eb3e949d487e71.png', '777dcfe327b27290e339e745ddca5aa6.png', '854777347f97657613637305813f1bae.png', '3dd78796eac523aec25a823515e9a676.png', '', 'A', 1598033437, 1598033437),
(23, 1, 1, 1, '', '', 22, '<p>Yang dimaksud dengan percabangan Nested-If adalah …</p>', '<p>Algoritma untuk menganalisis satu kasus yang dimana jika kondisi terpenuhi maka aksi akan dilakukan dan jika tidak terpenuhi maka tidak ada aksi yang dikerjakan</p>', '<p>Algoritma yang menyediakan satu alternatif aksi jika kondisi tidak terpenuhi</p>', '<p>Algoritma untuk menganalisis dua kasus atau lebih yang tulisannya lebih sederhana</p>', '<p>Algoritma untuk mengalisis tiga kasus atau lebih yang memiliki struktur yang bertingkat-tingkat</p>', '<p>Algoritma untuk menganalisis satu kasus yang dimana jika kondisi terpenuhi maka tidak ada aksi yang dikerjakan</p>', '', '', '', '', '', 'D', 1598034007, 1598034007),
(24, 1, 1, 1, '', '', 24, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p><strong>“jika kondisi utama terpenuhi maka aksi dilakukan dan terdapat turunan kondisi di dalam aksi dan jika turunan kodisi terpenuhi maka turunan aksi dilakukan dan jika tidak terpenuhi maka turunan alternatif aksi akan dilakukan. Jika kondisi tidak terpenuhi maka ada alternatif aksi yang dilakukan strukturnya bertingkat-tingkat”</strong></p><p>Berdasarkan pernyataan di atas, notasi flowchart nya adalah …</p></td></tr></tbody></table>', '', '', '', '', '', 'b0dcc87c2cbd81c2e666eb44a6784c8c.png', '5f49c183404220efe2a1f3411742c3f4.png', 'f8b321f9da49c122b064b8b4c303b1b6.png', '42ae4aa17ec63b3e1b8c69d35a32b39c.png', '356b7cfc8d343cb7aae6c72b0e895083.png', 'D', 1598034289, 1598034289),
(25, 1, 1, 1, 'e9d663c15b0a68cd3c62d54fa8656db1.png', 'image/png', 25, '<p>Uraian alur kerja algoritma pada gambar yang dilampirkan adalah …</p>', '<p>Jika usia kurang atau sama dengan dari 5 maka dicetak kata “Anak-anak” dan jika usia lebih dari 5 dan usia kurang atau sama dengan 12 maka dicetak kata “Balita” dan jika usia lebih dari 12 dan usia kurang dari atau sama dengan 18 maka dicetak kata “Dewasa” dan jika kondisi tidak terpenuhi maka akan dicetak “Remaja”</p>', '<p>Jika usia kurang dari atau sama dengan 5 maka dicetak kata “Balita” dan jika usia lebih dari 5 dan usia kurang dari atau sama dengan 12 maka dicetak kata “Anak-anak” dan jika usia lebih dari 12 dan usia kurang dari atau sama dengan 18 maka dicetak kata “Remaja” dan jika kondisi tidak terpenuhi maka akan dicetak “Dewasa”</p>', '<p>Jika usia sama dengan dari 5 maka dicetak kata “Anak-anak” dan jika usia lebih atau sama dengan 5 dan usia kurang dari 12 maka dicetak kata “Balita” dan jika usia lebih dari atau sama dengan 12 dan usia kurang dari 18 maka dicetak kata “Dewasa” dan jika kondisi tidak terpenuhi maka akan dicetak “Remaja”</p>', '<p>Jika usia lebih dari atau sama dengan 5 maka dicetak kata “Balita” dan jika usia kurang dari 5 dan usia lebih dari atau sama dengan 12 maka dicetak kata “Anak-anak” dan jika usia lebih dari atau sama dengan 12 dan usia kurang dari 18 maka dicetak kata “Remaja” dan jika kondisi tidak terpenuhi maka akan dicetak “Dewasa”</p>', '<p>Jika usia lebih dari atau sama dengan 5 maka dicetak kata “Balita” dan jika usia kurang dari 5 dan usia lebih dari atau sama dengan 12 maka dicetak kata “Anak-anak” dan jika usia lebih dari atau sama dengan 12 dan usia kurang dari 18 maka dicetak kata “Remaja” dan jika kondisi tidak terpenuhi maka tidak terjadi apa-apa</p>', '', '', '', '', '', 'B', 1598034684, 1598034684),
(26, 1, 1, 1, '687429d305372f448f7f1ee84442e15d.png', 'image/png', 27, '<p>Berdasarkan algoritma yang dilampirkan, kata “Remaja” dicetak saat …</p>', '<p>Saat “READ usia” terpenuhi</p>', '<p>Saat “ELSE IF (usia > 5 AND usia &lt;= 12)” terpenuhi</p>', '<p>Saat “WRITE “Remaja” ” terpenuhi</p>', '<p>Saat “ELSE IF (usia > 12 AND usia &lt;= 18)” terpenuhi</p>', '<p>Saat “IF (usia &lt;= 5)” terpenuhi</p>', '', '', '', '', '', 'D', 1598034856, 1598034856),
(27, 1, 1, 1, '8d6714419949784c21231ed7e10ce791.png', 'image/png', 28, '<p>Berdasarkan algoritma yang di lampirkan, yang terjadi saat usia = 17 adalah …</p>', '<p>Dicetak kalimat “WRITE “Dewasa” ”</p>', '<p>Dicetak “17” saja</p>', '<p>Dicetak kalimat “usia &lt;= 5”</p>', '<p>Tidak terjadi apa-apa</p>', '<p>Dicetak kata “Remaja”</p>', '', '', '', '', '', 'E', 1598034993, 1598034993),
(28, 1, 1, 1, '4d1c7d6a44de70490acb68962170b212.png', 'image/png', 28, '<p>Berdasarkan algoritma di bawah ini, yang terjadi jika usia = 22 adalah …</p>', '<p>Muncul kata “Dewasa”</p>', '<p>Muncul “22” saja</p>', '<p>Muncul kalimat “WRITE “Dewasa” ”</p>', '<p>Muncul kalimat “usia > 12 AND usia &lt;= 18”</p>', '<p>Tidak terjadi apa-apa</p>', '', '', '', '', '', 'A', 1598035110, 1598035110),
(29, 1, 1, 1, '', '', 29, '<p>Menentukan nilai dalam huruf A, B, C, D, dan E dalam nilai akhir raport dengan ketentuan nilai akhir 90 sampai 100 adalah A, nilai akhir 80 sampai 89 adalah B, nilai akhir 70 sampai 79 adalah C, nilai akhir 60 sampai 69 adalah D, dan nilai akhir dibawah 60 adalah E, dapat diimplementasikan ke dalam percabangan …</p>', '<p>Percabangan If-Then</p>', '<p>Percabangan Switch Case</p>', '<p>Percabangan Nested-If</p>', '<p>Percabangan If-Then-Else</p>', '<p>Percabangan Satu Kondisi</p>', '', '', '', '', '', 'C', 1598035282, 1598035282),
(30, 1, 1, 1, 'eb45bf221592f6e567bc564445998f72.png', 'image/png', 30, '<p>Berdasarkan algoritma pada gambar yang dilampirkan, jika nilai LampuLaluLintas = “biru”, output yang dihasilkan adalah ….</p>', '<p>Dicetak kalimat “Lampu Lalu Lintas berwarna Biru”</p>', '<p>Dicetak kalimat “WRITE “Biru””</p>', '<p>Dicetak kata “maju”</p>', '<p>Dicetak “Maaf inputan Anda salah”</p>', '<p>Tidak terjadi apa-apa</p>', '', '', '', '', '', 'E', 1598035419, 1598035419),
(31, 1, 1, 1, '', '', 31, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p><strong>Fahri diminta untuk membuat program penentuan remedial untuk siswa dari setiap rentang nilai. Untuk siswa yang rentang nilainya 0 sampai 60, dilakukan remedial berupa test ulang, untuk rentang 61 sampai 75, dilakukan remedial berupa penugasan, dan rentang nilai 76 sampai 100 tidak melakukan remedial.</strong></p><p>Berdasarkan narasi di atas, notasi pseudocode percabangan Nested-If yang tepat adalah ….</p></td></tr></tbody></table>', '', '', '', '', '', 'ebd221f10467e88f08c8f563a813fff1.png', '624a4f963eecd2073100698613da654a.png', '2b4a2df4c7f3287345042605d396488d.png', 'f1673cf22d62b0039e463e939f75ee3e.png', 'eb59e3cb56374bee7e398c7112734638.png', 'B', 1598035728, 1598035728),
(32, 1, 1, 1, '', '', 32, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p><strong>Rudi diminta untuk membuat program untuk menentukan apakah sebuah bilangan bulat merupakan bilangan positif, negatif, atau nol.</strong></p><p>Berdasarkan narasi di atas, notasi flowchart percabangan Nested-If yang tepat adalah …</p></td></tr></tbody></table>', '', '', '', '', '', 'ff75475ceb51ac3899c7a9ece4c7b625.png', 'cfe10068d3fd25d4df64a5118c17c0f1.png', '50bacc6a93f0ff260bcdbc0c8562b797.png', '84b4841d1363061f06038ad8c4e41f0b.png', '427374ddcf33e2816be1e473ba980465.png', 'A', 1598035913, 1598035913),
(33, 1, 1, 1, '', '', 33, '<p>Yang dimaksud dengan percabangan Switch Case adalah …</p>', '<p>Algoritma yang menyediakan satu alternatif aksi jika kondisi tidak terpenuhi</p>', '<p>Algoritma untuk menganalisis satu kasus yang dimana jika kondisi terpenuhi maka tidak ada aksi yang dikerjakan</p>', '<p>Algoritma untuk menganalisis dua kasus atau lebih yang tulisannya lebih sederhana</p>', '<p>Algoritma untuk menganalisis tiga kasus atau lebih yang memiliki struktur yang bertingkat-tingkat</p>', '<p>Algoritma untuk menganalisis satu kasus yang dimana jika kondisi terpenuhi maka aksi akan dilakukan dan jika tidak terpenuhi maka tidak ada aksi yang dikerjakan</p>', '', '', '', '', '', 'C', 1598036040, 1598036040),
(34, 1, 1, 1, '', '', 34, '<p>Pada percabangan Switch Case, hanya bisa menggunakan tipe data ordinal. Tipe data ordinal adalah ….</p>', '<p>Tipe data yang dapat dihitung</p>', '<p>Tipe data berdasarkan dasar-dasar logika</p>', '<p>Tipe data yang bernilai kata atau kalimat</p>', '<p>Tipe data yang bernilai bilangan riil</p>', '<p>Tipe data yang bernilai karakter</p>', '', '', '', '', '', 'A', 1598036133, 1598036133),
(35, 1, 1, 1, '', '', 35, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p><strong>“jika kondisi utama terpenuhi maka aksi dilakukan dan jika kondisi tidak terpenuhi maka ada alternatif kondisi yang jumlahnya bisa lebih dari satu beserta alternatif aksinya. Apabila seluruh alternatif kondisi tidak terpenuhi maka disediakan alternatif kondisi terakhir untuk mengatasi hal tersebut”</strong></p><p>Berdasarkan pernyataan di atas, notasi pseudocode nya adalah …</p></td></tr></tbody></table>', '', '', '', '', '', '91bf057123d05ba7fc5a531d8c44bd14.png', 'ebe5c3c89f8342c3a9a9e9cdb5ee8802.png', '5aad0ab89f3c5504ac2f1bf2734135aa.png', '039a6e50f6453e389315721e61c2ff76.png', 'bbc88dad3f9cba5e1fcc58be18468bbd.png', 'E', 1598036282, 1598036282),
(36, 1, 1, 1, '', '', 36, '<p>Waktu yang tepat dalam menggunakan percabangan Switch Case adalah …</p>', '<p>Saat hanya satu kasus</p>', '<p>Saat dua kasus atau lebih dan kondisi sederhana</p>', '<p>Saat ada aksi yang berulang</p>', '<p>Saat ada kondisi dan aksi</p>', '<p>Saat memiliki aksi alternatif</p>', '', '', '', '', '', 'B', 1598036381, 1598036381),
(37, 1, 1, 1, '1ec2710615a7357d080f171009a2cffc.png', 'image/png', 37, '<p>Uraian alur kerja algoritma pada gambar yang dilampirkan adalah …</p>', '<p>Jika nilai variabel input sama dengan 1 maka akan dicetak kata “Senin”, jika  nilai variabel input sama dengan 2 maka akan dicetak kata “Selasa”, jika  nilai variabel input sama dengan 3 maka akan dicetak kata “Rabu”, jika  nilai variabel input sama dengan 4 maka akan dicetak kata “Kamis”, jika  nilai variabel input sama dengan 5 maka akan dicetak kata “Jum’at”, jika  nilai variabel input sama dengan 6 maka akan dicetak kata “Sabtu”, jika  nilai variabel input sama dengan 7 maka akan dicetak kata “Minggu”, jika  nilai variabel input tidak memenuhi kondisi yang disediakan maka akan dicetak kalimat “Periksa inputan!”</p>', '<p>Jika nilai variabel input sama dengan 1 maka akan dicetak kata “Senin”, jika  nilai variabel input sama dengan 2 maka akan dicetak kata “Selasa”, jika  nilai variabel input sama dengan 3 maka akan dicetak kata “Rabu”, jika  nilai variabel input sama dengan 4 maka akan dicetak kata “Kamis”, jika  nilai variabel input sama dengan 5 maka akan dicetak kata “Jum’at”, jika  nilai variabel input sama dengan 6 maka akan dicetak kata “Sabtu”, jika  nilai variabel input sama dengan 7 maka akan dicetak kata “Minggu”, jika  nilai variabel input tidak memenuhi kondisi yang disediakan maka akan dicetak kalimat “Ini hari apa ya?”</p>', '<p>Jika nilai variabel input sama dengan 1 maka akan dicetak kata “Senin”, jika  nilai variabel input sama dengan 2 maka akan dicetak kata “Selasa”, jika  nilai variabel input sama dengan 3 maka akan dicetak kata “Rabu”, jika  nilai variabel input sama dengan 4 maka akan dicetak kata “Kamis”, jika  nilai variabel input sama dengan 5 maka akan dicetak kata “Jum’at”, jika  nilai variabel input sama dengan 6 maka akan dicetak kata “Enam”, jika  nilai variabel input sama dengan 7 maka akan dicetak kata “Minggu”, jika  nilai variabel input tidak memenuhi kondisi yang disediakan maka akan dicetak kalimat “Periksa inputan!”</p>', '<p>Jika nilai variabel input sama dengan 1 maka akan dicetak kata “Senin”, jika  nilai variabel input sama dengan 2 maka akan dicetak kata “Selasa”, jika  nilai variabel input sama dengan 3 maka akan dicetak kata “Rabu”, jika  nilai variabel input sama dengan 4 maka akan dicetak kata “Kamis”, jika  nilai variabel input sama dengan 55 maka akan dicetak kata “Jum’at”, jika  nilai variabel input sama dengan 6 maka akan dicetak kata “Sabtu”, jika  nilai variabel input sama dengan 7 maka akan dicetak kata “Minggu”, jika  nilai variabel input tidak memenuhi kondisi yang disediakan maka akan dicetak kalimat “Periksa inputan!”</p>', '<p>Jika nilai variabel input sama dengan 1 maka akan dicetak kata “Satu”, jika  nilai variabel input sama dengan 2 maka akan dicetak kata “Selasa”, jika  nilai variabel input sama dengan 3 maka akan dicetak kata “Rabu”, jika  nilai variabel input sama dengan 4 maka akan dicetak kata “Kamis”, jika  nilai variabel input sama dengan 5 maka akan dicetak kata “Jum’at”, jika  nilai variabel input sama dengan 6 maka akan dicetak kata “Sabtu”, jika  nilai variabel input sama dengan 7 maka akan dicetak kata “Minggu”, jika  nilai variabel input tidak memenuhi kondisi yang disediakan maka akan dicetak kalimat “Periksa inputan!”</p>', '', '', '', '', '', 'A', 1598036591, 1598036591),
(38, 1, 1, 1, 'f572af447ba2ea8fd6f7370eeea8370b.png', 'image/png', 38, '<p>Berdasarkan algoritma pada gambar yang dilampirkan, kalimat “Selasa” muncul saat …</p>', '<p>Nilai input sama dengan 5</p>', '<p>Aksi “WRITE “Selasa” ” terpenuhi</p>', '<p>Kondisi default terpenuhi</p>', '<p>Aksi “Switch (input)” terpenuhi</p>', '<p>Nilai input sama dengan 2</p>', '', '', '', '', '', 'E', 1598036736, 1598036736),
(39, 1, 1, 1, 'fa5e76cfa84a9164b4ee9907703d3845.png', 'image/png', 39, '<p>Berdasarkan algoritma pada gambar yang dilampirkan, yang terjadi saat input bernilai 6 adalah …</p>', '<p>Dicetak kalimat “case 6 : WRITE “Sabtu” ”</p>', '<p>Dicetak kalimat “Periksa inputan!”</p>', '<p>Dicetak kalimat “inputan adalah 6”</p>', '<p>Dicetak kata “Sabtu”</p>', '<p>Tidak terjadi apa-apa</p>', '', '', '', '', '', 'D', 1598036860, 1598036860),
(40, 1, 1, 1, '4a495df02752c65036e3e0743e63997e.png', 'image/png', 39, '<p>Berdasarkan algoritma pada gambar yang dilampirkan, yang terjadi jika inputan bernilai 0 adalah …</p>', '<p>Tidak terjadi apa-apa</p>', '<p>Dicetak kata “Senin”</p>', '<p>Dicetak kalimat “inputan adalah 0”</p>', '<p>Dicetak kalimat “case 0 = WRITE “Senin” ”</p>', '<p>Dicetak kalimat “Periksa inputan!”</p>', '', '', '', '', '', 'E', 1598036968, 1598036968),
(41, 1, 1, 1, '', '', 40, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p><strong>Asep diminta untuk membuat kalkulator sederhana yang inputannya berupa operand pertama, operator, dan operand kedua. Ouput yang dihasilkan adalah hasil penjumlahan dari kedua operand. Jika seluruh kondisi tidak terpenuhi maka dicetak “Periksa inputan!”</strong></p><p>Berdasarkan narasi di atas, algoritma pseudocode percabangan Switch Case yang tepat adalah … </p></td></tr></tbody></table>', '', '', '', '', '', '2ebaba955ec75be0447248ac251420b1.png', '5aa8fa21b121091ee986c1b38a545763.png', 'f97e2f13d96d5142564437268372c1af.png', '5454a50772d0e38647f80463529b46b4.png', '95c2cfe501413a6b50bbffa861d0412e.png', 'D', 1598037122, 1598037122),
(42, 1, 1, 1, '', '', 41, '<p><strong>Asep diminta untuk membuat kalkulator sederhana yang inputannya berupa operand pertama, operator, dan operand kedua. Ouput yang dihasilkan adalah hasil penjumlahan dari kedua operand. Jika seluruh kondisi tidak terpenuhi maka dicetak “Periksa inputan!”</strong></p><p><br></p><table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>Berdasarkan narasi di atas, algoritma flowchart percabangan Switch Case yang tepat adalah …</p></td></tr></tbody></table>', '', '', '', '', '', '44a9d120a31caf657a17d3870c7fc590.png', '8d4a0673d853bdeeeecfb893c57c8ab4.png', '657a043d5fe90ed4fa8fe72a962ead8a.png', '7c779be77fe9e8f0a252bcc637c2540f.png', '0d4a8818c7902ddef2d7710ae979a510.png', 'A', 1598037292, 1598037292),
(43, 2, 1, 1, '', '', 3, '<p>hayo apa coba</p><p>apa ya</p><p>kenapa ya</p>', '<p>ini diedit</p>', '<p>ini juga sama</p>', '<p>tapi ini nggak</p>', '<p>oh iya</p>', '<p>masa</p>', '', '', '', '', '', 'A', 1598291648, 1598834905),
(44, 2, 1, 1, '', '', 5, '<p>coba apa lagi</p>', '', '', '', '', '', '', '', '', '', '', 'B', 1598291874, 1598291874),
(45, 2, 1, 1, '', '', 23, '<p>gak tau idissa juga</p>', '', '', '', '', '', '', '', '', '', '', 'C', 1598292081, 1598292081),
(46, 2, 1, 1, '', '', 26, '<p>masa</p>', '', '', '', '', '', '', '', '', '', '', 'D', 1598292100, 1598292100),
(47, 2, 1, 1, '', '', 40, '<p>oh gitu</p>', '', '', '', '', '', '', '', '', '', '', 'E', 1598292118, 1598292118),
(48, 3, 1, 1, '', '', 3, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p><strong>“jika kondisi terpenuhi maka aksi dilakukan dan jika kondisi tidak terpenuhi maka tidak ada aksi yang dikerjakan”</strong></p><p>Berdasarkan pernyataan di atas, notasi pseudocode nya adalah …</p></td></tr></tbody></table>', '', '', '', '', '', '42c0fb6c130f4e6ca317050fb6821db1.png', 'd944c5b61b8af2ab3a9201ca66ac3cc4.png', 'd7c727a5482a094c694d89d108f42c4c.png', '9d0baf2bab88c4079a3180f19fa7717d.png', 'be710a13b7af68afab054a07e063a566.png', 'E', 1598835906, 1598835906),
(49, 3, 1, 1, '', '', 4, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>Notasi flowchart yang tepat untuk pernyataan</p><p><strong>“jika kondisi tidak terpenuhi maka tidak dilakukan apa-apa, dan jika kondisi terpenuhi aksi akan dilakukan”</strong></p><p>adalah …</p></td></tr></tbody></table>', '', '', '', '', '', '56b84b1ba4c8ff3530fd1425f464b8f2.png', 'ea61ba95da1be6eee27f987dfba92fea.png', '60aa4acc1306e935cd8790ccb0d68454.png', '08e03f430216a1d30e1bd9f8d0194629.png', '28d6e072323b758db7fb32baeea93d20.png', 'E', 1598837911, 1598837911),
(50, 3, 1, 1, '', '', 5, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>Percabangan If-Then digunakan saat …</p></td></tr></tbody></table>', '<p>Memiliki dua kasus atau lebih</p>', '<p>Memiliki aksi yang berulang</p>', '<p>Memiliki hanya satu kasus</p>', '<p>Memiliki aksi alternatif yang dilakukan</p>', '<p>Memiliki kondisi dan aksi</p>', '', '', '', '', '', 'C', 1598874352, 1598874352),
(51, 3, 1, 1, '3cfd1e768f26164119f4476e854ba21f.png', 'image/png', 6, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>Uraian alur kerja algoritma di atas adalah …..</p></td></tr></tbody></table>', '<p xss=removed>Jika nilai variabel <strong>p</strong> lebih besar atau sama dengan variabel <strong>q</strong>  maka akan dilakukan operasi <strong>p = p-q</strong> dan dicetak nilai <strong>p</strong></p>', '<p xss=removed>Jika nilai variabel <strong>p</strong> lebih besar atau sama dengan variabel <strong>q</strong>  maka akan dilakukan operasi <strong>p = q-p</strong> dan dicetak nilai <strong>q</strong></p>', '<p xss=removed>Jika nilai variabel <strong>p</strong> lebih kecil atau sama dengan variabel <strong>q</strong>  maka akan dilakukan operasi <strong>p = p-q </strong>dan dicetak nilai <strong>q</strong></p>', '<p xss=removed>Jika nilai variabel <strong>p</strong> lebih besar dari variabel <strong>q</strong>  maka akan dilakukan operasi <strong>p = p-q</strong> dan dicetak nilai <strong>p</strong></p>', '<p xss=removed>Jika nilai variabel <strong>q</strong> lebih kecil atau sama dengan variabel <strong>p</strong>  maka akan dilakukan operasi <strong>p = p-q</strong> dan dicetak nilai <strong>q</strong></p>', '', '', '', '', '', 'D', 1598875052, 1598875052),
(52, 3, 1, 1, '', '', 7, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>VAR nilaiUAS, statusTugas </p><p>WRITE \"Masukkan nilai UAS anda: \" </p><p>READ nilaiUAS </p><p>WRITE \"Apakah seluruh tugas sudah Anda kerjakan? Jika sudah ketik 1 dan jika belum ketik 0\" </p><p>READ statusTugas  </p><p>  IF(nilaiUAS>=78 AND statusTugas == 1)    </p><p>      WRITE \"Selamat Anda tidak remedial\"  </p><p>  END IF </p><p>END</p><p><br></p><p>Berdasarkan algoritma di atas, kalimat “<strong>Selamat Anda tidak remedial</strong>” dicetak saat …</p></td></tr><tr><td><br></td></tr></tbody></table>', '<p>Saat kondisi “nilaiUAS>=78 AND statusTugas == 1” tidak terpenuhi</p>', '<p>Saat aksi “nilaiUAS&lt;=78 AND statusTugas == 1” terpenuhi</p>', '<p>Saat kondisi “nilaiUAS>=78 AND statusTugas == 1” terpenuhi</p>', '<p>Saat kondisi “nilaiUAS == 78 AND statusTugas == 1” terpenuhi</p>', '<p>Saat kondisi “nilaiUAS>78 AND statusTugas == 1” terpenuhi</p>', '', '', '', '', '', 'C', 1598875572, 1598875630),
(53, 3, 1, 1, '', '', 8, '<p>VAR nilaiUAS, statusTugas </p><p>WRITE \"Masukkan nilai UAS anda: \" </p><p>READ nilaiUAS </p><p>WRITE \"Apakah seluruh tugas sudah Anda kerjakan? Jika sudah ketik 1 dan jika belum ketik 0\" </p><p>READ statusTugas  </p><p>  IF(nilaiUAS>=78 AND statusTugas == 1)    </p><p>      WRITE \"Selamat Anda tidak remedial\"  </p><p>  END IF </p><p>END</p><p><br></p><table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>Berdasarkan algoritma di atas, yang terjadi ketika nilai variabel <strong>nilaiUAS = 101</strong> dan <strong>statusTugas = 1 </strong>adalah …</p></td></tr></tbody></table>', '<p>Tidak terjadi apa-apa</p>', '<p>Muncul “101” dan “1”</p>', '<p>Muncul kalimat “WRITE “Selamat Anda tidak remedial” “</p>', '<p>Muncul kalimat “nilaiUAS 101 dan statusTugas 1 Selamat Anda tidak remedial”</p>', '<p>Muncul kalimat “Selamat Anda Tidak Remedial”</p>', '', '', '', '', '', 'E', 1598875957, 1598875957),
(54, 3, 1, 1, '24b2357656cb1a07e765670048998abb.png', 'image/png', 8, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>Berdasarkan algoritma di atas, yang terjadi jika nilai <strong>p=4</strong> dan <strong>q=7</strong> adalah …..</p></td></tr></tbody></table>', '<p>Nilai p dikurangi nilai q dan dicetak tulisan “WRITE p”</p>', '<p>Nilai p dikurangi nilai q dan dicetak tulisan “-3”</p>', '<p>Dicetak tulisan “7”</p>', '<p>Tidak terjadi apa-apa</p>', '<p>Dicetak tulisan “4”</p>', '', '', '', '', '', 'D', 1598876216, 1598876216),
(55, 3, 1, 1, '67f0484032adffe2e2e76642db291b94.png', 'image/png', 9, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>Berdasarkan algoritma di atas, jika <strong>a=41, b=20, c =9</strong>, output yang dihasilkan adalah ….</p></td></tr></tbody></table>', '<p>9, 20, dan 7</p>', '<p>41, 20, dan 9</p>', '<p>9, 41, dan 20</p>', '<p>0, 2, dan 2</p>', '<p>9, 20, dan 9</p>', '', '', '', '', '', 'A', 1598876834, 1598876834),
(56, 3, 1, 1, '', '', 10, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>“Budi diminta pergi ke warung untuk membeli gula dengan harga Rp. 6.500 dengan membawa uang sebesar Rp. 10.000. Ibu berpesan jika uang yang Budi bawa memiliki sisa setelah membeli gula, maka uang tersebut boleh Budi ditabungkan.” </p><p>Berdasarkan pernyataan di atas, notasi pseudocode yang tepat adalah … </p></td></tr></tbody></table>', '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>if (kembalian >= 0) then</p><p>   tabungan = tabungan + kembalian</p></td></tr></tbody></table>', '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>if (kembalian > 0) then</p><p>   tabungan = tabungan + kembalian</p></td></tr></tbody></table>', '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>if (kembalian > 0) then</p><p>    tabungan = = tabungan + kembalian</p></td></tr></tbody></table>', '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>if (kembalian = = 0) then</p><p>    tabungan = tabungan + kembalian</p></td></tr></tbody></table>', '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>if (kembalian &lt;= 0) then</p><p>   tabungan = tabungan + kembalian</p></td></tr></tbody></table><p><br></p>', '', '', '', '', '', 'B', 1598877364, 1598877364),
(57, 3, 1, 1, '', '', 11, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>“Budi diminta pergi ke warung untuk membeli gula dengan harga Rp. 6.500 dengan membawa uang sebesar Rp. 10.000. Ibu berpesan jika uang yang Budi bawa memiliki sisa setelah membeli gula, maka uang tersebut boleh Budi ditabungkan.” </p><p>Berdasarkan pernyataan di atas, flowchart yang tepat adalah …..</p></td></tr></tbody></table>', '', '', '', '', '', 'b42df0092c281ba2b137d346b79f5929.png', '77681254eaef4609fb32b2e609572f7c.png', '6cdf0315c48d696582be190d65d26acf.png', '3057d706c0c1a9fd74e0c09920c88bf5.png', 'b3c2821f635d78ee5e9dc18591dc2ad8.png', 'E', 1598877477, 1598877477),
(58, 3, 1, 1, '', '', 13, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>Notasi pseudocode yang tepat untuk pernyataan</p><p>“jika kondisi tidak terpenuhi maka akan dilakukan alternatif aksi, dan jika kondisi terpenuhi aksi dilakukan”</p><p>adalah …</p></td></tr></tbody></table>', '', '', '', '', '', '6487073d804809ca6ba7444579ec1fe0.png', '81e7caf0f61eefac4f8ed8c7bc23312b.png', '92cf70830d730542d0135dd465a7a7b9.png', '5ac66c4d6e04d63a33ad3165bcdf146f.png', '412a2c88d5f6054d35a9096796f14cfb.png', 'B', 1598878557, 1598878557),
(59, 3, 1, 1, '', '', 14, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>Notasi flowchart yang tepat untuk pernyataan</p><p>“jika kondisi tidak terpenuhi maka akan dilakukan alternatif aksi, dan jika kondisi terpenuhi aksi dilakukan”</p></td></tr></tbody></table><p>adalah …</p>', '', '', '', '', '', '9d8f4fa3e0c5b794f1eef4cc7a2da974.png', 'e5ad8abdf7d9fb10aff2b1cbfdda01eb.png', '29ce497df27a06c307802f870dfad22b.png', 'e4483e0de04b6aefbcdb43f45cf0f29f.png', 'e72e5e2c523eef93df56b6efebeed146.png', 'B', 1598878847, 1598878847),
(60, 3, 1, 1, '', '', 15, '<p>Percabangan If-Then-Else digunakan saat …</p>', '<p>Memiliki dua kasus atau lebih</p>', '<p>Memiliki aksi yang berulang</p>', '<p>Memiliki alternatif aksi apabila kondisi tidak terpenuhi</p>', '<p>Memiliki hanya satu kasus</p>', '<p>Memiliki kondisi dan aksi</p>', '', '', '', '', '', 'C', 1598879371, 1598879371),
(61, 3, 1, 1, '288fe60cf9c6ee28a22cb52ffe8b86b0.png', 'image/png', 16, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>Berdasarkan algoritma di atas, operasi “<strong>c=a+b</strong>” dan “<strong>d=a-b</strong>”  dilkukan saat …</p></td></tr></tbody></table>', '<p>Saat kondisi “<strong>(a MOD 2 == 1) OR (b MOD a == 0)</strong>” terpenuhi</p>', '<p>Saat kondisi “<strong>(2 MOD a == 1) OR (a MOD b == 0)</strong>” terpenuhi</p>', '<p>Saat kondisi “<strong>(a MOD 2 == 1) AND (b MOD a == 0)</strong>” terpenuhi</p>', '<p>Saat kondisi “<strong>(a MOD 2 == 1) OR (b MOD a == 0)</strong>” terpenuhi</p>', '<p>Saat kondisi “<strong>ELSE</strong>” terpenuhi</p>', '', '', '', '', '', 'A', 1598880617, 1598880617),
(62, 3, 1, 1, '19fc09a8ffd39f21099dfc5ae88f55c9.png', 'image/png', 17, '<p>Berdasarkan algoritma di atas, yang terjadi apa bila nilai <strong>a = 5 </strong>dan <strong>b = 2</strong> adalah …</p>', '<p>Dicetak <strong>“c=a+b” </strong>dan <strong>“d=a-b”</strong></p>', '<p>Dilakukan <strong>“c=2*a+b” </strong>dan <strong>“d=2*b-a”</strong></p>', '<p>Dicetak <strong>“c=2*a+b” </strong>dan <strong>“d=2*b-a”</strong></p>', '<p>Dilakukan operasi <strong>“c=a+b” </strong>dan <strong>“d=a-b”</strong></p>', '<p>Dicetak <strong>“c=b+a” </strong>dan <strong>“d=c-b”</strong></p>', '', '', '', '', '', 'D', 1598880833, 1598880833),
(63, 3, 1, 1, 'd4060d7dff5ca70aec77e02f29495d3c.png', 'image/png', 18, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>Perbedaan dari kedua notasi pseudocode di atas adalah …</p></td></tr></tbody></table>', '<p>Untuk <strong>gambar (1)</strong><strong> hanya memiliki satu kondisi dan satu aksi dan jika kondisi tidak terpenuhi maka tidak dilakukan apa-apa</strong> dan untuk <strong>gambar (2)</strong>  <strong>memiliki kondisi dan aksi yang apabila kondisi pertama terpenuhi maka dilakukan aksi dan jika kondisi utama tidak terpenuhi maka yang akan dilakukan adalah alternatif aksinya</strong></p>', '<p>Untuk <strong>gambar (1) memiliki kondisi dan aksi yang apabila kondisi pertama terpenuhi maka dilakukan aksi dan jika kondisi utama tidak terpenuhi maka yang akan dilakukan adalah alternatif aksinya</strong> dan <strong>untuk gambar (2) hanya memiliki satu kondisi dan satu aksi dan jika kondisi tidak terpenuhi maka tidak dilakukan apa-apa</strong></p>', '<p>Untuk <strong>gambar (1) hanya memiliki lebih dari satu kondisi dan satu aksi dan jika kondisi tidak terpenuhi maka tidak dilakukan apa-apa</strong> dan<strong> untuk gambar (2)  memiliki kondisi dan aksi yang apabila kondisi pertama terpenuhi maka dilakukan aksi dan jika kondisi utama tidak terpenuhi maka yang akan dilakukan adalah alternatif aksinya</strong></p>', '<p>Untuk <strong>gambar (1) hanya memiliki satu kondisi dan satu aksi dan jika kondisi tidak terpenuhi maka tidak dilakukan apa-apa</strong> dan <strong>untuk gambar (2)  memiliki kondisi dan aksi yang apabila kondisi pertama terpenuhi maka dilakukan aksi dan jika kondisi utama tidak terpenuhi maka yang akan tidak dilakukan adalah alternatif aksinya</strong></p>', '<p>Untuk <strong>gambar (1) hanya memiliki satu kondisi dan satu aksi dan jika kondisi tidak terpenuhi maka dilakukan aksinya</strong> dan <strong>untuk gambar (2)  memiliki kondisi dan aksi yang apabila kondisi pertama terpenuhi maka dilakukan aksi dan jika kondisi utama tidak terpenuhi maka yang akan dilakukan adalah alternatif aksinya</strong></p>', '', '', '', '', '', 'A', 1598881799, 1598881799),
(64, 3, 1, 1, 'fce30742fc57b4ec6ecfbfde2b087497.png', 'image/png', 19, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>Perbedaan atara kedua notasi flowchart adalah …</p></td></tr></tbody></table>', '<p>Untuk <strong>gambar (1) memiliki kondisi dan aksi yang apabila kondisi pertama terpenuhi maka dilakukan aksi dan jika kondisi utama tidak terpenuhi maka yang akan dilakukan adalah alternatif aksinya </strong>dan untuk <strong>gambar (2) hanya memiliki satu kondisi dan satu aksi dan jika kondisi tidak terpenuhi maka tidak dilakukan apa-apa</strong></p>', '<p>Untuk <strong>gambar (1) hanya memiliki satu kondisi dan satu aksi dan jika kondisi tidak terpenuhi maka dilakukan aksinya </strong>dan untuk <strong>gambar (2)  memiliki kondisi dan aksi yang apabila kondisi pertama terpenuhi maka dilakukan aksi dan jika kondisi utama tidak terpenuhi maka yang akan dilakukan adalah alternatif aksinya</strong></p>', '<p>Untuk <strong>gambar (1) hanya memiliki lebih dari satu kondisi dan satu aksi dan jika kondisi tidak terpenuhi maka tidak dilakukan apa-apa </strong>dan untuk <strong>gambar (2)  memiliki kondisi dan aksi yang apabila kondisi pertama terpenuhi maka dilakukan aksi dan jika kondisi utama tidak terpenuhi maka yang akan dilakukan adalah alternatif aksinya</strong></p>', '<p>Untuk <strong>gambar (1) hanya memiliki satu kondisi dan satu aksi dan jika kondisi tidak terpenuhi maka tidak dilakukan apa-apa </strong>dan untuk <strong>gambar (2)  memiliki kondisi dan aksi yang apabila kondisi pertama terpenuhi maka dilakukan aksi dan jika kondisi utama tidak terpenuhi maka yang akan tidak dilakukan adalah alternatif aksinya</strong></p>', '<p>Untuk <strong>gambar (1) hanya memiliki satu kondisi dan satu aksi dan jika kondisi tidak terpenuhi maka tidak dilakukan apa-apa </strong>dan untuk<strong> gambar (2)  memiliki kondisi dan aksi yang apabila kondisi pertama terpenuhi maka dilakukan aksi dan jika kondisi utama tidak terpenuhi maka yang akan dilakukan adalah alternatif aksinya</strong></p>', '', '', '', '', '', 'E', 1598882239, 1598882239),
(65, 3, 1, 1, 'b8720b7355e2bda73db02c5b1f88ac38.png', 'image/png', 26, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>Berdasarkan algortima di atas, jika diinput <strong>nama </strong>“<strong>Teguh</strong>” dan <strong>jumlah jam kerja</strong>nya adalah <strong>65 jam</strong>, maka output yang dihasilkan adalah …</p></td></tr></tbody></table>', '<p>Teguh 243000</p>', '<p>243000 teguh</p>', '<p>196000 Teguh</p>', '<p>Teguh 196000</p>', '<p>Teguh 195000</p>', '', '', '', '', '', 'A', 1598883553, 1598883553),
(66, 3, 1, 1, '', '', 20, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>Sebuah sekolah ingin membuat sistem pemeriksaan keterlambatan kedatangan siswa. Jika siswa datang kurang dari atau tepat jam 7.00 maka masih boleh masuk ke kelas. Apabila tidak, maka siswa akan dihukum untuk membersihkan halaman sekolah dan sekitar masjid sekolah. Yang di-input oleh user adalah: nama siswa, jam datang siswa.</p><p>Berdasarkan narasi di atas, algoritma pseudocode percabangan If-Then-Else yang tepat adalah .....</p></td></tr></tbody></table>', '<p>if (jam >= 7.00) then</p><p>    terlambat = false</p><p>    membersihkan = false</p><p>else</p><p>     terlambat = true</p><p>     membersihkan = true</p><p>end if</p>', '<p>if (jam &lt;= 7.00) then</p><p>    terlambat = false</p><p>    membersihkan = false</p><p>else</p><p>     terlambat = true</p><p>     membersihkan = true</p><p>end if</p>', '<p>if (jam > 7.00) then</p><p>    terlambat = true</p><p>    membersihkan = true</p><p>else</p><p>    terlambat = false</p><p>    membersihkan = false</p><p>end if</p>', '<p>if (jam = = 7.00) then</p><p>    terlambat = true</p><p>    membersihkan = false</p><p>else</p><p>    terlambat = true</p><p>    membersihkan = false</p><p>end if</p>', '<p>if (jam &lt;= 7.00) then</p><p>    terlambat = false</p><p>    membersihkan = true</p><p>else</p><p>     terlambat = true</p><p>     membersihkan = true</p><p>end if</p>', '', '', '', '', '', 'B', 1598883823, 1598883823),
(67, 3, 1, 1, '', '', 21, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>Sebuah sekolah ingin membuat sistem pemeriksaan keterlambatan kedatangan siswa. Jika siswa datang kurang dari atau tepat jam 7.00 maka masih boleh masuk ke kelas. Apabila tidak, maka siswa akan dihukum untuk membersihkan halaman sekolah dan sekitar masjid sekolah. Yang di-input oleh user adalah: nama siswa, jam datang siswa.</p><table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>Berdasarkan narasi di atas, notasi flowchart percabangan If-Then-Else yang tepat adalah ….</p></td></tr></tbody></table></td></tr></tbody></table>', '', '', '', '', '', '841775f2e52ffdb75c49d4044a394281.png', '693034ffa6155e32b7fd1c7ad63b67d5.png', '9f056fb58e3b376ed3f8bc416895860b.png', 'fed9c50cf366f56292b1e4f32c318eda.png', 'a1a2e890ff508672cf7a172d6fcb80a8.png', 'E', 1598883994, 1598883994);
INSERT INTO `tb_soal` (`id_soal`, `guru_id`, `mapel_id`, `bobot`, `file`, `tipe_file`, `id_hambatan`, `soal`, `opsi_a`, `opsi_b`, `opsi_c`, `opsi_d`, `opsi_e`, `file_a`, `file_b`, `file_c`, `file_d`, `file_e`, `jawaban`, `created_on`, `updated_on`) VALUES
(68, 3, 1, 1, '', '', 22, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>Yang termasuk ke dalam ciri-ciri percabangan Nested-If adalah … </p></td></tr></tbody></table>', '<p>Memiliki satu kondisi dan jika terpenuhi maka akan di lakukan alternatif  aksi</p>', '<p>Memiliki dua kondisi atau lebih dan memiliki alternatif kondisi dan aksi</p>', '<p>Memiliki tiga atau lebih kondisi yang di dalam kondisi utama terdapat turunan kondisi dan juga turunan aksi yang strukturnya bertingkat-tingkat</p>', '<p>Memiliki dua kondisi atau lebih yang memiliki banyak alternatif kondisi dan aksi yang struktur penulisannya sederhana</p>', '<p>Memiliki banyak aksi tapi tidak memiliki kondisi yang harus dipenuhi</p>', '', '', '', '', '', 'C', 1598884274, 1598884274),
(69, 3, 1, 1, '', '', 24, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>Notasi flowchart yang tepat untuk pernyataan</p><p>“jika kondisi utama terpenuhi, di dalam kondisi utama terdapat kondisi turunan yang perlu dipenuhi sehingga aksi dapat dilakukan”</p><p>adalah …</p></td></tr></tbody></table>', '', '', '', '', '', '354aa63300df06c422dae8de163a8217.png', '8298a0f69476de4cd8ca754736ee1857.png', '8e9208f6529d0752387f5c73ffedfd01.png', 'f7074c13f18e589aaaa0ac853fb2094d.png', 'd2de3ced828c25979d488c94f1de8d79.png', 'D', 1598884592, 1598884642),
(70, 3, 1, 1, '81c7e6dee3c1684c8a87d79475efd2cf.png', 'image/png', 25, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>Uraian alur kerja algoritma di atas adalah …</p></td></tr></tbody></table>', '<p>Jika nilai <strong>mataPelajaran </strong>tidak sama dengan <strong>IPA </strong>maka kondisi utama terpenuhi, lalu terdapat kondisi turunan yang dimana jika <strong>nilai </strong>lebih besar dari <strong>90 </strong>dan kurang dari atau sama dengan <strong>100 </strong>maka dicetak huruf <strong>“A”</strong>. jika turunan kondisi tidak terpenuhi, diperiksa kembali nilai, jika nilai lebih besar dari <strong>80 </strong>dan kurang dari atau sama dengan <strong>90 </strong>maka dicetak huruf <strong>“B”</strong>.  jika alternatif turunan kondisi tidak terpenuhi, diperiksa kembali nilai, jika nilai lebih besar dari <strong>70 </strong>dan kurang dari atau sama dengan <strong>80 </strong>maka dicetak huruf <strong>“C”</strong>.  jika alternatif turunan kondisi tidak terpenuhi, diperiksa kembali nilai, jika nilai lebih besar dari <strong>60 </strong>dan kurang dari atau sama dengan <strong>70 </strong>maka dicetak huruf <strong>“D”</strong>. jika seluruh alternatif turunan kondisi tidak terpenuhi, maka dicetak huruf <strong>“E”</strong>. dan jika kondisi utama tidak terpenuhi maka dicetak <strong>“Inputan Anda salah”</strong></p>', '<p>Jika nilai <strong>mataPelajaran </strong>lebih besar dari atau sama dengan <strong>IPA </strong>maka kondisi utama terpenuhi, lalu terdapat kondisi turunan yang dimana jika nilai lebih besar dari <strong>90 </strong>dan kurang dari atau sama dengan <strong>100 </strong>maka dicetak huruf <strong>“A”</strong>. jika turunan kondisi tidak terpenuhi, diperiksa kembali nilai, jika nilai lebih besar dari <strong>80 </strong>dan kurang dari atau sama dengan <strong>90 </strong>maka dicetak huruf <strong>“B”</strong>.  jika alternatif turunan kondisi tidak terpenuhi, diperiksa kembali nilai, jika nilai lebih besar dari <strong>70 </strong>dan kurang dari atau sama dengan <strong>80 </strong>maka dicetak huruf <strong>“C”</strong>.  jika alternatif turunan kondisi tidak terpenuhi, diperiksa kembali nilai, jika nilai lebih besar dari <strong>60 </strong>dan kurang dari atau sama dengan <strong>70 </strong>maka dicetak huruf <strong>“D”</strong>. jika seluruh alternatif turunan kondisi tidak terpenuhi, maka dicetak huruf <strong>“E”</strong>. dan jika kondisi utama tidak terpenuhi maka dicetak <strong>“Inputan Anda salah”</strong></p>', '<p>Jika nilai <strong>mataPelajaran </strong>sama dengan <strong>IPA </strong>maka kondisi utama terpenuhi, lalu terdapat kondisi turunan yang dimana jika nilai lebih besar dari <strong>90 </strong>dan kurang dari atau sama dengan <strong>100 </strong>maka dicetak huruf <strong>“A”</strong>. jika turunan kondisi tidak terpenuhi, diperiksa kembali nilai, jika nilai lebih besar atau sama dengan dari <strong>80 </strong>dan kurang dari atau sama dengan <strong>90 </strong>maka dicetak huruf <strong>“B”</strong>.  jika alternatif turunan kondisi tidak terpenuhi, diperiksa kembali nilai, jika nilai lebih besar atau sama dengan dari <strong>70 </strong>dan kurang dari atau sama dengan <strong>80 </strong>maka dicetak huruf <strong>“C”</strong>.  jika alternatif turunan kondisi tidak terpenuhi, diperiksa kembali nilai, jika nilai lebih besar dari <strong>60 </strong>dan kurang dari atau <strong>70 </strong>maka dicetak huruf <strong>“D”</strong>. jika seluruh alternatif turunan kondisi tidak terpenuhi, maka dicetak huruf <strong>“E”</strong>. dan jika kondisi utama tidak terpenuhi maka dicetak <strong>“Inputan Anda salah”</strong></p>', '<p>Jika nilai <strong>mataPelajaran </strong>sama dengan <strong>IPA </strong>maka kondisi utama terpenuhi, lalu terdapat kondisi turunan yang dimana jika nilai lebih besar dari <strong>90 </strong>dan kurang dari atau sama dengan <strong>100 </strong>maka dicetak huruf <strong>“E”</strong>. jika turunan kondisi tidak terpenuhi, diperiksa kembali nilai, jika nilai lebih besar dari <strong>80 </strong>dan kurang dari atau sama dengan <strong>90 </strong>maka dicetak huruf <strong>“D”</strong>.  jika alternatif turunan kondisi tidak terpenuhi, diperiksa kembali nilai, jika nilai lebih besar dari <strong>70 </strong>dan kurang dari atau sama dengan <strong>80 </strong>maka dicetak huruf <strong>“B”</strong>.  jika alternatif turunan kondisi tidak terpenuhi, diperiksa kembali nilai, jika nilai lebih besar dari <strong>60 </strong>dan kurang dari atau sama dengan <strong>70 </strong>maka dicetak huruf <strong>“C”</strong>. jika seluruh alternatif turunan kondisi tidak terpenuhi, maka dicetak huruf <strong>“A”</strong>. dan jika kondisi utama tidak terpenuhi maka dicetak <strong>“Inputan Anda salah”</strong>.</p>', '<p>Jika nilai <strong>mataPelajaran </strong>sama dengan <strong>IPA </strong>maka kondisi utama terpenuhi, lalu terdapat kondisi turunan yang dimana jika nilai lebih besar dari <strong>90 </strong>dan kurang dari atau sama dengan <strong>100 </strong>maka dicetak huruf <strong>“A”</strong>. jika turunan kondisi tidak terpenuhi, diperiksa kembali nilai, jika nilai lebih besar dari <strong>80 </strong>dan kurang dari atau sama dengan <strong>90 </strong>maka dicetak huruf <strong>“B”</strong>.  jika alternatif turunan kondisi tidak terpenuhi, diperiksa kembali nilai, jika nilai lebih besar dari <strong>70 </strong>dan kurang dari atau sama dengan <strong>80 </strong>maka dicetak huruf <strong>“C”</strong>.  jika alternatif turunan kondisi tidak terpenuhi, diperiksa kembali nilai, jika nilai lebih besar dari <strong>60 </strong>dan kurang dari atau sama dengan <strong>70 </strong>maka dicetak huruf <strong>“D”</strong>. jika seluruh alternatif turunan kondisi tidak terpenuhi, maka dicetak huruf <strong>“E”</strong>. dan jika kondisi utama tidak terpenuhi maka dicetak <strong>“Inputan Anda salah”</strong></p>', '', '', '', '', '', 'E', 1598886972, 1598886972),
(71, 3, 1, 1, '1d3363b7192b859df59818dbc8aabf48.png', 'image/png', 27, '<p>Berdasarkan algoritma di atas, huruf “D” dicetak saat …</p>', '<p>Saat “ IF (mataPelajaran == ”IPA”” dan  ELSE IF (nilai > 60 AND nilai &lt;= 70) terpenuhi</p>', '<p>Saat “ IF (mataPelajaran == ”IPA”” dan  ELSE IF (nilai > 90 AND nilai &lt;= 80) terpenuhi</p>', '<p>Saat “ IF (mataPelajaran != ”IPA”” dan  ELSE IF (nilai > 60 AND nilai &lt;= 70) terpenuhi</p>', '<p>Saat “ IF (mataPelajaran == ”IPA”” atau  ELSE IF (nilai > 60 AND nilai &lt;= 70) terpenuhi</p>', '<p>Saat “ IF (mataPelajaran == ”IPA”” dan  ELSE IF (nilai > 60 OR nilai &lt;= 70) terpenuhi</p>', '', '', '', '', '', 'A', 1598888137, 1598888137),
(72, 3, 1, 1, 'c00cb289ce184edff290f67289402a42.png', 'image/png', 28, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>Berdasarkan algoritma di atas, yang terjadi saat <strong>mataPelajaran = “IPA” </strong>dan <strong>nilai = 88 </strong>adalah …</p></td></tr></tbody></table>', '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>Dicetak kalimat “WRITE “B” ”</p></td></tr></tbody></table>', '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>Dicetak “B” saja</p></td></tr></tbody></table>', '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>Dicetak kalimat “nilai > 80 AND nilai &lt;= 90”</p></td></tr></tbody></table>', '<p>Tidak terjadi apa-apa</p>', '<p>Dicetak kalimat “Inputan Anda salah”</p>', '', '', '', '', '', 'B', 1598888386, 1598888386),
(73, 3, 1, 1, '7a289778e2f0f150c70ff681da42d5ca.png', 'image/png', 28, '<p>Berdasarkan algoritma di atas, yang terjadi jika <strong>mataPelajaran = IPS </strong>dan <strong>nilai = 78</strong> adalah …</p>', '<p>Dicetak kalimat “WRITE “C” ”</p>', '<p>Dicetak “C” saja</p>', '<p>Dicetak kalimat “nilai > 70 AND nilai &lt;= 100”</p>', '<p>Tidak terjadi apa-apa</p>', '<p>Dicetak kalimat “Inputan Anda salah”</p>', '', '', '', '', '', 'E', 1598888609, 1598888609),
(74, 3, 1, 1, '', '', 29, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>Permasalahan berikut yang dapat diimplementasi ke dalam percabangan Nested-If, adalah …</p></td></tr></tbody></table>', '<p>Menentukan sebuah bilangan merupakan sebuah bilangan genap</p>', '<p>Menentukan huruf vokal (a, i, u, e, o)</p>', '<p>Mengkonversi nilai bilangan menjadi nilai huruf (A, B, C, D, dan E) dengan ketentuan nilai 90 sampai 100 adalah A, nilai 80 sampai 89 adalah B, nilai 70 sampai 79 adalah C, nilai 60 sampai 69 adalah D, dan dibawah 60 adalah E</p>', '<p>Menentukan bilangan rill menjadi nilai mutlak</p>', '<p>Menentukan remidi atau tidak nya siswa dalam ujian</p>', '', '', '', '', '', 'C', 1598889160, 1598889160),
(75, 3, 1, 1, '7757bc7add3a70d449eac690910371a7.png', 'image/png', 30, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>Berdasarkan algoritma di atas, jika diberikan nilai a, b, dan c berturut-turut adalah 3, 5, dan 2, output yang dihasilkan adalah …</p></td></tr></tbody></table>', '<p>3, 5, 2</p>', '<p>5, 2, 3</p>', '<p>4, 1, 0</p>', '<p>2, 3, 5</p>', '<p>2, 8, 1</p>', '', '', '', '', '', 'A', 1598889445, 1598889445),
(76, 3, 1, 1, '', '', 31, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>\"Rudi diminta untuk membuat program untuk menentukan apakah sebuah bilangan bulat merupakan bilangan positif, negatif, atau nol\"</p><p>Berdasarkan narasi di atas, notasi pseudocode percabangan Nested If yang tepat adalah ...</p></td></tr></tbody></table>', '', '', '', '', '', '5388c94f76a4e82319ed1d20002dd927.png', 'ccd99f184c7e4f3323ce246b1295d086.png', 'ef66a8b0f492a22fd68c9018c6a0642d.png', 'ea6f7e49e03b31cd4c765f4eb934373f.png', 'd0fe1efd1159e481ec93499567b53105.png', 'C', 1598889730, 1598889730),
(77, 3, 1, 1, '', '', 32, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>\"Fahri diminta untuk membuat program penentuan remedial untuk siswa dari setiap rentang nilai. Untuk siswa yang rentang nilainya 0 sampai 60, dilakukan remedial berupa test ulang, untuk rentang 61 sampai 75, dilakukan remedial berupa penugasan, dan rentang nilai 76 sampai 100 tidak melakukan remedial.\"</p><p><br> Berdasarkan narasi di atas, notasi flowchart percabangan Nested-If yang tepat adalah …</p></td></tr></tbody></table>', '', '', '', '', '', 'd998ff820fcfceae48d90f3ef72bb52e.png', 'a256c946fcc7d8ad9dd7a375e7780e32.png', '7eb56828f5a0ebf7a07076a43f059bde.png', 'a2a4e3abccbd1aa5f4201db20498ca01.png', '51ba230f58baa57eb85ce8fa45a33232.png', 'E', 1598889913, 1598889913),
(78, 3, 1, 1, '', '', 33, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>Yang termasuk ke dalam ciri-ciri percabangan Switch Case adalah …</p></td></tr></tbody></table>', '<p>Untuk kasus yang memiliki turunan kondisi dan strukturnya bertingkat-tingkat</p>', '<p>Untuk satu kasus dan memiliki alternatif aksi apabila kondisi tidak terpenuhi</p>', '<p>Untuk dua kasus atau lebih dan struktur penulisannya lebih sederhana</p>', '<p>Untuk satu kondisi dan tidak memiliki</p>', '<p>Untuk satu kasus yang dimana jika kondisi terpenuhi maka akan dilakukan aksi dan jika tidak terpenuhi maka tidak dilakukan apa-apa</p>', '', '', '', '', '', 'C', 1598890101, 1598890101),
(79, 3, 1, 1, '', '', 34, '<p>Pada percabangan Switch Case, tipe data yang dapat digunakan yaitu integer dan character. Tipe data tersebut termasuk kedalam tipe data …</p>', '<p>Logika, yang dimana jika bernilai 1 berarti benar dan bernilai 0 berarti salah</p>', '<p>Ordinal, yang dimana nilai dari tipe datanya dapat dihitung</p>', '<p>Integer dan Character</p>', '<p>String, yaitu kumpulan beberapa karakter</p>', '<p>Bilangan Bulat, yang dimana nilai dari tipe datanya dapat dihitung</p>', '', '', '', '', '', 'B', 1598890256, 1598890256),
(80, 3, 1, 1, '', '', 35, '<p>Notasi pseudocode yang tepat untuk</p><p><strong>“Setiap kondisi memiliki aksi yang dilakukan jika terpenuhi dan tipe data yang digunakan adalah tipe data ordinal. Selain itu memiliki dua kondisi atau lebih yang dimana penulisannya sederhana”</strong></p><p>adalah …</p>', '', '', '', '', '', '4edffecf1ab21d216a6f8ad94c9cad19.png', '1eb54dbd7ad2a097a24c60b68b2dea3f.png', 'aba66ecece4e762a651d3196d8f64def.png', '5d8ce8de3458dc1bb592c8b803446074.png', 'f5cf43b0d96f5ddddc0b80443fe3f3f5.png', 'A', 1598890486, 1598890486),
(81, 3, 1, 1, '', '', 36, '<p>Percabangan Switch Case digunakan saat …</p>', '<p>Memiliki dua kasus atau lebih</p>', '<p>Memiliki aksi yang berulang</p>', '<p>Memiliki dua kasus atau lebih yang tipe data variabelnya berupa tipe ordinal</p>', '<p>Memiliki tiga kasus atau lebih dan terdapat struktur percabangan di dalam aksinya</p>', '<p>Saat ada kondisi dan aksi</p>', '', '', '', '', '', 'C', 1598890669, 1598890669),
(82, 3, 1, 1, 'a7a4844d66ed92f26edf3025fd1ddd9d.png', 'image/png', 37, '<table align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td align=\"left\" valign=\"top\"><p>Uraian alur kerja algoritma di atas adalah …</p></td></tr></tbody></table>', '<p>jika <strong>nomorBulan </strong>sama dengan <strong>1 </strong>atau <strong>3 </strong>atau <strong>5 </strong>atau <strong>7 </strong>atau <strong>8 </strong>atau <strong>10 </strong>atau <strong>12</strong> maka <strong>jumlahHari </strong>diisi nilai <strong>31</strong>.   jika <strong>nomorBulan </strong>sama dengan <strong>4 </strong>atau <strong>6 </strong>atau <strong>9 </strong>atau <strong>11 </strong>maka <strong>jumlahHari </strong>diisi nilai <strong>30</strong>. Jika <strong>nomorBulan </strong>sama dengan <strong>2 </strong>maka terdapat kondisi dimana jika <strong>tahun </strong><strong>MOD 4</strong> <strong> sama dengan 0 dan </strong><strong>tahun MOD 100</strong> <strong>tidak sama dengan </strong><strong>0 </strong><strong>atau </strong><strong>tahun MOD 400</strong> sama dengan <strong>0 </strong>maka <strong>jumlahHari </strong>diisi nilai <strong>29</strong>. Jika <strong>kondisi tidak terpenuhi </strong>maka <strong>jumlahHari </strong>diisi dengan <strong>28</strong>.</p>', '<p>jika <strong>nomorBulan </strong>sama dengan <strong>1 </strong>atau <strong>3 </strong>atau <strong>5 </strong>atau <strong>7 </strong>atau <strong>8 </strong>atau <strong>10 </strong>atau <strong>12 </strong>maka <strong>jumlahHari </strong>diisi nilai <strong>31</strong>.   jika <strong>nomorBulan </strong>sama dengan <strong>4 </strong>atau <strong>6 </strong>atau <strong>9 </strong>atau <strong>11 </strong>maka <strong>jumlahHari </strong>diisi nilai <strong>30</strong>. Jika <strong>nomorBulan </strong>sama dengan <strong>2 </strong>maka terdapat kondisi dimana jika <strong>tahun MOD 4  sama dengan 0 dan tahun MOD 100 sama dengan 0 atau tahun MOD 400 sama dengan 0</strong> maka <strong>jumlahHari </strong>diisi nilai <strong>29</strong>. Jika <strong>kondisi tidak terpenuhi </strong>maka <strong>jumlahHari </strong>diisi <strong>dengan 28.</strong></p>', '<p>jika <strong>nomorBulan </strong>sama dengan <strong>1 </strong>atau <strong>3 </strong>atau <strong>5 </strong>atau <strong>7 </strong>atau <strong>8 </strong>atau <strong>10 </strong>atau <strong>12 </strong>maka <strong>jumlahHari </strong>diisi nilai <strong>31</strong>.   jika <strong>nomorBulan </strong>sama dengan <strong>4 </strong>atau <strong>6 </strong>atau <strong>9 </strong>atau <strong>11 </strong>maka <strong>jumlahHari </strong>diisi nilai <strong>30</strong>. Jika <strong>nomorBulan </strong>sama dengan <strong>2 </strong>maka terdapat kondisi dimana jika <strong>tahun MOD 4  sama dengan 0 dan tahun MOD 100 tidak sama dengan 0 dan tahun MOD 400 sama dengan 0</strong> maka <strong>jumlahHari </strong>diisi nilai <strong>29</strong>. Jika<strong> kondisi tidak terpenuhi</strong> maka <strong>jumlahHari </strong>diisi dengan <strong>28</strong>.</p>', '<p>jika <strong>nomorBulan </strong>sama dengan <strong>1 </strong>atau <strong>3 </strong>atau <strong>5 </strong>atau <strong>7 </strong>atau <strong>8 </strong>atau <strong>10 </strong>atau <strong>12 </strong>maka <strong>jumlahHari </strong>diisi nilai <strong>31</strong>.   jika <strong>nomorBulan </strong>sama dengan <strong>4 </strong>atau <strong>6 </strong>atau <strong>9 </strong>atau <strong>11 </strong>maka <strong>jumlahHari </strong>diisi nilai <strong>30</strong>. Jika <strong>nomorBulan </strong>sama dengan <strong>2 </strong>maka terdapat kondisi dimana jika <strong>tahun MOD 4  sama dengan 0 dan tahun MOD 100 tidak sama dengan 0 dan tahun MOD 400 sama dengan 0</strong> maka <strong>jumlahHari </strong>diisi nilai <strong>29</strong>. Jika <strong>kondisi tidak terpenuhi</strong> maka <strong>jumlahHari </strong>diisi dengan <strong>28</strong>.</p>', '<p>jika <strong>nomorBulan </strong>sama dengan <strong>1 </strong>atau <strong>3</strong><strong> </strong>atau <strong>5 </strong>atau <strong>7 </strong>atau <strong>8 </strong>atau <strong>10 </strong>atau <strong>12 </strong>maka <strong>jumlahHari </strong>diisi nilai <strong>31</strong>.   jika <strong>nomorBulan </strong>sama dengan <strong>4 </strong>atau <strong>6 </strong>atau <strong>9 </strong>atau <strong>11 </strong>maka <strong>jumlahHari </strong>diisi nilai <strong>30</strong>. Jika <strong>nomorBulan </strong>sama dengan <strong>2 </strong>maka terdapat kondisi dimana jika <strong>tahun MOD 4  sama dengan 0 dan tahun MOD 100 tidak sama dengan 0 atau tahun DIV 400 sama dengan 0</strong> maka <strong>jumlahHari </strong>diisi nilai <strong>29</strong>. Jika <strong>kondisi tidak terpenuhi</strong> maka <strong>jumlahHari </strong>diisi dengan <strong>28</strong>.</p>', '', '', '', '', '', 'A', 1598892279, 1598892279),
(83, 3, 1, 1, 'b03b0c5411cb30d7d8dfb1973b7df587.png', 'image/png', 38, '<p>Berdasarkan algoritma di atas, <strong>jumlahHari </strong>akan bernilai <strong>28 </strong>saat …</p>', '<p>Nilai <strong>tahun </strong>sama dengan <strong>28</strong></p>', '<p>Kondisi <strong>“nomorBulan==2”</strong> dan <strong>“ if (tahun MOD 4 = 0 AND tahun MOD 100 != 0) OR</strong></p><p><strong>(tahun MOD 400 = 0)”</strong> tidak terpenuhi</p>', '<p>Kondisi <strong>“nomorBulan==2”</strong> dan  <strong>“ if (tahun MOD 4 = 0 AND tahun MOD 100 != 0) OR</strong></p><p><strong>(tahun MOD 400 = 0)”</strong> terpenuhi</p>', '<p>Nilai <strong>jumlahHari </strong>diisi <strong>28</strong></p>', '<p>Keluar dari percabangan Switch Case dan saat <strong>“WRITE jumlahHari”</strong></p>', '', '', '', '', '', 'B', 1598892570, 1598892570),
(84, 3, 1, 1, '7a220b58455e055a275288a08a9a317b.png', 'image/png', 39, '<p>Berdasarkan algoritma di atas, yang terjadi saat <strong>nomorBulan </strong>bernilai <strong>8 </strong>adalah …</p>', '<p>Dicetak kalimat “1,3,5,7,8,10,12 : jumlahHari = 31”</p>', '<p>Dicetak kalimat “Periksa inputan!”</p>', '<p>Dicetak kalimat “jumlahHari = 31”</p>', '<p>Dicetak “31” saja</p>', '<p>Tidak terjadi apa-apa</p>', '', '', '', '', '', 'D', 1598892828, 1598892828),
(85, 3, 1, 1, '3977ea3724074af46515afda859b9365.png', 'image/png', 39, '<p>Berdasarkan algoritma di atas, yang terjadi jika <strong>nomorBulan </strong>bernilai <strong>13 </strong>adalah …</p>', '<p>Dicetak kalimat “1,3,5,7,8,10,12 : jumlahHari = 31”</p>', '<p>Dicetak kalimat “Periksa inputan!”</p>', '<p>Dicetak kalimat “jumlahHari = 31”</p>', '<p>Dicetak “31” saja</p>', '<p>Tidak terjadi apa-apa</p>', '', '', '', '', '', 'B', 1598893143, 1598893143),
(86, 3, 1, 1, '', '', 40, '<p>“Rudi diminta untuk membuat program untuk mengkonversi angka menjadi nama bulan. Contohnya, jika user input 1 maka akan mengahasilkan ouput ”Januari”, jika user input 2 maka akan menghasilkan output ”Februari”, dan begitu seterusnya sampai angka 12.</p><p>Jika user input selain angka 1 sampai 12 maka akan dihasilkan output ”Maaf periksa inputan Anda!” ”</p><p>Berdasarkan narasi di atas, algoritma pseudocode percabangan Switch Case yang tepat adalah …</p>', '', '', '', '', '', '923ffc4a181a285af336bf3ba7ca0c52.png', '83f383e004b0482a01f57925de1c8f7d.png', 'a4226335d3cd6ce6f1bfda5c88261271.png', 'd79ec3f43230b0e4daccb8737b8fc017.png', 'cde2f4323c882699b506998113568396.png', 'A', 1598894699, 1598894699),
(87, 3, 1, 1, '', '', 41, '<p>“Rudi diminta untuk membuat program untuk mengkonversi angka menjadi nama bulan. Contohnya, jika user input 1 maka akan mengahasilkan ouput ”Januari”, jika user input 2 maka akan menghasilkan output ”Februari”, dan begitu seterusnya sampai angka 12.</p><p>Jika user input selain angka 1 sampai 12 maka akan dihasilkan output ”Maaf periksa inputan Anda!” ”</p><p>Berdasarkan narasi di atas, algoritma flowchart percabangan Switch Case yang tepat adalah ...</p>', '', '', '', '', '', '9624def9fc92c1546641dea7dfce8ff2.png', '8ab5d07e36f1911309af4292710cce09.png', 'e7cb1b5a0f7f597488ba8b3bb61eae1e.png', '497768185abc40f3472f8cc33068abc0.png', '33346f824b91e96d981ed9f1a91ad035.png', 'B', 1598894842, 1598894842);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'Administrator', '$2y$12$tGY.AtcyXrh7WmccdbT1rOuKEcTsKH6sIUmDr0ore1yN4LnKTTtuu', 'admin@admin.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1598834073, 1, 'Admin', 'Istrator', 'ADMIN', '0'),
(2, '::1', '08121422', '$2y$10$SqKAxFS6PDLdvETznyuybuFqgJPIWWyrJQu7dRAzx8LQxbwrS0Ksu', 'fara@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1594097874, 1598896125, 1, 'fara', 'fara', NULL, NULL),
(3, '::1', '12345678', '$2y$10$bPiZaPeUF.MtsqJSiCWgD.Ev8FZxsAwpfWm01bdgWm.wYHKrqRiMS', 'dissa@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1594102963, 1599052112, 1, 'Faradissa', 'Faradissa', NULL, NULL),
(4, '::1', '11223344', '$2y$10$vb1JHzMW33TKXvq65VeAK.j63F8AvOXIRiRk.2xias1nwiKO0pzGa', 'nurul@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1594122478, 1599051599, 1, 'Nurul', 'Nurul', NULL, NULL),
(5, '::1', '1906610091', '$2y$10$fzgF2svd8vPy8fc9ulBUWeHC/sdBTOhzNWKLK4Qh23JwfW3Ha5FDi', 'muhammadhanifa23@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1597988415, 1598515627, 1, 'MUHAMMAD', 'ABDILLAH', NULL, NULL),
(6, '::1', '1906610086', '$2y$10$yMFz97vPR.b66yOXI3/s6ukIGZIaiYEobbf/aYM7cmoFFaY1zdTiO', 'Ichsan.p.firdiansyah@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1597988510, 1598515020, 1, 'ICHSAN', 'FIRDIANSYAH', NULL, NULL),
(7, '::1', '1906610077', '$2y$10$0r2fO43o3MCjKKicSmxEBundgWLDprE7XE3bhdI/SKNAi7qLOaMT2', 'asrihusnulrosadi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1597988696, 1598516513, 1, 'ASRI', 'ROSADI', NULL, NULL),
(8, '::1', '1906610079', '$2y$10$CDMWHHwm1oys01mVOjtiku5ApjXnDyjFBMIMISLXHyXffy5wsH1aq', 'Daffamuhamadra@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1597988701, 1598522606, 1, 'DAFFA', 'ANSORI', NULL, NULL),
(9, '::1', '1906610096', '$2y$10$n0Se6BnTri/6y.6lZG7h6.O5xc8zZqPpzi466tvYEuRC0lOjFZc/u', 'Nazuamarcellino@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1597988708, 1599407092, 1, 'NAZUA', 'MARCELLINO', NULL, NULL),
(10, '::1', '1906610095', '$2y$10$P0L.MS8yZv9roDbG5Es0TeZhJFtbb99uB7vr9xVEoLAbVwQdZOcO6', 'nadzilapertiwi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1597988782, 1598520892, 1, 'NADZILA', 'NURASTRIAN', NULL, NULL),
(11, '::1', '1906610092', '$2y$10$VJqjMHXVcN8B5G1OE6OYau7RKkkdQlT61nGbIrFvXJaneDQtbmfAu', 'm.kemal.ardhika@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1597988859, 1598518378, 1, 'MUHAMMAD', 'DIPUTRA', NULL, NULL),
(12, '::1', '1906610103', '$2y$10$d.lOGrmQa.KouPzRfnwvMeynotKz.qih.Nvxr9XbfefkuiJXqe5EO', 'syehanahmad01@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1597988942, 1598516792, 1, 'SYEHAN', 'ZAIN', NULL, NULL),
(13, '::1', '1906610104', '$2y$10$yvQip1Exnwb13CqwJgcTGu0caXWU1cjvndU58Qa5wQ7vo9CM8P6O2', 'wafasalsabila246@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1597989020, 1598522208, 1, 'WAFA', 'SALSABILA', NULL, NULL),
(14, '::1', '1906610084', '$2y$10$XOVljCqqSCuB2EO2/k1YEuMUIDXlSuRMvf7xLxvggLat7FyEGebUq', 'handokoraffli6005@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1597989089, 1598523766, 1, 'HANDOKO', 'RAFFLI', NULL, NULL),
(15, '::1', '1906610078', '$2y$10$bcpGzJwshtgVKs1fCXnzau67nXbjBx7kiKfe0l.jc9E/eVrgp9i2a', 'auliahh5@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1597989186, 1598521365, 1, 'AULIA', 'RINJANI', NULL, NULL),
(16, '::1', '1906610097', '$2y$10$AVwDHpRni/G/t2Xbzy8YYe7m4hZ5giN9Pt36RNhRuTSFtWx4Hvh5q', 'raflyandika444@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1597989258, 1598518640, 1, 'RAFLY', 'PERMANA', NULL, NULL),
(17, '::1', '1906610082', '$2y$10$KutxkQJahW8hOtzy9tCZXODELobNwWoySzQK7aswJJ4me/Au8OrZa', 'febryanadiputra@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1597989343, 1598523567, 1, 'FEBRYAN', 'PUTRA', NULL, NULL),
(18, '::1', '1906610102', '$2y$10$fGoYV9smaJ2XvDEqpWtpC.V95mTCyioFWXRJvJ3ofoXRAJWuZXUFu', 'sulastrisulastri40476@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1597989407, 1598515873, 1, 'SULASTRI', 'SULASTRI', NULL, NULL),
(19, '::1', '1906610088', '$2y$10$148zdwm.loTz.tpH3GDcReGBD.T6c0F3/suXDE6KzzniPiejTbkdq', 'muhammadsulaeman9f20@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1597989546, 1598519156, 1, 'MUHAMMAD', 'SULAEMAN', NULL, NULL),
(20, '::1', '1906610083', '$2y$10$JBrOby2rpZIMohXBoOdhWeoqgH76OycmNGM3Otd4CmXp6Bs4XLpR6', 'fitrianiiazzahra0@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1597989622, 1598520294, 1, 'FITRIANI', 'AZZAHRA', NULL, NULL),
(21, '::1', '1906610075', '$2y$10$kOcMsyjP3iG9bj7dC.8wMe2jCxo94X/DmwR0ln5WthHNdJHiBrgNW', '123andymasputragp@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1597989694, 1598517075, 1, 'ANDY', 'PUTRA', NULL, NULL),
(22, '::1', '1906610099', '$2y$10$DHpXkI77Tbuyt.nQY4S0du7ndd1O2CxBojTX6Cj2ocPuB0.SY0tSO', 'rifaldiadi88@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1597990075, 1598518862, 1, 'RIFALDI', 'PAMUNGKAS', NULL, NULL),
(23, '::1', '1906610090', '$2y$10$uklPVLl/8aOBihvxe4QlUOy3le4p2xDu8w4PQb/TBn3vqxFGJan7q', 'Fginanjar45@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1597991095, 1598519987, 1, 'MUHAMMAD', 'GINANJAR', NULL, NULL),
(24, '::1', '1906610105', '$2y$10$FTR7jwKw9b4uhY1egwIUmuBu5CK5DqaEjumapPLC4qrusMyI5Vpcm', 'yoga.akbar2015@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1597991795, 1598516206, 1, 'YOGA', 'FIRDAUS', NULL, NULL),
(25, '::1', '1906610080', '$2y$10$36OeiJdOez9hHKkBUmpsmeyhUfExn1yycDdMnmkzT/wUveL3jV6Z.', 'dinarhamdani03@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1597992281, 1598521147, 1, 'DINAR', 'HAMDANI', NULL, NULL),
(26, '::1', '1906610087', '$2y$10$4hzZBXSLkf74ejtXBakhluDCQtNMb2L9Z15UG57SvPrkz3k0trEQ6', 'Sellamarsella123455@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1597992737, 1598522847, 1, 'MARSELLA', 'AMANDA', NULL, NULL),
(27, '::1', '1906610101', '$2y$10$yRQYiu8kBV764.bWoAcVLOcvdjOydd7RxwXGeRAEKIxiXs7eMyfzO', 'shalfa.almira2003@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1597995795, 1598520601, 1, 'SHALFA', 'DEANA', NULL, NULL),
(28, '::1', '1906610100', '$2y$10$Th0uSj8IQ1H9vjq0utNFqO8cbUp4izXMbxGg.qS1iYyk9J0o46Ft2', 'srizki245@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1597995972, 1598517349, 1, 'SEPTIAN', 'NUGRAHA', NULL, NULL),
(29, '::1', '1906610098', '$2y$10$nOF3CbLh1QbGj3j4D/Ubn.GU2rwcXRC.iLIwXBHoMiDCvHbIqQN.a', 'rakaakbarulfilman23@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1598006258, 1598523333, 1, 'RAKA', 'FILMAN', NULL, NULL),
(30, '::1', '1906610093', '$2y$10$iYS9Zb8f0o3V4IV19qFa2OSvvfBPQXRgxWLSMs1PqMEV3pQScNg6m', 'rizalsyamsulr1@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1598011501, 1598523079, 1, 'MUHAMMAD', 'RIZAL', NULL, NULL),
(31, '::1', '22334455', '$2y$10$HySML4/iBkrgd2xdi2Ei/.6vbaj0cdgWtNbNBv0Qh13HhjxxEQCA.', 'aldo@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1598291573, 1598528068, 1, 'aldo', 'aldo', NULL, NULL),
(32, '::1', '01010101', '$2y$10$WUFW2Zl1poPfAqPM8QtEeeTadob8bqnrmOATCB9yVkngDziHI.ROe', 'laup@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1598292407, 1598292430, 1, 'dissa', 'laup', NULL, NULL),
(33, '::1', '33445566', '$2y$10$XEglymDKYcyaWKVG3iJk3uYWJiyIfGO2GY9uImiiYUUOjagqTCzTq', 'faradissanurul@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1598834389, 1598896011, 1, 'Faradisa', 'Faradisa', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(3, 1, 1),
(4, 2, 3),
(5, 3, 2),
(6, 4, 3),
(7, 5, 3),
(8, 6, 3),
(9, 7, 3),
(10, 8, 3),
(11, 9, 3),
(12, 10, 3),
(13, 11, 3),
(14, 12, 3),
(15, 13, 3),
(16, 14, 3),
(17, 15, 3),
(18, 16, 3),
(19, 17, 3),
(20, 18, 3),
(21, 19, 3),
(22, 20, 3),
(23, 21, 3),
(24, 22, 3),
(25, 23, 3),
(26, 24, 3),
(27, 25, 3),
(28, 26, 3),
(29, 27, 3),
(30, 28, 3),
(31, 29, 3),
(32, 30, 3),
(33, 31, 2),
(34, 32, 3),
(35, 33, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `freq_missed_lo`
--
ALTER TABLE `freq_missed_lo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_soalfkfr` (`soal_id`),
  ADD KEY `id_ujianfkfr` (`ujian_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id_guru`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `nip` (`nip`),
  ADD KEY `mapel_id` (`mapel_id`);

--
-- Indexes for table `hambatan_belajar`
--
ALTER TABLE `hambatan_belajar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `h_ujian`
--
ALTER TABLE `h_ujian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ujian_id` (`ujian_id`),
  ADD KEY `siswa_id` (`siswa_id`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indexes for table `jurusan_mapel`
--
ALTER TABLE `jurusan_mapel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jurusan_id` (`jurusan_id`),
  ADD KEY `mapel_id` (`mapel_id`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`),
  ADD KEY `jurusan_id` (`jurusan_id`);

--
-- Indexes for table `kelas_guru`
--
ALTER TABLE `kelas_guru`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelas_id` (`kelas_id`),
  ADD KEY `guru_id` (`guru_id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`id_mapel`);

--
-- Indexes for table `m_ujian`
--
ALTER TABLE `m_ujian`
  ADD PRIMARY KEY (`id_ujian`),
  ADD KEY `mapel_id` (`mapel_id`),
  ADD KEY `guru_id` (`guru_id`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`),
  ADD UNIQUE KEY `nomor_induk` (`nomor_induk`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `kelas_id` (`kelas_id`);

--
-- Indexes for table `tb_soal`
--
ALTER TABLE `tb_soal`
  ADD PRIMARY KEY (`id_soal`),
  ADD KEY `mapel_id` (`mapel_id`),
  ADD KEY `guru_id` (`guru_id`),
  ADD KEY `tb_soal_ibfk_3` (`id_hambatan`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`),
  ADD UNIQUE KEY `uc_email` (`email`) USING BTREE;

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `freq_missed_lo`
--
ALTER TABLE `freq_missed_lo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `guru`
--
ALTER TABLE `guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `hambatan_belajar`
--
ALTER TABLE `hambatan_belajar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `h_ujian`
--
ALTER TABLE `h_ujian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;
--
-- AUTO_INCREMENT for table `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id_jurusan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `jurusan_mapel`
--
ALTER TABLE `jurusan_mapel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `kelas_guru`
--
ALTER TABLE `kelas_guru`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mapel`
--
ALTER TABLE `mapel`
  MODIFY `id_mapel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `m_ujian`
--
ALTER TABLE `m_ujian`
  MODIFY `id_ujian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `tb_soal`
--
ALTER TABLE `tb_soal`
  MODIFY `id_soal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `freq_missed_lo`
--
ALTER TABLE `freq_missed_lo`
  ADD CONSTRAINT `id_soalfkfr` FOREIGN KEY (`soal_id`) REFERENCES `tb_soal` (`id_soal`) ON UPDATE CASCADE,
  ADD CONSTRAINT `id_ujianfkfr` FOREIGN KEY (`ujian_id`) REFERENCES `m_ujian` (`id_ujian`) ON UPDATE CASCADE;

--
-- Constraints for table `guru`
--
ALTER TABLE `guru`
  ADD CONSTRAINT `guru_ibfk_1` FOREIGN KEY (`mapel_id`) REFERENCES `mapel` (`id_mapel`);

--
-- Constraints for table `h_ujian`
--
ALTER TABLE `h_ujian`
  ADD CONSTRAINT `h_ujian_ibfk_1` FOREIGN KEY (`ujian_id`) REFERENCES `m_ujian` (`id_ujian`),
  ADD CONSTRAINT `h_ujian_ibfk_2` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id_siswa`);

--
-- Constraints for table `jurusan_mapel`
--
ALTER TABLE `jurusan_mapel`
  ADD CONSTRAINT `jurusan_mapel_ibfk_1` FOREIGN KEY (`jurusan_id`) REFERENCES `jurusan` (`id_jurusan`),
  ADD CONSTRAINT `jurusan_mapel_ibfk_2` FOREIGN KEY (`mapel_id`) REFERENCES `mapel` (`id_mapel`);

--
-- Constraints for table `kelas_guru`
--
ALTER TABLE `kelas_guru`
  ADD CONSTRAINT `kelas_guru_ibfk_1` FOREIGN KEY (`guru_id`) REFERENCES `guru` (`id_guru`),
  ADD CONSTRAINT `kelas_guru_ibfk_2` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id_kelas`);

--
-- Constraints for table `m_ujian`
--
ALTER TABLE `m_ujian`
  ADD CONSTRAINT `m_ujian_ibfk_1` FOREIGN KEY (`guru_id`) REFERENCES `guru` (`id_guru`),
  ADD CONSTRAINT `m_ujian_ibfk_2` FOREIGN KEY (`mapel_id`) REFERENCES `mapel` (`id_mapel`);

--
-- Constraints for table `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_ibfk_2` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id_kelas`);

--
-- Constraints for table `tb_soal`
--
ALTER TABLE `tb_soal`
  ADD CONSTRAINT `tb_soal_ibfk_1` FOREIGN KEY (`mapel_id`) REFERENCES `mapel` (`id_mapel`),
  ADD CONSTRAINT `tb_soal_ibfk_2` FOREIGN KEY (`guru_id`) REFERENCES `guru` (`id_guru`),
  ADD CONSTRAINT `tb_soal_ibfk_3` FOREIGN KEY (`id_hambatan`) REFERENCES `hambatan_belajar` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
