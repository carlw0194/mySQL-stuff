use employees;
# find employees with  salaries greater than the average salary.
# can one employee have more than one salary?
/* using subqueries when working with one table
My formula
begin with the outer query ie select the columns you would like to see in your final result.
next go write the inner query ie try to obtain the table result from which the final table will be displayed

*/

select emp_no,salary from salaries where salary > (select avg(salary) from salaries) order by emp_no;

# find the name of employees who have salaries greater than the average salary
# method one .using joins

 select e.emp_no,e.first_name,s.salary from employees e join salaries s on e.emp_no = s.emp_no
where s.salary > (select avg(salary) from salaries s);

 # method 2. Using subqueries
 select e.emp_no,e.first_name from employees e where e.emp_no in (select emp_no from salaries s where s.salary > (select avg(s.salary) from salaries s));
 
 # Stored procedures
 /*At the end of each year, you like to assess the performance of employees who've been around for under a year
 # create a stored procedure that returns the name,emp_no,salary info,dept name of employees that have been around for under a year.
 */ 
delimiter $$
create procedure employees_under_one_year()
begin

end $$
delimiter ;