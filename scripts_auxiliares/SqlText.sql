select sql_text
from v$sqltext
where HASH_VALUE = '&HashValue'
order by piece
/
