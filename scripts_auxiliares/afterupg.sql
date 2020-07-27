spool patch.log 
startup migrate pfile=$ORACLE_HOME/dbs/initamlp.ora
pause OK_?
@ $ORACLE_HOME/rdbms/admin/catpatch.sql
pause OK_?
exec dbms_stats.gather_schema_stats('SYS'); 
shutdown immediate
startup mount pfile=$ORACLE_HOME/dbs/initamlp.ora
create spfile from
pfile='$ORACLE_HOME/dbs/initamlp.ora';
pause OK_?
shutdown immediate
startup
pause OK_?
spool off
@?/rdbms/admin/utlrp.sql 

