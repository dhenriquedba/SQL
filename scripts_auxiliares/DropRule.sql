set echo off feedback off pages 0
Prompt
Prompt  Este procedimento eliminará todas as tabelas RULE_MATCHER do Schema KDD_ALG
Prompt
Prompt
select 'Você está conectado como: '||user||'  No database: '||global_name from global_name;
Prompt
Pause
Prompt
Prompt Tem certeza que quer eliminar todas as tabelas RULE_MATCHER do Schema KDD_ALG?
Prompt
Pause
Prompt
Prompt MESMO ??? !!! ??? !!!
Prompt
Pause  [Enter] continua      ........         [Ctrl]+[C]  cancela

spool DropRule__1.sql
Select 'Drop table KDD_ALG.'||table_name||';'
    from dba_tables
           Where table_name like 'RULE%'
                 and table_name <> 'RULE_MATCHER_TEMP'
		 and owner = 'KDD_ALG'
/
spool off

Prompt
prompt última chance para arrependimento
Prompt
select 'Você está conectado como: '||user||'  No database: '||global_name from global_name;
set echo off feedback on pages 30
Prompt
prompt    execute:  @ DropRule__1.sql                 ed  DropRule__1.sql
Prompt
Prompt   Ed DropRule.sql		@ DropRule.sql
Prompt
Prompt

