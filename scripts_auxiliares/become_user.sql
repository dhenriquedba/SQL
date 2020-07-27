rem =========================================================================
rem
rem    This script allows a DBA to connect on any Oracle account without
rem  knowing the password (which is saved, set to a predefined value and
rem  then restored). Useful for grants, and, generally speaking, installation
rem  scripts.
rem
rem  Note that if you connect to a non-DBA user (such as SCOTT) you will
rem  have to connect as a DBA again before being able to switch to another
rem  account using this script.
rem
rem  Written for Unix, but very easy to port to another OS. Windows/NT
rem  commands have been added as comments (credit Leonid Boitsov for
rem  these ...),
rem
rem  Usage : @become <username> <SID>
rem
rem  =======================================================================
rem
set termout off
set pause off
set echo off
set verify off
set pagesize 0
set feedback off
set recsep off
set termout off
--whenever sqlerror exit 1
--whenever oserror exit 1
rem
rem ------ OS dependent --------------
rem ++ Standard Unix
rem spool /tmp/become$$.sql
rem ++ Windows 
spool bec.sql
rem ----------------------------------
rem
select 'alter user ' || u.name || chr(10) ||
       'identified by values ''' || u.password || ''';'
from sys.user$ u
where u.name = upper('&1')
/
spool off
alter user &1 identified by uhzsdfsdzefljmkze;
connect &1/uhzsdfsdzefljmkze@&2
rem
rem ------ OS dependent --------------
rem ++ Standard Unix
rem @/tmp/become$$
rem ! rm /tmp/become$$.sql 2>/dev/null
rem ++ Windows
@bec
! del bec.sql
rem ----------------------------------
rem
set termout on
select 'You are connected as ' || user
from dual
/
set termout off
rem
rem   SQL*Plus environment is restored to its default values
rem   before running glogin.sql
rem
set ECHO OFF
set FEEDBACK 6
set PAGESIZE 24
set PAUSE OFF
set RECSEP WRAPPED
set VERIFY ON
whenever sqlerror continue none
rem
rem ------ OS dependent --------------
rem ++ Standard Unix - in Windows that should be commented
rem @$ORACLE_HOME/sqlplus/admin/glogin
rem ++  Windows : the glogin.sql is usually located under a PLUSxx 
rem ++            directory, eg C:\ORANT\PLUS80 - Highly dependent
rem ++            on the installation.
@login
rem ----------------------------------
rem
set termout on
