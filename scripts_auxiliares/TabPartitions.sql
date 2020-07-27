set lines 200
Column table_owner	format a10
Column table_name		format a30
Column partition_name 	format a20
Column high_value 	format a100
Column tablespace_name	format a20

select table_owner, table_name, partition_name, high_value, tablespace_name
from dba_tab_partitions
where table_owner in  ('BUSINESS'
				, 'MANTAS'
				, 'KDD'
				, 'KDD_WEB'
				, 'KDD_ALG'
				, 'KDD_MNR'
				, 'MARKET'
				, 'INGEST_USER'
				, 'DB_UTIL_USER'
				, 'INFO_REP_P'
				, 'INFO_REP_S')
order by 1,2,3
/
prompt
prompt Ed  TabPartitions.sql			@TabPartitions.sql
prompt
