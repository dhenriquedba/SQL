set echo off feedback off pages 0 linesize 150 long 2000000000 feedback off

Prompt observar os comandos abaixo para manipular o que é retornado !
Prompt execute DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'STORAGE',false);
Prompt SELECT DBMS_METADATA.GET_DDL('INDEX','IX1_DPORC') FROM dual;
Prompt execute DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'DEFAULT');

accept USR prompt 'Schema from which get the MetaData: '
spool &USR..metadata_1.sql
Select 'select dbms_metadata.get_ddl(''TABLE'','''||table_name||''','''
		||owner||''') from dual;'||chr(10)||'prompt /'
	from dba_tables
		where owner = upper('&USR')
/

Select 'select dbms_metadata.get_ddl(''INDEX'','''||index_name||''','''
		||owner||''') from dual;'||chr(10)||'prompt /'
	from dba_indexes
		where owner = upper('&USR')
/
prompt prompt 
prompt prompt ==================================================================
prompt prompt =                      C U I D A D O !!!                         =
prompt prompt ==================================================================
prompt prompt =    Alguns dos "Create" gerados podem ter linhas truncadas      =
prompt prompt =               ou que continuam na próxima lina                 =
prompt prompt ==================================================================
prompt prompt 

spool off

spool &USR..metadata.sql
@ &USR..metadata_1.sql
spool off

set echo off feedback on pages 30
Prompt
Prompt   Ed &USR..metadata.sql		@ &USR..metadata.sql
Prompt
Prompt   Ed MetaData.sql			@ MetaData.sql
Prompt
