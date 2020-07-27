@login
set feedback off
select ROUND(avg(COUNT(*))) "Avg switches"
 from v$log_history
  group by trunc(first_time)
/
select distinct round(bytes/1024/1024/1024,3) "Arch SIZE GB" from v$log
/
set feedback on
Prompt
prompt ed ARCH     @ ARCH