select table_name from dba_constraints
where constraint_name in (select segment_name
from dba_segments
where tablespace_name= 'DAT04')
/
select table_name from dba_constraints, dba_segments
where constraint_name = segment_name
 and tablespace_name= 'DAT04'
/

select table_name from dba_constraints, dba_segments
where constraint_name = segment_name
 and segment_name = 'SYS_IOT_TOP_3678'
/
