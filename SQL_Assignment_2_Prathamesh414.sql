use assignment;

#1. select all employees in department 10 whose salary is greater than 3000. [table: employee]
select * from emp;
select * from emp where dept_no = 10 and salary > 3000;

#2. The grading of students based on the marks they have obtained is done as follows
#	40 to 50 -> Second Class
#	50 to 60 -> First Class
#	60 to 80 -> First Class
#	80 to 100 -> Distinctions
#	a. How many students  have graduated with first class?
#	b. How many students  have obtained distinction?  [table: students]

select * from students;
alter table students add column grade varchar (20) not null;
update students set grade = 'Second Class' where marks between 40 and 50;
update students set grade = 'First Class' where marks between 51 and 80;
update students set grade = 'Distinctions' where marks between 81 and 100;
update students set grade = 'Fail' where marks < 39;
select * from students;
select count(*) from students where grade="First Class";
select count(*) from students where grade="Distinctions";

#3. Get a list of city names from station with even ID numbers only. 
#Exclude duplicates from your answer.[table: station]
show tables;
select * from station;
select distinct city from station where id%2 = 0;

#4. Find the difference between the total number of city entries in the table 
#and the number of distinct city entries in the table. 
#In other words, if N is the number of city entries in station, 
#and N1 is the number of distinct city names in station, 
#write a query to find the value of N-N1 from station.[table: station]
select count(city)-count(distinct city) from station;
select count(city) from station;
select count(distinct city) from station;

#5. a. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) 
#      from STATION. Your result cannot contain duplicates. 
#      [Hint: Use RIGHT() / LEFT() methods ]
#   b. Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u)
#      as both their first and last characters. Your result cannot contain duplicates.
#   c. Query the list of CITY names from STATION that do not start with vowels. 
#      Your result cannot contain duplicates.
#   d. Query the list of CITY names from STATION that either do not start with vowels or 
#      do not end with vowels. Your result cannot contain duplicates. [table: station]

select distinct city from station where left(city,1) in ('a','e','i','o','u');
select distinct city from station where left(city,1) in ('a','e','i','o','u') and right(city,1) in ('a','e','i','o','u');
select distinct city from station where left(city,1) not in ('a','e','i','o','u');
select distinct city from station where left(city,1)not  in ('a','e','i','o','u') and right(city,1)not  in ('a','e','i','o','u');

#7. Write a query that prints a list of employee names having a salary greater than $2000 per month 
#   who have been employed for less than 10 months. Sort your result by ascending emp_id. [table: emp]

select * from emp;
select * from emp where salary > 2000 and hire_date >= now() - interval 10 month order by emp_no;

#8. How much money does the company spend every month on salaries for each department? [table: emp]
select * from emp;
select dept_no, sum(salary) from emp group by dept_no;

#9. How many cities in the CITY table have a Population larger than 100000. [table: city]
select * from city;
select count(distinct name) from city where population > 100000;

#10. What is the total population of California? [table: city]
select * from city;
select sum(population) from city where district = 'California';

#11. What is the average population of the districts in each country? [table: city]
select * from city;
select countrycode, avg(population) from city group by countrycode;




