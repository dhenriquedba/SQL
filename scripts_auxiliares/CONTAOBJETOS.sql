select owner, object_type, count(*)
  from dba_objects where owner in ('PONTOWEB','MONITOR00','MONITOR99')
group by owner, object_type
ORDER BY 1
/
