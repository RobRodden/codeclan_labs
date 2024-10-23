Recap Lab


Use this lab to recap (almost) everything you've learnt so far on the course.

The data for this lab comes from Our World in Data and contains the average daily per capita supply of calories from a range of food commodities by country across many years.
<br>

You can read more about the data here in the ‘Sources’ tab.
<br>
<br>
<br>
Question 1.<br>
Read in the data containing dietary compositions and familiarise yourself with it.



Question 2<br>
Change the data to long format with food categories going to a column called kcal_source and the calorie values going to a column called avg_daily_kcals.
Save into variable diet_comp_clean



Question 3<br>
Clean kcal_source categories by removing any unnecessary information. Then clean all column names, and rename the column ‘entity’ to ‘country’. Overwrite diet_comp_clean with your results.
<blockquote>[Hint: you’ll probably have to use some regex to clean kcal_source categories]
</blockquote><br>



Question 4<br>
Check how many missing values there are in each column



Question 5<br>
Let’s investigate the missing values in column code further. First, check which countries are missing a code. Save these as a character vector, and use this vector to check whether you can find their code anywhere in the dataset, i.e. is the code missing for every observation for these countries.



Question 6<br>
Ok, we have no available country codes for Cabo Verde and the US in this dataset. Is there anything in the data source about what these should be? No… Ok, better find something online then. Google tells us there’s something called ISO Alpha-3 codes which look pretty promising. Wait, what’s that in your data folder? Read it in! Then find the missing codes!



Question 7<br>
Using a suitable recoding function, fill in the lost (but now found) country codes. Overwrite diet_comp_clean again. Finally, check that there are now no missing values in the code column.



Question 8<br>
<blockquote>
Note: Do NOT overwrite diet_comp_clean with the result of this question.
</blockquote>

Join the two datasets so only countries with matches in both are retained. Create a new logical column that is TRUE if the first two letters of code is the same as alpha_2_code.



Question 9<br>
That’s enough of country codes! Let’s look at the actual diets of some countries. Using diet_comp_clean, which is hopefully untarnished by the monstrosity that was Question 8, create a new variable called uk_diet which only contains data from the UK and with all NAs from avg_daily_kcals dropped.



Question 10<br>
Using uk_diet, create a new column that contains the difference in total calories between a year and the year before. Then find the year where there was the biggest positive difference and the biggest negative difference.



Question 11<br>
Back to diet_comp_clean again. For every year between 1990 and 2000, find which country got the most average daily calories from alcoholic beverages, i.e. you want to end up with one country per year.



Question 12<br>
Now write a function which finds the top calorie source for a user-specified vector of both countries and years. Then use your function to find the top calorie source for the UK and Zimbabwe in 1965, 1975, 1985, 1995 and 2005. Try out your function a few more times for countries/years that you find interesting! Also consider whether there are any limitations of your function.



Question 13<br>
Use your function to find the top calorie source in 1970 for all countries starting with B.



Question 14<br>
If you have made it this far, well done! If you are still itching to do some more data analysis/coding, you can explore the dataset yourself and try to discover something interesting or just practice anything you still feel unsure about!