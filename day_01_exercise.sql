-- ================================
-- SQL Practice Questions - Day 1
-- Topics: WHERE, Logical Operators, LIKE, Dates, Subqueries
-- ================================

-- LEVEL 1 (Basic)

-- Q1: Get all employees with salary greater than 60,000.
SELECT * FROM employee_salary
WHERE salary>60000;

-- Q2: Get all female employees older than 25.
SELECT *  FROM employee_demographics
WHERE age>25 AND gender='female';

-- Q3: Get all employees whose first name starts with 'A'.
SELECT * FROM employee_demographics
WHERE first_name LIKE 'A%';

-- Q4: Get all employees born after 1990.
SELECT * FROM employee_demographics
WHERE birth_date>'1990-01-01';

-- LEVEL 2 (Intermediate)

-- Q5: Get employees whose salary is between 40,000 and 80,000.
SELECT * FROM employee_salary
WHERE salary>=40000 AND salary<=80000;

-- Q6: Get employees whose first name ends with 'n'.
SELECT * FROM employee_demographics
WHERE first_name LIKE '%n';

-- Q7: Get employees who are NOT male.
SELECT * FROM employee_demographics
WHERE gender != 'male';

-- Q8: Get employees whose birth date is in December.
SELECT * FROM employee_demographics
WHERE MONTH(birth_date) =12;

-- LEVEL 3 (Understanding Test)

-- Q9: Get employees whose salary is greater than the average salary.
SELECT * FROM employee_salary
WHERE salary>(SELECT AVG(salary) FROM employee_salary);

-- Q10: Get employees who are younger than the average age.
SELECT * FROM employee_demographics
WHERE age<(SELECT AVG(age) FROM employee_demographics);

-- Q11: Get employees whose birth date day = 15.
SELECT * FROM employee_demographics
WHERE DAY(birth_date)=15;

-- Q12: Get employees whose name contains 'ar' anywhere.
SELECT * FROM employee_demographics
WHERE first_name LIKE '%ar%' OR last_name LIKE '%ar%' ;

-- LEVEL 4 (Advanced Thinking)

-- Q13: Get employees whose salary is not equal to the maximum salary.
SELECT * FROM employee_salary
WHERE salary!=(SELECT MAX(salary) FROM employee_salary);

-- Q14: Get employees who are older than the youngest employee.
SELECT * FROM employee_demographics
WHERE age>(SELECT MIN(AGE) FROM employee_demographics);

SELECT * FROM employee_demographics
WHERE birth_date<(SELECT MAX(birth_date) FROM employee_demographics);

-- Q15: Get employees whose birth year is 1985 
--      (Solve using LIKE and also using a proper date function)
SELECT * FROM employee_demographics
WHERE birth_date LIKE '1985%';

SELECT * FROM employee_demographics
WHERE YEAR(birth_date)=1985;
