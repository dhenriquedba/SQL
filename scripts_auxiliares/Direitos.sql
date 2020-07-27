set echo off feedback off pages 0
spool ARR_ROLES__1.sql

prompt  spool __ARR_Roles.log

Select 'grant '||granted_role||' to '||grantee||';'
	From DBA_ROLE_PRIVS
/
Select 'grant '||privilege||' to '||grantee||';'
	From DBA_SYS_PRIVS
/
select 'Grant select on '||VIEW_NAME||' to ROLEARR;'
	from user_views
/
select 'Grant Select, Insert, Update, Delete on '||tname||' to ROLEARR;'
	from tab
/
select 'Grant execute on '||object_NAME||' to ROLEARR;'
	from user_objects
	where object_type in ('PROCEDURE', 'FUNCTION', 'PACKAGE')
	  and object_name not like '%$%'
/
prompt  spool off

spool off
prompt  @ ARR_ROLES__1.sql
set echo on feedback on pages 30