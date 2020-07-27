--Precisamos rever as parti��es de algumas tabelas. 
--Ao inv�s de quinzenais, elas dever�o ter sempre tr�s parti��es, a saber:
-- 
-- Uma com a data do dia atual
-- Uma com a data do dia �til anterior
-- Uma com a data do �ltimo dia �til do m�s anterior
-- 
-- As tabelas que est�o nestas condi��es s�o aquelas cujo campo 
-- PARTN_TYPE_CD da tabela KDD_DR_MAINT_OPRTN � igual a X 
-- (ou seja, ACCT_BAL_POSN_SMRY, CUST_BAL_POSN_SMRY e HH_BAL_POSN_SMRY, 
-- sendo que a �ltima n�o � utilizada).
-- 
-- Caso haja alguma outra tabela com parti��es quinzenais, deveremos analisar tamb�m.
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
