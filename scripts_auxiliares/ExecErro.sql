set pages 0 feedback off
spool __ExecErro__.sql
select
 'exec dbms_defer_sys.execute_error(-'||chr(10)||
 '            destination=>'''||'SAPMTR.TJ.PA.GOV.BR'||''',-'||chr(10)||
 '       deferred_tran_id=>'''||DEFERRED_TRAN_ID||''')'||chr(10)||
 'Pause OK?'
 from deferror
-- where ERROR_MSG like 'ORA-02291%'
order by START_TIME
/
spool off
set pages 40 feedback on
@__ExecErro__.sql
commit;
@contaerro
Prompt
Prompt  Ed ExecErro         @ ExecErro
Prompt
