select 'alter database rename file '''||name||''' to '''||name||''';'
from v$datafile
union
select 'alter database rename file '''||name||''' to '''||name||''';'
 from v$tempfile
/



alter database rename file '/u01/app/oracle/admin/amlsta/data/system01.dbf' to '/oradata01/amlsta/system01.dbf';
alter database rename file '/u01/app/oracle/admin/amlsta/data/temp01.dbf' to '/oradata01/amlsta/temp01.dbf';
alter database rename file '/u01/app/oracle/admin/amlsta/data/tools01.ora' to '/oradata01/amlsta/tools01.ora';
alter database rename file '/u01/app/oracle/admin/amlsta/data/ts_data_01.dbf' to '/oradata01/amlsta/ts_data_01.dbf';
alter database rename file '/u01/app/oracle/admin/amlsta/data/ts_idx_01.dbf' to '/oradata01/amlsta/ts_idx_01.dbf';
alter database rename file '/u01/app/oracle/admin/amlsta/data/undots01.dbf' to '/oradata01/amlsta/undots01.dbf';
alter database rename file '/u01/app/oracle/admin/amlsta/data/users01.ora' to '/oradata01/amlsta/users01.ora';


create temporary tablespace lixo tempfile '/oradata01/amlsta/lixo01.dbf'
 size 100m autoextend on next 100m maxsize 8000m
EXTENT MANAGEMENT LOCAL UNIFORM SIZE 51200K
/
ALTER DATABASE DEFAULT TEMPORARY TABLESPACE lixo
/
drop tablespace temporary 
	including contents and datafiles
/
create TEMPORARY TABLESPACE temporary  tempfile
		'/oradata01/amlsta/temp01.dbf' size 50m 
			REUSE AUTOEXTEND ON NEXT 10M MAXSIZE 2097152K
				EXTENT MANAGEMENT LOCAL UNIFORM SIZE 1M
/
ALTER DATABASE DEFAULT TEMPORARY TABLESPACE TEMPORARY
/
drop tablespace lixo
	including contents and datafiles
/



select name, status from v$datafile
union
select name, status from v$tempfile
union
select tablespace_name, status from dba_tablespaces
union
select tablespace_name, status from dba_tablespaces
;


