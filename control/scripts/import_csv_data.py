#!/usr/bin/env python3
"""
IO Group - CSV Data Import Script
Normalizes data from BASE DE DATOS 2025 CSV into MySQL database tables.
"""

import csv
import mysql.connector
from mysql.connector import Error
import re
from datetime import datetime
import argparse

# Database configuration - UPDATE THESE VALUES
DB_CONFIG = {
    'host': 'localhost',
    'database': 'iogroup_db',
    'user': 'root',
    'password': '',
    'charset': 'utf8mb4'
}

# CSV file path
CSV_FILE = r'c:\Users\sebas\Documents\IOGROUPWEB\BASE DE DATOS 2025(DATA IOGROUP).csv'


def parse_date(date_str):
    """Parse various date formats from CSV."""
    if not date_str or date_str.strip() in ['', '#¡VALOR!', 'N/A']:
        return None
    
    date_str = date_str.strip().replace('\t', '')
    
    # Try different date formats
    formats = [
        '%d/%m/%Y',
        '%d-%m-%Y',
        '%Y-%m-%d',
        '%d-%b-%y',
        '%d/%m/%y',
    ]
    
    for fmt in formats:
        try:
            return datetime.strptime(date_str, fmt).date()
        except ValueError:
            continue
    
    return None


def parse_weight(weight_str):
    """Parse weight limit from CSV (e.g., '10 KG' -> 10.00)."""
    if not weight_str or 'SIN LIMITE' in weight_str.upper():
        return None
    
    match = re.search(r'(\d+(?:\.\d+)?)', weight_str)
    if match:
        return float(match.group(1))
    return None


def parse_tarifa(tarifa_str):
    """Parse tarifa from CSV."""
    if not tarifa_str:
        return 0.0
    
    # Remove non-numeric characters except decimal
    tarifa_str = tarifa_str.replace(',', '.')
    match = re.search(r'(\d+(?:\.\d+)?)', tarifa_str)
    if match:
        return float(match.group(1))
    return 0.0


def normalize_frecuencia(frecuencia_str):
    """Convert frecuencia to database enum value."""
    if not frecuencia_str:
        return 'mensual'
    
    frecuencia_str = frecuencia_str.upper().strip()
    
    mapping = {
        'MENSUAL': 'mensual',
        'QUINCENAL': 'quincenal',
        'BIMENSUAL': 'bimestral',
        'SEMANAL': 'semanal',
        'DIARIO': 'diario',
        'INTERDIARIO': 'semanal',
        'CADA 72HRS': 'semanal',
        'TRIMESTRAL': 'trimestral',
    }
    
    for key, value in mapping.items():
        if key in frecuencia_str:
            return value
    
    return 'mensual'


def is_active(status_str):
    """Determine if record is active."""
    if not status_str:
        return 1
    return 0 if 'INACTIVO' in status_str.upper() else 1


