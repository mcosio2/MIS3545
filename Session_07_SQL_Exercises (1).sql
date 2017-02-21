USE AdventureWorks2012; /*Set current database*/

/*1, Display the total amount collected from the orders for each order date. */
/* Table: Sales.SalesOrderHeader*/
select orderdate, sum (totaldue) as TotalDue 
from Sales.SalesOrderHeader
group by OrderDate
order by OrderDate DESC; 


/*2, Display the total amount collected from selling the products, 774 and 777. */
/* Table: Sales.SalesOrderDetail*/
select ProductID, sum(LineTotal) as Total, max(unitprice) as MaxUnitPrice
from Sales.SalesOrderDetail
where ProductID= 744 or ProductID =777
group by ProductID;

/*3, Write a query to display the sales person BusinessEntityID, last name and first name of all the sales persons and the name of the territory to which they belong.*/
select PP.BusinessEntityID, PP.LastName, PP.FirstName, ST.Name
from Person.Person as PP inner join Sales.SalesPerson as SP on PP.BusinessEntityID = SP.BusinessEntityID full outer join Sales.SalesTerritory as ST on ST.TerritoryID = SP.TerritoryID

/*4,  Write a query to display the Business Entities of the customers that have the 'Vista' credit card.*/
/* Tables: Sales.CreditCard, Sales.PersonCreditCard, Person.Person*/
select distinct CC.CreditCardID, PCC.businessentityID, CardType
from Sales.CreditCard as CC join sales.PersonCreditCard as PCC on CC.creditcardID= PCC.CreditCardID join person.Person as PP on PCC.businessentityID= PP.businessentityID 
where CardType= 'vista'; 

/*Show the number of customers for each type of credit cards*/
select Cardtype, COUNT(creditcardID) as Customer_Number 
from sales.CreditCard
group by CardType


/*5, Write a query to display ALL the country region codes along with their corresponding territory IDs*/
/* tables: Sales.SalesTerritory,  Person.CountryRegion*/
select p.name, t.TerritoryID, p.CountryRegionCode
from person.countryregion as P left join sales.salesterritory as T 
on t.CountryRegionCode = p.CountryRegionCode
where t.territoryID is null; 

/*6, Find out the average of the total dues of all the orders.*/
/* tables: Sales.SalesOrderHeader*/
select AVG (TotalDue) as Average_TotalDue
from Sales.SalesOrderHeader;

/*7, Write a query to report the sales order ID of those orders where the total due is greater than the average of the total dues of all the orders*/
select salesorderID, TotalDue
from Sales.SalesOrderHeader
where totalDue > 
(select AVG (TotalDue) as Average_TotalDue
from Sales.SalesOrderHeader)
order by Totaldue;

