rem Copyright © 2005, Oracle. All rights reserved. Legal Notices and Terms of Use. 
rem 
rem Instructions:
rem The script ask for the hash value of the SQL statement.
rem You can find this value in V$SQL or V$SQL_PLAN
rem The child_number is set to 0. When you get the wrong SQL statement you have
rem also to change this number.
rem editors, e-mail packages, and operating systems handle text formatting (spaces, 
rem tabs, and carriage returns), this script may not be in an executable state
rem when you first receive it. Check over the script to ensure that errors of
rem this type are corrected.The script will produce an output file named [outputfile].
rem This file can be viewed in a browser or uploaded for support analysis.
rem 
rem Description  
rem This script displays the SQL and the SQL execution plan that is in the 
rem librarycache. This script does not work on 9.0 because the view 
rem v$sql_plan_statistics_all does not exits. This part can be removed and
rem than the script works also on 9.0.
rem
rem Odécio Jun2008 altered for get data from StatsPack's tables

set pagesize 600
set tab off 
set linesize 140
set echo off
set long 4000
col TQID format A4
col "SLAVE SQL" format A95 WORD_WRAP
col address format A12
col sql_hash format 9999999999999999
col exec format 9999
col sql_text format A75 WORD_WRAP
repfooter off;
set timing off veri off space 1 flush on pause off termout on numwidth 10 feedback off
alter session set "_complex_view_merging"=false;
accept hashvalue prompt 'SQLs Hash Value: '
spool &hashvalue..TXT
select hash_value sql_hash, --||decode(child_number, 0, '', '/'||child_number) 
          sql_text
from STATS$SQLTEXT
where hash_value= &hashvalue --child_number= 0 and;

select '| Operation                                         | Name | Starts | E-Rows | A-Rows | Buffers | Reads | Writes | E-Time |' as "Plan Table" from dual
union all /* QWEKLOIPYRTJHH7 */ 
select '---------------------------------------------------------------------------------------------------------------------------'
from dual 
union all 
select rpad('| '||substr(lpad(' ',1*(depth))||operation|| decode(options, null,'',' '||options), 1, 33), 34, ' ')||'|'|| 
          rpad(substr(object_name||' ',1, 19), 20, ' ')||'|'|| 
--          lpad(decode(starts,null,' ', 
--                         decode(sign(starts-1000), -1, starts||' ', 
--                         decode(sign(starts-1000000), -1, round(starts/1000)||'K',
--                         decode(sign(starts-1000000000), -1, round(starts/1000000)||'M', 
--                                           round(starts/1000000000)||'G')))), 8, ' ') || '|' ||
          lpad(decode(cardinality,null,' ',
                         decode(sign(cardinality-1000), -1, cardinality||' ',
                         decode(sign(cardinality-1000000), -1, round(cardinality/1000)||'K',
                         decode(sign(cardinality-1000000000), -1, round(cardinality/1000000)||'M', 
                                            round(cardinality/1000000000)||'G')))), 8, ' ') || '|' ||
          lpad(decode(procrows,null,' ', 
                         decode(sign(procrows-1000), -1, procrows||' ',
                         decode(sign(procrows-1000000), -1, round(procrows/1000)||'K',
                         decode(sign(procrows-1000000000), -1, round(procrows/1000000)||'M', 
                                            round(procrows/1000000000)||'G')))), 8, ' ') || '|' || 
          lpad(decode(crgets,null,' ', 
                         decode(sign(crgets-10000000), -1, crgets||' ', 
                         decode(sign(crgets-1000000000), -1, round(crgets/1000000)||'M',
                                            round(crgets/1000000000)||'G'))), 9, ' ') || '|' || 
          lpad(decode(reads,null,' ', 
                         decode(sign(reads-10000000), -1, reads||' ',
                         decode(sign(reads-1000000000), -1, round(reads/1000000)||'M',
                                            round(reads/1000000000)||'G'))), 8, ' ') || '|' || 
--          lpad(decode(writes,null,' ', 
--                        decode(sign(writes-10000000), -1, writes||' ', 
--                        decode(sign(writes-1000000000), -1, round(writes/1000000)||'M', 
--                                            round(writes/1000000000)||'G'))), 8, ' ') || '|' || 
--          lpad(decode(etime,null,' ', 
--                         decode(sign(etime-10000000), -1, etime||' ', 
--                         decode(sign(etime-1000000000), -1, round(etime/1000000)||'M', 
--                                            round(etime/1000000000)||'G'))), 8, ' ') || 
			'|' as "Explain plan" 
from 
       (select /*+ no_merge */ 
                  p.PLAN_HASH_VALUE, p.ID, p.DEPTH, p.POSITION, p.OPERATION, 
                  p.OPTIONS, p.COST COST, p.CARDINALITY CARDINALITY, 
                  p.BYTES BYTES, p.OBJECT_NODE, p.OBJECT_OWNER, 
                  p.OBJECT_NAME, p.OTHER_TAG, p.PARTITION_START,
                  p.PARTITION_STOP, p.DISTRIBUTION,
                  sum(pa.ROWS_PROCESSED) procrows, sum(pa.BUFFER_GETS) crgets, 
                  sum(pa.DISK_READS) reads, sum(pa.ELAPSED_TIME) etime 
        from STATS$SQL_SUMMARY pa,
	     STATS$SQL_PLAN_USAGE u, 
             STATS$SQL_PLAN p
        where u.hash_value = &hashvalue 
          and p.PLAN_hash_value = u.PLAN_hash_value
          and pa.hash_value = u.hash_value 
          and pa.address = u.address
       group by p.PLAN_HASH_VALUE, p.ID, p.DEPTH, p.POSITION, p.OPERATION, 
                  p.OPTIONS, p.COST, p.CARDINALITY, 
                  p.BYTES, p.OBJECT_NODE, p.OBJECT_OWNER, 
                  p.OBJECT_NAME, p.OTHER_TAG, p.PARTITION_START,
                  p.PARTITION_STOP, p.DISTRIBUTION
         ); 
select '---------------------------------------------------------------------------------------------------------------------------'
spool off
set feedback on
Prompt
Prompt   PayAttention! StatsPack.Snap MUST be at level 10 to Gather the SQL Execution Plan !
Prompt   variable x number
Prompt   exec dbms_job.submit(:x,'statspack.snap(i_snap_level=>10);',to_date('12062008:123000','ddmmyyyy:hh24miss'),'sysdate+1/48')
Prompt
Prompt   Ed SP-SQLPLAN.sql		@ SP-SQLPLAN.sql
Prompt
