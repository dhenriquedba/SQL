break on username skip 1

select a.username, b.sql_text
from v$session a, v$sqltext b
where b.ADDRESS = a.sql_address
order by a.sid, b.address, b.piece
/
