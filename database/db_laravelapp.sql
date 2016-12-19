-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.17 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for db_laravelapp
CREATE DATABASE IF NOT EXISTS `db_laravelapp` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_laravelapp`;


-- Dumping structure for table db_laravelapp.hobi
CREATE TABLE IF NOT EXISTS `hobi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_hobi` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table db_laravelapp.hobi: ~0 rows (approximately)
DELETE FROM `hobi`;
/*!40000 ALTER TABLE `hobi` DISABLE KEYS */;
INSERT INTO `hobi` (`id`, `nama_hobi`, `created_at`, `updated_at`) VALUES
	(1, 'Coding', '2016-04-12 15:14:45', '2016-04-12 15:14:45'),
	(2, 'Hiking', '2016-04-12 15:14:54', '2016-04-12 15:14:54'),
	(3, 'Backpacking', '2016-04-12 15:15:12', '2016-04-12 15:15:12'),
	(4, 'Gaming', '2016-04-12 15:15:20', '2016-04-12 15:15:20');
/*!40000 ALTER TABLE `hobi` ENABLE KEYS */;


-- Dumping structure for table db_laravelapp.hobi_siswa
CREATE TABLE IF NOT EXISTS `hobi_siswa` (
  `id_siswa` int(10) unsigned NOT NULL,
  `id_hobi` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_siswa`,`id_hobi`),
  KEY `hobi_siswa_id_siswa_index` (`id_siswa`),
  KEY `hobi_siswa_id_hobi_index` (`id_hobi`),
  CONSTRAINT `hobi_siswa_id_hobi_foreign` FOREIGN KEY (`id_hobi`) REFERENCES `hobi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hobi_siswa_id_siswa_foreign` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table db_laravelapp.hobi_siswa: ~0 rows (approximately)
DELETE FROM `hobi_siswa`;
/*!40000 ALTER TABLE `hobi_siswa` DISABLE KEYS */;
INSERT INTO `hobi_siswa` (`id_siswa`, `id_hobi`, `created_at`, `updated_at`) VALUES
	(2, 1, '2016-04-12 15:16:53', '2016-04-12 15:16:53'),
	(2, 3, '2016-04-12 15:16:53', '2016-04-12 15:16:53'),
	(3, 1, '2016-04-12 15:18:10', '2016-04-12 15:18:10'),
	(3, 4, '2016-04-12 15:18:10', '2016-04-12 15:18:10'),
	(4, 1, '2016-04-12 15:19:12', '2016-04-12 15:19:12'),
	(5, 4, '2016-04-12 15:21:36', '2016-04-12 15:21:36'),
	(6, 1, '2016-04-12 15:22:27', '2016-04-12 15:22:27'),
	(7, 1, '2016-04-12 15:23:25', '2016-04-12 15:23:25'),
	(7, 3, '2016-04-12 15:23:25', '2016-04-12 15:23:25'),
	(8, 1, '2016-04-12 15:24:24', '2016-04-12 15:24:24'),
	(9, 1, '2016-04-12 15:25:16', '2016-04-12 15:25:16'),
	(10, 1, '2016-04-12 15:26:22', '2016-04-12 15:26:22'),
	(10, 2, '2016-04-12 15:26:22', '2016-04-12 15:26:22'),
	(10, 3, '2016-04-12 15:26:22', '2016-04-12 15:26:22'),
	(10, 4, '2016-04-12 15:26:22', '2016-04-12 15:26:22'),
	(11, 1, '2016-04-12 15:27:39', '2016-04-12 15:27:39'),
	(11, 2, '2016-04-12 15:27:39', '2016-04-12 15:27:39'),
	(12, 1, '2016-04-12 15:28:41', '2016-04-12 15:28:41'),
	(12, 3, '2016-04-12 15:28:41', '2016-04-12 15:28:41'),
	(12, 4, '2016-04-12 15:28:41', '2016-04-12 15:28:41'),
	(13, 1, '2016-04-12 15:31:39', '2016-04-12 15:31:39'),
	(13, 4, '2016-04-12 15:31:39', '2016-04-12 15:31:39'),
	(14, 1, '2016-04-12 15:32:24', '2016-04-12 15:32:24');
/*!40000 ALTER TABLE `hobi_siswa` ENABLE KEYS */;


