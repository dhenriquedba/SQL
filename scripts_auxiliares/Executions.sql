select executions
from v$sql
 where hash_value = '&hash'
/
