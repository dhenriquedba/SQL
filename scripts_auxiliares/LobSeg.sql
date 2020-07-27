COLUMN	TABLE_NAME	format a30 heading 'Table|Name'
COLUMN	COLUMN_NAME	format a30 heading 'Column|Name'
Column	IN_ROW		format a4  heading 'In|Row'
accept	LOB_SEGMENT	Prompt 'Lob Segment Name: '

select TABLE_NAME, COLUMN_NAME, IN_ROW
	from dba_lobs
		where segment_name = '&LOB_SEGMENT'
/

select initial_extent, next_extent, min_extents, max_extents, pct_increase
	from dba_segments
		where segment_name = '&LOB_SEGMENT'
/
select count(*), sum(bytes) bytes
	from dba_extents
		where segment_name = '&LOB_SEGMENT';

select l.table_name, sum(e.bytes) bytes
from dba_extents e, dba_lobs l
where e.segment_name = l.segment_name
   and  e.owner = 'SAPXXI'
group by l.table_name;

Prompt
Prompt
Prompt  Ed LobSeg    @LobSeg
Prompt
Prompt
