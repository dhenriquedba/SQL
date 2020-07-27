set pagesize 24
set linesize 132
col fk_owner	format a10
col fk_table	format a15
col pk_owner	format a10
col pk_table	format a15
col fk_col	format a15
col pk_col	format a15

select 	fk.owner fk_owner,
	fk.table_name fk_table,
	fkc.column_name fk_col,
	pk.owner pk_owner,
	pk.table_name pk_table,
	pkc.column_name pk_col
from	dba_constraints fk,
	dba_constraints pk,
	dba_cons_columns fkc,
	dba_cons_columns pkc
where	fk.r_constraint_name = pk.constraint_name
and	fk.constraint_type = 'R'
and 	pk.constraint_type = 'P'
and 	fk.r_owner = pk.owner
and	fk.constraint_name = fkc.constraint_name	
and	pk.constraint_name = pkc.constraint_name	
and 	fk.owner = fkc.owner
and 	fk.table_name = fkc.table_name
and 	pk.owner = pkc.owner
and 	pk.table_name = pkc.table_name;

