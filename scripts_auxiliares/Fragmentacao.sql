Column segment_name	format a30
Column segment_type	format a7		heading Type
Column extents		format 9,999
Column mega			format 999,999.999
set lines 120 pages 500
set echo on
Spool Fragmentacao.txt
select segment_name, segment_type, count(*) extents,
sum(bytes)/1024/1024 mega
from dba_extents
where owner='CRIADOR'
group by segment_name, segment_type
order by 3 desc
/
spool off
set echo off
