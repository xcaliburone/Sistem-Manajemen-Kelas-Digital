import express from 'express';
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
    res.json({ message: 'Ini SignIn' });
});

app.post('/signup', (req, res) => {
    res.json({ message: 'Ini SignUp' });
});

app.listen(port, () => {
    console.log(`Server is running at http://localhost:${port}`);
});