-- parque bd
select versao "Versão", count(*) "Quantidade"
 from OEMUSER.V_BANCO_host
 group by versao
 union
     select '   Soma', count(*)
from OEMUSER.v_BANCO_host
 order by 2;

-- Oracle sede sem sap ou retail
 select versao, count(*)
 from oemuser.banco
 where sgbd='ORACLE'
    and AMBIENTE_TMP <> 'LOJA'
  and destinatario = 'GADBD'
 group by versao
 order by 1;
ou
select nome_banco, versao
 from oemuser.v_banco_host
                          where sgbd='ORACLE'
     and AMBIENTE <> 'LOJA'
  and destinatario = 'GADBD'
 order by 2;


    Criei uma tabela no DBA_MONITOR para controlarmos os nossos próximos restores.
 
    Tem uma procedure P_INS_RESTORE_BANCO  que cadastra na tabela e tem uma view para consultar os restores efetuadas v_restore_banco.

-- Lojas, versão, criação (erro 58)
-- Para os detalhes a tabela "oemuser.banco_loja" ou a view "oemuser.v_banco_host".
Select COD_UCBD, to_char(data_criacao,'yyyymmdd') "Criação DB", versao
from OEMUSER.BANCO_LOJA
where versao is not null
Order by 1,2;

select versao "Versão", count(*) "Quantidade"
 from OEMUSER.BANCO_LOJA
 where versao is not null
 group by versao
 union
     select '   Soma', count(*)
 from OEMUSER.BANCO_LOJA
 where versao is not null
 order by 2;



-- Lojas XE
oemuser.banco_lojas
OEMUSER.V_VERSAO_LOJAS

Select to_char(data_inau,'yyyymon') "Inauguração",
to_char(data_criacao,'yyyymon') "Migração XE", count(*) "Qtd"
 from OEMUSER.BANCO_LOJA
 where versao = 'XE'
group by to_char(data_inau,'yyyymon'), to_char(data_criacao,'yyyymon')
Order by 1,2;


-- para price
nome_banco in ('PRD70'
,'PRD5'
,'PRD3'
,'PRD60'
,'PRD80'
,'PRD82'
,'PDR84'
,'PRD1'
,'PRD67'
,'PRD89'
,'PRD52'
,'PRD68')


column nome_banco format a22
column SOFTWARE_BACKUP format a20
column TIPO_BACKUP format a20

set lines 120 pages 200

prompt  Conn lc000780@prd99

prompt  loja_3113
prompt  oemuser.V_ROTINA_BACKUP
prompt  oemuser.V_LOGINS
prompt  oemuser.V_BANCO_HOST
prompt  oemuser.V_BANCO_SEM_BACKUP

-- tamanho, menos a temp
Select host_name, nome_banco, sgbd, size_tbs_mb, size_tbs_gb From oemuser.v_size_banco;

--crescimento
Select host_name, nome_banco, data_monitora, ocupado_mb
  From oemuser.v_crescimento_banco
    Where NOME_BANCO = 'PRD70';

  select to_char(data_monitora, 'yyyy mm') DATA_MON, sum(ocupado_mb) ocupado_mb
   From oemuser.v_crescimento_banco
     Where NOME_BANCO = 'PRD70'
  group by to_char(data_monitora, 'yyyy mm')
 order by 1;

Select host_name, nome_banco, data_monitora, size_mb
From oemuser.v_crescimento_banco e
 Where e.DATA_MONITORA = (select min(i.data_monitora)  From oemuser.v_crescimento_banco i
                     where i.nome_banco=e.nome_banco)
 and (e.nome_banco like 'PRD%' or e.nome_banco like 'DBPD%' or e.nome_banco ='SAP2' or e.nome_banco ='METADM')
order by 2
/


-- local sediado o host
select host_name, local
from oemuser.host
where local not in ('LOJA','CIS');


--backup
select *
 from oemuser.V_ROTINA_BACKUP
  where NOME_BANCO = 'PRD68';

select host_name, nome_banco, modo_backup, tipo_backup, software_backup
 from oemuser.V_ROTINA_BACKUP
  where NOME_BANCO like '%ALT%'

--backup to A&E
Column HOST_NAME	format a9
Column NOME_BANCO	format a10
Column MODO_BACKUP	format a10
Column TIPO_BACKUP	format a15
Column DIAS_RETENCAO	format 999
Column FREQUENCIA	format a15
Column DIA_EXECUCAO	format a15
Column HORARIO		format a10

Select HOST_NAME, NOME_BANCO, MODO_BACKUP, TIPO_BACKUP, DIAS_RETENCAO, FREQUENCIA, HORARIO, DIA_EXECUCAO
		from oemuser.V_ROTINA_BACKUP
			where NOME_BANCO in ('DBPD004',
					  --  'PRD3',
					  --  'PRD89',
					  --  'DBPD005',
					  --  'PRD69',
					    'PRD5',
					    'PRD57',
					    'PRD67',
					    'PRD51',
					    'SOFTMED')
order by 1,2,4
/


--rollout backup
select nome_banco, software_backup, tipo_backup, count(*)
from oemuser.V_ROTINA_BACKUP
where MODO_BACKUP not in ('ARCHIVE', 'EXPORT')
group by  nome_banco, software_backup, tipo_backup;


--versao
select nome_banco, versao, HOST_NAME
 from  oemuser.V_BANCO_HOST
 where versao like '%10%';

