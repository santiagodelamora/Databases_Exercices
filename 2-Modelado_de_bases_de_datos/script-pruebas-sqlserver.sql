# Crea una base de datos
CREATE DATABASE prueba_atributos;

# Utiliza la base de datos
USE prueba_atributos;

# Crea una tabla
CREATE TABLE empleado(
	id INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido_1 VARCHAR(15),
    apellido_2 VARCHAR(15) NULL,
    fecha_ingreso DATE NOT NULL
);

# Inserta un valor
INSERT INTO empleado VALUES (1, "Reberiano", "Robles", "De la Torre", '1983-04-06'); 

# Agrega un nuevo campo
ALTER TABLE empleado ADD COLUMN
fecha_nacimiento DATE NOT NULL;

# Inserta un nuevo valor
INSERT INTO empleado VALUES (2, "Rómulo", "Robles", "Esparza", '1984-07-12', '1976-06-07');

# Muestra los datos en la tabla y separa la feha en año, mes y día
SELECT *, YEAR(fecha_ingreso) AS anio, MONTH(fecha_ingreso) AS mes, DAY(fecha_ingreso) AS dia
FROM empleado;

# Muestra todos los registros
SELECT * FROM empleado;

# Modifica la fecha de nacimiento
UPDATE empleado SET fecha_nacimiento = '1983-04-06' WHERE id = 1;

# Muestra los datos y la edad
SELECT
	nombre,
    apellido_1,
    apellido_2, 
    fecha_ingreso,
    fecha_nacimiento,
    TIMESTAMPDIFF(year, fecha_nacimiento, CURDATE()) AS edad
FROM empleado;



USE ejemplobd;
GO

CREATE TABLE alumno(
	id_alumno INT NOT NULL PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL,
	apellido_1 VARCHAR(15) NOT NULL,
	apellido_2 VARCHAR(15) NULL,
	telefono VARCHAR(13), 
	calle VARCHAR(50) NOT NULL,
	numero_interior INT NULL,
	numero_exterior INT NULL,
	fecha_nacimiento DATE NOT NULL
);

INSERT INTO alumno
VALUES (1, 'Kevin', 'Kosner', NULL, '+527731488723', 'INFIERNO', 666, NULL, '2007-02-18');

INSERT INTO alumno (id_alumno, nombre, apellido_1, telefono, calle, numero_exterior, numero_interior, fecha_nacimiento)
VALUES (2, 'José Luis', 'Hernandez', '+527731488723', 'Ángel', 666, NULL, '1983-04-06');

INSERT INTO alumno (id_alumno, nombre, apellido_1, apellido_2, calle, fecha_nacimiento)
VALUES (3, 'Jimena', 'Valdez', 'Delgadillo', '5 de mayo', '2007-06-12');

SELECT *, DATEDIFF(YEAR, fecha_nacimiento, GETDATE()) AS edad
FROM alumno;



CREATE TABLE categoria2(
	categoria_id INT NOT NULL PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL
);

CREATE TABLE productos2(
	producto_id INT NOT NULL,
	nombre VARCHAR(30) NOT NULL,
	precio MONEY NOT NULL,
	existencia INT NOT NULL,
	categoria_id INT NULL,
	CONSTRAINT fk_producto2_categoria2
	FOREIGN KEY (categoria_id)
	REFERENCES categoria2(categoria_id)
);

SELECT * FROM categoria2;

SELECT * FROM productos2
WHERE categoria_id = 1;