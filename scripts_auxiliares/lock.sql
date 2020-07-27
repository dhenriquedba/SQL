column OBJECT_TYPE format a17
column OBJECT format a30
break on id1 skip 1
set lines 150

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


prompt  
prompt ...    ed lock    @ lock   @ sess    @ jobsrunning     @vcom	@TempMon
prompt  
