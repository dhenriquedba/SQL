Drop Table GPASchemas
/
Create Table GPASchemas
	(db	varchar2(30),
	 Schema	varchar2(30),
	 Sistema varchar2(30),
	 Owner	 varchar2(30),
	 DATA	 date,
	 GB	 number(10,3))
/
Drop Table GPASchemasErrors
/
Create Table GPASchemasErrors
	(Erro	varchar2(300),
	 DATA	 date)
/


declare
	Cursor db is
		select db_link
			from sys.dba_db_links
				Where db_link not like 'LOJA%'
--				  and db_link = 'PAP39_SAP2'
			order by 1;
		VarCommand varchar2(1024);
		VarErro varchar2(300);
begin
	execute immediate 'truncate table GPASchemas';
	execute immediate 'truncate table GPASchemasErrors';
	for i in db loop
		begin
		VarCommand := 'insert into GPASchemas (db,schema,data,gb)
				select '''||substr(i.db_link,(instr(i.db_link,'_')+1))||''', owner, trunc(sysdate), sum(bytes)/1024/1024/1024
					from sys.dba_extents@'||i.db_link||'
				group by owner';
--		dbms_output.put_line(VarCommand);
		execute immediate VarCommand;
		execute immediate 'commit';
		exception
			when others then
				VarErro := substr(sqlerrm,1,300);
				insert into GPASchemasErrors values (VarErro,sysdate);
		end;
	end loop;
	commit;
end;
/

show error

select * from GPASchemasErrors
/
select count(*) from GPASchemasErrors
/
select count(*) from GPASchemas
/




select o.nome_banco, o.descricao, o.ambiente, o.responsavel, o.destinatario, 
	o.host_name, o.local, o.localizacao,
	s.DB     , s.SCHEMA , s.SISTEMA, s.OWNER  , s.DATA   , s.GB     
		from  OEMUSER.v_BANCO_host o, ibm0071GPASchemasX s
			Where o.nome_banco = s.db
/

Prompt 
Prompt   Ed MoveSchemas.sql          @MoveSchemas.sql
Prompt 

