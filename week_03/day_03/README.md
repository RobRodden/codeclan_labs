# Final SQL Lab and Homework - Solutions
Duration - 3 hours

In these practice questions you’ll return again to the omni_pool database, so re-establish your connection in DBeaver if it has lapsed.

<blockquote>
Submission

When answering these questions, please save your SQL script in DBeaver, copy it over to your homework repo and then add, commit and push that for submission tonight. Please add section and question numbers as SQL comments, like so:

--MVP<br>
--Q1
</blockquote>

## 1 MVP Questions


**Question 1.**<br>
How many employee records are lacking both a grade and salary?


**Question 2.**<br>
Produce a table with the two following fields (columns):

the department
the employees full name (first and last name)
Order your resulting table alphabetically by department, and then by last name.


**Question 3.**<br>
Find the details of the top ten highest paid employees who have a last_name beginning with ‘A’.


**Question 4.**<br>
Obtain a count by department of the employees who started work with the corporation in 2003.


**Question 5.**<br>
Obtain a table showing department, fte_hours and the number of employees in each department who work each fte_hours pattern. Order the table alphabetically by department, and then in ascending order of fte_hours.
<blockquote><details>
<summary>Reveal Hint</summary>
You need to GROUP BY two columns here.
</blockquote></details>

**Question 6.**<br>
Provide a breakdown of the numbers of employees enrolled, not enrolled, and with unknown enrollment status in the corporation pension scheme.


**Question 7.**<br>
Obtain the details for the employee with the highest salary in the ‘Accounting’ department who is not enrolled in the pension scheme?


**Question 8.**<br>
Get a table of country, number of employees in that country, and the average salary of employees in that country for any countries in which more than 30 employees are based. Order the table by average salary descending.
<blockquote><details>
<summary>Reveal Hint</summary>
A HAVING clause is needed to filter using an aggregate function.
</blockquote></details>


**Question 9.**<br>
Return a table containing each employees first_name, last_name, full-time equivalent hours (fte_hours), salary, and a new column effective_yearly_salary which should contain fte_hours multiplied by salary. Return only rows where effective_yearly_salary is more than 30,000.


**Question 10.**<br>
Find the details of all employees in either Data Team 1 or Data Team 2.
<blockquote><details>
<summary>Reveal Hint</summary>
name is a field in table `teams.
</blockquote></details>


**Question 11.**<br>
Find the first name and last name of all employees who lack a local_tax_code.
<blockquote><details>
<summary>Reveal Hint</summary>
local_tax_code is a field in table pay_details, and first_name and last_name are fields in table employees.
</blockquote></details>


**Question 12.**<br>
The expected_profit of an employee is defined as (48 * 35 * charge_cost - salary) * fte_hours, where charge_cost depends upon the team to which the employee belongs. Get a table showing expected_profit for each employee.
<blockquote><details>
<summary>Reveal Hint</summary>
charge_cost is in teams, while salary and fte_hours are in employees, so a join will be necessary.

You will need to change the type of charge_cost in order to perform the calculation.
</blockquote></details>


**Question 13. [Tough]**<br>
Find the first_name, last_name and salary of the lowest paid employee in Japan who works the least common full-time equivalent hours across the corporation.
<blockquote><details>
<summary>Reveal Hint</summary>
You will need to use a subquery to calculate the mode.
</blockquote></details>


**Question 14.**<br>
Obtain a table showing any departments in which there are two or more employees lacking a stored first name. Order the table in descending order of the number of employees lacking a first name, and then in alphabetical order by department.


**Question 15. [Bit tougher]**<br>
Return a table of those employee first_names shared by more than one employee, together with a count of the number of times each first_name occurs. Omit employees without a stored first_name from the table. Order the table descending by count, and then alphabetically by first_name.


**Question 16. [Tough]**<br>
Find the proportion of employees in each department who are grade 1.
<blockquote><details>
<summary>Reveal Hint</summary>
Think of the desired proportion for a given department as the number of employees in that department who are grade 1, divided by the total number of employees in that department.

You can write an expression in a SELECT statement, e.g. grade = 1. This would result in BOOLEAN values.

If you could convert BOOLEAN to INTEGER 1 and 0, you could sum them. The CAST() function lets you convert data types.

In SQL, an INTEGER divided by an INTEGER yields an INTEGER. To get a REAL value, you need to convert the top, bottom or both sides of the division to REAL.
</blockquote></details>


## 2 Extension Questions

Some of these problems may need you to do some online research on SQL statements we haven’t seen in the lessons up until now… Don’t worry, we’ll give you pointers, and it’s good practice looking up help and answers online, data analysts and programmers do this all the time! If you get stuck, it might also help to sketch out a rough version of the table you want on paper (the column headings and first few rows are usually enough).

Note that some of these questions may be best answered using CTEs or window functions: have a look at the optional lesson included in today’s notes!

**Question 1. [Tough]**<br>
Get a list of the id, first_name, last_name, department, salary and fte_hours of employees in the largest department. Add two extra columns showing the ratio of each employee’s salary to that department’s average salary, and each employee’s fte_hours to that department’s average fte_hours.

[Extension - really tough! - how could you generalise your query to be able to handle the fact that two or more departments may be tied in their counts of employees. In that case, we probably don’t want to arbitrarily return details for employees in just one of these departments].
<blockquote><details>
<summary>Reveal Hint</summary>
Writing a CTE to calculate the name, average salary and average fte_hours of the largest department is an efficient way to do this.

Another solution might involve combining a subquery with window functions
</blockquote></details>


**Question 2.**<br>
Have a look again at your table for MVP question 6. It will likely contain a blank cell for the row relating to employees with ‘unknown’ pension enrollment status. This is ambiguous: it would be better if this cell contained ‘unknown’ or something similar. Can you find a way to do this, perhaps using a combination of COALESCE() and CAST(), or a CASE statement?
<blockquote><details>
<summary>Reveal Hint</summary>
COALESCE() lets you substitute a chosen value for NULLs in a column, e.g. COALESCE(text_column, 'unknown') would substitute 'unknown' for every NULL in text_column. The substituted value has to match the data type of the column otherwise PostgreSQL will return an error.

CAST() let’s you change the data type of a column, e.g. CAST(boolean_column AS VARCHAR) will turn TRUE values in boolean_column into text 'true', FALSE to text 'false', and will leave NULLs as NULL
</details></blockquote>


**Question 3.**<br>
Find the first name, last name, email address and start date of all the employees who are members of the ‘Equality and Diversity’ committee. Order the member employees by their length of service in the company, longest first.


**Question 4. [Tough!]**<br>
Use a CASE() operator to group employees who are members of committees into salary_class of 'low' (salary < 40000) or 'high' (salary >= 40000). A NULL salary should lead to 'none' in salary_class. Count the number of committee members in each salary_class.
<blockquote><details>
<summary>Reveal Hint</summary>
You likely want to count DISTINCT() employees in each salary_class

You will need to GROUP BY salary_class
</details></blockquote>
