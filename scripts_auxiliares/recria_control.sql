set echo on
spool recctl.txt
STARTUP NOMOUNT
CREATE CONTROLFILE SET DATABASE "MESTRE" RESETLOGS ARCHIVELOG reuse
    MAXLOGFILES 50
    MAXLOGMEMBERS 5
    MAXDATAFILES 100
    MAXINSTANCES 1
    MAXLOGHISTORY 113
LOGFILE
  GROUP 1 'C:\ORACLE\ORADATA\MESTRE\REDO01.LOG'  SIZE 100M,
  GROUP 2 'C:\ORACLE\ORADATA\MESTRE\REDO02.LOG'  SIZE 100M,
  GROUP 3 'C:\ORACLE\ORADATA\MESTRE\REDO03.LOG'  SIZE 100M
DATAFILE
  'C:\ORACLE\ORADATA\MESTRE\SYSTEM01.DBF',
  'C:\ORACLE\ORADATA\MESTRE\UNDOTBS01.DBF',
  'C:\ORACLE\ORADATA\MESTRE\CWMLITE01.DBF',
  'C:\ORACLE\ORADATA\MESTRE\DRSYS01.DBF',
  'C:\ORACLE\ORADATA\MESTRE\EXAMPLE01.DBF',
  'C:\ORACLE\ORADATA\MESTRE\INDX01.DBF',
  'C:\ORACLE\ORADATA\MESTRE\TOOLS01.DBF',
  'C:\ORACLE\ORADATA\MESTRE\USERS01.DBF',
  'C:\ORACLE\ORADATA\MESTRE\OEM_REPOSITORY.DBF',
  'C:\ORACLE\ORADATA\MESTRE\TJPA01.DBF'
CHARACTER SET WE8ISO8859P15
/
ALTER DATABASE OPEN resetlogs
/
ALTER TABLESPACE TEMP ADD TEMPFILE 'C:\ORACLE\ORADATA\MESTRE\TEMP01.DBF' REUSE
/
shutdown immediate
spool off