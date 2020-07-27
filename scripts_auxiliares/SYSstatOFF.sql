set feedback off  verify off  pause off echo off linesize 200  pagesize  80  term off

spool QdAcTrNomeDate.sql
Select 'Spool '||substr(Global_name,10,6)||'_SYSstat_OFF_'||To_Char(SysDate,'ddmmyyyy_hh24miss')||'.log' from global_name;
Spool off
@QdAcTrNomeDate.sql
host del /q QdAcTrNomeDate.sql
set term on feedback on


execute dbms_stats.gather_system_stats('Stop');

select pname, pval1
    from  sys.aux_stats$
   where  sname = 'SYSSTATS_MAIN'
/


spool off


prompt
prompt  Ed SYSstatOFF      @ SYSstatOFF			@ SYSstatON
prompt
