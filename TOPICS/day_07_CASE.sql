-- case statements

SELECT first_name,last_name,age,
CASE 
 WHEN age>50 THEN 'OLD'
 WHEN age<40 THEN 'YOUNG'
 WHEN age BETWEEN 40 AND 50 THEN 'TRANSITION PHASE'
END AS AGE_CATEGORY

FROM employee_demographics;

-- pay INCREASE
-- rule:<50000 = 5% hike
-- income>50000 = 4% hike
-- dept == finance -> 10% hike


SELECT first_name,last_name,dept_id,salary,new_salary,bonus,new_salary+bonus AS CTC
FROM(
SELECT first_name,last_name,dept_id,salary,
CASE
  WHEN dept_id=1 THEN salary+(salary * 0.10)
  WHEN salary=50000 OR salary<50000 THEN salary+(salary * 0.05)
  WHEN salary>50000 THEN salary+(salary* 0.04)
 END AS NEW_SALARY,
CASE 
  WHEN dept_id =1 THEN 10000
  WHEN dept_id=3  THEN 20000
  WHEN dept_id=6 THEN 30000
  END AS BONUS
  
FROM employee_salary
) AS SALARY_DATA;