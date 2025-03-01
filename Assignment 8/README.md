# LAB 15
- This lab consists of 3 questions that have a few sub questions. You are required to create an R
Notebook that answers all the questions. Add explanations and comments wherever required.

I. Use the data in the file “femaleMiceWeights.csv” taken from a study of diabetes. The body weight of mice (in grams) was measured after around two weeks on one of two diets (chow or high fat). These data are in comma separated variable (csv) format.
- Task:
1. Load the data into RStudio and answer the following:
(a) Is mice an R object of class data.frame or matrix, and how can you tell?
(b) What is the difference between a dataframe and a matrix in R?
(c) What is the dimension of the mice dataset?
(d) What are the units, and what are the variables?

2. What is the exact name of the column containing the weights? Use the function colnames() to report code that extracts this.

3. What is the entry in the 12th row and second column? Give code to extract it.

4. Use ‘$’ to extract the weight column and report the weight of the mouse in the 11th row and the code used to obtain it.

5. The length function returns the number of elements in a vector. Use length() to obtain the number of mice included in our dataset. Report your code.

6. To create a vector with the numbers 3 to 7, we can use seq(3,7) or, because they are consecutive, 3:7. View the data and determine what rows are associated with the high fat diet (coded as hf). Use a sequence of indices to extract the vector of weights for the corresponding animals and then use the mean() function to compute their average weight.  Report this mean weight and the code used to get it.


- II. Working with Vectors in R
**Task:**
1. Create a vector of 100 elements such that the first 20 elements are 1, 2, ..., 20, the next 10 elements are 10, 20, 30, .... 100, and the last 70 elements are 31, 32, ...., 100. Hint: You will need to use the function seq( ).

2. Show the contents of the vector.

- III. Cleaning and Transformation
The HERS data are a simple random sample of n=2763 observations from the HERS
study. The HERS study was a randomized clinical trial of hormone therapy (estrogen plus
progestin)
**Task:**
1. Load the hersdata.Rdata in RStudio
2. Issue the command class(hersdata$drinkany). You should see that it is a character
variable. Convert this variable to factor.
3. Install the summarytools package and load the library. Next, produce a one-way
frequency table of the drinkany variable. How many missing values are there?
4. Create a 0/1 numeric variable drinkany01 that is coded as follows:
= 0 if drinkany == “no”
1 if drinkany == “yes” and
NA if drinkany == NA
5. Create a subset of hersdata called mytiny as follows:
- Include only the following variables: HT, LDL, and SBP
- Include only the observations with: weight > 125
Hint: Use the tidyverse library
6. Print the mytiny data.
IV. Gen AI Prompt Engineering: You are a data analyst working for an e-commerce
company. Your manager provides you with a dataset containing customer transaction
records. Using sample_transactions.xlsx, your task is to analyze the dataset and
generate insights by performing the following tasks:
1. Data Structures:
a. Store the dataset using an appropriate data structure (list, dictionary,
DataFrame, etc.).
b. Write a function to find the top 3 most frequently purchased product
categories.
2. Control Structures:
a. Write a loop to calculate the total revenue generated from each product
category.
b. Use conditional statements to analyze the most preferred payment
method.
V. Gen AI Prompt Engineering: R provides many data structures to choose from: vector,
array, list, factor, matrix, table, and data frame. Investigate:
i. The difference between them
ii. Which one is better to use over other ones
iii. The best use scenario for each one
iv. Any other info you find
v.
Submit the following:
1. Detailed screenshots showing the results of all the Tasks and questions
2. R Notebook
3. Compile the R notebook file to HTML, open it up in a browser, and print it as a pdf.
