SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';

-- Retirement eligibility
SELECT first_name, LAST_NAME
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;

DROP TABLE retirement_info;

-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;

-- Joining departments and dept_manager tables
SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

SELECT * FROM dept_emp

-- Joining retirement_info and dept_emp tables
SELECT ri.emp_no,
	ri.first_name,
ri.last_name,
	ed.to_date
FROM retirement_info as ri
LEFT JOIN employees_department as ed
ON ri.emp_no = ed.emp_no;


SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
ed.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN employees_department as ed
ON ri.emp_no = ed.emp_no
WHERE ed.to_date = ('9999-01-01');

-- Employee count by department number
SELECT COUNT(ce.emp_no), ed.dept_no
INTO dept_count
FROM current_emp as ce
LEFT JOIN employees_department as ed
ON ce.emp_no = ed.emp_no
GROUP BY ed.dept_no

SELECT * FROM salaries
ORDER BY to_date DESC;

SELECT emp_no,
	first_name,
last_name,
	gender
--INTO emp_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
ORDER BY ed.dept_no;

SELECT e.emp_no,
	e.first_name,
e.last_name,
	e.gender,
	s.salary,
	ed.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN employees_department as ed
ON (e.emp_no = ed.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	 AND (ed.to_date = '9999-01-01');

-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
--INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);

SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name	
--INTO dept_info
FROM current_emp as ce
INNER JOIN employees_department AS ed
ON (ce.emp_no = ed.emp_no)
INNER JOIN departments AS d
ON (ed.dept_no = d.dept_no);

-- Skill drill 7.3.6
select ri.emp_no,
ri.first_name,
ri.last_name,
ed.dept_no,
d.dept_name
from retirement_info as ri
inner join employees_department as ed
on(ed.emp_no = ri.emp_no)
inner join departments as d
on (ed.dept_no = d.dept_no)
where(dept_name = 'Sales');

-- skill drill 7.3.6 (2)
select ri.emp_no,
ri.first_name,
ri.last_name,
ed.dept_no,
d.dept_name
from retirement_info as ri
inner join employees_department as ed
on(ed.emp_no = ri.emp_no)
inner join departments as d
on (ed.dept_no = d.dept_no)
where dept_name in ('Sales', 'Developement');

select * from departments