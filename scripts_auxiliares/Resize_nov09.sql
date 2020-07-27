column Mbytes format 999,999.999
Select t.tablespace_name, sum(t.bytes)/1024/1024 Mbytes,
  sum(decode(t.maxbytes,0,t.bytes,t.maxbytes)) max
from dba_data_files t
  where t.tablespace_name  in ('CASH_TRXN_DATA', 'MI_TRXN_DATA', 'WIRE_TRXN_DATA', 'BUS_DATA',
					 'CASH_TRXN_IDX', 'MI_TRXN_IDX', 'WIRE_TRXN_IDX', 'BUS_IDX')
group by t.tablespace_name
/


Prompt DATA
select sum(bytes) bytes from (
Select t.tablespace_name, sum(t.bytes) bytes,
  sum(decode(t.maxbytes,0,t.bytes,t.maxbytes)) max
from dba_data_files t
  where t.tablespace_name  in ('CASH_TRXN_DATA', 'MI_TRXN_DATA', 'WIRE_TRXN_DATA', 'BUS_DATA')
group by t.tablespace_name)
/
Prompt INDEX
select sum(bytes) bytes from (
Select t.tablespace_name, sum(t.bytes) bytes,
  sum(decode(t.maxbytes,0,t.bytes,t.maxbytes)) max
from dba_data_files t
  where t.tablespace_name  in ('CASH_TRXN_IDX', 'MI_TRXN_IDX', 'WIRE_TRXN_IDX', 'BUS_IDX')
group by t.tablespace_name)
/


Select t.tablespace_name, t.file_name, sum(decode(t.maxbytes,0,t.bytes,t.maxbytes)) /1024 Kbytes
from dba_data_files t
  where t.tablespace_name  in ('CASH_TRXN_DATA', 'MI_TRXN_DATA', 'WIRE_TRXN_DATA', 'BUS_DATA',
					 'CASH_TRXN_IDX', 'MI_TRXN_IDX', 'WIRE_TRXN_IDX', 'BUS_IDX')
group by t.tablespace_name, t.file_name
/

Select 'alter tablespace '||t.tablespace_name||chr(10)||
	 ' add datafile '''||t.file_name||''' '||chr(10)||
	 ' size '||( sum(decode(t.maxbytes,0,t.bytes,t.maxbytes)) /1024 )||'K;'
from dba_data_files t
  where t.tablespace_name  in ('CASH_TRXN_DATA', 'MI_TRXN_DATA', 'WIRE_TRXN_DATA', 'BUS_DATA',
					 'CASH_TRXN_IDX', 'MI_TRXN_IDX', 'WIRE_TRXN_IDX', 'BUS_IDX')
group by t.tablespace_name, t.file_name
order by 1
/

Prompt  
Prompt   Ed Resize_nov09.sql		@Resize_nov09.sql
Prompt  
