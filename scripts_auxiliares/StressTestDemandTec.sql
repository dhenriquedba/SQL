Select owner, segment_type, segment_name
from dba_segments
where tablespace_name in ('TSD_PESQ_001'
			 ,'TSD_PROD_002'
			 ,'TSI_PFNP_004'
			 ,'TSD_PROD_004'
			 ,'TSI_PESQ_001'
			 ,'TSI_PROD_002'
			 ,'TSD_PROD_001');
