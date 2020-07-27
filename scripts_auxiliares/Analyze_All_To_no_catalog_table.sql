/*
DECLARE
  num_rows NUMBER;
  num_blocks NUMBER;
  avg_row_len NUMBER;

BEGIN
  -- retrieve the values of table statistics on OE.ORDERS
  -- statistics table name: OE.SAVESTATS    statistics ID: TEST1

  DBMS_STATS.GET_TABLE_STATS('OE','ORDERS',null,
    'SAVESTATS','TEST1',
    num_rows,num_blocks,avg_row_len);

  -- print the values
DBMS_OUTPUT.PUT_LINE('num_rows='||num_rows||',num_blocks='||num_blocks||
                     ',avg_row_len='||avg_row_len);
END;



--------------------------------------------------------------------------------
Note: 
Statistics held in a statistics table are held in a form that is only understood by using DBMS_STATS package.
{  Oracle9i Database Performance Tuning Guide and Reference Release 2 (9.2) Part Number A96533-02 
   Gathering Optimizer Statistics}

*/
@login
set echo on feedback on
begin
DBMS_STATS.CREATE_STAT_TABLE (
   ownname => 'TTCN212', 
   stattab => 'StatTab',
   tblspace => 'TOOLS');
end;
/
set echo off
pause _OK_?

set pages 0 lines 200 feedback off echo off
Spool Analyze_All_To_no_catalog_table__1.sql
select  'prompt Getting stats for table: '||owner||'.'||table_name||' and its indexes, for a non catalog table ...'||chr(10)||
	'exec dbms_stats.GATHER_TABLE_STATS('||''''||owner||''''||'-'||chr(10)||
	' ,TABNAME=>'||''''||table_name||''''||
	','||'ESTIMATE_PERCENT=>100,DEGREE=>8,CASCADE=>TRUE,'||'-'||chr(10)||
	' STATTAB=>''STATTAB'', STATOWN=>''TTCN212'');'
 from dba_tables
 where owner in ('BUSINESS'
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
order by owner desc
/
spool off
set feedback off  verify off  pause off echo off linesize 200  pagesize  0  term off
spool QdAcTrNomeDate.sql
Select 'Spool '||instance_name||'_Analyze_All_To_no_catalog_table_'||To_Char(SysDate,'ddmmyyyy_hh24miss')||'.TXT' from v$instance;
Spool off
@QdAcTrNomeDate.sql
host del /q QdAcTrNomeDate.sql
set term on
@Analyze_All_To_no_catalog_table__1.sql
spool off
host del /q Analyze_All_To_no_catalog_table__1.sql
set pages 30 lines 90 feedback on
prompt  
prompt   Ed Analyze_All_To_no_catalog_table.sql		@Analyze_All_To_no_catalog_table.sql
prompt  
