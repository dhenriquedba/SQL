set echo off
@login
set feedback off  verify off  pause off echo off linesize 200  pagesize  80  term off
spool QdAcTrNomeDate.sql
Select 'Spool '||Global_name||'_Solution_'||To_Char(SysDate,'ddmmyyyy_hh24miss')||'.log' from global_name;
Spool off
@QdAcTrNomeDate.sql
host del /q QdAcTrNomeDate.sql
set term on
set echo on feedback on

show parameter db_cache_size
show parameter shared_pool_size

alter system set db_cache_size=671088640 scope=both;
alter system set shared_pool_size=268435456 scope=both;

show parameter db_cache_size
show parameter shared_pool_size
spool off
