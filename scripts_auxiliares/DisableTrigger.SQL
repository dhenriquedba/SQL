set pagesize 0 feedback off LINE 2000 echo off

spool DisableTrigger__1.sql

 
select 'alter trigger "'||owner||'".'||trigger_name||' disable;'
	from dba_triggers
	where 
--owner in ('CRIADOR',
--			'DBSNMP',
--			'DBAMON',
--			'CRIADOR',
--			'F579211',
--			'OUTLN',
--			'SPOTLIGHT',
--			'TOAD',
--			'SQLIMP')
--	  and 
status = 'ENABLED'
/

spool off
set pagesize 30 feedback on echo on
set  echo on
spool DisableTrigger__1.log
@DisableTrigger__1.sql
spool off
set  echo off
prompt
prompt
prompt ed DisableTrigger.sql     @ DisableTrigger.sql
prompt
prompt ed DisableTrigger__1.log
prompt
prompt
