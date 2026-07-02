# Diccionarios de datos

## Ejercicio 1
### 1. Información general
| Elemento | Valor |
| :--- | :--- |
| Proyecto | Sistema de Control Escolar |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboró | Dev. Santiago Nicolás De la mora Núñez |
| SGBD | SQLServer |

### 2. Descripción del sistema de base de datos
El sistema administra:
- Carreras
- Alumnos
- Profesores
- Materias
- Grupos
- Inscripciones

Permite controlar la oferta educativa y la inscripción de los estudiantes 

### 3. Catalogo de restricciones 
| Sigla | Significado |
| :--- | :--- |
| PK | primary key |
| FK | foreign key |
| NN | not null |
| UQ | unique |
| AI | auto increment |
| CK | check |
| DF | default |

### 4. Diccionario de datos 
**Tabla:** Carrera<br>
**Descripcion:** Almacena las carreras ofertadas por una universidad.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| id_carrera | INT | - | PK, AI, NN | Identificador unico de la carrera |
| nombre | VARCHAR | 100 | UQ, NN | Nombre de la carrera |
| duracion_cuatrimestre | INT | - | NN, CK(>0) | Duración del cuatrimestre |

---
<br>

**Tabla:** Alumno<br>
**Descripción:** Almacena la inromación de los estudiantes.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| id_alumno | INT | - | PK, AI, NN | Identificador unico del alumno |
| matricula | VARCHAR | 10 | UQ, NN | Matricula institucional |
| nombre |  VARCHAR | 50 | NN | Nombre del estudiante |
| apellido_paterno | VARCHAR | 50 | NULL | Apellido paterno |
| apellido_materno | VARCHAR | 50 | NULL | Apellido materno |
| correo |  VARCHAR | 100 | UQ, NN | Correo institucional |
| fecha_nacimiento | DATE | - | NN | Fecha de nacimiento |
| id_carrera |  INT | - |  FK, NN | Carrera a la que pertenece |

### 5. Relaciones
| Relación | Cardinalidad | Descripción |
| :--- | :--- | :--- |
| Carrera -> Alumno | 1:N | Una carrera tiene muchos alumnos |
| Carrera -> Materia | 1:N | Una carrera tiene muchas materias |
| Profesor -> Grupo | 1:N | Un profesor puede impartir a varios grupos |
| Materia -> Grupo | 1:N | Una materia puede abrirse en varios grupos |
| Alumno -> Inscripción | 1:N | Un alumno puede tener varias inscripciones |
| Grupo -> Inscripción | 1:N | Un grupo puede tener muchos alumnos |

### 6. Matriz de claves foraneas
| Tabla | Campo FK | Descripción |
| :--- | :--- | :--- |
| Alumno | id_carrera | Carrera (id_carrera) |
| Materia | id_carrera | Carrera (id_carrera) |
| Grupo | id_profesor | Profesor (id_profesor) |
| Grupo | id_materia | Materia (id_materia) |
| Inscripción | id_alumno | Alumno (id_alumno) |
| Inscripción | id_grupo | Grupo (id_grupo) |

### 7. Integridad referencial
| Regla | Descripción |
| :--- | :--- |
| IR-01 | No se puede registrar un alumno con una carrera inexistente |
| IR-02 | No se puede crear un grupo para una materia inexistente |
| IR-03 | No se puede crear un grupo para un profesor inexistente |

### 8. Reglas del negocio
| Código | Regla |
| :--- | :--- |
| RN-01 | Un alumno pertenece a una sola carrera |
| RN-02 | Una carrera puede tener muchos alumnos |
| RN-03 | Una carrera puede tener muchas materias |

### 9. Diagrama relacional
![Diagrama relacional](../img/ejercicio3-relacional.png)


## Ejercicio 2
### 1. Información general
| Elemento | Valor |
| :--- | :--- |
| Proyecto | Sistema de Hospital |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboró | Dev. Santiago Nicolás De la mora Núñez |
| SGBD | SQLServer |

### 2. Descripción del sistema de base de datos
El sistema administra:
- Pacientes
- Expedientes

### 3. Catalogo de restricciones 
| Sigla | Significado |
| :--- | :--- |
| PK | primary key |
| FK | foreign key |
| NN | not null |
| UQ | unique |
| AI | auto increment |
| CK | check |
| DF | default |

