select owner, constraint_name, constraint_type
from dba_constraints
where table_name = upper('&TABELA') 
  and owner <> 'MIGRACAO'
Order by 1,2,3
/
Prompt 
Prompt Ed  ComparaConst      @   ComparaConst
Prompt 
