@login
set echo off feedback off pages 0 linesize 150
--create public synonym exceptions for ttcn212.exceptions;
--grant all on ttcn212.exceptions to public;
--TRUNCATE TABLE EXCEPTIONS;
--pause _OK_?
--delete EXCEPTIONS;

spool __enableconstbus_1.SQL
Select 'Alter table '||owner||'.'||table_name||' enable constraint '||
		constraint_name||' EXCEPTIONS INTO EXCEPTIONS;'
	from dba_constraints
	  Where status = 'DISABLED'
	    and owner = 'BUSINESS'
	    and table_name not like '%ACCT%' 
union
Select 'Alter table '||owner||'.'||table_name||' enable constraint '||
		constraint_name||' EXCEPTIONS INTO EXCEPTIONS;'
	from dba_constraints
	  Where status = 'DISABLED'
	    and owner = 'BUSINESS'
	    and table_name not like '%CUST%'
	order by 1;
spool off

spool enableconstbus.Log
select sysdate inicio from dual;
pause _OK_?
set echo on
@ __enableconstbus_1.SQL
set feedback on
select table_name, constraint, count(*) 
	from exceptions
	group by table_name, constraint;
set echo off
select sysdate termino from dual;
spool off

set echo off feedback on pages 30
Prompt
Prompt   Ed enableconstbus.SQL		@enableconstbus.SQL
Prompt
Prompt

