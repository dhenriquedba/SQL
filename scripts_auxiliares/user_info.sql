

col username  format a15
col "default ts"   format a15
col "temporary ts" format a15
col roles format a25
col profile format a10
col account_status format a12

set linesize 500
set pagesize 120

accep USER prompt "Usuario (Enter=Todos) ..... : "

break on username on created on "default TS" on "Temporary TS" on profile on account_status on lock_date

select username,created,
       default_tablespace "Default TS",
       temporary_tablespace "Temporary TS",
       profile,
       account_status,
       lock_date,
       Granted_role "roles"
from sys.dba_users,sys.dba_role_privs
where username = grantee(+)
and username like '%'||nvl(upper('&USER'),'%')||'%'
order by username;

set feedback on