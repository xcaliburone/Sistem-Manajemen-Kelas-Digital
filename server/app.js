import express, { json } from 'express';
import { createConnection } from 'mysql2';
import cors from 'cors';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();
const port = 3048;

app.use(express.static(path.join(__dirname, 'public')));
app.use(express.json());
app.use(cors());

// const connection = mysql.createConnection({ host: 'localhost', user: 'root', password: '', database: 'rexdinner' });
const connection = createConnection({
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASSWORD || '',
    database: process.env.DB_NAME || 'smkd'
});

connection.connect((err) => {
    if (err) throw err;
    console.log('Connected to MySQL SMKD Database');
});

app.get('/', (req, res) => {
    res.json({ message: 'Ini root' });
    return res.redirect('/');
});

app.post('/signin', (req, res) => {
    const { ID, password} = req.body;

    // cek di tabel guru kocak
    const guruQuery = 'SELECT * FROM guru WHERE nip = ? AND password = ?';
    connection.query(guruQuery, [ID, password], (err, guruResults) => {
        if(err) {
            console.error(err);
            return res.status(500),json({ success: false, message: 'Internal Server Error' })
        }

        if(guruResults.length > 0) {
            return res.json({
                success: true,
                message: 'Login Berhasil Sebagai Guri',
                employeeId: guruResults[0].nip,
                role: 'guru'
            });
        } else {
            // cek di tabel siswa aja
            const siswaQuery = 'SELECT * FROM siswa WHERE nisn = ? AND password = ?';
            connection.query(querySiswa, [ID, password], (err, siswaResults) => {
                if (err) {
                    console.error(err);
                    return res.status(500).json({ success: false, message: 'Internal server error' });
                }

                if (siswaResults.length > 0) {
                    // Jika ditemukan di tabel siswa
                    return res.json({
                        success: true,
                        message: 'Login berhasil sebagai Siswa',
                        employeeId: siswaResults[0].nisn, // Mengirim NISN sebagai ID unik
                        role: 'siswa'
                    });
                } else {
                    return res.json({ success: false, message: 'ID atau password salah' });
                }
            });
        }
    });
});

app.post('/signup', (req, res) => {
    res.json({ message: 'Ini SignUp' });
});

app.get('/user/:employeeId', (req, res) => {
    const { employeeId } = req.params;

    const queryGuru = 'SELECT nama FROM guru WHERE nip = ?';
    connection.query(queryGuru, [employeeId], (err, guruResults) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ success: false, message: 'Internal server error' });
        }

        if (guruResults.length > 0) {
            return res.json({ nama: guruResults[0].nama, role: 'guru' });
        } else {
            const querySiswa = 'SELECT nama FROM siswa WHERE nisn = ?';
            connection.query(querySiswa, [employeeId], (err, siswaResults) => {
                if (err) {
                    console.error(err);
                    return res.status(500).json({ success: false, message: 'Internal server error' });
                }
                if (siswaResults.length > 0) {
                    return res.json({ nama: siswaResults[0].nama, role: 'siswa' });
                } else {
                    return res.status(404).json({ success: false, message: 'User not found' });
                }
            });
        }
    });
});

app.listen(port, () => {
    console.log(`Server is running at http://localhost:${port}`);
});