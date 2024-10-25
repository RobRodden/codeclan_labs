# Lab - strings & regex
## Regular Expression Practice

It’s time to look at regular expressions in the context of a much bigger block of text. Pull down the class notes and you’ll find an R notebook with a long passage in it – it’s the first chapter of 1984. In that notebook, use regular expressions to answer/do the following:

### 1 MVP
#### Question 1.
Are the Thought Police ever mentioned?



#### Question 2.
Count how often Big Brother is mentioned



#### Question 3.
The chapter is written from the point of view of the protagonist, Winston. Does he ever mention the other main character (Julia) by name?



#### Question 4.
Winston writes the date in a specific format: month nth, year eg. August 5th, 2019. Write a regular expression to match dates in that format and find the date written in his diary.



#### Question 5.
Winston wants some anonymity, redact his name somehow.



#### Question 6.
Stocks of Victory Gin have run out and the people of Oceania will have to drink vodka instead. Replace “gin” with “vodka”, matching case wherever possible. There’s still loads of Victory Coffee, though, so don’t replace that.



#### Question 7.
Big Brother is rebranding and has decided that the various ministries will now be known as departments. The old departments are now called sections. The Newspeak titles will use “Dep” instead of “Mini”.

### 1.1 Hints
Remember that you can use different functions to test your regular expressions before using them to change things.
If you make a change and want to undo it, you can always re-run the first code block to restore the original text
The order in which you do things will be important for some tasks!


### 2 Extension
You may have noticed some repetition in these tasks. Try to find a programmatic way of making changes using functions.