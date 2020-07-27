/*
Truncate table  PhysicalStructure  
/
insert into PhysicalStructure  
	(tableName, PartitionName, SegmentType, Owner, TotalBytes, QttyExtents, datatbs, indextbs)
	select segment_name, nvl(Partition_Name,'NOT PARTITIONED'),
		segment_type, owner, sum(bytes) , count(*), 
			case WHEN segment_type in ('TABLE', 'TABLE PARTITION') THEN TABLESPACE_NAME ELSE NULL END ,
			case WHEN segment_type in ('INDEX', 'INDEX PARTITION') THEN TABLESPACE_NAME ELSE NULL END
      from dba_extents e
   where e.OWNER in ('BUSINESS'
     , 'MANTAS'
     , 'KDD'
     , 'KDD_WEB'
     , 'KDD_ALG'
     , 'KDD_MNR'
     , 'MARKET'
     , 'INGEST_USER'
     , 'DB_UTIL_USER'
     , 'INFO_REP_P'
     , 'INFO_REP_S')
 group by segment_name, nvl(Partition_Name,'NOT PARTITIONED'), segment_type, owner, 
			case WHEN segment_type in ('TABLE', 'TABLE PARTITION') THEN TABLESPACE_NAME ELSE NULL END ,
			case WHEN segment_type in ('INDEX', 'INDEX PARTITION') THEN TABLESPACE_NAME ELSE NULL END
/
commit
/
drop TABLE TooManyExtents
/
CREATE TABLE TooManyExtents
    AS SELECT owner, tablename, partitionname, segmenttype, totalbytes, NVL(datatbs, indextbs) old_TBS,
     case WHEN owner in ('INFO_REP_P', 'INFO_REP_S') THEN 
      'PMART_'||
      CASE WHEN SEGMENTTYPE LIKE 'INDEX%' THEN 'INDEX' ELSE 'DATA' END||
      CASE WHEN TOTALBYTES <= 8192 THEN '_8K' ELSE '_512K' END
     else
      'MANTAS_'||
      CASE WHEN SEGMENTTYPE LIKE 'INDEX%' THEN 'INDEX'  ||
      CASE WHEN TOTALBYTES <= 8192 THEN '_8K' 
           WHEN TOTALBYTES <= (64*1024)  THEN '_64K'
           WHEN TOTALBYTES <= (5*1024*1024) THEN '_5M'
           WHEN TOTALBYTES <= (100*1024*1024) THEN '_100M'
           WHEN TOTALBYTES <= (500*1024*1024) THEN '_500M'
      else '_1G' end
     WHEN SEGMENTTYPE LIKE 'TABLE%' THEN 'DATA'  ||
      CASE WHEN TOTALBYTES <= 8192 THEN '_8K' 
           WHEN TOTALBYTES <= (512*1024)  THEN '_512K'
           WHEN TOTALBYTES <= (1*1024*1024) THEN '_1M'
           WHEN TOTALBYTES <= (5*1024*1024) THEN '_5M'
           WHEN TOTALBYTES <= (100*1024*1024) THEN '_100M'
           WHEN TOTALBYTES <= (500*1024*1024) THEN '_500M'
      else '_1G' end 
     end
    end NEW_TBS
       FROM physicalstructure
       WHERE 
--totalbytes <= (1024*1024*1024)
  --       AND datatbs NOT LIKE 'MANTAS_DATA____1G'
    --  AND 
QTTYEXTENTS > 1
/

select * from TooManyExtents
/
@NewTBS_Ext.sql


*/

column OWNER	 		format a12				heading Owner
column segment_NAME		format a30				heading 'Segment|Name'
column partition_name		format a30				heading 'Partition|Name'
column segment_type		format a20				heading 'Segment|Type'
column extents			format 999,999				heading 'Qtty of|Extents'
-- column bytes  format 999999999999999
spool MoveSegs2.sql
Set feedback on lines 170 pages 500


Select OWNER, segment_NAME, nvl(partition_name,'NOT PARTITIONED') partition_name, segment_type, tablespace_name, sum(bytes) bytes, Count(*) extents
--select sum(bytes) bytes, 'Alter '||segment_type||' '||OWNER||'.'||segment_NAME||'    Tablespace '||tablespace_name||';'
                From dba_extents
                        Where OWNER in ('BUSINESS'
                                , 'MANTAS'
                                , 'KDD'
                                , 'KDD_WEB'
                                , 'KDD_ALG'
                                , 'KDD_MNR'
                                , 'MARKET'
                                , 'INGEST_USER'
                                , 'DB_UTIL_USER'
                                , 'INFO_REP_P'
                                , 'INFO_REP_S')
			and segment_name in (select SEGMENT_NAME
						from dba_extents
						                        Where OWNER in ('BUSINESS'
							                                , 'MANTAS'
							                                , 'KDD'
							                                , 'KDD_WEB'
							                                , 'KDD_ALG'
							                                , 'KDD_MNR'
							                                , 'MARKET'
							                                , 'INGEST_USER'
							                                , 'DB_UTIL_USER'
							                                , 'INFO_REP_P'
							                                , 'INFO_REP_S')
						group by SEGMENT_NAME, PARTITION_NAME
						having count(*) > 1)
        group by  OWNER, segment_NAME, nvl(partition_name,'NOT PARTITIONED'), segment_type, tablespace_name
--	having sum(bytes) > 262144
	having count(*) >2
Union
Select OWNER, segment_NAME, nvl(partition_name,'NOT PARTITIONED') partition_name, segment_type, tablespace_name, sum(bytes) bytes, Count(*) extents
                From dba_extents
                        Where OWNER in ('BUSINESS'
                                , 'MANTAS'
                                , 'KDD'
                                , 'KDD_WEB'
                                , 'KDD_ALG'
                                , 'KDD_MNR'
                                , 'MARKET'
                                , 'INGEST_USER'
                                , 'DB_UTIL_USER'
                                , 'INFO_REP_P'
                                , 'INFO_REP_S')
				  and tablespace_name = 'MANTAS_INTERIM'
        group by  OWNER, segment_NAME, nvl(partition_name,'NOT PARTITIONED'), segment_type, tablespace_name
        order by 7
/

spool off
Prompt 
Prompt   Ed TooManyExtents		@TooManyExtents
Prompt 
