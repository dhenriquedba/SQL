column name format a50
column value format a20
set lines 100
select name, value, isdefault, description
from v$parameter
where name like '%&parametro%'
order by name
/
