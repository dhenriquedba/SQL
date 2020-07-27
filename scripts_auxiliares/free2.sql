prompt by Mario Ko - ABN - dec2005

accept tbspc prompt 'Tablespace Name: '

col tablespace_name form a12 heading 'Tablespace'

select bytes/1024 Kb,
       count(*)
from   dba_free_space
where  tablespace_name = upper('&tbspc')
group  by bytes/1024
order  by 1 desc
/
