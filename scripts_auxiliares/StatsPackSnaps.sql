rem variable x number
rem exec dbms_job.submit(:x,'statspack.snap;',sysdate,'sysdate+1/24')
set lines 120
column inst_num		heading "Inst Num"	new_value inst_num  format 99999;
column inst_name		heading "Instance"	new_value inst_name format a8;
column db_name		heading "DB Name"		new_value db_name   format a12;
column dbid			heading "DB Id"		new_value dbid      format 9999999999 just center
column host_name		heading "Host|Name"	format a10
column VERSN		heading "Version"		format a9
column SNAP_ID		heading "Snap|Id"		format 999,999 just center
column SNAPDAT		heading "Sanp|Date"	format a17
column level		heading "Le-|vel"		format 99
column comment		heading "Comment"		format a9
column instart_fmt	heading "Started At"		format a19

set feedback off
select d.dbid            dbid
     , d.name            db_name
     , i.instance_number inst_num
     , i.instance_name   inst_name
	, to_char(i.startup_time,' dd Mon":"HH24:mi:ss') instart_fmt
  from v$database d,
       v$instance i;

variable dbid       number;
variable inst_num   number;
variable inst_name  varchar2(20);
variable db_name    varchar2(20);
begin 
  :dbid      :=  &dbid;
  :inst_num  :=  &inst_num; 
  :inst_name := '&inst_name';
  :db_name   := '&db_name';
end;
/
define top_n_events = 5;
define top_n_sql = 65;
define num_rows_per_hash=5;
set feedback on
select di.instance_name                                  inst_name
     , di.host_name                                      host_name
     , di.db_name                                        db_name
     , di.version                                        versn
     , di.parallel                                       "//"
--     , to_char(s.startup_time,' dd Mon "at" HH24:mi:ss') instart_fmt
     , s.snap_id
     , to_char(s.snap_time,'dd Mon YYYY HH24:mi')       snapdat
     , s.snap_level                                      "level"
     , substr(s.ucomment, 1,60)                          "comment"
  from stats$snapshot s
     , stats$database_instance di
 where s.dbid              = :dbid
   and di.dbid             = :dbid
   and s.instance_number   = :inst_num
   and di.instance_number  = :inst_num
   and di.startup_time     = s.startup_time
--   and di.startup_time     >= sysdate-1
 order by db_name, instance_name, snap_id
/

Prompt
Prompt Ed StatsPackSnaps       @ StatsPackSnaps          @ sigt  @qtdusr      @spreport
Prompt
