
create tablespace RBS_01
    LOGGING 
    DATAFILE '/oradata/gis/rbs/rbs_01.dbf' SIZE 100M 
	AUTOEXTEND ON NEXT  10M MAXSIZE  5000M 
		DEFAULT STORAGE (INITIAL 256K NEXT 256K MINEXTENTS 20 
					MAXEXTENTS UNLIMITED PCTINCREASE 0 );

create rollback segment rbs_00 tablespace RBS_01;
create rollback segment rbs_01 tablespace RBS_01;
create rollback segment rbs_02 tablespace RBS_01;
create rollback segment rbs_03 tablespace RBS_01;
create rollback segment rbs_04 tablespace RBS_01;

alter rollback segment rbs_00 online;
alter rollback segment rbs_01 online;
alter rollback segment rbs_02 online;
alter rollback segment rbs_03 online;
alter rollback segment rbs_04 online;

select 'alter rollback segment '||segment_name||' offline;'
from dba_rollback_segs
where segment_name <> 'SYSTEM' and  segment_name not like '%#_%' escape '#'
/
select 'Drop rollback segment '||segment_name||';'
from dba_rollback_segs
where segment_name <> 'SYSTEM' and  segment_name not like '%#_%' escape '#'
/


