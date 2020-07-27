set feedback off  verify off  pause off echo off linesize 200  pagesize  0  term off
--accept PROPRIETARIO prompt 'Informe Owner [branco = todos]: '
spool QdAcTrNomeDate.sql
Select 'Spool '||instance_name||'_AdjustTbs_'||To_Char(SysDate,'ddmonyy_hh24mi')||'.TXT' from v$instance;
Spool off
@QdAcTrNomeDate.sql
host rm -rf QdAcTrNomeDate.sql
--host del /q QdAcTrNomeDate.sql
set term on
column x format a50 heading 'Espaço Total'
column gb format 9,999.999
set verify off
set lines 200 pages 100
set serveroutput on

accept TBS prompt 'Informe Tablespace : '
accept PER prompt 'Informe Threshold  : '
prompt 
prompt 
prompt select tablespace_name from dba_tablespaces order by 1
prompt /
prompt 
prompt select file_name x, bytes/1024/1024/1024 Gb, autoextensible
prompt 	from dba_data_files
prompt 	where tablespace_name = upper('&TBS')
prompt union
prompt select 'soma        ==>', Sum(bytes)/1024/1024/1024 Gb, '<=='
prompt 	from dba_data_files
prompt 	where tablespace_name = upper('&TBS')
prompt group by 'soma        ==>','<=='
prompt /
prompt 
prompt 
declare
	vTBS varchar2(30) := upper('&TBS');
	vPER number := &PER;
	vFILE varchar2(257);
	vGBsize number(11,3);
	vGBfree number(11,3);
	Vperfree number(6,3);
	Vaumenta number(11,3);
begin
	select Sum(bytes)/1024/1024/1024
		into vGBsize
	from dba_data_files
	where tablespace_name = vTBS;
	select Sum(fr.bytes)/1024/1024/1024
		into vGBfree
	from dba_free_space fr
	where fr.tablespace_name = vTBS;
	Vperfree:=vGBfree/vGBsize*100;
	Vaumenta:=((100-VPER)/100)*vGBsize-vGBfree;
	dbms_output.put_line('Tablespace Name    : '||VTBS);
	dbms_output.put_line('Threshold          : '||VPER);
	dbms_output.put_line('GigaBytes total    : '||vGBsize);
	dbms_output.put_line('GigaBytes livres   : '||vGBfree);
	dbms_output.put_line('Percentual livre   : '||Vperfree);
        if Vaumenta>=0 then
		dbms_output.put_line('GigaBytes Aumentar : '||Vaumenta);
	else
		dbms_output.put_line('GigaBytes Além Threshold : '||Vaumenta*-1);
	end if;
end;
/

undefine TBS

prompt
prompt  ed adjusttbs.sql     @adjusttbs.sql
prompt
