select disco, sum(bytes) bytes, sum(qtd) qtd from
(select substr(file_name,2,6) disco, sum(bytes) bytes, count(*) qtd
from dba_data_files
group by substr(file_name,2,6)
union
select substr(file_name,2,6) disco, sum(bytes) bytes, count(*) qtd
from dba_temp_files
group by substr(file_name,2,6)
union
select substr(f.member,2,6) disco, sum(l.bytes) bytes, count(*) qtd
	from v$logfile f, v$log l
	 where f.group# = l.group#
group by substr(f.member,2,6))
group by disco
/
