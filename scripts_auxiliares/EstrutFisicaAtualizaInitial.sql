column initialextent format 999,999,999
declare
	cursor xxx is
	select segment_name, sum(bytes) bytes
		from dba_extents
		 where segment_name in (select table_name
                			      from dba_tables
                			         where iot_type is null)
		   and owner = 'SAPXXI'
		   and segment_name not like '%$%'
		group by segment_name
	union
	select table_name, sum(bytes) bytes
	      from dba_constraints, dba_extents
		where segment_name = constraint_name
		  and table_name in (select table_name
        			       from dba_tables
                        		 where iot_type = 'IOT')
     		and dba_extents.owner = 'SAPXXI'
  		and segment_name not like '%$%'
	group by table_name
	order by 1;
begin
	for i in xxx loop
		update sys.estrutfisica@sapmtr
			set INITIALEXTENT = (i.bytes*3)
		where tabela = i.segment_name;
	end loop;
end;
/

select tabela, INITIALEXTENT, bytes
  from sys.estrutfisica@sapmtr , (select segment_name, sum(bytes) bytes
		from dba_extents
		 where segment_name in (select table_name
                			      from dba_tables
                			         where iot_type is null)
		   and owner = 'SAPXXI'
		   and segment_name not like '%$%'
		group by segment_name
	union
	select table_name, sum(bytes) bytes
	      from dba_constraints, dba_extents
		where segment_name = constraint_name
		  and table_name in (select table_name
        			       from dba_tables
                        		 where iot_type = 'IOT')
     		and dba_extents.owner = 'SAPXXI'
  		and segment_name not like '%$%'
	group by table_name) monstro
where estrutfisica.tabela = monstro.segment_name
/
rollback
/

prompt
prompt Ed EstrutFisicaAtualizaInitial.sql       @EstrutFisicaAtualizaInitial.sql
prompt


