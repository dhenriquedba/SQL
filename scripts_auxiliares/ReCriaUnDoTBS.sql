spool undots.log
set echo on

Create undo tablespace lixo
	datafile '/oradata66/lixoundo.tbs' size 1000m
		extent  management local autoallocate
/
alter system set undo_tablespace=lixo scope = both
/
drop tablespace undots --including contents and datafiles
/
set echo off
pause OK_?
set echo on
create undo tablespace undo_ts
datafile '/oradata29/amlp/undots01.dbf' size 4000m reuse 
	autoextend on next 100m maxsize 5500064 k
		extent  management local autoallocate
/
alter tablespace undo_ts
add datafile '/oradata30/amlp/undots02.dbf' size 4000m reuse 
	autoextend on next 100m maxsize 5500064 k
/
alter tablespace undo_ts
add datafile '/oradata31/amlp/undots03.dbf' size 4000m reuse 
	autoextend on next 100m maxsize 5500064 k
/
alter tablespace undo_ts
add datafile '/oradata32/amlp/undots04.dbf' size 4000m reuse 
	autoextend on next 100m maxsize 5500064 k
/
alter system set undo_tablespace=undo_ts scope = both
/
drop tablespace lixo including contents and datafiles
/
show parameter undo

spool off
set echo off
