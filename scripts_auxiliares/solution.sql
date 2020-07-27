set echo off feedback off pages 0 linesize 150
spool solution_1.SQL
select 'create tablespace TS_DATA datafile '||chr(10)
     ||'         '''||substr(file_name,1,(instr(file_name,'5')-1))||'01.dbf'''||' SIZE 500M'||chr(10)
     ||'         REUSE AUTOEXTEND ON NEXT 10M MAXSIZE 2097152K'||chr(10)
     ||'         	EXTENT MANAGEMENT LOCAL UNIFORM SIZE 56k'||chr(10)
     ||'         SEGMENT SPACE MANAGEMENT AUTO'||chr(10)
     ||'         	permanent online'||chr(10)
     ||'/         '||chr(10)
from dba_data_files
where tablespace_name = 'TS_DATA_56K'
union
select 'create tablespace TS_IDX datafile '||chr(10)
     ||'         '''||substr(file_name,1,(instr(file_name,'5')-1))||'01.dbf'''||' SIZE 200M'||chr(10)
     ||'         REUSE AUTOEXTEND ON NEXT 10M MAXSIZE 2097152K'||chr(10)
     ||'         	EXTENT MANAGEMENT LOCAL UNIFORM SIZE 56k'||chr(10)
     ||'         SEGMENT SPACE MANAGEMENT AUTO'||chr(10)
     ||'         	permanent online'||chr(10)
     ||'/         '||chr(10)
from dba_data_files
where tablespace_name = 'TS_IDX_56K'
/
spool off
column file_name format a70
set feedback off  verify off  pause off echo off linesize 200  pagesize  80  term off
spool QdAcTrNomeDate.sql
Select 'Spool '||Global_name||'_Solution_'||To_Char(SysDate,'ddmmyyyy_hh24miss')||'.log' from global_name;
Spool off
@QdAcTrNomeDate.sql
host del /q QdAcTrNomeDate.sql
set term on
set echo on feedback on
@ solution_1.SQL
alter user stagdba default tablespace TS_DATA
/
set echo off
prompt
pause ok_to_drop_the_old_ones_?_<Ctrl>_+_<C>ancel__<Enter>_to_confirm_!
prompt
pause are_you_sure_?
set echo on
drop tablespace TS_DATA_56K including contents and datafiles
/
drop tablespace TS_IDX_56K including contents and datafiles
/
select default_tablespace from dba_users where username='STAGDBA'
/
select tablespace_name, file_name from dba_data_files
where tablespace_name like '%TS%'
/
spool off
set echo off feedback on pages 30
Prompt
Prompt
Prompt   Please, send the file "solution_1.Log" to odecio.souza@br.abnamro.com
Prompt
Prompt
Prompt   Ed solution.SQL		@ solution.SQL
Prompt
Prompt
