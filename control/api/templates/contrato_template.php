<?php
/**
 * Plantilla HTML del Contrato de Servicio IO Group
 * Recibe $datos (array con cliente, empresa, sede, contrato)
 * y $numero_contrato (string)
 * Retorna el HTML completo del contrato.
 */

if (!isset($datos) || !isset($numero_contrato)) {
    return '<p>Error: datos no proporcionados.</p>';
}

// Helper: formatear fecha de ISO a texto legible
function formatearFechaContrato($fecha_iso) {
    if (empty($fecha_iso)) return '_______________';
    $meses = [
        1 => 'ENERO', 2 => 'FEBRERO', 3 => 'MARZO', 4 => 'ABRIL',
        5 => 'MAYO', 6 => 'JUNIO', 7 => 'JULIO', 8 => 'AGOSTO',
        9 => 'SEPTIEMBRE', 10 => 'OCTUBRE', 11 => 'NOVIEMBRE', 12 => 'DICIEMBRE'
    ];
    $ts = strtotime($fecha_iso);
    if (!$ts) return $fecha_iso;
    $dia = date('d', $ts);
    $mes = $meses[(int)date('n', $ts)];
    $anio = date('Y', $ts);
    return "{$dia} de {$mes} del {$anio}";
}

// Helper: frecuencia a texto
function frecuenciaTexto($freq) {
    $map = [
        'diario' => 'DIARIO',
        'semanal' => 'SEMANAL',
        'quincenal' => 'QUINCENAL',
        'mensual' => 'MENSUAL',
        'bimestral' => 'BIMESTRAL',
        'trimestral' => 'TRIMESTRAL',
        'eventual' => 'EVENTUAL',
    ];
    return $map[strtolower($freq)] ?? strtoupper($freq);
}

// Extract data
$cliente_nombre = htmlspecialchars($datos['cliente']['nombre'] ?? '_______________', ENT_QUOTES);
$cliente_tipo_doc = htmlspecialchars($datos['cliente']['tipo_documento'] ?? 'DNI', ENT_QUOTES);
$cliente_dni = htmlspecialchars($datos['cliente']['dni'] ?? '_______________', ENT_QUOTES);

$empresa_razon = htmlspecialchars($datos['empresa']['razon_social'] ?? '_______________', ENT_QUOTES);
$empresa_ruc = htmlspecialchars($datos['empresa']['ruc'] ?? '_______________', ENT_QUOTES);
$empresa_dir = htmlspecialchars($datos['empresa']['direccion_fiscal'] ?? '_______________', ENT_QUOTES);

$sede_nombre = htmlspecialchars($datos['sede']['nombre_comercial'] ?? '_______________', ENT_QUOTES);
$sede_dir = htmlspecialchars($datos['sede']['direccion'] ?? '_______________', ENT_QUOTES);
$sede_distrito = htmlspecialchars($datos['sede']['distrito'] ?? '', ENT_QUOTES);
$sede_provincia = htmlspecialchars($datos['sede']['provincia'] ?? '', ENT_QUOTES);

$tarifa = $datos['contrato']['tarifa'] ?? '0';
$frecuencia = frecuenciaTexto($datos['contrato']['frecuencia'] ?? 'mensual');
$tipo_tarifa = $datos['contrato']['tipo_tarifa'] ?? 'por_servicio';
$peso_limite = $datos['contrato']['peso_limite_kg'] ?? '15';
$tarifa_adicional = $datos['contrato']['tarifa_adicional_kg'] ?? '7.00';
$fecha_inicio = $datos['contrato']['fecha_inicio'] ?? '';
$fecha_fin = $datos['contrato']['fecha_fin'] ?? '';

$fecha_inicio_texto = formatearFechaContrato($fecha_inicio);
$fecha_fin_texto = formatearFechaContrato($fecha_fin);

// Sede full address string
$sede_full = $sede_dir;
if (!empty($sede_distrito)) $sede_full .= ' - ' . $sede_distrito;
if (!empty($sede_provincia)) $sede_full .= ', ' . $sede_provincia;

// Logo path (works both on server and locally)
$logo_path = realpath(__DIR__ . '/../../public/img/logo_io_group.png');
$logo_base64 = '';
if ($logo_path && file_exists($logo_path)) {
    $logo_base64 = 'data:image/png;base64,' . base64_encode(file_get_contents($logo_path));
}

// Watermark: use the semi-transparent version
$watermark_path = realpath(__DIR__ . '/../../public/img/logo_io_group.png');
$watermark_base64 = $logo_base64; // reuse same logo for watermark

