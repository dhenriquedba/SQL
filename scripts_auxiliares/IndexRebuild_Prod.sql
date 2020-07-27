@login
set echo off feedback off pages 0 linesize 150


spool _IndexRebuild_PROD_1.SQL
select 'alter index '||index_owner||'.'||index_name||' rebuild partition '||partition_name||';'
  from dba_ind_partitions
	where index_owner in ('BUSINESS'
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
union
select 'alter index '||owner||'.'||index_name||' rebuild;'
  from dba_indexes
	where owner in ('BUSINESS'
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
	  and PARTITIONED = 'NO'
/
spool off

spool __IndexRebuild_PROD.Log
select sysdate inicio from dual;
set echo on
@ _IndexRebuild_PROD_1.SQL
set feedback on

set echo off
select sysdate termino from dual;
spool off
