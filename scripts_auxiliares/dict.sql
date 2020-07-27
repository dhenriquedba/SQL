Accept tabela prompt 'String: '
Select * 
	from dict 
		where table_name like upper('%&tabela%')
		  and (table_name not like 'USER_%'
		       or table_name not like 'ALL_%')
Union
select name, null
	from  v$fixed_table 
		where name like upper('%&tabela%');
prompt
prompt Select table_name, column_name, comments from dict_columns
prompt where table_name = 'tab'
prompt   and column_name = 'col';
prompt
prompt
prompt  ed Dict       @ Dict
prompt

