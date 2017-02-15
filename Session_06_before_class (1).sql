use AdventureWorks2012;

/*Find out all the customers from Sales.Customer table.*/
Select *
From Sales.Customer;

/*Find out all the sales orders from Sales.SalesOrderHeader table.*/
select *
from Sales.SalesOrderHeader;

/*Find out sales details about productID 843*/
select *
from Sales.SalesOrderDetail
where ProductID = 843 or ProductID = 844 or ProductID = 845;

/*Sales info of all the products of which unit price is between 100 and 200*/
select *
from Sales.SalesOrderDetail
where UnitPrice between 100 and 200;

/*All the store names*/
select name
from Sales.Store;

/*Find out store names that contain "Bike" */
select name 
from Sales.store 
where name like '%bikes%'; 

/*info of all the credit cards*/
select *
from Sales.CreditCard;

/* A list of credit card types*/
select distinct CardType
from sales.CreditCard;

