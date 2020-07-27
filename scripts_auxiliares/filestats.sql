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

colum "FileSystem"      format A10
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

select substr(a.file#,1,3)              "#",
       substr(a.name,1,10)              "FileSystem",
       substr(a.name,11,60)             "Namefile",
       substr(df.tablespace_name,1,23)  "TS NAME",
       a.bytes/1024                     "MB",
       b.phyrds                         "RDS",
       b.phywrts                        "WRTS"
from v$datafile a,
     v$filestat b,
     dba_data_files df
where (a.file#=b.file#) AND
      (df.file_id=a.file#)
order by substr(a.name,1,10), substr(df.tablespace_name,1,23);