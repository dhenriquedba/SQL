set pagesize 24
set linesize 132

col file_name format a30

col owner format a10
col nome  format a20
col tipo  format a8
col tablesp format a10

spool design1.sql

select 'DBA_DATA_FILES' from dual;
select file_name, file_id, tablespace_name
from dba_data_files;

select '************************************************************'
from dual;

select 'DBA_SEGMENTS - tables' from dual;
select owner, segment_name nome, segment_type tipo,
       tablespace_name tablesp
from dba_segments
where segment_type = 'TABLE' and segment_name not like '%$%'
order by 4;

select '************************************************************'
from dual;

select 'DBA_SEGMENTS - index' from dual;
select owner, segment_name nome, segment_type tipo,
       tablespace_name tablesp
from dba_segments
where segment_type = 'INDEX'
order by 4;

select '************************************************************'
from dual;

select 'DBA_SEGMENTS - rollback' from dual;
select owner, segment_name nome, segment_type tipo,
       tablespace_name tablesp
from dba_segments
where segment_type = 'ROLLBACK'
order by 4;

select '************************************************************'
from dual;

select 'DBA_SEGMENTS - cache' from dual;
select owner, segment_name nome, segment_type tipo,
       tablespace_name tablesp
from dba_segments
where segment_type = 'CACHE'
order by 4;

select '************************************************************'
from dual;

select 'DBA_SEGMENTS - cluster' from dual;
select owner, segment_name nome, segment_type tipo,
       tablespace_name tablesp
from dba_segments
where segment_type = 'CLUSTER'
order by 4;


select '************************************************************'
from dual;

col username format a15
col deftabl format a15
col temptabl format a15
col profile  format a15

select 'DBA_USERS' from dual;
select username, user_id, default_tablespace deftabl, 
       temporary_tablespace temptabl, profile
from dba_users;


select '************************************************************'
from dual;

col owner	format a10
col constraint	format a25
col tabela	format a15
col coluna	format a15
col tp		format a3

select 'DBA_CONSTRAINTS/DBA_CONS_COLUMNS' from dual;
select 	a.owner, a.constraint_name constraint,
	a.table_name tabela, a.column_name coluna,
        b.constraint_type tp
from	dba_cons_columns a, dba_constraints b
where   a.constraint_name = b.constraint_name
and	(b.constraint_type = 'U' or b.constraint_type = 'P')
and	a.table_name not like '%$%'
order by 3;



spool off;
/
 