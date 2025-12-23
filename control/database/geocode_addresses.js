/**
 * Script de Geocodificación de Direcciones
 * =========================================
 * Usa OpenStreetMap Nominatim API (GRATIS)
 * 
 * Instrucciones:
 * 1. Asegúrate de tener Node.js instalado
 * 2. Ejecuta: node geocode_addresses.js
 * 3. El script generará un archivo update_coordinates.sql
 * 4. Importa ese archivo en phpMyAdmin
 * 
 * IMPORTANTE: Nominatim tiene un límite de 1 solicitud por segundo
 * El script automáticamente respeta este límite
 */

const fs = require('fs');
const https = require('https');
const path = require('path');

// Configuración
const INPUT_FILE = path.join(__dirname, 'import_data.sql');
const OUTPUT_FILE = path.join(__dirname, 'update_coordinates.sql');
const DELAY_MS = 1100; // 1.1 segundos entre solicitudes (respeta límite Nominatim)

/**
 * Extrae las direcciones del archivo SQL
 * Los INSERTs están en formato multilínea:
 * INSERT INTO Sede (...) VALUES (
 *   (SELECT ...),
 *   'nombre_comercial', 'direccion',
 *   'distrito', 'provincia',
 *   'departamento', ...
 * );
 */
function extractAddresses(sqlContent) {
    const addresses = [];

    // Unir todo y buscar bloques INSERT INTO Sede
    const sedeRegex = /INSERT INTO Sede[^;]+;/gi;
    const matches = sqlContent.match(sedeRegex);

    if (!matches) {
        console.log('No se encontraron INSERTs de Sede');
        return addresses;
    }

    console.log(`   Encontrados ${matches.length} bloques INSERT INTO Sede`);

    for (const match of matches) {
        // Normalizar espacios y saltos de línea
        const normalized = match.replace(/\r?\n/g, ' ').replace(/\s+/g, ' ');

        // Extraer los valores después del SELECT
        // Formato: (SELECT...), 'nombre_comercial', 'direccion', 'distrito', 'provincia', 'departamento', ...
        const valuesMatch = normalized.match(/\(SELECT[^)]+\)\s*,\s*'([^']*)'\s*,\s*'([^']*)'\s*,\s*'([^']*)'\s*,\s*'([^']*)'\s*,\s*'([^']*)'/i);

        if (valuesMatch) {
            const [_, nombreComercial, direccion, distrito, provincia, departamento] = valuesMatch;

            // Construir dirección completa para geocodificación
            // Incluir el distrito, provincia y departamento para mayor precisión
            const fullAddress = `${direccion}, ${distrito}, ${provincia}, ${departamento}, Peru`;

            addresses.push({
                nombreComercial: nombreComercial.trim(),
                direccion: direccion.trim(),
                distrito: distrito.trim(),
                provincia: provincia.trim(),
                departamento: departamento.trim(),
                fullAddress: fullAddress
            });
        }
    }

    return addresses;
}

/**
 * Geocodifica una dirección usando Nominatim
 */
function geocodeAddress(address) {
    return new Promise((resolve, reject) => {
        const encodedAddress = encodeURIComponent(address);
        const url = `https://nominatim.openstreetmap.org/search?q=${encodedAddress}&format=json&limit=1&countrycodes=pe`;

        const options = {
            headers: {
                'User-Agent': 'IOGroup-Geocoder/1.0 (contact@iogroup.pe)',
                'Accept-Language': 'es'
            }
        };

        https.get(url, options, (res) => {
            let data = '';

            res.on('data', chunk => {
                data += chunk;
            });

            res.on('end', () => {
                try {
                    const results = JSON.parse(data);
                    if (results && results.length > 0) {
                        resolve({
                            lat: results[0].lat,
                            lon: results[0].lon,
                            displayName: results[0].display_name
                        });
                    } else {
                        resolve(null);
                    }
                } catch (e) {
                    reject(e);
                }
            });
        }).on('error', reject);
    });
}

/**
 * Espera un tiempo determinado
 */
