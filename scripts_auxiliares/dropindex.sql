set echo off feedback off pages 0
Prompt
Prompt  Este procedimento eliminará todos os indices dos Schemas
Prompt
Prompt                      .BUSINESS
--Prompt                      .MANTAS
--Prompt                      .KDD
--Prompt                      .KDD_ALG
--Prompt                      .KDD_MNR
--Prompt                      .MARKET
Prompt
Pause
Prompt
Prompt Tem certeza que quer eliminar todos os indices dos Schemas indicados acima?
Prompt
Pause
Prompt
Prompt MESMO ??? !!! ??? !!!
Prompt
Pause  [Enter] continua      ........         [Ctrl]+[C]  cancela

spool dropindex__1.sql
Select 'Drop Index '||owner||'.'||index_name||';'
	from dba_indexes
	  Where owner in ('BUSINESS')
--			, 'MANTAS'
--			, 'KDD'
--			, 'KDD_ALG'
--			, 'KDD_MNR'
--			, 'MARKET')
/
spool off

spool dropindex__1.Log
Prompt
prompt última chance para arrependimento
Prompt
Pause  [Enter] continua      ........         [Ctrl]+[C]  cancela
@ dropindex__1.sql
spool off

set echo off feedback on pages 30
Prompt
Prompt   Ed dropindex		@ dropindex
Prompt
Prompt
