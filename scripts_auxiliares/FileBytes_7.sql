set pages 0 lines 20 feedback off
column estrutura format a25
column arquivo   format a55
column Kbytes format 999,999,999.999
column Mbytes format 999,999.999
column Gbytes format 999.999

set pages 150 lines 200
select tablespace_name estrutura, file_name arquivo, bytes     from dba_data_files
union 
select 'ReDo',                    f.member,          l.bytes   from v$logfile f, v$log l where f.group# = l.group#
union
select 'Control File',            name,              0         from  v$controlfile
order by 1
--order by 3 desc
/
select sum(bytes) bytes, sum(bytes)/1024 Kbytes, sum(bytes)/1024/1024 Mbytes, sum(bytes)/1024/1024/1024 Gbytes  from (
select sum(bytes) bytes     from dba_data_files
union 
select sum(l.bytes) bytes   from v$logfile f, v$log l where f.group# = l.group#
)
/
