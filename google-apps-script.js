/**
 * Google Apps Script para Formulario de Contacto IO Group
 * 
 * INSTRUCCIONES DE CONFIGURACIÓN:
 * 
 * 1. Crear una nueva hoja de Google Sheets en https://sheets.google.com
 * 2. Nombrarla: "Contactos IO Group"
 * 3. En la Fila 1, agregar estos encabezados (uno por columna A-H):
 *    A: Fecha/Hora
 *    B: Nombre
 *    C: Email
 *    D: Teléfono
 *    E: Empresa
 *    F: Servicio
 *    G: Mensaje
 *    H: Estado
 * 
 * 4. Ir a Extensiones > Apps Script
 * 5. Borrar todo el código existente y pegar este archivo completo
 * 6. Guardar (Ctrl+S)
 * 7. Clic en "Implementar" > "Nueva implementación"
 * 8. Tipo: "Aplicación web"
 * 9. Ejecutar como: "Yo mismo"
 * 10. Quién tiene acceso: "Cualquier persona"
 * 11. Clic en "Implementar"
 * 12. Copiar la URL que aparece
 * 13. Pegar la URL en js/main.js línea 88 (reemplazar 'YOUR_GOOGLE_SCRIPT_URL_HERE')
 */

function doPost(e) {
    try {
        // Obtener la hoja activa
        var sheet = SpreadsheetApp.getActiveSpreadsheet().getActiveSheet();

        // Parsear los datos JSON recibidos
        var data = JSON.parse(e.postData.contents);

        // Crear timestamp en zona horaria de Lima
        var timestamp = new Date().toLocaleString('es-PE', {
            timeZone: 'America/Lima',
            year: 'numeric',
            month: '2-digit',
            day: '2-digit',
            hour: '2-digit',
            minute: '2-digit',
            second: '2-digit'
        });

        // Agregar nueva fila con los datos
        sheet.appendRow([
            timestamp,                    // Fecha/Hora
            data.nombre || '',            // Nombre
            data.email || '',             // Email
            data.telefono || '',          // Teléfono
            data.empresa || '',           // Empresa
            data.servicio || '',          // Servicio
            data.mensaje || '',           // Mensaje
            'Nuevo'                       // Estado inicial
        ]);

        // Retornar respuesta de éxito
        return ContentService
            .createTextOutput(JSON.stringify({
                success: true,
                message: 'Datos guardados correctamente'
            }))
            .setMimeType(ContentService.MimeType.JSON);

    } catch (error) {
        // Retornar respuesta de error
        return ContentService
            .createTextOutput(JSON.stringify({
                success: false,
                message: 'Error: ' + error.toString()
            }))
            .setMimeType(ContentService.MimeType.JSON);
    }
}

// Función para probar que el script está funcionando
function doGet(e) {
    return ContentService.createTextOutput(
        'El servicio de formulario IO Group está funcionando correctamente. ' +
        'Fecha: ' + new Date().toLocaleString('es-PE', { timeZone: 'America/Lima' })
    );
}

// Función de prueba para ejecutar desde el editor
function testScript() {
    var testData = {
        postData: {
            contents: JSON.stringify({
                nombre: 'Usuario de Prueba',
                email: 'prueba@ejemplo.com',
                telefono: '+51 999 999 999',
                empresa: 'Empresa Test',
                servicio: 'recojo',
                mensaje: 'Este es un mensaje de prueba para verificar que el script funciona correctamente.'
            })
        }
    };

    var result = doPost(testData);
    Logger.log(result.getContent());
}
