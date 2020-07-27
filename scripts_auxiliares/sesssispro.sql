SELECT s.SID, s.SERIAL#, nvl(s.USERNAME,substr(s.PROGRAM,1,18)) username, p.spid,
	 s.program,
	-- s.CLIENT_INFO machine, --
	s.terminal,
        -- s.server,
        -- s.osuser,
	to_char(s.logon_time,'hh24:mi"em"DD-mon') Xxx,
	 s.status
	FROM V$SESSION s, V$PROCESS p
		WHERE s.PADDR = p.ADDR
      and s.USERNAME LIKE UPPER('%SISPRO%')
--		  and s.USERNAME is not null
--	Order by nvl(s.USERNAME,substr(s.PROGRAM,12)), s.status, s.osuser
	Order by s.osuser, s.logon_time, nvl(s.USERNAME,substr(s.PROGRAM,12)), s.status
--	Order by s.logon_time, nvl(s.USERNAME,substr(s.PROGRAM,12)), s.status
--	Order by p.spid
--	Order by s.sid
/
