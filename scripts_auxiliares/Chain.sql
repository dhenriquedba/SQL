Column "Percentual Encadeado"	Format 999.99
Column "Linhas Encadeadas"	Format 999,999,999
Column "Linhas da Tabela"	Format 999,999,999
Select c.table_name, count(*) "Linhas Encadeadas", t.num_rows "Linhas da Tabela", 
	decode(t.num_rows,0,0,((count(*)/(t.num_rows))*100)) "Percentual Encadeado"
	from DBA_TABLES t, CHAINED_ROWS c
		where t.table_name  =  c.table_name
			group by c.table_name, t.num_rows
				order by 4 desc
/
Prompt
Prompt	Ed Chain		 @Chain
Prompt
