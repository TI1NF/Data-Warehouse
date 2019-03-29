-- Join Table: 2 Table

select OrderNumber, TotalAmount, FirstName, LastName, City, Country 
from Customer join Orders 
on Orders.CustomerId = Customer.Id;

-- Join table: 3 table
-- list all orders with product names, quantities, and prices

select o.OrderNumber, convert(o.OrderDate, date) as Date, p.ProductName, i.Quantity, i.UnitPrice 
from Orders o 
join OrderItem i on o.Id = i.OrderID
join Product p on p.Id = i.ProductId
order by o.OrderNumber;

-- Left Join
-- list all customers, whether they place any order or not

select OrderNumber, TotalAmount, FirstName, LastName, City, Country
from Customer c 
left join Orders o on o.CustomerId = c.Id
order by TotalAmount;

-- Right Join
-- list customers that have not placed orders

select TotalAmount, FirstName, LastName, City, Country
from Orders o
right join Customer c on o.CustomerId = c.Id
where TotalAmount is null;

-- Self Join
-- list customers that are from the same city and country

select 
a.FirstName as FirstName1, a.LastName as LastName1, 
b.FirstName as FirstName2, b.LastName as LastName2,
a.City, a.Country
from Customer a, Customer b
where a.Id <> b.Id and a.City = b.City
and a.Country = b.Country order by a.Country;

-- Union Join
-- list all contact, i.e, supplier and customers

select 'Customer' as Type, 
	concat(FirstName, ' ', LastName) as ContactName, City, Country, Phone 
from Customer
union
select 'Supplier' as Type, 
	ContactName, City, Country, Phone 
from Supplier;

-- Sub Query
-- list products with order quantities greater than 100

select ProductName from Product
where Id in (select ProductId from OrderItem
where Quantity > 100);

-- Where ANY
-- list products were sold by the unit (i.e. quantity = 1)

select ProductName from Product
where Id = any(select ProductId from OrderItem where Quantity = 1);

-- Where All
-- list customers who placed orders that are larger than the average of each customers order

select distinct concat(FirstName, ' ', LastName) as CustomerName 
from Customer, Orders
where Customer.Id = Orders.CustomerId and TotalAmount > all
(select avg(TotalAmount) from Orders group by CustomerId);

-- Where Exist
-- find supplier with products over $100

select CompanyName from Supplier where exists
(select ProductName from Product where SupplierId = Supplier.Id and UnitPrice > 100);

-- Select Into
-- copy all suppliers from USA to a new SupplierUSA table

create table SupplierUSA select * from Supplier where Country = 'USA';
select * from SupplierUSA;