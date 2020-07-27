-- from Oracle's METALINK Note:146631.1
select s.sid,s.status,s.program,w.event,w.p1,w.p2 
 from v$session s,v$transaction t,v$session_wait w 
 where s.taddr=t.addr and s.sid=w.sid; 

