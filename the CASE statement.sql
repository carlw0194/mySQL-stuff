# Use when you want to sepcify different conditions to obtain different kinds of results from each condition applied .This is similar to an if else statement but capable of handling more than one conditional statement.

# Example 1
 /*
 Extract a dataset containing the following information about the managers: employee number, first name, and last name. Add two columns at the end – one showing the difference between the maximum and minimum salary of that employee, and another one saying whether this salary raise was higher than $30,000 or NOT.
 */
 use employees;
 select e.first_name,e.last_name,e.emp_no,
 max(s.salary) - min(s.salary) as salary_difference,
 case when  max(s.salary) - min(s.salary) >30000 then 'raised by more than 30k'
 when max(s.salary) - min(s.salary) = 30000 then 'raised by exactly 30k' 
 else 'raised by less than 30k'
 end as salary_comment from employees e join dept_manager dm on e.emp_no = dm.emp_no
 join salaries s on s.emp_no = dm.emp_no
 group by emp_no order by emp_no;