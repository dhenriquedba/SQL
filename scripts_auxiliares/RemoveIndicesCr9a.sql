Spool IndicesCr9a.log
set echo on

drop index criador.ix2_PRDUN;
Analyze table criador.GLM_PRODUTO_UNID_NEGOCIO compute statistics;

drop index criador.IX3_MVMPT;
Analyze table criador.DEB_MVTO_MENSAL_PRODUTO_TRANS compute statistics; 

drop index criador.IX2_PRTOR;
Analyze table criador.DEB_PRODUTO_TRANSACAO_ORIGEM  compute statistics;

drop index criador.ix1_DEB_ALOCACAO_LD;
Analyze table criador.DEB_ALOCACAO_LD compute statistics;

drop index criador.IX3_CTBL;
drop index criador.IX4_CTBL;
Analyze table criador.DEB_CONTABIL compute statistics;

drop index criador.IX5_ALOC ;
Analyze table criador.DEB_ALOCACAO compute statistics;

drop index criador.IX3_FUNC;
drop index criador.IX4_FUNC;
Analyze table criador.DEB_FUNCIONARIO compute statistics;

drop index criador.IX6_CUSTTOT;
drop index criador.IX7_CUSTTOT;
drop index criador.IX8_CUSTTOT;
Analyze table criador.DEB_CENTRO_CUSTO_TOTAL compute statistics;

spool off
set echo off
prompt
prompt   Ed IndicesCr9a.sql    Ed IndicesCr9a.log    @ IndicesCr9a.sql
prompt
