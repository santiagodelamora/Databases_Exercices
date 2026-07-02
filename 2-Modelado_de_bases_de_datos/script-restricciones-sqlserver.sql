CREATE DATABASE bd_constraints;
GO

USE bd_constraints;

-- Razón de cardinalidad de 1:1
CREATE TABLE paciente(
	NumPaciente INT NOT NULL,
	Nombre VARCHAR(30) NOT NULL,
	Apellido1 VARCHAR(20) NOT NULL,
	Apellido VARCHAR(20) NULL,
	FechaNacimiento DATE NOT NULL
	CONSTRAINT pk_paciente PRIMARY KEY (NumPaciente)
);

CREATE TABLE expediente (
	NumExp INT NOT NULL,
	FechaApertura DATE NOT NULL,
	TipoDeSangre CHAR(3) NOT NULL,
	paciente INT NOT NULL,
	CONSTRAINT pk_expediente PRIMARY KEY (NumExp),
	CONSTRAINT unique_numpaciente UNIQUE(paciente),
	CONSTRAINT fk_expediente_paciente FOREIGN KEY (paciente) REFERENCES paciente(NumPaciente)
);

SELECT GETDATE();

INSERT INTO paciente
VALUES (1, 'Kevin', 'Kosner', 'López', '2007-02-18'),
(2, 'Daniel', 'Carreón', NULL, '2005-01-30');

INSERT INTO paciente
VALUES (3, 'Luis Fernando', 'Nieto', NULL, '2007-07-04')

SELECT * FROM paciente;

INSERT INTO expediente
VALUES (1, GETDATE(), '+O', 1);

INSERT INTO expediente
VALUES (2, GETDATE(), '+A', 2);

INSERT INTO expediente
VALUES (3, GETDATE(), '+B', 3);

SELECT
	e.NumExp,
	e.FechaApertura,
	e.TipoDeSangre,
	CONCAT(p.Nombre, ' ', p.Apellido1, ' ', p.Apellido)
	AS [Nombre Completo]
FROM expediente AS e
INNER JOIN paciente AS p
ON e.paciente = p.NumPaciente;

GO

-- Razón de cardinalidad de 1:N
CREATE TABLE profesor (
	NumProf INT NOT NULL PRIMARY KEY,
	Nombre VARCHAR(50) NOT NULL,
	Apellido1 VARCHAR(30) NOT NULL,
	Apellido2 VARCHAR(30)
);

GO

CREATE TABLE curso(
	NumCurso INT NOT NULL,
	Nombre VARCHAR(20) NOT NULL,
	Creditos INT NOT NULL,
	NumProf INT NOT NULL,
	CONSTRAINT pk_curso PRIMARY KEY (NumCurso),
	CONSTRAINT unique_nombre UNIQUE (Nombre),
	CONSTRAINT check_creditos CHECK (Creditos > 0),
	CONSTRAINT fk_curso_profesor FOREIGN KEY (NumProf) REFERENCES profesor(NumProf)
);

GO

CREATE TABLE especialidad(
	NumEsp INT NOT NULL,
	NumProf INT NOT NULL,
	NombreEsp VARCHAR(30) NOT NULL,
	CONSTRAINT pk_especialidad PRIMARY KEY (NumEsp, NumProf),
	CONSTRAINT unique_nombreesp UNIQUE (NombreEsp),
	CONSTRAINT fk_especialidad_profesor FOREIGN KEY (NumProf) REFERENCES profesor(NumProf)
);

INSERT INTO profesor
VALUES (1, 'José Luis', 'Herrera', 'Gallardo'),
(2, 'Luis', 'Nieto', 'Sanchez');

INSERT INTO profesor
VALUES ('José Ángel', 'Pérez', 'Hernández');

GO

INSERT INTO curso
VALUES (1, 'Bases de datos', 50, 1);

INSERT INTO curso
VALUES (2, 'Tópicos de calidad para el diseño de software', 30, 2);

INSERT INTO curso
VALUES (3, 'Programación Orientada a Objetos', 30, 1);

INSERT INTO especialidad
VALUES (1, 1, 'AWS'),
(2, 1, 'SQL SERVER'),
(3, 2, 'Redes'),
(4, 2, 'Scrum'),
(5, 2, 'Linux');

SELECT * FROM especialidad
ORDER BY NombreExp DESC;

SELECT
	p.nombre,
	p.Apellido1,
	p.Apellido2,
	c.Nombre,
	c.Creditos,
	e.NombreEsp
FROM profesor AS p
INNER JOIN curso AS c
ON p.NumProf = c.NumProf
INNER JOIN especialidad AS e
ON p.NumProf = e.NumProf
ORDER BY 1;

-- Cardinalidad de M:N
CREATE TABLE alumno (
	IdAlumno INT NOT NULL PRIMARY KEY,
	Matricula VARCHAR(10) NOT NULL,
	Nombre NVARCHAR(30) NOT NULL,
	Apellido1 NVARCHAR(20) NOT NULL,
	Apellido2 NVARCHAR(20) NULL,
	Semestre INT NOT NULL,
	CONSTRAINT unique_matricula UNIQUE(matricula),
	CONSTRAINT check_semestre CHECK (Semestre > 0 AND Semestre <= 10)
);

CREATE TABLE materia (
	IdMateria INT NOT NULL,
	NombreMat NVARCHAR(20) NOT NULL,
	Creditos INT NOT NULL,
	CONSTRAINT pk_materia PRIMARY KEY (IdMateria),
	CONSTRAINT unique_nombremat UNIQUE(NombreMat),
	CONSTRAINT chk_creditos CHECK (Creditos BETWEEN 1 AND 60)
);
GO

CREATE TABLE inscribe (
	IdMateria INT NOT NULL,
	IdAlumno INT NOT NULL,
	FechaIncripcion DATE NOT NULL,
	Calificacion DECIMAL(10, 2) NOT NULL,
	CONSTRAINT pk_inscribe PRIMARY KEY (IdMateria, IdAlumno),
	CONSTRAINT fk_inscribe_materia FOREIGN KEY (IdMateria) REFERENCES materia(IdMateria),
	CONSTRAINT fk_inscribe_alumno FOREIGN KEY (IdAlumno) REFERENCES alumno(IdAlumno)
);
GO