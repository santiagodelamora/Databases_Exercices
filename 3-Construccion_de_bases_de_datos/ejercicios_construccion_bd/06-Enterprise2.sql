-- Crea la base de datos
CREATE DATABASE enterprise2;
GO

-- Usa la base de datos
USE enterprise2;
GO

-- Crea la tabla employee
CREATE TABLE employee(
	ssn CHAR(16) NOT NULL,
	firstname VARCHAR(30) NOT NULL,
	lastname VARCHAR(20) NOT NULL,
	address VARCHAR(50) NOT NULL,
	birth_date DATE NOT NULL,
	salary DECIMAL(10, 2) NOT NULL,
	sex CHAR(1) NOT NULL,
	jef CHAR(16),
	department_id INT NOT NULL,
	CONSTRAINT pk_employee PRIMARY KEY (ssn),
	CONSTRAINT ck_employee_salary CHECK(salary > 0.0),
	CONSTRAINT ck_employee_sex CHECK(sex IN ('M', 'F')),
	CONSTRAINT fk_employee_employee FOREIGN KEY (jef) REFERENCES employee(ssn)
);
GO

-- Agrega la restricción de FOREIGN KEY para la tabla department
ALTER TABLE employee
ADD CONSTRAINT fk_employee_department FOREIGN KEY (department_id) REFERENCES department(department_id);
GO

-- Crea la tabla dependent
CREATE TABLE dependent(
	name VARCHAR(30) NOT NULL,
	ssn CHAR(16) NOT NULL,
	sex CHAR(1) NOT NULL,
	relationship VARCHAR(10) NOT NULL,
	CONSTRAINT pk_dependent PRIMARY KEY (name, ssn),
	CONSTRAINT ck_dependent_sex CHECK(sex IN ('M', 'F')),
	CONSTRAINT ck_dependent_relationship CHECK(relationship IN ('wife', 'husband', 'son', 'daughter', 'grandparent')),
	CONSTRAINT fk_dependent_employee FOREIGN KEY (ssn) REFERENCES employee(ssn)
);
GO

-- Crea la tabla department
CREATE TABLE department(
	department_id INT NOT NULL IDENTITY(1, 1),
	number INT NOT NULL,
	name VARCHAR(15) NOT NULL,
	startdate DATE NOT NULL CONSTRAINT df_department_startdate DEFAULT GETDATE(),
	manager_ssn CHAR(16) NOT NULL
	CONSTRAINT pk_department PRIMARY KEY (department_id),
	CONSTRAINT uq_department_number UNIQUE (number),
	CONSTRAINT uq_department_name UNIQUE (name),
	CONSTRAINT uq_department_manager_ssn UNIQUE (manager_ssn),
	CONSTRAINT fk_department_employee FOREIGN KEY (manager_ssn) REFERENCES employee(ssn)
);
GO

-- Crea la tabla location
CREATE TABLE location(
	number_location INT NOT NULL IDENTITY(1, 1),
	number_department INT NOT NULL,
	name_department VARCHAR(15) NOT NULL,
	location VARCHAR(30) NOT NULL,
	CONSTRAINT pk_location PRIMARY KEY (number_location, number_department, name_department),
	CONSTRAINT fk_location_department FOREIGN KEY (number_department, name_department) REFERENCES department(number, name),
	CONSTRAINT uq_location_location UNIQUE (location)
);
GO

-- Crea la tabla project
CREATE TABLE project(
	project_id INT NOT NULL IDENTITY(1, 1),
	name VARCHAR(30) NOT NULL,
	number INT NOT NULL,
	department_id INT NOT NULL,
	CONSTRAINT pk_project PRIMARY KEY (project_id),
	CONSTRAINT uq_project_name UNIQUE (name),
	CONSTRAINT uq_project_number UNIQUE (number),
	CONSTRAINT fk_project_department FOREIGN KEY (department_id) REFERENCES department(department_id)
);
GO

-- Crea la tabla employee_project
CREATE TABLE employee_project(
	ssn CHAR(16) NOT NULL,
	project_id INT NOT NULL,
	hours INT NOT NULL,
	CONSTRAINT pk_employee_project PRIMARY KEY (ssn, project_id),
	CONSTRAINT fk_employee_project_employee FOREIGN KEY (ssn) REFERENCES employee(ssn),
	CONSTRAINT fk_employee_project_project FOREIGN KEY (project_id) REFERENCES project(project_id)
);
GO