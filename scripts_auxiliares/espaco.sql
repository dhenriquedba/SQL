set feedback off echo on
select tablespace_name, count(*) from dba_segments
	where owner='MIGRACAO' group by rollup  (tablespace_name);

select file_name, bytes, AUTOEXTENSIBLE from dba_data_files
	where TABLESPACE_NAME='DAT02';


select RELATIVE_FNO, count(*) from dba_extents
    where owner='MIGRACAO' group by rollup  (RELATIVE_FNO);
select RELATIVE_FNO, sum(BYTES) BYTES from dba_free_space
    where TABLESPACE_NAME='DAT02' group by rollup  (RELATIVE_FNO);

--select e.RELATIVE_FNO, count(*), sum(f.BYTES) BYTES
--	from dba_extents e, dba_free_space f
--		where e.owner		=	'MIGRACAO'
--		  and e.TABLESPACE_NAME	=	'DAT02'
--		  and e.TABLESPACE_NAME	=	f.TABLESPACE_NAME
--		  and e.RELATIVE_FNO 	=	f.RELATIVE_FNO
--	group by rollup  (e.RELATIVE_FNO);
set feedback on echo off
