select 'select count(*) from '||owner||'.'||table_name||';'
from dba_tables
where table_name like 'RULE_MATCHER_T%'
order by 1
/
