column segment_name format a30
select segment_name, sum(bytes) bytes
from dba_extents
 where segment_name in (select table_name
                      from dba_tables
                         where iot_type is null)
   and owner = 'SAPXXI'
   and segment_name not like '%$%'
group by segment_name
union
select table_name, sum(bytes) bytes
      from dba_constraints, dba_extents
where segment_name = constraint_name
  and table_name in (select table_name
               from dba_tables
                         where iot_type = 'IOT')
     and dba_extents.owner = 'SAPXXI'
    and segment_name not like '%$%'
group by table_name
order by 1
/
