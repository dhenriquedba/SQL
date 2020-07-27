select 'revoke '||PRIVILEGE||' on '||TABLE_NAME||' from '||GRANTEE||';'
from USER_TAB_PRIVS_MADE
/
