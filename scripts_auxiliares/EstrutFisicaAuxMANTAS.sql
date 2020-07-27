drop  Table FisicalStructure  
/
Create Table PhysicalStructure  
       (Owner			varchar2(30),	-- pk
	TableName		Varchar2(30),	-- pk
	PartitionName		Varchar2(30),	-- pk
	SegmentType		varchar2(30),	-- pk
	IndexName		varchar2(30),
	NumRows			number(13),
	TotalBytes		number(14), --- sum off all extents
	BytesPerRow		number(7),
	PercentFree		number(2),
	Degree			number(3),
	Logging			varchar2(3),
	IniTrans		number(3),
	InicialBytes		number(14),
	InitialExtent		number(14),					 -- em Bytes
	QttyExtents		number(6),
	DataTBS			varchar2(30),				 -- tablespace para o Data Segment
	IndexTBS		varchar2(30),				 -- tablespace para o Interim Segment
	LastUpd			date,					 -- Last Review date
	constraint PhysicalStructure_pk primary key (Owner,TableName,PartitionName,SegmentType)
	)
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

alter table PhysicalStructure  enable primary key exceptions into exceptions
/
select sum(TOTALBYTES) bytes from PhysicalStructure 
/

select  * from PhysicalStructure 
where rowid in (select  ROW_ID  from  exceptions)
/

select OWNER, TABLENAME, PARTITIONNAME, SEGMENTTYPE from PhysicalStructure 
/

Select t.OWNER, nvl(t.TABLESPACE_NAME,p.TABLESPACE_NAME) TABLESPACE_NAME, t.TABLE_NAME,
	 nvl(p.PARTITION_NAME,'NOT PART.') PART_NAME,
	 decode(t.PARTITIONED,'YES',p.PCT_FREE,t.PCT_FREE) FREE, 
	 decode(t.PARTITIONED,'YES',p.PCT_USED,t.PCT_USED) USED, 
	 decode(t.PARTITIONED,'YES',p.INITIAL_EXTENT, t.INITIAL_EXTENT) INITIAL_EXTENT,
	 decode(t.PARTITIONED,'YES',p.NEXT_EXTENT, t.NEXT_EXTENT) NEXT_EXTENT,
	 decode(t.PARTITIONED,'YES',p.PCT_INCREASE, t.PCT_INCREASE) INC, 
	 nvl(t.LOGGING, p.LOGGING) LOG,
	 decode(t.PARTITIONED,'YES',nvl(p.NUM_ROWS,0),nvl(t.NUM_ROWS,0)) NUM_ROWS, 
	 decode(t.PARTITIONED,'YES',p.EMPTY_BLOCKS, t.EMPTY_BLOCKS) EMPTY_BLOCKS,
	 decode(t.PARTITIONED,'YES',p.AVG_SPACE, t.AVG_SPACE) AVG_SPACE,
	 decode(t.PARTITIONED,'YES',p.CHAIN_CNT, t.CHAIN_CNT) CHAIN_CNT,
	 decode(t.PARTITIONED,'YES',p.AVG_ROW_LEN, t.AVG_ROW_LEN) AVG_ROW_LEN, 
	 decode(t.PARTITIONED,'YES',to_char(p.LAST_ANALYZED, 'ddmonyy:hh24'), to_char(t.LAST_ANALYZED, 'ddmonyy:hh24')) LAST_ANALYZED
From dba_tables t, dba_tab_partitions p
	Where t.TABLE_NAME		=	p.TABLE_NAME(+)
	  And t.OWNER in ('BUSINESS'
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
Order by 3,4, 1,2
-- Order by decode(t.PARTITIONED,'YES',p.AVG_ROW_LEN, t.AVG_ROW_LEN)
/



Declare
	cursor ctab is
		select OWNER, TABLE_NAME, TABLESPACE_NAME, PCT_FREE, PCT_USED, INITIAL_EXTENT,
			NEXT_EXTENT, LOGGING, NUM_ROWS, AVG_ROW_LEN, DEGREE                            
		From dba_tables
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
				, 'INFO_REP_S');
	cursor cind is
		select OWNER, INDEX_NAME, TABLESPACE_NAME, PCT_FREE, INITIAL_EXTENT,
			NEXT_EXTENT, LOGGING, NUM_ROWS, SAMPLE_SIZE, DEGREE
		From dba_indexes
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
				, 'INFO_REP_S');
	cursor cpart is
		select table_OWNER, TABLE_NAME, partition_name, TABLESPACE_NAME, PCT_FREE, PCT_USED, INITIAL_EXTENT,
			NEXT_EXTENT, LOGGING, NUM_ROWS, AVG_ROW_LEN
		From dba_tab_partitions
			Where table_OWNER in ('BUSINESS'
				, 'MANTAS'
				, 'KDD'
				, 'KDD_WEB'
				, 'KDD_ALG'
				, 'KDD_MNR'
				, 'MARKET'
				, 'INGEST_USER'
				, 'DB_UTIL_USER'
				, 'INFO_REP_P'
				, 'INFO_REP_S');
	cursor cpari is
		select INDEX_OWNER, INDEX_NAME, partition_name, TABLESPACE_NAME, PCT_FREE, INITIAL_EXTENT,
			NEXT_EXTENT, LOGGING, NUM_ROWS, SAMPLE_SIZE
		From dba_ind_partitions
			Where INDEX_OWNER in ('BUSINESS'
				, 'MANTAS'
				, 'KDD'
				, 'KDD_WEB'
				, 'KDD_ALG'
				, 'KDD_MNR'
				, 'MARKET'
				, 'INGEST_USER'
				, 'DB_UTIL_USER'
				, 'INFO_REP_P'
				, 'INFO_REP_S');
