set long 25 lines 120 pages 0 feedback off 
column x format a50
Spool PartitionsCreate_1.sql
select '--'||table_owner||','||table_name||','||partition_name x, high_value,
	'Alter table '||table_owner||'.'||table_name||chr(10)||
	'    add partition      VALUES LESS THAN'||chr(10)||
	' (TO_DATE('''', ''YYYYMMDD''))'||chr(10)||
	'        tablespace '||tablespace_name||';'
 from dba_tab_partitions
  where (table_name, partition_name) in (select table_name, partition_name
						from dba_tab_partitions o 
							where table_owner not in ('SYS', 'SYSTEM')
						          and  partition_position in (select  max(partition_position)
							                                from dba_tab_partitions i
						                                  where i.table_name = o.table_name))
order by table_owner, table_name, partition_name
/
spool off
set long 80 lines 120 pages 40 feedback on
Prompt 
Prompt Ed PartitionsCreate.sql    	@ PartitionsCreate.sql
Prompt 
Prompt Ed PartitionsCreate_1.sql	@ PartitionsCreate_1.sql
Prompt 
