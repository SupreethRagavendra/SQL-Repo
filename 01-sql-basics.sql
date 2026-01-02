/* =========================================================
   DATABASE SETUP
   ========================================================= */

CREATE DATABASE IF NOT EXISTS dummy;
USE dummy;


/* =========================================================
   TABLE : EMPLOYEE
   ========================================================= */

CREATE TABLE employee (
    id INT,
    empname VARCHAR(30),
    dept VARCHAR(40),
    salary INT
);

INSERT INTO employee VALUES
(1, 'Supreeth', 'IT', NULL),
(2, 'Rahul', 'IT', NULL),
(3, 'Paul', 'Sales', 3000);

SELECT * FROM employee;


/* =========================================================
   AGGREGATE FUNCTIONS
   ========================================================= */

SELECT MAX(salary) AS max_salary FROM employee;
SELECT MIN(salary) AS min_salary FROM employee;
SELECT AVG(salary) AS avg_salary FROM employee;
SELECT COUNT(*) AS total_employees FROM employee;
SELECT SUM(salary) AS total_salary FROM employee;


/* =========================================================
   TABLE : STUDENTS
   ========================================================= */

CREATE TABLE students (
    stuname VARCHAR(40),
    marks INT,
    dept VARCHAR(30)
);

INSERT INTO students VALUES
('Supreeth', 80, 'MCA'),
('Rahul', 60, 'CSE'),
('Gokul', 76, 'MCA'),
('Vignesh', 60, 'ECE');

SELECT * FROM students;


/* =========================================================
   ORDER BY
   ========================================================= */

SELECT * FROM students ORDER BY marks DESC;
SELECT * FROM students ORDER BY marks ASC;


/* =========================================================
   GROUP BY
   ========================================================= */

SELECT dept, SUM(marks) AS total_marks
FROM students
GROUP BY dept;

SELECT dept, AVG(marks) AS avg_marks
FROM students
GROUP BY dept;

SELECT dept, COUNT(*) AS student_count
FROM students
GROUP BY dept
ORDER BY student_count DESC;


/* =========================================================
   TABLE : EMPLOYEES (PRACTICE)
   ========================================================= */

CREATE TABLE employees (
    id INT,
    fname VARCHAR(30),
    lname VARCHAR(40),
    dept VARCHAR(20),
    salary INT
);

INSERT INTO employees VALUES
(1, 'Supreeth', 'Ragavendra', 'IT', 50000),
(2, 'Bob', 'Johnson', 'IT', 54000),
(3, 'Mike', 'Brown', 'Finance', 40000),
(4, 'Eva', 'Davi', 'Finance', 54000),
(5, 'Gokul', 'S', 'HR', 55000);

SELECT * FROM employees;


/* =========================================================
   WHERE + ORDER BY
   ========================================================= */

SELECT * FROM employees
ORDER BY lname ASC;

SELECT * FROM employees
WHERE dept = 'IT'
ORDER BY salary DESC;


/* =========================================================
   GROUP BY + AGGREGATES
   ========================================================= */

SELECT dept, COUNT(*) AS employee_count
FROM employees
GROUP BY dept;

SELECT dept, AVG(salary) AS avg_salary
FROM employees
GROUP BY dept
ORDER BY dept ASC;

SELECT dept, AVG(salary) AS avg_salary
FROM employees
GROUP BY dept
ORDER BY avg_salary DESC
LIMIT 1;


/* =========================================================
   WHERE vs HAVING
   ========================================================= */

SELECT * FROM employees
WHERE salary > 50000;

SELECT dept, COUNT(*) AS employee_count
FROM employees
GROUP BY dept
HAVING COUNT(*) > 1;

SELECT dept, AVG(salary) AS avg_salary
FROM employees
WHERE salary > 40000
GROUP BY dept
HAVING AVG(salary) < 60000;