### 4. Diccionario de datos 
**Tabla:** Paciente<br>
**Descripcion:** Almacena la información personal de cada paciente.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| num_paciente | INT | - | PK, AI, NN | Identificador único del paciente |
| nombre | VARCHAR | 30 | UQ, NN | Nombre o nombres del paciente |
| apellido_paterno | VARCHAR | 20 | UQ, NN | Apellido paterno del paciente |
| apellido_materno | VARCHAR | 20 | UQ | Apellido materno del paciente |
| fecha_nac | DATE | - | - | Fecha de nacimiento del paciente |

---
<br>

**Tabla:** Expediente<br>
**Descripción:** Almacena la información de cada expediente.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| num_expediente | INT | - | PK, AI, NN | Identificador único del expediente |
| fecha_apertura | DATE | - | NN | Fecha de apertura del expediente |
| tipo_sangre | VARCHAR | 3 | NN | Tipo de sangre del paciente |
| num_paciente | INT | - | FK, NN, UQ | Clave foránea del dentificador único del paciente |

### 5. Relaciones
| Relación | Cardinalidad | Descripción |
|:----------|:---------:|----------:|
| Paciente -> Expediente | 1:1 | Un paciente tiene un solo expediente |

### 6. Matriz de claves foraneas
| Tabla | Campo FK | Descripción |
| :--- | :--- | :--- |
| Expediente | id_paciente | Paciente (id_paciente) |

### 7. Integridad referencial
| Regla | Descripción |
| :--- | :--- |
| IR-01 | No se puede crear un expediente para un paciente inexistente |
| IR-02 | No se puede crear un paciente para un paciente expediente inexistente |

### 8. Reglas del negocio
| Código | Regla |
| :--- | :--- |
| RN-01 | Cada paciente debe tener exactamente un expediente médico |
| RN-02 | Cada expediente médico pertenenece a un único paciente |
| RN-03 | No puede existir un expediente sin paciente |
| RN-04 | No puede existir un paciente sin expediente |

### 9. Diagrama relacional
![Diagrama relacional](../img/ejercicio1-relacional.png)


## Ejercicio 3
### 1. Información general
| Elemento | Valor |
| :--- | :--- |
| Proyecto | Sistema de Administración Universitaria de Profesores y Cursos |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboró | Dev. Santiago Nicolás De la mora Núñez |
| SGBD | SQLServer |

### 2. Descripción del sistema de base de datos
El sistema administra:
- Profesores
- Cursos
- Especialidades de los profesores

### 3. Catalogo de restricciones 
| Sigla | Significado |
| :--- | :--- |
| PK | primary key |
| FK | foreign key |
| NN | not null |
| UQ | unique |
| AI | auto increment |
| CK | check |
| DF | default |

### 4. Diccionario de datos 
**Tabla:** Profesor<br>
**Descripcion:** Almacena los datos del profesor.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| num_prof | INT | - | PK, AI, NN | Identificador único del profesor |
| nombre | VARCHAR | 30 | UQ, NN | Nombre o nombres del profesor |
| apellido_1 | VARCHAR | 20 | UQ, NN | Apellido paterno del profesor |
| apellido_1 | VARCHAR | 20 | UQ | Apellido materno del profesor |

---
<br>

**Tabla:** Curso<br>
**Descripción:** Almacena la información de cada curso.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| num_curso | INT | - | PK, AI, NN | Identificador único del curso |
| nombre | VARCHAR | 30 | NN | Nombre del curso |
| creditos | DECIMAL | - | NN | Creditos del curso |
| num_prof | INT | - | FK, NN, UQ | Clave foranea del identificador único del profesor |

---
<br>

**Tabla:** Especialidad<br>
**Descripción:** Almacena los nombres de las múltiples especialidades que puede tener un profesor.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| num_especialidad | INT | - | PK, AI, NN | Identificador único de la especialidad |
| num_prof | INT | - | FK, NN | Clave foránea del identificador único del profesor |
| nombre | VARCHAR | 40 | NN | Nombre de la especialidad |

### 5. Relaciones
| Relación | Cardinalidad | Descripción |
|:----------|:---------:|----------:|
| Profesor -> Curso | 1:N | Un profesor puede impartir a muchos cursos |
| Profesor -> Especialidad | 1:N | Un profesor puede tener muchas especialidades |

