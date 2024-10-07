CREATE DATABASE IF NOT EXISTS `smkd`;
USE `smkd`;

CREATE TABLE IF NOT EXISTS `guru` (
    `nip` VARCHAR(18) NOT NULL,         -- 20031031 202501 1 001
    `nama` VARCHAR(32) NOT NULL,
    `password` VARCHAR(255) NOT NULL COMMENT 'Hashed password',
    PRIMARY KEY (`nip`),
    INDEX `idx_guru_nama` (`nama`)
);

CREATE TABLE IF NOT EXISTS `mata_pelajaran` (
    `id` VARCHAR(36) NOT NULL DEFAULT (SELECT CONCAT('MP', UUID())),
    `nama` VARCHAR(32) NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `idx_mapel_nama` (`nama`)
);

CREATE TABLE IF NOT EXISTS `kelas` (
    `id` VARCHAR(36) NOT NULL DEFAULT (SELECT CONCAT('KL', UUID())),
    `nama` VARCHAR(32) NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `idx_kls_nama` (`nama`)
);

CREATE TABLE IF NOT EXISTS `absen` (
    `id` VARCHAR(36) NOT NULL DEFAULT (SELECT CONCAT('AB', UUID())),
    `nama` VARCHAR(32) NOT NULL,
    `tanggal` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `idx_absen_nama` (`nama`)
);

CREATE TABLE IF NOT EXISTS `siswa` (
    `nisn` VARCHAR(10) NOT NULL,        -- 003 1234567
    `nama` VARCHAR(32) NOT NULL,
    `password` VARCHAR(255) NOT NULL COMMENT 'Hashed password',
    PRIMARY KEY (`nisn`),
    INDEX `idx_siswa_nama` (`nama`)
);

CREATE TABLE IF NOT EXISTS `penilaian` (
    `id` VARCHAR(36) NOT NULL DEFAULT (SELECT CONCAT('NL', UUID())),
    `nilai` DECIMAL(5, 2) NOT NULL,
    `tanggal` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `keterangan` TEXT DEFAULT NULL,
    PRIMARY KEY (`id`),
);

CREATE TABLE IF NOT EXISTS `tugas` (
    `id` VARCHAR(36) NOT NULL DEFAULT (SELECT CONCAT('TG', UUID())),
    `judul` VARCHAR(32) NOT NULL,
    `deskripsi` TEXT DEFAULT NULL,
    `status` ENUM('undone', 'done') NOT NULL DEFAULT 'undone',
    `deadline` DATETIME DEFAULT NULL,
    `jenis` ENUM('tugas', 'kuis', 'ujian') NOT NULL DEFAULT 'tugas',
    `tanggal` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `idx_kls_name` (`judul`)
);

CREATE TABLE IF NOT EXISTS `materi` (
    `id` VARCHAR(36) NOT NULL DEFAULT (SELECT CONCAT('MT', UUID())),
    `tanggal` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `judul` VARCHAR(32) NOT NULL,
    `konten` TEXT DEFAULT NULL,
    PRIMARY KEY (`id`),
    INDEX `idx_kls_name` (`judul`)
);