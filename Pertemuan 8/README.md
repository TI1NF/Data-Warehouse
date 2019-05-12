# ETL

- Menggabungkan kolom berikut querynya :
```
select id,concat(firstname,' ', lastname) as nama_lengkap,city from customer limit 10;
```
- Mengganti data NULL dengan sesuatu berikut querynya :
```
select id,companyname, coalesce(contacttitle, '-') as contacttitle from supplier limit 10;
```
- Menambah kolom price_category dengan ketentuan berikut querynya :
```
select *, 
  case 
    when unitprice <= 50 then 'murah'
    when unitprice > 100 then 'mahal'
    else 'sedang'
end as price_category 
from product limit 10;
```