compute sum of physical_reads on report
break on report
set lines 200 feedback off
col username format a15
col physical_reads format 999,999,999
col event format a35
col p3text format a25
col name format a30
col filesys format a30
select a.sid,
       a.username,
       b.event,
       c.name,
       d.physical_reads,
       substr(e.name,28,30) filesys
from v$session a, v$session_wait b, v$latch c, V$SESS_IO D,  V$DATAFILE E
where a.username is not null
and   b.sid (+) = a.sid
and   b.event != 'SQL*Net message from client'
and   c.latch# (+) = b.p2
and   e.file# (+) = b.p1
AND D.SID    = A.SID
order by 1
/
set lines 200 feedback on
