column "Quantidade de Ocorrências"  format 999,999,999,999,999,999,999
accept COLUNA 		prompt 'Coluna     : '
accept TABELA		prompt 'Tabela     : '
accept CONSTRAINT	prompt 'Constraint : '


select &COLUNA, count(*) "Quantidade de Ocorrências"
from &TABELA
where rowid in 
     (select row_id
        from exceptions
          where table_name = UPPER('&TABELA')
            AND CONSTRAINT = UPPER('&CONSTRAINT'))
group by &COLUNA;
PROMPT
PROMPT    ED PROCURA       @ PROCURA    ed FkColumns   @ FkColumns
PROMPT

