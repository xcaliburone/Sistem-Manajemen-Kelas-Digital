USE `smkd`;

DROP TABLE IF EXISTS `guru`;
DROP TABLE IF EXISTS `mata_pelajaran`;
DROP TABLE IF EXISTS `kelas`;
DROP TABLE IF EXISTS `absen`;
DROP TABLE IF EXISTS `siswa`;
DROP TABLE IF EXISTS `penilaian`;
DROP TABLE IF EXISTS `tugas`;
DROP TABLE IF EXISTS `materi`;

DROP TRIGGER IF EXISTS `before_insert_mata_pelajaran`;
DROP TRIGGER IF EXISTS `before_insert_kelas`;
DROP TRIGGER IF EXISTS `before_insert_absen`;
DROP TRIGGER IF EXISTS `before_insert_penilaian`;
DROP TRIGGER IF EXISTS `before_insert_tugas`;
DROP TRIGGER IF EXISTS `before_insert_materi`;