set pagesize 0 feedback off LINE 2000 echo off

spool RBSencolhe__1.sql

--select 'alter rollback segment '||segment_name||' storage (maxextents unlimited);'
select 'alter rollback segment '||segment_name||' shrink to 4m;'
from dba_rollback_segs;

--select 'alter database datafile'||chr(10)||
--             ' '''||file_name||''' resize '||Round(bytes*.95,0)||';'
--from dba_data_files

spool off
set pagesize 30 feedback on echo on
set  echo on
spool RBSencolhe__1.log
@RBSencolhe__1.sql
spool off
set  echo off
prompt
prompt
prompt ed RBSencolhe.sql     @ RBSencolhe.sql
prompt
