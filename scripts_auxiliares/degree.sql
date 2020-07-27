select 'alter table '||owner||'.'||table_name||' parallel (degree '||degree||');'
from dba_tables
where owner not like 'SYS%'
and   degree > 1
/
