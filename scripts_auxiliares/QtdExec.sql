select executions, hash_value
	from v$sql
		where hash_value in
			(select hash_value from  v$sql
				where executions >= (select max(executions) from v$sql)-10)
/


prompt 
prompt Ed QtdExec	@QtdExec
prompt 