class DataImporter:
    def __init__(self, dry_run=False):
        self.dry_run = dry_run
        self.conn = None
        self.cursor = None
        self.rubros_cache = {}
        self.clientes_cache = {}
        self.empresas_cache = {}
        self.stats = {
            'rubros': 0,
            'clientes': 0,
            'empresas': 0,
            'sedes': 0,
            'contratos': 0,
            'skipped': 0,
            'errors': 0
        }

    def connect(self):
        """Establish database connection."""
        try:
            self.conn = mysql.connector.connect(**DB_CONFIG)
            self.cursor = self.conn.cursor(dictionary=True)
            print(f"✓ Connected to database: {DB_CONFIG['database']}")
            return True
        except Error as e:
            print(f"✗ Database connection error: {e}")
            return False

    def disconnect(self):
        """Close database connection."""
        if self.cursor:
            self.cursor.close()
        if self.conn:
            self.conn.close()
            print("✓ Database connection closed")

    def load_rubros(self):
        """Load existing rubros into cache."""
        self.cursor.execute("SELECT id_rubro, nombre FROM Rubro")
        for row in self.cursor.fetchall():
            self.rubros_cache[row['nombre'].upper()] = row['id_rubro']
        print(f"  Loaded {len(self.rubros_cache)} rubros from database")

    def get_or_create_rubro(self, rubro_name):
        """Get rubro ID, creating if necessary."""
        if not rubro_name:
            rubro_name = 'NO ESPECIFICA'
        
        rubro_name = rubro_name.upper().strip()
        
        if rubro_name in self.rubros_cache:
            return self.rubros_cache[rubro_name]
        
        if not self.dry_run:
            try:
                self.cursor.execute(
                    "INSERT INTO Rubro (nombre) VALUES (%s)",
                    (rubro_name,)
                )
                self.conn.commit()
                rubro_id = self.cursor.lastrowid
                self.rubros_cache[rubro_name] = rubro_id
                self.stats['rubros'] += 1
                return rubro_id
            except Error:
                return self.rubros_cache.get('NO ESPECIFICA', 1)
        
        return None

    def get_or_create_cliente(self, row):
        """Get or create Cliente from row data."""
        representante = row.get('REPRESENTANTE', '').strip()
        dni = row.get('DNI', '').strip()
        
        if not representante:
            representante = row.get('RAZON SOCIAL', 'Cliente Sin Nombre')[:100]
        
        # Use DNI as unique key, fallback to name
        cache_key = dni if dni else representante
        
        if cache_key in self.clientes_cache:
            return self.clientes_cache[cache_key]
        
        if not self.dry_run:
            try:
                self.cursor.execute(
                    """INSERT INTO Cliente (nombre, dni, telefono, activo) 
                       VALUES (%s, %s, %s, 1)""",
                    (representante[:100], dni[:15] if dni else None, 
                     row.get('TELEFONO PARA COBRAR', '')[:20])
                )
                self.conn.commit()
                cliente_id = self.cursor.lastrowid
                self.clientes_cache[cache_key] = cliente_id
                self.stats['clientes'] += 1
                return cliente_id
            except Error as e:
                print(f"    ! Error creating cliente: {e}")
                return None
        
        return None

    def get_or_create_empresa(self, row, id_cliente, id_rubro):
        """Get or create Empresa from row data."""
        ruc = row.get('RUC', '').strip()
        razon_social = row.get('RAZON SOCIAL', '').strip()
        
        if not ruc or len(ruc) < 8:
            return None
        
        # Clean RUC (remove non-numeric)
        ruc = re.sub(r'\D', '', ruc)[:11]
        
        if ruc in self.empresas_cache:
            return self.empresas_cache[ruc]
        
        if not self.dry_run:
            try:
                self.cursor.execute(
                    """INSERT INTO Empresa 
                       (id_cliente, razon_social, ruc, direccion_fiscal, distrito, 
                        provincia, departamento, id_rubro, activo) 
                       VALUES (%s, %s, %s, %s, %s, %s, %s, %s, 1)
                       ON DUPLICATE KEY UPDATE id_empresa=LAST_INSERT_ID(id_empresa)""",
                    (id_cliente, razon_social[:200], ruc,
                     row.get('DIRECCION', '')[:255],
                     row.get('DISTRITO', '')[:100],
                     row.get('PROVINCIA', 'LIMA')[:100],
                     row.get('DEPARTAMENTO', 'LIMA')[:100],
                     id_rubro)
                )
                self.conn.commit()
                empresa_id = self.cursor.lastrowid
                self.empresas_cache[ruc] = empresa_id
                self.stats['empresas'] += 1
                return empresa_id
            except Error as e:
                print(f"    ! Error creating empresa: {e}")
                return None
        
        return None

    def create_sede(self, row, id_empresa):
        """Create Sede from row data."""
        nombre_comercial = row.get('NOMBRE COMERCIAL', '').strip()
        if not nombre_comercial:
            nombre_comercial = row.get('RAZON SOCIAL', 'Sede Principal')[:200]
        
        direccion = row.get('DIRECCION', '').strip()
        activo = is_active(row.get('STATUS', ''))
        
        if not self.dry_run:
            try:
                self.cursor.execute(
                    """INSERT INTO Sede 
                       (id_empresa, nombre_comercial, direccion, distrito, provincia, 
                        departamento, referencia, contacto_nombre, contacto_telefono, activo) 
                       VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)""",
                    (id_empresa, nombre_comercial[:200], direccion[:255],
                     row.get('DISTRITO', '')[:100],
                     row.get('PROVINCIA', 'LIMA')[:100],
                     row.get('DEPARTAMENTO', 'LIMA')[:100],
                     row.get('HORARIO', '')[:255],
                     row.get('CONTACTO', '')[:100],
                     row.get('TELEFONO PARA PROGRAMAR', '')[:20],
                     activo)
                )
                self.conn.commit()
                sede_id = self.cursor.lastrowid
                self.stats['sedes'] += 1
                return sede_id
            except Error as e:
                print(f"    ! Error creating sede: {e}")
                return None
        
        return None

    def create_contrato(self, row, id_sede):
        """Create ContratoServicio from row data."""
        fecha_inicio = parse_date(row.get('FECHA INICIO CONTRATO', ''))
        fecha_fin = parse_date(row.get('VIGENCIA', ''))
        peso_limite = parse_weight(row.get('LIMITE DE PESO', ''))
        tarifa = parse_tarifa(row.get('TARIFA', ''))
        frecuencia = normalize_frecuencia(row.get('FRECUENCIA', ''))
        activo = is_active(row.get('STATUS', ''))
        observaciones = f"Método pago: {row.get('METODO PAGO', '')}. {row.get('OBSERVACION', '')}"
        
        if not self.dry_run:
            try:
                self.cursor.execute(
                    """INSERT INTO ContratoServicio 
                       (id_sede, fecha_inicio, fecha_fin, frecuencia, peso_limite_kg, 
                        tarifa, tipo_tarifa, observaciones, activo) 
                       VALUES (%s, %s, %s, %s, %s, %s, 'mensual_fijo', %s, %s)""",
                    (id_sede, fecha_inicio or datetime.now().date(), fecha_fin, 
                     frecuencia, peso_limite, tarifa, observaciones[:500], activo)
                )
                self.conn.commit()
                self.stats['contratos'] += 1
            except Error as e:
                print(f"    ! Error creating contrato: {e}")

    def import_row(self, row, row_num):
        """Import a single CSV row."""
        try:
            # Skip header or empty rows
            if not row.get('RUC') or row.get('CLIENTE') == 'CLIENTE':
                self.stats['skipped'] += 1
                return
            
            # 1. Get or create Rubro
            id_rubro = self.get_or_create_rubro(row.get('RUBRO'))
            
            # 2. Get or create Cliente
            id_cliente = self.get_or_create_cliente(row)
            if not id_cliente and not self.dry_run:
                self.stats['errors'] += 1
                return
            
            # 3. Get or create Empresa
            id_empresa = self.get_or_create_empresa(row, id_cliente, id_rubro)
            if not id_empresa and not self.dry_run:
                self.stats['errors'] += 1
                return
            
            # 4. Create Sede
            id_sede = self.create_sede(row, id_empresa)
            if not id_sede and not self.dry_run:
                self.stats['errors'] += 1
                return
            
            # 5. Create Contrato
            self.create_contrato(row, id_sede)
            
        except Exception as e:
            print(f"  ✗ Row {row_num} error: {e}")
            self.stats['errors'] += 1

    def run_import(self):
        """Main import process."""
        print("\n" + "="*60)
        print("IO Group - CSV Data Import")
        print("="*60)
        
        if self.dry_run:
            print("⚠ DRY RUN MODE - No changes will be made\n")
        
        if not self.connect():
            return False
        
        try:
            # Load existing rubros
            self.load_rubros()
            
            # Read CSV
            print(f"\n📁 Reading CSV: {CSV_FILE}")
            with open(CSV_FILE, 'r', encoding='utf-8-sig') as f:
                # CSV uses semicolon as delimiter
                reader = csv.DictReader(f, delimiter=';')
                rows = list(reader)
            
            total_rows = len(rows)
            print(f"   Found {total_rows} rows to process\n")
            
            # Process rows
            print("📥 Importing data...")
            for i, row in enumerate(rows, 1):
                if i % 100 == 0:
                    print(f"   Progress: {i}/{total_rows} ({100*i//total_rows}%)")
                self.import_row(row, i)
            
            # Print summary
            print("\n" + "="*60)
            print("📊 IMPORT SUMMARY")
            print("="*60)
            print(f"  Rubros created:    {self.stats['rubros']}")
            print(f"  Clientes created:  {self.stats['clientes']}")
            print(f"  Empresas created:  {self.stats['empresas']}")
            print(f"  Sedes created:     {self.stats['sedes']}")
            print(f"  Contratos created: {self.stats['contratos']}")
            print(f"  Rows skipped:      {self.stats['skipped']}")
            print(f"  Errors:            {self.stats['errors']}")
            print("="*60)
            
            return True
            
        except Exception as e:
            print(f"✗ Import failed: {e}")
            return False
        finally:
            self.disconnect()


def main():
    parser = argparse.ArgumentParser(description='Import CSV data to IO Group database')
    parser.add_argument('--dry-run', action='store_true', 
                        help='Preview import without making changes')
    parser.add_argument('--host', default='localhost', help='Database host')
    parser.add_argument('--database', default='iogroup_db', help='Database name')
    parser.add_argument('--user', default='root', help='Database user')
    parser.add_argument('--password', default='', help='Database password')
    
    args = parser.parse_args()
    
    # Update config from args
    DB_CONFIG['host'] = args.host
    DB_CONFIG['database'] = args.database
    DB_CONFIG['user'] = args.user
    DB_CONFIG['password'] = args.password
    
    importer = DataImporter(dry_run=args.dry_run)
    success = importer.run_import()
    
    exit(0 if success else 1)


if __name__ == '__main__':
    main()
