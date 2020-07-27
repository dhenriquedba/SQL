select substr(file_name,2,6)
							from dba_data_files 
								where substr(file_name,2,6) = 'amlp13'
/
select owner, segment_name
	from dba_segments
		where tablespace_name in (select tablespace_name 
							from dba_data_files 
								where substr(file_name,1,7) = '/amlp13')
order by 2
/
Prompt 
Prompt Ed Segs_x_file_sistem		@Segs_x_file_sistem
Prompt 
