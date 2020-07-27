SET PAGESIZE 0 feedback off echo OFF verify off line 2000

SPOOL Sinonimos__1.sql
prompt Set echo on
Select 'Create public Synonym '||object_name||' for '||owner||'.'||object_name||';'
   from dba_objects
      where owner in ('SAPXXI')
        and object_name not like '%$%'
	and (object_type in ('TABLE', 'VIEW', 'PROCEDURE', 'FUNCTION', 'PACKAGE', 
	    'SEQUENCE')
--		or (object_name in (select tabela from sys.estrutfisica@desmtr))
	)
	  		Order by Object_name
/
prompt Set echo off
SPOOL OFF
spool sinonimos__1.log
SET PAGESIZE 40 feedback on 
@ Sinonimos__1
SPOOL OFF
prompt
prompt
prompt @ Sinonimos             ed Sinonimos
prompt
