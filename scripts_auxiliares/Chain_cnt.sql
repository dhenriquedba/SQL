select owner, table_name, NUM_ROWS, CHAIN_CNT, CHAIN_CNT/NUM_ROWS*100 
	   from dba_tables 
	   		where NVL(NUM_ROWS,0)  > 0 
			  and nvl(chain_cnt,0) > 0 
			  and owner not in ('SYS','SYSTEM','OUTLN','DBAMON')
union
select table_owner, table_name, NUM_ROWS, CHAIN_CNT, CHAIN_CNT/NUM_ROWS*100 
	   from dba_tab_partitions 
	   		where NVL(NUM_ROWS,0)  > 0 
			  and nvl(chain_cnt,0) > 0 
			  and table_owner not in ('SYS','SYSTEM','OUTLN','DBAMON')
