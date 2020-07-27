column Arquivos format 999,999,999,999
column Livres format 999,999,999,999
column Ocupados format 999,999,999,999


select sum(a.bytes) "Arquivos"
from dba_data_files a
       where a.tablespace_name not in ('SYSTEM', 'TEMP', 'RBS')
    and a.tablespace_name not in  (select tablespace_name
     from dba_tablespaces
       where tablespace_name like '%ARR%')
/


select sum(f.bytes) "Livres"
from dba_free_space f
  where f.tablespace_name not in ('SYSTEM', 'TEMP', 'RBS')
    and f.tablespace_name not in  (select tablespace_name
     from dba_tablespaces
       where tablespace_name like '%ARR%')
/
prompt tabelas
select sum(AVG_ROW_LEN*NUM_ROWS) bytes  from user_tables;

Prompt
Prompt   Ed Esp                @ Esp
Prompt
