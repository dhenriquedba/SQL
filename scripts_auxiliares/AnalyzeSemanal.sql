Drop table SapXXi.Eventos
/
Create table SapXXi.Eventos
	(data	date,
	 evento	varchar2(1000),
	constraint Eventos_PK  primary key (data))
	ORGANIZATION INDEX
	Tablespace dat03
/
Create or Replace Procedure AnalyzeSemanal is
	Erro varchar2(900);
begin
	insert into sapxxi.eventos (data, evento)
		values (sysdate, 'Início Analyze Schema');
	commit;
	for i in 1..3 loop
		begin
			Dbms_utility.Analyze_schema('SAPXXI', 'compute');
			insert into sapxxi.eventos (data, evento)
				values (sysdate, 'Término Analyze Schema = Try #: '||1);
			commit;
			exit;
		exception
			when others then
			Erro := substr(Sqlerrm,1,900);
			insert into sapxxi.eventos (data, evento)
				values (sysdate, 'Erro Analyze Schema = Try #: '||1
					||'= '||Erro);
			commit;
		end;
	end loop;
end AnalyzeSemanal;
/
show error

exec AnalyzeSemanal

select * from eventos
/

declare
	a  number;
begin
	dbms_job.submit(a,'AnalyzeSemanal;',sysdate,'next_day(trunc(sysdate)+1/24,1)');
end;
/

prompt
prompt  Ed AnalyzeSemanal		@ AnalyzeSemanal
prompt
