Column evento	heading 'Evento'			format a50
Column broken	heading 'Pa-|rado?'		format a4
Column failures	heading 'Fa-|lhas?'		format a4
Column job		heading 'Pro-|cesso #'	format 999
Column what		heading 'Processo'
Column rodou	heading 'Ultima Execução'	format a23
set lines 1090 feedback off pages 40 

exec dbms_job.next_date(1, to_date('05092004230000','ddmmyyyyhh24miss'))
exec dbms_job.next_date(7, to_date('06092004020000','ddmmyyyyhh24miss'))
commit
/

variable x number
exec dbms_job.submit(:x, 'dbms_job.broken(1, True);', to_date('06092004020000','ddmmyyyyhh24miss'), 'sysdate+1000')
commit
/



exec dbms_job.interval(74, 'sysdate+5/1440')
commit
/

select job, decode(broken,'N','Não','Sim') broken,
		nvl(to_char(failures),'Não') failures,
		to_char(last_date, 'dd/fmmonthfm/yyyy:hh24:mi:ss') rodou,
		to_char(NEXT_DATE, 'dd/fmmonthfm/yyyy:hh24:mi:ss') proximo,
		what
	from user_jobs
order by 4
/
pause ...
exec dbms_job.change(74, 'statspack.snap;', trunc(sysdate)+19/24, 'sysdate+5/1440')
exec dbms_job.broken(74, FALSE)
commit
/

select job, decode(broken,'N','Não','Sim') broken,
		nvl(to_char(failures),'Não') failures,
		to_char(last_date, 'dd/fmmonthfm/yyyy:hh24:mi:ss') rodou,
		to_char(NEXT_DATE, 'dd/fmmonthfm/yyyy:hh24:mi:ss') proximo,
		what
	from user_jobs
order by 4
/
set lines 1900 feedback off pages 0 
Select '. Exec '||what
	from user_jobs
union
Select '..             Exec Dbms_job.run('||job||')'
	from user_jobs
/
set lines 1300 feedback on pages 40



/*
variable x number
exec dbms_job.submit(:x, 'statspack.snap;', sysdate, 'sysdate+5/1440')
commit;
print x
*/

Prompt    
Prompt    Ed JobChange       @ JobChange
Prompt
