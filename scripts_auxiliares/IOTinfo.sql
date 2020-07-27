Select  t.table_name		"IOT",
	o.table_name		"Overflow",
	i.index_name		"Index",
	o.tablespace_name	"Overflow Tbs",
	i.tablespace_name	"Index Tbs",
	i.pct_threshold		"Threshold"
from 	user_tables t,
	user_tables o,
	user_indexes i
where	t.table_name = o.iot_name
  and	t.table_name = i.table_name
order by 1
/
prompt at demo, find readtrace.sql, gt.sql and gettrace.sql !