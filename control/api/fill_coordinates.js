const mysql = require('mysql2/promise');
const https = require('https');
const fs = require('fs');
const path = require('path');

// DB Credentials from config.php (Hardcoded for this script based on reading config.php)
const DB_CONFIG = {
    host: 'localhost',
    user: 'u511863531_Sebastian',
    password: 'Sebas0920%',
    database: 'u511863531_IOGroupBD',
    port: 3306
};

// Read API Key
let GOOGLE_API_KEY = '';
try {
    const configPath = path.resolve(__dirname, '../public/js/config.js');
    if (fs.existsSync(configPath)) {
        const configContent = fs.readFileSync(configPath, 'utf8');
        const match = configContent.match(/GOOGLE_MAPS_API_KEY:\s*'([^']+)'/);
        if (match && match[1]) {
            GOOGLE_API_KEY = match[1];
        }
    }
} catch (e) {
    console.error('Error reading config:', e);
}

if (!GOOGLE_API_KEY) {
    console.error('GOOGLE_API_KEY not found!');
    process.exit(1);
}

// Fetch wrapper
function fetch(url) {
    return new Promise((resolve, reject) => {
        https.get(url, (res) => {
            let data = '';
            res.on('data', chunk => data += chunk);
            res.on('end', () => {
                try {
                    resolve(JSON.parse(data));
                } catch (e) {
                    resolve(data); // Return raw if not JSON
                }
            });
        }).on('error', reject);
    });
}

async function geocodeAddress(address) {
    const url = `https://maps.googleapis.com/maps/api/geocode/json?address=${encodeURIComponent(address)}&key=${GOOGLE_API_KEY}&region=pe&language=es`;
    try {
        const data = await fetch(url);
        if (data.status === 'OK' && data.results && data.results.length > 0) {
            const location = data.results[0].geometry.location;
            return `${location.lat.toFixed(6)}, ${location.lng.toFixed(6)}`;
        }
        if (data.status === 'ZERO_RESULTS') return null;
        console.log('Geocoding error:', data.status, data.error_message);
        return null;
    } catch (e) {
        console.error('Fetch error:', e.message);
        return null;
    }
}

async function main() {
    let connection;
    try {
        connection = await mysql.createConnection(DB_CONFIG);
        console.log('Connected to database.');

        // Get sedes without coordinates
        const [rows] = await connection.execute(
            "SELECT id_sede, nombre_comercial, direccion, distrito FROM Sede WHERE (coordenadas_gps IS NULL OR coordenadas_gps = '') AND activo = 1"
        );

        console.log(`Found ${rows.length} sedes without coordinates.`);

        for (const sede of rows) {
            let fullAddress = sede.direccion;
            if (sede.distrito && !fullAddress.toLowerCase().includes(sede.distrito.toLowerCase())) {
                fullAddress += `, ${sede.distrito}`;
            }
            fullAddress += ', Peru';

            console.log(`Geocoding [${sede.id_sede}] ${sede.nombre_comercial}: ${fullAddress}...`);

            const coords = await geocodeAddress(fullAddress);

            if (coords) {
                console.log(`  -> Found: ${coords}`);
                await connection.execute(
                    "UPDATE Sede SET coordenadas_gps = ? WHERE id_sede = ?",
                    [coords, sede.id_sede]
                );
            } else {
                console.log(`  -> Not found.`);
            }

            // Rate limit
            await new Promise(r => setTimeout(r, 200));
        }

        console.log('Done.');

    } catch (err) {
        console.error('Error:', err);
    } finally {
        if (connection) connection.end();
    }
}

main();
