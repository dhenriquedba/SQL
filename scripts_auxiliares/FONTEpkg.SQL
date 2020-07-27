SET PAGESIZE 0 feedback off echo off verify off LINE 200
SPOOL fonte_&1..sql
prompt Create or Replace
select text 
	from user_source
		where upper(name) = upper('&1')
                  AND TYPE        = upper('package')
Order by line
/
prompt /
prompt show error
prompt Create or Replace
select text 
	from user_source
		where upper(name) = upper('&1')
                  AND TYPE        = upper('package body')
Order by line
/
prompt /
prompt show error
SPOOL OFF
SET PAGESIZE 40 feedback on 
prompt
prompt
prompt ed fontePKG   @ fontePKG
prompt
prompt ed fonte_&1..sql
prompt
prompt @ fonte_&1..sql
prompt
prompt 

