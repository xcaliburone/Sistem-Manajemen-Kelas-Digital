-- Guru Mengajar Mata Pelajaran di Kelas
SELECT g.nama AS nama_guru, m.nama AS nama_mapel, k.nama AS nama_kelas
FROM guru g
JOIN guru_mapel gm ON g.nip = gm.nip_guru
JOIN mata_pelajaran m ON gm.id_mapel = m.id
JOIN mapel_kelas mk ON m.id = mk.id_mapel
JOIN kelas k ON mk.id_kelas = k.id;

-- Mata Pelajaran dan Materi yang Diajarkan
SELECT m.nama AS nama_mapel, mt.judul AS judul_materi, mt.konten AS konten_materi
FROM mata_pelajaran m
JOIN mapel_materi mm ON m.id = mm.id_mapel
JOIN materi mt ON mm.id_materi = mt.id;

-- Mata Pelajaran dan Tugas yang Diberikan
SELECT m.nama AS nama_mapel, t.judul AS judul_tugas, t.deskripsi AS deskripsi_tugas, t.deadline
FROM mata_pelajaran m
JOIN mapel_tugas mt ON m.id = mt.id_mapel
JOIN tugas t ON mt.id_tugas = t.id;

-- Siswa dan Kelas yang Mereka Ikuti
SELECT s.nama AS nama_siswa, k.nama AS nama_kelas
FROM siswa s
JOIN kelas_siswa ks ON s.nisn = ks.nisn_siswa
JOIN kelas k ON ks.id_kelas = k.id;

-- Absensi Siswa di Kelas
SELECT s.nama AS nama_siswa, k.nama AS nama_kelas, a.status, a.tanggal
FROM siswa s
JOIN kelas_siswa ks ON s.nisn = ks.nisn_siswa
JOIN kelas_absen ka ON ks.id_kelas = ka.id_kelas
JOIN absen a ON ka.id_absen = a.id
JOIN kelas k ON ka.id_kelas = k.id;

-- Nilai Siswa untuk Setiap Tugas
SELECT s.nama AS nama_siswa, t.judul AS judul_tugas, n.nilai, n.keterangan
FROM siswa s
JOIN nilai_siswa ns ON s.nisn = ns.nisn_siswa
JOIN penilaian n ON ns.id_nilai = n.id
JOIN nilai_tugas nt ON n.id = nt.id_nilai
JOIN tugas t ON nt.id_tugas = t.id;

-- Nilai Siswa dalam Mata Pelajaran
SELECT s.nama AS nama_siswa, m.nama AS nama_mapel, n.nilai, n.keterangan
FROM siswa s
JOIN nilai_siswa ns ON s.nisn = ns.nisn_siswa
JOIN penilaian n ON ns.id_nilai = n.id
JOIN nilai_tugas nt ON n.id = nt.id_nilai
JOIN mapel_tugas mt ON nt.id_tugas = mt.id_tugas
JOIN mata_pelajaran m ON mt.id_mapel = m.id;
