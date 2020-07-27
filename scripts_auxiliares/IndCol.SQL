
select c.index_owner, i.index_name, i.UNIQUENESS, c.column_name, C.COLUMN_POSITION
from dba_indexes i, dba_ind_columns c
where i.index_name = c.index_name
  and c.index_owner = 'SILOMS'
  and i.table_owner = 'SILOMS'
  and i.table_name = 'T_MATERIAL'
  and c.column_name IN ('CD_CFF', 'NR_PN')
/
PROMPT
PROMPT
PROMPT   ED IndCol        @ IndCol
PROMPT
PROMPT
