set lines 200 pages 90
column falhas format a6
column LOG_USER  heading 'User|log' format a22
column PRIV_USER heading 'User|Priv' format a22
column SCHEMA_USER heading 'User|Schema' format a22
column b heading 'bro|ken' format a3
select sysdate agora from dual
/
SELECT JOB, nvl(to_char(j.failures),'Não') falhas,  decode(broken,'Y','Sim','Não') b, 
        LAST_DATE, NEXT_DATE, 
	LOG_USER, PRIV_USER, SCHEMA_USER
       from dba_jobs j
	order by 2,3
/
set lines 90
prompt
prompt  ed JobFalhas  @Jobs  @JobsRunning    @JobFalhas.sql   @redo_activity
prompt