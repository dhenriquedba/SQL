set feedback off
set verify off
set pause off
set linesize 200
set pagesize  80
set head on
ttitle on

accept PWD prompt 'Informe senha para SYSTEM: ' hide
accept DB  prompt 'Informe          DataBase: '

conn System/&PWD@&DB
spool Estrut_&DB..txt

ttitle left "&DB = Relatorio de Configuracao do Ambiente ORACLE" skip 2
column tablespace_name format a15
column file_name format a40
column bytes format 999,999,999,999
break on tablespace_name skip 1
break on report
compute sum of bytes on report
select TABLESPACE_NAME,FILE_NAME,BYTES
from sys.dba_data_files
order by 1,2
/
clear breaks
column tablespace_name format a15
column Free format 999,999,999,999
column Contiguo format 999,999,999,999
break on report
compute sum of Free on report
select tablespace_name,sum(bytes) Free,max(bytes) Contiguo
 from sys.dba_free_space
 group by tablespace_name
order  by tablespace_name 
/
break on tablespace_name 
column tablespace_name format a15
column initial_extent format 999,999,999
column next_extent format 99,999,999
column min_extents format 999
column max_extents format 999
column pct_increase format 999
column status format a7
select tablespace_name,initial_extent,next_extent,max_extents,
pct_increase,status
from sys.dba_tablespaces
order by tablespace_name
/

break on username on tablespace_name on bytes 
break on report
column tablespace_name format a16
compute sum of bytes on report
ttitle left "&DB = Relatorio User x Space" skip 2
select username,tablespace_name,bytes
from dba_ts_quotas
--where bytes <>0
order by username,tablespace_name,bytes
/

column tablespace_name format a15
column segment_type format a10
column segment_name format a30
column bytes format 999,999,999,999
colum extents format 999

ttitle left "&DB = Relatorio Segment x Space" skip 2
break on tablespace_name on segment_type
select tablespace_name,segment_type,segment_name,bytes,extents
from sys.dba_segments
where bytes>5000000
or extents >2
order by tablespace_name,segment_type,bytes
/

set pause off
set head on
ttitle left "&DB = Relatorio de Configuracao do Ambiente ORACLE - Usuarios, Roles, etc" skip 2
break on grantee skip 1
column grantee heading 'Usuario/Role' Format A20
column GRANTED_ROLE heading 'Role'  Format A30
column ADMIN_OPTION heading 'Admin ?'  Format A8
column GRANTABLE  heading 'Admin ?'  Format A8
column DEFAULT_ROLE heading 'Default ?' Format A8
column OWNER heading 'Owner' Format A15
column TABLE_NAME heading 'Table Name' Format A33
column PRIVILEGE heading 'Previlegio' Format A28

select GRANTEE, PRIVILEGE, ADMIN_OPTION
from dba_sys_privs
order by grantee
/
select GRANTEE, OWNER, TABLE_NAME, PRIVILEGE, GRANTABLE
from dba_tab_privs
order by grantee
/
select GRANTEE, GRANTED_ROLE, ADMIN_OPTION, DEFAULT_ROLE
from dba_role_privs
order by grantee
/


ttitle left "&DB = Relatorio de Configuracao do Ambiente ORACLE - Diversos" skip 2

select PROFILE, RESOURCE_NAME, LIMIT
from dba_profiles
order by 1
/
select value "Resource Limit"
from v$parameter
where name = 'resource_limit'
order by 1
/
select * from v$controlfile
/
select * from v$logfile
/
select * from v$database
/
select Name, Value "Parametros nao Default"
from v$parameter
where ISDEFAULT = 'FALSE'
/

spool off

Alter database backup controlfile to trace
/
set feedback on
set verify on
set pause off
set linesize 80
set pagesize  30
set head on
ttitle off
prompt Copiar Trace de Controlfile do Background Dump Dest

