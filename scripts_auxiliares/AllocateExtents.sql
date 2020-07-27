begin
for i in 1..100 loop
	execute immediate 'alter table business.acct modify partition ac4 allocate extent';
	end loop;
	end;
/

Select  'alter table '||table_name||
	' modify partition '||partition_name||' deallocate unused;'
		from user_tab_partitions
			where table_name in ('ACCT', 'MI_TRXN');