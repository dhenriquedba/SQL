set feedback off
select count(*) faltam from dba_tables where last_analyzed < trunc(sysdate)
/
select count(*) já_foram from dba_tables where last_analyzed >= trunc(sysdate)
/
set feedback on
prompt
prompt  Ed u       @u
prompt
