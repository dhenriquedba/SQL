set pagesize 0 feedback off LINE 2000 echo off

spool RBSdrop__1.sql

select 'alter rollback segment '||segment_name||' offline;'
from dba_rollback_segs
	where segment_name not in ('LIXO','LIXO1', 'SYSTEM');

select 'drop rollback segment '||segment_name||';'
from dba_rollback_segs
	where segment_name not in ('LIXO','LIXO1', 'SYSTEM');


spool off
set pagesize 30 feedback on echo on
set  echo on
@RBSdrop__1.sql
set  echo off
prompt
prompt
prompt  Shrink TABLESPACE
prompt
prompt
prompt ed RBSdrop.sql     @ RBSdrop.sql      @ RBSnew      
prompt
