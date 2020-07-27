select tab.tablespace_name, tab.table_name, tbs.file_name
from dba_data_files tbs, dba_tables tab
where tbs.tablespace_name = tab.tablespace_name
 AND  tab.table_name in ('CUST', 'CUST_ACCT', 'MI_TRXN', 'CASH_TRXN', 'EXTERNAL_ENTITY', 'EXTERNAL_ENTITY_ACCT')
union
select tab.tablespace_name, tab.table_name, tbs.file_name
from dba_data_files tbs, dba_tab_partitions tab
where tbs.tablespace_name = tab.tablespace_name
  AND  tab.table_name in ('CUST', 'CUST_ACCT', 'MI_TRXN', 'CASH_TRXN', 'EXTERNAL_ENTITY', 'ACCT', 'EXTERNAL_ENTITY_ACCT')
/

column file_name format a50
select  tab.partition_name, tbs.file_name
from dba_data_files tbs, dba_tab_partitions tab
where tbs.tablespace_name = tab.tablespace_name
  AND  tab.table_name in ('ACCT')
/
SELECT tab.tablespace_name, tab.index_name, tbs.file_name
FROM dba_data_files tbs, dba_indexes tab
WHERE tbs.tablespace_name = tab.tablespace_name
 AND  tab.table_name IN ('CUST', 'CUST_ACCT', 'MI_TRXN', 'CASH_TRXN', 'EXTERNAL_ENTITY', 'EXTERNAL_ENTITY_ACCT')
UNION
SELECT tab.tablespace_name, tab.index_name, tbs.file_name
FROM dba_data_files tbs, dba_ind_partitions tab
WHERE tbs.tablespace_name = tab.tablespace_name
  AND  tab.index_name IN (SELECT index_name FROM dba_indexes  
  	   				  	 WHERE table_name IN ('CUST', 'CUST_ACCT', 'MI_TRXN', 'CASH_TRXN', 'EXTERNAL_ENTITY', 'EXTERNAL_ENTITY_ACCT'))
/*
	acct			1,14
	cust_acct		22
	mi_trxn		9
	cash_trxn		21
	external_entity	21
*/
