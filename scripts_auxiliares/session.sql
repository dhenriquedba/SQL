prompt by Mario Ko - ABN - dec2005

col sid      form 9999
col spid     form 99999
col username form a13
col terminal form a13
col machine  form a27
col st       form a2  heading 'St'
col logtime  form a12 heading 'Logon'

select s.sid,
       s.serial#,
       p.spid,
       s.username, 
       substr(s.server, 1, 3) SVR, 
       s.terminal,
       s.machine,
       to_char(s.logon_time, 'dd-mm hh24:mi') logtime,
       decode(s.status, 'ACTIVE'  , 'A', 
                        'INACTIVE', 'I',
                        'KILLED'  , 'K', s.status) st
from   v$process p,
       v$session s
where  s.username != ' '
and    p.addr = s.paddr
order  by 6, 2, 1
/
