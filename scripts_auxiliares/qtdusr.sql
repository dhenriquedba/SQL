select sysdate, count(*) from v$session where username = 'SSIGT' group by sysdate
/
