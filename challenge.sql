-- part 1
DROP TABLE titles

CREATE TABLE titles (
  emp_no INT NOT NULL,
  title VARCHAR(50) NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL
);

select * from current_emp

SELECT ce.emp_no,
ce.first_name,
ce.last_name,
tl.title,
s.from_date,
s.salary
INTO emp_title_salary
FROM current_emp as ce
INNER JOIN titles AS tl
ON (tl.emp_no = ce.emp_no )
inner join salaries AS s
ON (s.emp_no = ce.emp_no);

select * from emp_title_salary

select ets.from_date, ets.title, Count(ets.emp_no)
into title_count
from emp_title_salary as ets
group by ets.title, ets.from_date
order by from_date

select * from title_count

select ets.emp_no,
ets.first_name,
etsw.last_Name,
ets.title,
ets.from_date
s.to_date
frp, emp_title_salary as ets, 