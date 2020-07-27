column INITIALEXTENT  format 999,999,999,999 HEADING 'INITIALEXTENT |K bytes'
column NEXTEXTENT     format 999,999,999,999 HEADING 'NEXTEXTENT |K bytes'
column LINHAS         format 99,999,999
column BYTESPORLINHA  format 99,999,999
column x  Heading "Total GigaBytes"           format 999,999,999,999,999
column datatbs format a8
column tabelas format 99,999
set numwidth 15 LINES 200

SELECT TABELA, LINHAS, BYTESPORLINHA, INITIALEXTENT/1024 INITIALEXTENT, NEXTEXTENT/1024 NEXTEXTENT
FROM sys.ESTRUTFISICA
WHERE Tabela like upper('%&Parte_Nome_Tabela%')
/
Prompt   exec CalcEstrutFisica(Dono=>'CES612')
Prompt
Prompt    Ed EstFisSel.sql                  @ EstFisSel
Prompt
Prompt
