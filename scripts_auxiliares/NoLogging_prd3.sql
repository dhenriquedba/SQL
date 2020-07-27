select 'table', owner, partitioned, logging, count(*)
from dba_tables
 group by 'table', owner, partitioned, logging
 select 'index', owner, partitioned, logging, count(*)
from dba_indexes
 group by 'index', owner, partitioned, logging, count(*)
order by 1,2,3,4
/



select logging,partitioned,count(*) 
	from dba_tables 
		group by logging,partitioned;

select logging,partitioned,count(*) 
	from dba_indexes 
		group by logging,partitioned;
