USE dummy;

SELECT * FROM employees;


/* =========================================================
   BETWEEN / NOT BETWEEN
   ========================================================= */

SELECT * 
FROM employees 
WHERE salary BETWEEN 50000 AND 55000;

SELECT * 
FROM employee 
WHERE salary NOT BETWEEN 50000 AND 55000;


/* =========================================================
   LIKE OPERATOR
   ========================================================= */

SELECT * 
FROM employees 
WHERE fname LIKE 's%';

SELECT * 
FROM employees 
WHERE fname LIKE '%a';

SELECT * 
FROM employees 
WHERE fname LIKE '%e%';

SELECT * 
FROM employees 
WHERE fname LIKE '_p%';


/* =========================================================
   NULL CHECK
   ========================================================= */

INSERT INTO employees VALUES
(6, 'Rahul', 'S', 'IT', NULL);

SELECT * 
FROM employees 
WHERE salary IS NULL;


/* =========================================================
   IN OPERATOR
   ========================================================= */

SELECT * 
FROM employees 
WHERE dept IN ('IT', 'HR');
