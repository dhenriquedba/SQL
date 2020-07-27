REM ** 
Prompt 
Prompt Março 2004 - Patrícia Leite / Odécio Souza - Todos os direitos reservados ©
Prompt 
REM **
set verify off linesize 300 pagesize 500 feedback on
column username				format a18
column sid					format 999
column serial#				format 999,999
column machine				format a21
column osuser				format a16
column status				format a15
column X 	heading 'Execute o comando abaixo !!! Para ativar o trace.'	format a80
column y 	heading 'Conectou em'	format a16
column z 	heading 'Execute o comando abaixo !!! Para desativar o trace.'	format a80
column status				format a8
accept OSUSER prompt 'Informe o OSUSER (é Case-Sensitive!): '
--ACCEPT NOME PROMPT 'NOME [enter = todos!]: '
spool trace_01.sql
select 'exec sys.dbms_system.set_sql_trace_in_session('||s.SID||', '||s.SERIAL#||', true)' X
	FROM V$SESSION s, V$PROCESS p
		WHERE s.PADDR = p.ADDR
--		  and s.osuser = 'ct01717'
--		  and s.osuser = '&OSUSER'
--		  and s.USERNAME LIKE UPPER('%nome%')
--		  and s.USERNAME LIKE UPPER('PERFORMANCE_MART')
--		and s.MACHINE like '%CPFL\CABREU-SP%'
order by to_char(s.logon_time,'hh24:mi"em"DDmonyyyy') 
/
spool off

Prompt 'No (USER_DUMP_DEST) será gerado um Trace com o nome do SPID'
Select value USER_DUMP_DEST
	from v$parameter
		where name = 'user_dump_dest'
/
SELECT s.SID, s.SERIAL#, nvl(s.USERNAME,substr(s.PROGRAM,12)) username, p.spid, s.machine, s.server,
	 s.osuser, to_char(s.logon_time,'hh24:mi"em"DDmonyyyy') y,
	 s.status									---, s.program
	FROM V$SESSION s, V$PROCESS p
		WHERE s.PADDR = p.ADDR
--		  and s.osuser = 'ct01717'
--		  and s.osuser = '&OSUSER'
--		  and s.USERNAME LIKE UPPER('%nome%')
--		  and s.USERNAME LIKE UPPER('PERFORMANCE_MART')
--		and s.MACHINE like '%CPFL\CABREU-SP%'
order by to_char(s.logon_time,'hh24:mi"em"DDmonyyyy') 
/
select 'exec sys.dbms_system.set_sql_trace_in_session('||s.SID||', '||s.SERIAL#||', false)' z
	FROM V$SESSION s, V$PROCESS p
		WHERE s.PADDR = p.ADDR
--		  and s.osuser = 'ct01717'
--		  and s.osuser = '&OSUSER'
--		  and s.USERNAME LIKE UPPER('%nome%')
--		  and s.USERNAME LIKE UPPER('PERFORMANCE_MART')
--		and s.MACHINE like '%CPFL\CABREU-SP%'
order by to_char(s.logon_time,'hh24:mi"em"DDmonyyyy') 
/
prompt  
prompt ...     ed Trace  @Trace  @ sess    @ Lock     @ jobsrunning     @VCOM
prompt  
set feedback on
