@login
set echo off feedback off pages 0 linesize 150


spool __NewTBS_Ext_1.SQL
select 'alter table '||owner||'.'||tablename||' MoVe tablespace '||NEW_TBS||';'
  from TooManyExtents
	Where SEGMENTTYPE = 'TABLE'
union
Select 'alter index '||owner||'.'||tablename||' rebuild tablespace '||NEW_TBS||';'
  from TooManyExtents
		where SEGMENTTYPE = 'INDEX'
union
select 'alter table '||owner||'.'||tablename||' MoVe partition '||partitionname||' tablespace '||NEW_TBS||';'
  from TooManyExtents
	where SEGMENTTYPE = 'TABLE PARTITION'
union
select 'alter index '||owner||'.'||tablename||' rebuild partition '||partitionname||' tablespace '||NEW_TBS||';'
  from TooManyExtents
	where SEGMENTTYPE = 'INDEX PARTITION'
/

spool off

spool NewTBS_Ext.Log
select sysdate inicio from dual;
set echo on
@ __NewTBS_Ext_1.SQL
set feedback on

set echo off
select sysdate termino from dual;
spool off

prompt
prompt  A T E N Ç Ã O: verifique UNUSABLE  +  INVALID  Indexes !!!!!! ==> @ UnsusableIndexes.sql
prompt
prompt ed NewTBS_Ext    @ NewTBS_Ext
prompt

