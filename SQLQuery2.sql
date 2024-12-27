use shrey;

create table employee1(empid int primary key ,
name varchar(255) not null,
);

insert into employee1(empid,name)
values('23','shrey'),
('19','luffy'),
('5','zoro'),
('4','brook'),
('34','sanji'),
('22','franky'),
('77','jimbei'),
('27','chopper'),
('85','nami'),
('39','robin'),
('87','ussop');

select * from employee1;

create table employee2(empid int,
empname varchar(255) primary key not null,
empemail varchar(255) not null,
empaddress varchar(255) not null,
empdesignation varchar(255) not null
FOREIGN key(empid) references employee1
); 

insert into employee2(empid,empname,empemail,empaddress,empdesignation)
values('23','shrey','shrey@gmail.com','colaba','full stack developer'),
('19','zoro','zoro@gmail.com','shimoshika','pirate hunter'),
('5','luffy','luffy@gmail.com','foosho village','yonko'),
('4','sanji','sanji@gmail.com','north blue','cook'),
('34','ussop','usop@gmail.com','syrup village','shooter'),
('22','nami','nami@gmail.com','orange village','navigator'),
('77','jimbei','jimbei@gmail.com','fish man island','cheif'),
('27','brook','brook@gmail.com','west blue country','singer'),
('85','robin','robin@gmail.com','ohara','investigator'),
('39','chopper','chopper@gmail.com','snowy drum island','doctor'),
('87','franky','franky@gmail.com','south blue','shipwright');

select * from employee2;

--join
select employee2.empname,employee1.name,employee2.empemail from employee2
INNER JOIN employee1 on employee1.empid=employee2.empid;

--left join
select employee1.name,employee2.empdesignation from employee1
LEFT JOIN employee2 on employee1.empid = employee2.empid
order by employee1.name;

--rightjoin
select employee2.empdesignation,employee1.name,employee2.empemail from employee2
RIGHT JOIN employee1 on employee1.empid = employee2.empid
order by employee2.empdesignation;

select employee1.name,employee2.empaddress from employee1
FULL OUTER JOIN employee2 on employee1.empid = employee2.empid
order by employee1.name;




drop table employee2;
drop table employee1;

create table employee1( name varchar(255) primary key not null);

create table employee2(empid int IDENTITY(1,1) primary key not null,
name varchar(255) not null,
empemail varchar(255) not null,
empaddress varchar(255) not null,
empdesignation varchar(255) not null
FOREIGN key(name) references employee1);

insert into employee1(name)
values('shrey'),
('luffy'),
('zoro'),
('brook'),
('sanji'),
('franky'),
('jimbei'),
('chopper'),
('nami'),
('robin'),
('ussop');

select * from employee1;

insert into employee2(name,empemail,empaddress,empdesignation)
values('shrey','shrey@gmail.com','colaba','full stack developer'),
('luffy','luffy@gmail.com','foosho village','yonko'),
('zoro','zoro@gmail.com','shimoshika','pirate hunter'),
('brook','brook@gmail.com','west blue country','singer'),
('sanji','sanji@gmail.com','north blue','cook'),
('franky','franky@gmail.com','south blue','shipwright'),
('jimbei','jimbei@gmail.com','fish man island','cheif'),
('chopper','chopper@gmail.com','snowy drum island','doctor'),
('nami','nami@gmail.com','orange village','navigator'),
('robin','robin@gmail.com','ohara','investigator'),
('ussop','usop@gmail.com','syrup village','shooter');

select * from employee2;

alter table employee1 add number int;
alter table employee1 drop column number;

alter table employee2 add number int;

EXEC sp_rename 'employee2.number', 'empnumber', 'column';  --for rename of the column it is used

select * from employee2;

alter table employee2 drop column empnumber;
alter table employee2 add empnumber int;

update employee2 set empnumber='1234567891' where empid='1';
update employee2 set empnumber='1452683793' where empid='2';
update employee2 set empnumber='71722' where empid='3';
update employee2 set empnumber='3233232' where empid='4';
update employee2 set empnumber='8272828' where empid='5';
update employee2 set empnumber='2323232' where empid='6';
update employee2 set empnumber='67646456' where empid='7';
update employee2 set empnumber='45436753' where empid='8';
update employee2 set empnumber='56463556' where empid='9';
update employee2 set empnumber='64664764' where empid='10';
update employee2 set empnumber='94378478' where empid='11';

--join
select employee2.empaddress,employee1.name,employee2.empemail from employee2
INNER JOIN employee1 on employee1.name=employee2.name;

--left join
select employee1.name,employee2.empdesignation from employee1
LEFT JOIN employee2 on employee1.name = employee2.name
order by employee1.name;

--rigth join 
select employee2.empemail,employee1.name,employee2.empaddress from employee2
RIGHT JOIN employee1 on employee1.name=employee2.name
order by employee2.name;

--full outer join
select employee1.name,employee2.empaddress from employee1
FULL OUTER JOIN employee2 on employee1.name = employee2.name
order by employee1.name;

--union  used to combine the select statements
select name from employee1
union
select name from employee2
order by name;

drop table employee2;
drop table employee1;

create table employee(empID int identity(1,1) primary key,
FirstName varchar(255) not null,
LastName varchar(255) not null);

create table ContactDetails(empDetailedID int identity(1,1) primary key not null,
empID int foreign key(empID) references employee(empID),
empNumber int not null ,
empEmail varchar(255) not null,
empAddress varchar(255) not null,
empDesignation varchar(255) not null,
);

select * from employee;
select * from ContactDetails;

insert into employee(FirstName,LastName)
values('Shreyank','Koli'),
('Monkey D','Luffy'),
('Rorona','Zoro'),
('BlackLeg','Sanji'),
('TonyTony','Chopper'),
('Super','Franky'),
('Kamado','Tanjiro'),
('Sahil','Jadhav'),
('Amogh','Talekar'),
('Omkar','Kale');

DECLARE @empID int = scope_identity();

insert into ContactDetails(empID,empemail,empAddress,empDesignation,empNumber)
values('1','shreyank@gmail.com','Colaba','developer','4'),
('2','luffy@gmail.com','foosho village','yonko','4'),
('3','zoro@gmail.com','Shimosika','pirate hunter','5'),
('4','sanji@gmail.com','north blue','chef','2'),
('5','chopper@gmail.com','snowy drum island','doctor','4'),
('6','franky@gmail.com','ennies','shipwrighter','3'),
('7','tanjiro@gmail.com','Kimetsu','Swordsman','4'),
('8','sahil@gmail.com','fort','tester','5'),
('9','amogh@gmail.com','cuffparade','intern','2'),
('10','Omkar@gmail.com','Parel','operations','4');

select * from ContactDetails;

--join
select employee.empID,employee.FirstName,ContactDetails.empDesignation from employee
join ContactDetails on employee.empID=ContactDetails.empID
order by employee.empID;

--left join 
select employee.FirstName,ContactDetails.empDetailedID,employee.LastName from employee
left join ContactDetails on employee.empID=ContactDetails.empID
order by employee.FirstName;

--rigth join
select ContactDetails.empEmail,employee.FirstName,ContactDetails.empNumber from ContactDetails
RIGHT JOIN employee on employee.empID=ContactDetails.empID
order by ContactDetails.empDetailedID;

--full outer join
select employee.FirstName,employee.LastName,ContactDetails.empEmail,concat(FirstName,' ',LastName) as Name
from employee
Full outer join ContactDetails on employee.empID=ContactDetails.empID
order by FirstName;




