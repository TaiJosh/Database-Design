# Bank-Database-Design


### Introduction

There are only two types of accounts at this time: Checking and Savings accounts. The provided column list was separated into appropriate entities (tables) with relationships between these entities defined. 
I picked the appropriate data types for each of the columns, established data integrity rules by defining primary key, secondary key and some unique constraints.

###
Some of the data types listed in the E-R Diagram were causing errors when running the code. For example smallmoney, and bit.
So I changed data type "smallmoney" to 'decimal' and bit to 'boolean'

