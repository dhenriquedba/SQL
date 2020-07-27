@login
set echo off feedback off pages 0 linesize 500
spool __MoveSystem_s_objs_01_1.SQL
select 'alter table '||owner||'.'||segment_name||' MoVe tablespace MANTAS_DATA_64K;'
  from dba_segments
	where owner in ('SYSTEM')
       and segment_type = 'TABLE'
union
select 'alter table '||table_owner||'.'||table_name||' MoVe partition '||partition_name||' tablespace MANTAS_DATA_64K;'
  from dba_tab_partitions    
	where table_owner in ('SYSTEM')
union
select 'alter index '||owner||'.'||segment_name||' rebuild tablespace MANTAS_DATA_64K;'
  from dba_segments
	where owner in ('SYSTEM')
       and segment_type = 'INDEX'
union
select 'alter index '||index_owner||'.'||index_name||' rebuild partition '||partition_name||' tablespace MANTAS_DATA_64K;'
  from dba_ind_partitions
	where index_owner in ('SYSTEM')
/
spool off

spool MoveSystem_s_objs_01.Log
select sysdate inicio from dual;
set echo on 
@ __MoveSystem_s_objs_01_1.SQL
set echo off
select sysdate termino from dual;
spool off
set feedback on
prompt 
prompt Ed MoveSystem_s_objs_01			@ MoveSystem_s_objs_01
prompt 
