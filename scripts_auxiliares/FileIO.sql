col PHYRDS format 999,999,999 
col PHYWRTS format 999,999,999 
col READTIM format 999,999,999 
col WRITETIM format 999,999,999 
col name format a54
set lines 200 pages 200
select name, phyrds, phywrts, readtim, writetim 
from v$filestat a, v$datafile b 
where a.file# = b.file# 
order by readtim desc 
/ 
