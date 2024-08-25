---confirm rows count---
SELECT COUNT(*) FROM employees;

--List the employee number, last name, first name, sex, and salary of each employee.--

SELECT 
	e.emp_no AS employee_number,
	e.last_name,
	e.first_name, 
	e.sex,
	s.salary
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no
ORDER BY first_name;


