create database navin;
use navin

-- Create the `employee_details` table
CREATE TABLE employee_details (
    emp_id INT IDENTITY(1,1) PRIMARY KEY, -- Auto-increment primary key
    emp_name NVARCHAR(100) NOT NULL, -- Employee name
    emp_designation NVARCHAR(50), -- Employee designation
    emp_salary DECIMAL(10, 2) -- Employee salary
);

-- Create the `contact_details` table
CREATE TABLE contact_details (
    contact_id INT IDENTITY(1,1) PRIMARY KEY, -- Auto-increment primary key
    emp_id INT, -- Foreign key linking to employee_details
    phone_number NVARCHAR(15), -- Phone number
    email NVARCHAR(100), -- Email
    CONSTRAINT FK_Contact_Employee FOREIGN KEY (emp_id) 
        REFERENCES employee_details(emp_id) 
        ON DELETE CASCADE -- Deletes contact details if employee is deleted
);

-- Create the `address_details` table
CREATE TABLE address_details (
    address_id INT IDENTITY(1,1) PRIMARY KEY, -- Auto-increment primary key
    emp_id INT, -- Foreign key linking to employee_details
    street NVARCHAR(100), -- Street address
    city NVARCHAR(50), -- City
    state NVARCHAR(50), -- State
    zip_code NVARCHAR(10), -- ZIP code
    CONSTRAINT FK_Address_Employee FOREIGN KEY (emp_id) 
        REFERENCES employee_details(emp_id) 
        ON DELETE CASCADE -- Deletes address details if employee is deleted
);

-- Insert data into `employee_details`
INSERT INTO employee_details (emp_name, emp_designation, emp_salary)
VALUES 
('Alice Johnson', 'Software Engineer', 85000.00),
('Bob Smith', 'Project Manager', 95000.00),
('Charlie Brown', 'Data Analyst', 65000.00),
('Diana Prince', 'DevOps Engineer', 80000.00),
('Ethan Hunt', 'QA Tester', 55000.00),
('Fiona Shaw', 'UI/UX Designer', 70000.00),
('George Miller', 'Backend Developer', 78000.00),
('Hannah Lee', 'Frontend Developer', 72000.00),
('Ian Curtis', 'Scrum Master', 90000.00),
('Jessica Alba', 'HR Specialist', 60000.00),
('Kevin Hart', 'Product Owner', 92000.00),
('Liam Neeson', 'Business Analyst', 68000.00),
('Mona Lisa', 'Marketing Manager', 75000.00),
('Nathan Drake', 'System Administrator', 80000.00),
('Olivia Wilde', 'Cloud Engineer', 87000.00),
('Paul Atreides', 'AI Specialist', 94000.00),
('Quincy Jones', 'Cybersecurity Analyst', 81000.00),
('Rachel Green', 'Database Administrator', 83000.00),
('Steve Rogers', 'Network Engineer', 78000.00),
('Tina Fey', 'Content Strategist', 65000.00),
('Uma Thurman', 'Graphic Designer', 72000.00),
('Victor Hugo', 'Solutions Architect', 98000.00),
('Wanda Maximoff', 'Mobile Developer', 79000.00),
('Xander Cage', 'Game Developer', 86000.00),
('Yvonne Strahovski', 'Technical Writer', 62000.00),
('Zack Snyder', 'Video Editor', 68000.00),
('Aaron Paul', 'Full Stack Developer', 91000.00),
('Bella Swan', 'Social Media Manager', 63000.00),
('Cameron Diaz', 'SEO Specialist', 58000.00),
('Daniel Radcliffe', 'Support Engineer', 54000.00);

