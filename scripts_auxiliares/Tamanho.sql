Column 'Index bytes'	 	Format 9,999,9999,999,999
Column 'Snapshot Log bytes'	Format 9,999,9999,999,999
Column 'Snapshot bytes'	 	Format 9,999,9999,999,999
Column 'Data Table bytes'	Format 9,999,9999,999,999
Column 'Total bytes'	 	Format 9,999,9999,999,999
Set feedback off echo off



Select sum(x.bytes) "Index bytes"
 from dba_extents x, dba_indexes i
 where x.owner = 'SAPXXI'
  and x.segment_name = i.index_name
/
Select sum(x.bytes) "Snapshot Log bytes"
 from dba_extents x, dba_Snapshot_logs s
 where x.owner = 'SAPXXI'
  and x.segment_name = s.log_table
/
Select sum(x.bytes) "Snapshot bytes"
 from dba_extents x, dba_Snapshots s
 where x.owner = 'SAPXXI'
  and x.segment_name = s.table_name
/
Select sum(x.bytes) "Data Table bytes"
 from dba_extents x, dba_Tables t
 where x.owner = 'SAPXXI'
  and x.segment_name = t.table_name
  and t.table_name not in (select s.table_name from dba_snapshots s where s.owner = 'SAPXXI'
				union
			   select l.log_table from dba_snapshot_logs l where l.log_owner = 'SAPXXI')
/
Select sum(x.bytes) "Total bytes"
 from dba_extents x
 where x.owner = 'SAPXXI'
/
Set feedback on echo off
Prompt
Prompt Ed Tamanho.sql            @ Tamanho.sql
Prompt
