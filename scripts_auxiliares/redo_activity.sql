@login
set feedback off  verify off  pause off echo off linesize 200  pagesize  0  term off
spool QdAcTrNomeDate.sql
Select 'Spool '||instance_name||'_ReDoActivity_'||To_Char(SysDate,'ddmonyyyy')||'.TXT' from v$instance;
Spool off
@QdAcTrNomeDate.sql
host del /q QdAcTrNomeDate.sql
set term on
set  feedback off
--   Mostra a qtde de log switch por dia By Flavio Cariri 3CON- GPA
--   O numero ideal de switch é 4 por hora
column 00  format a4
column 01  format a4
column 02  format a4
column 03  format a4
column 04  format a4
column 05  format a4
column 06  format a4
column 07  format a4
column 08  format a4
column 09  format a4
column 10  format a4
column 11  format a4
column 12  format a4
column 13  format a4
column 14  format a4
column 15  format a4
column 16  format a4
column 17  format a4
column 18  format a4
column 19  format a4
column 20  format a4
column 21  format a4
column 22  format a4
column 23  format a4
column 24  format a4
column day  format a7
column x heading "Tamanho do ReDo|Em MegaBytes" format 999,999,999,999
column total  format 9,999

set linesize 250 pagesize 100 feedback off

select to_char(first_time,'MM/DD') day,
to_char(sum(decode(substr(to_char(first_time,'DD-MON-YYHH24'),10,2),'00',1,0)),'999') "00",
to_char(sum(decode(substr(to_char(first_time,'DD-MON-YYHH24'),10,2),'01',1,0)),'999') "01",
to_char(sum(decode(substr(to_char(first_time,'DD-MON-YYHH24'),10,2),'02',1,0)),'999') "02",
to_char(sum(decode(substr(to_char(first_time,'DD-MON-YYHH24'),10,2),'03',1,0)),'999') "03",
to_char(sum(decode(substr(to_char(first_time,'DD-MON-YYHH24'),10,2),'04',1,0)),'999') "04",
to_char(sum(decode(substr(to_char(first_time,'DD-MON-YYHH24'),10,2),'05',1,0)),'999') "05",
to_char(sum(decode(substr(to_char(first_time,'DD-MON-YYHH24'),10,2),'06',1,0)),'999') "06",
to_char(sum(decode(substr(to_char(first_time,'DD-MON-YYHH24'),10,2),'07',1,0)),'999') "07",
to_char(sum(decode(substr(to_char(first_time,'DD-MON-YYHH24'),10,2),'08',1,0)),'999') "08",
to_char(sum(decode(substr(to_char(first_time,'DD-MON-YYHH24'),10,2),'09',1,0)),'999') "09",
to_char(sum(decode(substr(to_char(first_time,'DD-MON-YYHH24'),10,2),'10',1,0)),'999') "10",
to_char(sum(decode(substr(to_char(first_time,'DD-MON-YYHH24'),10,2),'11',1,0)),'999') "11"
 from V$log_history
where first_time between trunc(sysdate - 30,'mon') and last_day(sysdate)
group by to_char(first_time,'MM/DD')
order by 1;
select to_char(first_time,'MM/DD') day,
to_char(sum(decode(substr(to_char(first_time,'DD-MON-YYHH24'),10,2),'12',1,0)),'999') "12",
to_char(sum(decode(substr(to_char(first_time,'DD-MON-YYHH24'),10,2),'13',1,0)),'999') "13",
to_char(sum(decode(substr(to_char(first_time,'DD-MON-YYHH24'),10,2),'14',1,0)),'999') "14",
to_char(sum(decode(substr(to_char(first_time,'DD-MON-YYHH24'),10,2),'15',1,0)),'999') "15",
to_char(sum(decode(substr(to_char(first_time,'DD-MON-YYHH24'),10,2),'16',1,0)),'999') "16",
to_char(sum(decode(substr(to_char(first_time,'DD-MON-YYHH24'),10,2),'17',1,0)),'999') "17",
To_char(sum(decode(substr(to_char(first_time,'DD-MON-YYHH24'),10,2),'18',1,0)),'999') "18",
to_char(sum(decode(substr(to_char(first_time,'DD-MON-YYHH24'),10,2),'19',1,0)),'999') "19",
to_char(sum(decode(substr(to_char(first_time,'DD-MON-YYHH24'),10,2),'20',1,0)),'999') "20",
to_char(sum(decode(substr(to_char(first_time,'DD-MON-YYHH24'),10,2),'21',1,0)),'999') "21",
to_char(sum(decode(substr(to_char(first_time,'DD-MON-YYHH24'),10,2),'22',1,0)),'999') "22",
to_char(sum(decode(substr(to_char(first_time,'DD-MON-YYHH24'),10,2),'23',1,0)),'999') "23",
COUNT(1) "Total" from V$log_history
where first_time between trunc(sysdate - 30,'mon') and last_day(sysdate)
group by to_char(first_time,'MM/DD')
order by 1;
select distinct bytes/1024/1024 x from v$log;
set feedback on
spool off
prompt 
prompt  ed redo_activity   @redo_activity	@ sess  @ lock  @ jobsrunning  @vcom  @ongoingplan  @killpaw08  @countpaw08  @sessprdx
prompt 

