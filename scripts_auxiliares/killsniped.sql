/*

set feedback off  verify off  pause off echo off linesize 200  pagesize  0  term off
spool QdAcTrNomeDate.sql
SELECT 'ALTER SYSTEM KILL SESSION '''||s.SID||', '||s.SERIAL#||''' IMMEDIATE;' MATAR
FROM V$SESSION s
WHERE s.USERNAME is not null and s.status = 'SNIPED';
spool off
set feedback on  verify off  pause off echo on linesize 200  pagesize  30  term on
@QdAcTrNomeDate.sql
host del /q QdAcTrNomeDate.sql
set echo off

*/
set echo on
exec adm.P_KILL_SNIPED

set echo off
Prompt
prompt @countsige	ed killsniped	@killsniped
prompt

