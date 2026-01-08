"""
Script para analizar los servicios en el Excel
"""
import pandas as pd
from datetime import datetime

df = pd.read_excel('../../Datos.xlsx')

# Columnas de fechas
date_cols = ['FECHA DE SERVICIO ENERO', 'FECHA DE SERVICIO FEBRERO', 'FECHA DE SERVICIO MARZO',
             'FECHA DE SERVICIO ABRIL', 'FECHA DE SERVICIO MAYO', 'FECHA DE SERVICIO JUNIO',
             'FECHA DE SERVICIO JULIO', 'FECHA DE SERVICIO AGOSTO', 'FECHA DE SERVICIO SETIEMBRE',
             'FECHA DE SERVICIO OCTUBRE', 'FECHA DE SERVICIO NOVIEMBRE', 'FECHA DE SERVICIO DICIEMBRE']

print('=== Analisis de Servicios ===')
print(f'Total de sedes: {len(df)}')

# Analizar un ejemplo
sample = df[df['Nombre Comercial'].notna()].head(5)
for idx, row in sample.iterrows():
    print(f"\n--- {row['Nombre Comercial']} ---")
    dates = []
    for col in date_cols:
        val = row[col]
        if pd.notna(val):
            if isinstance(val, datetime):
                dates.append((col.replace('FECHA DE SERVICIO ', ''), val.strftime('%Y-%m-%d')))
            else:
                dates.append((col.replace('FECHA DE SERVICIO ', ''), str(val)))
    for mes, fecha in dates:
        print(f'  {mes}: {fecha}')
