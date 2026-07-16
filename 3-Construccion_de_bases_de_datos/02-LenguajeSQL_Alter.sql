CREATE DATABASE bdejemplo;
GO

USE bdejemplo;
GO

-- ALTER TABLE
CREATE TABLE alumno(
	alumno_id INT NOT NULL IDENTITY(1, 1),
	nombre VARCHAR(20) NOT NULL,
	apellido_paterno VARCHAR(15) NOT NULL,
);

-- Agregar una columna
ALTER TABLE alumno
ADD telefono VARCHAR(20);

-- Agregar varias columnas
ALTER TABLE alumno
ADD curp CHAR(18),
    rfc CHAR(13) NOT NULL;
GO

ALTER TABLE alumno
ADD apellido_materno VARCHAR(15) NULL;

-- Modificar un campo y su tipo de dato
ALTER TABLE alumno
ALTER COLUMN telefono VARCHAR(30);
GO

-- Restricciones
-- PRIMARY KEY
ALTER TABLE alumno
ADD CONSTRAINT pk_alumno PRIMARY KEY (alumno_id);

-- FOREIGN KEY
CREATE TABLE carrera(
	carrera_id INT NOT NULL IDENTITY(1, 1),
	nombre VARCHAR(30) NOT NULL
);
GO

ALTER TABLE carrera
ADD CONSTRAINT pk_carrera PRIMARY KEY (carrera_id);

ALTER TABLE alumno
ADD carrera_id INT NOT NULL;
GO

ALTER TABLE alumno
ADD CONSTRAINT fk_alumno_carrera FOREIGN KEY (carrera_id) REFERENCES carrera(carrera_id)
ON DELETE CASCADE
ON UPDATE NO ACTION;
GO

ALTER TABLE alumno
ADD CONSTRAINT pk_alumno PRIMARY KEY (alumno_id);

-- CHECK
ALTER TABLE alumno
ADD edad INT NOT NULL;
GO

-- Restricción CHECK
ALTER TABLE alumno
ADD CONSTRAINT ck_alumno_edad CHECK (edad > 0);

ALTER TABLE alumno
ADD CONSTRAINT ck_alumno_edad CHECK (telefono LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]');

INSERT INTO carrera VALUES ('Tecnlogías de la Información');
INSERT INTO alumno VALUES ('Monico Toribio', 'Cervantes', 'Chimbo', '4444444', 'dksndksnd', 'jbjhjhloj', 1, 18);

DELETE FROM alumno;

-- Restricción DEFAULT
ALTER TABLE alumno
ADD activo BIT NOT NULL;

ALTER TABLE alumno
ADD CONSTRAINT df_alumno_activo DEFAULT 1 FOR activo

DELETE FROM carrera;

-- UNIQUE
ALTER TABLE carrera
ADD CONSTRAINT uq_carrera_nombre UNIQUE (nombre);

-- Eliminar restricciones
-- Restricción FK
ALTER TABLE alumno
DROP CONSTRAINT fk_alumno_carrera;

-- Eliminar las PRIMARY KEYS
ALTER TABLE alumno
DROP CONSTRAINT pk_alumno;

ALTER TABLE carrera
DROP CONSTRAINT pk_carrera;

-- Eliminar CHECK
ALTER TABLE alumno
DROP CONSTRAINT ck_alumno_edad;

ALTER TABLE alumno
DROP CONSTRAINT ck_alumno_telefono;

-- Eliminar UNIQUE
ALTER TABLE carrera
DROP CONSTRAINT uq_carrera_nombre;

-- Eliminar columna
ALTER TABLE alumno
DROP COLUMN carrera_id;

-- DROP (elimina objetos de la base de datos completos: tables, views, stored procedures, triggers, databases)
DROP TABLE carrera;
DROP TABLE alumno;

-- Eliminar la base de datos
USE master;
GO

IF DB_ID('bdejemplo') IS NOT NULL
BEGIN
	DROP DATABASE bdejemplo;
END