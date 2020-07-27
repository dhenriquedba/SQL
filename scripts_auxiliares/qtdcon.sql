set feedback off
SELECT  username, count(*)
  FROM V$SESSION
          WHERE USERNAME like 'MONITOR%'
	group by username
Union
SELECT  'Outros', count(*)
  FROM V$SESSION
          WHERE USERNAME is not null
	    and USERNAME not like 'MONITOR%'
	group by 'Outros'
Union
SELECT  'Soma', count(*)
  FROM V$SESSION
          WHERE USERNAME is not null
	group by 'Soma'
--Union
-- SELECT  server, count(*)
--  FROM V$SESSION 
--          WHERE USERNAME is not null
-- group by server
/
set feedback on
