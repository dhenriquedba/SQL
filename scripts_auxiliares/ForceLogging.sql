set lines 100 feedback off
Column FORCE_LOGGING heading 'FORCE|LOGGING' format a7

select NAME, FORCE_LOGGING, LOG_MODE, CONTROLFILE_TYPE, VERSION_TIME,
OPEN_MODE, SWITCHOVER_STATUS
from  v$database
/
set feedback on
Prompt  
Prompt .                                                                  alter database no force logging;;
Prompt  
Prompt .                                                                   alter database  force logging;;
Prompt  
Prompt  
Prompt  Ed  ForceLogging		@ ForceLogging
Prompt  
