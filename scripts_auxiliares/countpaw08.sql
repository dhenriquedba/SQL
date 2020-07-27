column Total_todas heading 'Conexãoes ao PRD3' format a25
select 'Total_todas', count(*)
from V$SESSION
union
select 'Nao_PAW08', count(*)
from V$SESSION
where machine not like '%PAW08%'
union
select 'Total_PAW08', count(*)
from V$SESSION
where machine like '%PAW08%'
union
select to_char(logon_time,'ddmon=hh24') logon, count(*)
from V$SESSION
where machine like '%PAW08%'
--  and status in ('ACTIVE','INACTIVE')
 group by to_char(logon_time,'ddmon=hh24')
union
SELECT 'GCA03', count(*)
  FROM V$SESSION A,
    (SELECT  COD_USER
   FROM USER_PERF UP, PERF_OPC PO, SISTEMA S
     WHERE UP.COD_PERF = PO.COD_PERF
    AND PO.IDT_OPC = S.IDT_OPC
    AND S.COD_SIST = 'GCA3'
  GROUP BY COD_USER
    HAVING COUNT (1) = 1) B
 WHERE A.USERNAME = B.COD_USER
union
SELECT 'GestãoIdentidade', count(*)
  FROM V$SESSION
     WHERE Username = 'TIM_USER'
  GROUP by USERNAME
union
SELECT 'Ativas', count(*)
  FROM V$SESSION A
     WHERE A.STATUS = 'ACTIVE'
       and A.USERNAME is not null
/
prompt
prompt  ed countpaw08    @countpaw08  ed sess    @ sess    @ lock     @ jobsrunning     @vcom   @ongoingplan 
prompt
prompt  @killpaw08  @countpaw08
prompt
prompt  '                spool C:\_Odecio\IBM\OnGoing\PRD3\CriseOut2010-SGA\assassinaPAW08-08out-'
prompt
prompt
