@login
set echo off feedback off pages 0 linesize 150
accept nometabela Prompt 'Nome da Tabela : '

spool __RebuildIndexesOf_A_Table_1.SQL
select 'alter index '||i.owner||'.'||i.index_name||' rebuild parallel (degree 8) nologging;'
  from dba_indexes i, dba_objects o
where i.owner not in ('TTCN212','SYSTEM','SYS')
	         and o.object_name = i.index_name
		 and i.owner = o.owner
		 and i.partitioned = 'NO'
		 and i.table_name = upper('&nometabela')
UNION
select 'alter index '||index_owner||'.'||index_name||' rebuild partition '||partition_name||'  parallel (degree 8) nologging;'
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
		 and object_name = upper('&nometabela')
	         and subobject_name = partition_name
		 and index_owner = owner
/


spool off

spool RebuildIndexesOf_A_Table.Log
select sysdate inicio from dual;
set echo on
@ __RebuildIndexesOf_A_Table_1.SQL
set feedback on

set echo off
select sysdate termino from dual;
spool off

set echo off feedback on pages 30
Prompt
Prompt   Ed RebuildIndexesOf_A_Table.sql	@ RebuildIndexesOf_A_Table.sql
Prompt
Prompt

