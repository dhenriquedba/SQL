SET LINES 100 PAGES 60
column SEGMENT_NAME	format a30
column COLUMN_NAME	format a30
column COLUMN_POSITION	heading POS	format 999
column SEGMENT_TYPE	heading TYPE	format a10
column TABLESPACE_NAME	heading TBS	format a15
break on SEGMENT_NAME
SELECT s.SEGMENT_NAME, s.SEGMENT_TYPE,  s.TABLESPACE_NAME, i.COLUMN_POSITION, i.COLUMN_NAME
	FROM DBA_SEGMENTS s, DBA_IND_COLUMNS i
		WHERE s.SEGMENT_NAME = i.INDEX_NAME(+)
		  AND s.SEGMENT_NAME LIKE ('%PROCESSOMOVI%')
		  AND s.OWNER = 'SAPXXI'
	ORDER BY 1,2,3,4
/
PROMPT
PROMPT Ed Segments.sql          @Segments.sql
PROMPT
      