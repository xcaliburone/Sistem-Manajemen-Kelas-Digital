USE `smkd`;

CREATE TABLE IF NOT EXISTS `guru_mapel` (
    `nip_guru` VARCHAR(18) NOT NULL,
    `id_mapel` VARCHAR(36) NOT NULL,
    PRIMARY KEY (`nip_guru`, `mapel_id`),
    -- UNIQUE KEY `unique_guru_mapel` (`nip_guru`, `id_mapel`)
    KEY `nip_guru_gurumapel` (`nip_guru`),
    KEY `id_mapel_gurumapel` (`id_mapel`),
    CONSTRAINT `nip_guru_gurumapel` FOREIGN KEY (`nip_guru`) REFERENCES `guru`(`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `id_mapel_gurumapel` FOREIGN KEY (`id_mapel`) REFERENCES `mata_pelajaran`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `mapel_kelas` (
    `id_mapel` VARCHAR(36) NOT NULL,
    `id_kelas` VARCHAR(36) NOT NULL,
    PRIMARY KEY (`id_mapel`, `id_kelas`),
    KEY `id_mapel_mapelkelas` (`id_mapel`),
    KEY `id_kelas_mapelkelas` (`id_kelas`),
    CONSTRAINT `id_mapel_mapelkelas` FOREIGN KEY (`id_mapel`) REFERENCES `mata_pelajaran`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `id_kelas_mapelkelas` FOREIGN KEY (`id_kelas`) REFERENCES `kelas`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `mapel_materi` (
    `id_mapel` VARCHAR(36) NOT NULL,
    `id_materi` VARCHAR(36) NOT NULL,
    PRIMARY KEY (`id_mapel`, `id_materi`),
    KEY `id_mapel_mapelmateri` (`id_mapel`),
    KEY `id_materi_mapelmateri` (`id_materi`),
    CONSTRAINT `id_mapel_mapelmateri` FOREIGN KEY (`id_mapel`) REFERENCES `mata_pelajaran`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `id_materi_mapelmateri` FOREIGN KEY (`id_materi`) REFERENCES `materi`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `mapel_tugas` (
    `id_mapel` VARCHAR(36) NOT NULL,
    `id_tugas` VARCHAR(36) NOT NULL,
    PRIMARY KEY (`id_mapel`, `id_tugas`),
    KEY `id_mapel_mapeltugas` (`id_mapel`),
    KEY `id_tugas_mapeltugas` (`id_tugas`),
    CONSTRAINT `id_mapel_mapeltugas` FOREIGN KEY (`id_mapel`) REFERENCES `mata_pelajaran`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `id_tugas_mapeltugas` FOREIGN KEY (`id_tugas`) REFERENCES `tugas`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `kelas_absen` (
    `id_kelas` VARCHAR(36) NOT NULL,
    `id_absen` VARCHAR(36) NOT NULL,
    PRIMARY KEY (`id_kelas`, `id_absen`),
    KEY `id_kelas_kelasabsen` (`id_kelas`),
    KEY `id_absen_kelasabsen` (`id_absen`),
    CONSTRAINT `id_kelas_kelasabsen` FOREIGN KEY (`id_kelas`) REFERENCES `kelas`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `id_absen_kelasabsen` FOREIGN KEY (`id_absen`) REFERENCES `absen`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `kelas_siswa` (
    `id_kelas` VARCHAR(36) NOT NULL,
    `nisn_siswa` VARCHAR(10) NOT NULL,
    `jumlah` INT DEFAULT NULL,
    PRIMARY KEY (`id_kelas`, `nisn_siswa`),
    KEY `id_kelas_kelassiswa` (`id_kelas`),
    KEY `nisn_siswa_kelassiswa` (`nisn_siswa`),
    CONSTRAINT `id_kelas_kelassiswa` FOREIGN KEY (`id_kelas`) REFERENCES `kelas`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `nisn_siswa_kelassiswa` FOREIGN KEY (`nisn_siswa`) REFERENCES `siswa`(`nisn`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `nilai_siswa` (
    `id_nilai` VARCHAR(36) NOT NULL,
    `nisn_siswa` VARCHAR(10) NOT NULL,
    PRIMARY KEY (`id_nilai`, `nisn_siswa`),
    KEY `id_nilai_nilaisiswa` (`id_nilai`),
    KEY `nisn_siswa_nilaisiswa` (`nisn_siswa`),
    CONSTRAINT `id_nilai_nilaisiswa` FOREIGN KEY (`id_nilai`) REFERENCES `penilaian`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `nisn_siswa_nilaisiswa` FOREIGN KEY (`nisn_siswa`) REFERENCES `siswa`(`nisn`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `nilai_tugas` (
    `id_nilai` VARCHAR(36) NOT NULL,
    `id_tugas` VARCHAR(36) NOT NULL,
    PRIMARY KEY (`id_nilai`, `id_tugas`),
    KEY `id_nilai_nilaitugas` (`id_nilai`),
    KEY `id_tugas_nilaitugas` (`id_tugas`),
    CONSTRAINT `id_nilai_nilaitugas` FOREIGN KEY (`id_nilai`) REFERENCES `penilaian`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `id_tugas_nilaitugas` FOREIGN KEY (`id_tugas`) REFERENCES `tugas`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
);