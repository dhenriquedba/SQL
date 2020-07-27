Spool  PrivRoles.doc
set echo on pagesize 50
Select GRANTED_ROLE, GRANTEE from dba_role_privs
	where GRANTEE like 'TRA%'
	order by 1
/
Select PRIVILEGE, GRANTEE from dba_sys_privs
	where GRANTEE like 'TRA%'
	order by 1
/
Select PRIVILEGE, TABLE_NAME, GRANTEE from dba_tab_privs
	where GRANTEE like 'TRA%'
	order by 1,2
/
Select GRANTED_ROLE, ROLE from ROLE_role_privs
	where ROLE like 'TRA%'
	order by 1
/
Select PRIVILEGE, ROLE from ROLE_sys_privs
	where ROLE like 'TRA%'
	order by 1
/
Select PRIVILEGE, TABLE_NAME, ROLE from ROLE_tab_privs
	where ROLE like 'TRA%'
	order by 1,2
/
spool off
set echo off pagesize 30
prompt
prompt
prompt  ed PrivRoles.SQL     @ PrivRoles.SQL
prompt
prompt
