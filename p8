PRACTICAL 8 — Subqueries: Department-Based Employee Analysis
```sql
-- Create Tables
CREATE TABLE Departments (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50) NOT NULL
);
CREATE TABLE Employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50) NOT NULL,
dept_id INT,
salary DECIMAL(10,2),
FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);
-- Insert Records
INSERT INTO Departments VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing');
INSERT INTO Employees VALUES
(1, 'Amit Shah', 1, 62000),
(2, 'Priya Patil', 2, 45000),
(3, 'Ravi Kumar', 1, 70000),
(4, 'Sneha Joshi', 3, 50000),
(5, 'Neha Gupta', 1, 58000),
(6, 'Raj Mehta', 2, 55000),
(7, 'Kiran Das', 4, 48000),
(8, 'Pooja Rao', 3, 52000);
-- 1. Employees in IT department
SELECT emp_name, salary
FROM Employees
WHERE dept_id = (SELECT dept_id FROM Departments WHERE dept_name = 'IT');
-- 2. Employees earning more than average salary
SELECT emp_name, salary
FROM Employees
WHERE salary > (SELECT AVG(salary) FROM Employees);
-- 3. Employees earning more than the highest-paid employee in HR
SELECT emp_name, salary
FROM Employees
WHERE salary > (
SELECT MAX(salary)
FROM Employees
WHERE dept_id = (SELECT dept_id FROM Departments WHERE dept_name = 'HR')
);
