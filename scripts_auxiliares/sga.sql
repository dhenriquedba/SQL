column name format a40
column "Gb" format a40
show parameter sga
show parameter pool
show parameter pga
show parameter log_b
show parameter db_ca
select name, to_char(value/1024/1024/1024) "Gb"
from v$parameter where name in ('sga_max_size','pga_aggregate_target')
union
select name, value
from v$parameter where name in ('lock_sga','pre_page_sga')
/
