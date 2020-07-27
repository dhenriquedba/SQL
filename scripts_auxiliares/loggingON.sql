@login
set pages 0 lines 200 feedback off
Spool logging__1.sql
select  'alter table '||owner||'.'||table_name||' logging;'
 from dba_tables
 where nvl(logging,'NO') <> 'YES'
   and PARTITIONED <> 'YES'
union
select  'alter table '||table_owner||'.'||table_name||' partition '||partition_name||' logging;'
 from dba_tab_partitions
 where nvl(logging,'NO') <> 'YES'
union
select  'alter index '||owner||'.'||index_name||' logging;'
 from dba_indexes
 where nvl(logging,'NO') <> 'YES'
   and PARTITIONED <> 'YES'
union
select  'alter index '||index_owner||'.'||index_name||' partition '||partition_name||' logging;'
 from dba_ind_partitions
 where nvl(logging,'NO') <> 'YES'
/
set pages 30 lines 90 feedback on
spool off
spool logging__1.log
--@logging__1.sql
spool off

prompt  
prompt   Ed loggingON	@loggingON
prompt  

