-- Crea la base de datos
CREATE DATABASE universidad;

-- Usa la base de datos
USE universidad;

-- Crea la tabla profesor
CREATE TABLE profesor(
	profesor_id INT NOT NULL IDENTITY(1, 1),
	nombre VARCHAR(30) NOT NULL,
	apellido_paterno VARCHAR(20) NOT NULL,
	apellido_materno VARCHAR(20) NULL,
	CONSTRAINT pk_profesor PRIMARY KEY (profesor_id)
);

-- Crea la tabla especialidad
CREATE TABLE especialidad(
	especialidad_id INT NOT NULL IDENTITY(1, 1),
	profesor_id INT NOT NULL,
	nombre VARCHAR(35) NOT NULL,
	CONSTRAINT pk_especialidad PRIMARY KEY (especialidad_id),
	CONSTRAINT fk_especialidad_profesor FOREIGN KEY (profesor_id) REFERENCES profesor(profesor_id),
	CONSTRAINT uq_especialidad_nombre UNIQUE (nombre)
);

-- Crea la tabla curso
CREATE TABLE curso(
	curso_id INT NOT NULL IDENTITY(1, 1),
	nombre VARCHAR(50) NOT NULL,
	creditos INT,
	profesor_id INT NULL,
	CONSTRAINT pk_curso PRIMARY KEY (curso_id),
	CONSTRAINT fk_curso_profesor FOREIGN KEY (profesor_id) REFERENCES profesor(profesor_id)
);