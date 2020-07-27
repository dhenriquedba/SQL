select 'alter table '||owner||'.'||tablename||' MoVe tablespace '||DaTatbs||';'
  from physicalstructure
	Where SEGMENTTYPE = 'TABLE'
          and tablename in (select segment_name
                              from dba_segments
                                where tablespace_name in ('MANTAS_DT', 'MANTAS_IN','PMART_DATA_128K', 'PMART_INDEX_128K'))
union
Select 'alter index '||owner||'.'||indexname||' rebuild tablespace '||Indextbs||';'
  from physicalstructure
		where SEGMENTTYPE = 'INDEX'
          and tablename in (select segment_name
                              from dba_segments
                                where tablespace_name in ('MANTAS_DT', 'MANTAS_IN','PMART_DATA_128K', 'PMART_INDEX_128K'))
union
select 'alter table '||owner||'.'||tablename||' MoVe partition '||partitionname||' tablespace '||DaTatbs||';'
  from physicalstructure
	where SEGMENTTYPE = 'TABLE PARTITION'
          and tablename in (select segment_name
                              from dba_segments
                                where tablespace_name in ('MANTAS_DT', 'MANTAS_IN','PMART_DATA_128K', 'PMART_INDEX_128K'))
union
select 'alter index '||owner||'.'||indexname||' rebuild partition '||partitionname||' tablespace '||Indextbs||';'
  from physicalstructure
	where SEGMENTTYPE = 'INDEX PARTITION'
          and tablename in (select segment_name
                              from dba_segments
                                where tablespace_name in ('MANTAS_DT', 'MANTAS_IN','PMART_DATA_128K', 'PMART_INDEX_128K'))
/


OWNER                  
TABLENAME              
PARTITIONNAME          
SEGMENTTYPE            
INDEXNAME              
NUMROWS                
TOTALBYTES             
BYTESPERROW            
PERCENTFREE            
DEGREE                 
LOGGING                
INITRANS               
INICIALBYTES           
INITIALEXTENT          
QTTYEXTENTS            
DATATBS                
INDEXTBS               
LASTUPD                
FILESYSTEM             
update physicalstructure set owner ='&1'
			indexname  ='&2'
			sementtype ='&3'
			totalbytes = &5
			lastupd = trunc(sysdate)
	where set owner ='&1'
			indexname  ='&2'
			sementtype ='&3'
