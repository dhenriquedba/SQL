set pages 0 lines 200 feedback off
Spool AnalyzeOne__3.sql
select  'prompt Getting stats for table: '||owner||'.'||table_name||' and its indexes ...'||chr(10)||
	'exec dbms_stats.GATHER_TABLE_STATS('||''''||owner||''''||'-'||chr(10)||
	' ,TABNAME=>'||''''||table_name||''''||
	','||'ESTIMATE_PERCENT=>100 ,DEGREE=>8,CASCADE=>TRUE);'
 from dba_tables
 where table_name not like  'RES%' and owner = 'ADMIN_FOL'
   and last_analyzed is null
order by table_name
/
set pages 30 lines 90 feedback on
spool off
spool AnalyzeOne__3.log
pause pode_ir_?
@AnalyzeOne__3.sql
spool off
prompt  
prompt   Ed Analyze.sql	@Analyze.sql
prompt  









