/*
select sql_text
from v$sqltext
where (address, hash_value) in (select address, hash_value from v$sql where executions > 10000)
order by address, hash_value,piece
*/


declare
	cursor COM is
		select sql_text
			from v$sqltext
			where (address, hash_value) 
			   in (select address, hash_value 
				from v$sql 
					where executions > 10000)
order by address, hash_value,piece;
texto VARCHAR2(64);
begin
	for linha in com loop
		texto := linha.sql_text;
		dbms_output.put(texto);
	end loop;
	dbms_output.put_line('fim');
end;
/


