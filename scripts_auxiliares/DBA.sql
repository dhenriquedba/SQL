drop role admin
/
create role admin
/
grant admin, unlimited tablespace, select_catalog_role to odeciodba, marcusdba
/

SET PAGESIZE 0 feedback off echo OFF verify off line 2000

SPOOL DBA__1.sql
prompt Set echo on
Select 'Grant '||name||' to admin;'
   from system_privilege_map
      where name not in ('DELETE ANY TABLE',		'GRANT ANY ROLE',	'INSERT ANY TABLE', 
			 'UPDATE ANY TABLE',		'SELECT ANY TABLE',	'UNLIMITED TABLESPACE',
			 'ADMINISTER RESOURCE MANAGER',	'SYSDBA',		'SYSOPER',
			 'ALTER OPERATOR',		'DEQUEUE ANY QUEUE',	'ENQUEUE ANY QUEUE',
			 'EXTENDS TYPE',		'MANAGE ANY QUEUE',	'READUP',
			 'READUP DBHIGH',		'WRITEDOWN',		'WRITEDOWN DBLOW',
			 'WRITEUP',			'WRITEUP DBHIGH',	'Grant ANY PRIVILIGE')
		Order by name
/
prompt Set echo off
SPOOL OFF
spool DBA__1.log
SET PAGESIZE 40 feedback on 
@ DBA__1
SPOOL OFF
prompt
prompt
prompt @ DBA             ed DBA
prompt
