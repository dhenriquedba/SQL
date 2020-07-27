column account_status format a15
select username, account_status, lock_date, profile
from dba_users
where username like upper('%&usuario%')
/
prompt
prompt  ed BlockedUser     @BlockedUser
prompt
