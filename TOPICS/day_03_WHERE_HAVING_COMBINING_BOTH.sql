-- WHERE, HAVING AND COMBINING BOTH, SINCE LECTURE IS TOO SHORT EXERCISE AND TOPIC IS SAME AS TOPIC LECTURE HAS NOTHING

-- =========================
-- PART 1: WHERE ONLY
-- =========================

-- Q1: Get all employees with salary > 50,000

SELECT *
FROM employee
WHERE salary>50000;

-- Q2: Get employees from "IT" department
SELECT * FROM employee
WHERE department='it';

-- use LOWER(x)='x'

-- Q3: Get employees who joined after 2022
ALTER TABLE employee
ADD yoj INT;

    
SET SQL_SAFE_UPDATES = 0;
UPDATE employee
SET yoj=
CASE
WHEN name='A' THEN 2000
WHEN name='b' THEN 2001
WHEN name='C' THEN 2002
WHEN name='D' THEN 2003
WHEN name='E' THEN 2004
WHEN name='F' THEN 2005
END;

SELECT * FROM employee
WHERE yoj>2022;

-- =========================
-- PART 2: HAVING ONLY
-- =========================

-- Q4: Find departments with more than 1 employee

SELECT department,count(*) AS NO_OF_EMPLOYEES
FROM employee
GROUP BY department
HAVING count(*)>1;

-- Q5: Find departments where average salary > 50,000

  -- checking avg salary
SELECT department,AVG(salary) AS AVG_SALARY
FROM employee
GROUP BY department;


SELECT department,AVG(salary) AS AVG_SALARY
FROM employee
GROUP BY department
HAVING AVG_SALARY >50000;
-- dont write this method use AVG(SALARY) at having instead of alias


-- Q6: Find dept where total salary > 1,00,000

SELECT department,SUM(salary) AS TOTAL_SALARY
FROM employee
GROUP BY department
HAVING TOTAL_SALARY>100000;

-- =========================
-- PART 3: WHERE + HAVING
-- =========================

-- Q7: Find departments where:
--     employees have salary > 30,000
--     AND department average salary > 50,000

SELECT department,AVG(SALARY) AS AVG_SALARY
FROM employee
WHERE salary>30000
GROUP BY department
HAVING AVG_SALARY > 50000;

-- Find departments where:
-- employees salary > 30000
-- AND department has more than 3 employees
-- AND the highest salary in that department > 90000


-- Q8: Find departments where:
--     only employees who joined after 2020 are considered
--     AND total employees in that group > 3

SELECT department,COUNT(*) AS TOTAL_EMP_IN_DEPT
FROM employee
WHERE yoj>2020
GROUP BY department
HAVING TOTAL_EMP_IN_DEPT>3;

-- Q9: Find departments where:
--     salary > 40,000
--     AND average salary is between 50,000 and 80,000
SELECT department,AVG(SALARY) AS AVG_SALARY
FROM employee
WHERE salary>40000
GROUP BY department
HAVING AVG_SALARY BETWEEN 50000 AND 80000;


-- Q10: Find departments where:
--      employees are from "IT" or "HR"
--      AND total salary > 1,00,000
--      AND average salary > 50,000
SELECT department,SUM(salary) AS TOTAL_SALARY,AVG(salary) AS AVG_SALARY
FROM employee
WHERE department='it' OR department='hr'
GROUP BY department
HAVING TOTAL_SALARY>100000 AND AVG_SALARY>50000;

-- Find departments where:
-- employees salary > 30000
-- AND department has more than 1 employees
-- AND the highest salary in that department >= 60000
SELECT department,count(*) AS TOTAL_EMP_PER_DEPT,MAX(salary) AS HIGHEST_SALARY
FROM employee
WHERE salary>30000
GROUP BY department
HAVING COUNT(*)>1 AND MAX(SALARY)>=60000;