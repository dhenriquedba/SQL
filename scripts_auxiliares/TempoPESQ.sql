spool tempoPESQ.txt
column rotina format a15
column STEP  format 9999
column INICIO  format a15
column FIM  format a15
column m heading "TempoTotal(minutos)"  format 999,999
Prompt 
Prompt quando dá negativo, é porque acabou no dia seguinte. Não sei como resolver
Prompt 
set pages 180 echo on
desc oemuser.rotina_producao
desc oemuser.horario_execucao

select 	r1.NOME_ROTINA rotina, to_char(h1.DATA_HORA_INICIO,'dd-mm-yyyy=>hh24:mi:ss') "InicioMk01rd68",
	r2.NOME_ROTINA rotina, to_char(h2.DATA_HORA_FIM,'dd-mm-yyyy=>hh24:mi:ss') "FinalMk01rd92",
	round((h2.DATA_HORA_FIM-h1.DATA_HORA_INICIO)*24*60) m 
from 	oemuser.rotina_producao r1, oemuser.horario_execucao h1,
	oemuser.rotina_producao r2, oemuser.horario_execucao h2
where h1.COD_ROTINA = r1.COD_ROTINA
  and h2.COD_ROTINA = r2.COD_ROTINA
  and h1.IDT_HOST_BANCO = r1.IDT_HOST_BANCO
  and h2.IDT_HOST_BANCO = r2.IDT_HOST_BANCO
  and trunc(h1.DATA_HORA_INICIO) = trunc(h2.DATA_HORA_FIM)
  and r1.NOME_ROTINA = 'MK01RD68'
  and r2.NOME_ROTINA = 'MK01RD92' 
  and h1.COD_STEP = 1
  and h2.COD_STEP = 24
order by h1.DATA_HORA_INICIO
/
spool off
set feedback on echo off
prompt
prompt  Ed TempoPESQ.sql     @TempoPESQ.sql
prompt


