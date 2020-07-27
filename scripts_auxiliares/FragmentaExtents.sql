column qtd format 999,999
column segment_name format a30
select owner, segment_name, count(*) qtd, sum(bytes) bytes
from dba_extents
where owner not in ('SYS','SYSTEM','OUTLN')
group by owner, segment_name
having count(*) >=10
order by qtd desc
/
pause Extents listados quando  Qtd >=10
