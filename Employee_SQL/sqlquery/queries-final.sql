---confirm rows count---
SELECT COUNT(*) FROM employees;
SELECT COUNT(*) FROM departments;
SELECT COUNT(*) FROM dept_emp;
SELECT COUNT(*) FROM dept_manager;
SELECT COUNT(*) FROM salaries;
SELECT COUNT(*) FROM titles;


--List the employee number, last name, first name, sex, and salary of each employee.--

SELECT  
	e.emp_no AS employee_number,
	e.last_name,
	e.first_name, 
	e.sex,
	s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
ORDER BY first_name;


--List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT 
	e.first_name, 
	e.last_name,
	e.hire_date
FROM employees e
	WHERE e.hire_date BETWEEN '1/1/1986' AND '12/31/1986'
	ORDER BY e.hire_date;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT 
	dem.dept_no, 
	d.dept_name, 
	dem.emp_no, 
	e.last_name, 
	e.first_name
FROM dept_manager dem
JOIN departments d ON dem.dept_no = d.dept_no
JOIN employees e ON dem.emp_no = e.emp_no;


--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT  
    dem.dept_no AS department_number,
    e.emp_no AS employee_number,
	e.last_name,
    e.first_name,
    d.dept_name
FROM employees e
JOIN dept_emp dem ON e.emp_no = dem.emp_no
JOIN departments d ON dem.dept_no = d.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT
	e.first_name,
	e.last_name,
	e.sex
FROM employees e
where e.first_name = 'Hercules' AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT * 
	FROM departments d;

-- The department number of Sales department is d007
SELECT 
	e.emp_no, 
	e.last_name, 
	e.first_name, 
	d.dept_name
FROM employees e
JOIN dept_emp dem ON e.emp_no = dem.emp_no
JOIN departments d ON dem.dept_no = d.dept_no
WHERE d.dept_no = 'd007';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT 
	e.emp_no, 
	e.last_name, 
	e.first_name, 
	d.dept_name
FROM employees e
JOIN dept_emp dem ON e.emp_no = dem.emp_no
JOIN departments d ON dem.dept_no = d.dept_no
WHERE d.dept_no = 'd005' or d.dept_no = 'd007';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, 
	COUNT(last_name) AS "Frequency count"
FROM employees
GROUP BY last_name
ORDER BY "Frequency count" DESC;
