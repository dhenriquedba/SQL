set echo off feedback off pages 0 linesize 150

spool PartitionNologging_1.SQL
select 'alter table business.'||table_name||' modify  partition '||partition_name||' nologging;'
 from dba_tab_partitions where table_owner = 'BUSINESS';
spool off
spool PartitionNologging_1.Log
@ PartitionNologging_1.SQL
spool off

set echo off feedback on pages 30
Prompt
Prompt   Ed PartitionNologging.SQL		@ PartitionNologging.SQL
Prompt
Prompt
