select instance_name from v$instance
/
select username||',' from dba_users
where username not in ('SYS', 'SYSTEM', 'DBSNMP', 'OUTLN', 'TRACESVR', 'AURORA$JIS$UTILITY$', 'OSE$HTTP$ADMIN', 'PERFSTAT')
/
