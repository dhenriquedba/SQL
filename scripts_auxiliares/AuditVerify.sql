set feedback off  verify off  pause off echo off linesize 200  pagesize  0  term off
spool DataBaseFiles.sql

select 'ls -l ' || file_name "DATA FILE(S)" from dba_data_files
union
select 'ls -l '|| file_name "RBS/UNDO FILE(S)" from dba_data_files
where (tablespace_name like '%UNDO%' or tablespace_name like '%RBS%')
union
select 'ls -l '|| file_name "TEMP FILE(S)" from dba_temp_files
union
select 'ls -l ' || name "CONTROL FILE(S)" from v$controlfile
union
select 'ls -l ' || member "REDO FILE(S)" from v$logfile
union
select 'ls -l ' || name "ARCHIVE FILE(S)"
from (select name from v$archived_log order by first_time desc)
where rownum = 1
union
SELECT 'ls -l '||value||'/alert_'||instance_name||'.log' "##"
  FROM v$parameter,
       v$instance
  WHERE name = 'background_dump_dest'
/
spool off

@login
set feedback off  verify off  pause off echo off linesize 200  pagesize  0  term off
spool QdAcTrNomeDate.sql
Select 'Spool '||instance_name||'_Security_Verify_'||To_Char(SysDate,'ddmonyyyy')||'.TXT' from v$instance;
Spool off
@QdAcTrNomeDate.sql
host rm -rf QdAcTrNomeDate.sql
set term on




set lines 200 pages 500
set echo off
Prompt  ===============================================================================
Prompt  ===============================================================================
Prompt  1.Arquivos VERIFY_FUNCTION (VERIFICA SENHA)
Prompt  ===============================================================================
Prompt  ===============================================================================
Prompt  
set echo on
select text
from dba_source
where name in (select limit from dba_profiles where resource_name='PASSWORD_VERIFY_FUNCTION')
order by LINE;


set echo off
Prompt  ===============================================================================
Prompt  ===============================================================================
Prompt  2.Relação de permissões de acesso (read, write, etc) aos seguintes arquivos
Prompt  .   Binarios
Prompt  .   Tabelas e arquivos de dados
Prompt  .   Arquivos de controle (logs)
Prompt  .   Arquivos de inicialização
Prompt  .   Arquivos de configuração
Prompt  .   Arquivo listener
Prompt  ===============================================================================
Prompt  ===============================================================================
Prompt  
set echo on

alter system switch logfile;
Create pfile from spfile;
! ls -l $ORACLE_HOME/dbs/config*
! ls -l $ORACLE_HOME/dbs/init$ORACLE_SID.ora
| ls -l $ORACLE_HOME/dbs/spfile$ORACLE_SID.ora
! ls -l $ORACLE_HOME/bin/oracle
! ls -l $ORACLE_HOME/network/admin
! ls -l $ORACLE_HOME/network/log
! ls -l $ORACLE_HOME/rdbms/admin/utlpwdmg.sql

@DataBaseFiles
! rm -rf DataBaseFiles.sql
spool off

