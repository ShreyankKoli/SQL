create database employee;
use employee;

create table EmployeeDetails(EmployeeId int identity(1,1) primary key not null,
FirstName varchar(255) not null unique,
LastName varchar(255) not null);

alter table EmployeeDetails ADD FullName as concat(FirstName,' ',LastName);

select * from EmployeeDetails;

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

create table EmployeeContact(EmployeeId int foreign key(EmployeeID) references EmployeeDetails(EmployeeId),
EmployeeContactId int Identity(1,1) Primary key not null,
EmployeeEmail varchar(255) not null,
EmployeePhone int not null,
EmployeeMobile int not null);

insert into EmployeeContact(EmployeeId,EmployeeEmail,EmployeePhone,EmployeeMobile)
values('1','shreyank@gmail.com','2223432','70450'),
('2','luffy@gmail.com','7282722','74030'),
('3','zoro@gmail.com','9247367','93214'),
('4','Tanjiro@gmail.com','2222222','05781'),
('5','Chopper@gmail.com','2345675','99874'),
('6','Shinchan@gmail.com','9878976','33412'),
('7','Sanji@gmail.com','5364735','99308'),
('8','Shamit@gmail.com','2225363','19405'),
('9','Sahil@gmail.com','7836779','99304'),
('10','Amogh@gmail.com','1435673','81423'),
('11','Bear@gmail.com','6667878','78964'),
('12','Lewis@gmail.com','9989893','78695'),
('13','Charles@gmail.com','7364736','46734'),
('14','Mukesh@gmail.com','9083384','87987'),
('15','ChotaDon@gmail.com','6469992','99898');

select * from EmployeeContact;

create table EmployeeAddress(EmployeeID int foreign key(EmployeeId) references EmployeeDetails(EmployeeId),
EmployeeAddressId int identity(1,1) primary key not null,
Addressline1 varchar(255) not null,
AddressLine2 varchar(255) not null,
AddressCity varchar(255) not null,
AddressState varchar(255) not null,
AddressZipCode int not null);

insert into EmployeeAddress(EmployeeId,Addressline1,AddressLine2,AddressCity,AddressState,AddressZipCode)
values('1','Colaba','Koliwada','Mumbai','Maharashtra','400005'),
('2','Fosho','Village','East Blue','Red Line','127266'),
('3','Shimosika','village','East Blue','Red Line','126767'),
('4','Kimetsu','Yo Naiba','Kimetsu','DemonSlayer','123456'),
('5','Snow','Drum','Island','West Blue','643742'),
('6','Kasukabe','Town','Tokyo','Japan','263726'),
('7','Vismoke','Family','north blue','red line','400005'),
('8','Sandhurts Road','Dongri','Mumbai','Maharashtra','411232'),
('9','Calicut Street','Fort','Mumbai','Maharashtra','400001'),
('10','Talekar','Alibaugh','Alibaugh','Maharashtra','401235'),
('11','Patna','Bihar','Bihar','utar Pradesh','549893'),
('12','Buterfly beach','Koliwada','South Goa','Goa','346782'),
('13','Ferrari town','Ferrari village','Dubai','Dubai','122323'),
('14','Antiquity','Peddar Road','Mumbai','Maharashtra','400012'),
('15','AzadNagar','Gully1','Kashmir','Jammu&Kashmir','726372');

select * from EmployeeAddress;

create table EmployeeRole(EmployeeId int foreign key(EmployeeID) references EmployeeDetails(EmployeeId),
EmployeeNumber int identity(100,1) Primary Key not null,
EmployeeDesignation varchar(255) not null,
EmployeeJoiningDate date,
EmployeeType varchar(255) not null); 

insert into EmployeeRole(EmployeeId,EmployeeDesignation,EmployeeJoiningDate,EmployeeType)
values('1','Full Stack Developer','2024-12-02','intern'),
('2','yonko','2023-08-07','FullTime'),
('3','Pirate Hunter','2001-01-23','FullTime'),
('4','Demon Slayer','2021-04-12','PartTime'),
('5','Doctor','2004-10-22','PartTime'),
('6','operations','2012-05-30','intern'),
('7','cook','2002-07-09','FullTime'),
('8','HR','2022-04-16','FullTime'),
('9','Marketing','2023-10-26','PartTime'),
('10','software Engineer','2024-12-10','intern'),
('11','traveller','2014-08-19','FullTime'),
('12','Driver','2015-12-16','FullTime'),
('13','Mern Stack Developer','2019-11-22','PartTime'),
('14','Web Developer','2024-02-02','FullTime'),
('15','Python Developer','2020-03-26','intern');

select * from EmployeeRole;

select EmployeeDetails.EmployeeId,EmployeeDetails.FirstName,EmployeeRole.EmployeeDesignation from EmployeeDetails
inner join EmployeeRole on EmployeeDetails.EmployeeId=EmployeeRole.EmployeeId
order by FirstName;
