create database Intern;
use Intern;


drop database Intern;

create table Department(Dept_id int auto_increment primary key,Dept_name varchar(20));

insert into Department(Dept_name)
values ("IT"),
       ("HR"),
       ("Civil");
       
insert into Department (Dept_name) values("Mechnical"),("HM");
       
select * from Department;

create table Roles(Role_id int auto_increment primary key,Role_name varchar(20));

insert into Roles (Role_name)
values ("Admin"),
       ("Manager"),
       ("Team-Leader"),
       ("Employee");
       
select * from Roles;


create table Users(
User_id int auto_increment primary key,
First_name varchar(20),
Last_name varchar(20),
Email varchar(100),
Phone varchar(11),
Join_date date,
Dept_id int,
Role_id int,
foreign key (Dept_id) references Department(Dept_id),
foreign key (Role_id) references Roles(Role_id)
);

insert into Users (First_name,Last_name,Email,Phone,Join_date,Dept_id,Role_id)
values ("Saniya","More","saniyamore@gmail.com",8574965652,'2025-4-25',1,2),
       ("Kim",'Rudra','kimrudra@gmail.com',8546971253,'2025-1-2',2,1),
       ("Asif",'Khan','Khan@gmail.com',88794561231,current_date(),3,4);
       
insert into Users (User_id,First_name,Last_name,Email,Phone,Join_date,Dept_id,Role_id)
values(4,"Rahul",'Sawant',"SawantRahul@gmail.com",9653207892,'2020-6-26',2,4);

select * from Users;
       
create table Performance(
Performance_id int auto_increment primary key,
User_id int,
Review_date date,
Feedback text,
Rating int,
check(Rating between 1 and 10),
foreign key (User_id) references Users(User_id)
);

insert into Performance (User_id,Review_date,Feedback,Rating)
values(1,'2025-6-26',"Very Good",7),
      (2,'2025-4-1','Can Better',3),
      (3,'2026-6-25',"Very Good",9);

create table Task(
Task_id int auto_increment primary key,
Task_name varchar(100) not null,
Assigned_by int,
Assigned_to int,
Due_date date,
Status varchar(20) default "Pending",
foreign key (Assigned_by) references Users(User_id),
foreign key (Assigned_to) references Users(User_id)
);

insert into Task (Task_name,Assigned_by,Assigned_to,Due_date)
values ("Prepare Monthly Payroll Report",2,1,'2025-12-24'),
       ("Update Employee Records",1,2,'2025-6-25'),
       ("Conduct Performance Review",3,2,'2026-1-2'),
       ("Organize Traning Session",1,4,'2026-3-12');
       
select * from Task;

create table Leaves(
Leave_id int auto_increment primary key,
User_id int,
Leave_type varchar(20),
Start_date date,
End_date date,
Status varchar(20) default "Pending",
foreign key (User_id) references Users(User_id)
);

insert into Leaves (User_id,Leave_type,Start_date,End_date,Status)
values(2,'Sick Leave','2025-9-26','2025-10-2','Approved'),
      (3,'Casual Leave','2025-10-2','2025-10-3',"Not Approved"),
      (4,'Work From Home','2025-12-25','2026-3-2','Approved');

insert into Leaves (User_id,Leave_type,Start_date,End_date)
values(5,'Sick Leave','2025-9-26','2025-10-2');

select * from  Leaves;
