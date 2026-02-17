#!/usr/bin/env python3
"""
Script para actualizar la tarifa en ContratoServicio
basándose en el RUC de la empresa y el "Monto por Servicio" del Excel.
"""

import pandas as pd
import re

# Leer el Excel
df = pd.read_excel('Datos.xlsx')

# Filtrar solo filas con RUC y Monto válidos
df_valid = df[df['RUC'].notna() & df['Monto por Servicio'].notna()].copy()

# Limpiar RUC (quitar caracteres no numéricos, incluyendo unicode invisible)
def clean_ruc(x):
    if pd.isna(x):
        return ''
    s = str(x)
    digits_only = re.sub(r'[^\d]', '', s)
    return digits_only if len(digits_only) == 11 else ''

df_valid['RUC'] = df_valid['RUC'].apply(clean_ruc)
df_valid = df_valid[df_valid['RUC'] != '']

# Generar SQL para actualizar ContratoServicio.tarifa
sql_statements = []
sql_statements.append("-- ========================================")
sql_statements.append("-- Actualización de tarifas en ContratoServicio")
sql_statements.append("-- Basado en Monto por Servicio del Excel")
sql_statements.append("-- Generado automáticamente")
sql_statements.append("-- ========================================")
sql_statements.append("")

# Agrupar por RUC para evitar duplicados
ruc_montos = df_valid.groupby('RUC')['Monto por Servicio'].first().to_dict()

print(f"Total RUCs únicos con monto: {len(ruc_montos)}")

count = 0
for ruc, monto in ruc_montos.items():
    try:
        monto_float = float(monto)
        if ruc and monto_float > 0:
            # Actualizar ContratoServicio.tarifa a través de Sede -> Empresa.ruc
            sql = f"""UPDATE ContratoServicio cs
INNER JOIN Sede s ON cs.id_sede = s.id_sede
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
SET cs.tarifa = {monto_float}
WHERE e.ruc = '{ruc}' AND cs.activo = 1;"""
            sql_statements.append(sql)
            sql_statements.append("")
            count += 1
    except (ValueError, TypeError):
        pass  # Skip invalid montos

# Escribir archivo SQL
with open('control/database/update_tarifas_contrato.sql', 'w', encoding='utf-8') as f:
    f.write('\n'.join(sql_statements))

print(f"Archivo generado: control/database/update_tarifas_contrato.sql")
print(f"Total actualizaciones: {count}")

# Mostrar primeros ejemplos
print("\nEjemplos:")
for i, (ruc, monto) in enumerate(list(ruc_montos.items())[:5]):
    print(f"  RUC {ruc}: S/ {monto}")
