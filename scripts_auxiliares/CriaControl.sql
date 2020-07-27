Spool RecriaControlGMUD.log
set echo on
--conn ttcn212@amlp as sysdba
--STARTUP NOMOUNT
CREATE CONTROLFILE REUSE DATABASE "AML01ORA" noRESETLOGS FORCE LOGGING ARCHIVELOG
    MAXLOGFILES 32
    MAXLOGMEMBERS 4
    MAXDATAFILES 254
    MAXINSTANCES 1
    MAXLOGHISTORY 4310
LOGFILE
  GROUP 1 (
    '/oradata07/amla/redo01a.log',
    '/oradata12/amla/redo01b.log'
  ) SIZE 500M,
  GROUP 2 (
    '/oradata08/amla/redo02a.log',
    '/oradata13/amla/redo02b.log'
  ) SIZE 500M,
  GROUP 3 (
    '/oradata09/amla/redo03a.log',
    '/oradata14/amla/redo03b.log'
  ) SIZE 500M,
  GROUP 4 (
    '/oradata10/amla/redo04a.log',
    '/oradata15/amla/redo04b.log'
  ) SIZE 500M,
  GROUP 5 (
    '/oradata11/amla/redo05a.log',
    '/oradata16/amla/redo05b.log'
  ) SIZE 500M
