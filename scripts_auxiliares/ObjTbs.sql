set feedback off  verify off  pause off echo off linesize 200  pagesize  80 term off
spool QdAcTrNomeDate.sql
Select 'Spool '||upperGlobal_name||'_Obj_Tbs_'||To_Char(SysDate,'ddmmyyyy')||'.DOC' from global_name;
Spool off
@QdAcTrNomeDate.sql
host del /q QdAcTrNomeDate.sql
set term on

prompt =================================================================================================
Select Instance_Name                                 "Oracle Instance Analizada",
       to_char(sysdate,'dd-fmmonfm-yyyy=hh24:mi:ss') "Data Analise"
From v$instance;
prompt =================================================================================================

Select tablespace_name, segment_type, owner, count(*) qtd
	from dba_segments
		where owner not in ('SYS', 'SYSTEM', 'DBSNMP', 'OUTLN', 'TRACESVR')
	group by tablespace_name, segment_type, owner
/
spool off
