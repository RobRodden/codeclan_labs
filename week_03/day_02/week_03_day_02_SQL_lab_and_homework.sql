-- MVP

-- Q1
-- a) Find the first name, last name and team name of employees who are members of teams.
SELECT e.first_name, e.last_name, t.name AS team_name
FROM employees AS e
INNER JOIN teams AS t ON e.team_id = t.id; 

-- b) Find the first name, last name and team name of employees who are members of teams and
-- are enrolled in the pension scheme.
SELECT e.first_name, e.last_name, t.name AS team_name 
FROM employees AS e
INNER JOIN teams AS t ON e.team_id = t.id
WHERE e.pension_enrol = TRUE;

-- c) Find the first name, last name and team name of employees who are members of teams,
-- where their team has a charge cost greater than 80.
SELECT e.first_name, e.last_name, t.name AS team_name
FROM employees AS e
INNER JOIN teams AS t ON e.team_id = t.id
WHERE CAST(t.charge_cost AS INTEGER) > 80
ORDER BY t.charge_cost, t.name, e.last_name);

-- Q2
-- a) Get a table of all employees details, together with their local_account_no and local_sort_code,
-- if they have them.
SELECT e.*, pd.local_account_no, pd.local_sort_code
FROM employees  AS e
LEFT JOIN pay_details AS pd ON E.pay_detail_id = pd.id;

-- b) Amend your query above to also return the name of the team that each employee belongs to.
SELECT e.*, t.name AS team_name, pd.local_account_no, pd.local_sort_code 
FROM employees AS e
LEFT JOIN pay_details AS pd ON e.pay_detail_id = pd.id
LEFT JOIN teams AS t ON e.team_id = t.id;

-- Q3
-- a) Make a table, which has each employee id along with the team that employee belongs to.
SELECT e.id AS employee_id, t.name AS team_name
FROM employees AS e
LEFT JOIN teams AS t ON e.team_id = T.id;

-- b) Breakdown the number of employees in each of the teams.
SELECT t.name AS team_name, COUNT(e.id) AS number_of_employees
FROM employees AS e
LEFT JOIN teams AS t ON e.team_id = t.id 
GROUP BY t.name;

-- c) Order the table above by so that the teams with the least employees come first.
SELECT t.name AS team_name, COUNT(e.id) AS number_of_employees
FROM employees AS e
LEFT JOIN teams AS t ON e.team_id = t.id 
GROUP BY t.name
ORDER BY number_of_employees;

-- Q4
-- a) Create a table with the team id, team name and the count of the number of employees in
-- each team.
SELECT t.id AS team_di, t.name AS team_name, COUNT(e.id) AS number_of_employees,
FROM employees AS e
INNER JOIN teams AS t ON e.team_id = t.id 
GROUP BY t.id
ORDER BY t.name, t.id, number_of_employees;

-- b) The total_day_charge of a team is defined as the charge_cost of the team multiplied by
-- the number of employees in the team. Calculate the total_day_charge for each team.
SELECT t.name AS team_name, CAST(t.charge_cost AS INTEGER) * COUNT(e.id) AS total_day_charge
FROM employees AS e
INNER JOIN teams AS t ON e.team_id = t.id 
GROUP BY t.name, t.id;

-- c) How would you amend your query from above to show only those teams with a 
-- total_day_charge greater than 5000?
SELECT t.name AS team_name, CAST(t.charge_cost AS INTEGER) * COUNT(e.id) AS total_day_charge,
FROM employees AS e
INNER JOIN teams AS t ON e.team_id  = t.id
GROUP BY t.id 
HAVING CAST(t.charge_cost AS INTEGER) * COUNT(e.id) > 5000;

-- Extension

-- Q5 How many of the employees serve on one or more committees?
SELECT COUNT(DISTINCT (employee_id)) AS number_of_employees_on_committees
FROM employees_committees;

-- Q6 How many of the employees do not serve on a committee?
SELECT COUNT(*) AS number_not_on_committees
FROM  employees e
LEFT JOIN employee_committees ec ON e.id = ec.employee_id
WHERE ec.employee_id IS NULL;