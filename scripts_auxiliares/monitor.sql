set verify off linesize 300 pagesize 500 feedback off
column program                          format a27
column username				format a14
column sid				format 999
column serial#				format 999999
column machine				format a10
column osuser				format a10
column status				format a15
column X 	heading 'Conectou em'	format a16
column status				format a8
column OBJECT_TYPE format a17
break on id1 skip 1
prompt =>> =>> =>> =>> =>> =>> LOCK
SELECT SUBSTR(OBJ.OBJECT_NAME,1,30) OBJECT, 
	OBJ.OBJECT_TYPE, LCK.SESSION_ID, LCK.ORACLE_USERNAME
FROM V$LOCKED_OBJECT LCK, DBA_OBJECTS OBJ 
WHERE LCK.OBJECT_ID=OBJ.OBJECT_ID
/
prompt =>> =>> =>> =>> =>> =>> BLOCK
select id1, sid, type, id2, lmode, request, block, ctime
from v$lock
where (block != 0 or request != 0)
order by id1, block desc, request desc, ctime desc, sid
/
prompt =>> =>> =>> =>> =>> =>> KDD_WEB's sessions
SELECT s.SID, s.SERIAL#, nvl(s.USERNAME,substr(s.PROGRAM,10)) username, p.spid, s.PROGRAM,
      s.osuser,
	to_char(s.logon_time,'hh24:mi"em"DDmonyyyy') X,
	 s.status									---, s.program
	FROM V$SESSION s, V$PROCESS p
		WHERE s.PADDR = p.ADDR
		  and s.USERNAME = 'KDD_WEB'
	Order by s.logon_time, nvl(s.USERNAME,substr(s.PROGRAM,12)), s.status
/
define query_one = 3036186408
define query_two = 11887150103036186408
--select sql_text, executions, to_char(sysdate,'hh24:mi:ss') agora     
--from v$sql
--where hash_value in (&query_one,&query_two);
set feedback on
prompt  
prompt ...	@ lock	@ sess	@vcom	@TempMon	@Monitor	Ed Monitor
prompt  
