Rem
Rem $Header: awrrpt_all_prd3.sql 30-04-2008
Rem
Rem    NAME
Rem      awrrpt_all_prd3.sql
Rem
Rem    DESCRIPTION
Rem      Este script produz relatorios AWR de todos os snapshots do PRD3.
Rem      Execute este script conectado com DBA
Rem
Rem    MODIFIED   	(MM/DD/YYYY)
Rem    Flavio Cariri     30/04/2008 - Created
Rem

set echo off heading on underline on;
set linesize 120
set pages 20
set feed off
set serveroutput on
column inst_num  heading "Inst Num"  new_value inst_num  format 99999;
column inst_name heading "Instance"  new_value inst_name format a12;
column db_name   heading "DB Name"   new_value db_name   format a12;
column dbid      heading "DB Id"     new_value dbid      format 9999999999 just c;

prompt Current Instance
prompt ~~~~~~~~~~~~~~~~

select d.dbid            dbid
     , d.name            db_name
     , i.instance_number inst_num
     , i.instance_name   inst_name
  from v$database d,
       v$instance i;

select min(snap_id)      begin_snap
     , max(snap_id)      end_snap 
  from dba_hist_snapshot;
  
set pages 0  
prompt
prompt
prompt Specify the Begin and End Snapshot Ids
prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt Begin Snapshot Id specified: &&begin_snap
prompt
prompt End   Snapshot Id specified: &&end_snap
prompt

spool awrreport_prd3_all.sql
declare
       ini      number  := &&begin_snap;
       fim      number  := &&end_snap;
begin
       dbms_output.enable(50000);
       for i in ini..fim-1 loop            
            dbms_output.put_line('spool awrreport_PRD3_'||to_char(i)||'_'||to_char(i+1)||'.txt');
            dbms_output.put_line('select output from table(dbms_workload_repository.awr_report_text( 82233278, 1,'||to_char(i)||', '||to_char(i+1)||', 0 ));');
            dbms_output.put_line('spool off');
       end loop;
end;
/
spool off
@awrreport_prd3_all.sql