-- Dumping structure for table db_laravelapp.kelas
CREATE TABLE IF NOT EXISTS `kelas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_kelas` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table db_laravelapp.kelas: ~2 rows (approximately)
DELETE FROM `kelas`;
/*!40000 ALTER TABLE `kelas` DISABLE KEYS */;
INSERT INTO `kelas` (`id`, `nama_kelas`, `created_at`, `updated_at`) VALUES
	(1, 'X - 1', '2016-04-08 22:26:06', '2016-04-08 22:26:06'),
	(2, 'X - 2', '2016-04-08 22:26:12', '2016-04-08 22:26:12'),
	(3, 'XI - 1', '2016-04-12 15:14:01', '2016-04-12 15:14:01'),
	(4, 'XI - 2', '2016-04-12 15:14:10', '2016-04-12 15:14:10'),
	(5, 'XII - 1', '2016-04-12 15:14:23', '2016-04-12 15:14:23'),
	(6, 'XII - 2', '2016-04-12 15:14:32', '2016-04-12 15:14:32');
/*!40000 ALTER TABLE `kelas` ENABLE KEYS */;


-- Dumping structure for table db_laravelapp.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table db_laravelapp.migrations: ~7 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`migration`, `batch`) VALUES
	('2014_10_12_000000_create_users_table', 1),
	('2014_10_12_100000_create_password_resets_table', 1),
	('2016_03_10_095337_create_table_siswa', 1),
	('2016_03_27_065354_create_table_telepon', 1),
	('2016_03_28_112346_create_table_kelas', 1),
	('2016_03_29_134310_create_table_hobi', 1),
	('2016_03_29_135057_create_table_hobi_siswa', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;


-- Dumping structure for table db_laravelapp.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table db_laravelapp.password_resets: ~0 rows (approximately)
DELETE FROM `password_resets`;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;


-- Dumping structure for table db_laravelapp.siswa
CREATE TABLE IF NOT EXISTS `siswa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nisn` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `nama_siswa` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') COLLATE utf8_unicode_ci NOT NULL,
  `id_kelas` int(10) unsigned NOT NULL,
  `foto` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `siswa_nisn_unique` (`nisn`),
  KEY `siswa_id_kelas_foreign` (`id_kelas`),
  CONSTRAINT `siswa_id_kelas_foreign` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table db_laravelapp.siswa: ~0 rows (approximately)
DELETE FROM `siswa`;
/*!40000 ALTER TABLE `siswa` DISABLE KEYS */;
INSERT INTO `siswa` (`id`, `nisn`, `nama_siswa`, `tanggal_lahir`, `jenis_kelamin`, `id_kelas`, `foto`, `created_at`, `updated_at`) VALUES
	(2, '1001', 'tim berners lee', '1955-06-08', 'L', 1, '20160412151652.jpg', '2016-04-12 15:16:52', '2016-04-12 15:16:52'),
	(3, '1002', 'john resig', '1984-05-08', 'L', 2, '20160412151810.jpg', '2016-04-12 15:18:10', '2016-04-12 15:18:10'),
	(4, '1003', 'donald knuth', '1938-01-10', 'L', 4, '20160412151912.jpg', '2016-04-12 15:19:12', '2016-04-12 15:19:12'),
	(5, '1004', 'jeffrey zeldman', '1955-01-12', 'L', 6, '20160412152136.jpg', '2016-04-12 15:21:36', '2016-04-12 15:21:36'),
	(6, '1005', 'yukihiro matsumoto', '1965-04-14', 'L', 4, '20160412152227.jpg', '2016-04-12 15:22:27', '2016-04-12 15:22:27'),
	(7, '1006', 'richard stallman', '1953-03-16', 'L', 1, '20160412152325.jpg', '2016-04-12 15:23:25', '2016-04-12 15:23:25'),
	(8, '1007', 'rasmus lerdorf', '1968-11-22', 'L', 2, '20160412152424.jpg', '2016-04-12 15:24:24', '2016-04-12 15:24:24'),
	(9, '1008', 'linus torvalds', '1969-12-28', 'L', 4, '20160412152516.jpg', '2016-04-12 15:25:16', '2016-04-12 15:25:16'),
	(10, '1009', 'brendan eich', '1961-01-01', 'L', 3, '20160412152622.jpg', '2016-04-12 15:26:22', '2016-04-12 15:26:22'),
	(11, '1010', 'hakon wium lie', '1965-06-12', 'L', 5, '20160412152739.jpg', '2016-04-12 15:27:39', '2016-04-12 15:27:39'),
	(12, '1011', 'jacob thornton', '1980-01-01', 'L', 3, '20160412152841.jpg', '2016-04-12 15:28:41', '2016-04-12 15:28:41'),
	(13, '1012', 'mark otto', '1983-08-15', 'L', 2, '20160412153139.jpg', '2016-04-12 15:31:39', '2016-04-12 15:31:39'),
	(14, '1013', 'taylor otwell', '1970-01-01', 'L', 6, '20160412153224.jpg', '2016-04-12 15:32:24', '2016-04-12 15:32:24');
/*!40000 ALTER TABLE `siswa` ENABLE KEYS */;


-- Dumping structure for table db_laravelapp.telepon
CREATE TABLE IF NOT EXISTS `telepon` (
  `id_siswa` int(10) unsigned NOT NULL,
  `nomor_telepon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_siswa`),
  UNIQUE KEY `telepon_nomor_telepon_unique` (`nomor_telepon`),
  CONSTRAINT `telepon_id_siswa_foreign` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table db_laravelapp.telepon: ~0 rows (approximately)
DELETE FROM `telepon`;
/*!40000 ALTER TABLE `telepon` DISABLE KEYS */;
INSERT INTO `telepon` (`id_siswa`, `nomor_telepon`, `created_at`, `updated_at`) VALUES
	(2, '1234567890111', '2016-04-12 15:16:52', '2016-04-12 15:16:52'),
	(3, '1234567890222', '2016-04-12 15:18:10', '2016-04-12 15:18:10'),
	(4, '1234567890333', '2016-04-12 15:19:12', '2016-04-12 15:19:12'),
	(5, '1234567890444', '2016-04-12 15:21:36', '2016-04-12 15:21:36'),
	(6, '1234567890555', '2016-04-12 15:22:27', '2016-04-12 15:22:27'),
	(7, '1234567890666', '2016-04-12 15:23:25', '2016-04-12 15:23:25'),
	(8, '1234567890777', '2016-04-12 15:24:24', '2016-04-12 15:24:24'),
	(9, '1234567890888', '2016-04-12 15:25:16', '2016-04-12 15:25:16'),
	(10, '1234567890999', '2016-04-12 15:26:22', '2016-04-12 15:26:22'),
	(11, '1234567890010', '2016-04-12 15:27:39', '2016-04-12 15:27:39'),
	(12, '1234567890011', '2016-04-12 15:28:41', '2016-04-12 15:28:41'),
	(13, '1234567890012', '2016-04-12 15:31:39', '2016-04-12 15:31:39'),
	(14, '1234567890013', '2016-04-12 15:32:24', '2016-04-12 15:32:24');
/*!40000 ALTER TABLE `telepon` ENABLE KEYS */;


-- Dumping structure for table db_laravelapp.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` enum('admin','operator') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table db_laravelapp.users: ~3 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `level`, `created_at`, `updated_at`) VALUES
	(2, 'Administrator', 'admin@laravelapp.dev', '$2y$10$CyuOq4RM8HL1t8saFJBYcePUxvY7tNB6ePFz2m1hDU9N3ty6aU5Jm', 'dHTzRIYdosYWmlevioLxbDrRbIbDL5YphhJYro5qaC1NRb7CE76QUUOiYzde', 'admin', '2016-04-08 18:55:21', '2016-04-12 15:34:34'),
	(4, 'Operator', 'operator@laravelapp.dev', '$2y$10$LV5V89dm30osKtmoz7tKWOScl.LrmR9MrUvy1BZIk8/rVPKUnX7ae', 'UIznLk6tYiCYv4Z6iWqTetZA9xvuEyQmFoMgQHTIgs4W8WTkRfKHulCNz6Mt', 'operator', '2016-04-08 19:29:28', '2016-04-12 15:34:55'),
	(13, 'Taylor Otwell', 'taylor@laravelapp.dev', '$2y$10$7dR.5HNJmPd0..7fOKfWpuG/Yv1RFCENwuyixyjenArYMSK/hROq.', 't5x5g4HdV3XTwJOsvBIU8IZYDA2xHQKO0YrSpiHxHeh7MzLvGxoEIfcoN8t9', 'operator', '2016-04-09 23:04:25', '2016-04-11 16:21:34'),
	(14, 'Awan Pribadi Basuki', 'awan@laravelapp.dev', '$2y$10$1woeNaFYlr9wJgUYUv5oAePR1f3kM0PjFzkHsMVisuyhXxG3SQC9u', 'bvFRSTZLAIkRNzWEcA8CCT1WpqQsJPrmCADZHXfY6IWG70iFHtRRMce3d8pf', 'operator', '2016-04-11 16:20:36', '2016-04-11 16:22:27');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
