set linesize 200 arraysize 3 feedback off
column failures format a3
column interval format a40
column username format a10
column sid format 999999
select sysdate agora from dual
/
--select js.what, 
select  j.JOB, nvl(to_char(j.failures),'Não') failures, j.LAST_DATE, 
	j.THIS_DATE, u.username, j.sid                            --, js.interval
            from dba_jobs_running j, v$session u, dba_jobs js
		where j.sid=u.sid
		  and j.job = js.job
order by j.this_date
/
--set feedback on
PROMPT 
PROMPT  ed JobsRunning    @ sess         @ jobsrunning        @JobFalhas.sql    @ lock	@VCOM	@redo_activity
PROMPT 
