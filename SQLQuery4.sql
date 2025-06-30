        --This statement is used to switch to a particular database
use MyDatabase
SELECT * FROM customers;
SELECT * FROM orders;
SELECT first_name, country,score from customers;
SELECT * from customers where score>500;
select * from customers where score<>0;
select * from customers where country='USA';
SELECT * FROM CUSTOMERS ORDER BY score;
SELECT * FROM CUSTOMERS ORDER BY score asc;
SELECT * FROM CUSTOMERS ORDER BY score desc;
select * from customers order by score desc,country asc;
select COUNTRY, SUM(SCORE) AS SCORE from customers group by country;
select country, count(*) as Country_Count,sum(score) as total from customers where score>400 group by country having sum(score)>750;
select country,avg(score) as average from customers where score<>0 group by country having avg(score)>430;
select distinct country from customers;
select top 3 score from customers order by score asc;
select top 3 score from customers order by score desc;
select * from orders;
select top 2 * from orders order by order_date desc;





--Creating table--
/*create table person_detais(
 id INT NOT NULL,
 person_name varchar(50) NOT NULL,
 birth_date DATE,
 phone varchar(15) NOT NULL,
 CONSTRAINT pk_person PRIMARY KEY (id)
)*/
--select * from person_detais;
ALTER TABLE person_details add email varchar(50) not null;
--select * from person_details;
alter table person_details drop column phone;
--drop table person_detais

use MyDatabase
select * from customers;
select * from orders;

insert into customers(id,first_name,country,score)values(6,'Siri','India',500);
select * from customers;
insert into customers(id,first_name,country,score)values(7,'Mani','India',1000);

insert into customers values(8,'Nagu','India',700);

/*
create table persons(
id INT NOT NULL,
person_name varchar(50) NOT NULL,
birth_date DATE ,
phone varchar(20) NOT NULL
)

INSERT INTO persons(id,person_name,birth_date,phone)
SELECT
id,
first_name,
NULL,
'Unknown'
from customers

*/

SELECT * 
FROM sys.tables 
WHERE name = 'Details';




SELECT DB_NAME() AS CurrentDatabase;


SELECT 
    TABLE_SCHEMA, 
    TABLE_NAME
FROM 
    INFORMATION_SCHEMA.TABLES
WHERE 
    TABLE_TYPE = 'BASE TABLE'
ORDER BY 
    TABLE_NAME;


select * from Details;

update customers set score=0 where id=6;
select * from customers;
select * from customers where id=6;
update customers set
score=0,country='India' where id=1;

select * from customers where id=1;

select * from customers where score IS NULL;

Delete from customers where id>5

Truncate table Details;
select * from customers;
--comparison operators
select * from customers where country='India';
select * from customers where country<>'India';
select * from customers where country!='India';
update customers set score=500 where country='India';
select * from customers where score>400;
select * from customers where score>=500;
select * from customers where score<600;
select * from customers where score<=500;
--logical operators
select * from customers where score>=500 and country='India';
select * from customers where score>500 or country='India';
select * from customers where NOT country= 'India';

--RANGE operator
select * from customers where score BETWEEN 500 AND 750;

--MEMBERSHIP OPERATOR
select * from customers where country in('India','UK');
select * from customers where country not in('India','UK');

--search operator
select * from customers where country LIKE 'I%';
select * from customers where first_name Like '%a';
select * from customers where first_name Like '%i%';
select * from customers where country Like '___i%';

--Combining the tables 
  --JOINS(columns)
  --SET(rows)
--NO JOIN
select * from customers;
select * from orders;
--INNER JOIN

select id,first_name,order_id,sales from customers c INNER  JOIN orders o
ON  c.id=o.customer_id;

--LEFT
select id,first_name,order_id,sales from customers c LEFT JOIN orders o
ON  c.id=o.customer_id;
--RIGHT
select id,first_name,order_id,sales from customers c RIGHT  JOIN orders o
ON  c.id=o.customer_id;
--FULL OUTER JOIN/ FULL JOIN
select id,first_name,order_id,sales from customers c FULL OUTER JOIN orders o
ON  c.id=o.customer_id;

--LEFT ANTI JOIN
select * from customers c
LEFT JOIN
orders o ON
c.id=o.customer_id
where o.customer_id is null

--RIGHT ANTI JOIN
select * from customers c
RIGHT JOIN 
orders o ON
o.customer_id=c.id
where c.id is null

--ALTERNATIVE RIGHT ANTI JOIN
select * from orders o
LEFT JOIN
customers c ON
c.id=o.customer_id
where c.id is null
--full anti join

select * from customers c
FULL OUTER JOIN 
orders o ON c.id=o.customer_id
where c.id is null or o.customer_id is null

--cross join

select * from customers 
CROSS JOIN orders 

use SalesDB;
select * from Sales.Orders;
select OrderID,Sales from Sales.Orders;
select o.OrderID, o.Sales from Sales.Orders o;

select * from Sales.Employees;
select * from Sales.Customers;
select * from Sales.OrdersArchive;
select * from Sales.Products;
select * from Sales.Orders;

select 
    o.OrderID,
    o.Sales,
    c.FirstName AS Customer_FirstName, 
    c.LastName AS Customer_LastName,
    p.ProductID,
    p.Product AS ProductName,
    e.FirstName AS Employee_FirstName,
    e.LastName AS Employee_LastName
