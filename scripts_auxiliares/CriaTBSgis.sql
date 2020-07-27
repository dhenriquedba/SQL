CREATE TABLESPACE SYSTEM                                                                  
 datafile '/oradata/gis/system/system01.dbf' size 272629760 reuse                         
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE TOOLS                                                                   
 datafile '/oradata/gis/system/tools01.dbf' size 157286400 reuse                          
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE PSEUDO_TEMP                                                             
 datafile '/oradata/gis/rbs/pseudo_temp01.dbf' size 314376192 reuse                       
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE PSEUDO_TEMP                                                             
 datafile '/oradata/gis/historico/pseudo_temp02.dbf' size 1080033280 reuse                
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE USERS                                                                   
 datafile '/oradata/gis/system/users01.dbf' size 24576 reuse                              
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE RBS                                                                     
 datafile '/oradata/gis/rbs/rbs.dbf' size 487587840 reuse                                 
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE ENOM_INDEX                                                              
 datafile '/oradata/gis/indx/ENOM_INDEX01.dbf' size 1310720000 reuse                      
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE ENOM_CUSTOMER                                                           
 datafile '/oradata/gis/customer/ENOM_CUSTOMER01.dbf' size 2621440000 reuse               
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE ENOM_ESPORADICO                                                         
 datafile '/oradata/gis/esporadico/ENOM_ESPORADICO01.dbf' size 2097152000 reuse           
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE ENOM_HISTOR                                                             
 datafile '/oradata/gis/historico/ENOM_HISTOR01.dbf' size 629145600 reuse                 
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE ENOM_STAGGING                                                           
 datafile '/oradata/gis/stagging/ENOM_STAGGING01.dbf' size 734003200 reuse                
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE FIM_DATA                                                                
 datafile '/oradata/gis/data/FIM_DATA01.dbf' size 262144000 reuse                         
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE FIM_INDEX                                                               
 datafile '/oradata/gis/indx/FIM_INDEX01.dbf' size 10485760 reuse                         
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE FIM_LOB_SEGMENT                                                         
 datafile '/oradata/gis/data/FIM_LOB_SEGMENT01.dbf' size 10485760 reuse                   
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE WIM_DATA                                                                
 datafile '/oradata/gis/data/WIM_DATA01.dbf' size 109051904 reuse                         
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
CREATE TABLESPACE WIM_INDEX                                                               
 datafile '/oradata/gis/indx/WIM_INDEX01.dbf' size 113246208 reuse                        
 AUTOEXTEND ON NEXT 5120K MINIMUM EXTENT 512K                                             
 DEFAULT STORAGE ( INITIAL 512K NEXT 512K MINEXTENTS 20 MAXEXTENTS 4096);                 
                                                                                          