--server
select  IDT_BANCO, NOME_BANCO, VERSAO, ARCHIVER, IDT_HOST, HOST_NAME, IP_HOST
from  oemuser.V_BANCO_HOST  Where nome_banco in ('PRD70'
,'PRD5'
,'PRD3'
,'PRD60'
,'PRD80'
,'PRD82'
,'PDR84'
,'PRD1'
,'PRD67'
,'PRD89'
,'PRD52'
,'PRD68')


-- SAP
select  IDT_BANCO, NOME_BANCO, VERSAO, ARCHIVER, IDT_HOST, HOST_NAME, IP_HOST
from  oemuser.V_BANCO_HOST  Where HOST_NAME in  (
			'CBDX38',
			'CBDX42',
			'CBDX49',
			'CBDX50',
			'CBDX54',
			'CBDX55');

-- Tecnologia e ambiente
select SGBD, ambiente, count(*)
from oemuser.V_BANCO_HOST
group by SGBD, ambiente


-- Relat BKPs
Select b.*, v.size_tbs_mb 
 From oemuser.V_ROTINA_BACKUP b, (select nome_banco, size_tbs_mb 
                                          from oemuser.v_crescimento_banco
							group by data_monitora, nome_banco, size_tbs_mb
							having data_monitora = max(data_monitora)) v
   where v.nome_banco = b.nome_banco
     and v.nome_banco = 'PRD70';



                                         3679   prd70 ==>  72,223 bancos ==> 228  em 31jan, 61

select
b.HOST_NAME
,b.NOME_BANCO
,b.MODO_BACKUP
,b.TIPO_BACKUP
,b.SOFTWARE_BACKUP
,b.DIAS_RETENCAO FREQUENCIA
,b.DIA_EXECUCAO
,b.HARDWARE
,v.DATA_MONITORA
,v.SIZE_BCO
 From oemuser.V_ROTINA_BACKUP b,
  (
  Select
     Host.Host_Name,
     Inst.Nome_Banco,
     Mt.Data_Monitora,
     Round(Sum(Mt.size_tbs_kb) / 1024) size_bco
    From
     oemuser.Monitora_Tablespace_HIST Mt,
     oemuser.Host,
     oemuser.Banco Inst,
     oemuser.Host_Banco Hi
    Where
     Hi.Idt_Host_Banco    = Mt.Idt_Host_Banco And
     Host.Idt_Host        = Hi.Idt_Host And
     Inst.Idt_Banco       = Hi.Idt_Banco
    Group By
      Host.Host_Name,
      Inst.Nome_Banco,
     Mt.Data_Monitora) v
	where b.host_name=v.host_name
 	  and b.nome_banco=v.nome_banco
 	  and b.MODO_BACKUP <> 'EXPORT'
order by 1,2,3,4,5,6,7,8,9;

-- inf. para licenciamento Oracle
 select nome_banco, ambiente, host_name,QTD_PROCESSADOR,core
  from oemuser.V_BANCO_HOST
  where SGBD = 'ORACLE' and AMBIENTE <> 'DESENVOLVIMENTO' and HOST_NAME not in ('CBDX57' ,'CBDX54' ,'CBDX55', 'CBDX56') -- SAP
  order by hardware, maquina;

-- inf. de LOGIN para AUDITORIA
column funcao format a50
column RESPONSAVEL format a30
select h.nome_banco, l.CONTA, l.FUNCAO, l.RESPONSAVEL
from  oemuser.LOGINS l, oemuser.V_BANCO_HOST h
    where l.IDT_HOST_BANCO = h.IDT_HOST_BANCO
      and (l.CONTA like '%SOFT%' 
           or l.IDT_HOST_BANCO like '%41%'
           or h.nome_banco in ('DBPD004',
					  --  'PRD3',
					  --  'PRD89',
					  --  'DBPD005',
					  --  'PRD69',
					    'PRD5',
					    'PRD57',
					    'PRD67',
					    'PRD51',
					    'SOFTMED'))
order by 1,2;




15:44:47 @prd99[ALLOWED=LC000780]>select view_name from dba_views where owner='OEMUSER';

VIEW_NAME
------------------------------
V_TBS_SUPER_DIMENSIONADA
V_ROTINA_BACKUP
V_LOGINS
V_BANCO_HOST
V_BANCO_SEM_BACKUP
V_RESTORE_BANCO
V_CRESCIMENTO_BANCO_CONS
V_LIVRE_FS_HOST_BANCO
V_CRESCIMENTO_SEIS_MESES
V_CRESCIMENTO_TABLE_SIGE
V_CRESCIMENTO_BANCO_ROLLUP
V_MONITORA_TABLE_SIGE
V_CRESCIMENTO_BANCO_TBS
V_SIZE_BANCO
V_CALCULO_VU_BANCO_BKP
V_CALCULO_VU
V_SS_JOBS_FALHARAM
V_CRESCIMENTO_BANCO
V_EXECUCAO_JOB
V_EXECUCAO_JOB2
V_VERSAO_LOJA
V_MAX_EXTENTS
TABLESPACE_SEM_AUTOEXTEND
V_QTDE_USUARIO_BANCO
V_SS_JOBS_ALTERADOS
V_SS_JOBS_ATIVO_INATIVOS
V_ROTINA_PRODUCAO_GADBD

===========================================
prompt
prompt  Ed CMDB_Queries          @ CMDB_Queries
prompt
