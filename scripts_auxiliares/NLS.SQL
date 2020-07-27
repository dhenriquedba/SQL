set term off feedback off pages 0
spool nls1.sql
select 'prompt '||table_name||chr(10)||
			'select * from '||table_name||';'
	from dict
		where table_name like 'NLS%'
/
spool off
set term on pages 30
@NLS1
set feedback on 
prompt
prompt     ed NLS       @ NLS
prompt
