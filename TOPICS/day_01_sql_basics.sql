# comparision operator

SELECT * FROM employee_salary
WHERE first_name='leslie';

SELECT * FROM employee_salary
WHERE first_name!='leslie';

SELECT * FROM employee_salary
WHERE salary>= 50000;

SELECT * FROM employee_salary
WHERE salary> 50000;

SELECT COUNT(*) FROM employee_salary
WHERE salary>50000;

SELECT * FROM employee_demographics
WHERE gender='female';

select COUNT(*) from employee_demographics
where gender='female';

SELECT * FROM employee_demographics
WHERE gender!='female';

# working with birthdates(y-m-date)

SELECT * FROM employee_demographics
WHERE birth_date>'1962-01-01';

SELECT COUNT(*) FROM employee_demographics
WHERE birth_date>(SELECT MIN(birth_date) FROM employee_demographics);

# logical operators

SELECT * FROM employee_demographics
WHERE gender='female' AND age>30; 

SELECT * FROM employee_demographics
WHERE age<30 OR NOT gender='female';

# LIKE STATEMENT
# % and _

SELECT * FROM employee_demographics
WHERE first_name LIKE '%er%';

SELECT * FROM employee_demographics
WHERE first_name LIKE '%OM';

SELECT * FROM employee_demographics
WHERE first_name LIKE 'AN%';

SELECT * FROM employee_demographics
WHERE first_name LIKE 'A__';

SELECT * FROM employee_demographics
WHERE first_name LIKE 'A___';

SELECT * FROM employee_demographics
WHERE first_name LIKE 'A___%';

SELECT * FROM employee_demographics
WHERE first_name LIKE 'A___%L';

SELECT * FROM employee_demographics
WHERE birth_date LIKE '1986%';

SELECT * FROM employee_demographics
WHERE birth_date LIKE '%26';

SELECT * FROM employee_demographics
WHERE MONTH(birth_date)=12;

SELECT * FROM employee_demographics
WHERE DAY(birth_date)=27;

