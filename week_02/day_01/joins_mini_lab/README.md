Joining Mini-Lab
Duration: 30 minutes

1 MVP <br>
<br>
1.1 Data Investigation

Question 1.<br>
Read the files “actors.csv”, “movies.csv” and “roles.csv” into R. You might get warnings here - don’t worry the data is okay for what we are trying to do.



Question 2.<br>
What are the primary keys and the foreign keys for each data frame?
What kind of relationship (one-to-one, one-to-many, many-to-many) is there between
actors and roles
movies and roles
actors and movies


1.2 Little Mermaid, The
Question 1.
From the movies table, find the id of the film The Little Mermaid. (In the data as “Little Mermaid, The”).



Question 2.
Filter the roles data frame, so we just have roles from the Little Mermaid (hint: use the ID you found in the last question). Save the result as little_mermaid_roles.



Question 3.
Carry out a left join on this new data frame and the actors data frame, to find the actors which appeared in The Little Mermaid.



Question 4.
Do the last join, but with an inner join instead. Is the data different? Why is that?



1.3 Actors
Question 1.
For all actors who have appeared in at least two films. Call this data frame actors_more_than_once.



Question 2.
Left join actors_more_than_once to roles, so we can see all the actors roles those actors played in.



Question 3.
Left join the result from above to movies, so we can see details of each movie for these roles

Question 4.
For each actor, find the average rating of the films they appeared. Find the five actors with the highest average rank of films they appeared in.

1.4 The Busiest Actor
Question 1.
Find the actor who has appeared in most films. List the films they appeared in, the year the film was released and their role in the film.