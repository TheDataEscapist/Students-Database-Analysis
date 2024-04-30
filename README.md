# Students-Database-Analysis
The students db consists of 4 tables - students, bridge, chess, and music. The columnar break down of the tables are given as follows:

#### students
ID int, FullName text, Sex text, Class text, HCode text, DCode text, Remission binary(1), MTest int, PTest int, DOB text

#### bridge
ID int, FullName text, Sex text, Class text

#### chess
ID int, FullName text, Sex text, Class text

#### music
ID int, Type text

### Objectives:
1. To list the number of girls in each district.
2. To list the max and min test score of Class 1 students in each district.
3. To list the average Math test score of the boys in each class. The list should not contain class with less than 3 boys.
4. To list the boys of class 1A, sorted by their names.
5. To list the 1B students by their residential district.
6. To list the number of students of each district (in desc. order).
7. To list the boys of each house sorted by the classes. (2-level ordering)
8. To list the top 10% scoring girls students in Maths.
9. To print the name of the second highest scorer in Maths Test.
10. To calculate how many students have unique names.
11. To extract the number of dumb and scholar students (Scholar Criteria – Mtest > 95. Everyone else is dumb).
12. To find the 4th lowest scorer in Maths and Phy tests combined.
13. To assign a roll number to each student after sorting their name alphabetically within each class.
14. To further categorize the students into 3 categories: Scholars - more than 95, Average - between 90 and 94, and Dumbs - less than 90.
15. To get the higher of Mtest and Ptest for each student, and among the higher values, find the highest scorer.
16. To find the average age of all boy students.
17. To create a monthly birthday frequency table.
