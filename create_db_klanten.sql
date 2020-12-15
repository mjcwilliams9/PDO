-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2020 at 03:38 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `klanten`
--

CREATE DATABASE IF NOT EXISTS `klanten` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `klanten`;
-- --------------------------------------------------------

--
-- Table structure for table `tblartikel`
--

CREATE TABLE `tblartikel` (
  `Artikelnr` int(11) NOT NULL,
  `Artikelgroep` varchar(15) DEFAULT NULL,
  `Verpakking` varchar(15) DEFAULT NULL,
  `Inhoud` int(11) DEFAULT NULL,
  `Omschrijving` varchar(50) DEFAULT NULL,
  `btw_code` int(11) DEFAULT NULL,
  `emballage` double DEFAULT NULL,
  `prijs` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblartikel`
--

INSERT INTO `tblartikel` (`Artikelnr`, `Artikelgroep`, `Verpakking`, `Inhoud`, `Omschrijving`, `btw_code`, `emballage`, `prijs`) VALUES
(1, 'DVD', 'doos', 24, 'Ice age III', 2, 0, 19.95),
(2, 'BLUERAY', 'doos', 24, 'Ice age III', 2, 0, 29.95),
(3, 'DVD', 'doos', 24, 'Star Wars 2', 2, 0, 11.95),
(4, 'CD', 'Spindel', 50, 'TDK CR-R 700mb', 2, 0, 14.95),
(5, 'CD', 'doos', 48, 'Hitzone 50', 2, 0, 14.95),
(6, 'BLUERAY', 'doos', 24, 'The proposal', 2, 0, 24.95),
(7, 'DVD', 'doos', 24, 'The Hangover', 2, 0, 17.95),
(8, 'CD', 'doos', 48, 'Thriller', 2, 0, 9.95),
(9, 'DVD', 'doos', 24, 'Angels en Demons- Het Bernini Mysterie', 2, 0, 8.95),
(10, 'CD', 'Spindel', 100, 'TDK CR-R 700mb', 2, 0, 29.95);

-- --------------------------------------------------------

--
-- Table structure for table `tblfactuur`
--

CREATE TABLE `tblfactuur` (
  `factuurnr` int(11) NOT NULL,
  `klantnr` char(5) DEFAULT NULL,
  `factuurdatum` datetime DEFAULT NULL,
  `facturist` varchar(30) DEFAULT NULL,
  `afrekenmethode` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblfactuur`
--

INSERT INTO `tblfactuur` (`factuurnr`, `klantnr`, `factuurdatum`, `facturist`, `afrekenmethode`) VALUES
(1, 'kw1c', '2009-01-01 00:00:00', 'P. Overbeek', 'B'),
(2, 'kw1c', '2009-01-02 00:00:00', 'R. Meijerink', 'B'),
(3, 'kw1c', '2009-01-03 00:00:00', 'R. Meijerink', 'P'),
(4, 'Avans', '2009-01-04 00:00:00', 'P. Overbeek', 'C');

-- --------------------------------------------------------

--
-- Table structure for table `tblfactuurregel`
--

CREATE TABLE `tblfactuurregel` (
  `Factuurnr` int(11) NOT NULL,
  `Artikelnr` int(11) NOT NULL,
  `Besteld` int(11) DEFAULT NULL,
  `Geleverd` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblklant`
--

CREATE TABLE `tblklant` (
  `klantnr` char(5) NOT NULL,
  `Naam` varchar(30) DEFAULT NULL,
  `Adres` varchar(30) DEFAULT NULL,
  `Postcode` char(6) DEFAULT NULL,
  `Plaats` varchar(20) DEFAULT NULL,
  `Directeur` varchar(30) DEFAULT NULL,
  `Telefoonnr` char(11) DEFAULT NULL,
  `Inschrijfnr_kvk` char(10) DEFAULT NULL,
  `Kredietlimiet` int(11) DEFAULT NULL,
  `Krediettermijn` int(11) DEFAULT NULL,
  `Rentepercentage` int(11) DEFAULT NULL,
  `Klant_sinds` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblklant`
--

INSERT INTO `tblklant` (`klantnr`, `Naam`, `Adres`, `Postcode`, `Plaats`, `Directeur`, `Telefoonnr`, `Inschrijfnr_kvk`, `Kredietlimiet`, `Krediettermijn`, `Rentepercentage`, `Klant_sinds`) VALUES
('AMC', 'Academisch ziekenhuis', 'Oosterbaan 31', '1012XX', 'Amsterdam', 'A. Griep', '020-7243239', 'z-40527132', 15000, 20, 10, '1990-07-01 00:00:00'),
('AVANS', 'Avans Den Bosch', 'Onderwijsboulevard 5', '5052DE', 'Den Bosch', 'L. Eergraag', '073-6243239', 's-40384932', 10000, 10, 10, '2001-02-01 00:00:00'),
('BMC', 'Bosch Medisch Centrum', 'Vlijmenseweg 13', '5051HT', 'Den Bosch', 'C. Ardiologie', '073-5487124', 'z-84039462', 15000, 30, 5, '1995-09-01 00:00:00'),
('FontA', 'Fontys Amsterdam', 'Den Dam 543a', '1018QS', 'Amsterdam', 'I. van der Steen', '020-7463889', 's-40527987', 5000, 10, 5, '1998-10-01 00:00:00'),
('FontE', 'Fontys Eindhoven', 'Philipsstraat 34', '5101AZ', 'Eindhoven', 'A. Logica', '020-7243239', 's-10234532', 0, 0, 0, '2004-10-01 00:00:00'),
('FontT', 'Fontys Tilburg', 'Heuvel 16', '5056RR', 'Tilburg', 'K. Kennis', '020-7243239', 's-34527132', 15000, 30, 10, '1998-03-01 00:00:00'),
('HASA', 'HAS Amsterdam', 'Kalverstraat 233b', '1009KS', 'Amsterdam', 'T. Torvald', '020-7243239', 's-94949302', 7500, 10, 5, '2004-03-01 00:00:00'),
('HASD', 'HAS Den Bosch', 'Dieze 23', '5241KN', 'Den Bosch', 'B. Gates', '020-7243239', 's-14055271', 20000, 20, 10, '2009-06-01 00:00:00'),
('KW1', 'Koning Willem I', 'Ringbaan Noord 123', '5123OP', 'Tilburg', 'K. Weetnie', '013-3740294', 's-20048392', 0, 0, 0, '2009-07-01 00:00:00'),
('kw1c', 'Koning Willem I College', 'Postbus 38', '2410AA', 'Bodegraven', 'B. van Strien', '073-6249909', 's-10029122', 5000, 30, 5, '2000-01-01 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblartikel`
--
ALTER TABLE `tblartikel`
  ADD PRIMARY KEY (`Artikelnr`);

--
-- Indexes for table `tblfactuur`
--
ALTER TABLE `tblfactuur`
  ADD PRIMARY KEY (`factuurnr`),
  ADD KEY `klantnr` (`klantnr`);

--
-- Indexes for table `tblfactuurregel`
--
ALTER TABLE `tblfactuurregel`
  ADD PRIMARY KEY (`Factuurnr`,`Artikelnr`),
  ADD KEY `Artikelnr` (`Artikelnr`);

--
-- Indexes for table `tblklant`
--
ALTER TABLE `tblklant`
  ADD PRIMARY KEY (`klantnr`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblartikel`
--
ALTER TABLE `tblartikel`
  MODIFY `Artikelnr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblfactuur`
--
ALTER TABLE `tblfactuur`
  MODIFY `factuurnr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblfactuur`
--
ALTER TABLE `tblfactuur`
  ADD CONSTRAINT `tblfactuur_ibfk_1` FOREIGN KEY (`klantnr`) REFERENCES `tblklant` (`klantnr`);

--
-- Constraints for table `tblfactuurregel`
--
ALTER TABLE `tblfactuurregel`
  ADD CONSTRAINT `factuurnr` FOREIGN KEY (`Factuurnr`) REFERENCES `tblfactuur` (`factuurnr`),
  ADD CONSTRAINT `artikelnr` FOREIGN KEY (`Factuurnr`) REFERENCES `tblartikel` (`Artikelnr`);
 
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
