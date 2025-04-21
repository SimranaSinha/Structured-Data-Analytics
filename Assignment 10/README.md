# LAB 19
1. Write code to iterate the first 10 numbers and in each iteration, print the sum of the current and previous number.
- Hints:
• Create a variable called previous_num and assign it to 0
• Iterate the first 10 numbers one by one using for loop and range() function
• Next, display the current number (i), previous number, and the addition of both numbers in each iteration of the loop. At last, change the value previous number to current number ( previous_num = i).

2. Write code to find how many times substring “data” appears in the given string: str_x = "Human health can be monitored using several types of data. The data collected from scans, labs, and procedures can be used for research purposes. The key to using data
effectively is .... "
- Hint: Use string method count().

3. Write python code to extract each digit from the integer 4858643 in the reverse order. The result should display “3 4 6 8 5 8 4” with a space separating the digits.
- Hint: Use a while() loop

4. Calculator program: Create a python application that takes user input for two numbers and performs basic calculations: addition, subtraction, division, and multiplication.
- Hint: Use the web to search for calculator applications in Python. Note that we have not yet covered the topic of functions, but you may use it to answer this question. For user input, you may use the input() function.

5. Display Fibonacci series up to 10 terms. The Fibonacci Sequence is a series of numbers. The next number is found by adding up the two numbers before it. The first two numbers are 0 and 1. For example, 0, 1, 1, 2, 3, 5, 8, 13, 21. The next number in this series above is 13+21 = 34.
- The output should be: 0 1 1 2 3 5 8 13 21 34
- Hints:
• Set num1 = 0 and num2 =1 (first two numbers of the sequence)
• Run loop ten times
• In each iteration print num1 as the current number of the sequence
• Add last two numbers to get the next number res = num1+ num2
• update values of num1 and num2. Set num1=num2 and num2=res

6. Gen AI Prompt Engineering: ask your AI Bot to create and run a cool Python App. Ask it to explain code

# LAB 20

1. Write a program to prompt the user for hours and rate per hour to compute gross pay. Consider that the factory gives the employee 1.5 times the hourly rate for hours worked above 40 hours.
- Enter Hours: 45
- Rate: 10
- Pay: 475.0
  
2. Write a Python program to create a new dictionary by extracting the mentioned keys from the below dictionary.
- Given dictionary: sample_dict = { "name": "Ryan", "age": 21, "salary": 60000, "city": "Boston"}

- Keys to extract keys = ["name", "salary"]
The results should look like this:
{'name': Ryan, 'salary': 60000}

3. Write a program to add two lists index-wise. Create a new list that contains the 0th index item from both the list, then the 1st index item, and so on till the last element. any leftover items will get added at the end of the new list.
- Given: list1 = ["M", "na", "i", "Ke"]
- list2 = ["y", "me", "s", "lly"]
- Expected Output: ['My', 'name', 'is', 'Kelly']
- Hint: Use list comprehension with the zip() function

4. Write a program to create function calculation() such that it can accept two variables and calculate addition and subtraction. Also, it must return both addition and subtraction in a single return call.
- Given: def calculation(a, b):
- Your Code
res = calculation(40, 10)
print(res)
- Expected Output: 50, 30
- Hint: Separate return values with a comma.
  
5. In Python, we can create a nested function inside a function. We can use the nested function to perform complex tasks multiple times within another function or avoid loop and code duplication.
• Create an outer function that will accept two parameters, a and b
• Create an inner function inside an outer function that will calculate the addition of a and b
• At last, an outer function will add 5 into addition and return it

6. Swap two tuples in Python
- Given: tuple1 = (11, 22)
- tuple2 = (99, 88)
- Expected Output: tuple1: (99, 88) tuple2: (11, 22)

7. Given is a nested tuple. Write a program to modify the first item (22) of a list inside a following tuple to 222
- Given: tuple1 = (11, [22, 33], 44, 55)
- Expected Output: tuple1: (11, [222, 33], 44, 55)
- Hint: The given tuple is a nested tuple. Use indexing to locate the specified item and modify it using the assignment operator.

8. Get the key of a minimum value from the following dictionary
- Given: sample_dict = {'Physics': 82, 'Math': 65, 'history': 75}
- Expected Output: Math
- Hint: Use the built-in function min()

9. Write a Python program to check if value 200 exists in the following dictionary.
- Given: sample_dict = {'a': 100, 'b': 200, 'c': 300}
- Expected Output: 200 present in a dict
- Hint:
• Get all values of a dict in a list using the values() method.
• Next, use the if condition to check if 200 is present in the given list

10. Gen AI Prompt Engineering: there are many other types of data structure: stack, queue,linked list, graph, and hashMap. Select one. Ask you AI bot to explain it, when to use, and provide cool app
