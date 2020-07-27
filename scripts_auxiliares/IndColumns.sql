Column index_name		heading	'index|name'	format a30
Column column_name	heading	'column|name'	format a30
Column column_position	heading	'column|position'	format 999
set lines 100 pages 50

select index_name, column_name, column_position
from dba_ind_columns
where table_name = upper('&TABELA')
order by 1,3
/
Prompt 
Prompt ed IndColumns.sql	@IndColumns.sql
Prompt 
