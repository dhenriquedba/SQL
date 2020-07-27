prompt by Mario Ko - ABN - dec2005

set linesize 150
set pagesize 1000

col sid             form 9999
col spid            form 99999 
col username        form a10
col program         form a16   
col machine         form a22
col logtime         form a11    heading 'Logon'
col cmd             form a11    heading 'Command'
col row_wait_obj#   form 999999 heading 'Obj#'
col row_wait_file#  form 999    heading 'File#'
col row_wait_block# form 999999 heading 'Block#'
col row_wait_row#   form 9999   heading 'Row#'
col event           form a30

select to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')
from   dual
/

select s.sid,
--       s.serial#,
--       p.spid,
       s.username,
       s.program, 
       s.machine,
--       to_char(s.logon_time, 'dd-mm hh24:mi') logtime,
       decode(s.command,  2, 'Insert', 
                          3, 'Select',
                          6, 'Update', 
                          7, 'Delete', 
                         26, 'Lock Table', 
                         44, 'Commit', 
                         45, 'Rollback', 
                         47, 'PL/SQL Exec', s.command) cmd, 
       LOCKWAIT,
       row_wait_obj#,
       row_wait_file#,
       row_wait_block#,
       row_wait_row#,
       w.event
from   v$process      p,
       v$session_wait w,
       v$session      s
where  p.addr      = s.paddr
and    w.sid       = s.sid
and    s.username != ' '
and    s.username != 'SYSTEM'
and    s.status    = 'ACTIVE'
--order  by 6, 1
order  by 1
/
set linesize 150
set pagesize 23

