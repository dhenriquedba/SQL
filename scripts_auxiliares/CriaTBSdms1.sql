CREATE TABLESPACE SYSTEM                                                                  
 datafile '/ora50/cpfltest/system01.dbf' size 73400320 reuse                              
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE DATA_01                                                                 
 datafile '/ora10/cpfltest/cpfltest_data_01a.dbf' size 10741719040 reuse                  
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE DATA_02                                                                 
 datafile '/ora30/cpfltest/cpfltest_data_02a.dbf' size 5372887040 reuse                   
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE DATA_03                                                                 
 datafile '/ora30/cpfltest/cpfltest_data_03a.dbf' size 3222306816 reuse                   
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE DATA_04                                                                 
 datafile '/ora40/cpfltest/cpfltest_data_04a.dbf' size 1679360000 reuse                   
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE DATA_05                                                                 
 datafile '/ora50/cpfltest/cpfltest_data_05a.dbf' size 1658363904 reuse                   
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE DATA_06                                                                 
 datafile '/ora40/cpfltest/cpfltest_data_06a.dbf' size 1249026048 reuse                   
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE DATA_07                                                                 
 datafile '/ora40/cpfltest/cpfltest_data_07a.dbf' size 1332985856 reuse                   
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE DATA_08                                                                 
 datafile '/ora50/cpfltest/cpfltest_data_08a.dbf' size 1196539904 reuse                   
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE DATA_09                                                                 
 datafile '/ora50/cpfltest/cpfltest_data_09a.dbf' size 1102077952 reuse                   
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE DATA_10                                                                 
 datafile '/ora50/cpfltest/cpfltest_data_10a.dbf' size 1018134528 reuse                   
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE DATA_11                                                                 
 datafile '/ora20/cpfltest/cpfltest_data_11a.dbf' size 640688128 reuse                    
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE INDEX_01                                                                
 datafile '/ora20/cpfltest/cpfltes_index_01a.dbf' size 1048576 reuse                      
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE INDEX_02                                                                
 datafile '/ora30/cpfltest/cpfltest_index_02a.dbf' size 1048576 reuse                     
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE INDEX_03                                                                
 datafile '/ora40/cpfltest/cpfltest_index_03a.dbf' size 1048576 reuse                     
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE INDEX_04                                                                
 datafile '/ora30/cpfltest/cpfltest_index_04a.dbf' size 1146880 reuse                     
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE INDEX_05                                                                
 datafile '/ora40/cpfltest/cpfltest_index_05a.dbf' size 6144000 reuse                     
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE INDEX_06                                                                
 datafile '/ora50/cpfltest/cpfltest_index_06a.dbf' size 851968 reuse                      
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE INDEX_07                                                                
 datafile '/ora50/cpfltest/cpfltest_index_07a.dbf' size 909312 reuse                      
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE INDEX_08                                                                
 datafile '/ora50/cpfltest/cpfltest_index_08a.dbf' size 21790720 reuse                    
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE INDEX_09                                                                
 datafile '/ora50/cpfltest/cpfltest_index_09a.dbf' size 53182464 reuse                    
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE INDEX_10                                                                
 datafile '/ora50/cpfltest/cpfltest_index_10a.dbf' size 157999104 reuse                   
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE INDEX_11                                                                
 datafile '/ora50/cpfltest/cpfltest_index_11a.dbf' size 32194560 reuse                    
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE RBS                                                                     
 datafile '/ora30/cpfltest/cpfltest_rbs_01.dbf' size 104857600 reuse                      
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE PSEUDO_TEMP                                                             
 datafile '/ora40/cpfltest/cpfltest_temp.dbf' size 52535296 reuse                         
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE DATA_12                                                                 
 datafile '/ora40/cpfltest/cpfltest_data_12a.dbf' size 104857600 reuse                    
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE DATA_13                                                                 
 datafile '/ora40/cpfltest/cpfltest_data_13a.dbf' size 104857600 reuse                    
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE DATA_01                                                                 
 datafile '/ora10/cpfltest/cpfltest_data_01b.dbf' size 1048576000 reuse                   
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE DATA_02                                                                 
 datafile '/ora30/cpfltest/cpfltest_data_02b.dbf' size 1048576000 reuse                   
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          


