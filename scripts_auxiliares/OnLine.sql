set echo on
select distinct status from dba_data_files
/
select distinct status from v$datafile
/
select distinct status from dba_tablespaces
/
set echo off

