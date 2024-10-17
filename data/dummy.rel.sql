-- Insert data into `guru_mapel`
INSERT INTO `guru_mapel` (`nip_guru`, `id_mapel`) VALUES
    ('200310312025011001', 'MPce60e6c4-86db-11ef-919d-c475ab5e11'), -- adhim rahman mengajar matematika
    ('200310312025011002', 'MPce60f550-86db-11ef-919d-c475ab5e11'), -- dean gery mengajar fisika
    ('200310312025011003', 'MPce60f60e-86db-11ef-919d-c475ab5e11'); -- raihan miftah mengajar biologi

-- Insert data into `mapel_kelas`
INSERT INTO `mapel_kelas` (`id_mapel`, `id_kelas`) VALUES
    ('MPce60e6c4-86db-11ef-919d-c475ab5e11', 'KLce6248f3-86db-11ef-919d-c475ab5e11'), -- matematika untuk X MIPA 1
    ('MPce60f550-86db-11ef-919d-c475ab5e11', 'KLce6257ff-86db-11ef-919d-c475ab5e11'), -- fisika untuk X MIPA 2
    ('MPce60f60e-86db-11ef-919d-c475ab5e11', 'KLce6258c9-86db-11ef-919d-c475ab5e11'); -- biologi untuk X MIPA 3

-- Insert data into `mapel_materi`
INSERT INTO `mapel_materi` (`id_mapel`, `id_materi`) VALUES
    ('MPce60e6c4-86db-11ef-919d-c475ab5e11', 'MTf321336e-86db-11ef-919d-c475ab5e11'), -- materi chapter 1 untuk matematika
    ('MPce60f550-86db-11ef-919d-c475ab5e11', 'MTf3214047-86db-11ef-919d-c475ab5e11'), -- materi chapter 2 untuk fisika
    ('MPce60f60e-86db-11ef-919d-c475ab5e11', 'MTf3214113-86db-11ef-919d-c475ab5e11'); -- materi chapter 3 untuk biologi

-- Insert data into `mapel_tugas`
INSERT INTO `mapel_tugas` (`id_mapel`, `id_tugas`) VALUES
    ('MPce60e6c4-86db-11ef-919d-c475ab5e11', 'TGf31f5f44-86db-11ef-919d-c475ab5e11'), -- tugas 1 untuk matematika
    ('MPce60f550-86db-11ef-919d-c475ab5e11', 'TGf31f6bdf-86db-11ef-919d-c475ab5e11'); -- tugas 2 untuk fisika

-- Insert data into `kelas_absen`
INSERT INTO `kelas_absen` (`id_kelas`, `id_absen`) VALUES
    ('KLce6248f3-86db-11ef-919d-c475ab5e11', 'ABce6372e9-86db-11ef-919d-c475ab5e11'), -- kelas X MIPA 1 absen hadir
    ('KLce6257ff-86db-11ef-919d-c475ab5e11', 'ABce637b2a-86db-11ef-919d-c475ab5e11'), -- kelas X MIPA 2 absen sakit
    ('KLce6258c9-86db-11ef-919d-c475ab5e11', 'ABce637bc3-86db-11ef-919d-c475ab5e11'); -- kelas X MIPA 3 absen izin

-- Insert data into `kelas_siswa`
INSERT INTO `kelas_siswa` (`id_kelas`, `nisn_siswa`, `jumlah`) VALUES
    ('KLce6248f3-86db-11ef-919d-c475ab5e11', '0012345678', 30), -- Catherine Valencia di X MIPA 1
    ('KLce6257ff-86db-11ef-919d-c475ab5e11', '0023456789', 30), -- Shani Indira di X MIPA 2
    ('KLce6258c9-86db-11ef-919d-c475ab5e11', '0023456790', 30); -- Oline Manual di X MIPA 3

-- Insert data into `nilai_siswa`
INSERT INTO `nilai_siswa` (`id_nilai`, `nisn_siswa`) VALUES
    ('NLf31dc390-86db-11ef-919d-c475ab5e11', '0012345678'), -- nilai Catherine Valencia adalah 90
    ('NLf31dd151-86db-11ef-919d-c475ab5e11', '0023456789'), -- nilai Shani Indira adalah 80
    ('NLf31dd217-86db-11ef-919d-c475ab5e11', '0023456790'); -- nilai Oline Manual adalah 100

-- Insert data into `nilai_tugas`
INSERT INTO `nilai_tugas` (`id_nilai`, `id_tugas`) VALUES
    ('NLf31dc390-86db-11ef-919d-c475ab5e11', 'TGf31f5f44-86db-11ef-919d-c475ab5e11'), -- nilai tugas 1 adalah 90
    ('NLf31dd151-86db-11ef-919d-c475ab5e11', 'TGf31f6bdf-86db-11ef-919d-c475ab5e11'); -- nilai tugas 2 adalah 80
