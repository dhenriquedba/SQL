REM  #*****************************************************
REM  #File Name: filestats.sql
REM  #
REM  #Purpose:   Report File Level Statistics
REM  #
REM  #*****************************************************

set pagesize 80
set line 132
clear breaks
clear computes

colum "FileSystem"      format A20
colum "Namefile"        format A50
colum "#"               format 999
colum "TS NAME"         format A20
colum "MB"              format 9,999,999,999
colum "RDS"             format 9,999,999,999
colum "WRTS"            format 9,999,999,999

break on report
compute sum of "MB"             on report
compute sum of "RDS"            on report
compute sum of "WRTS"           on report

select substr(a.name,1,10)              "FileSystem",
       sum(a.bytes/1024)                "MB",
       sum(b.phyrds)                    "RDS",
       sum(b.phywrts)                   "WRTS"
from v$datafile a,
     v$filestat b,
     dba_data_files df
where (a.file#=b.file#) AND
      (df.file_id=a.file#)
group by substr(a.name,1,10);