set feedback off

select owner, count(*) estragados
 from dba_indexes
  where owner in ('BUSINESS'
                          , 'MANTAS'
                          , 'KDD'
                          , 'KDD_WEB'
                          , 'KDD_ALG'
                          , 'KDD_MNR'
                          , 'MARKET'
                          , 'INGEST_USER'
                          , 'DB_UTIL_USER'
                          , 'INFO_REP_P'
                          , 'INFO_REP_S'
                          , 'TTCN212')
  and status = 'UNUSABLE'
		group by owner
union
select index_owner, count(*) estragados
  from dba_ind_partitions
   where index_owner in ('BUSINESS'
                           , 'MANTAS'
                           , 'KDD'
                           , 'KDD_WEB'
                           , 'KDD_ALG'
                           , 'KDD_MNR'
                           , 'MARKET'
                           , 'INGEST_USER'
                           , 'DB_UTIL_USER'
                           , 'INFO_REP_P'
                           , 'INFO_REP_S'
                           , 'TTCN212')
   and status = 'UNUSABLE'
		group by index_owner
/
set feedback on
prompt 
prompt Ed CountUnusable.sql		@CountUnusable.sql
prompt 
