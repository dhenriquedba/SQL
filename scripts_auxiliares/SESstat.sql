set feedback off  verify off  pause off echo off linesize 200  pagesize  80  term off

spool QdAcTrNomeDate.sql
-- Select 'Spool '||substr(Global_name,1,6)||'_SESstat_'||To_Char(SysDate,'ddmmyyyy_hh24miss')||'.log' from global_name;
Spool off
@QdAcTrNomeDate.sql
host del /q QdAcTrNomeDate.sql
set term on

column Event		Format a40			Heading Evento|	
column TOTAL_WAITS	Format 999,999			Heading	Total|Esperas		
column TOTAL_TIMEOUTS	Format 999,999 			Heading Total|TimeOuts
column AVERAGE_WAIT	Format 999,999.99		Heading Média|Espera
column TIME_WAITED	Format 999,999,999,999,999	Heading Tempo|Esperado
column Value		Format 999,999,999,999,999	Heading Value

prompt =========================================================================================================
prompt =============================== By Odecio Souza - menetwork - rev. set.2002 =============================
prompt =========================================================================================================
Select Instance_Name                                 "Oracle Instance Analizada",
       to_char(sysdate,'dd-fmmonfm-yyyy=hh24:mi:ss') "Data Analise",
       to_char(startup_time, 'dd-fmmonfm-yyyy=hh24:mi:ss') "Data do Starup",
       trunc(sysdate-startup_time) "Dias da Instance no ar"
From v$instance;
prompt =========================================================================================================
prompt =========================================================================================================
prompt Session Wait Statistics
Accept SESSsid prompt 'Sid a investigar: '
prompt
Select  ss.username, sn.name
	from v$session ss, v$sesstat st, v$statname sn, v$event_name e, v$system_event s
		where ss.sid		= &SESSsid
		  and ss.sid		= st.sid
		  and st.STATISTIC#	= sn.STATISTIC#
	order by ss.sid;

prompt =========================================================================================================
prompt =========================================================================================================

spool off
set feedback on

prompt
prompt  Ed SESstat      @ SESstat
prompt
