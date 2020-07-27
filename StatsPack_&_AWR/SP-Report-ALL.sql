Rem
Rem $Header: spreport.sql 22-apr-2001.15:44:01 cdialeri Exp $
Rem
Rem spreport.sql
Rem
Rem  Copyright (c) Oracle Corporation 1999, 2000. All Rights Reserved.
Rem
Rem    NAME
Rem      spreport.sql
Rem
Rem    DESCRIPTION
Rem      This script defaults the dbid and instance number to that of the
Rem      current instance connected-to, then calls sprepins.sql to produce
Rem      the standard Statspack report.
Rem
Rem    NOTES
Rem      Usually run as the STATSPACK owner, PERFSTAT
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    Odécio      jun2008  - modified to generate a sequence of Snapshots
Rem    cdialeri    03/20/01 - 1747076
Rem    cdialeri    03/12/01 - Created
Rem

--
-- Get the current database/instance information - this will be used 
-- later in the report along with bid, eid to lookup snapshots
set lines 500 term on
column inst_num  heading "Inst Num"  new_value inst_num  format 99999;
column inst_name heading "Instance"  new_value inst_name format a12;
column db_name   heading "DB Name"   new_value db_name   format a12;
column dbid      heading "DB Id"     new_value dbid      format 9999999999 just c;
prompt
prompt ==========================================================================
prompt ==========================================================================
prompt ===                                                                    === 
prompt ===  Atencao: serao gerados todos os Snapshots do intervalo indicado   === 
prompt ===                                                                    === 
prompt ==========================================================================
prompt ==========================================================================
pause

prompt
prompt Current Instance
prompt ~~~~~~~~~~~~~~~~

select d.dbid            dbid
     , d.name            db_name
     , i.instance_number inst_num
     , i.instance_name   inst_name
  from v$database d,
       v$instance i;



-- Odécio jun2008 original
-- End of file

clear break compute;
repfooter off;
ttitle off;
btitle off;
set timing off veri off space 1 flush on pause off termout on numwidth 10;
set echo off feedback off pagesize 60 linesize 180 newpage 1 recsep off;
set trimspool on trimout on;
define top_n_events = 5;
define top_n_sql = 65;
define top_n_segstat = 5;
define num_rows_per_hash=5;


--
-- Request the DB Id and Instance Number, if they are not specified

column instt_num  heading "Inst Num"  format 99999;
column instt_name heading "Instance"  format a12;
column dbb_name   heading "DB Name"   format a12;
column dbbid      heading "DB Id"     format 9999999999 just c;
column host       heading "Host"      format a12;

prompt
prompt
prompt Instances in this Statspack schema
prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
select distinct 
       dbid            dbbid
     , instance_number instt_num
     , db_name         dbb_name
     , instance_name   instt_name
     , host_name       host
  from stats$database_instance;

prompt
prompt Using &&dbid for database Id
prompt Using &&inst_num for instance number


--
--  Set up the binds for dbid and instance_number

variable dbid       number;
variable inst_num   number;
begin
  :dbid      :=  &dbid;
  :inst_num  :=  &inst_num;
end;
/


--
--  Ask for the snapshots Id's which are to be compared

set termout on;
column instart_fmt noprint;
column inst_name   format a12  heading 'Instance';
column db_name     format a12  heading 'DB Name';
column snap_id     format 9999990 heading 'Snap|Id';
column snapdat     format a17  heading 'Snap Started' just c;
column lvl         format 99   heading 'Snap|Level';
column commnt      format a22  heading 'Comment';

break on inst_name on db_name on host on instart_fmt skip 1;

ttitle lef 'Completed Snapshots' skip 2;

select to_char(s.startup_time,' dd Mon "at" HH24:mi:ss') instart_fmt
     , di.instance_name                                  inst_name
     , di.db_name                                        db_name
     , s.snap_id                                         snap_id
     , to_char(s.snap_time,'dd Mon YYYY HH24:mi')        snapdat
     , s.snap_level                                      lvl
     , substr(s.ucomment, 1,60)                          commnt
  from stats$snapshot s
     , stats$database_instance di
 where s.dbid              = :dbid
   and di.dbid             = :dbid
   and s.instance_number   = :inst_num
   and di.instance_number  = :inst_num
   and di.dbid             = s.dbid
   and di.instance_number  = s.instance_number
   and di.startup_time     = s.startup_time
 order by db_name, instance_name, snap_id;

--    Odécio      jun2008  - modified to generate a sequence of Snapshots
--    início
--
select MIN(s.snap_id)                                         "MIN_snap_id"
     , MAX(s.snap_id)                                         "MAX_snap_id"
  from stats$snapshot s
     , stats$database_instance di
 where s.dbid              = :dbid
   and di.dbid             = :dbid
   and s.instance_number   = :inst_num
   and di.instance_number  = :inst_num
   and di.dbid             = s.dbid
   and di.instance_number  = s.instance_number
   and di.startup_time     = s.startup_time;

--    Odécio      jun2008  - modified to generate a sequence of Snapshots
--    Término
--

clear break;
ttitle off;


prompt
prompt
prompt Specify the Begin and End Snapshot Ids
prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt Begin Snapshot Id specified: &&begin_snap
prompt
prompt End   Snapshot Id specified: &&end_snap
prompt


--    Odécio      jun2008  - modified to generate a sequence of Snapshots
--    início
--
set feedback off verify off
spool SP-Repott-ALL-call.sql
declare
	inicio number:=&&begin_snap;
	final  number:=&&end_snap;
begin
	for i in inicio..final-1 loop
		dbms_output.put_line('@@sprepinsALL '||to_char(i)||' '||to_char(i+1)||' sp_PRD70_'||to_char(i)||'_'||to_char(i+1)||'.TXT');
	end loop;
end;
/
spool off
@SP-Repott-ALL-call.sql
host del /q SP-Repott-ALL-call.sql
--    Odécio      jun2008  - modified to generate a sequence of Snapshots
--    Término
--
prompt
prompt  Ed SP-Report-ALL.sql      @SP-Report-ALL.sql
prompt
