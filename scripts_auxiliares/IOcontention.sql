set lines 300 pages 66  verify off feedback off

column tsname format a20

variable bid number
variable eid number
variable dbid number
variable inst_num number
variable ela number
variable saida varchar2(40)
accept contlim prompt 'Contention Limit(percent): '
begin
	:bid := &Snapshot_Begin;
	:eid := &Snapshot_End;
	-- :dbid := 3853945233;  -- amld
	:dbid := 3838477732;   -- amlp
	:inst_num := 1;
	select
              round(((e.snap_time - b.snap_time) * 1440 * 60), 0) into :ela  -- secs
        from stats$snapshot b
                               , stats$snapshot e
        where b.snap_id         = :bid
   	  and e.snap_id         = :eid
   	  and b.dbid            = :dbid
   	  and e.dbid            = :dbid
   	  and b.instance_number = :inst_num
   	  and e.instance_number = :inst_num
   	  and b.startup_time    = e.startup_time
   	  and b.snap_time       < e.snap_time;
	:saida := 'IOcontention_'||:bid||'_'||:eid||to_char(sysdate,'ddmonyyyy_hh24mi')||'.txt';
end;
/
prompt
prompt
prompt
prompt  ================================
prompt  Tablespace IO summary statistics
prompt  ================================
prompt
col tsname     format a30           heading 'Tablespace';
col reads      format 9,999,999,990 heading 'Reads' newline;
col atpr       format 990.0         heading 'Av|Rd(ms)'     just c;
col writes     format 999,999,990   heading 'Writes';
col waits      format 9,999,990     heading 'Buffer|Waits'
col atpwt      format 990.0         heading 'Av Buf|Wt(ms)' just c;
col rps        format 99,999        heading 'Av|Reads/s'    just c;
col wps        format 99,999        heading 'Av|Writes/s'   just c;
col bpr        format 999.0         heading 'Av|Blks/Rd'    just c;
col ios        noprint
spool IOcontention_.txt
select e.tsname
     , sum (e.phyrds - nvl(b.phyrds,0))                     reads
     , sum (e.phyrds - nvl(b.phyrds,0))/:ela                rps
     , decode( sum(e.phyrds - nvl(b.phyrds,0))
             , 0, 0
             , (sum(e.readtim - nvl(b.readtim,0)) /
                sum(e.phyrds  - nvl(b.phyrds,0)))*10)       atpr
     , decode( sum(e.phyrds - nvl(b.phyrds,0))
             , 0, to_number(NULL)
             , sum(e.phyblkrd - nvl(b.phyblkrd,0)) /
               sum(e.phyrds   - nvl(b.phyrds,0)) )          bpr
     , sum (e.phywrts    - nvl(b.phywrts,0))                writes
     , sum (e.phywrts    - nvl(b.phywrts,0))/:ela           wps
     , sum (e.wait_count - nvl(b.wait_count,0))             waits
     , decode (sum(e.wait_count - nvl(b.wait_count, 0))
            , 0, 0
            , (sum(e.time       - nvl(b.time,0)) /
               sum(e.wait_count - nvl(b.wait_count,0)))*10) atpwt
     , sum (e.phyrds  - nvl(b.phyrds,0))  +
       sum (e.phywrts - nvl(b.phywrts,0))                   ios
  from stats$filestatxs e
     , stats$filestatxs b
 where b.snap_id(+)         = :bid
   and e.snap_id            = :eid
   and b.dbid(+)            = :dbid
   and e.dbid               = :dbid
   and b.dbid(+)            = e.dbid
   and b.instance_number(+) = :inst_num
   and e.instance_number    = :inst_num
   and b.instance_number(+) = e.instance_number
   and b.tsname(+)          = e.tsname
   and b.filename(+)        = e.filename
   and ( (e.phyrds  - nvl(b.phyrds,0)  )  +
         (e.phywrts - nvl(b.phywrts,0) ) ) > 0
 group by e.tsname
   having  decode( sum(e.phyrds - nvl(b.phyrds,0))
             , 0, 0
             , (sum(e.readtim - nvl(b.readtim,0)) /
                sum(e.phyrds  - nvl(b.phyrds,0)))*10)  >= &contlim 
union
select e.tsname                                             tbsp
     , sum (e.phyrds - nvl(b.phyrds,0))                     reads
     , sum (e.phyrds - nvl(b.phyrds,0))/:ela                rps
     , decode( sum(e.phyrds - nvl(b.phyrds,0))
             , 0, 0
             , (sum(e.readtim - nvl(b.readtim,0)) /
                sum(e.phyrds  - nvl(b.phyrds,0)))*10)       atpr
     , decode( sum(e.phyrds - nvl(b.phyrds,0))
             , 0, to_number(NULL)
             , sum(e.phyblkrd - nvl(b.phyblkrd,0)) /
               sum(e.phyrds   - nvl(b.phyrds,0)) )          bpr
     , sum (e.phywrts    - nvl(b.phywrts,0))                writes
     , sum (e.phywrts    - nvl(b.phywrts,0))/:ela           wps
     , sum (e.wait_count - nvl(b.wait_count,0))             waits
     , decode (sum(e.wait_count - nvl(b.wait_count, 0))
            , 0, 0
            , (sum(e.time       - nvl(b.time,0)) /
               sum(e.wait_count - nvl(b.wait_count,0)))*10) atpwt
     , sum (e.phyrds  - nvl(b.phyrds,0))  +
       sum (e.phywrts - nvl(b.phywrts,0))                   ios
  from stats$tempstatxs e
     , stats$tempstatxs b
 where b.snap_id(+)         = :bid
   and e.snap_id            = :eid
   and b.dbid(+)            = :dbid
   and e.dbid               = :dbid
   and b.dbid(+)            = e.dbid
   and b.instance_number(+) = :inst_num
   and e.instance_number    = :inst_num
   and b.instance_number(+) = e.instance_number
   and b.tsname(+)          = e.tsname
   and b.filename(+)        = e.filename
   and ( (e.phyrds  - nvl(b.phyrds,0)  )  +
         (e.phywrts - nvl(b.phywrts,0) ) ) > 0
 group by e.tsname
   having  decode( sum(e.phyrds - nvl(b.phyrds,0))
             , 0, 0
             , (sum(e.readtim - nvl(b.readtim,0)) /
                sum(e.phyrds  - nvl(b.phyrds,0)))*10)  >= &contlim
