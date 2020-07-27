select sum(bytes)/1024/1024
  from dba_extents
 where segment_name = 'PS_PROD_ITEM';

SUM(BYTES)/1024/1024
--------------------
                 209



select sum(bytes)/1024/1024
from dba_extents
 where segment_name in (select index_name from dba_indexes where table_name =  'PS_PROD_ITEM')
/
