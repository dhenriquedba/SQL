@login
set echo off feedback off pages 0 linesize 150

spool __Partition_S_Defaults_1.sql

select  distinct 'alter table '||table_owner||'.'||table_name||chr(10)||
	'   modify default attributes tablespace '||tablespace_name||';'
from  dba_tab_partitions
  where  TABLE_OWNER     in ('BUSINESS'
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
select  distinct 'alter index '||index_owner||'.'||index_name||chr(10)||
	'   modify default attributes tablespace '||tablespace_name||';'
   from dba_ind_partitions
  where  INDEX_OWNER     in ('BUSINESS'
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
order by 1
/
spool off

spool Partition_S_Defaults.Log
select sysdate inicio from dual;
set echo on feedback on
@ __Partition_S_Defaults_1.sql
set echo off feedback off
select sysdate termino from dual;
set feedback on
spool off

set echo off feedback on pages 30
Prompt
Prompt   Ed Partition_S_Defaults.sql		@ Partition_S_Defaults.sql
Prompt
Prompt

