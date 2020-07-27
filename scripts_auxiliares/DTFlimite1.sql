-- limite = 2Gb + 64 k para bitmap = 2147549184 ou 2097216 Kb
set pages 0 lines 120


select 'Alter database datafile '''||
	 file_name||''' autoextend on maxsize  2097216k;'
		from dba_data_files
/

select 'Alter database add datafile '''||
	 file_name||''' autoextend on maxsize  2097216k;'
		from dba_data_files
			where bytes >= 192518553   --(1.8*1024*1024*1024)
/

spool lixo.sql
prompt spool lixo.log
select tablespace_name, file_name, bytes,
 'Alter tablespace '||tablespace_name||' add datafile '''||
   file_name||''' size M autoextend on maxsize  2097216k;'
   from dba_data_files
	where tablespace_name in (select tablespace_name
						from dba_data_files
							group by tablespace_name
								having sum(bytes) >= 1932735283)
 order by 1,2
/
prompt spool off
spool off

select tablespace_name, bytes
   from dba_data_files
	where tablespace_name in (select tablespace_name
						from dba_data_files
							group by tablespace_name
								having sum(bytes) >= 1932735283)
 order by 1,2
/