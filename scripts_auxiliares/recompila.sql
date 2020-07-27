set echo off feedback off pages 0 linesize 150 time off timing off
/*

amlp[RESTRICTED=TTCN212]>desc sys.utl_recomp
PROCEDURE PARALLEL_SLAVE
 Nome do Argumento                  Tipo                    In/Out Default?
  -  
 BATCH_SIZE                     BINARY_INTEGER          IN
 FLAGS                          BINARY_INTEGER          IN
PROCEDURE RECOMP_PARALLEL
 Nome do Argumento                  Tipo                    In/Out Default?
  -  
 THREADS                        BINARY_INTEGER          IN     DEFAULT
 SCHEMA                         VARCHAR2                IN     DEFAULT
 FLAGS                          BINARY_INTEGER          IN     DEFAULT
PROCEDURE RECOMP_SERIAL
 Nome do Argumento                  Tipo                    In/Out Default?
  -  
 SCHEMA                         VARCHAR2                IN     DEFAULT
 FLAGS                          BINARY_INTEGER          IN     DEFAULT
PROCEDURE RESTORE_JOB_QUEUE
*/

spool __Recompila_1.SQL
Prompt alter system flush shared_pool;;
Prompt alter session set "_push_join_union_view"=FALSE;;
select 'alter '||object_type||' '||owner||'.'||Object_name||' compile;'
		from all_objects
where status = 'INVALID' and object_type <> 'PACKAGE BODY'
	and owner not in ('SYS', 'SYSTEM')
union
select 'alter package '||owner||'.'||Object_name||' compile body;'
		from all_objects
where status = 'INVALID' and object_type = 'PACKAGE BODY'
	and owner not in ('SYS', 'SYSTEM')
order by 1 desc
/
spool off

/*
@login
spool Recompila.Log
select sysdate inicio from dual;
set timing on echo on time on
alter system flush shared_pool;
alter session set "_push_join_union_view"=FALSE;
--EXEC sys.utl_recomp.RECOMP_PARALLEL(4,'business')
exec utl_recomp.recomp_parallel(4);
select sysdate termino from dual;
set echo off feedback on pages 30
Prompt ===========================
Prompt Há Invalidos  ?????????????
Prompt ===========================
*/
@__Recompila_1
set echo off feedback on pages 30
@ Invalidos
--spool off
select owner, object_type, count(*)
	from all_objects
	where status = 'INVALID' 
group by owner, object_type
/

--prompt isto não funciona melhor ??? !!!  EXEC sys.utl_recomp.RECOMP_PARALLEL(4,'business')
--prompt
--prompt  Ed Invalidos			@ Invalidos
--prompt   Ed Recompila			@Recompila
