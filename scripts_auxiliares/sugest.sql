@login
set feedback off  verify off  pause off echo off linesize 200  pagesize  0  term off
spool QdAcTrNomeDate.sql
Select 'Spool '||instance_name||'_Vol_lojas'||To_Char(SysDate,'ddmmyyyy_hh24miss')||'.TXT' from v$instance;
Spool off
@QdAcTrNomeDate.sql
host del /q QdAcTrNomeDate.sql
set term on
set  feedback off


select 'sugestão ', sysdate from dual;


spool off
prompt
prompt  local para auto avisos ....
prompt
prompt
prompt  @sugest        ed sugest
prompt

