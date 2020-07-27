CREATE OR REPLACE 
PROCEDURE p_analyze_diaria
IS

   CURSOR C_TABLES
   IS
   SELECT OWNER, TABLE_NAME
   FROM DBA_TABLES
   WHERE OWNER NOT IN ('SYS','SYSTEM','PERFSTAT','OEMUSER','QUEST','QUEST2','QUEST9I','DBSNMP','OUTLN','VERITAS')
   AND   (TRUNC(LAST_ANALYZED) < TRUNC(SYSDATE) OR LAST_ANALYZED IS NULL)
   AND   PARTITIONED = 'NO'
   AND   TABLE_NAME NOT LIKE '%\_OLD'     ESCAPE '\'
   AND   TABLE_NAME NOT LIKE '%\_BKP'     ESCAPE '\'
   AND   TABLE_NAME NOT LIKE '%\_BAK'     ESCAPE '\'
   AND   TABLE_NAME NOT LIKE '%\_TMP'     ESCAPE '\'
   AND   TABLE_NAME NOT LIKE '%\_TMP2'    ESCAPE '\'
   AND   TABLE_NAME NOT LIKE '%\_TMP01'   ESCAPE '\'
   AND   TABLE_NAME NOT LIKE '%\_FRAN'    ESCAPE '\'
   AND   TABLE_NAME NOT LIKE '%\_FRANZ'   ESCAPE '\'
   AND   TABLE_NAME NOT LIKE '%\_DANILO%' ESCAPE '\'
   AND   TABLE_NAME NOT LIKE '%\_TESTE'   ESCAPE '\'
   ORDER BY 1,2;

   CURSOR C_INDEXES (P_TABLE_NAME)
   IS
   SELECT OWNER, INDEX_NAME
   FROM DBA_INDEXES
   WHERE OWNER NOT IN ('SYS','SYSTEM','PERFSTAT','OEMUSER','QUEST','QUEST2','QUEST9I','DBSNMP','OUTLN','VERITAS')
   AND   TABLE_NAME = P_TABLE_NAME
   AND   (TRUNC(LAST_ANALYZED) < TRUNC(SYSDATE) OR LAST_ANALYZED IS NULL)
   AND   PARTITIONED = 'NO'
   ORDER BY 1,2;

   CURSOR C_TABLES_PART
   IS
   SELECT OWNER, TABLE_NAME
   FROM DBA_TABLES
   WHERE OWNER NOT IN ('SYS','SYSTEM','PERFSTAT','OEMUSER','QUEST','QUEST2','QUEST9I','DBSNMP','OUTLN','VERITAS')
   AND   PARTITIONED = 'YES'
   ORDER BY 1,2;


-- SEMANAL
   CURSOR C_IND_GLOBAL
   IS
   SELECT OWNER, INDEX_NAME
   FROM DBA_INDEXES
   WHERE PARTITIONED='NO'
   AND   TABLE_NAME IN (SELECT TABLE_NAME FROM DBA_TABLES WHERE PARTITIONED='YES')
   AND   (TRUNC(LAST_ANALYZED) < TRUNC(SYSDATE) OR LAST_ANALYZED IS NULL)
   ;
   

