@login
set echo off feedback off pages 0 linesize 150


spool __UnsusableIndexes_1.SQL
select 'alter index '||owner||'.'||index_name||' rebuild parallel 8 ;'  ----  nologging
  from dba_indexes
	where owner in ('SYSADM')
	and status = 'UNUSABLE'
union
select 'alter index '||index_owner||'.'||index_name||' rebuild partition '||partition_name||' parallel 8;'   -- nologging
  from dba_ind_partitions 
	where index_owner in ('SYSADM')
	and status = 'UNUSABLE'
/
spool off

spool UnsusableIndexes.Log
select sysdate inicio from dual;
set echo on time on timing on
@ __UnsusableIndexes_1.SQL
set feedback on

set echo off time off timing off
select sysdate termino from dual;
spool off

set echo off feedback on pages 30
Prompt
Prompt   Ed UnusableIndexes.SQL		@ UnusableIndexes.sql
Prompt
Prompt

