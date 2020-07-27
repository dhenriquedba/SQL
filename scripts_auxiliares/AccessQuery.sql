column username format a15
column terminal format a10
column objeto format a15
column texto format a50 wrap
column timestamp format a22
column acao format a15
column priv format a15
Column os_user format a15

set lines 1200 pages 500
set feedback off heading off
alter session set nls_date_format='dd/fmmonthfm/yyyy:hh24:mi:ss';
alter session set nls_language='English';
SELECT '===>  conectado ao DB :  '||value FROM V$parameter where name = 'instance_name'
/
set feedback on heading on
prompt
Select RPAD(A.USERNAME,15,' ') USERNAME,
              RPAD(TO_CHAR(A.TIMESTAMP,'DD/MM/YYYY HH24:MI:SS'),22,' ') TIMESTAMP, 
              RPAD(A.TERMINAL,10,' ') 					TERMINAL,
              RPAD(A.OS_USERNAME,15,' ') 				OS_USER, 
              RPAD(A.ACTION_NAME,15,' ')				ACAO, 
	      RPAD(NVL(A.OBJ_NAME,' '),15,' ')				OBJETO,
              RPAD(NVL(A.PRIV_USED,' '),15,' ')				PRIV, 
              RPAD(A.COMMENT_TEXT,100,' ')				TEXTO
       from   dba_audit_trail A
         where  to_char(A.TIMESTAMP,'Mon') = 'Aug'
       order  by A.USERNAME, A.TIMESTAMP
/
set feedback off
