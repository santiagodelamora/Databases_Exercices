/*===================================================================================================================

SQL-DQL en SQLServer

Archivo: 05-consultas-basicas

Descripcion: Introducción a la ejecución de las primeras consultas de recuperación de datos.

======================================================================================================================*/

USE comercial_db;
GO

-- Utilizando el operador asterisco (*), no es muy recomendada
-- * significa todas las columnas
SELECT *
FROM productos;

-- Seleccionar columnas necesarias (proyección)
SELECT 
	nombre
FROM estados;

SELECT
	codigo,
	nombre,
	precio
FROM productos;

SELECT 
	nombre,
	apellido_paterno,
	telefono,
	correo
FROM clientes;

-- Alias de columna
-- Es un nombre asignado a una columna dentro del resultado de una consulta
SELECT
	codigo AS codigo_producto,
	nombre AS nombre_producto,
	precio AS precio_unitario
FROM productos;

SELECT
	codigo AS [codigo producto],
	nombre AS [nombre producto],
	precio AS [precio unitario]
FROM productos;

SELECT
	codigo AS 'codigo producto',
	nombre AS 'nombre producto',
	precio AS 'precio unitario'
FROM productos;

-- Otra forma de poner alias (no recomendada)
SELECT
	codigo codigo_producto,
	nombre nombre_producto,
	precio precio_unitario
FROM productos;

-- Alias de tabla
SELECT 
	p.codigo,
	p.nombre,
	p.precio
FROM productos AS p;

SELECT 
	productos.codigo,
	productos.nombre,
	productos.precio
FROM productos;


SELECT 
	productos.id_categoria AS [numero categoria],
	productos.nombre AS [nombre_categoria],
	id_producto AS [numero_producto],
	categorias.nombre AS [nombre producto],
	precio,
	existencia
FROM categorias
INNER JOIN productos
ON categorias.id_categoria = productos.id_categoria;

SELECT 
	c.id_categoria AS [numero categoria],
	c.nombre AS [nombre_categoria],
	p.id_producto AS [numero_producto],
	p.nombre AS [nombre producto],
	p.precio,
	p.existencia
FROM categorias AS c
INNER JOIN productos AS p
ON c.id_categoria = p.id_categoria;

-- Columna calculada
-- Seleccionar los datos de los productos y el valor del inventario
SELECT
	p.codigo AS #,
	p.nombre AS [nombre_producto],
	p.precio AS [precio_producto],
	p.existencia AS [existencia_producto],
	(precio * existencia) AS [valor_inventario]
FROM productos AS p;

-- Seleccionar los datos de las ventas, número de venta, cantidad vendida,
-- precio, descuento y calcular el importe bruto , importe con descuento
-- (importe bruto por descuento entre 100) y
-- el importe neto (importe bruto por 1 menos el descuento entre 100)
SELECT 
	dv.id_venta AS [#venta],
	dv.cantidad AS [cantidad_vendida],
	dv.precio AS [precio venta],
	dv.descuento AS [descuento],
	(dv.cantidad * dv.precio) AS [importe_bruto],
	(dv.cantidad * dv.precio * dv.descuento / 100.0) AS [importe_descuento],
	(dv.cantidad * dv.precio * (1 - descuento / 100.0)) AS [importe neto]
FROM detalle_ventas AS dv;

-- Uso de DISTINCT
-- Elimina del resultado las filas que tengan valores repetidos en todas las columnas seleccionadas
/*
SELECT DISTINCT nombre_columna
FROM tabla;
*/

-- Ejemplo sin DISTINCT
-- Selecciona los sexos de los clientes
SELECT sexo
FROM clientes;

-- Ejemplo con DISTINCT
SELECT DISTINCT
	sexo
FROM clientes;

-- Seleccionar los distintos descuentos que se han aplicado a las ventas
SELECT DISTINCT
	dv.descuento
FROM detalle_ventas AS dv;

-- Seleccionar los distintos departamentos a los que pertenecen los empleados
SELECT DISTINCT
	e.id_departamento AS [departamento]
FROM empleados AS e;

-- DISTINCT para  varias columnas
-- cuando se utiliza con varias columnas, se evalua la combinación completa
SELECT DISTINCT
	p.id_categoria,
	p.id_proveedor
FROM productos AS p;

-- Uso de TOP 
-- Limita la cantidad de filas devueltas por una columna
/*
SELECT TOP(cantidad)
	columna_1,
	columna_2,
	columna_3
FROM tabla;
*/

-- Seleccionar los cinco primeros productos encontrados en la tabla productos
SELECT TOP(15)
	id_producto,
	codigo
FROM productos AS p;

-- Seleccionar los 5 primeros códigos, nombres, precios, número de existencia
-- y el número de existencia de la tabla productos
SELECT TOP(5)
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	(p.precio * p.existencia) AS valor_inventario
FROM productos AS p;

-- TOP con porcentaje
-- SQLServer permite limitar el resultado mediante porcentajes
/*
SELECT TOP(porcentaje) PERCENT
	columnas
FROM tabla
*/

-- Seleccionar el 10% de los registros de la tabla productos mostrando el número de
-- producto, código y nombre
SELECT TOP(10) PERCENT
	p.id_producto,
	p.codigo,
	p.nombre
FROM productos AS p;

-- Seleccionar los tres primeros descuentos distintos
SELECT DISTINCT TOP(3)
	dv.descuento
FROM detalle_ventas AS dv
ORDER BY dv.descuento DESC;