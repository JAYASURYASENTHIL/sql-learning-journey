-- =========================
-- UNION PRACTICE QUESTIONS
-- =========================

-- Q1:
-- Get all employee names from:
-- full_time_employees and contract_employees

SELECT *
FROM full_time_employees;

SELECT *
FROM contract_employees;

SELECT name
FROM full_time_employees
UNION
SELECT name
FROM contract_employees;

-- Q2:
-- Get all UNIQUE city names from:
-- customers and suppliers

SELECT city
FROM customers
UNION
SELECT city
FROM suppliers;


-- Q3:
-- Get all city names (including duplicates) from:
-- customers and suppliers

SELECT city
FROM customers
UNION ALL
SELECT city
FROM suppliers;

-- Q4:
-- Categorize employees:
-- age > 50 as 'OLD'
-- age < 25 as 'YOUNG'
-- Output: first_name, category

SELECT * FROM employee_demographics;
SELECT * FROM employee_salary;

SELECT first_name,'OLD' AS LABEL
FROM employee_demographics
WHERE age>50
UNION
SELECT first_name,'YOUNG' AS LABEL
FROM employee_demographics
WHERE age<25;

-- Q5:
-- Get employees from:
-- emp_dept1 and emp_dept2
-- Combine both tables into one result

SELECT * FROM emp_dept1
UNION
SELECT * FROM emp_dept2;

-- Q6:
-- Categorize employees based on salary:
-- salary > 80000 → 'HIGH'
-- salary between 40000 and 80000 → 'MEDIUM'
-- Output: employee_id, category

SELECT * FROM employee_salary;

SELECT employee_id,'HIGH' AS CATEGORY
FROM employee_salary
WHERE salary>80000
UNION
SELECT employee_id,'MEDIUM' AS CATEGORY
FROM employee_salary
WHERE salary  BETWEEN 40000 AND 80000;

-- Q7:
-- Get employees who:
-- age > 50 OR salary > 70000
-- Solve this in TWO ways:
-- (a) using UNION
-- (b) using WHERE with OR

SELECT * FROM employee_demographics;
SELECT * FROM employee_salary;

SELECT employee_id
FROM employee_demographics
WHERE age>50
UNION
SELECT employee_id
FROM employee_salary
WHERE salary>70000;


-- Q8:
-- Get employees from india_sales and us_sales
-- where sales > 100000
-- Combine results

SELECT * FROM india_sales;
SELECT * FROM us_sales;

SELECT name
FROM india_sales
WHERE sales>100000
UNION
SELECT name
FROM us_sales
WHERE sales>100000;


-- Q9:
-- Find names that appear in BOTH:
-- students_2023 and students_2024
-- (Hint: UNION + GROUP BY or INTERSECT logic)


SELECT * FROM students_2023;
SELECT * FROM students_2024;

SELECT name
FROM (
    SELECT name FROM students_2023
    UNION ALL
    SELECT name FROM students_2024
) t
GROUP BY name
HAVING COUNT(*) > 1;

-- Q10:
-- Company wants to fire employees if ANY condition is met:
-- age > 50 → 'OLD'
-- dept_id = 6 → 'DEPT_6'
-- salary > 70000 → 'HIGHLY PAID'
-- Output: first_name, last_name, reason
-- (Use UNION ALL)
SELECT first_name,last_name,age,salary,dept_id
FROM employee_demographics ed
JOIN employee_salary es
 ON ed.employee_id=es.employee_id
WHERE age>50 OR salary>70000 OR dept_id=6;

SELECT first_name,last_name,age,salary,dept_id,'OLD' AS REASON
FROM (
   SELECT first_name,last_name,age,salary,dept_id
FROM employee_demographics ed
JOIN employee_salary es
 ON ed.employee_id=es.employee_id
) t
WHERE age>50
UNION ALL
SELECT first_name,last_name,age,salary,dept_id,'HIGHLY PAID' AS REASON
FROM (
   SELECT first_name,last_name,age,salary,dept_id
FROM employee_demographics ed
JOIN employee_salary es
 ON ed.employee_id=es.employee_id
) t
WHERE salary>70000
UNION ALL
SELECT first_name,last_name,age,salary,dept_id,'BELONGS TO DEPT_6' AS REASON
FROM (
   SELECT first_name,last_name,age,salary,dept_id
FROM employee_demographics ed
JOIN employee_salary es
 ON ed.employee_id=es.employee_id
) t
WHERE dept_id=6;

-- alternative and efficient
WITH emp AS (
    SELECT first_name, last_name, age, salary, dept_id
    FROM employee_demographics ed
    JOIN employee_salary es
      ON ed.employee_id = es.employee_id
)

SELECT first_name, last_name, age, salary, dept_id, 'OLD' AS reason
FROM emp
WHERE age > 50

UNION ALL

SELECT first_name, last_name, age, salary, dept_id, 'HIGHLY PAID'
FROM emp
WHERE salary > 70000

UNION ALL

SELECT first_name, last_name, age, salary, dept_id, 'BELONGS TO DEPT_6'
FROM emp
WHERE dept_id = 6; 











