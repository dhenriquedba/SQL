prompt To verify index and statistics data
prompt By Anderson Jeronimo - DMR - Qualitas
prompt
col index_nmae format a30
col column_name format a30
set lines 100
break on index_name skip 1
accept TABLE_NAME prompt 'Name of the Table: '
select index_name, column_name from dba_ind_columns
where table_name = upper('&TABLE_NAME')
order by 1,column_position
/
select t.table_name, nvl(to_char(t.last_analyzed,'dd-mon-yy'),'Not Analyzed') an_tab, t.num_rows rows_tab,
	 i.index_name, nvl(to_char(i.last_analyzed,'dd-mon-yy'),'No Analyzed') an_ind, i.num_rows rows_ind, i.status status_index
  from dba_indexes i, dba_tables t
	where t.table_name = upper('&TABLE_NAME')
	  and i.table_name = t.table_name
order by 1,2
/
prompt
prompt  Ed VerInd		@ VerInd
prompt
