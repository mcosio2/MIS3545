USE AdventureWorks2012; /*Set current database*/

/*1. Show card type and number of customers for each type of credit cards.*/
/* Tables: Sales.CreditCard, Sales.PersonCreditCard*/
select Cardtype, COUNT(creditcardID) as Customer_Number 
from sales.CreditCard 
group by CardType;

/*2. Show the product ID, product name, and list price for each product where the list price is higher than the average standard cost for all products. */
/* Table: Production.Product*/
select ProductID, name, ListPrice 
from Production.Product as pp
where ListPrice > (select AVG (StandardCost) as Average_StandardCost
from Production.Product)
order by ProductID;


/*3. Show the product category name, subcategory name, product name, and product ID for all products that belong to a category and subcategory. These should be sorted alphabetically by category name, within category by subcategory name, and within subcategory by product name. Note: your result set should produce a total of 295 rows. */
/* Tables: Production.Product, Production.ProductSubcategory, Production.ProductCategory*/
select pp.Name, pc.Name, ps.name
from production.Product as pp join Production.ProductSubcategory as ps on pp.ProductSubcategoryID=ps.ProductSubcategoryID full outer join Production.ProductCategory as pc on ps.ProductCategoryID= pc.ProductCategoryID
order by Category_Name, Sub_Name, Product_Name asc;

/*4. Modify the query above (query 3) so that it includes only those products that do not belong to a category or subcategory. Note: your result set should produce a total of 209 rows. */
select pp.Name, pc.Name, ps.name
from production.Product as pp join Production.ProductSubcategory as ps on pp.ProductSubcategoryID=ps.ProductSubcategoryID full outer join Production.ProductCategory as pc on ps.ProductCategoryID= pc.ProductCategoryID
where pc.ProductCategoryID is Null or ps.ProductSubcategory	ID is Null;