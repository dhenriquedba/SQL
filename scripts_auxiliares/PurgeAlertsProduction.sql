select user||'  @  '||global_name "SE_LIGA_!!!" from global_name;
prompt 
pause OK_?
prompt 
pause CERTEZA_?

prompt
prompt Will_Disable_Constraints_before_Truncate
prompt
pause OK_?

set echo off feedback off pages 0 linesize 150

spool DisableMantasConstraints_1.sql
Select 'Alter table '||owner||'.'||table_name||' disable constraint '||constraint_name||';'
from dba_constraints
where constraint_type in ('R')
and owner in ('MANTAS', 'BUSINESS')
and status='ENABLED'
/
Select 'Alter table '||owner||'.'||table_name||' disable constraint '||constraint_name||';'
from dba_constraints
where constraint_type in ('P')
and table_name  in ('ACCT_ADDR_ARC'
,'ACCT_ARC'
,'ACCT_BAL_POSN_SMRY_ARC'
,'ACCT_CLTRL_ARC'
,'ACCT_GRP_ARC'
,'ACCT_ID_INSTN_ID_MAP_ARC'
,'ACCT_NVSMT_OBJ_ARC'
,'ACCT_POSN_ARC'
,'ACCT_RSTRN_ARC'
,'ACCT_SMRY_MNTH_ARC'
,'BACK_OFFICE_TRXN_ARC'
,'CASH_TRXN_ARC'
,'CHG_LOG_SMRY_ARC'
,'CLIENT_BANK_ARC'
,'CLIENT_BANK_SMRY_MNTH_ARC'
,'CORP_ACTN_ARC'
,'CUST_ARC'
,'CUST_BAL_POSN_SMRY_ARC'
,'CUST_SMRY_MNTH_ARC'
,'DEAL_ARC'
,'DERIVED_ADDRESS_ARC'
,'DOW_JONES_NEWS_ARC'
,'EMP_ACCT_ARC'
,'EMP_ARC'
,'EXECUTION_ARC'
,'EXTERNAL_ENTITY_ARC'
,'FIRM_ACCT_POSN_ARC'
,'HH_BAL_POSN_SMRY_ARC'
,'HH_SMRY_MNTH_ARC'
,'INSTL_ACCT_SMRY_MNTH_ARC'
,'INSTN_MASTER_ARC'
,'INSTRUCTION_ARC'
,'LETTER_OF_INTENT_ARC'
,'MANGD_ACCT_ARC'
,'MANGD_ACCT_SMRY_MNTH_ARC'
,'MARKET_CENTER_ARC'
,'MFUND_BRKPT_ARC'
,'MFUND_SELCT_LIST_ARC'
,'MI_TRXN_ARC'
,'MKT_IDX_ARC'
,'NTCPTRY_PRFL_ARC'
,'NVSMT_MGR_ARC'
,'NVSMT_MGR_SMRY_MNTH_ARC'
,'ORDR_ARC'
,'ORG_ARC'
,'RGSTD_REP_SMRY_MNTH_ARC'
,'SCRTY_ARC'
,'SCRTY_FIRM_DAILY_ARC'
,'SCRTY_NVSMT_RTNG_ARC'
,'SCRTY_RSTRN_LIST_ARC'
,'SCRTY_SELCT_LIST_ARC'
,'TRADE_ARC'
,'TRD_SOLCN_ARC'
,'WIRE_TRXN_ARC'
,'WIRE_TRXN_INSTN_LEG_ARC'
,'KDD_BREAK_MTCHS'
,'KDD_BREAK_BINDING'
,'KDD_BREAK'
,'KDD_ACTIVITY_CMMNT'
,'KDD_FORM_HIST'
,'KDD_NOTE_HIST'
,'KDD_ACTIVITY'
,'KDD_AUTO_SUPPR_ALERT'
,'KDD_REP_TRACK_ALERT'
,'KDD_REVIEW_FINANCIAL'
,'KDD_REVIEW_SCNRO'
,'KDD_REVIEW')
and status='ENABLED'
/
spool off

spool DisableMantasConstraints_1.log
@ DisableMantasConstraints_1.sql
spool off
prompt
pause OK_?

set echo on
spool __PurgeAlerts.log

