SET PAGESIZE 0 feedback off echo off verify off LINE 200
SPOOL fonte_&1..sql
SELECT 'rem Origem do código: '||global_name FROM global_name;
prompt Create or Replace
select text 
	from dba_source
		where upper(name) = upper('&1')
                  AND TYPE        = upper('procedure')
Order by line
/
prompt /
prompt show error
prompt Create or Replace
select text 
	from dba_source
		where upper(name) = upper('&1')
                  AND TYPE        = upper('package')
Order by line
/
prompt /
prompt show error
prompt Create or Replace
select text 
	from dba_source
		where upper(name) = upper('&1')
                  AND TYPE        = upper('package body')
Order by line
/
prompt /
prompt show error
SPOOL OFF
SET PAGESIZE 40 feedback on 
