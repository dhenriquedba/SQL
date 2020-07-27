-- MOSTRA TODOS OS PRIVILEGIOS DE UM DETERMINADO USUARIO OU ROLE

accept USER prompt 'Digite o username/role:'

set feedback off echo off pagesize 60

col grantee format a15
col table_name format a25
col privilege format a25

break on grantee on table_name

select grantee, null table_name, privilege
from dba_sys_privs
where grantee='&USER'
union all
select grantee, table_name, privilege
from dba_tab_privs
where grantee='&USER';

set feedback on