set echo on feedback off pages 0
/*
select count(*)  from   psapindiciado;
select count(*)  from   psapmovimentoindiciado;
select count(*)  from   PSAPCONSULTANOMEINDICIADO;
select count(*)  from   psapvara;
select count(*)  from  psapprocessoarma;

spool conta.txt

select count(*)  from    psapProcessoMovimento;
select count(*)  from   PSAPPESSOA;
select count(*)  from   PSAPCONSULTANOMEPESSOA;
select count(*)  from    psapProcessoValorAcao;
select count(*)  from    psapProcessoApensamento;
select count(*)  from    psapProcessoDistribuicao;
select count(*)  from    psapProtocolo;
select count(*)  from    psapProcessoParte;
select count(*)  from    psapMandadoMovimento;
select count(*)  from    psapProtocoloParte;
select count(*)  from    psapProcesso;
select count(*)  from    psapTpMvProcesso;
select count(*)  from    psapProtocoloVersao;
select count(*)  from    psapTramitacaoExterna;
select count(*)  from    psapTramitacaoInterna;
select count(*)  from    psapMandado;
*/

spool conta.txt
 select count(*)   from  psapAgente; 
 select count(*)   from  psapAgenteLotacao; 
 select count(*)   from  psapAgentePeso; 
 select count(*)   from  psapAgentePlantao; 
 select count(*)   from  psapAudiencia_tmp; 
 select count(*)   from  psapCartorio; 
 select count(*)   from  psapCartorioAreaJudicial; 
 select count(*)   from  psapCartorioCompetencia; 
 select count(*)   from  psapClasse; 
 select count(*)   from  psapExpedienteModelo; 
 select count(*)   from  psapJuiz; 
 select count(*)   from  psapJuizLotacao; 
 select count(*)   from  psapJuizPeso; 
 select count(*)   from  psapNumeracaoProtocolos ;
 select count(*)   from  psapOrigemDestino ;
 select count(*)   from  psapOrigemDestinoAreaJud ;
 select count(*)   from  psapProcessoAgentes ;
 select count(*)   from  psapTpMvProcesso ;
 select count(*)   from  psapTpMvTramExt ;
 select count(*)   from  psapTpMvTramInt  ;
 select count(*)   from  psapTpMvTramExtAreaJud ;
 select count(*)   from  psapTpMvTramIntAreaJud ;
 select count(*)   from  psapVara ;
 select count(*)   from  psapVaraCompetencia ;

spool off
set echo off feedback on pages 40
