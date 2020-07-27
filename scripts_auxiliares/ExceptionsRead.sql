select owner, table_name, count(*)
from exceptions
group by owner, table_name
/
