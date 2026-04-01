-- Day 2: GROUP BY, ORDER BY, HAVING
-- Concepts learned:
-- 1. Grouping data using GROUP BY
-- 2. Sorting results using ORDER BY
-- 3. Filtering grouped data using HAVING
-- 4. Aggregate functions: COUNT, SUM, AVG, MAX

SELECT * FROM employee_demographics;
SELECT * FROM employee_salary;


SELECT gender FROM employee_demographics
GROUP BY gender;

SELECT gender,AVG(age) 
FROM employee_demographics
GROUP BY gender;

-- SELECT gender,AVG(salary)
-- FROM employee_salary
-- GROUP BY gender;

SELECT gender,MAX(AGE),MIN(AGE),COUNT(AGE)
FROM employee_demographics
GROUP BY gender;

SELECT occupation
FROM employee_salary
GROUP BY occupation;

SELECT occupation,salary
FROM employee_salary
GROUP BY occupation,salary;

 -- ORDER BY
 
 SELECT * FROM employee_demographics
 ORDER BY first_name;
 
 SELECT * FROM employee_demographics
 ORDER BY first_name DESC;
 
 SELECT * FROM employee_demographics
 ORDER BY gender;
 
 SELECT * FROM employee_demographics
 ORDER BY gender DESC,age;
 
 SELECT * FROM employee_demographics
 ORDER BY birth_date;
 
 SELECT * FROM employee_demographics
 ORDER BY age,gender; # special case where second criteria wont even be used because theres no duplicates in first criteria
 
 SELECT * FROM employee_demographics
 ORDER BY 1;
 
 SELECT * FROM employee_demographics
 ORDER BY 4,5 ;
 
 
 

