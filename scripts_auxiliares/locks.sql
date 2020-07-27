prompt by Mario Ko - ABN - dec2005

break on id1 skip 1

select id1, sid, type, id2, lmode, request, block, ctime
from v$lock
where (block != 0 or request != 0)
order by id1, block desc, request desc, ctime desc, sid
/
