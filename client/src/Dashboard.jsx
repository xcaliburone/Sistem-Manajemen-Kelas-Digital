import { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';

function Dashboard() {
    const { employeeId } = useParams();
    const [userData, setUserData] = useState(null);

    useEffect(() => {
        const fetchUserData = async () => {
            try {
                const response = await fetch(`http://localhost:3048/user/${employeeId}`);
                const data = await response.json();
                setUserData(data); // Siman data pengguna di state
            } catch (error) {
                console.error('Error fetching user data:', error);
            }
        };
        fetchUserData();
    }, [employeeId]);

    return (
        <div>
            <h1>Dashboard</h1>
            {userData ? (
                <>
                    <h1>Selamat datang, {userData.nama}</h1>
                    <h2>Sebagai, {userData.role}</h2>
                </>
            ) : (
                <p>Loading...</p>
            )}
        </div>
    );
}

export default Dashboard;