// Build HTML
ob_start();
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contrato <?= $numero_contrato ?> - IO Group</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Merriweather:ital,wght@0,300;0,400;0,700;1,400&family=Open+Sans:wght@400;600;700&display=swap');

        :root {
            --primary: #1B5E20;
            --primary-light: #4CAF50;
            --dark: #263238;
            --gray: #546E7A;
            --light-bg: #FAFAFA;
            --border: #CFD8DC;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        @page {
            size: A4;
            margin: 10mm;
        }

        body {
            font-family: 'Open Sans', 'Segoe UI', Arial, sans-serif;
            font-size: 7.5pt;
            line-height: 1.35;
            color: var(--dark);
            background: #e8e8e8;
        }

        .contract-page {
            width: 210mm;
            min-height: 297mm;
            margin: 20px auto;
            padding: 10mm 12mm 12mm 12mm;
            background: white;
            box-shadow: 0 4px 24px rgba(0,0,0,0.12);
            position: relative;
            overflow: hidden;
        }

        /* Watermark */
        .contract-page::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 400px;
            height: 180px;
            background-image: url('<?= $watermark_base64 ?>');
            background-size: contain;
            background-repeat: no-repeat;
            background-position: center;
            opacity: 0.06;
            pointer-events: none;
            z-index: 0;
        }

        .contract-page > * {
            position: relative;
            z-index: 1;
        }

        /* Header */
        .contract-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 3px solid var(--primary);
            padding-bottom: 8px;
            margin-bottom: 10px;
        }

        .contract-header .logo {
            height: 38px;
        }

        .contract-header .contract-number {
            text-align: right;
            font-size: 7.5pt;
            color: var(--gray);
        }

        .contract-header .contract-number strong {
            display: block;
            font-size: 9pt;
            color: var(--primary);
        }

        /* Title */
        .contract-title {
            text-align: center;
            font-family: 'Merriweather', Georgia, serif;
            font-size: 8.5pt;
            font-weight: 700;
            color: var(--primary);
            margin: 6px 0 8px;
            letter-spacing: 0.3px;
            line-height: 1.3;
        }

        /* Two-column layout */
        .two-columns {
            column-count: 2;
            column-gap: 14px;
            column-rule: 1px solid #e0e0e0;
        }

        .two-columns .clause-header,
        .two-columns .clause-title,
        .two-columns .clause-body {
            break-inside: avoid-column;
        }

        .full-width {
            column-span: all;
        }

        /* Clauses */
        .clause-header {
            font-family: 'Merriweather', Georgia, serif;
            font-weight: 700;
            font-size: 7pt;
            color: var(--primary);
            margin-top: 5px;
            margin-bottom: 0px;
        }

        .clause-title {
            font-weight: 700;
            font-size: 7pt;
            color: var(--dark);
            text-decoration: underline;
            margin-bottom: 2px;
        }

        .clause-body {
            text-align: justify;
            margin-bottom: 3px;
            font-size: 7pt;
        }

        .clause-body p {
            margin-bottom: 2px;
        }

        /* Dynamic data highlight */
        .dato-dinamico {
            font-weight: 700;
            color: #1a1a1a;
        }

        /* Sub-items (lettered or numbered) */
        .clause-items {
            list-style: lower-alpha;
            padding-left: 16px;
            margin: 3px 0 5px;
        }

        .clause-items li {
            margin-bottom: 1px;
            text-align: justify;
            font-size: 7pt;
        }

        .clause-items-roman {
            list-style: lower-roman;
            padding-left: 16px;
            margin: 3px 0 5px;
        }

        .clause-items-roman li {
            margin-bottom: 1px;
            text-align: justify;
            font-size: 7pt;
        }

        /* Notes area */
        .notes-box {
            background: #f5f7f5;
            border-left: 3px solid var(--primary-light);
            padding: 4px 8px;
            margin: 4px 0;
            font-size: 6.5pt;
            color: var(--gray);
            column-span: all;
        }

        /* Signature block */
        .signature-block {
            display: flex;
            justify-content: space-around;
            margin-top: 15px;
            page-break-inside: avoid;
            column-span: all;
        }

        .signature-col {
            text-align: center;
            width: 40%;
        }

        .signature-line {
            border-top: 1px solid #333;
            margin-top: 25px;
            padding-top: 4px;
            font-size: 7pt;
            font-weight: 700;
        }

        .signature-label {
            font-size: 6.5pt;
            color: var(--gray);
            margin-top: 1px;
        }

        /* Page break */
        .page-break {
            page-break-before: always;
            margin-top: 0;
        }

        /* Section separator */
        .section-sep {
            border: none;
            border-top: 1px solid var(--border);
            margin: 8px 0;
        }

        /* Anexo / Specifications */
        .anexo-title {
            text-align: center;
            font-family: 'Merriweather', Georgia, serif;
            font-size: 7.5pt;
            font-weight: 700;
            color: var(--primary);
            margin: 5px 0 6px;
            line-height: 1.3;
        }

        .anexo-section {
            font-weight: 700;
            color: var(--primary);
            font-size: 7pt;
            margin-top: 4px;
            margin-bottom: 1px;
            border-bottom: 1px solid var(--border);
            padding-bottom: 1px;
        }

        /* Carta Aval section */
        .aval-title {
            text-align: center;
            font-family: 'Merriweather', Georgia, serif;
            font-size: 11pt;
            font-weight: 700;
            color: var(--primary);
            margin: 12px 0;
        }

        /* Footer */
        .contract-footer {
            text-align: center;
            font-size: 6.5pt;
            color: #90A4AE;
            border-top: 1px solid var(--border);
            padding-top: 5px;
            margin-top: 15px;
        }

        /* Print styles */
        @media print {
            body {
                background: white;
                margin: 0;
                padding: 0;
            }

            .contract-page {
                width: 100%;
                margin: 0;
                padding: 0;
                box-shadow: none;
                min-height: auto;
                overflow: visible;
            }

            .page-break {
                padding-top: 0;
                margin-top: 0;
            }

            .no-print {
                display: none !important;
            }

            .contract-page::before {
                position: fixed;
            }
        }

        /* Responsive for screen preview */
        @media screen and (max-width: 800px) {
            .contract-page {
                width: 100%;
                padding: 15px;
                margin: 10px auto;
            }
        }
    </style>
