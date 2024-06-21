# Bank-Database-Design


### Introduction

There are only two types of accounts at this time: Checking and Savings accounts. The provided column list was separated into appropriate entities (tables) with relationships between these entities defined. 
I picked the appropriate data types for each of the columns, established data integrity rules by defining primary key, secondary key and some unique constraints.

###
Some of the data types listed in the E-R Diagram were causing errors when running the code. For example smallmoney, and bit.
So I changed data type "smallmoney" to 'decimal' and bit to 'boolean'


# Database-Design

### Introduction

There are only two types of accounts at this time: Checking and Savings accounts. The provided column list was separated into appropriate entities (tables) with relationships between these entities defined. 
I picked the appropriate data types for each of the columns, established data integrity rules by defining primary key, secondary key and some unique constraints.

### Technology Utilized

MySQL Workbench

### Entity Relationship Diagram

![alt text](Entity_Relationship_Diagram.jpg)

This step involves exploring the dataset to answer important questions like:
1. Which year recorded the highest revenue?
![Sales_by_year](https://github.com/TaiJosh/Analysis-of-Sales-Data/assets/49366771/c7e1a793-1368-482a-a6ea-b89d06dff627)

2. What is the revenue generated by each item?
![Chart - sales by item](https://github.com/TaiJosh/Analysis-of-Sales-Data/assets/49366771/1c1e50b0-465e-462f-9bb6-98e833132984)

4. What are the top 3 product categories?
![Chart - sales by product category](https://github.com/TaiJosh/Analysis-of-Sales-Data/assets/49366771/45853569-9bbc-4071-a812-a655987b2e56)

### Queries
```
=QUERY(Data!A:I, "Select C, Sum(I) where C is not null Group by C Order by Sum(I) DESC")
=QUERY(Data!A:J, "SELECT YEAR(A),SUM(I) WHERE YEAR(A) IS NOT NULL GROUP BY YEAR(A) ORDER BY SUM(I) DESC")
=QUERY(Data!A:I, "Select G, Sum(I) where G is not null Group by G Order by Sum(I)")
```


### Challenges/Lessons
It was challenging fixing the missing values but with critical attention to the dataset and sacrificing time, I was able to fix it. My key lesson from this project is that, I was reminded that the most time consuming task of a Data Analyst is data cleaning.