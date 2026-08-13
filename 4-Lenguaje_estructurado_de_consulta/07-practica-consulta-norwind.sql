/*===================================================================================================================

SQL-DQL en SQLServer

Archivo: 08-practica-consulta-norwind.sql

Descripcion: Consultas usando la base de datos norwind

======================================================================================================================*/

-- Mostrar las ventas realizadas en Francia, brazil y belgica
-- de 10 de julio e 1996 al 31 de Diciembre de 1998, que tenga Region de Envio,
-- para los clientes VICTE, HANAR y SUPRD, y ordenados por fecha de pedido de la mas
-- cercana a la mas antigua.
SELECT
	o.OrderID AS nombre_orden,
	o.CustomerID AS cliente,
	o.ShipCountry AS [lugar_envio],
	o.OrderDate AS 'fecha_orden',
	UPPER(FORMAT(o.OrderDate, 'MMMM', 'es-Es')) AS mes_orden,
	UPPER(FORMAT(o.OrderDate, 'dddd', 'es-Es')) AS dia_orden,
	DATEPART(YEAR, o.OrderDate) AS año_orden,
	o.ShipRegion AS region
FROM Orders AS o
WHERE o.ShipCountry IN ('France', 'Brazil', 'Belgium')
	AND o.CustomerID IN ('VICTE', 'HANAR', 'SUPRD')
	AND o.ShipRegion IS NOT NULL
	AND o.OrderDate BETWEEN '1996-07-10' AND '1998-12-24'
ORDER BY fecha_orden DESC;

SELECT
	OrderID,
	OrderDate,
	ShipRegion
FROM Orders
WHERE ShipRegion IS NOT NULL;

SELECT
	o.OrderID,
	o.OrderDate,
	P.ProductName,
	p.UnitPrice
FROM Orders AS o
INNER JOIN [Order Details] AS od
ON o.OrderID = od.OrderID
INNER JOIN Products AS p
ON od.ProductID = p.ProductID
WHERE o.OrderDate BETWEEN '1996-07-18' AND '1998-12-20'
		AND p.ProductName LIKE 'chan%';

SELECT
	o.OrderID,
	o.OrderDate,
	P.ProductName,
	p.UnitPrice
FROM Orders AS o
INNER JOIN [Order Details] AS od
ON o.OrderID = od.OrderID
INNER JOIN Products AS p
ON od.ProductID = p.ProductID
WHERE o.OrderDate BETWEEN '1996-07-18' AND '1998-12-20'
		AND p.ProductName = 'chan';

SELECT
	c.CustomerID,
	c.CompanyName,
	c.ContactName
FROM Costumers AS c
WHERE c.CompanyName LIKE '%ta%';

-- Comodin de un caracter
-- El guión bajo _ representa exactamente un caracter

-- SELECCIONAR LOS DATOS DE LOS PRODUCTOS DONDE EL CÓDIGO COMIENZE CON P000 y después exactamente un caracter adicional
SELECT
	p.codigo,
	p.nombre,
	p.precio
FROM productos AS p
WHERE p.codigo LIKE 'P000_';