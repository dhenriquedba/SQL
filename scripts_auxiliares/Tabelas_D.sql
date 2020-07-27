select table_name || ','
from dba_tables
where table_name like 'D_%'
and owner in ('EDIF_LOAD_AUX_2')
/
