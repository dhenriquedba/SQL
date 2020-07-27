set long 25 lines 120 pages 240
Spool __RelatPartitions.txt
select table_owner, table_name, partition_name, high_value
 from dba_tab_partitions
  where (table_name, partition_name) in (select table_name, partition_name
						from dba_tab_partitions o 
							where table_owner not in ('SYS', 'SYSTEM')
						          and  partition_position in (select  max(partition_position)
							                                from dba_tab_partitions i
						                                  where i.table_name = o.table_name))
order by 1,2,3
/
spool off
Prompt 
Prompt Ed PartitionsRetrieveLast.sql    @ PartitionsRetrieveLast.sql
Prompt 
