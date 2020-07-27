set pagesize 0 feedback off LINE 2000 echo off

spool ValidateConst__1.sql

select 'alter table '||table_name||' modify constraint '||constraint_name||' validate;'
	from user_constraints
		where VALIDATED <> 'VALIDATED'
/

spool off
set pagesize 30 feedback on echo on
set  echo on
spool ValidateConst__1.log
@ValidateConst__1.sql
spool off
set  echo off
@enableconst

prompt
prompt
prompt ed ValidateConst     @ ValidateConst
prompt
prompt ed ValidateConst__1.log  @enableconst
prompt
prompt