### 6. Matriz de claves foraneas
| Tabla | Campo FK | Descripción |
| :--- | :--- | :--- |
| Curso | num_prof | Profesor (num_prof) |
| Especialidad | num_prof | Profesor (num_prof) |

### 7. Integridad referencial
| Regla | Descripción |
| :--- | :--- |
| IR-01 | No puede existir un curso sin estar asignado a un profesor |
| IR-02 | No puede existir una especialidad sin profesor |

### 8. Reglas del negocio
| Código | Regla |
| :--- | :--- |
| RN-01 | Un profesor puede impartir varios cursos |
| RN-02 | Un curso solamente puede ser impartido 
por un profesor |
| RN-03 | Puede existir un profesor que actualmente no imparta cursos |
| RN-04 | Todo curso debe estar asignado a un profesor |

### 9. Diagrama relacional
![Diagrama relacional](../img/ejercicio2-relacional.png)


## Ejercicio 4
### 1. Información general
| Elemento | Valor |
| :--- | :--- |
| Proyecto | Sistema de Administración Escolar de Alumnos y Materias |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboró | Dev. Santiago Nicolás De la mora Núñez |
| SGBD | SQLServer |

### 2. Descripción del sistema de base de datos
El sistema administra:
- Alumnos
- Materias
- inscripciones

### 3. Catalogo de restricciones 
| Sigla | Significado |
| :--- | :--- |
| PK | primary key |
| FK | foreign key |
| NN | not null |
| UQ | unique |
| AI | auto increment |
| CK | check |
| DF | default |

### 4. Diccionario de datos 
**Tabla:** Alumno<br>
**Descripcion:** Almacena los datos del alumno.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| num_prof | INT | - | PK, AI, NN | Identificador único del alumno |
| nombre | VARCHAR | 30 | UQ, NN | Nombre o nombres del alumno |
| apellido_paterno | VARCHAR | 20 | UQ, NN | Apellido paterno del alumno |
| apellido_materno | VARCHAR | 20 | UQ | Apellido materno del alumno |
| semestre | INT | - | UQ, CK(>= 1 AND <= 6>) | Semestre actual del alumno |

---
<br>

**Tabla:** Materia<br>
**Descripción:** Almacena la información la materia.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| clave_materia | INT | - | PK, AI, NN | Identificador único de la materia |
| nombre | VARCHAR | 30 | NN | Nombre de la materia |
| creditos | DECIMAL | - | NN | Creditos de la materia |

---
<br>

**Tabla:** Inscribe<br>
**Descripción:** Relaciona las tablas Alumno y Materia.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| matricula | INT | - | PK, FK, NN | Identificador único del alumno |
| clave_materia | INT | - | PK, FK, NN | Clave foránea del identificador único de la materia |
| fecha_inscripcion | DATE | - | NN | Fecha en que un alumno se inscribió a una materia |
| calificacion_final | DECIMAL | - | NN | Calificación final de un alumno en una materia |

### 5. Relaciones
| Relación | Cardinalidad | Descripción |
|:----------|:---------:|----------:|
| Alumno -> Inscribe | 1:N | Un alumno se puede inscribir a muchas materias |
| Materia -> Inscribe | 1:N | Una materia puede tener muchos alumnos inscritos |

### 6. Matriz de claves foraneas
| Tabla | Campo FK | Descripción |
| :--- | :--- | :--- |
| Inscribe | matricula | Alumno (matricula) |
| Inscribe | clave_materia | Materia (clave_materia) |

### 7. Integridad referencial
| Regla | Descripción |
| :--- | :--- |
| IR-01 | No puede existir un alumno que no esté inscrito a ninguna materia |

### 8. Reglas del negocio
| Código | Regla |
| :--- | :--- |
| RN-01 | Un alumno puede inscribirse en varias materias |
| RN-02 | Una materia puede tener muchos alumnos inscritos |
| RN-03 | Puede existir una materia sin alumnos inscritos |
| RN-04 | Todo alumno debe estar inscrito en al menos una materia |
| RN-05 | De cada inscripción se desea almacenar la fecha de inscripción y la calificación final |

### 9. Diagrama relacional
![Diagrama relacional](../img/ejercicio3-relacional.png)


