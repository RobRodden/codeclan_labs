-- MVP


-- Q1 How many employee records are lacking both a grade and salary?

SELECT COUNT(id)
FROM employees
WHERE salary IS NULL AND grade IS NULL;


-- Q2 Produce a table with the two following fields (columns):
--	the department
--	the employees full name (first and last name)
-- Order your resulting table alphabetically by department, and then by last name.

SELECT CONCAT(first_name, ' ', last_name) AS employees_full_name, department 
FROM employees
ORDER BY department ASC NULLS LAST, last_name ASC NULLS LAST;


-- Q3 Find the details of the top ten highest paid employees who have a last_name beginning with ‘A’.

SELECT *
FROM employees
WHERE last_name LIKE 'A%'
ORDER BY salary DESC NULLS LAST 
LIMIT 10;


-- Q4 Obtain a count by department of the employees who started work with the corporation in 2003.

SELECT department, COUNT(id) AS number_of_employees_started_2003
FROM employees
WHERE start_date BETWEEN  '2003-01-01' AND '2003-12-31'
GROUP BY department
ORDER BY department ASC;


-- Q5 Obtain a table showing department, fte_hours and the number of employees in each department who work 
-- each fte_hours pattern. Order the table alphabetically by department, and then in ascending order of fte_hours.

SELECT department, fte_hours, COUNT(id) AS number_of_employees_fte_hours
FROM employees
GROUP BY fte_hours, department 
ORDER BY department ASC NULLS LAST,fte_hours ASC NULLS LAST;


-- Q6 Provide a breakdown of the numbers of employees enrolled, not enrolled, and with unknown enrollment status in the
-- corporation pension scheme.

SELECT pension_enrol AS pension_enrolled, COUNT(id) AS number_of_employees
FROM employees
GROUP BY pension_enrol  
ORDER BY COUNT(id) DESC, pension_enrol;

-- alternative shared by other member of lab team

SELECT COUNT(id) AS pension_count, pension_enrol 
FROM employees 
WHERE
	pension_enrol IS TRUE OR 
	pension_enrol IS FALSE OR 
	pension_enrol IS NULL
GROUP BY pension_enrol
ORDER BY pension_enrol;


-- Q7 Obtain the details for the employee with the highest salary in the ‘Accounting’ department who is not enrolled in the pension scheme?

SELECT *
FROM employees 
WHERE department = 'Accounting' AND pension_enrol IS FALSE
ORDER BY salary DESC NULLS LAST 
LIMIT 1;


-- Q8 Get a table of country, number of employees in that country, and the average salary of employees in that country for any countries in
-- which more than 30 employees are based. Order the table by average salary descending.

SELECT country, COUNT(id) AS number_of_employees, ROUND(avg(salary), 2) AS average_salary
FROM employees
GROUP BY country
HAVING COUNT(id) > 30
ORDER BY average_salary DESC;


-- Q9 Return a table containing each employees first_name, last_name, full-time equivalent hours (fte_hours), salary, and a new 
-- column effective_yearly_salary which should contain fte_hours multiplied by salary. Return only rows where effective_yearly_salary is
-- more than 30,000.

SELECT first_name, last_name, fte_hours, salary, fte_hours * salary AS effective_yearly_salary
FROM employees 
WHERE fte_hours * salary > 30000
ORDER BY effective_yearly_salary ASC;


-- Q10 Find the details of all employees in either Data Team 1 or Data Team 2.

SELECT *
FROM employees AS e
INNER JOIN teams AS t ON e.team_id = t.id 
WHERE t."name" = 'Data Team 1' OR t."name" = 'Data Team 2'
ORDER BY last_name;

-- or

SELECT *
FROM employees AS e
INNER JOIN teams as t ON e.team_id = t.id
WHERE t.name LIKE 'Data Team%';


-- Q11 Find the first name and last name of all employees who lack a local_tax_code.

SELECT e.first_name, e.last_name, pd.local_tax_code
FROM employees AS e
RIGHT JOIN pay_details AS pd ON e.id = pd.id 
WHERE pd.local_tax_code IS NULL
ORDER BY last_name;


-- Q12 The expected_profit of an employee is defined as (48 * 35 * charge_cost - salary) * fte_hours,
-- where charge_cost depends upon the team to which the employee belongs. Get a table showing expected_profit for each employee.

SELECT e.id, e.first_name, e.last_name, e.fte_hours, e.salary, t."name", t.charge_cost,
((48 * 35 * CAST(t.charge_cost AS integer) - e.salary) * e.fte_hours) AS expected_profit
FROM employees AS e
LEFT JOIN teams AS t ON e.team_id = t.id
ORDER BY expected_profit ASC;


-- Q13 Find the first_name, last_name and salary of the lowest paid employee in Japan who works the least common full-time
-- equivalent hours across the corporation.

