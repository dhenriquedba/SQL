set PAUSE ' ... em pausa !!! ... APERTE ENTER, PARA CONTINUAR ... '
set pagesize 0 feedback off  linesize 300 
--define _editor='notepad.exe'
define _editor='vi'
column bytes format 999,999,999,999
column qtd format 999,999,999,999
column numrows format 999,999,999,999
column bytesperrow format 999,999,999,999
column Gbytes format 999,999,999,999
column sysdate		format	a26
column file_name 		format	a50
COLUMN LAST_ANALYZED 	FORMAT	A22
COLUMN tablespace_name 	FORMAT	a30
COLUMN TABLE_NAME 	FORMAT	A30
column Object_type	Format A30
column Object_name	Format A30
column partition_name 	format a15
SET LINE 130
SET SERVEROUTPUT ON size 1000000 TERMOUT OFF verify off
SET ECHO OFF HEADING OFF FEEDBACK OFF time on 
VARIABLE ESTADO VARCHAR2(50)
BEGIN
	select LOGINS||'='||user
		INTO :ESTADO
			from v$instance;
END;
/

SPOOL LOGIN1.SQL
SELECT 'SET SQLPROMPT @' || value || '['||:ESTADO||']>' FROM V$parameter where name = 'instance_name'
/
SPOOL OFF
@LOGIN1.SQL
--host del /q LOGIN1.SQL
host rm -rf LOGIN1.SQL
SET  TERMOUT ON
alter session set nls_date_format='dd/fmmonthfm/yyyy:hh24:mi:ss';
alter session set nls_language='English';
prompt
prompt
prompt  Original Idea from Alexandre Nobuo Satake 1999
prompt
prompt FIAP - MBA DBA Oracle - Prof.Od�cio Souza
prompt
prompt Setup Disciplinas SQL e PL/SQL - Out.2012
prompt
prompt
select 'Bem vindo '||user||' !!! ' from dual;
prompt
prompt
select sysdate from dual;
prompt
prompt
select 'Cuidado !!! Voce estah conectado aa instance '
          ||Initcap(instance_name)||' do servidor '
	    ||Initcap(host_name) FROM V$instance;

prompt
prompt
prompt

set pagesize 45 linesize 120 feedback on heading on