## Ejercicio 5
### 1. Información general
| Elemento | Valor |
| :--- | :--- |
| Proyecto | Sistema Empresarial de Administración de Inventario |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboró | Dev. Santiago Nicolás De la mora Núñez |
| SGBD | SQLServer |

### 2. Descripción del sistema de base de datos
El sistema administra:
- Clientes
- Pedidos
- Productos

### 3. Catalogo de restricciones 
| Sigla | Significado |
| :--- | :--- |
| PK | primary key |
| FK | foreign key |
| NN | not null |
| UQ | unique |
| AI | auto increment |
| CK | check |
| DF | default |

### 4. Diccionario de datos 
**Tabla:** Cliente<br>
**Descripcion:** Almacena la información del cliente.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| id_cliente | INT | - | PK, AI, NN | Identificador único del cliente |
| nombre | VARCHAR | 30 | UQ, NN | Nombre o nombres del cliente |
| apellido_paterno | VARCHAR | 20 | UQ, NN | Apellido paterno del cliente |
| apellido_materno | VARCHAR | 20 | UQ | Apellido materno del cliente |

---
<br>

**Tabla:** Pedido<br>
**Descripción:** Almacena la información del pedido.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| numero | INT | - | PK, AI, NN | Identificador único del pedido |
| fecha | DATE | - | NN | Fecha de entrega del pedido |
| id_cliente | INT | - | FK, NN | Clave foranea del identificador único del cliente |

---
<br>

**Tabla:** Producto<br>
**Descripción:** Almacena los datos del producto.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| numero | INT | - | PK, FK, NN | Identificador único del producto |
| nombre | VARCHAR | 30 | NN, UQ | Nombre del producto |
| precio | DECIMAL | - | NN | Precio del producto |

---
<br>

**Tabla:** Contiene<br>
**Descripción:** Relaciona las tablas Pedido y Producto.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| numero_pedido | INT | - | PK, FK, NN | Clave foranea del identificador único del pedido |
| numero_producto | INT | - | PK, FK, NN | Clave foranea del identificador único del producto |
| cantidad_vendida | INT | - | NN | Cantidad vendida de productos |
| precio_venta | DECIMAL | - | NN | Suma de los precios de cada producto dentro de un pedido |

### 5. Relaciones
| Relación | Cardinalidad | Descripción |
|:----------|:---------:|----------:|
| Cliente -> Pedido | 1:N | Un cliente puede tener muchos pedidos |
| Pedido -> Contiene | 1:N | Un pedido puede contener muchos productos |
| Producto -> Contiene | 1:N | Un producto puede ser contenido por muchos pedidos |

### 6. Matriz de claves foraneas
| Tabla | Campo FK | Descripción |
| :--- | :--- | :--- |
| Pedido | id_cliente | Cliente (id_cliente) |
| Contiene | numero_pedido | Pedido (numero) |
| Contiene | numero_producto | Producto (numero) |

### 7. Integridad referencial
| Regla | Descripción |
| :--- | :--- |
| IR-01 | Un pedido no puede existir sin un producto |
| IR-02 | Un pedido no puede existir sin un cliente |
| IR-03 | El detalle del pedido no puede existir sin un pedido |
| IR-04 | El detalle del pedido no puede existir sin un producto |

### 8. Reglas del negocio
| Código | Regla |
| :--- | :--- |
| RN-01 | Un cliente puede realizar muchos pedidos |
| RN-02 | Cada pedido pertenece a un cliente |
| RN-03 | Un pedido contiene varios productos |
| RN-04 | Un producto puede aparecer en muchos pedidos |
| RN-05 | Un pedido debe contener al menos un producto |
| RN-06 | Un producto puede no haber sido vendido |
| RN-07 | El detalle del pedido no existe sin pedido |
| RN-08 | El detalle del pedido no existe sin producto |
| RN-09 | El detalle del pedido alamacena cantidad vendida y precio de venta |

### 9. Diagrama relacional
![Diagrama relacional](../img/ejercicio4-relacional.png)


## Ejercicio 6
### 1. Información general
| Elemento | Valor |
| :--- | :--- |
| Proyecto | Enterprise Management System |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboró | Dev. Santiago Nicolás De la mora Núñez |
| SGBD | SQLServer |

