set echo off feedback off pages 0 linesize 150

spool enableall_1.sql
Select 'Alter table '||owner||'.'||table_name||' enable constraint '||constraint_name||';'
from dba_constraints
where owner in ('BUSINESS'
			, 'MANTAS'
			, 'KDD'
			, 'KDD_WEB'
			, 'KDD_ALG'
			, 'KDD_MNR'
			, 'MARKET'
			, 'INGEST_USER'
			, 'DB_UTIL_USER')
and status='DISABLED'
/
select 'alter trigger '||owner||'.'||trigger_name||' enable;'
	from dba_triggers
         where status='DISABLED'
/
spool off

spool enableall_1.log
@ enableall_1.sql
spool off

set echo off feedback on pages 30
Prompt
Prompt   Ed enableall		@ enableall
Prompt
Prompt