BEGIN

  /*

    CREATE TABLE T_ANALYZE_LOG
    (OBJECT_OWNER     VARCHAR2(30)
    ,OBJECT_TYPE      VARCHAR2(30)
    ,OBJECT_NAME      VARCHAR2(30)
    ,PARTITION_NAME   VARCHAR2(30)
    ,ERROR_CODE       NUMBER
    ,LAST_ANALYZED    DATE
    );

  */

   DELETE T_ANALYZE_LOG
   WHERE (LAST_ANALYZE < (SYSDATE - 30));
   COMMIT;

   FOR T IN C_TABLES LOOP
      BEGIN
         DBMS_STATS.GATHER_TABLE_STATS (OWNNAME          => T.OWNER
                                       ,TABNAME          => T.TABLE_NAME
                                       ,ESTIMATE_PERCENT => 25
--                                     ,DEGREE           =>  5       -->--------------------- ???
                                       ,CASCADE          => FALSE
                                       );
      EXCEPTION
         WHEN OTHERS THEN
               INSERT INTO T_ANALYZE_LOG (OBJECT_OWNER, OBJECT_TYPE, OBJECT_NAME,PARTITION_NAME,ERROR_CODE,LAST_ANALYZED)
                           VALUES        (     T.OWNER,     'TABLE',T.TABLE_NAME,          NULL,   SQLCODE,SYSDATE);
      END;

      FOR I IN C_INDEXES (T.TABLE_NAME) LOOP
         BEGIN
            DBMS_STATS.GATHER_INDEX_STATS (OWNNAME => I.OWNER
                                          ,INDNAME => I.INDEX_NAME
                                          );
         EXCEPTION
            WHEN OTHERS THEN
                  INSERT INTO T_ANALYZE_LOG (OBJECT_OWNER, OBJECT_TYPE, OBJECT_NAME,PARTITION_NAME,ERROR_CODE,LAST_ANALYZED)
                              VALUES        (     I.OWNER,     'INDEX',I.INDEX_NAME,          NULL,   SQLCODE,SYSDATE);
         END;
      END LOOP;

   END LOOP;

   COMMIT;


   FOR T IN C_TABLES_PART LOOP


       FOR P IN (select x.table_owner, x.table_name, x.partition_name
                 from all_tab_partitions x
                 where x.partition_position > (select max(partition_position)-2
                                               from all_tab_partitions
                                               where table_name  = x.table_name
                                                 and table_owner = X.table_owner)
                 and x.table_name = T.table_name
                 and (trunc(x.last_analyzed) < trunc(sysdate) or x.last_analyzed is null)
                 and x.table_owner not in ('SYS','SYSTEM','PERFSTAT','OEMUSER','QUEST','QUEST2','QUEST9I','DBSNMP','OUTLN','VERITAS')
       ) LOOP
  
           BEGIN
              DBMS_STATS.GATHER_TABLE_STATS (OWNNAME          => p.OWNER
                                            ,TABNAME          => p.TABLE_NAME
                                            ,PARTNAME         => p.PARTIION_NAME
                                            ,ESTIMATE_PERCENT => 25
--                                          ,DEGREE           =>  5       -->--------------------- ???
                                            ,CASCADE          => FALSE
                                            );
           EXCEPTION
              WHEN OTHERS THEN
                  INSERT INTO T_ANALYZE_LOG ( OBJECT_OWNER,       OBJECT_TYPE, OBJECT_NAME,  PARTITION_NAME,ERROR_CODE,LAST_ANALYZED)
                              VALUES        (P.TABLE_OWNER, 'TABLE PARTITION',P.TABLE_NAME,P.PARTITION_NAME,   SQLCODE,SYSDATE);
           END;

       END LOOP;


       FOR P IN (select X.index_owner, X.index_name, X.partition_name
                 from all_ind_partitions X, all_indexes y
                 where x.partition_position > (select max(partition_position)-2
                                               from all_ind_partitions a, all_indexes b
                                               where a.index_name  = b.index_name
                                                 and a.index_owner = b.owner
                                                 and b.table_name  = y.table_name
                                                 and b.owner       = y.owner
                                                )
                 and y.table_name  = T.table_name
                 and x.index_name  = y.index_name
                 and x.index_owner = y.owner
                 and y.owner not in ('SYS','SYSTEM','PERFSTAT','OEMUSER','QUEST','QUEST2','QUEST9I','DBSNMP','OUTLN','VERITAS')
                 and (trunc(x.last_analyzed) < trunc(sysdate) or x.last_analyzed is null)
       ) LOOP
  
           BEGIN
              DBMS_STATS.GATHER_INDEX_STATS (OWNNAME  => p.OWNER
                                            ,INDNAME  => p.INDEX_NAME
                                            ,PARTNAME => p.PARTIION_NAME
                                            );
           EXCEPTION
              WHEN OTHERS THEN
                  INSERT INTO T_ANALYZE_LOG ( OBJECT_OWNER,       OBJECT_TYPE, OBJECT_NAME,  PARTITION_NAME,ERROR_CODE,LAST_ANALYZED)
                              VALUES        (P.INDEX_OWNER, 'INDEX PARTITION',P.INDEX_NAME,P.PARTITION_NAME,   SQLCODE,SYSDATE);
           END;

       END LOOP;

   END LOOP;

   COMMIT;    

   FOR I IN C_INDEXES_GLOBAIS LOOP
      BEGIN
         DBMS_STATS.GATHER_INDEX_STATS (OWNNAME => I.OWNER
                                       ,INDNAME => I.INDEX_NAME
                                       );
      EXCEPTION
         WHEN OTHERS THEN
               INSERT INTO T_ANALYZE_LOG (OBJECT_OWNER,   OBJECT_TYPE, OBJECT_NAME,PARTITION_NAME,ERROR_CODE,LAST_ANALYZED)
                           VALUES        (     I.OWNER,'GLOBAL INDEX',I.INDEX_NAME,          NULL,   SQLCODE,SYSDATE);
         END;
   END LOOP;

   COMMIT;    

END p_analyze_diaria;
/

GRANT EXECUTE ON p_analyze_diaria TO public
/
