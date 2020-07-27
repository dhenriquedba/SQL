BEGIN 
	DBMS_JOB.CHANGE(job => 2, next_date => sysdate, 
			interval => '/*1:min*/ sysdate + 1/1440', 
			what => NULL);
	commit;
END;
/

BEGIN 
	DBMS_JOB.CHANGE(job => 2, next_date => sysdate, 
			interval => '/*1:h*/ sysdate + 1/24', 
			what => NULL);
	dbms_job.broken(2, FALSE);
	commit;
END;
/
BEGIN 
	DBMS_JOB.CHANGE(job => 2, next_date => sysdate, 
			interval => '/*1:h*/ sysdate + 1/24', 
			what => NULL);
	commit;
END;
/

BEGIN
    DBMS_JOB.CHANGE(job => 101, next_date => to_date('190920020302','ddMMyyyyHH24MI'),
                    interval => 'next_day(trunc(sysdate)+23.5/24,7)',  --  todo sábado às 23:30h.
                    what => NULL);
    commit;
 END;
/