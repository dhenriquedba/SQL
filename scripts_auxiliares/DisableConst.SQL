set echo off feedback off pages 0 linesize 150

spool DISABLEConst_1.SQL
Select 'Alter table "'||owner||'".'||table_name||' disable constraint '||constraint_name||';'
from all_constraints
where constraint_type in ('R') --,'U','C','P')
--and owner in ('MANTAS',
--              'BUSINESS',
--              'MARKET')
and status='ENABLED';

spool off

spool DISABLEConst_1.Log
@ DISABLEConst_1.SQL
spool off

set echo off feedback on pages 30
Prompt
Prompt   Ed DISABLEConst.SQL		@ DISABLEConst.SQL
Prompt
Prompt
