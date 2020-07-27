select 'alter index criador.'||index_name||' rebuild;'
from dba_indexes
where owner='CRIADOR'  and status='UNUSABLE'
/
