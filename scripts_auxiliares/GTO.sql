column PRIVILEGE format a10
set pages 60 lines 120

select  grantee, privilege, table_name
from dba_tab_privs
  where grantee in ('BI02','TRANSFER')
order by 1,3,2
/


select grantee, privilege
from dba_sys_privs
 where grantee in ('BI02','TRANSFER')
order by 1
/

select grantee, granted_role
from dba_role_privs
  where grantee in ('BI02','TRANSFER')
order by 1
/
