@login
prompt ==================================================================
prompt ================== C  U  I  D  A  D  O  !!! ======================
prompt ==================================================================
prompt ==== O present Script irá ELIMINAR INAPELAVELMENTE TODOS =========
prompt ==== os objetos do presente usuario  !!! !!! !!! !!! !!! =========
prompt ==================================================================
pause ==================================================================
prompt ==================================================================
prompt ==================================================================
prompt ====         TEM CERTEZA  ??? ??? ??? ??? ??? ???        =========
prompt ==================================================================
prompt ==================================================================
prompt ========== [Ctrl]+[C]=Cancelar    [Enter]=Continuar ==============
prompt ==================================================================
pause ==================================================================
prompt ==================================================================
prompt ==================================================================
prompt ====         ABSOLUTA ??? ??? ??? ??? ??? ??? ???        =========
prompt ==================================================================
prompt ==================================================================
prompt ========== [Ctrl]+[C]=Cancelar    [Enter]=Continuar ==============
prompt ==================================================================
pause ==================================================================
Set pause off lines 150 pages 0 feedback off
spool Drop__1.sql
select 'Drop '||Object_type||' '||Object_name||' cascade constraints;'
		from user_objects
			where object_type = 'TABLE'
/
spool off
spool Drop__1_tabelas.log
set echo on feedback on
@Drop__1.sql
spool off
set echo off  feedback off
spool Drop__1.sql
select 'Drop '||Object_type||' '||Object_name||';'
		from user_objects
			where object_type not in ('TABLE', 'PACKAGE BODY')
/
spool off
spool Drop__1_outros.log
set echo on  feedback on
@Drop__1.sql
spool off
set echo off
prompt
prompt  Ed Drop                @ Drop
prompt
prompt
