Column Owner	Heading Dono	Format A8
Column Tabela				Format A30
Column Extents				Format 999,999
Column Linhas				Format 999,999,999
column tablespace_name			Format A20
Column LAST_ANALYZED			Format A22
Column PARTITIONED			Format A5
column file_name				Format A35
column Object_type			Format A30
column Object_name			Format A30
--
Set pages 35 lines 90 echo on
--
select OWNER,TABLE_NAME,TABLESPACE_NAME,LAST_ANALYZED,PARTITIONED
  from dba_tables
    where OWNER in (select username 
			    from dba_users
				where username is not null
				   or username not in ('SYS','SYSTEM','OUTLN','SCOTT','DBSNMP'))
	ORDER BY 1,2
/
select TABLESPACE_NAME, INITIAL_EXTENT NEXT_EXTENT, PCT_INCREASE, CONTENTS
  from dba_tablespaces
    order by 1
/
select username, Default_tablespace, Temporary_tablespace
  From DBA_USERS
    order by 1
/
select TABLESPACE_NAME, INITIAL_EXTENT,NEXT_EXTENT, PCT_INCREASE, CONTENTS
  from dba_tablespaces
    order by 1
/
Select Tablespace_name, File_name, bytes
  from dba_data_files
    order by 1,2
/
select TABLESPACE_NAME, sum(BYTES) BYTES
  from dba_free_space
    group by TABLESPACE_NAME
      order by 1
/
select segment_name, status, tablespace_name
  from dba_rollback_segs
/
select group#, bytes, members, status
  from v$log
/
Select e.Owner, e.SEGMENT_NAME "Tabela", count(*) "Extents", t.NUM_ROWS "Linhas"
  from DBA_EXTENTS e, DBA_TABLES t
    Where e.SEGMENT_NAME = t.TABLE_NAME
 	and e.Owner not in ('SYS','OUTLN','SCOTT','DBSNMP')
      Group by e.Owner, e.SEGMENT_NAME, t.NUM_ROWS
        Order by e.Owner, count(*) desc
/
Select s.OWNER, s.NAME, s.UPDATABLE, s.REFRESH_METHOD, t.snaptime LAST_REFRESH, s.TYPE, s.STATUS, s.REFRESH_MODE
	From dba_snapshots s, sys.snap_reftime$ t
		Where s.NAME = t.vname	
      Order by 1,3,2
/
select owner, table_name, blocks,
                    Round(  (((num_rows*avg_row_len)*(1+pct_free/100))/8192),0) "Calculo|de Blocos"
  from dba_tables
    where owner = 'AD'
 order by num_rows
/
Column A Heading 'Calculo|de Blocos' format 99,999
Column Blocks format 99,999
Column B Heading 'Calculo|Novo Initial' format 999,999,999,999
Column Table_name fromat A15
Column Owner format a5
Select owner, table_name, blocks,
	Round((((num_rows*avg_row_len)*(1+pct_free/100))/8192),0) a,
	initial_extent, next_extent, Round((((num_rows*avg_row_len)*(1+pct_free/100))*8192),0) B
		from dba_tables
			where owner = 'AD'
		order by num_rows
/
Prompt 
Prompt Ed Verifica		 @ Verifica
Prompt
