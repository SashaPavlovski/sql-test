--Q1
select * from Products

--Q2
--2. כתבו שאילתא ששולפת את המוצרים ששייכים לקטגוריה Condiments
select TBL1.ProductName, TBL2.CategoryName from Products TBL1 inner join Categories TBL2 on TBL1.CategoryID = TBL2.CategoryID where TBL2.CategoryName = 'Condiments'

--Q3
select TBL1.ProductName, TBL2.[Description] from Products TBL1 inner join Categories TBL2 on TBL1.CategoryID = TBL2.CategoryID where TBL2.[Description] like '%S%' and TBL2.[Description] like '%s%' order by TBL1.ProductName

--Q4
select TBL1.ProductName,TBL3.CustomerID from Products TBL1 inner join [Order Details] TBL2 on TBL1.ProductID = TBL2.ProductID inner join Orders TBL3 on TBL2.OrderID = TBL3.OrderID where Upper(TBL3.CustomerID) = 'ALFKI'

--Q5
select * from Orders where ShipCity = 'London' or ShipCountry = 'Brazil'

--Q6
select Customers.CompanyName, 
case
when Shippers.CompanyName = 'Federal Shipping' then  Shippers.CompanyName   
end
as CompanyName from Customers,Shippers

--Q7
alter Procedure NameAndPriceOrder
@numderOrder int 
as
begin
select TBL1.ProductName,TBL2.UnitPrice from Products TBL1 inner join [Order Details] TBL2 on TBL1.ProductID = TBL2.ProductID where TBL2.OrderID =  @numderOrder
end

exec NameAndPriceOrder @numderOrder = 10248


--Q8
select CustomerID, EmployeeID,ShipVia,Freight,ShipName,ShipAddress,ShipCity,ShipRegion,ShipPostalCode,ShipCountry from Orders
where CustomerID like 'B%' 
and ShipName like 'B%' 
and Freight > 8 
and ShipVia = 1 
and (EmployeeID = 2 or EmployeeID = 5)
and (ShipCountry = 'France' or ShipCountry = 'Sweden' or ShipCountry = 'Canada')

--Q9
select TBL1.*, TBL2.OrderDate,TBL2.EmployeeID,TBL2.CustomerID from  [Order Details] TBL1 inner join Orders TBL2 on TBL1.OrderID = TBL2.OrderID or TBL1.OrderID != TBL2.OrderID  
where TBL1.OrderID  = 10248 and CustomerID like 'VINET' order by UnitPrice,EmployeeID
--היה לי בעיה בטבלאות


--10
select CustomerID,Region,Country from Customers where Country = 'France' or Country = 'Canada'




