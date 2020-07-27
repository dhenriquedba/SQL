Spool DataBaseAccessReport-Agosto2010-GPA.TXT
set echo off feedback off time off timing off
SET SQLPROMPT 'SQL>'
Prompt
Prompt ====================================================================
Prompt =======     DataBase  Access  Report  Agosto 2010     GPA     ======
Prompt ====================================================================
Prompt =======            Ambiente Oracle                            ======
Prompt ====================================================================
Prompt
Prompt  @prd51
Prompt
conn ibm0071/ibm3q#2010@prd51
@AccessQuery
Prompt
Prompt  @prd67
Prompt
conn ibm0071/ibm3q#2010@prd67
@AccessQuery
Prompt
Prompt  @dbpd004
Prompt
conn ibm0071/ibm3q#2010@dbpd004
@AccessQuery
Prompt
Prompt  @dbpd005
Prompt
conn ibm0071/ibm3q#2010@dbpd005
@AccessQuery
Prompt
Prompt  @prd5
Prompt
conn ibm0071/ibm3q#2010@prd5
@AccessQuery
Prompt
Prompt  @prd57
Prompt
conn ibm0071/ibm3q#2010@prd57
@AccessQuery

spool off
prompt
prompt  Ed ReportManual.sql                 @ReportManual.sql
prompt



