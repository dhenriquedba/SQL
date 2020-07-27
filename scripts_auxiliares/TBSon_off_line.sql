select 'alter tablespace '||tablespace_name||' offline;'
from dba_tablespaces;

select 'alter tablespace '||tablespace_name||' online;'
from dba_tablespaces;
