/*
select owner, table_name from 
	dba_tables 
		where owner in ('SEGN'					,'SEGR')
		  and table_name in ('USER_ACES', 'USER_GERAL')
order by 1,2;

select count(*) from
(
select cod_user from SEGN.USER_GERAL
union
select cod_user from SEGR.USER_ACES
);

create table lc000780.soxusers
( 	instance	varchar2(30),
	username	varchar2(30),
	perfil		varchar2(30),
	constraint soxuserspk primary key (instance, username));

Create database link prd3 identified by lc000780 using 'prd3';

*/

declare
	Vinstance	varchar2(30);
	cursor ativo is select a.username 
		from lc000780.soxusers@prd3 a, dba_users b
			where instance = vinstance
			  and a.username  = b.username
			  and perfil is null
		order by username
			for update;
	cursor inativo is select a.username 
		from lc000780.soxusers@prd3 a, dba_users b
			where instance = vinstance
			  and a.username  = b.username
			  and ACCOUNT_STATUS like '%EXPIRED%'
			  and perfil is null
		order by username
			for update;

begin
	select instance_name into vinstance from v$instance;
	insert into lc000780.soxusers@prd3
		select vinstance, cod_user
			 from SEGN.USER_GERAL
			union
		select vinstance, a.cod_user
			from SEGR.USER_ACES;
	update lc000780.soxusers@prd3
		set perfil = 'administracao'
			where username in ('DBA_BKP'
					,'SYS'
					,'SYSADM'
					,'SYSBKP'
					,'SYSPWD'
					,'SYSTEM'
					,'CBD_MONITOR'
					,'DBSNMP'
					,'MONITOR'
					,'OEM0'
					,'OEMUSER'
					,'OUTLN'
					,'QUEST'
					,'QUEST2'
					,'QUEST9I'
					,'BKPLOJA_OPER'
					,'331098'
					,'LC000019'
					,'LC000021'
					,'LC000555'
					,'LC000413'
					,'LC000780'
					,'LC000928'
					,'10833103'
					,'LC000580'
					,'LC000585'
					,'LC000688'
					,'LC000483');
	update lc000780.soxusers@prd3
		set perfil = 'conta servico'
			where username in ('AC01'
					,'AC31'
					,'AC31_USER'
					,'AC34'
					,'AC51'
					,'ADM'
					,'ADUSER'
					,'CLIE'
					,'CONC'
					,'CRM5'
					,'FCHK'
					,'FORN'
					,'GC10'
					,'GC51'
					,'GC51_USER'
					,'GCA3'
					,'GCA4'
					,'GCA5'
					,'GCA7'
					,'GCA8'
					,'GCON'
					,'GCTS'
					,'LJ06'
					,'LJ08'
					,'MK04'
					,'MK08'
					,'MK10'
					,'MK10RELACAO'
					,'PAPONTOCOM'
					,'PA_LOJA'
					,'PDPE'
					,'PESQ'
					,'PMO_USER'
					,'PORTIFOLIO'
					,'PRD957'
					,'PRD968'
					,'PRD981'
					,'PRD986'
					,'PRDX99'
					,'PROD'
					,'PROP'
					,'PRPE'
					,'PTBD_OPER'
					,'RELPROD'
					,'SEGN'
					,'SEGN_CRYSTAL'
					,'SEGN_DBLNK'
					,'SEGN_USER'
					,'SEGR'
					,'SEGR_USER'
					,'SIGE_DBLNK'
					,'SMS_USER'
					,'SOPS'
					,'SOX'
					,'SPOTUSER'
					,'TI52_USER'
					,'TRANSFER'
					,'VERITAS');
	for a in inativo loop
		update lc000780.soxusers@prd3
			set perfil = 'usuario inativo'
			where current of;
	end loop;
	for a in ativo loop
		update lc000780.soxusers@prd3
			set perfil = 'usuario ativo'
			where current of;
	end loop;
	commit;
end;
/


Prompt
Prompt Ed  GPAvalidUSERS.sql         @ GPAvalidUSERS.sql 
prompt


                           
                           