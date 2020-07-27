set pages 0 lines 200 feedback off
Spool AnalyzeOne__1.sql
select  'prompt Getting stats for table: '||owner||'.'||table_name||' and its indexes ...'||chr(10)||
	'exec dbms_stats.GATHER_TABLE_STATS('||''''||owner||''''||'-'||chr(10)||
	' ,TABNAME=>'||''''||table_name||''''||
	','||'ESTIMATE_PERCENT=>100 ,DEGREE=>8,CASCADE=>TRUE);'
 from dba_tables
 where owner  = 'ADMIN_FOL'
   and table_name <> 'RESULTADO'
   and last_analyzed < trunc(sysdate)
order by table_name
/
select  'prompt Getting stats for table: '||owner||'.'||table_name||' and its indexes ...'||chr(10)||
	'exec dbms_stats.GATHER_TABLE_STATS('||''''||owner||''''||'-'||chr(10)||
	' ,TABNAME=>'||''''||table_name||''''||
	','||'ESTIMATE_PERCENT=>100 ,DEGREE=>8,CASCADE=>TRUE);'
 from dba_tables
 where owner  in ('ADMIN_DES',                                                                       
                  'TSMSYS',
                  'HIGORFIORI',
                  'MARCELREIS',
                  'SOX',
                  'EDUARDOYAM',
                  'ADM',
                  'NELSONHENR')
   and last_analyzed < trunc(sysdate)
order by owner, table_name
/
select  'prompt Getting stats for table: '||owner||'.'||table_name||' and its indexes ...'||chr(10)||
	'exec dbms_stats.GATHER_TABLE_STATS('||''''||owner||''''||'-'||chr(10)||
	' ,TABNAME=>'||''''||table_name||''''||
	','||'ESTIMATE_PERCENT=>100 ,DEGREE=>8,CASCADE=>TRUE);'
 from dba_tables
 where owner  = 'ADMIN_FOL'
   and table_name = 'RESULTADO'
   and last_analyzed < trunc(sysdate)
order by table_name
/
set pages 30 lines 90 feedback on
spool off
spool AnalyzeOne__1.log
@AnalyzeOne__1.sql
spool off
prompt  
prompt   Ed Analyze.sql	@Analyze.sql
prompt  









