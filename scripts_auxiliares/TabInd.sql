set feedback off  verify off  pause off echo off linesize 200  pagesize  80 term off
spool QdAcTrNomeDate.sql
Select 'Spool '||upper(Instance_Name)||'_Tab_Ind_'||To_Char(SysDate,'ddmmyyyy')||'.DOC'
	from v$instance;
Spool off
@QdAcTrNomeDate.sql
host del /q QdAcTrNomeDate.sql
set term on

prompt =================================================================================================
Select Instance_Name                                 "Oracle Instance Analizada",
       to_char(sysdate,'dd-fmmonfm-yyyy=hh24:mi:ss') "Data Analise"
From v$instance;
Column X format a30 heading 'Tabelas sem|Primary Key'
Column XX format 999,999 heading 'Tabelas sem|Primary Key'
prompt ================== Tabelas sem Primary Key ========================================================
Select count(*) xx
	from dba_tables ext
		where Table_name not in (Select table_name 
						from dba_constraints
							where owner = ext.owner
							  and constraint_type = 'P')
		  and owner not in ('SYS', 'SYSTEM', 'DBSNMP', 'OUTLN', 'TRACESVR', 'AURORA$JIS$UTILITY$', 'OSE$HTTP$ADMIN', 'PERFSTAT', 'RMAN')
/
Select owner, table_name x
	from dba_tables ext
		where Table_name not in (Select table_name 
						from dba_constraints
							where owner = ext.owner
							  and constraint_type = 'P')
		  and owner not in ('SYS', 'SYSTEM', 'DBSNMP', 'OUTLN', 'TRACESVR', 'AURORA$JIS$UTILITY$', 'OSE$HTTP$ADMIN', 'PERFSTAT', 'RMAN')
	order by 1,2
/

Column X format a30 heading 'Tabelas sem|Performance Indexes'
Column XX format 999,999 heading 'Tabelas sem|Performance Indexes'
prompt ================== Tabelas sem Performance Indexes ================================================
Select count(*) xx
	from dba_tables ext
		where Table_name not in (Select table_name 
						from dba_indexes 
							where owner = ext.owner
							  and uniqueness = 'NONUNIQUE')
		  and owner not in ('SYS', 'SYSTEM', 'DBSNMP', 'OUTLN', 'TRACESVR', 'AURORA$JIS$UTILITY$', 'OSE$HTTP$ADMIN', 'PERFSTAT', 'RMAN')
/
Select owner, table_name x
	from dba_tables ext
		where Table_name not in (Select table_name 
						from dba_indexes 
							where owner = ext.owner
							  and uniqueness = 'NONUNIQUE')
		  and owner not in ('SYS', 'SYSTEM', 'DBSNMP', 'OUTLN', 'TRACESVR', 'AURORA$JIS$UTILITY$', 'OSE$HTTP$ADMIN', 'PERFSTAT', 'RMAN')
	order by 1,2
/

spool off
