column F1 heading "Data File -> Tablespace"     format A30
column F21 heading "Physical Reads|Quantity"    format 999,999,999
column F31 heading "Physical Writes|Quantity"   format 999,999,999
column F22 heading "Physical Reads|Blocks"      format 999,999,999
column F32 heading "Physical Writes|Blocks"     format 999,999,999
column F4 heading "Time for Writes"             format 999,999,999
column F5 heading "Time for Reads"              format 999,999,999
set lines 300

prompt
prompt =================================================================================================
prompt Carga em Datafiles
select substr(T.FILE_NAME,instr(T.FILE_NAME,'\',-1)+1)||'->'||T.TABLESPACE_NAME F1,
       sum(F.PHYRDS)                                                           F21,
       sum(F.PHYWRTS)                                                          F31,
       sum(PHYBLKRD)                                                           F22,
       sum(PHYBLKWRT)                                                          F32,
       sum(F.READTIM)                                                          F5,
       sum(F.WRITETIM)                                                         F4
 from  v$filestat F, dba_data_files T
 where F.file# = T.file_id
 group by substr(T.FILE_NAME,instr(T.FILE_NAME,'\',-1)+1)||'->'||T.TABLESPACE_NAME
order by 2 desc;
prompt =================================================================================================
