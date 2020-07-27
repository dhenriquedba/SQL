column segment_name	format a8		heading 'RBS name'
column tablespace_name	format a8		heading 'TBS name'
column INITIAL_EXTENT	format 999,999	heading 'Initial'
column NEXT_EXTENT 	format 999,999	heading 'Next'
column MIN_EXTENTS 	format 999		heading 'Min'
column MAX_EXTENTS 	format 99,999	heading 'Max'
column PCT_INCREASE	format 9999		heading '%inc'
column STATUS		format a10		heading 'Status'
set feedback off pages 0 lines 200
Select Instance_name from v$instance
/
Set pages 80
Select SEGMENT_NAME, TABLESPACE_NAME, INITIAL_EXTENT,
       NEXT_EXTENT, MIN_EXTENTS, MAX_EXTENTS, PCT_INCREASE,
       STATUS
	from dba_rollback_segs
order by 1
/
select segment_name, count(*) qtd
	from dba_extents 
		where segment_name in (select segment_name from dba_rollback_segs)
group by segment_name
/
set feedback on lines 90
