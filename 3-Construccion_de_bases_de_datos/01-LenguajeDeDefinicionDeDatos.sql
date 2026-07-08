-- Construcción de Bases de Datos con SQL-LDD (CREATE, ALTER, DROP)

-- Crear una base de datos
CREATE DATABASE universidad;
GO

-- Usar la base de datos
USE universidad;
GO

-- Crear una tabla
CREATE TABLE alumno(
	alumno_id INT,
	nombre VARCHAR(50),
	apellido_paterno VARCHAR(25),
	apellido_matero VARCHAR(25),
	fecha_nacimiento DATE,
	correo VARCHAR(50)
);
GO

INSERT INTO alumno VALUES(1, 'Arcadia', 'Vaca', 'Del corral', '1986-04-07', 'correo@correo.com');
INSERT INTO alumno VALUES(1, 'Kevin', 'Cabeza', 'De borrego', '1986-05-10', 'correo@correo.com');

SELECT * FROM alumno;

-- Restricciones
/*
Las restricciones son reglas que garantizanla integridad de los datos.
Las más utilizadas son:
- PRIMARY KEY
- FOREIGN KEY
- NOT NULL
- UNIQUE
- CHECK
- DEFAULT
*/

-- PRIMARY KEY
CREATE TABLE alumno(
	alumno_id INT PRIMARY KEY,
	nombre VARCHAR(50),
	correo VARCHAR(50),
);
GO

INSERT INTO alumno VALUES (1, 'Luis', 'correo@luis.com');
INSERT INTO alumno VALUES (3, 'Ronerta', 'correo@roberta.com');

DROP TABLE alumno;

CREATE TABLE alumno(
	alumno_id INT NOT NULL,
	nombre VARCHAR(50),
	correo VARCHAR(50),
	CONSTRAINT pk_alumno PRIMARY KEY (alumno_id)
);
GO

INSERT INTO alumno VALUES (1, 'Luis', 'correo@luis.com');
INSERT INTO alumno VALUES (1, 'Ronerta', 'correo@roberta.com');

DROP TABLE alumno;

-- Primary Key con IDENTITY
CREATE TABLE alumno(
	alumno_id INT IDENTITY(1,1) PRIMARY KEY,
	nombre VARCHAR(50),
	correo VARCHAR(50)
);
GO

INSERT INTO alumno VALUES ('Luis', 'correo@luis.com');
INSERT INTO alumno VALUES ('Ronerta', 'correo@roberta.com');

SELECT * FROM alumno;

DROP TABLE alumno;

CREATE TABLE alumno(
	alumno_id INT NOT NULL IDENTITY(1,1),
	nombre VARCHAR(50),
	correo VARCHAR(50),
	CONSTRAINT pk_alumno PRIMARY KEY (alumno_id)
);
GO

-- NOT NULL
CREATE TABLE profesor(
	profesor_id INT NOT NULL IDENTITY(1,1),
	numero_nomina VARCHAR(20) NOT NULL,
	nombre VARCHAR(15) NOT NULL,
	apellido_materno VARCHAR(20) NULL,
	apellido_paterno VARCHAR(20) NOT NULL,
	fecha_ingreso DATE,
	CONSTRAINT pk_profesor PRIMARY KEY (profesor_id)
);
GO

INSERT INTO profesor VALUES ('33534535ASD', 'Luis', NULL, 'Hernández', '2027-05-07');
INSERT INTO profesor (numero_nomina, nombre, apellido_paterno) VALUES ('33534535ASD', 'Ricarda', 'Sonrics');

SELECT * FROM profesor;

CREATE TABLE categoria(
	categoria_id INT NOT NULL IDENTITY(1, 1),
	nombre VARCHAR(20) NOT NULL UNIQUE,
	activo BIT NOT NULL
);
GO

INSERT INTO categoria VALUES (UPPER('carnes frías'), 1);
INSERT INTO categoria VALUES (UPPER('carnes frías'), 1);

DROP TABLE categoria;

CREATE TABLE categoria(
	categoria_id INT NOT NULL IDENTITY(1, 1),
	CONSTRAINT pk_categoria PRIMARY KEY (categoria_id),
	nombre VARCHAR(20) NOT NULL	CONSTRAINT uq_categoria_nombre UNIQUE,
	activo BIT NOT NULL
);
GO

DROP TABLE categoria;

CREATE TABLE categoria(
	categoria_id INT NOT NULL IDENTITY(1, 1),
	nombre VARCHAR(20) NOT NULL,
	activo BIT NOT NULL,
	CONSTRAINT pk_categoria PRIMARY KEY (categoria_id),
	CONSTRAINT uq_categoria_nombre UNIQUE (nombre)
);
GO

-- RESTRICCIÓN DEFAULT
CREATE TABLE categoria(
	categoria_id INT NOT NULL IDENTITY(1, 1),
	nombre VARCHAR(20) NOT NULL,
	activo BIT NOT NULL DEFAULT 1,
	CONSTRAINT pk_categoria PRIMARY KEY (categoria_id),
	CONSTRAINT uq_categoria_nombre UNIQUE (nombre)
);
GO

INSERT INTO categoria(nombre, activo) VALUES ('Carnes frías', DEFAULT);
INSERT INTO categoria(nombre) VALUES ('Lacteos');

SELECT * FROM categoria;