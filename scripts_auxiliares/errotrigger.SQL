set linesize 20000
spool trigger.erro
select name, text from user_errors 
where type = 'TRIGGER'
order by 1
/
spool off

