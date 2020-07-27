set pages 30 feedback on
 select 'rm '||name from v$tempfile
/
set echo on
create tablespace pseudo_temp
	datafile '&tbs/pseudo_temp01.dbf' size 100m
		autoextend on next 10m maxsize 2000m
	default storage (initial 1m next 1m pctincrease 0 maxextents unlimited)
/
set echo off
alter system checkpoint
/
