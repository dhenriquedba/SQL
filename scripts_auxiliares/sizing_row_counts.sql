/*
    Script: sizing_row_counts.sql
    Author: Paramjit S Sublok
      Date: May 19th, 2005
   Purpose: Gather sizing statistics for Business/Market Schemas
    Output: sizing_row_counts.lst (Please rename to sizing_row_counts_<DBNAME>.lst)
*/

column num_records format 999,999,999,999
column table_name format A32
column partition_name format A15
column week_start_date format A15

column table_name heading 'Table|Name'
column index_name heading 'Index|Name'
column bytes_per_table_row heading 'Bytes Per|Table Row'
column bytes_per_index_row heading 'Bytes Per|Index Row'
column index_bytes heading 'Index|Bytes'
column index_rows heading 'Index|Rows'
column table_rows heading 'Table|Rows'
column table_bytes heading 'Table|Bytes'
column avg_row_len heading 'Avg Tab|Row Len'
column avg_row_len_part heading 'Avg Part|Row Len'
column calc_row_len heading 'Calc|Row Len'

set pagesize 999
set linesize 132
set trimspool on echo off
set colsep ~ 
spool sizing_row_counts_brazilian_hub.lst
prompt 
prompt execute as DBA. Tables owner was hard-coded into script
prompt second version with echo on
prompt
select user||'@'||global_name||' ('||to_char(sysdate, 'DAY DD-MON-YYYY HH:MI AM')||')' as database
from global_name ;

alter session set nls_date_format = 'DD-MON-YYYY' ;
--set echo on


