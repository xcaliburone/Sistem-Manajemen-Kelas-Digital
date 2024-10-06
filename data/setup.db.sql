CREATE DATABASE IF NOT EXISTS `smkd`;
USE `smkd`;

CREATE TABLE IF NOT EXISTS `guru` (
    `nip` VARCHAR(11) NOT NULL,
    `nama` VARCHAR(32) NOT NULL,
    `password` VARCHAR(32) NOT NULL,
    PRIMARY KEY (`nip`),
    INDEX `idx_guru_nama` (`nama`)
);

CREATE TABLE IF NOT EXISTS `mata_pelajaran` (
    `id` VARCHAR(11) NOT NULL,
    `nama` VARCHAR(32) NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `idx_mapel_nama` (`nama`)
);

CREATE TABLE IF NOT EXISTS `kelas` (
    `id` VARCHAR(11) NOT NULL,
    `nama` VARCHAR(32) NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `idx_kls_nama` (`nama`)
);

CREATE TABLE IF NOT EXISTS `absen` (
    `id` VARCHAR(11) NOT NULL,
    `nama` VARCHAR(32) NOT NULL,
    `tanggal` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `idx_absen_nama` (`nama`)
);

CREATE TABLE IF NOT EXISTS `siswa` (
    `nisn` VARCHAR(11) NOT NULL,
    `nama` VARCHAR(32) NOT NULL,
    `password` VARCHAR(32) NOT NULL,
    PRIMARY KEY (`nisn`),
    INDEX `idx_siswa_nama` (`nama`)
);

CREATE TABLE IF NOT EXISTS `penilaian` (
    `id` VARCHAR(11) NOT NULL,
    `jenis` VARCHAR(32) NOT NULL,
    `nilai` VARCHAR(32) NOT NULL,
);

CREATE TABLE IF NOT EXISTS `tugas` (
    `id` VARCHAR(11) NOT NULL,
    `judul` VARCHAR(32) NOT NULL,
    `deskripsi` TEXT DEFAULT NULL,
    `status` ENUM('undone', 'done') NOT NULL DEFAULT 'undone',
    `deadline` DATETIME DEFAULT NULL,
    PRIMARY KEY (`id`),
    INDEX `idx_kls_name` (`judul`)
);

CREATE TABLE IF NOT EXISTS `materi` (
    `id` VARCHAR(11) NOT NULL,
    `judul` VARCHAR(32) NOT NULL,
    `konten` TEXT DEFAULT NULL,
    PRIMARY KEY (`id`),
    INDEX `idx_kls_name` (`judul`)
);

CREATE TABLE IF NOT EXISTS `guru_mapel` (
    a
);

CREATE TABLE IF NOT EXISTS `mapel_kelas` (
    a
);

CREATE TABLE IF NOT EXISTS `mapel_materi` (
    a
);

CREATE TABLE IF NOT EXISTS `mapel_tugas` (
    a
);

CREATE TABLE IF NOT EXISTS `kelas_absen` (
    a
);

CREATE TABLE IF NOT EXISTS `kelas_siswa` (
    a
);

CREATE TABLE IF NOT EXISTS `nilai_siswa` (
    a
);

CREATE TABLE IF NOT EXISTS `nilai_tugas` (
    a
);

CREATE TABLE IF NOT EXISTS `stock_transactions` (
    `employee_id` VARCHAR(11) NOT NULL,
    `transaction_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX `idx_stock_transactions_type`(`type`),
    KEY `ingred_id_stock_txn` (`ingredient_id`),
    CONSTRAINT `ingred_id_stock_txn` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
);