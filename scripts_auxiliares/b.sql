col perct format 999.9999
col opname format a40
select a.sid,b.username, a.opname, a.sofar/a.totalwork*100 perct
from v$session_longops a, v$session b
where a.sofar/a.totalwork < 1
and a.totalwork > 0
and b.sid = a.sid
order by 2
/
