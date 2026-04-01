CREATE TABLE employee (
    id INT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50)
);

INSERT INTO employee (id, name, department, salary, city) VALUES
(1, 'A', 'HR', 30000, 'Chennai'),
(2, 'B', 'IT', 50000, 'Bangalore'),
(3, 'C', 'HR', 40000, 'Chennai'),
(4, 'D', 'IT', 60000, 'Bangalore'),
(5, 'E', 'Sales', 45000, 'Mumbai'),
(6, 'F', 'Sales', 55000, 'Mumbai');

SELECT * FROM employee;


-- ================================
-- LEVEL 1 (Basic)
-- ================================

-- Q1: Count number of employees in each department

SELECT department,COUNT(*)
FROM employee
GROUP BY department;

-- Q2: Find average salary of each department
SELECT department,AVG(SALARY)
FROM employee
GROUP BY department;

-- Q3: Show all employees sorted by salary (highest first)
SELECT * FROM employee
ORDER BY salary DESC;

-- Q4: Show all employees sorted by name alphabetically
SELECT * FROM employee
ORDER BY name;

-- Q5: Find maximum salary in each department
SELECT department,MAX(salary)
FROM employee
GROUP BY department;

-- ================================
-- LEVEL 2 (Intermediate)
-- ================================
-- Q6: Find total salary of each department
SELECT department,SUM(salary) AS TOTAL_SALARY
FROM employee
GROUP BY department;

-- Q7: Show departments sorted by total salary (highest first)
SELECT department,SUM(salary) AS TOTAL_SALARY
FROM employee
GROUP BY department
ORDER BY TOTAL_SALARY DESC;

-- Q8: Find departments having more than 1 employee
SELECT department,count(*)
FROM employee
GROUP BY department
HAVING count(*)>1 ;

-- Q9: Show average salary per city
SELECT city,AVG(salary) AS AVERAGE_SALARY_OF_CITIES
FROM employee
GROUP BY city;

-- Q10: Sort employees by department (A–Z) and then salary (highest first)
SELECT *
FROM employee
ORDER BY department,salary DESC;

-- ================================
-- LEVEL 3 (Advanced / Interview)
-- ================================
SELECT * FROM employee;
-- Q11: Find the department with highest average salary
SELECT department,AVG(salary) as AVG_SALARY
FROM employee
GROUP BY department
ORDER BY AVG_SALARY DESC
LIMIT 1;

-- Q12: Find top 2 highest paying departments (based on avg salary)
SELECT department,AVG(salary) AS AVG_SALARY
FROM employee
GROUP BY department
ORDER BY AVG_SALARY DESC
LIMIT 2;

-- Q13: Find cities where total salary is greater than 90000
SELECT city,SUM(salary) AS TOTAL_SALARY
FROM employee
GROUP BY city
HAVING TOTAL_SALARY>90000;
#HAVING SUM(salary) > 90000; use this method , appranently alias method has failure chance 

-- Q14: Find departments where max salary > 50000
SELECT department,MAX(salary) as MAX_SALARY
FROM employee
GROUP BY department
HAVING MAX_SALARY>50000;

-- Q15: Find department with lowest total salary
SELECT department,SUM(salary) AS TOTAL_SALARY
FROM employee
GROUP BY department 
ORDER BY TOTAL_SALARY
LIMIT 1;

-- Q16: Show department, total salary, and sort by total salary descending
SELECT department,SUM(salary) AS TOTAL_SALARY
FROM employee
GROUP BY department
ORDER BY TOTAL_SALARY DESC;

-- Q17: Show department and number of employees, 
--      only include departments with avg salary > 40000
SELECT department,COUNT(*) AS NUMBER_OF_EMPLOYEES,AVG(salary) AS AVG_SAL
FROM employee
GROUP BY department
HAVING AVG_SAL>40000;

-- Q18: Find second highest salary (try without LIMIT if possible)
SELECT MAX(salary)
FROM employee
WHERE salary<(SELECT MAX(salary) FROM employee);






