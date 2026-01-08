/**
 * TableSort - Componente de ordenamiento de tablas tipo Excel
 * ============================================================
 * Permite ordenar columnas en orden ascendente/descendente
 * con indicadores visuales de flechas
 * 
 * Uso:
 *   const sorter = new TableSort('tableBody', {
 *     columns: ['nombre', 'dni', 'telefono', 'email', 'total_empresas', 'activo'],
 *     onSort: (sortedData) => renderTable(sortedData)
 *   });
 *   sorter.setData(allData);
 */

class TableSort {
    constructor(tableId, options = {}) {
        this.data = [];
        this.currentSort = { column: null, direction: 'asc' };
        this.columns = options.columns || [];
        this.onSort = options.onSort || (() => { });
        this.tableId = tableId;

        this.init();
    }

    init() {
        // Buscar la tabla y agregar eventos a los headers
        const tbody = document.getElementById(this.tableId);
        if (!tbody) return;

        const table = tbody.closest('table');
        if (!table) return;

        const headers = table.querySelectorAll('thead th');
        headers.forEach((th, index) => {
            if (index < this.columns.length && this.columns[index]) {
                this.makeSortable(th, this.columns[index], index);
            }
        });
    }

    makeSortable(th, columnKey, index) {
        // Agregar clase y estilos
        th.classList.add('sortable');
        th.dataset.column = columnKey;
        th.dataset.index = index;

        // Crear contenedor para texto e icono
        const originalText = th.textContent;
        th.innerHTML = `
            <div class="sort-header">
                <span>${originalText}</span>
                <span class="sort-icon">
                    <i class="bi bi-chevron-expand"></i>
                </span>
            </div>
        `;

        // Agregar evento click
        th.addEventListener('click', () => this.sort(columnKey, th));
    }

    sort(column, thElement) {
        // Determinar dirección
        if (this.currentSort.column === column) {
            this.currentSort.direction = this.currentSort.direction === 'asc' ? 'desc' : 'asc';
        } else {
            this.currentSort.column = column;
            this.currentSort.direction = 'asc';
        }

        // Actualizar iconos en todos los headers
        const table = thElement.closest('table');
        table.querySelectorAll('thead th.sortable').forEach(th => {
            const icon = th.querySelector('.sort-icon i');
            if (icon) {
                if (th.dataset.column === column) {
                    icon.className = this.currentSort.direction === 'asc'
                        ? 'bi bi-chevron-up'
                        : 'bi bi-chevron-down';
                    th.classList.add('sorted');
                } else {
                    icon.className = 'bi bi-chevron-expand';
                    th.classList.remove('sorted');
                }
            }
        });

        // Ordenar datos
        const sortedData = [...this.data].sort((a, b) => {
            let valueA = a[column];
            let valueB = b[column];

            // Manejar valores nulos/undefined
            if (valueA === null || valueA === undefined) valueA = '';
            if (valueB === null || valueB === undefined) valueB = '';

            // Detectar si son fechas (formato YYYY-MM-DD o ISO)
            const dateRegex = /^\d{4}-\d{2}-\d{2}/;
            if (dateRegex.test(valueA) && dateRegex.test(valueB)) {
                const dateA = new Date(valueA);
                const dateB = new Date(valueB);
                return this.currentSort.direction === 'asc'
                    ? dateA - dateB
                    : dateB - dateA;
            }

            // Intentar comparación numérica
            const numA = parseFloat(valueA);
            const numB = parseFloat(valueB);

            if (!isNaN(numA) && !isNaN(numB)) {
                // Comparación numérica
                return this.currentSort.direction === 'asc' ? numA - numB : numB - numA;
            }

            // Comparación de strings
            const strA = String(valueA).toLowerCase();
            const strB = String(valueB).toLowerCase();

            if (this.currentSort.direction === 'asc') {
                return strA.localeCompare(strB, 'es');
            } else {
                return strB.localeCompare(strA, 'es');
            }
        });

        // Llamar callback
        this.onSort(sortedData);
    }

    setData(data) {
        this.data = data;
    }

    resetSort() {
        this.currentSort = { column: null, direction: 'asc' };
        const tbody = document.getElementById(this.tableId);
        if (tbody) {
            const table = tbody.closest('table');
            if (table) {
                table.querySelectorAll('thead th.sortable').forEach(th => {
                    const icon = th.querySelector('.sort-icon i');
                    if (icon) {
                        icon.className = 'bi bi-chevron-expand';
                    }
                    th.classList.remove('sorted');
                });
            }
        }
    }
}

// Exportar para uso global
window.TableSort = TableSort;
