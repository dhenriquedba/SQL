set feedback off  verify off  pause off echo off linesize 110  pagesize  80 term off
spool QdAcTrNomeDate.sql
Select 'Spool '||upper(Instance_Name)||'_Snap_Job_'||To_Char(SysDate,'ddmmyyyy')||'.DOC'
	from v$instance;
Spool off
@QdAcTrNomeDate.sql
host del /q QdAcTrNomeDate.sql
set term on
prompt ======================================================================================================
Select Instance_Name                                 "Oracle Instance Analizada",
       to_char(sysdate,'dd-fmmonfm-yyyy=hh24:mi:ss') "Data Analise"
From v$instance;
Column can_use_log	heading 'Possível|Fast'			format a10
Column refresh_method	heading 'Tipo'				format a15
Column next		heading 'Próxima Atualização'		format a40
Column X 		heading 'Tabelas sem|Primary Key'	format a30 			
Column XX 		heading 'Tabelas sem|Primary Key'	format 999,999 			
Column broken		heading 'Pa-|rado?'			format a4
Column failures		heading 'Fa-|lhas?'			format a4
Column job		heading '# Pro-|cesso'			format 9999
Column what		heading 'Processo'			format a90
Column rodou		heading 'Ultima Execução'		format a23
set feedback off pages 40 
set feedback off
prompt ================== Snapshots =========================================================================
Select s.Owner, s.NAME, s.UPDATABLE, to_char(t.snaptime,'dd/mm/yyyy:hh24:mi') LAST_REFRESH,
 s.can_use_log, s.refresh_method
	--, substr(s.next,1,40) next, s.query
  From dba_snapshots s, sys.snap_reftime$ t
   Where s.NAME = t.vname
 Order by 1,2
/

Select s.NAME, substr(s.next,1,40) next, s.query
  From dba_snapshots s
 Order by 1,2
/
prompt =================== Jobs =============================================================================
select log_user, schema_user, job, decode(broken,'N','Não','Sim') broken,
		nvl(to_char(failures),'Não') failures,
		to_char(last_date, 'dd/fmmonthfm/yyyy:hh24:mi:ss') rodou,
		Substr(what,1) what
	from dba_jobs
/
prompt ================== Snapshot Logs =====================================================================
select log_owner, master, current_snapshots
      from dba_snapshot_logs
/
prompt ======================================================================================================
spool off
set lines 90 feedback on pages 80 
