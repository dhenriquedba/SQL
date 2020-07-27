/*
10:32:46 prd51[ALLOWED=LC000780]>desc v$sqltext
 Name                                                                                                                           
 ---------------------------------------------------------------------------------------------------
 ADDRESS                                                                                                                        
 HASH_VALUE                                                                                                                     
 COMMAND_TYPE                                                                                                                   
 PIECE                                                                                                                          
 SQL_TEXT                                                                                                                       

10:32:53 prd51[ALLOWED=LC000780]>desc v$sql
 Name                                                                                                                           
 ---------------------------------------------------------------------------------------------------
 SQL_TEXT                                                                                                                       
 SHARABLE_MEM                                                                                                                   
 PERSISTENT_MEM                                                                                                                 
 RUNTIME_MEM                                                                                                                    
 SORTS                                                                                                                          
 LOADED_VERSIONS                                                                                                                
 OPEN_VERSIONS                                                                                                                  
 USERS_OPENING                                                                                                                  
 FETCHES                                                                                                                        
 EXECUTIONS                                                                                                                     
 USERS_EXECUTING                                                                                                                
 LOADS                                                                                                                          
 FIRST_LOAD_TIME                                                                                                                
 INVALIDATIONS                                                                                                                  
 PARSE_CALLS                                                                                                                    
 DISK_READS                                                                                                                     
 BUFFER_GETS                                                                                                                    
 ROWS_PROCESSED                                                                                                                 
 COMMAND_TYPE                                                                                                                   
 OPTIMIZER_MODE                                                                                                                 
 OPTIMIZER_COST                                                                                                                 
 PARSING_USER_ID                                                                                                                
 PARSING_SCHEMA_ID                                                                                                              
 KEPT_VERSIONS                                                                                                                  
 ADDRESS                                                                                                                        
 TYPE_CHK_HEAP                                                                                                                  
 HASH_VALUE                                                                                                                     
 PLAN_HASH_VALUE                                                                                                                
 CHILD_NUMBER                                                                                                                   
 MODULE                                                                                                                         
 MODULE_HASH                                                                                                                    
 ACTION                                                                                                                         
 ACTION_HASH                                                                                                                    
 SERIALIZABLE_ABORTS                                                                                                            
 OUTLINE_CATEGORY                                                                                                               
 CPU_TIME                                                                                                                       
 ELAPSED_TIME                                                                                                                   
 OUTLINE_SID                                                                                                                    
 CHILD_ADDRESS                                                                                                                  
 SQLTYPE                                                                                                                        
 REMOTE                                                                                                                         
 OBJECT_STATUS                                                                                                                  
 LITERAL_HASH_VALUE                                                                                                             
 LAST_LOAD_TIME                                                                                                                 
 IS_OBSOLETE                                                                                                                    
 CHILD_LATCH                                                                                                                    

10:33:03 prd51[ALLOWED=LC000780]>
*/
set pagesize 1000
break on HASH_VALUE
column executions format 999,999,999
Select t.HASH_VALUE, s.EXECUTIONS, t.SQL_TEXT
	From v$sqltext t, v$sql s
		Where t.HASH_VALUE =  s.HASH_VALUE
		  and s.EXECUTIONS >=1000000
order by s.EXECUTIONS, t.HASH_VALUE, t.PIECE
/
