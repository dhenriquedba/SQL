set echo off feedback off pagesize 0
--accept TBS		prompt 'Tablespace Destino (correta): '
--accept Wrong_TBS	prompt 'Tablespace Origem   (errada): '

spool moveInd__1.sql

Select 'alter index '||index_name||
	' rebuild tablespace ind'||substr(tablespace_name,4,2)||';'
	from user_indexes
		where tablespace_name like '%DAT%'
/
-- select 'alter index '||owner||'.'||index_name||' rebuild tablespace TBS;'
-- from dba_indexes where tablespace_name = upper('WRONG_TBS')

spool off
spool moveInd.log
set echo on feedback on
@moveInd__1.sql
spool off
set echo off pagesize 40
