set feedback off  verify off  pause off echo off linesize 300  pagesize  80 term off

Column	Rollback		Heading	Rollback		Format a12
Column	x			Heading	'Qtd.|Exts.'	        Format 999,999
Column	initial_extent	        Heading	Inicial		        Format 999,999,999
Column	next_extent		Heading	Proximos		Format 999,999,999
Column	max_extent		Heading	Maximo   		Format 999,999,999
Column	tablespace_name	        Heading	Tablespace		Format a10
Column	y			Heading	'Arquivo'		Format a20
Column  w                       Heading 'Wait'                  Format 999,999,999
Column  g3                      Heading 'Get'                   Format 999,999,999
Break	on Rollback skip 0
compute sum of x on  rollback
Break	on Tablespace skip 1
Column A  heading 'Execu-|tions'                                                                            format 999,999,999
Column A1 heading 'Sharing Cursors (%)'                                                                     format 999.999 
Column A2 heading 'Packages/Views'                                                                          format 999,999,999,999
Column A3 heading 'SQL Statements'                                                                          format 999,999,999,999
Column A4 heading '250 Bytes * Open Cursors'                                                                format 999,999,999,999
Column A5 heading 'Total Session Memory (Kbytes)'                                                           format 999,999,999,999
Column A6 heading 'Total Max Memory (Kbytes)'                                                               format 999,999,999,999
Column A7 heading 'Number Of Waiters'                                                                       format 999,999,999,999
Column A8 heading 'Shared Pool Size'                                                                        format 999,999,999,999
Column A9 heading '% Sharable memory'                                                                       format 999.999
Column B  heading 'Misses During|Execution'                                                                 format 999,999,999
Column B1 heading 'DB Buffer Cache|Hit Ratio'                                                               format 999.999
Column B2 heading 'DICT Gets'                                                                               format 999,999,999,999
Column B3 heading 'Contention|% waits'                                                                      format 999.999
column B5 heading 'Rollback|Segment'                                                                        format a10
column B6 heading 'Bytes'                                                                                   format 999,999,999,999
column B7 heading 'Extents'                                                                                 format 99,999
Column C  heading 'Missing Rate (%)'                                                                        format 999.999
Column C2 heading 'Misses During|DICT Gets'                                                                 format 999,999
column C3 heading 'ReDo Log Buffer|Entries'                                                                 format 999,999,999
column C4 heading 'ReDo Log Buffer|Alocattion Retries'                                                      format 999,999,999
column C5 heading 'ReDo Log Buffer|Contention'                                                              format 999.999
Column D2 heading 'Missing|Rate (%)'                                                                        format 999.999
column D3 heading "idle time|for the dispatches processes|(handredths of seconds)"                          format 999,999,999
column D4 heading "busy time|for the dispatcher process|(handredths of seconds)"                            format 999,999,999
column E  heading "waiting time for all responses|that have ever been in the queue|(handredths of seconds)" format 999,999,999
column E1 heading "number of responses|that have ever|been in the queue"                                    format 999,999,999
column E2 heading "Protocol"                                                                                format A70
column E3 heading "Average Wait Time|per Response"                                                          format A25
column E4 heading "Total Busy|Rate %"                                                                       format 999.999
column F1 heading "Data File -> Tablespace"                                                                              format A34
column F2 heading "Physical Reads"                                                                          format 999,999,999
column F3 heading "Physical Writes"                                                                         format 999,999,999
column F4 heading "Time for Writes"                                                                         format 999,999,999
column F5 heading "Time for Reads"                                                                          format 999,999,999
column G  heading "Tipo de operação"                                                                        format A35
column G1 heading "SORTs-Quantidade de operações"                                                           format 999,999,999,999
column G2 heading "SORTs-Quantidade de linhas"                                                              format 999,999,999,999
column H  heading "Latch Name"                                                                              format A15
--spool QdAcTrNomeDate.sql
--Select 'Spool '||Global_name||'_'||To_Char(SysDate,'ddmmyyyy_hh24miss')||'.log' from global_name;
--Spool off
--
--@QdAcTrNomeDate.sql
set term on

--prompt =================================================================================================
--prompt ========== By Odecio Souza       -      m e n e t w o r k -                   dez.2002 ==========
--prompt =================================================================================================
--Select Instance_Name                                 "Oracle Instance Analizada",
--       to_char(sysdate,'dd-fmmonfm-yyyy=hh24:mi:ss') "Data Analise",
--       to_char(startup_time, 'dd-fmmonfm-yyyy=hh24:mi:ss') "Data do Starup",
--       trunc(sysdate-startup_time) "Dias da Instance no ar"
--From v$instance;
--prompt =================================================================================================
--prompt =================================================================================================
--prompt
prompt =================================================================================================
--prompt Rollback Segments Contetion {ideal}  cerca de 0.5 %
select N.name Rollback,
       R.waits w,
       R.gets  g3,
       R.waits/R.gets*100 B3,
       E.qtde x,
       E.Max  max_extent,
       E.Init initial_extent,
       E.Next next_extent
  from v$rollstat R,
       v$rollname N,
       (Select e.segment_name Rollback,
               count(*) qtde,
               r.initial_extent Init,
               r.next_extent Next,
               r.max_extents Max
          from dba_extents e,
	       dba_rollback_segs r
          where e.segment_name = r.segment_name 
	  Group by e.segment_name,
                   r.initial_extent,
                   r.next_extent,
		   r.max_extents
          Order by Rollback) E
  Where R.usn = N.usn
    and E.Rollback = n.name
--    and E.qtde > 2
--	AND E.ROLLBACK='RBS13'
order by x;
prompt =================================================================================================
--Select count(*) qtd_extents, sysdate agora
--          from dba_extents e,
--	       dba_rollback_segs r
--          where e.segment_name = r.segment_name 
--	group by sysdate
--/
prompt =================================================================================================


--host del /q QdAcTrNomeDate.sql

set feedback on
PROMPT 
PROMPT ED RBS  @RBS   @jobs
PROMPT 
