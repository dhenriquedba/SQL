set pages 0 lines 20 feedback off
column estrutura format a25
column arquivo   format a55
column total	format 999,999,999,999
column livres 	align right

select 'Date: '||sysdate, 'Instance: '||instance_name, 'Server: '||host_name from v$instance;
set pages 150 lines 150

select d.tablespace_name estrutura, d.file_name arquivo, d.bytes total, to_char((f.bytes/d.bytes*100),'999.99') livres
	from dba_data_files d, dba_free_space f
		where d.tablespace_name = f.tablespace_name
		  and d.FILE_ID = f.FILE_ID
union 
select tablespace_name,           file_name,         bytes,	  'Não se aplica'
	from dba_temp_files
order by 4 desc
/
select sum(bytes) bytes   from (
select sum(bytes) bytes     from dba_data_files
union 
select sum(bytes) bytes     from dba_temp_files
union
select sum(l.bytes) bytes   from v$logfile f, v$log l where f.group# = l.group#
)
/
set feedback off
prompt 
prompt Ed FreeTBS         @ FreeTBS
prompt 
prompt 
