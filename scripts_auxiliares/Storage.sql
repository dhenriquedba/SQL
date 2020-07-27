Set lines 500 pages 500
Spool Storage.doc

break on report
compute sum of bytes on report

column LAST_ANALYZED	format a10
column OWNER 		format a10
column TABLESPACE_NAME	format a18
column LOG			format a3
column PART_NAME		format a9
column FREE			format 999
column USED			format 999
column INC			format 999
column num_rows			format 999,999,999
column LINES_PER_BLOCK		format 999,999,999
prompt
prompt It's being considerated a full block of 8192 bytes. Could be necessary review this.
prompt

Select t.OWNER, nvl(t.TABLESPACE_NAME,p.TABLESPACE_NAME) TABLESPACE_NAME, t.TABLE_NAME,
	 nvl(p.PARTITION_NAME,'NOT PART.') PART_NAME,
	 decode(t.PARTITIONED,'YES',p.PCT_FREE,t.PCT_FREE) FREE, 
	 decode(t.PARTITIONED,'YES',p.PCT_USED,t.PCT_USED) USED, 
	 decode(t.PARTITIONED,'YES',p.INITIAL_EXTENT, t.INITIAL_EXTENT) INITIAL_EXTENT,
	 decode(t.PARTITIONED,'YES',p.NEXT_EXTENT, t.NEXT_EXTENT) NEXT_EXTENT,
	 decode(t.PARTITIONED,'YES',p.PCT_INCREASE, t.PCT_INCREASE) INC, 
	 nvl(t.LOGGING, p.LOGGING) LOG,
	 decode(t.PARTITIONED,'YES',nvl(p.NUM_ROWS,0),nvl(t.NUM_ROWS,0)) NUM_ROWS, 
	 decode(t.PARTITIONED,'YES',p.EMPTY_BLOCKS, t.EMPTY_BLOCKS) EMPTY_BLOCKS,
	 decode(t.PARTITIONED,'YES',p.AVG_SPACE, t.AVG_SPACE) AVG_SPACE,
	 decode(t.PARTITIONED,'YES',p.CHAIN_CNT, t.CHAIN_CNT) CHAIN_CNT,
	 decode(t.PARTITIONED,'YES',p.AVG_ROW_LEN, t.AVG_ROW_LEN) AVG_ROW_LEN, 
--	 trunc((8192/decode(t.PARTITIONED,'YES',p.AVG_ROW_LEN, t.AVG_ROW_LEN)),0) LINES_PER_BLOCK, 
	 decode(t.PARTITIONED,'YES',to_char(p.LAST_ANALYZED, 'ddmonyy:hh24'), to_char(t.LAST_ANALYZED, 'ddmonyy:hh24')) LAST_ANALYZED,
	 ee.bytes, ee.num_ext
From dba_tables t, dba_tab_partitions p,
	(select sum(e.bytes) bytes, count(*) num_ext, e.segment_name , e.owner
	    from dba_extents e
		where e.OWNER in ('BUSINESS'
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
		group by e.segment_name , e.owner) ee
	Where t.TABLE_NAME		=	p.TABLE_NAME(+)
	  And p.PARTITION_NAME(+)	=	ee.SEGMENT_NAME
Order by 3,4, 1,2
-- Order by decode(t.PARTITIONED,'YES',p.AVG_ROW_LEN, t.AVG_ROW_LEN)
/


/*
select sum(e.bytes) bytes, e.owner, e.SEGMENT_TYPE
	    from dba_extents e
		where e.OWNER in ('BUSINESS'
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
		group by  e.owner, e.SEGMENT_TYPE
/



select sum(e.bytes) bytes, e.owner -- , e.SEGMENT_name
	    from dba_extents e
		where e.OWNER in ('BUSINESS'
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
		group by  e.owner --, e.SEGMENT_name
order by sum(e.bytes)
/
*/

Spool off
Prompt
Prompt  Ed Storage		@Storage
Prompt
