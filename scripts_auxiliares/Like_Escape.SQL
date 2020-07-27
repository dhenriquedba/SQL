SET PAGESIZE 0 FEEDBACK OFF VERIFY OFF
SPOOL Analyze1.SQL

select 'Analyze Table '||owner||'.'||object_name||chr(10)
		||'compute statistics;' 
		from dba_objects
			where object_name like 'T§_%' escape '§'
			  and owner = 'SILOMS'
		Order by object_name;

SPOOL OFF
SET PAGESIZE 30 FEEDBACK ON
@Analyze1.sql
PROMPT
PROMPT
PROMPT
PROMPT   ed Analyze.sql        @Analyze.sql
PROMPT
