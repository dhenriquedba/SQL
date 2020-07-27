column num_rows format 999,999,999,999
column num_rows format 999,999,999,999
column percent format 9,999.99


select owner, table_name, num_rows, chain_cnt, (CHAIN_CNT/NUM_ROWS)*100 percent
from dba_tables
where nvl(chain_cnt,0) > 0
order by 5 desc
/
