accept tab prompt 'Tabela:                       '
select
'alter table &tab disable constraint '||constraint_name||';'
from user_constraints
where constraint_type <> 'P'
        and table_name = upper('&tab')
/
prompt
prompt   Ed DisableConstTab              @ DisableConstTab
prompt
