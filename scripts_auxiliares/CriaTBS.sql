spool CriaTBSdms1.sql
Select 'CREATE TABLESPACE '||tablespace_name||chr(10)||
         ' datafile '''||file_name||''' size '||bytes||' reuse'||chr(10)||
         ' AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K'||chr(10)||
         ' DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);'
from dba_data_files
/
spool off
