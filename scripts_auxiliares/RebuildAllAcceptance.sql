@login
set echo off feedback off pages 0 linesize 150


spool __RebuildAllAcceptance_1.SQL
select 'alter index '||i.owner||'.'||i.index_name||' rebuild tablespace MANTAS_INDEX parallel (degree 4) nologging;'
  from dba_indexes i, dba_objects o
where i.owner not in ('TTCN212','SYSTEM','SYS')
	         and o.object_name = i.index_name
		 and i.owner = o.owner
		 and o.object_name <> 'ACCT_SMRY_MNTH'
		 and o.last_ddl_time < trunc(sysdate)
		 and i.partitioned = 'NO'
		 and i.tablespace_name  = 'MANTAS_DATA'
UNION
select 'alter index '||index_owner||'.'||index_name||' rebuild partition '||partition_name||' tablespace MANTAS_INDEX parallel (degree 4) nologging;'
  from dba_ind_partitions, dba_objects
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
                 and tablespace_name = 'MANTAS_DATA'
		 and object_name <> 'ACCT_SMRY_MNTH'
	         and subobject_name = partition_name
		 and index_owner = owner
		 and last_ddl_time < trunc(sysdate)
/


spool off

spool RebuildAllAcceptance.Log
select sysdate inicio from dual;
set echo on
--@ __RebuildAllAcceptance_1.SQL
set feedback on

set echo off
select sysdate termino from dual;
spool off

set echo off feedback on pages 30
Prompt
Prompt   Ed RebuildAllAcceptance.sql	@ RebuildAllAcceptance.sql
Prompt
Prompt

