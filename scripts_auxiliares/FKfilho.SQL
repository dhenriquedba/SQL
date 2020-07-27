set verify off
accept NomeDaConstraint prompt 'Nome da Constraint: '
Select c.table_name, c.column_name, d.constraint_name
    from  dba_cons_columns c, dba_constraints d
 where d.CONSTRAINT_NAME = upper('&NomeDaConstraint')
   and c.constraint_name = d.constraint_name
	order by c.position
/
PROMPT
PROMPT
PROMPT    ED  FKfilho     @ FKfilho
PROMPT
