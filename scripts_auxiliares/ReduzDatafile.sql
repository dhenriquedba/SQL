accept margem prompt 'Margem acima da soma de bytes (em Mb): '
set echo off feedback off pages 0 linesize 150
spool __ReduzDatafile_1.SQL

select 'alter database datafile '''||f.FILE_NAME||''' '||chr(10)
             ||' resize  '||(sum(e.BYTES)/1024+64+(&margem*1024))||' k;'
from dba_extents e, dba_data_files f
 where e.FILE_ID = f.FILE_ID
        and f.TABLESPACE_NAME = 'MANTAS_DATA'
 group by f.FILE_NAME
having sum(e.BYTES)/1024 <= sum(f.bytes)/1024/1024
order by substr(f.FILE_NAME,26)
/

spool off

spool __ReduzDatafile.Log
select sysdate inicio from dual;
set echo on
@ __ReduzDatafile_1.SQL
set feedback on
select sysdate termino from dual;
spool off

set echo off feedback on pages 30
Prompt
Prompt   Ed ReduzDatafile.SQL		@ ReduzDatafile.SQL
Prompt
