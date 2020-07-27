set lines 200
column member format a50
select l.GROUP#, l.SEQUENCE#, l.ARCHIVED, l.STATUS, f.STATUS, f.MEMBER, l.BYTES
 from v$log l, v$logfile f
 where l.GROUP#=f.GROUP#
/
