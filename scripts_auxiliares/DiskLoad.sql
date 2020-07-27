set feedback off  verify off  pause off echo off linesize 200  pagesize  80 term off

Column	Rollback		Heading	Rollback		Format a8
Column	x			Heading	'Qtd.|Exts.'	        Format 009
Column	initial_extent	        Heading	Inicial		        Format 999,999,999
Column	next_extent		Heading	Proximos		Format 999,999,999
Column	max_extent		Heading	Maximo   		Format 999,999,999
Column	tablespace_name	        Heading	Tablespace		Format a10
Column	y			Heading	'Arquivo'		Format a20
Column  w                       Heading 'Wait'                  Format 999,999,999
Column  g3                      Heading 'Get'                   Format 999,999,999
Break	on Rollback skip 1
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
column F1 heading "Data File -> Tablespace"                                                                              format A45
column F21 heading "Physical Reads|Quantity"                                                                          format 999,999,999
column F31 heading "Physical Writes|Quantity"                                                                         format 999,999,999
column F22 heading "Physical Reads|Blocks"                                                                          format 999,999,999
column F32 heading "Physical Writes|Blocks"                                                                         format 999,999,999
column F33 heading "Average time|spent on I/O|(in hundredths of a second)"                  format 99,999.999
column F4 heading "Time for Writes"                                                                         format 999,999,999
column F5 heading "Time for Reads"                                                                          format 999,999,999
column G  heading "Tipo de operação"                                                                        format A35
column G1 heading "SORTs-Quantidade de opera‡äes"                                                           format 999,999,999,999
column G2 heading "SORTs-Quantidade de linhas"                                                              format 999,999,999,999
column H  heading "Latch Name"                                                                              format A15


spool QdAcTrNomeDate.sql
Select 'Spool '||substr(Global_name,9,4)||'_Diag_'||To_Char(SysDate,'ddmonyyyy_hh24miss')||'.DOC' from global_name;
Spool off
@QdAcTrNomeDate.sql
host del /q QdAcTrNomeDate.sql
set term on

prompt =================================================================================================
prompt ========== By Odecio Souza + Juliano Bomfim + Mario Diaz - menetwork - rev. set.2002 ============
prompt =================================================================================================
Select Instance_Name                                 "Oracle Instance Analizada",
       to_char(sysdate,'dd-fmmonfm-yyyy=hh24:mi:ss') "Data Analise",
       to_char(startup_time, 'dd-fmmonfm-yyyy=hh24:mi:ss') "Data do Starup",
       trunc(sysdate-startup_time) "Dias da Instance no ar"
From v$instance;

prompt =================================================================================================
prompt =================================================================================================
prompt
prompt =================================================================================================
prompt Carga em Datafiles
select substr(T.FILE_NAME,instr(T.FILE_NAME,'/',-1)+1)||'->'||T.TABLESPACE_NAME F1,
       sum(F.PHYRDS)                                                           F21,
       sum(F.PHYWRTS)                                                          F31,
	   sum(  AVGIOTIM )                                                                 F33
--       sum(PHYBLKRD)                                                           F22,
--       sum(PHYBLKWRT)                                                          F32,
--       sum(F.READTIM)                                                          F5,
--      sum(F.WRITETIM)                                                         F4
 from  v$filestat F, dba_data_files T
 where F.file# = T.file_id
 group by substr(T.FILE_NAME,instr(T.FILE_NAME,'/',-1)+1)||'->'||T.TABLESPACE_NAME, AVGIOTIM
--
-- otrecho abaixo ‚ absurdo !!!!!!! a V$filestat nÆo da conta de tempfiles!
--
--UNION
--select '----->Tempor ria'   F1,
--       sum(F.PHYRDS)                                                           F21,
--       sum(F.PHYWRTS)                                                          F31,
--       sum(PHYBLKRD)                                                           F22,
--       sum(PHYBLKWRT)                                                          F32,
--       sum(F.READTIM)                                                          F5,
--       sum(F.WRITETIM)                                                         F4
-- from  v$filestat F
--   where F.file#=
 order by 1;
