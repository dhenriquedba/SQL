select owner, object_name, object_type
from  dba_objects
where  object_name in ('DBMS_AQ', 'DBMS_CDC_UTILITY', 'WK_QRY', 'WK_QUERYAPI', 'SDO_UTIL', 'SDO_GEOM',
                      'SDO_IDX','KUPF$FILE_INT', 'DBMS_STATS', 'DBMS_AQJMS_INTERNAL', 'WK_QRY', 'WK_QUERYAPI', 'wwv_execute_immediate', upper('wwv_execute_immediate'))
Order by 2,1,3
/


select owner, table_name, grantee, privilege
from  dba_tab_privs
where  TABLE_NAME in ('DBMS_AQ', 'DBMS_CDC_UTILITY', 'WK_QRY', 'WK_QUERYAPI', 'SDO_UTIL', 'SDO_GEOM',
                      'SDO_IDX','KUPF$FILE_INT', 'DBMS_STATS', 'DBMS_AQJMS_INTERNAL', 'WK_QRY', 'WK_QUERYAPI''wwv_execute_immediate', upper('wwv_execute_immediate'))
Order by 1,2,3
/

Prompt
Prompt Ed  CPUapr2008_ObjectPrivileges_01    @ CPUapr2008_ObjectPrivileges_01
Prompt
