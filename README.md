# 📊 Curso de Bases de Datos: De los Fundamentos al Lenguaje SQL

**¡Bienvenido al repositorio de la materia de Bases de datos!**<br>
Este espacio está diseñado para consolidar todos los conocimientos teóricos y prácticos adquiridos a lo largo del curso, abarcando desde la abstracción conceptual de la información hasta la manipulación e implementación de bases de datos relacionales robustas.

## 🗺️ Mapa de Ruta del Aprendizaje (Roadmap)<br>
**1. Fundamentos** ──> **2. Modelo E-R** ──> **3. Modelo Relacional** ──> **4. SQL-LDD** ──> **5. SQL-LMD**

### 📚 Contenido del Curso1. 🔍 Fundamentos de Bases de Datos
Introducción a los conceptos clave para entender cómo y por qué almacenamos datos de forma estructurada.
Diferencia entre datos e información, evolución de los archivos tradicionales a las Bases de Datos.
Arquitectura ANSI-SPARC (tres niveles), componentes y objetivos de un SGBD.
Comprensión de los niveles físico, conceptual y de visión.

#### 1. 📐 Modelado de Datos: Modelo Entidad-Relación (E-R)
La fase de diseño conceptual donde transformamos requerimientos del mundo real en diagramas estructurados.
Entidades fuertes/débiles; atributos clave, compuestos, multivalorados y derivados.
Cardinalidad y participación (1:1, 1:N, N:M).
Creación de diagramas conceptuales claros para representar la lógica del negocio.

#### 2. 🔄 El Modelo Relacional
Transición del modelo conceptual (E-R) al modelo lógico apto para sistemas modernos.
Tablas, tuplas (filas), atributos (columnas) y dominios.
Identificación de Claves Primarias (PK) y Claves Foráneas (FK).
Proceso de mapeo de entidades y relaciones hacia tablas físicas.
Restricciones y acciones en cascada (ON DELETE / ON UPDATE).

#### 3. 🔨 Construcción con SQL-LDD (Lenguaje de Definición de Datos)
Implementación física de la estructura de la base de datos utilizando código SQL estándar.<br>
CREATE, ALTER y DROP.
PRIMARY KEY, FOREIGN KEY, UNIQUE, NOT NULL y CHECK.

```sql
-- Ejemplo de creación de tablas (LDD)
CREATE TABLE alumnos (
alumno_id INT PRIMARY KEY,
matricula VARCHAR(15) UNIQUE NOT NULL,
nombre VARCHAR(50) NOT NULL,
fecha_nacimiento DATE,
estado VARCHAR(10) DEFAULT 'Activo'
);
```

```sql
CREATE TABLE inscripciones (
inscripcion_id INT PRIMARY KEY,
alumno_id INT,
fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (alumno_id) REFERENCES alumnos(alumno_id) ON DELETE CASCADE
);
```

#### 5. ⚡ Manipulación con SQL-LMD (Lenguaje de Manipulación de Datos)
Interacción directa con los datos almacenados para consulta y modificación.
**INSERT**, **SELECT**, **UPDATE** y **DELETE**.<br>
Uso de **WHERE*, **ORDER BY**, **GROUP BY** y **HAVING**.<br>
Combinación de tablas mediante **INNER JOIN**, **LEFT JOIN** y **RIGHT JOIN**.

```sql
-- Ejemplo de consulta multitable (LMD)
SELECT
a.nombre,
i.fecha_registro
FROM alumnos a
INNER JOIN inscripciones i ON a.alumno_id = i.alumno_id
WHERE a.estado = 'Activo'
ORDER BY i.fecha_registro DESC;
```

## 📂 Estructura del Repositorio
├── 📁 **01_fundamentos/**   _# Apuntes teóricos_<br>
├── 📁 **02_modelo_er/** _# Diagramas y casos de estudio_<br>
├── 📁 **03_modelo_relacional/** _# Ejercicios de mapeo_<br>
├── 📁 **04_sql_ldd/** _# Scripts de creación de esquemas (.sql)_<br>
├── 📁 **05_sql_lmd/** _# Scripts de consultas y manipulación (.sql)_<br>
└── **README.md** _# Presentación del curso_<br>

## 🛠️ Tecnologías Sugeridas
Draw.io / Lucidchart<br>
MySQL / PostgreSQL / SQL Server<br>
DBeaver / Azure Data Studio / Workbench<br>


## 👤 Autor
Santiago De la mora — Desarrollador de software junior curioso y en constante aprendizaje.