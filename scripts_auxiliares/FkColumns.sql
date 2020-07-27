set verify off
column Filha		format a30
column Pai 		format a30
column 'Coluna Filha'   format a30
column 'Coluna Pai'     format a30

break on Filha on Pai

select c.table_name "Filha", c.r_constraint_name "Pai", l.column_name "Coluna Filha"
from user_constraints c, user_cons_columns l
 where c.constraint_name = Upper('&CONST')
  and c.owner       =       l.owner
  and c.table_name  =       l.table_name
  and c.constraint_name  =  l.constraint_name
order by l.position
/
accept Constraint_pai prompt 'Constraint pai: '
select c.table_name "Pai", l.column_name "Coluna Pai"
from user_constraints c, user_cons_columns l
 where c.constraint_name = Upper('&Constraint_pai')
  and c.owner       =       l.owner
  and c.table_name  =       l.table_name
  and c.constraint_name  =  l.constraint_name
order by l.position
/
Prompt
Prompt  Ed  FkColumns          @    FkColumns       ED PROCURA       @ PROCURA 

Prompt