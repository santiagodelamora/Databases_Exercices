-- Crear la base de datos
CREATE DATABASE comercializadora;
GO

-- Utilizar la base de datos
USE comercializadora;
GO

-- Tabla producto
CREATE TABLE producto(
	producto_id CHAR(5) NOT NULL,
	fabricante_id CHAR(3) NOT NULL,
	descripcion VARCHAR(40) NOT NULL,
	precio DECIMAL(10, 2) NOT NULL,
	existencia INT NOT NULL,
	CONSTRAINT pk_producto PRIMARY KEY (producto_id, fabricante_id),
	CONSTRAINT uq_producto_descripcion UNIQUE (descripcion),
	CONSTRAINT ck_producto_precio CHECK (precio > 0.0),
	CONSTRAINT ck_producto_existencia CHECK (existencia BETWEEN 1 AND 100)
);
GO

