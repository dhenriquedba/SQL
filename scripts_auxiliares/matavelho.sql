SELECT S.USERNAME, 'ALTER SYSTEM KILL SESSION '''||s.SID||', '||s.SERIAL#||''';' MATAR	
FROM V$SESSION s, V$PROCESS p
		WHERE s.PADDR = p.ADDR
    and s.logon_time<sysdate-30/1440
    and S.username not in ('USERBIZTALK','CSEX','SYS','PA_CLEAR','ESB_USER','DBSNMP','INTERFGTE','INTEXTRA') AND S.USERNAME IS NOT NULL  
    and s.username not like ('IBM%')
    and status not in ('KILLED','SNIPED')
ORDER BY USERNAME
/
