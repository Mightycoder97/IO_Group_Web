#!/usr/bin/env node
/**
 * Geocode all sedes using Mapbox API
 * Run: node geocode_sedes_mapbox.js
 */

const https = require('https');
const fs = require('fs');

const MAPBOX_TOKEN = 'pk.eyJ1IjoibWlnaHR5Y29kZXIiLCJhIjoiY21sMmlpZm92MGkwYTNjcHY1aXg3YzRrdiJ9.Flaa7i5dlavkb4r8P9opvQ';
const API_BASE = 'https://iogroup.pe/control/api';

// Simple fetch wrapper
function fetch(url) {
    return new Promise((resolve, reject) => {
        https.get(url, (res) => {
            let data = '';
            res.on('data', chunk => data += chunk);
            res.on('end', () => {
                try {
                    resolve(JSON.parse(data));
                } catch (e) {
                    resolve(data);
                }
            });
        }).on('error', reject);
    });
}

// Geocode a single address
async function geocodeAddress(address) {
    const url = `https://api.mapbox.com/geocoding/v5/mapbox.places/${encodeURIComponent(address)}.json?access_token=${MAPBOX_TOKEN}&country=PE&language=es&limit=1`;
    const data = await fetch(url);

    if (data.features && data.features.length > 0) {
        const coords = data.features[0].geometry.coordinates;
        return {
            lat: coords[1],
            lng: coords[0],
            place_name: data.features[0].place_name
        };
    }
    return null;
}

// Sleep helper
const sleep = ms => new Promise(resolve => setTimeout(resolve, ms));

async function main() {
    console.log('Fetching sedes from API...');

    // Get sedes from API (mapa endpoint is public)
    const response = await fetch(`${API_BASE}/sedes.php?mapa=1`);

    if (!response.success || !response.data) {
        console.error('Failed to fetch sedes:', response);
        return;
    }

    const sedes = response.data;
    console.log(`Found ${sedes.length} sedes to geocode\n`);

    const results = [];
    const updates = [];
    const errors = [];

    for (const sede of sedes) {
        const id = sede.id_sede;
        const address = sede.direccion || '';
        const distrito = sede.distrito || '';

        if (!address) {
            console.log(`[${id}] No address, skipping`);
            continue;
        }

        // Build full address
        let fullAddress = address;
        if (distrito) fullAddress += `, ${distrito}`;
        fullAddress += ', Peru';

        process.stdout.write(`[${id}] ${sede.nombre_comercial.substring(0, 30).padEnd(30)} ... `);

        try {
            const result = await geocodeAddress(fullAddress);

            if (result) {
                const coordsGps = `${result.lat.toFixed(6)}, ${result.lng.toFixed(6)}`;
                console.log(`OK -> ${coordsGps}`);

                results.push({
                    id_sede: id,
                    nombre: sede.nombre_comercial,
                    direccion: fullAddress,
                    old_coords: sede.coordenadas_gps,
                    new_coords: coordsGps,
                    lat: result.lat,
                    lng: result.lng
                });

                updates.push(`UPDATE Sede SET coordenadas_gps = '${coordsGps}', fecha_modificacion = NOW() WHERE id_sede = ${id};`);
            } else {
                console.log('NOT FOUND');
                errors.push({ id, address: fullAddress, error: 'No results' });
            }
        } catch (err) {
            console.log(`ERROR: ${err.message}`);
            errors.push({ id, address: fullAddress, error: err.message });
        }

        // Rate limiting
        await sleep(100);
    }

    console.log('\n=== RESULTS ===');
    console.log(`Successfully geocoded: ${results.length}`);
    console.log(`Errors: ${errors.length}`);

    // Generate SQL
    const sqlContent = `-- Mapbox Geocoding Updates - Generated ${new Date().toISOString()}
-- Total updates: ${updates.length}

START TRANSACTION;

${updates.join('\n')}

COMMIT;
`;

    const sqlFile = __dirname + '/geocode_updates.sql';
    fs.writeFileSync(sqlFile, sqlContent);
    console.log(`\nSQL file saved to: ${sqlFile}`);

    // Save JSON results
    const jsonFile = __dirname + '/geocode_results.json';
    fs.writeFileSync(jsonFile, JSON.stringify({
        generated: new Date().toISOString(),
        total_sedes: sedes.length,
        successful: results.length,
        errors: errors.length,
        results,
        error_details: errors
    }, null, 2));
    console.log(`JSON results saved to: ${jsonFile}`);
}

main().catch(console.error);
