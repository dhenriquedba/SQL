@login
prompt
prompt    será feito o Rebuild somente da última partição (P200607)
prompt
accept TABELA prompt 'Table to Rebuild: '
set echo off feedback off pages 0 linesize 150


spool __Rebuild_A_table_1.SQL
select 'alter index '||i.owner||'.'||i.index_name||' rebuild parallel (degree 8) nologging;'
  from dba_indexes i, dba_objects o
where i.owner not in ('TTCN212','SYSTEM','SYS')
	         and o.object_name = i.index_name
		 and i.owner = o.owner
		 and i.partitioned = 'NO'
		 and i.table_name = upper('&TABELA')
UNION
select 'alter index '||index_owner||'.'||index_name||' rebuild partition '||partition_name||'  parallel (degree 8) nologging;'
  from dba_ind_partitions p, dba_objects o, dba_indexes i
	where p.index_owner in ('BUSINESS'
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
		 and o.object_name = upper('&TABELA')
	     and o.subobject_name = p.partition_name
	     and o.subobject_name = 'P200607'
		 and p.index_owner = o.owner
		 and i.table_name = o.object_name
		 and i.index_name = p.index_name
/


spool off

spool Rebuild_A_table.Log
select sysdate inicio from dual;
set echo on
@ __Rebuild_A_table_1.SQL
set feedback on

set echo off
select sysdate termino from dual;
spool off

set echo off feedback on pages 30
Prompt
Prompt   Ed Rebuild_A_table.sql	@ Rebuild_A_table.sql
Prompt
Prompt