</head>
<body>

<div class="contract-page">
    <!-- Header -->
    <div class="contract-header">
        <div>
            <?php if ($logo_base64): ?>
                <img src="<?= $logo_base64 ?>" class="logo" alt="IO Group">
            <?php else: ?>
                <strong style="font-size: 16pt; color: var(--primary);">IO GROUP E.I.R.L</strong>
            <?php endif; ?>
        </div>
        <div class="contract-number">
            Contrato N°<br>
            <strong><?= $numero_contrato ?></strong>
        </div>
    </div>

    <!-- Title -->
    <div class="contract-title">
        CONTRATO DE SERVICIO DE RECOJO, TRASLADO, TRATAMIENTO<br>
        Y DISPOSICIÓN FINAL DE RESIDUOS SÓLIDOS BIOCONTAMINADOS
    </div>

    <!-- Two-column content starts here -->
    <div class="two-columns">

    <!-- Introductory paragraph -->
    <div class="clause-body">
        <p>Conste por el presente documento el Contrato de Servicio de Recojo, Traslado, Tratamiento y Disposición Final de Residuos Sólidos Biocontaminados que celebran de una parte, <span class="dato-dinamico">LA EMPRESA IO GROUP E.I.R.L.</span>, con RUC N.º 20604489726 y domicilio en Av. Ignacio Merino 2608, distrito de Lince, provincia de Lima debidamente representada por su Gerente General Sra. NORY ANN ELIZABETH ENCISO ESPINOZA, identificada con DNI N.º 72975063, según poderes inscritos en la Partida N°14268262 del Registro de Personas Jurídicas de la Oficina Registral de Lima, a quien en lo sucesivo se le denominará LA EMPRESA; y, de <span class="dato-dinamico"><?= $empresa_razon ?></span> con RUC N.º <span class="dato-dinamico"><?= $empresa_ruc ?></span>; con domicilio <span class="dato-dinamico"><?= $empresa_dir ?></span>, representada por su Gerente General <span class="dato-dinamico"><?= $cliente_nombre ?></span> con <?= $cliente_tipo_doc ?>: <span class="dato-dinamico"><?= $cliente_dni ?></span>; a quien en lo sucesivo se le denominará EL CLIENTE; bajo los siguientes términos y condiciones:</p>
    </div>

    <!-- PRIMERA -->
    <div class="clause-header">PRIMERA:</div>
    <div class="clause-title">ANTECEDENTES</div>
    <div class="clause-body">
        <p>LA EMPRESA es una persona jurídica que presta el servicio de gestión de residuos sólidos biocontaminados, para lo cual tiene una alianza con Inversiones Ónix E.I.R.L la cual está autorizada por el MINAM bajo el registro autoritativo de empresa operadora de residuos sólidos EO-RS-0089-19-150119 e Incineragas E.I.R.L autorizada por MINAM con el registro Autoritativo de Empresa Operadora de Residuos Sólidos EO-RS-0261-19-150119 y la resolución de subgerencia N.º 014-2017-MML/GSC GS-SGA para realizar las actividades que se detallen en el objeto del contrato.</p>
        <p>EL CLIENTE es una persona JURÍDICA dedicada al servicio de atención médica para lo cual cuenta con las licencias y autorizaciones respectivas.</p>
    </div>

    <!-- SEGUNDA -->
    <div class="clause-header">SEGUNDA:</div>
    <div class="clause-title">OBJETO DEL CONTRATO</div>
    <div class="clause-body">
        <p>Por el presente contrato, de naturaleza civil, EL CLIENTE contrata los servicios de LA EMPRESA para que brinde el servicio de Recojo, Traslado, Tratamiento por el método de Incineración y Disposición Final de Residuos sólidos biocontaminados derivados y/o generados por la actividad, dichos residuos serán recolectados en:</p>
        <p><span class="dato-dinamico"><?= $sede_full ?></span>. LA EMPRESA declara que las asociadas cuentan con las licencias, autorizaciones y requisitos que las normas ambientales establecen para el servicio que se ofrece y para el que se le contrata; asimismo, que conoce y dará fiel cumplimiento a las disposiciones municipales que regulan y autorizan la forma, horario, los lugares y en general toda normatividad sobre la materia referida al Tratamiento de los Residuos biocontaminados.</p>
    </div>

    <!-- TERCERA -->
    <div class="clause-header">TERCERA:</div>
    <div class="clause-title">MONTO DEL CONTRATO</div>
    <div class="clause-body">
        <p>El monto por pagarse es de <span class="dato-dinamico">S/<?= $tarifa ?></span> Incluido I.G.V., dicho precio también cuenta además con la entrega del Manifiesto respectivo (1), el cual deberá ser firmado y sellado correctamente por EL CLIENTE para luego ser declarado a la DIRIS de su sector. Cantidad que será pagada en efectivo, yape o plin (932223039) o transferencia a las siguientes cuentas, BBVA:0011 0356 0100034367 CCI: 011 356 00010003436731 / BCP: 1939617447027 CCI: 00219300961744702716 a nombre de LA EMPRESA.</p>
        <p>El servicio será prestado de manera <span class="dato-dinamico"><?= $frecuencia ?></span>, el cual podrá incrementarse en número y frecuencia de acuerdo con las necesidades de EL CLIENTE; para lo cual este deberá comunicar su requerimiento a LA EMPRESA a finales del mes para que pueda ser tomado en cuenta para la siguiente programación mediante el correo naenciso@iogroup.pe o WhatsApp al 997571262. El límite de peso para cada servicio será <span class="dato-dinamico"><?= $peso_limite ?>(KG)</span> (2).</p>
    </div>

    <!-- CUARTA -->
    <div class="clause-header">CUARTA:</div>
    <div class="clause-title">FORMA Y OPORTUNIDAD DE PAGO</div>
    <div class="clause-body">
        <p>El pago por el servicio será realizado cada vez que se preste o sean prestados, en efectivo, Yape o Plin a nombre de LA EMPRESA y su comunicación vía WhatsApp al 997571262 para el envío de las constancias. En caso de retraso por más de 3 días calendario EL CLIENTE quedará automáticamente constituido en mora y dará lugar al pago de S/.1.00 por cada día de retraso (3). Si EL CLIENTE anula el presente contrato de forma unilateral deberá pagar una penalidad equivalente al costo de S/700 inc IGV. La resolución del contrato por incumplimiento deberá ser comunicada a DIGESA.</p>
        <p>EL CLIENTE está obligado a requerir como mínimo un servicio dentro de la frecuencia establecida. En caso no lo requiera, este acepta realizar el pago de la penalidad a LA EMPRESA por el equivalente a un servicio.</p>
    </div>

    <!-- QUINTA -->
    <div class="clause-header">QUINTA:</div>
    <div class="clause-title">CARACTERES Y FORMA DE PRESTAR EL SERVICIO</div>
    <div class="clause-body">
        <p>La prestación del servicio de recojo de los residuos sólidos biocontaminados se hará en el local señalado por EL CLIENTE en el día y hora que se acuerde, siempre y cuando esté dentro del horario de LA EMPRESA (9:00 a.m. a 6:00 p.m.). El tratamiento de los residuos a través del método de incineración se efectuará en los hornos de INCINERAGAS, lo cual es técnicamente factible alcanzando niveles de temperatura que garantice la incineración total de los residuos, una vez que son tratados y destruidos, las cenizas resultantes serán trasladadas al relleno sanitario por cuenta de LA EMPRESA conforme a la normativa vigente.</p>
    </div>

    <div class="notes-box">
        <strong>Notas:</strong><br>
        (1) En caso no se haya cancelado el servicio hasta el momento del recojo, no se dejará el manifiesto correspondiente.<br>
        (2) En caso se supere el límite de peso se cobrará S/ <span class="dato-dinamico"><?= $tarifa_adicional ?></span> incluido IGV por kilogramo excedente.<br>
        (3) Los días de retraso se contarán a partir del envío de la factura.
    </div>

    <!-- SEXTA -->
    <div class="clause-header">SEXTA:</div>
    <div class="clause-title">PLAZO DEL CONTRATO</div>
    <div class="clause-body">
        <p>Las partes convienen en que el presente contrato entrará en vigor a la suscripción, el plazo será de 12 MESES forzoso para ambas partes, el mismo que será contado desde la suscripción de este, siendo renovado de manera automática y unilateral a menos que EL CLIENTE solicite cancelación del presente contrato con una anticipación de 15 días hábiles previos de la terminación de este.</p>
    </div>

    <!-- SÉPTIMA -->
    <div class="clause-header">SÉPTIMA:</div>
    <div class="clause-title">RESPONSABILIDAD DEL CLIENTE</div>
    <div class="clause-body">
        <ol class="clause-items" type="a">
            <li>Recolectar y almacenar los residuos sólidos biocontaminados en una forma adecuada que permita a LA EMPRESA un recojo, traslado y transporte correcto de los mismos.</li>
            <li>Las bolsas rojas y contenedores deberán estar cerradas correctamente.</li>
            <li>Verificar que los residuos hayan sido recogidos en su totalidad para dar conformidad con el nombre y firma en el manifiesto respectivo.</li>
            <li>EL CLIENTE deberá cumplir con la frecuencia establecida en el presente contrato. Si EL CLIENTE estuviera ausente o cerrado el lugar de la prestación del servicio, se entenderá por hecho el cobro del costo operativo equivalente al 50% de su tarifa, lo cual será comunicado al cliente en la forma correspondiente.</li>
            <li>La recolección y almacenaje de los residuos será con personal propio.</li>
            <li>Realizar el pago de los servicios en la forma y oportunidad acordada.</li>
            <li>En caso de que haya incumplimiento por parte de EL CLIENTE en alguna de las cláusulas de este contrato o se resuelva el mismo, LA EMPRESA comunicará a la DIRIS de su sector, de igual manera a la Municipalidad Distrital al que corresponda y a DIGESA-MINAM para que tomen las medidas disciplinarias y administrativas que corresponda.</li>
        </ol>
    </div>

    <!-- OCTAVA -->
    <div class="clause-header">OCTAVA:</div>
    <div class="clause-title">RESPONSABILIDAD DE LA EMPRESA</div>
    <div class="clause-body">
        <ol class="clause-items" type="a">
            <li>Se compromete a realizar el recojo de residuos Biocontaminados en el día y dentro del plazo de horario acordado.</li>
            <li>Se compromete a avisar a EL CLIENTE de forma oportuna y con anticipación el día de su fecha de recojo programada.</li>
            <li>Se compromete a dejar el Manifiesto en el establecimiento del cliente el día del recojo siempre y cuando este haya cancelado el servicio el día del recojo.</li>
            <li>Se compromete a cumplir con la normatividad y ley vigente del recojo de residuos sólidos Biocontaminados LA NORMA TÉCNICA SANITARIA N° 144 MINSA/DIGESA.</li>
            <li>LA EMPRESA no hace responsable a EL CLIENTE de cualquier manejo inadecuado de los residuos sólidos biocontaminados, siempre y cuando haya cumplido con la cláusula séptima.</li>
            <li>EL CLIENTE será el único responsable frente a LA EMPRESA y a terceros, por todos los daños que ocasione la disposición de residuos que no correspondan a los contratados en el presente contrato, estando obligado en este caso a resarcir el íntegro del daño y los gastos ocasionados, sin perjuicio de poder resolverse el presente contrato.</li>
        </ol>
    </div>

    <!-- NOVENA -->
    <div class="clause-header">NOVENA:</div>
    <div class="clause-title">RESOLUCIÓN DEL CONTRATO</div>
    <div class="clause-body">
        <p>Puede convenirse expresamente que el contrato se resuelva cuando una de las partes no cumple determinada prestación a su cargo, establecidas con toda precisión. La resolución se produce de pleno derecho cuando la parte interesada comunica a la otra que quiere valerse de la cláusula resolutoria, como lo establece el artículo 1430 del código civil. La causal de la resolución tendrá que ser comunicada a LA EMPRESA mediante una carta notarial con 15 días de anticipación, sin perjuicio de la obligación de pago del servicio(s) que se hayan realizado antes de la resolución.</p>
    </div>

    <!-- DÉCIMA -->
    <div class="clause-header">DÉCIMA:</div>
    <div class="clause-title">APLICACIÓN SUPLETORIA DE LA LEY</div>
    <div class="clause-body">
        <p>En lo no previsto por las partes en el presente contrato, ambas se someten a lo establecido por las normas del Código Civil y demás del sistema jurídico que resulten aplicables.</p>
    </div>

    <hr class="section-sep full-width">

    <div class="clause-body full-width" style="text-align: center; margin-top: 10px;">
        <p>En señal de conformidad, las partes suscriben este documento en la ciudad de Lima el <span class="dato-dinamico"><?= $fecha_inicio_texto ?></span>.</p>
    </div>

    </div><!-- end two-columns -->

    <!-- Signatures -->
    <div class="signature-block">
        <div class="signature-col">
            <div class="signature-line">EL CLIENTE</div>
            <div class="signature-label"><?= $cliente_nombre ?><br><?= $cliente_tipo_doc ?>: <?= $cliente_dni ?></div>
        </div>
        <div class="signature-col">
            <div class="signature-line">LA EMPRESA</div>
            <div class="signature-label">IO GROUP E.I.R.L<br>RUC: 20604489726</div>
        </div>
    </div>
