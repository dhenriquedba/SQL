column rollback format a10
column waits    format 999,999
column gets     format 999,999,999
column tax      format 999.99
set lines 200 pages 50
select N.name Rollback,
     R.waits,
     R.gets,
     R.waits/R.gets*100 tax,
     E.qtde,
     E.Max  max_extent,
     E.Init initial_extent,
     E.Next next_extent
from v$rollstat R,
     v$rollname N,
     (Select e.segment_name Rollback,
             count(*) qtde,
             r.initial_extent Init,
             r.next_extent Next,
             r.max_extents Max
        from dba_extents e,
      dba_rollback_segs r
        where e.segment_name = r.segment_name
 Group by e.segment_name,
                 r.initial_extent,
                 r.next_extent,
   r.max_extents
        Order by Rollback) E
Where R.usn = N.usn
  and E.Rollback = n.name
/
prompt
prompt  ed RBS1		@RBS1          @RBSencolhe
prompt
