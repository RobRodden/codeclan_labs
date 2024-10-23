Please note you should use apps like MySQLWorkbench or Visual Studio Code to view my answers to the following questions.

SQL Day 2 Lab and Homework
Duration - 120 minutes

In these practice questions you’ll return again to the omni_pool database, so re-establish your connection in DBeaver if it has lapsed.


Submission

When answering these questions, please save your SQL script in DBeaver, copy it over to your homework repo and then add, commit and push that for submission tonight. Please add section and question numbers as SQL comments, like so:

--MVP <br>
--Q1


1 MVP


Question 1. <br>
(a). Find the first name, last name and team name of employees who are members of teams.

 Hint
We only want employees who are also in the teams table. So which type of join should we use?


(b). Find the first name, last name and team name of employees who are members of teams and are enrolled in the pension scheme.


(c). Find the first name, last name and team name of employees who are members of teams, where their team has a charge cost greater than 80.

 Hint
charge_cost may be the wrong type to compare with value 80. Can you find a way to convert it without changing the database?

<br>
Question 2.<br>
(a). Get a table of all employees details, together with their local_account_no and local_sort_code, if they have them.

 Hints
local_account_no and local_sort_code are fields in pay_details, and employee details are held in employees, so this query requires a JOIN.

What sort of JOIN is needed if we want details of all employees, even if they don’t have stored local_account_no and local_sort_code?


(b). Amend your query above to also return the name of the team that each employee belongs to.

 Hint
The name of the team is in the teams table, so we will need to do another join.

<br>
Question 3.<br>
(a). Make a table, which has each employee id along with the team that employee belongs to.



(b). Breakdown the number of employees in each of the teams.

 Hint
You will need to add a group by to the table you created above.


(c). Order the table above by so that the teams with the least employees come first.

<br>
Question 4.<br>
(a). Create a table with the team id, team name and the count of the number of employees in each team.



(b). The total_day_charge of a team is defined as the charge_cost of the team multiplied by the number of employees in the team. Calculate the total_day_charge for each team.

 Hint
If you GROUP BY teams.id, because it’s the primary key, you can SELECT any other column of teams that you want (this is an exception to the rule that normally you can only SELECT a column that you GROUP BY).


(c). How would you amend your query from above to show only those teams with a total_day_charge greater than 5000?

<br>
2 Extension
<br>
<br>
Question 5.<br>
How many of the employees serve on one or more committees?


 Hints
All of the details of membership of committees is held in a single table: employees_committees, so this doesn’t require a join.

Some employees may serve in multiple committees. Can you find the number of distinct employees who serve? [Extra hint - do some research on the DISTINCT() function].


Question 6.
How many of the employees do not serve on a committee?


 Hints
This requires joining over only two tables

Could you use a join and find rows without a match in the join?