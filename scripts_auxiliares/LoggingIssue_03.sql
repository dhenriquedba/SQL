spool LoggingIssue_03.log
set echo on
select sysdate from dual
/
select GROUP#, FIRST_TIME, FIRST_CHANGE# from v$log
/
alter database no force logging
/
drop table ttcn212.x
/
create table ttcn212.x (a number) nologging;
begin
  for i in 1..100000000 loop
     insert /*+ APPEND */ into ttcn212.x values(i);
     commit;
  end loop;
end;
/
select count(*) from ttcn212.x
/
select GROUP#, FIRST_TIME, FIRST_CHANGE# from v$log
/
select sysdate from dual
/
select GROUP#, FIRST_TIME, FIRST_CHANGE# from v$log
/
alter database force logging
/
drop table ttcn212.x
/
create table ttcn212.x (a number) nologging;
begin
  for i in 1..100000000 loop
     insert /*+ APPEND */ into ttcn212.x values(i);
     commit;
  end loop;
end;
/
select count(*) from ttcn212.x
/
select GROUP#, FIRST_TIME, FIRST_CHANGE# from v$log
/
drop table ttcn212.x
/
select sysdate from dual
/
exit