from Sales.Orders o 
LEFT JOIN 
Sales.Customers c ON 
c.CustomerID=o.CustomerID
LEFT JOIN
Sales.Products p ON
o.ProductID=p.ProductID
LEFT JOIN 
Sales.Employees e ON
o.SalesPersonID=e.EmployeeID

--SET OPERATOR(Combining multiple queries make it single result
select FirstName,LastName from Sales.Customers
UNION
select FirstName,LastName from Sales.Employees

select FirstName,LastName from Sales.Customers
UNION ALL
select FirstName,LastName from Sales.Employees

select FirstName,LastName from Sales.Customers
EXCEPT
select FirstName,LastName from Sales.Employees

select FirstName,LastName from Sales.Employees
EXCEPT
select FirstName,LastName from Sales.Customers

select FirstName,LastName from Sales.Customers
INTERSECT
select FirstName,LastName from Sales.Employees

select * from Sales.Orders
UNION
select * from Sales.OrdersArchive
select concat(FirstName,' ', LastName) as Full_Name from Sales.Customers
select lower(FirstName) as First_Name from Sales.customers;
select upper(FirstName) as First_Name from Sales.customers;

use MyDatabase;
--Trim
select len(first_name) as Length from customers;
select trim(first_name) from customers;
select len(trim(first_name)) as Length_Trimmed from customers;

select '123-456-7890' as phone,
REPLACE('123-456-7890','-','') AS clean_phone

--LEN
select LEN(first_name) as First_Name from customers;

--LEFT(),RIGHT()
select LEFT(first_name,5) from customers;
select RIGHT(first_name,3) from customers;
select substring(first_name,1,4) from customers;

select 3.516, ROUND(3.516,2);

--DATE AND TIME
select GETDATE() Today;

select YEAR('2025-06-27 12:34:56.0000000') Year;
select MONTH('2025-06-27 12:34:56.0000000') MONTH;
select DAY('2025-06-27 12:34:56.0000000') DAY;
select DATEPART(YY,'2025-08-20') Datepart;
select DATEPART(hour,'2025-06-27 12:34:56.0000000') Hour;
select DATEPART(quarter,'2025-06-27 12:34:56.0000000') quarter;
select DATEPART(week,'2025-06-27 12:34:56.0000000') Week;
select DATEname(YY,'2025-08-20') Datename;
select DATEname(mm,'2025-08-20') Datename;
select DATEname(WEEKDAY,'2025-08-20') Datename;
select DATETRUNC(hour,'2025-06-27 12:34:56') trunc;
select DATETRUNC(MINUTE,'2025-06-27 12:34:56') trunc;
select DATETRUNC(Year,'2025-06-27 12:34:56') trunc;
select DATETRUNC(mm,'2025-06-27 12:34:56') trunc;
select DATEname(week,'2025-06-27 12:34:56.0000000') Week;
select EOMONTH('2025-06-27 12:34:56.0000000') eo;
select cast(DATETRUNC(month,'2025-06-27 12:35:34') as DATE) startofmonth

use SalesDB;
select * from Sales.Orders;
select Year(OrderDate),COUNT(*) NrofOrders from Sales.Orders 
Group By Year(OrderDate);

select Datename(mm,OrderDate),COUNT(*) NrofOrders from Sales.Orders 
Group By Datename(mm,OrderDate);

select cast('123' as INT) as convertedInt;
select cast(123.45 as INT) as roundedint;
select cast(GETDATE() AS DATE) AS onlydate;

select
OrderID,
CreationTime,
Format(CreationTime,'MM-dd-yyyy'),
Format(CreationTime, 'dd ddd mmm')+' '+'Q' +DATENAME(quarter,CreationTime)+' '+ Format(CreationTime,'yyyy hh:mm:ss tt'),
Format(CreationTime,'dd'),
Format(CreationTime,'ddd'),
Format(CreationTime,'dddd'),
Format(CreationTime,'MM'),
Format(CreationTime,'MMM'),
Format(CreationTime,'MMMM')
from
Sales.Orders;

select CAST(CreationTime AS DATETIME2) from Sales.Orders;
select CONVERT(INT,'1234') as convertedint;

select DATEADD(day,7,GETDATE()) AS Nextweek;
select DATEADD(month,-1,GETDATE()) as previous;
select DATEADD(year,2,'2024-01-01') as futureyear;

select DATEDIFF(month,'2024-01-01','2025-06-29') as monthdiff;

select ISDATE(GETDATE()) as valid;

SELECT COALESCE(NULL, NULL,'Hello') AS ans;

select coalesce(NULL,NULL,'SQL','python');

Select ISNULL(NULL,'Default');

select NULLIF(10,20);
select NULLIF(10,5);
select * from Sales.Customers where LastName IS NULL;
select * from Sales.Customers;

Select FirstName,
  CASE
    WHEN score>750 THEN 'Good'
    WHEN score>500 THEN 'Average'
   ELSE 'Bad'
   END AS SCORE_VALUE
FROM Sales.Customers;

select LastName,
    CASE   
        WHEN score<300 THEN 'Bad'
        WHEN score>750 Then 'good'
      else 'Waste'
    END AS Score_Card
from Sales.Customers;

--Aggregate 
select count(*) From Sales.Customers;
select sum(score) as total from Sales.Customers;
select avg(score) as average from Sales.Customers;
select max(score),min(score) from Sales.Customers;



SELECT * FROM active_users;

DRoP VIEW IF EXISTS active_users;
GO

CREATE VIEW active_users AS
SELECT * FROM Sales.Customers WHERE score > 500;
GO

SELECT * FROM active_users;

select * from Sales.Customers;


