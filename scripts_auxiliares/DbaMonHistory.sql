select DBSS_DT_COLLECT, DBSS_VL_SEGMENT_SIZE, DBSS_VL_ROW_COUNT
from dba_db_segment_size
where (DBSS_NM_SEGMENT_TYPE, DBSS_DBIN_CD_SID, DBSS_NM_SEGMENT) =
			(select DBSS_NM_SEGMENT_TYPE, DBSS_DBIN_CD_SID, DBSS_NM_SEGMENT
				from dba_db_segment_size
				where DBSS_VL_ROW_COUNT = 
			(select max(DBSS_VL_ROW_COUNT)
				from dba_db_segment_size))
order by DBSS_DT_COLLECT
/
