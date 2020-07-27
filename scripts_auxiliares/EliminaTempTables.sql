select 'drop table '||owner||'.'||table_name||';'
from dba_tables
where owner not in ('SYS','SYSTEM','PERFSTAT')
and table_name like '%TEMP%'
and table_name not in ('KDD_JOB_TEMPLATE', 'RULE_MATCHER_TEMP', 'RGSTD_REP_SCRTY_TEMP', 'RULE_MATCHER_TEMP_SEQ_ID')
/
