select 'create index enom.'||INDEX_NAME||' on enom.'|| table_name||'('||COLUMN_NAME||');'
from dba_ind_columns
where  TABLE_OWNER    = 'ENOM'
and table_name like '%STAGING'
/
