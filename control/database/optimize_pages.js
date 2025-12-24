/**
 * Script para optimizar todas las páginas HTML del control
 * Agrega meta tags de rendimiento y PWA
 */

const fs = require('fs');
const path = require('path');

const pagesDir = path.join(__dirname, '..', 'public', 'pages');

// Meta tags a agregar para optimización
const optimizationMeta = `    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0, user-scalable=yes">
    <meta name="theme-color" content="#1B5E20">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">`;

const preconnectTags = `    <!-- Preconnect para optimizar carga -->
    <link rel="preconnect" href="https://cdn.jsdelivr.net" crossorigin>`;

// Función recursiva para encontrar archivos HTML
function findHtmlFiles(dir, files = []) {
    const items = fs.readdirSync(dir);
    for (const item of items) {
        const fullPath = path.join(dir, item);
        if (fs.statSync(fullPath).isDirectory()) {
            findHtmlFiles(fullPath, files);
        } else if (item.endsWith('.html')) {
            files.push(fullPath);
        }
    }
    return files;
}

// Optimizar un archivo HTML
function optimizeHtml(filePath) {
    let content = fs.readFileSync(filePath, 'utf8');
    const fileName = path.relative(pagesDir, filePath);

    // Verificar si ya está optimizado
    if (content.includes('maximum-scale=5.0')) {
        console.log(`✓ Ya optimizado: ${fileName}`);
        return false;
    }

    // Reemplazar viewport básico por el optimizado
    content = content.replace(
        /<meta name="viewport" content="width=device-width, initial-scale=1\.0">/,
        optimizationMeta
    );

    // Agregar preconnect después del título si no existe
    if (!content.includes('preconnect')) {
        content = content.replace(
            /(<title>.*?<\/title>)/,
            `$1\n${preconnectTags}`
        );
    }

    // Actualizar año en copyright si existe
    content = content.replace(/© 2024/g, '© 2025');

    fs.writeFileSync(filePath, content, 'utf8');
    console.log(`✅ Optimizado: ${fileName}`);
    return true;
}

// Ejecutar
console.log('🚀 Optimizando páginas HTML...\n');

const htmlFiles = findHtmlFiles(pagesDir);
let optimized = 0;
let skipped = 0;

for (const file of htmlFiles) {
    if (optimizeHtml(file)) {
        optimized++;
    } else {
        skipped++;
    }
}

console.log(`\n📊 Resumen:`);
console.log(`   - Total archivos: ${htmlFiles.length}`);
console.log(`   - Optimizados: ${optimized}`);
console.log(`   - Ya optimizados: ${skipped}`);
console.log('\n✨ ¡Optimización completada!');
