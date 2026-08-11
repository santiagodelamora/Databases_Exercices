/*===================================================================================================================

SQL-DQL en SQLServer

Archivo: 06-filtrado-registros-where

Descripcion: Introducción a la ejecución de las primeras consultas de recuperación de datos con filtrado de registros.

======================================================================================================================*/

/*
SINTAXIS GENERAL:

SELECT
	 columna_1, 
	 columna_2,
	 columna_n
FROM tabla
WHERE condicion;


ORDEN SINTÁCTICO DE LAS CONSULTAS
1. SELECT, TOP, DISTINCT
2. FROM
3. JOIN, ON
4. WHERE
5. GROUP BY
6. HAVING
7. ORDER BY


ORDEN DE EJECUCIÓN
1. FROM, JOIN
2. WHERE
3. GROUP BY
4. HAVING
5. SELECT
6. DISTINCT
7. ORDER BY
8. TOP
*/

-- Seleccionar los datos de los clientes donde su número de cliente sea 25
SELECT
	c.id_cliente AS [numero_cliente],
	UPPER(CONCAT(c.nombre, ' ', c.apellido_paterno, ' ', c.apellido_materno)) AS [nombre_completo]
FROM clientes AS C
WHERE id_cliente = 25;

-- Seleccionar todas las categorías que sean de cómputo
SELECT
	c.id_categoria,
	c.nombre
FROM categorias AS C
WHERE c.nombre = 'cómputo';

-- Seleccionar los datos del cliente 1


-- Seleccionar los datos de los clientes que no pertenecen al departamento 1


-- Seleccionar los productos cuyo precio sea superior a $490


-- Seleccionar los productos con existencia crítica inferior a 10 unidades


-- Seleccionar los empleados con salario de $30,000 y más


-- Seleccionar todas las ventas realizadas el 24 de diciembre de 2025
-- Importante: Las fechas deben ir entre comillas y seguir el formato AAAA-MM-DD
SELECT
	v.id_venta,
	v.fecha,
	v.id_cliente,
	v.id_empleado
FROM ventas AS v
WHERE fecha = '2025-12-24';

SELECT
	v.id_venta,
	YEAR(v.fecha) AS [Año],
	MONTH(v.fecha) AS [Mes],
	FORMAT(v.fecha,'MMMM') AS [Mes en inglés],
	UPPER(FORMAT(v.fecha,'MMMM', 'es-ES')) AS [Mes en español],
	FORMAT(v.fecha,'MMM') AS [Mes abreviado],
	FORMAT(v.fecha,'MMM', 'es-ES') AS [Mes en inglés],
	DAY(v.fecha) AS [Día],
	FORMAT(v.fecha,'dddd') AS [Día en ingles],
	FORMAT(v.fecha,'dddd', 'es-ES') AS [Día en español],
	v.id_cliente,
	v.id_empleado
FROM ventas AS v
WHERE fecha = '2025-12-24';