column rotina format a15
column STEP  format 9999
column INICIO  format a15
column FIM  format a15
column minutos  format 999,999
column media  format 999,999.9
column desvio  format 999,999.9
set pages 150
accept rotina prompt 'Nome da Rotina [default MK01RD29, aceita parcial]: ' default 'MK01RD29'
accept stepini prompt 'Nome da Rotina [default 1]: ' default 1
accept stepfim prompt 'Nome da Rotina [default 99]: ' default 99



select r.NOME_ROTINA rotina, h.COD_STEP step, 
       to_char(h.DATA_HORA_INICIO,'dd-mm=>hh24:mi:ss') Inicio, 
       to_char(h.DATA_HORA_FIM,'dd-mm=>hh24:mi:ss')    fim,
      (h.DATA_HORA_FIM-h.DATA_HORA_INICIO)*24*60 minutos 
from oemuser.rotina_producao r, oemuser.horario_execucao h
where h.COD_ROTINA = r.COD_ROTINA
  and h.IDT_HOST_BANCO = r.IDT_HOST_BANCO
  and r.NOME_ROTINA like upper('%&rotina%')
  and h.COD_STEP between &stepini and &stepfim
order by h.DATA_HORA_INICIO
/
set feedback off
select r.NOME_ROTINA rotina, h.COD_STEP step,
	avg((h.DATA_HORA_FIM-h.DATA_HORA_INICIO)*24*60) media,
	stddev((h.DATA_HORA_FIM-h.DATA_HORA_INICIO)*24*60) desvio
from oemuser.rotina_producao r, oemuser.horario_execucao h
where h.COD_ROTINA = r.COD_ROTINA
  and h.IDT_HOST_BANCO = r.IDT_HOST_BANCO
  and r.NOME_ROTINA like upper('%&rotina%')
  and h.COD_STEP between &stepini and &stepfim
  group by r.NOME_ROTINA, h.COD_STEP
 order by r.NOME_ROTINA, h.COD_STEP
/
set feedback on
prompt
prompt  Ed TemposMK.sql     @TemposMK.sql
prompt