-- Insert data into `contact_details`
INSERT INTO contact_details (emp_id, phone_number, email)
VALUES 
(1, '555-0101', 'alice.johnson@example.com'),
(2, '555-0102', 'bob.smith@example.com'),
(3, '555-0103', 'charlie.brown@example.com'),
(4, '555-0104', 'diana.prince@example.com'),
(5, '555-0105', 'ethan.hunt@example.com'),
(6, '555-0106', 'fiona.shaw@example.com'),
(7, '555-0107', 'george.miller@example.com'),
(8, '555-0108', 'hannah.lee@example.com'),
(9, '555-0109', 'ian.curtis@example.com'),
(10, '555-0110', 'jessica.alba@example.com'),
(11, '555-0111', 'kevin.hart@example.com'),
(12, '555-0112', 'liam.neeson@example.com'),
(13, '555-0113', 'mona.lisa@example.com'),
(14, '555-0114', 'nathan.drake@example.com'),
(15, '555-0115', 'olivia.wilde@example.com'),
(16, '555-0116', 'paul.atreides@example.com'),
(17, '555-0117', 'quincy.jones@example.com'),
(18, '555-0118', 'rachel.green@example.com'),
(19, '555-0119', 'steve.rogers@example.com'),
(20, '555-0120', 'tina.fey@example.com'),
(21, '555-0121', 'uma.thurman@example.com'),
(22, '555-0122', 'victor.hugo@example.com'),
(23, '555-0123', 'wanda.maximoff@example.com'),
(24, '555-0124', 'xander.cage@example.com'),
(25, '555-0125', 'yvonne.strahovski@example.com'),
(26, '555-0126', 'zack.snyder@example.com'),
(27, '555-0127', 'aaron.paul@example.com'),
(28, '555-0128', 'bella.swan@example.com'),
(29, '555-0129', 'cameron.diaz@example.com'),
(30, '555-0130', 'daniel.radcliffe@example.com');

-- Insert data into `address_details`
INSERT INTO address_details (emp_id, street, city, state, zip_code)
VALUES 
(1, '123 Main St', 'New York', 'NY', '10001'),
(2, '456 Oak St', 'Los Angeles', 'CA', '90001'),
(3, '789 Pine St', 'Chicago', 'IL', '60601'),
(4, '321 Elm St', 'Houston', 'TX', '77001'),
(5, '654 Maple St', 'Phoenix', 'AZ', '85001'),
(6, '987 Cedar St', 'Philadelphia', 'PA', '19101'),
(7, '159 Walnut St', 'San Antonio', 'TX', '78201'),
(8, '753 Birch St', 'San Diego', 'CA', '92101'),
(9, '852 Cherry St', 'Dallas', 'TX', '75201'),
(10, '951 Poplar St', 'San Jose', 'CA', '95101'),
(11, '741 Aspen St', 'Austin', 'TX', '73301'),
(12, '369 Palm St', 'Jacksonville', 'FL', '32099'),
(13, '258 Redwood St', 'San Francisco', 'CA', '94101'),
(14, '147 Sequoia St', 'Columbus', 'OH', '43004'),
(15, '123 Spruce St', 'Indianapolis', 'IN', '46201'),
(16, '456 Dogwood St', 'Charlotte', 'NC', '28201'),
(17, '789 Magnolia St', 'Seattle', 'WA', '98101'),
(18, '321 Fir St', 'Denver', 'CO', '80014'),
(19, '654 Hemlock St', 'Boston', 'MA', '02101'),
(20, '987 Hawthorn St', 'El Paso', 'TX', '79901'),
(21, '159 Alder St', 'Detroit', 'MI', '48201'),
(22, '753 Juniper St', 'Nashville', 'TN', '37201'),
(23, '852 Cypress St', 'Memphis', 'TN', '38101'),
(24, '951 Willow St', 'Portland', 'OR', '97201'),
(25, '741 Beech St', 'Las Vegas', 'NV', '89101'),
(26, '369 Sycamore St', 'Baltimore', 'MD', '21201'),
(27, '258 Larch St', 'Milwaukee', 'WI', '53201'),
(28, '147 Pinecone St', 'Albuquerque', 'NM', '87101'),
(29, '123 Redwood Ln', 'Tucson', 'AZ', '85701'),
(30, '456 Birchwood Dr', 'Fresno', 'CA', '93650');

