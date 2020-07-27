prompt by Mario Ko - ABN - dec2005

set verify off

--col owner           form a10 heading 'Owner'
col type            form a4  heading 'Type'
col segment_name    form a30 heading 'Name'
col init                     heading 'Init (Kb)'
col next                     heading 'Next (Kb)'
col min             form 999 heading 'Min Ext'
col max             form 999 heading 'Max Ext'
col pct             form 999 heading '% Inc'
col tot                      heading 'Total (Kb)'
col ext             form 999 heading 'Tot Ext'
col tablespace_name form a10 heading 'Tablespace'

select decode(segment_type, 'TABLE', 'T',
                            'INDEX', 'I', '?') type,
       segment_name,
       initial_extent/1024 init,
       next_extent/1024    next,
       min_extents         min,
       max_extents         max,
       pct_increase        pct,
       bytes/1024          tot,
       extents             ext,
       tablespace_name
from   dba_segments
--where  owner = 'PERFSTAT'
--where  owner = 'ADMKIT'
where  owner = 'CRIADOR'
--and    segment_name like 'CDC%'
--and    tablespace_name = 'FSP'
--and   (tablespace_name like ('%RIB%') or tablespace_name like ('%FWK%'))
--and    extents > 100
order  by extents desc, segment_type, segment_name
--order  by segment_type, segment_name
/
--clear columns
