set pages 0 lines 200 feedback off
Spool nologging__1.sql
select  'alter table '||owner||'.'||table_name||' nologging;'
 from dba_tables
 where owner in ('BUSINESS')
--			, 'MANTAS'
--			, 'KDD'
--			, 'KDD_WEB'
--			, 'KDD_ALG'
--			, 'KDD_MNR'
--			, 'MARKET'
--			, 'INGEST_USER'
--			, 'DB_UTIL_USER'
--			, 'INFO_REP_P'
--			, 'INFO_REP_S')
   and nvl(logging,'NO') = 'YES'
   and PARTITIONED <> 'YES'
union
select  'alter table '||table_owner||'.'||table_name||' partition '||partition_name||' nologging;'
 from dba_tab_partitions
 where table_owner in ('BUSINESS')
--			, 'MANTAS'
--			, 'KDD'
--			, 'KDD_WEB'
--			, 'KDD_ALG'
--			, 'KDD_MNR'
--			, 'MARKET'
--			, 'INGEST_USER'
--			, 'DB_UTIL_USER'
--			, 'INFO_REP_P'
--			, 'INFO_REP_S')
   and nvl(logging,'NO') = 'YES'
union
select  'alter index '||owner||'.'||index_name||' nologging;'
 from dba_indexes
 where owner in ('BUSINESS')
--			, 'MANTAS'
--			, 'KDD'
--			, 'KDD_WEB'
--			, 'KDD_ALG'
--			, 'KDD_MNR'
--			, 'MARKET'
--			, 'INGEST_USER'
--			, 'DB_UTIL_USER'
--			, 'INFO_REP_P'
--			, 'INFO_REP_S')
   and nvl(logging,'NO') = 'YES'
   and PARTITIONED <> 'YES'
union
select  'alter index '||index_owner||'.'||index_name||' partition '||partition_name||' nologging;'
 from dba_ind_partitions
 where index_owner in ('BUSINESS')
--			, 'MANTAS'
--			, 'KDD'
--			, 'KDD_WEB'
--			, 'KDD_ALG'
--			, 'KDD_MNR'
--			, 'MARKET'
--			, 'INGEST_USER'
--			, 'DB_UTIL_USER'
--			, 'INFO_REP_P'
--			, 'INFO_REP_S')
   and nvl(logging,'NO') = 'YES'
/
set pages 30 lines 90 feedback on
spool off
spool nologging__1.log
@nologging__1.sql
spool off
select owner, logging, count(*) 
 from dba_tables
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
			, 'INFO_REP_S')
 group by owner, logging
union
select   owner, logging, count(*) 
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
			, 'INFO_REP_S')
 group by owner, logging
/
prompt  
prompt   Ed nologging	@nologging
prompt  

