# Use when you want to speed up a search in a table by marking one or more columns in that table.

# Example
/*In this wexample we will appreciate the optimaization capacity of indexes by running a querry with and without an index, then comparing the execution time of both queries*/
# Task
# Find the names of all department managers earning above 70k
use employees;
SELECT 
    e.first_name, e.last_name, MAX(s.salary) AS max_salary
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
        JOIN
    salaries s ON dm.emp_no = s.emp_no
WHERE
    s.salary > 50000
GROUP BY e.emp_no
ORDER BY first_name;

# create index on employees table with firstname and lastname as marked columns
create index i_managers_salary on employees (first_name,last_name);

# Now, rerun the precedent querry and notice the difference in the execution times.