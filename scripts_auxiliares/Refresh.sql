set feedback off
Select s.NAME, s.UPDATABLE, to_char(t.snaptime,'dd/mm/yyyy:hh24:mi') LAST_REFRESH
	From dba_snapshots s, sys.snap_reftime$ t
		Where s.NAME = t.vname	
Order by 2,1
/
Select count(*) "E r r o s ???"
	from deferror
/
set pages 0
Select 'Agora no Servidor >>> '||sysdate from dual
/
set pages 40
set feedback on
prompt
prompt  ed Refresh		@Refresh 		@Jobs		@JobsRunning  
prompt
