column file_name                                                      format a50
column EXTENT_MANAGEMENT         heading  'EXTENT|MANAGEMENT'         format a10
column ALLOCATION_TYPE           heading  'ALLOCATION|TYPE'           format a10
column PLUGGED_IN                heading  'PLUGGED|IN'                format a10
column SEGMENT_SPACE_MANAGEMENT  heading  'SEGMENT SPACE|MANAGEMENT'  format a15
column MBytes_now										format 999,999
column Mbytes_MAX										format 999,999
set lines 150

select file_name, bytes from dba_data_files
/
select file_name, bytes from dba_temp_files
/
select TABLESPACE_NAME, CONTENTS,EXTENT_MANAGEMENT, ALLOCATION_TYPE,
	PLUGGED_IN, SEGMENT_SPACE_MANAGEMENT
from dba_tablespaces
/
select tablespace_name, file_name, bytes/1024/1024 MBytes_now, autoextensible, maxbytes/1024/1024 Mbytes_MAX, user_bytes
from dba_data_files
order by 1,2
/

prompt
prompt    ed DataFiles                  @DataFiles
prompt


--select 'Alter tablespace '||tablespace_name||' segment space management auto;'
  from dba_tablespaces where tablespace_name <> 'SYSTEM';