select * from employee_details;
select * from contact_details;
select * from address_details;

select * from contact_details where emp_id=5;
select * from employee_details where emp_salary >= 70000;

select employee_details.emp_name , c.phone_number  , c.email from employee_details 
join contact_details c on employee_details.emp_id = c.emp_id 
order by emp_name;

update address_details set city='san francisco' where emp_id=3;

delete from address_details where emp_id=5;
delete from contact_details where emp_id=5;
delete from employee_details where emp_id=5;

 select count(*) as total_employee from employee_details;

 select employee_details.emp_name,address_details.city from employee_details 
 join address_details on employee_details.emp_id = address_details.emp_id
 where address_details.city like 'S%';

 select top 1 
 employee_details.emp_id,employee_details.emp_name,employee_details.emp_salary
 from employee_details
 order by emp_salary desc;

 select avg(e.emp_salary) from employee_details e join address_details a on e.emp_id= a.emp_id
 where a.state='Texas';

 SELECT 
    e.emp_id, 
    e.emp_name, 
    c.phone_number
FROM 
    employee_details e
JOIN 
    contact_details c ON e.emp_id = c.emp_id
WHERE 
    c.phone_number LIKE '555%';

select a.state ,
count(e.emp_id) as total_employees from employee_details e 
join 
address_details a on e.emp_id = a.emp_id 
group by a.state;

--CREATE PROCEDURE GetEmployeeDetails
  --  @emp_id INT
--AS
--BEGIN
    SELECT 
        e.emp_id, 
        e.emp_name, 
        e.emp_designation, 
        e.emp_salary, 
        a.street, 
        a.city, 
        a.state, 
        a.zip_code, 
        c.phone_number, 
        c.email
    FROM 
        employee_details e
    LEFT JOIN 
        address_details a ON e.emp_id = a.emp_id
    LEFT JOIN 
        contact_details c ON e.emp_id = c.emp_id
   -- WHERE 
       -- e.emp_id = @emp_id;
--END;

 alter table contact_details add constraint UQ_Email unique(email);

 SELECT 
    e.emp_id, 
    e.emp_name
FROM 
    employee_details e
LEFT JOIN 
    contact_details c ON e.emp_id = c.emp_id
WHERE 
    c.emp_id IS NULL;

select e.emp_id,e.emp_name,a.state from employee_details e
join address_details a on e.emp_id = a.emp_id 
where 
a.city = (
select a1.city from employee_details e1 join address_details a1 on e1.emp_id = a1.emp_id 
where e1.emp_name = 'Alice Johnson'
);

SELECT 
    e1.emp_id, 
    e1.emp_name, 
    e1.emp_designation, 
    e1.emp_salary
FROM 
    employee_details e1
JOIN 
    address_details a1 ON e1.emp_id = a1.emp_id
WHERE 
    a1.city = (
        SELECT a2.city
        FROM employee_details e2
        JOIN address_details a2 ON e2.emp_id = a2.emp_id
        WHERE e2.emp_name = 'Alice Johnson'
    );

	SELECT 
    e.emp_id, 
    e.emp_name, 
    e.emp_salary, 
    a.city
FROM 
    employee_details e
JOIN 
    address_details a ON e.emp_id = a.emp_id
WHERE 
    e.emp_salary > 50000 AND a.city = 'New York';


	SELECT 
    a.city, 
    COUNT(e.emp_id) AS total_employees,
    CAST(COUNT(e.emp_id) * 100.0 / SUM(COUNT(e.emp_id)) OVER () AS DECIMAL(5, 2)) AS percentage
FROM 
    employee_details e
JOIN 
    address_details a ON e.emp_id = a.emp_id
GROUP BY 
    a.city;

	SELECT 
    emp_id, 
    emp_name, 
    emp_salary
FROM 
    employee_details
WHERE 
    emp_salary < (SELECT AVG(emp_salary) FROM employee_details);







