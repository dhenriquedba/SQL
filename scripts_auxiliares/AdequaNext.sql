/*
spool TableSizing.txt
set lines 200 pages 400
select distinct m.owner, m.table_name Existing_table, t.tablename "foud at Plat_sizing_brazil.xls", 
	 nvl(m.tablespace_name,p.tablespace_name) Tablespace,
	 nvl(m.initial_extent,p.initial_extent) "InitialExtent",
	 nvl(m.next_extent,p.next_extent) "NextExtent"
	from dba_tables m, ESTRUTFISICAMANTAS t, dba_tab_partitions p
		where m.table_name = t.tablename(+)
		  and m.table_name = p.table_name(+)
		  and owner not in ('SYS',
						'SYSTEM',
						'OUTLN',
						'DBSNMP',
						'TESTE',
						'PERFSTAT',
						'DBAMON',
						'TTCN212',
						'OPER',
						'INFO_REP_P',
						'INFO_REP_S')
Order by 3
/
spool off
*/

select 'alter table '||m.owner||'.'||t.tablename                      TABLESIZEMB

distinct m.owner, m.table_name Existing_table, t.tablename "foud at Plat_sizing_brazil.xls", 
	 nvl(m.tablespace_name,p.tablespace_name) Tablespace,
	 nvl(m.initial_extent,p.initial_extent) "InitialExtent",
	 nvl(m.next_extent,p.next_extent) "NextExtent"
	from dba_tables m, ESTRUTFISICAMANTAS t, dba_tab_partitions p
		where m.table_name = t.tablename(+)
		  and m.table_name = p.table_name(+)
		  and owner not in ('SYS',
						'SYSTEM',
						'OUTLN',
						'DBSNMP',
						'TESTE',
						'PERFSTAT',
						'DBAMON',
						'TTCN212',
						'OPER',
						'INFO_REP_P',
						'INFO_REP_S')
Order by 3


prompt
prompt	Ed AdequaNext.sql			@AdequaNext.sql
prompt


