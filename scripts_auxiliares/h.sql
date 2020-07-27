select b.sql_text
from v$sqltext b
where b.hash_value = '&hash'
order by b.piece
/
