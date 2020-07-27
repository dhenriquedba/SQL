conn ttcn212@amlpyp
@login
set feedback off  verify off  pause off echo off linesize 200  pagesize  0  term off
spool QdAcTrNomeDate.sql
Select 'Spool '||instance_name||'_LatAm_X_EMC_Crash_Recovery_'||To_Char(SysDate,'ddmmyyyy_hh24miss')||'.TXT' from v$instance;
Spool off
@QdAcTrNomeDate.sql
host del /q QdAcTrNomeDate.sql
set term on 
Prompt
Prompt  Este procedimento eliminará todos os Schemas MANTAS  !!!!!!!!!!!!!!
Prompt
Prompt
select 'Você está conectado como: '||user||'  No database: '||global_name from global_name;
Prompt
Pause
Prompt
Prompt  Este procedimento eliminará todos os Schemas MANTAS  !!!!!!!!!!!!!!
Pause
Prompt
Prompt .                       MESMO ??? !!! ??? !!!
Prompt
Pause  [Enter] continua      ........         [Ctrl]+[C]  cancela

set echo on pages 200 feedback on
drop user MANTAS cascade;
drop user DB_UTIL_USER cascade;
drop user INGEST_USER cascade;
drop user BUSINESS cascade;
drop user KDD cascade;
drop user KDD_WEB cascade;
drop user KDD_ALG cascade;
drop user KDD_MNR cascade;
drop user MARKET cascade;

alter user system identified by mantas
/
drop tablespace mantas_data_56k
	including contents and datafiles
/
create tablespace mantas_data_56k
	datafile '/oradata03/amlpyp/mantas_data_56k_01.ora' size 300M
		 AUTOEXTEND ON NEXT 10M MAXSIZE 2097152K
				EXTENT MANAGEMENT LOCAL UNIFORM SIZE 56k
			SEGMENT SPACE MANAGEMENT AUTO
	permanent online
/
spool off
prompt 
prompt ed LatAm_X_EMC_Crash_Recovery.sql	@LatAm_X_EMC_Crash_Recovery.sql
prompt 
