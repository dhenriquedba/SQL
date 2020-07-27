set feedback off  verify off  pause off echo off linesize 200  pagesize  0  term off
--accept PROPRIETARIO prompt 'Informe Owner [branco = todos]: '
spool /home/oracle/dba/odecios/QdAcTrNomeDate.sql
Select 'Spool /home/oracle/dba/odecios/'||instance_name||'_Analyzed_'||To_Char(SysDate,'ddmonyy_hh24mi')||'.TXT' from v$instance;
Spool off
@/home/oracle/dba/odecios/QdAcTrNomeDate.sql
host rm -rf /home/oracle/dba/odecios/QdAcTrNomeDate.sql
set term on pages 50
set  feedback on
column Owner            heading Dono            Format a18
column Object_type      heading Tipo            Format a12
set lines 300
column x heading structure format a16
column owner format a15
set pages 200
select owner, 'not partitioned' x, trunc(last_analyzed) analyzed, count(*)
	from dba_tables
--	where (owner like '%NEXUS%' or owner = 'PONTOWEB')
	  where partitioned = 'NO'
  group by owner, trunc(last_analyzed)
union
select table_owner, '    partitioned' x, trunc(last_analyzed) analyzed, count(*)
	from dba_tab_partitions
--	where  (table_owner like '%NEXUS%' or table_owner = 'PONTOWEB')
  group by table_owner, trunc(last_analyzed)
order by 1,3 desc
/
alter session set nls_date_format='ddmonyy-hh24:mi';
column percent format 999
column  sample_size format 999,999,999.999

Select owner, table_name, 'Heap' type, num_rows, sample_size, sample_size/num_rows*100 percent, last_analyzed
 from dba_tables
--  where owner = 'SISPRO'  and num_rows> 0  and  partitioned = 'NO'
  where  owner not in ('SYSTEM','SYS','IBMDBA','RESTORE','RESTORE2','RESTORE3','DBSNMP') and num_rows> 0  and  partitioned = 'NO'
union
Select table_owner, table_name, 'Part', sum(num_rows), sum(sample_size), sum(sample_size)/sum(num_rows)*100,  max(last_analyzed)
	from dba_tab_partitions  
--where table_owner = 'SISPRO' 
	  where  table_owner not in ('SYSTEM','SYS') and num_rows> 0  
group by table_owner, table_name
-- order by 1,2,3,4
order by last_analyzed desc
/

spool off
Set pause off lines 90 pages 50
prompt
prompt  Ed anal                   @ anal
prompt
