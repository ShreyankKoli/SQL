# SQL
Simple SQL Queries


Write a query to find the second-highest salary in the company without using the LIMIT or TOP clause.
Solution:

SELECT MAX(emp_salary) AS second_highest_salary
FROM employee_details
WHERE emp_salary < (SELECT MAX(emp_salary) FROM employee_details);

2. Write a query to list employees who earn more than the average salary in their city.
Solution:

WITH CityAverageSalary AS (
    SELECT 
        a.city, 
        AVG(e.emp_salary) AS avg_salary
    FROM 
        employee_details e
    JOIN 
        address_details a ON e.emp_id = a.emp_id
    GROUP BY 
        a.city
)
SELECT 
    e.emp_id, 
    e.emp_name, 
    e.emp_salary, 
    a.city
FROM 
    employee_details e
JOIN 
    address_details a ON e.emp_id = a.emp_id
JOIN 
    CityAverageSalary c ON a.city = c.city
WHERE 
    e.emp_salary > c.avg_salary;
    
3. Write a query to retrieve employees whose salaries fall within the 10th and 90th percentiles.
Solution:

WITH SalaryPercentiles AS (
    SELECT 
        emp_id, 
        emp_salary, 
        PERCENT_RANK() OVER (ORDER BY emp_salary) AS percentile_rank
    FROM 
        employee_details
)
SELECT 
    emp_id, 
    emp_salary
FROM 
    SalaryPercentiles
WHERE 
    percentile_rank >= 0.1 AND percentile_rank <= 0.9;
    
4. Write a query to find all employees who share the same phone number with another employee.
Solution:

SELECT 
    c1.emp_id AS emp1_id, 
    c2.emp_id AS emp2_id, 
    c1.phone_number
FROM 
    contact_details c1
JOIN 
    contact_details c2 ON c1.phone_number = c2.phone_number
WHERE 
    c1.emp_id != c2.emp_id;
    
5. Write a query to find employees who live in a state where the total number of employees is less than 5.
Solution:

WITH StateEmployeeCount AS (
    SELECT 
        a.state, 
        COUNT(e.emp_id) AS employee_count
    FROM 
        employee_details e
    JOIN 
        address_details a ON e.emp_id = a.emp_id
    GROUP BY 
        a.state
)
SELECT 
    e.emp_id, 
    e.emp_name, 
    a.state
FROM 
    employee_details e
JOIN 
    address_details a ON e.emp_id = a.emp_id
JOIN 
    StateEmployeeCount s ON a.state = s.state
WHERE 
    s.employee_count < 5;
    
6. Write a query to calculate the median salary of employees.
Solution:

WITH OrderedSalaries AS (
    SELECT 
        emp_salary, 
        ROW_NUMBER() OVER (ORDER BY emp_salary) AS row_num, 
        COUNT(*) OVER () AS total_count
    FROM 
        employee_details
)
SELECT 
    AVG(emp_salary) AS median_salary
FROM 
    OrderedSalaries
WHERE 
    row_num IN ((total_count + 1) / 2, (total_count + 2) / 2);
    
7. Write a query to find employees who do not have an address in the address_details table.
Solution:

SELECT 
    e.emp_id, 
    e.emp_name
FROM 
    employee_details e
LEFT JOIN 
    address_details a ON e.emp_id = a.emp_id
WHERE 
    a.emp_id IS NULL;
    
8. Write a query to fetch employees grouped by state and calculate the average salary and the total number of employees in each state.
Solution:

SELECT 
    a.state, 
    COUNT(e.emp_id) AS total_employees, 
    AVG(e.emp_salary) AS avg_salary
FROM 
    employee_details e
JOIN 
    address_details a ON e.emp_id = a.emp_id
GROUP BY 
    a.state;
    
9. Write a query to calculate the percentage of employees earning above the average salary in each city.
Solution:

WITH CityAverageSalary AS (
    SELECT 
        a.city, 
        AVG(e.emp_salary) AS avg_salary
    FROM 
        employee_details e
    JOIN 
        address_details a ON e.emp_id = a.emp_id
    GROUP BY 
        a.city
),
AboveAverage AS (
    SELECT 
        a.city, 
        COUNT(e.emp_id) AS above_avg_count
    FROM 
        employee_details e
    JOIN 
        address_details a ON e.emp_id = a.emp_id
    JOIN 
        CityAverageSalary c ON a.city = c.city
    WHERE 
        e.emp_salary > c.avg_salary
    GROUP BY 
        a.city
)
SELECT 
    c.city, 
    CAST(a.above_avg_count * 100.0 / COUNT(e.emp_id) OVER (PARTITION BY c.city) AS DECIMAL(5, 2)) AS percentage_above_avg
FROM 
    employee_details e
JOIN 
    address_details a ON e.emp_id = a.emp_id
JOIN 
    AboveAverage a ON a.city = c.city;
    
10. Write a query to demonstrate ON DELETE CASCADE functionality with a test case.
Solution:

-- Test case: Delete an employee and observe cascading deletions in related tables.
DELETE FROM employee_details WHERE emp_id = 101;

-- Verify cascading deletions
SELECT * FROM contact_details WHERE emp_id = 101;
SELECT * FROM address_details WHERE emp_id = 101;
Let me know if you'd like further details or additional queries!

Write a query to find the employee(s) with the 3rd highest salary.
Solution:

