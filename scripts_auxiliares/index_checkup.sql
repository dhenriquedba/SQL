prompt Fazer Rebuild do index quando :
prompt   - Houver 20% ou mais entradas deletadas
prompt   - O index tiver mais de 4 niveis.
prompt

set serveroutput on
set verify off
spool rebuild_index.sql
declare
 c_name        INTEGER;
 ignore        INTEGER;
 height        index_stats.height%TYPE := 0;
 lf_rows       index_stats.lf_rows%TYPE := 0;
 del_lf_rows   index_stats.del_lf_rows%TYPE := 0;
 distinct_keys index_stats.distinct_keys%TYPE := 0;
 cursor c_indx is
  select owner, table_name, index_name
  from dba_indexes  where owner = 'SISPRO';
--
--  where index_name in ('PK_FUNRES','IX_FUNCIONARIO_RESULTADO_1', 
--                       'IX_FUNCIONARIO_RESULTADO_2','IX_FUNCIONARIO_RESULTADO_3',
--                       'PK_RESULT','IX_RESULTADO_1');
begin
 dbms_output.enable (1000000);
 dbms_output.put_line ('Comandos de Rebuild dos indices ruins:');
 dbms_output.put_line ('-------------------------------------');

 c_name := DBMS_SQL.OPEN_CURSOR;
 for r_indx in c_indx loop
 begin 

  DBMS_SQL.PARSE(c_name,'analyze index ' || r_indx.owner || '.' || 
                 r_indx.index_name || ' validate structure',DBMS_SQL.NATIVE);
  ignore := DBMS_SQL.EXECUTE(c_name);

  select HEIGHT, decode (LF_ROWS,0,1,LF_ROWS), DEL_LF_ROWS, 
         decode (DISTINCT_KEYS,0,1,DISTINCT_KEYS) 
         into height, lf_rows, del_lf_rows, distinct_keys
  from index_stats;
--
-- O Index é considerado candidato a rebuild quando :
--   - Houver 20% ou mais entradas deletadas
--   - O index tiver mais de 4 niveis.
--
  if ( height > 5 ) OR ( (del_lf_rows/lf_rows) > 0.2 ) then
    dbms_output.put_line ('BAD INDEX: '||r_indx.owner||'.'||r_indx.index_name);
  end if;

  exception
    When Others Then
        null;
  end;

 end loop;
 DBMS_SQL.CLOSE_CURSOR(c_name);
end;
/
spool off
