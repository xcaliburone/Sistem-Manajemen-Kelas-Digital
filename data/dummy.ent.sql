INSERT INTO `guru` (`nip`, `nama`,          `password`) VALUES
    ('200310312025011001', 'adhim rahman',  'kenapamengapakarena'),
    ('200310312025011002', 'dean gery',     'kocak123'),
    ('200310312025011003', 'raihan miftah', 'imang123');
 
INSERT INTO `mata_pelajaran` (`nama`) VALUES
    ('matematika'), ('fisika'), ('biologi');

INSERT INTO `kelas` (`nama`) VALUES
    ('X MIPA 1'), ('X MIPA 2'), ('X MIPA 3'),
    ('XI MIPA 1'), ('XI MIPA 2'), ('XI MIPA 3'),
    ('XII MIPA 1'), ('XII MIPA 2'), ('XII MIPA 3');

INSERT INTO `absen` (`status`) VALUES
    ('hadir'), ('sakit'), ('izin');

INSERT INTO `siswa` (`nisn`, `nama`, `password`) VALUES
    ('0012345678',  'catherine valencia',   'adhimsyg'),
    ('0023456789',  'shani indira natio',   'sygadhim'),
    ('0023456790',  'oline manual',         'adhimphs');

INSERT INTO `penilaian` (`nilai`, `keterangan`) VALUES
    (90.00, 'bagus'), (80.00, 'good'), (100.00, 'ok');

INSERT INTO `tugas` (`judul`, `deskripsi`, `deadline`, `jenis`) VALUES
    ('tugas 1', 'kerja kerja kerja', '2024-10-10 23:00:00', 'tugas'),
    ('tugas 2', 'kejar kejar kejar', '2024-10-11 23:00:00', 'quis');

INSERT INTO `materi` (`judul`, `konten`) VALUES
    ('chapter 1', 'astaga naga'),
    ('chapter 2', 'ome imang'),
    ('chapter 3', 'kocak kanjul');