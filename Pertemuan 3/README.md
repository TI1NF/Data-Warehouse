# Review

- Buat database dbdw01
- Download dblatihan.sql dari eLen Data Warehouse
- Restore dblatihan.sql ke database dbdw01
- Cek table-table dalam database dbdw01

# Test Query
```
select * from Customer;

select FirstName, LastName, City from Customer;

select Id, FirstName, LastName, City, Country, Phone from Customer where Country = 'Sweden';

select CompanyName, ContactName, City, Country from Supplier order by CompanyName;

select CompanyName, ContactName, City, Country from Supplier order by CompanyName desc;

select Id, CompanyName, City, Country from Supplier where Country in ('USA', 'Japan', 'Germany') order by Country asc, CompanyName desc;

select distinct Country from Supplier order by Country;

select count(Id), Country from Customer group by Country having count(Id) > 10;

select count(Id), Country from Customer where Country <> 'USA' group by Country having count(Id) >= 9 order by count(Id) desc;

select avg(TotalAmount), FirstName, LastName from Orders O join Customer C on O.CustomerId = C.Id group by FirstName, LastName having avg(TotalAmount) between 1000 and 1200;

select count(C.Id) as TotalCustomers, C.Country as nation from Customer C group by C.Country;

select C.Id as Identifier, C.LastName + ', ' + C.FirstName as CustomerName, sum(O.TotalAmount) as TotalSpent from Orders O join Customer C on O.CustomerId = C.id group by C.id, C.LastName + ', ' + C.FirstName order by TotalSpent desc;
```
