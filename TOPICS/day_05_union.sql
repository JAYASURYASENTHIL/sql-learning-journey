 -- UNION
 -- union is used to get common rows in single or multiple tables
 -- union is disttinct by default
 
 SELECT employee_id,first_name,last_name 
 FROM employee_demographics
 UNION
 SELECT employee_id,first_name,last_name
 FROM employee_salary;
 
 -- union is disttinct by default by can be modified explicitly by using "ALL" keyword
 
 
  SELECT employee_id,first_name,last_name 
 FROM employee_demographics
 UNION ALL
 SELECT employee_id,first_name,last_name
 FROM employee_salary;
 
 -- lets say a company wants to fire highly paid,dept_6 employees and old ones
 SELECT first_name,last_name ,'OLD' AS LABEL
 FROM employee_demographics
 WHERE age>50
 UNION
 SELECT first_name,last_name, 'DEPT_6' AS LABEL
 FROM employee_salary
 WHERE dept_id=6
 UNION
 SELECT first_name,last_name , 'HIGHLY PAID' AS LABEL
 FROM employee_salary
 WHERE salary>70000;
 
 SELECT * FROM employee_demographics;
 SELECT * FROM employee_salary;
 