SELECT emp_id, emp_name, emp_salary
FROM employee_details
WHERE emp_salary = (
    SELECT DISTINCT TOP 1 emp_salary
    FROM (
        SELECT DISTINCT TOP 3 emp_salary 
        FROM employee_details 
        ORDER BY emp_salary DESC
    ) AS temp
    ORDER BY emp_salary ASC
);

2. Write a query to fetch employees who have worked for more
than 5 years, assuming there’s a hire_date column.
Solution:

SELECT emp_id, emp_name, DATEDIFF(YEAR, hire_date, GETDATE()) AS years_worked
FROM employee_details
WHERE DATEDIFF(YEAR, hire_date, GETDATE()) > 5;

3. Write a query to find all employees who share the same city and designation.
Solution:

SELECT e1.emp_id AS emp1_id, e2.emp_id AS emp2_id, e1.city, e1.designation
FROM employee_details e1
JOIN employee_details e2 ON e1.city = e2.city AND e1.designation = e2.designation
WHERE e1.emp_id < e2.emp_id;

4. Write a query to calculate the cumulative salary of employees in each state.
Solution:

SELECT a.state, e.emp_id, e.emp_salary, 
       SUM(e.emp_salary) OVER (PARTITION BY a.state ORDER BY e.emp_salary) AS cumulative_salary
FROM employee_details e
JOIN address_details a ON e.emp_id = a.emp_id
ORDER BY a.state, cumulative_salary;

5. Write a query to find all employees who live in the same city as at least 2 other employees.
Solution:

SELECT emp_id, emp_name, city
FROM address_details
WHERE city IN (
    SELECT city
    FROM address_details
    GROUP BY city
    HAVING COUNT(emp_id) > 2
);

6. Write a query to find employees who have more than one phone number.
Solution:

SELECT emp_id, COUNT(phone_number) AS phone_count
FROM contact_details
GROUP BY emp_id
HAVING COUNT(phone_number) > 1;

7. Write a query to retrieve employees along with the number of other employees living in the same city.
Solution:

SELECT e.emp_id, e.emp_name, a.city, COUNT(other.emp_id) AS num_employees_in_city
FROM employee_details e
JOIN address_details a ON e.emp_id = a.emp_id
JOIN address_details other ON a.city = other.city
WHERE e.emp_id != other.emp_id
GROUP BY e.emp_id, e.emp_name, a.city;

8. Write a query to list all employees who have both an address and a phone number, but the state and area code do not match.
Solution:

SELECT e.emp_id, e.emp_name, a.state, c.phone_number
FROM employee_details e
JOIN address_details a ON e.emp_id = a.emp_id
JOIN contact_details c ON e.emp_id = c.emp_id
WHERE LEFT(c.phone_number, 3) NOT IN (
    SELECT DISTINCT area_code
    FROM state_area_codes
    WHERE state = a.state
);

9. Write a query to calculate the total salary expense for each designation, only including designations with more than 3 employees.
Solution:

SELECT designation, COUNT(emp_id) AS num_employees, SUM(emp_salary) AS total_salary
FROM employee_details
GROUP BY designation
HAVING COUNT(emp_id) > 3;

10. Write a query to detect and delete all duplicate entries in the contact_details table based on phone_number.
Solution:

WITH DuplicateContacts AS (
    SELECT phone_number, MIN(contact_id) AS contact_id_to_keep
    FROM contact_details
    GROUP BY phone_number
    HAVING COUNT(*) > 1
)
DELETE FROM contact_details
WHERE contact_id NOT IN (SELECT contact_id_to_keep FROM DuplicateContacts);

11. Write a query to retrieve employees with the longest and shortest tenure (based on hire_date).
Solution:

-- Longest tenure
SELECT TOP 1 emp_id, emp_name, hire_date
FROM employee_details
ORDER BY hire_date ASC;

-- Shortest tenure
SELECT TOP 1 emp_id, emp_name, hire_date
FROM employee_details
ORDER BY hire_date DESC;

12. Write a query to find employees whose phone number area codes match their state’s area codes (assuming a state_area_codes table).
Solution:

SELECT e.emp_id, e.emp_name, c.phone_number, a.state
FROM employee_details e
JOIN address_details a ON e.emp_id = a.emp_id
JOIN contact_details c ON e.emp_id = c.emp_id
WHERE LEFT(c.phone_number, 3) IN (
    SELECT area_code
    FROM state_area_codes
    WHERE state = a.state
);

13. Write a query to generate a report of total salary by state and city, sorted by state and total salary in descending order.
Solution:

SELECT a.state, a.city, SUM(e.emp_salary) AS total_salary
FROM employee_details e
JOIN address_details a ON e.emp_id = a.emp_id
GROUP BY a.state, a.city
ORDER BY a.state, total_salary DESC;

14. Write a query to update salaries by 10% for employees living in a specific state, e.g., "California."
Solution:

UPDATE employee_details
SET emp_salary = emp_salary * 1.10
WHERE emp_id IN (
    SELECT emp_id
    FROM address_details
    WHERE state = 'California'
);

15. Write a query to find employees who earn below the median salary in their state.
Solution:

WITH StateSalary AS (
    SELECT 
        a.state, 
        e.emp_id, 
        e.emp_salary,
        PERCENT_RANK() OVER (PARTITION BY a.state ORDER BY e.emp_salary) AS percentile_rank
    FROM 
        employee_details e
    JOIN 
        address_details a ON e.emp_id = a.emp_id
)
SELECT emp_id, emp_salary, state
FROM StateSalary
WHERE percentile_rank < 0.5;
