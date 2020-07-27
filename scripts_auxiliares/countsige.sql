--column Total_todas heading 'Conexãoes ao PRD3' format a25
column x noprint
set feedback off

--select to_char(logon_time,'ddmon=hh24:mi') logon, count(*)
--select 1 x, to_char(logon_time,'ddmon=hh24') logon, count(*)
--	from V$SESSION
--	where username is not null
--		group by to_char(logon_time,'ddmon=hh24:mi')
--		group by to_char(logon_time,'ddmon=hh24')
--Union
select 2 x, '---', status, count(*)
	from V$SESSION
	where username is not null
		group by status
--union
--select 4 x, status,server, count(*)
--	from V$SESSION
--	where username is not null
--		group by status,server
union
select 3 x, '---', 'total', count(*)
	from V$SESSION
	where username is not null
		group by 'total'
order by 1,2,3
/
set feedback on
prompt
prompt  ed countsige    @countsige  @killsniped   ed sess    @ sess    @ lock     @ jobsrunning     @vcom   @ongoingplan   @killpaw08  @countpaw08
prompt

