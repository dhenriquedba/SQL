column name format a30
column value format a10
set echo on 
spool license_mantas.txt
conn ttcn212@amlp
select name, value from v$parameter where name in ('license_max_users','instance_name') order by name;
select username from dba_users;
conn ttcn212@amlarp
select name, value from v$parameter where name in ('license_max_users','instance_name') order by name;
select username from dba_users;
conn ttcn212@amlclp
select name, value from v$parameter where name in ('license_max_users','instance_name') order by name;
select username from dba_users;
conn ttcn212@amlcop
select name, value from v$parameter where name in ('license_max_users','instance_name') order by name;
select username from dba_users;
conn ttcn212@amlpyp
select name, value from v$parameter where name in ('license_max_users','instance_name') order by name;
select username from dba_users;
conn ttcn212@amlvep
select name, value from v$parameter where name in ('license_max_users','instance_name') order by name;
select username from dba_users;
conn ttcn212@amla
select name, value from v$parameter where name in ('license_max_users','instance_name') order by name;
select username from dba_users;
conn ttcn212@amlara
select name, value from v$parameter where name in ('license_max_users','instance_name') order by name;
select username from dba_users;
conn ttcn212@amlcla
select name, value from v$parameter where name in ('license_max_users','instance_name') order by name;
select username from dba_users;
conn ttcn212@amlcoa
select name, value from v$parameter where name in ('license_max_users','instance_name') order by name;
select username from dba_users;
conn ttcn212@amlpya
select name, value from v$parameter where name in ('license_max_users','instance_name') order by name;
select username from dba_users;
conn ttcn212@amlvea
select name, value from v$parameter where name in ('license_max_users','instance_name') order by name;
select username from dba_users;
conn ttcn212@amlstp
select name, value from v$parameter where name in ('license_max_users','instance_name') order by name;
select username from dba_users;
conn ttcn212@amlsta
select name, value from v$parameter where name in ('license_max_users','instance_name') order by name;
select username from dba_users;
conn ttcn212@amldaa
select name, value from v$parameter where name in ('license_max_users','instance_name') order by name;
select username from dba_users;
spool off

