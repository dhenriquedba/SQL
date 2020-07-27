set long 25 lines 120 pages 240
Spool __RelatPartitions.txt
select table_owner, table_name, partition_name, high_value
from dba_tab_partitions
 where table_owner not in ('SYS', 'SYSTEM')
order by 1,2,3
/
spool off
Prompt 
Prompt Ed PartitionsRetrieve.sql    @ PartitionsRetrieve.sql
Prompt 
