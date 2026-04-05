-- LIMITING ,ALIASING,JOINS

-- LIMIT IS JUST USED TO DEFINE NO OF ROWS U WANT AS OUTPUT, IT CAN BE USED WITH ORDER BY TO DO
-- MEANINGFUL TASKS

SELECT * FROM employee;

SELECT * FROM employee
LIMIT 4;

SELECT * FROM employee
LIMIT 3,1; -- it works like start from 3rd row and fetch 1st row after 3rd row

SELECT * FROM employee
ORDER BY salary DESC
LIMIT 3;

-- ALIASING
-- Its just renaming a column to work further on in queries

-- just renaming
SELECT department,AVG(salary) AS AVG_SALARY
FROM employee
GROUP BY department;

-- renaming and using in further queries , we can see that instead of typing AVG(salary) 
-- we used AVG_SALARY in HAVING
SELECT department,AVG(salary) AS AVG_SALARY
FROM employee
GROUP BY department
HAVING AVG_SALARY>=37000;

-- JOINS
-- THESE ARE USED TO JUST COMBINE DIFFERENT TABLES WHERE THERE EXISTS A COMMON COLUMN
-- inner join only returns rows where both table contains common column value

SELECT e_d.employee_id,e_d.first_name,e_d.last_name,age,gender,birth_date,occupation
FROM employee_demographics AS e_d
INNER JOIN employee_salary AS e_s
   ON e_d.employee_id=e_s.employee_id;
   
-- alias is used to avoid ambiguity error ie SQL doesnt know employee_id on which table

-- OUTER JOIN-- LEFT JOIN
             -- RIGHT JOIN
             
SELECT * 
FROM employee_demographics as emp_d
LEFT JOIN employee_salary as emp_sal
    ON emp_d.employee_id = emp_sal.employee_id;
    
SELECT * 
FROM employee_demographics as emp_d
RIGHT JOIN employee_salary as emp_sal
    ON emp_d.employee_id = emp_sal.employee_id;
    
-- SELF JOIN
-- JOINING MULTIPLE TABLES TOGETHER

SELECT *
FROM employee_demographics as emp_demo
INNER JOIN employee_salary as emp_sal
    ON emp_demo.employee_id = emp_sal.employee_id
INNER JOIN parks_departments AS pd
    ON emp_sal.dept_id=pd.department_id;


    
