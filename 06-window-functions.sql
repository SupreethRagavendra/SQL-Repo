/* =========================================================
   DATABASE SETUP
   ========================================================= */

CREATE DATABASE IF NOT EXISTS joins;
USE joins;


/* =========================================================
   TABLE CREATION
   ========================================================= */

CREATE TABLE department (
    department_id VARCHAR(10) PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE manager (
    manager_id VARCHAR(10) PRIMARY KEY,
    manager_name VARCHAR(50),
    department_id VARCHAR(10)
);

CREATE TABLE employee (
    employee_id VARCHAR(10) PRIMARY KEY,
    employee_name VARCHAR(50),
    salary INT,
    department_id VARCHAR(10),
    manager_id VARCHAR(10),
    FOREIGN KEY (department_id) REFERENCES department(department_id),
    FOREIGN KEY (manager_id) REFERENCES manager(manager_id)
);

CREATE TABLE project (
    project_id VARCHAR(10) PRIMARY KEY,
    project_name VARCHAR(50),
    team_member_id VARCHAR(10)
);


/* =========================================================
   DATA INSERTION
   ========================================================= */

INSERT INTO department VALUES
('D1', 'IT'),
('D2', 'HR'),
('D3', 'Finance'),
('D4', 'Admin');

INSERT INTO manager VALUES
('M1', 'John', 'D1'),
('M2', 'David', 'D2'),
('M3', 'Sara', 'D10'),
('M4', 'Emma', 'D3');

INSERT INTO employee VALUES
('E1', 'Rahul', 60000, 'D1', 'M1'),
('E2', 'Manoj', 55000, 'D1', 'M1'),
('E3', 'Michael', 50000, 'D2', 'M2'),
('E4', 'James', 45000, 'D2', 'M2'),
('E5', 'Ali', 40000, NULL, 'M3'),
('E6', 'Robin', 42000, NULL, 'M3');

INSERT INTO project VALUES
('P1', 'ETL Tool Development', 'E1'),
('P2', 'Data Migration', 'E1'),
('P3', 'Payroll System', 'E2'),
('P4', 'HR Analytics', 'M3');


/* =========================================================
   INNER JOIN
   ========================================================= */

SELECT e.employee_name, d.department_name
FROM employee e
INNER JOIN department d
ON e.department_id = d.department_id;


/* =========================================================
   LEFT JOIN
   ========================================================= */

SELECT e.employee_name, d.department_name
FROM employee e
LEFT JOIN department d
ON e.department_id = d.department_id;


/* =========================================================
   RIGHT JOIN
   ========================================================= */

SELECT e.employee_name, d.department_name
FROM employee e
RIGHT JOIN department d
ON e.department_id = d.department_id;


/* =========================================================
   MULTIPLE JOINS
   ========================================================= */

SELECT e.employee_name,
       d.department_name,
       m.manager_name,
       p.project_name
FROM employee e
LEFT JOIN department d
       ON e.department_id = d.department_id
INNER JOIN manager m
       ON m.manager_id = e.manager_id
JOIN project p
       ON p.team_member_id = e.employee_id;


/* =========================================================
   FULL JOIN (USING UNION)
   ========================================================= */

SELECT e.employee_name, d.department_name
FROM employee e
LEFT JOIN department d
ON e.department_id = d.department_id

UNION

SELECT e.employee_name, d.department_name
FROM employee e
RIGHT JOIN department d
ON e.department_id = d.department_id;


/* =========================================================
   CROSS JOIN
   ========================================================= */

SELECT e.employee_name, d.department_name
FROM employee e
CROSS JOIN department d;


/* =========================================================
   NATURAL JOIN
   ========================================================= */

SELECT e.employee_name, d.department_name
FROM employee e
NATURAL JOIN department d;


/* =========================================================
   SELF JOIN
   ========================================================= */

SELECT e.employee_name AS Employee,
       m.employee_name AS Manager
FROM employee e
LEFT JOIN employee m
ON e.manager_id = m.employee_id;
