# Content for Module 9 Challenge in the University of Minnesota Data Analytics Bootcamp

## SQL database analysis using pgadmin4 / postgreSQL16

### ERD diagram included as ERD.png

![erd](https://github.com/schr0841/sql-challenge/blob/main/ERD.png)


### schema for tables included as schema.sql

```sql
DROP TABLE IF EXISTS titles CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;

CREATE TABLE titles(
title_id VARCHAR(30) PRIMARY KEY,
title VARCHAR(30) NOT NULL
)


CREATE TABLE employees(
emp_no INTEGER NOT NULL,
emp_title_id VARCHAR(30) NOT NULL,
birth_date DATE NOT NULL,
first_name VARCHAR(255) NOT NULL,
last_name VARCHAR(255) NOT NULL,
sex VARCHAR(5) NOT NULL,
hire_date DATE NOT NULL,
PRIMARY KEY (emp_no),
FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
)


CREATE TABLE departments(
dept_no VARCHAR(30) PRIMARY KEY,
dept_name VARCHAR(255) NOT NULL
)



CREATE TABLE dept_emp(
emp_no INTEGER NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
dept_no VARCHAR(30) NOT NULL,
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
PRIMARY KEY (emp_no, dept_no)
)

select * from dept_emp limit 10;

CREATE TABLE dept_manager(
dept_no VARCHAR(30) NOT NULL,
emp_no INTEGER PRIMARY KEY,
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
)

CREATE TABLE salaries(
emp_no INTEGER PRIMARY KEY,
salary INTEGER NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
)
```


### queries for results included as queries.sql

```sql
--Analysis
-- Q1 List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s
ON e.emp_no=s.emp_no;

--Q2 List the first name, last name, and hire date for the employees who were hired in 1986.
--date_part('year', hire_date)
SELECT first_name, last_name, hire_date
FROM employees 
WHERE date_part('year', hire_date)=1986;


--Q3 List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.dept_no, dm.emp_no, d.dept_name, e.last_name, e.first_name
FROM dept_manager dm
JOIN employees e
ON e.emp_no=dm.emp_no
JOIN departments d
ON d.dept_no=dm.dept_no;

--Q4 List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT de.emp_no, de.dept_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN employees e
ON de.emp_no=e.emp_no
JOIN departments d
ON de.dept_no=d.dept_no;

--Q5 List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex 
FROM employees 
WHERE first_name='Hercules' AND last_name LIKE 'B%';

--Q6 List each employee in the Sales department, including their employee number, last name, and first name.
SELECT de.emp_no, e.last_name, e.first_name
FROM dept_emp de
JOIN employees e
ON de.emp_no=e.emp_no
JOIN departments d
ON de.dept_no=d.dept_no
WHERE d.dept_name='Sales';

--Q7 List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN employees e
ON de.emp_no=e.emp_no
JOIN departments d
ON de.dept_no=d.dept_no
WHERE d.dept_name='Sales' OR d.dept_name='Development';

--Q8 List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT COUNT(last_name), last_name FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
```


## Image files for each analysis question output included as Q(#)Analysis.png

### Q1 List the employee number, last name, first name, sex, and salary of each employee.
![q1](https://github.com/schr0841/sql-challenge/blob/main/Q1Analysis.png)

### Q2 List the first name, last name, and hire date for the employees who were hired in 1986.
![q2](https://github.com/schr0841/sql-challenge/blob/main/Q2Analysis.png)

### Q3 List the manager of each department along with their department number, department name, employee number, last name, and first name.
![q3](https://github.com/schr0841/sql-challenge/blob/main/Q3Analysis.png)

### Q4 List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
![q4](https://github.com/schr0841/sql-challenge/blob/main/Q4Analysis.png)

### Q5 List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
![q5](https://github.com/schr0841/sql-challenge/blob/main/Q5Analysis.png)

### Q6 List each employee in the Sales department, including their employee number, last name, and first name.
![q6](https://github.com/schr0841/sql-challenge/blob/main/Q6Analysis.png)

### Q7 List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
![q7](https://github.com/schr0841/sql-challenge/blob/main/Q7Analysis.png)

### Q8 List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
![q8](https://github.com/schr0841/sql-challenge/blob/main/Q8Analysis.png)
