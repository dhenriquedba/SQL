SELECT SUBSTR(LPAD(' ',2*(LEVEL-1))||operation,1,30) operation, SUBSTR(options,1,20) options, 
SUBSTR(object_name,1,20) object_name ,position 
	FROM PLAN_TABLE 
	START WITH id = 0 AND statement_id = 'Nobuo' 
	CONNECT BY PRIOR id = parent_id AND 
statement_id = 'Nobuo'
/
