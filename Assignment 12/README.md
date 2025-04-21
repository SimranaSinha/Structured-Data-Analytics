# LAB 21
1. Use the Automobile_data.csv dataset.
a. Print the first and last five rows.
b. Drop all rows with missing values (NaN) and update the CSV file. Call the file “Automobile_data_cleaned.csv”. Hint: Use the df.to_csv to write a dataframe into a CSV file.
c. Find the company name that has the most expensive car.
d. Print all Toyota car details.
e. Count total cars per company.
f. Find each company’s highest priced car.
g. Find the average mileage of each car company.
h. Sort all cars by Price column
i. Create two data frames using the given dictionaries:
- GermanCars = {'Company': ['Ford', 'Mercedes', 'BMV', 'Audi'], 'Price': [23845, 171995, 135925 , 71400]}
- japaneseCars = {'Company': ['Toyota', 'Honda', 'Nissan', 'Mitsubishi '], 'Price': [29995, 23600, 61500 , 58900]}
- Create a key for each datframe.
- Concatenate the two dataframes that you created based on the key.
j. Create two data frames using the given dictionaries:
- Car_Price = {'Company': ['Toyota', 'Honda', 'BMV', 'Audi'], 'Price': [23845, 17995, 135925 , 71400]}
- car_Horsepower = {'Company': ['Toyota', 'Honda', 'BMV', 'Audi'], 'horsepower': [141, 80, 182 , 160]}
- Merge the two dataframes

2. Use the banklist.csv file. The dataset compiled by FDIC contains information about banks that have failed and acquired by other banks.
a. What are the column names?
b. How many States (ST) are represented in this dataset?
c. Get an array of all the states in the dataset.
d. What are the top 5 states with the most failed banks?
e. What are the top 5 acquiring institutions?
f. How many banks has the State Bank of Texas acquired? How many of them were actually in Texas?
g. What is the most common city in California for a bank to fail in?
h. How many failed banks don't have the word "Bank" in their name?
i. How many bank names start with the letter 's' ?
j. How many CERT values are above 20000 ?
k. How many bank names consist of just two words? (e.g. "First Bank" , "Bank Georgia" )

3. Gen AI Prompt Engineering: Use the Gen_AI_sales_dataset.csv file.
a. Data Selection and Filtering:
• Filter the DataFrame to include only transactions from the "Electronics"
product category.
• Create a DataFrame containing only the rows where total_sales > 1000.
b. Adding New Columns:
• Add a new column called revenue_per_unit that is the ratio of total_sales
to units_sold.
• Create a new column month that extracts the month from the date column.
c. Handling Missing Data:
• Identify any missing values in the DataFrame. Replace missing unit_price values with the average unit price across all transactions.
• Drop any rows where units_sold is zero or less.
d. Sorting and Ranking:
• Sort the DataFrame by total_sales in descending order. Select the top 10 rows.
• For each store, rank the products by total_sales in descending order, and add a new column rank_in_store to store this ranking.
e. Aggregation:
• Group the data by store_id and calculate:
i. The total number of units sold per store.
ii. The average unit price per store.
iii. The total sales per store.
• After performing the grouping, reset the index

# LAB 22

1. Load the company_sales_data.csv file. Explore and understand what the dataset consists of. Do the following:
a. Create a line plot that shows total profit per month. Label the axes and provide a title for the plot.
b. Redo part a., but this time include the following style properties:
• Line Style dotted and Line-color should be red
• Show legend at the lower right location.
• X label name = Month Number
• Y label name = Sold units number
• Add a circle marker.
• Line marker color as read
• Line width should be 3
c. Display the number of units sold per month for each product using multiline plots. (i.e., Separate Plotline for each product on a single plot).
d. Create a scatter plot of toothpaste sales by each month. Also, add a grid in the plot. The gridline style should be “-“.
e. Create bar plots for face cream sales and face wash sales by month on a single plot. The bar plot should display the number of units sold per month for each product.
f. Create a histogram that shows the total profit of each month.
g. Create a pie chart that displays the Number of units sold per year for each product as a percentage.
h. Create line plots of bathing soap sales and of facewash sales by month as subplots.
i. Create a stack plot that shows all product sales by month.

2. The Titanic dataset comes inbuilt with the Seaborn package. To load it, import the Seaborn library and type: titanic = sns.load_dataset('titanic')
- Once the data is loaded, do the following:
a. Create a boxplot of Age vs Class. Use the rainbow palette.
b. Create a heatmap of all the variables.
c. Create a distplot of the count of age. 
d. Jointplot comprises of three plots.
• One plot displays a bivariate graph which shows how the dependent variable(Y) varies with the independent variable(X).
• Another plot is placed horizontally at the top of the bivariate graph and it shows the distribution of the independent variable(X).
• The third plot is placed on the right margin of the bivariate graph with the orientation set to vertical and it shows the distribution of the dependent variable(Y). See here for more: https://ajaytech.co/2020/09/28/8780/n
- It is very simple to implement using the Seaborn library. Create a jointplot of Age vs Fare variables from the Titanic data.

3. Gen AI Prompt Engineering: use Gen_AI_sales_dataset.csv. You will create visualizations that highlight patterns and trends in the dataset, with a focus on product performance, sales trends, and store behavior.
a. Sales Trends Over Time:
• Create a line plot showing the total sales over time for the entire year (monthly data).
• Insight: Can you identify peak sales months? What might have caused these peaks (e.g., promotions, holidays)?
• Additional Task: Show both total sales and units sold on the same plot with dual axes to highlight any patterns between the two metrics.
b. Sales by Store:
• Create a bar chart showing the total sales per store for the entire year.
• Insight: Which store performed the best? Which store had the lowest sales? Are there any outliers?
• Additional Task: Break down the sales performance by store over time (monthly). Use a stacked bar chart to show how sales change month- over-month for each store.
c. Product Category Performance:
• Create a pie chart or bar plot showing the distribution of sales by product category across the year.
• Insight: Which product category contributed the most to total sales? What percentage of the overall sales does each category represent?
• Additional Task: Create a bar plot showing the average sales per product category and rank the categories based on the average sales.
d. Sales Correlation Analysis:
• Create a scatter plot showing the relationship between units sold and total sales.
• Insight: Is there a correlation between the number of units sold and total sales? Are there any anomalies?
• Additional Task: Add a regression line to the scatter plot to better understand the relationship.
e. Store Performance Analysis:
• Create a boxplot for each store showing the distribution of sales over the months.
• Insight: Which stores have the most consistent sales? Which stores have the most variability in sales performance?
• Additional Task: Use a heatmap to show the monthly performance of each store

