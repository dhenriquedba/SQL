column OWNER		format a15
column segment_NAME	format a30
column segment_type	format a30
select OWNER, segment_NAME, segment_type, Count(*) extents
		From dba_extents
			Where OWNER in ('BUSINESS'
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
	group by OWNER, segment_NAME, segment_type
	having count(*) > 1
	order by count(*);

Prompt	select segment_name, owner, tablespace_name	
Prompt		from dba_segments
Prompt			where segment_name in ('', '');;
Prompt
Prompt	Ed contaextents.sql		@contaextents.sql
Prompt
