create table blog.tlogcopy
	as select * from (BLOG.TLOG)
/

drop table BLOG.TLOG
/

CREATE TABLE BLOG.TLOG
           (LDATE NUMBER(18), 
            VC1000PARAMS VARCHAR2(1000), 
            VC50USER VARCHAR2(50), 
            TSTACKTRACE VARCHAR2(4000), 
            IAPPLICATIONID NUMBER(38), 
            ILOGEVENTID NUMBER(38), 
            ILOGID NUMBER(38), 
            VC1000COMMENT VARCHAR2(1000), 
            VC50TRANSACTIONID VARCHAR2(50), 
            LINSERTSERVERDATE NUMBER(18) )
PARTITION BY RANGE (partition p01  VALUES LESS THAN  (1249499158666),
			partition p02  VALUES LESS THAN  (1250103958666),
			partition p03  VALUES LESS THAN  (1250708758666),
			partition p04  VALUES LESS THAN  (1251313558666),
			partition p05  VALUES LESS THAN  (1251918358666),
			partition p06  VALUES LESS THAN  (1252523158666),
			partition p07  VALUES LESS THAN  (1253127958666),
			partition p08  VALUES LESS THAN  (1253732758666),
			partition p09  VALUES LESS THAN  (1254337558666),
			partition p10  VALUES LESS THAN  (1254942358666),
			partition p11  VALUES LESS THAN  (1255547158666),
			partition p12  VALUES LESS THAN  (1256151958666),
			partition p13  VALUES LESS THAN  (1256756758666),
			partition p14  VALUES LESS THAN  (1257361558666),
			partition p15  VALUES LESS THAN  (1257966358666))
TABLESPACE TSD_BLOG_001
	STORAGE ( INITIAL  50m 
        	  NEXT  50m 
                  PCTINCREASE 0)
/
alter table BLOG.TLOG add constraint TLOG_PK_iLogID primary key (iLogID)
	using index tablespace TSI_BLOG_001
/
Create index BLOG.XIF1tLog
on BLOG.TLOG (iLogEventID)   tablespace TSI_BLOG_001
/
Create index BLOG.XIF3tLog
on BLOG.TLOG (iApplicationID)   tablespace TSI_BLOG_001
/
Create index BLOG.XIF4tLog
on BLOG.TLOG (iLogID)   tablespace TSI_BLOG_001
/
Create index BLOG.XtLogSearch
on BLOG.TLOG (lDate, iApplicationID, iLogEventID)   tablespace TSI_BLOG_001
/
Create index BLOG.XtLogSearch2
on BLOG.TLOG (lDate, iApplicationID, iLogEventID, vc50TransactionID, vc50User)   tablespace TSI_BLOG_001
/

insert into blog.tlog
	 select * from BLOG.TLOGcopy
/

drop table BLOG.TLOGcopy
/

 

16:44:03 @hom70[ALLOWED=SYSTEM]>select sum(bytes)/1024/1024 Mbytes
16:45:40   2  from dba_extents
16:45:45   3  where segment_name = 'TLOG';

    MBYTES
----------
      3904

1 row selected.

16:45:58 @hom70[ALLOWED=SYSTEM]>desc BLOG.TLOG
 Name                                                              Null?    Type
 ----------------------------------------------------------------- -------- --------------------
 LDATE                                                                      NUMBER(18)
 VC1000PARAMS                                                               VARCHAR2(1000)
 VC50USER                                                                   VARCHAR2(50)
 TSTACKTRACE                                                                VARCHAR2(4000)
 IAPPLICATIONID                                                             NUMBER(38)
 ILOGEVENTID                                                                NUMBER(38)
 ILOGID                                                            NOT NULL NUMBER(38)
 VC1000COMMENT                                                              VARCHAR2(1000)
 VC50TRANSACTIONID                                                          VARCHAR2(50)
 LINSERTSERVERDATE                                                          NUMBER(18)

17:19:12 @hom70[ALLOWED=SYSTEM]>select count(*) from BLOG.TLOG;

  COUNT(*)
----------
  27366407

1 row selected.

17:23:30 @hom70[ALLOWED=SYSTEM]>
