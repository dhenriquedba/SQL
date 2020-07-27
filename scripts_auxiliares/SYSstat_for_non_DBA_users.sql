select	*
from 	sys.aux_stats$ 
where 	sname = 'SYSSTATS_MAIN'
order by 2
/

execute dbms_stats.gather_system_stats('Start')


execute dbms_stats.gather_system_stats('Stop')

grant GATHER_SYSTEM_STATISTICS to KDD_ALG;