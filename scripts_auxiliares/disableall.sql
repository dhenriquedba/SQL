set echo off feedback off pages 0 linesize 150

spool disableall_1.sql
Select 'Alter table '||owner||'.'||table_name||' disable constraint '||constraint_name||';'
from dba_constraints
where constraint_type in ('R','U','P')
and owner in ('BUSINESS')
--			, 'MANTAS'
--			, 'KDD'
--			, 'KDD_WEB'
--			, 'KDD_ALG'
--			, 'KDD_MNR'
--			, 'MARKET'
--			, 'INGEST_USER'
--			, 'DB_UTIL_USER')
and status='ENABLED'
/
select 'alter trigger '||owner||'.'||trigger_name||' disable;'
	from dba_triggers
	where owner in ('BUSINESS')
--			, 'MANTAS'
--			, 'KDD'
--			, 'KDD_WEB'
--			, 'KDD_ALG'
--			, 'KDD_MNR'
--			, 'MARKET'
--			, 'INGEST_USER'
--			, 'DB_UTIL_USER')
	  and status = 'ENABLED'
/
spool off

spool disableall_1.log
@ disableall_1.sql
spool off

set echo off feedback on pages 30
Prompt
Prompt   Ed disableall		@ disableall
Prompt
Prompt
