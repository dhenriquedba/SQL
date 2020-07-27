select	*
from 	sys.aux_stats$ 
where 	sname = 'SYSSTATS_MAIN'
order by 2
/

DBMS_STATS.SET_SYSTEM_STATS (
   pname          VARCHAR2,
   pvalue         NUMBER,
   stattab   IN   VARCHAR2 DEFAULT NULL, 
   statid    IN   VARCHAR2 DEFAULT NULL,
   statown   IN   VARCHAR2 DEFAULT NULL);


exec DBMS_STATS.SET_SYSTEM_STATS ('CPUSPEED',null)
exec DBMS_STATS.SET_SYSTEM_STATS ('MAXTHR',null)
exec DBMS_STATS.SET_SYSTEM_STATS ('MBRC',null)
exec DBMS_STATS.SET_SYSTEM_STATS ('MREADTIM',null)
exec DBMS_STATS.SET_SYSTEM_STATS ('SLAVETHR',null)
exec DBMS_STATS.SET_SYSTEM_STATS ('SREADTIM',null)


exec DBMS_STATS.SET_SYSTEM_STATS ('CPUSPEED',60)
exec DBMS_STATS.SET_SYSTEM_STATS ('MAXTHR',184466432184466000)
exec DBMS_STATS.SET_SYSTEM_STATS ('MBRC',44)
exec DBMS_STATS.SET_SYSTEM_STATS ('MREADTIM',27.48)
exec DBMS_STATS.SET_SYSTEM_STATS ('SLAVETHR',384000)
exec DBMS_STATS.SET_SYSTEM_STATS ('SREADTIM',6.72)