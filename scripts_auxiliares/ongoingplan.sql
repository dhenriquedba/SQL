column EXECUTIONS format 999,999,999,999
define acct = 2038551412
define cust =  6825244151009321526  
set feedback off pages 200

--select HASH_VALUE, sql_text
--from v$sql
--where sql_text like '%CUST%'
--   or sql_text like '%ACCT%'
--order by HASH_VALUE
--/
select OPERATION, OPTIONS, OBJECT_NAME
from v$sql_plan
where HASH_VALUE in (&cust,&acct)
order by HASH_VALUE, position
/

select sql_text, executions, to_char(sysdate,'hh24:mi:ss') agora     
from v$sql
where hash_value in (&cust,&acct)
order by 1,2,3
/
prompt
prompt   Ed ongoingplan.sql 	@ongoingplan.sql
prompt
