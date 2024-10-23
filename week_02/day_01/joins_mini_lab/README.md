Joining Mini-Lab
Duration: 30 minutes

1 MVP <br>
<br>
1.1 Data Investigation

Question 1.<br>
Read the files “actors.csv”, “movies.csv” and “roles.csv” into R.<br>
You might get warnings here - don’t worry the data is okay for what we are trying to do.



Question 2.<br>
What are the primary keys and the foreign keys for each data frame?<br>
What kind of relationship (one-to-one, one-to-many, many-to-many) is there between
<blockquote>actors and roles<br>
movies and roles<br>
actors and movies<br>
</blockquote>

<br>
1.2 Little Mermaid, The<br>
<br>
Question 1.<br>
From the movies table, find the id of the film The Little Mermaid.
<blockquote>(In the data as “Little Mermaid, The”).
</blockquote>
<br>
Question 2.<br>
Filter the roles data frame, so we just have roles from the Little Mermaid
<blockquote>(hint: use the ID you found in the last question).</blockquote>
Save the result as little_mermaid_roles.
<br>
<br>
Question 3.<br>
Carry out a left join on this new data frame and the actors data frame, to find the actors which appeared in The Little Mermaid.
<br>
<br>
Question 4.<br>
Do the last join, but with an inner join instead.<br>
Is the data different?<br>
Why is that?
<br>
<br>
<br>
1.3 Actors<br>
<br>
Question 1.<br>
For all actors who have appeared in at least two films.<br>
Call this data frame actors_more_than_once.
<br>
<br>
Question 2.<br>
Left join actors_more_than_once to roles, so we can see all the actors roles those actors played in.
<br>
<br>
Question 3.<br>
Left join the result from above to movies, so we can see details of each movie for these roles
<br>
<br>
Question 4.<br>
For each actor, find the average rating of the films they appeared.<br>
Find the five actors with the highest average rank of films they appeared in.
<br>
<br>
<br>
1.4 The Busiest Actor<br>
<br>
Question 1.<br>
Find the actor who has appeared in most films.<br>
List the films they appeared in, the year the film was released and their role in the film.