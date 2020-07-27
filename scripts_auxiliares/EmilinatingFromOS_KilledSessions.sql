select spid, program
from v$process where program != ‘PSEUDO’
and addr not in
(select paddr from v$session);  and of course avoid killing background processes

select spid, program from v$process
where program!= ‘PSEUDO’
and addr not in (select paddr from v$session)
and addr not in (select paddr from v$bgprocess);

Thanks to 11g  there are two new columns in v$session view :

CREATOR_ADDR - state object address of creating process
CREATOR_SERIAL# - serial number of creating process

CREATOR_ADDR is the column that can be joined with the PADDR column in V$PROCESS to uniquely identify
the killed process corresponding to the former session.


CREATOR_ADDR is the column that can be joined with the PADDR column in V$PROCESS to uniquely identify
the killed process corresponding to the former session.

So new query would look like:

select * from v$process where addr=(select creator_addr from v$session where sid=< sid used in alter system kill session command >);

In addition to these columns there are views

V$DETACHED_SESSION

V$PROCESS_GROUP

which can help in resolving this issue



prompt
prompt  Ed EmilinatingFromOS_KilledSessions.sql      @EmilinatingFromOS_KilledSessions.sql
prompt
