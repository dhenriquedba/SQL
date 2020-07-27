set pages 0 feedback off
select instance_name from v$instance
/
ALTER ROLLBACK SEGMENT "SYSTEM" 
    STORAGE ( NEXT 256K OPTIMAL 512K MAXEXTENTS 504)
/
alter rollback segment RBS0 storage (maxextents unlimited);
alter rollback segment RBS1 storage (maxextents unlimited);
alter rollback segment RBS2 storage (maxextents unlimited);
alter rollback segment RBS3 storage (maxextents unlimited);
alter rollback segment RBS4 storage (maxextents unlimited);
alter rollback segment RBS5 storage (maxextents unlimited);
alter rollback segment RBS6 storage (maxextents unlimited);
alter rollback segment RBS7 storage (maxextents unlimited);
alter rollback segment RBS8 storage (maxextents unlimited);
alter rollback segment RBS9 storage (maxextents unlimited);

set pages 30
Select SEGMENT_NAME, TABLESPACE_NAME, INITIAL_EXTENT,
       NEXT_EXTENT, MIN_EXTENTS, MAX_EXTENTS, PCT_INCREASE,
       STATUS
	from dba_rollback_segs
order by 1
/
set feedback on

