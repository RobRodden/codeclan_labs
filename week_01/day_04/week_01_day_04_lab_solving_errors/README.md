Solving Errors Lab
In this lab you will be presented with several code chunks that produce errors. Your task is to try and solve the errors and get the code chunk not only running without an error, but doing what it should be doing. For each chunk you will get a short description of what it is meant to be doing.

Remember to create a new notebook and copy over the contents of the .Rmd file and solve them in there, rather than changing the classnotes! You’ll see the error messages when you try to run the chunks in your notebook - keep fixing them until you don’t get an error (and it’s accomplishing the goal).

Use what you have learned in the errors lesson to solve these errors. Remember: problem solving and trying to interpret the error messages should be your first approach. Where this does not cut it there are several options: Google, StackOverflow, rubber ducking, specific function help files, checking data types and dimensions.

Note: You may have to fix more than one thing per code chunk to escape the errors!

# MVP

## Error 1.
Create some_letters which is a character vector containing the following letters: “E”, “R”, “R”, “O” and “R”.

some_letters <- ("E", "R", "R", "O", "R)

### Error: <text>:1:21: unexpected ','
1: some_letters <- ("E",
                       ^


## Error 2.
Create message which is a vector containing the following strings: “does”, “this”, “work” and “?”, then convert the vector to uppercase using toupper.

message <- c("does", "this" "work", "?")

toupper(messege)

Error: <text>:1:29: unexpected string constant
1: message <- c("does", "this" "work"
                                 ^


Error 3.
Select columns mpg, cyl, and disp from mtcars and keep only rows where mpg is less than 20..

mtcars %>% 
  select(mpg, cyl, disp) %>>%
  filter(mpg < 20)

Error in mtcars %>% select(mpg, cyl, disp) %>>% filter(mpg < 20): could not find function "%>>%"


Error 4.
Select columns Sepal.Length, Sepal.Width, and Species and arrange by Sepal Length.
iris %>% 
  select(Sepal.Width, Species) %>% 
  arrange(Sepal.Length)

Error in iris %>% select(Sepal.Width, Species) %>% arrange(Sepal.Length): could not find function "%>%"


Error 5.
Find the average tooth length for where the supplement is vitamin C.

ToothGrowth %>%
  summarise(avg_len_vc = mean(len)) %>% 
  filter(supp == "VC")

Error in ToothGrowth %>% summarise(avg_len_vc = mean(len)) %>% filter(supp == : could not find function "%>%"


Error 6.
Create a vector of animals (cat, dog, rabbit, horse), then use the sample function to get 10 random animals from those categories.

animals <- c("cat", dog, "rabbit", "horse")

Error in eval(expr, envir, enclos): object 'dog' not found

sample(animals, 10)

Error in sample(animals, 10): object 'animals' not found


Error 7.
Create dog_names and cat_names, then use intersect to check which common pet names are shared by both dogs and cats.

dog_names <- c("Lucy", "Molly", "Charlie", "Luna", "Bella", "Cooper")

cat_names < c("Luna", "Lily", "Lucy", "Charlie", "Max", "Oliver")

Error in eval(expr, envir, enclos): object 'cat_names' not found

Intersect(dog_names)

Error in Intersect(dog_names): could not find function "Intersect"


Error 8.
Filter weights equal to or below 150 grams, then create a new column ‘weight_kg’ that contains the weight in kilograms.

chickwts %>% 
  filter(weight =< 150) %>% 
  mutate(weight_kg == weight * 0.001)

Error: <text>:2:18: unexpected '<'
1: chickwts %>% 
2:   filter(weight =<
                   ^


Error 9.
Create a tibble with column alphabet which contains the English alphabet and column numbers which has a unique number for each letter. Then remove rows where the letter is A, B or C.

tibble(alphabet = LETTERS(),
       numbers = 1:25) %>% 
  filter(letter != c(A, B, C))

Error in tibble(alphabet = LETTERS(), numbers = 1:25) %>% filter(letter != : could not find function "%>%"


Error 10.
The chunk below creates the data for this error (don’t change anything in it):

Don't change anything in this code chunk
but you will need to include it in your notebooks

set.seed(999)

scent_ratings <- tibble(
  iD = rep(1:10, each = 5),
  SCENT = rep(c("New book", "Cut grass", "Rose oil", "Fresh linen", "Wet dog"), 10),
  rating = sample(c(0:5, NA), 50, replace = TRUE),
  PersonAge = rep(NA, 50)
)

Error in tibble(iD = rep(1:10, each = 5), SCENT = rep(c("New book", "Cut grass", : could not find function "tibble"

Clean the variable names and drop missing ratings from scent_ratings and calculate an average rating per scent.

scent_ratings %>% janitor:clean_names()

Error in scent_ratings %>% janitor:clean_names(): could not find function "%>%"

scent_ratings %>% 
  drop_na() %>% 
  group_by(scent) %>% 
  summarise(mean_rating = mean())

Error in scent_ratings %>% drop_na() %>% group_by(scent) %>% summarise(mean_rating = mean()): could not find function "%>%"