@login
set feedback off  verify off  pause off echo off linesize 200  pagesize  0  term off
spool QdAcTrNomeDate.sql
Select 'Spool '||instance_name||'_FileStatus_'||To_Char(SysDate,'ddmmyyyy_hh24mi')||'.TXT' from v$instance;
Spool off
@QdAcTrNomeDate.sql
host rm -rf QdAcTrNomeDate.sql
--host del /q QdAcTrNomeDate.sql
set term on pages 200
column name format a60
column tablespace_name format a60
set echo off feedback on
prompt
prompt Doing a CheCkpoint and 3 ReDo Switches 
Prompt to Force Oracles' processes to Register the effective File Status:
prompt
set echo on 
alter system checkpoint;
alter system switch logfile;
alter system switch logfile;
alter system switch logfile;
set echo off feedback off

select status, sum(qtty) qtty from (
select status, count(*) qtty
	from v$datafile
		group by status
union
select status, count(*) qtty
	from v$tempfile
		group by status
)
group by status
/
Prompt 
Prompt List of non ONLINE physical structures:
set feedback on
select status, name
	from V$datafile
		where status not in ('ONLINE', 'SYSTEM')
union
select status, name
	from v$tempfile
		where status not in ('ONLINE', 'SYSTEM')
union
select status, tablespace_name
	from dba_tablespaces
		where status not in ('ONLINE')
/

prompt
prompt list of all physical structures and its status:
select name, status from v$datafile
 union
 select name, status from v$tempfile
 union
 select tablespace_name, status from dba_tablespaces
/
 

prompt
prompt list of all physical structures on RECOVERY status:
select * from V$RECOVER_FILE
/

prompt
prompt lista de blocos corruptos
select * from V_$DATABASE_BLOCK_CORRUPTION;

Spool Off

Prompt 
Prompt select name, status from v$datafile
Prompt union
Prompt select name, status from v$tempfile
Prompt union
Prompt select tablespace_name, status from dba_tablespaces
Prompt /
Prompt 
Prompt select * from V$RECOVER_FILE
Prompt /
Prompt 
Prompt Ed filestatus.sql			@ filestatus.sql
Prompt 
