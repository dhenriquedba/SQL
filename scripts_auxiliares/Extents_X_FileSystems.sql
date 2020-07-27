select e.segment_name, e.segment_type, t.tablespace_name, substr(t.file_name,2,9) file_system, count(*)
from dba_extents e, dba_data_files t
where e.tablespace_name = t.tablespace_name
  and substr(t.file_name,2,9) in 
	  		  ('oradata43','oradata51','oradata19')
group by e.segment_name, e.segment_type, t.tablespace_name, substr(t.file_name,2,9) 