select COLUMN_NAME, NUM_DISTINCT,NUM_NULLS,LAST_ANALYZED,AVG_COL_LEN
from dba_tab_columns
where table_name = '&TABLE'
order by 1
/