-- STANDBY LOGFILE
DATAFILE
  '/oradata33/amla/system01.dbf',
  '/oradata47/amla/amldat12_01.dbf',
  '/oradata34/amla/users01.dbf',
  '/oradata33/amla/tools01.dbf',
  '/oradata47/amla/amldat12_22.dbf',
  '/oradata47/amla/amldat12_23.dbf',
  '/oradata33/amla/dba01.dbf',
  '/oradata37/amla/amldat12_24.dbf',
  '/oradata46/amla/amldat12_03.dbf',
  '/oradata56/amla/amldat12_19.dbf',
  '/oradata63/amla/amldat12_17.dbf',
  '/oradata63/amla/amldat12_18.dbf',
  '/oradata51/amla/amldat12_27.dbf',
  '/oradata42/amla/amldat12_02.dbf',
  '/oradata46/amla/amldat12_04.dbf',
  '/oradata46/amla/amldat12_05.dbf',
  '/oradata53/amla/amldat12_06.dbf',
  '/oradata54/amla/amldat12_09.dbf',
  '/oradata54/amla/amldat12_10.dbf',
  '/oradata58/amla/amldat12_11.dbf',
  '/oradata56/amla/amldat12_15.dbf',
  '/oradata63/amla/amldat12_16.dbf',
  '/oradata61/amla/amldat12_20.dbf',
  '/oradata54/amla/amldat12_21.dbf',
  '/oradata47/amla/amldat12_25.dbf',
  '/oradata49/amla/amldat12_26.dbf',
  '/oradata58/amla/amldat12_12.dbf',
  '/oradata58/amla/amldat12_14.dbf',
  '/oradata58/amla/amldat12_13.dbf',
  '/oradata53/amla/amldat12_08.dbf',
  '/oradata53/amla/amldat12_07.dbf',
  '/oradata42/amla/amldat17_01.dbf',
  '/oradata57/amla/amldat02_10.dbf',
  '/oradata61/amla/amldat03_10.dbf',
  '/oradata49/amla/amldat07_03.dbf',
  '/oradata58/amla/amldat07_04.dbf',
  '/oradata29/amla/undots01.dbf',
  '/oradata31/amla/undots03.dbf',
  '/oradata58/amla/amldat08_03.dbf',
  '/oradata58/amla/amldat09_03.dbf',
  '/oradata58/amla/amldat15_12.dbf',
  '/oradata54/amla/amldat05_05.dbf',
  '/oradata30/amla/undots02.dbf',
  '/oradata32/amla/undots04.dbf',
  '/oradata35/amla/tools04.dbf',
  '/oradata43/amla/amldat10_01.dbf',
  '/oradata43/amla/amldat10_02.dbf',
  '/oradata36/amla/amldat01_01.dbf',
  '/oradata36/amla/amldat01_02.dbf',
  '/oradata36/amla/amldat01_03.dbf',
  '/oradata36/amla/amldat01_04.dbf',
  '/oradata37/amla/amldat01_05.dbf',
  '/oradata37/amla/amldat01_06.dbf',
  '/oradata38/amla/amldat02_01.dbf',
  '/oradata38/amla/amldat02_02.dbf',
  '/oradata38/amla/amldat02_03.dbf',
  '/oradata38/amla/amldat02_04.dbf',
  '/oradata39/amla/amldat03_01.dbf',
  '/oradata39/amla/amldat03_02.dbf',
  '/oradata39/amla/amldat03_03.dbf',
  '/oradata40/amla/amldat04_01.dbf',
  '/oradata40/amla/amldat04_02.dbf',
  '/oradata41/amla/amldat05_01.dbf',
  '/oradata42/amla/amldat06_01.dbf',
  '/oradata43/amla/amldat07_01.dbf',
  '/oradata44/amla/amldat08_01.dbf',
  '/oradata45/amla/amldat09_01.dbf',
  '/oradata44/amla/amldat11_01.dbf',
  '/oradata45/amla/amldat11_02.dbf',
  '/oradata45/amla/amldat11_03.dbf',
  '/oradata40/amla/amldat11_04.dbf',
  '/oradata41/amla/amldat11_05.dbf',
  '/oradata37/amla/amldat13_01.dbf',
  '/oradata47/amla/amldat13_02.dbf',
  '/oradata47/amla/amldat14_01.dbf',
  '/oradata48/amla/amldat14_02.dbf',
  '/oradata48/amla/amldat15_01.dbf',
  '/oradata48/amla/amldat15_02.dbf',
  '/oradata48/amla/amldat16_01.dbf',
  '/oradata49/amla/amldat16_02.dbf',
  '/oradata49/amla/amldat17_01.dbf',
  '/oradata49/amla/amldat18_01.dbf',
  '/oradata50/amla/amldat18_02.dbf',
  '/oradata50/amla/amldat19_01.dbf',
  '/oradata50/amla/amldat19_02.dbf',
  '/oradata50/amla/amldat20_01.dbf',
  '/oradata51/amla/amldat20_02.dbf',
  '/oradata51/amla/amldat21_01.dbf',
  '/oradata51/amla/amldat21_02.dbf',
  '/oradata51/amla/amldat21_03.dbf',
  '/oradata44/amla/amldat10_03.dbf',
  '/oradata37/amla/amldat01_07.dbf',
  '/oradata46/amla/amldat02_05.dbf',
  '/oradata39/amla/amldat03_04.dbf',
  '/oradata40/amla/amldat04_03.dbf',
  '/oradata41/amla/amldat05_02.dbf',
  '/oradata42/amla/amldat06_02.dbf',
  '/oradata43/amla/amldat07_02.dbf',
  '/oradata44/amla/amldat08_02.dbf',
  '/oradata45/amla/amldat09_02.dbf',
  '/oradata41/amla/amldat11_06.dbf',
  '/oradata49/amla/amldat17_02.dbf',
  '/oradata52/amla/amldat10_04.dbf',
  '/oradata52/amla/amldat10_05.dbf',
  '/oradata52/amla/amldat10_06.dbf',
  '/oradata52/amla/amldat10_07.dbf',
  '/oradata33/amla/dba02.dbf',
  '/oradata33/amla/tools02.dbf',
  '/oradata54/amla/amldat10_08.dbf',
  '/oradata55/amla/amldat11_07.dbf',
  '/oradata55/amla/amldat11_08.dbf',
  '/oradata55/amla/amldat11_09.dbf',
  '/oradata55/amla/amldat11_10.dbf',
  '/oradata57/amla/amldat10_09.dbf',
  '/oradata57/amla/amldat10_10.dbf',
  '/oradata57/amla/amldat10_11.dbf',
  '/oradata57/amla/amldat10_12.dbf',
  '/oradata59/amla/amldat03_05.dbf',
  '/oradata59/amla/amldat03_06.dbf',
  '/oradata59/amla/amldat03_07.dbf',
  '/oradata59/amla/amldat03_08.dbf',
  '/oradata60/amla/amldat06_03.dbf',
  '/oradata60/amla/amldat06_04.dbf',
  '/oradata34/amla/tools03.dbf',
  '/oradata61/amla/amldat01_10.dbf',
  '/oradata61/amla/amldat01_11.dbf',
  '/oradata62/amla/amldat04_04.dbf',
  '/oradata62/amla/amldat04_05.dbf',
  '/oradata63/amla/amldat04_06.dbf',
  '/oradata64/amla/amldat03_09.dbf',
  '/oradata65/amla/amldat02_06.dbf',
  '/oradata65/amla/amldat02_07.dbf',
  '/oradata65/amla/amldat02_08.dbf',
  '/oradata65/amla/amldat02_09.dbf',
  '/oradata56/amla/amldat06_05.dbf',
  '/oradata64/amla/amldat06_06.dbf',
  '/oradata64/amla/amldat06_07.dbf',
  '/oradata64/amla/amldat06_08.dbf',
  '/oradata63/amla/amldat01_12.dbf',
  '/oradata60/amla/amldat01_13.dbf',
  '/oradata60/amla/amldat01_14.dbf',
  '/oradata61/amla/amldat01_15.dbf',
  '/oradata61/amla/amldat01_16.dbf',
  '/oradata62/amla/amldat04_07.dbf',
  '/oradata62/amla/amldat04_08.dbf',
  '/oradata65/amla/amldat04_09.dbf',
  '/oradata44/amla/amldat02_10.dbf',
  '/oradata45/amla/amldat02_11.dbf',
  '/oradata47/amla/amldat02_12.dbf',
  '/oradata56/amla/amldat02_13.dbf',
  '/oradata48/amla/amldat02_14.dbf',
  '/oradata41/amla/amldat05_03.dbf',
  '/oradata54/amla/amldat05_04.dbf',
  '/oradata48/amla/amldat15_03.dbf',
  '/oradata48/amla/amldat15_04.dbf',
  '/oradata49/amla/amldat15_05.dbf',
  '/oradata50/amla/amldat15_06.dbf',
  '/oradata50/amla/amldat15_07.dbf',
  '/oradata50/amla/amldat15_08.dbf',
  '/oradata51/amla/amldat15_09.dbf',
  '/oradata53/amla/amldat15_10.dbf',
  '/oradata53/amla/amldat15_11.dbf'
