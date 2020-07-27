set pages 0 lines 200 feedback off
accept dono   prompt 'Dono da Tabela: '
accept tabela prompt 'Nome da Tabela: '
accept grau   prompt 'Percentual para analise: '
Spool AnalyzeOne__1.sql
select  'prompt Getting stats for table: '||owner||'.'||table_name||' and its indexes ...'||chr(10)||
	'exec dbms_stats.GATHER_TABLE_STATS('||''''||owner||''''||'-'||chr(10)||
	' ,TABNAME=>'||''''||table_name||''''||
	','||'ESTIMATE_PERCENT=>&grau ,DEGREE=>4,CASCADE=>TRUE);'
 from dba_tables
 where owner  = upper('&dono')
 and table_name = upper('&tabela')
/
set pages 30 lines 90 feedback on
spool off
--spool AnalyzeAllMantas__1.log
@AnalyzeOne__1.sql
--spool off
prompt  
prompt   Ed AnalyzeOne.sql	@AnalyzeOne.sql
prompt  
