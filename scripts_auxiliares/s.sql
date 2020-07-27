set lines 200
col username format a12
col event format a40
col p3text format a20
col name format a30
select a.sid, a.serial#, a.username, b.event, status, to_char(a.logon_time,'dd/mm/yyyy hh24:mi:ss') logon
from v$session a, v$session_wait b, v$latch c
where b.sid (+) = a.sid
and   c.latch# (+) = p2
and   a.username is not null
order by 5 desc
/
