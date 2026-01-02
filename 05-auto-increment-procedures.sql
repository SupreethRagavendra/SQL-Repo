/* =========================================================
   AUTO INCREMENT
   ========================================================= */

CREATE DATABASE IF NOT EXISTS dummy2;
USE dummy2;

CREATE TABLE transactions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    amt INT
);

-- Insert record
INSERT INTO transactions (amt) VALUES (1000);

SELECT * FROM transactions;

-- Set AUTO_INCREMENT start value
ALTER TABLE transactions AUTO_INCREMENT = 101;

-- Delete records
DELETE FROM transactions;

SELECT * FROM transactions;

-- Insert again
INSERT INTO transactions (amt) VALUES (1001);

SELECT * FROM transactions;


/* =========================================================
   STORED PROCEDURES
   ========================================================= */

USE dummy;

SELECT * FROM employee;


-- Procedure : Get all employees
DELIMITER //

CREATE PROCEDURE get_all_employee()
BEGIN
    SELECT * FROM employee;
END //

DELIMITER ;

CALL get_all_employee();


-- Procedure : Get employees by department
DELIMITER //

CREATE PROCEDURE get_emp_by_dept(IN deptname VARCHAR(30))
BEGIN
    SELECT * 
    FROM employee 
    WHERE dept = deptname;
END //

DELIMITER ;

CALL get_emp_by_dept('IT');
