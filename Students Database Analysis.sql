/*Making the database default*/
use students_db;

/* Task 1: List the number of girls in each district.*/
select dcode, count(*)
from students
where sex = "f"
group by dcode;

/*Task 2: List the max and min test score of Class 1 students of each district.*/
select dcode, class, max((mtest+ptest)/2), min((mtest+ptest)/2)
from students
where class LIKE "1%"
group by dcode, class
order by 1 ASC;

/*Task 3: List the average Math test score of the boys in each class. The list should not contain class with less than 3 boys.*/
select class, count(*), avg(mtest)
from students
where sex = "m"
group by class
having count(*) >= 3;

/*Task 4: List the boys of class 1A, sorted by their names.*/
select fullname
from students
where class = "1A" and sex = "m"
order by fullname ASC;

/*Task 5: List the 1B students by their residential district.*/
select dcode, fullname
from students
where class = "1B"
order by 1 ASC;

/*Task 6: List the number of students of each district (in desc. order).*/
select dcode, count(*)
from students
group by dcode
order by 2 DESC;

/*Task 7: List the boys of each house sorted by the classes. (2-level ordering)*/
select fullname, class, hcode
from students
where sex = "m"
order by class, hcode ASC;

/*Task 8: List the top 10% scoring girls students in Maths.*/
SET @TotalGirls := (select count(*) from students where sex = "f");

select id, fullname, mtest, Rnk
from (select id, fullname, mtest,
	  rank() over (order by mtest desc) as Rnk
	  from students
	  where sex = "f") as TempTable
where Rnk <= ceil(@TotalGirls*0.1);

/*Task 9: Print the name of the second highest scorer in Maths Test.*/
select id, fullname, mtest, Drank
from (select id, fullname, mtest, 
	  dense_rank() over (order by mtest desc) as Drank
	  from students) as RankTable
where Drank = 2;

/*Task 10: How many students have unique names?*/
select count(*)
from (select fullname, count(fullname)
	  from students 
	  group by fullname
	  having count(fullname) = 1) as TempTable;

/*Task 11: How many dumbs and scholar students are there in the table (Scholar Criteria – Mtest > 95. Everyone else is dumb).*/
select if(mtest > 95, "Scholar", "Dumb") as Status, count(*)
from students
group by Status;

/*Task 12: Find the 4th lowest scorer in Maths and Phy test scores combined.*/
select id, fullname, mtest+ptest as score
from students
where mtest+ptest is not null
order by score asc
limit 3,1;

/*Task 13: Assign a roll number to each student after sorting their name alphabetically within each class.*/
select id, fullname, class, 
row_number() over (partition by class order by fullname asc) as RollNo
from students
where class is not null;

/*Task 14: Categorize the students into 3 categories: 
Scholars - Students who have scored more than 95 in Maths
Average - Students who have scored between 90 and 94 in Maths
Dumbs - Students who have scored less than 90*/
select id, fullname, class, mtest,
if (mtest >= 95, "Scholar", if(mtest between 90 and 94, "Average", "Dumb")) as Status
from students
where class is not null;

/*Task 15: Refer to the table below and do the questions listed as 1 and 2: 
	FullName	Mtest	Ptest	Higher of Mtest / Ptest 
	Kaushal		  93	  96				96	
	Prateek		  99	  92 				99
1. Higher of Mtest and Ptest for each student.*/
select FullName, Mtest, Ptest,
greatest(mtest,ptest) as 'Higher of Mtest / Ptest'
from students;

/*2. Among the higher values, find the highest scorer.*/
select id, fullname, HigherScore
from (select id, fullname, mtest, ptest,
	  greatest(mtest,ptest) as HigherScore,
	  rank() over (order by greatest(mtest,ptest) desc) as Rnk
	  from students) as TempTable
where Rnk = 1;

/*Task 16: Find the average age of all boy students.*/
select floor(Avg(timestampdiff(Year, NewDOB, Current_Date()))) as AvgAge
from students
where sex = "m";

/*Task 17: Create a monthly birthday frequency table.*/
select monthname(NewDOB), count(*)
from students
group by monthname(NewDOB)
order by month(NewDOB) ASC;
