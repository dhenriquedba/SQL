select 'A FAZER' STAT, count(1) QTDE
from dba_objects 
where object_name in (select index_name 
from dba_indexes where table_name = 'WIRE_TRXN') 
and LAST_DDL_TIME < sysdate
UNION ALL
select 'FEITO' STAT, count(1) QTDE
from dba_objects 
where object_name in (select index_name 
from dba_indexes where table_name = 'WIRE_TRXN') 
and LAST_DDL_TIME > sysdate-1
/


