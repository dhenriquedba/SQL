alter session set nls_date_format = 'dd.Mon:hh24:mi';
set lines 130
/*
column RUN_MSG_TX clear
column RUN_MSG_TX format a120 wrap
select distinct RUN_MSG_TX
FROM MANTAS.KDD_RUN
WHERE to_char(start_ts, 'dd/mm/yyyy') = to_char(sysdate, 'dd/mm/yyyy')
/
*/
column RUN_MSG_TX format a70 wrap
SELECT *
FROM MANTAS.KDD_RUN
WHERE to_char(start_ts, 'dd/mm/yyyy') in (to_char(sysdate, 'dd/mm/yyyy'), to_char(sysdate-1, 'dd/mm/yyyy'))
Order by START_TS
/

Prompt 
Prompt ed JobStatus.sql			@JobStatus.sql
Prompt
