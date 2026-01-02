/* =========================================================
   INDEX
   ========================================================= */

USE customer;

SHOW TABLES;

SELECT * FROM persons;
DESC persons;

-- Create Index
CREATE INDEX idx_person_age
ON persons(age);

-- Drop Index
DROP INDEX idx_person_age ON persons;


/* =========================================================
   VIEW
   ========================================================= */

USE dummy;

SELECT * FROM employees;

-- Create View
CREATE VIEW it_employees AS
SELECT *
FROM employees
WHERE dept = 'IT';

-- View Data
SELECT * FROM it_employees;


/* =========================================================
   TRIGGER
   ========================================================= */

-- Main Table
CREATE TABLE emp (
    id INT PRIMARY KEY,
    name VARCHAR(30),
    salary INT
);

-- Log Table
CREATE TABLE employee_log (
    empId INT,
    action VARCHAR(30),
    actionTime DATETIME
);

-- Trigger: After Insert
CREATE TRIGGER after_insert_emp
AFTER INSERT ON emp
FOR EACH ROW
INSERT INTO employee_log
VALUES (NEW.id, 'INSERT', NOW());

-- Test Trigger
INSERT INTO emp VALUES (1, 'Supreeth', 50000);

-- Check Log
SELECT * FROM employee_log;
