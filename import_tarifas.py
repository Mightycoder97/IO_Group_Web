#!/usr/bin/env python3
"""
Script para generar SQL que actualiza la tarifa en ContratoServicio
basándose en el RUC de la empresa y el "Monto por Servicio" del Excel.
"""

import pandas as pd

# Leer el Excel
df = pd.read_excel('Datos.xlsx')

# Filtrar solo filas con RUC y Monto válidos
df_valid = df[df['RUC'].notna() & df['Monto por Servicio'].notna()].copy()

# Limpiar RUC (quitar caracteres no numéricos, incluyendo unicode invisible)
import re
def clean_ruc(x):
    if pd.isna(x):
        return ''
    # Convertir a string y quedarse solo con dígitos
    s = str(x)
    digits_only = re.sub(r'[^\d]', '', s)
    return digits_only if len(digits_only) == 11 else ''

df_valid['RUC'] = df_valid['RUC'].apply(clean_ruc)
df_valid = df_valid[df_valid['RUC'] != '']

# Generar SQL para actualizar ContratoServicio
sql_statements = []
sql_statements.append("-- ========================================")
sql_statements.append("-- Actualización de tarifas desde Datos.xlsx")
sql_statements.append("-- Generado automáticamente")
sql_statements.append("-- ========================================")
sql_statements.append("")

# Agrupar por RUC para evitar duplicados
ruc_montos = df_valid.groupby('RUC')['Monto por Servicio'].first().to_dict()

print(f"Total RUCs únicos con monto: {len(ruc_montos)}")

for ruc, monto in ruc_montos.items():
    try:
        monto_float = float(monto)
        if ruc and monto_float > 0:
            # Actualizar ContratoServicio a través de Sede -> Empresa
            sql = f"""UPDATE ContratoServicio cs
INNER JOIN Sede s ON cs.id_sede = s.id_sede
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
SET cs.tarifa = {monto_float}
WHERE e.ruc = '{ruc}';"""
            sql_statements.append(sql)
            sql_statements.append("")
    except (ValueError, TypeError):
        pass  # Skip invalid montos

# Escribir archivo SQL
with open('control/database/update_tarifas.sql', 'w', encoding='utf-8') as f:
    f.write('\n'.join(sql_statements))

print(f"Archivo generado: control/database/update_tarifas.sql")
print(f"Total actualizaciones: {len(ruc_montos)}")

# Mostrar primeros ejemplos
print("\nEjemplos:")
for i, (ruc, monto) in enumerate(list(ruc_montos.items())[:5]):
    print(f"  RUC {ruc}: S/ {monto}")
