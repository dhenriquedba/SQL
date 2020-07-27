Spool tempprd51.log
set echo on
drop tablespace lixo
	including contents and datafiles
/
create temporary tablespace lixo tempfile 'd:\LIXO.DBF'
 size 100m autoextend on next 100m maxsize 8000m
EXTENT MANAGEMENT LOCAL UNIFORM SIZE 51200K
/
ALTER DATABASE DEFAULT TEMPORARY TABLESPACE lixo
/
drop tablespace TSTEMP1 
	including contents and datafiles
/
create temporary tablespace TSTEMP1 tempfile 'K:\ORA\U04\ORADATA\PRD51\DATA\TSTEMP1A.DBF'
 size 100m reuse autoextend on next 1024m maxsize 23400m
EXTENT MANAGEMENT LOCAL UNIFORM SIZE 51200K
/
ALTER DATABASE DEFAULT TEMPORARY TABLESPACE TSTEMP1
/
alter tablespace TSTEMP1 add tempfile 'K:\ORA\U04\ORADATA\PRD51\DATA\TSTEMP1B.DBF'
 size 100m reuse autoextend on next 1024m maxsize 23400m
/
drop tablespace lixo
	including contents and datafiles
/
set echo off
spool off
           