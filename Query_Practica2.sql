/*
1- Crea una base de datos llamada EmpresaDevJav
*/
CREATE DATABASE EmpresaDevJav;
USE EmpresaDevJav;

/*2- Crea 2 tablas e ingresa por lo menos 5 registros*/

CREATE TABLE departamento(
	codDepto	INT NOT NULL auto_increment,
    nombreDepto	VARCHAR(100),
    ciudad		VARCHAR(100),
    director	INT,
    PRIMARY KEY(codDepto)
);

CREATE TABLE empleado(
	nDIEmp	INT NOT NULL,
    nomEmp	VARCHAR(100),
    sexEmp	CHAR(1),
    fecNac	DATE,
    fecIncorporacion DATE,
    salEmp 	DECIMAL(10,2),
    comis 	DECIMAL(10,2),
    cargo	VARCHAR(100),
    nroDepto	INT,
    PRIMARY KEY(nDIEmp),
    FOREIGN KEY (nroDepto) REFERENCES departamento(codDepto)
);

INSERT INTO departamento
VALUES	(1000, 'Gerencia', 'Buenos Aires', 31840269),
		(1001, 'Administración', 'Santa Fe', 33278067),
        (1002, 'Ventas', 'Córdoba', 30795132),
        (1003, 'Recursos Humanos', 'Buenos Aires', 36756881),
        (1004, 'Marketing', 'Córdoba', 40257795);

INSERT INTO empleado
VALUES 
(311178144, 'Rosa Angulo', 'F', '1957-03-15', '2022-08-16', 725000, 40000, 'Jefe de ventas', 1002),
(36745659, 'Belén Cárdenas', 'F', '1993-07-07', '2024-02-01', 560000, 15000, 'Vendedor', 1002),
(36125851, 'Damián Vallejo', 'M', '1990-01-23', '2023-02-14', 600000, 16500, 'Vendedor', 1002),
(34845923, 'Nicolas Sanchez', 'M', '1987-03-23', '2022-11-26', 650000, 20000, 'Vendedor', 1002),
(35895651, 'Mariana Dominguez', 'F', '1988-08-25', '2022-10-12', 660000, 22000, 'Vendedor', 1002),
(40348164, 'Ana Gonzalez', 'F', '1998-07-25', '2024-04-01', 400000, 10000, 'Vendedor', 1002),
(30567123, 'Martin Sanchez', 'M', '1984-05-16', '2022-08-16', 750000, 0, 'Jefe de Administración', 1001),
(39654193, 'Emmanuel Gimenez', 'M', '1998-01-22', '2023-10-01', 500000, 0, 'Empleado', 1001),
(36157972, 'Agustín Gonzalez', 'M', '1990-11-28', '2023-03-21', 550000, 0, 'Empleado', 1001),
(41459621, 'Lucia Villa', 'F', '2000-10-05', '2024-03-01', 450000, 0, 'Empleado', 1001),
(39894156, 'Maria Sanchez', 'F', '1998-06-21', '2023-11-21', 470000, 0, 'Empleado', 1001),
(30458967, 'Fabiana Gonzalez', 'F', '1980-03-22', '2022-08-16', 750000, 0, 'Jefe de Recursos Humanos', 1003),
(33173862, 'Luciana Lopez', 'F', '1983-03-22', '2022-10-25', 625000, 0, 'Empleado', 1003),
(39567158, 'Maria Silva', 'F', '1998-10-10', '2023-05-10', 550000, 0, 'Empleado', 1003),
(31589146, 'Mauricio Lopez', 'M', '1982-04-21', '2022-08-16', 750000, 0, 'Jefe de Marketing', 1004),
(41238954, 'Juan Perez', 'M', '2002-07-13', '2024-03-14', 400000, 0, 'Empleado', 1004),
(21457132, 'Juan Pablo Sanchez', 'M', '1978-07-14', '2022-08-16', 1000000, 0, 'Gerente General', 1000);

/*3- Realiza las siguientes consultas: */
	/* a) Obtener los nombres de los empleados */
    
    SELECT nomEmp
    FROM empleado;
    
    /* b) Mostrar los datos completos de los departamentos */
    
    SELECT nombreDepto
    FROM departamento;
    
    /* c) Obtener los datos de empleados con cargo 'Vendedor'*/
    
    SELECT *
    FROM empleado
    WHERE cargo = 'Vendedor';
    
    /* d) Mostrar la cantidad de empleados registrados */
    
    SELECT COUNT(*) as 'Número de Empleados Registrados'
    FROM empleado;
    
    /* e) Sacar un promedio de salarios de empleados */
    
    SELECT AVG(salEmp) as 'Promedio del salario de los empleados'
    FROM empleado;
    
    /* f) Lista los nombres de los departamentos ordenados por ciudad */
    
    SELECT nombreDepto
    FROM departamento
    ORDER BY ciudad;
    
    /* g) Muestra un listado de salarios y comisiones de los empleados del
departamento 'Ventas' */

	SELECT e.salEmp, e.comis
    FROM departamento d JOIN empleado e ON d.codDepto = e.nroDepto
    WHERE d.nombreDepto = 'Ventas';
    
    /* h) Calcular el valor a pagar a cada empleado si se realiza un incremento del 25%
en su salario más una bonificación de $20000, muestre una columna con el
salario actual, otra con el incremento y otra con la suma de todo */

SELECT salEmp as 'Salario Actual', (salEmp*1.25) as 'Salario mas incremento del 25%', (salEmp*1.25 + 20000) as 'Salario mas incremento del 25% y bonificacion de $20000'
FROM empleado;

/* i) Editar el salario realizando el incremento del punto anterior */

-- COMPLETAR

UPDATE empleado
SET salEmp = salEmp*1.25 + 20000;

/* j) Modificar la ciudad 'Santa Fe' a la nueva ciudad 'Mendoza' */

	UPDATE departamento
    SET ciudad = 'Mendoza'
    WHERE ciudad = 'Santa Fe';
	
/* k) Hallar el salario del empleado con identificación 36125851 */

	SELECT salEmp
    FROM empleado
	WHERE nDIEmp = 36125851;
    
/* l) Muestre empleados donde el nombre empiece con la letra A */

	SELECT *
    FROM empleado
    WHERE nomEmp like 'A%';
    
/* m)  Liste los empleados que no tienen comisión */

	SELECT *
    FROM empleado
    WHERE comis = 0 or comis = null;

/* n) Muestre los empleados cuyo sueldo supere 700000 y que correspondan al
departamento 'ventas' */

	SELECT e.nDIEmp ,e.nomEmp, salEmp, d.nombreDepto
    FROM empleado e JOIN departamento d ON e.nroDepto = d.codDepto
    WHERE e.salEmp > 700000 and d.nombreDepto = 'Ventas';
    
/* o) Obtener el salario más alto y quien lo recibe */

	SELECT nomEmp, salEmp, cargo
    FROM empleado
    WHERE salEmp = (SELECT MAX(salEmp)
    FROM empleado);

/* p) El empleado 'Emmanuel Gimenez' renunció, vamos a eliminar su registro */

DELETE FROM empleado WHERE nomEmp = 'Emmanuel Gimenez';
