SET PAGESIZE 0 feedback off echo off verify off LINE 200
SPOOL fonte_&1..sql
prompt Create or Replace
select text 
	from dba_source
		where upper(name) = upper('&1')
		  AND owner       = upper('siloms')
                  AND TYPE        = upper('package body')
Order by line
/
prompt /
prompt show error
SPOOL OFF
SET PAGESIZE 40 feedback on 
prompt
prompt
prompt ed fonte   @ fonte
prompt
prompt ed fonte_&1..sql
prompt
prompt @ fonte_&1..sql
prompt
prompt se "Site Priority" nao esqueca de incuir:
prompt 
prompt ,
prompt 	  -- Alterado por Odécio/Nobuo - Unisys / Janeiro 2000
prompt         site_name
prompt 
prompt 

