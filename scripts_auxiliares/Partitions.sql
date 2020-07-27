select partition_name, count(1), sum(bytes) bytes
from user_extents
where segment_name = 'ACCT'
group by partition_name
/

select PARTITION_NAME, MIN_EXTENT ,INITIAL_EXTENT bytes
	from user_tab_partitions
		where TABLE_NAME = 'ACCT'
/

select EXTENT_ID, bytes 
	from user_extents 
		where partition_name = 'AC3' 
	order by 1
/

select table_name, PARTITION_NAME , HIGH_VALUE, last_analyzed  	
	from dba_tab_partitions 
		order by 1,2
/