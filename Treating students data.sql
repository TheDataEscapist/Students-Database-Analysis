/*Creating Database*/
create database students_db;

/*Making the database default*/
use students_db;

/*Treating/cleaning the data (missing values, changing date data types, etc.)

1. Creating a new column for DOB - NewDOB with date data type*/
ALTER TABLE students
ADD Column NewDOB date;

/*2. Converting the text DOB into date NEWDOB
Important - Please un-check restricted updates by going to:
Edit -> Preferences -> SQL Editor -> Uncheck Safe Updates and close and reopen MySQL Workbench*/
Update students
SET NewDOB = Str_To_Date(Left(DOB,10), "%d-%m-%Y");

ALTER TABLE Student
DROP Column DOB;

/*3. Replacing unknown values with Null values*/
Update students
Set Sex = NULL, Class = Null, Hcode = Null, Dcode = Null
WHERE Sex = "T" and Class = "T" and Hcode = "T" and Dcode = "T"; 

Update student
Set Ptest = NULL 
WHERE FullName IN ("*ba", "aaa");