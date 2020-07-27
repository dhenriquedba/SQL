conn business/business@amla
@login
set echo off feedback off pages 0
Prompt
Prompt  Este procedimento eliminará todas as linhas do Schema corrente <Desta vez BUSINESS - KDD*>
Prompt
Prompt
select 'Você está conectado como: '||user||'  No database: '||global_name from global_name;
Prompt
Pause
Prompt
Prompt Tem certeza que quer eliminar todas as linhas do Schema indicado acima? 
Prompt               <Desta vez BUSINESS - KDD*>
Pause
Prompt
Prompt MESMO ??? !!! ??? !!!       <Desta vez BUSINESS - KDD*>
Prompt
Pause  [Enter] continua      ........         [Ctrl]+[C]  cancela

spool Truncate__1.SQL
Select 'Truncate table '||table_name||';'
	from user_tables
	  Where table_name not like '%$%'
	    and table_name not like '%KDD%';
spool off

spool Truncate__1.Log
Prompt
prompt última chance para arrependimento  <Desta vez BUSINESS - KDD*>
Prompt
select 'Você está conectado como: '||user||'  No database: '||global_name from global_name;
Prompt                     <Desta vez BUSINESS - KDD*>
Pause  [Enter] continua      ........         [Ctrl]+[C]  cancela
@ Truncate__1.SQL
spool off

set echo off feedback on pages 30
Prompt
Prompt   Ed Truncate.SQL		@ Truncate.SQL
Prompt
Prompt
