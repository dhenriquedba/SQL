column segment_name format a30
set echo on
select owner, segment_name, segment_type, tablespace_name
from dba_segments
where tablespace_name in (select tablespace_name from dba_data_files
                                where file_name like '%D%')
union
select owner, segment_name, segment_type, tablespace_name
from dba_segments
where tablespace_name in (select tablespace_name from dba_data_files
                                where file_name like '%lixo%')
union
select owner, segment_name, segment_type, tablespace_name
from dba_segments
where tablespace_name = 'USERS'
  and owner = 'CRIADOR'
/

set echo off
prompt
prompt  Observar em $ORACLE_HOME/dbs a existência de arquivos "estranhos"
prompt  A  limpeza  deve  ser  feita  logo  pois  /u01  está  "100% used"
prompt