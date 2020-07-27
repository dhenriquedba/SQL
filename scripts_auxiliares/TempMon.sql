set lines 120 pages 45 feedback off
prompt select 'alter database tempfile '''||file_name||''' autoextend on '||
prompt chr(10)||'              next 100m maxsize 4194368 K;'
prompt  from dba_temp_files

column file_name format a62
column tablespace format a11
column tablespace_name format a9
column AUTOEXTENSIBLE format a14
Column "MBytes Real" format 999,999,999
Column "GBytes Real" format 999,999
Column "MBytes Max" format 999,999,999
Column "GBytes Max" format 999,999
Column "GBytes" format 999,999
Column "MBytes" format 999,999
Column "KBytes" format 999,999,999

select AUTOEXTENSIBLE, file_name, bytes from dba_temp_files
order by substr(file_name,25)
;

Select TABLESPACE_NAME, count(*) files, 
	sum(BYTES)/1024/1024 "MBytes Real", 
	sum(BYTES)/1024/1024/1024 "GBytes Real",
	sum(decode(MAXBYTES,0,BYTES,MAXBYTES))/1024/1024 "MBytes Max", 
	sum(decode(MAXBYTES,0,BYTES,MAXBYTES))/1024/1024/1024 "GBytes Max"
from dba_temp_files
group by TABLESPACE_NAME
;

SELECT tablespace_name,
       extent_size*8192/1024/1024 "ExtSize(MB)",
       total_extents,
       used_extents,
       free_extents,
       max_used_size
FROM   v$sort_segment;

set feedback on

SELECT s.sid,
	 s.serial#,
	 s.username,
       u.TABLESPACE,
--       u.CONTENTS,
       u.extents,
       u.blocks*8192 bytes
FROM   v$session s,
       v$sort_usage u
WHERE  s.saddr = u.session_addr
order by bytes;
set feedback off

SELECT s.username, u.tablespace,
       sum(u.blocks)*8192 bytes, sum(u.blocks)*8192/1024 KBytes, 
	 sum(u.blocks)*8192/1024/1024 MBytes, sum(u.blocks)*8192/1024/1024/1024 GBytes, sysdate
FROM   v$session s,
       v$sort_usage u
WHERE  s.saddr = u.session_addr
GROUP BY s.username, u.tablespace;
set feedback on
Prompt
Prompt  Atençao: Considera-se um DataBlock de 8k para a TEMP !
Prompt
Prompt  Ed TempMon       @TempMon
Prompt