order by atpr desc;

prompt  ==================
prompt  File IO statistics
prompt  ==================
prompt

col tsname     format a24           heading 'Tablespace' trunc;
col filename   format a52           heading 'Filename'   trunc;
col reads      format 9,999,999,990 heading 'Reads'

break on tsname skip 1;

select e.tsname
     , e.filename
     , e.phyrds- nvl(b.phyrds,0)                       reads
     , (e.phyrds- nvl(b.phyrds,0))/:ela                rps
     , decode ((e.phyrds - nvl(b.phyrds, 0)), 0, to_number(NULL),
          ((e.readtim  - nvl(b.readtim,0)) /
           (e.phyrds   - nvl(b.phyrds,0)))*10)         atpr
     , decode ((e.phyrds - nvl(b.phyrds, 0)), 0, to_number(NULL),
          (e.phyblkrd - nvl(b.phyblkrd,0)) /
          (e.phyrds   - nvl(b.phyrds,0)) )             bpr
     , e.phywrts - nvl(b.phywrts,0)                    writes
     , (e.phywrts - nvl(b.phywrts,0))/:ela             wps
     , e.wait_count - nvl(b.wait_count,0)              waits
     , decode ((e.wait_count - nvl(b.wait_count, 0)), 0, to_number(NULL),
          ((e.time       - nvl(b.time,0)) /
           (e.wait_count - nvl(b.wait_count,0)))*10)   atpwt
  from stats$filestatxs e
     , stats$filestatxs b
 where b.snap_id(+)         = :bid
   and e.snap_id            = :eid
   and b.dbid(+)            = :dbid
   and e.dbid               = :dbid
   and b.dbid(+)            = e.dbid
   and b.instance_number(+) = :inst_num
   and e.instance_number    = :inst_num
   and b.instance_number(+) = e.instance_number
   and b.tsname(+)          = e.tsname
   and b.filename(+)        = e.filename
   and ( (e.phyrds  - nvl(b.phyrds,0)  ) +
         (e.phywrts - nvl(b.phywrts,0) ) ) > 0
   and decode ((e.phyrds - nvl(b.phyrds, 0)), 0, to_number(NULL),
          ((e.readtim  - nvl(b.readtim,0)) /
           (e.phyrds   - nvl(b.phyrds,0)))*10)  >= &contlim
union
select e.tsname
     , e.filename
     , e.phyrds- nvl(b.phyrds,0)                       reads
     , (e.phyrds- nvl(b.phyrds,0))/:ela                rps
     , decode ((e.phyrds - nvl(b.phyrds, 0)), 0, to_number(NULL),
          ((e.readtim  - nvl(b.readtim,0)) /
           (e.phyrds   - nvl(b.phyrds,0)))*10)         atpr
     , decode ((e.phyrds - nvl(b.phyrds, 0)), 0, to_number(NULL),
          (e.phyblkrd - nvl(b.phyblkrd,0)) /
          (e.phyrds   - nvl(b.phyrds,0)) )             bpr
     , e.phywrts - nvl(b.phywrts,0)                    writes
     , (e.phywrts - nvl(b.phywrts,0))/:ela             wps
     , e.wait_count - nvl(b.wait_count,0)              waits
     , decode ((e.wait_count - nvl(b.wait_count, 0)), 0, to_number(NULL),
          ((e.time       - nvl(b.time,0)) /
           (e.wait_count - nvl(b.wait_count,0)))*10)   atpwt
  from stats$tempstatxs e
     , stats$tempstatxs b
 where b.snap_id(+)         = :bid
   and e.snap_id            = :eid
   and b.dbid(+)            = :dbid
   and e.dbid               = :dbid
   and b.dbid(+)            = e.dbid
   and b.instance_number(+) = :inst_num
   and e.instance_number    = :inst_num
   and b.instance_number(+) = e.instance_number
   and b.tsname(+)          = e.tsname
   and b.filename(+)        = e.filename
   and ( (e.phyrds  - nvl(b.phyrds,0)  ) +
         (e.phywrts - nvl(b.phywrts,0) ) ) > 0
   and decode ((e.phyrds - nvl(b.phyrds, 0)), 0, to_number(NULL),
          ((e.readtim  - nvl(b.readtim,0)) /
           (e.phyrds   - nvl(b.phyrds,0)))*10)  >= &contlim
order by atpr desc;

spool off
set lines 90 pages 20  verify off feedback on
prompt
prompt  ed IOcontention			@IOcontention
prompt
