select table_owner, table_name, count(*) partitions
from  dba_tab_partitions
  where  TABLE_OWNER     in ('BUSINESS'
   , 'MANTAS'
   , 'KDD'
   , 'KDD_WEB'
   , 'KDD_ALG'
   , 'KDD_MNR'
   , 'MARKET'
   , 'INGEST_USER'
   , 'DB_UTIL_USER'
   , 'INFO_REP_P'
   , 'INFO_REP_S')
group by  table_owner, table_name
/
