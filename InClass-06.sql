use AdventureWorks2012;

/*Activity 1. Using the HumanResource.Employee table, provide a count of the number of employees by job title.  The query should consider only current employees (the CurrentFlag must equal 1).  */
select JobTitle, count(businessentityID) as Number 
from HumanResources.Employee
where CurrentFlag = 1
group by JobTitle
order by count(BusinessEntityID) desc;

/*Activity 2. Modify the query you created in Activity 1 so that the output shows only those job titles for which there is more than 1 employee.  */
select JobTitle, count(businessentityID) as Number 
from HumanResources.Employee
where CurrentFlag = 1
group by JobTitle
having count (BusinessEntityID) >1 
order by count(BusinessEntityID) desc;


/*Activity 3. For each product, show its ProductID and Name (FROM the ProductionProduct table) and the location of its inventory (FROM the Product.Location table) and amount of inventory held at that location (FROM the Production.ProductInventory table).*/
select p.ProductID, l.LocationID,
p.name,
l.name,
i.quantity
from  Production.Product as p Inner Join Production.productinventory as i on p.ProductID=i.ProductID join production.location as l on i.LocationID= l.LocationID; 


/*Activity 4. Find the product model IDs that have no product associated with them.  
To do this, first do an outer join between the Production.Product table and the Production.ProductModel table in such a way that the ID FROM the ProductModel table always shows, even if there is no product associate with it.  
Then, add a WHERE clause to specify that the ProductID IS NULL 
*/
select pm.ProductModelID, p.ProductID
from Production.Product as p right outer join Production.ProductModel as pm on p.ProductModelID = pm.ProductModelID
where p.ProductID is null 


