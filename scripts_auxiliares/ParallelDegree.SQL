set pagesize 0 feedback off LINE 2000 echo off
accept degree prompt 'New Degree: '
--spool RestoreParallelDegree__05apr2005.sql
spool ParallelDegree__1.sql

-- select 'alter table '||owner||'.'||table_name||' parallel (degree '||degree||');' 
select 'alter table '||owner||'.'||table_name||' parallel (degree &degree);'
from dba_tables
where owner not like 'SYS%'
and   degree > 1
/

-- select 'alter index '||owner||'.'||index_name||' parallel (degree '||degree||');' 
select 'alter index '||owner||'.'||index_name||' parallel (degree &degree);'
from dba_indexes
where owner not like 'SYS%'
and   degree > 1
/


spool off
set pagesize 30 feedback on echo on
set  echo on
spool ParallelDegree__1.log
@ParallelDegree__1.sql
spool off
set  echo off
prompt
prompt
prompt ed ParallelDegree     @ ParallelDegree.sql
prompt
