-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Nov 2023 pada 17.35
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ankor`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `Id` int(11) NOT NULL,
  `Nama` int(11) NOT NULL,
  `Hukuman` int(11) NOT NULL,
  `Deskripsi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan`
--

CREATE TABLE `laporan` (
  `Id` int(11) NOT NULL,
  `Id_pelapor` int(11) NOT NULL,
  `Id_Pihak_Berwajib` int(11) NOT NULL,
  `Id_Kategori` int(11) NOT NULL,
  `Tanggal_Laporan` date DEFAULT NULL,
  `File_pendukung` blob DEFAULT NULL,
  `Deskripsi_Laporan` text DEFAULT NULL,
  `Status_Laporan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelapor`
--

CREATE TABLE `pelapor` (
  `NIK` int(12) NOT NULL,
  `Nama` varchar(100) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `Nomor Telepon` int(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pihak_berwajib`
--

CREATE TABLE `pihak_berwajib` (
  `Id` int(10) NOT NULL,
  `Nama` varchar(255) NOT NULL,
  `Jabatan` varchar(20) NOT NULL,
  `Instansi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`Id`);

--
-- Indeks untuk tabel `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_pelapor` (`Id_pelapor`),
  ADD KEY `Id_Pihak_Berwajib` (`Id_Pihak_Berwajib`),
  ADD KEY `Id_Kategori` (`Id_Kategori`);

--
-- Indeks untuk tabel `pelapor`
--
ALTER TABLE `pelapor`
  ADD PRIMARY KEY (`NIK`);

--
-- Indeks untuk tabel `pihak_berwajib`
--
ALTER TABLE `pihak_berwajib`
  ADD PRIMARY KEY (`Id`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `laporan`
--
ALTER TABLE `laporan`
  ADD CONSTRAINT `laporan_ibfk_1` FOREIGN KEY (`Id_pelapor`) REFERENCES `pelapor` (`NIK`),
  ADD CONSTRAINT `laporan_ibfk_2` FOREIGN KEY (`Id_Pihak_Berwajib`) REFERENCES `pihak_berwajib` (`Id`),
  ADD CONSTRAINT `laporan_ibfk_3` FOREIGN KEY (`Id_Kategori`) REFERENCES `kategori` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
