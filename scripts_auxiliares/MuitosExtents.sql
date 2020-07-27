select nome, quantos
from (select segment_name nome, count(*) quantos
from user_extents
group by segment_name
order by quantos desc)
where rownum < 11
/
