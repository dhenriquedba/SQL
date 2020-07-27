column INITIAL_EXTENT	format 999,999,999
column NEXT_EXTENT	format 999,999,999
column bytes		format 999,999,999
select i.index_name, i.INITIAL_EXTENT, i.NEXT_EXTENT, i.PCT_INCREASE, sum(e.bytes) bytes, count(*) extents
	from dba_indexes i, dba_extents e
--		where i.owner='SYSTEM'
		where i.owner='ODECIODBA'
		  and i.index_name = e.segment_name
		group by i.index_name, i.INITIAL_EXTENT, i.NEXT_EXTENT, i.PCT_INCREASE
	order by i.NEXT_EXTENT desc
/


prompt
prompt  ed Indices      @ Indices
prompt
prompt
