set echo off feedback off pages 0 linesize 250
exec dbms_utility.analyze_schema('CRIADOR','DELETE')
pause ...
spool StatCriador_1.SQL
select 'execute DBMS_STATS.GATHER_TABLE_STATS ( ''CRIADOR'','''||table_name||''',NULL,5,-'||chr(10)||
	 'NULL,''FOR ALL COLUMNS SIZE 1'',NULL,''ALL'',TRUE,NULL,NULL,NULL);'
from dba_tables where owner='CRIADOR' and table_name like 'SIG%'
--and table_name not in ('SIG_DIM_ANO_MES_CALEN',
--				'SIG_DIM_TPO_CTRT_FUNC')
/
spool off
@login
spool StatCriador_1.Log
select sysdate inicio from dual;
@ StatCriador_1.SQL
select sysdate termino from dual;
spool off

set echo off feedback on pages 30
Prompt
Prompt   Ed StatCriador.SQL		@ StatCriador.SQL
Prompt
  
-- ANALYZE TABLE CRIADOR.SIG_DIM_ANO_MES_CALEN DELETE STATISTICS; 
-- ANALYZE TABLE CRIADOR.SIG_DIM_TPO_CTRT_FUNC DELETE STATISTICS; 


