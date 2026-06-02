# FOD — Fundamentos de Organización de Datos

Prácticas de la materia resueltas en **Pascal** con **Free Pascal Compiler (FPC)**.

**Facultad de Informática — UNLP** · Analista Programador Universitario (APU)

---

## 📂 Estructura del proyecto

```
FOD/
├── practicas/                  ← Código fuente organizado por unidad temática
│   ├── 1/                      ←   Archivos secuenciales
│   ├── 2/                      ←   Algorítmica clásica sobre archivos
│   ├── 3/                      ←   Bajas y reutilización de espacio
│   └── 4/                      ←   Árboles B, B+ y Hashing
├── .gitignore
└── README.md
```

Cada carpeta dentro de `practicas/` agrupa los ejercicios de una unidad didáctica.
El repositorio contiene únicamente el código fuente; el material teórico
(apuntes, diapositivas, exámenes) se encuentra en el entorno local de estudio.

---

## 📚 Contenido por práctica

### Práctica 1 — Archivos secuenciales

Fundamentos del manejo de archivos binarios en Pascal. Tipos de datos,
operaciones de creación, consulta y actualización.

| Concepto | Descripción |
|----------|-------------|
| `file of tipo` | Declaración de archivos binarios tipados |
| `assign` / `rewrite` / `reset` / `close` | Ciclo de vida de un archivo |
| `read` / `write` | Lectura y escritura de registros |
| `eof` / `seek` / `filesize` | Control de puntero y navegación |
| Registros anidados | `record` con campos compuestos |
| Carga con centinela | Corte por marca de fin (ej. 30000) |
| Archivos de texto | Exportación con `text`, `writeln` |
| Búsqueda secuencial | Recorrido con corte condicional |

Ejercicios: creación de archivos, listado con formato, merge simple de archivos
ordenados, consulta por clave, actualización de campos, exportación a texto.

### Práctica 2 — Algorítmica clásica sobre archivos

Patrones fundamentales de procesamiento de archivos ordenados. Son los
algoritmos base que estructuran cualquier solución de gestión de datos.

| Algoritmo | Aplicación |
|-----------|------------|
| **Merge** | Combinación de 2+ archivos ordenados en uno solo |
| **Corte de control** | Agrupación y acumulación por cambio de clave (1, 2 y 3 niveles) |
| **Maestro-Detalle** | Actualización de un archivo maestro a partir de uno o más detalles |

Estos tres patrones aparecen combinados en la mayoría de los problemas de
gestión: actualización de stocks, procesamiento de ventas por sucursal,
consolidación de movimientos bancarios, etc.

### Práctica 3 — Bajas y reutilización de espacio

Técnicas para eliminar registros lógicamente y reutilizar el espacio liberado.

| Técnica | Descripción |
|---------|-------------|
| **Baja lógica** | Marca de registro eliminado (campo bandera o código negativo) |
| **Lista invertida** | Lista enlazada de registros libres con cabecera en registro 0 |
| **Alta con reutilización** | Insertar nuevo registro en la primera posición libre de la lista |
| **Compactación** | Reordenamiento físico para eliminar huecos |

### Práctica 4 — Árboles B, B+ y Hashing

Estructuras de acceso eficiente para grandes volúmenes de datos.

| Estructura | Conceptos clave |
|------------|-----------------|
| **Árbol B** | Orden M, nodos con claves e hijos, inserción con split, eliminación con redistribución/fusión |
| **Árbol B+** | Hojas enlazadas, claves duplicadas en niveles superiores |
| **Hashing extensible** | Directorio, cubetas, profundidad global y local, split de cubeta |

---

## 🛠️ Cómo usar

### Desde VSCode

| Acción | Método |
|--------|--------|
| **Compilar** | `Ctrl+Shift+B` (Build task) |
| **Compilar y ejecutar** | `Ctrl+Shift+T` (Run task) o ▶️ Code Runner |
| **Nuevo .pas** | Botón derecho → New File → Pascal Program |

### Desde la terminal

```bash
# Compilar
fpc practicas/1/ejercicio1.pas

# Ejecutar
./practicas/1/ejercicio1

# Compilar y ejecutar en un paso
fpc practicas/1/ejercicio1.pas && ./practicas/1/ejercicio1
```

---

## ⚙️ Requisitos

- **Free Pascal Compiler** (`fpc`) — `apt install fpc` / `brew install fpc`
- Extensiones VSCode (recomendadas):
  - [`alefragnani.pascal`](https://marketplace.visualstudio.com/items?itemName=alefragnani.pascal) — navegación y resaltado de sintaxis
  - [`formulahendry.code-runner`](https://marketplace.visualstudio.com/items?itemName=formulahendry.code-runner) — ejecución con un clic

---

## 📄 Licencia

Material de uso académico personal.
