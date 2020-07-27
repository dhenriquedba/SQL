set pagesize 0 feedback off LINE 2000

spool MoveSnapLog__1.sql
prompt spool MoveSnapLog__1.log

select 'drop snapshot log on '||master||';'||chr(10)
     ||'create snapshot log on '||master||' tablespace log01;'||chr(10)
from dba_snapshot_logs
/

prompt spool off
spool off
set pagesize 30 feedback on echo on
set  echo on
@MoveSnapLog__1.sql
set  echo off

Prompt
Prompt  Ed MoveSnapLog.sql              @ MoveSnapLog.sql
Prompt

