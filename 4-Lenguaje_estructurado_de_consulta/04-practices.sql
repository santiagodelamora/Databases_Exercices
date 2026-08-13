/*===================================================================================================================

SQL-DQL en SQLServer

Archivo: 04-practices

Descripcion: Práctica con las consultas (SELECT)

======================================================================================================================*/


-- Verificar la existencia de datos en las tablas
SELECT COUNT(*) FROM [dbo].[categorias];
SELECT COUNT(*) FROM [dbo].[ciudades];
SELECT COUNT(*) FROM [dbo].[clientes];
SELECT COUNT(*) FROM [dbo].[departamentos];
SELECT COUNT(*) FROM [dbo].[detalle_ventas];
SELECT COUNT(*) FROM [dbo].[empleados];
SELECT COUNT(*) FROM [dbo].[estados];
SELECT COUNT(*) FROM [dbo].[productos];
SELECT COUNT(*) FROM [dbo].[proveedores];
SELECT COUNT(*) FROM [dbo].[ventas];


/*===================================================================================================================

Instrucción SELECT, es la instrucción más utilizada en SQL.
Su objetivo es consultar información de una o varias tablas

Síntaxis

SELECT
	columna_1,
	columna_2,
	columna_3,
	columna_n
FROM nombre_tabla;

======================================================================================================================*/

-- Mostrar todos los estados de la república
SELECT *
FROM estados; -- no es recomendable usarla cuando hay muchos datos ya que devuelve todos los registros
GO

SELECT
	nombre
FROM estados;
GO

-- Mostrar los departamentos
SELECT nombre
FROM departamentos;
GO

-- Mostrar el nombre del proveedor, el teléfono, y su contacto
SELECT
	empresa,
	telefono,
	contacto
FROM proveedores;
GO

-- Alias de columnas


-- Mostrar los nombres de los estados
SELECT
	nombre 'Nombre del estado'
FROM estados;

SELECT
	nombre AS 'Nombre del estado'
FROM estados;

SELECT
	nombre Nombre_del_estado
FROM estados;

SELECT
	nombre AS Nombre_del_estado
FROM estados;

SELECT
	nombre [Nombre del estado]
FROM estados;

SELECT
	nombre AS [Nombre del estado]
FROM estados;

SELECT COUNT(*) AS [Total de ventas Detalle]
FROM detalle_ventas;

-- Mostrar el código, nombre y precio pero con nombres más adecuados para cada consulta
SELECT
	codigo AS codigo_producto,
	UPPER(nombre) AS producto,
	precio AS precio_unitario
FROM productos;

-- TODO: VER CAMPOS CALCULADOS

-- Orden de como escribimos la consulta
/*
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
*/

-- Orden de ejecución de SQLServer
/*
FROM
WHERE
GROUP BY
HAVING
SELECT
ORDER BY
*/