CHARACTER SET WE8ISO8859P1;


--ALTER DATABASE OPEN noRESETLOGS;
ALTER DATABASE OPEN;


Spool RecriaControlGMUD_B_.log
ALTER TABLESPACE TEMPORARY ADD TEMPFILE '/oradata28/amla/temporary10.dbf'
     SIZE 4980M REUSE AUTOEXTEND ON NEXT 104857600  MAXSIZE 5120M;
ALTER TABLESPACE TEMPORARY ADD TEMPFILE '/oradata27/amla/temporary09.dbf'
     SIZE 4980M REUSE AUTOEXTEND ON NEXT 104857600  MAXSIZE 5120M;
ALTER TABLESPACE TEMPORARY ADD TEMPFILE '/oradata26/amla/temporary08.dbf'
     SIZE 4781M REUSE AUTOEXTEND ON NEXT 104857600  MAXSIZE 5120M;
ALTER TABLESPACE TEMPORARY ADD TEMPFILE '/oradata25/amla/temporary07.dbf'
     SIZE 4183M REUSE AUTOEXTEND ON NEXT 104857600  MAXSIZE 5120M;
ALTER TABLESPACE TEMPORARY ADD TEMPFILE '/oradata24/amla/temporary06.dbf'
     SIZE 4383M REUSE AUTOEXTEND ON NEXT 104857600  MAXSIZE 5120M;
ALTER TABLESPACE TEMPORARY ADD TEMPFILE '/oradata23/amla/temporary05.dbf'
     SIZE 4980M REUSE AUTOEXTEND ON NEXT 104857600  MAXSIZE 5120M;
ALTER TABLESPACE TEMPORARY ADD TEMPFILE '/oradata22/amla/temporary04.dbf'
     SIZE 4980M REUSE AUTOEXTEND ON NEXT 104857600  MAXSIZE 5120M;
ALTER TABLESPACE TEMPORARY ADD TEMPFILE '/oradata21/amla/temporary03.dbf'
     SIZE 4980M REUSE AUTOEXTEND ON NEXT 104857600  MAXSIZE 5120M;
ALTER TABLESPACE TEMPORARY ADD TEMPFILE '/oradata20/amla/temporary02.dbf'
     SIZE 4980M REUSE AUTOEXTEND ON NEXT 104857600  MAXSIZE 5120M;
ALTER TABLESPACE TEMPORARY ADD TEMPFILE '/oradata19/amla/temporary01.dbf'
     SIZE 4980M REUSE AUTOEXTEND ON NEXT 104857600  MAXSIZE 5120M;

alter database rename global_name to aml01ora.amla.abn;
spool off
set echo off
