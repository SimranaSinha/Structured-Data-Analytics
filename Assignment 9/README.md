# LAB 17


1. Use the cars dataset that we worked with in class. But this time, instead of using the lm() function for linear regression, create the linear regression model from scratch. You have the math preliminaries to help you with the model components.
Some hints on what you will need to do:
i) Establish what x and y are. In this case, x is speed and y is the stopping distance.

ii) Calculate Sxx, Sxy and Syy

iii) Then calculate Beta0 and Beta1

Answer the following questions:
a) What are the values for Sxx, Sxy and Syy that you obtained?

b) Compare these coefficients you obtained via manual calculate to the ones obtained using the lm() function used in class. Are they same/similar?

c) Predict the stopping distance for a speed of 8 mph. You MUST use the Beta0 and Beta1 you found in this calculation.

d) Calculate the residual for a car travelling at 8 mph. What you need to do is obtain the stopping distance for a car travelling at 8 mph using the regression equation manually with Beta0 and Beta1, then compare this with data from row 5 from the cars dataset. What is the residual?


3. Load the Load the faithful dataset by typing data(faithful). Do the following:
a) Plot the waiting times against the duration of eruption.

b) Compute the Pearson correlation coefficient between waiting times and duration of eruption. Is there evidence of a linear relationship? Is it: weak, strong, positive, etc.

c) Use lm to fit waiting times as a linear function of eruption durations and save the result of the regression function to the variable ‘lab_model’.

d) Print the summary of the model. What does the summary tell you about model performance from the metrics shown?

e) Using the ‘lab_model’ to predict the waiting time for an eruption duration of 3.667 mins.


5. kNN Preliminaries
a) Write a function that returns the Euclidean distance between two Vectors of the same length. Function must return an error if vectors are of different lengths.
b) Find the Euclidean distance between the following two vectors: v1 = (10.09, 2.33, 9.71, 101.46) and v2 = (12.21, 9.41, 7.65, 163.12)

6. Use the vehicle_info.csv dataset provided to you and load it into R.
a) Browse the data, view its structure and its dimensionality. How many variables does it have? How many rows does it have?
b) Is there a “label” variable suited for classification purposes? Which variable is that?
c) Normalize the data (excluding the "label" variable). The resulting values of all variables should be in the range from 0 to 1.
d) Create a training and test set. Use 80% of the records for the training set and 20% for test set. Make sure to sample records so that the class labels in the training and testing sets are not skewed.
e) Build a knn() classifier using the “class” package. Set k=9.
f) Get the confusionMatrix using the “caret” package. Are there any misclassified labels?
g) What is the accuracy? Is it a good performance?

7. Gen AI Prompt Engineering: A telecommunications company wants to predict which customers are likely to churn (cancel their service) based on their usage patterns and demographic information. The company has provided historical data on customers who have either stayed with the service or churned. Your task is to develop a K-Nearest Neighbors (KNN) classifier in Excel to predict customer churn and analyze the factors that contribute most to customer attrition.
- Dataset Description
- The dataset contains the following features for each customer:
• Customer ID
• Age
• Gender (encoded as 0 for female, 1 for male)
• Tenure (months with the company)
• Monthly Charges ($)
• Total Charges to date ($)
• Number of Support Calls in last 6 months
• Service Upgrades in last year
• Average Monthly Download (GB)
• Contract Type (encoded as 0 for month-to-month, 1 for one year, 2 for two year)
• Payment Method (encoded as 0 for electronic check, 1 for mailed check, 2 for bank
transfer, 3 for credit card)
• Churn (target variable: 0 for no, 1 for yes)

- Tasks
A. Data Preparation:
o Split the provided dataset into training (70%) and testing (30%) sets
o Perform feature scaling (min-max normalization) on all numerical features
o Identify any outliers and decide how to handle them
B. KNN Implementation in Excel:
o Create a KNN classifier from scratch using Excel formulas
o Calculate Euclidean distances between test instances and all training instances
o Implement k-nearest neighbor selection and majority voting for classification
o Test your model with k=3, k=5, and k=7
C. Model Evaluation:
o Calculate accuracy, precision, recall, and F1 score for each k value
o Create a confusion matrix for the best performing model
o Analyze which features have the greatest impact on churn prediction
D. Business Recommendations:
o Based on your analysis, provide 3-5 actionable recommendations to reduce
customer churn
o Support your recommendations with insights from the model
Note: KNN classifier output: binary output (0 or 1)

6. Gen AI Prompt Engineering: redo problem 5 but use logistic regression to predict the churn probability (between 0 and 1)
