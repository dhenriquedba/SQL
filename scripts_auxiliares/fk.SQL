set verify off
accept NomeDaConstraint prompt 'Nome da Constraint: '
Select c.column_name, d.r_constraint_name
    from  dba_cons_columns c, dba_constraints d
	where c.constraint_name = upper('&NomeDaConstraint')
	  and c.constraint_name = d.constraint_name 
Order by c.position
/
PROMPT
PROMPT
PROMPT    ED  fK     @ FK		ed PK		@ PK		@ Const
PROMPT
