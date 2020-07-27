@login
set echo off feedback off pages 0 linesize 150


spool __ModifyDefaultPartition_1.SQL

select 'alter table '||d.owner||'.'||d.table_name||' modify default attributes tablespace '||p.tablespace_name||';'
from  DBA_PART_TABLES d, dba_tab_partitions p
 where d.owner not in ('SYS','SYSTEM')
   and d.table_name= p.table_name	
union
select 'alter index '||p.index_owner||'.'||d.index_name||' modify default attributes tablespace '||p.tablespace_name||';'
from  DBA_PART_indexes d, dba_ind_partitions p
 where d.owner not in ('SYS','SYSTEM')
   and d.index_name= p.index_name	
order by 1
/
spool off

spool ModifyDefaultPartition.Log
select sysdate inicio from dual;
set echo on time on timing on
@ __ModifyDefaultPartition_1.SQL
set feedback on

set echo off time off timing off
select sysdate termino from dual;
spool off

set echo off feedback on pages 30
Prompt
Prompt   Ed ModifyDefaultPartition.SQL		@ ModifyDefaultPartition.sql
Prompt
Prompt

