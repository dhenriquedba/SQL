accept ScriptRelat prompt 'Script de Relatório: '
--accept SenhaSYS    prompt 'Senha  do System   : ' hide
Spool &ScriptRelat..doc
--conn system/&SenhaSYS@cesdev
@&ScriptRelat
--conn system/&SenhaSYS@cestest
--@&ScriptRelat
--conn system/&SenhaSYS@citrix
--@&ScriptRelat
spool off
disconn
prompt
prompt  Ed ChamaRelat        @ ChamaRelat
prompt
