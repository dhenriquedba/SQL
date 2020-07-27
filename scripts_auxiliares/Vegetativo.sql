set lines 300 pages 700

Column OCUPADO_MB	format 999999999
Column LOCAL		format a5
Column HOST_NAME		format a10
Column NOME_BANCO		format a10                             
Column DATA_MONITORA		format a10             

alter session set nls_language=portuguese;
alter session set nls_date_format='ddmonyy';

--Select h.local, c.host_name, c.nome_banco, c.data_monitora, c.ocupado_mb
Select h.local||'#'||c.host_name||'#'||c.nome_banco||'#'||c.data_monitora||'#'||c.ocupado_mb
from oemuser.v_crescimento_banco c, oemuser.host h
where h.host_name = c.host_name
  and h.local <> 'LOJA'
  and c.data_monitora in ('31dez07','31dez08','31dez09','31ago10','30set10')
order by h.local, c.host_name, c.nome_banco, c.data_monitora
/


Prompt 
Prompt     Ed Vegetativo     @Vegetativo
Prompt 
