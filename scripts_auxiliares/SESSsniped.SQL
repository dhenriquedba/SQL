set verify off linesize 300 pagesize 500
column username				format a18
column sid				format 99999
column spid				format 99999
column serial#				format 999999
column machine				format a10
column program				format a31
column osuser				format a20
column status				format a15
column X 	heading 'Conectou em'	format a13
column status				format a15
--ACCEPT NOME PROMPT 'NOME [enter = todos!]: '
SELECT s.SID, s.SERIAL#, nvl(s.USERNAME,substr(s.PROGRAM,10)) username, p.spid, 
	s.program,
	-- s.CLIENT_INFO machine, -- 
--  s.server, 
--      s.osuser, 
	to_char(s.logon_time,'hh24:mi"em"DD-mon') X,
	 s.status
	FROM V$SESSION s, V$PROCESS p
		WHERE s.PADDR = p.ADDR
                  and s.status = 'SNIPED'
--		  and s.USERNAME LIKE UPPER('%nome%')
--		  and s.USERNAME is not null
--	Order by nvl(s.USERNAME,substr(s.PROGRAM,12)), s.status, s.osuser
	Order by s.osuser, s.logon_time, nvl(s.USERNAME,substr(s.PROGRAM,12)), s.status
--	Order by s.logon_time, nvl(s.USERNAME,substr(s.PROGRAM,12)), s.status
--	Order by p.spid
--	Order by s.sid
/
prompt ...                    Para Trace, use o comando abaixo:
prompt ...          exec sys.dbms_system.set_sql_trace_in_session(<SID>, <SERIAL#>, TRUE)
prompt ...          Que gerará no USER_DUMP_DEST o arquivo ora_<SPID>_<Instance>.trc
prompt  SELECT 'ALTER SYSTEM KILL SESSION '''||s.SID||', '||s.SERIAL#||''';' MATAR
prompt  	FROM V$SESSION s
prompt  WHERE  s.status = 'SNIPED'
prompt  	Order by s.SID;;
prompt ...
prompt ...    Para acompanhar a árvore de decisão do Optimizer
prompt ...          
prompt ...          alter session set events '10053 trace name context forever, level 10';;
prompt ...          
prompt ...          
prompt  
prompt ... ed SESSsniped.SQL  @SESSsniped.SQL  @ sess  @ lock  @ jobsrunning  @vcom  @ongoingplan  @killpaw08  @countpaw08  @sessprdx
prompt  					  @redo_activity
prompt  
