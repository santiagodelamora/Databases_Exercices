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


-- Comparaciones con expresiones calculadas
-- WHERE también puede evaluar un cálculo

-- Mostrar productos cuyo valor del inventario sea mayor a 50,000
SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	(p.precio * p.existencia) AS valor_inventario
FROM productos AS p
WHERE (p.precio * p.existencia) > 50000
ORDER BY valor_inventario DESC;

-- Operador lógico ANDA
-- Mostrar productos con precio entre $200 y $300 que además tenga menos de 50 unidades
SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	(p.precio * p.existencia) AS valor_inventario
FROM productos AS p
WHERE p.precio >= 200 AND p.precio <= 300 AND p.existencia < 50;

-- Clausula BETWEEN
SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	(p.precio * p.existencia) AS valor_inventario
FROM productos AS p
WHERE (p.precio BETWEEN 200 AND 300) AND p.existencia < 50;

-- Mostrar los empleados del departamento 1 cuyo salario sea superior a $25,000
SELECT
	e.id_empleado,
	e.nombre,
	e.salario,
	e.id_departamento
FROM empleados AS e
WHERE e.id_departamento = 1 AND e.salario > 25000;

-- Mostrar los productos con existencia inferior a 10 o superior a 190
SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	(p.precio * p.existencia) AS valor_inventario
FROM productos AS p
WHERE p.existencia < 10 OR p.existencia > 190;

-- Mostrar productos que no tengan un precio mayor a 400
SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	(p.precio * p.existencia) AS valor_inventario
FROM productos AS p
WHERE NOT p.precio > 400;

-- Seleccionar los empleados que pertenecen al departamento 1, al departamento 2
-- y con salario mayor a $25,000
SELECT
	e.id_empleado,
	e.nombre,
	e.salario,
	e.id_departamento
FROM empleados AS e
WHERE (e.id_departamento BETWEEN 1 AND 2) AND e.salario > 25000;

-- Operador BETWEEN
-- BETWEEN permite comprobar si un valor se encuentra dentro de un rango inclusivo
/*
Sintaxis

WHERE columna BETWEEN limite_inferior AND limite_superior;
*/

-- Mostrar los empleados con salario entre $15,000.0 y $20,000.0 incluyendo ambos límites
SELECT
	e.id_empleado,
	e.nombre,
	e.salario
FROM empleados AS e
WHERE e.salario BETWEEN 15000.0 AND 20000.0
ORDER BY 3 DESC;

SELECT
	e.id_empleado,
	e.nombre,
	e.salario
FROM empleados AS e
WHERE e.salario >= 15000.0 AND e.salario <= 20000.0
ORDER BY 3 DESC;

-- Seleccionar los productos donde el precio esté entre $100 y $200
SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	(p.precio * p.existencia) AS valor_inventario
FROM productos AS p
WHERE p.precio >= 100 AND p.precio <= 200;

-- Seleccionar las ventas realizadas del 1ro de enero de 2025 al 10 de enero de 2025
SELECT
	v.id_venta AS numero_venta,
	v.id_cliente AS cliente,
	v.id_empleado AS vendedor,
	v.fecha AS fecha_venta,
	UPPER(FORMAT(v.fecha, 'MMMM', 'es-ES')) AS mes_venta,
	UPPER(FORMAT(v.fecha, 'dddd', 'es-ES')) AS dia_venta,
	DATEPART(YEAR, v.fecha) AS año_venta
FROM ventas AS v
WHERE v.fecha BETWEEN '2025-01-01' AND '2025-01-10';

-- Operador NOT BETWEEN
-- Recupera valores que se encuentran fuera de un rango

-- Seleccionar los productos que no se encuentren en el rango de precios 100 y 400
SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	(p.precio * p.existencia) AS valor_inventario
FROM productos AS p
WHERE p.precio NOT BETWEEN 100 AND 400;

-- Operador IN
-- Permite comprobar una columna cin una lista de valores
/*
Síntaxis

WHERE columna IN (valor_1, valor_2, valor_3, valor_n)

Es equivalente a varias condiciones conectadas con OR
*/

-- Mostrar los productos pertenecientes a las categorías 1, 7, 12
SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.id_categoria
FROM productos AS p
WHERE p.id_categoria IN (1, 7, 12);

SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.id_categoria
FROM productos AS p
WHERE p.id_categoria = 1 OR p.id_categoria = 7 OR p.id_categoria = 12;

-- Seleccionar los departamentos de ventas, TI y dirección
SELECT
	d.id_departamento,
	d.nombre
FROM departamentos AS d
WHERE d.nombre IN ('ventas', 'TI', 'dirección');

-- NOT IN
-- Excluye los valores incluidos en la lista

-- Mostrar los datos de los empleados que no pertenezcan ni al departamento 1 ni al 2
SELECT
	e.id_empleado,
	e.nombre,
	e.id_departamento
FROM empleados AS e
WHERE e.id_empleado NOT IN (1, 2);

-- LIKE
/*
Permite buscar valores dentro de valores de texto

SINTAXIS
WHERE columna LIKE 'patron'

Los patrones pueden tener comodines
COMODIN   |   SIGNIFICADO
%         |   Cero, uno a varios caracteres
-         |   Exactamente un caracter
[abc]     |   Un carácter incluido en la lista
[a-z]     |   Un caracter incluido en el rango
[^abc]    |   Un caracter no incluido en la lista

Comodin %
El símbolo % representa cualquier cantidad de caracteres, incluyendo cero caracteres
WHERE nombre LIKE 'cliente%'
Significado: valores que comienzan con cliente 1

TERMINA CON
WHERE correo LIKE '%email.com'
Significado: Valores que terminan con mail.com

CONTIENE
WHERE nombre LIKE '%a%'
Significado: Valores que contienen el caracter a en cualquier posicion
*/

-- Mostrar los productos donde el codigo comienze con P001
SELECT
	p.codigo,
	p.nombre,
	p.precio
FROM productos AS p
WHERE p.codigo LIKE 'P001%';

-- Mostrar todos los datos de los cliente en donde su correo termina con 1@gmail.com
SELECT
	c.id_cliente,
	c.nombre,
	c.correo
FROM clientes AS c
WHERE c.correo LIKE '%1@gmail.com';

-- Mostrar los datos de los productos donde el nombre contenga el caracter 1
SELECT
	p.codigo,
	p.nombre,
	p.precio
FROM productos AS p
WHERE p.nombre LIKE '%1%'