### 2. Descripción del sistema de base de datos
El sistema administra:
- Empleados
- Departamentos
- Ubicaciones de los departamentos
- Dependientes
- Proyectos

### 3. Catalogo de restricciones 
| Sigla | Significado |
| :--- | :--- |
| PK | primary key |
| FK | foreign key |
| NN | not null |
| UQ | unique |
| AI | auto increment |
| CK | check |
| DF | default |

### 4. Diccionario de datos 
**Tabla:** Employee<br>
**Descripcion:** Almacena la información del empleado.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| ssn | INT | - | PK, AI, NN | Identificador único del empleado |
| firstname | VARCHAR | 30 | NN | Nombre o nombres del empleado |
| lastname | VARCHAR | 20 | NN | Apellidos del empleado |
| address | VARCHAR | 40 | NN | Domicilio del empleado |
| bdate | DATE | - | NN | Fecha de nacimiento del empleado |
| salary | DECIMAL | - | NN | Salario del empleado |
| sex | CHAR | 1 | NN | Sexo del empleado |
| jef | INT | - | NN, FK | Clave foranea del identificador único del empleado con rol de jefe |

---
<br>

**Tabla:** Department<br>
**Descripción:** Almacena la información del departamento.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| number | INT | - | PK, NN | Número del departamento |
| name | DATE | - | PK, NN | Nombre del departamento |
| manager | INT | - | FK, UQ, NN | Clave foranea del identificador único del administrador |
| startdate | DATE | - | NN | Fecha de inicio de funcionamiento del departamento |
| ssn | INT | - | FK, NN | Clave foranea del identificador único del empleado |

---
<br>

**Tabla:** Dependent<br>
**Descripción:** Almacena los datos del dependiente del empleado.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| name | VARCHAR | 30 | PK, NN | Identificador único del dependiente del empleado |
| ssn | INT | - | FK, UQ, NN | Clave foranea del identificador único del empleado |
| sex | CHAR | 1 | NN | Sexo del dependiente del empleado |
| relationship | VARCHAR | 10 | NN | Tipo de relación del dependiente del empleado con el empleado |

---
<br>

**Tabla:** Project<br>
**Descripción:** Almacena la información de los proyectos.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| name | VARCHAR | 20 | PK, UQ, NN | Nombre identificador del proyecto |
| number | INT | - | PK, UQ, NN | Número identificador del proyecto |
| location | VARCHAR | 30 | NN | Ubicación del proyecto |
| number_dep | INT | - | FK, NN | Clave foranea del número del departamento |
| name_dep | VARCHAR | 20 | FK, NN | Clave foranea del nombre del departamento |

---
<br>

**Tabla:** Location<br>
**Descripción:** Almacena las ubicacioones de los departamentos.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| number_location | INT | - | PK, AI, NN | Número identificador de la ubicación |
| number_dep | INT | - | PK, UQ, NN | Número identificador del proyecto |
| name_dep | VARCHAR | 20 | FK, NN | Clave foranea del nombre del departamento |
| location | VARCHAR | 40 | FK, NN | Ubicación del departamento |

---
<br>

**Tabla:** Works_On<br>
**Descripción:** Relaciona las tablas Employee y Project.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| ssn | INT | - | PK, FK, NN | Clave foranea del identificador único del empleado |
| name_proj | VARCHAR | 30 | PK, FK, NN | Clave foranea del nombre del proyecto |
| number_proj | INT | - | PK, FK, NN | Clave foranea del número del proyecto |
| hours | INT | - | NN | Número de horas que el empleado dedicó en el proyecto |

### 5. Relaciones
| Relación | Cardinalidad | Descripción |
|:----------|:---------:|----------:|
| Employee -> Department | N:1 | Un empleado tiene un solo departamento pero un departamento tiene muchos empleados |
| Employee -> Department | 1:N | Un empleado con el rol administrador tiene muchos departamentos |
| Empleado -> Works_On | 1:N | Un empleado trabaja para muchos proyectos |
| Project -> Works_On | 1:N | Un proyecto es trabajado por muchos empleados |
| Employee -> Dependent | 1:N | Un empleado puede tener muchos dependientes |
| Department -> Location | 1:N | Un departamento tiene muchas locaciones (ubicaciones) |

