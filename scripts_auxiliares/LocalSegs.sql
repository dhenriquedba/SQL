select distinct segment_type, tablespace_name, owner
from dba_segments
Where owner not in ('OUTLN', 'SYS', 'SYSTEM')
/
