select status, count(*) 
	from v$datafile
	group by status
/

select status, name
     from V$datafile
    where status not in ('ONLINE', 'SYSTEM')
/
