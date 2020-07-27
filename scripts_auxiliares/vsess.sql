clear columns
set echo off
set heading on
set termou on
set feed on
set pages 122
set lines 1000
column atividade format 9999999 heading 'Ativ|I/O'
column user# format 999 heading '#'
column username format a15 heading 'Usuário'
column sid format 999 heading 'Sid'
column serial# format 999999 heading 'Serial'
column command format a11 heading 'Commando'
column status format a1 heading 'A|I'
column osuser format a15 heading 'OS|User'
column machine format a15 heading 'Machine'
column terminal format a11 heading 'Terminal'
column Program format a40 heading 'Program|Running'
--column event format a15 heading 'Evento|em Espera'
accept a prompt 'Entre com o SPID ou entre para todas :'
select
  (c.BLOCK_GETS+c.CONSISTENT_GETS+c.PHYSICAL_READS+c.BLOCK_CHANGES+c.CONSISTENT_CHANGES)/1000 ATIVIDADE,
  --a.user#,
  D.SPID,
  a.username,
  a.sid,
  a.serial#,
  decode (a.Command,
                    0, 'NADA',
                    1, 'CREATE TABLE',
                    2, 'INSERT',
                    3, 'SELECT',
                    4, 'CREATE CLUSTER',
                    5, 'ALTER CLUSTER',
                    6, 'UPDATE',
                    7, 'DELETE',
                    8, 'DROP',
                    9, 'CREATE INDEX',
                   10, 'DROP INDEX',
                   11, 'ALTER INDEX',
                   12, 'DROP TABLE',
                   13, 'CREATE SEQUENCE',
                   14, 'ALTER SEQUENCE',
                   15, 'ALTER TABLE',
                   16, 'DROP SEQUENCE',
                   17, 'GRANT',
                   18, 'REVOKE',
                   19, 'CREATE SYNONYM',
                   20, 'DROP SYNONYM',
                   21, 'CREATE VIEW',
                   22, 'DROP VIEW',
                   23, 'VALIDADE INDEX',
                   24, 'CREATE PROCEDURE',
                   25, 'ALTER PROCEDURE',
                   26, 'LOCK TABLE',
                   27, 'NO OPERATION',
                   28, 'RENAME',
                   29, 'COMMENT',
                   30, 'AUDIT',
                   31, 'NOAUDIT',
                   32, 'CREATE EXTERNAL DATABASE',
                   33, 'DROP EXTERNAL DATABASE',
                   34, 'CREATE DATABASE',
                   35, 'ALTER DATABASE',
                   36, 'CREATE ROLLBACK SEGMENT',
                   37, 'ALTER ROLLBACK SEGMENT',
                   38, 'DROP ROLLBACK SEGMENT',
                   39, 'CREATE TABLESPACE',
                   40, 'ALTER TABLESPACE',
                   41, 'DROP TABLESPACE',
                   42, 'ALTER SESSION',
                   43, 'ALTER USER',
                   44, 'COMMIT',
                   45, 'ROLLBACK',
                   46, 'SAVEPOINT',
                   47, 'PL/SQL EXECUTE',
                   48, 'SET TRANSACTION',
                   49, 'ALTER SYSTEM SWITCH LOG',
                   50, 'EXPLAIN',
                   51, 'CREATE USER',
                   52, 'CREATE ROLE',
                   53, 'DROP USER',
                   54, 'DROP ROLE',
                   55, 'SET ROLE',
                   56, 'CREATE SCHEMA',
                   57, 'CREATE CONTROL FILE',
                   58, 'ALTER TRACING',
                   59, 'CREATE TRIGGER',
                   60, 'ALTER TRIGGER',
                   61, 'DROP TRIGGER',
                   62, 'ANALYZE TABLE',
                   63, 'ANALYZE INDEX',
                   64, 'ANALYZE CLUSTER',
                   65, 'CREATE PROFILE',
                   66, '- 66 -',
                   67, 'DROP PROFILE',
                   68, 'ALTER PROFILE',
                   69, 'DROP PROCEDURE',
                   70, 'ALTER RESOURCE COST',
                   71, 'CREATE SNAPSHOT LOG',
                   72, 'ALTER SNAPSHOT LOG',
                   73, 'DROP SNAPSHOT LOG',
                   74, 'CREATE SNAPSHOT',
                   75, 'ALTER SNAPSHOT',
                   76, 'DROP SNAPSHOT',
--                 77, '- 77 -',
--                 78, '- 78 -',
                   79, 'ALTER ROLE',
--                 80, '- 80 -',
--                 81, '- 81 -',
--                 82, '- 82 -',
--                 83, '- 83 -',
--                 84, '- 84 -',
                   85, 'TRUNCATE TABLE',
                   86, 'TRUNCATE CLUSTER',
--                 87, '- 87 -',
                   88, 'ALTER VIEW',
--                 89, '- 89 -',
--                 90, '- 90 -',
                   91, 'CREATE FUNCTION',
                   92, 'ALTER FUNCTION',
                   93, 'DROP FUNCTION',
                   94, 'CREATE PACKAGE',
                   95, 'ALTER PACKAGE',
                   96, 'DROP PACKAGE',
                   97, 'CREATE PACKAGE BODY',
                   98, 'ALTER PACKAGE BODY',
                   99, 'DROP PACKAGE BODY',
                       '? ' || A.Command || ' ?') command,
  decode (a.status, 'INACTIVE', 'I', 'ACTIVE', 'A', '?') status,
  a.osuser,
  a.machine,
  a.terminal,
  substr (a.program, 1, 23) program
 -- b.event
from
  v$session a,
  V$SESSION_WAIT b,
  V$SESS_IO c,
  V$PROCESS D
where
  a.username is not null and
  a.sid = b.sid and
  a.sid = c.sid AND
  A.PADDR=D.ADDR and
--  a.machine LIKE '%&a%'
d.spid like '%&a%'
order by
atividade desc
/