</div>

<!-- PAGE 2: ESPECIFICACIONES -->
<div class="contract-page page-break">
    <div class="contract-header">
        <div>
            <?php if ($logo_base64): ?>
                <img src="<?= $logo_base64 ?>" class="logo" alt="IO Group">
            <?php else: ?>
                <strong style="font-size: 16pt; color: var(--primary);">IO GROUP E.I.R.L</strong>
            <?php endif; ?>
        </div>
        <div class="contract-number">
            Contrato N°<br>
            <strong><?= $numero_contrato ?></strong>
        </div>
    </div>

    <div class="anexo-title">
        ESPECIFICACIONES POR LA PRESTACIÓN DEL SERVICIO DE RECOLECCIÓN Y TRANSPORTE,<br>
        TRATAMIENTO Y DISPOSICIÓN FINAL DE RESIDUOS PELIGROSOS Y BIOCONTAMINADOS
    </div>

    <div class="two-columns">

    <div class="clause-body">
        <p>I-O Group E.I.R.L es una empresa jurídica que presta el servicio de gestión de residuos sólidos biocontaminados que se enfoca en el bienestar de nuestros clientes a través de una adecuada gestión de residuos biocontaminados; con la finalidad de velar por la Salud Humana y el Medio Ambiente. Asimismo, formamos una alianza con las empresas Inversiones ONIX E.I.R.L e INCINERAGAS E.I.R.L, empresas autorizadas debidamente por el MINAM como Operadoras de Residuos Sólidos EO-RS.</p>
    </div>

    <div class="anexo-section">COSTO DEL SERVICIO</div>
    <div class="clause-body">
        <p>Nuestras cotizaciones están realizadas de acuerdo a la información, preferencia y necesidad de EL CLIENTE.</p>
    </div>

    <div class="anexo-section">HORARIOS DE ATENCIÓN</div>
    <div class="clause-body">
        <p>La recolección de los residuos biocontaminados serán realizados dentro del siguiente horario: De lunes a sábado de 9:00 am a 6:00 pm.</p>
    </div>

    <div class="anexo-section">PLANIFICACIÓN DEL SERVICIO</div>
    <div class="clause-body">
        <p>LA EMPRESA se comunicará con EL CLIENTE en un lapso de 24h antes del servicio. En dicha coordinación, el usuario deberá confirmar el recojo de los residuos al número de WhatsApp 942177419.</p>
        <p>Una vez ya coordinado el servicio, EL CLIENTE ya debe tener listo sus residuos biocontaminados para la recolección, correctamente embolsados y amarrados con el fin de evitar accidentes e imprevistos. Los contenedores con residuos Biocontaminados no podrán ser manipulados por EL CLIENTE.</p>
        <p>El CLIENTE está obligado a requerir como mínimo 1 servicio dentro de la frecuencia establecida, en caso no lo requiera EL CLIENTE acepta realizar el pago de la penalidad a LA EMPRESA por el equivalente a 01 servicio.</p>
        <p>LA EMPRESA podrá brindar servicios adicionales (fuera de su frecuencia), a través del número de WhatsApp 942177419. Cabe resaltar que dicho servicio adicional estará sujeto a la disponibilidad de LA EMPRESA.</p>
    </div>

    <div class="anexo-section">PROCEDIMIENTO DEL SERVICIO</div>
    <div class="clause-body">
        <p>Previo acuerdo con el área de programación, LA EMPRESA se dirigirá al establecimiento y dispondrá de un lapso de espera de 10 minutos a partir de su llegada.</p>
        <p>Una vez transcurrida la tolerancia y el personal no haya sido atendido, sin comunicación previa por parte del cliente, procederán a retirarse. En tal caso, EL CLIENTE asumirá una sanción económica ante LA EMPRESA equivalente al costo del 50% del servicio, dicho monto será incluido en su próxima facturación.</p>
        <p>En caso de que EL CLIENTE esté ausente, cerrado o cancele el servicio en el día programado, pese a que ya ha sido planificado el día anterior, se le procederá a cobrar el 50% de su tarifa que será incluida en su próxima facturación.</p>
        <p>Si EL CLIENTE anula el presente contrato de forma unilateral deberá saldar la penalidad equivalente al costo de S/ 700 INC IGV.</p>
        <p>Una vez culminado el servicio, LA EMPRESA procederá a entregarle su MANIFIESTO y GUÍA DE REMISIÓN DE TRANSPORTE a EL CLIENTE; el cual deberá revisar ambos documentos, retener el original y entregar la copia debidamente firmada a LA EMPRESA.</p>
        <p>Por último, LA EMPRESA se retirará con los residuos para su disposición final.</p>
        <p>En caso de tener un inconveniente o duda durante la prestación del servicio puede comunicarse al número de WhatsApp 942177419 o al correo naenciso@iogroup.pe.</p>
    </div>

    <div class="anexo-section">ÁREA ASIGNADA PARA EL TRANSPORTE</div>
    <div class="clause-body">
        <p>El CLIENTE deberá asignar un espacio o cochera con la finalidad de que la unidad pueda estacionarse correctamente y de esa manera evitar infracciones de tránsito. En caso de no contar con un espacio, EL CLIENTE deberá notificar a LA EMPRESA para tomar las medidas preventivas correspondientes.</p>
    </div>

    <div class="anexo-section">FORMA DE PAGO Y ADICIONALES</div>
    <div class="clause-body">
        <ol class="clause-items" type="a">
            <li>LA FACTURA Y EL MANIFIESTO serán emitidas a nombre de la Razón Social y RUC brindado por EL CLIENTE para la realización de su contrato.</li>
            <li>Previamente coordinado el método de pago, EL CLIENTE deberá realizar el abono respectivo antes o durante el momento de recojo; caso contrario, no se le entregará EL MANIFIESTO correspondiente. Una vez realizado el pago, dicha documentación será entregada en su siguiente servicio, en caso de que EL CLIENTE lo necesite de manera inmediata, se le podrá mandar dicho documento a través de un motorizado, costo que será asumido por EL CLIENTE.</li>
            <li>Si el pago de EL CLIENTE por el servicio prestado es a través de TRANSFERENCIA, EL CLIENTE deberá mandar dicho comprobante al 997571262 o al 942177419; señalando la Razón Social, RUC y en caso de contar con varias sedes, adicionalmente tendrá que mencionar el distrito y/o dirección para que puedan ser identificadas.</li>
            <li>Una vez emitida y recibida la factura, EL CLIENTE tiene un plazo máximo de 3 días calendario para realizar el depósito correspondiente, caso contrario desembolsará S/1.00 de mora por cada día de retraso.</li>
            <li>En caso EL CLIENTE supere el límite de peso, se cobrará S/<span class="dato-dinamico"><?= $tarifa_adicional ?></span> inc. IGV por kilogramo excedente.</li>
            <li>Si EL CLIENTE requiere una copia de su contrato por pérdida, el costo de la copia será de S/10.00 inc. IGV y se entregará en un plazo de 24 horas.</li>
            <li>Si EL CLIENTE requiere una copia de su manifiesto por pérdida, el costo de la copia será de S/15.00 inc. IGV y se entregará en un plazo de 24 horas.</li>
            <li>Si EL CLIENTE solicita un contenedor adicional, tendrá un costo de S/10.00 incluido IGV y se incluirá de regalo una bolsa roja.</li>
        </ol>
    </div>

    </div><!-- end two-columns -->

    <!-- Signatures -->
    <div class="signature-block">
        <div class="signature-col">
            <div class="signature-line">EL CLIENTE</div>
            <div class="signature-label"><?= $cliente_nombre ?></div>
        </div>
        <div class="signature-col">
            <div class="signature-line">LA EMPRESA</div>
            <div class="signature-label">IO GROUP E.I.R.L</div>
        </div>
    </div>
