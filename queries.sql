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

