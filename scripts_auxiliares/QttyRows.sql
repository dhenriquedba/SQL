Select t.OWNER, t.TABLESPACE_NAME, t.TABLE_NAME, nvl(t.NUM_ROWS,0) qtd
 from dba_tables t
  where t.OWNER in ('BUSINESS'
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
	and nvl(t.NUM_ROWS,0) >1000000
order by NUM_ROWS desc
/
