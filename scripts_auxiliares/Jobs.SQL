Column evento	heading 'Evento'			format a50
Column broken	heading 'Pa-|rado?'		format a4
Column failures	heading 'Fa-|lhas?'		format a4
Column job		heading 'Pro-|cesso #'	format 999999
Column what		heading 'Processo'
--		format a90
Column rodou	heading 'Ultima Execução'	format a26
set lines 1090 feedback off pages 40 
--
--@Refresh
--Select distinct (snaptime-0/24) LAST_REFRESH From sys.snap_reftime$;
--
select job, decode(broken,'N','Não','Sim') broken,
		nvl(to_char(failures),'Não') failures,
		to_char(last_date, 'dd/fmmonthfm/yyyy:hh24:mi:ss') rodou,
		to_char(NEXT_DATE, 'dd/fmmonthfm/yyyy:hh24:mi:ss') proximo,
--		Substr(what,1)
 what, schema_user, log_user
	from dba_jobs
order by 1
/
set lines 1900 feedback off pages 0 
Select '. Exec '||what
	from dba_jobs
--		Where job <> 41
union
Select '..             Exec Dbms_job.run('||job||')'
	from dba_jobs
--		Where job <> 41
/
set lines 1300 feedback on pages 40
prompt  .                    Select * from eventos order by 1;;
prompt  .				Se o processo nao estiver funcionando, executar:
prompt  .				      exec dbms_job.broken(<job>, FALSE)
prompt  .                           e depois, COMMIT
prompt
--prompt  ed Jobs  @Jobs  @Refresh  @RefreshError  @JobsRunning  @EnableConst  @ErrorConst
prompt  ed Jobs  @Jobs  @JobsRunning    @JobFalhas.sql
prompt