-- Transaction and Derived Tables
SELECT 'BACK_OFFICE_TRXN' as TABLE_NAME, trunc(data_dump_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS FROM business.BACK_OFFICE_TRXN group by trunc(data_dump_dt, 'WW') ;
SELECT 'CASH_TRXN' as TABLE_NAME, trunc(data_dump_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS FROM business.CASH_TRXN group by trunc(data_dump_dt, 'WW') ;
SELECT 'DERIVED_ADDRESS' as TABLE_NAME, trunc(data_dump_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS FROM business.DERIVED_ADDRESS group by trunc(data_dump_dt, 'WW') ;
SELECT 'EXTERNAL_ENTITY' as TABLE_NAME, trunc(data_dump_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS FROM business.EXTERNAL_ENTITY group by trunc(data_dump_dt, 'WW') ;
SELECT 'MI_TRXN' as TABLE_NAME, trunc(data_dump_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS FROM business.MI_TRXN group by trunc(data_dump_dt, 'WW') ;
SELECT 'WIRE_TRXN' as TABLE_NAME, trunc(data_dump_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.WIRE_TRXN group by trunc(data_dump_dt, 'WW') ;

-- Order/Trade/Execution Tables
SELECT 'ORDR' as TABLE_NAME, trunc(last_data_dump_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.ORDR group by trunc(last_data_dump_dt, 'WW') ;
SELECT 'EXECUTION' as TABLE_NAME, trunc(last_data_dump_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.EXECUTION group by trunc(last_data_dump_dt, 'WW') ;
SELECT 'TRADE' as TABLE_NAME, trunc(last_data_dump_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.TRADE group by trunc(last_data_dump_dt, 'WW') ;
SELECT 'ORDR_EVENT' as TABLE_NAME, trunc(data_dump_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.ORDR_EVENT group by trunc(data_dump_dt, 'WW') ;
SELECT 'TRADE_EXECUTION_EVENT' as TABLE_NAME, trunc(data_dump_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.TRADE_EXECUTION_EVENT group by trunc(data_dump_dt, 'WW') ;

-- Arc Tables
SELECT 'ACCT_ADDR_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.ACCT_ADDR_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'ACCT_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.ACCT_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'ACCT_BAL_POSN_SMRY_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.ACCT_BAL_POSN_SMRY_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'ACCT_CLTRL_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.ACCT_CLTRL_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'ACCT_GRP_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.ACCT_GRP_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'ACCT_NVSMT_OBJ_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.ACCT_NVSMT_OBJ_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'ACCT_POSN_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.ACCT_POSN_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'ACCT_RSTRN_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.ACCT_RSTRN_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'ACCT_SMRY_MNTH_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.ACCT_SMRY_MNTH_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'ACCT_SRVC_TEAM_MEMBER_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.ACCT_SRVC_TEAM_MEMBER_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'CHG_LOG_SMRY_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.CHG_LOG_SMRY_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'CLIENT_BANK_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.CLIENT_BANK_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'CLIENT_BANK_SMRY_MNTH_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.CLIENT_BANK_SMRY_MNTH_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'CORP_ACTN_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.CORP_ACTN_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'CUST_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.CUST_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'CUST_BAL_POSN_SMRY_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.CUST_BAL_POSN_SMRY_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'CUST_SMRY_MNTH_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.CUST_SMRY_MNTH_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'DEAL_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.DEAL_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'DERIVED_ADDRESS_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.DERIVED_ADDRESS_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'DOW_JONES_NEWS_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.DOW_JONES_NEWS_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'EMP_ACCT_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.EMP_ACCT_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'EMP_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.EMP_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'EXECUTION_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.EXECUTION_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'EXTERNAL_ENTITY_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.EXTERNAL_ENTITY_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'FIRM_ACCT_POSN_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.FIRM_ACCT_POSN_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'HH_BAL_POSN_SMRY_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.HH_BAL_POSN_SMRY_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'HH_SMRY_MNTH_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.HH_SMRY_MNTH_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'INSTL_ACCT_SMRY_MNTH_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.INSTL_ACCT_SMRY_MNTH_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'INSTN_MASTER_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.INSTN_MASTER_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'INSTRUCTION_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.INSTRUCTION_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'LETTER_OF_INTENT_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.LETTER_OF_INTENT_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'MANGD_ACCT_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.MANGD_ACCT_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'MANGD_ACCT_SMRY_MNTH_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.MANGD_ACCT_SMRY_MNTH_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'MARKET_CENTER_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.MARKET_CENTER_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'MFUND_BRKPT_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.MFUND_BRKPT_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'MFUND_SELCT_LIST_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.MFUND_SELCT_LIST_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'MKT_IDX_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.MKT_IDX_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'NTCPTRY_PRFL_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.NTCPTRY_PRFL_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'NTWK_LOGON_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.NTWK_LOGON_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'NVSMT_MGR_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.NVSMT_MGR_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'NVSMT_MGR_SMRY_MNTH_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.NVSMT_MGR_SMRY_MNTH_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'ORDR_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.ORDR_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'ORG_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.ORG_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'RGSTD_REP_SMRY_MNTH_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.RGSTD_REP_SMRY_MNTH_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'SCRTY_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.SCRTY_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'SCRTY_FIRM_DAILY_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.SCRTY_FIRM_DAILY_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'SCRTY_NVSMT_RTNG_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.SCRTY_NVSMT_RTNG_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'SCRTY_RSTRN_LIST_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.SCRTY_RSTRN_LIST_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'SCRTY_SELCT_LIST_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.SCRTY_SELCT_LIST_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'TRADE_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.TRADE_ARC group by trunc(arc_dt, 'WW') ;
SELECT 'TRD_SOLCN_ARC' as TABLE_NAME, trunc(arc_dt, 'WW') as WEEK_START_DATE, count(*) as NUM_RECORDS from business.TRD_SOLCN_ARC group by trunc(arc_dt, 'WW') ;

-- Market Tables
select table_name, partition_name, num_rows as table_rows, avg_row_len from dba_tab_partitions
WHERE table_owner = 'MARKET'
ORDER BY 1,2 ;

-- Tables Query
SELECT ut.table_name,
       us.segment_bytes TABLE_BYTES, 
       ut.num_rows AS table_rows, 
       ut.avg_row_len AS avg_row_len, 
    CASE WHEN partitioned = 'YES' THEN 
            ( SELECT  to_char(AVG(avg_row_len), '999999999.99') 
                FROM dba_tab_partitions utp
               WHERE utp.table_name = ut.table_name
                 AND avg_row_len IS NOT NULL
                 AND avg_row_len != 0
			AND table_owner = 'BUSINESS' )
         ELSE NULL
         END AS avg_row_len_part,
    CASE WHEN ut.num_rows != 0 THEN
               to_char( us.segment_bytes/ut.num_rows, '9999999.99') 
          ELSE NULL 
         END AS calc_row_len
FROM dba_tables ut,
( SELECT segment_name, segment_type, sum(bytes) AS segment_bytes, COUNT(*) AS PARTITION_count
FROM dba_segments WHERE segment_type LIKE 'TABLE%' AND segment_name NOT LIKE 'SAV%' and owner = 'BUSINESS'
GROUP BY segment_name, segment_type ) us
WHERE ut.table_name NOT LIKE 'SAV%'
AND ut.table_name = us.segment_name
AND owner = 'BUSINESS'
ORDER BY 1;

-- Indexes Query
SELECT ui.table_name,
       ui.index_name,
       us.segment_bytes AS index_BYTES,
       ut.num_rows AS table_rows,
    CASE WHEN ut.num_rows != 0 THEN
               to_char( us.segment_bytes/ut.num_rows, '9999999.99') 
          ELSE NULL 
         END AS bytes_per_table_row,
       ui.num_rows AS index_rows,
    CASE WHEN ui.num_rows != 0 THEN
              to_char( us.segment_bytes/ui.num_rows, '9999999.99') 
          ELSE NULL 
         END AS bytes_per_index_row
FROM dba_indexes ui, dba_tables ut,
( SELECT segment_name, segment_type, sum(bytes) AS segment_bytes, COUNT(*) AS PARTITION_count
FROM dba_segments WHERE segment_type LIKE 'INDEX%' AND segment_name NOT LIKE 'SAV%' and owner = 'BUSINESS'
GROUP BY segment_name, segment_type ) us
WHERE ui.table_name NOT LIKE 'SAV%'
AND ui.index_name = us.segment_name
AND ut.table_name = ui.table_name
AND ut.owner = 'BUSINESS'
ORDER BY 1, 3, 2;

spool off
