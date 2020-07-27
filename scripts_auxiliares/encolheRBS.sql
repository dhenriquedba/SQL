select 'alter rollback segment '||segment_name||' shrink to 1m;'
from dba_rollback_segs
/
