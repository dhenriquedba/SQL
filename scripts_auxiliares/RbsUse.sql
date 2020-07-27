select r.name "Rollback", l.sid "OraSid", p.spid "OS_P_Id",
nvl(p.username,'NOUSER') Usuario, p.terminal
from v$lock l, v$process p, v$rollname r, v$session s
where l.sid = s.sid (+)
and s.paddr = p.addr
and trunc(l.id1(+)/65536) = r.usn
and l.type(+) = 'TX'
and l.lmode(+) = '6'
order by r.name
/
