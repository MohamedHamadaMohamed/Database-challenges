use company;

CREATE TABLE Employees
(
emp_id int primary key,
name varchar(30),
salary decimal(10,2) ,
);
ALTER TABLE Employees
ADD Department varchar(50);

ALTER TABLE Employees
drop COLUMN salary;

EXEC sp_rename 'Employees.Department' ,'DeptName' , 'COLUMN';

CREATE TABLE Projects
(
ProjectID int primary key,
ProjectName varchar(50) ,
);
ALTER TABLE Projects
ADD CONSTRAINT ID_PK primary key(ProjectID)  

ALTER TABLE Employees
ADD  project_id int ,
CONSTRAINT project_id_FK foreign key(project_id)
references Projects(ProjectID); 

ALTER TABLE Employees
drop CONSTRAINT project_id_FK;

ALTER TABLE Employees
ADD constraint UQ unique(name);

CREATE TABLE Customers
(
CustomerID int primary key ,
FirstName varchar(30),
LastName varchar(30),
Email varchar(30),
Status varchar(10)
);

alter table Customers
ADD constraint Fname_UQ unique(LastName),
constraint Lname_UQ unique(FirstName)

alter table Customers
add constraint status_defaut default 'Active' for Status; 

create table Orders
(
OrderID int primary key,
CustomerID int,
OrderDate  date,
TotalAmount decimal(10,2),
);

alter table Orders
add check(TotalAmount > 0) 

create schema Sales;
alter schema Sales transfer dbo.Orders;

EXEC sp_rename 'Sales.Orders' ,'Sales.SalesOrders' ;

