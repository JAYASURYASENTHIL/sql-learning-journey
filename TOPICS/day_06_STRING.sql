-- STRING FUNCTIONS

-- length can used to validate entities that are meant to be of fixed size like phone number,
-- pan number,aadhar number is length mismatches it is what it is

SELECT LENGTH("JAYASURYA");

SELECT first_name,LENGTH(first_name) AS LENGTH
FROM employee_demographics;

SELECT first_name,LENGTH(first_name) AS LENGTH
FROM employee_demographics
ORDER BY 2;

-- upper or lower can be used where standardizatio is must

SELECT UPPER('jayasurya');
SELECT LOWER('JAYASURYA');

SELECT first_name,UPPER(first_name) AS UPPERCASED,LOWER(first_name) AS LOWERCASED
FROM employee_demographics;


-- trim- left trim, right trim

SELECT TRIM("                  JAYASURYA          ");
SELECT LTRIM("                  JAYASURYA          ");
SELECT RTRIM("                  JAYASURYA          ");


-- LEFT(x,n) RIGHT(x,n)
/* =========================================================
   STRING FUNCTIONS: LEFT() and RIGHT()
   =========================================================

   PURPOSE:
   Extract a specific number of characters 
   from the beginning or end of a string.
========================================================= */


/* ---------------------------------------------------------
1. BASIC USAGE
--------------------------------------------------------- */
-- Extract first 4 and last 4 characters of first_name

SELECT first_name,
       LEFT(first_name,4)  AS first_4_chars,
       RIGHT(first_name,4) AS last_4_chars
FROM employee_demographics;

/*
Example:
"Alexander" → LEFT → "Alex", RIGHT → "nder"
*/



/* ---------------------------------------------------------
2. DATA MASKING (SECURITY / PRIVACY)
--------------------------------------------------------- */
-- Show only first 2 characters, hide rest

SELECT 
  LEFT(first_name,2) AS visible_part,
  '****' AS hidden_part
FROM employee_demographics;

/*
Use Case:
- Hiding sensitive info (names, emails, account numbers)
- Banking / user dashboards

Example:
"Alexander" → "Al****"
*/



/* ---------------------------------------------------------
3. GENERATING SHORT NAMES / IDS
--------------------------------------------------------- */
-- Create short username / code

SELECT 
  LEFT(first_name,3) AS short_name
FROM employee_demographics;

/*
Use Case:
- Username generation
- Employee codes

Example:
"Alexander" → "Ale"
*/



/* ---------------------------------------------------------
4. FORMATTING FOR REPORTS
--------------------------------------------------------- */
-- Extract first letter (initial)

SELECT 
  LEFT(first_name,1) AS initial
FROM employee_demographics;

/*
Use Case:
- Reports (A. Kumar format)
- Dashboards

Example:
"Alexander" → "A"
*/

/* ---------------------------------------------------------
5. FILTERING USING PREFIX
--------------------------------------------------------- */
-- Get names starting with 'A'

SELECT *
FROM employee_demographics
WHERE LEFT(first_name,1) = 'A';

/*
Use Case:
- Prefix-based filtering

NOTE:
Better approach (uses index efficiently):
WHERE first_name LIKE 'A%'
*/
/* ---------------------------------------------------------
6. EXTRACTING PARTS FROM STRUCTURED DATA
--------------------------------------------------------- */
-- Example: employee code = 'EMP2025ALEX'

SELECT 
  LEFT(emp_code,3)  AS prefix,
  RIGHT(emp_code,4) AS name_part
FROM employees;

/*
Use Case:
- Parsing encoded strings
- Extracting meaningful segments

Example:
"EMP2025ALEX" → "EMP", "ALEX"
*/
/* ---------------------------------------------------------
7. DATA CLEANING
--------------------------------------------------------- */
-- Extract last 10 digits of phone number

SELECT 
  RIGHT(phone_number,10) AS clean_number
FROM users;

/*
Use Case:
- Remove country codes
- Standardize phone numbers

Example:
"+919876543210" → "9876543210"
*/



/* ---------------------------------------------------------
8. PERFORMANCE NOTE (IMPORTANT)
--------------------------------------------------------- */
-- Avoid this (breaks index usage)

SELECT *
FROM employee_demographics
WHERE LEFT(first_name,1) = 'A';
-- Prefer this (optimized)
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'A%';
/*
Reason:
Functions on columns prevent index usage → slower queries
*/
SELECT first_name,LEFT(first_name,4),RIGHT(first_name,4)
FROM employee_demographics;

 -- SUBSTRING
 
 SELECT first_name,last_name,birth_date,SUBSTRING(birth_date,6,2) AS MONTH_OF_BIRTH
 FROM employee_demographics;
/* ---------------------------------------------------------
3. PARSING STRUCTURED CODES
--------------------------------------------------------- */
-- Example: EMP2025ALEX

SELECT 
  SUBSTRING(emp_code,1,3) AS prefix,
  SUBSTRING(emp_code,4,4) AS year,
  SUBSTRING(emp_code,8,4) AS name_part
FROM employees;

/*
Use Case:
- Extract encoded information
- Work with system-generated IDs

Example:
"EMP2025ALEX" → "EMP", "2025", "ALEX"
*/

-- replace

SELECT first_name , REPLACE(first_name,'A','z')
FROM employee_demographics;

-- locate

SELECT LOCATE('s','jayasurya');

SELECT LOCATE('su','jayasurya');

-- concatination

SELECT first_name,last_name,CONCAT(first_name,' ',last_name) AS FULLNAME
FROM employee_demographics;