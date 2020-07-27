set pagesize 0 feedback off LINE 2000 echo off

spool EnableTrigger__1.sql

 
select 'alter trigger "'||owner||'".'||trigger_name||' enable;'
	from dba_triggers
		where status = 'DISABLED'
/

spool off
set pagesize 30 feedback on echo on
set  echo on
spool EnableTrigger__1.log
@EnableTrigger__1.sql
spool off
set  echo off
prompt
prompt
prompt ed EnableTrigger.sql     @ EnableTrigger.sql
prompt
prompt ed EnableTrigger__1.log
prompt
prompt
