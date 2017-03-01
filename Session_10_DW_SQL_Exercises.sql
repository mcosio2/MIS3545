use AdventureWorksDW2012;

/*Employees whose birthday is in Feburary*/
select *
from DimEmployee
where month (BirthDate)= 2;

/*who are the Sales Representatives whose birthday is in Feburary?*/
select *
from DimEmployee
Where month (BirthDate)=2
and Title = 'sales representative';

/*List all the sales processed by these Sales Representatives */
select LastName, rs.*
from DimEmployee as d join FactResellerSales as rs on d.EmployeeKey= rs.EmployeeKey
Where month (BirthDate)=2
and Title = 'sales representative';

/*who is a better sales representative that was born in Feburary?*/
select LastName, COUNT(salesordernumber)
from DimEmployee as d join FactResellerSales as rs on d.EmployeeKey= rs.EmployeeKey
Where month (BirthDate)=2
and Title = 'sales representative'
group by LastName;

/*total Amount of off-line sales in Massachusetts*/
select sum(rs.SalesAmount) as Total_Sales_Amount, g.StateProvinceName
from FactResellerSales as rs join DimGeography as g on rs.salesterritorykey= g.salesterritorykey
where StateProvinceName= 'Massachusetts'
group by StateProvinceName;

/*Total Amount of Internet Sales in 1st quarter each year in each country*/
select SalesTerritoryCountry, sum(salesorderlinenumber) as SumTotal_Amount_InternetSales, COUNT(SalesOrderLineNumber) as CountTotal_Amount_InternetSales
from FactInternetSales as s full join dimsalesterritory as st on s.salesterritorykey=st.salesterritorykey full join dimgeography as g on st.salesterritorykey= g.salesterritorykey
where MONTH(s.OrderDate) = 1 or MONTH(s.orderdate)= 2 or month(s.OrderDate) = 3 or MONTH(s.orderdate) =4
group by salesterritorycountry;

