set feedback off  verify off  pause off echo off linesize 150  pagesize  80 term off
spool QdAcTrNomeDate.sql
Select 'Spool '||substr(Global_name,1,6)||'_SQLs_'||To_Char(SysDate,'ddmmyyyy_hh24miss')||'.DOC' from global_name;
Spool off
@QdAcTrNomeDate.sql
host del /q QdAcTrNomeDate.sql
set term on
prompt =================================================================================================
prompt ==========                  By Odecio Souza  - menetwork - fev.2004                  ============
prompt =================================================================================================
Select Instance_Name                                 "Oracle Instance Analizada",
       to_char(sysdate,'dd-fmmonfm-yyyy=hh24:mi:ss') "Data Analise",
       to_char(startup_time, 'dd-fmmonfm-yyyy=hh24:mi:ss') "Data do Starup",
       trunc(sysdate-startup_time) "Dias da Instance no ar"
From v$instance;

prompt =================================================================================================
prompt =================================================================================================
prompt
select s.sql_text, s.ADDRESS, s.HASH_VALUE, s.sorts, s.users_opening, s.executions, s.invalidations, s.rows_processed
from v$sql s
where s.executions  > 100
order by s.executions desc
/
spool off
prompt
prompt   Ed ComandosSQL.sql                    @ ComandosSQL.sql
prompt
prompt