### 6. Matriz de claves foraneas
| Tabla | Campo FK | Descripción |
| :--- | :--- | :--- |
| Department | ssn | Employee (ssn) |
| Employee | jef | Employee (ssn) |
| Dependent | ssn | Employee (ssn) |
| Works_On | ssn | Employee (ssn) |
| Works_On | name_proj, number_proj | Project (name, number) |
| Location | number_dep, name_dep | Department (number, name) |

### 7. Integridad referencial
| Regla | Descripción |
| :--- | :--- |
| - | Información insuficiente |

### 8. Reglas del negocio
| Código | Regla |
| :--- | :--- |
| - | Información insuficiente |

### 9. Diagrama relacional
![Diagrama relacional](../img/ejercicio5-relacional.png)


## Ejercicio 7
### 1. Información general
| Elemento | Valor |
| :--- | :--- |
| Proyecto | Enterprise Management System |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboró | Dev. Santiago Nicolás De la mora Núñez |
| SGBD | SQLServer |

### 2. Descripción del sistema de base de datos
El sistema administra:
- Empleados
- Departamentos
- Ubicaciones de los departamentos
- Dependientes
- Proyectos

### 3. Catalogo de restricciones 
| Sigla | Significado |
| :--- | :--- |
| PK | primary key |
| FK | foreign key |
| NN | not null |
| UQ | unique |
| AI | auto increment |
| CK | check |
| DF | default |

### 4. Diccionario de datos 
**Tabla:** Employee<br>
**Descripcion:** Almacena la información del empleado.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| ssn | INT | - | PK, AI, NN | Identificador único del empleado |
| firstname | VARCHAR | 30 | NN | Nombre o nombres del empleado |
| lastname | VARCHAR | 20 | NN | Apellidos del empleado |
| address | VARCHAR | 40 | NN | Domicilio del empleado |
| bdate | DATE | - | NN | Fecha de nacimiento del empleado |
| salary | DECIMAL | - | NN | Salario del empleado |
| sex | CHAR | 1 | NN | Sexo del empleado |
| jef | INT | - | NN, FK | Clave foranea del identificador único del empleado con rol de jefe |
| id_department | INT | - | FK, NN | Clave única del identificador único del departamento |

---
<br>

**Tabla:** Department<br>
**Descripción:** Almacena la información del departamento.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| id_department | INT | - | PK, AI, NN | Identificador único del departamento |
| number | INT | - | UQ, NN | Número del departamento |
| name | DATE | - | UQ, NN | Nombre del departamento |
| manager | INT | - | FK, UQ, NN | Clave foranea del identificador único del administrador |
| startdate | DATE | - | NN | Fecha de inicio de funcionamiento del departamento |
| ssn | INT | - | FK, NN | Clave foranea del identificador único del empleado |

---
<br>

**Tabla:** Dependent<br>
**Descripción:** Almacena los datos del dependiente del empleado.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| name | VARCHAR | 30 | PK, NN | Identificador único del dependiente del empleado |
| ssn | INT | - | FK, UQ, NN | Clave foranea del identificador único del empleado |
| sex | CHAR | 1 | NN | Sexo del dependiente del empleado |
| relationship | VARCHAR | 10 | NN | Tipo de relación del dependiente del empleado con el empleado |

---
<br>

**Tabla:** Project<br>
**Descripción:** Almacena la información de los proyectos.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| id_project | INT | - | PK, AI, NN | Nombre identificador del proyecto |
| name | VARCHAR | 20 | UQ, NN | Nombre identificador del proyecto |
| number | INT | - | UQ, NN | Número identificador del proyecto |
| id_department | INT | - | FK, NN | Clave foranea del identificador único del departamento |

---
<br>

**Tabla:** Location<br>
**Descripción:** Almacena las ubicacioones de los departamentos.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| number_location | INT | - | PK, AI, NN | Número identificador de la ubicación |
| id_department | INT | - | FK, NN | Clave foranea del identificador único del departamento |
| location | VARCHAR | 40 | FK, NN | Ubicación del departamento |

---
<br>

**Tabla:** Works_On<br>
**Descripción:** Relaciona las tablas Employee y Project.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| ssn | INT | - | PK, FK, NN | Clave foranea del identificador único del empleado |
| id_project | INT | - | PK, FK, NN | Clave foranea del identificador único del proyecto |
| hours | INT | - | NN | Número de horas que el empleado dedicó en el proyecto |

