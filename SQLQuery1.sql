CREATE DATABASE Shrey;    --database created
USE Shrey;    --using database

--primary key uniquely ideantifies each record in a table
--foreign key is used to prevent actions that would destroy links between tables

CREATE table persons(PersonID int not null,
FirstName varchar(255) unique not null,
LastName varchar(255) not null,
Address varchar(255) not null,
City Varchar(255) not null,
number int,
primary key(PersonID));  --table created

SELECT * FROM persons;    --selected table 

INSERT INTO persons(PersonID,FirstName,LastName,Address,City,number)    --use for inserting values in the database
VALUES('1','Luffy','Monkey','Foosha Village','EastBlue','121');


INSERT INTO persons(PersonID,FirstName,LastName,Address,City,number)    --use for inserting many values in the database
VALUES('2','Zoro','Rorona','Shimotsuki village','EastBlue','232'),
('3','Brook','Haha','brook island','WestBlue','365'),
('4','Sanji','Cook','Momoria Island','NorthBlue','257');


SELECT FirstName, PersonID from persons;  --select statements
Select firstname from persons;

SELECT DISTINCT firstname from persons;   --distinct used to return different values from the table

Select FirstName,LastName,City,Address,number from persons where Address is null;    --to get the null value
Select FirstName,LastName,City,Address,number from persons where Address is not null;    --to get the not null value

update persons set FirstName='Kaido',city='wano',Address='Wano Castle' where PersonID=3; --to update the row of table

delete from persons where FirstName='Kaido';  --to delete row
--delete from persons    this delete all the rows
--drop table person   this will drop the entire table

insert into persons(PersonID,FirstName,LastName,Address,City,number)
values('5','Brook','Haha','Brook Vilage','North Blue','737');

--clauses
Select Top 3 * from persons;  --top clause will only select top three rows from table

--Select * FROM persons order by FirstName desc fetch first 2 rows only;

--aggregate functions min(),max(),count(),sum(),avg()
select min(number) as value,FirstName from persons group by FirstName;   --to select min value
select max(number) from persons;   --to select max value

select count(*) from persons;  --returns the number of person that matches the criterion
--(*) is use to find total number of rows in the table using count()
select count(FirstName) from persons;   --use for a specify column
select count(personID) from persons where number>150;  --using where
select count(DISTINCT FirstName) from persons;   --to remove duplicates
select count(*) as [Number of Records] from persons;  
select count(*) as [Number of Records],FirstName from persons group by firstname;

--sum() returns the total sum of numeric columns
select sum(number) from persons;
select sum(number) from persons where firstname='luffy';
select sum(number) as total from persons;
select firstname, sum(number) as [Total Quantity] from persons group by firstname;  --to return each quantity 
select sum(number * 10) from persons;   --with expression
select firstname, sum(number * 10) as [Total Quantity] from persons group by firstname;  --to return each quantity 

--avg() returns the average value of numeric column
select avg(number) from persons;
select avg(number) from persons where firstname='luffy';
select avg(number) as [Avg Price] from persons;
select * from persons where number>(select avg(number) from persons);   --this is done to list higher price than average
select avg(number) as averageprice, firstname from persons group by firstname;

--like() like operator is use in where clause to search a specified pattern in column
--% sign represents zero,one or multiple characters
-- _ sign representsone , single character

select * from persons where firstname like'l%';
select * from persons where firstname like'%ff%';  
select * from persons where firstname like'_uffy';  

--in() in operator allows you to specify values in where clause
select * from persons where firstname in('luffy','zoro');   --includes value
select * from persons where firstname not in('luffy','zoro');   --dont include specified values

--between() between operator selects value within given range
select * from persons where number between 200 and 300;
select * from persons where number not between 200 and 300;
select * from persons where number between 200 and 300 and PersonID in (1,2,3); --within this personid only value will be given

--as aliases  are used to give a table or column of table temproray name
Select Firstname as name from persons;
select firstname, address+','+city as address from persons;  --used to combine two columns


--joins
create table orders(orderid int primary key,
PersonID int,
order_date date,
amount int,
FOREIGN key(PersonID) references persons);

select * from orders;

insert into orders(orderid,PersonID,order_date,amount)
values('1','1','2020-12-19','101010'),
('2','2','2024-07-21','23232'),
('3','4','2002-04-23','323010'),
('4','5','2017-07-04','826836');

select orders.orderid,persons.FirstName,orders.order_date from orders 
INNER JOIN persons on orders.PersonID=persons.personID;

--join or innerjoin will result the same result

--left join returns all keywords from the left table and matching one from the right table
select persons.FirstName,orders.orderid from persons
LEFT JOIN orders on persons.PersonID=orders.PersonID
order by persons.FirstName;   

select persons.lastname,orders.order_date from persons
LEFT JOIN orders on persons.personID=orders.PersonID
order by persons.firstname;

--right join return all keyword from the right table first and matching one from the left table
select orders.orderid,persons.FirstName,persons.LastName from orders
RIGHT JOIN persons on orders.PersonID=persons.PersonID
order by orders.orderid

select orders.order_date,persons.address,persons.City from orders
RIGHT JOIN persons on orders.PersonID=persons.PersonID
order by orders.order_date;

--full outer join returns all the record when there is a match in left and right table
select persons.FirstName,orders.amount from persons
full outer join orders on persons.PersonID=orders.PersonID
order by persons.FirstName;

select persons.LastName,orders.orderid from persons
full outer join orders on persons.personID=orders.PersonID
order by persons.LastName;

--union operator is used to combine the result set of two or more select statments
select personID from persons
union
select PersonID from orders
order by personID;

select personID from orders
union
select personID from persons
order by PersonID;

--group by group the rows in sql
select count(PersonID),lastname from persons group by LastName; 
select count(amount), order_date from orders group by order_date;

select persons.firstname, count(orders.orderid) as numberoforders from orders 
left join persons on orders.PersonID=persons.PersonID
group by FirstName;

select persons.LastName, count(amount) as amountoforders from orders
right join persons on orders.PersonID=persons.personID
group by LastName;

--having-having clause was added to sql because where keyword cannopt be used with aggregate functions
select count(PersonID), FirstName from persons group by FirstName having count(PersonID)>1;
select count(amount), order_date from orders group by order_date having count(amount)>2000;

select persons.FirstName,count(orders.orderid) as NumberofOrders
from(orders
INNER JOIN persons on orders.PersonID=persons.PersonID)
group by FirstName
having count(orders.orderid)>1;

--any and all operator allows you to perform a comparison between a single column value and a range of othe values.
select personID from persons where personID = any (select PersonID from orders where orderid > 1);

--select data copies data from one table into a new table
select * INTO FirstName from persons;




