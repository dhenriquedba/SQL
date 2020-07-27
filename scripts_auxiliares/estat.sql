@login
prompt connect como sys !!!
prompt
prompt <Ctrl>+<C> se não for SYS !!!
pause

select tablespace_name from dba_tablespaces
/
Drop table Sys.Eventos
/
accept tbs prompt 'Escolha um Tablespace para tabela Sys.eventos: '
Create table Sys.Eventos
	(data	date,
	 evento	varchar2(1000),
	constraint Eventos_PK  primary key (data,evento))
	ORGANIZATION INDEX
	Tablespace &tbs
/
Create public synonym eventos for sys.eventos
/
grant select on sys.eventos to public
/
Create or Replace Procedure sys.AnalyzeSemanal authid CURRENT_USER is
	Erro varchar2(900);
	cursor USERS_AN is
		select username from sys.dba_users
			where username not in ('SYS', 'SYSTEM', 'DBSNMP', 'RMAN', 'OUTLN', 'PERFSTAT')
                              and username not like '%$%'
			order by 1;
begin
	insert into Sys.eventos (data, evento)
		values (sysdate, 'Início Analyze Schema');
	commit;
	for usr in USERS_AN loop
	    for i in 1..3 loop
		begin
			Dbms_utility.Analyze_schema(usr.USERNAME, 'compute');
			insert into Sys.eventos (data, evento)
				values (sysdate, 'Término Analyze Schema = '||usr.USERNAME||' Try #: '||i);
			commit;
			exit;
		exception
			when others then
			Erro := substr(Sqlerrm,1,850);
			insert into Sys.eventos (data, evento)
				values (sysdate, 'Erro Analyze Schema = '||usr.USERNAME||' Try #: '||i
					||'= '||Erro);
			commit;
		end;
	    end loop;
	end loop;
end AnalyzeSemanal;
/
show error

--exec AnalyzeSemanal

--select * from eventos

declare
	a  number;
begin
	dbms_job.submit(a,'AnalyzeSemanal;',sysdate,'next_day(trunc(sysdate)+1/24,1)');
end;
/
alter system set job_queue_processes=1;
@jobs
show parameter job
prompt
prompt  Ed estat		@ estat
prompt
