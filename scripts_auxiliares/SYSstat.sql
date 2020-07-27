set feedback off  verify off  pause off echo off linesize 200  pagesize  80  term off

spool QdAcTrNomeDate.sql
Select 'Spool '||substr(Global_name,1,6)||'_SYSstat_'||To_Char(SysDate,'ddmmyyyy_hh24miss')||'.log' from global_name;
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
prompt SystemWide Wait Statistics
prompt
Select  e.name event, s.total_waits, s.total_timeouts, s.average_wait, s.time_waited
	from v$event_name e, v$system_event s
		where e.name = s.event
	order by s.time_waited;
prompt =========================================================================================================
prompt SystemWide Statistics
prompt
Select name, value, decode(class,  1, 'general instance ctivity',
			    2, 'redo log buffer activity',
			    4, 'locking',
			    8, 'database buffer cache activity',
			   16, 'OS activity',
			   32, 'parallelization',
			   64, 'tables access',
			  128, 'debugging purposes',
				'missing class') class
	from v$sysstat
	order by 1;
prompt =========================================================================================================
prompt SGA Statistics
prompt
SELECT * FROM v$sgastat;
prompt =========================================================================================================
prompt Tipical commands for Gather System statistics
prompt execute dbms_stats.gather_system_stats('Start');
prompt -- some time delay while the database is under a typical workload
prompt execute dbms_stats.gather_system_stats('Stop');
prompt 
select	pname, pval1 
from 	sys.aux_stats$ 
where 	sname = 'SYSSTATS_MAIN';


/*
02/dezembro/2004:17:57:52

AML01ORA.AMLP.ABN[ALLOWED]>execute dbms_stats.gather_system_stats('Start');

Procedimento PL/SQL concluído com sucesso.

AML01ORA.AMLP.ABN[ALLOWED]>r
  1  select pname, pval1
  2  from  sys.aux_stats$
  3* where  sname = 'SYSSTATS_MAIN'

não há linhas selecionadas

AML01ORA.AMLP.ABN[ALLOWED]>execute dbms_stats.gather_system_stats('Stop');

Procedimento PL/SQL concluído com sucesso.

AML01ORA.AMLP.ABN[ALLOWED]>r
  1  select pname, pval1
  2  from  sys.aux_stats$
  3* where  sname = 'SYSSTATS_MAIN'

PNAME                               PVAL1
------------------------------ ----------
SREADTIM                            5,697
MREADTIM                           27,502
CPUSPEED                              608
MBRC                                   14
MAXTHR                          174685184
SLAVETHR                           926720

6 linhas selecionadas.

AML01ORA.AMLP.ABN[ALLOWED]>execute dbms_stats.gather_system_stats('Start');

Procedimento PL/SQL concluído com sucesso.

AML01ORA.AMLP.ABN[ALLOWED]>execute dbms_stats.gather_system_stats('Stop');

Procedimento PL/SQL concluído com sucesso.

AML01ORA.AMLP.ABN[ALLOWED]>select pname, pval1
  2  from  sys.aux_stats$
  3  where  sname = 'SYSSTATS_MAIN';

PNAME                               PVAL1
------------------------------ ----------
SREADTIM                           10,727
MREADTIM                           34,538
CPUSPEED                              597
MBRC                                   13
MAXTHR                           72441856
SLAVETHR                           415744

AML01ORA.AMLP.ABN[ALLOWED]>execute dbms_stats.gather_system_stats('Stop');

Procedimento PL/SQL concluído com sucesso.

AML01ORA.AMLP.ABN[ALLOWED]>select sysdate from dual;

SYSDATE
--------------------------
03/dezembro/2004:10:16:09

1 linha selecionada.

AML01ORA.AMLP.ABN[ALLOWED]>select pname, pval1
  2  from  sys.aux_stats$
  3  where  sname = 'SYSSTATS_MAIN';

PNAME                               PVAL1
------------------------------ ----------
SREADTIM                           14,922
MREADTIM                           40,544
CPUSPEED                              520
MBRC                                   27
MAXTHR                          147458048
SLAVETHR                            47104


*/


prompt =========================================================================================================
prompt To cleanup statistics
prompt exec dbms_stats.delete_system_stats
prompt 
prompt =========================================================================================================
spool off
set feedback on

prompt
prompt  Ed SYSstat      @ SYSstat
prompt
