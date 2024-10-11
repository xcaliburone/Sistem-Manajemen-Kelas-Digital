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
    `id` VARCHAR(36) NOT NULL,
    `nama` VARCHAR(32) NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `idx_mapel_nama` (`nama`)
);

CREATE TABLE IF NOT EXISTS `kelas` (
    `id` VARCHAR(36) NOT NULL,
    `nama` VARCHAR(32) NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `idx_kls_nama` (`nama`)
);

CREATE TABLE IF NOT EXISTS `absen` (
    `id` VARCHAR(36) NOT NULL,
    `status` ENUM('hadir', 'alfa', 'sakit', 'izin', 'none') NOT NULL DEFAULT 'none',
    `tanggal` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `idx_abs_status` (`status`)
);

CREATE TABLE IF NOT EXISTS `siswa` (
    `nisn` VARCHAR(10) NOT NULL,        -- 003 1234567
    `nama` VARCHAR(32) NOT NULL,
    `password` VARCHAR(255) NOT NULL COMMENT 'Hashed password',
    PRIMARY KEY (`nisn`),
    INDEX `idx_siswa_nama` (`nama`)
);

CREATE TABLE IF NOT EXISTS `penilaian` (
    `id` VARCHAR(36) NOT NULL,
    `nilai` DECIMAL(5, 2) NOT NULL,
    `tanggal` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `keterangan` TEXT DEFAULT NULL,
    PRIMARY KEY (`id`),
    INDEX `idx_pnln_nilai` (`nilai`)
);

CREATE TABLE IF NOT EXISTS `tugas` (
    `id` VARCHAR(36) NOT NULL,
    `judul` VARCHAR(32) NOT NULL,
    `deskripsi` TEXT DEFAULT NULL,
    `status` ENUM('undone', 'done') NOT NULL DEFAULT 'undone',
    `deadline` DATETIME DEFAULT NULL,
    `jenis` ENUM('tugas', 'kuis', 'ujian') NOT NULL DEFAULT 'tugas',
    `tanggal` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `idx_tugas_judul` (`judul`)
);

CREATE TABLE IF NOT EXISTS `materi` (
    `id` VARCHAR(36) NOT NULL,
    `tanggal` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `judul` VARCHAR(32) NOT NULL,
    `konten` TEXT DEFAULT NULL,
    PRIMARY KEY (`id`),
    INDEX `idx_materi_judul` (`judul`)
);