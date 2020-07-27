set underline off
set heading off
set feedback off

spool ind01.sql
 
SELECT 'ALTER INDEX '||OWNER||'.'||SEGMENT_NAME||
' REBUILD TABLESPACE INDEX_DATA STORAGE (PCTINCREASE 0) ; '
FROM DBA_SEGMENTS
WHERE OWNER = 'SCOTT' and segment_type = 'INDEX';

spool off

set underline on
set heading on
set feedback on
