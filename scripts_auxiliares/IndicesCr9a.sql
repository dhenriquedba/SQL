Spool IndicesCr9a.log
set echo on

alter system set QUERY_REWRITE_ENABLED=TRUE scope=memory;
alter system set QUERY_REWRITE_INTEGRITY = TRUSTED scope=memory;


create index -- OK
	criador.ix1_CTCBB
		on criador.GLM_CTA_CTBIL_CBK (
			CD_ORI_CTA_CTBIL, CD_CTA_CTBIL, TRUNC(DT_FIM_VLD));
Analyze table criador.GLM_CTA_CTBIL_CBK compute statistics;

create index --OK
	criador.IX3_OPER
		on criador.CMP_OPERACAO (
			AA, MM, CD_VERSAO_DADO, EMP_CD, CD_INTERFACE);
Analyze table criador.CMP_OPERACAO compute statistics;

create index -- OK
	criador.ix1_PRDUN 
		on criador.GLM_PRODUTO_UNID_NEGOCIO (
			NO_ANO_MES_BASE_INI, NO_ANO_MES_BASE_FIM, CD_PRODUTO, CD_EMP_CTBIL, CD_UNID_NEGOCIO, TS_ULT_ATU);
create index -- não
	criador.ix2_PRDUN
		on criador.GLM_PRODUTO_UNID_NEGOCIO (
			NO_ANO_MES_BASE_INI, NO_ANO_MES_BASE_FIM, CD_EMP_CTBIL, CD_PRODUTO);
Analyze table criador.GLM_PRODUTO_UNID_NEGOCIO compute statistics;

create index -- não
	criador.IX3_MVMPT
		on criador.DEB_MVTO_MENSAL_PRODUTO_TRANS (
			NO_ANO_MES_BASE);
Analyze table criador.DEB_MVTO_MENSAL_PRODUTO_TRANS compute statistics; 

create index -- não
	criador.IX2_PRTOR
		on criador.DEB_PRODUTO_TRANSACAO_ORIGEM (
			NO_ANO_MES_BASE);
Analyze table criador.DEB_PRODUTO_TRANSACAO_ORIGEM  compute statistics;

create index --  não
	criador.ix1_DEB_ALOCACAO_LD
		on criador.DEB_ALOCACAO_LD (
			SUBSTR(DS_LINHA, 1, 1) );
Analyze table criador.DEB_ALOCACAO_LD compute statistics;


create index --  não
	criador.IX3_CTBL
		on criador.DEB_CONTABIL (
			DS_LIN_EXP,	DS_GRP_EXP);
create index --  não
	criador.IX4_CTBL
		on criador.DEB_CONTABIL (
			DS_GRP_EXP);
Analyze table criador.DEB_CONTABIL compute statistics;

create index -- OK
	criador.IX2_DPREA
		on criador.DEB_DESPESA_REAL (
			TEMPO_AA_MM);
Analyze table criador.DEB_DESPESA_REAL compute statistics;

create index  --  não
	criador.IX5_ALOC 
		on criador.DEB_ALOCACAO (
			TEMPO_AA_MM);
Analyze table criador.DEB_ALOCACAO compute statistics;

create index -- OK
	criador.IX1_EMPCB
		on criador.GLM_EMPRESA_CONTABIL (
			CD_EMP_SIS_GL);
Analyze table criador.GLM_EMPRESA_CONTABIL compute statistics;

create index
	criador.IX3_FUNC -- não
		on criador.DEB_FUNCIONARIO (
			IC_EXPAT, CD_TIPO, AA_MM_BASE, CD_EMP_CTBIL);
create index
	criador.IX4_FUNC  - não
		on criador.DEB_FUNCIONARIO (
			IC_EXPAT, IC_PGTO_SUSPN, CD_TIPO, AA_MM_BASE, CD_EMP_CTBIL);
create index
	criador.IX5_FUNC -- OK
		on criador.DEB_FUNCIONARIO (
			AA_MM_BASE, CD_EMP_CTBIL);
Analyze table criador.DEB_FUNCIONARIO compute statistics;

create index  - não
	criador.IX6_CUSTTOT
		on criador.DEB_CENTRO_CUSTO_TOTAL (
			CD_EMP);	
create index  - não
	criador.IX7_CUSTTOT
		on criador.DEB_CENTRO_CUSTO_TOTAL (
			CD_EMP_SUP);
create index  - não
	criador.IX8_CUSTTOT
		on criador.DEB_CENTRO_CUSTO_TOTAL (
			CD_AG);
create index -- OK
	criador.IX9_CUSTTOT
		on criador.DEB_CENTRO_CUSTO_TOTAL (
			CD_AG_SUP);
create index -- OK
	criador.IX10_CUSTTOT
		on criador.DEB_CENTRO_CUSTO_TOTAL (
			CD_CUST_SUP);
create index -- OK
	criador.IX11_CUSTTOT
		on criador.DEB_CENTRO_CUSTO_TOTAL (
			CD_CUST_DEB);
Analyze table criador.DEB_CENTRO_CUSTO_TOTAL compute statistics;

spool off
set echo off
prompt
prompt   Ed IndicesCr9a.sql    Ed IndicesCr9a.log    @ IndicesCr9a.sql
prompt
