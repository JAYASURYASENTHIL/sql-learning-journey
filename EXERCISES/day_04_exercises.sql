-- EMPLOYEES TABLE (for self join + dept join)
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    dept_id INT,
    manager_id INT
);

INSERT INTO employees VALUES
(1, 'Surya', 80000, 10, NULL),
(2, 'Ram', 50000, 20, 1),
(3, 'Arjun', 40000, 10, 1),
(4, 'Kiran', 30000, NULL, 2),
(5, 'Vijay', 60000, 30, NULL);


-- DEPARTMENTS TABLE
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO departments VALUES
(10, 'HR'),
(20, 'IT'),
(30, 'Finance'),
(40, 'Marketing');


-- CUSTOMERS TABLE
CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO customers VALUES
(1, 'Amit'),
(2, 'Ravi'),
(3, 'Priya'),
(4, 'Neha');


-- PRODUCTS TABLE
CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    price INT
);

INSERT INTO products VALUES
(1, 'Laptop', 50000),
(2, 'Phone', 20000),
(3, 'Tablet', 30000),
(4, 'Headphones', 5000);


-- ORDERS TABLE (connects customers + products)
CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    amount INT
);

INSERT INTO orders VALUES
(1, 1, 1, 50000),
(2, 1, 2, 20000),
(3, 2, 2, 20000),
(4, 3, 3, 30000);
-- EMPLOYEES TABLE (for self join + dept join)
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    dept_id INT,
    manager_id INT
);

INSERT INTO employees VALUES
(1, 'Surya', 80000, 10, NULL),
(2, 'Ram', 50000, 20, 1),
(3, 'Arjun', 40000, 10, 1),
(4, 'Kiran', 30000, NULL, 2),
(5, 'Vijay', 60000, 30, NULL);


-- DEPARTMENTS TABLE
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO departments VALUES
(10, 'HR'),
(20, 'IT'),
(30, 'Finance'),
(40, 'Marketing');



-- 1. Get all employees with their department names
SELECT *
FROM employees as e
INNER JOIN departments d
  ON e.dept_id=d.dept_id;

-- 2. Get all employees even if they don't have a department
SELECT id,e.name,dept_name
FROM employees as e
LEFT JOIN departments d
  ON e.dept_id=d.dept_id;
  
-- 3. Get all departments even if no employees are assigned
SELECT DISTINCT d.dept_id,d.dept_name
FROM departments d
LEFT JOIN employees e
   ON d.dept_id=e.dept_id;
   
-- 4. Get employee names and their manager names (SELF JOIN)
SELECT DISTINCT e1.name,e1.manager_id
FROM employees e1
LEFT JOIN employees e2
  ON e1.id=e2.manager_id;