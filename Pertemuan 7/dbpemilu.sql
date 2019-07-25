-- Kelurahan
create or replace view vw_jumkel as
select 
    left(id,2) as idprop, 
    count(id) as kelurahan
from villages group by left(id,2);

-- Kecamatan
create or replace view vw_jumkec as
select 
    left(id,2) as idprop, 
    count(id) as kecamatan
from districts group by left(id,2);

-- Kabupaten
create or replace view vw_jumkabkota as
select 
    left(id,2) as idprop, 
    count(id) as kabkota
from regencies group by left(id,2);

-- Join Tables Provinsi
select
    a.idprop,
    a.kabkota,
    b.kecamatan,
    c.kelurahan
from vw_jumkabkota a
left join vw_jumkec b on a.idprop = b.idprop
left join vw_jumkel c on a.idprop = c.idprop;

-- Join Tables Kabupaten
select
    a.idprop,
    a.kabkota,
    b.kecamatan,
    coalesce(c.kelurahan,0) as kelurahan    
from vw_jumkabkota a
left join vw_jumkec b on a.idprop = b.idprop
left join vw_jumkel c on a.idprop = c.idprop;