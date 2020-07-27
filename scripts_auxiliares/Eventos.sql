Column evento	heading 'Evento'			format a50
Column broken	heading 'Pa-|rado?'		format a4
Column failures	heading 'Fa-|lhas?'		format a4
Column job		heading 'Pro-|cesso #'	format 999
Column what		heading 'Processo'
Column rodou	heading 'Ultima Execução'	format a23
column evento format a270
select Instance_name from v$instance
/
set lines 500 feedback off pages 400
select job, decode(broken,'N','Não','Sim') broken,
		nvl(to_char(failures),'Não') failures,
		to_char(last_date, 'dd/fmmonthfm/yyyy:hh24:mi:ss') rodou,
		to_char(NEXT_DATE, 'dd/fmmonthfm/yyyy:hh24:mi:ss') proximo, what
	from dba_jobs
/
Select to_char(data,'ddmonyyyy:hh24:mi:ss') data, substr(evento,1,270) evento from eventos order by 1
/
