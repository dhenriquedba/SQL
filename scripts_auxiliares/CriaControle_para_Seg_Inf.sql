-- Cria usu�rios para SCA
-- Executar com o usu�rio SYS
conn ttcn212@amlp as sysdba
@login
spool CriaControle_para_Seg_Inf.log
set echo on
CREATE USER CONTROLE IDENTIFIED BY controle
DEFAULT TABLESPACE USERS TEMPORARY TABLESPACE TEMPORARY;

GRANT CONNECT TO CONTROLE;
GRANT DROP USER TO CONTROLE;
GRANT ALTER USER TO CONTROLE;
GRANT CREATE ROLE TO CONTROLE;
GRANT CREATE USER TO CONTROLE;
GRANT ALTER SESSION TO CONTROLE WITH ADMIN OPTION;
GRANT CREATE SESSION TO CONTROLE WITH ADMIN OPTION;
GRANT CREATE DATABASE LINK TO CONTROLE WITH ADMIN OPTION;
GRANT CREATE PUBLIC SYNONYM TO CONTROLE;
GRANT CREATE PUBLIC DATABASE LINK TO CONTROLE;

GRANT SELECT ON  SYS.DBA_DB_LINKS TO CONTROLE;
GRANT SELECT ON  SYS.DBA_OBJECTS TO CONTROLE;
GRANT SELECT ON  SYS.DBA_ROLES TO CONTROLE;
GRANT SELECT ON  SYS.DBA_ROLE_PRIVS TO CONTROLE;
GRANT SELECT ON  SYS.DBA_USERS TO CONTROLE;
spool off
set echo off
