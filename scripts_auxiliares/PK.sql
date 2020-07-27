column CONSTRAINT_NAME	format a30
column COLUMN_NAME	format a30
column POSITION		format 999

accept tabela Prompt 'Nome da Tabela: '
Select C.constraint_name , C.column_name, c.position
	from dba_constraints D, dba_cons_columns C
		where D.constraint_type		= 'P'
		  and D.table_name		= Upper('&tabela')
		  and D.constraint_name		= C.constraint_name;
prompt
prompt   Ed Pk		@ Pk
prompt
