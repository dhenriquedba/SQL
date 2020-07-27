set pagesize 0 feedback off  linesize 300
define _editor='write.exe'
column bytes format 999,999,999,999
column qtd format 999,999,999,999
column numrows format 999,999,999,999
column bytesperrow format 999,999,999,999
column sysdate		format	a26
column file_name 		format	a35
COLUMN LAST_ANALYZED 	FORMAT	A22
COLUMN tablespace_name 	FORMAT	a30
COLUMN TABLE_NAME 	FORMAT	A30
column Object_type	Format A30
column Object_name	Format A30
column owner 		Format A30

SET LINE 90
SET SERVEROUTPUT ON TERMOUT OFF verify off
SET ECHO OFF HEADING OFF FEEDBACK OFF


VARIABLE ESTADO VARCHAR2(50)
BEGIN
	select to_char(sysdate,'ddmonyyyy')
		INTO :ESTADO
			from v$instance;
END;
/

SPOOL LOGIN1.SQL
SELECT 'spool ' || value || '_'||:ESTADO||'.doc' FROM V$parameter where name = 'instance_name'
/
SPOOL OFF
@LOGIN1.SQL
host del LOGIN1.SQL
SET  TERMOUT ON
set pagesize 5000 linesize 160 feedback on heading on

--create table ttcn212.listaobjetos as
insert into  ttcn212.listaobjetos 
	select owner, object_type, object_name, trunc(sysdate) data
	from dba_objects
	where owner in  ('BUSINESS'
				, 'MANTAS'
				, 'KDD'
				, 'KDD_WEB'
				, 'KDD_ALG'
				, 'KDD_MNR'
				, 'MARKET'
				, 'INGEST_USER'
				, 'DB_UTIL_USER'
				, 'INFO_REP_P'
				, 'INFO_REP_S')
	order by 1,2,3 ;
--create table ttcn212.resumoobjetos as
insert into  ttcn212.resumoobjetos 
	select owner, object_type, count(*) quantity, trunc(sysdate) data
	from dba_objects
	where owner in  ('BUSINESS'
				, 'MANTAS'
				, 'KDD'
				, 'KDD_WEB'
				, 'KDD_ALG'
				, 'KDD_MNR'
				, 'MARKET'
				, 'INGEST_USER'
				, 'DB_UTIL_USER'
				, 'INFO_REP_P'
				, 'INFO_REP_S')
	group by owner, object_type, trunc(sysdate)
	order by 1,2;

select owner, object_type, object_name
	from dba_objects
	where owner in  ('BUSINESS'
				, 'MANTAS'
				, 'KDD'
				, 'KDD_WEB'
				, 'KDD_ALG'
				, 'KDD_MNR'
				, 'MARKET'
				, 'INGEST_USER'
				, 'DB_UTIL_USER'
				, 'INFO_REP_P'
				, 'INFO_REP_S')
	order by 1,2,3 ;

select owner, object_type, count(*)
	from dba_objects
	where owner in  ('BUSINESS'
				, 'MANTAS'
				, 'KDD'
				, 'KDD_WEB'
				, 'KDD_ALG'
				, 'KDD_MNR'
				, 'MARKET'
				, 'INGEST_USER'
				, 'DB_UTIL_USER'
				, 'INFO_REP_P'
				, 'INFO_REP_S')
	group by owner, object_type, trunc(sysdate)
	order by 1,2;

spool off
prompt
prompt drop table  ttcn212.LISTAOBJETOS;;
prompt drop table  ttcn212.resumoobjetos;;
prompt
prompt    Ed ListObj		@ ListObj
prompt
