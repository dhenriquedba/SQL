SELECT s.SID, s.SERIAL#, nvl(s.USERNAME,substr(s.PROGRAM,10)) username, p.spid,
	s.program,
	-- s.CLIENT_INFO machine, -- s.server,
      s.osuser,
	to_char(s.logon_time,'hh24:mi"em"DD-mon') X,
	 s.status
	FROM V$SESSION s, V$PROCESS p
		WHERE s.PADDR = p.ADDR
		  and p.spid in (2035848 ,
1761516, 
3026986 ) 
	Order by s.logon_time, nvl(s.USERNAME,substr(s.PROGRAM,12)), s.status

/


SELECT 'ALTER SYSTEM KILL SESSION '''||s.SID||', '||s.SERIAL#||''';' MATAR
	FROM V$SESSION s, V$PROCESS p
		WHERE s.PADDR = p.ADDR
		  and p.spid in (2035848 ,
1863856, 
3026986 )  ;