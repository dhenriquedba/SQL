set lines 90 pages 300
column value format a55
column name format a33
Select name, value from v$parameter
where isdefault = 'FALSE'
order by 1
/
