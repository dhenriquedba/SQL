 select object_name, object_type,  last_ddl_time
from dba_objects
where last_ddl_time >= sysdate-1
and owner not in ('SYS','PERFSTAT')
/
