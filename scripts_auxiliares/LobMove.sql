amlp[RESTRICTED=TTCN212]>select 'alter table '||l.OWNER||'.'||l.TABLE_NAME||CHR(10)||
  2                  ' move lob ('||l.COLUMN_NAME||')'||CHR(10)||
  3                          'store as '||l.SEGMENT_NAME||' (tablespace amldat11 parallel 4 NOLOGGING);'
  4          from dba_lobs l, dba_extents e
  5                  where l.segment_name = e.segment_name
  6                    and (e.tablespace_name like 'MANTAS%' or e.tablespace_name like 'PMAR%');
alter table MANTAS.KDD_BREAK                                                                                                                                                                            
 move lob (TSHLD_TX)                                                                                                                                                                                    
store as SYS_LOB0000041488C00014$$ (tablespace amldat11 parallel 4 NOLOGGING);                                                                                                                          
                                                                                                                                                                                                        
alter table MANTAS.KDD_DATASET                                                                                                                                                                          
 move lob (SQL_TX)                                                                                                                                                                                      
store as SYS_LOB0000041491C00010$$ (tablespace amldat11 parallel 4 NOLOGGING);                                                                                                                          
                                                                                                                                                                                                        
alter table MANTAS.KDD_DATASET                                                                                                                                                                          
 move lob (SQL_TX)                                                                                                                                                                                      
store as SYS_LOB0000041491C00010$$ (tablespace amldat11 parallel 4 NOLOGGING);                                                                                                                          
                                                                                                                                                                                                        
alter table MANTAS.KDD_DATASET                                                                                                                                                                          
 move lob (SQL_TX)                                                                                                                                                                                      
store as SYS_LOB0000041491C00010$$ (tablespace amldat11 parallel 4 NOLOGGING);                                                                                                                          
                                                                                                                                                                                                        
alter table MANTAS.KDD_DATASET                                                                                                                                                                          
 move lob (SQL_TX)                                                                                                                                                                                      
store as SYS_LOB0000041491C00010$$ (tablespace amldat11 parallel 4 NOLOGGING);                                                                                                                          
                                                                                                                                                                                                        
alter table MANTAS.KDD_DATASET                                                                                                                                                                          
 move lob (SQL_TX)                                                                                                                                                                                      
store as SYS_LOB0000041491C00010$$ (tablespace amldat11 parallel 4 NOLOGGING);                                                                                                                          
                                                                                                                                                                                                        
alter table MANTAS.KDD_DATASET                                                                                                                                                                          
 move lob (SQL_TX)                                                                                                                                                                                      
store as SYS_LOB0000041491C00010$$ (tablespace amldat11 parallel 4 NOLOGGING);                                                                                                                          
                                                                                                                                                                                                        
alter table MANTAS.KDD_FORM_HIST                                                                                                                                                                        
 move lob (FORM_TX)                                                                                                                                                                                     
store as SYS_LOB0000041494C00002$$ (tablespace amldat11 parallel 4 NOLOGGING);                                                                                                                          
                                                                                                                                                                                                        
alter table MANTAS.KDD_TRANSFORM_CMMNT                                                                                                                                                                  
 move lob (TRANSFORM_CMMNT)                                                                                                                                                                             
store as SYS_LOB0000041497C00003$$ (tablespace amldat11 parallel 4 NOLOGGING);                                                                                                                          
                                                                                                                                                                                                        
alter table MANTAS.KDD_SEQ_PTTRN                                                                                                                                                                        
 move lob (PTTRN_TX)                                                                                                                                                                                    
store as SYS_LOB0000041500C00003$$ (tablespace amldat11 parallel 4 NOLOGGING);                                                                                                                          
                                                                                                                                                                                                        
alter table MANTAS.KDD_SEQ_PTTRN                                                                                                                                                                        
 move lob (PTTRN_TX)                                                                                                                                                                                    
store as SYS_LOB0000041500C00003$$ (tablespace amldat11 parallel 4 NOLOGGING);                                                                                                                          
                                                                                                                                                                                                        
alter table MANTAS.KDD_SEQ_PTTRN                                                                                                                                                                        
 move lob (PTTRN_TX)                                                                                                                                                                                    
store as SYS_LOB0000041500C00003$$ (tablespace amldat11 parallel 4 NOLOGGING);                                                                                                                          
                                                                                                                                                                                                        
alter table MANTAS.KDD_TRANSFORM                                                                                                                                                                        
 move lob (TRANSFORM_TX)                                                                                                                                                                                
store as SYS_LOB0000041503C00004$$ (tablespace amldat11 parallel 4 NOLOGGING);                                                                                                                          
                                                                                                                                                                                                        
amlp[RESTRICTED=TTCN212]>spool off
