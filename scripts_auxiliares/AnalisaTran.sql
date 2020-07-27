set feedback off  verify off  pause off echo off linesize 100  pagesize 0

spool QdAcTrNomeDate__1.sql
Select 'Spool '||Substr(Global_name,1,6)||'_Anal_Tran_'||
	To_Char(SysDate,'ddmmRRhh24mi')||'.log'
   from global_name;
Spool off
set  pagesize 40
--clea scr

@QdAcTrNomeDate__1.sql

prompt ==============================================
prompt ========== By Odecio Souza Mai.2002 ==========
prompt ==============================================
/*
Select t.DEFERRED_TRAN_ID, c.packagename, c.procname
	from deftran@DesANA t, defcall@DesANA c
	where t.DEFERRED_TRAN_ID = c.DEFERRED_TRAN_ID;
Select t.DEFERRED_TRAN_ID, c.packagename, c.procname, e.ERROR_MSG 
	from deftran@DesMTR t, defcall@DesMTR c, deferror@DesMTR e
	where t.DEFERRED_TRAN_ID = c.DEFERRED_TRAN_ID
	  and t.DEFERRED_TRAN_ID = e.DEFERRED_TRAN_ID;                                      
*/
Exec Dbms_job.run(81)

Select t.DEFERRED_TRAN_ID, c.packagename, c.procname "ProcName Transações DesANA"
	from deftran@DesANA t, defcall@DesANA c
	where t.DEFERRED_TRAN_ID = c.DEFERRED_TRAN_ID
/

Select t.DEFERRED_TRAN_ID, c.packagename, c.procname, e.ERROR_MSG "Messages Erros DesMTR"
	from deftran@DesMTR t, defcall@DesMTR c, deferror@DesMTR e
	where t.DEFERRED_TRAN_ID = c.DEFERRED_TRAN_ID
	  and t.DEFERRED_TRAN_ID = e.DEFERRED_TRAN_ID                                      
/

select table_name, num_rows "SnapLogDesMTR-ÚltimoAnalize"
	from dba_tables
	where owner= 'SAPXXI'
	  and table_name like 'MLOG$_%'
	  and num_rows <> 0
	order by num_rows
/

spool off

host del /q QdAcTrNomeDate__1.sql
set feedback on

prompt  
prompt  Ed AnalisaTran.sql	@AnalisaTran.sql        @ Jobs.sql
prompt  


--DBMS_DEFER_SYS
--PROCEDURE DELETE_ERROR
-- Nome do Argumento                  Tipo                    In/Out Default?
-- ------------------------------ ----------------------- ------ --------
-- DEFERRED_TRAN_ID               VARCHAR2                IN
-- DESTINATION                    VARCHAR2                IN
--PROCEDURE DELETE_TRAN
-- Nome do Argumento                  Tipo                    In/Out Default?
-- ------------------------------ ----------------------- ------ --------
-- DEFERRED_TRAN_ID               VARCHAR2                IN
--PROCEDURE EXECUTE
-- Nome do Argumento                  Tipo                    In/Out Default?
-- ------------------------------ ----------------------- ------ --------
-- DESTINATION                    VARCHAR2                IN
-- STOP_ON_ERROR                  BOOLEAN                 IN     DEFAULT
-- TRANSACTION_COUNT              BINARY_INTEGER          IN     DEFAULT
-- EXECUTION_SECONDS              BINARY_INTEGER          IN     DEFAULT
-- DELAY_SECONDS                  BINARY_INTEGER          IN     DEFAULT
-- BATCH_SIZE                     BINARY_INTEGER          IN     DEFAULT
--PROCEDURE EXECUTE_ERROR
-- Nome do Argumento                  Tipo                    In/Out Default?
-- ------------------------------ ----------------------- ------ --------
-- DEFERRED_TRAN_ID               VARCHAR2                IN
-- DESTINATION                    VARCHAR2                IN
--PROCEDURE EXECUTE_ERROR_CALL
-- Nome do Argumento                  Tipo                    In/Out Default?
-- ------------------------------ ----------------------- ------ --------
-- DEFERRED_TRAN_ID               VARCHAR2                IN
-- CALLNO                         NUMBER                  IN


