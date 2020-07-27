select n.name, n.db_key, sum(d.DATAFILE_BLOCKS), sum(d.BLOCKS), sum(d.PIECES)
from rman.rc_backup_datafile d, rman.rc_database n
 where n.db_key= d.db_key
   and n.name like 'PRD%'
   and d.completion_time > to_date('11072007','ddmmyyyy')
   group by n.name, n.db_key
/