SELECT first_name, last_name, salary 
FROM employees 
WHERE country = 'Japan' AND fte_hours = (
	SELECT fte_hours
	FROM employees
	WHERE country = 'Japan'
	GROUP BY fte_hours
	ORDER BY COUNT(*) ASC, fte_hours ASC
	LIMIT 1
	)
ORDER BY salary ASC NULLS LAST 
LIMIT 1;


-- Q14 Obtain a table showing any departments in which there are two or more employees lacking a stored first name. Order the
-- table in descending order of the number of employees lacking a first name, and then in alphabetical order by department.

SELECT department, COUNT(id) AS number_of_employees_no_first)
FROM employees
WHERE first_name IS NULL
GROUP BY department
HAVING COUNT (id) >= 2
ORDER BY COUNT(id) DESC NULLS LAST, department ASC NULLS LAST;


-- Q15 Return a table of those employee first_names shared by more than one employee, together with a count of the number of
-- times each first_name occurs. Omit employees without a stored first_name from the table. Order the table descending by count,
-- and then alphabetically by first_name.

SELECT first_name, count(first_name) AS number_of_times_appearing
FROM employees
WHERE first_name IS NOT NULL
GROUP BY first_name
HAVING COUNT(first_name) > 1
ORDER BY COUNT(first_name) DESC, first_name ASC;


-- Q16 Find the proportion of employees in each department who are grade 1.

SELECT department, SUM(CAST(grade = '1' AS INT)) / CAST(COUNT(id) AS REAL) AS proportion_grade1
FROM employees
WHERE grade = 1
GROUP BY department;


-- 2 Extension Questions


-- Q1 Get a list of the id, first_name, last_name, department, salary and fte_hours of employees in the largest department. Add two
-- extra columns showing the ratio of each employee’s salary to that department’s average salary, and each employee’s fte_hours to
-- that department’s average fte_hours.

SELECT id, first_name, last_name, department, salary, fte_hours,
salary / (AVG(salary) OVER () AS salary_over_dept_avg, fte_hours / AVG(fte_hours) OVER () AS fte_hours_over_dept_avg
FROM employees
WHERE department = (
	SELECT department
	FROM employees_full_name
	GROUP BY department
	ORDER BY COUNT(id) DESC NULLS LAST
	LIMIT 1
	);

-- However (as I've learned) this doesn't deal with ties; the following does though:

SELECT id, first_name, last_name, department, salary, fte_hours,
salary / (AVG(salary) OVER () AS salary_over_dept_avg, fte_hours / AVG(fte_hours) OVER () AS fte_hours_over_dept_avg
FROM employees
WHERE department IN (
	SELECT department
	FROM employees_full_name
	GROUP BY department
	HAVING COUNT(id) = (
		SELECT MAX(count)
		FROM (
			SELECT department, count(id)
			FROM employees
			GROUP BY department
		) AS temp
	)
);


-- Q2 Have a look again at your table for MVP question 6. It will likely contain a blank cell for the row relating to
-- employees with ‘unknown’ pension enrollment status. This is ambiguous: it would be better if this cell contained
-- ‘unknown’ or something similar. Can you find a way to do this, perhaps using a combination of COALESCE() and CAST(), or
-- a CASE statement?

SELECT
	CASE
		WHEN pension_enrol IS NULL THEN 'Unknown'
		WHEN pension_enrol IS TRUE THEN 'Yes'
		ELSE 'No'
	END AS pension_enrolled, COUNT(id) AS number_of_employees
FROM employees
GROUP BY pension_enrol;


-- Q3 Find the first name, last name, email address and start date of all the employees who are members of the
-- ‘Equality and Diversity’ committee. Order the member employees by their length of service in the company, longest first.

SELECT e.first_name, e.last_name, e.email, e.start_date
FROM employees e
INNER JOIN employees_committees AS e
ON e.id = ec.employee_ie
INNER JOIN committees c
ON ec.committee_id = c.id
WHERE c.name = 'Equality and Diversity'
ORDER BY e.start_date ASC NULLS LAST;


-- Q4 Use a CASE() operator to group employees who are members of committees into salary_class of 'low' (salary < 40000) or
-- 'high' (salary >= 40000). A NULL salary should lead to 'none' in salary_class. Count the number of committee members in
-- each salary_class.

SELECT
	CASE
		WHEN e.salary < 40000 THEN 'Low'
		WHEN e.salary >= 40000 THEN 'High'
		ELSE 'None'
	END AS salary_class, COUNT(DISTINCT(id))  AS number_of_committee_members
FROM employees AS e
INNER JOIN employees_committees AS ec
ON e.id = ec.employee_id
INNER JOIN committees AS c
ON ec.committee_id = c.id
GROUP BY salary_class;