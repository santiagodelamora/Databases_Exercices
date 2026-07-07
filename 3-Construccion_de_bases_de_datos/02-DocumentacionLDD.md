# Construcción de Bases de Datos con el lenguaje SQL

El lenguaje SQL (Structure Query Language) se divide en cinco grandes categorías:
1. **DDL** (Data Definition Language)
2. **DML** (Data Manipulation Language)
3. **DQL** (Data Query Language)
4. **DCL** (Data Control Language) -> Controla permisos (GRANT, REVOKE)
5. **TCL** (Transaction Control Language) -> Controla transacciones (BEGIN TRANSACTION, COMMIT, ROLLBACK, SAVEPOINT)

## SQL-DDL
**Lenguaje de Definción de Datos**<br>
Se utiliza para **crear y modificar la estructura** de una base de datos.<br>
Con DDL trabajamos sobre los objetos de las bases de datos:
- _~Base de Datos~_
- _Tablas_
- _Restrcciones_
- Vistas
- Índices
- Esquemas
- Store Procedures
- Functions
- Triggers

**Comandos principales de este lenguaje**
| Comando | Función |
| --- | --- |
| CREATE | Crea objetos de la base de datos |
| ALTER | Modifica objetos de la base de datos |
| DROP | Elimina objetos de la base de datos |
| TRUNCATE | Vacía una tabla |
| RENAME | Renombra objetos de las bases de datos (según el SGBD) |

## SQL-DML
**Lenguaje de Manipulación de Datos**<br>
Sirve para **trabajar con la información alamacenada**<br>
Con este lenguaje no se cambia la estructura, sino los registros

**Comandos pricipales**
| Comando | Función |
| --- | --- |
| INSERT | Inserta registros |
| UPDATE | Actualiza registros |
| DELETE | Elimina registros |

## SQL-DQL
**Lenguaje de Consulta de Datos**<br>
Su función es **consultar información**<br>
Este es probablemente el lenguaje más utilizado

**Comando principal**
| Comando | Función |
| --- | --- |
| SELECT | Consultar información en los registros de una tabla |

Generalmente se combina con:
- WHERE
- ORDER BY
- GROUP BY
- HAVING
- JOIN (LEFT, RIGHT, INNER, FULL, CROSS)
- DISCTINCT
- TOP/LIMIT
- Funciones de agregación (SUM, AVG, MIN, MAX, COUNT)
- Window Functions (Funciones de Ventana)

## Nomenclatura para construncción de las Bases de Datos (snake_case)
La nombrenclatura o convención que más se recomienda hoy en día si se busca una nomenclatura moderna, portable y alineada con buenas prácticas en distintos motores de base de datos.<br>
La razón es que funciona de forma consistente en **SQLServer, MySQL, MariaDB** y especialmente en **PostgresSQL**, donde los identificadores sin comillas se convierten automáticamente a minúsculas. Con **snake_case** evitas problemas de mayúsculas y haces que las consultas sean más legibles

| Objeto | Convención | Ejemplo |
| ---- | ---- | ---- |
| Base de datos | snake_case | control_escolar |
| Esquema | snake_case | ventas, rh, seguridad |
| Tabla | singular en snake_case | cliente, pedido, detalle_pedido |
| Columna | snake_case | cliente_id, fecha_registro, correo_electronico |
| Primary Keys | snake_case \<tabla>_id | cliente_id, producto_id |
| Foreign Keys | igual que la Primary Key referenciada | cliente_id, categoria_id |
| Tabla puente | \<tabla1>_\<tabla2> | alumno_curso, producto_proveedor |

## Nombrar las restricciones
- pk_cliente
- fk_pedido_cliente
- uq_cliente_correo_electronico
- ck_producto_precio
- df_cliente_activo
- ix_pedido_fecha

<br>

**Prefijos**
| Prefijo | Significado |
| ---- | ---- |
| **pk** | Primary Key |
| **fk** | Foreign Key |
| **uq** | Unique |
| **ck** | Check |
| **df** | Default |
| **ix** | Index |