/* 1. Get first 3 letters of each employee name */

SELECT first_name,LEFT(first_name,3) AS FIRST_3
FROM employee_demographics;

/* 2. Show full name in uppercase */
SELECT UPPER(CONCATED)
FROM
(
  SELECT CONCAT(first_name,' ',last_name) AS CONCATED
  FROM employee_demographics
)AS t;

SELECT UPPER(CONCAT(first_name,' ',last_name)) AS FULLNAME
FROM employee_demographics;


/* 3. Find employees whose name starts with 'J' */
SELECT * 
FROM employee_demographics
WHERE first_name  LIKE 'J%';

/* 4. Remove extra spaces from names */
SELECT trim(FULLNAME)
FROM
(
 SELECT CONCAT(first_name,last_name) AS FULLNAME
 FROM employee_demographics
) AS t;

/* 5. Extract birth year from birth_date */
SELECT *
FROM employee_demographics;

SELECT birth_date,substring(birth_date,6,2) AS MONTH
FROM employee_demographics;

SELECT birth_date,MONTH(birth_date) AS MONTH
FROM employee_demographics;

/* 6. Find employees born in December */
SELECT *
FROM employee_demographics
WHERE substring(birth_date,6,2)=12;

/* 8. Replace all 'a' with '@' in names */

SELECT REPLACE(CONCATED,'a','@')
FROM(
SELECT CONCAT(first_name,' ',last_name) AS CONCATED
FROM employee_demographics
) AS t;

/* 9. Find position of 'a' in each name */
SELECT FULLNAME,LOCATE('a',FULLNAME)
FROM
(
SELECT CONCAT(first_name,' ',last_name) AS FULLNAME
FROM employee_demographics
)AS t;

/* 10. Show full name using CONCAT */
SELECT first_name,last_name,CONCAT(first_name,' ',last_name)  FULLNAME
FROM employee_demographics;