function delay(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

/**
 * Escapa comillas simples para SQL
 */
function escapeSql(str) {
    return str.replace(/'/g, "''");
}

/**
 * Procesa las direcciones y genera el SQL de actualización
 */
async function processAddresses() {
    console.log('='.repeat(60));
    console.log('IO Group - Geocodificacion de Direcciones');
    console.log('Usando OpenStreetMap Nominatim (Gratuito)');
    console.log('='.repeat(60));
    console.log();

    // Leer archivo SQL
    console.log('Leyendo archivo: ' + INPUT_FILE);
    const sqlContent = fs.readFileSync(INPUT_FILE, 'utf8');

    // Extraer direcciones
    console.log('Extrayendo direcciones de la tabla Sede...');
    const addresses = extractAddresses(sqlContent);
    console.log(`   Total direcciones extraidas: ${addresses.length}\n`);

    if (addresses.length === 0) {
        console.log('No se encontraron direcciones para geocodificar');
        return;
    }

    // Calcular tiempo estimado
    const estimatedMinutes = Math.ceil((addresses.length * DELAY_MS) / 60000);
    console.log(`Tiempo estimado: ~${estimatedMinutes} minutos`);
    console.log('(1 solicitud por segundo para respetar limites de Nominatim)\n');

    // Iniciar archivo SQL de salida
    let outputSQL = `-- ============================================
-- IO Group - Actualizacion de Coordenadas GPS
-- Generado: ${new Date().toISOString()}
-- Total de direcciones procesadas: ${addresses.length}
-- ============================================
-- IMPORTANTE: Ejecutar despues de importar import_data.sql
-- ============================================

`;

    // Estadísticas
    let successCount = 0;
    let failCount = 0;
    const failedAddresses = [];

    console.log('Iniciando geocodificacion...\n');

    // Procesar cada dirección
    for (let i = 0; i < addresses.length; i++) {
        const addr = addresses[i];
        const progress = `[${String(i + 1).padStart(4)}/${addresses.length}]`;
        const shortName = addr.nombreComercial.substring(0, 35).padEnd(35);

        process.stdout.write(`${progress} ${shortName} `);

        try {
            const coords = await geocodeAddress(addr.fullAddress);

            if (coords) {
                const gpsCoords = `${coords.lat},${coords.lon}`;

                // Generar UPDATE SQL
                outputSQL += `-- ${addr.nombreComercial}
UPDATE Sede 
SET coordenadas_gps = '${gpsCoords}'
WHERE nombre_comercial = '${escapeSql(addr.nombreComercial)}' 
  AND direccion = '${escapeSql(addr.direccion)}'
  AND coordenadas_gps IS NULL;

`;
                successCount++;
                console.log(`OK ${gpsCoords}`);
            } else {
                // Intentar con dirección simplificada (solo distrito)
                const simpleAddress = `${addr.distrito}, ${addr.departamento}, Peru`;
                const coords2 = await geocodeAddress(simpleAddress);

                if (coords2) {
                    const gpsCoords = `${coords2.lat},${coords2.lon}`;
                    outputSQL += `-- ${addr.nombreComercial} (aproximado a distrito)
UPDATE Sede 
SET coordenadas_gps = '${gpsCoords}'
WHERE nombre_comercial = '${escapeSql(addr.nombreComercial)}' 
  AND direccion = '${escapeSql(addr.direccion)}'
  AND coordenadas_gps IS NULL;

`;
                    successCount++;
                    console.log(`~ ${gpsCoords} (distrito)`);
                } else {
                    failedAddresses.push(addr);
                    failCount++;
                    console.log('X No encontrado');
                }
            }
        } catch (error) {
            failedAddresses.push(addr);
            failCount++;
            console.log(`X Error: ${error.message.substring(0, 30)}`);
        }

        // Esperar antes de la siguiente solicitud
        if (i < addresses.length - 1) {
            await delay(DELAY_MS);
        }
    }

    // Agregar sección de direcciones fallidas
    if (failedAddresses.length > 0) {
        outputSQL += `
-- ============================================
-- DIRECCIONES NO GEOCODIFICADAS
-- Estas direcciones no pudieron ser encontradas
-- Puedes actualizarlas manualmente
-- ============================================
`;
        for (const addr of failedAddresses) {
            outputSQL += `-- ${addr.nombreComercial}: ${addr.fullAddress}
-- UPDATE Sede SET coordenadas_gps = 'LAT,LON' WHERE nombre_comercial = '${escapeSql(addr.nombreComercial)}';

`;
        }
    }

    // Guardar archivo SQL
    fs.writeFileSync(OUTPUT_FILE, outputSQL, 'utf8');

    // Resumen
    console.log('\n' + '='.repeat(60));
    console.log('RESUMEN');
    console.log('='.repeat(60));
    console.log(`   Geocodificadas exitosamente: ${successCount}`);
    console.log(`   No encontradas/errores: ${failCount}`);
    console.log(`   Archivo generado: ${OUTPUT_FILE}`);
    console.log();
    console.log('SIGUIENTE PASO:');
    console.log('   1. Abre phpMyAdmin en Hostinger');
    console.log('   2. Selecciona tu base de datos');
    console.log('   3. Ve a la pestana "Importar"');
    console.log('   4. Sube el archivo: update_coordinates.sql');
    console.log('='.repeat(60));
}

// Ejecutar
processAddresses().catch(console.error);
