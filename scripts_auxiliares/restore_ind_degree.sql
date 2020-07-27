amlp[SYS=>ALLOWED]>/

'ALTERINDEX'||OWNER||'.'||INDEX_NAME||'PARALLEL(DEGREE'||DEGREE||');'                                                                                                                                   
-------------------------------------------------------------------------------------------------------------------------------------                                                                   
alter index BUSINESS.ACCT_AD_SEQID_IDX parallel (degree 4);                                                                                                                                             
alter index BUSINESS.ACCT_AD_ACCTID_IDX parallel (degree 4);                                                                                                                                            
alter index BUSINESS.PK_CUST parallel (degree 4);                                                                                                                                                       
alter index BUSINESS.CUST_SEQID_IDX parallel (degree 4);                                                                                                                                                
alter index BUSINESS.CUST_ORG_NM_IDX parallel (degree 4);                                                                                                                                               
alter index BUSINESS.CUST_FIRST_NM_IDX parallel (degree 4);                                                                                                                                             
alter index BUSINESS.CUST_JRDCN_CD parallel (degree 4);                                                                                                                                                 
alter index BUSINESS.PK_CUST_ACCT parallel (degree 4);                                                                                                                                                  
alter index BUSINESS.CUST_ACCT_SEQID_IDX parallel (degree 4);                                                                                                                                           
alter index BUSINESS.CUST_ACCT_INTRL_ID_IDX parallel (degree 4);                                                                                                                                        
alter index BUSINESS.PK_FO_TRXN_PARTY parallel (degree 4);                                                                                                                                              
alter index BUSINESS.FOTPS_PARTYID_IDX parallel (degree 4);                                                                                                                                             
alter index BUSINESS.PK_FO_TRXN_STAGE parallel (degree 4);                                                                                                                                              
alter index BUSINESS.WIRE_B_ACCT_MANTAS_TEST parallel (degree 7);                                                                                                                                       

14 rows selected.

amlp[SYS=>ALLOWED]>spool off
