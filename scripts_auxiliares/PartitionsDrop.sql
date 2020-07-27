accept table prompt 'tabela: '
select count(*) from business.&table;
select distinct' -----'||tablespace_name from dba_tab_partitions
     where table_name = upper('&table');

select 'alter table '||table_owner||'.'||table_name||' drop partition '||partition_name||';'
	 from dba_tab_partitions
     where table_name = upper('&table')
order by 1 desc
/
prompt
prompt 	@ PartitionsDrop.sql
prompt