</div>

<!-- PAGE 3: CARTA AVAL -->
<div class="contract-page page-break">
    <div class="contract-header">
        <div>
            <?php if ($logo_base64): ?>
                <img src="<?= $logo_base64 ?>" class="logo" alt="IO Group">
            <?php else: ?>
                <strong style="font-size: 16pt; color: var(--primary);">IO GROUP E.I.R.L</strong>
            <?php endif; ?>
        </div>
        <div class="contract-number">
            Contrato N°<br>
            <strong><?= $numero_contrato ?></strong>
        </div>
    </div>

    <div class="aval-title">CARTA AVAL</div>

    <div class="clause-body" style="margin-top: 15px;">
        <p>El Sr/Sra. <span class="dato-dinamico"><?= $cliente_nombre ?></span>, identificado/a con <?= $cliente_tipo_doc ?>: <span class="dato-dinamico"><?= $cliente_dni ?></span>; representante legal de la empresa, <span class="dato-dinamico"><?= $empresa_razon ?></span>, con RUC N° <span class="dato-dinamico"><?= $empresa_ruc ?></span> con la potestad para asumir las obligaciones de su representada.</p>
    </div>

    <div style="text-align: center; margin: 30px 0;">
        <strong style="font-size: 11pt; color: var(--primary);">AVALA</strong>
    </div>

    <div class="clause-body">
        <p>a: EL CLIENTE <span class="dato-dinamico"><?= $empresa_razon ?></span> con RUC N° <span class="dato-dinamico"><?= $empresa_ruc ?></span> en virtud de lo dispuesto por el CONTRATO en la CLAUSULA CUARTA, para responder ante las siguientes obligaciones: Realizar el pago correspondiente de acuerdo a la frecuencia establecida en el contrato de SERVICIO DE RECOLECCIÓN, TRANSPORTE, TRATAMIENTO Y DISPOSICIÓN FINAL DE RESIDUOS BIOCONTAMINADOS, ante LA EMPRESA I-O Group E.I.R.L, identificada con RUC N° 20604489726.</p>
    </div>

    <div class="clause-body" style="margin-top: 10px;">
        <p>Este aval tendrá validez hasta que la Administración resuelva expresamente su cancelación, habiendo sido inscrito en el día de la fecha en el Registro especial de Avales.</p>
    </div>

    <div class="clause-body" style="text-align: right; margin-top: 20px;">
        <p>Lima, <span class="dato-dinamico"><?= $fecha_inicio_texto ?></span>.</p>
    </div>

    <!-- Signatures -->
    <div class="signature-block">
        <div class="signature-col">
            <div class="signature-line">EL CLIENTE</div>
            <div class="signature-label"><?= $cliente_nombre ?><br><?= $cliente_tipo_doc ?>: <?= $cliente_dni ?></div>
        </div>
        <div class="signature-col">
            <div class="signature-line">LA EMPRESA</div>
            <div class="signature-label">IO GROUP E.I.R.L<br>RUC: 20604489726</div>
        </div>
    </div>

    <div class="contract-footer">
        IO GROUP E.I.R.L &bull; RUC 20604489726 &bull; Av. Ignacio Merino 2608, Lince, Lima &bull; WhatsApp: 997571262 &bull; naenciso@iogroup.pe
    </div>
</div>

</body>
</html>
<?php
$html = ob_get_clean();
return $html;