### 5. Relaciones
| Relación | Cardinalidad | Descripción |
|:----------|:---------:|----------:|
| Employee -> Department | N:1 | Un empleado tiene un solo departamento pero un departamento tiene muchos empleados |
| Employee -> Department | 1:N | Un empleado con el rol administrador tiene muchos departamentos |
| Empleado -> Works_On | 1:N | Un empleado trabaja para muchos proyectos |
| Project -> Works_On | 1:N | Un proyecto es trabajado por muchos empleados |
| Employee -> Dependent | 1:N | Un empleado puede tener muchos dependientes |
| Department -> Location | 1:N | Un departamento tiene muchas locaciones (ubicaciones) |

### 6. Matriz de claves foraneas
| Tabla | Campo FK | Descripción |
| :--- | :--- | :--- |
| Department | ssn | Employee (ssn) |
| Employee | id_department | Department (id_department) |
| Employee | jef | Employee (ssn) |
| Dependent | ssn | Employee (ssn) |
| Works_On | ssn | Employee (ssn) |
| Works_On | id_project | Project (id_project) |
| Location | id_department | Department (id_department) |

### 7. Integridad referencial
| Regla | Descripción |
| :--- | :--- |
| - | Información insuficiente |

### 8. Reglas del negocio
| Código | Regla |
| :--- | :--- |
| - | Información insuficiente |

### 9. Diagrama relacional
![Diagrama relacional](../img/ejercicio6-relacional.png)


## Ejercicio 8
### 1. Información general
| Elemento | Valor |
| :--- | :--- |
| Proyecto | Macro Sistema de Administración de Universidades |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboró | Dev. Santiago Nicolás De la mora Núñez |
| SGBD | SQLServer |

### 2. Descripción del sistema de base de datos
El sistema administra:
- Alumnos
- Credenciales
- Materias
- Profesores
- Dependientes de los profesores
- Departamentos
- Proyectos

### 3. Catalogo de restricciones 
| Sigla | Significado |
| :--- | :--- |
| PK | primary key |
| FK | foreign key |
| NN | not null |
| UQ | unique |
| AI | auto increment |
| CK | check |
| DF | default |

### 4. Diccionario de datos 
**Tabla:** Alumno<br>
**Descripcion:** Almacena la información del alumno.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| matricula | INT | - | PK, AI, NN | Identificador único del alumno |
| nombre | VARCHAR | 30 | NN | Nombre del alumno |
| ap1 | VARCHAR | 20 | NN | Apellido paterno del alumno |
| ap2 | VARCHAR | 20 | - | Apellido materno del alumno |
| correo | VARCHAR | 50 | NN | Correo del alumno |
| fecha_nac | DATE | - | NN | Fecha de nacimiento del alumno |

---
<br>

**Tabla:** Credencial<br>
**Descripción:** Almacena la información de la credencial.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| num_credencial | INT | - | PK, AI, NN | Identificador único de la credencial |
| fecha_exp | DATE | - | NN | Fecha de expedición de la credencial |
| vigencia | DATE | - | NN | Fecha de límite de la vigencia de la credencial |
| matricula | INT | - | FK, UQ, NN | Clave foranea del identificador único del alumno |

---
<br>

**Tabla:** Telefono<br>
**Descripción:** Almacena los números de teléfono del alumno.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| clave_tel | INT | - | PK, AI, NN | Identificador único del dependiente del número de teléfono |
| matricula | INT | - | PK, FK, NN | Clave del identificador único del alumno |
| telefono | VARCHAR | 10 | NN | Número de teléfono del alumno |

---
<br>

**Tabla:** Cursa<br>
**Descripción:** Almacena la información de los proyectos.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| matricula | INT | - | PK, FK, NN | Clave foranea del identificador único del alumno |
| clave_materia | INT | - | PK, FK, NN | Clave foranea del identificador único de la materia |
| fecha_inscripcion | DATE | - | NN | Fecha de inscripción del alumno |
| calif_final | DECIMAL | - | NN | Calificación final del alumno |

---
<br>

