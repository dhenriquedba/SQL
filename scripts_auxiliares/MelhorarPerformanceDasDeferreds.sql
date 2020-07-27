--Segunda-feira, 14 de Fevereiro de 2000                                                                    		SILOMS  #   164
--	DefObjs.sql
--Odecio Souza

select owner, object_name, object_type
from dba_objects
 where lower(object_name) in ('def$_destination', 'job$',
'deftrandest', 'defschedule')
/

set long 20000 arraysize 1
select view_name, TEXT
	from dba_views
 where lower(view_name) in ('deftrandest', 'defschedule')
/

set linesize 120
Select INDEX_NAME, TABLE_NAME, COLUMN_NAME, COLUMN_POSITION
	from dba_ind_columns
		where lower(table_name) in ('job$', 'def$_call', 'def$_destination', 
							'def$_calldest')
order by 1,2,4
/

create index system.DEF$_CALLDEST_N3_ODECIO
	on system.def$_calldest(deferred_tran_id)
/

create index system.DEF$_CALL_N1_ODECIO
	on system.def$_call(destination_list)
/
