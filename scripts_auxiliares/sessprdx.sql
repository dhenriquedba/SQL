column sid format 9999
column serial# format 99999
column username format a15
column osuser format a15
set lines 200
SELECT  s.SID, s.SERIAL#, nvl(s.USERNAME,substr(s.PROGRAM,10)) username, 
	p.spid, 
--s.program, 
    s.osuser, to_char(s.logon_time,'hh24:mi:ss"em"DD-mon') logon, s.status
	FROM V$SESSION s, V$PROCESS p
            WHERE s.PADDR = p.ADDR
	   and (s.USERNAME in ('PRDX99', 'SYSTEM', 'SYS','USSSAC01', 'DBSNMP')
                or s.USERNAME like 'LC%')
Order by s.logon_time, nvl(s.USERNAME,substr(s.PROGRAM,12)), s.status
/
prompt  
prompt ed sess  @sess  @lock  @jobsrunning  @vcom  @ongoingplan  @killpaw08  @countpaw08  @sessprdx
prompt  

