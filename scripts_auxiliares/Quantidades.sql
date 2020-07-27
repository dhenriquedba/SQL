Create table quantidades
(tabela        varchar2(30),
 data          date,
 linhas        number not null,
 constraint quantidades_pk primary key (tabela, data))
tablespace distrib
storage (initial 64k next 64k)
/


Insert into Quantidades
	select table_name, trunc(sysdate)-4, nvl(num_rows,0)
		from user_tables
			where table_name like 'PSAP%'
	order by 1;