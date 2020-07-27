set feedback off  verify off  pause off echo off linesize 200  pagesize  0  term off
--accept PROPRIETARIO prompt 'Informe Owner [branco = todos]: '
spool QdAcTrNomeDate.sql
Select 'Spool '||instance_name||'_Invalidos_'||To_Char(SysDate,'ddmmyyyy_hh24mi')||'.TXT' from v$instance;
Spool off
@QdAcTrNomeDate.sql
host rm -rf QdAcTrNomeDate.sql
set term on pages 50
set  feedback on
column Owner            heading Dono            Format a18
column Object_type      heading Tipo            Format a12
set lines 300
set lines 300
--Set pause on pause 'Em pausa ... ... ... ... ...' lines 200 pages 50
prompt
prompt =============================================================
prompt ==========         Invalid Objects              =============
prompt =============================================================
prompt
select Owner, Object_type, Object_name, Last_ddl_time, created
		from all_objects
where status = 'INVALID'
--  and owner (in ('')
  --           or owner like Upper('&%PROPRIETARIO%'))
order by 1,2,3
/
prompt
prompt =============================================================
prompt ==========         Unusable Indexes             =============
prompt =============================================================
prompt
select owner dono, index_name, 'No partitioned'
  from dba_indexes
        where status = 'UNUSABLE'
union
select index_owner dono, index_name, partition_name
  from dba_ind_partitions
        where status = 'UNUSABLE'
order by 1,2,3
/
spool off
Set pause off lines 90 pages 50
prompt
prompt  Ed invalidos.sql                    @ invalidos.sql
prompt
