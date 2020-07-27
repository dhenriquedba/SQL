@login
--accept destino prompt 'Diretório de destino: '
accept pais prompt 'País de origem: '

set feedback off  verify off  pause off echo off pages 0 lines 80
spool copiafiles_&pais..sql

--select 'nohup cp '||arquivo||' /oradata66/safe/&pais &'
select 'cp '||arquivo||' /oradata66/safe/&pais'
from (
select	file_name arquivo			from dba_data_files
union 
select	file_name				from dba_temp_files
union
select 	member					from v$logfile
union
select	name					from  v$controlfile
union
select	ltrim(value,'location=')||'/*'		from v$parameter
	 where name = 'log_archive_dest_1'
)
order by 1
/


spool off

set feedback on pages 50
prompt 
prompt Ed copiafiles         @ copiafiles
prompt 
