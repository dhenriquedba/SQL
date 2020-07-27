--alter database drop logfile group 1;
/*

alter database add logfile group 3
('/amlp17/oradata/aml01ora/redo03a.log',
 '/amlp18/oradata/aml01ora/redo03b.log')
 size 500m reuse
/
alter database add logfile group 4
('/amlp17/oradata/aml01ora/redo04a.log',
 '/amlp18/oradata/aml01ora/redo04b.log')
 size 500m reuse
/
alter database add logfile group 5
('/amlp17/oradata/aml01ora/redo05a.log',
 '/amlp18/oradata/aml01ora/redo05b.log')
 size 500m reuse
/
*/

alter database add logfile group 2
('/amlp17/oradata/aml01ora/redo02a.log',
 '/amlp18/oradata/aml01ora/redo02b.log')
 size 500m reuse
/


--rm /amlp01/oradata/aml01ora/redo06a.log
--rm /amlp05/oradata/aml01ora/redo06b.log
--rm /amlp02/oradata/aml01ora/redo07a.log
--rm /amlp03/oradata/aml01ora/redo07b.log
--rm /amlp03/oradata/aml01ora/redo08a.log
--rm /amlp04/oradata/aml01ora/redo08b.log
--rm /amlp04/oradata/aml01ora/redo09a.log
--rm /amlp02/oradata/aml01ora/redo09b.log

