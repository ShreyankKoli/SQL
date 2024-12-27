create database practice;
use practice;

create table EmployeeDetails(EmployeeId int identity(1,1) constraint PK_EmployeeDetails_EmployeeId Primary Key Not null,
FirstName varchar(255) unique not null,
LastName varchar(255) unique not null);

create table EmployeeContacts(ContactId int identity(100,1) constraint PK_EmployeeContacts Primary key not null,
EmployeeEmail varchar(255) not null,
EmployeeMobile varchar(255) not null,
EmployeePhone varchar(255) not null,
EmployeeId int constraint FK_EmployeeContacts_EmployeeId_EmployeeDetails_EmployeeId foreign key(EmployeeId) references EmployeeDetails(EmployeeId));

create table EmployeeAddress(AddressId int identity(1000,10) constraint PK_EmployeeAddress Primary Key not null,
EmployeeAddress1 varchar(255) not null,
EmployeeAddress2 varchar(255) not null,
EmployeeCity varchar(255) not null,
EmployeeState varchar(255) not null,
EmployeePinCode int not null,
EmployeeId int constraint FK_EmployeeAddress_EmployeeId_EmployeeDetails_EmployeeId foreign key(EmployeeId) references EmployeeDetails(EmployeeId));

insert into EmployeeDetails(FirstName,LastName)
values('Shreyank','Koli'),
('Monkey D','Luffy'),
('Roronao','Zoro'),
('Kamado','Tanjiro'),
('Tony Tony','Chopper'),
('Shinchan','Muwahara'),
('Blackleg','Sanji'),
('Shamit','Phophale'),
('Sahil','Jadhav'),
('Amogh','Talekar'),
('Bear','Grylls'),
('Lewis','Hamilton'),
('Charles','Ferrari'),
('Mukesh','Ambani'),
('Chota','Don');

insert into EmployeeContacts(EmployeeEmail,EmployeeMobile,EmployeePhone,EmployeeId)
values('shrey@gmail.com','9930481423','2233445566','1'),
('luffy@gmail.com','7384726398','9838373636','2'),
('zoro@gmail.com','7346758723','9856783456','3'),
('tanjiro@gmail.com','9867852345','9876543212','4'),
('chopper@gmail.com','8989765434','7766554433','5'),
('shinchan@gmail.com','7465736457','3322445544','6'),
('sanji@gmail.com','6578493847','8877668877','7'),
('shamit@gmail.com','7564738475','9900998877','8'),
('sahil@gmail.com','9900667788','7766887766','9'),
('amogh@gmail.com','9987433412','8800550077','10'),
('bear@gmail.com','9321405781','6677557755','11'),
('lewis@gmail.com','7045074030','7700550044','12'),
('charles@gmail.com','8679856743','2233556688','13'),
('mukesh@gmail.com','9876789098','5544332222','14'),
('chota@gmail.com','8989767658','2222227788','15');

insert into EmployeeAddress(EmployeeAddress1,EmployeeAddress2,EmployeeCity,EmployeeState,EmployeePinCode,EmployeeId)
values('colaba','koliwada','mumbai','maharashtra','400005','1'),
('worli','gaav','mumbai','maharashtra','400225','2'),
('chennai','mainstreet','super kings','chennai','788998','3'),
('ulhasnagar','kalyan','thane','maharashtra','453235','4'),
('andheri','Chakala','mumbai','maharashtra','411127','5'),
('kolad','revdanda','Alibaug','maharashtra','400106','6'),
('mallStreet','jammu','Jammu','jammu-kashmir','786476','7'),
('Patna','Bihar','Bihar','utar Pradesh','549893','8'),
('Buterfly beach','Koliwada','South Goa','Goa','346782','9'),
('redline','one piece','laughtale','world','000001','10'),
('jannat','building','gawa','seher','56473','11'),
('jungle','king','rain forest','mufasa','345267','12'),
('kashi','vrindawan','gokola','uttar pradesh','281121','13'),
('karachi','town','karachi','pakistan','500004','14'),
('devaghari','kokan','raigad','maharashtra','765746','15');

alter table EmployeeDetails ADD FullName as Concat(FirstName,' ',LastName);

select * from EmployeeDetails;
select * from EmployeeContacts;
select * from EmployeeAddress;

select distinct firstname from EmployeeDetails;  --used to return unique values from table

select FirstName from EmployeeDetails where LastName is null;
select FirstName from EmployeeDetails where LastName is not null;

update EmployeeDetails set FirstName='Kallu',LastName='Pirate' where EmployeeId=15;  --to update the row

select * from EmployeeAddress where EmployeeAddress1 like 'wo%';

EXEC sp_rename 'EmployeeContacts.ContactId','EmployeeContactId','column'; --to change column name

select EmployeeId id, FirstName fname, LastName lname from EmployeeDetails

select * from EmployeeDetails e 
	join EmployeeContacts c on e.EmployeeId = c.EmployeeId 
	join EmployeeAddress a on e.EmployeeId = a.EmployeeId;

select min(EmployeePhone) as value,EmployeeEmail from EmployeeContacts group by EmployeeEmail;
select max(EmployeeMobile) from EmployeeContacts;

select count(FirstName) from EmployeeDetails;
select count(*) as [Number of Records],Firstname from EmployeeDetails group by Firstname;
select * from EmployeeDetails

--select EmployeeMobile, sum(EmployeePhone) [total qyantity] from EmployeeContacts group by EmployeeMobile;

select e.FirstName ef, ec.EmployeeMobile em,ea.EmployeeAddress1 from EmployeeDetails e
left join EmployeeContacts ec on e.EmployeeId = ec.EmployeeId
join EmployeeAddress ea on ea.EmployeeId = e.EmployeeId
order by FirstName;