prompt =================================================================================================
prompt Datafiles com Incrementos fora do Ideal
prompt e das Tablespaces com mais de 80% de utilizacao

Column	Tablespace_name		Heading	Tablespace		Format a20
Column  Tamanho                 Heading 'Tamanho|Tablespace'    Format 99,999
Column  Utilizado               Heading '% Utilizado'           Format 999.99
Column  Inc_atual               Heading 'Incremneto|Atual'      Format 9,999
Column  Inc_ideal               Heading 'Incremento|Ideal'      Format 9,999
Column  Tam_arquivo             Heading 'Tamanho|Arquivo'       Format 9,999
Column  Arquivo                 Heading 'Arquivo'               Format a30

Break on tablespace_name on tamanho on utilizado skip 1

select e.TABLESPACE_NAME,
       e.tam_tbs tamanho,
       e.prc_utilizado utilizado,
       e.inc_atual,
       decode(greatest((e.maximo-e.tam_data-e.inc_ideal),0),
                                                           0,
                                      (e.maximo-e.tam_data),
                                                 e.inc_ideal)   inc_ideal,
       e.tam_data             tam_arquivo,
       e.arquivo
  from (select c.TABLESPACE_NAME,
               decode(b.usado, null, 0.008, b.usado) tbs_USADO,
               a.reservado tam_tbs,
               decode(b.usado, null, 0.008, b.usado)/a.reservado*100 PRC_UTILIZADO,
               (c.bytes/(1024*1024))                                 tam_data,
               c.increment_by*d.value/(1024*1024)                    inc_atual,
               decode(trunc(a.reservado/30)*10,a.reservado/3,a.reservado/3,(trunc(a.reservado/30)*10)+10) inc_ideal,
               c.maxbytes/(1024*1024) maximo,
               substr(c.FILE_NAME,instr(c.FILE_NAME,'\',-1)+1) ARQUIVO
          from (select distinct TABLESPACE_NAME, sum(BYTES/(1024*1024)) reservado
                  from sys.dba_data_files
                  group by TABLESPACE_NAME) a,
               (select distinct TABLESPACE_NAME, sum(BYTES/(1024*1024)) usado
                  from sys.dba_segments
                  group by TABLESPACE_NAME) b,
               dba_data_files c,
               (select value from v$parameter where name = 'db_block_size')  d
         where a.TABLESPACE_NAME = b.TABLESPACE_NAME(+)
           and c.TABLESPACE_NAME = a.TABLESPACE_NAME
           and c.AUTOEXTENSIBLE = 'YES') e
where e.prc_utilizado > 80
  and e.inc_atual <> decode(greatest((e.maximo-e.tam_data-e.inc_ideal),0),
                                                                        0,
                                                    (e.maximo-e.tam_data),
                                                              e.inc_ideal);
prompt
prompt =================================================================================================
prompt Tablespaces com utiliza‡Æo fora do intervalo 60%<= intervalo <= 80%
Column	Tablespace_name		Heading	Tablespace		Format a20
Column  Usado                   Heading 'Tamanho|Utilizado'     Format 99,999
Column  Reservado               Heading 'Tamanho|Reservado'     Format 99,999
Column  Pct_usado               Heading '%|Utilizado'           Format 999.99
Break on tablespace_name
select a.TABLESPACE_NAME,
       decode(b.usado, null, 0.008, b.usado) USADO,
       a.reservado,
       decode(b.usado, null, 0.008, b.usado)/a.reservado*100 Pct_usado
  from (select distinct TABLESPACE_NAME, sum(BYTES/(1024*1024)) reservado
          from sys.dba_data_files
          group by TABLESPACE_NAME) a,
       (select distinct TABLESPACE_NAME, sum(BYTES/(1024*1024)) usado
          from sys.dba_segments
          group by TABLESPACE_NAME) b
  where a.TABLESPACE_NAME = b.TABLESPACE_NAME(+)
    and ((decode(b.usado, null, 0.008, b.usado)/a.reservado)*100>80
          or
         (decode(b.usado, null, 0.008, b.usado)/a.reservado)*100<60)
  order by Pct_usado;
prompt
prompt =================================================================================================
set head off
prompt Tamanho/hora ideal dos RedoLog Files (£ltimos 31 dias)
prompt ------------------------------------------------------;
select decode(trunc(d.tamanho/(1024*1024)), 0, trunc(d.tamanho/(1024)), trunc(d.tamanho/(1024*1024))) tamanho,
       decode(trunc(d.tamanho/(1024*1024)), 0, 'Kb', 'Mb')
from (select round(avg((a.tamanho)/((b.tempo-a.tempo)*24))) tamanho
       from (select distinct
                    trunc(next_time) dia,
                    min(next_time) tempo,
                    (sum(blocks*block_size)) tamanho
              from v$archived_log
              where trunc(next_time) between trunc(sysdate-31) AND trunc(sysdate-1)
              group by trunc(next_time)) a,
            (select distinct
                    trunc(next_time) dia,
                    min(next_time) tempo,
                    (sum(blocks*block_size)) tamanho
              from v$archived_log
              where trunc(next_time) between trunc(sysdate-31) AND trunc(sysdate-1)
              group by trunc(next_time)) b
       where b.dia = (select trunc(min(c.next_time))
                       from v$archived_log c
                       where trunc(c.next_time) > trunc(a.dia))) d;
prompt
prompt Tamanho/hora ideal dos RedoLog Files (No Mˆs corrente)
prompt ------------------------------------------------------; 
select decode(trunc(d.tamanho/(1024*1024)), 0, trunc(d.tamanho/(1024)), trunc(d.tamanho/(1024*1024))) tamanho,
       decode(trunc(d.tamanho/(1024*1024)), 0, 'Kb', 'Mb')
from (select round(avg((a.tamanho)/((b.tempo-a.tempo)*24))) tamanho
       from (select distinct
                    trunc(next_time) dia,
                    min(next_time) tempo,
                    (sum(blocks*block_size)) tamanho
              from v$archived_log
              where trunc(next_time) between trunc(sysdate-31) AND trunc(sysdate-1)
              group by trunc(next_time)) a,
            (select distinct
                    trunc(next_time) dia,
                    min(next_time) tempo,
                    (sum(blocks*block_size)) tamanho
              from v$archived_log
              where trunc(next_time) between trunc(sysdate-31) AND trunc(sysdate-1)
              group by trunc(next_time)) b
       where b.dia = (select trunc(min(c.next_time))
                       from v$archived_log c
                       where trunc(c.next_time) > trunc(a.dia))
         and to_char(a.dia,'yyyy-mm') = to_char(sysdate-1,'yyyy-mm')) d;
set head on
prompt
prompt
prompt Tempo M¡nimo de Switch do RedoLog Files (No Mˆs corrente) 
prompt
select d.sequence#-1                               Sequencia,
       trunc(c.min)                                dias,
       trunc(c.min*24)-trunc(c.min)*24             horas,
       trunc(c.min*24*60)-trunc(c.min*24)*60       min,
       trunc(c.min*24*60*60)-trunc(c.min*24*60)*60 seg
  from (select sequence#, first_time
          from v$log_history
         where to_char(first_time, 'yyyy-mm') >= to_char(sysdate-31,'yyyy-mm')) e,
       (select sequence#, first_time
          from v$log_history
         where to_char(first_time, 'yyyy-mm') = to_char(sysdate-1,'yyyy-mm')) d,
       (select min((b.first_time-a.first_time)) min
          from (select sequence#, first_time
                  from v$log_history
                 where to_char(first_time, 'yyyy-mm') >= to_char(sysdate-31,'yyyy-mm')) a,
               (select sequence#, first_time
                  from v$log_history
                 where to_char(first_time, 'yyyy-mm') = to_char(sysdate-1,'yyyy-mm')) b
         where a.sequence# = b.sequence#-1) c
 where (d.first_time-e.first_time) = c.min;
prompt
prompt
prompt =================================================================================================
prompt ==============================================   End of Report   ================================
prompt =================================================================================================
spool off
prompt 
prompt Ed	DiskLoad.sql			@DiskLoad.sql
prompt 
set feedback on
