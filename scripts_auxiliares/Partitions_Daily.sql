--Precisamos rever as partições de algumas tabelas. 
--Ao invés de quinzenais, elas deverão ter sempre três partições, a saber:
-- 
-- Uma com a data do dia atual
-- Uma com a data do dia útil anterior
-- Uma com a data do último dia útil do mês anterior
-- 
-- As tabelas que estão nestas condições são aquelas cujo campo 
-- PARTN_TYPE_CD da tabela KDD_DR_MAINT_OPRTN é igual a X 
-- (ou seja, ACCT_BAL_POSN_SMRY, CUST_BAL_POSN_SMRY e HH_BAL_POSN_SMRY, 
-- sendo que a última não é utilizada).
-- 
-- Caso haja alguma outra tabela com partições quinzenais, deveremos analisar também.
-- 
set lines 180
column partition_name					format a15
column PARTITION_POSITION 	heading '#'		format 99
Select TABLE_OWNER, table_name, PARTITION_POSITION, partition_name, HIGH_VALUE
	from dba_tab_partitions
--		where table_name in ('ACCT_BAL_POSN_SMRY', 'CUST_BAL_POSN_SMRY')
		where table_owner not in ('SYS','SYSTEM')
order by 1,2,3
/
PROMPT 
PROMPT ED Partitions_Daily.sql		@Partitions_Daily.sql
PROMPT 
