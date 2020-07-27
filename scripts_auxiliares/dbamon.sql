Column evento			heading 'Evento'			format a50
Column broken			heading 'Pa-|rado?'		format a4
Column failures			heading 'Fa-|lhas?'		format a4
Column job				heading 'Pro-|cesso #'		format 999
Column what				heading 'Processo'
Column rodou			heading 'Ultima Execução'	format a26
column DBJL_CD_LOG		format 999 				heading #
column DBJL_DT_LOG	 	format a27				heading data
column DBJL_TX_MESSAGE 		format a50 				heading msg
column DBJL_TX_OBSERVATION 	format a50 wrap 			heading obs
column OWNER	 		format a12				heading Owner
column segment_NAME		format a25				heading 'Segment|Name'
column segment_type		format a20				heading 'Segment|Type'
column extents			format 999,999				heading 'Qtty of|Extents'
set lines 1090 feedback off pages 400 

select job, decode(broken,'N','Não','Sim') broken,
		nvl(to_char(failures),'Não') failures,
		to_char(last_date, 'dd/fmmonthfm/yyyy:hh24:mi:ss') rodou,
		to_char(NEXT_DATE, 'dd/fmmonthfm/yyyy:hh24:mi:ss') proximo, what
	from dba_jobs
order by 1
/
select DBJL_CD_LOG, DBJL_DT_LOG, DBJL_TX_OBSERVATION, DBJL_TX_MESSAGE
	from dbamon.dba_db_log
		where DBJL_DT_LOG >= sysdate - 2
	order by 2
/

select to_char(first_time,'ddmonyyyy') "Date", count(*) "Log Switches"
           from v$LOG_HISTORY
                where first_time >= sysdate -5
                        group by to_char(first_time,'ddmonyyyy')
Union
select to_char(first_time,'ddmonyyyy:hh24') "Date", count(*)
           from v$LOG_HISTORY
                where first_time >= sysdate - 5
                        group by to_char(first_time,'ddmonyyyy:hh24')
                        having count(*) > 6
order by 1
/


select OWNER, segment_NAME, segment_type, tablespace_name, Count(*) extents
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
			and segment_name in (select SEGMENT_NAME
						from dba_extents
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
						group by SEGMENT_NAME   , PARTITION_NAME
						having count(*) > 1)
        group by OWNER, segment_NAME, segment_type, tablespace_name
	having count(*) > 1
        order by count(*);

prompt
prompt  Ed DbaMon		@ DbaMon
prompt