begin
	for i in ctab loop
		update PhysicalStructure
			set NUMROWS		=	i.NUM_ROWS,
			    BYTESPERROW		=	i.AVG_ROW_LEN,
			    PERCENTFREE		=	i.PCT_FREE,
			    PERCENTUSED		=	i.PCT_USED,
			    LOGGING		=	i.LOGGING,
			    INITIALEXTENT	=	i.INITIAL_EXTENT,
			    NEXTEXTENT		=	i.NEXT_EXTENT,
			    DATATBS		=	i.TABLESPACE_NAME,
			    DEGREE		=	i.DEGREE,
			    LastUpd		=	sysdate
			Where OWNER		=	i.OWNER
			  and TABLENAME		=	i.TABLE_NAME;
		if sql%notfound then
			dbms_output.put_line('Table Not Founded: '||i.OWNER||'.'||i.TABLE_NAME);
		end if;
	end loop;
	for i in cind loop
		update PhysicalStructure
			set NUMROWS		=	i.NUM_ROWS,
			    PERCENTFREE		=	i.PCT_FREE,
			    LOGGING		=	i.LOGGING,
			    INITIALEXTENT	=	i.INITIAL_EXTENT,
			    NEXTEXTENT		=	i.NEXT_EXTENT,
			    DATATBS		=	i.TABLESPACE_NAME,
			    DEGREE		=	i.DEGREE,
			    INDEXTBS		=	i.TABLESPACE_NAME,
			    LastUpd		=	sysdate
			Where OWNER		=	i.OWNER
			  and TABLENAME		=	i.INDEX_NAME;
		if sql%notfound then
			dbms_output.put_line('Index Not Founded: '||i.OWNER||'.'||i.INDEX_NAME);
		end if;
	end loop;
	for i in cpart loop
		update PhysicalStructure
			set NUMROWS		=	i.NUM_ROWS,
			    BYTESPERROW		=	i.AVG_ROW_LEN,
			    PERCENTFREE		=	i.PCT_FREE,
			    PERCENTUSED		=	i.PCT_USED,
			    LOGGING		=	i.LOGGING,
			    INITIALEXTENT	=	i.INITIAL_EXTENT,
			    NEXTEXTENT		=	i.NEXT_EXTENT,
			    DATATBS		=	i.TABLESPACE_NAME,
			    LastUpd		=	sysdate
			Where OWNER		=	i.TABLE_OWNER
			  and TABLENAME		=	i.TABLE_NAME
			  and partitionname 	=	i.partition_name;
		if sql%notfound then
			dbms_output.put_line('Table Partition Not Founded: '||i.TABLE_OWNER||'.'||i.TABLE_NAME);
		end if;
	end loop;
	for i in cpari loop
		update PhysicalStructure
			set NUMROWS		=	i.NUM_ROWS,
			    PERCENTFREE		=	i.PCT_FREE,
			    LOGGING		=	i.LOGGING,
			    INITIALEXTENT	=	i.INITIAL_EXTENT,
			    NEXTEXTENT		=	i.NEXT_EXTENT,
			    INDEXTBS		=	i.TABLESPACE_NAME,
			    LastUpd		=	sysdate
			Where OWNER		=	i.INDEX_OWNER
			  and TABLENAME		=	i.INDEX_NAME
			  and partitionname 	=	i.partition_name;
		if sql%notfound then
			dbms_output.put_line('Index Partition Not Founded: '||i.INDEX_OWNER||'.'||i.INDEX_NAME);
		end if;
	end loop;
	commit;
end;
/

Prompt
Prompt
Prompt    Ed EstrutFisicaAuxMANTAS.sql                  @ EstrutFisicaAuxMANTAS
Prompt
Prompt
