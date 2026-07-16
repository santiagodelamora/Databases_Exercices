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

CREATE DATABASE express_patito;
GO

USE express_patito;
GO

-- Primera forma de construcción (no utilizar en el futuro)
CREATE TABLE producto(
	producto_id INT NOT NULL IDENTITY(1, 1),
	nombre VARCHAR(20) NOT NULL UNIQUE,
	descripcion VARCHAR(80),
	precio DECIMAL(10, 2) NOT NULL CHECK (precio > 0.0),
	existencia INT NOT NULL CHECK(existencia > 0 AND existencia <= 100),
	activo BIT NOT NULL DEFAULT 1,
	tipo CHAR(1) NOT NULL CHECK(tipo = 'r' OR tipo = 'p')
);
GO

INSERT INTO producto VALUES ('pitufo', 'corrientona', 12.50, 30, DEFAULT, 'p');
INSERT INTO producto VALUES ('Quesadita', 'sabrosona', 12.50, 34, DEFAULT, 'r');
INSERT INTO producto(nombre, precio, existencia, tipo) VALUES ('Pantera rosa', 89.9, 56, 'p');

DROP TABLE producto;

-- Segunda forma de construcción (Restricción por columna)
CREATE TABLE producto(
	producto_id INT NOT NULL IDENTITY(1, 1) CONSTRAINT pk_producto PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL CONSTRAINT uq_producto_nombre UNIQUE,
	descripcion VARCHAR(80),
	precio DECIMAL(10, 2) NOT NULL CONSTRAINT ck_producto_precio CHECK (precio > 0.0),
	existencia INT NOT NULL CONSTRAINT ck_producto_existencia CHECK(existencia BETWEEN 1 AND 100),
	activo BIT NOT NULL CONSTRAINT df_producto_activo DEFAULT 1,
	tipo CHAR(1) NOT NULL CONSTRAINT ck_producto_tipo CHECK(tipo IN ('r', 'p'))
);
GO

-- Tercer forma de construccion (definición al final)
CREATE TABLE producto(
	producto_id INT NOT NULL IDENTITY(1, 1),
	nombre VARCHAR(20) NOT NULL,
	descripcion VARCHAR(80),
	precio DECIMAL(10, 2) NOT NULL,
	existencia INT NOT NULL,
	activo BIT NOT NULL CONSTRAINT df_producto_activo DEFAULT 1,
	tipo CHAR(1) NOT NULL,
	CONSTRAINT pk_producto PRIMARY KEY (producto_id),
	CONSTRAINT uq_producto_nombre UNIQUE (nombre),
	CONSTRAINT ck_producto_precio CHECK (precio > 0.0),
	CONSTRAINT ck_producto_existencia CHECK (existencia BETWEEN 1 AND 100),
	CONSTRAINT ck_producto_tipo CHECK (tipo IN ('r', 'p')),
);
GO

SELECT * FROM producto;

-- Restricción de FOREIGN KEY o Integridad Referencial
CREATE TABLE proveedor(
	proveedor_id INT NOT NULL IDENTITY(1, 1),
	empresa VARCHAR(20) NOT NULL,
	limite_credito NUMERIC(10, 2) NOT NULL,
	activo BIT NOT NULL CONSTRAINT df_proveedor_activo DEFAULT 1,
	created_at DATETIME2 NOT NULL CONSTRAINT df_proveedor_created_at DEFAULT SYSDATETIME(),
	update_at DATETIME2 NOT NULL CONSTRAINT df_proveedor_update_at DEFAULT SYSDATETIME(),
	CONSTRAINT pk_proveedor PRIMARY KEY (proveedor_id),
	CONSTRAINT uq_proveedor_empresa UNIQUE (empresa),
	CONSTRAINT ck_proveedor_limite_credito CHECK (limite_credito BETWEEN 100 AND 50000),
);

SELECT SYSDATETIME();

CREATE TABLE contacto_proveedor(
	contacto_id INT IDENTITY(1, 1) CONSTRAINT pk_contacto_proveedor PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL,
	apellido_paterno VARCHAR(20) NOT NULL,
	apellido_materno VARCHAR(20) NULL,
	telefono VARCHAR(18) NOT NULL,
	proveedor_id INT NOT NULL
	CONSTRAINT fk_contacto_proveedor_proveedor FOREIGN KEY (proveedor_id) REFERENCES proveedor(proveedor_id)
);
GO

INSERT INTO proveedor(empresa, limite_credito)
VALUES ('cOCA cOLA', 45000), ('Pepsi', 50000), ('Bimbo', 8000);

SELECT * FROM proveedor;

INSERT INTO contacto_proveedor(nombre, apellido_paterno, apellido_materno, telefono, proveedor_id)
VALUES ('Luis', 'Aguilar', NULL, '798497988', 2),
		('Casilda', 'Cabeza de vaca', NULL, '7987953212', 1),
		('Karen', 'Cabeza', 'Grande', '73314815', 3);

SELECT * FROM contacto_proveedor;

-- Elimina todos los registros de la tabla y reinicia los IDENTITY y que no tenga referencias
TRUNCATE TABLE contacto_proveedor;
TRUNCATE TABLE proveedor;

DROP TABLE contacto_proveedor;

-- ON DELETE y ON UPDATE NO ACTION
CREATE TABLE contacto_proveedor(
	contacto_id INT IDENTITY(1, 1) CONSTRAINT pk_contacto_proveedor PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL,
	apellido_paterno VARCHAR(20) NOT NULL,
	apellido_materno VARCHAR(20) NULL,
	telefono VARCHAR(18) NOT NULL,
	proveedor_id INT NOT NULL
	CONSTRAINT fk_contacto_proveedor_proveedor FOREIGN KEY (proveedor_id) REFERENCES proveedor(proveedor_id)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
);
GO

INSERT INTO proveedor(empresa, limite_credito)
VALUES ('cOCA cOLA', 45000), ('Pepsi', 50000), ('Bimbo', 8000);
INSERT INTO contacto_proveedor(nombre, apellido_paterno, apellido_materno, telefono, proveedor_id)
VALUES ('Luis', 'Aguilar', NULL, '798497988', 2),
		('Casilda', 'Cabeza de vaca', NULL, '7987953212', 1),
		('Karen', 'Cabeza', 'Grande', '73314815', 3);

SELECT * FROM contacto_proveedor;