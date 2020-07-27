alter session set nls_date_format = 'ddmonyyyy';
--select owner, table_name, last_analyzed, count(*)
--	from dba_tables
--		 where owner not in ('SYS','SYSTEM','OUTLN','DBA_MON', 'SYSMAN', 'XDB', 'SOX', 'QUEST', 'QUEST9I', 'OEMUSER', 'DBSNMP', 'TSMSYS', 'ADM')
--	group by owner, table_name, last_analyzed
--union
--select table_owner, table_name, last_analyzed, count(*)
--	from dba_tab_partitions
--		 where table_owner not in ('SYS','SYSTEM','OUTLN','DBA_MON', 'SYSMAN', 'XDB', 'SOX', 'QUEST', 'QUEST9I', 'OEMUSER', 'DBSNMP', 'TSMSYS', 'ADM')
--	group by  table_owner, table_name, last_analyzed;
--
select owner, trunc(last_analyzed), count(*)
	from dba_tables
		 where owner not in ('SYS','SYSTEM','OUTLN','DBA_MON', 'SYSMAN', 'XDB', 'SOX', 'QUEST', 'QUEST9I', 'OEMUSER', 'DBSNMP', 'TSMSYS', 'ADM')
	group by owner, trunc(last_analyzed)
union
select table_owner, trunc(last_analyzed), count(*)
	from dba_tab_partitions
		 where table_owner not in ('SYS','SYSTEM','OUTLN','DBA_MON', 'SYSMAN', 'XDB', 'SOX', 'QUEST', 'QUEST9I', 'OEMUSER', 'DBSNMP', 'TSMSYS', 'ADM')
	group by  table_owner, trunc(last_analyzed);


prompt 
prompt Ed AnalyzedTables.sql		@AnalyzedTables.sql
prompt 
