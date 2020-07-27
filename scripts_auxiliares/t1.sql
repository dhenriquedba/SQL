select b.hash_value
from v$session a, v$sqltext b
where a.sid = &SID
and b.ADDRESS = a.sql_address
order by b.piece
/
