select distinct 'analyze table '||owner||'.'||TABLE_NAME||' delete statistics;'
  from dba_tables
 where table_name like '%STAGE%'
/
