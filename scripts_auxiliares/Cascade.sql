select distinct 'select count(*) from admin_fol.'||table_name||';'
from dba_constraints
where table_name in(select distinct table_name from
                     dba_constraints where r_constraint_name in
                              (select  distinct constraint_name   from dba_constraints
 where owner = 'ADMIN_FOL'
   and table_name in (select  distinct table_name from dba_tab_columns where data_type like '%LONG%')))
   and delete_rule = 'CASCADE'
order by 1
/
