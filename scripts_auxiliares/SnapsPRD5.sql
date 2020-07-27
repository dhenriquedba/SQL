/*
OWNER  NAME          TABLE_NAME           REFRESH_METHOD       UPD LAST_REFRESH
------ ----------    -------------------- -------------------- --- ------------------------------------
AC01   TIPO_MECO     TIPO_MECO            ROWID                NO  07/december/2006:09:23:23
AC01   CODIGO_FISCAL CODIGO_FISCAL        COMPLEX              NO  26/march/2007:17:49:14
AC01   MECO_UCBD     MECO_UCBD            ROWID                NO  17/april/2007:12:03:28
AC01   END_UCBD      END_UCBD             ROWID                NO  17/april/2007:12:03:13
AC01   UCBD_AGRP     UCBD_AGRP            PRIMARY KEY          NO  03/july/2007:16:24:18
AC01   EMPRESA       EMPRESA              COMPLEX              NO  07/december/2006:09:27:52
AC01   UCBD          UCBD                 PRIMARY KEY          NO  03/july/2007:16:38:09

-- Atualizar após a propagação no PRD3
*/

column owner format a6
column name format a10
column table_name format a20
column refresh_method format a20
column last_refresh format a50

select owner, name, table_name, refresh_method, updatable, last_refresh  from dba_snapshots
/



prompt exec dbms_snapshot.refresh('MECO_UCBD','fast')
prompt
