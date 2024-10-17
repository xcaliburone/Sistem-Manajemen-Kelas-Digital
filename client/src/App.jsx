import './App.css'
import Dashboard from '/src/Dashboard';

import { useState } from 'react'
import { BrowserRouter as Router, Route, Routes, useNavigate } from 'react-router-dom';

function Login() {
    const [ID, setID] = useState('');
    const [password, setPassword] = useState('');
    const navigate = useNavigate();

    const handleLogin = async (e) => {
        e.preventDefault();
        console.log(`ID: ${ID}, Password: ${password}`);
        
        try {
            const response = await fetch('http://localhost:3048/signin', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ ID, password })
            });
    
            const data = await response.json();
            if (data.success) {
                const employeeId = data.employeeId;
                const role = data.role;
                // Navigasi ke dashboard dengan peran
                navigate(`/dashboard/${employeeId}?role=${role}`);
            } else {
                alert(data.message);
            }
        } catch (error) {
            console.error('Error during login:', error);
            alert('Error connecting to server.');
        }
    }    

    return (
        <>
            <div className='signin'>
                <form className='loginForm' onSubmit={handleLogin}>
                    <h1>Sign In</h1>
                    <label htmlFor="ID">NIP / NISN</label>
                    <input type="text" id='ID' value={ID} onChange={(e) => setID(e.target.value)} autoComplete='ID' />
                    <label htmlFor="password">Password</label>
                    <input type="password" id='password' value={password} onChange={(e) => setPassword(e.target.value)} autoComplete='password' />
                    <button type='submit'>Sign In</button>
                </form>
            </div>

            <div className='signup'>

            </div>
        </>
    )
}

function App() {
    return (
        <Router>
            <Routes>
                <Route path="/" element={<Login />} />
                <Route path="/dashboard/:employeeId" element={<Dashboard />} />
            </Routes>
        </Router>
    )
}

export default App