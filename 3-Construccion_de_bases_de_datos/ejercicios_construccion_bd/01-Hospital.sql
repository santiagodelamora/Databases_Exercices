-- Crea la base de datos
CREATE DATABASE hospital;

-- Usa la base de datos
USE hospital;

-- Crea la tabla paciente
CREATE TABLE paciente(
	paciente_id INT NOT NULL IDENTITY(1, 1),
	nombre VARCHAR(30) NOT NULL,
	apellido_paterno VARCHAR(20) NOT NULL,
	apellido_materno VARCHAR(20) NULL,
	fecha_nacimiento DATE NOT NULL,
	CONSTRAINT pk_paciente PRIMARY KEY (paciente_id)
);

-- Crea la tabla expediente
CREATE TABLE expediente(
	expediente_id INT NOT NULL IDENTITY(1, 1),
	fecha_apertura DATE NOT NULL,
	tipo_sangre VARCHAR(3) NOT NULL,
	fecha_nacimiento DATE NOT NULL,
	paciente_id INT NOT NULL,
	CONSTRAINT pk_expediente PRIMARY KEY (expediente_id),
	CONSTRAINT fk_expediente_paciente FOREIGN KEY (paciente_id) REFERENCES paciente(paciente_id)
);