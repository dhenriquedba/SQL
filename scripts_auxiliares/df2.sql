prompt by Mario Ko - ABN - dec2005

col file_name form a50
col kb        form 999,999,999

select file_id, 
       file_name, 
       bytes/1024 kb,
       autoextensible,
       (increment_by * &block)/1024,
       maxbytes/1024
from   dba_data_files
where  tablespace_name = upper('&tablespace')
order  by file_id
/
clear columns