truncate table business.ACCT_ADDR_ARC;                                                   
truncate table business.ACCT_ARC;                                                        
truncate table business.ACCT_BAL_POSN_SMRY_ARC;                                          
truncate table business.ACCT_CLTRL_ARC;                                                  
truncate table business.ACCT_GRP_ARC;                                                    
truncate table business.ACCT_ID_INSTN_ID_MAP_ARC;                                        
truncate table business.ACCT_NVSMT_OBJ_ARC;                                              
truncate table business.ACCT_POSN_ARC;                                                   
truncate table business.ACCT_RSTRN_ARC;                                                  
truncate table business.ACCT_SMRY_MNTH_ARC;                                              
truncate table business.BACK_OFFICE_TRXN_ARC;                                            
truncate table business.CASH_TRXN_ARC;                                                   
truncate table business.CHG_LOG_SMRY_ARC;                                                
truncate table business.CLIENT_BANK_ARC;                                                 
truncate table business.CLIENT_BANK_SMRY_MNTH_ARC;                                       
truncate table business.CORP_ACTN_ARC;                                                   
truncate table business.CUST_ARC;                                                        
truncate table business.CUST_BAL_POSN_SMRY_ARC;                                          
truncate table business.CUST_SMRY_MNTH_ARC;                                              
truncate table business.DEAL_ARC;                                                        
truncate table business.DERIVED_ADDRESS_ARC;                                             
truncate table business.DOW_JONES_NEWS_ARC;                                              
truncate table business.EMP_ACCT_ARC;                                                    
truncate table business.EMP_ARC;                                                         
truncate table business.EXECUTION_ARC;                                                   
truncate table business.EXTERNAL_ENTITY_ARC;                                             
truncate table business.FIRM_ACCT_POSN_ARC;                                              
truncate table business.HH_BAL_POSN_SMRY_ARC;                                            
truncate table business.HH_SMRY_MNTH_ARC;                                                
truncate table business.INSTL_ACCT_SMRY_MNTH_ARC;                                        
truncate table business.INSTN_MASTER_ARC;                                                
truncate table business.INSTRUCTION_ARC;                                                 
truncate table business.LETTER_OF_INTENT_ARC;                                            
truncate table business.MANGD_ACCT_ARC;                                                  
truncate table business.MANGD_ACCT_SMRY_MNTH_ARC;                                        
truncate table business.MARKET_CENTER_ARC;                                               
truncate table business.MFUND_BRKPT_ARC;                                                 
truncate table business.MFUND_SELCT_LIST_ARC;                                            
truncate table business.MI_TRXN_ARC;                                                     
truncate table business.MKT_IDX_ARC;                                                     
truncate table business.NTCPTRY_PRFL_ARC;                                                
truncate table business.NVSMT_MGR_ARC;                                                   
truncate table business.NVSMT_MGR_SMRY_MNTH_ARC;                                         
truncate table business.ORDR_ARC;                                                        
truncate table business.ORG_ARC;                                                         
truncate table business.RGSTD_REP_SMRY_MNTH_ARC;                                         
truncate table business.SCRTY_ARC;                                                       
truncate table business.SCRTY_FIRM_DAILY_ARC;                                            
truncate table business.SCRTY_NVSMT_RTNG_ARC;                                            
truncate table business.SCRTY_RSTRN_LIST_ARC;                                            
truncate table business.SCRTY_SELCT_LIST_ARC;                                            
truncate table business.TRADE_ARC;                                                       
truncate table business.TRD_SOLCN_ARC;                                                   
truncate table business.WIRE_TRXN_ARC;                                                   
truncate table business.WIRE_TRXN_INSTN_LEG_ARC;               

--before post processing
truncate table MANTAS.kdd_break_mtchs;
truncate table MANTAS.kdd_break_binding;
truncate table MANTAS.kdd_break;

--after post processing
truncate table MANTAS.KDD_ACTIVITY_CMMNT;
truncate table MANTAS.KDD_FORM_HIST;
truncate table MANTAS.KDD_NOTE_HIST;
truncate table MANTAS.KDD_ACTIVITY;
truncate table MANTAS.KDD_AUTO_SUPPR_ALERT;
truncate table MANTAS.KDD_REP_TRACK_ALERT;
truncate table MANTAS.KDD_REVIEW_FINANCIAL;
truncate table MANTAS.KDD_REVIEW_SCNRO;
truncate table MANTAS.KDD_REVIEW;
spool off
prompt
prompt Will_Enable_Constraints
prompt
pause OK_?

set echo off feedback off pages 0 linesize 150

spool EnableMantasConstraints_1.sql
Select 'Alter table '||owner||'.'||table_name||' Enable constraint '||constraint_name||';'
from dba_constraints
where status='DISABLED'
/
spool off

spool EnableMantasConstraints_1.log
@ EnableMantasConstraints_1.sql
spool off
prompt
