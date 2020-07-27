select
   substr(a.os_user_name,1,10)           "OS_USER"
 , substr(a.oracle_username,1,10)        "DB_USER"
 , e.sid
 , substr(b.owner,1,10)                  "OWNER"
 , substr(b.object_name,1,25)           "OBJECT_NAME"
 , substr(b.object_type,1,8)            "OBJECT_TYPE"
 , substr(c.segment_name,1,15)           "UNDO_SEG"
 , substr(d.used_urec,1,12)             "QTD_REC"
 , USED_UBLK
 , tablespace_name
from v$locked_object      a
     , dba_objects b
     , dba_rollback_segs  c
     , v$transaction      d
     , v$session e
where   a.object_id =  b.object_id
and a.xidusn    =  c.segment_id
and a.xidusn    =  d.xidusn
and a.xidslot   =  d.xidslot
and d.addr      =  e.taddr
/

