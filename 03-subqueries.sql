/* =========================================================
   DATABASE SETUP
   ========================================================= */

CREATE DATABASE IF NOT EXISTS test;
USE test;


/* =========================================================
   TABLE : EMPLOYEES
   ========================================================= */

CREATE TABLE employees (
    id INT PRIMARY KEY,
    fname VARCHAR(30),
    lname VARCHAR(30),
    dept VARCHAR(20),
    salary INT,
    manager_id INT
);

INSERT INTO employees VALUES
(1, 'Supreeth', 'Ragavendra', 'IT', 50000, 4),
(2, 'Rahul', 'Kumar', 'HR', 45000, 4),
(3, 'Gokul', 'S', 'Finance', 60000, 5),
(4, 'Eva', 'Davi', 'IT', 80000, NULL),
(5, 'Mike', 'Brown', 'Finance', 90000, NULL),
(6, 'Vignesh', 'K', 'HR', 40000, 2),
(7, 'Anu', 'S', 'IT', 55000, 4),
(8, 'Karthik', 'P', 'Sales', 30000, 5),
(9, 'Priya', 'R', 'Finance', 65000, 5),
(10, 'Ramesh', 'T', 'Sales', 35000, 8);

SELECT * FROM employees;


/* =========================================================
   SUBQUERY : AVG
   ========================================================= */

-- Employees earning more than average salary
SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
)
ORDER BY id;


/* =========================================================
   SUBQUERY : MAX (Department-wise)
   ========================================================= */

-- Highest salary employee in each department
SELECT *
FROM employees
WHERE (dept, salary) IN (
    SELECT dept, MAX(salary)
    FROM employees
    GROUP BY dept
);


/* =========================================================
   SUBQUERY : IN
   ========================================================= */

-- Employees from departments having salary > 65000
SELECT *
FROM employees
WHERE dept IN (
    SELECT dept
    FROM employees
    WHERE salary > 65000
);


/* =========================================================
   SUBQUERY : EXISTS
   ========================================================= */

-- Employees whose manager earns more than 60000
SELECT *
FROM employees e1
WHERE EXISTS (
    SELECT 1
    FROM employees e2
    WHERE e1.manager_id = e2.id
      AND e2.salary > 60000
);


/* =========================================================
   SUBQUERY : ANY
   ========================================================= */

-- Employees earning more than ANY HR employee
SELECT *
FROM employees
WHERE salary > ANY (
    SELECT salary
    FROM employees
    WHERE dept = 'HR'
);


/* =========================================================
   SUBQUERY : ALL
   ========================================================= */

-- Employees earning more than ALL HR employees
SELECT *
FROM employees
WHERE salary > ALL (
    SELECT salary
    FROM employees
    WHERE dept = 'HR'
);


/* =========================================================
   SUBQUERY WITH MULTIPLE CONDITIONS
   ========================================================= */

-- Employees in IT or Sales with salary > 50000
SELECT *
FROM employees
WHERE salary > 50000
  AND dept IN (
      SELECT dept
      FROM employees
      WHERE dept IN ('IT', 'Sales')
  );
