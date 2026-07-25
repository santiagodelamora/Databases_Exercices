-- Crea la base de datos
CREATE DATABASE venta_productos;
GO

-- Usa la base de datos
USE venta_productos;
GO

-- Crea la tabla cliente
CREATE TABLE cliente(
	cliente_id INT NOT NULL IDENTITY(1, 1) CONSTRAINT pk_cliente PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL,
	apellido_paterno VARCHAR(20) NOT NULL,
	apellido_materno VARCHAR(20) NULL,
);
GO

-- Crea la tabla pedido
CREATE TABLE pedido(
	pedido_id INT NOT NULL IDENTITY(1, 1) CONSTRAINT pk_pedido PRIMARY KEY,
	fecha DATE NOT NULL CONSTRAINT df_pedido_fecha DEFAULT GETDATE(),
	cliente_id INT NOT NULL CONSTRAINT fk_pedido_cliente FOREIGN KEY REFERENCES cliente(cliente_id)
);
GO

-- Crea la tabla producto
CREATE TABLE producto(
	producto_id INT NOT NULL IDENTITY(1, 1) CONSTRAINT pk_producto PRIMARY KEY,
	nombre VARCHAR(40) NOT NULL,
	precio DECIMAL(10, 2) NOT NULL CONSTRAINT ck_producto_precio CHECK(precio > 0.0),
);
GO

-- Crea la tabla pedido_producto
CREATE TABLE pedido_producto(
	pedido_id INT NOT NULL,
	producto_id INT NOT NULL,
	cantidad_vendida INT NOT NULL,
	precio_venta DECIMAL(10, 2) NOT NULL,
	CONSTRAINT pk_pedido_producto PRIMARY KEY (pedido_id, producto_id),
	CONSTRAINT fk_pedido_producto_pedido FOREIGN KEY (pedido_id) REFERENCES pedido(pedido_id),
	CONSTRAINT fk_pedido_producto_producto FOREIGN KEY (producto_id) REFERENCES producto(producto_id)
);
GO