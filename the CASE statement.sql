# Use when you want to sepcify different conditions to obtain different kinds of results from each condition applied .This is similar to an if else statement but capable of handling more than one conditional statement.

# Example 1
 /*
 Extract a dataset containing the following information about the managers: employee number, first name, and last name. Add two columns at the end – one showing the difference between the maximum and minimum salary of that employee, and another one saying whether this salary raise was higher than $30,000 or NOT.
 */
 use employees;
SELECT 
    e.first_name,
    e.last_name,
    e.emp_no,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    CASE
        WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'raised by more than 30k'
        WHEN MAX(s.salary) - MIN(s.salary) = 30000 THEN 'raised by exactly 30k'
        ELSE 'raised by less than 30k'
    END AS salary_comment
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
        JOIN
    salaries s ON s.emp_no = dm.emp_no
GROUP BY emp_no
ORDER BY emp_no;
 
 # Example 2
 /*
Extract the employee number, first name, and last name of the first 100 employees, and add a fourth column, called “current_employee” saying “Is still employed” if the employee is still working in the company, or “Not an employee anymore” if they aren’t. 
 */
 
 SELECT 
    e.first_name,
    e.last_name,
    CASE
        WHEN MAX(de.to_date) > SYSDATE() THEN 'Is still employed'
        ELSE 'Not an employee anymore'
    END AS current_employee
FROM
    employees e
        JOIN
    dept_emp de ON de.emp_no = e.emp_no
GROUP BY de.emp_no
LIMIT 100;