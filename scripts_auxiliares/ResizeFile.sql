select 'alter database datafile '''||a.file_name||''' resize '||(round(((a.bytes-f.bytes)/1024/1024),0)+100)||' m;'
 from dba_data_files a, (select sum(bytes) bytes, file_id from dba_free_space group by file_id) f
 where a.file_id = f.file_id
/
Prompt 
Prompt ed Resizefile		@Resizefile
Prompt 
