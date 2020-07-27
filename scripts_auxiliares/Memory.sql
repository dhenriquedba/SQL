--alter user lc000780 identified by senhanew;
@login
set feedback off  verify off  pause off echo off linesize 200  pagesize  0  term off
spool QdAcTrNomeDate.sql
Select 'Spool '||instance_name||'_Memory_'||To_Char(SysDate,'ddmmyyyy_hh24miss')||'.TXT' from v$instance;
Spool off
@QdAcTrNomeDate.sql
host del /q QdAcTrNomeDate.sql
set term on
set  feedback off
column name	format a25
column value	format a25
column bytes format  999,999,999,999
column Kbytes format 999,999,999.999
column Mbytes format 999,999.999
column Gbytes format 999.999
break on tablespace_name
compute sum of bytes on tablespace_name
select 'Date: '||sysdate||chr(10)||'Instance: '||instance_name||chr(10)||'Server: '||host_name from v$instance;
set pages 150 lines 200
select Name, value
	from v$parameter 
		where name like '%sga%'
		   or name like '%pool%'
		   or name in  ('sort_area_size', 'sort_area_retained_size', 'compatible', 'db_block_buffers', 
				'log_buffer', 'shared_pool_size')
/







select sum(qtty) qtty, sum(bytes) bytes, sum(bytes)/1024 Kbytes, sum(bytes)/1024/1024 Mbytes, sum(bytes)/1024/1024/1024 Gbytes  from (
select count(*) qtty, sum(bytes) bytes     from dba_data_files
union
select count(*) qtty, sum(bytes) bytes     from dba_temp_files
union
select 0 qtty, sum(l.bytes) bytes   from v$logfile f, v$log l where f.group# = l.group#
)
/
spool off
--Select substr(file_name,2,4) disco, sum(bytes) bytes
--from (
--select file_name, bytes from dba_data_files
--union
--select file_name, bytes from dba_temp_files)
--group by rollup (substr(file_name,2,4))
--/
Prompt 
Prompt select segment_name, segment_type, count(*) extents
Prompt from dba_extents
Prompt where tablespace_name = ''
Prompt group by segment_name, segment_type;;
Prompt 
set feedback on
prompt 
prompt Ed FileBytes         @ FileBytes
prompt 
prompt 