**Tabla:** Materia<br>
**Descripción:** Almacena los datos de la materia.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| clave_materia | INT | - | PK, AI, NN | Número identificador de la materia |
| nombre_materia | VARCHAR | 30 | NN | Nombre de la materia |
| creditos | DECIMAL | - | NN | Créditos de la materia |
| num_prof | INT | - | FK, NN | Clave foranea del identificador único del profesor |

---
<br>

**Tabla:** Profesor<br>
**Descripción:** Almacena la información del profesor.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| num_prof | INT | - | PK, FK, NN | Identificador único del profesor |
| nombre | VARCHAR | 30 | NN | Nombre o nombres del profesor |
| ap1 | VARCHAR | 20 | NN | Apellido paterno del profesor |
| ap2 | VARCHAR | 20 | - | Apellido materno del profesor |
| num_depto | INT | - | FK, NN | Clave foreanea del identificador único del profesor |

---
<br>

**Tabla:** Dependiente<br>
**Descripción:** Almacena la información del dependiente del profesor.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| nombre_depend | VARCHAR | 30 | PK, NN | Identificador único del dependiente del profesor |
| fecha_nac | DATE | - | NN | Fecha de nacimiento del dependiente del profesor |
| parentesco | VARCHAR | 10 | NN | Parentesco del dependiente con el profesor |
| NumProf | INT | - | FK, NN | Clave foranea del identificador único del profesor |
| num_depto | INT | - | FK, NN | Clave foreanea del identificador único del profesor |

---
<br>

**Tabla:** Participa<br>
**Descripción:** Relaciona las tablas Profesor y Proyecto.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| num_prof | INT | - | PK, FK, NN | Clave foranea del identificador único del profesor |
| num_proy | INT | - | PK, FK, NN | Clave foranea del identificador único del proyecto |
| rol | VARCHAR | 30 | NN | Rol del profesor en el proyecto |
| num_depto | INT | - | FK, NN | Clave foreanea del identificador único del profesor |

---
<br>

**Tabla:** Proyecto<br>
**Descripción:** Almacena la información del proyecto.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| num_proy | INT | - | PK, AI, NN | Identificador único del proyecto |
| nombre | VARCHAR | 20 | NN | Nombre del proyecto |
| presupuesto | DATE | - | NN | Presupuesto del proyecto |
| num_depto | INT | - | FK, NN | Clave foreanea del identificador único del profesor |

---
<br>

**Tabla:** Departamento<br>
**Descripción:** Almacena la información del departamento.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| num_depto | INT | - | PK, AI, NN | Identificador único del departamento |
| nombre | VARCHAR | 20 | NN | Nombre del departamento |
| edificio | INT | - | NN | Número del edificio del departamento |

### 5. Relaciones
| Relación | Cardinalidad | Descripción |
|:----------|:---------:|----------:|
| Alumno -> Credencial | 1:1 | Un alumno solo puede tener una sola credencial |
| Alumno -> Cursa | 1:N | Un alumno cursa varias materias |
| Materia -> Cursa | 1:N | Una materia es cursada por varios alumnos |
| Materia -> Profesor | N:1 | Muchas materias son cursadas por un profesor |
| Profesor -> Dependiente | 1:N | Un profesor tiene muchos dependientes |
| Profesor -> Departamento | N:1 | Muchos profesores trabajan en un departamento |
| Profesor -> Participa | 1:N | Un profesor participa en muchos proyectos |
| Proyecto -> Participa | 1:N | Un proyecto tiene participando a muchos profesores |

### 6. Matriz de claves foraneas
| Tabla | Campo FK | Descripción |
| :--- | :--- | :--- |
| Credencial | matricula | Alumno (matricula) |
| Telefono | matricula | Alumno (matricula) |
| Cursa | matricula | Alumno (matricula) |
| Cursa | clave_materia | Materia (clave_materia) |
| Materia | num_prof | Profesor (num_prof) |
| Profesor | num_depto | Departamento (num_depto) |
| Dependiente | num_prof | Profesor (num_prof) |
| Participa | num_prof | Profesor (num_prof) |
| Participa | num_proy | Proyecto (num_proy) |

### 7. Integridad referencial
| Regla | Descripción |
| :--- | :--- |
| - | Información insuficiente |

### 8. Reglas del negocio
| Código | Regla |
| :--- | :--- |
| - | Información insuficiente |

### 9. Diagrama relacional
![Diagrama relacional](../img/ejercicio7-relacional.png)