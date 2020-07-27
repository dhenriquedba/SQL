/*    
FROM METALINK's Note:73439.1

If the ADDED_EXTENTS and the FREED_EXTENTS columns of the V$SORT_SEGMENTS 
table show excessive allocation/deallocation activity, you should consider 
adding more space to the corresponding tablespace. If the MAX_SORT_SIZE 
column of V$SORT_SEGMENTS indicates that large-size sorts occur, you should 
consider assigning a different temporary tablespace for these operations.
*/


select TABLESPACE_NAME,SEGMENT_FILE,EXTENT_SIZE,CURRENT_USERS,TOTAL_BLOCKS, USED_BLOCKS,FREE_BLOCKS,
               ADDED_EXTENTS, FREED_EXTENTS ,MAX_SORT_SIZE 
from V$SORT_SEGMENT
/

select user, SESSION_ADDR,SESSION_NUM,SQLADDR,TABLESPACE,CONTENTS,BLOCKS
from V$SORT_USAGE
/

select * from dba_tablespaces    where tablespace_name like '%TEMP%'
/


rem  from <http://www.jlcomp.demon.co.uk/faq/sort_user.html>
rem SQL*Plus script to display sort usage by user with join to v$session
rem to get session information (and correct user in some ver due to bug)
rem
rem  20010130  Mark D Powell   Saved version
rem  20020227  Mark D Powell   Add segtype to show temp tbl, hash use vs sort
rem
column tablespace format a12
column username   format a12

break on username nodup skip 1

select   se.username
        ,se.sid
        ,su.extents
        ,su.blocks * to_number(rtrim(p.value)) as Space
        ,tablespace
        ,segtype
from     v$sort_usage su
        ,v$parameter  p
        ,v$session    se
where    p.name          = 'db_block_size'
and      su.session_addr = se.saddr
order by se.username, se.sid
/
