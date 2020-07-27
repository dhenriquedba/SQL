set echo on
alter system flush shared_pool; -- somente hard parsed statements são analisados pelo evento 10053
alter session set timed_statistics = true;
alter session set statistics_level=all;
alter session set max_dump_file_size = unlimited;
alter session set events '10053 trace name context forever,level 10';



set define on;
set serveroutput on;
exec p_rel_prod_micro_mercados('/home/prod/arqs/mk01');
exit;



-- run your select(s) --

select * from dual;
--exit;

alter session set sql_trace=false;
