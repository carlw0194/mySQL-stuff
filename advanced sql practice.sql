# Learn the fundamentals of some advanced querry techniques in this tutorial script.

# Topics

# Subqueries
# stored procedures
# triggers
# views
# window funcitons

# 1.Subqueries

/* Use when the result of one select statement is a necessary condition for another select statement.

My formula
begin with the outer query i.e select the columns you would like to see in your final result.
next, write the inner query ie try to obtain the table result from which the final table will be displayed
*/

 # **Question 1**
# find employees with salaries greater than the average salary.
use employees;
select emp_no,salary from salaries where salary > (select avg(salary) from salaries) order by emp_no;

 # **Question 2**
# find the name of employees who have salaries greater than the average salary
# method one , Using joins

 select e.emp_no,e.first_name,s.salary from employees e join salaries s on e.emp_no = s.emp_no
where s.salary > (select avg(salary) from salaries s);

 # method 2. Using subqueries( querrying from two or more tables)
 select e.emp_no,e.first_name from employees e where e.emp_no in (select emp_no from salaries s where s.salary > (select avg(s.salary) from salaries s));
 
 # 2.Stored procedures
 
# - with in parameters
# - with out parameters

 # Use when there is a querry you might be needing frequently.Stored procedures can be stored and run later.
 /*At the end of each year, you like to assess the performance of employees who've been around for under a year. Assuming that the current date is 2004/12/25, create a stored procedure that returns the first name,emp_no,salary info,dept name of employees that have been around for under a year.
 */ 
delimiter $$
create procedure employees_under_one_year()
begin
declare current_year
end $$
delimiter ;