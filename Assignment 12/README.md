# LAB 23
1. As with some libraries in Python, the Scikit-learn library comes with a set of built-in datasets. The diabetes dataset in Scikit-learn consists of data from diabetic patients and contains features such as their bmi, age , blood pressure and glucose levels which are useful in predicting the diabetes disease progression in patients.
- Use: “from sklearn import datasets” to import the required library; and load the diabetes data using “diabetes_X, diabetes_y = datasets.load_diabetes(return_X_y=True)”. This would import the diabetes data as two numpy arrays. Do the following:
a. Use “diabetes_X = diabetes_X[:, np.newaxis, 2]” to use only one feature. Note that the np denotes the numpy library. Check out the shape of the “diabetes_X” array.
b. Now create 2 arrays, diabetes_X_train and diabetes_X_test so that their shapes are (422,10) and (20,10) respectively. Confirm their shape by using the “array.shape” command.
c. Similarly, create two arrays “diabetes_y_train” and “diabetes_y_test” such that their shapes are (422, ) and (20, ) respectively.
d. Create a linear regression model, fit the training data (the X and the y).
e. Predict the y using the test data. Make sure to print actual y values and the predicted y values.
f. Print the intercept and the coefficients of the regression equation.
g. Print the mean squared error and the r2 score.
h. Create a scatter plot of test data (y vs X). Also plot the regression line. Note that theplot will not generate any labels because we are using an array. 

2. Use the “Breast_Cancer.csv” dataset. It is a dataset of Breast Cancer patients with Malignant and Benign tumors. Do the following:
a. Load the data and print the first few rows.
b. Check for missing values. Which column has missing values?
c. Drop the columns ‘id’ and ‘Unnamed’ columns.
d. Write a function that converts the diagnosis value of M and B to a numerical value where M (Malignant) = 1 and B (Benign) = 0.
e. Create X and y, where y is a dataframe with diagnosis column and X is a dataframe with all the other columns. Print X and y.
f. Use the ‘train_test_split’ method to create X_train, y_train, X_test, and y_test. The Training set should be 70% of the data and the Test set should have 30% of the data.
g. Run a kNN model using the KNeighborsClassifier model from the sklearn.neighbors library. Set the number of neighbors = 8.
h. What is the accuracy of the model?

3. Gen AI Prompt Engineering. our current KNN classifier for predicting loan approvals has an accuracy of 69%. Your task is to optimize the model to achieve higher accuracy while maintaining model interpretability and efficiency. The last step in developing a KNN model is to optimize the model which we did not do in class. Use Gen AI Prompt Engineering to help you understand and implement this step to the class bank KNN
model.

- Optimization Steps:
1. Hyperparameter Tuning:
o Experiment with different values of K (number of neighbors) using
cross-validation.
o Compare distance metrics: Euclidean, Manhattan, and Minkowski.
o Test weighting strategies: uniform vs. distance-based weighting.
2. Feature Selection & Engineering:
o Apply feature scaling (standardization or normalization) to
improve distance calculations.
o Perform dimensionality reduction using PCA to remove redundantfeatures.
o Identify and remove low-importance features to reduce noise.
3. Handling Class Imbalance:
o Investigate whether the dataset has imbalanced classes (approved vs. rejected loans).
o Use SMOTE (Synthetic Minority Over-sampling Technique) or class weighting to balance the data.
4. Evaluation & Comparison:
o Recalculate accuracy, precision, recall, and F1-score.
o Compare results with the baseline 67% accuracy and justify improvements.

# LAB 24
1. Interactive Car Dataset Dashboard with Streamlit
Objective:
Design and implement an interactive Streamlit dashboard using the provided car dataset. The dashboard should allow users to explore key performance indicators (KPIs) and trends in automobile characteristics, fuel efficiency, and performance.
- Requirements:
A. Data Preprocessing:
o Load the provided dataset into a Pandas DataFrame.
o Handle missing or inconsistent values appropriately.
o Ensure data types are correct for analysis and visualization.
B. Dashboard Components:
o Sidebar Controls:
▪ Allow users to filter cars based on:
▪ Model year
▪ Origin (e.g., USA, Europe, Japan)
▪ Number of cylinders
▪ Horsepower range
▪ Provide a checkbox to normalize data (e.g., scaling weight or horsepower).
o KPIs Section:
▪ Display the average MPG (Miles Per Gallon), average horsepower, and average weight of selected cars.
▪ Highlight the top 5 most fuel-efficient and least fuel-efficient cars.
o Visualizations:
▪ A scatter plot of MPG vs. weight, color-coded by the number of cylinders.
▪ A histogram showing the distribution of horsepower.
▪ A line chart showing the trend of MPG over different model years.
▪ A bar chart comparing the average horsepower of cars based on origin.
o Advanced Analysis:
▪ Implement a regression model to predict MPG based on weight and
horsepower, displaying the trend line on a scatter plot.
▪ Allow users to input custom values for weight and horsepower to get a
predicted MPG.

2. Gen AI Prompt Engineering: use your AI Bot to implement a clustering model (e.g., K- Means) to group cars based on characteristics like horsepower, weight, and MPG. Display clusters using scatter plots on dashboard. Also allow users to djust the number of clusters dynamically via a sidebar slider. Also, add your and your AI Bot imagination.

