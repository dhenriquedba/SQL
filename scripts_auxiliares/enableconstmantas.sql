@login
set echo off feedback off pages 0 linesize 150
--create public synonym exceptions for ttcn212.exceptions;
--grant all on ttcn212.exceptions to public;
--TRUNCATE TABLE EXCEPTIONS;
--pause _OK_?
--delete EXCEPTIONS;

spool __enableconstmantas_1.SQL
Select 'Alter table '||owner||'.'||table_name||' enable constraint '||
		constraint_name||' EXCEPTIONS INTO EXCEPTIONS;'
--		constraint_name||';'
	from dba_constraints
	  Where status = 'DISABLED'
	    and owner = 'MANTAS'
	order by owner, table_name;
spool off

spool enableconstmantas.Log
select sysdate inicio from dual;
set echo on
@ __enableconstmantas_1.SQL
set feedback on
select table_name, constraint, count(*) 
	from exceptions
	group by table_name, constraint;
set echo off
select sysdate termino from dual;
spool off

set echo off feedback on pages 30
Prompt
Prompt   Ed enableconstmantas.SQL		@ enableconstmantas.SQL
Prompt
Prompt

