SELECT COUNT(*) "Sessões a assassinar do PAW08"
FROM V$SESSION s
where machine like '%PAW08%'
  and status <> 'ACTIVE'
and logon_time <= sysdate-1/24
/
set pages 0 feedback off
spool AssassinaPaw08.sql
SELECT 'ALTER SYSTEM KILL SESSION '''||s.SID||', '||s.SERIAL#||''' IMMEDIATE;' MATAR
FROM V$SESSION s
where machine like '%PAW08%'
  and status <> 'ACTIVE'
and logon_time <= sysdate-1/24
/
spool off
set pages 30 feedback on
@AssassinaPaw08.sql
prompt
prompt
prompt ed KillPaw08         @  KillPaw08           @countpaw08
prompt
prompt

