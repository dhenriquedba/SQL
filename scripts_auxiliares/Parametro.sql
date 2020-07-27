set lines 90
column name										format A40
column value									format A20
column isdefault			heading 'IsDe-|fault'			format A6
column issys_modifiable		heading 'Is System|Modifiable'	format A10
column isses_modifiable		heading 'Is Session|Modifiable'	format A10
column DESCRIPTION								format A90
select name, value, isdefault, issys_modifiable, isses_modifiable, DESCRIPTION
from v$parameter
where name like lower('%&Nome_Do_Parametro%')
/
prompt	
prompt	@parametro			ed parametro
prompt
