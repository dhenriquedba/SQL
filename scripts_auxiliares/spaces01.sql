prompt by Mario Ko - ABN - dec2005

col tablespace_name form a10         heading 'Tablespace'
col type            form a1          heading 'T' noprint 
col segment_name    form a30         heading 'Name'
col init            form 999,999,999 heading 'Init(Kb)'
col next            form 999,999,999 heading 'Next(Kb)'
col pct             form 999         heading 'Inc'
col extents         form 999         heading 'Ext'
col tot             form 999,999,999 heading 'Total(Kb)'
col freext          form 999,999,999 heading 'Free(Kb)'
 
break on tablespace_name skip 1

select a.tablespace_name,
       decode (a.segment_type, 'TABLE', 'T',
                               'INDEX', 'I', '?') type,
       a.segment_name, 
       a.initial_extent/1024 init,
       a.pct_increase        pct,
       a.extents,  
       a.bytes/1024          tot,
       a.next_extent/1024    next, 
       c.free/1024           freext 
from   dba_segments a,
      (select b.tablespace_name,
              max(b.bytes) free
       from   dba_free_space b
       group  by b.tablespace_name) c
where  c.tablespace_name = a.tablespace_name
and    a.next_extent > c.free
order  by 1, next desc
/
clear breaks
