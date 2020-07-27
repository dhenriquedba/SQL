conn ttcn212@amla
@login
pause ok_?
Create user EquipeMantas identified by EquipeMantas
default tablespace users
/
Grant create session to EquipeMantas
/

conn BUSINESS/BUSINESS@amla
set echo off feedback off pages 0 linesize 150
spool __EquipeMantas1.sql
select 'grant select on '||object_name||' to equipemantas;'
from user_objects where object_type in ('TABLE', 'VIEW');
spool off
spool __EquipeMantas1.log
set echo on feedback on
@__EquipeMantas1.sql
spool off

conn KDD/KDD@amla
set echo off feedback off pages 0 linesize 150
spool __EquipeMantas2.sql
select 'grant select on '||object_name||' to equipemantas;'
from user_objects where object_type in ('TABLE', 'VIEW');
spool off
spool __EquipeMantas2.log
set echo on feedback on
@__EquipeMantas2.sql
spool off

conn KDD_ALG/KDD_ALG@amla
set echo off feedback off pages 0 linesize 150
spool __EquipeMantas3.sql
select 'grant select on '||object_name||' to equipemantas;'
from user_objects where object_type in ('TABLE', 'VIEW');
spool off
spool __EquipeMantas3.log
set echo on feedback on
@__EquipeMantas3.sql
spool off

conn KDD_MNR/KDD_MNR@amla
set echo off feedback off pages 0 linesize 150
spool __EquipeMantas4.sql
select 'grant select on '||object_name||' to equipemantas;'
from user_objects where object_type in ('TABLE', 'VIEW');
spool off
spool __EquipeMantas4.log
set echo on feedback on
@__EquipeMantas4.sql
spool off

conn MANTAS/MANTAS@amla
set echo off feedback off pages 0 linesize 150
spool __EquipeMantas5.sql
select 'grant select on '||object_name||' to equipemantas;'
from user_objects where object_type in ('TABLE', 'VIEW');
spool off
spool __EquipeMantas5.log
set echo on feedback on
@__EquipeMantas5.sql
spool off

conn MARKET/MARKET@amla
set echo off feedback off pages 0 linesize 150
spool __EquipeMantas6.sql
select 'grant select on '||object_name||' to equipemantas;'
from user_objects where object_type in ('TABLE', 'VIEW');
spool off
spool __EquipeMantas6.log
set echo on feedback on
@__EquipeMantas6.sql
spool off
set echo off

Prompt 
Prompt Ed EquipeMantas.sql			@EquipeMantas.sql
Prompt 

