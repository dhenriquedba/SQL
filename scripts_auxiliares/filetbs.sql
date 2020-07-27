@login
set feedback off  verify off  pause off echo off linesize 200  pagesize  0  term off
spool QdAcTrNomeDate.sql
Select 'Spool '||instance_name||'_TbsFile_'||To_Char(SysDate,'ddmonyyyy_hh24mi')||'.TXT' from v$instance;
Spool off
@QdAcTrNomeDate.sql
host del /q QdAcTrNomeDate.sql
set term on
set  feedback off
column estrutura format a25
column arquivo   format a57
column bytes format  999,999,999,999
column Kbytes format 999,999,999.999
column Mbytes format 999,999.999
column Gbytes format 999.999
break on tablespace_name
compute sum of bytes on tablespace_name
select 'Date: '||sysdate||chr(10)||'Instance: '||instance_name||chr(10)||'Server: '||host_name from v$instance;
set pages 150 lines 200
prompt =====================
prompt Estrutura Tablespaces
prompt =====================
select tb.tablespace_name, tb.block_size, tb.extent_management, tb.allocation_type, tb.segment_space_management, df.file_name, sum(df.bytes)/1024/1024 Mbytes
	from dba_data_files df, dba_tablespaces tb
		where df.tablespace_name = tb.tablespace_name
	group by tb.tablespace_name, df.file_name, tb.block_size, tb.extent_management, tb.allocation_type, tb.segment_space_management, sum(tf.bytes)/1024/1024 Mbytes
union 
select tb.tablespace_name, tb.block_size, tb.extent_management, tb.allocation_type, tb.segment_space_management, tf.file_name
	from dba_temp_files tf, dba_tablespaces tb
		where tf.tablespace_name = tb.tablespace_name
	group by tb.tablespace_name, tf.file_name, tb.block_size, tb.extent_management, tb.allocation_type, tb.segment_space_management
order by 1, 2 -- tablespace_name
-- order by 2 -- arquivo
/
select tb.tablespace_name, tb.block_size, tb.extent_management, tb.allocation_type, tb.segment_space_management --, df.file_name, sum(df.bytes)/1024/1024 Mbytes
	from dba_data_files df, dba_tablespaces tb
		where df.tablespace_name = tb.tablespace_name
	group by tb.tablespace_name, df.file_name, tb.block_size, tb.extent_management, tb.allocation_type, tb.segment_space_management, sum(tf.bytes)/1024/1024 Mbytes
union 
select tb.tablespace_name, tb.block_size, tb.extent_management, tb.allocation_type, tb.segment_space_management --, tf.file_name
	from dba_temp_files tf, dba_tablespaces tb
		where tf.tablespace_name = tb.tablespace_name
	group by tb.tablespace_name, tf.file_name, tb.block_size, tb.extent_management, tb.allocation_type, tb.segment_space_management
order by 1
/
prompt ======================
prompt Management Tablespaces
prompt ======================
select tb.tablespace_name, tb.block_size, tb.extent_management, tb.allocation_type, tb.initial_extent, tb.segment_space_management
	from dba_tablespaces tb
order by 1
/


prompt =============================
prompt Espaço ocupado pelos arquivos
prompt =============================
select sum(qtty) qtty, sum(bytes) bytes, sum(bytes)/1024 Kbytes, sum(bytes)/1024/1024 Mbytes, sum(bytes)/1024/1024/1024 Gbytes  from (
select count(*) qtty, sum(bytes) bytes     from dba_data_files
union
select count(*) qtty, sum(bytes) bytes     from dba_temp_files
union
select 0 qtty, sum(l.bytes) bytes   from v$logfile f, v$log l where f.group# = l.group#
)
/
prompt =========================
prompt Espaço livre nos arquivos
prompt =========================
select sum(bytes) bytes, sum(bytes)/1024 Kbytes, sum(bytes)/1024/1024 Mbytes, sum(bytes)/1024/1024/1024 Gbytes  from dba_free_space
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
prompt Ed tbsfile.sql         @ tbsfile.sql
prompt 
prompt 
